Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A04105F7B0
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34B7A60F79;
	Sat, 14 Mar 2026 07:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-lmag8-fq64; Sat, 14 Mar 2026 07:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D77D160F98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474600;
	bh=1emKK5AqtDHweb3kSV1LeNES4fGgB/koXSnI2khpweA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hGTLUhqKY81Q+PPBoq80zzHWVVHmdumn5xf5rpm270J6LLfXNUqSVDRfIZaJtFm6+
	 zT8P7DhgZUcSfdl8Ntg2GaQIb0hDzSa50sQMVgL7jFNfa5K+CrHcpRS0Yj4MmBffDr
	 IjuCkBPl2NaUX8orpPi2BMgJz9HIA8lFy1y3p5MTa1Wwo7/fExwIx6PNNrtWDDlD5a
	 JFdGJLkbSQb7LgVT43AGegkvWk81Xp1lMewhydykneHv+J1/VvsIHrhye3RZz/MIHZ
	 iHKHszalsmaoyrS7FEXKZHnLbypx5b48yEv3Pb4gR5hRcRMsxmbC/n0xBylMr5DVDD
	 ZBCU50V4PsmAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77D160F98;
	Sat, 14 Mar 2026 07:49:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6AE1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB65260EF6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qps0z48hgsSV for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13DD460EF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13DD460EF9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48F3983D2D; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:22:02 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d8dc0417959286d855d7205d25c6862e75842b67
X-Git-Newrev: a6a9c1930e2514faabddd01cc8ebe449a5ca66e2
X-Patchwork-Hint: ignore
Message-Id: <20260314074936.48F3983D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/jasper: fix build
 without threads
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6a9c1930e2514faabddd01cc8ebe449a5ca66e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 03a1732dea67e088ec85f92853ca14f5a3c0f7b7 bumped the
package from 2.0.33 to 4.2.8. This bump includes upstream commit
https://github.com/jasper-software/jasper/commit/91fca092098396938830fe458f57109f0dd58a54
which was added to version 3.0.0 and causes build errors when threads
are not available:

    message(FATAL_ERROR "Threading support is not available.")

because JAS_ENABLE_MULTITHREADING_SUPPORT defaults to ON:
https://github.com/jasper-software/jasper/blob/version-4.2.8/CMakeLists.txt#L124

Add configure options to disable thread support when needed.

Fixes:
https://autobuild.buildroot.net/results/870/870d6adbac166b22cce217628d477b1bce538320/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d32b12b54833a237096fce58739044b8e5ef23bf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/jasper.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 88633c9661..9ed54989e2 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -32,6 +32,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=ON
+else
+JASPER_CONF_OPTS += -DJAS_ENABLE_MULTITHREADING_SUPPORT=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_LIBJPEG=ON
 JASPER_DEPENDENCIES += jpeg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
