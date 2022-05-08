Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C226C433F5
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 19:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B14F840911;
	Sun,  8 May 2022 19:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4Je8MXyI6nc; Sun,  8 May 2022 19:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B5340907;
	Sun,  8 May 2022 19:46:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D336F1BF842
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 19:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCF2681AC1
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 19:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_lBLkOlLPz3 for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 19:46:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 257ED81ABB
 for <buildroot@buildroot.org>; Sun,  8 May 2022 19:46:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 766BF857AF; Sun,  8 May 2022 19:35:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 May 2022 21:45:03 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 60ff1d619db65d797147855b7c1163c327ef6c88
X-Git-Newrev: 70f7599e595ced918febc6e4730e10ee1fbe0b47
X-Patchwork-Hint: ignore
Message-Id: <20220508193522.766BF857AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/systemd: doesn't
 build with libressl
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
Content-Type: multipart/mixed; boundary="===============6240700651856377667=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6240700651856377667==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=70f7599e595ced918febc6e4730e10ee1fbe0b47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

systemd doesn't plan to fix the following build failure with libressl
(https://github.com/systemd/systemd/issues/14928) and ED25519 support
is still not available in libressl
(https://github.com/libressl-portable/portable/issues/393 opened for
more than 3 years):

../src/home/homed-manager.c: In function ‘manager_generate_key_pair’:
../src/home/homed-manager.c:1393:35: error: ‘EVP_PKEY_ED25519’ undeclared (first use in this function); did you mean ‘EVP_PKEY_DSA1’?
 1393 |         ctx = EVP_PKEY_CTX_new_id(EVP_PKEY_ED25519, NULL);
      |                                   ^~~~~~~~~~~~~~~~
      |                                   EVP_PKEY_DSA1

Fixes:
 - http://autobuild.buildroot.org/results/47f31b36f123c4be4661f4fde2d1f7385c5d0ed5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1c79d64ca990da5beeb9682df0dd9e81eae575c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in  | 2 ++
 package/systemd/systemd.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index cc0736561e..00c817172d 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -234,6 +234,7 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # fscrypt_key
 	select BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 	help
 	  systemd-homed is a system service that may be used to create,
@@ -412,6 +413,7 @@ config BR2_PACKAGE_SYSTEMD_RANDOMSEED
 config BR2_PACKAGE_SYSTEMD_REPART
 	bool "enable repart support"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 	help
 	  systemd-repart grows and adds partitions to a partition table,
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 9feed9c084..58a1376b51 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -498,7 +498,7 @@ else
 SYSTEMD_CONF_OPTS += -Dnss-resolve=false -Dresolve=false
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SYSTEMD_CONF_OPTS += \
 	-Dgnutls=false \
 	-Dopenssl=true \

--===============6240700651856377667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6240700651856377667==--
