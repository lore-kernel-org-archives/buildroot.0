Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FD5C46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 08:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A51481453;
	Tue, 10 Jan 2023 08:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A51481453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4q1PbfLZJ6K; Tue, 10 Jan 2023 08:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6A98144D;
	Tue, 10 Jan 2023 08:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E6A98144D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6841BF322
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 08:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5187D60B0E
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 08:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5187D60B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyQYGaGtnQTt for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 08:25:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1738360B0C
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1738360B0C
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 08:25:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7+BIOX4eZLU712An1jEdVMym+oNjmSNAzfsafj/77G0bCJ409e8Inbv36OvLa7z9uZ7navJIOXOIurTFv6F8KWiGiJnr6QemyJzAcHOV8DRohreEdkW4LpaI+QvxK8owPwbHAHF4j2FcDCvhOKE8jMQi4xSSTSQ/1RgH3BY2kHo9yCs2JSHSa1n8KrWdWFmAMKng5Pytkms2UG7W6sFPlcjOpx/8l8/Ji1aQ1iIsQ0xzXf9CBo/j+qL8MxqDlIN030zWe7VPunw/+usdDl1qs7BCbaU0vPc13vr8jlvPX/0JWuHR+AxrIvbi4FZ2wGiFm/cg/CZRDR3J+zI+g6h8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpKOJirlq00dC5doPp7xGr1M2AoB/n3TQaD5Qt72YYM=;
 b=bSkfIPREzm9X1912+y97kgXz9GxFypnb38LeeT96Qg23juoEKcQZB2Jzx1wooR9ZLoNA5i9qyN9eJ9CiCR4b/2FFxRK9iE+h4JGyKmYsvQIeHcCnJfJBOMmfZBM+24BoO+EMshdxU6dO2ehzGiq8urKWUXD+aTZ6T0hDtGRijaVO+ws0k28/RwtP/MQRlCTUnm2blOf4LiHI/gCLwXyVmWr0W0MQ+xAbN/ri9JRM8Ep2mp9+BV4MSUNjVwvyrO9GPqiSUsrhM0jolpn0mKcGHGTltEsP+CZJ5Okq0EnBIshs9LdP0RaduRHizZz/VVw/k8MD6lqy+3LVZ8EAATeMew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:25:51 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 08:25:51 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig: fix linux
 dts name
