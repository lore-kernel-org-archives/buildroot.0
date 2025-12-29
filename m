Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A3DE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF4EB80E57;
	Mon, 29 Dec 2025 10:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQ78bulD0QfX; Mon, 29 Dec 2025 10:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8445A80D6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767004000;
	bh=OG7zxn6EyWFntmys9rnveAjFoo72s3znhY0ytm8cRZo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qNUZyo0jF3blDT1pAR9V6NZDAR5sJ2yaw8Y++imYPTVI9oKZL+Ij5WfGsY10aOAyV
	 pljF9cqTTj8Ajs0GNCQDp+NW5bIhj5HAn/mWGW5tzlFfpOwlEJ5z2tyRjqidCMEb1/
	 S5q8tttNWoC/rCHYAgznpNzZuFzMkGpIz+QTeOavv2StvfHKDW2RQycCRpbCFTlGim
	 rny4aeylCY2fhuuoo+hUtYwh7Yi2BZfmOD2jkH8nefxeoMhrD9EamBb1VH9AV1Tcv+
	 KAH7r9zlEOExyzvms0tXjfAqDUBy5r7PmnE/d9CHmRaHnFlXAcpyPoRopOrC/GNDem
	 nPxF01+HoGh4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8445A80D6A;
	Mon, 29 Dec 2025 10:26:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADDE1177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 943DA40246
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VRCYwmVp6jCa for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DE46400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DE46400CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DE46400CE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:26:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F124FA4C243F;
 Mon, 29 Dec 2025 11:26:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaASC-0000000039o-1GkN;
 Mon, 29 Dec 2025 10:26:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 11:26:17 +0100
Message-ID: <20251229102618.281049-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229102618.281049-1-bernd@kuhls.net>
References: <20251229102618.281049-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767003980;
 bh=mmsJMUK8D3+r/zAy2uB1Kk+72bX45OHfiuYRJbdGV/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bzjxzJ4OMcntrT3wVUp36qKYQq/QbrqwhJoFNhQsEv2YMrUfJ28fgnATulbG+VNOL
 eNzDwE4NRXqjODBx3S8TPITC23Pvb/pRieVxWuUBxDRq3uPw08yxXKmvfWa0C7ilE5
 7TxNe1d8j+OVFwUKO75zGaNHIBtDbczdwiNSlMIPOW6iUM2FgVs0jim/qd8KnjHKO/
 5lwERGcyKlBTK5is8Ursb91ZdEhVwWFTVkxP/twcH9etM8E583moio70vE1SNVEGGl
 H76uMPEZVqJvUptrw0vRszkfNzWwKXsmfJYp04nGgXYQYQl0K+tdn5ttd9TQXWrlnW
 W9qBGJ4y5T7zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bzjxzJ4O
Subject: [Buildroot] [PATCH 2/2] package/python-scipy: bump version to 1.16.3
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Depends on python-numpy >= 2.0.0:
https://github.com/scipy/scipy/blob/v1.16.3/pyproject.toml#L41
https://github.com/scipy/scipy/commit/a3e2bb639b156b01964cda1edca971521c6f39ff

Updated license hash due to copyright year bumps:
https://github.com/scipy/scipy/commits/v1.16.3/LICENSE.txt

qhull license file was moved upstream:
https://github.com/scipy/scipy/commit/6d699dded4423e4ff9ac97eff9f4912ed24964fa
https://github.com/scipy/scipy/commit/96423e5279a4cdf698eedea6f0795ab57cf5a860

Updated numpy path in PYTHON_SCIPY_MESON_EXTRA_PROPERTIES following
upstream commit:
https://github.com/numpy/numpy/commit/923f219077c8aa3ad7d3792d8c06cba010b70252

Test was successful:

$ utils/docker-run support/testing/run-tests -j33    -k -d dl -o output_folder tests.package.test_python_scipy.TestPythonPy3SciPy
09:59:22 TestPythonPy3SciPy                       Starting
09:59:23 TestPythonPy3SciPy                       Building
10:10:09 TestPythonPy3SciPy                       Building done
Downloading to /home/bernd/buildroot/dl/tmpw1frnmf9
Renaming from /home/bernd/buildroot/dl/tmpw1frnmf9 to /home/bernd/buildroot/dl/kernel-versatile-5.10.202
Downloading to /home/bernd/buildroot/dl/tmpiip1lach
Renaming from /home/bernd/buildroot/dl/tmpiip1lach to /home/bernd/buildroot/dl/versatile-pb-5.10.202.dtb
10:10:24 TestPythonPy3SciPy                       Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 661.922s

OK

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-scipy/python-scipy.hash | 8 ++++----
 package/python-scipy/python-scipy.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index bee5d698a0..16c3af029d 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,10 +1,10 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  0e8eea0f7c4fe7d8102366230c96d66d  scipy-1.11.4.tar.gz
-sha256  90a2b78e7f5733b9de748f589f09225013685f9b218275257f8a8168ededaeaa  scipy-1.11.4.tar.gz
+md5  db334c9cae4eeb9f306c342b3744d653  scipy-1.16.3.tar.gz
+sha256  01e87659402762f43bd2fee13370553a17ada367d42e7487800bf2916535aecb  scipy-1.16.3.tar.gz
 # Locally computed sha256 checksums
-sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
+sha256  221e59f5e910fd7f94e44f0dac77436a11338c285c6346232e4a850a50da0e94  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
 sha256  0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING
-sha256  34db0c0c4f931861d720555c9cd7a2e228d1290ba29af0f2ee80c41bb2038afb  scipy/spatial/qhull_src/COPYING.txt
+sha256  106d55c931fd6a84822e5345d900273d059f1c27310d02567ccb313c5d18c55d  scipy/spatial/COPYING_QHULL.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 6626826e33..4d8d7b398e 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.11.4
+PYTHON_SCIPY_VERSION = 1.16.3
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/6e/1f/91144ba78dccea567a6466262922786ffc97be1e9b06ed9574ef0edc11e1
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/0a/ca/d8ace4f98322d01abcd52d381134344bf7b431eba7ed8b42bdea5a3c2ac9
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
@@ -20,7 +20,7 @@ PYTHON_SCIPY_LICENSE_FILES = \
 	scipy/optimize/tnc/LICENSE \
 	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
 	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
-	scipy/spatial/qhull_src/COPYING.txt
+	scipy/spatial/COPYING_QHULL.txt
 PYTHON_SCIPY_CPE_ID_VENDOR = scipy
 PYTHON_SCIPY_CPE_ID_PRODUCT = scipy
 PYTHON_SCIPY_DEPENDENCIES += \
@@ -42,6 +42,6 @@ PYTHON_SCIPY_CONF_ENV += \
 PYTHON_SCIPY_CONF_OPTS = -Dblas=openblas -Dlapack=lapack
 
 PYTHON_SCIPY_MESON_EXTRA_PROPERTIES = \
-	numpy-include-dir='$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/core/include'
+	numpy-include-dir='$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/numpy/_core/include'
 
 $(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
