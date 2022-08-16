Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C9DC2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEEE1415E1;
	Tue, 16 Aug 2022 08:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEEE1415E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FmfzbgbrMv80; Tue, 16 Aug 2022 08:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8665741516;
	Tue, 16 Aug 2022 08:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8665741516
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0DA71BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E4A081CAD
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E4A081CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgRy9yG00Zwo for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:55:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E17D481C04
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E17D481C04
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AFAE8877BA; Tue, 16 Aug 2022 08:40:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:45:28 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: b00af364918168d0c84aea014ffaedf73f5738e2
X-Git-Newrev: 7216212387668bbd215897d50ec8e81e423fadb5
X-Patchwork-Hint: ignore
Message-Id: <20220816084050.AFAE8877BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/rsyslog: add
 libmaxminddb optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7216212387668bbd215897d50ec8e81e423fadb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2562e2e6eede20e1acaf0c47d4d040263177ec1e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 4e08af3167..cb81b89b44 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -81,6 +81,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-libgcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+RSYSLOG_DEPENDENCIES += libmaxminddb
+RSYSLOG_CONF_OPTS += --enable-mmdblookup
+else
+RSYSLOG_CONF_OPTS += --disable-mmdblookup
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 RSYSLOG_DEPENDENCIES += libpcap
 RSYSLOG_CONF_OPTS += --enable-impcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
