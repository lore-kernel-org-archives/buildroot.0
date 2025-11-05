Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654BDCEBF92
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B79F61411;
	Mon, 17 Nov 2025 19:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQF2q8IuHHBt; Mon, 17 Nov 2025 19:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 614AA61008
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 614AA61008;
	Mon, 17 Nov 2025 19:51:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06A701BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 086EB60C34
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Asl-mVe1OcR6 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4415160F6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4415160F6F
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 412D2848E6; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:48:51 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 838a4e34f0a082e2a0d9ef01b9e139c1a380f1c2
X-Git-Newrev: cd4e06c31aa22e717e69d6e442cfd7d7e9deaaa5
X-Patchwork-Hint: ignore
Message-Id: <20251117195126.412D2848E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing/infra:
 improve run_cmd_on_host() to show stdout/stderr
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd4e06c31aa22e717e69d6e442cfd7d7e9deaaa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When run_cmd_on_host() runs a command that fails, we only get an
exception with no details to debug what happened. Let's improve that
by catching the exception, and printing the command output. This
requires redirecting stderr to stdout (instead of /dev/null) and
asking to get the output in text format.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 01dc13adfb7486cb05e655d0b58f5490a0d046ea)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/infra/__init__.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 1f003f24c6..52308395a3 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -59,11 +59,20 @@ def download(dldir, filename):
 
 def run_cmd_on_host(builddir, cmd):
     """Call subprocess.check_output and return the text output."""
-    out = subprocess.check_output(cmd,
-                                  stderr=open(os.devnull, "w"),
-                                  cwd=builddir,
-                                  env={"LANG": "C"},
-                                  universal_newlines=True)
+    try:
+        out = subprocess.check_output(cmd,
+                                      cwd=builddir,
+                                      env={"LANG": "C"},
+                                      stderr=subprocess.STDOUT,
+                                      text=True,
+                                      universal_newlines=True)
+    except subprocess.CalledProcessError as e:
+        print(f"Command failed with return code {e.returncode}")
+        print("=== STDOUT/STDERR ===")
+        print(e.output)
+        print("=====================")
+        raise
+
     return out
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
