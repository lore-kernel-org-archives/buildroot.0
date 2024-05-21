Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146D3C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 04:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE1A140106;
	Tue, 21 May 2024 04:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phn1pkaLloqJ; Tue, 21 May 2024 04:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C11EB40350
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11EB40350;
	Tue, 21 May 2024 04:54:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 949361C4F4B
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EC1B4028D
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a13HhS_W-qKA for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 04:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F4B64027C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F4B64027C
 for <buildroot@buildroot.org>; Tue, 21 May 2024 04:54:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FEC987482; Tue, 21 May 2024 04:54:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 06:53:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9207e8ccd0812ed6bff01220a5df680bd1007e5
X-Git-Newrev: 7bea8c984e2fcff3dd058dbaecfbb6f96e1d66a2
X-Patchwork-Hint: ignore
Message-Id: <20240521045415.0FEC987482@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmdb: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bea8c984e2fcff3dd058dbaecfbb6f96e1d66a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since the addition of the
package in commit eb60c4054c25129d78651a66d1e7554aff04767f:

__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'

Fixes: eb60c4054c25129d78651a66d1e7554aff04767f
 - http://autobuild.buildroot.org/results/e2bc8c35a10b6513c5605954e93b5b8a1ec7654b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - s/LMBD/LMDB/
  - drop LMBD_MAKE_OPTS, directly pass ILIBS
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lmdb/lmdb.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index dafe7332cb..06c8f6bbb1 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -10,13 +10,23 @@ LMDB_LICENSE = OLDAP-2.8
 LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
 LMDB_INSTALL_STAGING = YES
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LMDB_ILBIBS += liblmdb.a
+else ifeq ($(BR2_SHARED_LIBS),y)
+LMDB_ILBIBS += liblmdb.so
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LMDB_ILBIBS +=  liblmdb.a liblmdb.so
+endif
+
 define LMDB_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/libraries/liblmdb \
+		ILIBS="$(LMDB_ILBIBS)" \
 		XCFLAGS="$(TARGET_CFLAGS)"
 endef
 
 define LMDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		ILIBS="$(LMDB_ILBIBS)" \
 		DESTDIR="$(STAGING_DIR)" \
 		prefix=/usr \
 		install
@@ -24,6 +34,7 @@ endef
 
 define LMDB_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
+		ILIBS="$(LMDB_ILBIBS)" \
 		DESTDIR="$(TARGET_DIR)" \
 		prefix=/usr \
 		install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
