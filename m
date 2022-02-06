Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25793C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 15:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD28560B12;
	Sun,  6 Feb 2022 15:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rTooJ3I3QXzU; Sun,  6 Feb 2022 15:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D69460B89;
	Sun,  6 Feb 2022 15:21:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 262BC1BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 213B7401AD
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 15:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYCM-0jjpB2L for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 15:21:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A53C400C1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 15:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9462782A9A; Sun,  6 Feb 2022 15:14:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 16:20:06 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 95f5dcef1ba2c05a5ef23f619dac24c067148624
X-Git-Newrev: 08e8792c50685c1a8c2be7609943990f6083f714
X-Patchwork-Hint: ignore
Message-Id: <20220206151401.9462782A9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/apitrace: fix
 build failure on m68k architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=08e8792c50685c1a8c2be7609943990f6083f714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

apitrace uses very big switch statements, which causes the build to fail
on m68k, because the offsets there are only 16-bit.

We fix that by using -mlong-jump-table-offsets on m68k, to use 32-bit
offsets for switch statements. That flag is available on gcc version >= 7
but apitrace package already depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7, so
we can use it with no problem.

Fixes:
http://autobuild.buildroot.net/results/7306bf05962fec30fbe98b1eb8ee09b3162b8080/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fdee6c9f3987189eb743f54be2e545ce84d4d3bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apitrace/apitrace.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index 3656a5722b..c47562233b 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -38,6 +38,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 APITRACE_CXXFLAGS += -O0
 endif
 
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+APITRACE_CXXFLAGS += -mlong-jump-table-offsets
+endif
+
 APITRACE_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(APITRACE_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(APITRACE_CXXFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
