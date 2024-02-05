Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F667C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4594660FF1;
	Mon,  5 Feb 2024 11:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4594660FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QzbD5ZwhqeC; Mon,  5 Feb 2024 11:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 968C860FEF;
	Mon,  5 Feb 2024 11:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 968C860FEF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98EEB1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72B214192A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72B214192A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2NFaVzePkjRB for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:46:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B70F941929
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B70F941929
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A334E86C09; Mon,  5 Feb 2024 11:46:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:45:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63c571096ffbf484ead8d0fc7d8c3b222853e8c5
X-Git-Newrev: eef5c297e765bb1414d6d6c629ce8e690c6370d4
X-Patchwork-Hint: ignore
Message-Id: <20240205114617.A334E86C09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysstat: do not autodetect
 sa_lib_dir
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

commit: https://git.buildroot.net/buildroot/commit/?id=eef5c297e765bb1414d6d6c629ce8e690c6370d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script of sysstat package checks host's /usr/lib64
directory for default sa_lib_dir.
Specify sa_lib_dir exclicitly to avoid host dependency.

Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysstat/sysstat.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 377396d986..ca05ec50d8 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -20,5 +20,7 @@ SYSSTAT_CONF_OPTS += --enable-sensors
 else
 SYSSTAT_CONF_OPTS += --disable-sensors
 endif
+# do not look at host's /usr/lib64
+SYSSTAT_CONF_OPTS += sa_lib_dir=/usr/lib/sa
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
