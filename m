Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D07C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5699408CB;
	Sun, 20 Mar 2022 18:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uES6otiJfFVQ; Sun, 20 Mar 2022 18:47:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF91404A3;
	Sun, 20 Mar 2022 18:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 190A11BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12A0F408CB
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baXimuecgRyn for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BB5E404A3
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6FFE38461D; Sun, 20 Mar 2022 18:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:21:20 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 61dfa6a4ef4780e3e74d6a28d67ede17d3f4fd78
X-Git-Newrev: d3c27619bfb917e5b2e893871d2a25f434c8efc3
X-Patchwork-Hint: ignore
Message-Id: <20220320183734.6FFE38461D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zabbix: netsnmp
 needs mib
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
Content-Type: multipart/mixed; boundary="===============0817051851573734194=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0817051851573734194==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d3c27619bfb917e5b2e893871d2a25f434c8efc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

netsnmp support needs mib to avoid the following build failure raised
since the addition of the package in commit
42382a171277ead59e365f5920e757f01c04ac77:

checks_snmp.c: In function ‘zbx_snmp_get_octet_string’:
checks_snmp.c:694:35: error: invalid use of undefined type ‘struct tree’
  694 |  hint = (NULL != subtree ? subtree->hint : NULL);
      |                                   ^~

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 77f9d2d6a6fc4a6485acd7b5f1970b638764c1fa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zabbix/zabbix.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index a8ecbb42db..adc54028ad 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -55,7 +55,7 @@ else
 ZABBIX_CONF_OPTS += --without-libxml2
 endif
 
-ifeq ($(BR2_PACKAGE_NETSNMP),y)
+ifeq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
 ZABBIX_CONF_OPTS += --with-net-snmp=$(STAGING_DIR)/usr/bin/net-snmp-config
 ZABBIX_DEPENDENCIES += netsnmp
 else

--===============0817051851573734194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0817051851573734194==--
