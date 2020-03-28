From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 28 Mar 2020 15:34:30 +0100
Subject: [Buildroot] Failed to load libmmal.so from rpi-userland package
 via buildroot toolchain on raspberry pi 4
In-Reply-To: <CAPn7sn0Pxy7TfxQ0VT9HUxGqSQiW2Nh0eo=SY2C+Rb=VEZRo2g@mail.gmail.com>
References: <CAPn7sn38WqJVgbLBkVj403GpkhcQx77HwdZ9zxEEvifO7qRbxg@mail.gmail.com>
 <20200328113133.022b01b6@gmx.net>
 <CAPn7sn0Pxy7TfxQ0VT9HUxGqSQiW2Nh0eo=SY2C+Rb=VEZRo2g@mail.gmail.com>
Message-ID: <20200328153430.436f5629@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Iman,

On Sat, 28 Mar 2020 17:14:59 +0430, iman ahmadvand <iman72411@gmail.com> wrote:

> Hi Peter.
>
> Exact same situation for me when changing to glibc or using external linaro
> toolchain(which comes with glibc).

What do you mean by 'exact same situation', the simple dlopen() test, or the
complete VLC test? Did you do a *complete* re-build and complete installation?
Can you show the output from 'ldd /usr/lib/libmmal.so'?

Regards,
Peter

> Don't know what's going on.
> Interesting thread: https://github.com/raspberrypi/userland/issues/178
>
> Regards.
> IMAN.
>
> On Sat, Mar 28, 2020 at 3:01 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Hello Iman,
> >
> > On Sat, 28 Mar 2020 11:39:46 +0430, iman ahmadvand <iman72411@gmail.com>
> > wrote:
> >
> > > Hi everyone.
> > > It seems that loading the MMAL interface shared libraries from
> > rpi-userland
> > > package via simple dlopen is not possible, or more specific, the packages
> > > or binaries such as VLC or VLC codec plugin (libavcodec_plugin) could not
> > > load the libavcodec from FFmpeg which in turn depends on libmmal*.so
> > >
> > > The steps to reproduce(with BR2_PACKAGE_RPI_USERLAND enabled,
> > > BR2_STRIP_strip disabled, BR2_OPTIMIZE_0 enabled):
> > > git clone git://git.busybox.net/buildroot buildroot && cd buildroot &&
> > git
> > > checkout 2019.11.01
> > > make raspberrypi4_defconfig && make all
> > >
> > > Then in this image try to run a simple c routine with dlopen(), if you do
> > > so, for example, ./dltest /usr/lib/libmmal.so you will end up with:
> > >
> > > symbol 'mmal_port_payload_alloc': can't resolve symbol
> > > symbol 'mmal_port_payload_free': can't resolve symbol
> > > symbol 'mmal_port_log_category': can't resolve symbol
> > >
> >
> > Can confirm your failure...did not (yet) find out what fails exactly, but
> > ldd produces the following ouput (mind the 0x00000000):
> >
> >         $ ldd /usr/lib/libmmal.so
> > checking sub-depends for '/usr/lib/libmmal_vc_client.so'
> > checking sub-depends for '/usr/lib/libmmal_components.so'
> > checking sub-depends for '/usr/lib/libvchiq_arm.so'
> > checking sub-depends for '/usr/lib/libvcsm.so'
> > checking sub-depends for '/usr/lib/libmmal_core.so'
> > checking sub-depends for '/usr/lib/libmmal_util.so'
> > checking sub-depends for '/usr/lib/libcontainers.so'
> > checking sub-depends for '/usr/lib/libvcos.so'
> > checking sub-depends for '/lib/libc.so.0'
> >         ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0xb6f8b000)
> >         libmmal_vc_client.so => /usr/lib/libmmal_vc_client.so (0x00000000)
> >         libmmal_components.so => /usr/lib/libmmal_components.so
> > (0x00000000)
> >         libvchiq_arm.so => /usr/lib/libvchiq_arm.so (0x00000000)
> >         libvcsm.so => /usr/lib/libvcsm.so (0x00000000)
> >         libmmal_core.so => /usr/lib/libmmal_core.so (0x00000000)
> >         libmmal_util.so => /usr/lib/libmmal_util.so (0x00000000)
> >         libcontainers.so => /usr/lib/libcontainers.so (0x00000000)
> >         libvcos.so => /usr/lib/libvcos.so (0x00000000)
> >         libc.so.0 => /lib/libc.so.0 (0x00000000)
> >         /lib/ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x00000000)
> >
> >
> > After changing the buildroot toolchain from uclibc to glibc (and a full
> > re-build) dlopen() of /usr/lib/libmmal.so works and ldd produces the
> > following output:
> >
> >         $ ldd /usr/lib/libmmal.so
> >         linux-vdso.so.1 (0xbea59000)
> >         libmmal_vc_client.so => /usr/lib/libmmal_vc_client.so (0xb6f5f000)
> >         libmmal_components.so => /usr/lib/libmmal_components.so
> > (0xb6f44000)
> >         libvchiq_arm.so => /usr/lib/libvchiq_arm.so (0xb6f2e000)
> >         libvcsm.so => /usr/lib/libvcsm.so (0xb6f14000)
> >         libmmal_core.so => /usr/lib/libmmal_core.so (0xb6ef6000)
> >         libmmal_util.so => /usr/lib/libmmal_util.so (0xb6ed8000)
> >         libcontainers.so => /usr/lib/libcontainers.so (0xb6eb5000)
> >         libvcos.so => /usr/lib/libvcos.so (0xb6e9c000)
> >         libpthread.so.0 => /lib/libpthread.so.0 (0xb6e71000)
> >         libdl.so.2 => /lib/libdl.so.2 (0xb6e5e000)
> >         librt.so.1 => /lib/librt.so.1 (0xb6e47000)
> >         libc.so.6 => /lib/libc.so.6 (0xb6cfb000)
> >         /lib/ld-linux-armhf.so.3 (0xb6f8f000)
> >
> > Regards,
> > Peter
> >
> >
> > > Or for another proof of the issue, you can run VLC with X11 to play an
> > > MPEG-4 video, and you will  end up with VLC could not load the codec
> > module
> > > because of the same thing:
> > >
> > > main debug: loading plugins cache file /usr/lib/vlc/plugins/plugins.dat
> > > main warning: cannot read /usr/lib/vlc/plugins/plugins.dat: No such
> > > file or directory
> > > main debug: recursively browsing `/usr/lib/vlc/plugins'
> > > main warning: cannot load module
> > > `/usr/lib/vlc/plugins/codec/libavcodec_plugin.so' ((null)
> > >
> > > Any idea about this?
> > >
> > > Best Regards.
> > > IMAN.
> >
> >
