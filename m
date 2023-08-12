Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EBFC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 11:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84F3660E71;
	Sat, 12 Aug 2023 11:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84F3660E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s3m47UTZOfBu; Sat, 12 Aug 2023 11:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFDD260BB0;
	Sat, 12 Aug 2023 11:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFDD260BB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE5BA1BF282
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6B1D60BB0
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6B1D60BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DALkZtIcubut for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 11:46:09 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E675E608D8
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 11:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E675E608D8
Received: by helium.openadk.org (Postfix, from userid 1000)
 id E81BD3520C44; Sat, 12 Aug 2023 13:46:06 +0200 (CEST)
Date: Sat, 12 Aug 2023 13:46:06 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNdw/pv2sHnp4tXJ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691840766; bh=zjj6qJ15r4nu1ams0kcwuQ+ovUGKyafVT6PhqRmq54g=;
 h=Date:From:To:Subject:From;
 b=RpImt5qmT24T1/M8JmUp8qEl76Ta88yt3AUdM5W4fth6h+hOwIHDt6C0pUpJk8/5z
 AZX30xEw8e1dxp+erGnGlTe59fYTUMKK6ndAiwE6WMMetWhv/v0sGpr96rdq2MvEf1
 rBAAb8sXpjlD2TMXKGUi2y50CocMflPXrPn7+ZxzodR5tML/RR3pcbpPipJPu2L8CL
 tdiUEVF1UL0jci0/u63BJYCLE/+a1EFYKRp7I8BQJHoyXD7K/pjcnMifF5a19Eh0Xz
 c1PWRDlFIMBWlu4VNX9dGCnqd9igrJo1/dnDMq9/xXkt5R/n/IV1jjnbKrhvNF3Wro
 x5xa3+oaIyJ8A==
Subject: [Buildroot] [PATCH 2/2] package/e2fsprogs: fix compile error for SH
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Compile of e2fsprogs is failing because of gcc bug
111001. Workaround it by forcing the usage of -Os.

Compile fails with:
	CC rw_bitmaps.c
terminate called after throwing an instance of 'std::bad_alloc'
  what():  std::bad_alloc
during RTL pass: sh_treg_combine2
rw_bitmaps.c: In function 'read_bitmaps_range_start':
rw_bitmaps.c:447:1: internal compiler error: Aborted
  447 | }
      | ^
0x5e7a6f ???
	../sysdeps/aarch64/start.S:81
Please submit a full bug report, with preprocessed source (by using -freport-bug).
Please include the complete backtrace with any bug report.
See <http://bugs.buildroot.net/> for instructions.

No need to backport, because gcc 13.2.0 was introduced recently in
Buildroot commit: 3009095ba8a87a22f55f6b89e42f667487563b94

Fixes:
 - http://autobuild.buildroot.net/results/fb7/fb7e9c8b02b979b3a75185c0afa4ab0ca654f6f6
 - http://autobuild.buildroot.net/results/659/659313b1783db491653bcc85b37da40c7b077225

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/e2fsprogs/e2fsprogs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 75214be8c7..80090621bf 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -70,6 +70,11 @@ ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
 endif
 
+# workaround gcc bug 111001
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_111001),y)
+E2FSPROGS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -Os"
+endif
+
 E2FSPROGS_CONF_ENV += ac_cv_path_LDCONFIG=true
 
 HOST_E2FSPROGS_CONF_ENV += ac_cv_path_LDCONFIG=true
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
