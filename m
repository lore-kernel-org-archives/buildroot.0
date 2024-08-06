Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9105CC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 10:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43DD140103;
	Tue,  6 Aug 2024 10:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mwv6hi3vQSz; Tue,  6 Aug 2024 10:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FBF40116
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17FBF40116;
	Tue,  6 Aug 2024 10:17:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E89B81BF288
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D64B560812
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BVISX01yYJie for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 10:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D976B60811
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D976B60811
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D976B60811
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 10:17:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E539920005;
 Tue,  6 Aug 2024 10:17:02 +0000 (UTC)
Date: Tue, 6 Aug 2024 12:17:02 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240806121702.67b95706@windsurf>
In-Reply-To: <20240805223946.116873-1-aperez@igalia.com>
References: <20240805223946.116873-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722939423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmPS32cI/pwlAtf6Tci+Ld8LeoLBSB5uEFCdbnMjKXg=;
 b=IdB9owJGnOu0HLKEbZz4CoupGIZ4JH3mzvSKxak2c2Vy8OR5S2wZwOX1Qm0cOUfuUhdBWT
 c17Ip1l1SGf/ktmoLCMnMHQw8UbrNOwpnjEItn5quGCcRDVADb7/GzEBjGF315uV6gD2kM
 7rvOBsTlmhgQqZ6gOtO3JWAcO4IaeA1qPJsQWYdv3rgETTyNcOiGK5hLj3ER5pYC+UnPl9
 bjjjvfT7/fue1idcXK4nv8tn+raYoAxNwyzl0WSqmheKiJdRnQjpu3WqQS4rAVPmhPx80X
 EjcHmIDKwdicVuwLPIlkUvOlI6ZdA9GGAbr6APFmmF/uEWo4oVWyLmtI5skIPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IdB9owJG
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: assign Adrian Perez for
 sysprof
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

On Tue,  6 Aug 2024 01:39:44 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
