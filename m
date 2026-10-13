Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD08ECC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CCE80EE3;
	Tue, 13 Oct 2026 16:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzjcpJst9bVe; Tue, 13 Oct 2026 16:43:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8296E80ED9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909834;
	b=sGptXXYcSVAetJL8xYyARrDTetpeaghDhIN6wUfbL4McxF5qC1deMSK98hwbgQUHCc4t
	 wN97ZEe7nwNjq26GXKkqbbxnIvlBTkPQPtVXL2SugGUzw5HXOtIemyT3XVeXb5kxONVto
	 Soo43qIUh4nbYExlgbk/TUSHMrv/GoOYPfVnawhXJXO1WE2jFcRj8sfwslHsK1x8ifoM1
	 bU8hMquKA8DFb6JGdY1apxwbzRnA7C1K+X2gu104CUiN08yfhKBkBGDr7t2fmkTuL4T0T
	 czhaGroGqYI1GwgKmOs9LTISWgH2hL5RtyIwMGoSGyGfDBQ5ven02k1xg334qG0k/ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+clQj1BiuLIv87oQG55CTaFYhRgk6V+DVGDHLyZtZ0c=;
	b=ryjo6NZ5f7ZueuW/IuDOnuVx0Tj0dO8d2g0N4RToA62CXoaVNB6vxJCNZ3YaGdEg7B+8
	 NnO1GJShQUKfIWhA6eitWCqAqSEB836Ok44Hp0K/0zv8lCFSYt4PilJUIE9kko66x0wNU
	 aZpcVLg2n9c92Sf6gOLA3TnGxENJS32HdTTayOflkRgjUGdY3OCfo+hne04i8uwAN/jBB
	 IMMDC8tdG22sUEA8rjrTkM1iN03dprgNJG66hX11a7vqL/21iWZDTWwhDJBB/t99arIMg
	 H96A1i8be8qUi/JRDy42aDny90uZXUHbn90YoCtvzK31h3wL5qy7fh6BgkjekcKk3vQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HZEk+xlF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909834;
	bh=+clQj1BiuLIv87oQG55CTaFYhRgk6V+DVGDHLyZtZ0c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=aa6KZMZuD7rZ3lHZjVFgCTdRI6TUyrDe4PxO22EzNN2Xbkn7NX1rEkn53i7dSbYHj
	 mfFXBghymQljlrqdEz6B2+AAtqpiqXtfEWV1gppHNsF7IZQVOoKI8Q3hTxrRjnzQKk
	 6BDe97cxnonH+AuUqHOV9iHpQKfE6A8CA5ZI5va+u5WTbX++voBgJWvEUESDB9fsCl
	 8q5QBJzi7jlklVUqB93Gafe22xO9A8BBvORKL71/eewK6UUSgJtObfzT1kJ8am4ti0
	 Gl1d02xBNDAjyh7ljEeB2Qh/7wN/vFRlo0opX7UkWv3tbVDYrfuzYoZjnlrfCuF8Z0
	 cBbVr/zog3PIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8296E80ED9;
	Tue, 13 Oct 2026 16:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D11251DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B555080E7B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56kadgQHpgiP for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5D9C480E55
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909826;
 b=mb/dnbFEOkHakmGQY5OhIKe9PURCtMZxavQz1n5/QsN77x0q/7PXSVWiwsVsWIEj+Xz/
 69Ho1GtaEfFZfFzcNeuYCRXxT+7SB2+9/L8qZnp3KbZu7xrbRpnIRwOxqtAIhAWAKaJQG
 gfGYakqZEzc5po46tlw3o4Ua6zlZIMD/C7RCs0X+KjQ3pXBs+kBjyysfyEuSb0BHtuWVk
 yPFMxsg7PYbvz4HnDXqjfzkrWCU+IKJqzAncIcKtxcobC6kAciCPR8K4UwkfBLTuwgwcS
 ypHjMPQhEG+1ucuHhm87KFBN/KE+wBHxxtX9HnKQRT0KV8TwJlpHq+nXdCWpR3RhOCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909826;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=r8hsx1O89y4yVilKdriS2YB1IHULbw73FUxREdWSo+k=;
 b=HjAWCCbFnHR0YUkgX5U1g1aSxUJ4+wxDeIoIWjsXpscUY2zvVPVx16WO1o42t9638sU4
 Rtp/T2MuIKYoprO5asHFPJJkdP6gvKoB9kUHYBqvOAVSc/fpLkf25g3Z1iBsQdMGLvtZS
 rNLs3x8TGIKEyiHqGCiw324JwXTahNMYpL0giRZ4YmXBFUMuv9zACQezR6asrrkJTDAiY
 7TpViZShlc70r/mopDc+JrsrokoHeNz2jSgzqZXC58rlUVEtxQjszqAr/xhXu1AnV0ujI
 BfXRzLyDTP2mm1G7xKE1kR1jke2j3tVwNW6UUCeyCDQ0jD3cSZpTSph5pUMr41N6Mug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HZEk+xlF; 
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HZEk+xlF
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D9C480E55
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:46 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-49429181ce9so1855472fac.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909825; x=1792514625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=r8hsx1O89y4yVilKdriS2YB1IHULbw73FUxREdWSo+k=;
 b=HZEk+xlF8Hkc7HQljfQTvh25kxFZO1y+2nSkqipE8bW7e9dYLyL1mlKnzuTmeaOTWk
 mGZhFnjS8IJbhJNvs3IJUT85YV7SlTCvFRy6jTRWVJ2xse55fYA93kBPDAEkX6UTFD7j
 gn9f3Y1tCh5gCkRZUS4z876sUEkYGs2ZHG9reBNW0cV+QH11bMs/ah6JWcWC0QJumvqg
 AHizA0nwtzHmfpxbHRhRkRpKdakXfJsfXMaYlojQ6Uw52muGnYSEcw+Sav13g/h4d2sI
 P2t9JPy1zZICFAh9i1pDm8Vx40KR/RdrRIoq/vm5YvUDFhI56IU5OOoLT5O+4mGyxrXS
 g8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909825; x=1792514625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r8hsx1O89y4yVilKdriS2YB1IHULbw73FUxREdWSo+k=;
 b=Mc3rFbHogpNvMtkbWUg7hCXIhtLp6ljTqIsjBzSOQZEBtr4z19zZH9TN30QdjF4Clj
 SkiuNjvgFPLqJtmQkKJTx7lJJ59J0xaBm7jeij8e7EHaeNNN5FzbemH/IKgeQKMMuHmZ
 PHYNMomMPb9BLYzAGiLpYrJZudPh/Evl/VgsQaMEocbfTUFR5vHC13IAtfUxy9qhNSMA
 azo9qIMTjh3qHkNaKg++84MRygPbJw3Cd/CRTKpKRsOuD37E6PoLUPqTm8XnW/41QsqK
 rsx2LaFybSer1MZxwyE3QXkzkHcbuesz2R5MqoRNshBqkkzDzGLw5iNrnGLHAyRv8Y3U
 n+5Q==
