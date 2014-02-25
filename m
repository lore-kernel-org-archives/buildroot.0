From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Feb 2014 23:53:56 +0100
Subject: [Buildroot] [RFC/PATCH 0/1] gst-fsl-plugins: fix compile for
 sysroot based on newer linux kernel headers
In-Reply-To: <87wqgihlo2.fsf@dell.be.48ers.dk>
References: <1393366722-27644-1-git-send-email-ps.report@gmx.net>,
 <87wqgihlo2.fsf@dell.be.48ers.dk>
Message-ID: <trinity-913bb981-bb5f-4c21-aa93-d4abc9ac6ea7-1393368836439@3capp-gmx-bs50>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Gesendet: Dienstag, 25. Februar 2014 um 23:28 Uhr
> Von: "Peter Korsgaard" <jacmet@uclibc.org>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [RFC/PATCH 0/1] gst-fsl-plugins: fix compile for sysroot based on newer linux kernel headers
>
> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
> 
>  > The freescale specific gst-fsl-plugins-3.0.1/src/misc/v4l_source/src/mfw_gst_v4lsrc.c
>  > compile depends on the VIDIOC_DBG_G_CHIP_IDENT ioctl (which was removed
>  > from linux kernel in version 3.11). This breaks compile with toolchains
>  > based on actual linux kernel headers (e.g. buildroot/glibc toolchain).
> 
>  > Which is the right way to fix this problem?
> 
>  > - fix include precedence from sysroot to custom linux kernel headers
>  >   as done in the following patch (latest freescale custom kernel
>  >   is 3.10 based)
> 
>  > - add comment/hint in package description about this dependency
> 
>  > - and/or add dependency (or check) for sysroot linux kernel headers
>  >   version <= 3.10.x (any hint how to do this?)
> 
> How about just patching mfw_gst_v4lsrc.c to use a local definition for
> VIDIOC_DBG_G_CHIP_IDENT if the kernel headers don't provide it (E.G. in
> a #ifndef VIDIOC_DBG_G_CHIP_IDENT conditional)?
> 
> -- 
> Bye, Peter Korsgaard
> 

Was my first thought too, but the gst-fsl-plugins logic seems to be that sysroot
and runnign kernel are different ones. The running/custoom kernel needs the
imx/freescale-specific extensions.

The #ifndef VIDIOC_DBG_G_CHIP_IDENT conditional solution would give the
wrong/sysroot based result instead the right/custom kernel based one
(a plugin without VIDIOC_DBG_G_CHIP_IDENT ioctl, a running kernel with
existing VIDIOC_DBG_G_CHIP_IDENT ioctl).

Best solution would be consistent versions of toolchain and custom kernel...

Bye, Peter Seiderer
