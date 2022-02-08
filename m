Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53741C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 16:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E597B82531;
	Tue,  8 Feb 2022 16:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vxlk2KWywH0W; Tue,  8 Feb 2022 16:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20BDF8250B;
	Tue,  8 Feb 2022 16:43:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D62351BF5E9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C35C1400CB
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 16:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJWABQGoADns for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 16:43:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9536403B9
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 16:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n153zGSN98S23bCJewQwfQIaK66Yeq9GzblmrzprnXn4OVQBFJTKUyefCB+NMsZoC7Xl1nZ3c3HH/UPd+9CsfVNRbsTfnZFY/X1/TlnthOsVIMmK+Rc99iYlZfupPdyouqb2D9/BbTkVRpt6EzqOMFlP9QZY5POBthOU36OJGH4mvqfBUH7v/cds+739f4ZeSAmKCmOUcGe6rHQmTnPLuGM9UuhOTloeoWfY8+ULXUNP1wPAZNCFmZjYMLbEFiWfnyxsMHX2xukzkiPDBrn5de6pSrR4UkZUoYTmJFIspB0Aw1DZnR959kP4hrzCUYx1xVShliNStm9jcn21D+SBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16kTWTx2Gbp+ipCQ8OFOpSrpXtmuYmpyuXINC9QVtso=;
 b=NO1WDptjiMuiXMDQRkMpNPizDff7rWp5A+JvcWmZ84h6ZPgTMTF5GDXz5/TojHB3QQRUD9MqOcZImdw045Fh5U2jlBoVcHp2Z9pcCPEXoyVO/RF6KW1Vs+14JcFFs9hhKFjhwwX+9HfKM1H9pZ2Fo6IsTHOVZUxVESBC3N2dBIhx5YP+Lc95eQUqCBzVOrdwqwv/3A0mv7bwViXTSfXGigqstbjgTKQI+gTDr8OOsQ4WoQcjFuLSmOk9sfcxQNAxa65LgmZyjZLvPIp/+i0V2JwJenVjohIDDcZoQlRefYaVpOitRj1CpBNnU3zRBuTLsBKml3u5Zsbd+RBD5xuYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16kTWTx2Gbp+ipCQ8OFOpSrpXtmuYmpyuXINC9QVtso=;
 b=F/U92zMTXJeZa1Lo1P2puUtcfN1fAURf5w9nGjYVGuV1lGDNruXzq9DLaRN5BKAOJiT0AvoD3C5imIAMcOAuAOknKdenlQYPuQh+jX8TKr6uliVK0pOkf5ADC0WCH9mKNUOjOMvqGv5Bv3AD0+wI+/mZPegwuLpXi0SAQm46dfA=
