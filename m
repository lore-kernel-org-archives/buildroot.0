Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C16D3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B98B240656;
	Tue,  9 Dec 2025 19:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtJ7B5xFnN86; Tue,  9 Dec 2025 19:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A05404CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309292;
	bh=UHWfuhGp9eMMCBzcP3uVcxwr+63e0dYxwFeWDTgcM7c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nQTPAQpiK2Uzfpqxpds+6zqx6+XIU5mBaqoXjMhGzvaI4KFoa3SrxgWHSAbGdzEbz
	 29xFTjwt0QmS2eYYfiyQD6rGD0VQuiFOzxBjH/8iLDQ5SdWiNTSMdbx/BUQPakg+RL
	 gToIA5m5Ge5Y74KUEYYRhqPHTvdi+p0P7x0o0+RgaCR4IPYw19lWqnqc73KA4gtN8C
	 mJxw8b3ysGpftYWwZe12Zm4Ephy0mKbAvn5KMFeAnD8nhfDFMZ4HWtU7ODv52dlpYR
	 vP5qFUWHVq5+SfkJkWKUmbGoRXY8zMYI1FdPSEmCkyEQYtJOYdJZ47haBf3P7jfZlx
	 I3jDRUSRLXwFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A05404CD;
	Tue,  9 Dec 2025 19:41:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 058DFE7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E037484732
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4U68plV6cKi7 for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4F5184727
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F5184727
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4F5184727
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4680AA4C2C5D;
 Tue,  9 Dec 2025 20:40:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-1Cc2;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:24 +0100
Message-ID: <20251209193951.1000100-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309214;
 bh=czpYf9YJ+4bFSXINFun1Q1Dk4PZY6JMli5FFpqukaik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=m9fgiEaWDvVqTcKxK7alh5HJc0eD5FIm7THdEEPtN8DMyuO1xCvEa9+42cCuustTp
 7xtGsSdVIkz0Pia5Ge5ONDX+KmXRNhUTPGQpW8jjZ0pODDn+MjV77aKqopJDhEr7AA
 amDegOxSN4dXS+D4S/2JzsU6OTgniXLKZ6DNoyk/nMg1rxF7sUbvE6YespGtPemsMk
 BMfqBA4kB0lEiLppz7tkROIUvupbYntUmU4hkCvAIdnb9ZraC+h0ePjhd6/AanJ4S6
 Os9xLYmrZAXt7/vhjkuWZKTFFfz8u3sb4I++2+qnzOcezh+4V2f4rAniq4+9mcnXL2
 ZHNRmEItC+kvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=m9fgiEaW
Subject: [Buildroot] [PATCH/next 04/31] package/python-aiofiles: bump
 version to 25.1.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Tinche/aiofiles/blob/v25.1.0/CHANGELOG.md

Added dependency to host-python-hatch-vcs to fix build error which would
be introduced by this bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aiofiles/python-aiofiles.hash | 4 ++--
 package/python-aiofiles/python-aiofiles.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-aiofiles/python-aiofiles.hash b/package/python-aiofiles/python-aiofiles.hash
index f68b0b55b5..0016fd58c8 100644
--- a/package/python-aiofiles/python-aiofiles.hash
+++ b/package/python-aiofiles/python-aiofiles.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiofiles/json
-md5  530273426ff7ee50283e52186e185c81  aiofiles-24.1.0.tar.gz
-sha256  22a075c9e5a3810f0c2e48f3008c94d68c65d763b9b03857924c99e57355166c  aiofiles-24.1.0.tar.gz
+md5  7a92207aab48342239959dc5ccffb81d  aiofiles-25.1.0.tar.gz
+sha256  a8d728f0a29de45dc521f18f07297428d56992a742f0cd2701ba86e44d23d5b2  aiofiles-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-aiofiles/python-aiofiles.mk b/package/python-aiofiles/python-aiofiles.mk
index 79e4a2cacd..aeabb42d22 100644
--- a/package/python-aiofiles/python-aiofiles.mk
+++ b/package/python-aiofiles/python-aiofiles.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AIOFILES_VERSION = 24.1.0
+PYTHON_AIOFILES_VERSION = 25.1.0
 PYTHON_AIOFILES_SOURCE = aiofiles-$(PYTHON_AIOFILES_VERSION).tar.gz
-PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/0b/03/a88171e277e8caa88a4c77808c20ebb04ba74cc4681bf1e9416c862de237
+PYTHON_AIOFILES_SITE = https://files.pythonhosted.org/packages/41/c3/534eac40372d8ee36ef40df62ec129bee4fdb5ad9706e58a29be53b2c970
 PYTHON_AIOFILES_SETUP_TYPE = hatch
 PYTHON_AIOFILES_LICENSE = Apache-2.0
 PYTHON_AIOFILES_LICENSE_FILES = LICENSE
+PYTHON_AIOFILES_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
