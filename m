Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A51CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5157160B56;
	Sat,  3 Oct 2026 22:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8D-t4ST3Tzx; Sat,  3 Oct 2026 22:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 62E9D6068F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067509;
	b=Y3o8CXXZdjpQdhPUZUeQYIdTtCxpfDYFKouqNVTj7rtFnMKbySNXVy2reTfbZC9TVaqv
	 lK9ZO2IF1xCZNK+hCwh7T3q0mUX8/az38couZQPIXM3cdbbHxpGDZHysIuoWrx1NOyskb
	 QUjKMQhIsDZLMh5YRl1odB6PRbGjA9HJ6az7l5cGSrCjZo7YyHTIr7Eobf2Gv6PHa2SzI
	 D/pnojlfZl444zp87LiqcOH5n48bjDY0txBV5OmsfdvB9iloC0S3hCnLNqOWnPWyT0Biz
	 Gl1W9ekc2Ue1fXGgjTYeRlEj2UWQskFxqLPncWJByEp0en9cGwW/sNlHbiMjQu3l79Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jzhdaW8dHfCvDDQuk//3jrNcTtm7GQlq85wW5b3x4i8=;
	b=cTFnNrxU7wq5+YmXFLTEGcM9bevCMal33sg1TrWJwzI2+2znGMmBog25UT/0Fq2L25bp
	 B47ngVEODitHEIJktDBlRzB1oqgPWjCfFczm8VfJ6UKpl0/QrzbhUE9WTfZ8qqnsoGExf
	 AKL+j25gxncgl9SJQQXQZHTSQWobX1xz6hb8G4inCTOpAxanP+XtB7AlsFwlJQXVjNaDc
	 wo+ic/UabL6p1/gfyWODWjllyij7d61m0hGb5v73H5hUg3t4H7kTED6a4lVvjOhLEEObm
	 H/ctNMYlNR4tssx2C+RaxasZJQEZikVw59Glx7ss+WjAcuRDHu/gzYNJeKMX5GTnn4w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067509;
	bh=jzhdaW8dHfCvDDQuk//3jrNcTtm7GQlq85wW5b3x4i8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=H+Q0b0S0SKmC/9kA8NZcUmT9qdVRUtH28bK9N/jGLre64QPPQHid+eLUdE+gwUSGQ
	 GA89CRkgno3uZbgyqL5nC8F3cAH5OpduR5/9Lli08DiQhBfp9Q0AloXMxk7P1DFfa9
	 yb3rKoLMIau0rErIA0YFVHwuCapVNcffjp+WlmxSUO/wMDJwQ6Y9Sxpev8gmAkybR+
	 90u18p/WI2lvQDkGiKjpgZhPnfWbbxIMMl5CEIOPR6vmL6Zg3GmbU3CaYxY6ki4Ot3
	 OkfxnEm23D8TUkSIEWoFwbVzWtcWkPMI5xDC33Oan/mEhs6QwQ4cSt9S9SvUG4y8U7
	 +e4pZQLq2JMpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62E9D6068F;
	Sat,  3 Oct 2026 22:45:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C08C7263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A39A840BB5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlTku_KvxNKg for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B778A40BAA
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067506;
 b=ryjNAgmgMmpCod2tOU1uUHRHeh2qdHO5AR1MAPDMxejnT+yZAadEET55N+KW9NnKkS2J
 DARhWzY6Oo5dMDSd+fmqhY+VPzQfN3CHRebFxauWF0fQZ0pnmjccdayDhtmKuZR0d/GT0
 p8SkozAtSN5wDdntUZQZ5jVl0PLnHIX8roFMcoQbzmZ/p7Z1N13+LpK+PWiA1Q5uOHetg
 xvHbiRzBO+IGw1Hb88Cu3tTlLdCfH2Uqw/e1NIm9yA0mFd5ei8dKN6r0VGdRCSM2wezSq
 nnWjDgHe/xL5EMbZqzFZYOZf1zHu50R2gmNEjtgHkq1rzdJJrndIibo+jf3np73U5Lg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067506;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=g45DnBihK2ye/2mC47/FaRmcHundKGk0f6UBwNWhIEQ=;
 b=UmzAE2YURSviU20puq9AUvDwWgU4mJTeewejATHTiy7qnDHBDRXeTIxd2x77WkGu4o8b
 fxNcmvqgUQ/mnvq8hxQ+8mpJVPrrIoRLmnWZBzuLRqmX2E2EPDkHK/G0V9meiKrxXzVib
 jr2ZaVPYcB5vF02muYUImQhqfVt4tSszJpAcfZ+qEXiKPX0Zwij6wAfbBEiPPjxo8E+oG
 nld3wurRAF5xKrbj/bQq7Sl9fS+TwOnPsXx9XOKuxrzo2l3SaS2omfoO5w2ZFNQzibNiq
 jLMA8hyW9nKHOdxEKvyjG48cGRNwANWEniODiopedXQiFqTMWW1XP9KKGE/6SfThKnw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TPLSfRBH; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TPLSfRBH
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B778A40BAA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:06 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-6dd7070699eso693002eaf.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067505; x=1791672305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=g45DnBihK2ye/2mC47/FaRmcHundKGk0f6UBwNWhIEQ=;
 b=TPLSfRBHdUcXW7uB0jYBUpSp8hTdeUFwjXMOOAqdYBI4jYFtxPpWPsl53NDijIT+6h
 lx592JDpHS/Hu3xGK1wEpIXZoHDnAu3t9spBjdK2gGuXEGLdhjYj+n/PAAJM2WDi9m8V
 b9NFBRkXJIZjD0w03E84J36w9XzqPFQOc8gynRx368a4Eqq/FWycZDKP4G1JI94yayqc
 kHDSuiyisE8aSmEQZhAuG+LWlGK1UTOTd+0J0MBK+jFBC3punmTdHBPrvJTqEyfxkrrG
 0bDTalLlYEdgh6QTEz0UUR4f6bwGyMk1z3mf8q3naQjzmLkYclJkdgEeJL02lo31Vj/f
 aQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067505; x=1791672305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g45DnBihK2ye/2mC47/FaRmcHundKGk0f6UBwNWhIEQ=;
 b=TlLygpH60Dq76kM54JoGfaeMp3ozcNTPrMKzUMKNUdN/us9tXmR8sR+YQGoccG0oiy
 unmbjmb045o0HlfLVZlY8oLDrV8+2jf7bsCU13p3myWJnBzA9u2ZGHVNwVUniH4Gqdfe
 x4ciwjWvOa1LMtDVKpqArwnMLWS9gfjHESoIYYJbTNWFpYs/jGXTgEnP6Pw60z93z7z8
 sYiIIuu8OJXaO/pyluP5hqiSqYQjM6hCfYPIoA6nwe73bGhCu7wemqCdPgJAqIDww/AE
 ydmBcmmFXCEayJwVF9nAZpBwBGsTuGxlvAqj5VZ4RfOiP0m/Agfn10f13XbH9mEgZDMB
 SlIA==
