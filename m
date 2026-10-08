Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6BACA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7344E608DE;
	Sat, 10 Oct 2026 09:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id Yeahp9nOvL6d; Sat, 10 Oct 2026 09:21:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3EF76608E6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624105;
	b=sjRCF9nDDa5p7bnP4Pvkou4XNU+Kmhh+peOuH8MLOMctGj+AFvIbpzDio+pJwf7mcX/k
	 pJgHNPuUePRLKXaKyh2tTXcQe+qc9NIcrGHH4j4Ep7GV77E5DWA4IOlYKCHth3XLIL/Fy
	 rTFxuH4sOKWV2/jWvU4Yd6gkjqlRVj2grWJJt8IaOCayl1K+3VhJvxYXId1+EyAaH1LTQ
	 GLQSALj8V7Izhob6UeglIwjfrWESerODKFvS7oaXVs7T5VRABvjvZypYHTLjRZYUIDvWp
	 +pEiMuiCgS9zfUFsHIOEuLdHrx4b5NSXdwPLH6Y0g1j6/1kLIM19uT1LJQJ3jp/mt1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624105;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=sib3+Z9VXc4AVCJjAmhyUAvJMVRhfen5tVLaRGGeRPw=;
	b=Je0ryPjdf/TX/Vi5sgV6YUG7ubI0s+j8a0UVMAFL1hCVAzps9vR09DCJca/LoZHPKiJc
	 gtoGXKLYRFVlHkINuCE2zsIugmkkGbOoUN2RpvpXCZVUZPzX6TofY8CtAUawmBOOhZRWI
	 yel3j5xMx/Py8bhaszn7UyeNZHXGagqhv9YogBrBmQNhoro4pBrNPdcUC0VH+SajX32nh
	 cRErhZHptCmoP9qdxki3fIBjS68ECcjVwJe9JGVOuWFxYtaXTsb3BLfB6o4cd5TA0WFOx
	 naxYT6HJUx1//yNMN/RjIV88E6UHepmAqgaQ/49kcHR58L4PmsrdP07+NABw2J7rVag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624105;
	bh=sib3+Z9VXc4AVCJjAmhyUAvJMVRhfen5tVLaRGGeRPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C4GInOGaRrUhwyCtowY//lGaHCnr4CJjaBXDWRwT2PXOXHfA5yOc4m2JIb2hivIvQ
	 +0wopVludeg+WE1fuvOy9w3lj7s99lDRSMYdlz9VWhy9Oq/CTCm9A+qCmIBnnBUa8x
	 aYTUwslI3NkfN1TZDxWlaOZDis+134v9NbBKSH5fCh3YiDw0g40O1LBnGOy0ZNcmxb
	 fHKpDwJOSV+WFYub6rfkjoolxbsL4/OIDqITmvIOrsnLx4i+t17OqSjGlhV9jhNvxV
	 mkETJdVHuAQLIHJIzvgQLGdzqqx5KFUNlBA2b9TLMD2sv7xT4GKxjyNxXlVdO52CuE
	 TWDfDLIZIfj4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF76608E6;
	Sat, 10 Oct 2026 09:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5D28DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B36C18121D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAW6FBTiUJ59 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 09AD7812A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=Fm5A37/NQfjgl0kDk0MmsKld5Za8NyliZ81PI/H4aaI1sojjezvEXDc3Yub/8K5o8D7h
 x5v4zvQZ2YgbzTDqN6eSy8fFxeVtZfGpP7Dpu8iKLRPM14K7b8JCYjszQpcj0ASZwoYOe
 AxrHE2BRNKYNt+plPGy+ySPhNkZ4ujMvpi6ZKr6nmVXXZ8VXj+XCvAQZMmSNDn4qpfK/J
 rvQG8Iy8/76aKgLwRCG73qZ9xf+fNDyXsZHGxEugstr3+g4TiGyGaZX4Y7XKWGvwQL0Zo
 JcVVZLnOkVyGDNDOD3O9iRhm/l/IERb+bmWB+A9I8fzJ54HNnKEy9I+I6pM5QvHU5Mg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=g/T7Xms5sYrrgrMONHFt8ZbOydcshIOXTQozoQ1OsqI=;
 b=HBsI6Dv25HvR1x5FXSFq9tSvcaaS6xC+nQUWrxMK4udz/MX5Hc5jOkkbqS5HJkLiqvZy
 cgVhvHtwSodV6bqA7q/+Ir14LOayCSOGEILmRsbhmZhARDa86lGDv23HbC2cQ+xcKFOxs
 6qgJkR6tlSF2uSnDZw0hwr1IHOQZ8m33JSTqzvkQR0J/434J10e55TfebhnF9YK6aS2qO
 xv/mQQxFygyQKfJesA0fliKhL5ToRTT6Ya0vwW8oXnNSntVWePnx/b3iPmkNJ1JxeeNY0
 NOtqmWWvGkR9KBGha5iPrCXqZZKnPpte9wpg5pQAaWOE5OQU49LVl5zt2b7I776gzZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09AD7812A8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E84968F0B1; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:05:14 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4f0b66e7d7de9e3553e42e778cdcba8ca5b640c3
X-Git-Newrev: 435115dd6ddee08e0847d4496556bd31a2f9feb6
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.E84968F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libpng: remove
 autoreconf
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
Content-Type: multipart/mixed; boundary="===============7503929969588768563=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7503929969588768563==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/435115dd6ddee08e0847d4496556bd31a2f9feb6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Buildroot commit 08ad91052b69090b74220d89b13cfc29fb86ed72 removed
0001-riscv-Support-only-RVV-1.0.patch but forgot to remove its
associated autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit c2f05a81ad615c47fbf874e5da1e8114368155eb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libpng/libpng.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 96afc684db..1915941b82 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,8 +11,6 @@ LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SE
 LIBPNG_LICENSE = Libpng-2.0
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_CPE_ID_VENDOR = libpng
-# 0001-riscv-Support-only-RVV-1.0.patch
-LIBPNG_AUTORECONF = YES
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib

--===============7503929969588768563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7503929969588768563==--
