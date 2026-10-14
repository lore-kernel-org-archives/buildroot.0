Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB16ECC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 21:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4254067C;
	Wed, 14 Oct 2026 21:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOR58fnp-u72; Wed, 14 Oct 2026 21:10:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A4B1D406BF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792012259;
	b=jvqQqTj9lkBgxRG4JmPEowwbMPC5/9xUQUzIhgp9gZIvJrJJjehhXO4hdSxV0AQa1lD3
	 qPx8zC3BFVNqkSLru614qMRH5wQh7Ex106TYKllPa2nKyah3vwHTAqSYZMn3hpfk7gv7N
	 ERPKfoiIwCAjKuG9B4FZ8UUm4Yry9SKgL8TdrPUavzXVX6cO4ic+D+BW5DYgNvpA0vU16
	 gAvy+GjXpC59VHmeyAU1aBB3L1jx1VDxbVPCwt4SC5p7V8oJHGWImPRbhKQ0h9/yZR/m1
	 p51KVQDUkmylNEdAWyyYgb8Boq8Yb9GODB1anMIScnSQHne4eobQDarAX4zSoN+Z3Kg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792012259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LLwKhbqLknqcMl4sYm4/0PePAe6/07cKkRbf6chojRc=;
	b=mPL0nc0RzFMzeQytJ4ovJtZMK1X+1W7ZlEOICsrvkbEyWuEZRp+yCv1RpkSaJ/+iDFZL
	 X8PGCSmvz0qxXB38pbNgI4w5mAgc6vzUabzgfkmlJgCrCB3RXAwCMDZiXNNh7KBBdDYVD
	 RKrruGcn1k8MDJHx4jnduynHBEbs0Zw9Dpe1uQeOnL7JtBd7FcU2PqELoVMf/cFBaNHn/
	 ovXqrVkgm5PJP1wiDn+t65WLe7EoqCN3LftQV3TlMNKAd/yIcFnx7qevw+LlCMJG6tclG
	 QbLhKSanEoGjYf+rwbWmW8GPx6O3gLstCtdx7DAGtsSh3M0xA/k+XpZ+8+mu4uLbx/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792012259;
	bh=LLwKhbqLknqcMl4sYm4/0PePAe6/07cKkRbf6chojRc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pImK48mqVJdgoMkvt/Z+xjznDYX8CS8iMPDKmmY2BSzFajgqJwFvJV6e0ZNPcblOh
	 SK2TIjAuA7YCSThJo/lzN675iNc5ToWPAG8tK6UbskTn/wX8BY+vvcFe1uQy0z2tOY
	 oXV6zd6rdGaLnG2hkF08piRM1m+3ld6yWFFmDbOXZY3L995CBb4U+TXXGThIoYgHgw
	 SZOh6UFx7bE+kCD4bTU2FeR60QmZRI3XqTC5h7lE2vEYXWcieuapZgCsfMaBiOEVXv
	 JZQVRJ10cYC+4t9WkinNjUZi3/YkA9K7SrDn+gL/W6X38yq+riVQlpP6BZogPNZJLq
	 SgTdI2h0HgjPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4B1D406BF;
	Wed, 14 Oct 2026 21:10:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD581A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3E116089D
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQLim3mX-PYa for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 21:10:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6C6E96077F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792012255;
 b=TmNsjJvk2a5IRLmNIAKeEJIvkhCAMvSjfNq2j/N2b1oaStsJre0rlwK7kuiHv4ZMKHZF
 Lhc/Mikn4FVsqumgiQ5HlSwcDsYI/3+csktbiHHVvFw7TqWyQnbw1N7Z5S/wo8gDDveNu
 /2TE6VU2IzoFeX4JdiVbzTvfZLAIjom0E0QRPr1qDm7RchSL0uRRTZK93BVAvQVF9o61M
 CzLp1JOYgb622M1gSs41aQnJqKqC94IGXLGuDlg0MllBdRL4la4lq0mw1R+SiZh1K659i
 ZEOFBmNrMmgJeslWV4wa20hQ/DhFljRjj9+cCvfLehJQaTkygKiPlX0rdlKIJ9u3Xyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792012255;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=iu9WyQN7IlWelsIvsGA0MzHBincud+7U3clCsQEh2xE=;
 b=WcNLB9/jD2ZzOeTJqnRnjWqaMj/VgagPpkZupJ1vD5cJTrDjIONjzwo/Qox4nLrDYPRO
 wbVcfFHG+pg0kpu08RkFhQds4vUbkk2hNel4Dsi0kZN9QrCHIYq36gY43/g/0xOmi9Nzk
 8vepDhfd5ZqvxxVyNZUNWqtv7Ziiq+jF33y0FVrE42pphk3ql8c0TH91GzC5DGCYExyds
 7tfNUmU7zHBoMDIPXF556SHgvWjgxnw0a/2eemhCgfxU6xmnklmIfAVaPE2Lcsypg3ysg
 WKGq/vRXrOADtbt8BHsRB9fe0rB/8ATGnf/e+IbpHQ2kw/1QnGAVPBqJiHtTAzMhnZw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=lwkuhM55; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lwkuhM55
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C6E96077F
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 21:10:54 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2e5f8fe879so733268566b.3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 14:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792012253; x=1792617053; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iu9WyQN7IlWelsIvsGA0MzHBincud+7U3clCsQEh2xE=;
 b=lwkuhM55iAwj7jlABzLx68tOS994S38KgObnbQbXOeAjmFWgBbv3StY347lXCUuLVC
 20l3IqsXhkqey8ryic7dZhWlLJ6yOIv7t4LI6+6FtOFF5ewZSCU/T59cV3Ic304xS9Wc
 rEmWWctrxCV1We2HkMCKynScTq1Wfz2hhMB01CVG8xXbaZVV3IjI6fSiCf4NYpOOYPBf
 vX2xzC6lVwpWeweo/Hl19jWHF/UHQeyKGiQ9uLaXSvn3vqj2dL0PjE/isluo/6BuBPgV
 GXo+h7ADe6zj9A+GFw9HbIkv7vBPoet3ti0TPEMKyuZKyaYEk0MO4uSfcPxKe/WLLmxm
 UaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792012253; x=1792617053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iu9WyQN7IlWelsIvsGA0MzHBincud+7U3clCsQEh2xE=;
 b=uXQmIQ4La3z/eRnRAlrOGr1r32tdwipUPW9rQ0rSQwX2u9i3ois0q5lEs0NCDj5MD4
 C/X/7qJHi+B4h13Ee4bR4b/43a5P3ZZX5n7qUU/V2/OhvTYJHQcHGLwiJQj41rO8vVZj
 XJmPyb0v0ZPS06kxIcdCfDQr3sYL74RwAZQDeJYjdDfvr1qw/tnGSi16pPuBNHanaVoS
 vUDmYUnwg/B5fpYmnMIYNiUL+Gu0it96bhDsrKE5in6UYxjoXkfTFFImF87kIyS8ecZq
 Ymd7X8mx0Sde4X1lUd4gwk2DgUY2VufL7mp00s6sIiVrBcEGYIcHFsTzkYkQ2xbEdMXP
 WgDg==
