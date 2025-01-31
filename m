Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F97C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 18:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3965B4274F;
	Fri, 31 Jan 2025 18:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAejXLIVOa5K; Fri, 31 Jan 2025 18:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E26124269C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E26124269C;
	Fri, 31 Jan 2025 18:40:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EE3E17D
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3029541000
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZK7gNchVRlv for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 18:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA82540F50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA82540F50
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:40:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4D7B85F84; Fri, 31 Jan 2025 18:40:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 Jan 2025 17:46:34 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ae0ec1dacb287f85ce91a13ece6c216e25fcc9f0
X-Git-Newrev: f022e05a26ad0b484a900e85f2ea5079596e6864
X-Patchwork-Hint: ignore
Message-Id: <20250131184013.E4D7B85F84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing/utils:
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

commit: https://git.buildroot.net/buildroot/commit/?id=f022e05a26ad0b484a900e85f2ea5079596e6864
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
