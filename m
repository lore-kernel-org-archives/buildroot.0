Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB58CA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 19:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 049A08407F;
	Mon, 25 Aug 2025 19:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RQRBJNsCuSv; Mon, 25 Aug 2025 19:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DAD83FB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DAD83FB7;
	Mon, 25 Aug 2025 19:59:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DDEE5114
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D043F61121
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlHXQL-_Bkrr for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 19:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1909161184
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1909161184
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 19:59:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 124CC87B20; Mon, 25 Aug 2025 19:59:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Aug 2025 21:54:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3a1364f3d58487ea647c0d11b844fcfa221634e
X-Git-Newrev: e77bf9257e67b8b909f7872a80c485801c92b120
X-Patchwork-Hint: ignore
Message-Id: <20250825195955.124CC87B20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aexpect: backport Python
 3.13 port
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

commit: https://git.buildroot.net/buildroot/commit/?id=e77bf9257e67b8b909f7872a80c485801c92b120
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The module pipes is no longer part of the Python standard library. It
was removed in Python 3.13 after being deprecated in Python 3.11. The
last version of Python that provided the pipes module was Python 3.12.

A new 1.8.0 version that include this patch has just been released few
weeks ago [1].

[1] https://github.com/avocado-framework/aexpect/releases/tag/1.8.0

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042294894 (TestPythonPy3Aexpect)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Drop-the-use-of-pipes.patch               | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/package/python-aexpect/0001-Drop-the-use-of-pipes.patch b/package/python-aexpect/0001-Drop-the-use-of-pipes.patch
new file mode 100644
index 0000000000..a952ddc8fb
--- /dev/null
+++ b/package/python-aexpect/0001-Drop-the-use-of-pipes.patch
@@ -0,0 +1,70 @@
+From 3753ad491bf5847a11a7f4baf3ecaa490e0e9111 Mon Sep 17 00:00:00 2001
+From: Xu Han <xuhan@redhat.com>
+Date: Wed, 31 Jan 2024 14:57:37 +0800
+Subject: [PATCH] Drop the use of pipes
+
+`pipes` was deprecated since version 3.11 so let's replace the use
+of that module with the alternatives.
+
+Signed-off-by: Xu Han <xuhan@redhat.com>
+Upstream: https://github.com/avocado-framework/aexpect/commit/f2b888b1bd453a46820d38b62fd2b5db1228e4b7
+[Romain: backport to 1.7.0]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ aexpect/remote.py | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/aexpect/remote.py b/aexpect/remote.py
+index d7e09ec..2bfd92a 100644
+--- a/aexpect/remote.py
++++ b/aexpect/remote.py
+@@ -47,7 +47,7 @@ import logging
+ import time
+ import re
+ import os
+-import pipes
++import shlex
+ 
+ from aexpect.client import Expect
+ from aexpect.client import RemoteSession
+@@ -217,8 +217,8 @@ def quote_path(path):
+     :return: Shell escaped version
+     """
+     if isinstance(path, list):
+-        return ' '.join(map(pipes.quote, path))
+-    return pipes.quote(path)
++        return ' '.join(map(shlex.quote, path))
++    return shlex.quote(path)
+ 
+ 
+ def handle_prompts(session, username, password, prompt=PROMPT_LINUX,
+@@ -621,7 +621,7 @@ def scp_to_remote(host, port, username, password, local_path, remote_path,
+                 r"-o StrictHostKeyChecking=no "
+                 fr"-o PreferredAuthentications=password {limit} "
+                 fr"-P {port} {quote_path(local_path)} {username}@\[{host}\]:"
+-                fr"{pipes.quote(remote_path)}")
++                fr"{shlex.quote(remote_path)}")
+     password_list = [password]
+     return remote_scp(command, password_list,
+                       log_filename, log_function, timeout)
+@@ -664,7 +664,7 @@ def scp_from_remote(host, port, username, password, remote_path, local_path,
+                 r"-o StrictHostKeyChecking=no "
+                 fr"-o PreferredAuthentications=password {limit} "
+                 fr"-P {port} {username}@\[{host}\]:{quote_path(remote_path)} "
+-                fr"{pipes.quote(local_path)}")
++                fr"{shlex.quote(local_path)}")
+     password_list = [password]
+     remote_scp(command, password_list,
+                log_filename, log_function, timeout)
+@@ -717,7 +717,7 @@ def scp_between_remotes(src, dst, port, s_passwd, d_passwd, s_name, d_name,
+                 r"-o StrictHostKeyChecking=no "
+                 fr"-o PreferredAuthentications=password {limit} -P {port}"
+                 fr" {s_name}@\[{src}\]:{quote_path(s_path)} {d_name}@\[{dst}\]"
+-                fr":{pipes.quote(d_path)}")
++                fr":{shlex.quote(d_path)}")
+     password_list = [s_passwd, d_passwd]
+     return remote_scp(command, password_list,
+                       log_filename, log_function, timeout)
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
