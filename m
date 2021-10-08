Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE21C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 22:53:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C2B60E9C
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 22:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9C2B60E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B27683B72;
	Fri,  8 Oct 2021 22:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeieOAtrvEx7; Fri,  8 Oct 2021 22:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E95EF840D5;
	Fri,  8 Oct 2021 22:53:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4961BF333
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 22:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D4A060AD2
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 22:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FQmjeDbKzUX for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 22:53:09 +0000 (UTC)
X-Greylist: delayed 00:07:01 by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B9EB6078B
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 22:53:09 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YycvmAKKuDee6YycwmxL2I; Sat, 09 Oct 2021 00:46:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633733166; bh=ACL2yZcqGwgmFM9tL5OJ9Y4WQcRtNtOzmqV2pOjrQuU=;
 h=From:To:Subject:Date:MIME-Version;
 b=gBOAfyINCxmx5+RohDGCl/zMrSIIzF4x4OG+973Kodn/0syXyZskImfgQklw4wHST
 OkSce/Z1MSPgMmwIkqYNH9OMSKdysrTAPpz0yiI3vi+7pqKWijOHnZ9SLyoZtForLw
 g72qqOjmRqJDX1YftNCIN5GRaXNharbDJn3O1u+7QkNXj71ZVJVDRgECVbmPbPROjA
 1ZiLMJsiY/QDM+VGYbdFAOa4Pwix9Xo/oSJt3HdMMxu2nfTLnRhuK2AzAdzoDS+qna
 /5ieFs6hVnwvk3CezUpeicyi4EpdkbgN8cZ982NzRj9RDYexqReYZy9LMSakD8zdRV
 xtuXkZLREX2kQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 00:46:05 +0200
Message-Id: <20211008224605.884413-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008224605.884413-1-giulio.benetti@benettiengineering.com>
References: <20211008224605.884413-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPKRojRax+JXnuVmm/dXSTexTCrX8h+MBlHq8Lf4xH2YiW/hi9o44CPP+r4Bifq5YVltVyMWKd07B1WgZh/Ar2VEX0vSZ3a6e8o3fdob201Oz+9c1In3
 /DatHVtidwLilbS5+QejvEW3CHbm9nj43nskv1q29Lxx8Uqrdl8J7iej0JcEVhNzmosh9oEDiJZT9CALWwKN5aaUnPs+FK0wVWto2x6AG1TTJ18r1FO2hg3c
 393enGVqlsA9aMVeHHpgWRL65lZWJOoVdG9haoqkyvMLLa6gKK2/EpuAtbpCwcazKUAofT7bhoxfgM2zKHYKFkqcmwZ6gec2iWmz8mLICM2xqXpeT33kG1sB
 tL10tVVnEIbu+tNMtJNwfDPdZIWaDnlmTU7uNq0BatX3QrqdJKQhyWW37i6juXyORT6hHrnSseISbtF7DwoK+CHhyEQQYw==
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: disable package if
 affected from gcc bug 43744
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is affected by gcc bug 43744 and I have not found a work
around for it(i.e. the common -O0 we use or other), so let's disable it if
gcc has such bug.

Fixes:
http://autobuild.buildroot.net/results/1db/1db6c59c98e3c09fa13277076ee2fbe7967f1f6b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/gnuradio/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 77163c611d..1896d1326a 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -4,7 +4,8 @@ comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
-comment "gnuradio needs a toolchain not affected by GCC bug 64735"
+comment "gnuradio needs a toolchain not affected by GCC bug 43744 and 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_GNURADIO
@@ -15,6 +16,7 @@ config BR2_PACKAGE_GNURADIO
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