X-Gm-Message-State: AFuF++kvWRvQ2+cnPn28dNwZuHo3XUhvlxtqLpB2iIXU5gu0ptMkHK6a
 zr/6G0f7vR6sCIJcp++9u5RUi9z1les0W6/TxGBBrJ3g4lMcPUwQp/YYG0JeXA==
X-Gm-Gg: AYBFou11xqWShZs4DUszDSozWlypSfFjl1zHfhjjJeR9RPYS78YUrE5jT3K9M9YG9T2
 6I6z/47/eEMD32XbOkA4q39+yDcjKZOb1H7Sl6gJPk4pegD0k/CstcDkRVcF/Lb+nmdkmvBlTlK
 QIxwJZlE9T8wJqAt6TrzebJD/CYs+mw4bCVGhpcUBAJ9jun1aTqkuVAWuYBmMbG/tnqO8e7yjdI
 9BpVsHpGQdMoH4WNRN7V2M2Pc7rM+njGlFp+fFoChLwfcsTexLcGvSaBFWpbVN7D7Sk+AuWYq7a
 KXDJS55CNT4GciYIJw3xyJTpUQMdR1chWsWbSOWRzSVW9BQEuXfSN7NCsngL/sNDbN/kS6baXNi
 PAXmm8BUC73WY8pi2VpJc6ojqAxvf56oUSfhGeTkWtFesF7WuBPlcmfVi5QX6amdMjGaR8+GF2d
 OTlFJa7ah4wm6AQnCgbwsQ+VJLln8Ft8Cicj5vDxXyLL6gXiT7fu2yDEHN+35bMgCkS10gU5LwQ
 /1vEIxBBR6lftLYhVBJiuxVD06dJev2jtVXAnfY6U/x5RxUcYrny/KdAbj6tT6JrcpgxYcOwGbK
 DP+eNuaZ+jan99NTbF4KntYtqTr3zeaUHrgceqANJruhnswHybtXCageRB/sy2E1oyvj6+wJSuw
 GqOHe4PlXctt7pQCici/s3z895jDZMebprXcqH9acTA==
X-Received: by 2002:a05:6820:809:b0:6d8:b717:5928 with SMTP id
 006d021491bc7-6e09d5b896emr2936133eaf.27.1791067505100; 
 Sat, 03 Oct 2026 15:45:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:45:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:33 -0600
Message-ID: <20261003224447.744966-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-scapy: bump to version 2.8.0
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

Update license hash for CRLF line endings in the PyPI source archive:
https://files.pythonhosted.org/packages/80/06/f7e09b3240196326fb343d6bd931cafedd26ae1dfdbd7cd0183cae3029d3/scapy-2.8.0.tar.gz

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scapy/python-scapy.hash | 6 +++---
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index b4b7dd2850..0d00188672 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  dc3b089110a1fc1ef1d3679c0076ea24  scapy-2.7.0.tar.gz
-sha256  bfc1ef1b93280aea1ddee53be7f74232aa28ac3d891244d41ee85200d24aa446  scapy-2.7.0.tar.gz
+md5  507c96897f13d1861a430304ac4cde3f  scapy-2.8.0.tar.gz
+sha256  0eacd1f940d115611c1b8a4696f315b4b80caf2951e546893a3d0cd7f6bfd6fd  scapy-2.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  189b1af95d661151e054cea10c91b3d754e4de4d3fecfb074c1fb29476f7167b  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index 9df4614b9c..4c477ca829 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.7.0
+PYTHON_SCAPY_VERSION = 2.8.0
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/82/97/7caec64f05eae3d305d83e7cce1ef2f337710513b89efb334f7278202e79
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/80/06/f7e09b3240196326fb343d6bd931cafedd26ae1dfdbd7cd0183cae3029d3
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
