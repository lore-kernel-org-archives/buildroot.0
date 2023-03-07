Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37339C6FA99
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9D10610EC;
	Tue,  7 Mar 2023 21:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D10610EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nv38Sw9I2_H0; Tue,  7 Mar 2023 21:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E1F60594;
	Tue,  7 Mar 2023 21:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35E1F60594
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF32C1BF95E
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C24114012B
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C24114012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IQi0G6m9VMUi for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0828D400FE
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 21:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0828D400FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAF0F86A0E; Tue,  7 Mar 2023 21:09:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Mar 2023 22:06:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 847ac3d9c8df70a7f082bd8a6046c1d987cf6eee
X-Git-Newrev: 47cb0c967f7c825e02e66d1df26ff9e893bf5235
X-Patchwork-Hint: ignore
Message-Id: <20230307210957.EAF0F86A0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: add C++ optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=47cb0c967f7c825e02e66d1df26ff9e893bf5235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++ is available since 2.3.0 and
https://github.com/cminyard/gensio/commit/3fda483f15a2668f9e2396517cdbf09693e6e3ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 3374313c0f..2ba1b950d7 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -13,6 +13,12 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+GENSIO_CONF_OPTS += --with-cplusplus
+else
+GENSIO_CONF_OPTS += --without-cplusplus
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 GENSIO_DEPENDENCIES += alsa-lib
 GENSIO_CONF_OPTS += --with-alsa
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
