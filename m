Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4305C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70824605F8;
	Sun, 21 Jul 2024 16:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8R2dlUQfxrP; Sun, 21 Jul 2024 16:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D396066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80D396066B;
	Sun, 21 Jul 2024 16:20:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 269791BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 899C04039F
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKRD2-xeBDVo for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14FF7401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14FF7401CA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14FF7401CA
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:20:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D1C8FF802;
 Sun, 21 Jul 2024 16:20:35 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:20:34 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721182034.525452fc@windsurf>
In-Reply-To: <20240720211841.1728725-1-fontaine.fabrice@gmail.com>
References: <20240720211841.1728725-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721578835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCluFtwdUILOWTgXjfBVBuduP8W+ILvopcLEpGhmpgA=;
 b=QjN9IBzKLtVmel5NeMmFy3cRrzUxqK9U+I0nwtQQqEhDMqsGj+hdqa7BwvzEwQBPof8oby
 VtlQPT1HGjlBvXfiCMC6Qaas6eoCoxyA0YIWmWs87GAkFlB75UT79uv7JL05a1XckEAZd/
 w8HdzSj84tRIVpZLUpGITkxN8aG6DAM+FkhLfM15xUjlZsOUnMc8vu80f4aJdsdIzAN6SQ
 nCowUrz8xHXNEDPY5WrGb5/xDr1j5JWUUBnGCf4a3JURmVjQovzPFMEP0npYiKJ7hpiJOm
 hwupeZj4SObOLHeOKN+pAv1IzRAh5Uvk/raZUpUD6EF1J249Wpy/8AOMC0yTxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QjN9IBzK
Subject: Re: [Buildroot] [PATCH 1/1] package/flashrom: bump to version
 1.4.0-rc2
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

On Sat, 20 Jul 2024 23:18:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - This bump will fix the following static build failure raised
>   since switch to meson-package in commit
>   37dded43ae681e8319d7b76f9a612c71991467a9 thanks to
>   https://github.com/flashrom/flashrom/commit/67ca4a71c477320d4b726acd152b7536344e227f
>   (which doesn't apply cleanly above version 1.3.0):
> 
>   ld (ld-elf2flt): -shared used without passing a shared library ID
> 
> - With above patch, classic_cli can't be built without a static library
>   (i.e. with BR2_SHARED_LIBS)
> 
> Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
>  - http://autobuild.buildroot.org/results/ee61dc30056b6c3335d64054c875bfb40526033d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...et_enable.c-Drop-_LARGEFILE64_SOURCE.patch | 38 -------------------
>  package/flashrom/flashrom.hash                |  5 +--
>  package/flashrom/flashrom.mk                  | 12 ++++--
>  3 files changed, 10 insertions(+), 45 deletions(-)
>  delete mode 100644 package/flashrom/0001-chipset_enable.c-Drop-_LARGEFILE64_SOURCE.patch

Not super nice to bump to a -rc version, but fair enough. Hopefully
they will release 1.4.0 soon.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
