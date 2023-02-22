Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A961C6379F
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E6F60B0F;
	Wed, 22 Feb 2023 22:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9E6F60B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7qaF1wPux9T; Wed, 22 Feb 2023 22:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F068F60ADF;
	Wed, 22 Feb 2023 22:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F068F60ADF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 541B61BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DFC940452
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DFC940452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEhI8jLYi8kS for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:12:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F1E40131
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4F1E40131
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:12:03 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id k20so5822986qtj.5
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJI8DOq/rHou74C3jtuobydBUrALqAlXKT/RBiCG6Mc=;
 b=dnujWi/J92NHlX6rd32q2vISiw8cAzp6QENdYXgINkwbjuDXb4/0XHob5/e2CZ9jJA
 pRX0kJzBUU5E16ksTsSZljdayW+P8Qc1wDxYmi27M+ili6kc/Nu9sHOCdE2gNNHgTEA7
 Yla06u+c5UdyA4I88QKYrGbFaJix3l52yh1PLnKfI4EPQfFI6nYMOR4TwbkzO+DhkxbD
 WsNxtVNtfbfgWNH+Ap42C8BF/EMAR33y2YcL4h5mgoUc41suaE8avaKuG/2WNuprpsAj
 3rLulCaiW8/H+wagG/OKN0I+DxSYi7THb4wwf790NQKN8E/VY7Lgvtc0XzOegEt9RItg
 oCzQ==
X-Gm-Message-State: AO0yUKVTswaH0IRsG9gEMvaXH70xcnB8Xxs3WyaUgq/Lvy6WBbLCGgws
 tlu/nwvqIPoNJWGBkEPNa7PVP368dMA=
X-Google-Smtp-Source: AK7set+zVgD9HPdXXy2QItRfvR2zNq83vbPaTFp64oT8ePXZg1XQ3nK+4fT8mPNpfzzgmBZ1DiUNug==
X-Received: by 2002:ac8:7fcd:0:b0:3b9:a441:37ed with SMTP id
 b13-20020ac87fcd000000b003b9a44137edmr17477948qtk.32.1677103922131; 
 Wed, 22 Feb 2023 14:12:02 -0800 (PST)
Received: from abyss.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 79-20020a370552000000b007422efb38fasm3042210qkf.39.2023.02.22.14.12.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Feb 2023 14:12:01 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 14:11:31 -0800
Message-Id: <20230222221134.25904-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230209231518.9458-1-ckhardin@gmail.com>
References: <20230209231518.9458-1-ckhardin@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJI8DOq/rHou74C3jtuobydBUrALqAlXKT/RBiCG6Mc=;
 b=Hlq+IQDkrKY8mCs8yNtHLorHZ/kZJRWVwF2JrSZolT0b9f4vnbSjWI4u2m5S+i9MI9
 84uOoijChlaiMRgxE3tS6BF+oplkkXleKEe0/aSSS1hbmk3V3EiOrpLmEBanZ14VgjJU
 NkL8QbZtFcFHRsDuQdnl7Dl89KeyQ+QCwR1TrI+UEiInuq9mbGf5ZeUgkQZMsg+5ATfk
 2O5d43UrvHqywd/0XL9SKXZnJkmeQXsrz7l9yoJfpJw1jB2KGHtUPbJQbGN0rv+0/ioe
 NliMgbxzSZm4rMEcYduK2kT7aDbuodG3/t7q0jbIxRPdrmjadOIzcQiHS7YRh4r/FUZk
 vftw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hlq+IQDk
Subject: [Buildroot] [PATCH v2 0/3] RFC source control tracking for
 linux/uboot
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adding source control tracking into the linux and uboot packages
specifically.

The generic problem is that buildroot needs to make reproducible tarballs
for verification which means the ".git" directories have to exlcuded from
the archive since they can change even thought the contents from the git
reference has not changed.

This leads to the problem that common setlocalversion script will not
work in the build because after the extract there is no access to the
history information given the reasons above.

To mitigate this problem and allow change control tracking for local
development and remote references a somewhat intruisive change needs to
be introduced at the download step for the archive to add an scmversion
during the creation when both the revision history in the source tree
exists and the archive is being created.

Charles Hardin (3):
  support/download: add a helper scipt to generate scmversions
  boot/uboot: add a scmversion rsync hook when overriding srcdir
  linux: add a scmversion rsync hook when overriding srcdir

 boot/uboot/uboot.mk         | 12 +++++++
 linux/linux.mk              | 12 +++++++
 package/pkg-download.mk     |  1 +
 support/download/dl-wrapper |  5 +--
 support/download/git        | 10 ++++++
 support/download/hg         | 10 ++++++
 support/download/scmversion | 63 +++++++++++++++++++++++++++++++++++++
 support/download/svn        | 10 ++++++
 8 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100755 support/download/scmversion

-- 
2.24.3 (Apple Git-128)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