Received: from PH0PR02MB7750.namprd02.prod.outlook.com (2603:10b6:510:5e::9)
 by MN2PR02MB5759.namprd02.prod.outlook.com (2603:10b6:208:10d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 16:43:10 +0000
Received: from PH0PR02MB7750.namprd02.prod.outlook.com
 ([fe80::5994:63ec:297a:6790]) by PH0PR02MB7750.namprd02.prod.outlook.com
 ([fe80::5994:63ec:297a:6790%9]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 16:43:10 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgIAAD1IAgAAKt9CAAE06gIAAAs5w
Date: Tue, 8 Feb 2022 16:43:10 +0000
Message-ID: <PH0PR02MB7750946D063D95F7A04A75DBD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <SJ0PR02MB77585322044616B1600B5D83D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <cfd7b2a1-f06b-c068-939b-f4f0bfe740b8@benettiengineering.com>
In-Reply-To: <cfd7b2a1-f06b-c068-939b-f4f0bfe740b8@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d416c93-15cd-4481-53be-08d9eb22178c
x-ms-traffictypediagnostic: MN2PR02MB5759:EE_
x-microsoft-antispam-prvs: <MN2PR02MB57594BC73EE3DEB4CBDA46FFD72D9@MN2PR02MB5759.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GDjRSkAiFMjDHbaBqrlr6T7WBRZ7zcsylcFnjSnevL5iCli8uFSifEWRdUyGryjXsHgC733IxWCV83qgBHgwIPdZ+qs7U5NmQTHiytTTtzm4nV4nX/DEpdvY1KtOVyydq15E8gZF7YLQ1qXKtGE9MmgQOaXohLQLpDiEowMUVwd4eGLCHBn8/OK99rMYPaL+uXdEJXSxfvSC3GtmEACCj589PNWmWY6VNO1xyY638sipclzP4/BedIF34mutxOFSi7W4afntiKOeymvOOuh0uR5M7Mx5bCSGYpQtk5xA4lqmF7Xscb5WJ3bnFu0eIaWwCKo8GxMff4RmSOgQ3S0o0IOjvBTyTu4ymwSkYb3vjfbZF2fJDWOUJNacd4GgnknT/Y76Bxxbj9fN2WODuUe0RQudNP/+sEKItbgq4wqzPGGDfl0j3WxlqAbjkxw7abkCUVG37v0NT9Zodd1raUJmE5JpEZaqU/oRdBZUSUBemZQnHlLFswXLKhkfjoQmVA3F75e7NvS8gyLRRu87PTfy6MT8kg+a25O68jZ9mUDy/fVK+BjduPTfwY1ExHP+KJV7Tt4eRbzBFLWCyzf1mwTQSJzaz+UqIJWkrFFxmOs7tOaLU4lSKeUYNAT5/99OkoM7g4YQIG6GJtwj5F8C9cdey4DIJ8RPhv3GLt/fyg5jcukZqKcX/+rBPSmLmSMy7AVJFa9f/tXJluffvJcbNP+WgpjKVIFXa4yeDj7XeNiGpIi2f3YGru5KmbQuU1jYJQw+c42K4MgtqpCkfgLbjQZejMftmDoTQXTUKBQwOwbIlac=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR02MB7750.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(316002)(66556008)(26005)(33656002)(55016003)(52536014)(122000001)(8936002)(66446008)(66946007)(8676002)(66476007)(64756008)(2906002)(508600001)(86362001)(7696005)(6506007)(9686003)(107886003)(186003)(71200400001)(54906003)(110136005)(5660300002)(966005)(4744005)(38070700005)(4326008)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWs4VUliWVdqZi9Wbkkyc0hOQXJGOGN5MXJ5S1h4QjFLamxqTGQzUEkzQW04?=
 =?utf-8?B?T0hOeTN6dzRBQkFMR2dJMW9GaXFRYVFEQlp3VTZJVVh3RG1qY2VkOVhrQUpl?=
 =?utf-8?B?YU9Pa2I3YWxTRXpRYzdYVjlOSWpSOG1GaVV6ckYycWhKQ3Jwb1Z4YmJ1NnFt?=
 =?utf-8?B?cUYwL1pzUEh5NWZSWHhxeE8rTjQ0ekE3b1lUSGU5bXMwZUY2aENIOXlLaHo1?=
 =?utf-8?B?VjluYUp2OGxnRWlPa3EyaUF5cW12YlptNVBCbmxBU3o2SlZaVzZ5Rmw2cjdt?=
 =?utf-8?B?ZDQ1RjVFMTVFOTRLemN6UnA4OEFKVzZJY0VYcmxVTFk1eVJ5cFlSMng0ZjBX?=
 =?utf-8?B?ajRHTVJzV093SHV1NldjV0xvdFNSQkdyMkh4aUxEOW02dllSL1R5MDdVSE5P?=
 =?utf-8?B?cnlnSjQxVzUyYW1qOWU0cEVKUkdkanZNWVdFUnZkR0xCU1Z1MjRpWHdhcUtT?=
 =?utf-8?B?aXkvT29jWGxzRk1mTkZJZ0d5QnN1Q01qMWpXelU0azhPd243eGc1ZmE0Ri93?=
 =?utf-8?B?WkZOd2l5SHlJNnhrd0N3VUhEWFVXNXZ0bEJ4L2xhNDBYOHorbmJkMnFPQU1u?=
 =?utf-8?B?R2ZSQmtRVkkrOHJhT3ZReG9GTXlUTUhYTFBsNkFPTlpiVUtvMEhWd24vd3ND?=
 =?utf-8?B?MFNZVFdqaTRKKytNNTV6Q1VnandDM1N1ZVJ2ZGlzMi9DcGdYS1ErdEpLU21h?=
 =?utf-8?B?REZ3ZjJueW1KVE03T2cyWEtjU0dkbmtjcVBOZjBqZFQ2VXRzVUkzQnZKUkxQ?=
 =?utf-8?B?Q2dvUk5NL2NRSXdPbmFsOEVtRW5GcVI0Q0pqSU5sMUVZMGxMZmZ5bWF3d21T?=
 =?utf-8?B?cGtJOVBTQXliQlNUSmptaVJkdlNiQmpOaTlxYTZsWEtyS3hGKzNyc1JBdERF?=
 =?utf-8?B?ZFRTa212cGVmQjNreFpOQkY2VUVoNmVSeGMyeEwvd2dRamwyYWJuZDZnSkpE?=
 =?utf-8?B?V2llOS9pektpMzBQYmFwcDBiODNaeUEvL3hYakVUSGxVTW5sQjdhQXY0aXl5?=
 =?utf-8?B?QkNnYmNhOUdWTmJHWVlRTTVNdXEraGpkb3lMRDNuUmdHWEZmR0dDOXkwTVdD?=
 =?utf-8?B?MVBpbDVmUVMrRGNaYndISlBmTXlLNXBvSmJHV1VhRERTM1ZRY0VSQXZ4NHYy?=
 =?utf-8?B?bjR3RC9GK2JESHdobTkzWjdQNDl3M2dtb1Zwb2t0dWhHVGw3cWVQNXVVY3JM?=
 =?utf-8?B?SEVMSjZrS245amltZ01mSUFQdm1HSG8xaXZOV0pQdWJlYmpPQlhBanVObGZa?=
 =?utf-8?B?eXh4K0ZFNlN2dlN0QlhidDQ5ZzJ4UWJsbDRabEZCSXcwdmQrMmMxbXMyaitQ?=
 =?utf-8?B?MWphVVdNTWRleHRoaTJ0Z3lDMEg1NUZLeEt5QlJodHhGaHg0eE5xNWRPd05C?=
 =?utf-8?B?elM5eWgrOVhxcFUyMHVSM0pISU9xTk9uSkV0ajdpeU84V0hhUXU4TlcrZGtR?=
 =?utf-8?B?UVR4N2dqL2FJbXJDSlRsazNMdzRuKzlqQzRCSDJlWktBOThYSDU0dW5IM3lv?=
 =?utf-8?B?eHUrNDczZEFITERJV1lWRk4xbjFHT3prSHpEZWswSmsvK1ZZV0ladHlwbkxU?=
 =?utf-8?B?WEsyQXc4U2hVQ28vdFo3cHJoUUFweWRLL1BTTUVBTUFIRkRBWlo0NHlJc2ph?=
 =?utf-8?B?SjlVQ1hFMlJMQzh5UlR2VnBPWTlGVUlsYTJlSnRoY2c3Wk8yc3JuRlNtWUN1?=
 =?utf-8?B?U1pkQkU0T2dVR29YYVNDTXlOR1BZVHA3OGgrWUlHb0tWaStrR09LaTRxcEVz?=
 =?utf-8?B?bWh1VGttVWJlV1hidldFVjNmUTFaaXRqYVBRclF0aXNLaUkzZkJYZmNyMXBE?=
 =?utf-8?B?TDArd2ZDQlZTbVpyaU90Uy9PUXVqWDFsYzZ6b1M2TUVwZHBiUE1odWJBVDBT?=
 =?utf-8?B?N3VZQ1FzZmlJZTZGOS9KdVc3bnF3U2k0WU9WU2YvTFZCNm0vcGRxc1BjZXFi?=
 =?utf-8?B?VlgxMjV2Z0Z0cDFSa3B6Q0ljeFRMNW9ISjVEWkpUZ1ErelRKT1FPeVhqaVlD?=
 =?utf-8?B?WnduNDdJSDVPemd3Z2p2RVNGMlcrT3N2MGVaTEtUejY4N2ErU3FFTXV2R2J3?=
 =?utf-8?B?QkxKMFVQUnpzTGlncFdhWHBwSFdjK1FORSsvaFc1TEZPRGhwVi8wcEVudVRp?=
 =?utf-8?B?Y1B6Y3RaWlBFNm1HM3FjOXVzQ1c4ODkxNHVlNTlXQTU3YzJPUHhvdzRiZEZs?=
 =?utf-8?Q?vhNbucgKQIGTZ7O784McOD4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7750.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d416c93-15cd-4481-53be-08d9eb22178c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 16:43:10.5342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMnaebHoIbeNh29IfHKInzq7dJQXg2KBl0hgZuqLAJIs1eDy+ofC3POGbIyTff9PXb/o3T1yX65fQYOQpkZMaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5759
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 Michal Simek <michals@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> I'm building both defconfigs and see if everything is ok.
> In meanwhile I ask you to subscribe and set as "superseded" the old patches in buildroot patchwork:
> https://patchwork.ozlabs.org/project/buildroot/list/

Done.  Let me know if you see any issues with my patch set.  On my side, it builds and runs without any manual steps required.

> Take care next times, when you send another version you should produce the patch with -v2(or -v3 etc.) flash and indicate what you've changed between versions.

Ok, no problem.

Thanks again for all your help!

Best regards,
Neal Frager
Xilinx

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
