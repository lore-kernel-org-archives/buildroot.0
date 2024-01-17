Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3912BC47DA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 21:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA5FE41DEE;
	Wed, 17 Jan 2024 21:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA5FE41DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1EVv7Rv8CAzf; Wed, 17 Jan 2024 21:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17ED441DF5;
	Wed, 17 Jan 2024 21:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17ED441DF5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E169A1BF335
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 21:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7EFB4371E
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 21:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7EFB4371E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTbwNUCKK8D9 for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 21:08:28 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B0A043714
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 21:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B0A043714
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8AF0413F88D;
 Wed, 17 Jan 2024 22:08:22 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 22:07:56 +0100
Message-ID: <20240117210756.265708-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705525705;
 bh=DRQM8y1jJj0InW+n8r2unfW4XoEBxP/0wyGor3tVch4=;
 h=From:To:Cc:Subject:Date:From;
 b=Vs32XA3PKdlmN3qPtuB5STA4Bjtpgl8j1mAezZm24jUSmSnxtEgUfIc8mTYRyQz0J
 lbszHx/G2kveUqBAsS+mxzX13xcbPfFagEK/hS1mvsbdYdWwD8C9cV/FfcuNV8CGX0
 t7OZ4Lfj1f1oB9Ne9YthTzMAj2E6X1/GrzELSHiCXv8ibvZLQjW7TNwJkEghfUdqiI
 dd0dZ9M7lrKHzUhuwwDwTi0xyUQH99DeK3wNQAD1dEQ6oESOCEhgCGoT/xp27uI0qy
 D/ODSGMFleJ1HEsCEDfDWhgahBfamcviHa49QzgCsNMB6ZS2CqED+CUsS6dBiFaj3A
 HRKo9QouzGp0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vs32XA3P
Subject: [Buildroot] [PATCH 1/1] package/postgresql: fix service runtime
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 2a8065e "package/postgresql: bump version to 16.1", the
postgresql service fail to start at runtime with an error:

    FATAL:  could not load library "/usr/lib/postgresql/dict_snowball.so": /usr/lib/postgresql/dict_snowball.so: undefined symbol: CurrentMemoryContext

This is due to the Posgresql autotool configure script trying to
detect whether the toolchain linker needs --export-dynamic or not.
This test is done with a runtime execution of a test program, and
therefore cannot run in cross-compilation. In that case, the
configure script assumes it is not needed. See commit [1], included
in PostgreSQL v16.0.

This commit fixes the issue by forcing the value in _CONF_ENV. The
package has already a Kconfig dependency on !BR2_STATIC_LIBS, so the
value can be unconditionally set.

[1] https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=9db49fc5bfdc0126be03f4b8986013e59d93b91d

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
This patch was tested on branch master at commit b200632, and also
with patch from:
https://patchwork.ozlabs.org/project/buildroot/patch/20240111224003.243443-1-ju.o@free.fr/

with command:

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_postgresql
    ...
    OK
---
 package/postgresql/postgresql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index ec5b61b932..644f93d88a 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -15,6 +15,7 @@ POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = \
 	ac_cv_type_struct_sockaddr_in6=yes \
+	pgac_cv_prog_cc_LDFLAGS_EX_BE__Wl___export_dynamic=yes \
 	LIBS=$(TARGET_NLS_LIBS)
 POSTGRESQL_CONF_OPTS = --disable-rpath
 POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
