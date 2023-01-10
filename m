Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F49C6379F
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 09:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 220B240A59;
	Tue, 10 Jan 2023 09:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 220B240A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2lJxnMDwczc; Tue, 10 Jan 2023 09:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51E1840A45;
	Tue, 10 Jan 2023 09:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51E1840A45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 321871BF86C
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C0E9812AE
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 09:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0E9812AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8vPLQlBdqNY for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 09:33:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052F4812AC
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 052F4812AC
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 09:33:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myU4o0GkWBMyaNcpN3KF6nDvDHiaxpAS8jUlcvmebCRXlquY23qN2TcwrghpRLFFcL1EKQjA0y38y98lm6g5zsT2Mk2ou64wrf6RsCdwy2gUc2ZjyWw/t7XAjSi1w4p8VIMfZhoCzQKG+H4PkHRd8IUMZb+aRidroRMFUt2eUQTdodMFQryQLY9To+q6W+xuCIZ21+AultQF1oe3exeSjNvh3+sug+2ZDv2waWuB0aTxb7MExWEOwojkWMYCjDGtDjf14jc6W+gxextXRlcS0GLqC5P0NxaqKmHzjYy7b1TV3Dkzv2+M3IBqJZiucV79XF9L3jOPpxp76llLz2wrYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDtunONSmBKTTKuYzOyIVy/SNOEA89n3iAKddHhVqi0=;
 b=C6Ax0l6V1cYGo1HzMzsCcAEZo/7JejXXkDJH1HiPvypGYVP5wn36dhilHcc1MatPqHQczxD+yLCq9aaD/eqsid2wZsNdMFOUSbRuPfOjYgVCtL4RFZxCBeH546pqmkStdKn3guRtEg2dUvzCUvNwleGTg96nHL7D6Hkij7kQWTCscK+EqJuP+XateKerDEXF067MoLl1sWZJyDgego5bpcMxyRzY6GsEhccSXEfS11KCQxh0PNu+6nieWLKAYWeXTkxvwUBiFq3+gYAoO1G2zYHGSI2MORcXjxLyZ7n7YiOgH7UF9eXy/s3Vm5MfFtHr0Mv5YfkA7CVZj2jvGVfWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DBAP190MB0936.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:33:40 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:33:39 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/3] package/freescale-imx/imx-gpu-viv: add platform
 specific drivers
