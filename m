From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 14:10:39 +0100
Subject: [Buildroot] [PATCH 04/16] uclibc: Enable compile in thumb mode
 when selected
In-Reply-To: <87zitx5oz0.fsf@dell.be.48ers.dk>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87zitx5oz0.fsf@dell.be.48ers.dk>
Message-ID: <20160317141039.5ed743f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 12:21:55 +0100, Peter Korsgaard wrote:

>  >  - Force ARM mode only when gcc 4.7 or 4.8 is selected with Thumb1 and
>  >    threads. We also explicitly disable COMPILE_IN_THUMB_MODE when we
>  >    fall in this situation. With newer gcc versions, starting 4.9, this
>  >    problem is fixed and we can build uClibc in Thumb1 mode.
> 
>  >  - Enable COMPILE_IN_THUMB_MODE when Thumb1 or Thumb2 is selected. We
>  >    need to disable context functions since they don't build in Thumb
>  >    mode.
> 
> Why do we need to tell uClibc that we are building in thumb1/2 mode?
> From a quick grep this just adds -mthumb to CFLAGS, which shouldn't be
> needed as we've already configured the compiler to do so by default and
> enables USE_BX + USE_LDREXSTREX.
> 
> Now, I don't know enough of the finer details about this. I thought BX
> was for thumb1 interworking with classical ARM code and not needed for
> thumb2, so isn't it just adding overhead for thumb2? I also see that
> enabling this option will break thumb compilation on arm920t.

Interworking allows on pre-ARMv5 code to fix ARM and Thumb code. With
ARMv5, it is not needed if I remember correctly, thanks to the bx/blx
instructions.

> Luckily Yann is the author of this logic in uClibc, so lets ask him ;)
> 
>  >  - Disable COMPILE_IN_THUMB_MODE explicitly otherwise.
> 
>  > This allows to build a Thumb2 toolchain on ARMv7-M for example.
> 
> What wasn't working before?

Not sure. In fact this patch was kind-of the starting point of my
series, I wanted to get rid of it from patchwork :)

I'll have a closer look.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
