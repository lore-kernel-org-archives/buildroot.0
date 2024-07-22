Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF477C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76EEF4007D;
	Mon, 22 Jul 2024 16:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRLEzc0gYnUT; Mon, 22 Jul 2024 16:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E27140192
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E27140192;
	Mon, 22 Jul 2024 16:31:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12A4F1BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F33D040320
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-CkEvoJZU0p for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E874F4023C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E874F4023C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:31:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0C93870D7; Mon, 22 Jul 2024 16:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 18:30:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c4afb415788efdb720b9a084af80b8a6bbfa12c
X-Git-Newrev: a1a2f498d7ecdd643b5c057f1c737e082a105384
X-Patchwork-Hint: ignore
Message-Id: <20240722163113.E0C93870D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: ban textrels on musl
 toolchains
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
Content-Type: multipart/mixed; boundary="===============6388171838314889861=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6388171838314889861==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a1a2f498d7ecdd643b5c057f1c737e082a105384
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl-libc doesn't support TEXTRELs[1] and programs with TEXTRELs will
crash on start-up under musl.

This patch forbids the use of TEXTRELs on musl toolchains with dynamic
linking.

To verify this patch:

- Delete package/micropython/0001-py-nlrthumb-Make-non-Thumb2-long-jump-workaround-opt.patch
- Build micropython (before v1.23) with a musl toolchain and
  BR2_SHARED_LIBS. The build should abort while linking micropython.

[1]: https://www.openwall.com/lists/musl/2020/09/25/4

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 47a89f1ae1..1cedfefa7e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -149,6 +149,15 @@ endif
 
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+# musl's dynamic loader doesn't support DT_TEXTREL, which results in a runtime
+# crash if it gets used. The "-z text" linker option issues a build-time error
+# when DT_TEXREL is used, so we capture the problem earlier.
+#
+# See also: https://www.openwall.com/lists/musl/2020/09/25/4
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_STATIC_LIBS),y:)
+TARGET_LDFLAGS += -Wl,-z,text
+endif
+
 # By design, _FORTIFY_SOURCE requires gcc optimization to be enabled.
 # Therefore, we need to pass _FORTIFY_SOURCE and the optimization level
 # through the same mechanism, i.e currently through CFLAGS. Passing

--===============6388171838314889861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6388171838314889861==--
