Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FCBC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75DA06FF0C;
	Mon, 10 Apr 2023 19:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75DA06FF0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPkN64zfxs0y; Mon, 10 Apr 2023 19:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AEFB61410;
	Mon, 10 Apr 2023 19:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEFB61410
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1396D1C3BA3
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB25D61402
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB25D61402
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYxgpOyJdY70 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:37:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 420B961403
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 420B961403
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 386A883DD8; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:28:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e660b4fe423c60b7822947e968f65b80b0b05191
X-Git-Newrev: 3f359328bb423742599ed7cddb1a207a85cc30d4
X-Patchwork-Hint: ignore
Message-Id: <20230410193723.386A883DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/snmppp: fix build
 without SNMPV3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f359328bb423742599ed7cddb1a207a85cc30d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure without BR2_PACKAGE_SNMPPP_SNMPV3 raised
since bump to version 3.5.0 in commit
e011fa0415883b9d44df616cfaf6956e1a11da88:

msgqueue.cpp: In member function 'int Snmp_pp::CSNMPMessage::ResendMessage()':
msgqueue.cpp:263:34: error: 'version3' was not declared in this scope; did you mean 'version1'?
  263 |   if (m_target->get_version() == version3) {
      |                                  ^~~~~~~~
      |                                  version1

Fixes:
 - http://autobuild.buildroot.org/results/8ef3e4407a51c53c15e530606227338761dd905b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a45f2af7fae09e4daee9d017b02e8744b357cf48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/0001-fix-build-without-v3.patch | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/snmppp/0001-fix-build-without-v3.patch b/package/snmppp/0001-fix-build-without-v3.patch
new file mode 100644
index 0000000000..4e81f7bfc1
--- /dev/null
+++ b/package/snmppp/0001-fix-build-without-v3.patch
@@ -0,0 +1,43 @@
+fix build without v3
+
+Fix the following build failure without version3 raised since version
+3.5.0:
+
+msgqueue.cpp: In member function 'int Snmp_pp::CSNMPMessage::ResendMessage()':
+msgqueue.cpp:263:34: error: 'version3' was not declared in this scope; did you mean 'version1'?
+  263 |   if (m_target->get_version() == version3) {
+      |                                  ^~~~~~~~
+      |                                  version1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8ef3e4407a51c53c15e530606227338761dd905b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to katz.agentpp.com@magenta.de]
+
+diff -Nura snmp++-3.5.0.orig/src/msgqueue.cpp snmp++-3.5.0/src/msgqueue.cpp
+--- snmp++-3.5.0.orig/src/msgqueue.cpp	2023-03-20 10:49:30.629000853 +0100
++++ snmp++-3.5.0/src/msgqueue.cpp	2023-03-20 10:51:36.880664304 +0100
+@@ -260,18 +260,20 @@
+   m_target->set_retry(m_target->get_retry() - 1);
+   SetSendTime();
+   int status;
+-  if (m_target->get_version() == version3) {
+ #ifdef _SNMPv3
++  if (m_target->get_version() == version3) {
+     // delete entry in cache
+     if (m_snmp->get_mpv3())
+ 	    m_snmp->get_mpv3()->delete_from_cache(m_pdu.get_request_id());
+-#endif
+     status = m_snmp->snmp_engine(m_pdu, m_pdu.get_error_status(), m_pdu.get_error_index(),
+ 		    *m_target, m_callBack, m_callData, m_socket, 0, this);
+   }
+   else {
++#endif
+     status = send_snmp_request(m_socket, m_rawPdu, m_rawPduLen, *m_address);
++#ifdef _SNMPv3
+   }
++#endif
+   if (status != 0)
+     return SNMP_CLASS_TL_FAILED;
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
