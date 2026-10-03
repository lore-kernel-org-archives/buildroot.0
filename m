Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077A2CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C12F48100D;
	Sat,  3 Oct 2026 01:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_9wtLoR7thg; Sat,  3 Oct 2026 01:48:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B79BA81089
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790992124;
	b=mZx395dHJPndwaymhkmrvYSIqhQUb5a36mB0dZglWeXJzZfreAjXtTJrSPXdbwz2jW98
	 1ikLyF4NV0sTEk+1iEEhvIlmlE31ROiiwurKMaiI2dOL5vP7TsICk22TKqsrJH/p45sVH
	 17zua0qnu/i+pCaOivD2kSoiL3wNx7lyGE5xvPkhYyL5JL88ZyXrMmZMHA1/6wetYdi5L
	 t2nmSapOBnqcECpDsZVcv9mM28Q2bNJSsM7jqlN1PVv/sO24TWOc+TaMNlGKsHpo7QnhS
	 RMu87eqQKMx1nc5CYHRPIN5GxqgcqKpkTVOvKoWzhfHsp8OSo01r+o0Pce6Ln5mCh7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790992124;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QL0oZMuCpHEE+v7Se5S0fJWWb/sh7htDlCBuc5yXK70=;
	b=OtNqr97I6WBqjcNhTT6x/UprG3aO3DjK75KTgxv1go9QDvhMhOA4JB3Lo/RsmhFXf/vJ
	 YlJySlZohDPfEXisZkCbMTyQAN3uJqIVfsLc0yIgPEC/LRGE2QDXN2gW7BnwPa/ANu3oZ
	 2OLP/koaZmSfEM4QXB7eRop/Ztg6zaXn+zusSpnmnQ2rgl1ULyqsLDFCcslUYzt0dU2rp
	 nN9dL5OP9Q6Nip29a5dKY/QysEOUHL+TwVTYOkhpDd2ggMdpIqiB7j1iW1JzQqZxqnu2J
	 t5CQBgPEvTbLnB/WkBKe4R82NW0HSxLrD0FGlf+UjK5SebL1KoiNW8XeqdsPDC/aPHg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790992124;
	bh=QL0oZMuCpHEE+v7Se5S0fJWWb/sh7htDlCBuc5yXK70=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oxpPpdJQZJ9hMDJmN0EmMs2NlcVRneD7Fl3UpCVIgKva4uuDsuf5ti+8wGJvhbdyW
	 uh3eYjqZDV/uCzGCLRxW46EgPiGRk1bw1aURIEAqQfmecsJxs/i3rOA/yFwULJH8lI
	 jFNq0OLIXfZSa1taKdy49vUqTqW36JBarsB45OJqz1Zs5WLPNN9w9AFG0iFn5yaKDK
	 wCW0wXAe8xInccrlHrSNqzS5E5k71/1pKSGXFzzFxQH6ExVUJ2VDovo1YAg/kfVs3U
	 mh8Xj5XQ1zsjNHjYJHt1rI6clEMEuFuqQg108+jwlRyQmcTq1wwwzBCLEmuM3vYT4i
	 Y0Za0gn2vDhVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79BA81089;
	Sat,  3 Oct 2026 01:48:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAECF1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF5E060666
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AhwApdQJmQ0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:48:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B7E3960650
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790992122;
 b=dfMH7/eAI3U4wMPtJHd4S+LzO3L5ZynfMRXceH4LGo2SN58wrrBIsbvCPSbL7l8psaxE
 /z4rLyO3t/AdTlp1FRlq6jEiBjjCR6875+vbED1yH2+XXGJ9Nzy8z+EpLQ+ofpL4vI0JU
 YeYKIGQPPCe9RvKGyxpU9MWTG9CW2CDOHfiDKHy/TUVjks4/f3IAxF452HOv2wkpJ5NnJ
 JNe7p4CfHaWiZnkggPNLBl6Qe/lAtis+8QvZ6x4KxB0tXWROE4M8cxYyTvIEeZJ47kZCU
 Z21i+X4WP6AWj+LcJoYZnUAt4DLyK9a2Zzccbb58O+OSc1YKfRKmHgRkZgdy2HQadVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790992122;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=3vpP1z06wAhLcjez9XErogalpCEKeG3Hh8o+9JQHKAo=;
 b=GH3gm8nqUlU0rYa0wtx10VUCDC5hiF6cFyPLKDlxokB81+ILzUSBtBlleaKm+Bfw1wTw
 qJff/jfGgmMpvhp+3hbtJd0bkdl++yoJxNo3LEGjyqfY9yfE9k/81tjodlAGq9yV7HQ8c
 DtVweAthCW0XHfcbrtbMiaNVlwjyrxJnjMaZMIWnZdKYZDbkZh/0O1Ok3WY8D2B2JRDmn
 pxY6M65shhbMT7LJ02P1EkQGven1uR9NHpz+JoZWwGrDXE2HqkhTnYM6qLZV6GktWzMMf
 G5NkdL4VjB1xyNicb2FCYpnfRTKgybrhRCA5wCT7q3R3DHj6Z8lwIuwpZEYbEQlRqTA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oMKduRKi; 
 arc=none smtp.remote-ip="2607:f8b0:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:30::10; helo=mail-oa2-x10.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=oMKduRKi
