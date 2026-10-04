Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBB1CA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 13:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7577580D8F;
	Sun,  4 Oct 2026 13:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnVxeGgYr2wE; Sun,  4 Oct 2026 13:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8297F80CC4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791119753;
	b=QB+WBHDxGeQQFUATbR5HPONbYRkv3XkDkOE5KOJEC/iwcgOqEmZlUHNoR054zBKhY5pA
	 3mXFsGdYPbkpir5fa6Odr3UzTKM/YbNFounSj+4FaqqBkq3to3a3gBzfwnIRoQfjIznbH
	 FkqiFyk/X6Kmm2ETjdDJKVd0FJ3j6AYmtUbnE/o92ZYiMQswbe42omlf0Bhy6FEeDIFZr
	 S4c2QyDeraxCrCRCzpa2RYfIKBonapKJXj0SJLPHyzwPQ/lXvk9Mguc2gWbyi8hEe8MHD
	 m7eK6QOVslLs1l+Og9z/1vd2uFeLef5jDC1n+FONTphojvwocOpG6oHo/wtzi7e0bjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791119753;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AMIL/j+bmkBFEYMNIDwzmP2YP+7zdVxtL0YxjT8numY=;
	b=DI+UNdRU/kEmza9AeYJ9IzdwsV/j0n5Uy3Dnin4AjQS1nIMpPYXaPwp0zaLWL4fwmN7R
	 7e32NBruU0bgq44ZS5FP/CBHCeE28Bhdr0HYYlKe0bkT/9d6bgyXHim+hbUKmp+pIeh1L
	 VkBcSmzE14Htw6hZPBoElJrRV8VVDp0tmmsxOlaXIKiLBrzYdEW7Nv8xKkOHzYfULvcM3
	 npcHJB+35uHh0SK1IHqKbX/mURp6POsy3rM52RHllUgh8pENZ1fb6ibqYN+SM1YEvFQV7
	 hNu0oTEBJ+rKpJwwp/M+ZfvdhGWY6EjQd5vp2cScNOYSfAKcOrMDRKU5LU5dKbsG1EQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791119753;
	bh=AMIL/j+bmkBFEYMNIDwzmP2YP+7zdVxtL0YxjT8numY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Aj6DRGVh5pHKVofzq6IoWknD+Hj9kR1AqUsOM96ZxJuKR+8+ow3f/PtQyCCZRrVKi
	 4budhAsluyZ3lQ31r7ZvWhswx9icYu8ID99N4+hgnJQVvGmWCWj7uL+51fuel6jLA/
	 txFXVpxjkHj9F7+L0N6+PxPijkEyw0rI1xC5Ar3VKn7GMxMAQlUWNmLEx6XEk4+ot8
	 7mT2RfKk1dTtiPnjMpKLn2AZAi0uOuKQiVg1iD4GARMGJtL1p02exFD9Dm9YG9N7H9
	 zvQ/a0JH+gQIzVF7qFqSKpqzpJGE1lzwwU7fJV93HCIDfmGUggPvJSlRRMU7MCgFO6
	 nSvsACaT6BzFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8297F80CC4;
	Sun,  4 Oct 2026 13:15:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAECF335
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 13:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCADA40720
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 13:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eRz3a0JhOFwO for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 13:15:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 07E734071F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791119750;
 b=I2+Q+Glhj+/1+i4/ChxA2MhdIXcGDmRrVf4PTkFAlE3aeUcSYMBZZezavmMUt/fxEwXF
 AjtCew/YRcK07S5uOu/8rDcldh0iY++/ja1GDlyMR7zs5bXfFvSxlDlhNDSHLdCMUqruA
 XkfVuqHz8X9zAXXXH01Q0C5hw24kUn2pibIWV9eWBieRgPdZ+pxCL/w+Ru9p/g1AxKvs6
 8W9z2fInYMn1f2ZoYRZnsHi/OkmfuAYXxR7Vb0JeGpxaTF3eqzTjW8nwe6frCnCqyJUVA
 CNYTwBRK1shBB3Vb/XGeyRWBiATbC+quivXjDU9jSm7IyC5l05HOIf2OTX42XazvTFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791119750;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=MshNZhC973rqHIzP09EP9I+fu407ejPKrFoEbSqbcgY=;
 b=BAEwX+qhAoc/STr4s1/liaCMrL4oBeygyjrh9IMasQLIUDxilDRWfggja62/KshRWd8V
 TBWEdUd7NfehJ3IWTdumcwsNTILE+1jaq/PFLfuQqeaWhzdYOPCBosMadv7wlDKV5sqE0
 LJJb685ydMH6Us9co38TNwIqeCFj94LxtoHGYPg3uqAno16XtNl97bLjago63QiSILgIF
 opHzuYD4OvtpVJX8pomLSQ2rNGyNLoy3ZV8IFPT2+6eU/3q2AHdV34+RLyu9to/Q1Ngcb
 M6KcY0ejWu4pvxcwtFYJrweX7e5HJpUqXF63s8uSrsowrAojH+PiMYiGXTpyRtW0hcw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07E734071F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1791119747; bh=YTYyAVO9lMea8fmbpTJ8pF+UbQ6kpbMFoh2ujh5WKzM=;
 h=Date:From:To:Subject:From;
 b=OllJMwqVqNQx8Pr/kSt8ZX+lGEDyZazXOmNnHKvO5sNT75RSi+6CeLAA61L2/aiLD
 PsOeRKOX4+cJdUtPxl0veRWpJl907HrdBarmcT6seUQjXIy/UnFljd7IftYDkmN2Xe
 ZkzxvrtlozQuIv+zGAKze5aOwfYP1Lhv7JBnEKsTBzxommHoVeA6FsGkUzUWoHJKwS
 hI9fdxyCJ7O6bXrOgPJDAnj2Ox0qvEG9d72cT/uP6KOXCsQN2LRzJPj2Hf5sNVbb4y
 /XiDtV10R7RzCIUNpzSrhSb6JqnaRPYI1SvhIJZhatw67gMFzcKPiWbvyibbU4GyEg
 Lrsw4cLoBD3VA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 85F4331E0562; Sun, 04 Oct 2026 15:15:47 +0200 (CEST)
Date: Sun, 4 Oct 2026 15:15:47 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <asJRgy5lq_7AenBu@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/valgrind: bump to 3.27.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for a ChangeLog:
https://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 8e62256b9c..4cf58d0db3 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  c32f135761724db05f018fff67e06c4edf328770  valgrind-3.26.0.tar.bz2
+sha1  0b113f5c80d34743195b78651c2520901ba630cf  valgrind-3.27.1.tar.bz2
 # locally computed
-sha256  8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7  valgrind-3.26.0.tar.bz2
+sha256  5d589152eb8071c02feab8ce6ab719e431a1fbc3e2b1700f5432632a8b9264dc  valgrind-3.27.1.tar.bz2
 
 # License files
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index dc8d73b943..6dca6252d9 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.26.0
+VALGRIND_VERSION = 3.27.1
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-3.0+, GFDL-1.2
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
