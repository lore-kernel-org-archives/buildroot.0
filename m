Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0BCC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB070405E4;
	Thu,  2 May 2024 16:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJuTDEw277Mx; Thu,  2 May 2024 16:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771E0418D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771E0418D2;
	Thu,  2 May 2024 16:27:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D76491BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9191982F03
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6K-sfBaJKY-Y for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:27:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD0AB82F0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD0AB82F0F
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD0AB82F0F
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:27:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442GRD9s063665;
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442GRDMS131048
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 11:27:13 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 11:27:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 11:27:13 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442GRDxE127936;
 Thu, 2 May 2024 11:27:13 -0500
Date: Thu, 2 May 2024 11:27:01 -0500
MIME-Version: 1.0
Message-ID: <20240430-optee-update-v2-11-5bdc2f940db1@ti.com>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
In-Reply-To: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
To: Etienne Carriere <etienne.carriere@foss.st.com>, Anand Gadiyar
 <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, <buildroot@buildroot.org>, Bryan Brattlof
 <bb@ti.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=726; i=bb@ti.com;
 h=from:subject:message-id; bh=yFKgD4noP9/U2A3+ujBpIUxZprn4s28JnAN4WGbX/iU=;
 b=owNCWmg5MUFZJlNZr7I5PgAAZf///r/ve3P6z9v+/4T2X61X09/+/n+fne6/Q5/86//T+++wA
 RsyiHlANABoGg0DTQAAA0AaAAAAAADRkDTQADQAAYQD0mRoDE9NTyaPVDkNDJpoaAGjQAAA0AaD
 RoBo9QA0AGTTQepppoHommRiYQ9QADQBoB5TRo0NDQZTTaTEDINADQDQyZAGQ0ZAAGgYQwgABkD
 JkBpiGgNAyABoDCAyMmmgBkQ3c78tUgEXwYW9Avl2R+I0PCiX0ASBtNusDQPK1YOSO0WzK/URlJ
 TMnRzAy4UiC71iykoG6APJ+LLXqJ4mHd3PIxJB7uqa+cWy/MiVaiIhguwpe/MqoAUnTGpwh8aUA
 3dJnXHsWLM9oMkg9qQ7RxlgE4K4HEHmifREonMkqE5kCEd6r3ZWLjFymqoEy+BMkZD5+XXJ1upg
 lT3gIy5XuSNTdXMhLuyJ+IVEUacZMK8kCpScT8QbNVmkqkZyiLsdIevkI8GnumjtU15YlZ2GDOh
 CJZAb7KNS1QvCnuPfIS+ZX5F9hEu39cuYyF6/QywAWJvFyGPoSqvqStd4NAQashgUbS8z8IvLf3
 wzjzY2XOjU5i0Vj3tarDj1hOsdMDhmV4TACO/ewMF0F8YUocBisAHTfXClgPEMkERVYQanaQG7s
 0IBVpf4u5IpwoSFfZHJ8A==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714667233;
 bh=OCyDTkQtMzNvwIkCTlTVMdGSaTBkMdzo4mY3ckfBYoA=;
 h=From:Date:Subject:References:In-Reply-To:To;
 b=jhXbwnPR4viH2C9nzEq6gz4Uef3MQJo3Sm1YCpkVGpfzfEIRjg6EYFb8/DAX+a2bJ
 GuPs/8inL421NZFwcQVWswwcnWYnk9s8lv1peVxm+KxOSdbkAj1+MQO6iCjWjBSQTS
 tmUF5W6qRVHTA08y0z7nq2WlJ6wI+sE5Rr8bFkiA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=jhXbwnPR
Subject: [Buildroot] [PATCH RESEND v2 11/11] DEVELOPERS: add myself to TI's
 packages and reference boards
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add myself to the DEVELOPERS files to help review patches related to
TI's reference boards.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 DEVELOPERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5d198567d8323..1e3b13c01310d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -548,6 +548,13 @@ F:	package/vmtouch/
 N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
 
+N:	Bryan Brattlof <bb@ti.com>
+F:	board/ti/
+F:	boot/ti-k3-boot-firmware/
+F:	boot/ti-k3-r5-loader/
+F:	configs/ti_am62x_sk_defconfig
+F:	configs/ti_am64x_sk_defconfig
+
 N:	Carlo Caione <carlo.caione@gmail.com>
 F:	package/jailhouse/
 F:	package/sunxi-boards/

-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
