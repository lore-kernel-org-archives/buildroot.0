Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105DCC761AF
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 06:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A8C640974;
	Wed, 29 Mar 2023 06:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A8C640974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dva6pRTvyTNP; Wed, 29 Mar 2023 06:49:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E673408D5;
	Wed, 29 Mar 2023 06:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E673408D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 660851BF364
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 06:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D085417D3
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 06:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D085417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OA-ykDS44Q9X for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 06:49:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 266914096C
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 06:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 266914096C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 119508361B; Wed, 29 Mar 2023 06:49:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 08:48:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16cd9494ba6496d7f5f873abd307952efea7da78
X-Git-Newrev: a45f2af7fae09e4daee9d017b02e8744b357cf48
X-Patchwork-Hint: ignore
Message-Id: <20230329064904.119508361B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snmppp: fix build without SNMPV3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a45f2af7fae09e4daee9d017b02e8744b357cf48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
