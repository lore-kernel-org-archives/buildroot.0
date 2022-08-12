Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F094C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 887CE60B86;
	Fri, 12 Aug 2022 20:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 887CE60B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCNKJvHM4uvN; Fri, 12 Aug 2022 20:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A4C360B6B;
	Fri, 12 Aug 2022 20:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A4C360B6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC71D1BF354
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 20:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 883C240543
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 20:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 883C240543
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_WH_UjzFqZB for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 20:49:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A197402C3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A197402C3
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 20:49:51 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 r83-20020a1c4456000000b003a5cb389944so935951wma.4
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 13:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Rg+xygtl89KcdhWTMvxPQBTgrPsopuayyn50xf60tDI=;
 b=Maa5T2J0KvkMso7jICUC4JaTJIDurOFDqz0tDyRlCV7zsGgqYO/blACRTYKoZHsmWB
 OGPUPmkX4m0RJe58fl2thsnhpuzfgy3GBuGdc6nqpq+YAQB6G61TANieVlP7hp7zsyLh
 mTYovdP2kCs7YaCMwgpCQ9ufS9EIT70Al+3IJ1d86CWH5gs19Cr8Ju5h13tq0a/VxBi+
 FprpTbhKW129pg2W2f25kUcrhUPUdQ1dUjuGJ5AZYcLATAGue7H2rRS6+qJR/kaE8CDG
 fsmvzV0PJDcbwJouiO3QhG15BA+d8UbXM5yCgSLoUgi2Hm4bjxufSqG5kLhcCLIyaYvH
 Ep6g==
X-Gm-Message-State: ACgBeo2HEF2jBQ1rZEB3LXR4i6Sog/4kjcxUOCqig2MHcZIP/eYLWwLk
 JQqNVxFpp56g8GvyEJNPEbGd7O8ImKo=
X-Google-Smtp-Source: AA6agR4ITuT6/ii2a0nEe0g5EE5tUrPrv9habVnwe1v/BTGxL05Ipc64n2voZQ0NS3QpYGwn4lr+yw==
X-Received: by 2002:a05:600c:4e12:b0:3a5:dac2:5cec with SMTP id
 b18-20020a05600c4e1200b003a5dac25cecmr909201wmq.183.1660337389385; 
 Fri, 12 Aug 2022 13:49:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0001a8063f329e0108.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:1a8:63f:329e:108])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a1c7307000000b003a53ec3d847sm594637wmb.29.2022.08.12.13.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 13:49:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 22:49:27 +0200
Message-Id: <20220812204927.173993-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Rg+xygtl89KcdhWTMvxPQBTgrPsopuayyn50xf60tDI=;
 b=HvUBs/0TUMiGNMqa1kAKxw+Bo/khXJi2h4yQYuw5GHEgnQ71qmlqCWRorSxGLJosLH
 6vWnO4qHwddCeG94ljbRJuYODKMdZnHan6XJnn/7B0AVGqOmlhpH1DMcQW4KGhpgGoiU
 nD3Xyf6pCP9n2bywjVDPPJMzu9x82wuFXAk8eWCu8kzwnOx/Axf5TiImjf7PygY7wg8Z
 VyXAMo8m6O2KAKNniGtDRjXYV16R/C/448dOwR0seDtwbj28h0obhF9x4mOQNHPllw3t
 J09d4BdFx8avfUJ0mnDsll/kRa7eA0ZRKpX5URcI0rl79ObHw5+RdLSWb+yXcGuGGW+c
 4GKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HvUBs/0T
Subject: [Buildroot] [PATCH 1/1] package/opensc: requires DES in openssl
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable DES in openssl to avoid the following build failure raised since
the addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a:

In file included from sm-common.c:51:
sm-common.h:33:1: error: unknown type name 'DES_LONG'
   33 | DES_LONG DES_cbc_cksum_3des(const unsigned char *in, DES_cblock *output, long length,
      | ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/25d0933406dea28201dadc90abd32072afab720b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opensc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opensc/Config.in b/package/opensc/Config.in
index 6a0329fb39..2cec096ac2 100644
--- a/package/opensc/Config.in
+++ b/package/opensc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPENSC
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  OpenSC provides a set of libraries and utilities to work
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