Thread-Index: AQHZFfCa8cfatk7M0EiB7meU6ntG7K6Xbe4w
Date: Tue, 10 Jan 2023 08:25:51 +0000
Message-ID: <CH2PR12MB5004E3193F4550419DF627DBF0FF9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221222103144.20516-1-neal.frager@amd.com>
In-Reply-To: <20221222103144.20516-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SJ0PR12MB6965:EE_
x-ms-office365-filtering-correlation-id: 6f945ead-a035-4b09-8677-08daf2e44905
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EP7R9CplHoQbe4CIivLckMRkN9f4T4BHqYL/VmfuOaODNSAdjd5zsOGz8nmKPb4zSqmaUgnwtHKyKRNhiupqEU6dBUgPk0RKMMlOPv9dehxiV7mnA0yk++leZ0eF7DrF9tQrwcfDEW3bYzBuMB835smDnILcTjd/gQDPpGg3L2xJbt3P2PbGkfXfj8IxTG1LPDkIiiaEH74QODSO1Y5i8LjDxFAchHHlTXXyfc9RY9q4E+cbFdB7M3B6HemkGra5qZ0yYsjKy4x+feWGX77ZuRiuEMxbn8bHZ4OzIjk+QcXbbOr+B9QeK0Uo7ICb9k7MN+Qppnw5knqxOpV2hLq+qAv3n2RnP/SQKXIX3k4VLcexG0BrORW2aFufPOFuOg6113Qq0o/m2ONqOAuICCYr0wRNsArZMOMdcr6v9xReJFt1nWawFk9FFHeqC/KJQ88ZF16ij5CFWmglaHvdb5f5I79bH9xvzjZxrUcWKF5cll4wXm5uRaBikRv/uUX3ng5zxSnXs614YE1fy7swXUZXEAwB3GiTmMvZIczy/NslVyW3kqbKCwd3X38YaFhuZeIrxT+71EHMi51CiZeY/ZUVUAVJVW+uu1WHkddyvqTuj4MTkBCD//FZ+Qblju6gfJY4U/QyP5qfxCSEGULlpBr+pCadWPVFPrYRubdo6ehDsyOYssdWFbwhgMnNX4vqXrFHoGEEcWuR8OnMTXAPJqiJr8hR+PmkIeuU0DY1+SmJCmE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199015)(6916009)(38100700002)(122000001)(33656002)(83380400001)(38070700005)(86362001)(66946007)(41300700001)(8676002)(76116006)(66446008)(66476007)(64756008)(4326008)(66556008)(54906003)(19627235002)(55016003)(8936002)(2906002)(5660300002)(316002)(52536014)(9686003)(966005)(186003)(6506007)(71200400001)(7696005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+GchUWpoaMPuxgUmjECM5tRZM6HdqniI+HOT/x/wUyMn9ttBD0et5mwx3tYp?=
 =?us-ascii?Q?ZpKXlvQhr5mQK+BYglKufyiuud7mEBVTL3gSQOIx0oYcPqwY4Xi1rj1S0yO3?=
 =?us-ascii?Q?cZc3uM3iYSORTemUmuzoaR6w2Ed6UXZMr5zh9GVpfrziFN0RDOJtX+1K1LRn?=
 =?us-ascii?Q?rOZKntN4l3g5PkBWEW0MJ1Su5quFTDWCQVjnO8RhcJIGOXw7Q6mnszcWIFjn?=
 =?us-ascii?Q?HjNct4x2u2x68fRQ9rFRJFzK4a8smx3WO1z+84gIDq4rNhzPWuhqgEH1DEjM?=
 =?us-ascii?Q?wDpxL5d5miI6fV2Hbagadx5cCm61BnNHdLfEk4OF0NlwB1aqI/BVnIVxOmN0?=
 =?us-ascii?Q?QKuaexSPGVKq8ca8gtvpam8HGhYRCCagn8tYXTp7sjPRtxGbqCWfI9wuIElQ?=
 =?us-ascii?Q?KZ4puPhaI5BPGLWSxczaJAMarjviAmnwlcJ7ftV4a0sGgNUhRr8Uf8fCUNju?=
 =?us-ascii?Q?qlhuqEDE5YW1uwGPteJTA7+QLNDNIaq68DKOjK8M7kRYckzZ0JSmMKJeYsnc?=
 =?us-ascii?Q?8PODAL+Ba3SAZ9R5H8dZxpdkSO6kI7rj92bFZ44YOFUeRAH1V/ictL32C0pD?=
 =?us-ascii?Q?+TkaXUmQogTnMY95Y0d5KyLOIp+/XV1RZb7scTntHOd1F92UCYBmQ9TMDSSs?=
 =?us-ascii?Q?f4RvQ1fvEVNlDAbMlh/WZvIqAsDpGNzPoldiLUq5OoO97+yK1H8718zAQWnD?=
 =?us-ascii?Q?p1Jw73OWBGP03Q9b/y5HZnwie2nKNxcsorlLJUixAPPD70rPPQQt9ZWRW8Fk?=
 =?us-ascii?Q?29n4ppsELx5nrdfTtwfRumn5fy+eh57ianXDoRSdBmDuZyh5VWB75pPh2Ivn?=
 =?us-ascii?Q?7sC4X1r74y5B2l6adQk+7lcIkXixwblpWCHU8fHxx6jcnlailJIsVCHU0SG1?=
 =?us-ascii?Q?E/rE2RCndVMu4NTL3Y3dTU6xCdj3zo4EixiU8R6HdFC8YcNzpY8ajmda5Xya?=
 =?us-ascii?Q?eD7lTLUQ/trX1hBL3nkkgIeQ1/C6CrMk91EMC4M1zhVxk96vXa0cbuIDHLJr?=
 =?us-ascii?Q?dQ99qoPGVdJp7pwuDXp+/M+ks6yMC9obaRmMmUmxDFEzku2lo3AAVIPxrfC1?=
 =?us-ascii?Q?5hX8erGh1yCNmONAY113JAKGuouvEYU+L51RJa33wohfneXUVX5LN/AG7P8y?=
 =?us-ascii?Q?6QMOm8/nhXwNzJIE2BdgkP2jdzQ6II+9pOmYC/Lqa5tiUq7hZXD/50AQOtUJ?=
 =?us-ascii?Q?dDdPAZJv55vQ6CscbF5ULYNDkhSI37NeXUka6nXyfKw8ETWmV6SqC2BIdZ+S?=
 =?us-ascii?Q?xum0YHCvXRwA7cJrt9wng9RpvODy5nh9Gea1aWDzEZ5blqCoEMqCrs3BPG6V?=
 =?us-ascii?Q?rRx3j8cJ9718Us/BlZcbveqzZpfpnE+3l8ffUX5K4yn6JzHJFVi4hKyZYS8W?=
 =?us-ascii?Q?mCZMnYCiE6E3rzMxhqc/kwRmqI8q8/mcDGs8eG22AtxCncJYSgaClfOk2c1T?=
 =?us-ascii?Q?AivUDuzC2QVYh9bXaXa1mBm5zs+ixr7XkGbes2jTXN8cXyurP6rsduTK1l19?=
 =?us-ascii?Q?Go1yYLls+mMA5cc7dck2Cp75SlqpYl9dZk3MLTWcmUeaaE1fkXmQqtkiSp4O?=
 =?us-ascii?Q?7r0kebxo1LGLrtNITUsFBlfyqMayMMA8PBkt8NNoaz2QRCWRaO5npmpj3vlp?=
 =?us-ascii?Q?y5T7HTiXiLhaxBuGUy1nf88=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f945ead-a035-4b09-8677-08daf2e44905
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 08:25:51.7754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMiaj5VYklKvPn44yDBkacL3fnaW+OTamLmDlwufTlxmgbs6vbSDRuFdzPBfTNA8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpKOJirlq00dC5doPp7xGr1M2AoB/n3TQaD5Qt72YYM=;
 b=IZH22auQNr8zztW7mc2ul4bxi92xqSAdLqmQ27M+4FFa16sqMYf3FFMAP213CzI+I319HTVYRwSbZcP7ntNUvUUg1G1y+VvTj9NtYcWSyWRUdsL/Ub1qccZA+Rh38zVFHgnjLyaRMs1940+juGHc5yYN4pZGLXBdZ1dgt/x6/Wc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IZH22auQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix linux dts name
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

Just a friendly reminder regarding this patch.  It needs to be applied to fix a build
issue with the zynqmp_kria_kv260_defconfig.

Please let me know if you have any questions.

Best regards,
Neal Frager
AMD

---

The Linux DTS name has changed for the zynqmp_kria_kv260 with Xilinx 2022.2.
smk-k26-revA-sck-kv-g-revB has become zynqmp-smk-k26-revA-sck-kv-g-revB.

This DTS corresponds to generating the zynqmp-smk-k26-revA.dtb for the k26 som and applying the zynqmp-sck-kv-g-revB.dtbo for the kv260 carrier board.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3477506541

Signed-off-by: Neal Frager <neal.frager@amd.com>
---
V1->V2:
  - Improved commit message
---
 configs/zynqmp_kria_kv260_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynqmp_kria_kv260_defconfig b/configs/zynqmp_kria_kv260_defconfig
index 5c53122b46..40e422a0e4 100644
--- a/configs/zynqmp_kria_kv260_defconfig
+++ b/configs/zynqmp_kria_kv260_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL=y  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/smk-k26-revA-sck-kv-g-revB"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
--
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
