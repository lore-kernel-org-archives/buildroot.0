Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBFEE7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 23:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E28EA605EA;
	Tue, 10 Dec 2024 23:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89F1U3ZstnYJ; Tue, 10 Dec 2024 23:47:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0491F607FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0491F607FF;
	Tue, 10 Dec 2024 23:47:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 281BDED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 242BB811FD
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw9KvdROTK9u for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 23:47:50 +0000 (UTC)
X-Greylist: delayed 901 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Dec 2024 23:47:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BFBA810D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BFBA810D4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.245;
 helo=fllvem-ot03.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BFBA810D4
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:47:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BANWlJj2534804
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2024 17:32:47 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BANWl0u007794
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Dec 2024 17:32:47 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Dec 2024 17:32:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Dec 2024 17:32:46 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BANWkiM020431;
 Tue, 10 Dec 2024 17:32:46 -0600
Date: Tue, 10 Dec 2024 17:32:43 -0600
MIME-Version: 1.0
Message-ID: <20241210-uboot-bump-v1-1-baeb59feef61@ti.com>
X-B4-Tracking: v=1; b=H4sIAJrPWGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0MD3dKk/PwS3aTS3AJdo7RE49Q0A3MzM8s0JaCGgqLUtMwKsGHRsbW
 1APC3dStcAAAA
To: <buildroot@buildroot.org>
CC: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Bryan
 Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=bb@ti.com;
 h=from:subject:message-id; bh=qwtPNvZDNwWbJVOUIeVSeZLMqNWvCkSOZmQyGnvGj5I=;
 b=owNCWmg5MUFZJlNZwWSmNgAAbf///v9/++9rf7+d/ifzvf8bXbvn5va/Lntza33ribfayn2wA
 RsWEPUGgaDQGQBoAGjQekMmgNAaDEAaAANDATJpkAA0ABkAaGjQ09T1PU9E9qiA0AAAbUZGQAAN
 NGmEABoBoAGj0Q0BoYmmnqekepo0eo0B6gGg8o9R6nqDQAaDFD1A0GEaZMQ0ZMIDQYJ6mgDTENN
 NAAMQAMQZMgABkNDTQ0yABpoNAeoAQTMVWQOJ8hC4a3Gqms2dNqjYqTs150W4IxYAfWCMYU9llB
 6lsMRmBOzwBl5HIiECEXOHeQSEFoJZiMDqEHS6aG6Aph3Op9zB8WV770Lf0dRifgfBnvEiXPw3Y
 /OZhlnQmqY5YpckqfBaz0gqJMhh5tBXURbPXnStMMzfthXBcibTmfxNHe2MDWEGPtJjhYzAhOus
 mXINUdZU2SyVhS4EjW9ivBb7ClpTpZpP+ACemOR7Xf3HYRYB0J3Bj3kSXdaVE8/R9Ri0ONsTLgQ
 wULdrICE5JYozb9M/xkfVhvgtV8bNJm7kNcOzwlOt7NF2++B3Ip/zaeSIax+Itg1lxVlKUI9feA
 bEpN+hNT5dC6QR3Ebdo2QERtnL4kU/j4gQrVy7WmUGE/mhqQe/gZGzAVcDzziJmiIWt3USZI88A
 WyAEwCSBa/4u5IpwoSGCyUxsA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1733873567;
 bh=IDSpj8RygqvldB0i/e3R+0J20DL9ARjfa0inkF8a9R4=;
 h=From:Date:Subject:To:CC;
 b=qSc50tYfNzSj8ktZKlsXrl4+YkxESKaVHU61xlPgBRMcYb5vfBkk87FjOqdgdb+RM
 7E8oWU83ocMvK6+r3A6DCF5oKvt0836gZDtwJy1wxEkAK+6UjLRzTAeqTZOR5ioUd3
 jmwhPlNfqc15ar2mqC3qV0EcIIIeJ3ANAg3z1nGY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=qSc50tYf
Subject: [Buildroot] [PATCH] boot/ti-k3-r5-loader: add host-gnutls to
 dependencies
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Newer versions of U-Boot may require the GnuTLS library to be installed
on the host machine during the EFI capsule creation phase of the U-Boot
build. Add host-gnutls to the list of dependencies.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index e426f039e021d..db5c3cdaf8b65 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -46,6 +46,7 @@ TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	host-arm-gnu-toolchain \
+	host-gnutls \
 	host-openssl \
 	host-python3 \
 	host-python-jsonschema \

---
base-commit: cf3dd3e365d5287cecf08a1b35394236be297148
change-id: 20241210-uboot-bump-2fa3ef07669f

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
