From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 12:21:55 +0100
Subject: [Buildroot] [PATCH 04/16] uclibc: Enable compile in thumb mode
	when selected
In-Reply-To: <1458164602-16983-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 16 Mar 2016 22:43:10 +0100")
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zitx5oz0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > From: Paul Enman <paul.enman@gmail.com>
 > Until now, when thumb was selected with threads, we were forcing ARM
 > mode to be used, to workaround some problems building uClibc with
 > threads in Thumb mode. Also, we were never enabling Thumb mode in
 > uClibc when Thumb2 was selected in the configuration.

 > Therefore, this commit updates the uclibc.mk logic to:

 >  - Force ARM mode only when gcc 4.7 or 4.8 is selected with Thumb1 and
 >    threads. We also explicitly disable COMPILE_IN_THUMB_MODE when we
 >    fall in this situation. With newer gcc versions, starting 4.9, this
 >    problem is fixed and we can build uClibc in Thumb1 mode.

 >  - Enable COMPILE_IN_THUMB_MODE when Thumb1 or Thumb2 is selected. We
 >    need to disable context functions since they don't build in Thumb
 >    mode.

Why do we need to tell uClibc that we are building in thumb1/2 mode?
From a quick grep this just adds -mthumb to CFLAGS, which shouldn't be
needed as we've already configured the compiler to do so by default and
enables USE_BX + USE_LDREXSTREX.

Now, I don't know enough of the finer details about this. I thought BX
was for thumb1 interworking with classical ARM code and not needed for
thumb2, so isn't it just adding overhead for thumb2? I also see that
enabling this option will break thumb compilation on arm920t.

Luckily Yann is the author of this logic in uClibc, so lets ask him ;)

 >  - Disable COMPILE_IN_THUMB_MODE explicitly otherwise.

 > This allows to build a Thumb2 toolchain on ARMv7-M for example.

What wasn't working before?

-- 
Bye, Peter Korsgaard
