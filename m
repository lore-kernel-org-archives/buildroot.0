Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C823C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D4A60F48;
	Tue, 16 Aug 2022 08:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D4A60F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 080Dt_ZSUOhq; Tue, 16 Aug 2022 08:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E9760F2E;
	Tue, 16 Aug 2022 08:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66E9760F2E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C56831BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1A2A4063E
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A2A4063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4ROmt0Rhsfx for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:53:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB6D340635
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB6D340635
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6C5C87773; Tue, 16 Aug 2022 08:38:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:46:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b3835eb692b82d5bbd3770bff5fc6cf6aed13f50
X-Git-Newrev: 34fac2636a6508fc9d50d07ce8611b20393207bd
X-Patchwork-Hint: ignore
Message-Id: <20220816083851.B6C5C87773@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rsyslog: add czmq
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=34fac2636a6508fc9d50d07ce8611b20393207bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a53db6ca7257521720727df3234c629465a89e8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index a0fb949a9a..82e16e80a2 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -59,6 +59,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-imhttp
 endif
 
+ifeq ($(BR2_PACKAGE_CZMQ),y)
+RSYSLOG_DEPENDENCIES += czmq
+RSYSLOG_CONF_OPTS += --enable-imczmq --enable-omczmq
+else
+RSYSLOG_CONF_OPTS += --disable-imczmq --disable-omczmq
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RSYSLOG_DEPENDENCIES += gnutls
 RSYSLOG_CONF_OPTS += --enable-gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
