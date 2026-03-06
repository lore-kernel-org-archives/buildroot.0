Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42D2FCC05D
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73259613DD;
	Fri,  6 Mar 2026 18:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JVZSrhKDTLxl; Fri,  6 Mar 2026 18:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EE89613DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822442;
	bh=YIoW7YtanEvYnkiwZTwX0FxXpnGFWNI3iDZVVrgin6A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dMSD4Cgk6rQXCdvv6GhznORUac0XxtmHoVfcZgyP2FaJqTqVtOcLDEd5KNqN+03o9
	 0U534it9KK6mJs9k9xeKGpZfmmhE9h9QPCE6tpTxHRBHX4Ra7SjElKmnJOQGwIJC4Q
	 BOu+PiFtRXJKAZQtdXHSEeEXJLqnJDZxX88e/QXHXWVCnsP2XyQ4CYj6TczaR8DxNF
	 fxXA+X5UP5i4zkOvr9XbdsV5yjbOc7SAQpXCQZjZSEj5I3hXr57Gq1iv17A4CMxkNl
	 CvfWCKNe36zoP1OPOCvex23r1M+EyullkRLDoiIYtbCsEIcu0bWgChGZcdPKlXWtZb
	 qXho7Dxc9JhKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EE89613DB;
	Fri,  6 Mar 2026 18:40:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 805BD339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F23A401D6
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtiOh40Qfk-N for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A22A64027C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A22A64027C
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA558867A3; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d41d0d980691af8187d301f371b4b46fca54a7c
X-Git-Newrev: 86a506c2588ac917f7881b0b9c36eb18c8c2d640
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.AA558867A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: disable mod_enum to
 fix build with glibc 2.43
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/86a506c2588ac917f7881b0b9c36eb18c8c2d640
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Build is broken with glibc 2.43:

mod_enum.c: In function 'add_result':
mod_enum.c:246:23: error: passing argument 1 of '__assert_single_arg'
 makes integer from pointer without a cast [-Wint-conversion]
  246 |         switch_assert(new_result);
      |                       ^~~~~~~~~~
      |                       |
      |                       enum_record_t * {aka struct enum_record *}

Since both services (e164.org, freenum.org) used in the default
configutation of mod_enum
https://github.com/signalwire/freeswitch/blob/master/src/mod/applications/mod_enum/conf/autoload_configs/enum.conf.xml

seem to be dead for years now:
https://community.asterisk.org/t/asterisk-network-interconnect/88659

we do not care to try to fix the build error.
Instead the optional support for mod_enum is removed from the package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeswitch/freeswitch.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7e5dc3d872..1121bfa9cc 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -207,11 +207,6 @@ FREESWITCH_DEPENDENCIES += libks
 FREESWITCH_ENABLED_MODULES += endpoints/mod_verto
 endif
 
-ifeq ($(BR2_PACKAGE_LIBLDNS),y)
-FREESWITCH_DEPENDENCIES += libldns
-FREESWITCH_ENABLED_MODULES += applications/mod_enum
-endif
-
 ifeq ($(BR2_PACKAGE_LIBMEMCACHED),y)
 FREESWITCH_DEPENDENCIES += libmemcached
 FREESWITCH_ENABLED_MODULES += applications/mod_memcache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
