Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A72CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF7D60DCD;
	Sat,  3 Oct 2026 01:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQlI8Gp942hN; Sat,  3 Oct 2026 01:33:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EE11160648
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991214;
	b=Q/W9wd42MGo2jDPrEd+0n39fm5O5fn4VJvfmqzlVKCd53bIfSaDS9MwqzsjmT6WmHNIU
	 n4rLF0u/fRtcgld3amj7zGcKc6qKfL2vgDnlujeLxGlzJAyYvAf/lgGF5C7t4v2IEMBD7
	 zPKW64xyiugTU13UmX1ilD86yzNjD3LBy9yMEjNol/HhXryxmfy4uZDAEfHIGL41zZHDA
	 cxc3OoWUFcItwgMKMlD1ALesXVVFF5cxc735E9lbb+XqGmyRMSHh/t4+HnWVlWYFTEztJ
	 x+5kfPrslV6EW1E3h/N5Uzs0GefWiKpP52qc/U05yNSO8AyT9P5fDVyKHnGvmAnEzdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991214;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6vQX1lCvuCyTV1oDt96ypEFSkieIbAd7OMdij7y56pQ=;
	b=OGFsU16Egb5OiUP3ig/9Z/XGtgLfEMmYG19pqEhTv4weia1uoNwK93kpQycSH4u0s0aS
	 NVo5B8MCxCUsMGsvafldyDIE8Ac7YYkwCeXilO+tVzu9pxUqyXM25lSh7U0cFp+w7YGzq
	 i6ne+OaeOkskj+kN+zpeADMswKpRD7UIRGfny1aMPoKxyIel8hM5ujvfJDz4DbwSKQovG
	 DwtNsYzWL20BMZGBnwJCRE1JtEya7g0g757jv3+yrwCh2asnNuaDmpgnwUQ2/u4ypF2gJ
	 Fpf5hqSVvwc1BDn3SczvWDNg4nL3AZVewWaTxyWSQSwa+qydvEg6x6icsIIr+JUTLMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B56VXRR1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991214;
	bh=6vQX1lCvuCyTV1oDt96ypEFSkieIbAd7OMdij7y56pQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oRIjrujuaAO32qmhaW+RfoZz5Ag1+TCzI0KpTUDhPPfK2PHoy0z+KvSgsg9TnIhUy
	 Ir1oMp2i/I4fuDc69GXKs9qWb/ychdfaXWI/cSiRWTiauWAgXdBxvfBf8935Qpn1Gr
	 SpO/RHcDFDJbFTqPWdofJJHq41eiNQf7UC2rcyDKpIYGThDCJFLArlL7vv+nvtm/ob
	 Gx55ba2OuAArIanxI28ft8CZ9NAIOeTdX8Vz9D1Dv9Qd4h/aOsZDQT8GsRUSlCunTS
	 VMsx+rHuZdSiwtw1SSqpyG7JuBz/bR2m2NK03j1WJILItKQkZYzKsD7KGcueNUTZvV
	 MDd8SdeHhY7Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE11160648;
	Sat,  3 Oct 2026 01:33:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E5BA435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F3866065F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukBXFemR0-lG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1956160DA3
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991211;
 b=rW76D7mPE3F0bb2ZNwTinzDoVcQQ7QQFJh12Thb7fxLuwk9DkePOWM84S0qCShSu/NQZ
 5KOKWCjS/Q7QEDBRJTuNdiiNcvbjmtPLwlKfZ3ZA9RAQ65oUgtS4iXxRgvw/PNhf6owpT
 ow1Xz5AGPXUPf1y090ApSm5fuwMBZYxp+Zh4cL0iQNmibZGfAGIMZaitDn0/46/mIg6wV
 qP1V7aPP8ZZorBbh0UIno3Uk6e2Xl2sqN5jGlxA7DFWL0NX1GS9D9cCta+VBceSLl56Z7
 4dw6siVfMAPNOzsP8cTSHq0FYg6nE4cgjmIIYTmO7QA65/7nQhY9/IOlwCkRuL7nlbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991211;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=MEGu/ybJLyedN+Zq952nEV2hFv5xn42bW/0WpcyJEV0=;
 b=ZQr2dWnSxJJnlAhI9psRk3n+EdNruXehIv6iJptUT/K7hDRTMUfy147cpUzG42E9n2J4
 IsZugvi989kob8z97rxTkBvDPV63k3/gII9IfEp8/099D3jcr/6eu9JO/Y7WpqLriXpjx
 PucR+kNefT9gBC7o2oleTuALj7RC1m58l+siNnH8peVdrv+vsBgQZrhDerl4sdQ0PvH6f
 KUp2pHxA0K1mlupniNfK1r2oc+0isxBn1HL9H8TC2U+ZoK4F/7fhtr4ikuYiPL8B/i09m
 26x4iVaDv/LgSiml36Z8MPJMjXOpdXHdAgJJbtzkDXOSLqxiH4g5wS07DNJtb9xQYQg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=B56VXRR1; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=B56VXRR1
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1956160DA3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:30 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-81eaf8e18bdso352016a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991210; x=1791596010; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=MEGu/ybJLyedN+Zq952nEV2hFv5xn42bW/0WpcyJEV0=;
 b=B56VXRR1X/CvUcGetdQpXVSVqkYHGESqKrhZgJ8lxQRqZ0JIN/m+WCTG9c8p6gOZGM
 a2Gab9K4fmCPqtQw5Aq6dYrU3gaucC/9s4UgOeSLPGdNB0z0SKcVcJ5wKUspaMJf/ZWr
 T9VA12NhI99KjaoI3A8WyQTN2hzvG7OM8PtBkEfpjO52WISAgugkoAVTovZR8DG7sXWc
 HqyZ8HT6UCxgszySTBPD/Q98qw4l/KVNi4HRDY23zNNXuyudPaL/yE2VjQ0R+E3g+exg
 l5jHo0GAblr8m70JeJ1rGG1b3NvEi2//puDr8ezAIzGukC8rsIQLUMPpUgfjOl301Zzo
 TqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991210; x=1791596010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MEGu/ybJLyedN+Zq952nEV2hFv5xn42bW/0WpcyJEV0=;
 b=Hw2lZ/D2ti1Md/7icOjAYCW6Lpnnqy/AWAOScXAK0NqKs9gjLpVY5voZ2AT/W8HH2n
 oNxkV5EUqiI97FuhC8xczK6YcMUrgqFfiJPv598hR+1WwMG5ezEYxLePuo9FT1P5tWWu
 Gkczdxe/Xrsjj4WEahwxpbnOlLp4KVj6e+bxq7EjcmsZgNqKf28gk1pKaxa+JHlpS2P9
 /S1hPz9gZ/+ORXW+6P7TK/O5Pru4iBbx/QpOhvhDESMCzc1JvyCJkyeqk+C+2foQ9pbH
 ExA+Sf6uTHgJztJNgI3EBJiHIbhh3UIRJIOR4sqgyXW8rSWrWpTs66yR1SsOQkPlyx/m
 AhqQ==
