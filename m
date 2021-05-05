From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 May 2021 20:51:49 +0000
Subject: [Buildroot] [Bug 13791] The QEMU compiled by Buildroot does not
 support alsa or pulseaudio drivers for soundcard forwarding
In-Reply-To: <bug-13791-163@https.bugs.busybox.net/>
References: <bug-13791-163@https.bugs.busybox.net/>
Message-ID: <bug-13791-163-D3tji9RcC6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13791

--- Comment #2 from WZab <wzab01@gmail.com> ---
I have extracted the configuration of the libpulse and alsa from the system
pkgconf:

$ pkgconf libpulse --libs 
-L/usr/lib/x86_64-linux-gnu -lpulse
$ pkgconf libpulse --cflags
-D_REENTRANT 
$ pkg-config alsa --libs
-L/usr/lib/x86_64-linux-gnu -lasound 
$ pkg-config alsa --cflags


Then I have injected them by hand to the "configure" script in the
output/build/host-qemu-5.2.0/ :


##########################################
# Sound support libraries probe

audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/,/ /g')
for drv in $audio_drv_list; do
    case $drv in
    alsa | try-alsa)
    if true; then
        alsa_libs="-L/usr/lib/x86_64-linux-gnu -lasound"
        alsa_cflags=""
        alsa=yes
        if test "$drv" = "try-alsa"; then
            audio_drv_list=$(echo "$audio_drv_list" | sed -e
's/try-alsa/alsa/')
        fi
    else
        if test "$drv" = "try-alsa"; then
            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-alsa//')
        else
            error_exit "$drv check failed" \
                "Make sure to have the $drv libs and headers installed."
        fi
    fi
    ;;

    pa | try-pa)
    if true; then
        libpulse=yes
        pulse_libs="-L/usr/lib/x86_64-linux-gnu -lpulse"
        pulse_cflags="-D_REENTRANT"
        if test "$drv" = "try-pa"; then
            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-pa/pa/')
        fi
    else
        if test "$drv" = "try-pa"; then
            audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-pa//')
        else
            error_exit "$drv check failed" \
                "Make sure to have the $drv libs and headers installed."
        fi
    fi
    ;;

After that, and with the following:

# Override CPP, as it expects to be able to call it like it'd
# call the compiler.
define HOST_QEMU_CONFIGURE_CMDS
        unset TARGET_DIR; \
        cd $(@D); $(HOST_CONFIGURE_OPTS) CPP="$(HOSTCC) -E" \
                ./configure \
                --target-list="$(HOST_QEMU_TARGETS)" \
                --prefix="$(HOST_DIR)" \
                --interp-prefix=$(STAGING_DIR) \
                --cc="$(HOSTCC)" \
                --host-cc="$(HOSTCC)" \
                --extra-cflags="$(HOST_QEMU_CFLAGS)" \
                --extra-ldflags="$(HOST_LDFLAGS)" \
                --audio-drv-list="alsa,pa,oss" \
                --meson=$(HOST_DIR)/bin/meson \
                --ninja=$(HOST_DIR)/bin/ninja \
                --disable-bzip2 \
                --disable-containers \
                --disable-curl \
                --disable-libssh \
                --disable-linux-io-uring \
                --disable-sdl \
                --disable-vhost-user-blk-server \
                --disable-virtiofsd \
                --disable-vnc-jpeg \
                --disable-vnc-png \
                --disable-vnc-sasl \
                --disable-tests \
                $(HOST_QEMU_OPTS)
endef

in the package/qemu/qemu.mk , I was able to compile QEMU with supported alsa
and pa drivers:

./qemu-system-aarch64 --audio-help
Environment variable based configuration deprecated.
Please use the new -audiodev option.

Equivalent -audiodev to your current environment variables:
(Since you didn't specify QEMU_AUDIO_DRV, I'll list all possibilities)
-audiodev id=alsa,driver=alsa
-audiodev id=pa,driver=pa
-audiodev id=oss,driver=oss
-audiodev id=none,driver=none

It is an awful workaround, but at least it works...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
