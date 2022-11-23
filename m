Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CBBC433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 10:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CEA541917;
	Wed, 23 Nov 2022 10:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CEA541917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rz9tAPIuse0I; Wed, 23 Nov 2022 10:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 132B841B55;
	Wed, 23 Nov 2022 10:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 132B841B55
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECD131BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C634282243
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 10:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C634282243
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1hXwpGOZBE0W for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 10:04:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C17248224B
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 10:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C17248224B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A547284357; Wed, 23 Nov 2022 10:04:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:00:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef6c9da9d255f04847a89d22b99ab3605102d4cb
X-Git-Newrev: 73f04f7f0cb5ab7b4df0f2e8c706d73e6d12b793
X-Patchwork-Hint: ignore
Message-Id: <20221123100436.A547284357@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnupg2: bump version to 2.3.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=73f04f7f0cb5ab7b4df0f2e8c706d73e6d12b793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Brings a number of fixes: https://dev.gnupg.org/T6106

Add patch 0001 to fix undefined reference to `ks_ldap_free_state'
backported from commit 7011286ce6e1fb56c2989fdafbd11b931c489faa

Signed-off-by: Michael Fischer <mf@go-sys.de>
[Peter: add changelog info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/0001-ks_ldap_free_state.patch | 21 +++++++++++++++++++++
 package/gnupg2/gnupg2.hash                   | 10 +++++-----
 package/gnupg2/gnupg2.mk                     |  2 +-
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/package/gnupg2/0001-ks_ldap_free_state.patch b/package/gnupg2/0001-ks_ldap_free_state.patch
new file mode 100644
index 0000000000..fa55d27c04
--- /dev/null
+++ b/package/gnupg2/0001-ks_ldap_free_state.patch
@@ -0,0 +1,21 @@
+
+Fix undefined reference to `ks_ldap_free_state' if OpenLDAP is not
+installed
+
+Backported from: 7011286ce6e1fb56c2989fdafbd11b931c489faa
+
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+
+--- a/dirmngr/server.c
++++ b/dirmngr/server.c
+@@ -3137,8 +3137,10 @@ start_command_handler (assuan_fd_t fd, unsigned int session_id)
+                ctrl->refcount);
+   else
+     {
++#if USE_LDAP
+       ks_ldap_free_state (ctrl->ks_get_state);
+       ctrl->ks_get_state = NULL;
++#endif
+       release_ctrl_ocsp_certs (ctrl);
+       xfree (ctrl->server_local);
+       dirmngr_deinit_default_ctrl (ctrl);
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index ec2654be7b..f9c071ad45 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2022q3/000474.html
-sha1  9255a70a984bfbfa5312a9a52a1cf47cb0d1fc84  gnupg-2.3.7.tar.bz2
+# From  https://lists.gnupg.org/pipermail/gnupg-announce/2022q4/000476.html
+sha1  1f31b7b4c9c9adad97f94ea3acf1aa64c0424bcc  gnupg-2.3.8.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.7.tar.bz2.sig
-# using key 02F38DFF731FF97CB039A1DA549E695E905BA208
-sha256  ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669  gnupg-2.3.7.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.8.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA and AC8E115BF73E2D8D47FA9908E98E9B2D19C6C8BD
+sha256  540b7a40e57da261fb10ef521a282e0021532a80fd023e75fb71757e8a4969ed  gnupg-2.3.8.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 7d8424c136..9dc29ca99e 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.3.7
+GNUPG2_VERSION = 2.3.8
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