X-Gm-Message-State: AFq9FYJj2Xo1QZyUjo1HBpJOoMN5HNy9IK5+j1vdgh74hkqr+aiiyTmY
 k2xG8njgcHMt88nZX0xScCh/9omhsflRMiD5pA8wVS3zcJuBbe4Zsk20+cFXpg==
X-Gm-Gg: AYBFou24caU5VdUYTihuk8cT6diQTWiXanFGPu0iAE0ZTzavl3BaYRUIJglXkf90Dxo
 v4cR2KtUQ90gEF5RL37W86/QuZcs989soQZ4Eca7m1rulPFitI8m1NApHL470OYYrQjjMVb0Ndp
 pkcMtW+Hhz2SvSmLOfe+zJphxV7AStr4jmUBQPRzW6UPwMDXgolnO7QVVm6rFmoo7Hv6yoFBoPq
 lJuR27KfvxuZ/YvkeXDLd6S/ke5VObeT4ZwmFH/gfHT578L2QInbbYKeAwIWFM35Ep6ypmPaP2p
 ZNm1inXdkBmlZLZM2q9ZVhi3QdQRp4Npf6qdaPEtqfoyJwx4Z6oIGHasWgrYfTsBIcblf4AelxG
 NHBctkqVSkv31Daxzf8JLEVaNn4osdj6SPAj7Yh+O+OK9RF1TEmwO2pH7gMU0mjeC2QsURso30q
 /Z6PeWlsk6qByiTEImou92R3wHlfqzSeTenciZ2NAp3H24fJbIFB42IavIha4RQfE3bjzqjtqk2
 VPOPmx4SU7ahQNjEbnf89aX69pLXNME29hp3RycUTD9BDv1eJwqPpnJhjRFNz7mKuN/9f5WwfSn
 X1vtNSQp5ryzP2rGMhHWO6yUIRCqUCpyUWFQgK5T69p+TYnhVCaPxjW2wpsqWpjAww2mazEdDpM
 rUMl11WmOoUQwaKz2cSphagbxXee+qzotDTZEhJ7JgJA=
X-Received: by 2002:a05:6871:810:b0:4a2:62e9:9172 with SMTP id
 586e51a60fabf-4a2a89ad537mr11197324fac.53.1791909824953; 
 Tue, 13 Oct 2026 09:43:44 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:17 -0600
Message-ID: <20261013164254.1476592-31-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-servestatic: bump to version
 4.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Sebastian Michel <sebastian.michel@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-servestatic/python-servestatic.hash | 2 +-
 package/python-servestatic/python-servestatic.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-servestatic/python-servestatic.hash b/package/python-servestatic/python-servestatic.hash
index 6d1fb6ecf9..fd61364835 100644
--- a/package/python-servestatic/python-servestatic.hash
+++ b/package/python-servestatic/python-servestatic.hash
@@ -1,3 +1,3 @@
 # Locally computed sha256 checksums
-sha256  1ab67d0654910c000864f9b6d7fefa8befc21a2156d539cf9e519afcc27c4d63  python-servestatic-4.3.2.tar.gz
+sha256  1c4896ff49d0e6b0aecbd69701229d5ec646d0c00927f7294e8df9ee16a20e70  python-servestatic-4.4.0.tar.gz
 sha256  1770e2fc440cce75b2b2bd1580c6d59f58a497f0bb7abe91a0136bee0f688bf3  LICENSE.md
diff --git a/package/python-servestatic/python-servestatic.mk b/package/python-servestatic/python-servestatic.mk
index 26d93fe9b5..3acf021961 100644
--- a/package/python-servestatic/python-servestatic.mk
+++ b/package/python-servestatic/python-servestatic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SERVESTATIC_VERSION = 4.3.2
+PYTHON_SERVESTATIC_VERSION = 4.4.0
 PYTHON_SERVESTATIC_SITE = $(call github,Archmonger,ServeStatic,$(PYTHON_SERVESTATIC_VERSION))
 PYTHON_SERVESTATIC_SETUP_TYPE = hatch
 PYTHON_SERVESTATIC_LICENSE = MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
