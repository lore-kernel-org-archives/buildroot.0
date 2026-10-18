Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31B2CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D95C40677;
	Sun, 18 Oct 2026 18:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44xPslk4cmzk; Sun, 18 Oct 2026 18:25:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6DACC406C3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347919;
	b=ETpTN2eKMMctvbJ3keilKf4GHs6uR74JwdMuldIuJjbh6JKCr2Rhh8oLgeh2L5ptrUZF
	 7DzEKeyqeJrSC/N2ECTdfeyFVcVJRYl7XzIR+iHV+YKcUiIZGxLk9S1EMOcvPfDAJVJeX
	 ihTgTke6m6vuzQNcz5ahNUxVzD6n1JiHBnUZjuJUziuM6rumLKb3izt0oSziJHTBsIagT
	 wurMOqizrYB8b4vmSBgDaTDsHyzYDosoO33tYeEhF9vGxtNnjOviZC+NAXQNo4Tz/1PLv
	 SJcsc+BEXcGpbKW4CC8if6sTMCxUGlN6skxNh6BOqb+gCEUTd2Xm0lxfM5ImKAYstyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347919;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qFfpjjb9zWxG4wagJnKH6aL5tvX6zhQI1ycRVQ2wBTc=;
	b=bksRDsWhexbFFbf/3BzucAhsifri7vzlhL/SiUstFKtjzMkXgmZx46kKkQgkDOrgvkle
	 uO1Sw+B4wnP4at3IdTLx+EhhQfaszkqCXQ7iflBwhrYjN63LZhQix2UiSLA9zq5ZMPJ/c
	 jPba7nmm52WIwAapsVIltNVA99Fycmz4jaUE+LWqG3yaEXiOBwMCIilQOAgqIGgjwPihF
	 xr5Gts0pqhI8/6f1kwcO0uAgfAZBu+JbthmqiQkWFgT+Rtn81mr80G128uPC5hAXlbss2
	 y0bidBzQKsw08fYWHfwfXFWL+Jilhd8WmbvmmhYQJsRL6aYK7pneAHrKiOdJrwR43bA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O7zUNrh1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347919;
	bh=qFfpjjb9zWxG4wagJnKH6aL5tvX6zhQI1ycRVQ2wBTc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lES2cfyr11GcMmSEal9bm9SK3kVR1OfC8CnUp90lKwGugFs8mkUU+BUDRaJD18Qhb
	 wwehEFt7QN906/t0bRQeDQoVSi3i0NfJKpQm8FxcBpiGq4qFBrZ6xEIzTrQ89nY/r1
	 B4bExzUX3LIPkLsEURADMChX7s5KPH00Yu6ddE00Rmpwvft4aMMm16YRRpFcHW9EhK
	 DOsbnuIZ3k+k9zlWEMiVIj1YZDGKE9sRP4MnamzvzNafVGb5tEpvmSIm4pzcS7ANfP
	 sVBi2NnKdcqaUnJdjaGZdTvWuXgRCDJ/ErrOY1QcBBAsf/Es4CjT0Z3ZNQMMXhKx/R
	 Y7r1dmxDSjrdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DACC406C3;
	Sun, 18 Oct 2026 18:25:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D334461
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C46C6406C3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ti5zG8aLhdRG for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DDE5D40677
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347915;
 b=eIgW/5qK5yRnIblVVVRHOewsJIFrv3bSedXpe89IfEqiUOfvTdCsm3CFg3r7JybcLq07
 O8mnZ9isiwAqGWCb6JVemeOjB6O9vvRLlFLXAV+D9jr2F0ixK+JEY+35YdCHy9c4pbsIi
 TSvc63OMBhNDrwSzy/7SQciPmFeE/LSHhmWzvOyClbxeRmXChRp+s7cTYwfTKH6b6cOvg
 TOEYRrsol07rwPqK5T/CeMx6lsbWVckDKWg42uh3JfpDAqMv6fxYyJslhuj20l+u2Swut
 IFwW6wlyaROg10XP6aJo4ww7eEkp/btpLaisX8TgwDUM9+6NErYCaeDzn4tAMgWwyDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347915;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2DeXWZagMEH5Oruodi6vNse0ylNPeQAVdrRiRzrHWKo=;
 b=n4IaqyFnCfUKMVE5jHI1By55YD+eoHew/7VNCL8NHikBVOzq7Hp2xEcFlFlZkKunPs9J
 +7JjKYOzu9gKNoWjJZFIUAH9CeS3llMuWfrKgMPnTP5lFfJDyiUlkcJ2hLxjVwrnl/wBN
 hvBKo72sfteGtkdNmjNVrIa807l4AfRTHStwY+xos4//ToRNzV4wK9BUNPtGKVHis7I0z
 uzSao6aTcypthikwyXh3/IFhuqiTP7tX3onxJ8gS3imIL2Silkj7SYLXloYd0h+TvS7D0
 Hl1Dp3A/52REfxzNDGowbrLHBkXJhesliRM+SiTAePpn6VifwV8Z1PNLryNd+GZTMrw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=O7zUNrh1; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=O7zUNrh1
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDE5D40677
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:14 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7f84a55cc06so691690a34.2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347913; x=1792952713; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2DeXWZagMEH5Oruodi6vNse0ylNPeQAVdrRiRzrHWKo=;
 b=O7zUNrh19VilFl2H+FEtzR4K8F99GUVTH72einJdzVbrP4dbe/dSCNSHI5hOv92DCn
 ElZXSiQO8YoIHSSc871mS+QGjE61+Mavo4VBZI14XgNk5v0dXNJbu8s5Q9df7K/32iXf
 SOFCHBItwNtKNBPUPJWW3Kum2/JILdVjPu9ZG6JqtoacfazLOR3H1SbnSc0q2jsE6d2B
 Qc3HGJXiss2IM3Zbl88WDi3TG0YGU80C3AVZNyoZWBYPPXq9zAQSIBMRu9yTvP+lzKJR
 NyKX5iI9Yp/EzXCTOL45GwOoBBjST09ZTcfpGDe1V3+Z9tYOLookIfXx7QkPPkSvKsGc
 BX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347913; x=1792952713;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2DeXWZagMEH5Oruodi6vNse0ylNPeQAVdrRiRzrHWKo=;
 b=pahIGM2fZxAHxLeZMD3YsEU4bkY3APtGB6KzCfQpiRNU4Kro4HDgLIfEVJgf4rGtsR
 0YG1ZUUW8Nbbin+iNY8UaJWNWrQbJfW29iJmaThAAAUun7SECTLG6/aVBBSnx3Dzx181
 nPKJtaqL5/J1DF/iaBRlcDKeW2S+/s0PwUoNWJ3u1E+ESm0swMgOtugbmh2/2GfmD9XU
 06clnYNRLe+mzE8tQCkqhrwyLKa5EJIhw2NrSDycwI1wczjZ/WK/jfCX7y4NQz5txMVU
 u4lqAkThmkB0tCV1+DRD83k5pYNH0yKf1wzJmQwhAyVBUtwEiKVLZWUfV+419iYAbB2Z
 u0PA==
