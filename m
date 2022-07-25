Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DC7C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 19:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7148B83337;
	Mon, 25 Jul 2022 19:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7148B83337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73gDmLIjiESi; Mon, 25 Jul 2022 19:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72453831D6;
	Mon, 25 Jul 2022 19:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72453831D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D47481BF2A1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0821402F5
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 19:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0821402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMUYzWYCtgJx for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 19:32:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6D114012B
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6D114012B
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 19:32:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l15so13347393wro.11
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Y2Ey3UsTuBiuY+g7Klh0GSv6sqFbydMuUPFIpAUDZI=;
 b=iyLuqjLW3eK28YxSPGnAs0zoL2cttkz4aDZEesZztVRCStnnExt2JU6YOkyTs4/mJd
 /Bzf9DMo/GzxwVjZ/ASFdXArSsIHv4W4lQDzYiWJ5i6/zd/eVuKrovpmjtQqnhBQYApl
 vhv9puPhSeV4LdGxIFI7lLPJ9r3GDoFGia/K9V3BU4r60kuuQr/DMVz2MDfw4pCcCbG2
 S7n2wJXTMJhFZnfM3iKovTVtSB3pJ+De9S0m1XB0eRaj0RRWIXE+87FiQNzWAzpfGnS2
 RYkoaQoAIsxR0NuEf6DOX34Sv0iXteMa2Yedy++8fmAyo15csmXV3QLVbSUt6KKLULCo
 kQPA==
X-Gm-Message-State: AJIora8nweA5iMJNqkAI7h2lZkz0L2PmFP0vDfPVAXVYnhlpU4I2811s
 +KubRpSPy1qV/g4GEbhgBKQlYXaiYvY=
X-Google-Smtp-Source: AGRyM1tSFmz1ZbgP1ClYmmSVIbEb71G19Z/8dpzpx6D3KoEoMYX4uviGCPel9q18ebdQcfB0FnrXIg==
X-Received: by 2002:a5d:59a4:0:b0:21e:8712:1d8a with SMTP id
 p4-20020a5d59a4000000b0021e87121d8amr4778300wrr.435.1658777575513; 
 Mon, 25 Jul 2022 12:32:55 -0700 (PDT)
Received: from kali.home (2a01cb0120169d0bf78f966f9fb21656.ipv6.abo.wanadoo.fr.
 [2a01:cb01:2016:9d0b:f78f:966f:9fb2:1656])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c2ca700b003a3253b706esm14117602wmc.34.2022.07.25.12.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 12:32:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 21:32:51 +0200
Message-Id: <20220725193251.92785-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Y2Ey3UsTuBiuY+g7Klh0GSv6sqFbydMuUPFIpAUDZI=;
 b=RzLtFXjLlaQiyESUXruBkLWV3ZbmsLzZkqBt+BpRxJvbM+u/fxIEs66YmAJdkqC33G
 MWrpqo379IXeOyexoGN0SEd6lI8YOBVur+f2num8HM52Ki+EIpxStyKjOMWxN2JrN+e1
 FRYbReizuYUtVb3X0f8VURlGLCHA+NprmZQ4vEqW6qJ8P1RAp7wLeLI9NYpojQP/XMww
 z5BSId00d/L/Zs43Yo6TlsGRgk4IsWsh8n4pca+RFKdtEI9DrSUzZDamzLaVCJShzMdW
 rKtoKbMio2+ohGpZ9bhbtOVQH2LspSG5Pyk5u1XzGs9dXZSpRYZW0j5NG3w9NXJH2zBf
 NAEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RzLtFXjL
Subject: [Buildroot] [PATCH 1/1] package/opensc: requires RIPEMD160 in
 openssl
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

Enable RIPEMD160 in openssl to avoid the following build failure raised
since the addition of the package in commit
8aaa7ecbce1d10cbcd880c3da5e429988f96176a:

/nvmedata/autobuild/instance-17/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: pkcs11_tool-pkcs11-tool.o: in function `sign_verify_openssl.constprop.0':
pkcs11-tool.c:(.text+0x6b00): undefined reference to `EVP_ripemd160'

Fixes:
 - http://autobuild.buildroot.org/results/6dc5baa2cfb037431b9ede9f2e0c5705957ee3bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opensc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opensc/Config.in b/package/opensc/Config.in
index fe3dd0836e..6a0329fb39 100644
--- a/package/opensc/Config.in
+++ b/package/opensc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_OPENSC
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  OpenSC provides a set of libraries and utilities to work
 	  with smart cards.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
