Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F172CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 12:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9145A60F71;
	Fri, 12 Jun 2026 12:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_fxjPd94Iw0; Fri, 12 Jun 2026 12:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E1C60F24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781266561;
	bh=BOFKQmB7ZHSU7s7aGNOBQtc3CjllJmao5Xb7DQBRhoE=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=axCTY/hWhvjhT0XrGN/ZyS6caPZ+VGIHKQuC8qSzSrd3byA04KupV5PErPbWavtfG
	 xwW+CPNEv1wK+CHFF1wq+anSPl4Xqc2NBfpWZVrhGpMGZxhlzhLfukdQ7mbfmZf+9F
	 FAaNJZFy9l3OyiOHzai8Gb+GG1gcqwfIQoX7/gE8YOD2Mmpu6lFUerNVJI1G/dtbAs
	 veUWVvWec4k/dFuDE6ue4v/QrRJqzEU5BTPT/j8biO5QJs/8ysnvcfSG7MTHzluyYr
	 2MfIucP6VtwmoFnmHqWT+pmfSRlI2K7kF1ZPsvSzEjYuEJhlJaWSbFOZpSlHLQsRCz
	 i3BDq05km5sxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E1C60F24;
	Fri, 12 Jun 2026 12:16:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72A1C12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58D3060F24
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7ICe16qa4gR for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 12:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c20a::;
 helo=pa5p264cu001.outbound.protection.outlook.com;
 envelope-from=sebastien.guillaume@vendeeconcept.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E51260DE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E51260DE4
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E51260DE4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 12:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYrZcrAYtyqIb5lrJjRntda3M0Axubp0lKmCcqKbJTqfPsgMBKbJH6/g7N7pVgIEVBIcu/PG9mBuxpM8NXRsM/M5aDMfmUt1tCsDgN1l7EOTfpiIdvx/SyocqZwzuiselcK0hMPowudXLkmApzXs6QQ+3KjKD45RyNSBq5bRQn2wasUUoI+7rmxBOf38IS0JtOpjkBBLeSrZ7ZeuGmDUuhDNK3CCTvjZoMCJKgOr3iRqiHmdLcbb2dsusTowtOlwD+Dcvk3aYPniRcBYPcweQYWJJHtWLEtXgAodEVkrkeiaaBH2VPZ1vbaxx/O0WQ+Pc/Azqa7SDR1bHkV9Bjdr5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/ruWObz5LJh3cHeXekcgVck5jhx2/wbATfs4CkpMq8=;
 b=vcaDkdzU0JIiGO6a/txi6aqftHfHyGQOtiRZdYj4u9uIVNuQrJ8/dVro9vAbYXPzPgs4ZlaZULdn+g7Dy5EO1ZumXZVBOv87DpfbdpHFQtBvMeOeTab8yqZ43FXDU70aIUsgcFElZfYkVZ4VWNm8lmAJ3rAH/6lptbWgcp5JmxTpvDnjBVtiu0TJRyYOZfbfySdt/vMnm8hpG/tBaUZLq639j0xHUYw8Vap0t6cnHVkQGZagwqio5w3PbrsbxfO9jX0PKD+xRmJ/nwf1cSiPtjrhfbU/RMIMj59o1jBt1J3cHfkB3zmknYR8Z20c5kY7nG/pjzivG49ekGWqqvu7hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vendeeconcept.com; dmarc=pass action=none
 header.from=vendeeconcept.com; dkim=pass header.d=vendeeconcept.com; arc=none
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::20)
 by MR0P264MB7389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:15:54 +0000
Received: from PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417]) by PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
 ([fe80::dca8:c446:9027:e417%5]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:15:54 +0000
From: =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 =?iso-8859-1?Q?S=E9bastien_Guillaume?=
 <sebastien.guillaume@vendeeconcept.com>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Jesse Van Gavere
 <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>, Roy Kollen
 Svendsen <roykollensvendsen@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 01/11] package/gawk: add CPE
