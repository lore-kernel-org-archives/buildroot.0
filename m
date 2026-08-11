Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80299C5CFCF
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 14:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BAB9407E6;
	Tue, 11 Aug 2026 14:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzRlnW8-EIIC; Tue, 11 Aug 2026 14:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFE4407E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786458727;
	bh=09jkwKqKcZpLz2ttRlDJBzUslmOiO3boRvIRtG/2tGg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=f3AxBnzE31lsMPUEv0mwf+VPmRojZH55SkPoe0+TV2vh3IsT2F0RBw+13Lpkc2/d6
	 f4Lr+xq5rhW/SxMiQ60knx3RaMuRFokiJJSchnc/mbgW86r3ECvQATAS8fYd+LEl3u
	 DVVrelCQjYPxbG1BrIvK4J44a2C+1NFcIknW8PE/yzRPBgAZTmoNp47Y4Y3wYQttpB
	 8oo5tW6plnJLxEyoXDfLriSUCcbbu5g/l+wkkFSY8PVhysBjZNhRE9fQdPvc5AaOgz
	 tWOcRtcyXiKG13hwSYuE3w2xr+XVqJZfFd/nMw8GaGUo0N2p4InYBe2/LQoB9VDSkV
	 WCbs/rMqz+Tng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFE4407E3;
	Tue, 11 Aug 2026 14:32:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A21296
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03883810A3
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5pUJPgJgl0P for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 14:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07DFB80F5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DFB80F5C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07DFB80F5C
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 14:32:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47f904e80eeso2463124f8f.1
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 07:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458722; x=1787063522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jlCqs9APDAAB0cI5qsTTVMz4PqxfHfjWqUsmU1sxJAs=;
 b=Vbrz2VhPxWS8yUNZN2sZ2zISFqSAgzoKEPGPMsIJNNTwu8XrPP1CnlzQWX4WXmlDL7
 0h6TS3zmnuip7hWwtaZNDQSEccqBFkF0rgkD3L+zlaQbr2ErDLxmUf3xvduaDEDcfK2P
 eG1Od81E4MD5rpbx0v4AOu4gMdNkAMwYve+/jrck8OPmTjcq08/Y/8mvRjc54uNkpNkg
 QaKYBrZd8p8EvJ4mR4kWfe1AFIaQfOQvjc4LTiKO18zoqOM99YULjSZggEPxPBlIqB5K
 7KiFN2+kPaNgxr8HgtDzZ/Zq7vy7ltGGNstFIJzcKVBkvM9MGAJZmePFEVziZCDnmQaq
 DFTA==
X-Gm-Message-State: AOJu0YzZMjbQMzjrRplqC4mSmn/jlsb2W31xKgJppxQrI3OZjUylhiQs
 6j1RG76UR4+ca0Z5VCXpSCIJ/6cKqNnYlMVD4gI/0HD8hJCqx6dO+NkAi5MG3hxrnIOUoeH3gAB
 /UhNq
X-Gm-Gg: AR+sD13YVG8wdRmx8FWWfbSw8gZJ7oKh0BnsqRBqbAjzbaXlQWqYyFyDE2X7tGY/wPJ
 YH04PQQiel9PEBHpPE5mciQKl0o2qVQ8mtnXXlIM1h/h9+Ecq4w79UEm2queaVZzwSZpjpEz5Kz
 o/i3rFst8MGv3ZfQz1OFW9f4DuNoWZSlah14pQJ8F1mO2H6Wb+T2kZsdQ6P20sAV3Ik4zwhG5LR
 C+KV7ecRB0XPn460QWpl+JVk9/QVw2IjB3x0fG5MmjG0U9tiRmEM2z5bzrxLsCRXChX3XQ4B8ql
 xjC8KM+PvbIqvHt1Pu6owom0h4K8wXS87zLISbqjonG/aRBD3IARTE4gkgKIkCmLTpMuMch1uvC
 WqhI4VeMJAoeiYz3FA2JaddLMONdOlNorRdxHxkqiV7kuir21F9apL3SFUGBwfaHaKBggaEQt9t
 cjQQGz80lMlr6qx2a1Sl+ZJcOMj6Zgo66ydHD3t/nAkaw6+MX2bSPbAOXyY2H0i1rIscftQr/6S
 CQV/Wa4rgo/5siZbzaOJ7rQtSgLEEYJrg0dKfGcMr4=
X-Received: by 2002:a5d:424e:0:b0:47f:fa17:ae0e with SMTP id
 ffacd0b85a97d-4814fd34592mr1215658f8f.11.1786458722357; 
 Tue, 11 Aug 2026 07:32:02 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4814a7095a0sm4835199f8f.17.2026.08.11.07.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 07:32:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
Date: Tue, 11 Aug 2026 16:31:59 +0200
Message-ID: <20260811143200.276275-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786458722; x=1787063522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jlCqs9APDAAB0cI5qsTTVMz4PqxfHfjWqUsmU1sxJAs=;
 b=a+A6CupCz6U7nuTKFJ2E8RB6EbRwORYiWaS+ZPcwt+tGovUqLsD9RGEB4zM0uVuy62
 XVVMERPYc7RnFWu3WEkK8hrX/aov8m4dZ4JgVBXMLF25yuve9YYMpV2oJ1sgdSfqBvLD
 APS4HyQn3yY3PORy76CA0H0QtssKcdruGfQTdrpUmiFn3Es22udQl7OWF1oxsSfZobJP
 x3vSm10Z3TZp4KZIugmypK8inpLXbGLpBkabs0VV2amgFDQ1upeu9E+EFniBnXHaxMT0
 D8yOzVjSYdKNW2uC9FD49ZSO5dOBlSr3KW6r7KzdVVKF6WcoiAkviTpxi1ukyKWF0WeQ
 Ku1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a+A6CupC
Subject: [Buildroot] [PATCH 1/2] package/redis: switch download site to https
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7829aa6143..0105f2b77c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 REDIS_VERSION = 8.8.1
-REDIS_SITE = http://download.redis.io/releases
+REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
 	MIT and BSD family licenses (Bundled components)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
