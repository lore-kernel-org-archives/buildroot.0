Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E580C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 11:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A56654064E;
	Sun, 14 Jul 2024 11:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6YxvBxA0g4L; Sun, 14 Jul 2024 11:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51FBB4065F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51FBB4065F;
	Sun, 14 Jul 2024 11:20:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8053C1BF954
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E398605F8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 11:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDLB6joDY1Zt for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 11:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5545660598
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5545660598
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 11:20:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CD7E85ECC; Sun, 14 Jul 2024 11:20:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 13:19:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d201f2f5cd0d1e0389430cda78adead37977a6cd
X-Git-Newrev: 0cad947b964be5612a182413da136fcf0dc5a1f2
X-Patchwork-Hint: ignore
Message-Id: <20240714112004.3CD7E85ECC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/emulator.py: fix
 qemu prompt detection
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0cad947b964be5612a182413da136fcf0dc5a1f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/testing/infra/emulator.py | 58 +++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 624740fcb1..71aefacb80 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,12 +1,44 @@
 import pexpect
+import pexpect.replwrap
 
 import infra
 
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
+
 
 class Emulator(object):
 
     def __init__(self, builddir, downloaddir, logtofile, timeout_multiplier):
         self.qemu = None
+        self.repl = None
         self.downloaddir = downloaddir
         self.logfile = infra.open_log_file(builddir, "run", logtofile)
         # We use elastic runners on the cloud to runs our tests. Those runners
@@ -97,26 +129,30 @@ class Emulator(object):
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
