Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FBCC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362F260F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 362F260F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11EB34160C;
	Tue,  3 Aug 2021 22:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zLTiajs8lks; Tue,  3 Aug 2021 22:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E4A041612;
	Tue,  3 Aug 2021 22:55:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29BDE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F37EB4054B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAXTZ9SR5zGZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C0D340488
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B3497843F5; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Jun 2021 12:00:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bedd8420786b184f4aec4433800083a3468cfe1c
X-Git-Newrev: 6b9d2ab4555efd7a2ee04d0437b1308cb5098052
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.B3497843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dc3dd: disable on
 riscv32
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b9d2ab4555efd7a2ee04d0437b1308cb5098052
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable dc3dd on riscv32 because of the size of time_t (riscv32 has
never had a 32-bit time, and has always been 64-bit from the onset):

        In file included from getdate.y:40:
        verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
          132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
              |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        verify.h:138:61: note: in expansion of macro 'verify_true'
          138 | # define verify(R) extern int (* verify_function__ (void)) [verify_true (R)]
              |                                                             ^~~~~~~~~~~
        getdate.y:116:1: note: in expansion of macro 'verify'
          116 | verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
              | ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/267151dec9d2328a5f8c61ddf224219a4f617e5c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dc3dd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
index 0383897cd5..715451beb7 100644
--- a/package/dc3dd/Config.in
+++ b/package/dc3dd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DC3DD
 	bool "dc3dd"
+	depends on !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
@@ -11,5 +12,6 @@ config BR2_PACKAGE_DC3DD
 	  https://sourceforge.net/projects/dc3dd/
 
 comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
+	depends on !BR2_RISCV_32
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_MUSL
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
