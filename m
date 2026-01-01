Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A073BEED609
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 13:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D511D60AE3;
	Thu,  1 Jan 2026 13:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNSKYNhHjg03; Thu,  1 Jan 2026 13:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C1DB608B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767275348;
	bh=dJSxLzmRyoCtXOP97z2VwXw/bU/7ZNhUWBZxlsWljFY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=efoTKqYqBHIzqQPwOjW7SozNYTwGeaHi1TbfgLGQO2icBzzi6k9HlO6Y8Rqp53Spm
	 A1Xw9y1JiIQtocSbVe2hJnNF2rziZOdCKERuO86ZO03rEwH1JNU/yPDec4zR1zsIHv
	 YVvMOsFsdnoT3DJ+e/jzj4E8K5r0eVrG23KvArJKyOkKyp1OZ7fM/h0Gf4P4bwE2MS
	 O6TdtfErRnuRLMFLmyIz9HRSrTlgV4yUi0qQtwsx7tg0Ei2Ls7IUw0AXHGKfZTFhGg
	 kW9I+PssipQ5IJiVnWbAb8hKlPbIpIYUL8b3XvotsfOtyuEmmZlO2L4sC0w5r5+gOp
	 ntyz7n2H5T0/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1DB608B0;
	Thu,  1 Jan 2026 13:49:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A39519D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10AEC407F8
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjn-xp8sGPPK for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 13:49:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8ADCC407E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADCC407E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ADCC407E4
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 13:49:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57CC9A4C2A7B;
 Thu,  1 Jan 2026 14:49:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49820)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbJ2z-000000002H5-2tCG;
 Thu, 01 Jan 2026 13:49:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 14:49:01 +0100
Message-ID: <20260101134901.882436-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767275342;
 bh=3UkbKNUbosd8oB3eEdOOFLZ+HMxCw7D2xvem/JA9VvI=;
 h=From:To:Cc:Subject:Date:From;
 b=B2XClmqxzM/xsPqbXla3XX3HBOAqLdHX0m3ORKFVpvKsApSyI8Equ4OXDDnDcXmQN
 VdnCjleg8znCD4ju49FOFzZ0yDxyexgV96p9ELY7cVpo7uDQe9wmGnR2E7WnsnzhUQ
 gw6PItzvdr7/EGMtdVYfz/gTMRKdwTGeOdxloxbPqZywJbNuUJgzDdwrjlDHZDgtBP
 ft6BtcUNhrv78cjWGUMb+4Ddkjd5IHra2TVOb7eTHbffGxDtA1rkgBBzjr/c0NGpDQ
 lwAfXZeevSnJvb90/GQLof18GfpVtiAsgwpEuke54vDIDrxLtVTxwp5uU128LOPJgL
 STMUW6KZ+kp4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=B2XClmqx
Subject: [Buildroot] [PATCH 1/1] package/python-pybind: install headers into
 host directory
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error with python-pillow since its version bump to 12.0.0
which introduced a dependency to pybind with buildroot commit
5f446a8d6dd8715385d6e2df2714f064bf26243d:

FileNotFoundError: [Errno 2] No such file or directory:
 '/home/bernd/buildroot/output/host/lib/python3.13/site-packages/include/pybind11/detail/common.h'

with this defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_PILLOW=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pybind/python-pybind.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 7282c058f6..b7e5cb6596 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -17,11 +17,13 @@ PYTHON_PYBIND_CONF_OPTS = \
 	-DPYBIND11_TEST=OFF \
 	-DPYBIND11_NOPYTHON=ON
 
-PYTHON_PYBIND_INSTALL_PATH = $(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pybind11
+PYTHON_PYBIND_INSTALL_PATH = $(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
 define PYTHON_PYBIND_INSTALL_MODULE
-	mkdir -p $(PYTHON_PYBIND_INSTALL_PATH)
-	cp -dpf $(@D)/pybind11/*.py $(PYTHON_PYBIND_INSTALL_PATH)
+	mkdir -p $(PYTHON_PYBIND_INSTALL_PATH)/include/pybind11
+	mkdir -p $(PYTHON_PYBIND_INSTALL_PATH)/pybind11
+	cp -dpfr $(@D)/include/pybind11/* $(PYTHON_PYBIND_INSTALL_PATH)/include/pybind11
+	cp -dpf $(@D)/pybind11/*.py $(PYTHON_PYBIND_INSTALL_PATH)/pybind11
 endef
 PYTHON_PYBIND_POST_INSTALL_STAGING_HOOKS += PYTHON_PYBIND_INSTALL_MODULE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
