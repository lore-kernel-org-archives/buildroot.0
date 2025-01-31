Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0A2C02193
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 18:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D949360B50;
	Fri, 31 Jan 2025 18:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uwUCauwMQgzg; Fri, 31 Jan 2025 18:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC67060C30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC67060C30;
	Fri, 31 Jan 2025 18:39:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2147517E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 678CC4265F
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJ-phpQLi45Z for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22D074269C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22D074269C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F975866E3; Fri, 31 Jan 2025 18:38:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 Jan 2025 17:46:11 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 279673a33780296a72ade3655ae9e07af8cf8c78
X-Git-Newrev: bc7e3a7abbbd108e67d5071656b9a8552309ff26
X-Patchwork-Hint: ignore
Message-Id: <20250131183857.0F975866E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] support/testing/utils:
 fix get-developers test without a tty
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc7e3a7abbbd108e67d5071656b9a8552309ff26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

get-developers will check its stdin to decide whether it is a tty or
not, and behave differently whether it is or not. So, when we run the
tests, we need an actual tty.

However, when running in a CI pipeline, like on Gitlab-CI, there is no
tty available on stdin.

Fake one. We don't need anything too fancy, so just a slave pty will
suffice.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/8830671800
Fixes: d10d22221f93 (utils/get-developers: read patch from stdin when
it's not a tty)

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3778f704cde6b2b7ac7a10f9d21e1114ba2c2a9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/utils/test_get_developers.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/utils/test_get_developers.py b/support/testing/tests/utils/test_get_developers.py
index 3ec4edeadd..701c3acb1a 100644
--- a/support/testing/tests/utils/test_get_developers.py
+++ b/support/testing/tests/utils/test_get_developers.py
@@ -15,10 +15,16 @@ import infra
 
 def call_script(args, env, cwd):
     """Call a script and return stdout and stderr as lists and the exit code."""
-    proc = subprocess.Popen(args, cwd=cwd, stdout=subprocess.PIPE,
+    # We need stdin to be a tty, not just a pipe or whatever
+    m_tty, s_tty = os.openpty()
+    proc = subprocess.Popen(args, cwd=cwd,
+                            stdin=s_tty,
+                            stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE, env=env,
                             universal_newlines=True)
     out, err = proc.communicate()
+    os.close(s_tty)
+    os.close(m_tty)
     return out.splitlines(), err.splitlines(), proc.returncode
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