Thread-Index: AQHZJNWRCyis/jLtS06sfQYAr93b0g==
Date: Tue, 10 Jan 2023 09:33:39 +0000
Message-ID: <VI1P190MB0493FDD823C21285E5D1D60D9FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DBAP190MB0936:EE_
x-ms-office365-filtering-correlation-id: 486cde1c-c443-49ad-3016-08daf2edc14e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oXIoxGtp/UyvhdKg7U8xn9xtxT3sOnMUEdwuyGpUahn/4/B2fuPGoF2rk4qeGlILYSR5Vm3AbKQgo3HpC2FuJidgYo4B8UNC5nR8Y3OdnG1wiTRmCdBU7bkMYHdt8O34XBSj9+k9RltmTTX7Nk3Ak8tOD2jNTc5pFyM7+NE/jWaIxAgjTJOXknyBsLurmuDG+M5BH5L9pCg2Vq1kiVtdrChayxxsXznDPiqe08DJmEE9OwV2HJB0QdcGcZtQmWldA9ZCz9mC5Do3nu3THcVCn0x5J8+KiKGVQDnqIcAmKY8V8XJ5mbRHp+XDncrMXGxAbh8RcHPDsMIkTBtRz47peq7bybPBGySEXr/SvxirR1WV8mSGFHKYog3F+n7OOPWmzAuNRS9s+e9qJrcYyuoF3tz8GBc3ad6lJKYAwr/l2Ttxk77AqVoBErM/+E/njNzPu3hlbLF9HXQtCk42wqfLcODA5w4RY9HTVl+jN8wRCKHkVH7o0Qb+sDgf44l+SuuxTEuL504r9Sxz8c5d4VutULlbNtF82ywztWroyeGlPTVhMOF1VESXcjoK5ov9Ro3JmGdu+9CPxa+kISYXcLkFvyLH/LZOiOSS8TZkYIR4o4LFvkfDLfbzSrLzuH6yK+EXgbHl4NVSgWXSXTFKF09oVEYEthHb2xAnFcNmxUFVRGXP2SvAivqPD39fWEG/2H6pKfIUuwbw58JFvcn0uXv1zQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(39840400004)(136003)(346002)(451199015)(33656002)(2906002)(8936002)(5660300002)(52536014)(41300700001)(122000001)(54906003)(66946007)(71200400001)(7696005)(76116006)(38070700005)(66556008)(86362001)(6506007)(38100700002)(186003)(55016003)(8676002)(4326008)(26005)(316002)(66446008)(64756008)(9686003)(478600001)(66476007)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?shQ3bA9urTHJVbKLmByQj3cwQlkrKx3eu7XOdKiYWETxONmjNWXCT4qZ0S?=
 =?iso-8859-1?Q?yPUFypf8yQjy319ql/KOdawMoXswX4GeUPe3VZSH/K4HErx01hWZZCxO61?=
 =?iso-8859-1?Q?EwN6bycomlLq4/MIWEgpTYVD9DIfDwDp91R+4pyhuPa0cr+AfSvhrvIuxz?=
 =?iso-8859-1?Q?+B31fahiJgM57ybSCZsWw9oxnI/I+X6t95X2nd13YhYz/3CzbEHe7vSSLL?=
 =?iso-8859-1?Q?uSg0JK8yO8f/OcUbZ9ZJA1iyq1sW4fVpPtR0vct9aM0tBRR0wM598DObp1?=
 =?iso-8859-1?Q?MGW0fvAdTmJEyF7erlXB3G2wZLDxJyIwOoc4PqomtaYcl7u9/3jWkYyADk?=
 =?iso-8859-1?Q?66/rALl704l/RiZC/D3ixo9YLabaVRrnTRNIPNyMXBNAA9WMcb4+SOoWIi?=
 =?iso-8859-1?Q?T4h5RtmCDpkuK14FhsUCtJk1pQsrscFDeOO3uY2FtkDdS6dB7Y9LrQ3B2S?=
 =?iso-8859-1?Q?V9Ny1/DHOoTWp1/V2c24/yF8jXpwGL8JwcTCNUdx67E8flV1g8qH7+dpTS?=
 =?iso-8859-1?Q?wYVTq8gFT7X5qWZSH3izRlyOz1osfYe1V0XOWcaVFuZkn7q4TNdneDJxI3?=
 =?iso-8859-1?Q?jrl59q8ENFJzLDf8dEowxKWUbFfQcgDbPGT2Ng7zmm02N+UAvbvSHxH2Di?=
 =?iso-8859-1?Q?irXIkqx5obhPRGPwonNzE00qTqbU4PtzU8cW2VnwYGD6vCBSBA2F96dya8?=
 =?iso-8859-1?Q?sBmAAcUXiZyLyV2QLAMQTPHB2XJE1AzTlz06Nvu+StipmwVaQpPIkgLLnU?=
 =?iso-8859-1?Q?SMrXTs4J72M13+lMy9aSdm9VMbcxOiHXEKHgBF2rMFRJjD6rqqtI/vW26p?=
 =?iso-8859-1?Q?QVglaf6r/Ss0d49bIUu62QLIgu8QZj6/3cbCmV17a6j11Ks3IyMSmeOR6K?=
 =?iso-8859-1?Q?E0bq8OxTA0HW6WVvPgVt5Mgyq7gIdt0NUvrHbmYMuS681S2akcCq4l10aQ?=
 =?iso-8859-1?Q?Wvt0P/GOWuhGnm3aEntzBqpDCIJI7O06yt7gjDtE4NPGvYP3sM1/u87f5l?=
 =?iso-8859-1?Q?ic2lTo8ZAHdw5OxaH5UhVL8lIi9OdkxvxNeGCSA/mALuoJroKxI2tnvt98?=
 =?iso-8859-1?Q?Dz2A4fAeiAHHRYUwSk1TBezOIuFvf7CZsTUeYzprxi1ngIhT3vKo822VFh?=
 =?iso-8859-1?Q?2QgQaj2kGWa8xvlUC30tXG5Nsx1uJpCwonV32b4cJPR2O/r4j2iSZKGsav?=
 =?iso-8859-1?Q?Hf/11lK5UB3IZJwJ3jh0A+k5SSu81fNwp+L/V1ZGH2Wy92z5sivyBgIa2i?=
 =?iso-8859-1?Q?41wcwsMfBFg2vYjfqgLeFPCbZ8PulJVviMomp0kzZf2ltelejMjlMAhRcF?=
 =?iso-8859-1?Q?Ux1oCTUE/Nw+oMHZyXiGFFJkmYAPNr1wdQa9Wggrh4GgjhQFJld3GwAfo1?=
 =?iso-8859-1?Q?+/daP9mZx9joKlFy0xCOckvnN2W/LQ/0eHdxRPIZhyEmQD9/nyKT0SIja6?=
 =?iso-8859-1?Q?8vFU9ETX/rBB/r7HRX+kOiBBjZmSbnLwcnZNaMaCSdeVmQIoyajI6e2diI?=
 =?iso-8859-1?Q?kwxLFfhSZIR//y3N/baKqgEc5RYuWDN5eUMy0c/lAzD6RfNmKA6iV7ZStR?=
 =?iso-8859-1?Q?AaWNJiYqDwSNQ3FJ0AcnlnsdxurM3OFXjyd8w2vH2e/dV5mTvCqKBPRnmM?=
 =?iso-8859-1?Q?aPVcCZZWUojiI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 486cde1c-c443-49ad-3016-08daf2edc14e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 09:33:39.0019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ERTN8lkYIRB7wf6lQdLCeCBVzosg8prJlv1rAid9ELZOLwghV+6MsVa7ObW1vr/xwcGNx0FNADg8fSw67hNj7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDtunONSmBKTTKuYzOyIVy/SNOEA89n3iAKddHhVqi0=;
 b=ujgRh02GdSoA01bC5JDmBIhZ+QxeJrwoAauUy381eX3Lbi0aBPXX4DZjfzwj+6a13DRG/jdSpiKdJt6jNE7f0eXiHU39CAPmYL9f8PP5IL9sarpeBl4VGz/yTjrlCulWRlrxFWZcgFDRkoejCvK/Z6tyRpJPvN3J8H9YCu4dm2k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=ujgRh02G
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 3/3] package/freescale-imx/imx-gpu-viv: add
 platform specific drivers
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since e8df0f7 (package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p4.4)
the archive contains platform specific drivers that need to be copied
and included.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/freescale-imx/imx-gpu-viv/Config.in      |  8 ++++++++
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index a245a1d089..89c5bfd634 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -77,6 +77,14 @@ if BR2_aarch64
 config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "imx-gpu-viv"
 
