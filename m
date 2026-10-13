Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F022CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B60A080E85;
	Tue, 13 Oct 2026 16:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cgilH1tGyZi; Tue, 13 Oct 2026 16:43:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1A9D380E4B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909819;
	b=MMLKqXJWgrjaOZKcmbn5dCmQStJp1E9OSp9ufYa6+vq3a8mhu6GWjIp2I3uCMuqqWqnf
	 UG0OnjuVq/6jNreWHPh+9CSYb/8s93dvRb4uSgZ6VQQ2bgyJPfHvNUXVgGJ40sqEbEVAT
	 +fN4PYm8cKuU1g1siLvR+0rseL2wLwyrcgk24MNp5i0WJCRULSiAgackEaHnTqVKIpd0P
	 M0L8Olj9UrpHdt1SpGYggYyKhI1JeezHJiLnJ86AifsXUUrC4guletfTcO4+DKFmFcNSG
	 hAr+g5qbFm1Qg9+jRJtbIuEcHGl+iwSw7vhrTK4lsE04EtAswVqv2Urm08N5KSL8cIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909819;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SZ/88EhiWvxUd8SUoq+6ZeNwHNVTWB1uRHs5ZkYfcjI=;
	b=rj3zlIwy1jQ/gxoxbPbKUGkOSThC6iGTym5i8aA/OLBVEiMn522CQ7yrAVFggRUr/h7k
	 y3ZRckcKEcmt9CwHTjwsl0hA/Vg7t/QvF8VltmhmrETWy7e+0X+IAu9lHPG3Az0JPpjdZ
	 7UeGQB+/z5osBh7LQ4iCbzmjx3Dcv8ow7+9S34ZtVFlXLBOWhL0w6H+zVAzxpQ3gZxQHN
	 qC+aqdxS0ehsVZIB12TwQ12n1QiMOHQ9v1M6vp00gSz71pFtL4JFAsYQ92ftdML9QP4CV
	 1LL2WYOqTKHBvLEvSzs1GDvRMIiwkRz+JzsK4y0x/nQwHTwGRRdByL1es5S7xxszpQA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909819;
	bh=SZ/88EhiWvxUd8SUoq+6ZeNwHNVTWB1uRHs5ZkYfcjI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qHwxVoJ64i4oAmaX9+4raCiiaaE3m3MUsPql4/H/fDoqLiN2QAZ6Z2nQS0sU2DGgo
	 /55ChVwPKMDR4swOIlUIKaA413ITTXqjnpcUaOVxQVKb1zqhdPid9pdt+EkhOQ0Orz
	 LkBI9YMMRTS2m/MoB1essGVtvj88l8hPUjz17+D9QMmgLGIQbe7fIb8wZdma3rE7Cw
	 FrXWBi2KomS78rewzffAibnSHfJuVJHeAf8//Iw8hbLvXZywXgDjbDVG754h/GxHww
	 9tXAdsQgiiWQ059uI4vYWKW5fcPi6AHeTAv8uEJU+To6+hlC/Ni5TuLzdNq7coCVrq
	 Ka8/LSQek/sJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A9D380E4B;
	Tue, 13 Oct 2026 16:43:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A171DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C5D540049
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfpgtJ862vLs for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AED7C4007D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909811;
 b=IagLsgpyvEaw1hv2AiwcwI90H0HxNsr9osea6wAk3Grjc1YJ2zlsWSZk/Ox9+wr2dNmx
 nd85bbRPUMIOXNS4xqXjLjevOGqtZfDltwbhoNsDzGRvi6zhhMZvXMIkQIc5y3fWjNiGH
 ghTr5rl4F4CKOkq5V17IMOqdmmr/po8ZRcIpUW0Io1E6qK1EBL9QCodbhWNI5ToC6Nlsr
 zcroNkhupGouhC7dj8Zig7aH4Na8LKVCR2xFR1L15W3OhTSqT3Ig9qIJUFbVYJEjQi45D
 WPlagAxHWlMI21nXrhNUdjlyXW11r77o3+j48xIrfDTwkQPd/48bSIKel6kyKyDOcOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909811;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=cUkiVMLFEieIAAX5vFPtjJNw2fOhTiPTImP/jm9K+7E=;
 b=bwCN584gypeu4XCxwNBaR2Er2kpBeJb21VU7RwFnp/F8m00GBp/EMnxFLw+EjT508S2W
 fAWSw8Qb5XzfNdF67lSRhBTrCSiL7csDua0AydRpVFC9EE9f4RC4sR9H3bvhqm2hqN5DG
 Cnl8Dpy+EnP27jCmXn033x0dzK+t62ulBHC4dGvZUSt/035VFWXo8af5GNMlC+laRFO2E
 3+3zsP2bBcE//MidXf0Jr3FKX1e65kSF4pkMDzzHtHTKpW24ho3far/1Lbx6YqbX62ano
 cdk6YKzAUft2uZDR7MCkJKAczaTqlK5aat5LzNwf+Hx/lFz444rsheG+yVj73k89v9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=o5o6mboB; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=o5o6mboB
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AED7C4007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:31 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6f8a519e215so1325727eaf.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909810; x=1792514610; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cUkiVMLFEieIAAX5vFPtjJNw2fOhTiPTImP/jm9K+7E=;
 b=o5o6mboBvPPaHnhcC2GIZrOHu4Ssr75ttHd3yMYc9DRGkOwVgYIRH0zO6wWiyLBWRT
 UZlSU5XE7q3PqcS+cs0WGhJM9AlLrEcVoUW9kd7B1qKbA1mnMbE6/N0eTHWd+OtVBcKY
 TVxLAJKyNDVUNc4hqCrFEMSLFdkqq4ldOQ7sCV/m/rfBmeVItrHQDvqB3Fro+YgV4mB8
 KVsF4x0pIL9DDkJavLqWMMOgBT4GXPLbi5GBy48BuPVW96CypVcU2rD8VT3nr0x4yg8V
 +ikyXGQTuSY7SJDg47hJqGcjpG1ITaB32BfyRasrTbz3hRYyiYqTpfIWj9PTVhc8yf4G
 vkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909810; x=1792514610;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cUkiVMLFEieIAAX5vFPtjJNw2fOhTiPTImP/jm9K+7E=;
 b=VR+cjzaUNGHrQLx9ni+FVJNe+zHAx5Zb9z80Ws6DPW8eb5e1AsoJma93ztQtILe3jj
 qY9llp6nsGAFo2z3WPgzc8nW/zOStsJ3Guj1j0lae2qet3D4d7dnPRyHtmKgHC5Xpn29
 5osXoOrbLXX11UO2OGAp0jHd2cXNaeeXL4JToL81Ay+vcD6lcTf5OmFYB/lhOUfs41Be
 htRcTZWbU2fLjhTqtODloz6bkY5gCUITEwwMVhQzglkdrZqrreSt63fPDohgmKGgWy22
 fZJEzSifWluysruxZL9RxdvbPvw2cVTCRKoR2d4bOF1k7xkQqWZw0QxuTM556MA4heCs
 9RrA==
