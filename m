Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF0AC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 10:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CB13814BA;
	Mon,  7 Feb 2022 10:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTPBCZg_JlSm; Mon,  7 Feb 2022 10:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D5D7814B6;
	Mon,  7 Feb 2022 10:07:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 51A611BF41D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E11740261
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="lR0qKoUa";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="LY/yLFoR"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qNlkhLufiBB for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 10:07:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C46964025F
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 10:07:15 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 51778C00D1;
 Mon,  7 Feb 2022 10:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644228434; bh=PjZEBuC0S6+2YLZd7LosMWyNF8D1bpkboVP8K8wbILE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lR0qKoUa1i4wYoDcxdOpWGtdxDQ6M6DzSutB3v6FrufKDXp6LrmIlQYQV7UNlXoUV
 BguWdtpKLBoq6XLle3l3Mjl6e1vttl6uT22sPth4Ra68crexG+zCae9YsXKm5itGwK
 zfdAeLsIDA8Rv2M2P9VCOx9A2mQZjFMfNo3MHz60gJCzMIVnryookQjEGink3P0+po
 UcR9K46Wsp6HtYPvUFGI4HpJer2h1xciUbefY3jJMUbh7SKpEBEaoihJnwmhvGv70O
 z0EZtMGNM63G2qd3+T6aF8JWGR8TBCZpw3cgk1dp8ZPQqY3FYNrUSsxXDnMA+nOgNQ
 WZ5Quf8jOLCcg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 81F31A0070;
 Mon,  7 Feb 2022 10:07:13 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id C2019400DA;
 Mon,  7 Feb 2022 10:07:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="LY/yLFoR";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHjUr5sxRS+X3jc7hl+dhtLNkfrFNbWKk96eYh9uDgrIg+2G4sKCtgPLXfgekK7lzupk93KhZC9MjRrNIY/Tu/qImO8gFkqQ0jBAAHqq3q5yhasLUP89GVyODhdjKoeXXrKlJZE95MXreQJpsUp0v3CByEhNyIJXboASHNSyfVhyUz4r3WjmxamAovbo6LmmXGeVtwZDk3s13NzcskWFmhWLYk53Q4HkyjSJC2+HWZeACEcHPIqLihd7pqmz9bJhLbnSwASnyXXHOtEVn+tlsKg1xrrtFZIvEp0WJ0jrUAlgXjhahMoyTm/gNJcnsoDOqzaUNN8YwAljBTEHkPGGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjZEBuC0S6+2YLZd7LosMWyNF8D1bpkboVP8K8wbILE=;
 b=E6mL/Q4/MBxybIy080MrSG+1YkD0udbeLtYZkeV+uOQMzshUCLlSIcNDGiiYTZvpiAccWEWPtTcC4RdTphdOJ3FmjWCcoAhZUcnznu066g4KrA09iTU/bakK+KBE9fOii0NPPIFY0MDnFc8L33Ip3F1LEyil9DC/HOI43TNYxuOavCVCp8YrFqCU5+2BHnMQc3r99putsPKyQlfiOm4X6B+qcVeFoyQcwMM0vg3wQd3EEKiXo4IyWckeh1z9nhdrb0BKn3iOEkZ6UB1uRua5I1Akl+Zyfxfxfr30Et6RrWFA5CyeYdf0N+lgsTIxuXHa7CXCSMc55nV1olf2rGKWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjZEBuC0S6+2YLZd7LosMWyNF8D1bpkboVP8K8wbILE=;
 b=LY/yLFoRS3lzOhOW3geL0tr60Ba27SZJQMta3Aw2cPUh80VBTXFE7dsZAf2Nq3PAGqBApulrjx5//lKLrmRKFSyweFXThDPeokxeEB80j39l29iO4oNF+5bK0hfp2QudWhd7eq7NqwcFzZeZsyxCVT9ensAp3cdiI20pB9EDGsY=
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com (2603:10b6:405:57::7)
 by DM6PR12MB3145.namprd12.prod.outlook.com (2603:10b6:5:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 10:07:09 +0000
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484]) by BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484%11]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 10:07:09 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Sergey Matyukevich
 <geomatsi@gmail.com>
Thread-Topic: [arc-buildroot] [Buildroot] [PATCH 1/5]
 configs/snps_arc700_axs101: bump kernel and u-boot versions
