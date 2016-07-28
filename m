From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jul 2016 18:57:32 -0700
Subject: [Buildroot] [PATCH v11 2/2] docker-engine: new package
In-Reply-To: <20160727234055.2dad417f@free-electrons.com>
References: <1469394628-19412-1-git-send-email-christian@paral.in>
 <1469394628-19412-2-git-send-email-christian@paral.in>
 <20160727234055.2dad417f@free-electrons.com>
Message-ID: <068F07A4-A28B-4AA9-B57B-5524079EDFC9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jul 27, 2016, at 2:40 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Sun, 24 Jul 2016 14:10:28 -0700, Christian Stewart wrote:
>> Docker is a platform to build, ship, and run applications in portable
>> containers.
>> 
>> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> I've applied after removing the LIBRARY_PATH variable, as you suggested.
> 
> However, there is still one thing I'm not happy with: dockerd is linked
> statically against libbtrfs. It links dynamically against
> libdevmapper.so, because there is no libdevmapper.a installed. However,
> since libbtrfs is available in STAGING_DIR as both a shared library
> *and* a static library, the Go build logic seems to prefer the static
> library. This is definitely *not* what we want in the context of
> Buildroot.

you would need atleast go 1.5+ for dynamic libraries support. If thats not an issue
then simply change the build cmds to something like

go build -linkshared ...

> 
> See:
> 
> $ arm-linux-gnueabihf-readelf -d output/target/usr/bin/dockerd | grep NEEDED
> 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
> 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
> 0x00000001 (NEEDED)                     Shared library: [libdevmapper.so.1.02]
> 0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> $ grep DOCKER_ENGINE .config
> BR2_PACKAGE_DOCKER_ENGINE=y
> BR2_PACKAGE_DOCKER_ENGINE_DAEMON=y
> # BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL is not set
> BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS=y
> BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER=y
> BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS=y
> $ ls -l output/staging/usr/lib/libbtrfs.*
> -rwxr-xr-x 1 thomas thomas 49938 juil. 27 23:26 output/staging/usr/lib/libbtrfs.a
> lrwxrwxrwx 1 thomas thomas    15 juil. 27 23:26 output/staging/usr/lib/libbtrfs.so -> libbtrfs.so.0.1
> lrwxrwxrwx 1 thomas thomas    15 juil. 27 23:26 output/staging/usr/lib/libbtrfs.so.0 -> libbtrfs.so.0.1
> -rwxr-xr-x 1 thomas thomas 44012 juil. 27 23:26 output/staging/usr/lib/libbtrfs.so.0.1
> $ ls -l output/staging/usr/lib/libdevmapper.*
> lrwxrwxrwx 1 thomas thomas     20 juil. 27 23:32 output/staging/usr/lib/libdevmapper.so -> libdevmapper.so.1.02
> -rwxr-xr-x 1 thomas thomas 454192 juil. 27 23:32 output/staging/usr/lib/libdevmapper.so.1.02
> 
> Could you investigate this?
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160727/9fb13439/attachment.asc>
