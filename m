Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309C5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE9760BF0;
	Sun, 20 Mar 2022 17:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsD7-Yf-pQOa; Sun, 20 Mar 2022 17:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB59460AD7;
	Sun, 20 Mar 2022 17:09:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B4C41BF973
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B550408DF
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KJnStrl6OLL for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:07:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 649304088A
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:07:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A1C4084552; Sun, 20 Mar 2022 16:58:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 18:06:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6db3b6d48cae3c3a9ad7c3977b373d4a60d6e787
X-Git-Newrev: 343d7940a4bbdd89933a29f9470cead6ff481a28
X-Patchwork-Hint: ignore
Message-Id: <20220320165813.A1C4084552@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/agentpp: bump to version 4.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=343d7940a4bbdd89933a29f9470cead6ff481a28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (not needed anymore):
"Fixed: Allow compilation without _SNMPv3 defined."

https://agentpp.com/download/changes_agent++.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-build-when-SNMPv3-is-disabled.patch   | 102 ---------------------
 package/agentpp/agentpp.hash                       |   2 +-
 package/agentpp/agentpp.mk                         |   2 +-
 3 files changed, 2 insertions(+), 104 deletions(-)

diff --git a/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch b/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch
deleted file mode 100644
index f16c2b4b77..0000000000
--- a/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 2a0fe384eec254643ca2176ccfcbbd036a5aad06 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Tue, 14 Jul 2020 10:30:10 +0200
-Subject: [PATCH] Fix build when SNMPv3 is disabled
-
-agentpp has ifdefs to disable v3 code when SNMPv3 is disabled. However it
-is missing one and it has a few ones in excess. Fix them.
-
-Upstream is aware, says "will fix in later version", but thinks to make v3
-mandatory. See discussion at
-https://forum.snmp.app/t/agent-compile-fails-if-snmp-has-disable-snmpv3/326
-
-Upstream status: none, upstream is not welcoming contributions.
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
----
- include/agent_pp/notification_log_mib.h    | 4 ++--
- include/agent_pp/notification_originator.h | 2 ++
- include/agent_pp/snmp_community_mib.h      | 4 ++--
- src/notification_originator.cpp            | 2 ++
- 4 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/include/agent_pp/notification_log_mib.h b/include/agent_pp/notification_log_mib.h
-index ddac05e515d9..8fd8cfec32ca 100644
---- a/include/agent_pp/notification_log_mib.h
-+++ b/include/agent_pp/notification_log_mib.h
-@@ -22,7 +22,7 @@
- 
- //--AgentGen BEGIN=_BEGIN
- #include <agent_pp/agent++.h>
--#ifdef _SNMPv3
-+// #ifdef _SNMPv3 // This file deos not look SNMPv3-specific
- #include <agent_pp/mib_complex_entry.h>
- //--AgentGen END
- 
-@@ -688,6 +688,6 @@ protected:
-  */
- 
- 
--#endif
-+// #endif // _SNMPv3
- 
- 
-diff --git a/include/agent_pp/notification_originator.h b/include/agent_pp/notification_originator.h
-index 95e8b4e1836d..6f50cd52625b 100644
---- a/include/agent_pp/notification_originator.h
-+++ b/include/agent_pp/notification_originator.h
-@@ -307,7 +307,9 @@ class AGENTPP_DECL NotificationOriginator: public NotificationSender {
-          */
-         virtual nlmLogEntry* get_nlm_log_entry();
-                 
-+#ifdef _SNMPv3
-         virtual v3MP* get_v3mp();
-+#endif
- 
-  protected:
-      
-diff --git a/include/agent_pp/snmp_community_mib.h b/include/agent_pp/snmp_community_mib.h
-index 7d5c4558f36d..d9eb2b4a87ec 100644
---- a/include/agent_pp/snmp_community_mib.h
-+++ b/include/agent_pp/snmp_community_mib.h
-@@ -49,7 +49,7 @@ namespace Agentpp {
- #define oidSnmpTrapAddress               "1.3.6.1.6.3.18.1.3.0"
- #define oidSnmpTrapCommunity             "1.3.6.1.6.3.18.1.4.0"
- 
--#ifdef _SNMPv3
-+// #ifdef _SNMPv3 // This file deos not look SNMPv3-specific
- 
- /**
-  *  snmpCommunityName
-@@ -346,7 +346,7 @@ class AGENTPP_DECL snmp_community_mib: public MibGroup
- 	static void	       	add_public();
- 	static void	       	add_public(Mib* mib);
- };
--#endif
-+// #endif // _SNMPv3
- 
- #ifdef AGENTPP_NAMESPACE
- }
-diff --git a/src/notification_originator.cpp b/src/notification_originator.cpp
-index d7d566869998..39ddbe08cdeb 100644
---- a/src/notification_originator.cpp
-+++ b/src/notification_originator.cpp
-@@ -237,6 +237,7 @@ nlmLogEntry* NotificationOriginator::get_nlm_log_entry() {
-     return nlmLogEntry::instance;
- }
- 
-+#ifdef _SNMPv3
- v3MP* NotificationOriginator::get_v3mp() {
-     if (mib) {
-         return mib->get_request_list()->get_v3mp();
-@@ -244,6 +245,7 @@ v3MP* NotificationOriginator::get_v3mp() {
-         return v3MP::I;
-     }
- }
-+#endif
- 
- 
- bool NotificationOriginator::check_access(ListCursor<MibTableRow>& cur,
--- 
-2.27.0
-
diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 11b23c8ee2..f8399963e5 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9b45123df45e803198a1181540b37a4ccd0e63c68df6e826702e2ba49167edac  agent++-4.3.1.tar.gz
+sha256  bcfc014cc7ce37afdd6eefb71b59f1eabf23984525905546aa363c2a2c498c79  agent++-4.5.3.tar.gz
 sha256  1eb85fc97224598dad1852b5d6483bbcf0aa8608790dcc657a5a2a761ae9c8c6  LICENSE-2_0.txt
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
index 8982d9e564..f30e75ef9c 100644
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AGENTPP_VERSION = 4.3.1
+AGENTPP_VERSION = 4.5.3
 AGENTPP_SOURCE = agent++-$(AGENTPP_VERSION).tar.gz
 AGENTPP_SITE = http://www.agentpp.com/download
 AGENTPP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
