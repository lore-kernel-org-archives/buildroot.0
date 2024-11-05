Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4829D3E77A
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 22:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978A080E95;
	Tue,  5 Nov 2024 22:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvGVfdIFhX1v; Tue,  5 Nov 2024 22:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B8C80E96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0B8C80E96;
	Tue,  5 Nov 2024 22:32:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F0EE3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87059400F8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzIJ0_Vono6a for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 22:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83DF8400EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83DF8400EF
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:32:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6745185D63; Tue,  5 Nov 2024 22:32:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 5 Nov 2024 23:30:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8ea5a1ece6d482d84ec59502bad5ada136e484f
X-Git-Newrev: 4131c0b17e56bc33399ddc6005ac7c13fb577648
X-Patchwork-Hint: ignore
Message-Id: <20241105223208.6745185D63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: fix build due to missing
 macro definition
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4131c0b17e56bc33399ddc6005ac7c13fb577648
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 967ba5386 "package/libspdm: bump version to 3.5.0" [1]
incorrectly removed the "0" to the LIBSPDM_ENABLE_CAPABILITY_MEL_CAP
macro definition.

This results to libspdm build failure with errors like:

    In file included from /build/libspdm-3.5.0/include/internal/libspdm_common_lib.h:20,
                     from /build/libspdm-3.5.0/library/spdm_common_lib/libspdm_com_context_data.c:7:
    /build/libspdm-3.5.0/include/hal/library/responder/measlib.h:154:38: error: #if with no expression
      154 | #if LIBSPDM_ENABLE_CAPABILITY_MEL_CAP
          |                                      ^

This commit fixes the issue by adding back this missing "0".

Fixes:
https://autobuild.buildroot.org/results/88cb77a2e6b46028f9fb7f0325348a1b1b8fd931

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/967ba5386d4e15102db88a9faae1845b3e69dc6f

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libspdm/libspdm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 081bffb9c1..03ac9a70f8 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -20,7 +20,7 @@ LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
 LIBSPDM_CFLAGS = \
 	$(TARGET_CFLAGS) \
 	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
-	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP= \
+	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
