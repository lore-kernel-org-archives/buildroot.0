Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A033C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01FB4418C2;
	Fri, 18 Mar 2022 22:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vc0YKbp8C38b; Fri, 18 Mar 2022 22:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22CAB418A5;
	Fri, 18 Mar 2022 22:41:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BAE91C1148
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 889AD418A5
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShKUu4rMNZvf for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:40:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF9E241706
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:40:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0E69A83A69; Fri, 18 Mar 2022 22:31:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:22:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efa7712b092950c92f994e2ee30c120a64e5451b
X-Git-Newrev: c1b25c32a2b46fb74bec3818248379513b7d788b
X-Patchwork-Hint: ignore
Message-Id: <20220318223159.0E69A83A69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: enable host
 package
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
Content-Type: multipart/mixed; boundary="===============5469497594537253741=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5469497594537253741==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c1b25c32a2b46fb74bec3818248379513b7d788b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable host package and add needed variables. Host POST_PROCESS and
DOWNLOAD_DEPENDENCIES variables are inherited from target ones.

Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-cryptography/python-cryptography.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index a524f729c8..872ede9b89 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -17,14 +17,26 @@ PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
 	host-python-cffi \
 	host-rustc \
 	openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-python-setuptools-rust \
+	host-python-cffi \
+	host-rustc \
+	host-openssl
 PYTHON_CRYPTOGRAPHY_ENV = \
 	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+HOST_PYTHON_CRYPTOGRAPHY_ENV = \
+	$(HOST_PKG_CARGO_ENV) \
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 # We need to vendor the Cargo crates at download time
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
 PYTHON_CRYPTOGRAPHY_DL_ENV = \
 	$(PKG_CARGO_ENV) \
 	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
+HOST_PYTHON_CRYPTOGRAPHY_DL_ENV = \
+	$(HOST_PKG_CARGO_ENV) \
+	BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
 
 $(eval $(python-package))
+$(eval $(host-python-package))

--===============5469497594537253741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5469497594537253741==--
