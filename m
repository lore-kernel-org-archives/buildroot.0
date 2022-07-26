Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F95C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0C5760671;
	Tue, 26 Jul 2022 21:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0C5760671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Os9I-WJgc3v0; Tue, 26 Jul 2022 21:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7689607CE;
	Tue, 26 Jul 2022 21:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7689607CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AF551BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5459B605A6
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5459B605A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A--BPyExFjM9 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8889960671
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8889960671
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E63B086398; Tue, 26 Jul 2022 21:36:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 23:47:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9267b0f14d3d5f4715bad444f44eae47d9d5627c
X-Git-Newrev: 359a2f8efd7835ed1b7cc2d580a4e41926fd7e03
X-Patchwork-Hint: ignore
Message-Id: <20220726213606.E63B086398@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: disable cmocka
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

commit: https://git.buildroot.net/buildroot/commit/?id=359a2f8efd7835ed1b7cc2d580a4e41926fd7e03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable cmocka (enabled by default) to avoid the following uclibc build
failure raised since the addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a:

In file included from p11test_common.h:30,
                 from p11test_helpers.h:25,
                 from p11test.c:24:
/home/giuliobenetti/autobuild/run/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/cmocka.h:2334:47: error: unknown type name 'va_list'
 2334 | void vprint_message(const char* const format, va_list args) CMOCKA_PRINTF_ATTRIBUTE(1, 0);
      |                                               ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/19d1171a76cd4789472b16aa24b44f58cd7e0a1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opensc/opensc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index e1ad5d61b0..f9e2f5083e 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -11,6 +11,6 @@ OPENSC_LICENSE_FILES = COPYING
 OPENSC_CPE_ID_VENDOR = opensc_project
 OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
-OPENSC_CONF_OPTS = --disable-strict
+OPENSC_CONF_OPTS = --disable-cmocka --disable-strict
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
