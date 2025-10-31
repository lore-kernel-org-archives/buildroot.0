Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F9CCF9F8
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 20:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7EB241C66;
	Fri, 31 Oct 2025 20:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJ-gYO3lUd-S; Fri, 31 Oct 2025 20:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2820641978
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2820641978;
	Fri, 31 Oct 2025 20:35:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D77A931
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 20:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 831E841955
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 20:35:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RS_UpwSSmQqQ for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 20:35:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EA3E4187A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EA3E4187A
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 20:35:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A0F3835D3; Fri, 31 Oct 2025 20:35:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Oct 2025 19:21:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a20a930fd7a10aecd2b217a643a60a748eb986f
X-Git-Newrev: 4a2202244b8e8f444398cb40f29054ad6ce9b0bb
X-Patchwork-Hint: ignore
Message-Id: <20251031203513.7A0F3835D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: add optional dependency to
 jemalloc
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a2202244b8e8f444398cb40f29054ad6ce9b0bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream in version 9.18.0:
https://gitlab.isc.org/isc-projects/bind9/-/commit/7f1c525625675e7e5e0953a78adefe9e21fc1462

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/bind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 64cf2fa9fb..c4d9047c4e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -49,6 +49,13 @@ else
 BIND_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_JEMALLOC),y)
+BIND_CONF_OPTS += --with-jemalloc
+BIND_DEPENDENCIES += jemalloc
+else
+BIND_CONF_OPTS += --without-jemalloc
+endif
+
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 BIND_CONF_OPTS += --with-json-c
 BIND_DEPENDENCIES += json-c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
