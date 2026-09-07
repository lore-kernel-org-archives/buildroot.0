Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B3FC79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 18:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96A61606A6;
	Mon,  7 Sep 2026 18:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVG_f_QvAoDv; Mon,  7 Sep 2026 18:43:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CE97060675
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788806624;
	b=As168SUrH17F+ojEanGD+5aSPPvaXyTOWrWL2elQnqYVZwcS+kye3pyK1CN+03RIX77b
	 SeLYO7LLi0uGQXMnMXNAbn/xJIklx495q548s2OSEpsNYszVzhdx4kk1zz7fc59MRX8DP
	 9sktdEzVtIdq4zybDBlyZF933xxVnAtmDvNVoXqzUBad03eqk6RwNkgVioO1dxSzPxWOS
	 SdMPEegXAqIDz7Xttd7Ab7QNckwmvb3DKpw6eiFAPp2PIvuxZsVFvuqpLX6u3YfB6tPvh
	 8EWa8yNKWAdmIqvx5vQc2PY4KXeejDzqH7vxAkoRuAi+jX0QuHCeG7fIqWtcQ+xPv/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788806624;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Rufd3CRuBCZG7K62AXYM8XuVfKlvMvD+kkfzZbRPTlE=;
	b=VyeA7SkcG/XN0KqsgK+O6kWPkvQtnXxrKrpZgPC54O4aZBQiGhE9mnN/RJ9jEK+9e4Kd
	 JOxYG/vbtd6+EAR6M0e2yaibEQ53hU4tC+ElulssxSyWdV7nDSa6fKOISjUbibEn9rB3q
	 9ev/vU6A4QnKGRiXVpOe/xFblv6o46Q5AxgmSZokKvQXA750vgrn3XaodGidmrPorFMd5
	 ywa1R1XDlDaEBb0Bs2RM+222MpHPnrQvhfpOetCL+VMd2TYTzSA0GGZw/F6oqjDCuZNN6
	 xHgFlOyjgcHTHF0V3SlWdwm2YfOSy0Xs93BbOY5PzyUEP4XsIGflmo25LXmyM4fgaRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=swZf04hQ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788806624;
	bh=Rufd3CRuBCZG7K62AXYM8XuVfKlvMvD+kkfzZbRPTlE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rLX8G9OXGJmf8eNYav/Wogl3nF7Jh4IOesLsE5vyPBzViJoeU3t+KoPHLpoHgDur9
	 nS8B4ZC63hBzMt5lLX/bpTJRlubN+q9VbSK3oFOXnDGc7dENsAjuL7CUdrJWQCkOf3
	 /74YiUpOYM5tPmfTqb3VPjTCqlXaYRroAtqTLEiCxAt4epC9PduHvPJHDg6ZMwjJZk
	 qf0Z8S7kFrp+FHxRoX4QkEY3LoGE3i43fbtFKx/i7BxoRkMpW2EEoeR+wcYpBxceSJ
	 mpOYVcaBG88skp9Y1h19ZOrhCTsuL5P3XDOxFLYV9cWe2uJCKbt38D3MjsPUdwgG/R
	 qneyBN60IIQ/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE97060675;
	Mon,  7 Sep 2026 18:43:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E88759CF
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA9256066D
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfkVV2loJHb8 for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 18:43:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BACDB60662
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788806623;
 b=sB/L4wIrgw11ZqgFzvM2rFGIZv5hux3Tr3vrWUT8HV0RjrgW1LrU4mprqnbLybEKKxNy
 tpuPYQpRaZdatS9f5Y+dm7+b3FpOZN+xE0mETdnV9ifc1tqmRKHDnJo5PB0HDYtWToMbj
 luCoG22iWEaQVn8XnzOkyRdnAOqYMLr0DsdBWU5XNG7+YQYGsMXSGGuAfB4a1ContT/RC
 0ot6NvNCqbtfflCVojr1SxNjovguiaC5zV+gLlzzOjaHbueMVqmu7MpzR0ZgS5Vlapono
 UOdPQ7pxKXny+aKXKiRgHgzs8u+GtufCfwvKzJ+S2IGmz8xvhfDJW2JKTsoT/7F2NLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788806623;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=MPJDPnYILSYlsOLd9lD7n7F77V56nnhmNO1jkmuPoLo=;
 b=Kddz0+9Ikv32EHx4kSuYPH38CB4hwl0+s90AycZ+U7sKDuHROI8ENrP175L8JVWV6Bqe
 FHbjJYGebjb0kkfujyRaY+53n2t/9UafO4J1pcAn1qS58z1z73c7jqCQ/fjaAOcrp41Ob
 b9yiCnf4A9Tmzvi4M54hx4sUYZlVuRJGbG+kOLweSmk3H08NmfJ9mknrvy3WEDmMYCiIq
 jwqK1ttWPjX+kjh3/qbZ9QiR87/jZG8UvABeZlinmWHXBP59U0jkKx4X+CUpGvzuGg0cM
 uhFUsRmsBYDcgjM9ee8TLdGCEhe4I+juMHinWIgDq8PrGWTPkEthSeShoRWwGrh8kFA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=swZf04hQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=swZf04hQ
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BACDB60662
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:43:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so3060680f8f.2
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 11:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788806619; x=1789411419; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MPJDPnYILSYlsOLd9lD7n7F77V56nnhmNO1jkmuPoLo=;
 b=swZf04hQ9ZT2zRXuEMMyu8ho+YfWZ+6Alu/hpRcc5ZMYsk6mOSAiHUOivoymreRY84
 dW/mn9lba9Xh2D19GV9/U9iVDAdvZpBQGU5VyYg6ZTY7Ao3VpzZoTTl7iD1amyqe8Vcc
 DL6Ni3OexSSPL+NowDLYVVJj7POC4CB5mouaNa9Sp91FDhfgfc/2sgxXwJ1MCH9+svuH
 hRoKbnlCUCmIv5KGayNtzHg3n7lk06ggyd8/adZUBH6cL4JDikHZUrVrvS3D1fME4d4E
 Og39zd3rqfbhGYCKxOt3spzvRasDudfF9RgUPIqgESkMx0Q22SUWOVrXIJBYcj4vSHIv
 S0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788806619; x=1789411419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MPJDPnYILSYlsOLd9lD7n7F77V56nnhmNO1jkmuPoLo=;
 b=ZygdLgbZIYLshDd4kCoretgiwkS07C2DCBRTDgTj+WHGxQ22J+MpIEO5bLx2sLKKH8
 OFNS576IpNrsSsVDm0ZVzH1T7EH1WgcvVZhdRJKXhpLd/2lu2N5O2GoL7g4atl8jSzmi
 c5o8CTWWVevTfCf6lvGOSFE63KpIwTuG7j1BrdTOGVMAxRH9R6TqBcqGZUABoRyePGmP
 9X2XKiXss0Po6qfLEkAroYTw0r1nR4YbZvnNP/t7y+kS+lx+c0bSK1BEXrCx7klBWTuR
 7MpbeeuyIWQGzNpOYiNDpU/aBiT6KXyt/lSn37VIHm9ItYoNorz2zW1863t2jeuYLe7h
 tfyw==
