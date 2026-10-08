Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A944ACA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 707AA40A8E;
	Sat, 10 Oct 2026 09:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TD6M0wLPK6cz; Sat, 10 Oct 2026 09:28:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9164B40A58
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624482;
	b=DFnEFhuAbposF3ozGtI9xAwl+iNjhoYpf88kHjrKgyvB0DmxHZWRH1OS5pFzxWEB7nh1
	 XXoj26M3k6w73+wYEgQuoFWZqmrMlNtNHczGERwlE2h+ach/uzPSPTSMRJTNYGK9XoeFw
	 9PqOOmGdRPlz6kC1Gl8V4Gd27/j1rqmEEtE40FfA3xMItWrHDEoETFH8wiiDowlxX8ctZ
	 k+78SGqRCjljWQW5GC4nNHqI40uVpF3Ugzla8giGde5Y/dH5Zu3lOsDEej0rM3UUByZ/H
	 Ae+eyUn5sCFLWI56v+ie+v7Zqnv7lGtajDUVww1pn80RawyMTrwfA3Fr7WOB3En2AoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624482;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VGK2PwA0uJnoLtDe6fTzWSSUn72PEnNeML+pp7B+Xww=;
	b=TnSQO76fCnvUpgvMBjgmudOk2H2ifYShEM5VHTplGi50qL1h0QbG/HKSL+fgKa8mLWyB
	 fz+7m45HhbdwweDhUQ841MjDoXrH5soSyuYNNhsnzqhFv8xSSJVn+XMFudRFy5o+fr7hP
	 aTEfrbwornXFTx5pPWg4oefU9vp4X/PXLakebdjHjKjw/jXeYkDhY7fstp24KBwdW+TFQ
	 3RJUcCZ8ck1TB9Z2YABLJ2Kyi3TGjm1tXgbMEWEdBI0CVXAReGyQPLV5uPhcNnSKawiWu
	 9u0ErXL8KZDzCPObZH/Yq/WMBhUOqZ6wMLnqvzEZGgwbUQ77Zw/Q6fu1wTxFGtiqzgw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624482;
	bh=VGK2PwA0uJnoLtDe6fTzWSSUn72PEnNeML+pp7B+Xww=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PB4IhJfNFnXm6hiNkQP6PR3431PZmOlcNL6sV/7nNf4TwUzihTQahPTYU7mEIGzip
	 4mP6JSIHsUqRZ4CMpfhI6Wfk5FBn+bZz4Whk2qvzXXjBqkh3kL7r5N0Z01Dw/tD3Ha
	 JVK3R+23gjnv0aFmdGHo8tfkVcuFLGq4BJxoccQo2Chc3mcIj3ZU9asPDV8BLYNIBF
	 myQMiB8PReroARj+ZxzGetk+QpCovpUxMB/ptVQ723Dt8eHNiUTAFz0enrfG1TaSkr
	 bqJpLtAfzgp0n0mnU+wDbzkesR+Z4tGeBqkQgv4iK+FoIIyqzRZT+X0VbyrNrEPKW4
	 ObmBvlmnETqNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9164B40A58;
	Sat, 10 Oct 2026 09:28:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B156DE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D20080F85
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isN1-n_xd0Ai for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F60B8112C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=FNV62/vfW+YdSG9O+OvHZ+79owlZXV9DKk0nhpp6BCNU7W4yANCCMTQWCAZaX6AnyHHT
 U/iJrJO97GgsssmL/3+jKO78HZ8xwlIYR5XFbKDwAxc+DdBIvlWP0MbvsPrAUnv6u7VkW
 4Fv481SVRgNcHlIoRTjgXoxNtDMTnvOVGsfqAhVOAnOeXYP55W5fdhuv4ZH23sm3LOGci
 SEBwHSvxboS6lNAtR6un64ea9sbyPtlGrhkb/7UG9A9WMlrUjIipfJgipKdtfJXJWB6WP
 BuSVTIWmjPEF+mbz5lryuRkCecGaiKeDqy+rudNcPzOvs7gLS+2sPGX2XmuIBnVd9UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Lyq/AnO/bCPLAcaKIHVXXSyy8bSvng3isnJttOLd7rQ=;
 b=stR8kRNwqc1nsOAmoYq7yJcmeriOhYtAbmAM/ufpvTI1aGx2HrkeLid1YUqzCW43BVBe
 P4N/e9/1+DhIs0rKTdLG+bz0B7AIn73m5jO4Ok3QVxZwV9K22Lhed37U9o9WiUm/e5KE9
 UnXoCgDpRC9IOmIv0aBSQ+dF2IF4yYtFa+EqDVMWTxC/8agYCro6cGRjs9NQyB6vhtWSc
 o6Th6Ne/sk6J/e1vl6C+eZGHzN0dISozbPNEaUMrir6diB7z5zQk9oc30Tgq424AEdPR0
 LwEY4E5bh1L8Ye0BRTRpCWDfPIc1iq57w1oNcTZj9gLzL0hxRiaou+EA2Ra/+gaQycw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F60B8112C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27F018F1BD; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:24:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 92452d71685d2ee0dbb1d1b3842dc23c4ab78c60
X-Git-Newrev: b42cc0e89e909f4356368bd6df6df9715eb5c0e2
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.27F018F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gnu-efi: fix
 license information
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6337322046414371081=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6337322046414371081==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b42cc0e89e909f4356368bd6df6df9715eb5c0e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Split the confusing "and/or" for gnulib, so dual-licensed and GPL-only
parts are clearly noted, and add the missing LGPL license. Lines in
GNU_EFI_LICENSE are ordered the same way as the information is given
in the LICENSE file.

The license situation of inc/subst/elf.h is curious: The file itself
is licensed under LGPL-2.1-or-later, and used in gnu-efi under
LGPL-3.0-or-later (accompanied by the appropriate license files),
which in turn allows using it for object code under different terms
with certain conditions (see section 3 of LGPL 3.0, as noted in the
gnu-efi LICENSE file).

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7ed738bf5d3cb7a3184a2c4e4ac61258fbe6d012)
[raphael: adapt to gnu-efi 4.0.0: inc/subst/elf.h is LGPL-2.1+ per its
   header; the LGPL-3.0 terms and the GPL/LGPL-3.0 license files only come
   with 4.0.4, so GNU_EFI_LICENSE_FILES is unchanged]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gnu-efi/gnu-efi.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 268e5350cf..c62dd2c973 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -7,7 +7,12 @@
 GNU_EFI_VERSION = 4.0.0
 GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
 GNU_EFI_INSTALL_STAGING = YES
-GNU_EFI_LICENSE = BSD-3-Clause and/or GPL-2.0+ (gnuefi), BSD-3-Clause (efilib), BSD-2-Clause-Patent (EDK2 routines)
+GNU_EFI_LICENSE = \
+	BSD-3-Clause or GPL-2.0+ (gnuefi), \
+	BSD-3-Clause (efilib), \
+	LGPL-2.1+ (inc/subst/elf.h), \
+	GPL-2.0+ (tests, some IDE & CI files), \
+	BSD-2-Clause-Patent (EDK2 routines)
 GNU_EFI_LICENSE_FILES = LICENSE licenses/LICENSE.edk2 licenses/LICENSE.efilib
 
 # gnu-efi is a set of library and header files used to build

--===============6337322046414371081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6337322046414371081==--
