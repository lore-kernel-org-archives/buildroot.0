Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CDACD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B2AF409CF;
	Fri, 12 Jun 2026 12:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jz1p24toq3Y; Fri, 12 Jun 2026 12:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E58F24093B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266583;
	bh=firN7NrRVLYecjfW2Bc3sIpSxHJM6I1fhL0T/BdoqlI=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eR+EaWIBwkbhTVIFZEIrfrUHkFxawh5fgHodz2ucvmqdhvKr+VdoNjGG2jt+uUGkh
	 3Y8AdRTXNHn4hm9VeBeb/XpvNOcKOZnQ9OSLlvP39te4N92x9NEjf4Pq2wIVu3Vi8C
	 JunGyh98k8VLU1oiHWBFYAMdVGBUb+HRGwnLONxhWJObpaTVU/olcf3fMhRt/dUBmt
	 qnjeSTFjFmJcwyp13MC00EqRdjh+k+J6zjR3W/diGXZ8+spMniy81GrhwG0OJatBj5
	 96HPJiSfpCgwV31RWt3zMnWQhBIz22YPhY7K5+b+Q9vl1FQuMh8jlt1+6Wcbi5XWgv
	 jxGr8/GCu54RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58F24093B;
	Fri, 12 Jun 2026 12:16:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D0D12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B16DE4093B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmnQfMfo1NMb for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:16:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::2;
 helo=paup264cu001.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 949BD40627
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 949BD40627
Received: from PAUP264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 949BD40627
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrGXpXcGzJJUskBob//PleXtE8z5+zmu2lFhHYD8wDO6Kjq4q3WrTdWZbaCRad5Zhq3Wlm1joS4+3BSP3mtjChl/M/p3ez1sXG/pdf5067uCOz/dJKyAY/2QfWYJdgEjrm4Tak9lUHnXr8YBX+OIWOmzroviKmwK1ZD09Sa3HBgZNS2f+bctipuxEtxGEb/Mobq8FXJxV9kgXUvTeXAOcc09iPUCBoHH2QZP6+blOSD27UHV2O31+XruDNd5mYc+Axp2CFdBB2axhm5QbennaUJv56SqsHfpDMwHYN9R3jsXOUiR6DSjNtJT3dSwiC4c70coXxJDUf5zhYdocwjavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4c3zeraqnUSf/iTOsADK4qRSa/ybMInaOTuz7ud7Ln4=;
 b=ZDnKJmjYG48d4rlkrAmQHIII9SPocwF6iWisDI9Q0R+B9Wc61lpSkR4mT0Kqx1oWVvvuJR/egpvoHeeghZE0Jh2VmuTig5h4X1t/O0LNnR0noMH1yCLYKyjPZchSHpkpFqMCnJ5bjAm1I5/vuvro481qKvytZSxrdBmcKh1KaaecCPfEP5qEOYMV+dy3JcOjRl1AN8GACbyAe/H3IauMrZ4NkMjY9yzrNtJPYYofHomsj7VubX7acgc1ldSU0xqvrWEJndSoFX2Y8Eu4oz1fkA1quSD8b4e+VF7wC2mlcs5GjqE9V2/duSAiVEyCi3/PUi++OxpzNbIpNSfrFfEWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by PASP264MB7012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:540::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:16:13 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:16:13 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 11/11] package/x11r7/xkeyboard-config: add CPE exemple
 of detected CVE https://nvd.nist.gov/vuln/detail/CVE-2012-0064
