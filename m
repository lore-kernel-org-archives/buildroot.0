Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73605E728E5
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2959B83DCC;
	Fri, 29 Sep 2023 20:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2959B83DCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tt5hKkRQ1RzY; Fri, 29 Sep 2023 20:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 507A383DA2;
	Fri, 29 Sep 2023 20:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 507A383DA2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0699B1BF995
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D28D783DAD
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 20:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D28D783DAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKi2Pde8jXbF for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2D8783CF2
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2D8783CF2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2C0D8367F; Fri, 29 Sep 2023 20:03:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 22:02:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9fd7e5b2b58b6721eed3fc7f7ac8e5d0557effc
X-Git-Newrev: 5c80f50ef0440270a6bc52caec9cb312287a1e75
X-Patchwork-Hint: ignore
Message-Id: <20230929200351.B2C0D8367F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-orjson: migrate to maturin
 infrastructure
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c80f50ef0440270a6bc52caec9cb312287a1e75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can now significantly simplify the python-orjson build using the
new maturin setup type introduced in the python package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-orjson/python-orjson.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index f5d4ad1046..cf05b26262 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -7,16 +7,9 @@
 PYTHON_ORJSON_VERSION = 3.9.2
 PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
 PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/30/a4/96bcb52da0de9ccfcd99a60719b995c9b9c3aaa3a70701f0790ce856c10d
-PYTHON_ORJSON_SETUP_TYPE = pep517
+PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-python-maturin
-PYTHON_ORJSON_ENV = \
-	$(PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
-PYTHON_ORJSON_DL_ENV = $(PKG_CARGO_ENV)
+PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
