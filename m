Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D422FC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CC95418B8;
	Mon,  4 Dec 2023 20:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CC95418B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jptrt_IxDXi3; Mon,  4 Dec 2023 20:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE5841BD7;
	Mon,  4 Dec 2023 20:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE5841BD7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18E341BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E27B41774
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E27B41774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWQ94B6vDAp0 for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E1FC41751
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E1FC41751
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48896879B6; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 22:02:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c54deff255d433db46e6c5ecd14c8e97f1715dd
X-Git-Newrev: ee9b7ee9ce60476609a66c35f4fa94ba7f61175b
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.48896879B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2c-tools: expand
 PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee9b7ee9ce60476609a66c35f4fa94ba7f61175b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In a follow-up patch, we want to remove this variable. Replace it with
its expansion, which is anyway just
$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) --root=$(TARGET_DIR)

Also remove PKG_PYTHON_SETUPTOOLS_BUILD_OPTS, which is not defined (i.e.
empty).

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/i2c-tools/i2c-tools.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index adccd9475d..f8d1bcb4b0 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -36,15 +36,15 @@ I2C_TOOLS_PYTHON_BASE_ENV = \
 define I2C_TOOLS_BUILD_PYSMBUS
 	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
-		$(HOST_DIR)/bin/python setup.py build \
-		$(PKG_PYTHON_SETUPTOOLS_BUILD_OPTS))
+		$(HOST_DIR)/bin/python setup.py build)
 endef
 
 define I2C_TOOLS_INSTALL_PYSMBUS
 	(cd $(@D)/py-smbus; \
 	$(I2C_TOOLS_PYTHON_BASE_ENV) \
 		$(HOST_DIR)/bin/python setup.py install \
-		$(PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS))
+		$(PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS) \
+		--root=$(TARGET_DIR))
 endef
 
 endif # BR2_PACKAGE_PYTHON3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
