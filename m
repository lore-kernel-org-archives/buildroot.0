Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10898CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C368E611D8;
	Fri, 16 Oct 2026 13:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id zU3tcli-CQFU; Fri, 16 Oct 2026 13:12:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8674861105
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156323;
	b=Bi1qCoE6VVmCKGhpnMWvAYlFje3XvUojJXaJ3tgRGfG8ETlGABFXheGPUE2LorIE2ZGB
	 3gt9/ZiwSiZbPm5AuucLfgblESLogyAagoIUwrvR9xoHgmBC945bxJoPcoLw7AsSkF8fE
	 u/MQY9IhXYPfgOy3bqYuy9o7YN45BBc3CIgCL1qsKXSUSto/eXHgm8Am6AY1MhovrE4vI
	 l8pmUo4QfAsRBroIcWr3DkyY800MyT7/64d+e9GvAYYPYuCUtgD/0umd5H7D18kpNGD6+
	 bQKtZHLtnI2wO+wNSlaRAi7ObDA2ebO5SjCzg/iy2MY+Fy/XwyqTD+uffaEW1kybPSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156323;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b/qsHbt9kFMRfwUUJAQdgmLSXYqVvaoGb0dhofZRYFY=;
	b=rbB/hYAK3oZ8KifS9rSLpmR4YCZ9t71i+hSBbfQmOg9Kh88JPD1zCWifNH+ar291A9+3
	 ubT1VlOzrpIc1tIdpSsMxZMQwy6B96tQ+gkwlaviHKBQiij0IJHdD7HdlwCPZVLw1yx7Z
	 X0OHsPJzTOLLM7N6I120BIh+77E/ypOo79rQ2g5938TedVkX/O+SGIFAJJ2mgXE3s2NwC
	 6tuhKxbs6wXqz9Z4xqMS1lq9YHIyfqvKFzkVPCn1zlb+RH78Av2H85aaYt5qnT6woLyI+
	 nLFxCSNgBZJFjYwUNmDBmRxpzj6B9TOPsIfYrAlqMJq5C9FrUVawR/sPapCaMyQ1kOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156323;
	bh=b/qsHbt9kFMRfwUUJAQdgmLSXYqVvaoGb0dhofZRYFY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bC/ckaKm2058eEHYNGcdWon156sFqB9zpKhAM6YH4PqHH9oVWBYPsCRJWas70w6Eu
	 aVl7pKrepRX0qE/35DWjHqi7DuhXY0km0rFD2q1TSRPGr9rBp5NXo4SbnLTTxMWo2S
	 kGx6nLc9SA95pjnAwJ7fQg7Cc+NhMIN+AdDsMOV/tifdyuBGSpD/ttxGII00iaICaw
	 8tnBY7SdvjLtjlnSnYpGFNkYl0mtIe6knwCLO6F1Il0n1xOIeAwh7aSmadAwWdjfAQ
	 TfNK7lPLYScdwdEtXXwfZeYfqTI7WL8saG71WyyDipLHuUplEsnNVh0M8ZkkWySAro
	 WA7FFuRuBEvRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8674861105;
	Fri, 16 Oct 2026 13:12:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6099105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C43CC40042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rmrXNGdQusA for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0325740474
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156195;
 b=N4awm5Ui0TzEatyVFumfvtmPKosMGfN0Zyu87M1w6XybW52at0fTtDPLmD7kCXyAwWAo
 GBkmJv/26Av9UDOJxPBZZtj3+9mjpTG9T4Nb9+Sff7yuMgLDh/wYMB99MIH+UzI9YKgQI
 mxptLxV3bB4e32a7VyaX303jh3p6Hjug6ZjWQYvHRlCU6camv0+9EYkT8FrbxMHDYcU9o
 0KqYq8m4jCyiP4cn2orppz69ZnEcSZySxeQaTG2v6ZSWrkefQXCnViBbVp2H1eUABIX0r
 ZO1mAt7gZDWIhXB6UFPklyVoz2yHDIRdHzhHUC4Ak+c3VQ5bb243xzgBmvYQfClJSkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156195;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qEQnNRi+9hgQYHO6Ta1Bo2Nti3ZrQ8L87BuFex0c/bM=;
 b=eM3EY4NTLUp7OlNQLv9jBpwNfY7J6KIQbmY83QFFs/r0rxuNYE+YbtKCOiQe3L/FjzFp
 TS8oCHPP1AtlkvWWkXKkCWfO93PBcj8M+eRWjbo7Ee+8XafYHxOjOLUdu26bblKpBzMOR
 PQQ6Eaagn8bUvDttODEzGCawGB/BBZKEkxrHNyuTuQgH8SXzlpAPx7yzSzcj5F59SEYQW
 CoA0SYVLtiXVH3O4YyX2LKUd+jhNawYaWIJzQ53AX2sDTQzadoIEu7661KkiD8C3nloIy
 +NJtGiWTbdHwpeYrYXK4q0P+YWmy+liiRVVr5xbRXSbHe3JE1kKGc7C0TiyLa1EEdRg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0325740474
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E743F960DB; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 11:59:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 934d1d72593a9bc8e3ebc485e38c978270a5997e
X-Git-Newrev: d6061d653d7fb215c2409c59e4bfad1b9d677215
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.E743F960DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] icu: fix static linking
 by adding -lstdc++ to pkg-config
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6061d653d7fb215c2409c59e4bfad1b9d677215
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The ICU library requires C++ standard library when linking statically.
Without this, applications using pkg-config --libs --static icu-uc
(e.g. xmlcatalog in libxml2) will fail to link with undefined reference
errors to C++ symbols.