X-Gm-Message-State: AFq9FYIh1d+Su8PVv/QkIiir6qRllLLMMlern3xcS7Vy1/E8Zv139SfE
 a2XBCD+j19Jr3I+eTEaIuN/y17lzy+Ds0QHmlaH7H4Nq8MUa/P+q8PDXkQUDEQ==
X-Gm-Gg: AYBFou03iGKYHBpOiqMDlz+U5rRo8sqahDCvkRw1xoEAjdQjWvRAr/a5RsQ1K3rJqf5
 OHo4O4YYA7FbOUyIS0OJa3DNUUSnrZYYDT3bXY37W6HNSmLB5DKerYI3QZ4O8usZ8+iG9ihBEzO
 Pcf/PDdYi5rbMIw/CUUJFSVPNxEhypmtQwrhjQRP9PFCuT4E7ZNgC7Zz8bf0ipzDIYgFcOeGhc6
 PExuMD07xNGaJQKzLZVLycGFnO7tNjULwDrRAesUEoMmQUTZmp6KdB0xoBM20fnx8+8ZCVVAWSC
 SFLqdV+AMINQ/0xGrPaDfsHUBTzZ6lCFrlpMduK0MNVGzQHmFiO/3L9KYIrmSDwuVZ+1U8nzPX3
 mHm9I45/IxJYJ91x4no07s2/CXtsq0hI/odFvoI2fN7eQ1hRCq0l070X3JB6iOBSsddPg5KkxNF
 xlu2wDzCdAoyr081xbhc0s9E77jSpRKhIgp4Pu6zhf3+VTDaqHBhjWbp9xR/zbR8KAPD6E1Y0+a
 53oeQ/lCL2I1zbjTWA+c6YkohaRRXZoReWK6LYjozOZ6/qthyjyjXovz+RGJbyowdQOoRgIzjBb
 6ItL5hJoSabnwfePEW1EFQOoh+7tZZSJxsHCPu+tOgJqQrDu6AXTRDR3xpuwXqNqdCUTQafKYML
 9r+UZP2yR+78K3v8vVLuolfnJPDR6byZjH2/LWee4cp4=
X-Received: by 2002:a05:6820:6ae4:b0:6dc:cb01:f74f with SMTP id
 006d021491bc7-6eee1a3db14mr8347408eaf.16.1791909810311; 
 Tue, 13 Oct 2026 09:43:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:08 -0600
Message-ID: <20261013164254.1476592-22-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pycairo: bump to version 1.29.2
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
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index c390d723c5..29244baf2e 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5  fc7c3b4104e88df7dea34af4314b9d12  pycairo-1.29.1.tar.gz
-sha256  4fbd26b4af24c9787d84cf5448e34eb8dca064b732479aaecd03109520eebd5f  pycairo-1.29.1.tar.gz
+md5  e8ddba92cf6b9999f13abce1d5e7c403  pycairo-1.29.2.tar.gz
+sha256  3e69fff74fe64f5ba2dfa31f67c6bdf26413342574047437d2ac520d35e9a489  pycairo-1.29.2.tar.gz
 # Locally computed sha256 checksums
 sha256  360b9a526d47c51a7cab7f1ec49ca5893050562d639b742d588934ff84823a72  COPYING
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index 20eb5b511f..033f3c5ad5 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.29.1
+PYTHON_PYCAIRO_VERSION = 1.29.2
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/26/7c/ab4637b028d9ee12280ab9342f28310e613d5ca30c4d72d2aebeaa6a4969
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/bb/5e/19ab2572981a996ce96b853a189d2dcced40506b67d9555a7568457abcf2
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
 PYTHON_PYCAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
