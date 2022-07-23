Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA3EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0391341768;
	Sat, 23 Jul 2022 20:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0391341768
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DS1GKcw27fDA; Sat, 23 Jul 2022 20:48:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89BDE4167F;
	Sat, 23 Jul 2022 20:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89BDE4167F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A2361BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 249E581D24
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 249E581D24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdUFI1xx7kPs for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:48:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 331EC81B6D
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 331EC81B6D
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:48:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id n185so4604822wmn.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eystsogms49rszqANJXrgi0923gQu9gC7Xsn35hlARM=;
 b=Tk2DtznU96Nvll7WVwc3bmITEn4VxB2r4Z4vImHikC0tRWPTvoGg0AiABUZF0BGLrm
 2Hwc1jkER8WcIePdxWJdgQCOXNmUYFfiS3ByZI0PfplhPgPAm0tDLxkyrVBtk2iEhDf7
 8W8id6pYP6af+5pb0mXkVrqCI8m00kZEEceJL4qz7Sc7GeN2JZ2Xt0pgYQTvMycF7m85
 fJUYKWuJW8dki6pXKTDkM7uUQenLvyl2tE6D84m7MQ5ZdXXBr2WhhUE4VHogURIhZ7R2
 CMwLBc3CYdd7UBzPTUxV8KCpIFinIwNTj2JMOIy8C/87owd53KZMoc8zGsqnyo409rwt
 VLSQ==
X-Gm-Message-State: AJIora9dcxaV26jeRZoopkrFtWpnKihWFyifB1Npjg7sig1YWjXVrwas
 WJK008AQfZB/NYt+TG7k7GdmSnKQtHziBdt8poyg8Q==
X-Google-Smtp-Source: AGRyM1sGbqS4cMpl9kuB1XfVEypXdZc1oQ5tat8TNu3L5wonaVLEqN7lo5aBzvuRi+1/hixaeS/8Q3S8O/BsAqE3Aro=
X-Received: by 2002:a05:600c:1548:b0:3a3:2896:6b86 with SMTP id
 f8-20020a05600c154800b003a328966b86mr15025391wmg.109.1658609320175; Sat, 23
 Jul 2022 13:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR06MB4805F290E2B4224008BC23EAA08D9@BYAPR06MB4805.namprd06.prod.outlook.com>
 <b7b3bb6f-af5d-1987-0bf0-4da328e1bc77@smile.fr>
In-Reply-To: <b7b3bb6f-af5d-1987-0bf0-4da328e1bc77@smile.fr>
From: James Knight <james.d.knight@live.com>
Date: Sat, 23 Jul 2022 16:48:28 -0400
Message-ID: <CALAjcgW56=jP5-h048PwsGezdYhFTPcDhH+uPLbUbp0vrhkn=g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/1] board/qemu/post-image.sh: flexible qemu
 launch options
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
Cc: James Knight <james.d.knight@live.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain,

On Sat, Jul 23, 2022 at 12:33 PM Romain Naour <romain.naour@smile.fr> wrote:
>
> The start-qemu.sh script is actually used by the Buildroot gitlab-ci to test do
> a runtime test (boot test) for all Qemu defconfigs.

My reasons for presenting changes to this script was under the
assumption that this was a generic helper for QEMU-supported images.
Trying to play around with Buildroot again (it has been awhile), I
just selected the `qemu_x86_defconfig` configuration as an easy way to
get things started. I noticed the `start-qemu.sh` script in the
`output/images/` folder and thought "This is a nice script to help me
test my images with".

If the intent is to only use this script for CI-related work, that's
fine by me -- and we can drop the patch if desired.

> So only this qemu command line command line is supposed to work out of the box.
> If you let the used customize the qemu command line, it can raise some issue.

I can agree, injection custom options will void the warranty. The main
reason for introducing these changes was to test a QEMU tweaked
configuration which utilized some display-related changes which
sometimes required additional modifications. For example, providing an
environment with more memory (e.g. `-m 1G`) or customizing the
graphics driver (e.g. `-vga virtio`). I would apply modifications,
test things which may require a rebuild on a kernel/component, which
would replace the script and I would have to modify it again.

> I would throw a warning if $@ is not empty, just to warn the user.

This would be fine for me (to help promote the idea that extra
arguments are not officially supported).

> Naming stuff is hard, here we want an option to use Qemu installed on the host system, not from host-qemu (--host may be misleading).
> ...
> Using Qemu installed on the host may be really old and not able to boot the system.

I can agree that this may be the case for some distributions, but I
find some distributions (like Arch) provide a fast turnaround time for
newer versions. The only intention of providing a way to use a
system's version (if available) was to maybe utilize some options that
may have not been enabled on the host-qemu package. For example, I was
trying to utilize the `-display gtk` option that was available on the
host, but not supported with the built host-qemu package. Having the
option may also provide flexibility if the system's QEMU is a newer
version then that of Buildroots (i.e. when dealing with older tags/LTS
builds).

We could tweak the argument to something like `--use-system-qemu`, to
be a bit more explicit. And also, generating the same type of warnings
that using such options is officially unsupported and for advanced
testing.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
