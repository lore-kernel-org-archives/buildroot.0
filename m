Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961DBD72347
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 07:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EFAF607AB;
	Fri, 23 Jan 2026 07:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygRzhHB0Y_7V; Fri, 23 Jan 2026 07:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F14B56060E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769154296;
	bh=3p3jcTiNHUtO3KVr79K+2gcuqKbSmJ8DTFObyLFujaY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JvZ/GfeGzZ42hy1D4jW0NhG1TgP87bzhQsFR1x1HhXBDVRGzD+vL6UdJrGDGQH7t2
	 qr1C1ShmRMCxZYXWS1erg3wGIG7vPIy93/2GaGUj7ZgfPsNaTTImyjgug9m46ZocwQ
	 YjCBab0fxoWt0dpM+qx3OkKE0uPkfOeAxbnXSAwHA3Ga9gyr7fk8h3BHOQ/slqiDxd
	 23yJprfZLhxOeZpjCmQZEMbkK5+AraitucPsAdYUOjbWR5zF/WZdeK3yRLcD4KJu8+
	 xauxsG16k1BEHg0wqr4zXilrBdVRRXBhgqkOYj0QEB6DrNmlDICOVR+dYfp2B67YFQ
	 vBPWlb2nsK04g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F14B56060E;
	Fri, 23 Jan 2026 07:44:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC49E23F
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 07:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB0A6402F7
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 07:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhNSFDg--7j4 for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 07:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D52040128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D52040128
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D52040128
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 07:44:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C700CA4C492C;
 Fri, 23 Jan 2026 08:44:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49710)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjBqb-000000006BI-02WH;
 Fri, 23 Jan 2026 07:44:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Jan 2026 08:44:49 +0100
Message-ID: <20260123074449.3991189-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769154289;
 bh=quYoIkjq+Ms3ewDgcf/Wj1aaGaUDjKsabiy/hUzviyM=;
 h=From:To:Cc:Subject:Date:From;
 b=QK9jx8xzp0I2XOXubg7sA/xlfKBEogvtAXBYB5wbMOXG2aaMFJ6pvLAKPBZ7oB9qn
 xT7GnmBYcqNJq1oqHliwfhrFSJjXNh6fyexWJzQfg089KpsETAtKrF8xX1ypPz5IvK
 N5nzn34LRAIroiPCPFvACIK57wgbfDkzfDz6Utd7bzyxMyUmMdT6q1LC+xxg9A36t8
 DZ+cR8HEDL51Zy2j69XePcIgeRzphjtA2hcphTnUXiENehripo8bpVDm+AldOYTD8L
 uZ6PpfwH8uop2vfNR0qJf6p8btsXhS+cnui5AMBYc+z9eK6fgJUOMJD9eES+5Lp+sD
 IMi+GGAQSMyfg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=QK9jx8xz
Subject: [Buildroot] [PATCH] package/cmake: bump version to 4.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://cmake.org/cmake/help/latest/release/4.2.html#id2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 7724fc4e85..32c334c928 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.2/cmake-4.2.1-SHA-256.txt
-sha256  414aacfac54ba0e78e64a018720b64ed6bfca14b587047b8b3489f407a14a070  cmake-4.2.1.tar.gz
+# From https://cmake.org/files/v4.2/cmake-4.2.2-SHA-256.txt
+sha256  bbda94dd31636e89eb1cc18f8355f6b01d9193d7676549fba282057e8b730f58  cmake-4.2.2.tar.gz
 
 # Locally calculated
 sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index ef4f6aa98e..63ddb927fc 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.2
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
