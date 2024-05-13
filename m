Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8950DC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C107407D6;
	Mon, 13 May 2024 20:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id of0qLhDgjryt; Mon, 13 May 2024 20:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DB84082E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DB84082E;
	Mon, 13 May 2024 20:45:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2471BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78391608B0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yVZFa4UfNA0 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 452CE60789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 452CE60789
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 452CE60789
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:44:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34D28FF802;
 Mon, 13 May 2024 20:44:54 +0000 (UTC)
Date: Mon, 13 May 2024 22:44:52 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240513224452.7b22a8a9@windsurf>
In-Reply-To: <20240512101523.35332-1-fontaine.fabrice@gmail.com>
References: <20240512101523.35332-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715633094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZQ19zOHbEISVqgf5u1KtmQle4dfEjxmNQI6U+jzGhI=;
 b=b/CJyJNfzqWHVJyA9MSahTgmvErThUZakTIpTzt1vlEjrTKOtNZEDV7lF1uqZkR12QGvXf
 Snf74YurQ4xE9KmEUBUqlm9Udq39UiGY0edEHenM/XhjZJow7OUchvltbw0KjwsSrs8zUE
 Uunjr/X8+RuIBxMfwOWKZDlguol8UkInaHwp7O4MO7s5MD1FU2o/+jk3gcXxI/XghPiukg
 f5g8mYpX59osttlTweAkf/vmJ8+KRyYckw2vVx50GdlMBFfp1jftx9j3/d5O7QaMVFz9NU
 JvuNGS5e2EYcRDLWe5T3AcSbaBn6h+XBMXH4JyX/sdgLBVNLiC0d3VHS5qeYcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b/CJyJNf
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/zlib-ng: fix riscv build with uclibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 May 2024 12:15:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following riscv build failure with uclibc-ng < 1.0.43 raised
> since bump to version 2.1.6 in commit
> 47b6737e841baf8b666ea9f37edc5f169652e88d and
> https://github.com/zlib-ng/zlib-ng/commit/6ff8b52cefe56a824fae1d53fdd687bcde2e53c9:
> 
> /home/autobuild/autobuild/instance-2/output-1/build/zlib-ng-2.1.6/arch/riscv/riscv_features.c:4:10: fatal error: sys/auxv.h: No such file or directory
>     4 | #include <sys/auxv.h>
>       |          ^~~~~~~~~~~~
> 
> Fixes: 47b6737e841baf8b666ea9f37edc5f169652e88d
>  - http://autobuild.buildroot.org/results/06a7d8e59ec4de7c711d3f4a4624f67b97d78afe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix build failure instead of disabling package

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