Extend the existing fix for static linking to also add -lstdc++ to the
Libs field, not only Libs.private, when building in static-only mode
(ENABLE_SHARED is not set).

Fixes: https://autobuild.buildroot.org/results/80c/80ce2a1b8ec356dc13e3c51474fe4cac9cbe3cd6
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Acked-by: Andreas Ziegler <br025@umbiko.net>
[Arnout:
 - Remove checkpackageignore entry.
 - Improve patch comment.]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 66754d7f504075188b2ae7eca2530013986b3fb6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                   |  1 -
 package/icu/0003-fix-static-linking-with-icu-uc.patch | 17 ++++++++++++-----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1f2c67ae4a..03877605a4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -405,7 +405,6 @@ package/i7z/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/ibm-sw-tpm2/0001-Use-LONG_BIT-to-define-RADIX_BITS.patch lib_patch.Upstream
 package/icu/0001-dont-build-static-dynamic-twice.patch lib_patch.Upstream
 package/icu/0002-link-icudata-as-data-only.patch lib_patch.Upstream
-package/icu/0003-fix-static-linking-with-icu-uc.patch lib_patch.Upstream
 package/ifmetric/0001-Fix-issue-NETLINK-Packet-too-small-or-truncated-92-1.patch lib_patch.Upstream
 package/ifplugd/0001-cross.patch lib_patch.Sob lib_patch.Upstream
 package/ifplugd/0002-fix-headers.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch b/package/icu/0003-fix-static-linking-with-icu-uc.patch
index 36a3d1f696..689e1304e7 100644
--- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
+++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
@@ -6,21 +6,28 @@ Subject: [PATCH] fix static linking with icu-uc
 During static linking with a C application and libicuuc.a,
 -lstdc++ is required.
 
-Add -lstdc++ in Libs.private of icu-uc.pc.
+Add -lstdc++ in icu-uc.pc. When building a static library only (ENABLE_SHARED is
+false) add it to Libs, else add it to Libs.private.
 
 Fixes:
 http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
 
+Upstream: Not submitted (old patch)
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 ---
- source/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ source/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
 --- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
 +++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
-@@ -279,7 +279,7 @@
- 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
+@@ -276,10 +276,10 @@
+ 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
+ 	@echo "Name: $(PACKAGE)-uc" >> $@
+ ifeq ($(ENABLE_SHARED),)
+-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
  else
  	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
 -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
