Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EF2CCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9307D80D56;
	Mon, 19 Oct 2026 13:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3IoZMUmQwen; Mon, 19 Oct 2026 13:16:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7B45180DB0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792415797;
	b=Vhjezp6RcuXY7Gwq5QcHjdcWBmgKRC5gfUz8tlXB6U7SoiZDkkfZTehqSJ/NPWCEqZKz
	 4ySVgbGch3eEzKMn3cIl6oUE8mNdMu6PsbKLG3a2U6dXECCgUmLjsXvRDGc9U1UsJOPZ+
	 mvF54fQXKrd57yQ4xRcBE3EW2U3tkZHjB6S5Mo6oq8ST2VNrj6Acohq+mCYUMTkl+2YO8
	 lEqFt2EnXA5wpaJ1etYL3meGw7eBkXAtq2nvnZ5qD6Hx+m6fGPzxLczkv7ZfVuPnCUu4V
	 aSqa4KnK5HZob6Zfdbm/ggsvUWjOfyYQWsqVpIAO6JpnHPwalp1wjfeZm3qFiVuaC0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792415797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=xKDdacNkbUYAWKjfcdvJWgoTmHfsJImwirmd0eQMHE4=;
	b=GZ1WraQw/Dgfdcnf0UtZnDWFN4KWfu7zuiyCVXTGlxoLh1/yHTTX6ZAcfFdUhRN8/ou9
	 h7gZvU0zxRAxD/lFYJuJveMJS2rLpcbf/Fzv2SjnvXWB+K7QWorj7Q88UAxu0oa5J5Rol
	 HlA3RpiO4b5o+o3pgm6hZptDBzBKebqJEwKd1BHfb0w58EqTsJXaVhbf5dJLwkga0TB7B
	 Gy0Y7+eMfBVrjRmf1zNmJGTRy1fjNYmayEhfC1Np8AlZXWAbpY8uUvz6LX0N/yl3Y9Zos
	 LUry0wyLzC8f8b17Ca20TVbsNBXooyB1+rPrP0Zwudnnh1LYsUnjV/YNtQQaJHryGpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792415797;
	bh=xKDdacNkbUYAWKjfcdvJWgoTmHfsJImwirmd0eQMHE4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J/lVRTdLh0WiqttpqMi3ukT5BpP8THPf8DlG/57kIogltTEdpkV+iF7iuW+iVU6Kt
	 NB3GnQIp6AlK5PAI9BW5Jn5c3F2pSruXrO4HtWKrXeZNoR/ehxHSzrzCQRg3rPYlyF
	 aKaiBcxFyvUZ4tfiE8qTGHwZv144J1xA4/0HbQQgWwN0cqXXq0f6F4d2YHavdpTQ5W
	 fBC2rHPDxloTBCUl6x5b4AXsYbOimmovLMVviDXK3zheFYE0xjIJdd2r6neBnHmdFT
	 lOPHmzWUBHShRt3PTwROFLBK2XNey+aVAXOsoRMC8jhwkHWw5B+haJGbVVJncogx0/
	 Nme+40uLsz7ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B45180DB0;
	Mon, 19 Oct 2026 13:16:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65E2B1AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5769140656
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MD09AyjoFxjf for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:16:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6D5FD40655
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792415794;
 b=DRQrYJWp22yZVy7Mk/s6mP6C8WNRhCQntxtPPR8PgHZpDRRe0cVHrCcgEgkQUXK0LJsi
 VBkLpwkUsT1hU1nfcGGLmLh8J2ywdnVMap/SXu6FXn9sf7offImp4p02jmgrr7vLWplmC
 K7BpuA+dgp9F12SJntCVkSM/GSxq8H4uB6GdWIjaZAKGCqb6nMph7DsRXJ86o+Xf05LwD
 AEJqF8eJRXeVklNzT4qlFJX3oV11A100xcE914QFC6wHH2+HXg6Nk+N7x1XgEF1AeKhdd
 oedAIhqPRhfXfsJaIyAY47YSKWJ0CQBkFuNwikXWBJJB3hzwTsp14f5svwZTH0tgiwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792415794;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LyF6wnrpRH9LQ8FHBOe0t3kvbezAh32F5GjMfNQcJiU=;
 b=Q/poFUBotlTZAPAMtMbQK4I2ACfcJMzIAMGHPmbcSKT/mG1H8Z867JqDfWT2BX4i1gIh
 WkN2KOXW7J/15ECEgfEjEL+1ggO9v8frgo2z9ePTr8JWfORlv1h01l9K2pQRUwmYY8G4d
 luHa1RQTZTlqTmfx14dIrYVIB5kx7SIMiEDmb3Udoy0dUE7BLl7BQ1HMyCBGJCZzEZD7f
 DBah1uN4TWakTXDZ0utdqQsp41A+g9WU6lL3MPxrSDEeDIettTUHDDE0SEUc2MmmGHth/
 0KE7IVdBKI8mrAF5AjdAe12rTMPaUm79ygT8rtmnwMc7V6KocITR0jw8zFfZdlna73Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D5FD40655
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:16:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D107398598; Mon, 19 Oct 2026 13:15:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 15:14:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f041d0bcfb76bf89b267d9a68794a86fa482e16e
X-Git-Newrev: c80305aa9db6c6008ac0c017f342132057a5926b
X-Patchwork-Hint: ignore
Message-Id: <20261019131511.D107398598@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drogon: bump to version 1.9.14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0215886003425814946=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0215886003425814946==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c80305aa9db6c6008ac0c017f342132057a5926b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/drogonframework/drogon/releases/tag/v1.9.14

