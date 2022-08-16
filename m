Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65D0C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A9F941516;
	Tue, 16 Aug 2022 08:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A9F941516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbihkiyNTIcA; Tue, 16 Aug 2022 08:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA8641503;
	Tue, 16 Aug 2022 08:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CA8641503
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1DEE1BF9C2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDADB81B84
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDADB81B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ySmx0Phbb-Jc for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:53:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1608D81A6F
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1608D81A6F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D880287796; Tue, 16 Aug 2022 08:38:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:46:14 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0033651bdef975141572c74b7221903f4bdaa61e
X-Git-Newrev: b654a523b36f7268b8f6513b7144288c14232505
X-Patchwork-Hint: ignore
Message-Id: <20220816083851.D880287796@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rsyslog: add
 qpid-proton optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b654a523b36f7268b8f6513b7144288c14232505
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0c3540c7f291659b52a1899340f9c16172a0c946)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index b17851fd95..4e08af3167 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -104,6 +104,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-pgsql
 endif
 
+ifeq ($(BR2_PACKAGE_QPID_PROTON),y)
+RSYSLOG_DEPENDENCIES += qpid-proton
+RSYSLOG_CONF_OPTS += --enable-omamqp1
+else
+RSYSLOG_CONF_OPTS += --disable-omamqp1
+endif
+
 ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
 RSYSLOG_DEPENDENCIES += rabbitmq-c
 RSYSLOG_CONF_OPTS += --enable-omrabbitmq
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
