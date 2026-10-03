Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF53CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA744109E;
	Sat,  3 Oct 2026 08:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9M0lOPsu00E; Sat,  3 Oct 2026 08:46:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7C89441076
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017160;
	b=sOqlywppffBLFA9caDmmdJefwT3falGLEUV1E0QeRCFKf0tjlrS9/B+UwEn3oFnwYNAi
	 nxuPtL1WILyPUX/sH53OHQ7Pd48XOSlcOUuurVVuskZAwCxMOgrEC68xdPzj6YMTWxGQl
	 MD/kvcOO1qdsnyLBfxfwLrhcQ6CE2RcK04As5657z4VBM8WDzDQQr4e6P6iKpFRUrsEBt
	 SVK5hhBVzzHT908qmAADSjCeVag3ohkyMQmiqZYFE1nvaR3O6Qj1PGAEOj1eZ9L1MTa3U
	 2rBy8Zd4bqcsdMpvHm11ackp8j1GYIImh6tHRWTL35CPZi5vD9wwRqOOgHyDHgEgIiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=L8b5sCsWcAzTOtOMs9mhWmqHmDS3L0uEAny+jtfFgcg=;
	b=ip8kzugxZ96P3n5moEoc8qzcCjGYC3wUu4EgimYPy5TzzWTNq9w0WyxlFoqPpsJtrJ38
	 0sToSTzV1eZsjzTZkzZiOIu/ItTRrljDZ8vDG5PaF1tz1lyu/ABCejUiR1PbJoIyORDlO
	 ifMO6X5undWTiHYzawyhl/iFD5b/2xvyHmz5CsHnDXwPVhCCshHjv8PhK/4DB6rpzzqey
	 zG0UWtZlo/u1fDtxr8/fqxX42OeA7sxraqCYKbN//xaGJSNshS8b4SXj6+rAuSu2H2Swi
	 0Ge9o2zeH6CgrP6pgx6wK3gnx1B0li+CPRbNCNa0CX3GgkTC+5MdOLkkn3euZPhCKAQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017160;
	bh=L8b5sCsWcAzTOtOMs9mhWmqHmDS3L0uEAny+jtfFgcg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OnAngCyjxg2Z9a9RsJKAEVslqHmzWNMrAgJvWw8uaz1ZIHP2Qt2x60M4Q+xmcHm1y
	 cVc2+EgFbixpB9lyRsWwXZ+aopX0pITM+bVoy/xJr2VYgXU7v8I60CzYUzLDFqr6Du
	 WNoSbv8q2V14c4J2nSuy8buBxva5EJLuzsTbbhZtN+KHVdJkNXtf8rD8ZF/o/4MGy+
	 5Daw19nssbwkiZXraWd19bVTmepGNdevOzsDQc0/rjmiJ27+ZMfqqyZf5X/ygh/e2P
	 va/2FWp+8vqHMkwoigeXolq1RezmL6aOpbdvM7qq7XFcgRqG+zy/b93YL/Rm+7Lxx8
	 2s9c5wXpx1z+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C89441076;
	Sat,  3 Oct 2026 08:46:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32D532E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24BBB40070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S31M2sBVAKYV for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 571F840059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::26"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017158;
 b=FuRZjd/PbIdOWxj6w1xjBUn5ELgVtqvdyQfx46bSqugIi2p/o7anpS8u9N7hzwOOObie
 7D4sHgFyKdzreuo2AH4vZJDulxN/xBKrvylTXKPozQZVa8xBDkB9NwU7PZ/LVE8A8N6En
 8fsSh2+TyPgHMXieehWoW+tYDxpoULBvBW4GYDDqP3eT9728g0Sxb52YHrJDNmuMcA6Lu
 2Z7D0Ixj13kFGDy29E6inJUuflO3uW3Zaowl0FMWDoZncDwU8HbczjJL5sz/hShM7m02f
 z+JE7lwqEg7JCEpIss0/ZUFrVVCVD7bOyR+A4LJw+OvEIQM8uDLninw19VjvVXIW6mA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017158;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2iJYNca1SOVMSZrLee28V6GNgCKNHhl2guYF59KDb08=;
 b=r+Vx6NKOkuE5e/QIUsuvy5bcnm77ZRTnr2bf+tCFnDXwoXFyGsXDFt2k8UvUFvF+FKEi
 lsMSLogdjV/jk+PYWrtlno2WjstAYEaeZXnZ3PDX1cmK1vc5ZyicTJQ7FOzncUEfOcu7c
 4LMSohf2JCOK+9Tr6TRSCGecjTqZYt40/UXZyaa281xoN1NCiRSvkwFLtvPVBRaGLiwr8
 E16binqIuhkoNWMDsgFfKQNX6AR5rFvqZZxdD3re1qWCZRrHDLWyVcORUB/DjMNnOLjeR
 5mc487r80cnxv2RwhDmotHNM/0KW9fFQr1FBIqy5lqUGb8gWCIrFgG+iN+GGooyXv5g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=r8Ea9dzg; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::26"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::26; helo=mail-oo2-x26.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=r8Ea9dzg
Received: from mail-oo2-x26.google.com (mail-oo2-x26.google.com
 [IPv6:2607:f8b0:4864:31::26])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 571F840059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:58 +0000 (UTC)
