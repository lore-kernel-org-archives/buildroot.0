Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1F1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A51183DF8;
	Sun, 30 Jan 2022 14:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wSfM6u0wC7uY; Sun, 30 Jan 2022 14:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F76583DF7;
	Sun, 30 Jan 2022 14:30:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04F511BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C1360E38
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id blflN9BMyNfg for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:30:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AA0660BF2
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9897D8282A; Sun, 30 Jan 2022 14:23:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:28:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3af06834c80a5efe5696dac0aab81cb233cec334
X-Git-Newrev: 0e2976aee57cb4f8f75899c4ad5a5ea4ff8f5ad4
X-Patchwork-Hint: ignore
Message-Id: <20220130142326.9897D8282A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: add missing
 openssl build dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0e2976aee57cb4f8f75899c4ad5a5ea4ff8f5ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit
01764876e3d4e7ab95c8365f1c83e6c12d49757c ("package/python-cryptography:
bump version to 36.0.1") incorrectly removed the build dependency on
openssl. This causes the following build failure:

build/temp.linux-x86_64-3.10/_openssl.c:575:10: fatal error: openssl/opensslv.h: No such file or directory
  575 | #include <openssl/opensslv.h>
      |          ^~~~~~~~~~~~~~~~~~~~

as OpenSSL is no longer guaranteed to be built before
python-cryptography (the Config.in file still had a "select
BR2_PACKAGE_OPENSSL" guaranteeing that OpenSSL would be built, but not
necessarily before).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cryptography/python-cryptography.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index fc1686af9a..e642691bc5 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -12,7 +12,11 @@ PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-setuptools-rust host-python-cffi host-rustc
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-python-setuptools-rust \
+	host-python-cffi \
+	host-rustc \
+	openssl
 PYTHON_CRYPTOGRAPHY_ENV = \
 	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
