Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD13C43217
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 16:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524F541682;
	Wed,  2 Nov 2022 16:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 524F541682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJPI_jBqp11k; Wed,  2 Nov 2022 16:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D8741568;
	Wed,  2 Nov 2022 16:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D8741568
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03F8D1BF591
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D12C341550
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 16:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D12C341550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t2Tqxy2uXUCo for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 16:11:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D915941568
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D915941568
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 16:11:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6mxAp/IftRLAIhF2u+LRFt1TR6nP4DB8TtI5CJlCmy27i48J/ETwFC8dDvprjqqD+Nrm1RS+LJ41s2S3A48GSyPNhdQc0rx6C5JBc5BZZ5hkCcggCLit++rgVbWtTatVbUOWRtMh4stzdtYpALYv6YTMnAOOX1ZyMuaLNZgrCpz5g2SCQD33E/TIdpmPrIf5wu8g3kMX63gHjVaJY+lmNK/q6Jj00V53Y77+M1xuWCF41KoTGUdP0/6xEC4su+p/jwRxGsGo8/PlOSlBUE962oAB1HgTKi1jRFp3z4H+4aH280UQOmnYEe9fyeN3vWQgyGTpdsK8+/i2KYhQ41XmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMXFn19sQnzyQw26djSpRxAckMSADQqix/yCwNXWxLo=;
 b=g1Q4a22OfRwX8jlsmtOT03BuMqPToLvMIFlNYPRnT/uKAUB5N2jXDtkBodyb/hktFUHazMQP11GztJIBHZQNNdiQovalFDcOqP01bktj1etGp4njUqJbtJvDvN6J+yeoF/qFIevc+yr43T7pMuRryDy4l0f7HxX7+sMT6j8piafO9PcMyOtSd7BiF7jQydFmsPiclATspmVOXs8J9I7knF9YaNu72HJ9EqugjGxY9BKb4EHiLKxnd8/HG4XZWHf5bqS2KJyk9txEV8iWRZjkNwb66myBuHv7sWwm/4n4rp753Mn/HZ/hWNkvfNeY9Hlr1RixXmhHKg1u6hoLNGU27A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 16:11:18 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::3e43:21e9:b9b3:1000%7]) with mapi id 15.20.5791.020; Wed, 2 Nov 2022
 16:11:18 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/3] add package/versal-firmware