Received: by mail-oo2-x26.google.com with SMTP id
 46e09a7af769-821c01c2fc5so679740a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017157; x=1791621957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2iJYNca1SOVMSZrLee28V6GNgCKNHhl2guYF59KDb08=;
 b=r8Ea9dzgVwEQ2PnU+4K/TM/eSgGL7Xm7BXmALuKxFtBwxoYD4q0RR7K2xznfneo9EN
 Fv5fBDzt2APxwZnTAIoxwethJkEH3Fb+/TtBT1i10M1tAHVvpZ55UKveCzdGfeqeIPDz
 PgenCSIRzbRStVXjOaHOkrjj4jiPTxDdzkDxcUddHEEm0hMRjfdDrRTvBsXM54WgkQmu
 DNTxRT/DiS7ZadyaIAkFQc8ALwbbcYPAPAybIALmPjMn5bOQgPbAEB/NqugtueyIOxdw
 EuGX+sRCf7LsvqAGC9H+hcatmyEpM7xb3L2NwJC3juZFeX0DpTxG9M0fFGyP1y9GdWNV
 Dcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017157; x=1791621957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2iJYNca1SOVMSZrLee28V6GNgCKNHhl2guYF59KDb08=;
 b=AkBH+gd6X6TFVbHfMns2y1Lgcsct2mKWF6ky5gbteZQQcOUVdZnDg4zrsODtNOtWXJ
 PC9UDVs1SLZ2sHYmAXPD4SKR2nVoe3ctoYADkSE5QRMP1gPglz2Kdza02RJRhR6oX6Nu
 ZbWgMuypw/V75hITbeV00dxjG+aJNp4jMzQnbyWAkeXx18fdkowiauw1uwktQ1rlGlql
 m7Puhoc7DgF8rwKCvF80QbYdOPuhamjTsUQztOkJpKjX2F4ahhU50EJkpJ4H3LRZELfq
 KTxbm8TMVuijOtGy4WOH/LabZh1IcFZU8XyjyO/npwQ73Po3XG4hDFH9cY3Qy/QWxuyV
 PqqQ==
X-Gm-Message-State: AFuF++lo2YUpSdT6TaBsB/M9ZSAadW4Jh6QbXaVv4Cmo+4NcmnGbyUny
 o1xJl2NzLMGCz0OGlvGxzjWzcqkpZ4Wnt60VOkfNQPAOIEM+areA3hDd/EmsxQ==
X-Gm-Gg: AYBFou0DR8st1bPN07VAn67RWvBAn0a2H3AsVZppXS4Yh+hnU6YwUF7dfO+l81jnZ0g
 obW8+IPtgm9JhZO5ZJyYDn11iJbOuVbQvh2mWFsA/IPA5Zqc4FNopF2dSaBvuj1U+31BXEWO1yf
 eWv00pltk2a6Fj/qNuKeznzMhXgIN3MK365lKxlJmsAJccLviOMtcxrVEPh2Ncjrahwqj4tC+73
 XlXKygBVYMBh9Jvz8ijRfnAfffjMO0sdaG8wyKWPu4r+B4ms03+S5c5wIjgWxfFoxBc/aXMJcWM
 OD06ZZdK6m179XUzEw+HR3nYuzTo50oZucBp7vZSyeMYw1+aVOurEaMfMIp4RgVVQFVHtqjISIw
 m/sK98/CvrXbnRFg9rtUkz/QiVYORkuIvvAQ4YGLwZI0Y0XGnWVA1CGP12//POEUPSSfrRo88dS
 Bg1yp9MVg3J8hVBIXR272fvzPR6HTKUq+dXm40mBEy8FgslS07JPNvFf7acyBIhdDkkZ/w/P/5I
 EtsMekZN7tUbwEaar9tuRABDCjWGz63ntso6bxtsyytvXwBjuPEJl/7JFMfPHP4LPSZLPrG2Xgc
 0aEQ8rM9bB0JJi4pu3ROPcFccR+/Iq5P5ju+nhzTuR3d3vRyk4GDibwyI2n+CGYBTDKpe3haXlh
 et/aUSk5jg0ylGI6L74SHN1QR0h90DMn3al6vtBtpuA==
X-Received: by 2002:a05:6830:6f41:b0:81f:707d:7646 with SMTP id
 46e09a7af769-8228267da04mr5060595a34.14.1791017157209; 
 Sat, 03 Oct 2026 01:45:57 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:17 -0600
Message-ID: <20261003084453.545653-32-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-webob: bump to version 1.8.11
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
 package/python-webob/python-webob.hash | 4 ++--
 package/python-webob/python-webob.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index 8f9c7a1fe2..f88c07f5d1 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5  4167b16880e0d4c22aadee8ec3cc6c26  webob-1.8.9.tar.gz
-sha256  ad6078e2edb6766d1334ec3dee072ac6a7f95b1e32ce10def8ff7f0f02d56589  webob-1.8.9.tar.gz
+md5  a3e12b9c6083af0e5827136a7607e292  webob-1.8.11.tar.gz
+sha256  aa8c27231070b135c025e567a9cd7eda03f4df71352ffaac740cb6a75f0f81a5  webob-1.8.11.tar.gz
 # Locally computed sha256 checksums
 sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 1e58d590d1..cedd2ae270 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.9
+PYTHON_WEBOB_VERSION = 1.8.11
 PYTHON_WEBOB_SOURCE = webob-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/85/0b/1732085540b01f65e4e7999e15864fe14cd18b12a95731a43fd6fd11b26a
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/e6/92/9329872e36be90e25ba616ac6e9ee8c1be4326a1ea3fdffcdabd0eb48efb
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
