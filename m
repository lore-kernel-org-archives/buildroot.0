Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C43AC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 21:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36AC6409FA;
	Tue, 16 Jul 2024 21:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PRfc_HE5-NL; Tue, 16 Jul 2024 21:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DA740C04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2DA740C04;
	Tue, 16 Jul 2024 21:26:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 554E31BF37B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F937606F1
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFy7iuECEP9u for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 21:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 249CD6066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 249CD6066E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 249CD6066E
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 21:26:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC01E60002;
 Tue, 16 Jul 2024 21:26:41 +0000 (UTC)
Date: Tue, 16 Jul 2024 23:26:40 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20240716232640.67478147@windsurf>
In-Reply-To: <20240716131908.6070-1-tianyuanhao3@163.com>
References: <20240716131908.6070-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721165202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRWlSGb87IJXdl2roM90MMDg9LW11XHtQRpOe9e55gI=;
 b=ekEmNqvdvm3vM6Sf3lPSuL5BU8n+PVBngWOdKPRgYEtWsvsKkJdmgJx4CxDVmX/+LJ8SZy
 1I+QWdtO7yS8/wSsFkxuloxwvYVs8wCmYBQZ3+ZkhZ5X9mYTlN62oQrHInW+fYEEhNyWo4
 d6z6Z6BKwmoa5R5AgAhty18pFexF3XgbG7V944l7hZ4ONOIy1Jo2naDWt+L8W5J5dYymNm
 3ecyiygeriBPHSKXUF5eZAcnnx9AR7rPGQPjWlDAMNTJuz1uUFqzjy6bWpoqGainB+RZQz
 b3xhKHQrUOSKQVKRNO38JkS8BsQI7DT63LkoWDeAv/nzKpTrOrDmfmUklhxAbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ekEmNqvd
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: bump to version 1.15
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

On Tue, 16 Jul 2024 06:19:08 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  ...ile-error-without-libseccomp-and-lib.patch | 59 -------------------
>  package/crun/crun.hash                        |  2 +-
>  package/crun/crun.mk                          |  2 +-
>  3 files changed, 2 insertions(+), 61 deletions(-)
>  delete mode 100644 package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch

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