X-Gm-Message-State: AFq9FYIVbRH/h3fYjTx3AnNjHZEWGCdVKbmTDaLfuVmrrOsU+dcURyyq
 iUfGIrE07Iib8M1EYhiJB1PRlZ4U3JJActajGthKcpWzxQ987Wz16ltIvQVJ9A==
X-Gm-Gg: AYBFou29vv1iCAIIDEwDXiBYZmS3JIiCg97wFm2zWtQgPTGImMJ+gTOJtQHwr9clHaZ
 KRW+N7QyNJCpzpFG00l7Nvdb1Ov07+ll1B1jsvZXv9N9aEIT2AylnuhmA/SCAofcBRLJbNzb2vm
 UtTLQCNBEQo5jWEyQx1gNwV/R/0Nv1t34TQI1LGNAvL57POIqXySY9Z9pamg0aGg4DFbzGeh9++
 H3ROG2Qo0fgluvdqI8Xe48FG2L6MXFxe4Qav9QRqyWOR5JRNu5Hx2JBgnBhxRhvtzsDzgqCcAn7
 rI/xilxg+PnVwZVHOWpXhkGrDINxKnAT8MFsX8Xjxd5NoZ/hlPGZ0DQc9rxyvrsFsN6KiQZoZrK
 cjBnlRoIHQ4QoRF8ADJWMVL57iQfzGJaVUta4YHJtXGjGoxTRJO6M6HyBXfdKByTY+xbwirgc/t
 CRHIq9DqymbGxToMQpATBxmTS6e8LgshlyfY3PB5n3tu1+iOnYGbhqQ34rqJAfaud9fDUhX4inI
 BfeAuMmaolgmhwpKGazHrRn0blq531zADgtEsY97QMV/pY=
