Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F216C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 20:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16EF040B99;
	Mon, 19 Feb 2024 20:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHnYuqbSbzES; Mon, 19 Feb 2024 20:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B8CF40B8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B8CF40B8C;
	Mon, 19 Feb 2024 20:53:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A82871BF41C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9532060813
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 20:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hrDwnZW9IIEW for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 20:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9511E60810
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9511E60810
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 20:53:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 850AE87912; Mon, 19 Feb 2024 20:53:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 21:52:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df5594644ff0fa2ed9128e2a9e9daefd305b795b
X-Git-Newrev: 85d1c86acabb07f7d8ace564ae68a64eb6335a62
X-Patchwork-Hint: ignore
Message-Id: <20240219205309.850AE87912@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: add patch to fix
 crash with .pyc-only builds
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=85d1c86acabb07f7d8ace564ae68a64eb6335a62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch that fixes django auth and admin apps not
working in .pyc only builds.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6148209453

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-Fixed-sensitive_variables-sensitive_post.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/python-django/0001-Fixed-sensitive_variables-sensitive_post.patch b/package/python-django/0001-Fixed-sensitive_variables-sensitive_post.patch
new file mode 100644
index 0000000000..90dc9c7dd0
--- /dev/null
+++ b/package/python-django/0001-Fixed-sensitive_variables-sensitive_post.patch
@@ -0,0 +1,45 @@
+From d294b7679f2cb51c7231d6a7fb22e76eb74e49ec Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+Date: Sat, 17 Feb 2024 08:15:59 +0100
+Subject: [PATCH] Fixed #35187 -- Fixed
+ @sensitive_variables/sensitive_post_parameters decorators crash with
+ .pyc-only builds.
+
+Thanks Jon Janzen for the implementation idea.
+
+Thanks Marcus Hoffmann for the report.
+
+Regression in 38e391e95fe5258bc6d2467332dc9cd44ce6ba52.
+Backport of d1be05b3e9209fd0787841c71a95819d81061187 from main
+
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+Upstream: https://github.com/django/django/commit/41a4bba817f139f3cfd94f04e728e046560c9a18
+---
+ django/views/decorators/debug.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/django/views/decorators/debug.py b/django/views/decorators/debug.py
+index 7ea8a540de..6540fc0651 100644
+--- a/django/views/decorators/debug.py
++++ b/django/views/decorators/debug.py
+@@ -47,7 +47,6 @@ def sensitive_variables(*variables):
+ 
+             try:
+                 file_path = inspect.getfile(wrapped_func)
+-                _, first_file_line = inspect.getsourcelines(wrapped_func)
+             except TypeError:  # Raises for builtins or native functions.
+                 raise ValueError(
+                     f"{func.__name__} cannot safely be wrapped by "
+@@ -55,7 +54,8 @@ def sensitive_variables(*variables):
+                     "Python file (not a builtin or from a native extension)."
+                 )
+             else:
+-                key = hash(f"{file_path}:{first_file_line}")
++                first_line_number = wrapped_func.__code__.co_firstlineno
++                key = hash(f"{file_path}:{first_line_number}")
+ 
+             if variables:
+                 coroutine_functions_to_sensitive_variables[key] = variables
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
