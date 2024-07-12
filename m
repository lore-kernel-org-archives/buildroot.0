Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E49C3DA50
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F18F83F98;
	Fri, 12 Jul 2024 22:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQp7-u7eRymj; Fri, 12 Jul 2024 22:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE3A845CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE3A845CF;
	Fri, 12 Jul 2024 22:10:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08F9C1BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E906460656
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5f5gtJhlAxC for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 395A860686
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 395A860686
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:10:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 257AB862ED; Fri, 12 Jul 2024 22:10:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 00:09:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91cd9488005e7f0fce7ead126f1e637deefcaf02
X-Git-Newrev: a5ce48fe456d790612c9b63990f0a4f3e2faa554
X-Patchwork-Hint: ignore
Message-Id: <20240712221044.257AB862ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: add optional libsndfile
 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a5ce48fe456d790612c9b63990f0a4f3e2faa554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU Octave supports the --with-sndfile configure option since v4.0.0.

For reference, commit 40ea68b4b2 "package/octave: new package"
introduced the package at v7.1.0.

This commits adds this optional support.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 0c7c411692..2e2fe0f989 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -43,6 +43,13 @@ else
 OCTAVE_CONF_OPTS += --without-curl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+OCTAVE_CONF_OPTS += --with-sndfile
+OCTAVE_DEPENDENCIES += libsndfile
+else
+OCTAVE_CONF_OPTS += --without-sndfile
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OCTAVE_CONF_OPTS += --with-openssl=yes
 OCTAVE_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
