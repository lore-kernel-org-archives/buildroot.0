Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BED0D7B9
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 15:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7942E6117E;
	Fri, 11 Oct 2024 15:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qdp98xlHV1zA; Fri, 11 Oct 2024 15:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4B5E6070E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B5E6070E;
	Fri, 11 Oct 2024 15:06:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1141BF41B
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 15:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 469D8840B3
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 15:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2PtpVVsHsbZ for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 15:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E4F840B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47E4F840B9
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 15:06:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D19585D93; Fri, 11 Oct 2024 15:06:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 17:03:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 939e1df1d071f3d2aa8b093c99adae856ee71724
X-Git-Newrev: 4b19a190a2edf52db933aa5250cfa3ff9e0606d4
X-Patchwork-Hint: ignore
Message-Id: <20241011150612.2D19585D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/testing/infra/emulator.py: fix qemu prompt detection
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b19a190a2edf52db933aa5250cfa3ff9e0606d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The qemu.run() method can break when a command happens to output the
string "# " to stdout. This is because qemu.run() detects when a command
has completed by searching for the shell prompt, which by default is
"# ". It then captures everything before the "# " as the commands
output, causing the rest of output to be lost.

Instead use the pexpect libraries REPLWrapper to handle running
commands. It has hooks to set a custom prompt and avoid some other
pitfalls of wrapping a shell.

We unfortunately can't reuse replwrap._repl_sh directly, because it
tries to spawn a command while we already have a qemu started. So we
need to copy that code into _repl_sh_child. While we're at it, also
define our own prompt strings.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[Arnout:
 - Make all arguments to _repl_sh_spawn non-optional.
 - Move non_printable_insert to a local variable instead of an argument,
   we don't need to override it.
 - Copy the comment from _repl_sh that explains why non_printable_insert
   is needed.
 - Add a comment about timeouts.
 - Rename spawn to child (we don't actually spawn anything so this felt
   more natural, even though the class
 - Use single quotes instead of triple quotes, and explicitly escape the
   nested quotes.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

(cherry picked from commit 0cad947b964be5612a182413da136fcf0dc5a1f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/emulator.py | 60 +++++++++++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 12 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 2106d0e99b..4be7e9598b 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,14 +1,46 @@
+import os
+
 import pexpect
+import pexpect.replwrap
 
 import infra
 
-import os
+BR_PROMPT = '[BRTEST# '
+BR_CONTINUATION_PROMPT = '[BRTEST+ '
+
+
+def _repl_sh_child(child, orig_prompt, extra_init_cmd):
+    """Wrap the shell prompt to handle command output
+    Based on pexpect.replwrap._repl_sh() (ISC licensed)
+    https://github.com/pexpect/pexpect/blob/aa989594e1e413f45c18b26ded1783f7d5990fe5/pexpect/replwrap.py#L115
+    """
+
+    # If the user runs 'env', the value of PS1 will be in the output. To avoid
+    # replwrap seeing that as the next prompt, we'll embed the marker characters
+    # for invisible characters in the prompt; these show up when inspecting the
+    # environment variable, but not when bash displays the prompt.
+    non_printable_insert = '\\[\\]'
+    ps1 = BR_PROMPT[:5] + non_printable_insert + BR_PROMPT[5:]
+    ps2 = (BR_CONTINUATION_PROMPT[:5] + non_printable_insert +
+           BR_CONTINUATION_PROMPT[5:])
+    prompt_change = "PS1='{0}' PS2='{1}' PROMPT_COMMAND=''".format(ps1, ps2)
+    # Note: this will run various commands, each with the default timeout defined
+    # when qemu was spawned.
+    return pexpect.replwrap.REPLWrapper(
+            child,
+            orig_prompt,
+            prompt_change,
+            new_prompt=BR_PROMPT,
+            continuation_prompt=BR_CONTINUATION_PROMPT,
+            extra_init_cmd=extra_init_cmd
+        )
 
 
 class Emulator(object):
 
     def __init__(self, builddir, downloaddir, logtofile, timeout_multiplier):
         self.qemu = None
+        self.repl = None
         self.downloaddir = downloaddir
         self.logfile = infra.open_log_file(builddir, "run", logtofile)
         # We use elastic runners on the cloud to runs our tests. Those runners
@@ -104,26 +136,30 @@ class Emulator(object):
         if password:
             self.qemu.expect("Password:")
             self.qemu.sendline(password)
-        index = self.qemu.expect(["# ", pexpect.TIMEOUT])
-        if index != 0:
-            raise SystemError("Cannot login")
-        self.run("dmesg -n 1")
-        # Prevent the shell from wrapping the commands at 80 columns.
-        self.run("stty columns 29999")
+
+        extra_init_cmd = " && ".join([
+            'export PAGER=cat',
+            'dmesg -n 1',
+            # Prevent the shell from wrapping the commands at 80 columns.
+            'stty columns 29999',
+            # Fix the prompt of any subshells that get run
+            'printf "%s\n"  "PS1=\'$PS1\'" "PS2=\'$PS2\'" "PROMPT_COMMAND=\'\'" >>/etc/profile'
+        ])
+        self.repl = _repl_sh_child(self.qemu, '# ', extra_init_cmd)
+        if not self.repl:
+            raise SystemError("Cannot initialize REPL prompt")
 
     # Run the given 'cmd' with a 'timeout' on the target
     # return a tuple (output, exit_code)
     def run(self, cmd, timeout=-1):
-        self.qemu.sendline(cmd)
         if timeout != -1:
             timeout *= self.timeout_multiplier
-        self.qemu.expect("# ", timeout=timeout)
+        output = self.repl.run_command(cmd, timeout=timeout)
         # Remove double carriage return from qemu stdout so str.splitlines()
         # works as expected.
-        output = self.qemu.before.replace("\r\r", "\r").splitlines()[1:]
+        output = output.replace("\r\r", "\r").splitlines()[1:]
 
-        self.qemu.sendline("echo $?")
-        self.qemu.expect("# ")
+        exit_code = self.repl.run_command("echo $?")
         exit_code = self.qemu.before.splitlines()[2]
         exit_code = int(exit_code)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