Thread-Index: AQHY57QIHKFrcdzw5k+BQFfLZ6/jW64r26Vw
Date: Wed, 2 Nov 2022 16:11:18 +0000
Message-ID: <CH2PR12MB500472172D450A3AFE1DE8F9F0399@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221024142216.31273-1-neal.frager@amd.com>
In-Reply-To: <20221024142216.31273-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN2PR12MB4391:EE_
x-ms-office365-filtering-correlation-id: d9a7eb1b-5783-4277-7b06-08dabcece03a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 82pHa2cLAo8hNGwosUCPzjRz42iRze/2pnuuj0qn0nC1CMhhUQ6qVeR16Iz8LwQsl/NA87NZtlKuRzW8rvyryC8lj6vcwKtldF32WnKc3Wpro/GXs3FZcaxbpweQtfNC5CFZhrjM6/H1TU/NfVKjEJqrjvjD7kT4l/mGv0onWjw4RrYFPaG7BCnTJjs0jkuUlI4hir0QvbusO9sr+eFnXpacZyK/q0qOEx6B21ls1HRlxXuje16S9mZO3GCcrYx9BjAJD+RndfH1ltBAldV0AXi/jv3bf4UwmIdCLLQqrwt7IKmd+kXgN9pzapvpdQ+gmBwq6DJuhEj/y8CALlPUSeoJfykgx/zrN4vilW3nmqjiRc2ScoHIlOAWKy395jzvCcQmlUHtQObH8Diy8i0rrUlyehmZdvMU9ViyAUvk16MIhl6dj0xunNklEaLNuFctqQ1pPf4PD+DMO8a7Y261PHrVrh+bkvuU/1YCJynZhgE8lnc3NU68kPteljDzBD7saplcZ8VB+MUu/T3bt8XyP2b+eNPuP7tpvDYmAB1j1MCEf8STfcrJqFPPaJNH3t8u3yQLMmYGTQ2Wqs9CH5n2+ksDjuTmVO4MgwhpImxaowCv8lraudRIz4teckN5xnrIph5GNbxfaytrKOsLUE3xLWy5ADiNR4FWQlUQ9FUtN6mb9jVb+IbrCstm8CRThiKv9fn1zoKkzkUY1ceYuDE4QpX5/lDFJYhhkkSuwquZA5/kvLUJ9BQdK12J+QWW+slMUp0S+YNrWEKwbGAdZ1fu/tOwwur8z/RLbjy7haiwr3k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199015)(71200400001)(966005)(38070700005)(5660300002)(478600001)(38100700002)(8936002)(66946007)(54906003)(316002)(66476007)(2906002)(76116006)(55016003)(33656002)(52536014)(66556008)(9686003)(64756008)(4326008)(7696005)(41300700001)(8676002)(86362001)(66446008)(6506007)(6916009)(122000001)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cPevBzmaw+EfWKWWIff72qkAxI+kuO1pRp7MWlp+9MQJxX3wVR621XtRlk6R?=
 =?us-ascii?Q?Kl+iOXP9/e+Zdw79GmtL/bKbKFgc5sgY3GxtXYGMvJ898WBSFvpohsGUyJh9?=
 =?us-ascii?Q?CSbwoQ3hBbKrlMuo+KRAsjy7HS6WA/A26y2Xbun2haWlHwAtEINZbRW6fAm4?=
 =?us-ascii?Q?Y9X4UrNI/7mMYCCgfaKp1cjwFjxgSbRlxNP89M4PNZx+UA3aW8AaLMyD4ZI3?=
 =?us-ascii?Q?uB/eY1Rsr4QP1VUgS7Gf400xsZPgrRPHhSs6h1C+q/QxXK9yWqq71Nq3oZ/4?=
 =?us-ascii?Q?ycahoPiivCT3bvti2vj+V2Vd76jLAvyhLCGyhUHPV+4WtpvjEO5rxBkjy6mf?=
 =?us-ascii?Q?49B4KM0Zu62pc7WO1h1bhONd7VikAsbmX1W6zSQJ7sgn5qJIYfNSXAYdy2zs?=
 =?us-ascii?Q?DCelrpE3ZVGgLgA4oE1aErSfzl6/oirru6mKhecfpWpHOp7WZWjwX1hYDvR/?=
 =?us-ascii?Q?F87ZyyhwGMPPlyD2q9VVUcYkIPnWsmuuPIu1EeNusTBYUWD0V+KxDLijnZ8y?=
 =?us-ascii?Q?nzf1kNsXd0wkXxaa/pGswFCckIwijvjx8YtLZaCMxOUj/H8wZ2tmwrrtbhVc?=
 =?us-ascii?Q?iBvrab1c5taCfbkr0IBOenwg90xasMh4vyhHS+lBT0gimPbEXT2NFMmPlFpy?=
 =?us-ascii?Q?wtEguLxx3ivw90Ah7v44yT5TqvDomt1ebEpQq5hHFfcOv+tWKkdxdVASvAi9?=
 =?us-ascii?Q?5mCE/sPNI25YwL3WIrJT4e/KEZtIbopY/T+tsz2RQFoPBrbJ+/5/yWv18UFb?=
 =?us-ascii?Q?21ckKLObrz7MaSDX0/hDW6OyEKwmy4Tyd6a4YiHgk/nd3XjhB3sQiMqdHiCg?=
 =?us-ascii?Q?748nKmbbpLb5ANn5s5sHyyLyMLkuuMMdVc8cl6O7Hgk82UQO+mgbRQzYafwt?=
 =?us-ascii?Q?rxfXByXFz32LOs7RI0t0qK/DoAAUyWHOpA9ZgHElNxxaMO2BkAhWWgHymdWR?=
 =?us-ascii?Q?6iq7V/2EhcELZjJrJYIqDYhaNH9rRw46XKrStk0K9DGIyfOEpEpNkg8G1TSW?=
 =?us-ascii?Q?pHSpKEM+agOo5CLnEv+DT8X//QSz1opG2zoH/zhVD9LKHX9MM0TZiqe7IKR3?=
 =?us-ascii?Q?TgTLl1JrJDhClAWao7fcGAih47Bp3f5UtHxXiNWUQ8B9xkJ9tV/4X+wB/nym?=
 =?us-ascii?Q?NSfa6VGr7N4qblgzu7I+xYdL/IOLVhEPCJTr5EnQYC9SnMds92QR9bcglz8J?=
 =?us-ascii?Q?2nlYh4eI3DdQbyE5lGJM+WEC+Ui9J4JXF3TzgSXTEGfYEalH9usFbf87feNO?=
 =?us-ascii?Q?xsS/B8wrwKhTwY9+R9feuFJ45Hca3G3Q1cgzk9QjYR97YxBbcASzWyBiMFfh?=
 =?us-ascii?Q?AIHYQPJK4Dn4hdIv9dm+oGNA+vlnUcO6M9qHsiO8xpTiGFSI9ZuwXBeSToVW?=
 =?us-ascii?Q?AKIiCFRTjz/JTwpgCrbX+QKZ2wa3JVs6XgRxMQAcU1AZ5juTV/FSmsz5bwP6?=
 =?us-ascii?Q?F6qru8Il3X9h+ERWgiG1hDJwMRn/RLVc+hbbb2+bhME8PMxIz+1bZxayyr+w?=
 =?us-ascii?Q?NpCa0zv02Fd/zi1VicNwoX50VkL9Tt2sqax7u8hfx7HbPyDT72PMZKBDjI/x?=
 =?us-ascii?Q?YledGH4qxE7OOZoK56FAb0yZVluW0pg3PoQMgrGhBqdIaaRff2qavslJipsV?=
 =?us-ascii?Q?09tc9HngZQeoDCXIRjo7fc4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a7eb1b-5783-4277-7b06-08dabcece03a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 16:11:18.6110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LYHgLevqwzAsVqOANgmm+f5ojiShRFJ/VY5twIZsR0t6cj6SlmkRmg7PTg5cdYGn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMXFn19sQnzyQw26djSpRxAckMSADQqix/yCwNXWxLo=;
 b=J1pEGOHK3HWCV/xtBPB7nvKw5am1lnwO/1+lheAXyTbvloA/pH4niZE1hotvGn0XTToQ4x2w8sL3mNXepc69wmjTPn4wpTnUDI/slJ3Gw6urnxNOE4KkMMievdOpkFax3vR613k1JKHplNrV74itbr2LGk7Gte4m2U6kpeC7cWs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=J1pEGOHK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "O'Neal, Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

