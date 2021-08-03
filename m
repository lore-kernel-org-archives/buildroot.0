Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0194CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF6C604D7
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAF6C604D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 878334044D;
	Tue,  3 Aug 2021 09:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lh_5iEyY9Q9S; Tue,  3 Aug 2021 09:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B3940443;
	Tue,  3 Aug 2021 09:27:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD2A31BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA1A940443
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jdFCPrKQ-QEa for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 09:27:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02C854043B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 09:27:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6DFF38A63C; Tue,  3 Aug 2021 09:27:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 11:27:08 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 4f37a85aeae5ee4e06ec3f19244dcf31186f2a6d
X-Git-Newrev: 6a1dc0757d425981896719f686a947fee022bcaa
X-Patchwork-Hint: ignore
Message-Id: <20210803092745.6DFF38A63C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/{chrony, ntp,
 openntpd}: turn off DNSSEC validation
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6a1dc0757d425981896719f686a947fee022bcaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

We have a chicken and egg problem: validation of DNSSEC signatures
doesn't work without a correct clock, but to set the correct clock we
need to contact NTP servers which requires resolving a hostname, which
would normally require DNSSEC validation.

Let's break the cycle by excluding NTP hostname resolution from
validation for now.

Details:
https://github.com/systemd/systemd/commit/abf4e5c1d3ad767bc0ed67883e8e4d916af095ec

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c2db53caca63ea8fca17823e37d496774aefd477)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.service | 4 ++++
 package/ntp/ntpd.service      | 4 ++++
 package/openntpd/ntpd.service | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/package/chrony/chrony.service b/package/chrony/chrony.service
index 325b63c492..210122cf5d 100644
--- a/package/chrony/chrony.service
+++ b/package/chrony/chrony.service
@@ -4,6 +4,10 @@ After=syslog.target network.target
 Conflicts=systemd-timesyncd.service
 
 [Service]
+# Turn off DNSSEC validation for hostname look-ups, since those need the
+# correct time to work, but we likely won't acquire that without NTP. Let's
+# break this chicken-and-egg cycle here.
+Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
 ExecStart=/usr/sbin/chronyd -n
 Restart=always
 
diff --git a/package/ntp/ntpd.service b/package/ntp/ntpd.service
index 7964c5389b..9a0f4c6dbf 100644
--- a/package/ntp/ntpd.service
+++ b/package/ntp/ntpd.service
@@ -5,6 +5,10 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/ntpd.pid
+# Turn off DNSSEC validation for hostname look-ups, since those need the
+# correct time to work, but we likely won't acquire that without NTP. Let's
+# break this chicken-and-egg cycle here.
+Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
 ExecStart=/usr/sbin/ntpd -g -p /run/ntpd.pid
 
 [Install]
diff --git a/package/openntpd/ntpd.service b/package/openntpd/ntpd.service
index a4ffa7318c..c2924b0c5c 100644
--- a/package/openntpd/ntpd.service
+++ b/package/openntpd/ntpd.service
@@ -5,6 +5,10 @@ Conflicts=systemd-timesyncd.service
 
 [Service]
 Type=simple
+# Turn off DNSSEC validation for hostname look-ups, since those need the
+# correct time to work, but we likely won't acquire that without NTP. Let's
+# break this chicken-and-egg cycle here.
+Environment=SYSTEMD_NSS_RESOLVE_VALIDATE=0
 ExecStart=/usr/sbin/ntpd -s -d
 
 [Install]
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
