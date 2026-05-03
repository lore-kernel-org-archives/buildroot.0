Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9BBFF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 16:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 235916104D;
	Sun,  3 May 2026 16:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OD9_1jO66tO; Sun,  3 May 2026 16:02:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ABFD61062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777824122;
	bh=iZ/xkbpdnmHmjjZsNyZXDw/J5qVtGQCnOZf/eO/vxRM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NYPKNcviKcIOGaQ/IHOowS0FSJjIvRx0xWOGtCSJdfYefMadzBCcNQrNBF5JRHx4F
	 J2bogK5ZR9vCBL6AuThgk6DjlaegdSuuVqls/za92oBccVa/sZ956hUMrCC9d8coi+
	 M8vlMIP5vjbqnlUvjVNlo0hi6vzf6Z+CZJYY9IJ7+4G7kae1sxwNdvfVuZfAwr0fH8
	 5YHXrSJlpLpG6ognNjJIg0RjnFEAPAaG10mMQmJV5dIbJGH0nO3PADKw1FiM1c7eqp
	 ifpZF9V9PTF/Yt6lQNzZEEyb1IJ2wc226KMKJ29CzYLYi2ppgoHTlKN2wXe2LPBim/
	 t4u1ScUk2J8Fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ABFD61062;
	Sun,  3 May 2026 16:02:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DDD7204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7411241579
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUNbLNnOZb_O for <buildroot@buildroot.org>;
 Sun,  3 May 2026 16:01:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BB3C41577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB3C41577
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BB3C41577
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:01:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3A961B00583;
 Sun,  3 May 2026 18:01:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 18:01:54 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 18:01:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260503060906.600090-1-bernd@kuhls.net>
References: <20260503060906.600090-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <2d9137ee4cf00e3a60cab2b96db144c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777824115;
 bh=Y7qE/iOhibGC3En/Nu69ha/FPAj4l80CY6c/OQbe4jA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hkmo8zfS74muNhVhyHFNiS3XdchAjXiZKlH0xqAqhvxC2dVUXJIXppZ3Zq0IbB6cN
 XZkJd8v2o2gZUbXUxip9zYjzxC0/QLHhExphppZnJDB3ED7ALTKPZbFhKq2DSoyIAO
 CO65ayuF+iK1/HX7FDJ9ycG4clfAswY4y16Uyy0VAaLm4+fJi32P2YvmzeobpTELwX
 zPw5GajTFQrVEzPOCYXhBaFayNj+y41LmH8IKd9GnyowxWCCmWP5YjMArE5J2KCLdi
 faJvgBke+/+rCyDTuDalt6MeGAPzgnO29jcCGrlHaKSnKKevAgoOuWG/XJzqABiSGv
 23Cm/JojgV6Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Hkmo8zfS
Subject: Re: [Buildroot] [PATCH 1/1] package/libsodium: security bump
 version to 1.0.22
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/05/2026 08:09, Bernd Kuhls wrote:
> https://github.com/jedisct1/libsodium/releases/tag/1.0.22-RELEASE
> https://github.com/jedisct1/libsodium/releases/tag/1.0.21-RELEASE
> 
> Updated license hash due to copyright year bump:
> https://github.com/jedisct1/libsodium/commit/80c6bab4518aecd197d830c145b5d23e9b932ea3
> 
> Switched to bz2 tarball provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
