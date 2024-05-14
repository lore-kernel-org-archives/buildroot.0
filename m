Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7385DC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 08:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17F46416C8;
	Tue, 14 May 2024 08:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37B0SKcri-J3; Tue, 14 May 2024 08:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 277A4416D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 277A4416D4;
	Tue, 14 May 2024 08:58:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2AFF1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE89D410C0
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PErvrYyaSzbF for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 08:58:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4496410B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4496410B4
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4496410B4
 for <buildroot@buildroot.org>; Tue, 14 May 2024 08:58:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 346ADE0003;
 Tue, 14 May 2024 08:58:05 +0000 (UTC)
To: Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Tue, 14 May 2024 10:58:00 +0200
Message-ID: <20240514085801.3202503-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-GND-Spam-Score: 300
X-GND-Status: SPAM
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715677086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UsuHf9iIuzY8nZ4xBl0fsk5ce9ORBKYSGha5wzrSUFg=;
 b=MmEWXJYvS3wArPJSSuv6PM3fFovP82SSTegtACooPD1LqdSS5yruZ3v9P797vZMpCE1UXd
 CzT0rS8Ic2VlATrkO3kOsLPXkh0OAhSmaqLcPCrgEISah7k+EopNhJXipvB4QCuZe7VsSv
 Hp0ZpNeVAtHqc22rg64SEkB5ZcElETgqfE5A4cxkxBWjau+ybwK25MUxchoyEfi96WIUtN
 2aNJ4d00z0AzaFbJNtD7YKjLZVenVtd/9FVVgqtobpIbH799Qo/+5hvyqongUpu3IGzoZJ
 FXxmHL/By9//D10tNXL9I8wUITIqMT3/DrnPdwz49YVy+xwqmzNgfO9TApjRlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MmEWXJYv
Subject: [Buildroot] [PATCH] docs,
 package/gcc: switch to Gitlab issue tracker
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our Bugzilla is so slow and unstable that it has become
unusable. Let's switch to using the Gitlab issue tracker instead.

There are still lots of references to the Bugzilla bug tracker in our
News page at https://buildroot.org/news.html, but these are for older
news.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/contribute.adoc  | 2 +-
 docs/manual/resources.adoc   | 2 +-
 docs/website/contribute.html | 2 +-
 docs/website/support.html    | 5 +++--
 package/gcc/gcc.mk           | 2 +-
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 6ff6c15314..c88035597e 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -25,7 +25,7 @@ for more information on obtaining a Buildroot git tree.
 === Reproducing, analyzing and fixing bugs
 
 A first way of contributing is to have a look at the open bug reports in
-the https://bugs.buildroot.org/buglist.cgi?product=buildroot[Buildroot bug
+the https://gitlab.com/buildroot.org/buildroot/-/issues[Buildroot bug
 tracker]. As we strive to keep the bug count as small as possible, all
 help in reproducing, analyzing and fixing reported bugs is more than
 welcome. Don't hesitate to add a comment to bug reports reporting your
diff --git a/docs/manual/resources.adoc b/docs/manual/resources.adoc
index 68b7eb9062..4ef709c317 100644
--- a/docs/manual/resources.adoc
+++ b/docs/manual/resources.adoc
@@ -40,7 +40,7 @@ better as it will reach more people, both developers and users.
 Bug tracker::
 +
 Bugs in Buildroot can be reported via the mailing list or alternatively
-via the https://bugs.buildroot.org/buglist.cgi?product=buildroot[Buildroot
+via the https://gitlab.com/buildroot.org/buildroot/-/issues[Buildroot
 bugtracker]. Please refer to xref:reporting-bugs[] before creating a bug
 report.
 
diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index aa1cf93f1b..95028ee788 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -13,7 +13,7 @@
 
       <ul>
 	<li>Reproducing, analyzing and fixing bugs from our
-	  <a href="https://bugs.buildroot.org/">bug tracker</a></li>
+	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a></li>
 	<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
 	    autobuild failures</a></li>
 	<li>Reviewing and testing patches sent by other developers. See the
diff --git a/docs/website/support.html b/docs/website/support.html
index 28873c6d76..75551b770e 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -80,8 +80,9 @@
 		  <img class="img-responsive" src="images/bug-buddy.png" style="max-width:50px; margin-bottom:10px;">
 		</div>
 		<div class="col-sm-11">
-		  <p>If you think you found a bug in Buildroot, you can use the
-		    <a href="https://bugs.buildroot.org/">Bug Tracker</a> to post your bugs and/or
+		  <p>If you think you found a bug in Buildroot, you
+		  can use the
+		    <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">Bug Tracker</a> to post your bugs and/or
 		    participate to find solutions to existing problems.</p>
 
 		  <p>Note: patches are only accepted through the mailing list.</p>
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 672f9472a9..e4780353cb 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -83,7 +83,7 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
 	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
-	--with-bugurl="http://bugs.buildroot.net/" \
+	--with-bugurl="https://gitlab.com/buildroot.org/buildroot/-/issues" \
 	--without-zstd
 
 ifeq ($(BR2_REPRODUCIBLE),y)
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
