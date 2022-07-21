Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64738C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 03:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C570D408E8;
	Thu, 21 Jul 2022 03:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C570D408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-525O0IPa5f; Thu, 21 Jul 2022 03:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA45A40480;
	Thu, 21 Jul 2022 03:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA45A40480
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1182F1BF37A
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 03:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6AD60E7E
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 03:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6AD60E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbn2VNAVdcDv for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 03:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC43E60E44
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC43E60E44
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 03:55:30 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so322942otk.0
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OV/KabQmk/2zTGcKHjkmNGds+dzxlS8IoLF81BLuhfE=;
 b=0soW6fgm8CuYpeS5JZhKh14hSBbtkhGAUSLN8VwybHwsGKXSs37xUvN1e8vCdh5tUv
 rzBXHfskjUD1p0BTVtUOL+r0Tebx8CqkCVoX3oY940bfB9dyG0ZIRwbvKojb4JS4uU00
 lFfYK91c7BvuJuvfcEt9/idA5h+vdgU3tR5VhGWS6nVHOxcW7uIK8xSjgbTmqz+L0bPk
 KCeAE+i4eddtx6AsWzMvg+xYdz4RHJsg+LLfj1HtR48PzEXG5qAYyC5n+mXgbE/Xlg2C
 FdgSdP749Ygj2hNtVQqfm+lKTqj2875J2kHqnmX85qOBXAxTc3N1fruKHthQdwhyUS6B
 PR+g==
X-Gm-Message-State: AJIora/sN12Ok9dEaekP96+hM6073Rd5LON+6PBqaRC/XAqBJaJxaNOj
 H8yzV6hjpPNmcRH2ntNwExtKOwKfB/Tt7BlDriY=
X-Google-Smtp-Source: AGRyM1tB9UCwDUsBsIcuK+WbvwsGTbz9m/YdagPdofG9LwXI8Yqd6o5kWkSVQeohZBn65XXJJNS7NmVfq44p7+ws87w=
X-Received: by 2002:a9d:4f0a:0:b0:61c:ae80:3d36 with SMTP id
 d10-20020a9d4f0a000000b0061cae803d36mr6263219otl.151.1658375729770; Wed, 20
 Jul 2022 20:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220101214034.2152144-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20220101214034.2152144-1-giulio.benetti@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 20 Jul 2022 21:55:18 -0600
Message-ID: <CADvTj4r09-gBxrbbJCd-gXCaOzZsMGUgv=E-SELMUieGdTorcA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OV/KabQmk/2zTGcKHjkmNGds+dzxlS8IoLF81BLuhfE=;
 b=mcHPaHrkhHMZum76Vx4plgqz3PyrfMvRtGOAqN2pdwx/rnZjhpwPOOevDJw2CHx3Up
 gh2bq43d4y3ftKoV0CQionU9Fx64/yrXLOW4mMgJHBvlpHzNfupaJjfsIO6agvrclgfd
 yRek9GTO1myucfR5qTNrRebS/09TF2DlBMaX12psMjzSRc9dh3NN+D8EOIGMGhh6q5SE
 kmmKiFLuMDt5CMdrg9t7nr6d8ru/Vf7he9G05KZeM8gm/XbH7+SLsDbBL/VL7nKFvzP8
 A37Q9MWXyyxszdO+/E9jH0Ykq5gEF0OqAN0Fuz/YUvt1vLD7Ac3OCnmEVu7Tkr9Wl955
 LDmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mcHPaHrk
Subject: Re: [Buildroot] [PATCH] Makefile: disable 'printvars' and
 'show-vars' recipes for Make 4.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jan 1, 2022 at 2:40 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Make 4.3 is buggy and leads to a "Segmentation fault (core dumped)" when
> calling 'make printvars' or 'make show-vars', so let's refuse to execute
> those recipes if Make 4.3 by adding 'check-make-version' recipe as
> depedendency of 'printvars' and 'show-vars' as suggested by Yann E. Morin.

FYI autobuilder threads seem to die when this gets hit:
make: *** [Makefile:1056: check-make-version] Error 1
Process Process-12:
Traceback (most recent call last):
  File "/usr/lib/python3.10/multiprocessing/process.py", line 315, in _bootstrap
    self.run()
  File "/usr/lib/python3.10/multiprocessing/process.py", line 108, in run
    self._target(*self._args, **self._kwargs)
  File "/home/autobuild/buildroot-test/scripts/autobuild-run", line
748, in run_instance
    self.run_one_build()
  File "/home/autobuild/buildroot-test/scripts/autobuild-run", line
731, in run_one_build
    ret = self.do_reproducible_build()
  File "/home/autobuild/buildroot-test/scripts/autobuild-run", line
524, in do_reproducible_build
    ret = self.check_reproducibility()
  File "/home/autobuild/buildroot-test/scripts/autobuild-run", line
416, in check_reproducibility
    prefix = subprocess.check_output(["make", "--no-print-directory",
"O=%s" % self.outputdir,
  File "/usr/lib/python3.10/subprocess.py", line 420, in check_output
    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
  File "/usr/lib/python3.10/subprocess.py", line 524, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '['make',
'--no-print-directory',
'O=/home/autobuild/autobuild/instance-11/output-1', '-C',
'instance-11/buildroot', 'printvars', 'VARS=TARGET_CROSS']' returned
non-zero exit status 2.

>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  Makefile | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 0b8c7b2867..ac98b84425 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1058,13 +1058,20 @@ ifeq ($(NEED_WRAPPER),y)
>         $(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
>  endif
>
> +.PHONY: check-make-version
> +check-make-version:
> +ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
> +       @echo "Make 4.3 doesn't support 'printvars' and 'show-vars' recipes"
> +       @exit 1
> +endif
> +
>  # printvars prints all the variables currently defined in our
>  # Makefiles. Alternatively, if a non-empty VARS variable is passed,
>  # only the variables matching the make pattern passed in VARS are
>  # displayed.
>  # show-vars does the same, but as a JSON dictionnary.
>  .PHONY: printvars
> -printvars:
> +printvars: check-make-version
>         @:
>         $(foreach V, \
>                 $(sort $(filter $(VARS),$(.VARIABLES))), \
> @@ -1077,7 +1084,7 @@ printvars:
>
>  .PHONY: show-vars
>  show-vars: VARS?=%
> -show-vars:
> +show-vars: check-make-version
>         @:
>         $(info $(call clean-json, { \
>                         $(foreach V, \
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
