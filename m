Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE37C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 393516179C;
	Thu,  9 Mar 2023 20:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 393516179C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vywaO4U72fg; Thu,  9 Mar 2023 20:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7468761795;
	Thu,  9 Mar 2023 20:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7468761795
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 669391BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 409928214B
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 409928214B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npdZyHmhl4eI for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7235A82150
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7235A82150
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 612A586B70; Thu,  9 Mar 2023 20:29:03 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 21:12:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33a208e5dac02df473f8325ee93c2e07489f9a62
X-Git-Newrev: 1a5686823dbe83be74f819227bfefe4edca35e48
X-Patchwork-Hint: ignore
Message-Id: <20230309202903.612A586B70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speechd: fix libltdl
 enable/disable configure option
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a5686823dbe83be74f819227bfefe4edca35e48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- libltdl usage is configured by --disable/enable-ltdl (see configure.ac
  'AC_ARG_ENABLE([ltdl], [...])')

Fixes:

  configure: WARNING: unrecognized options: [...] --with-libltdl

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/speechd/speechd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index ec62980986..b545863035 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -24,9 +24,9 @@ SPEECHD_PRE_CONFIGURE_HOOKS += SPEECHD_TOUCH_CONFIG_RPATH
 
 ifeq ($(BR2_PACKAGE_LIBTOOL),y)
 SPEECHD_DEPENDENCIES += libtool
-SPEECHD_CONF_OPTS += --with-libltdl
+SPEECHD_CONF_OPTS += --enable-ltdl
 else
-SPEECHD_CONF_OPTS += --without-libltdl
+SPEECHD_CONF_OPTS += --disable-ltdl
 endif
 
 define SPEECHD_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