Thread-Index: AQHYFnpHk6fsr4cTRUacRa0cjNDTQ6yH53p8
Date: Mon, 7 Feb 2022 10:07:08 +0000
Message-ID: <BN6PR1201MB02285AF40F17D50D6A6BB5A0A12C9@BN6PR1201MB0228.namprd12.prod.outlook.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
 <20220131081214.12773-2-geomatsi@gmail.com>
In-Reply-To: <20220131081214.12773-2-geomatsi@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8d3ebea-5187-438b-5e3d-08d9ea219a1e
x-ms-traffictypediagnostic: DM6PR12MB3145:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3145180C9A486DCCC1F9D42AA12C9@DM6PR12MB3145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:94;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IpRrhiRNitJdSb1t6J2Njo6iWoVO/MfUNDROV6Fzmsj+QkoESNRvCwX5AxtfZZgiGjAh0Fe0f/kGyVV9DKB0YcsaPZFuuWZmGEYBYeLPPHk6yUMKYHhxPxGaoxxF5s8vF7zT+VogU7u8+c25x8ooZFCKsjbn1QXBHDGRsiXKJriJHy2e9D7sqpOitqyunxMoC7up37ydv19r9ce9/ZAAHI+XFovHp1pDVQ1S2l7w3dsYBXTsno32oy253C8ZyRcQSgv4eND2VCntkoXq/07+7R7grfyaIWTCrbTlV8O0+Z1lxVkPXa8tSI+eTtMsLoAr4nYAWHnGzq8r2YJJNuLaGznphbg6bJMPHXb83PgBr7lw0DGoormzS3Ip2Q3+Ukr7MPCEDuEucu6UWhSmViO+4jE71ZazFQ3AE6MsDI526bRzebAsBQzDizV+DCnUiN9mbMbVAd/5tpITZ8KyvY12hVNORodCHT7zjHtgXrAvKCNRWbAehzBSOprV7mCQEa5vgupYOznFm6+EAePD7sF2Ake4in6cqPm3vqTduElH4krAZoKL/lE7vdMsTHL/0Q7ZPwmQTYueyqJF2ZaUTv2/2rlNeUlk1nXAk/wjcINHu4VLWXDFngJeHJomfR5LUQitBLbddbdGkau9+0uAaOk+PxQUILCJvAIGHfDSoGv/m2cIVW/MM9HXe2gTOPI44rm6oXBD2EGsqyxdUwMNDBqOHJMb9y2D2d1Dpt4PoBx5b+vx6f1f+08K+1ELsklB/CBw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1201MB0228.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(26005)(186003)(107886003)(91956017)(86362001)(7696005)(9686003)(2906002)(66556008)(5660300002)(33656002)(558084003)(52536014)(4326008)(66476007)(66946007)(8676002)(38100700002)(66446008)(71200400001)(64756008)(122000001)(8936002)(316002)(76116006)(110136005)(38070700005)(54906003)(508600001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MNONkWbVwhLHD4mHdeGeb33uGTQkw6MYG8pW7eP4H/YqgSnC9Bzyn843xQ?=
 =?iso-8859-1?Q?dxS/VGFmLvTDdXePlDrBkGGTVJOoITNca94gd7Q290bAp8CHe/l9GQHgYB?=
 =?iso-8859-1?Q?Un9wEgApj8/Ic2SYEA7loCLNk0hT7jmSJ4o64bULO/a7EP3wKwX8jaVh8K?=
 =?iso-8859-1?Q?72I3PqdIzfwmxd1gbCnzXSERlVnOliDij4GxDQtsN3QZWjA6RTbGSBwsyU?=
 =?iso-8859-1?Q?VISoZ3lpVi7wVEsZafGMh+dOeonWycIDTU5JkgYyH0tw4Hx0hbcXLedC8j?=
 =?iso-8859-1?Q?D1K4TVo5TJVz0gHr53omrF8+EKhX/BCweccvd6N48uDAOiY4avfJMWIcNy?=
 =?iso-8859-1?Q?DuVEonsDTQCdiur1ZTrtOOvQoC+UQdXnNzw7t5j2IuQvW8dYE3Vd9YnG1q?=
 =?iso-8859-1?Q?/N0vBEHJb0zlBRmwSUnDTSPsdpFAfl1BroEc5S/eJTNU75SMwwkc4xSUuW?=
 =?iso-8859-1?Q?voWSJTvREIRpVaEs9NHHSBv1+gfgpuK9v3muE0CQ3aroif2eP3TQXgOT4w?=
 =?iso-8859-1?Q?1WNxGSdqlOdSUqTlg+OWoB7UaWzDMsgarfAaAUsDGZ61RJblGZhWDij/Af?=
 =?iso-8859-1?Q?UargCwOLvWDfEwn+hB93FIPB435JT93NS0IsWfVEZH4wPtMLDnDkHSy5vw?=
 =?iso-8859-1?Q?mIDAxmI9FCOLADd38UbGCosIlIqXKkGKDsI+nQuVuetj4lQUGQ1DtBoD3X?=
 =?iso-8859-1?Q?EPAY4coP+kqGAk/t0DAki6naM+v2mOFqdfwCvxpOnqLs2+lQP7dq9Vc2hh?=
 =?iso-8859-1?Q?DgmIm1XCLFfvYigJL1aZpERE1il09f/wKEC5pILCpMepjDujLjW5v7oosW?=
 =?iso-8859-1?Q?lMtggiK0naxM2PyJRJj1vT7rbVXFVtStN/hHiQLGG7t3kzjzy22MGxUEIL?=
 =?iso-8859-1?Q?goRqPmAzrwjMtwK5T6Zi92pxCgpgPnvQeXPJP0Ym7YlA3urno6Hr/mzahl?=
 =?iso-8859-1?Q?fA2TVMjm4sdJ/FAkC5XjdaDdzD3DaEp3c/sNfTE2SCie4ini2fFe3cKgbs?=
 =?iso-8859-1?Q?V9sliUnXye8w2dA/kFCBn5yHqJsOoyPswByattRTcOiClXV3xlx3maoDQl?=
 =?iso-8859-1?Q?CQltjyhCKylfQBtxRpFJERSm9dP36+vn1g57TQWxbQdPHp9XTxkCtne4R+?=
 =?iso-8859-1?Q?jV47CSdoHUDJ5tfaan5BHPmchPhD35v5brzEDTldrssgJhFP88K2YyCBUk?=
 =?iso-8859-1?Q?6/dxG1h6RQ740FUBk5Y+Eelj7tCnVEvi4dKi24EDoc1vtE9VrCIwzpUNul?=
 =?iso-8859-1?Q?p2ruZ5zoedOVsa6YqBT7tSBKh4/AggH5FHXO7+dZdtQW58UxBx66eaTKnl?=
 =?iso-8859-1?Q?AQ54Pj5maoiBRP2xuSRLy8w22HlNM0baaQXWQUUj5g8+a8lPM2dP5IEeBb?=
 =?iso-8859-1?Q?z+1FMRSTcfZFR85bhMOZjOeSNHY9bjCoyDH4HNez+qnKIcneJg20TSPQef?=
 =?iso-8859-1?Q?pEdEBjHUkKKQR+R6LbR7Qyr0D41i24qJNjelwOTDqFE5ytdoR0kVjBE+fa?=
 =?iso-8859-1?Q?1OVF5IA4W8acZWQyiMn5PliJK28OhCsFevToT/IZs4mfxYe7bkSxlwhuSo?=
 =?iso-8859-1?Q?hCsfm1nRHgdMgCRr7YUbTsIobWaQbqZZxvdXm03t54gZL5IMSIzbLdjE/K?=
 =?iso-8859-1?Q?tTazyrMslxgGl/46JsdDR30G2o6GCT7x2WsKeGugGpt1x7NHez2Gldmg?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d3ebea-5187-438b-5e3d-08d9ea219a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 10:07:08.9043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJMCkXFn5+H6XezSdf2Foe69gapVU6l2PfEfeB6doBuSR7ITSdhjrAtsRFaU+wEBaYj3kjkxPmTaVAvgK/1tEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3145
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 1/5]
 configs/snps_arc700_axs101: bump kernel and u-boot versions
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey, all,

> Bump versions:
> - use U-Boot 2022.01
> - use Linux kernel v5.16
> 
> Add U-Boot configuration fragment increasing early malloc pool size.
> 
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
