Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04EEC04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4F9A61063;
	Tue,  1 Aug 2023 21:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4F9A61063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTN75PYg7tka; Tue,  1 Aug 2023 21:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C0E60DFC;
	Tue,  1 Aug 2023 21:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C0E60DFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 133C21BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0CD1404D8
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0CD1404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bblaXIfj-zZv for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:15:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0078840374
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0078840374
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E25AD84016; Tue,  1 Aug 2023 21:15:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:15:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1391c99d627d27c55bec99072b3ae4d78be02c74
X-Git-Newrev: c0dcefa7ba983b313070d1f61b5603113b4f6762
X-Patchwork-Hint: ignore
Message-Id: <20230801211530.E25AD84016@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestNoTimezone: fix the
 test case for Glibc
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0dcefa7ba983b313070d1f61b5603113b4f6762
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have changed to a Glibc based toolchain recently [1] but the
behavior of TZ handling is not the same between libc implementation
when no Zone Database is installed.

musl and uClibc-ng return "UTC" when the data file of the requested
time zone is missing or when TZ is not set.

 # TZ=America/Los_Angeles date +%Z
 UTC

 # TZ= date +%Z
 UTC

Glibc return all or part of TZ content or "Universal" if TZ is empty.

 # TZ=America/Los_Angeles date +%Z
 America

 # TZ= date +%Z
 Universal

As demonstrated by TestAllTimezone, Glibc return "PDT" when the
America/Los_Angeles time zone data file is installed:

 # TZ=America/Los_Angeles date +%Z
 PDT

Since the Glibc behavior seems weird (not a bug [2]) when TZ is
set but the time zone data file is missing, update our test
to check against a string defined in the Glibc code [3].

[1] f89f52168fcb667a3e8e43f6f44d5b1ca3961a8c
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=30710
[3] https://sourceware.org/git/?p=glibc.git;a=blob;f=time/tzset.c;h=78c18f8147415c92dc6eb735be672fa7e0b8f76e;hb=47b76f6d1d3a5ad13e585dbcc616aaea62b8bb20#l380

Ref:
https://www.gnu.org/software/libc/manual/html_node/TZ-Variable.html

Fixe:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561117

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/core/test_timezone.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index 0e5009494d..bf4a47fcde 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -22,8 +22,11 @@ class TestNoTimezone(infra.basetest.BRTest):
         boot_armv5_cpio(self.emulator, self.builddir)
         tz, _ = self.emulator.run("TZ=UTC date +%Z")
         self.assertEqual(tz[0].strip(), "UTC")
-        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
-        self.assertEqual(tz[0].strip(), "UTC")
+        # This test is Glibc specific since there is no Time Zone Database installed
+        # and other C libraries use their own rule for returning time zone name or
+        # abbreviation when TZ is empty or set with a not installed time zone data file.
+        tz, _ = self.emulator.run("TZ= date +%Z")
+        self.assertEqual(tz[0].strip(), "Universal")
 
 
 class TestAllTimezone(infra.basetest.BRTest):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
