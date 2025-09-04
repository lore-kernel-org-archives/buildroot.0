Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598EECA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BDA5403A0;
	Thu,  4 Sep 2025 16:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzH38Rd2JK7y; Thu,  4 Sep 2025 16:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59AC540443
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59AC540443;
	Thu,  4 Sep 2025 16:14:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D915AAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB26D40062
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Azo8GamUMdTV for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C36A940073
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C36A940073
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C17A487F0E; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9c5aeac0c41a8b4d611ddc115c3782504846f484
X-Git-Newrev: 427fbd3af6082adaddf33576c606f439b93cce13
X-Patchwork-Hint: ignore
Message-Id: <20250904161349.C17A487F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcap-ng:
 disable pthread support on nommu
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=427fbd3af6082adaddf33576c606f439b93cce13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes: https://autobuild.buildroot.net/results/9c40c86a42882a6d56eb6d6d1418781a980b6f8f/

The pthread support uses pthread_atfork(), which is not available on nommu:

cap-ng.c: In function 'init_lib':
cap-ng.c:225:9: error: implicit declaration of function 'pthread_atfork';
  did you mean 'pthread_join'?  [-Wimplicit-function-declaration]

So disable pthread support on nommu to fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 59fe7547a495ffbaa817fd57e13c8741acfe1248)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
