Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00153CA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B61E66065E;
	Thu,  4 Sep 2025 16:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duX9OJK9khJd; Thu,  4 Sep 2025 16:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F89605BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F89605BB;
	Thu,  4 Sep 2025 16:53:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7458EB69
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 592704052A
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muRujj4N03y5 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B1D6404F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B1D6404F9
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BD2C87F81; Thu,  4 Sep 2025 16:53:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:41:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dac94834cc7db00b47576cf44c7841ed12a1d55f
X-Git-Newrev: 681b92664da62f807f836a8c28ecbf54b7ca6818
X-Patchwork-Hint: ignore
Message-Id: <20250904165346.4BD2C87F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestOpenJdk: remove
 stime() function call
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

commit: https://git.buildroot.net/buildroot/commit/?id=681b92664da62f807f836a8c28ecbf54b7ca6818
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
