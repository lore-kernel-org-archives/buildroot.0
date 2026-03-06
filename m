Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65798FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E24DC41E45;
	Fri,  6 Mar 2026 19:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQpomf731WOy; Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8730441E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826652;
	bh=lR/f+Cm4wOPEoeknnq90EZfEvEQ7aNS+s1A/8AXK/Yo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IgWpmU1fOYE2d0OFjGl8GupQY4lS2fog4ZrkYC/7ROj8PFQ8t/74TrxXlQBMmyaDi
	 3CRbm8VJhxwLGnvOvhkJ8r7DhA5iYScA/yp9fFL3cMD2e9xjExAo8tEmQK+Z3QNXMt
	 5oXAk/4GNTLED2o7s/3rgiLrB7YPqfZuIJ7Flqoa8S0vFdik/Ky6I2UPoK6hO+rFm7
	 CEnZyPN49J6TSt/ABnZ7MfFJ1SdK8fAhOB2NfiKxEsQ5LpkNOfPqyiqb+XKQJGdxtE
	 QxrppVqfUiQQCqV+oy2eZ1T+GLRRl3HEbKdcgR4Q/SYk8OOkVmu86sMc/NgMyOSfDb
	 k3qcUD1vxNtOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8730441E3A;
	Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F8ED223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2162741E3B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qJ88bqWyMk8 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D0241DD2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6D0241DD2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0418686834; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 13:39:08 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 968a0ca9a41960d62108269a8bc74f6975b3fe1e
X-Git-Newrev: ab48cc2f36464c52cf5dd722c671a351575fcab5
X-Patchwork-Hint: ignore
Message-Id: <20260306195050.0418686834@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/snort: Fix build
 with gcc-15.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab48cc2f36464c52cf5dd722c671a351575fcab5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Fixes:
https://autobuild.buildroot.net/results/3b9/3b92d275a32721bd2cbb10e15c392054dfd42c63/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 421b5545f8110faf2de9b2165956d9d897f483fe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/snort/0009-gcc-15-fix.patch | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/snort/0009-gcc-15-fix.patch b/package/snort/0009-gcc-15-fix.patch
new file mode 100644
index 0000000000..227ad5ffc5
--- /dev/null
+++ b/package/snort/0009-gcc-15-fix.patch
@@ -0,0 +1,36 @@
+Fix build with gcc-15.x
+
+Adapted from: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_2_8_snort/112466576
+
+Upstream-Status: Backport [resolved in snort3 https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/net-analyzer/snort/files/snort-2.9.20-gcc-15-fix.patch?id=410cb3ac09ab3d55e96876634c4d58005d9ead89
+
+Upstream: https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
++++ b/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
+@@ -160,7 +160,7 @@ static void DCE2_ReloadSwapFree(void *);
+ static void DCE2_AddPortsToPaf(struct _SnortConfig *, DCE2_Config *, tSfPolicyId);
+ static void DCE2_ScAddPortsToPaf(struct _SnortConfig *, void *);
+ static uint32_t max(uint32_t a, uint32_t b);
+-static uint32_t DCE2_GetReloadSafeMemcap();
++static uint32_t DCE2_GetReloadSafeMemcap(tSfPolicyUserContextId pConfig);
+ 
+ static bool dce2_file_cache_is_enabled = false;
+ static bool dce2_file_cache_was_enabled = false;
+--- a/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
++++ b/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
+@@ -80,6 +80,6 @@ fd_status_t File_Decomp_Init_PDF( fd_session_p_t SessionPtr );
+ 
+ fd_status_t File_Decomp_End_PDF( fd_session_p_t SessionPtr );
+ 
+-fd_status_t File_Decomp_PDF();
++fd_status_t File_Decomp_PDF( fd_session_p_t SessionPtr );
+ 
+ #endif /* FILE_DECOMP_PDF_H */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