Drop the local patches, as both fixes are part of the trantor
submodule shipped with this release:
- 0001-Fix-EPOLLRDHUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch:
  https://github.com/an-tao/trantor/commit/0f45310fbbb6
- 0002-Fix-incomplete-struct-tm-type-on-uClibc.patch:
  https://github.com/an-tao/trantor/commit/66dc5780ed4d

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...HUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch | 93 ----------------------
 ...2-Fix-incomplete-struct-tm-type-on-uClibc.patch | 36 ---------
 package/drogon/drogon.hash                         |  2 +-
 package/drogon/drogon.mk                           |  2 +-
 4 files changed, 2 insertions(+), 131 deletions(-)

diff --git a/package/drogon/0001-Fix-EPOLLRDHUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch b/package/drogon/0001-Fix-EPOLLRDHUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch
deleted file mode 100644
index 7a9fab389f..0000000000
--- a/package/drogon/0001-Fix-EPOLLRDHUP-POLLRDHUP-mismatch-on-Linux-SPARC-SPA.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 9ecfb965e6ea02583874e534f8936ebb43a9db29 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Mon, 20 Jul 2026 16:16:22 +0200
-Subject: [PATCH] Fix EPOLLRDHUP/POLLRDHUP mismatch on Linux SPARC/SPARC64
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix a build failure reported by Buildroot autobuild for the
-bootlin-sparc64-glibc configuration:
-
-  EpollPoller.cc:41:26: error: static assertion failed:
-  EPOLLRDHUP != POLLRDHUP
-
-On SPARC/SPARC64, EPOLLRDHUP (0x2000) and POLLRDHUP (0x0800) are
-different bits, breaking the assumption elsewhere in this file that
-epoll and poll flags are interchangeable.
-
-Introduce a combined RDHUP value for this architecture and translate
-it before epoll_ctl() and after epoll_wait(), since revents_ is later
-tested against POLLRDHUP in Channel::handleEvent() — otherwise
-half-close detection would silently break at runtime.
-
-This patch is inspired by the equivalent fix in lighttpd:
-https://redmine.lighttpd.net/issues/3251
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/an-tao/trantor/pull/407
----
- trantor/trantor/net/inner/poller/EpollPoller.cc | 25 ++++++++++++++++++++++++-
- 1 file changed, 24 insertions(+), 1 deletion(-)
-
-diff --git a/trantor/trantor/net/inner/poller/EpollPoller.cc b/trantor/trantor/net/inner/poller/EpollPoller.cc
-index c9c4f7d481b4..812b48c30d79 100644
---- a/trantor/trantor/net/inner/poller/EpollPoller.cc
-+++ b/trantor/trantor/net/inner/poller/EpollPoller.cc
-@@ -22,6 +22,9 @@
- #include <assert.h>
- #include <strings.h>
- #include <iostream>
-+#if (defined(__sparc__) || defined(__sparc))
-+#define TRANTOR_RDHUP 0x2800 /* EPOLLRDHUP | POLLRDHUP */
-+#endif
- #elif defined _WIN32
- #include "Wepoll.h"
- #include <assert.h>
-@@ -38,7 +41,12 @@ namespace trantor
- static_assert(EPOLLIN == POLLIN, "EPOLLIN != POLLIN");
- static_assert(EPOLLPRI == POLLPRI, "EPOLLPRI != POLLPRI");
- static_assert(EPOLLOUT == POLLOUT, "EPOLLOUT != POLLOUT");
-+#if (defined(__sparc__) || defined(__sparc))
-+static_assert(EPOLLRDHUP & TRANTOR_RDHUP,
-+              "EPOLLRDHUP not included in TRANTOR_RDHUP");
-+#else
- static_assert(EPOLLRDHUP == POLLRDHUP, "EPOLLRDHUP != POLLRDHUP");
-+#endif
- static_assert(EPOLLERR == POLLERR, "EPOLLERR != POLLERR");
- static_assert(EPOLLHUP == POLLHUP, "EPOLLHUP != POLLHUP");
- #endif
-@@ -127,7 +135,15 @@ void EpollPoller::fillActiveChannels(int numEvents,
-         assert(it != channels_.end());
-         assert(it->second == channel);
- #endif
--        channel->setRevents(events_[i].events);
-+        int revents = events_[i].events;
-+#if defined(__linux__) && (defined(__sparc__) || defined(__sparc))
-+        if (revents & EPOLLRDHUP)
-+        {
-+            revents &= ~EPOLLRDHUP;
-+            revents |= POLLRDHUP;
-+        }
-+#endif
-+        channel->setRevents(revents);
-         activeChannels->push_back(channel);
-     }
-     // LOG_TRACE<<"active Channels num:"<<activeChannels->size();
-@@ -205,6 +221,13 @@ void EpollPoller::update(int operation, Channel *channel)
-     struct epoll_event event;
-     memset(&event, 0, sizeof(event));
-     event.events = channel->events();
-+#if defined(__linux__) && (defined(__sparc__) || defined(__sparc))
-+    if (event.events & TRANTOR_RDHUP)
-+    {
-+        event.events &= ~TRANTOR_RDHUP;
-+        event.events |= EPOLLRDHUP;
-+    }
-+#endif
-     event.data.ptr = channel;
-     int fd = channel->fd();
-     if (::epoll_ctl(epollfd_, operation, fd, &event) < 0)
--- 
-2.43.0
-
diff --git a/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch b/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch
deleted file mode 100644
index 4fad84664c..0000000000
--- a/package/drogon/0002-Fix-incomplete-struct-tm-type-on-uClibc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From cd29aa61d299c82d82d3285215fc4fc65e4d4fb9 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Sun, 30 Aug 2026 12:00:00 +0200
-Subject: [PATCH] Fix incomplete 'struct tm' type on uClibc
-
-Fix a build failure [1] reported by Buildroot autobuild for the
-mips/uClibc configuration:
-
-  Date.cc:98:28: error: return type 'struct trantor::tm' is incomplete
-     98 | struct tm Date::tmStruct() const
-        |                            ^~~~~
-
-Add the missing include to Date.h.
-
-[1] https://autobuild.buildroot.org/results/e48e0fc1b95a8ad5de964b1e6d12bc45ac39f0b4/
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/an-tao/trantor/pull/415
----
- trantor/utils/Date.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/trantor/trantor/utils/Date.h b/trantor/trantor/utils/Date.h
-index 4367d76e0305..41b02d355d14 100644
---- a/trantor/trantor/utils/Date.h
-+++ b/trantor/trantor/utils/Date.h
-@@ -16,6 +16,7 @@
- 
- #include <trantor/exports.h>
- #include <stdint.h>
-+#include <time.h>
- #include <string>
- 
- namespace trantor
--- 
-2.43.0
-
diff --git a/package/drogon/drogon.hash b/package/drogon/drogon.hash
index 997fd519e1..ec4970731d 100644
--- a/package/drogon/drogon.hash
+++ b/package/drogon/drogon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d7dc4591b61c34903362209e58a3f92903c76ce6514ffba5ccfaa86a2e3227c  drogon-v1.9.13-git4.tar.gz
+sha256  9917aa99aac53d4b6253a0b764ba3e8a94889df1c41932e1adef8352f917ea6a  drogon-v1.9.14-git4.tar.gz
 sha256  7e1ed2ca339c384279f1e195e99916eb0145a0d87659969c7e22f8fdd53e11fd  LICENSE
diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 73388ea92c..03cba45ceb 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROGON_VERSION = v1.9.13
+DROGON_VERSION = v1.9.14
 DROGON_SITE = https://github.com/drogonframework/drogon
 DROGON_SITE_METHOD = git
 DROGON_GIT_SUBMODULES = YES

--===============0215886003425814946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0215886003425814946==--
