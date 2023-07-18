Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C68EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC4C560D80;
	Tue, 18 Jul 2023 21:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC4C560D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZ0IEihqwTsI; Tue, 18 Jul 2023 21:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EEDF60B4C;
	Tue, 18 Jul 2023 21:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EEDF60B4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF331BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0846A4148F
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0846A4148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z2ifpOodfVEG for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3166440280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3166440280
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CAE187415; Tue, 18 Jul 2023 21:04:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:03:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed20a4eccd7dd665cb7997537f170391b417c5e7
X-Git-Newrev: 873306199e55a9cfd5bd64c8ad9b526cf25a1466
X-Patchwork-Hint: ignore
Message-Id: <20230718210433.1CAE187415@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/run-tests: add a mode to
 only download emulator builtin binaries
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=873306199e55a9cfd5bd64c8ad9b526cf25a1466
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, emulator builtin binaries are downloaded after the rootfs
build by each tests running the emulator (Qemu) on armv5 or armv7.

Due to download quota on the server hosting theses binaries [1]
some GitLab jobs are failing due to "Connection reset by peer" [2]:

  ConnectionResetError: [Errno 104] Connection reset by peer

In a follow up commit, we'll add the possibility to download only once
all emulator builtin binaries to pass them as build artifacts.

As such, we will need to make sure that run-tests only download theses
binaries, and that it does not run the testsuite.

Add such a mode, with a new option, --prepare-only.

[1] http://autobuild.buildroot.net/artefacts
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/4409032417

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/run-tests | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index bf40019362..e8c540f370 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -8,6 +8,8 @@ import nose2
 
 from infra.basetest import BRConfigTest
 
+import infra
+
 
 def main():
     parser = argparse.ArgumentParser(description='Run Buildroot tests')
@@ -23,6 +25,8 @@ def main():
                         help='output directory')
     parser.add_argument('-d', '--download',
                         help='download directory')
+    parser.add_argument('-p', '--prepare-only', action='store_true',
+                        help='download emulator builtin binaries')
     parser.add_argument('-k', '--keep',
                         help='keep build directories',
                         action='store_true')
@@ -60,6 +64,16 @@ def main():
 
     BRConfigTest.downloaddir = os.path.abspath(args.download)
 
+    if args.prepare_only:
+        emulator_builtin_binaries = ["kernel-vexpress-5.10.7",
+                                     "vexpress-v2p-ca9-5.10.7.dtb",
+                                     "kernel-versatile-5.10.7",
+                                     "versatile-pb-5.10.7.dtb"]
+        print("Downloading emulator builtin binaries")
+        for binary in emulator_builtin_binaries:
+            infra.download(BRConfigTest.downloaddir, binary)
+        return 0
+
     if args.output is None:
         print("Missing output directory, please use -o/--output")
         print("")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
