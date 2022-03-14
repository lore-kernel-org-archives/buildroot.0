Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B94C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286674155C;
	Mon, 14 Mar 2022 12:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RClIDr-5Ct24; Mon, 14 Mar 2022 12:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400714154D;
	Mon, 14 Mar 2022 12:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCB671BF3A9
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB8B483F1E
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Z2cIhnhFWcH for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D4ED83EDD
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5D1CA83E3D; Mon, 14 Mar 2022 12:11:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 532e5063f54434cce4afec2ad5371fbf02488b67
X-Git-Newrev: 77f9d2d6a6fc4a6485acd7b5f1970b638764c1fa
X-Patchwork-Hint: ignore
Message-Id: <20220314121153.5D1CA83E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: netsnmp needs mib
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
Content-Type: multipart/mixed; boundary="===============4931396550446341181=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4931396550446341181==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=77f9d2d6a6fc4a6485acd7b5f1970b638764c1fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============4931396550446341181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4931396550446341181==--
