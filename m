Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FABCD5B161
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 21:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37DBE81DFA;
	Sat, 13 Dec 2025 21:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyCnPRmM-_Hr; Sat, 13 Dec 2025 21:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFC0481799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765662078;
	bh=4oxWE1pvpb/dgZFcHara+1h7Og5VztZQ8ZgGf1/fSdI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V801nzfHWArPjYZfTQGGvLWGU/umGKbE9iaaYbtooXuxh5uRGFiek8XkE7deAUDxK
	 ZP4SHlj+lc2Kc5UERYGpoKPaNF2/Cx5g+JsS+KLtZUlpi+j7JscfCeMQfRTIyXc87/
	 18yjezPXt2AG4zGWYBTINPTrB9ZJpZnCc6oCpLemHuUuVqr3dTrzFefIWO+SfwH58p
	 nSXOcoyGa3T2bdvjLL2rRxZ3dHKnPnRxmA4BfWYhUff/JzvxVxDm+XjjLGWItT/ScD
	 vJHmgSaiKZpvpjT5O38SthCNqaNF2IYGZkgVLCVeBnLPPf0gZ09OBh5JfUP2lNG9+/
	 Xmug4vsdDWbgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC0481799;
	Sat, 13 Dec 2025 21:41:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 42C23117
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27CAF60890
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJmxRPVHaWRE for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 21:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.147;
 helo=smtpweb147.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39B416083F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39B416083F
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39B416083F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 21:41:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id UXMSvqOTq3rWiUXMTvHz6Y; Sat, 13 Dec 2025 22:41:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Dec 2025 22:41:07 +0100
Message-ID: <20251213214107.1893921-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
References: <20251213214107.1893921-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEE1BtoGHarwUU8wCuIgBQHDPZFy1cmEAf+UohcciK2Gb5ALEKdoODsUB2/RTHUv8/RicfNW9qoFdj0bCCM6AQSoMswcPBLKpNoqTMj7acG728v0urvO
 sHdYYbGu1ipgipzbiiQAM0esTh5IbjyFcFoOPBV0rEz6ZxFZ49JhSorIjyc6OZKNDjLSStTG/a6hnMKgLpHPzh7HxAGrmhw+CdUSaSe/pSpchY5cHc8xF4pK
 DcmPVBFn277KiNDdm6St5M6YzBF+Yl6AJCNwzPnQUq9Fh8udt33TIneAxasA3bFatT5ZR+NOv4DXIwX/P4O7EH89+9VV6QilaZjXK0HnC7ls9TpyAQUzOnvN
 Zr8RcxYs
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765662069; bh=cQyvGIkQTflIJ1GEFFR+5GjhuGjgRMQQf+bOtgvHFok=;
 h=From:To:Subject:Date:MIME-Version;
 b=VBZovvCLAw7+f0fxSWYXEzb9aesjIdZsVGWkImyuGPVuYuQSzYZIHGLLN0tKHmJCn
 4/7SXSRGmv5ytoqw25M++sOrI8XdBoIFjo8Q7Os4Dc0SVTs5LaKAp95x6ElV4KJtAL
 iLv5kGUuYvxba2QCPQuuHKglJ2NoinIHq4tziSHNB4+t7yvnWkiFs3Vr1koXnoG5Ho
 xBwhiuC7tWR02kcpV5DD3/GE+mSuzlQ1QsUWGKMTyui4vr/vgRuAun4vdmtZc08gGD
 aAGt0EYQqigeUt+bU5MI1piU5wEJttuiM1euupMJryT8TW3DdTInEoJg6vdMVQTzWN
 +tEVVEgsspeow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=VBZovvCL
Subject: [Buildroot] [PATCH v3 3/3] package/rpcbind: fix build failure due
 to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

Package rpcbind requires libtirpc rpcdb option enabled. Package
libtirpc with commit [1] disabled rpcdb functions by default so let's
select it by default to enable rpcdb functions required.

[1]:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.org/results/f461212605d9d5f1c38a1ffe00a83912522bf482/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* no changes
V2->V3:
* improved commit log with libtirpc commit as suggested by Petr Vorel
  and Thomas Petazzoni
---
 package/rpcbind/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 9cde7bba39..ec8f8ee1b5 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_RPCBIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
 	depends on BR2_USE_MMU 	# fork()
 	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_LIBTIRPC_RPCDB
 	help
 	  The rpcbind utility is a server that converts RPC program
 	  numbers into universal addresses.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
