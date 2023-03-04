Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDA6C678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 21:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB60560F92;
	Sat,  4 Mar 2023 21:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB60560F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGcjXn5DCFTA; Sat,  4 Mar 2023 21:57:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9DC060F89;
	Sat,  4 Mar 2023 21:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9DC060F89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C876A1BF85D
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 21:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2A1F81E3F
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 21:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2A1F81E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tl_xnq5vGBNB for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 21:56:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0B9581E32
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 21:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0B9581E32
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F6FF861A6; Sat,  4 Mar 2023 21:56:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 22:56:35 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 27db1c8bff73c1809ba22eacc65220d70e3e61cc
X-Git-Newrev: 869cd715f748e8a289dc75852198d978cb69ebeb
X-Patchwork-Hint: ignore
Message-Id: <20230304215656.9F6FF861A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/python-cryptography: security bump to version 39.0.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=869cd715f748e8a289dc75852198d978cb69ebeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix CVE-2023-23931: cryptography is a package designed to expose
cryptographic primitives and recipes to Python developers. In affected
versions `Cipher.update_into` would accept Python objects which
implement the buffer protocol, but provide only immutable buffers. This
would allow immutable objects (such as `bytes`) to be mutated, thus
violating fundamental rules of Python and resulting in corrupted output.
This now correctly raises an exception. This issue has been present
since `update_into` was originally introduced in cryptography 1.8.

https://github.com/pyca/cryptography/security/advisories/GHSA-w7pp-m8wf-vj6r
https://cryptography.io/en/latest/changelog/#v39-0-1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 67c967c2d16c29f193fde43b3c48edf0911baccd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 3f2204eeb1..a23944a06f 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  2d00e023261719f85caf360ee061d37ee27654a0344d1376441c8a29ea3bac86  cryptography-39.0.0.tar.gz
+sha256  531348679f144d118156be5b17ddac750974cdcd9f44bb0a7cfd7ddcfee79c80  cryptography-39.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 6868ff4633..a130b2d10d 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 39.0.0
+PYTHON_CRYPTOGRAPHY_VERSION = 39.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/12/e3/c46c274cf466b24e5d44df5d5cd31a31ff23e57f074a2bb30931a8c9b01a
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6a/f5/a729774d087e50fffd1438b3877a91e9281294f985bda0fd15bf99016c78
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
