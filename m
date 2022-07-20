Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266F2C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF68E83396;
	Wed, 20 Jul 2022 16:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF68E83396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAjBkyxVQIHS; Wed, 20 Jul 2022 16:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE44982EF1;
	Wed, 20 Jul 2022 16:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE44982EF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F221BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E78882EF1
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E78882EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kP_sPZFB2k9b for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:27:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FFE982E14
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FFE982E14
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 00BE083FFA; Wed, 20 Jul 2022 16:14:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 18:26:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4245a28f0e63de48be7a198fa3ec2d53f1f0607f
X-Git-Newrev: c70601762104d6d2beba51bc5804fcd204bd6bd3
X-Patchwork-Hint: ignore
Message-Id: <20220720161422.00BE083FFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c70601762104d6d2beba51bc5804fcd204bd6bd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure:

/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: ./.libs/libbayer2rgb3.so: undefined reference to `__bayer2rgb_missing_convert_dumb_implementation'

Fixes:
 - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-src-convert.c-remove-have_cplusplus.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch b/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch
new file mode 100644
index 0000000000..71a6291a3c
--- /dev/null
+++ b/package/bayer2rgb-neon/0001-src-convert.c-remove-have_cplusplus.patch
@@ -0,0 +1,56 @@
+From ca68dadf585aadb8adf582cd94f8fcdd4592e09f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Jun 2022 10:31:49 +0200
+Subject: [PATCH] src/convert.c: remove have_cplusplus
+
+Remove have_cplusplus function for simplicity and to avoid the following
+build failure:
+
+/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/aarch64-buildroot-linux-uclibc/10.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld: ./.libs/libbayer2rgb3.so: undefined reference to `__bayer2rgb_missing_convert_dumb_implementation'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/69a637b7f1422ce2bf04dda573abb09388b9a02d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/convert.c | 19 +++++--------------
+ 1 file changed, 5 insertions(+), 14 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index c852a14..83d631d 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -27,25 +27,16 @@ static bool have_neon()
+ #endif
+ }
+ 
+-static bool have_cplusplus()
+-{
+-#ifdef HAVE_CPLUSPLUS
+-	return true;
+-#else
+-	return false;
+-#endif
+-}
+-
+ void bayer2rgb_convert_dumb(struct image_in const *input,
+ 			    struct image_out const *output,
+ 			    struct image_conversion_info *info)
+ {
++#ifdef HAVE_CPLUSPLUS
++	return bayer2rgb_convert_cc(input, output, info);
++#else
+ 	extern void __bayer2rgb_missing_convert_dumb_implementation();
+-
+-	if (have_cplusplus())
+-		return bayer2rgb_convert_cc(input, output, info);
+-	else
+-		__bayer2rgb_missing_convert_dumb_implementation();
++	__bayer2rgb_missing_convert_dumb_implementation();
++#endif
+ }
+ 
+ void bayer2rgb_convert(struct image_in const *input,
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
