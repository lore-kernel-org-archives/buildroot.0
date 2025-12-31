Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48F7EE645A
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 20:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AFA280E66;
	Wed, 31 Dec 2025 20:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PseNopO8coyo; Wed, 31 Dec 2025 20:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70FBC80E4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767213174;
	bh=0gspEPgKawPJgQsH7D1hnJ2k23bcoYdcLpZcFu8Suyo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UNhGuWTUrKO6/kNs7HW/qaPmsmLdpY8OisDBUx7baI0lYf+budBeo7G338u6zCq/N
	 EsiYt+s7qY3KZGoeBjxZDOtn54p7YNz/MCB2aVcmemCB/ft4QvzcCD2jmXFxCsC7Zd
	 LkSEFP01wCO/uhUXhAWpwiDbEh9mMgykHypVmxUOS9cWTLTYuj5bCAqkx2kj5P+p9D
	 OqFLILR2fEWwvBxyt12dgKucc21HdS8TOKEmAomp2R5ZIuoVP9o3dUbqyLlQYKd8En
	 3PPCsBFAboasd3N4V/AwtWeVtHk+Y8DUR70sZqyXADEAuLXRAMmMZAjOLHrdUfxdva
	 GwihP5E9vyCfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70FBC80E4F;
	Wed, 31 Dec 2025 20:32:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A35249
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 397C14024E
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdHuK3mPO5iP for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 20:32:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58B6840176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58B6840176
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58B6840176
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 20:32:52 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-3ec6c10a295so4426239fac.0
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 12:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767213171; x=1767817971;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VtXUTci0ZK4EY9cSltvam3Xt0m3SMX5Li71STX0R2as=;
 b=Qg9uP6L7yPp8unhB5yKQJAF94A7hEMo7ph0QiojeLjBG2OuVtexuJeYsS+GVvzuCML
 Ncjrdzchs8nL4R9UUeAZjgTtHS7i9lGxsHiQHDj+5auuwY1fma+E6ASEWbgNezEtzR7v
 t0YFm1l8TDcN6hzzByNhtsmUM4Nsrsjqe659pq2qaEOUhXOIPxQDOvVR2tn8T3yLx+BT
 ZgbYBnmuE9O/cgb1N1U4jbhmr+5f5Uqgkxxrm8t0UNCg5MfhqNbN+uveGfw4tMRokvlB
 QJJBGWLvZ9y2YSRvuflGg+M6dQHiVNlZMGIEx8t32A1xXGJyJ8M867XR26kWh+Xi9105
 FDHw==
X-Gm-Message-State: AOJu0YwZvnNo9N1aaZ5QLPi1nvv67tiW0WG3JYOH+ud4qyigwopzZNCD
 GS50cTP2KtcxTOPusIS3oi2B2Y7jwPBCrd9/maNCMPYmkg1xN1vTMQLufahk+2xbGY0=
X-Gm-Gg: AY/fxX7U//CxCSMqbDffypn9+RiSal3BWEZ9FlQ3ch56Yo0iC4KXVMaCs1r6HcZIsa5
 c9OV3+KX60klhc56MnTrjVxgUDCV1c+loOWQtn4145IvlObdhdYTNhBoC9XMSl7cRTduBSbOCnW
 eKixBqFKzLr0J7AcoL3SFeZeNdn3h5zkG93GyKxeI3HVFxVi5jh17dVLoIl5yZt7uidLIsrF2i+
 rzid4x9TqbEpuqiGtq4F55gAV6rIihIA0LueUt5uaRNDGAUPYuklVBIEvpfCh1t1AQz41tEmP7y
 OeQeeoORfZ+8cANAw4iJIlvawt97dfVGRt378aWMEbBES57R2kldb1u5W2xkBkzOMgIGrVwNm4n
 4lz/j1/tr4s2arj3TSdMZ4v3I+CWs1/nPP5uRfjBBKoPzW7yEUwuuF92wSs5WFIwMRGWjVwbS9k
 FDXLizRpXwjeHh+ZuCH9mzfTv071MDJFP/bkxFdMMZJysSPH9D6EX6ZI4DB5RYtknsvnmyQWVTF
 MlsxVX0TSyrHdmT4ICqmGXV8+0Hn8WMuHlCWLhB8UIYFH3aqFlixDw=
X-Google-Smtp-Source: AGHT+IFRSwBSQC7v83ON1LHoM1ow9LnRu7kokt2ndSQseAXiBSmJbwVCaIdaJLjIrBW/bmWbd2ShjA==
X-Received: by 2002:a05:6870:970b:b0:3e8:9706:eb4b with SMTP id
 586e51a60fabf-3fda581b7camr16829738fac.33.1767213170950; 
 Wed, 31 Dec 2025 12:32:50 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaac129c7sm20990869fac.21.2025.12.31.12.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 12:32:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 13:32:48 -0700
Message-ID: <20251231203248.4109970-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767213171; x=1767817971; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VtXUTci0ZK4EY9cSltvam3Xt0m3SMX5Li71STX0R2as=;
 b=fJUFSj/0WUmaiYfybwKEmJ8SCiDzl+rpxnrxaom1aej08P00y5W39iZ5p+BqqVeS+/
 gFKfrxzDOwdIZi8dnTl8SCU3g5EWUuPTEaHNsYq9dgynwf2sDHk87x1fDnRdIHbDGBSw
 bgvG8dOCy+pglaxnnbNToysDTecQlK1W9NaIJ1eHX/ArMwE5LWP1uR77g+zZgwLyPaFi
 0Ma3mSdV6+dU4Gn+fn7AALglxKHegAUcePC7zEfhIGh3bBG/7gjSN5Zxeqe+YfoO5aNN
 VagjaNPXMFIDc8yKxTSZVQpxiaBYTyaKjUOuEyBdRnjtDCq//bJXCjh5I8gSv6Jzc79E
 6pnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fJUFSj/0
Subject: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml-clib: bump to
 version 0.2.15
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash    | 4 ++--
 package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
index fdafa0b28c..262c3522e8 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ruamel-yaml-clib/json
-md5  70ca03596450ed0ad19393620c51a4c2  ruamel.yaml.clib-0.2.14.tar.gz
-sha256  803f5044b13602d58ea378576dd75aa759f52116a0232608e8fdada4da33752e  ruamel.yaml.clib-0.2.14.tar.gz
+md5  1fc58bc3b04ac2871cb30ce29a117b40  ruamel_yaml_clib-0.2.15.tar.gz
+sha256  46e4cc8c43ef6a94885f72512094e482114a8a706d3c555a34ed4b0d20200600  ruamel_yaml_clib-0.2.15.tar.gz
 # Locally computed sha256 checksums
 sha256  f8ad7efe71dde909f2d694f7dc69470d3dbe07c001c0b30c6bd9951e472077fa  LICENSE
diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
index b44bbf5187..0eb34e169f 100644
--- a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
+++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.14
-PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel.yaml.clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
-PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/d8/e9/39ec4d4b3f91188fad1842748f67d4e749c77c37e353c4e545052ee8e893
+PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.15
+PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel_yaml_clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
+PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/ea/97/60fda20e2fb54b83a61ae14648b0817c8f5d84a3821e40bfbdae1437026a
 PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
 PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
 PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