+config BR2_PACKAGE_IMX_GPU_VIV_PLATFORM
+	string
+	default "mx8mn" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	default "mx8mp" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	default "mx8mq" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default "mx8qm" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	default "mx8qxp" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
 endif
 
 config BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 35929b0e5c..52ccbf6f59 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -51,6 +51,13 @@ endef
 endif
 endif
 
+IMX_GPU_VIV_PLATFORM_DIR = $(call qstrip,$(BR2_PACKAGE_IMX_GPU_VIV_PLATFORM))
+ifneq ($(IMX_GPU_VIV_PLATFORM_DIR),)
+define IMX_GPU_VIV_COPY_PLATFORM
+	cp -dpfr $(@D)/gpu-core/usr/lib/$(IMX_GPU_VIV_PLATFORM_DIR)/* $(@D)/gpu-core/usr/lib/
+endef
+endif
+
 # Instead of building, we fix up the inconsistencies that exist
 # in the upstream archive here. We also remove unused backend files.
 # Make sure these commands are idempotent.
@@ -59,6 +66,10 @@ define IMX_GPU_VIV_BUILD_CMDS
 	$(foreach backend,fb wayland, \
 		$(RM) -r $(@D)/gpu-core/usr/lib/$(backend)
 	)
+	$(IMX_GPU_VIV_COPY_PLATFORM)
+	$(foreach platform,mx8mn mx8mp mx8mq mx8qm mx8qxp mx8ulp, \
+		$(RM) -r $(@D)/gpu-core/usr/lib/$(platform)
+	)
 	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
 endef
 
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
