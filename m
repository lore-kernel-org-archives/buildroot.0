Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEFEC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:05:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC9F60F6F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AC9F60F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC38D81911;
	Sat,  9 Oct 2021 12:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A_6CMkFyzLcO; Sat,  9 Oct 2021 12:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D80F81865;
	Sat,  9 Oct 2021 12:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4AFD1BF95F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4358838F7
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCr_2oxnWrdm for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6830838D7
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:03:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 221B193613; Sat,  9 Oct 2021 12:00:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:28:34 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5a6d64f4131eee514a10b3a03c403c9861dfd7ca
X-Git-Newrev: 32e0357d302158bb9e3c657e067aa10e1fa24abe
X-Patchwork-Hint: ignore
Message-Id: <20211009120024.221B193613@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 support/testing/infra/emulator.py: prevent the commands from wrapping
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

commit: https://git.buildroot.net/buildroot/commit/?id=32e0357d302158bb9e3c657e067aa10e1fa24abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Traditional VT-10x terminals (and their emulators) [0] have a "magic
margins" feature that enables the last character position to be updated
without scrolling the screen: whenever a character is printed on the
last column, the cursor stays over the character, instead of moving to
the next line.

The Busybox shell, ash, attempts to defeat this feature by printing
CR,LF right after echoing a character to the last column.[1] This
doesn't play well with emulator.py. The run() method of the Emulator
class captures the output of the emulated system and assumes the first
line it reads is the echo of the command, and all subsequent lines are
the command's output. If the line made by the command + shell prompt is
longer than 80 characters, then it is echoed as two or more lines, and
all but the first one are mistaken for the command's output.

We fix this by telling the emulated system that we are using an
ultra-wide terminal with 29999 columns. Larger values would be ignored
and replaced by the default, namely 80 columns.[2]

[0] https://vt100.net/docs/vt100-ug/chapter3.html  -  DECAWM
[1] https://git.busybox.net/busybox/tree/libbb/lineedit.c?h=1_34_0#n412
[2] https://git.busybox.net/busybox/tree/libbb/xfuncs.c?h=1_34_0#n258

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Co-authored-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit eb3ee3078a76bb86428babb76d30eb6201814ccf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/emulator.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 2412fe1cc9..8dbe813f34 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -101,6 +101,8 @@ class Emulator(object):
         if index != 0:
             raise SystemError("Cannot login")
         self.run("dmesg -n 1")
+        # Prevent the shell from wrapping the commands at 80 columns.
+        self.run("stty columns 29999")
 
     # Run the given 'cmd' with a 'timeout' on the target
     # return a tuple (output, exit_code)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
