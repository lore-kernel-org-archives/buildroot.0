Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C556CC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6915A400F5;
	Tue, 23 Jul 2024 08:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rH9cpZZO0SuZ; Tue, 23 Jul 2024 08:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39317402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39317402BC;
	Tue, 23 Jul 2024 08:48:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73ADA1BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D865402BC
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2osWMEmnABDp for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73C75400F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73C75400F5
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:48:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6841485AFC; Tue, 23 Jul 2024 08:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:48:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce8793f80a56a95a8c64dced14e818903c5734cc
X-Git-Newrev: 2822fdd0bc2a961544e38cf0f8c6f4bd22855714
X-Patchwork-Hint: ignore
Message-Id: <20240723084849.6841485AFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: fix glibc build with
 gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=2822fdd0bc2a961544e38cf0f8c6f4bd22855714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ac_cv_func_strerror_r_char_p is hardcoded to no since commit
74b9bf9945921a7b0504b4b546a4bc26f2adcc45 back in 2005 however strerror_r
only returns an int with musl. With glibc or uclibc, strerror_r returns
a char* or an int depending on _GNU_SOURCE value resulting in the
following build failure with gcc >= 14:

strerror_r.c: In function 'rpl_strerror_r':
strerror_r.c:207:9: error: assignment to 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
  207 |     ret = strerror_r (errnum, buf, buflen);
      |         ^

To fix this build failure, don't hardcode ac_cv_func_strerror_r_char_p
to let coreutils pick the correct value

Fixes:
 - http://autobuild.buildroot.org/results/8bc649ca5490b0c29c90383edfa2e693f154ebc4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 846d4fa567..89f494310e 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -27,7 +27,6 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_getgroups=yes \
 	ac_cv_func_getgroups_works=yes \
 	ac_cv_func_getloadavg=no \
-	ac_cv_func_strerror_r_char_p=no \
 	ac_cv_func_strnlen_working=yes \
 	ac_cv_have_decl_strerror_r=yes \
 	ac_cv_have_decl_strnlen=yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
