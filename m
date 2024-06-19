Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97250C27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 19:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EB204052D;
	Wed, 19 Jun 2024 19:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Nm2QSfvUgEt; Wed, 19 Jun 2024 19:40:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 005F9415AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 005F9415AA;
	Wed, 19 Jun 2024 19:40:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D46C1BF25F
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE58F415AA
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 19:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZqnMEezd_34P for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 19:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09DAA4052D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09DAA4052D
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 19:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E865582D13; Wed, 19 Jun 2024 19:40:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 21:38:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dad0ebf4416c7918dca5291e3e1d887d5625078f
X-Git-Newrev: a559a684284f52542a6c921a011710a4f85ba036
X-Patchwork-Hint: ignore
Message-Id: <20240619194008.E865582D13@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: add optional IIO support
 to GNU Radio
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a559a684284f52542a6c921a011710a4f85ba036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Indeed libiio dependency must be activated.

This used to be an external package but is now included in gnuradio
itself.

Signed-off-by: Jean-Michel Friedt <jmfriedt@femto-st.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/gnuradio/Config.in   | 7 +++++++
 package/gnuradio/gnuradio.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index be997e91e2..d9ad650672 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -136,6 +136,13 @@ config BR2_PACKAGE_GNURADIO_FILTER
 	help
 	  Filter signal processing blocks
 
+config BR2_PACKAGE_GNURADIO_IIO
+	bool "gr-iio support"
+	select BR2_PACKAGE_LIBIIO
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  IIO support
+
 config BR2_PACKAGE_GNURADIO_NETWORK
 	bool "gr-network support"
 	select BR2_PACKAGE_GNURADIO_BLOCKS
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 4e82c9e129..bdaab86f35 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -112,6 +112,13 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_IIO),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_IIO=ON
+GNURADIO_DEPENDENCIES += libiio
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_IIO=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python3 python-pybind \
 	host-python-numpy host-python-packaging
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
