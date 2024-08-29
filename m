Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F82EC7EE3A
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 08:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2822B61115;
	Thu, 29 Aug 2024 08:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x24k0Ety3Kpf; Thu, 29 Aug 2024 08:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF62D605F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF62D605F5;
	Thu, 29 Aug 2024 08:10:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78D381BF2EF
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 08:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64CFE401AF
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 08:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qep9YKqNVqpa for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 08:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED9E140160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED9E140160
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED9E140160
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 08:10:22 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E023E3536714; Thu, 29 Aug 2024 10:10:19 +0200 (CEST)
Date: Thu, 29 Aug 2024 10:10:19 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZtAs6xuq4/MXBfre@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724919019; bh=4IPnCGFIGcB8UshI9vAWlqbSkZvya0YfLF9RSYOWOyg=;
 h=Date:From:To:Subject:From;
 b=BjdC9oqHO7EIwRQSGpPnSg+LBqOqWlPmKoLbtmeBp3Dk8KGoYlVQ/rnrZiDiqZhCM
 c01hyqH8jAX0sE8UrdeK1I4Hrk+JEh4gCzu625uZwPBw1vQbnIAqXEj/lgHfZ3i30R
 ZGnnWNF66fGgx7YF3Z+OgPKXKmc4pcPLuuISSAvM3QZs3Hi4AJeAeo4pRwGcsUl5BO
 Ogh9EIajqPqRWjWFxk0l2LcHCzIWToQ0CV5HwlEI+s4eV36fKx0Ks9WA0QYIjPV1pH
 2vrpSV+xTi7M0GiiT+R04pI+UryCmiu7JojH6XOdw1Vy8+6PMeY2EfUlPzZk13U/of
 mCyz0tGhvMHeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=BjdC9oqH
Subject: [Buildroot] [PATCH] package/lighttpd: fix sparc/sparc64 compilation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From Upstream git, two patches to fix sparc/sparc64 specific
compile issues.

Fixes:

 http://autobuild.buildroot.org/results/c35/c35f9b78b8f114bb795ed162585d707331954b4b

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...ial-value-for-Linux-POLLRDHUP-on-SPA.patch | 34 ++++++++
 ...ue-for-Linux-POLLRDHUP-on-SPARC-fixe.patch | 85 +++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
 create mode 100644 package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch

diff --git a/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch b/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
new file mode 100644
index 0000000000..eebfa3a113
--- /dev/null
+++ b/package/lighttpd/0002-Revert-core-special-value-for-Linux-POLLRDHUP-on-SPA.patch
@@ -0,0 +1,34 @@
+From 88ff3763dae65371eab9f8a22ac1c95c96fe4490 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Tue, 23 Apr 2024 00:16:29 -0400
+Subject: [PATCH] Revert "[core] special value for Linux POLLRDHUP on SPARC"
+ (fixes #3251)
+
+This reverts commit f14f9142f4487704e2ce0f196263c091accdb12c.
+
+x-ref:
+  "[1.4.76] buildroot compile error with bootlin-sparc{64-g,-uc}libc"
+  https://redmine.lighttpd.net/issues/3251
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/88ff3763dae65371eab9f8a22ac1c95c96fe4490
+---
+ src/fdevent.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/fdevent.h b/src/fdevent.h
+index e9c380b0..1b0a062f 100644
+--- a/src/fdevent.h
++++ b/src/fdevent.h
+@@ -40,8 +40,6 @@ struct fdnode_st {
+ #if (defined(__sun) && defined(__SVR4)) /* Solaris */ \
+  || defined(__FreeBSD__)
+ #define FDEVENT_RDHUP  0x4000
+-#elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
+-#define FDEVENT_RDHUP  0x0800
+ #else
+ #define FDEVENT_RDHUP  0x2000
+ #endif
+-- 
+2.30.2
+
diff --git a/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch b/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch
new file mode 100644
index 0000000000..f3996d185e
--- /dev/null
+++ b/package/lighttpd/0003-core-special-value-for-Linux-POLLRDHUP-on-SPARC-fixe.patch
@@ -0,0 +1,85 @@
+From 524614455554163ec78b27b89ff52bbf7fe96958 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 24 Apr 2024 03:07:37 -0400
+Subject: [PATCH] [core] special value for Linux POLLRDHUP on SPARC (fixes
+ #3251)
+
+x-ref:
+  "[1.4.76] buildroot compile error with bootlin-sparc{64-g,-uc}libc"
+  https://redmine.lighttpd.net/issues/3251
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/524614455554163ec78b27b89ff52bbf7fe96958
+---
+ src/fdevent.h      |  2 ++
+ src/fdevent_impl.c | 18 ++++++++++++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/src/fdevent.h b/src/fdevent.h
+index 1b0a062f..556a1445 100644
+--- a/src/fdevent.h
++++ b/src/fdevent.h
+@@ -40,6 +40,8 @@ struct fdnode_st {
+ #if (defined(__sun) && defined(__SVR4)) /* Solaris */ \
+  || defined(__FreeBSD__)
+ #define FDEVENT_RDHUP  0x4000
++#elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++#define FDEVENT_RDHUP  0x2800 /*(0x2000 EPOLLRDHUP | 0x0800 POLLRDHUP)*/
+ #else
+ #define FDEVENT_RDHUP  0x2000
+ #endif
+diff --git a/src/fdevent_impl.c b/src/fdevent_impl.c
+index 8bfc1cc6..c84c8df5 100644
+--- a/src/fdevent_impl.c
++++ b/src/fdevent_impl.c
+@@ -338,6 +338,11 @@ fdevent_linux_sysepoll_event_set (fdevents *ev, fdnode *fdn, int events)
+     struct epoll_event ep;
+   #ifndef EPOLLRDHUP
+     events &= ~FDEVENT_RDHUP;
++  #elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++    if (events & FDEVENT_RDHUP) {
++        events &= ~FDEVENT_RDHUP;
++        events |= EPOLLRDHUP;
++    }
+   #endif
+     ep.events = events | EPOLLERR | EPOLLHUP;
+     ep.data.ptr = fdn;
+@@ -376,7 +381,11 @@ fdevent_linux_sysepoll_init (fdevents *ev)
+     ck_static_assert(EPOLLERR   == FDEVENT_ERR);
+     ck_static_assert(EPOLLHUP   == FDEVENT_HUP);
+   #ifdef EPOLLRDHUP
++   #if (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++    ck_static_assert(EPOLLRDHUP  & FDEVENT_RDHUP);
++   #else
+     ck_static_assert(EPOLLRDHUP == FDEVENT_RDHUP);
++   #endif
+   #endif
+ 
+     ev->type      = FDEVENT_HANDLER_LINUX_SYSEPOLL;
+@@ -770,6 +779,11 @@ fdevent_poll_event_set (fdevents *ev, fdnode *fdn, int events)
+ 
+   #ifndef POLLRDHUP
+     events &= ~FDEVENT_RDHUP;
++  #elif (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++    if (events & FDEVENT_RDHUP) {
++        events &= ~FDEVENT_RDHUP;
++        events |= POLLRDHUP;
++    }
+   #endif
+ 
+     if (k >= 0) {
+@@ -854,7 +868,11 @@ fdevent_poll_init (fdevents *ev)
+     ck_static_assert(POLLHUP   == FDEVENT_HUP);
+     ck_static_assert(POLLNVAL  == FDEVENT_NVAL);
+   #ifdef POLLRDHUP
++   #if (defined(__linux__) && (defined(__sparc__) || defined(__sparc)))
++    ck_static_assert(POLLRDHUP  & FDEVENT_RDHUP);
++   #else
+     ck_static_assert(POLLRDHUP == FDEVENT_RDHUP);
++   #endif
+   #endif
+ 
+     ev->type      = FDEVENT_HANDLER_POLL;
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