X-Received: by 2002:a17:907:9720:b0:c2d:f050:ad4a with SMTP id
 a640c23a62f3a-c31a9a33cb3mr1500235966b.5.1792012252894; 
 Wed, 14 Oct 2026 14:10:52 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3ed9f479b7sm31857166b.46.2026.10.14.14.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 14:10:52 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 23:10:49 +0200
Message-Id: <20261014211049.490297-3-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014211049.490297-1-yegorslists@gmail.com>
References: <20261014211049.490297-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/python-zlmdb: bump to version
 26.7.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since version 25.12.1 zlmdb no longer installs a top-level flatbuffers
package: the flatbuffers runtime is vendored as zlmdb.flatbuffers. So
the patch that drops the vendored copy is no longer needed. py-lmdb
plus a patched LMDB are vendored as zlmdb._lmdb_vendor, built as a CFFI
extension. Thus drop the python-flatbuffers and python-lmdb selects.

The build system switched to hatchling. The build hook needs host cffi
and setuptools to compile the LMDB extension and uses cmake to build
the bundled flatc compiler.

Update the license information to cover the bundled LMDB, py-lmdb and
flatbuffers code.

Changelog: https://github.com/crossbario/zlmdb/blob/master/docs/changelog.rst

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
Changes v1 -> v2:
  - drop the patch added in the previous commit
  - move the autobuild Fixes: tag to the previous commit

 ...all-the-vendored-flatbuffers-package.patch | 37 -------------------
 package/python-zlmdb/Config.in                |  2 -
 package/python-zlmdb/python-zlmdb.hash        |  7 ++--
 package/python-zlmdb/python-zlmdb.mk          | 15 +++++---
 4 files changed, 14 insertions(+), 47 deletions(-)
 delete mode 100644 package/python-zlmdb/0001-setup.py-don-t-install-the-vendored-flatbuffers-package.patch