X-Gm-Message-State: AFuF++nPMNeXHuf3QsIAxORtf2cQItL3xwAPyYCD5h1mj04zMvfrX+FI
 h0foaoDuEB8+Ntkw/So3Bgp2dARdWJ69AYvJNVUpH8Cfw1J5WMQChHv4PYOt3w==
X-Gm-Gg: AYBFou0+VxcQsWBj8mh1LLVnpd2VKvTOjOtvB3IQlNdi4z0jI75awc4UJK0OmfjIVHL
 GkO8jC10PC/EQFyKUI+203a0WjRhutftldaV+INbV/d9t4Zg1Sa66qqP+ff1Fq0QLAm7Sjank9q
 HrHnfv1g2EfzBfniDHihtT5sTXdmG/5RSgTb8uN/l6n01z5iMe4UZZ9Q0F6pk3IByd+hE0DTS+p
 mMFrXu84mgpHeWvg24QXvzi+p7aEditd3cPhfRzelLqUAWIUfZSVJChtc8S6iIcCmoOJQqAC2NO
 m6cz4av7wtEBL+7A5UCsl15ygJGCW20y1WvQqy/ycFd6jBgTgCzCA1vt6pzutdDesugOGO/iXs/
 TLb8q/zJREfTRWbO13WgNKkQGRtFfhAHySpJO14tVtWuznFfWK65SjpjknUm8g9uHa6Hpk8giCH
 nGAO7bLknQIDE3Bfe6Se1NdtFTLJThPTIkYZsGdz2qeE45iLHRWcXzqsnOO5efyfPOtkPbUihPi
 wZZWJgsGlvYUVO3NxraGBBL5yOuulTfBKuNQtnloxPKCTYuZGtV3S6sQZFHBLfj1dibqSH94fQB
 2302cLUumokcMbKC2ZZJk2WqpK36DrzgUkjnpN63iuQD9D4NDVRxWKIfXP5ZMRQRQQwTSw+0rgw
 uBH3oy7apt1Io41y80QGYZvqtH+dO/YwuKkaRFaBPzA==
X-Received: by 2002:a05:6830:2310:b0:7f6:4f6f:1a2 with SMTP id
 46e09a7af769-823fc535363mr1384070a34.5.1790991209790; 
 Fri, 02 Oct 2026 18:33:29 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:15 -0600
Message-ID: <20261003013304.400979-15-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to version
 2.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 9ea47dea69..be39876d65 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  75622eedc30fc131eb3947630aa622e6  poetry_core-2.3.2.tar.gz
-sha256  20cb71be27b774628da9f384effd9183dfceb53bcef84063248a8672aa47031f  poetry_core-2.3.2.tar.gz
+md5  ad4701fd3a73d43eb761131b5916f66d  poetry_core-2.5.0.tar.gz
+sha256  81d04c9253b19d0604718268d781867c8f7b2128e5b25bbf1e84141eec6b89c4  poetry_core-2.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index a8db44e24d..03cac41c42 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.3.2
+PYTHON_POETRY_CORE_VERSION = 2.5.0
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/10/48/5b4f344c252ee2f75051b6bf7dfb68ab53aa00a107f5f8e5cbf795701dad
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/42/b5/50f1fda26c4fe5b1d6ce5cdf0391bdfa1ca12fdcb8ad68344d5cf678fc90
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
