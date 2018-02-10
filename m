From: Toan Pham <tpham3783@gmail.com>
Date: Fri, 9 Feb 2018 19:02:48 -0500
Subject: [Buildroot] Suggestion for Makefile to probably import
 BR2_CONFIG
In-Reply-To: <1cb3ee33-b12f-6534-9dbf-fb697fbf3482@mind.be>
References: <CAGNmLEM_x8ykDr54gbT94em9YyH5+0ec=jCgjULh68yJLUzjnw@mail.gmail.com>
 <1cb3ee33-b12f-6534-9dbf-fb697fbf3482@mind.be>
Message-ID: <CAGNmLEN+OMauBsffMjJxU4LRRfy08_tHk-m57xt1TTYxvBEYOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>  If you have an existing defconfig file (normally generated with 'make
> savedefconfig', but you can also just copy the .config file), you can use
> it as
> the source of the generated .config as follows:
>
> make BR2_DEFCONFIG=$PWD/myTarget1 O=output.target1
> make O=output.target1
>
>
Arnout, Is there anyway you can consider one more patch (attached file)?
It allows BR2 to bootstrap a build automatically if BR2_DEFCONFIG is
defined, and that BR2_CONFIG file hasn't been created yet.  One does not
have to copy a defconfig to the destination of .config to start the build.
Moreover, if the user passes in BR2_DEFCONFIG, most likely he or she wants
to use that as the config file.  There's no need to error out with a
message like "You have to run menuconfig first"!  Most users at this time
would run "make BR2_DEFCONFIG=/tmp/defconfig menuconfig", believing that
the new config would be generated from defconfig.  That's not the case,
let's improve it!


Without the patch, the user has to carry out one of the following steps:

  1.  copy defconfig file to config file (according to you)
       ie:  mkdir $PWD/myTarget1 && cp defconfig $PWD/myTarget1/.config

  2.  Manually generate .config from defconfig (according to BR2 manual)
       make BR2_DEFCONFIG=$PWD/myTarget1 O=output.target1 defconfig


It would be nice if that process is automated!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180209/cab8d8a3/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2_auto_generate_config.patch
Type: text/x-patch
Size: 678 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180209/cab8d8a3/attachment.bin>
