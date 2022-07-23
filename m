Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF3FC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A04F60E62;
	Sat, 23 Jul 2022 19:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A04F60E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXWO5QEd0Rjx; Sat, 23 Jul 2022 19:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82FCE61AFD;
	Sat, 23 Jul 2022 19:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82FCE61AFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67E831BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7A7960F48
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7A7960F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UohBEHVyN6cv for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:11:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00BD0606C0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00BD0606C0
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 838DC84A5B; Sat, 23 Jul 2022 18:57:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:10:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d3ba8d3de6c98c416f9358b85eb5baa28ca615f
X-Git-Newrev: 0c3540c7f291659b52a1899340f9c16172a0c946
X-Patchwork-Hint: ignore
Message-Id: <20220723185732.838DC84A5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsyslog: add qpid-proton optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c3540c7f291659b52a1899340f9c16172a0c946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
