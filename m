Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E32C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 09:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CF4281EA9;
	Wed, 15 Feb 2023 09:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CF4281EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsluhhS3sndj; Wed, 15 Feb 2023 09:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E34B81EE6;
	Wed, 15 Feb 2023 09:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E34B81EE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0385B1BF255
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD89281291
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 09:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD89281291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCWf7HlrKK4V for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 09:24:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D159817BD
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 09:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D159817BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AFB3855A5; Wed, 15 Feb 2023 09:24:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 10:23:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d649bcd3805a26cedb30120ebbdcf12f8fbf449f
X-Git-Newrev: 5cbb458bd44778376ccdd5ffccc3e5fc5492766a
X-Patchwork-Hint: ignore
Message-Id: <20230215092414.0AFB3855A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: fix builds on s390x
 architectures
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cbb458bd44778376ccdd5ffccc3e5fc5492766a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/856fd250f75a696694c70e3208ffcef7470a7082
 - http://autobuild.buildroot.net/results/dceb413fb5d459338417d8dd5a42d95aa23e849b

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/fluent-bit.mk | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 4ecf813511..d618fdf1e2 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -12,6 +12,9 @@ FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
+FLUENT_BIT_CFLAGS = $(TARGET_CFLAGS)
+FLUENT_BIT_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
 	-DFLB_RELEASE=Yes \
@@ -42,12 +45,16 @@ FLUENT_BIT_CONF_OPTS += \
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"
 
+# Fix multiple definition of `mk_tls_*'.
+# https://github.com/fluent/fluent-bit/issues/5537
+FLUENT_BIT_CFLAGS += -fcommon
+FLUENT_BIT_CXXFLAGS += -fcommon
+
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
-# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information.
-FLUENT_BIT_CONF_OPTS += \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
+# https://bugzilla.redhat.com/show_bug.cgi?id=574992
+FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
+FLUENT_BIT_CXXFLAGS += -U_FILE_OFFSET_BITS
 
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 FLUENT_BIT_DEPENDENCIES += musl-fts
@@ -60,7 +67,9 @@ FLUENT_BIT_LDFLAGS += -latomic
 endif
 
 FLUENT_BIT_CONF_OPTS += \
-	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)"
+	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)" \
+	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)" \
+	-DCMAKE_CXX_FLAGS="$(FLUENT_BIT_CXXFLAGS)"
 
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
