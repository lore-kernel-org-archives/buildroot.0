Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11492C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 11:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB56F40A5F;
	Mon, 19 Feb 2024 11:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWpVT9eDADJU; Mon, 19 Feb 2024 11:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1BEE40A65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1BEE40A65;
	Mon, 19 Feb 2024 11:30:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E0921BF370
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 11:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B5FE406AF
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 11:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3q_y1mQ2xik for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 11:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF0E040607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF0E040607
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF0E040607
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 11:30:31 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C82092C83326;
 Mon, 19 Feb 2024 12:30:28 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 12:30:27 +0100
Message-Id: <20240219113028.607141-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708342229; bh=U3TOKTP0TWv60sE247f2PLvTs+lXjZ7sCi4H9MCfsSI=;
 h=From:To:Cc:Subject:Date;
 b=c9j0+DW6Fq9QEGFFTrfS3ZyaahmlSBWeZ8R2JvqhAWHe1pPh5p90OUmtT60mP/QiK
 gsAKvhFp7Qsub5h8+Z43nNdxqH0CQpNcwntF1IA2MJnCg6oncRI2zMUcrahlkg3huL
 9WnSNU9b0HjyOOs73RLwSVdM+aN4IkFA5OP5rrgYM5JtbKlUPOuCECUiAhHmLX/wd3
 xMTQY4J2E0J8I6kOJPfpb5iwe0rjYIlMjDs5hoBWtL29zRn69URObhvELq7+RAO/nT
 x4zEwcKTDuosA574Ft5I1Oi0OXyqKkWfLCy3SUY4e/2Qn8+wcYN85PLnIVQ1Z7KTZv
 HBCutp7YAIo4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=c9j0+DW6
Subject: [Buildroot] [PATCH] package/python-django: add patch to fix crash
 with .pyc-only builds
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport an upstream patch that fixes django auth and admin apps not
working in .pyc only builds.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6148209453

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 ...d-sensitive_variables-sensitive_post.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/python-django/0001-Fixed-sensitive_variables-sensitive_post.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
