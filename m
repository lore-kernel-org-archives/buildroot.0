Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42F0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 10:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FFA940483;
	Sat,  9 Apr 2022 10:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rZLaG1hTft0f; Sat,  9 Apr 2022 10:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0DCB4098B;
	Sat,  9 Apr 2022 10:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57BCF1BF5A8
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47ECD844A7
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 10:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzOLVs_dT8cc for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30804844CD
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 10:32:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2BF8F8350E; Sat,  9 Apr 2022 10:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 12:31:46 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 422d263a71d943944f469db3c2ae8827337cd0bf
X-Git-Newrev: c522be0d509292b983b99f06c367da3e627e3c48
X-Patchwork-Hint: ignore
Message-Id: <20220409102239.2BF8F8350E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libkrb5: fix
 BR2_SHARED_STATIC_LIBS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c522be0d509292b983b99f06c367da3e627e3c48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with BR2_SHARED_STATIC_LIBS raised since
the addition of the package in commit
7ae94b51ed5d51fb9fa3f5a931bb8435bcbfaa42 and
https://github.com/krb5/krb5/commit/bd13166a4098198832d921b8e50b97008b714b7b

configure: error: --enable-static must be specified with --disable-shared

Fixes:
 - http://autobuild.buildroot.org/results/dadbf9f77ffdcc4d4e48c6d7e6beb5da303a8074

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d0d70761131d0f2c029e95db4c97827944684aaa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libkrb5/libkrb5.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index d41e7559a5..f406cd9e49 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -37,6 +37,11 @@ LIBKRB5_CONF_OPTS = \
 	--without-tcl \
 	--disable-rpath
 
+# Enabling static and shared at the same time is not supported
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBKRB5_CONF_OPTS += --disable-static
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 LIBKRB5_CONF_OPTS += --with-ldap
 LIBKRB5_DEPENDENCIES += openldap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
