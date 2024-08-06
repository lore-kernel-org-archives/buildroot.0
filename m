Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DDFC3DA64
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 10:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092F840125;
	Tue,  6 Aug 2024 10:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwqjrRsqzQ82; Tue,  6 Aug 2024 10:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDC140386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBDC140386;
	Tue,  6 Aug 2024 10:13:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A86401BF288
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B2624036E
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 10:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbKZ5cr4H6kh for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 10:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5310F40370
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5310F40370
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 10:13:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4879B840BB; Tue,  6 Aug 2024 10:13:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 12:13:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: beb54d8126e7b0fd2e1090061aa96e6487c4b697
X-Git-Newrev: bd035872be9948515ee50ae034bda4a2e044ff22
X-Patchwork-Hint: ignore
Message-Id: <20240806101328.4879B840BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Makefile.in: Use "-z text" instead
 of "-Wl, -z, text"
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
Content-Type: multipart/mixed; boundary="===============8922717961629731104=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8922717961629731104==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bd035872be9948515ee50ae034bda4a2e044ff22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the recent addition to -Wl,-z,text to TARGET_LDFLAGS in case of
musl-libc and dynamic linking, it was found that some packages pass
TARGET_LDFLAGS directly to ld, but the -Wl syntax only works with
compiler drivers (gcc/clang). This commit changes the flag to -z text,
which the gcc and clang also understand and pass to the linker.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 1cedfefa7e..43a5c279c0 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -154,8 +154,13 @@ TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 # when DT_TEXREL is used, so we capture the problem earlier.
 #
 # See also: https://www.openwall.com/lists/musl/2020/09/25/4
+#
+# NOTE: We're using "-z text" instead of "-Wl,-z,text" here, because some
+# packages pass TARGET_LDFLAGS directly to ld rather than gcc, and ld doesn't
+# support -Wl,[...]. -z is supported by both gcc and clang, so it probably
+# won't cause us problems.
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_STATIC_LIBS),y:)
-TARGET_LDFLAGS += -Wl,-z,text
+TARGET_LDFLAGS += -z text
 endif
 
 # By design, _FORTIFY_SOURCE requires gcc optimization to be enabled.

--===============8922717961629731104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8922717961629731104==--