Just a friendly reminder for feedback regarding the versal patch set.  Thank you!

---
This patch adds support for downloading versal microblaze firmware binaries.
These are necessary for booting Xilinx versal devices.

The location of these binaries is temporary, and will soon be added to the Xilinx firmware repository.  The temporary location is using the same free distribution license as the Xilinx firmware repository.

Once these files are available on the Xilinx repository, this package will be updated to the new location.

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/versal-firmware/Config.in            | 22 ++++++++++++++++++
 package/versal-firmware/versal-firmware.hash |  3 +++
 package/versal-firmware/versal-firmware.mk   | 24 ++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/versal-firmware/Config.in  create mode 100644 package/versal-firmware/versal-firmware.hash
 create mode 100644 package/versal-firmware/versal-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c8183b2290..ed696f4cd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2176,6 +2176,7 @@ F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
 F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen
+F:	package/versal-firmware
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
diff --git a/package/Config.in b/package/Config.in index e3a34d6e97..0abf233940 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -441,6 +441,7 @@ menu "Firmware"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
+	source "package/versal-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
new file mode 100644
index 0000000000..e184ba1925
--- /dev/null
+++ b/package/versal-firmware/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_VERSAL_FIRMWARE
+	bool "versal-firmware"
+	depends on BR2_aarch64
+	help
+	  Pre-built firmware files for Xilinx Versal boards.
+
+	  https://github.com/nealfrager/buildroot-firmware
+
+if BR2_PACKAGE_VERSAL_FIRMWARE
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
+	string "versal firmware version"
+	help
+	  Release version of Versal firmware.
+
+config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
+	string "versal board name"
+	help
+	  Name of Versal target board.
+	  Used for installing the appropriate firmware boot.bin.
+
+endif # BR2_PACKAGE_VERSAL_FIRMWARE
diff --git a/package/versal-firmware/versal-firmware.hash b/package/versal-firmware/versal-firmware.hash
new file mode 100644
index 0000000000..7a8ea04c91
--- /dev/null
+++ b/package/versal-firmware/versal-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  
+14c505cac0216637ab2d08590acffb4861446e480bdbf7417e699816048ab39b  
+versal-firmware-v2022.2.tar.gz
+sha256  
+f9796efcd98f47fb3e1d5d4c23e224613e91c70207b759a2087de368be50c315  
+LICENSE
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
new file mode 100644
index 0000000000..35dfbaa512
--- /dev/null
+++ b/package/versal-firmware/versal-firmware.mk
@@ -0,0 +1,24 @@
+#######################################################################
+#########
+#
+# versal-firmware
+#
+#######################################################################
+#########
+
+VERSAL_FIRMWARE_VERSION = $(call 
+qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_SITE = $(call 
+github,nealfrager,buildroot-firmware,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERS
+ION)) VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only 
+VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
+
+VERSAL_FIRMWARE_INSTALL_TARGET = NO
+VERSAL_FIRMWARE_INSTALL_IMAGES = YES
+
+define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_plm.elf \
+	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_plm.elf
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_psmfw.elf \
+	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_psmfw.elf
+	$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_vpl_gen_fixed.pdi \
+	$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_vpl_gen_fixed.pdi
+endef
+
+$(eval $(generic-package))
--
2.17.1

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
