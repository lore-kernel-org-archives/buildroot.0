From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 14 Jul 2020 10:52:09 +0200
Subject: [Buildroot] [PATCH] package/agentpp: fix build when
 BR2_PACKAGE_SNMPPP_SNMPV3 disabled
Message-ID: <20200714085209.14252-1-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Agent++ 4.3.1 does not build if SNMPv3 is disabled due to incorrect #ifdef
clauses, esulting in errors such as:

  ../include/agent_pp/notification_originator.h:232:39: error: 'snmpCommunityEntry' has not been declared
           void set_snmp_community_entry(snmpCommunityEntry* communityEntryRef) {
                                         ^
  ../include/agent_pp/notification_originator.h:296:32: error: 'nlmLogEntry' has not been declared
           void set_nlm_log_entry(nlmLogEntry* nlmLogEntryRef) {
                                  ^
  ../include/agent_pp/notification_originator.h:321:9: error: 'nlmLogEntry' does not name a type
           nlmLogEntry*            _nlmLogEntry;
           ^

Fixes:
  http://autobuild.buildroot.net/results/d7a5fa5ba4ab6c9da23fcc93bf766be9ca630af3/
  http://autobuild.buildroot.net/results/40ce9bc4bed267dc762a0282a8da0ad1514ad7a8/
  ...

Fixes: 88355e967fef ("package/agentpp: bump version to 4.3.1")
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 ...01-Fix-build-when-SNMPv3-is-disabled.patch | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch

diff --git a/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch b/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch
new file mode 100644
index 000000000000..f16c2b4b7721
--- /dev/null
+++ b/package/agentpp/0001-Fix-build-when-SNMPv3-is-disabled.patch
@@ -0,0 +1,102 @@
+From 2a0fe384eec254643ca2176ccfcbbd036a5aad06 Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Tue, 14 Jul 2020 10:30:10 +0200
+Subject: [PATCH] Fix build when SNMPv3 is disabled
+
+agentpp has ifdefs to disable v3 code when SNMPv3 is disabled. However it
+is missing one and it has a few ones in excess. Fix them.
+
+Upstream is aware, says "will fix in later version", but thinks to make v3
+mandatory. See discussion at
+https://forum.snmp.app/t/agent-compile-fails-if-snmp-has-disable-snmpv3/326
+
+Upstream status: none, upstream is not welcoming contributions.
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+---
+ include/agent_pp/notification_log_mib.h    | 4 ++--
+ include/agent_pp/notification_originator.h | 2 ++
+ include/agent_pp/snmp_community_mib.h      | 4 ++--
+ src/notification_originator.cpp            | 2 ++
+ 4 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/include/agent_pp/notification_log_mib.h b/include/agent_pp/notification_log_mib.h
+index ddac05e515d9..8fd8cfec32ca 100644
+--- a/include/agent_pp/notification_log_mib.h
++++ b/include/agent_pp/notification_log_mib.h
+@@ -22,7 +22,7 @@
+ 
+ //--AgentGen BEGIN=_BEGIN
+ #include <agent_pp/agent++.h>
+-#ifdef _SNMPv3
++// #ifdef _SNMPv3 // This file deos not look SNMPv3-specific
+ #include <agent_pp/mib_complex_entry.h>
+ //--AgentGen END
+ 
+@@ -688,6 +688,6 @@ protected:
+  */
+ 
+ 
+-#endif
++// #endif // _SNMPv3
+ 
+ 
+diff --git a/include/agent_pp/notification_originator.h b/include/agent_pp/notification_originator.h
+index 95e8b4e1836d..6f50cd52625b 100644
+--- a/include/agent_pp/notification_originator.h
++++ b/include/agent_pp/notification_originator.h
+@@ -307,7 +307,9 @@ class AGENTPP_DECL NotificationOriginator: public NotificationSender {
+          */
+         virtual nlmLogEntry* get_nlm_log_entry();
+                 
++#ifdef _SNMPv3
+         virtual v3MP* get_v3mp();
++#endif
+ 
+  protected:
+      
+diff --git a/include/agent_pp/snmp_community_mib.h b/include/agent_pp/snmp_community_mib.h
+index 7d5c4558f36d..d9eb2b4a87ec 100644
+--- a/include/agent_pp/snmp_community_mib.h
++++ b/include/agent_pp/snmp_community_mib.h
+@@ -49,7 +49,7 @@ namespace Agentpp {
+ #define oidSnmpTrapAddress               "1.3.6.1.6.3.18.1.3.0"
+ #define oidSnmpTrapCommunity             "1.3.6.1.6.3.18.1.4.0"
+ 
+-#ifdef _SNMPv3
++// #ifdef _SNMPv3 // This file deos not look SNMPv3-specific
+ 
+ /**
+  *  snmpCommunityName
+@@ -346,7 +346,7 @@ class AGENTPP_DECL snmp_community_mib: public MibGroup
+ 	static void	       	add_public();
+ 	static void	       	add_public(Mib* mib);
+ };
+-#endif
++// #endif // _SNMPv3
+ 
+ #ifdef AGENTPP_NAMESPACE
+ }
+diff --git a/src/notification_originator.cpp b/src/notification_originator.cpp
+index d7d566869998..39ddbe08cdeb 100644
+--- a/src/notification_originator.cpp
++++ b/src/notification_originator.cpp
+@@ -237,6 +237,7 @@ nlmLogEntry* NotificationOriginator::get_nlm_log_entry() {
+     return nlmLogEntry::instance;
+ }
+ 
++#ifdef _SNMPv3
+ v3MP* NotificationOriginator::get_v3mp() {
+     if (mib) {
+         return mib->get_request_list()->get_v3mp();
+@@ -244,6 +245,7 @@ v3MP* NotificationOriginator::get_v3mp() {
+         return v3MP::I;
+     }
+ }
++#endif
+ 
+ 
+ bool NotificationOriginator::check_access(ListCursor<MibTableRow>& cur,
+-- 
+2.27.0
+
-- 
2.27.0
