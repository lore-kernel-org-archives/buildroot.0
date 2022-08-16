Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E3EC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C31415A4;
	Tue, 16 Aug 2022 08:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40C31415A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZaaCXCDJUWJ; Tue, 16 Aug 2022 08:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A96E41516;
	Tue, 16 Aug 2022 08:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A96E41516
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B00C61BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BD4481C11
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD4481C11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKQMNTsTWv4N for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:55:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD45881B84
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD45881B84
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 994EC87735; Tue, 16 Aug 2022 08:40:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:45:14 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ba1500d9317ffa997415b21ad8b57807d98a922d
X-Git-Newrev: c6fde1d1f3b3c4e85e97e10a27e88fdb1019a9c1
X-Patchwork-Hint: ignore
Message-Id: <20220816084050.994EC87735@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/rsyslog: add
 rabbitmq-c optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6fde1d1f3b3c4e85e97e10a27e88fdb1019a9c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 4d3ba8d3de6c98c416f9358b85eb5baa28ca615f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 82e16e80a2..b17851fd95 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -104,6 +104,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-pgsql
 endif
 
+ifeq ($(BR2_PACKAGE_RABBITMQ_C),y)
+RSYSLOG_DEPENDENCIES += rabbitmq-c
+RSYSLOG_CONF_OPTS += --enable-omrabbitmq
+else
+RSYSLOG_CONF_OPTS += --disable-omrabbitmq
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 RSYSLOG_DEPENDENCIES += util-linux
 RSYSLOG_CONF_OPTS += --enable-uuid
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
