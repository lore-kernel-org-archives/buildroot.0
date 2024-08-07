Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA2EC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F79F80A53;
	Wed,  7 Aug 2024 10:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yHZYEKgDIRt; Wed,  7 Aug 2024 10:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 341EB80CB1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 341EB80CB1;
	Wed,  7 Aug 2024 10:24:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4C941BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91C0C40120
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4Gd1UYw4tG8 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CCAA400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CCAA400A4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CCAA400A4
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:24:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66135C0005;
 Wed,  7 Aug 2024 10:24:40 +0000 (UTC)
Date: Wed, 7 Aug 2024 12:24:39 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240807122439.7629b94a@windsurf>
In-Reply-To: <20240807092813.113613-1-buildroot@bubu1.eu>
References: <20240807092813.113613-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723026280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mi55OLJW9nggLQwaDNDCju82AXPsdS977f2gPztFb2E=;
 b=HBpVTy4++i5NACwhRXfhJxdbEVHDRaKKKFBpyTDp+ly7r+pSqOJPHMWecpsGoYQfl/T8IX
 f6NNlq2kShso+iBUFEgkiEIYC8G0KjXe3ozxTJBzKI4NIv41ablHLFE03DSed+MKAiJfGo
 8fMUWNWwkUyY+9wYDhDsmon7/rheoM4n6XegilRwwcGXxT4v5ab7LQ4eteUqPW3B/1hYf0
 XC6tfiTMvhhTaW+218Iex22Gcp9EadX9qQMF6cK/SfR35PkAi43upf7AwUJJZ4eNDp8abI
 URO6E1h2lk4l//RC7uuH6gK8VkyLwwptYis3Zs4iSF/2vCDTg4qfENjPtqF77A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HBpVTy4+
Subject: Re: [Buildroot] [PATCH] package/python-pymodbus: bump to 3.7.0
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Aug 2024 11:28:13 +0200
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog: https://github.com/pymodbus-dev/pymodbus/releases/tag/v3.7.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-pymodbus/python-pymodbus.hash | 4 ++--
>  package/python-pymodbus/python-pymodbus.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
