Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FB5C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 12:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9469241026;
	Sat, 19 Jul 2025 12:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLqSj9GBY5CL; Sat, 19 Jul 2025 12:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF84C40F31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF84C40F31;
	Sat, 19 Jul 2025 12:16:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E9EDA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC18C6080A
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8UXyx65hbaW for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 12:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ECC960B6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ECC960B6A
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 12:16:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 398B5867B3; Sat, 19 Jul 2025 12:16:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 14:03:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90fdb03f4730edef8946b29640ffda8783c244da
X-Git-Newrev: f38d4e63d76e3eeca78b28d7fca80dbc13ec6eef
X-Patchwork-Hint: ignore
Message-Id: <20250719121625.398B5867B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-fast: fix cython 3.1.x
 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=f38d4e63d76e3eeca78b28d7fca80dbc13ec6eef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since python-cython bump to 3.1.2 in commit [1], python-dbus-fast
is failing to build.

Set --skip-dependency-check as dbus-fast specifies an unnecessarily
strict maximum cython version.

Fixes:
ERROR Missing dependencies:
	Cython<3.1.0,>=3

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/b536caaec0d800ccf7669a50fce5192bce2405a6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add reference to buildroot commit introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dbus-fast/python-dbus-fast.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 854ce2068b..fe17674708 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -11,6 +11,7 @@ PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
 PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
+PYTHON_DBUS_FAST_BUILD_OPTS = --skip-dependency-check
 PYTHON_DBUS_FAST_DEPENDENCIES = \
 	host-python-cython \
 	host-python-setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