Thread-Index: AQHc+mVCxST0ywMoN0qEBZ9Naagl3w==
Date: Fri, 12 Jun 2026 12:16:13 +0000
Message-ID: <20260612121516.1634-12-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|PASP264MB7012:EE_
x-ms-office365-filtering-correlation-id: 490a0460-65b3-4396-1bdc-08dec87c6578
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info: QuIR0WtfcN154SSTNkNQCVSDegCFR8FXA2ZyqtyecMxjUerMd6tkDSEg8uTRzS+bwVTpCO6XF4SOy+EWgO1367AU5FaHjpyVIwpfJc06tJCwE0RGcA+UPXo3k4TFc/M5LmiTmU9bmV0fqMUCThtViUn1xmP31J2Gd1CVpFNM3I3inf3BtAvdbNxAG3gTp7qkOAUdul+Q1k/MV7BdOxLIt3YJZATG5nhtZKhLiKB50jtBU+79K5bEtyUr+w0zU6eT1Ht0U2I6l+Rr/eXRYdoGxZ3ahIMm7nrYnSzztmclQ2AdP5YGYQGd8pjJS2uP3/aXMxvJZ2ZGDYIl/2O+XTusAVNK9VaDRFjYkdxEmcmlTsX0A8YupOlV4hldcMUL6OBGQz5RnjIhFPRBb/Hpr+8Vr4um/InATVQjqZSMtf6rgiFrcgq27dHGmgHDsHNiwF29ZAIQZWZcBEqXuvyKiMJyE+zQmjGFO4JDr0dmw4nRsUiPSi4TbqUZ2xCOcv1VwfeX/2DUQNSGCzZVRxjIyp9f2kr4QeZvr27eXD+iqwYMWblQgp7qKfbN9P+QgZhofP0mIVReOILSb7w4Yj1Sd+n5DF5t+vwiHPQ+oTWjCsuKT8Dny5OI3q/9crpOseX4LJ+K4Hz8ISM294HGsYuWSaTkmGdZx5GID6L0YevKlmCwg6WbiHUQfQ64gUhl3YRnIwmuJF4/uTuDuo3KZt9SEYPkvzz7ynxEcqR6j4PnRlBDriyNoY8wWk6IlGh+6CKO2pg9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(38070700021)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rq1u+AAMLbtCW3sFmwg5+1VfwtYhwRkJU9EejOs0MVCkql4V411JzOEGTu?=
 =?iso-8859-1?Q?5YEawWkxwD1UXEIukgDY4fQZPCJTO4Jc2eRjXVp0Ytfq18i7zux1GVRvfx?=
 =?iso-8859-1?Q?bPhk0zm3gwCL0I46Y5Je2FS/qr81Zy6nhvwybfSCDGZTwA/UGp+Zo/JJGe?=
 =?iso-8859-1?Q?rrvIKqKS1rEOn6dMb3FP83hdbe6ofe8Mx02YgL/Itkpvck24wSSEINfRcS?=
 =?iso-8859-1?Q?8clQ1XVqjoBBdhHcUwSFM2gY/FNDKK2EfklsRJlI/hFRLmcguvGPgw80bi?=
 =?iso-8859-1?Q?pG8Ab9tB4zmdWi/bIv14EvQGFdJTKhOtN7tntNk2X9kuf2rTmReRp6/7i5?=
 =?iso-8859-1?Q?EDYnWadjnd+rGNvkk1PknEXM+nGvxK2RZ41z0kPULWuK9KSH6O0VpkwTMP?=
 =?iso-8859-1?Q?ah/6OihQZ2QrBKHlB0elF8enzvIicw67IHXCmTTIzwMq33ugUzHGl/e9Qs?=
 =?iso-8859-1?Q?pIHIMeMldn589vofxC3vG7hJINr+uNMh7kl/lJu/M5pzUiMTgLkP74e3Du?=
 =?iso-8859-1?Q?XPqcl2isYW6G4JqbxfCP9oUk/xPMrO11Zl3PlhJ0dkii1cZ/JHtuw6j5Tq?=
 =?iso-8859-1?Q?yTMapM2NYdnbpaSEmgPADg/pqSmQkESBaiw2ypt7+8HFnZXxBuglsuldHE?=
 =?iso-8859-1?Q?1ymt836qctVrP1raTI3UT8HGgbL2/JypCZMrVzAorDKHDCjAgdEql47CBO?=
 =?iso-8859-1?Q?RtHEwoQqfQRHAObszYhYTpAJbnlDnD07bvZn0+6ELZviJXOEi/jshxboev?=
 =?iso-8859-1?Q?fbTJRDB57XdCB78nFrLKbFFDC+vPwXISdsJrkl+tsFZgfgoWUxu0tqxqUX?=
 =?iso-8859-1?Q?PiCbaYb9e4QVeX1kAviFnuRZWGhETK/03D7Sd4NEehd2ceF4vEnB7DsD/g?=
 =?iso-8859-1?Q?SuyWRTjQQAlyWppP+NC3IrMudVOWhzpiHRTEEGo7UmMJerIwsSJ77bBbzI?=
 =?iso-8859-1?Q?/gq65N3+GeuSplijHtDbh/0cuEoETG6nsZ8Cop4bkkWS8E88orJpBjDaHL?=
 =?iso-8859-1?Q?zeRz1VDbkagRgM5m5rlCSA84huOAYv6CaAIu3ZzSE1GLNN7bVPVJ5F1hpH?=
 =?iso-8859-1?Q?pAXGNzwJPqbOYEpQtYEa1Y8OBZCLg2CU2nsjbcej8x9V0I7eQeCIL4GSJQ?=
 =?iso-8859-1?Q?QnmLqvqyURfKmX7imKGKZJ4VfvCjhkKcjXVJThze2HtWtpKCypevhQyHQ5?=
 =?iso-8859-1?Q?VZ1zmjm9s9Rs3s2TM2AJ4l3zl4eDwiB+AYeOJPgWlVd42wkGLMz9R7n4bE?=
 =?iso-8859-1?Q?l9JMHuS9ss0ORHfSpfX6FmPKsnM1DVExZzkvGFi1l2DlKY89beCPlAQ//r?=
 =?iso-8859-1?Q?Vjl8zcNL80dLCxmUlk1hvNTH12uVP6u5dMx12G4pIhXgBtbFfKre/vOZC5?=
 =?iso-8859-1?Q?n5s7HqmgodrTmuddL2Ts77kW51zJxNEBQWwpxMyioiW/UKY8Z2ThQA9N/0?=
 =?iso-8859-1?Q?WSeAuIGF3r9oweXC7TK+X2/RKzo/rcWunCQFlifJA/Q3uHxZqE/WDiIQ5k?=
 =?iso-8859-1?Q?/sQF261dpgASrKIOu4RWs+sSdOL8g3vODvIeo3YjFYlritSU44tTN9Doyg?=
 =?iso-8859-1?Q?/1IozdnVBl6Wxf9P/n/9jX0gtZET6yHw89GzpqT2yua4nK/QmAsBA2TbfM?=
 =?iso-8859-1?Q?E8KgYSLV3iGcmeUqDvIIs65rZ0QkAtE7RuiKp5c/4b+b4vau04bBoJYhY7?=
 =?iso-8859-1?Q?NogXroI33vk/Tzu3zd2/Rp6irOFA4nDjvOtez5/8DB0CfN/a65q9DOIZzq?=
 =?iso-8859-1?Q?QKSJLviyU5/qtJzDtQTRNB5f1UnlP5RnSHUG4l1PtATrjiTTR2IXos8MaU?=
 =?iso-8859-1?Q?7dEEC9swaPQPFWT82pp5ILX4F6bUH34=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 490a0460-65b3-4396-1bdc-08dec87c6578
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:16:13.6526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o5StiaqhXuqVMg+Ud+ZICaHQ9Rtv8GEgUEPUo3PFXxvOvFCUYbKPay+O5yfwU76OvLjAXsdfq/DZzy9fOCyosYVxl692EK+l8mgHzwZX6yqStTIwzEMdov89E5eilQSR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB7012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4c3zeraqnUSf/iTOsADK4qRSa/ybMInaOTuz7ud7Ln4=;
 b=Enx4tDxKtBdkennqhUCXOpZ7hJx5tzInAhjODDqF+YuTNjv8jrFSnsT0EMMI/Qsn8ebbIzBNGsbfld+wLzVz5CKkua+ED98PJv7/3FXZ91apvffk5ASwtB5RXpZy+GCkv4iOrrNDH2qilvk9BxFzmXK5r7q1am/zSs0UXMZ5/+0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=Enx4tDxK
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 11/11] package/x11r7/xkeyboard-config: add
 CPE exemple of detected CVE https://nvd.nist.gov/vuln/detail/CVE-2012-0064
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

From: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 7c9c814d95..9c8461b23e 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,6 +10,8 @@ XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-con
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
+XKEYBOARD_CONFIG_CPE_ID_VENDOR = xkeyboard_config_project
+
 XKEYBOARD_CONFIG_DEPENDENCIES = \
 	$(BR2_PYTHON3_HOST_DEPENDENCY) \
 	host-gettext \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
