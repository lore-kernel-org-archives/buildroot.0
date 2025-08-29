Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2746ECA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B700821BF;
	Fri, 29 Aug 2025 17:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HbYcP89IP5f; Fri, 29 Aug 2025 17:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 643B281E4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643B281E4E;
	Fri, 29 Aug 2025 17:54:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A7611F4
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B8128191E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsSkO--W5y9F for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F6D2841DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F6D2841DA
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F0B087E43; Fri, 29 Aug 2025 17:54:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 19:49:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53a8616460e5730abe703ca5a46bae0039d548aa
X-Git-Newrev: 59fe7547a495ffbaa817fd57e13c8741acfe1248
X-Patchwork-Hint: ignore
Message-Id: <20250829175420.8F0B087E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap-ng: disable pthread support
 on nommu
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59fe7547a495ffbaa817fd57e13c8741acfe1248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: https://autobuild.buildroot.net/results/9c40c86a42882a6d56eb6d6d1418781a980b6f8f/

The pthread support uses pthread_atfork(), which is not available on nommu:

cap-ng.c: In function 'init_lib':
cap-ng.c:225:9: error: implicit declaration of function 'pthread_atfork';
  did you mean 'pthread_join'?  [-Wimplicit-function-declaration]

So disable pthread support on nommu to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libcap-ng/libcap-ng.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 9c8012b238..e544e27696 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -14,6 +14,11 @@ LIBCAP_NG_INSTALL_STAGING = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python3
 
+# pthread support uses pthread_atfork, which is not available on nommu
+ifneq ($(BR2_USE_MMU),y)
+LIBCAP_NG_CONF_ENV += ac_cv_header_pthread_h=no
+endif
+
 HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 HOST_LIBCAP_NG_CONF_OPTS = --without-python3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
