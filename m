From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 28 Mar 2020 22:26:51 +0100
Subject: [Buildroot] Failed to load libmmal.so from rpi-userland package
 via buildroot toolchain on raspberry pi 4
In-Reply-To: <20200328195650.52ae188e@gmx.net>
References: <CAPn7sn38WqJVgbLBkVj403GpkhcQx77HwdZ9zxEEvifO7qRbxg@mail.gmail.com>
 <20200328113133.022b01b6@gmx.net>
 <trinity-5b420b27-f59e-48e3-beee-af28dfff8d55-1585393538709@3c-app-mailcom-bs12>
 <20200328152845.055bdebc@gmx.net>
 <trinity-00824589-a2b1-432a-91cb-72bbd9df3da4-1585415058087@3c-app-mailcom-bs10>
 <20200328195650.52ae188e@gmx.net>
Message-ID: <20200328222651.3293ac91@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Dagg,

On Sat, 28 Mar 2020 19:56:50 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Dagg,
>
> On Sat, 28 Mar 2020 18:04:18 +0100, daggs <daggs@gmx.com> wrote:
>
> > Greetings Peter,
> >
> > > Sent: Saturday, March 28, 2020 at 5:28 PM
> > > From: "Peter Seiderer" <ps.report@gmx.net>
> > > To: daggs <daggs@gmx.com>
> > > Cc: buildroot at busybox.net, "iman ahmadvand" <iman72411@gmail.com>
> > > Subject: Re: [Buildroot] Failed to load libmmal.so from rpi-userland package via buildroot toolchain on raspberry pi 4
> > >
> > > Hello Dagg,
> > >
> > > On Sat, 28 Mar 2020 12:05:38 +0100, daggs <daggs@gmx.com> wrote:
> > >
> > > > Greetings,
> > > >
> > > > > Sent: Saturday, March 28, 2020 at 1:31 PM
> > > > > From: "Peter Seiderer" <ps.report@gmx.net>
> > > > > To: "iman ahmadvand" <iman72411@gmail.com>
> > > > > Cc: buildroot at busybox.net
> > > > > Subject: Re: [Buildroot] Failed to load libmmal.so from rpi-userland package via buildroot toolchain on raspberry pi 4
> > > > >
> > > > > Hello Iman,
> > > > >
> > > > > On Sat, 28 Mar 2020 11:39:46 +0430, iman ahmadvand <iman72411@gmail.com> wrote:
> > > > >
> > > > > > Hi everyone.
> > > > > > It seems that loading the MMAL interface shared libraries from rpi-userland
> > > > > > package via simple dlopen is not possible, or more specific, the packages
> > > > > > or binaries such as VLC or VLC codec plugin (libavcodec_plugin) could not
> > > > > > load the libavcodec from FFmpeg which in turn depends on libmmal*.so
> > > > > >
> > > > > > The steps to reproduce(with BR2_PACKAGE_RPI_USERLAND enabled,
> > > > > > BR2_STRIP_strip disabled, BR2_OPTIMIZE_0 enabled):
> > > > > > git clone git://git.busybox.net/buildroot buildroot && cd buildroot && git
> > > > > > checkout 2019.11.01
> > > > > > make raspberrypi4_defconfig && make all
> > > > > >
> > > > > > Then in this image try to run a simple c routine with dlopen(), if you do
> > > > > > so, for example, ./dltest /usr/lib/libmmal.so you will end up with:
> > > > > >
> > > > > > symbol 'mmal_port_payload_alloc': can't resolve symbol
> > > > > > symbol 'mmal_port_payload_free': can't resolve symbol
> > > > > > symbol 'mmal_port_log_category': can't resolve symbol
> > > > > >
> > > > >
> > > > > Can confirm your failure...did not (yet) find out what fails exactly, but
> > > > > ldd produces the following ouput (mind the 0x00000000):
> > > > >
> > > > > 	$ ldd /usr/lib/libmmal.so
> > > > > checking sub-depends for '/usr/lib/libmmal_vc_client.so'
> > > > > checking sub-depends for '/usr/lib/libmmal_components.so'
> > > > > checking sub-depends for '/usr/lib/libvchiq_arm.so'
> > > > > checking sub-depends for '/usr/lib/libvcsm.so'
> > > > > checking sub-depends for '/usr/lib/libmmal_core.so'
> > > > > checking sub-depends for '/usr/lib/libmmal_util.so'
> > > > > checking sub-depends for '/usr/lib/libcontainers.so'
> > > > > checking sub-depends for '/usr/lib/libvcos.so'
> > > > > checking sub-depends for '/lib/libc.so.0'
> > > > >         ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0xb6f8b000)
> > > > >         libmmal_vc_client.so => /usr/lib/libmmal_vc_client.so (0x00000000)
> > > > >         libmmal_components.so => /usr/lib/libmmal_components.so (0x00000000)
> > > > >         libvchiq_arm.so => /usr/lib/libvchiq_arm.so (0x00000000)
> > > > >         libvcsm.so => /usr/lib/libvcsm.so (0x00000000)
> > > > >         libmmal_core.so => /usr/lib/libmmal_core.so (0x00000000)
> > > > >         libmmal_util.so => /usr/lib/libmmal_util.so (0x00000000)
> > > > >         libcontainers.so => /usr/lib/libcontainers.so (0x00000000)
> > > > >         libvcos.so => /usr/lib/libvcos.so (0x00000000)
> > > > >         libc.so.0 => /lib/libc.so.0 (0x00000000)
> > > > >         /lib/ld-uClibc.so.1 => /lib/ld-uClibc.so.1 (0x00000000)
> > > > >
> > > > >
> > > > > After changing the buildroot toolchain from uclibc to glibc (and a full
> > > > > re-build) dlopen() of /usr/lib/libmmal.so works and ldd produces the
> > > > > following output:
> > > > >
> > > > > 	$ ldd /usr/lib/libmmal.so
> > > > > 	linux-vdso.so.1 (0xbea59000)
> > > > > 	libmmal_vc_client.so => /usr/lib/libmmal_vc_client.so (0xb6f5f000)
> > > > > 	libmmal_components.so => /usr/lib/libmmal_components.so (0xb6f44000)
> > > > > 	libvchiq_arm.so => /usr/lib/libvchiq_arm.so (0xb6f2e000)
> > > > > 	libvcsm.so => /usr/lib/libvcsm.so (0xb6f14000)
> > > > > 	libmmal_core.so => /usr/lib/libmmal_core.so (0xb6ef6000)
> > > > > 	libmmal_util.so => /usr/lib/libmmal_util.so (0xb6ed8000)
> > > > > 	libcontainers.so => /usr/lib/libcontainers.so (0xb6eb5000)
> > > > > 	libvcos.so => /usr/lib/libvcos.so (0xb6e9c000)
> > > > > 	libpthread.so.0 => /lib/libpthread.so.0 (0xb6e71000)
> > > > > 	libdl.so.2 => /lib/libdl.so.2 (0xb6e5e000)
> > > > > 	librt.so.1 => /lib/librt.so.1 (0xb6e47000)
> > > > > 	libc.so.6 => /lib/libc.so.6 (0xb6cfb000)
> > > > > 	/lib/ld-linux-armhf.so.3 (0xb6f8f000)
> > > > >
> > > > > Regards,
> > > > > Peter
> > > > >
> > > > >
> > > > > > Or for another proof of the issue, you can run VLC with X11 to play an
> > > > > > MPEG-4 video, and you will  end up with VLC could not load the codec module
> > > > > > because of the same thing:
> > > > > >
> > > > > > main debug: loading plugins cache file /usr/lib/vlc/plugins/plugins.dat
> > > > > > main warning: cannot read /usr/lib/vlc/plugins/plugins.dat: No such
> > > > > > file or directory
> > > > > > main debug: recursively browsing `/usr/lib/vlc/plugins'
> > > > > > main warning: cannot load module
> > > > > > `/usr/lib/vlc/plugins/codec/libavcodec_plugin.so' ((null)
> > > > > >
> > > > > > Any idea about this?
> > > > > >
> > > > > > Best Regards.
> > > > > > IMAN.
> > > >
> > > > I wonder, how do you run ldd on the pi4 with the buildroot env? I'm trying to debug my mmal issue too.
> > >
> > > Exactly with the command line as given above 'ldd /usr/lib/libmmal.so' on the
> > > target (here pi4), what do your mean with buildroot env (do not mix 'ldd -
> > > print shared object dependencies' with 'ld - The GNU linker')?
> > >
> > > Regards,
> > > Peter
> > >
> >
> > here is what I get:
> > <root@TvHeadend_Server: /home/igor> ldd /usr/lib/libmmal.so
> > bash: ldd: command not found
> > <root@TvHeadend_Server: /home/igor> cat /etc/os-release
> > NAME=Buildroot
> > VERSION=2020.02-rc2-00018-g16d3e1734e-dirty
> > ID=buildroot
> > VERSION_ID=2020.02-rc2
> > PRETTY_NAME="Buildroot 2020.02-rc2"
> > <root@TvHeadend_Server: /home/igor> uname  -a
> > Linux TvHeadend_Server 4.19.97-v8 #1 SMP PREEMPT Fri Feb 28 15:16:43 IST 2020 aarch64 GNU/Linux
> > <root@TvHeadend_Server: /home/igor> ls -l /usr/lib/libmmal*
> > -rwxr-xr-x    1 root     root         14192 Feb 28 15:21 /usr/lib/libmmal.so
> > -rwxr-xr-x    1 root     root         51576 Feb 28 15:21 /usr/lib/libmmal_components.so
> > -rwxr-xr-x    1 root     root         72344 Feb 28 15:21 /usr/lib/libmmal_core.so
> > -rwxr-xr-x    1 root     root         72320 Feb 28 15:21 /usr/lib/libmmal_util.so
> > -rwxr-xr-x    1 root     root         43520 Feb 28 15:21 /usr/lib/libmmal_vc_client.so
> >
> > looks like I'm missing something...
>
> Then your are using for sure something different than a plain raspberrypi4_defconfig
> with BR2_PACKAGE_RPI_USERLAND enabled (or there is a differnce between
> 2020.02-rc2 (used by your, why rc2?) and git master (used by me)....
>
> When in doubt provide your .config (or defconfig) file...

And for glibc you need to enable BR2_PACKAGE_GLIBC_UTILS=y to gain
the ldd command on the target...

Regards,
Peter

>
> Regards,
> Peter
>
> >
> > Thanks,
> >
> > Dagg.
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
