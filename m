Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B77D5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 15:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FAD860D7B;
	Sat, 13 Dec 2025 15:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tr3HUdy-JIPD; Sat, 13 Dec 2025 15:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D79A607FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765639126;
	bh=sGlniw7YGyY2ZRpYCrSS3X8UibNph0i024GSf9yN2U4=;
	h=Date:To:In-Reply-To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Mo8ZyopyR/jI/LW4pqyn2Z5ViDLHdMtD4CASmaoTBaH3sTrHDXYJBIY25u3A6LjQx
	 zhJfabm78Rdg4dHMeJQnLHEpANuf3yp+FXpv+qw/DaSSL8TFbwr49jzu0tKr8MXoZa
	 kBZhZR2rPj2AQSjmRDy5ga5+hyf1dpWZwqhhvJsr6q5+nKqre9QFjNSTxSSBRNRBA4
	 jf3bfoAz9UKeQzjA9lXOx1agWZnHDcsrbAn116X9VDHHE9xa5nLHjg+MyDLkXEjGIr
	 q75Gb607/Nif4SEtI7tGwLcz172hWw8BOuVP74sfx/0GUSWh9kDfnke4Jurp/WvOHD
	 qGY8gzaeizavw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D79A607FF;
	Sat, 13 Dec 2025 15:18:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C98413D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9843240018
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yphb3o-vyXpm for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 15:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A15E840128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A15E840128
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A15E840128
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:18:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 63D6BC1937E;
 Sat, 13 Dec 2025 15:18:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 880BE6070C;
 Sat, 13 Dec 2025 15:18:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E3731103C8DEA; Sat, 13 Dec 2025 16:18:38 +0100 (CET)
Mime-Version: 1.0
Date: Sat, 13 Dec 2025 16:18:33 +0100
Message-Id: <DEX6TV7YTONH.2894RB8RUGLHM@bootlin.com>
To: <bernd@kuhls.net>
X-Mailer: aerc 0.21.0-0-g5549850facc2
In-Reply-To: <20251018171916.1369130-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765639120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=pzUHevEPPp43gQsHKVZ6aYc6F8AyC8UbKDYRYBjFL9Y=;
 b=iWFEd2/3qHKo3UvuEEZmReG4NIIHnPOOz2w/38veXSUZMvo7FTL4KCgzR1WzTHadCtZsb7
 m9K6GGNHPLagcoYkcPqLNAk0LhMhYKTGewVm+h6EmOitf2AEqyE8Fbl14VQLsggZYgMwlm
 jYjR1XhbbxW/Vl5DmxEhIO055rzVQHJ7Ou2AvwDF8n8x1+tP0STaG6t+nBDCVZu4AqLTNk
 GDKU266r5lIajpUNaxGlDO4mGlycjypwzy27Maeywt+S15NWdswQSS0kQ8qvmBYYyPz1BX
 Dwjzf3LUiCKE6F2S639aR4pzk21ewjqX1ovb5ZfeNg2fRfA500Yi2DJxjkeMAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iWFEd2/3
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.9
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>, Thomas
 Perale <thomas.perale@mind.be>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,
This patch should probably be applied to 2025.02 too to fix this build
error :
https://autobuild.buildroot.org/results/921/92123aa8361663796d5e27188b21fd6338b4f1df/build-end.log

It was fixed upstream in cmake with this commit :
https://gitlab.kitware.com/cmake/cmake/-/commit/c8143074cf3954b1e169904eb9d843cfbe14acc3
which was applied in CMake 3.31.9.

Regards,
Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
