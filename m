Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D53C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 12:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D23E042312;
	Fri, 10 Dec 2021 12:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81L8e_-Sqd4n; Fri, 10 Dec 2021 12:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CFDB424AD;
	Fri, 10 Dec 2021 12:02:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFF041BF59E
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 12:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE27B424AE
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 12:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyUC-e20rdRK for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 12:02:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60AD2424AD
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639137751;
 bh=tQx/ZNOeEL7aMHas+5RJ3IvTWZnFRmMjRmV6uJUDsgc=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=GaUirA4k2ZduKWzT5xEPX53ScR2pHLm/h5IDMjgXSbq4t+ORwZXDsNrbdJcT+4yCm
 nByjomZ36XOKoehasd6zqZ3QM11QA5BGtaeQfmxVN3JkJDRK7XnHLNpNtl/ihPq/09
 J8CBv8crPvsqEGDj2Y+gtzVN0g5+Vvv0Dk8jPLEc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.29]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mplbx-1mCTxj3Ipp-00qDMM
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 13:02:30 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 13:02:30 +0100
Message-Id: <20211210120230.15277-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:chiM15FPQkuH1hYvLC8a6sAapvZp0kj22j9lit5WnEmlxrUHazm
 quvhvqEevyVfiMNat39z1+v5Yh/5qkWgYEdqOd4xIbcqHBYFStXY77I2snBeclc6OU8udu/
 bILVPl82qZiZW4IEWi1RAjAtbv7offtjaPB3dBBbCgi2zvJ8tOIrjF74bgH8vyNTEh32zmE
 TG74vbBKwv8wyJ5QNOnVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:urk+0Kwm9pQ=:eB6pC1blg9U0uhzKYxszln
 wIUCspm9gBEp5k+WF+zBKwwF2WtXWVitKL0B3ODnT2Xv8UA+AU6jHuQ3LGVowDPDWz1+FuRms
 YG+qXKWjm0lWnxyqjWsIv5bTNLEfTocejTm4rm2zVEXvf/bgSI9Ein0kp6uPLjkPyp5ZjjBJ0
 eTj8VNtjoHy6ZnaG6YfqnT0rVCFtbh7Gwbzxh0xelLKJqpentB6BmgOGIFiRQ1X4hC2e9ymmx
 0oe1+IMSp5XGDJr5kr4l5jI7ZBaFUXqHnUhUBYoNR55efjuJOn7iv8lukjOIgeBakfNI0GtQA
 4Ll6q25UCP9HzoT1qDaypnXRpFf0NbMNJUpDjck6jKV5wlh1dUWVuYjjA0zyteVwHYRCQvzPS
 jFE5cpE0HMOXSrsodZzfpYqDNUEMtcp6RQctsbJbgAYeM8RFic0yWknVD1bTkiTfUfdJTdRd5
 eQDG/W0bo+PLWa9XgYr13X+Asd4qdGPL6fy37thhRqeQgzgJmdgNDvoXt2EkrU7AKte2xwW5I
 CAvid5iK/bP9/2J3YftSEQm4m2B0qalvqVllkzw6o/sGupnDWmjEvWQLpfNGz042orpSuwA+v
 +AGQM/Gy4HkXfSngo6q9vRMYhw50Q3xT1CmC492DXlTtmZUv/M3auRsGvkFgdVgtuV2OmfNm3
 TAeVGPnDMKwml+q8pQL1M3z6dDkQWPbQhJXgiJBGEwu0oCj77ASaIBOIKp+ytWFbTPkKkahBi
 XcGPHzIHkDNY5cCL3Yxo1JgABO0z68ZaJGQv/k/tSL8CyVcYFhCFoL6SvDHCkO3iYtha1tLpa
 nHLT1K82+O7YSFsFgh5VQDAR0ANfeYj+XLeOjgmvfpM4zf5jSjWX8AhFySeT2OhjBYPs4c4Qw
 H1jBIgWM/80zo76+M0pK86N78bx4a3MwVPCRAJsCP+kXmbXC5hLo4doKz/piWP5zupyhwFSvq
 QRJeJ7HOYrLqfdhcY2HmKUcWN4PdGb+3Qv2RfzWw1ZCkZ8/wthyfraPsLaCPkBqfVpYY+Oocv
 qOaZYpyjfFKbWBTLjywvTd0mo9TF7Ed1ToNfZohx1lgqAOVYugo5kUIAfNmRkQmFDEF4N7O/+
 AM9le99dGubG6g=
Subject: [Buildroot] [PATCH v1] package/assimp: needs std::exception_ptr
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

Add dependency on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 to assure
std::exception_ptr support (the only in-tree assimp dependency
in package/qt5/qt53d is optional already).

Fixes:

  - http://autobuild.buildroot.net/results/0cc9cab2761591af57d6d6744a0dd61b7c60e935

  In file included from .../build/assimp-5.1.0/include/assimp/GenericProperty.h:52:0,
                   from .../build/assimp-5.1.0/code/Common/BaseProcess.h:46,
                   from .../build/assimp-5.1.0/code/Common/BaseProcess.cpp:44:
  .../build/assimp-5.1.0/include/assimp/Importer.hpp:522:11: error: 'exception_ptr' in namespace 'std' does not name a type
       const std::exception_ptr& GetException() const;
             ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/assimp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index c535240efc..833e559a6f 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_ASSIMP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LIBZLIB
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	help
 	  Open Asset Import Library (assimp) is a portable Open Source
 	  library to import various well-known 3D model formats in a
@@ -18,3 +19,6 @@ comment "assimp needs a toolchain w/ C++, wchar"
 
 comment "assimp needs libzlib"
 	depends on !BR2_PACKAGE_LIBZLIB
+
+comment "assimp needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