X-Gm-Message-State: AFuF++nhcuqaE4Xcdz6IAVDwEzti/XcFyJ8dRmpQwNSHw4692UHFDOrs
 /fqpl+rujDYBJtD0JBdbLOTHooYtJp6B4ae5rJNdFzfQf2SeLZyPYmoblXb0Ma4=
X-Gm-Gg: AYBFou1XuAgMduYc5Oswph3ohX2WivuQBzjOCFGnjYRKyjJT7YTuQ6GFZt92s9zvYJw
 u3zBOQbKmZ61eyKzlf/STQBqG4useUihhL5mRvt5loaYg4h/kEWfUIdYevUcfoBLmD73jlA5qox
 fe22QGuColv/lBHbgBARp91brqynsB0rchWS1va05BvvgZAMabikgQMLb7OVTb7X71H7nAehpb2
 G2ZpPFp/lSkx2gQNdwBQqNzv5rQfmx1XxY63j8LSoSphwwRVcHN85IG9wsUKnDslZ30kUBatuai
 aEFGetKhmXKWHE6pAskqLcM5XK54Sn27KOgc7po2QS/+UvVSQ4olZGOBsXUAkg5i7Z9jrlm5pCN
 LwG9FP3Y2XmAZw7omvTQF8Im2HbqnNq7bggtEKR6wxL8mHf+gKo5qX3vQV9gCLZPVkQ5UPKwJKI
 rIQA0htgF+lZqJc196RVGs68yp01yht2+t8L+9xCGpiDyLchCk53jOe3FjT35k2hjrz/GZ8rTHf
 orfLGTvFnw0Ng==
X-Received: by 2002:a05:6000:4a16:b0:485:8c16:a361 with SMTP id
 ffacd0b85a97d-4858c16a757mr21449282f8f.57.1788806619049; 
 Mon, 07 Sep 2026 11:43:39 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858d312ca0sm30725482f8f.4.2026.09.07.11.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 11:43:38 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon,  7 Sep 2026 20:43:16 +0200
Message-ID: <20260907184335.667975-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.60.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/Canop/broot/blob/v1.60.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index a6d767c769..d883337d9d 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  5a0ac9419b66b7a7763c4ec0e53394b38e87b2cc11958aa6d352e6b4c74020a0  broot-1.59.0-cargo6.tar.gz
+sha256  c7ff621324c799976d52becd7d0c24aad6f991b10421303884065305d4c00a1a  broot-1.60.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 2f1648fb6f..c4cdce2e51 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.59.0
+BROOT_VERSION = 1.60.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
