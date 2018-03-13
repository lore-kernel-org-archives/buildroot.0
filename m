From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Tue, 13 Mar 2018 15:58:23 +0000
Subject: [Buildroot] Why when I change BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
 and run make linux-reconfigure the kernel .config does not change? Ask
 Question
Message-ID: <CAFXrp_dhva_S7=5FqRqVefYDMNSjc-vPBR=bTTE9P16rJRWL1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://stackoverflow.com/questions/49260466

Buildroot 7d43534625ac06ae01987113e912ffaf1aec2302 post 2018.02,
Ubuntu 17.10 host.

I run:

    make qemu_x86_64_defconfig
    printf 'BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=\"kdb\"\n' >>.config
    make olddefconfig
    time make BR2_JLEVEL="$(nproc)"

where kdb is a Linux kernel configuration that has `CONFIG_KGDB=y`.

Then as expected:

    grep '^CONFIG_KGDB=y' ./output/build/linux-4.15/.config

has a match.

But then I want to try out a new kernel config, so I try:

    sed -i 's/BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=kdb/BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=nokdb/'

where `nokdb` is a kernel config that has `CONFIG_KGDB=n` and then:

    time make BR2_JLEVEL="$(nproc)" linux-reconfigure

However to my surprise, the kernel `.config` did not change,
`CONFIG_KGDB=y` is still there.

Only if I do:

    rm -f ./output/build/linux-4.15/.config
    time make BR2_JLEVEL="$(nproc)" linux-reconfigure

Is there a better way to force the kernel `.config` to be regenerated,
e.g. some other `linux-*` target?

I don't like this `rm` solution because it forces me to deal with
"internal" paths inside `output`.

I'd  expect `linux-reconfigure` to do that regeneration for me.
