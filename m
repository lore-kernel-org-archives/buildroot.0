Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC60CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52BF360F33;
	Tue, 14 Oct 2025 18:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 931TtcPllOiA; Tue, 14 Oct 2025 18:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78DDE60F92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78DDE60F92;
	Tue, 14 Oct 2025 18:53:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EC24294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20F6983E12
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wCWsWCgBiS7 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:53:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 242CC83E04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 242CC83E04
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 242CC83E04
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:53:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA2C9A4C6C3C;
 Tue, 14 Oct 2025 20:51:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49012)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8k77-000000003qG-2gtV;
 Tue, 14 Oct 2025 18:51:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:51:10 +0200
Message-ID: <20251014185113.3583315-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251014185113.3583315-1-bernd@kuhls.net>
References: <20251014185113.3583315-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760467874;
 bh=Hd9nwzDeK1J6lmO/3l4nhO/5aHzpGnx4nIvJ/R8lAB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MwP9oGXPw40zF5d9I5ayOJkaPnrlwb8L45NjYXv3/RgZ19C/EUKtXUh9rG7TpMZes
 bSo4ue3IjQImKH0oidoZsFhvKZbe8YHrfEGv4tG0LZwuwaTRz2ju1OSP3t3VeO9auE
 E5onSdGScUiZmP6eVnyWTjFyBYUjwdiSSWxVDjmNKFELn7UZq6RUNdVDcNYIx75/JU
 RdNDqL8SDwk1PBYMSqCPD9CjQwIjjQMd99QnCC8euUXr4+5CcNdZq4PmylXSeLI8cS
 CcVMSLLFd+qzw0fXJ7YkwNYzzJ66RjMn0TfsbHIOfoSX/gPrCUe2z4PpzENN5PhLp5
 sVSNEHwIK2pHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=MwP9oGXP
Subject: [Buildroot] [PATCH 11/14] package/python-zipstream-ng: bump version
 to 1.9.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Vinicius Tinti <viniciustinti@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-zipstream-ng/python-zipstream-ng.hash | 4 ++--
 package/python-zipstream-ng/python-zipstream-ng.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zipstream-ng/python-zipstream-ng.hash b/package/python-zipstream-ng/python-zipstream-ng.hash
index 6feb23834d..4360cd07b3 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.hash
+++ b/package/python-zipstream-ng/python-zipstream-ng.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zipstream-ng/json
-md5  f30b8347aaceee3f4ddc01bda851790a  zipstream_ng-1.8.0.tar.gz
-sha256  b7129d2c15d26934b3e1cb22256593b6bdbd03c553c26f4199a5bf05110642bc  zipstream_ng-1.8.0.tar.gz
+md5  eb08f32b64b28005d5d3846cf49aabd3  zipstream_ng-1.9.0.tar.gz
+sha256  a0d94030822d137efbf80dfdc680603c42f804696f41147bb3db895df667daea  zipstream_ng-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  LICENSE
diff --git a/package/python-zipstream-ng/python-zipstream-ng.mk b/package/python-zipstream-ng/python-zipstream-ng.mk
index 289e03b10a..35e03d041b 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.mk
+++ b/package/python-zipstream-ng/python-zipstream-ng.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZIPSTREAM_NG_VERSION = 1.8.0
+PYTHON_ZIPSTREAM_NG_VERSION = 1.9.0
 PYTHON_ZIPSTREAM_NG_SOURCE = zipstream_ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
-PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/ac/16/5d9224baf640214255c34a0a0e9528c8403d2b89e2ba7df9d7cada58beb1
+PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/11/f2/690a35762cf8366ce6f3b644805de970bd6a897ca44ce74184c7b2bc94e7
 PYTHON_ZIPSTREAM_NG_SETUP_TYPE = setuptools
 PYTHON_ZIPSTREAM_NG_LICENSE = LGPL-3.0
 PYTHON_ZIPSTREAM_NG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
