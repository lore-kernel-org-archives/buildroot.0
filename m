Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C71C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83BDF847AE;
	Fri, 12 Jul 2024 19:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bjHduJ5AqvrL; Fri, 12 Jul 2024 19:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BF02847A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BF02847A9;
	Fri, 12 Jul 2024 19:31:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD3601BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B86A0419C0
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ax5FbJ3c9IjT for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DF5CA419BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF5CA419BE
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF5CA419BE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:31:09 +0000 (UTC)
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 46CI10kW014429; Fri, 12 Jul 2024 19:31:07 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 40b5dybrf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2024 19:31:07 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 46CJV59o022002
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2024 19:31:06 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46CJV5O4021512
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 12 Jul 2024 19:31:05 GMT
X-Received: from localhost (unknown [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 921833000286;
 Fri, 12 Jul 2024 14:31:05 -0500 (CDT)
Date: Fri, 12 Jul 2024 19:31:04 +0000
MIME-Version: 1.0
Message-Id: <20240712-pytest-qemu-prompt-detection-v2-1-273b85382796@collins.com>
X-B4-Tracking: v=1; b=H4sIAHiEkWYC/0XMTQ7CIBBA4as0rJ2mDC1NXXkP44LC1JKUHwGNp
 undJW5cfov3dpYpWcrs3Ows0ctmG3wFnhqmV+XvBNZUM+yw70aOED+FcoEHuSfEFFwsYKiQLjU
 E0S+CjBDj3E2sLmKixb5/++uteqkBlDWR+k8HRD70ksuWoxxGOQGHOSlvgm+dspQuOmyb9bnVw
 bHj+AJSw0UjswAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.14.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407120131
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407120131
X-Proofpoint-GUID: peGIQdsqDy3nuYB85h3kKPcfyE2IOK8-
X-Proofpoint-ORIG-GUID: peGIQdsqDy3nuYB85h3kKPcfyE2IOK8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407120131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=QhWitnhyjVkbNpY2LVD4BZId3P8jb2PuONHBpAbeqNk=;
 b=shx68IFYeLelfmtxNI0GsoQ2Nf8cTnXUD15qk4U9J8igqCTo3UiTJprc5bX1E/25cc6/
 a7cXIGUaXzD7NwaCllbvJBeAqqZ7tf9ugIFTa4RvSrXmRrebdvQB/VOPPtOXGnCrO0Q5
 /Qy5R9KcCc6wQHMVs9pNnnneas5nDHIIFnc6ymAKsYquUyZYbLu1fE7J85S7vYEdPJf4
 jMl76rxDSy+Ey7d85YGY/wEWRdipgqOvMi0+QjplQSISkXrqiiIkc078yB6CNmpNs91+
 e5C8D7v2anl7MwCh8qIjeHozt+w1ub+a+1qXnp3OeR1crLS7A3g4KX6PtW5yvhOOr9U1 2A== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=shx68IFY
Subject: [Buildroot] [PATCH v2] support/testing/infra/emulator.py: fix qemu
 prompt detection
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Julien Olivain <ju.o@free.fr>, Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Brandon Maier via buildroot <buildroot@buildroot.org>

The qemu.run() method can break when a command happens to output the
string "# " to stdout. This is because qemu.run() detects when a command
has completed by searching for the shell prompt, which by default is
"# ". It then captures everything before the "# " as the commands
output, causing the rest of output to be lost.

Instead use the pexpect libraries REPLWrapper to handle running
commands. It has hooks to set a custom prompt and avoid some other
pitfalls of wrapping a shell.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
I tested this against a couple tests and test_bash.py which Yann noticed
is special in Julian patch series. I am running a full test run but
that will take awhile, so sending this in the meantime for review.

Changes in v2:
- Rewrite to use pexpect REPLWrapper (Arnout)
- Link to v1: https://patchwork.ozlabs.org/project/buildroot/patch/20240522154616.1265769-1-brandon.maier@collins.com/
- Link to Julian Olivain version: https://patchwork.ozlabs.org/project/buildroot/patch/20230611104518.337528-1-ju.o@free.fr/
---
 support/testing/infra/emulator.py | 56 +++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 624740fcb1..c586603787 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,12 +1,38 @@
 import pexpect
+import pexpect.replwrap
 
 import infra
 
+BR_PROMPT = '[BRTEST# '
+BR_CONTINUATION_PROMPT = '[BRTEST+ '
+
+
+def _repl_sh_spawn(spawn, orig_prompt, non_printable_insert='\\[\\]',
+                   extra_init_cmd="export PAGER=cat"):
+    """Wrap the shell prompt to handle command output
+    Based on pexpect.replwrap.bash()
+    https://github.com/pexpect/pexpect/blob/aa989594e1e413f45c18b26ded1783f7d5990fe5/pexpect/replwrap.py#L115
+    """
+
+    ps1 = BR_PROMPT[:5] + non_printable_insert + BR_PROMPT[5:]
+    ps2 = (BR_CONTINUATION_PROMPT[:5] + non_printable_insert +
+           BR_CONTINUATION_PROMPT[5:])
+    prompt_change = "PS1='{0}' PS2='{1}' PROMPT_COMMAND=''".format(ps1, ps2)
+    return pexpect.replwrap.REPLWrapper(
+            spawn,
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
@@ -97,26 +123,34 @@ class Emulator(object):
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
+            '''printf "%s\n"  "PS1='$PS1'" "PS2='$PS2'" "PROMPT_COMMAND=''" >>/etc/profile'''
+        ])
+        self.repl = _repl_sh_spawn(
+                self.qemu,
+                '# ',
+                non_printable_insert='\\[\\]',
+                extra_init_cmd=extra_init_cmd)
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
 

---
base-commit: 5543661bc0c1ebcd01e5e6bf5ac565fd0f1ac8d8
change-id: 20240712-pytest-qemu-prompt-detection-34f3ed337b09

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
