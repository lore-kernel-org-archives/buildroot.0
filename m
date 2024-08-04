Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E553C3DA4A
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 02:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3E9580BB0;
	Sun,  4 Aug 2024 02:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmyQgsSiGanK; Sun,  4 Aug 2024 02:04:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D148B80BEA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D148B80BEA;
	Sun,  4 Aug 2024 02:04:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABEEA1BF4E7
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 02:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72CEB80C1D
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 02:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDeJgRAMPxU9 for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 02:04:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.169;
 helo=mail-lj1-f169.google.com; envelope-from=jdknight@jdknight.me;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63FA480AE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63FA480AE7
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63FA480AE7
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 02:04:33 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so144633081fa.2
 for <buildroot@buildroot.org>; Sat, 03 Aug 2024 19:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722737071; x=1723341871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e5EZnT2b/ZMKOX+z74GnKnUqjUl4zkrP/n1ibYZOgf0=;
 b=PwaI7b601kpZahU22FOBPvHvEozT9bp97R7MTy622P9fadmwUV9wNHgwFJictPPcdp
 Bo4J7STJyEfYgRKWqnqJ/p9aIRL0YXKsMvnhfwVNHznQ+3ikuFeVXpUDulBj1aYPKrzy
 zdAqTViFVtMUOkJZSbsHRdPCV+ja+6+FU5SiNsxClUI+R4I4WHK/2+YUdNl5uJSKGIqA
 3sgeOqEjuTa0Iw/sl0fZKtpZDdtIocMkaNW4BkbZsfyWLGFYQq58csE92Jyq0V7RZEur
 08jvvemwlnK8K6SO5kagsfkFUWf1V0cINPlkBYn/1bIVGMk18KRdPezyur3oSD+7dvry
 cWtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNaBt4o9M/PRZ8lmkkME4Vcj0DHAfEsi8zmCfFu/jOXHzoljMzYX7v5QYQE5sOLCrNHGfvGE0aKq05yfB5dmXcKWx+fOU0vA==
X-Gm-Message-State: AOJu0YwbRvWG8KcMG3s60fGN4vU1jAqGQJFKuIO6eSwEs11n5bHWnf5S
 rf3O57VIdt/7O8FidiE19Kp12xA9254D9jOdULv3AtihhAywg0cFYq+ycxU4YqDkhQKyPV1Dbqv
 ncAMjxPOpWxFkPq+EDc2PyB8ZQrg7m81KUdaCxw==
X-Google-Smtp-Source: AGHT+IGAYUl1hN5aIJMjbj+SUcJb0SdxKvwdcm6NTQKFnBebRFMncg+Qv1Nys+O7H05w2VM70uCx9ViLkW4qtrI1sRI=
X-Received: by 2002:a2e:870d:0:b0:2ef:2c86:4d47 with SMTP id
 38308e7fff4ca-2f15aa95d8dmr53860711fa.15.1722737070433; Sat, 03 Aug 2024
 19:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <CYYP221MB1140ACF0E0092617169683ECA0BC2@CYYP221MB1140.NAMP221.PROD.OUTLOOK.COM>
 <20240803225736.568fb63c@windsurf>
In-Reply-To: <20240803225736.568fb63c@windsurf>
From: James Knight <james.d.knight@live.com>
Date: Sat, 3 Aug 2024 22:04:20 -0400
Message-ID: <CALAjcgUXc1CuA4JQ4aJxQBa+UsZVskGwmrTPoaSajE+z_kjpcA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=live.com
Subject: Re: [Buildroot] [RFC PATCH 1/1] package/pkg-generic.mk: introduce
 pre/post target finalize hooks
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
Cc: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hey Thomas,

On Sat, Aug 3, 2024 at 4:57 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> ... Could give a specific example of something that cannot be using the existing TARGET_FINALIZE_HOOKS? ...

One example where we have been trying this newly suggested hook is
defining a br2-external package dedicated for tailoring a generated
`/usr/lib/os-release` file. Originally, I have been using a post-build
script to populate entries into `os-release` (e.g. adding a
`SUPPORT_URL` entry and more). While this works, it does require
populating a script in `BR2_ROOTFS_POST_BUILD_SCRIPTS`. A different
approach I was looking for was having a menu option that other board
configurations can easily use to perform os-release tailoring. With
the proposed hook, I can now define a package that performs the
changes after Buildroot generates an os-release, and there is no
requirement for existing and new board configurations to set or append
their post-build script option.

From what I can tell, there was no other means to invoke a
package-specific hook right before Buildroot triggers any custom
post-build script. While the mentioned example is somewhat of a
trivial use case, I figured I would propose this hook to have
developers have flexibility in their target tailoring.

It would be fine if the proposal is not preferred. The example
mentioned may be too trivial and having just a `TARGET_FINALIZE_HOOKS`
over a pre/post pair is simpler to promote/use. It would not be too
much of a hassle to move back to using post-build scripts.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