diff --git a/package/python-zlmdb/0001-setup.py-don-t-install-the-vendored-flatbuffers-package.patch b/package/python-zlmdb/0001-setup.py-don-t-install-the-vendored-flatbuffers-package.patch
deleted file mode 100644
index 608074ea51..0000000000
--- a/package/python-zlmdb/0001-setup.py-don-t-install-the-vendored-flatbuffers-package.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 18c4d2d3c7c0c3104e9280ea717c68a5d8f1368d Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Wed, 14 Oct 2026 17:52:45 +0200
-Subject: [PATCH] setup.py: don't install the vendored flatbuffers package
-
-zlmdb installs a copy of the flatbuffers runtime as a top-level
-"flatbuffers" package, although it also depends on the flatbuffers
-package (install_requires). Both install
-site-packages/flatbuffers/__init__.py, so installing zlmdb on top of
-flatbuffers fails with a pep517 installer:
-
-  FileExistsError: File already exists: .../site-packages/flatbuffers/__init__.py
-
-Don't install the vendored copy and use the flatbuffers package
-instead. zlmdb.flatbuffers (the reflection code) is not affected.
-
-Upstream: N/A, since version 25.12.1 upstream no longer installs a
-top-level flatbuffers package (the runtime is vendored as
-zlmdb.flatbuffers).
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 16ed0cb..571615a 100644
---- a/setup.py
-+++ b/setup.py
-@@ -67,7 +67,6 @@ with open('requirements-dev.txt') as f:
- test_requirements = ['pytest', 'pytest-runner']
- 
- packages = [
--    'flatbuffers',
-     'zlmdb',
-     'zlmdb.flatbuffers',
-     'zlmdb.flatbuffers.reflection',
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
index 1edf993ecd..f6b8caebcb 100644
--- a/package/python-zlmdb/Config.in
+++ b/package/python-zlmdb/Config.in
@@ -9,8 +9,6 @@ config BR2_PACKAGE_PYTHON_ZLMDB
 	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
-	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
-	select BR2_PACKAGE_PYTHON_LMDB # runtime
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
 	select BR2_PACKAGE_PYTHON_PYYAML # runtime
diff --git a/package/python-zlmdb/python-zlmdb.hash b/package/python-zlmdb/python-zlmdb.hash
index ed1b6db8c2..e29bbea280 100644
--- a/package/python-zlmdb/python-zlmdb.hash
+++ b/package/python-zlmdb/python-zlmdb.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/zlmdb/json
-md5  4d96b46d1724b9d4cb6961874e5b4a9a  zlmdb-23.1.1.tar.gz
-sha256  ddcf680bf49352cabe35bfb5bfe3acbd5d6b8d481cafa508c423e0b18d654d05  zlmdb-23.1.1.tar.gz
+md5  186642d7df261a781631a734244f785e  zlmdb-26.7.1.tar.gz
+sha256  3cbc9447cfbf3b33dad0a30f7e671d467d72b41e5bc4e999b4f41914eff5fcb9  zlmdb-26.7.1.tar.gz
 # Locally computed sha256 checksums
-sha256  8a139bf325dcca11e0e476ce537bf791a6cfbeed8899a9b6ddc55238e180d230  LICENSE
+sha256  0ba0c0c595fd01ee19478ca417f210b75740f9b84ca937ebf783154e1cc01174  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  deps/flatbuffers/LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
index 70538ce63c..da625f9777 100644
--- a/package/python-zlmdb/python-zlmdb.mk
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -4,11 +4,16 @@
 #
 ################################################################################
 
-PYTHON_ZLMDB_VERSION = 23.1.1
+PYTHON_ZLMDB_VERSION = 26.7.1
 PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
-PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/56/b2/abaeb5419435a6224a0beb2b5edad621ec975fe4802297963ecf1728b883
-PYTHON_ZLMDB_SETUP_TYPE = setuptools
-PYTHON_ZLMDB_LICENSE = MIT
-PYTHON_ZLMDB_LICENSE_FILES = LICENSE
+PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/87/21/5b877e438d652f78bcf88aec83474b373f8ab1b98b6c0c5d47db3481d6b0
+PYTHON_ZLMDB_SETUP_TYPE = hatch
+PYTHON_ZLMDB_LICENSE = MIT, OLDAP-2.8 (bundled lmdb, py-lmdb), Apache-2.0 (bundled flatbuffers)
+PYTHON_ZLMDB_LICENSE_FILES = LICENSE deps/flatbuffers/LICENSE
+# cmake is used to build the bundled flatc compiler
+PYTHON_ZLMDB_DEPENDENCIES = \
+	$(BR2_CMAKE_HOST_DEPENDENCY) \
+	host-python-cffi \
+	host-python-setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
