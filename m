Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADEAC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:40:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB7916104F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB7916104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF7C40697;
	Wed,  4 Aug 2021 20:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uwo_R50NtcN; Wed,  4 Aug 2021 20:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C8840620;
	Wed,  4 Aug 2021 20:40:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 045E21BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E79B483A9D
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhmyR5O--USu for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:40:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DBC583A0A
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:40:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2B8D98B785; Wed,  4 Aug 2021 20:40:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:40:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03889590606e4a5aa3adf990e5b31c82c49ccf12
X-Git-Newrev: 5227649cb63fb26d62ef17d78a6df69eab9bef18
X-Patchwork-Hint: ignore
Message-Id: <20210804204019.2B8D98B785@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: fix build with
 gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=5227649cb63fb26d62ef17d78a6df69eab9bef18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 11:

/tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/src/hmac.c:211:43: error: argument 2 of type 'uint8_t *' {aka 'unsigned char *'} declared as a pointer [-Werror=array-parameter=]
  211 | int hmacResult(HMACContext *ctx, uint8_t *digest)
      |                                  ~~~~~~~~~^~~~~~
In file included from /tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/src/hmac.c:13:
/tmp/instance-7/output-1/build/azure-iot-sdk-c-LTS_01_2021_Ref01/c-utility/inc/azure_c_shared_utility/sha.h:252:42: note: previously declared as an array 'uint8_t[64]' {aka 'unsigned char[64]'}
  252 | int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize]);
      |                                  ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/11a6eebd0deea679683a93a5c8355d00acdfe51e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...hmac-c-fix-mismatching-function-prototype.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
new file mode 100644
index 0000000000..0c262e6c46
--- /dev/null
+++ b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
@@ -0,0 +1,35 @@
+From 3a7997af72e7a4f70109d1639e6725b39046443e Mon Sep 17 00:00:00 2001
+From: Francesco Giancane <30423178+fgiancane8@users.noreply.github.com>
+Date: Fri, 2 Jul 2021 20:47:38 +0200
+Subject: [PATCH] hmac.c: fix mismatching function prototype (#537)
+
+The reported function raises a warning when compilers assert the flag
+`-Warray-parameter=`, signaling that an array-type argument was promoted
+to a pointer-type argument.
+
+While in practice in most C implementations this is correct, fixing the
+warning (and, in this case, indicating the maximum size for the array)
+would represent a best-practice for finding out-of-bound accesses or
+identifying wrongly-sized arrays passed in the function.
+
+Signed-off-by: Francesco Giancane <francesco.giancane@accenture.com>
+[Retrieved from:
+https://github.com/Azure/azure-c-shared-utility/commit/3a7997af72e7a4f70109d1639e6725b39046443e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/hmac.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hmac.c b/src/hmac.c
+index 53f2411f8..160af9d2f 100644
+--- a/c-utility/src/hmac.c
++++ b/c-utility/src/hmac.c
+@@ -208,7 +208,7 @@ int hmacFinalBits(HMACContext *ctx,
+ *   sha Error Code.
+ *
+ */
+-int hmacResult(HMACContext *ctx, uint8_t *digest)
++int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize])
+ {
+     if (!ctx) return shaNull;
+ 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