X-Gm-Message-State: AFq9FYIthiuesZDZslFhvG49pEAQCCXmIGJ3NBL5E6MB0wf0JVF2+e7K
 0OQOAnTFF4lYvwh8l3F3Dx5Fg1/PLtJIowTjOr8mBoyA+WZ1beoHp35rytJz/A==
X-Gm-Gg: AYBFou2hg0lCssTaCrdkbjQ3MbJ+b0dah1uG5TbO1kDggGpwDf93tUvhxY8FlGONbGl
 jIcAqNvaj2o8bb3WyyaraazUvYAAWCeJpsb/0zLkDwAWZ0HLooUI97006OyRMQ+PbCBVSdpO5QB
 oF8t+Ps/qvIJP9Y/NNZy3gZfhqpjVX/7eMJe5CUxl67g48ha1u0AlFW9BWlJbsXmYYCRcYikqBF
 Z3b8FcImjFnHIgfzRwJo1BzC/9RXcqPho1ICAf6yLVFnbkK5Dq91EIRhe2p7en8cZDHasKLXXdj
 DWMuux+W/1lKj7Rcn0dyapnD1shMZfC8eVjJ5RVbvQKhFprVCXmcb2g0hAx1LkijSRVIOhbvYfA
 QGCP72jAlQMwywiQgMbYHW4493wbOM3NIm6VypcSbbG0JBbp17c0GOzQ2Rme1XNRBiuLtIJTytO
 eUPGhijDG0XQrzzcLFBCC/3tVFkbAR2VT/XV/2PF0bIE0/KX2Z+EpLL7E0/DzB7gbr6okLPsFie
 f6aVbAHm1P4I7vcvqK5w9efEOqq54JIue9252clMfj7P77JFbudjors470/OB3qGIoY3OMvwLUu
 Yip/5fGSNniNPyhIIoXL/GLGKaE7jat1SxpphpRU7vTJi3C9aTtZ2tAvDhePqeN9Sa8b4qPZNfv
 xl3uxvrojp2fkqz6YCQgGNYABMoEmdTjTh5tBaks7LxA=
X-Received: by 2002:a05:6808:10c9:b0:4d6:9252:4643 with SMTP id
 5614622812f47-53cd785697dmr3993602b6e.55.1792347913621; 
 Sun, 18 Oct 2026 11:25:13 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:43 -0600
Message-ID: <20261018182507.536698-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-chardet: bump to version 7.7.0
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
 package/python-chardet/python-chardet.hash | 4 ++--
 package/python-chardet/python-chardet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-chardet/python-chardet.hash b/package/python-chardet/python-chardet.hash
index 154986d735..463c29413a 100644
--- a/package/python-chardet/python-chardet.hash
+++ b/package/python-chardet/python-chardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/chardet/json
-md5  728517f43e9a435a3239d60d1ab35270  chardet-7.6.0.tar.gz
-sha256  93d9df6089ded42ed1fe9f57e272c0b74bd0464d45c0c7d50f09f26f31105c3c  chardet-7.6.0.tar.gz
+md5  00b60e5cf4156308dea5b742a89e31de  chardet-7.7.0.tar.gz
+sha256  0ba38a05201b0abf7570c12d8af45c30b2af835bd5cc52bfc7105082eda82c1e  chardet-7.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0d4cf67e7a26e9957b8948e7dfc0e380e61b427a94b061e618889aba89bb9616  LICENSE
diff --git a/package/python-chardet/python-chardet.mk b/package/python-chardet/python-chardet.mk
index 4087c1cfc6..ff0aa8cb32 100644
--- a/package/python-chardet/python-chardet.mk
+++ b/package/python-chardet/python-chardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARDET_VERSION = 7.6.0
+PYTHON_CHARDET_VERSION = 7.7.0
 PYTHON_CHARDET_SOURCE = chardet-$(PYTHON_CHARDET_VERSION).tar.gz
-PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/b1/51/cd61c567092a6cec796144510a68aff158ebfc1df82950a45bae65f28413
+PYTHON_CHARDET_SITE = https://files.pythonhosted.org/packages/47/92/3d893ac5d338b9a9af34c5b517d77492dcea8a10254254eead4215a96f3f
 PYTHON_CHARDET_SETUP_TYPE = hatch
 PYTHON_CHARDET_LICENSE = 0BSD
 PYTHON_CHARDET_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
