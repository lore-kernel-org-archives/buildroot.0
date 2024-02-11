Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B75DC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C30084F61;
	Sun, 11 Feb 2024 22:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHsrCocxtzRW; Sun, 11 Feb 2024 22:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2237884F62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2237884F62;
	Sun, 11 Feb 2024 22:10:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54DF81BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 417534167E
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPqp91UrN-Re for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11BF841591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11BF841591
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11BF841591
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:10:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 561C0240003;
 Sun, 11 Feb 2024 22:10:47 +0000 (UTC)
Date: Sun, 11 Feb 2024 23:10:46 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240211231046.27b4371b@windsurf>
In-Reply-To: <20240208140802.984184-1-buildroot@bubu1.eu>
References: <20240208140802.984184-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707689447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ew9ZF+pT69XXmfLErQzA/Gq82HigQGb5r8C+rBldzY=;
 b=EqXQr6Yy8dK2qCfZ9E4Wlk/bzcfNMrCSQovxkQhKBf1FM0m37SG5JQHAKAVRqxFa91YabE
 GdWJxEzdNaJ9UJNpAyqe5dK9edTjfz2bhgQwUQYgjKjX20N4ug6noYlGrNj+jf0oSS/hWt
 xaEkvinXCp2xs8wpoENMxdZNhe6XBLFvfN8aM9vaQZ76XMaBE3PKT9QtKS5RvtSSY3qL6k
 XYZZPVKUDt1pz4Q+KbNI5IcRIcX3srvadstwBiwChgsS0GIsuOxeujBdHg7Se+j/ozRG/e
 5q7rZcDFwzVsxTGVvs1q6pvpQR68tO8eRGeR9UIcE1v6X/X+tQC54QOJYvfZGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EqXQr6Yy
Subject: Re: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.27.0.post1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  8 Feb 2024 15:08:01 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Changelog:
> 
> https://github.com/encode/uvicorn/blob/master/CHANGELOG.md#0270post1---2024-01-29
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-uvicorn/python-uvicorn.hash | 4 ++--
>  package/python-uvicorn/python-uvicorn.mk   | 4 ++--
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
