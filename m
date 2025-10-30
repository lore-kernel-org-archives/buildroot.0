Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FB6CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEFB341100;
	Thu, 30 Oct 2025 21:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDqU919KDJLm; Thu, 30 Oct 2025 21:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBF4841139
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBF4841139;
	Thu, 30 Oct 2025 21:02:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DB79CD
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BCE76154D
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89mUVmwgmK3x for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A887361506
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A887361506
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 978C38292F; Thu, 30 Oct 2025 21:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:10:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8913d7c810169522e5f783f634b91a4130e386d3
X-Git-Newrev: 01dc13adfb7486cb05e655d0b58f5490a0d046ea
X-Patchwork-Hint: ignore
Message-Id: <20251030210242.978C38292F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra: improve
 run_cmd_on_host() to show stdout/stderr
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

commit: https://git.buildroot.net/buildroot/commit/?id=01dc13adfb7486cb05e655d0b58f5490a0d046ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When run_cmd_on_host() runs a command that fails, we only get an
exception with no details to debug what happened. Let's improve that
by catching the exception, and printing the command output. This
requires redirecting stderr to stdout (instead of /dev/null) and
asking to get the output in text format.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
