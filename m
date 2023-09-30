Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C89E7737E
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 18:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 943BE4016C;
	Sat, 30 Sep 2023 18:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 943BE4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdqVBsKuEQPh; Sat, 30 Sep 2023 18:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 773E2415AA;
	Sat, 30 Sep 2023 18:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 773E2415AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A479D1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D27B4016C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D27B4016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRl9uTx1X2wz for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 18:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50A1A400C6
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 18:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50A1A400C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F34683C6F; Sat, 30 Sep 2023 18:12:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 19:55:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c1e01d9f8e84d54f242f850696582657ecc9fdf
X-Git-Newrev: c6a1d30106c556673cf55910ec54cb45876fcb27
X-Patchwork-Hint: ignore
Message-Id: <20230930181236.3F34683C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: support python bindings
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6a1d30106c556673cf55910ec54cb45876fcb27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.mk | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 9f7774f719..672a2cb0f0 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -20,12 +20,26 @@ ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
 endif
 
-LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug
+LIBXML2_CONF_OPTS = --with-gnu-ld --without-debug
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 LIBXML2_DEPENDENCIES = host-pkgconf
 
-HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
+HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBXML2_DEPENDENCIES += python3
+LIBXML2_CONF_OPTS += --with-python
+else
+LIBXML2_CONF_OPTS += --without-python
+endif
+
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
+HOST_LIBXML2_DEPENDENCIES += host-python3
+HOST_LIBXML2_CONF_OPTS += --with-python
+else
+HOST_LIBXML2_CONF_OPTS += --without-python
+endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 LIBXML2_DEPENDENCIES += icu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
