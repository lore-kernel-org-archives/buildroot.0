Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7ACC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E7F160F4D;
	Mon, 19 May 2025 10:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jikcMrDOadjs; Mon, 19 May 2025 10:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5014D60F36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5014D60F36;
	Mon, 19 May 2025 10:40:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D1AD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A347340D90
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtC7GtreiEGm for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5362A40734
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5362A40734
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D51D8725C; Mon, 19 May 2025 10:39:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 10:32:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: acc7ce7262447a8f55986245b8bd41d0aaf13674
X-Git-Newrev: dac8e9b30399ecf15fb0cb07e67e6e6a32fb8dec
X-Patchwork-Hint: ignore
Message-Id: <20250519103942.4D51D8725C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/postgresql: fix build
 with external gettext
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dac8e9b30399ecf15fb0cb07e67e6e6a32fb8dec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Postgresql fails to build with NLS enabled against uclibc/musl after the
move to meson:

-------------------------------------------------------
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: scram-common.c:(.text+0x65c): undefined reference to `libintl_gettext'
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: scram-common.c:(.text+0x6cc): undefined reference to `libintl_gettext'
/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: scram-common.c:(.text+0x73c): undefined reference to `libintl_gettext'
-------------------------------------------------------

uclibc/musl toolchains use GNU gettext for NLS support.
So we need to link against external libintl.

Fixes: https://autobuild.buildroot.org/results/244f154aece46d02747b875faba4c51e7b5d0dc2/
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Peter: also pass TARGET_LDFLAGS, mention the change to meson]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 2b6e78b941..bffa544a5a 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,7 +13,7 @@ POSTGRESQL_CPE_ID_VENDOR = postgresql
 POSTGRESQL_SELINUX_MODULES = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
-POSTGRESQL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+POSTGRESQL_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 # We have to force invalid paths for xmllint and xsltproc, otherwise
 # if detected they get used, even with -Ddocs=disabled and
 # -Ddocs_pdf=disabled, and it causes build failures
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
