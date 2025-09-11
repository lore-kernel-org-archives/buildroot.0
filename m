Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61163CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32CE161C84;
	Thu, 11 Sep 2025 18:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KB_yTlv6iJWq; Thu, 11 Sep 2025 18:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 337D361CCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 337D361CCF;
	Thu, 11 Sep 2025 18:55:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 489422735
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42B5F42387
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUKrAQDpAAbR for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7C7423A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F7C7423A1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C1258410B; Thu, 11 Sep 2025 18:54:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 17:42:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: de2bf5404b7bc0417d7983d7e2f817973f941197
X-Git-Newrev: c50e95e02688ee4b75585bbecfbd70987fa8c73d
X-Patchwork-Hint: ignore
Message-Id: <20250911185454.5C1258410B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 TestOpenJdk: remove stime() function call
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

commit: https://git.buildroot.net/buildroot/commit/?id=c50e95e02688ee4b75585bbecfbd70987fa8c73d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

stime() has been deprecated in glibc 2.31 [1] and replaced with
clock_settime(). Let's replace the stime() function call used in
BR2_PACKAGE_OPENJDK_JNI_TEST sources with clock_settime().

Apply the same change as busybox [2]. Make sure that timeToSet
has been zeroed.

With that fixed, the test "Call Native Library to Set System Time"
succeed:

  [BRTEST# java -cp /usr/bin JniTest
  Test: Get JNI Version passed
  Test: Read Native String Constant passed
  Test: Write Java String to Native Library passed
  Test: Write Java Char Array to Native Library passed
  Test: Write String Member to Native Library passed
  Test: Set String Member from Native Library passed
  Test: Execeute Java Function from Native Library passed
  Test: Instantiate Java Class passed
  Test: Call Native Library to Set System Time passed
  [BRTEST# echo $?
  0

The last external toolchain using a glibc 2.30 was the Bootlin
aarch64--glibc--bleeding-edge-2020.02-2, so since then TestOpenJdk
is broken.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774851

[1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00001.html
[2] https://git.busybox.net/busybox/commit/?id=d3539be8f27b8cbfdfee460fe08299158f08bcd9
[3] https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/readmes/aarch64--glibc--bleeding-edge-2020.02-2.txt

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 681b92664da62f807f836a8c28ecbf54b7ca6818)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../package/br2-external/openjdk/package/openjdk-jni-test/native.c  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
index ed87e345af..9e926a27d9 100644
--- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/native.c
@@ -29,8 +29,10 @@ void execute_function(void(*function)(void*), void* context)
 }
 void set_time_in_seconds(int seconds)
 {
-	time_t timeToSet = seconds;
-	stime(&timeToSet);
+	struct timespec timeToSet = { 0, 0 };
+
+	timeToSet.tv_sec = seconds;
+	clock_settime(CLOCK_REALTIME, &timeToSet);
 }
 void write_internal_time_in_seconds()
 {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
