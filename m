Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397C8D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 126CB60BC5;
	Sun,  7 Dec 2025 14:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9iO8UUYoxl4; Sun,  7 Dec 2025 14:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF09C60755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118712;
	bh=GaAjMuBoEe/vbl8+bXlE2QAuQ29ceXHHAL5TOmXRgEw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oY54xjdw58uMj3Ho6FaKB0n0rsCui99G8dMpFYZNIubeXScH8QnW6rF7A3S8gOXG4
	 AbciAbtBlQL5qY1nGd2qFz2DtP4baKMODRGb4vQY850pEclu4o+WC6ro4gltgpGMs2
	 jQ/+igASGjdwHRJywWcubszkU72i6jtF4Sn9IpeJh+rBkfE2eD/0poVhtgNhgg3pTO
	 5xN2Cbv8+hIdc0hrCQhWrW9/WokaJnEIEvD1IE+HWkeoVrTxrlffqgjRLSTbIsNwi0
	 hDzszIcskjEs/d3f9AIMKawLFP8NLG+gxrh47pxLwThVCwNr3PkqRcS+JCSWuvGNhj
	 bLq9mbhFj1r7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF09C60755;
	Sun,  7 Dec 2025 14:45:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 303092CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DE858156D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PE1P8quciX78 for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2106A81546
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2106A81546
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2106A81546
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:45:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D231A4C09AF;
 Sun,  7 Dec 2025 15:42:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyG-00000000416-2YgL;
 Sun, 07 Dec 2025 14:42:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:22 +0100
Message-ID: <20251207144243.3696572-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118575;
 bh=PJx1w9nBieFPdXFStaBpxAXWRg8uwnY0zw926fHomNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gI1rdMXZ3uO0Wz71NEihJacHQ7uduucgw+UEEqXS5x0NNUQ+2uMYiRxsZmagI4u1h
 5K7nuU9qsihgbs8tWxIoeerr6GDmBKH4vTz0EvG2W2ueUe7vNHx2MIwF0Bt8kL8k44
 +gVE1IDV2SMwpH4HyJjtKgBmH36AxSqdKv+LgO3/mXomr6nhF0ZqgpOoKLHDHPgL2x
 3iLM950e1i4fVm56Ua6V5IKaqgQqg3Gj31TOPxLyz6m9c57YhK3RDyG+nbCzKysjxa
 +G0JA9lVLAhPTQHAAGXHewPpgQsxDhqS94U+M1e4K0UeWc6eQ1NP7Hlmt+Wz3ZysqR
 GeygC14Zt4Ubg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gI1rdMXZ
Subject: [Buildroot] [PATCH/next 13/33] package/python-magic-wormhole: bump
 version to 0.21.1
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 8ba2c04993..3a3af3cd26 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  37fdc279a6b55f52945098850a381708  magic_wormhole-0.19.2.tar.gz
-sha256  b2b4a78acf09ff4cfc503a238f674394a5e735fa08dcd54519243ffc67f97c71  magic_wormhole-0.19.2.tar.gz
+md5  ad5a6114cb148cd3e400e34e6826408e  magic_wormhole-0.21.1.tar.gz
+sha256  b6d35972a19b4baa44e022518317b4e0ad26709fa019196f67ca0d127672a367  magic_wormhole-0.21.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index ce146181f7..67091352d0 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.19.2
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.21.1
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/e0/5b/4aff155b8e8ead4bc7c6aa3d1c19dc75aac2315e0c9b12f4e2f246b40141
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/d1/c6/0ed9e0dca81eb5d0bcfc72690613bf26a13b95a9edb95fc35cebbfff8fba
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
+PYTHON_MAGIC_WORMHOLE_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
