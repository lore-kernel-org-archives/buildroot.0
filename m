Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BEBC43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 12:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A35A740868;
	Sun,  5 Jul 2026 12:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuXc2OnaFBox; Sun,  5 Jul 2026 12:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBF4140871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783253573;
	bh=ATEzLXEIYOSHjnnZCoy2m63YN5vEUSxGXtFzhkbwlzU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FDqyPTjg5Jvan1miA0BVioDPJ0nx5dMlO1n+gSrIOhMJI7pmkb6T4Dd5ENa0e2VeX
	 mji6zb+EO35yvPAUkXNROxaVsKoJVYvzHRhxN9BcYkq2tWMtNlD5qeqUtl16OSj4sR
	 shyBFmZnP5sPyuoDTdXim9PyOUpDflbwtlOfQLwFPstEhirf0npeOOMdZwLdCBZGXK
	 KRyT6MbRKFiPpicDUOs3lgpeBAbUB0Y35BjayRYYodQIzdu5vbUzj8uzEj30v2FiS6
	 thYYfJpNT/0LE7TRoATgU1W1pHfO0PZTVqPWqtcN+jGq0OZJnz0UJIXqt8Q4U4HTiv
	 +jiQfjE66BtDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBF4140871;
	Sun,  5 Jul 2026 12:12:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8531F2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E60A60703
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qhT88uu2SOC for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 12:12:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE03B60706
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE03B60706
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:12:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F81188463; Sun,  5 Jul 2026 12:12:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 14:07:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be70e1b9f30eb0df8b0a40ff06fe5056ed853504
X-Git-Newrev: b88b96246d100843004cd7cbb7f642ad982bfb88
X-Patchwork-Hint: ignore
Message-Id: <20260705121221.8F81188463@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr: fix build failure with GCC >=
 14
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b88b96246d100843004cd7cbb7f642ad982bfb88
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The workaround in 3d06661fc1bf0f88356981a44cb93b7b0c76a669 for the
broken C23 check was incorrect: When overriding ac_cv_prog_cc_c23 the
value must either be "no" (to indicate that C23 is not supported) or
contain the command line parameters to enable C23 with the C compiler
in use (e.g. "-std=gnu23", may be an empty string if appropriate). The
workaround set it to "yes" for host GCC >= 14, making builds fail.

However, the original issue was that apr may try to enable C23 in host
CC calls if the target CC supports it. So instead of figuring out the
correct arguments for GCC >= 14, we can set ac_cv_prog_cc_c23=no only
for host GCC <= 13 and leave it unset otherwise, as in that case
enabling C23 will do no harm.

Fixes: 3d06661fc1bf0f88356981a44cb93b7b0c76a669
Fixes:
- https://autobuild.buildroot.net/results/77c/77cd5456169e04c2f92dc328c4b6828513d1195f/
- https://autobuild.buildroot.net/results/7a4/7a4fb2b21027f98df607871d9fe0dd234d44aebb/
- https://autobuild.buildroot.net/results/a6c/a6cef4c5965fdeb40d3b39cbd40941329f4fc1c8/
(and more)

Tested-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/apr/apr.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index e8cf0f309e..f7f7553e54 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -34,7 +34,6 @@ APR_CONF_ENV = \
 	ac_cv_mmap__dev_zero=yes \
 	ac_cv_func_setpgrp_void=yes \
 	apr_cv_process_shared_works=yes \
-	ac_cv_prog_cc_c23=$(if $(BR2_HOST_GCC_AT_LEAST_14),yes,no) \
 	apr_cv_mutex_robust_shared=no \
 	apr_cv_tcp_nodelay_with_cork=yes \
 	ac_cv_sizeof_struct_iovec=8 \
@@ -51,6 +50,10 @@ APR_CONF_ENV = \
 	apr_preload_done=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
+ifeq ($(BR2_HOST_GCC_AT_LEAST_14),)
+APR_CONF_ENV += ac_cv_prog_cc_c23=no
+endif
+
 # Doesn't even try to guess when cross compiling
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 APR_CONF_ENV += apr_cv_pthreads_lib="-lpthread"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