Thread-Index: AQHc+mU391sFfSWX3kangVzhiwFJuQ==
Date: Fri, 12 Jun 2026 12:15:54 +0000
Message-ID: <20260612121516.1634-2-sebastien.guillaume@vendeeconcept.com>
References: <20260611125307.988195-1-thomas.perale@mind.be>
In-Reply-To: <20260611125307.988195-1-thomas.perale@mind.be>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.47.3
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB3055:EE_|MR0P264MB7389:EE_
x-ms-office365-filtering-correlation-id: fa6c79ae-1264-4455-b3c3-08dec87c5a00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|56012099006|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info: muPjrqArLDnX6GJ7s3v6WR9WAAlXdc/0GO+nBrMwkhwe99kbVk2z8t2a1p8acc5JzX28hglVx44JvqI+WvAeYWZxvorRtK+8w7iA2p02iavWqIpeE0fbDB2edNNz+dw2fqnR4x3LIr/tznC4+/bymkCGCLIQfiCKUjRSnBWTIRdkxYDbpBqM+lLGr8fTWiwF36xCxGUfLGbRdOCL2PfKqkgt6uSP0TVJl6lfIn9j3A5ujKcX9t+JJhUIZiucASwlWq+bv+yAgwf6rLuAp7s7QliYKcfUzTYVk+RA9NA1b6Q7KUn/ZD1NInGwAbSeA+9zlzvsS2xLn4dfkOOSKXXFcW6oAAZ0aZOVhWGY42yX62rZaXc0i00JGx6EYjFNFNOic35lxybyq762R1vEEDexVGmatwyySexAdbbvvp5CAIeBGu3kMAUktUgvAJAOtmaP/lUWtE3y7KLre4QZk6gUGgoubpXMKdfteGNkNnAlOaMnehC6nS1toWrgXYlRyISSGiWsGli+731QvgXxouDZEyF5zAfMdxMa2NnpRoQrsnqA31VOqfl5iAeZKsZlz2f8JWgUu4baZjA/7ZT3DbhUYgMrlM8LG7IyyASvE6JJZpO61zffcjyHoJ9XJzen7MX7k68Of+XfrKOGug+7XRIrt/P0e6GbDhNZ5zSx4x37vrWA5GkcsY1RKbb+tzJ0Xb2XD0jEaXDR6K9UP1rXguCewzHd4+AQHMLnKcge37n8b+/moTjSUPipTC80S5I6/y2x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(22082099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9di+WdV3GqF3ZCa0gwVONB/yvkPEwczHOFPGqkwK4/RkiWMAvICQ4I6K+V?=
 =?iso-8859-1?Q?wS6LYQweOmh+CLfVNx0y1RFEv4VbglO73UKQC31io7zh6C/pxyypeq/H9K?=
 =?iso-8859-1?Q?Mm6JiGiVR8oTaT+AhCMZrJwFi9yfI/kaGtphDEiIClm8eU5c9HQaPTsxKo?=
 =?iso-8859-1?Q?nf2yRP/UoQgMlAjCqTo0r9PzbBLt8W8bdlNHtYWhZWKpBqP3VMXAF4nXnO?=
 =?iso-8859-1?Q?NYZUb7885pDqJAqgEslehBDfXKKeYBLyn/I+yfNFU8Z1rFwjDonFfKcS6G?=
 =?iso-8859-1?Q?UK14umyiw9nC6sPRUwhzdApfE5hv91QiV6VtYoamb959D8AOLP425rLjOk?=
 =?iso-8859-1?Q?Sjy5uwLx5xMrNanrJPyHXxB5+bjR3XQSiSK461OE7WdCyA65dGJ1ED9TBH?=
 =?iso-8859-1?Q?3qCZ4V0JC+LeRRA3C05CJxzapg+8ufNeqHdkjZpPqlJBDyANaKC6ep0URK?=
 =?iso-8859-1?Q?gbMd61EnocJ2SA5PCuRDwshwi4Q6rR3cYWiFkhBYd5KVO2KIg4VBd8/UXS?=
 =?iso-8859-1?Q?On1VcG1aOBcngFKm2W0G63O81M+aMi3rYsGwPnjQs5r+/1EOiVSCPZmytY?=
 =?iso-8859-1?Q?tecTqSzsn0Gv+cy2bWH+laOKh3cGevCFnLSF/ywuCLPsXjJnsZwrdH0pfi?=
 =?iso-8859-1?Q?Ezk0KPZKvJIGadgj+WT0tecJ7YV/wUU6GQ2qrmejfauH3Fh5wbcTsuFjd7?=
 =?iso-8859-1?Q?3BVauyHUqBWkdObrcnVzEJ4S14pXDCiYt6Bu/CIxN3ggr4U7YBCnSegoqA?=
 =?iso-8859-1?Q?e8WExv5mQYDBREmLqP5PWaVp46AEnVpcMTzcTmPORC2AjxjY54jxjxTEf8?=
 =?iso-8859-1?Q?mfwwHoD75HbLLf/UPdJNeXA0ZmRBdUMvt7CFW1I8lcKVOBn0WIgww589+T?=
 =?iso-8859-1?Q?7gpgpXkK8OsyevY7GXqAHYwXPDYmH9NqStuj/6a7+SuEUiJyCV6IVRNxPq?=
 =?iso-8859-1?Q?T4C1PM6s3ezSqNyzhXpBnoFr9T4q6HIoS2ToSI6KLMgI8/hQaddgud3Kv4?=
 =?iso-8859-1?Q?c5fQnnkwTCAg67KrbSBxjoEJt937fSJSUETEcyXrTl+OOum1VD3TCyZxUg?=
 =?iso-8859-1?Q?Yru+7fWf56QwKl6eRVJ6V2uCtmYJzlTBvzsC5RLbLGYajQStxCpZzXbX6n?=
 =?iso-8859-1?Q?i7rnz0EriiY+9XzOueIebQFNHu1QePbVIkJ/96eoxqVxGRs6z9HpfKOcEZ?=
 =?iso-8859-1?Q?qh03w/xgAkJRuXjxKBlpt/iA2SKJFfByqPVmUP+/cdKJLVX35YWDauE2AT?=
 =?iso-8859-1?Q?6NmXuDdk5ItQn1OcmHyXxKrgDHBKYXaeezn+T6LXdkKIGnI75MxblS8fUv?=
 =?iso-8859-1?Q?Q4lpDkys48RYVqu5eI69KbaoiuAD9WvxICH0vc5bai+VG9F+b8BVxyXt+I?=
 =?iso-8859-1?Q?ueQklGoxdqx5ruqOhBP0JtFdA9mgG7c5Si63gGsZgB+zfHQ5jLs+ezbfL2?=
 =?iso-8859-1?Q?qnBUIFeNDu6c4pRHJ9fRl4wjVx9Cp2Mi+pNEvcHXclou5PcZhhmwtGqWtf?=
 =?iso-8859-1?Q?Rs2XpQg/1y6R0Wfv2Rurzwl6nQaJdR3CPaj9aAVrnsJTDBzvl+js2iNTJL?=
 =?iso-8859-1?Q?nUN/MELYeQ59vBajGRu9d+X2GvdZDPPgu0zJVZETzw3XrsFjchP1GIFuWf?=
 =?iso-8859-1?Q?8SCQaobyke+RMV5RevBdiPRnLW1NwfYrph2ZHo0jESdVRdeY5GeHN7RMr7?=
 =?iso-8859-1?Q?TKG6zYbTWb+tKYrXiwQ7yA6U1hrbO9SGKeTk72msRurCB1S+yxaBiqS2zA?=
 =?iso-8859-1?Q?H4u/0g6UWdDmT+/FX+hov7QUiBI4lilqhfitXYB5/K0dacr0ff4dEFqnMD?=
 =?iso-8859-1?Q?KQ8HmlUH/FpyTvBKOpyjNwKL6g3VsJY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vendeeconcept.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3055.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6c79ae-1264-4455-b3c3-08dec87c5a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 12:15:54.4593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6b96511-fa8e-42e4-9c26-268a53f67ab8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGNgCI6l+tTJTmFiwS5igr5vBHUycwUI7R9nVGqtoN9dWCs2TYBSv2zLO9Tor8yok2bCDok/phaRxoTNW3C+NNVpcLRE15RtdzpSOkTJ+A91W7wHESkUIOspbtHRxjVU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB7389
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vdconcept.onmicrosoft.com; s=selector2-vdconcept-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/ruWObz5LJh3cHeXekcgVck5jhx2/wbATfs4CkpMq8=;
 b=SzWB9pWsMIC88qmTfVsnRPEtfe3qP/W9ocuPvyPbycnvTI71/2WdUNcn5Q46dgc68zA4JYXgQALcRSccC4mW40PRx3PG7CVQ/3nmVMa+m+CBoDzPJdwpwA112VbOPwPrnxyqgbrPj+8EPk0ePQr90uw+CyHBj2TrVYzxwPJUpFA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vendeeconcept.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=vdconcept.onmicrosoft.com
 header.i=@vdconcept.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vdconcept-onmicrosoft-com header.b=SzWB9pWs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vendeeconcept.com;
Subject: [Buildroot] [PATCH v2 01/11] package/gawk: add CPE
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
 package/gawk/gawk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index fbb620be7d..c7be63a661 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -10,6 +10,7 @@ GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
 GAWK_LICENSE = GPL-3.0+
 GAWK_LICENSE_FILES = COPYING
+GAWK_CPE_ID_VENDOR = gnu
 
 ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
 GAWK_DEPENDENCIES += libsigsegv
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