Received: from mail-oa2-x10.google.com (mail-oa2-x10.google.com
 [IPv6:2607:f8b0:4864:30::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7E3960650
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:48:42 +0000 (UTC)
Received: by mail-oa2-x10.google.com with SMTP id
 586e51a60fabf-469fdb78b1cso57872fac.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790992121; x=1791596921; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3vpP1z06wAhLcjez9XErogalpCEKeG3Hh8o+9JQHKAo=;
 b=oMKduRKikh+9H/d+W4S/QPcLhUcDdsqI1/9xgISgCsjGWvP4FqbKQ0K7JFWWfNsg7S
 BEaCFN5pBkvKgc6WkxDbt3vNoMTpoG586glXfSONm09eiOsvUBSkBL0M/0uQixyvvMpU
 fLwAW5bmHsfn5ylsXnmBDpEX0uqzq9pr1mDGvvuGF3A5Lv3HTiyZw2KleMi89kL/IMwJ
 eej7Tq0ki1gEuJ4YzDe32SxtUHMSb5W2eEj1sOXE950Z6QKfCfW79A/mPWZLJpinJrGG
 QNR5ZGrOwkk1I0y6chtPSDH+9uMHJO2sdcqdgak1a368oknCqWMG+7AYSjQ9aojsVCCT
 N+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790992121; x=1791596921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3vpP1z06wAhLcjez9XErogalpCEKeG3Hh8o+9JQHKAo=;
 b=0TPa1z/a2FCY9Z0w1tKwK5uLGHoF/zkoPDWXB9o9+JAQUYoVEsFzW+0rRkFgMWnVZW
 EOTDwsE1YR8nobTVhxmpBp0hfm+KPImWJtJZU7Vj9iFf+15sg2RGSEpvdcLrB9ivW5GU
 rAbR1i/6KYw7U1NSzw5Uy++kdDI51DZTtwrXrRBGd3G9qe7lZ3B+yRTnCloMec39hd/D
 aKNlz4jUMHcFva54KKXO0z3Qu/mKg2n9QpIGidc0LDkXrcfeVNyWV28iohwwzVG2JY5j
 ZX10Tnj+U2OnmO1CQSo7awzN2g4+PLdgvj0gfnsWBe7KBqYl3zm1NIfQEozmM7ltterr
 m8AA==
X-Gm-Message-State: AFq9FYK9xD4+TTUbHQtJ89JrP5igOaIgsaJqLpD/dbING92MRrg2rcpH
 xPPmysMPZQkeneq2Ae2oRgTbwg1EPE/q2C9Bym3GPH6qFPC1aqKI28UZZ/QGxA==
X-Gm-Gg: AYBFou2+AxaonjnkC9lndJKTQQWdN5JRIowb/W5uqmisv1bt1lpVhe3KxC+i5eNy7X4
 j+n2It33jvi+KUgkZcZpENZTfPZjySl0M/kmLC/73GQT1yCT1kvEhA9IEfpSpUjjUntlRa2OeKB
 oO/ECfPdwpqdM6VjeNZ/N6L4v4K2q88E7IQCsr57uxzNWIhWz5j7xLGKObbqy/2reZHRsBAvMFw
 fdvqSZ07MHcc7EGCbuagn5W0LPN8kkd+xNvNwbviH2sS7jRehieDMVA4glrJ1RTwHj0ZBfJpB0B
 gFpO+vje8h51N9RkUoQkVlqejEQibColuBs71T/6ZJsyvEQp5YzTHIBgxRhlbDmSLktzpsVNUXk
 3reQg61BqvL3PfzLiUaJbE8NzUT6uuuKwtBdoXTMIMpqiMszxDBea2STK9AN/Ap23OQ0cSsHZYG
 Yfmlp6lDgb3I12RH5497WT8F8agwO1CrdbRWZaCcs3DXRB/0n8FN6doentuVRhwR9IzmH7rBWud
 V0sgorH8e3DAlc/0BnKKYDupBT0ZWcuxFAnE5lq5w+Yhujqps/UYXXYfZzhrJudOYu2MIUsR31t
 aHL5i8TRfMRKYOKJLs5b0bR8rXXc1ZAGX1wVIZ6JAfeH8m2aMdY0xE3LcoiX+tbRgHJzkMkHhmN
 rWjIaFGpEe3yjXyciPJaC/fas6cqALzWBzKsqkCzE2NQ=
X-Received: by 2002:a05:6870:4210:b0:48f:e107:317e with SMTP id
 586e51a60fabf-49e15f24273mr3953067fac.49.1790992121116; 
 Fri, 02 Oct 2026 18:48:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-49e16e577c0sm3990524fac.10.2026.10.02.18.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:48:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:48:21 -0600
Message-ID: <20261003014837.403895-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 6.1.5
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

Switch to the setuptools-rust build backend and vendor the Rust
dependencies. The pure Python implementation is no longer available.

Propagate the Rust architecture dependency to python-zlmdb.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/Config.in         |  3 ++-
 package/python-cbor2/python-cbor2.hash |  5 ++---
 package/python-cbor2/python-cbor2.mk   | 12 ++++++------
 package/python-zlmdb/Config.in         |  2 ++
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/package/python-cbor2/Config.in b/package/python-cbor2/Config.in
index ba9383f787..c0a114e1f2 100644
--- a/package/python-cbor2/Config.in
+++ b/package/python-cbor2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_CBOR2
 	bool "python-cbor2"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	help
-	  Pure Python CBOR (de)serializer with extensive tag support.
+	  CBOR (de)serializer with extensive tag support.
 
 	  https://cbor2.readthedocs.io/
diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index b4d3025889..4ec5434b49 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  21a7e1096c25ef19a81730e2c0ce05a6  cbor2-5.9.0.tar.gz
-sha256  85c7a46279ac8f226e1059275221e6b3d0e370d2bb6bd0500f9780781615bcea  cbor2-5.9.0.tar.gz
+# Locally calculated after vendoring
+sha256  c0be697accd3e106feb9a082f52b6c6e2b83428148ab78ce6732a76c380233f8  python-cbor2-6.1.5-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index bb8944f861..b35fba187a 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.9.0
-PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/bd/cb/09939728be094d155b5d4ac262e39877875f5f7e36eea66beb359f647bd0
-PYTHON_CBOR2_SETUP_TYPE = setuptools
+PYTHON_CBOR2_VERSION = 6.1.5
+PYTHON_CBOR2_SOURCE_PYPI = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
+PYTHON_CBOR2_SITE_PYPI = https://files.pythonhosted.org/packages/39/34/d443914ea562a985ccb357682e17b7190d5d58eff797c741379be47a8f31
+PYTHON_CBOR2_SITE = $(PYTHON_CBOR2_SITE_PYPI)/$(PYTHON_CBOR2_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_CBOR2_SETUP_TYPE = setuptools-rust
+PYTHON_CBOR2_CARGO_MANIFEST_PATH = rust/Cargo.toml
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
 PYTHON_CBOR2_CPE_ID_VENDOR = agronholm
 PYTHON_CBOR2_CPE_ID_PRODUCT = cbor2
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
-PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
 HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
-HOST_PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=0
 
 $(eval $(python-package))
 $(eval $(host-python-package))
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 007ca72723..884cfff182 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ZLMDB
 	bool "python-zlmdb"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cbor2
 	depends on BR2_INSTALL_LIBSTDCPP # python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
@@ -20,6 +21,7 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	  https://github.com/crossbario/zlmdb
 
 comment "python-zlmdb needs a glibc or musl toolchain w/ C++, gcc >= 9"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
