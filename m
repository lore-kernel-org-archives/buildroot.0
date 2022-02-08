Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ECBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 11:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0C9681B53;
	Tue,  8 Feb 2022 11:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kl8DjQsWQpV1; Tue,  8 Feb 2022 11:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F8180D69;
	Tue,  8 Feb 2022 11:56:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C25A1BF31D
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 682644014D
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 11:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j06bSmYsbicR for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 11:56:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71AA54010C
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 11:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVVsLgFPJY+w3I45XCV7L8m4BKKcNINQ/C9YSelLg/NYXve8nB84WDcB5FbM1FVqoX0OBhgBbapZxXAOa074UKF6r4oXaC5JEGboXe8tWFkFvPXRqT2YjZF0/aGTvjOHDvp2CtiRuVKqT/kTqoYMf0qTtUeiUvRCRxgbSv6xuhEcrcYXPHA7Xv9MpQp1zmn5fUOhNE1QG8Gh0z9GVpgohWgBYKct8lwKSUtZd/tVhxcyRKhX9WgBTC1XPTpdM6JvcyiHVKKpusTMTzwJBbHWQN50pRJYOu97vKwyRUZZV4TL+Z2cTKc/tMDZYgYv3uSXLSOV2xTgzVAHct7+sLo08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY564HweMH0jXRR4+Er9pZbU6j7RPhu/0FkgHzO0JSQ=;
 b=N8z/PQhPDXSyMUtw0PgjjAVbBNfEvZScEhw/w5zh7Z/pz3wtRZbbjW1+jVglaLz1YONDvtKUBAsB/fiYl6/yuZJH8godyvvkmJmOCpJDpg5efVQ9eYby/u+BMbJM0OV4j6rifvzlOLGtbXbObVJZ38zjo3/0p+ihMPhLpNu7UV1IM4b2qShBqtr+Pqt4Y2gwqOs8jnOWmo7BHmnG3OUVZOh/AIY7HyF5UMTGer0fEvu32Yf8b9qEAbiZqPkBYAqMcNNHPBxhrHK+OrcMWsjRPSIj3Jj0BGysK/2OugZr+ooNP00SbXsnQVYwHQyK1uFzEtRzXZYonyZCrXrs5shXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY564HweMH0jXRR4+Er9pZbU6j7RPhu/0FkgHzO0JSQ=;
 b=Ec4WXnOvzS8YZoG+AujyMWKlqWsvWpcTJJm76sjZZFfurspwUCmLZFy2aI2ZDyFWusWnfaIMvTTw6LVOyE9nHZqRG0YEUx6CLsMCK0reyOGpzeN6Vs3zwLZ6t8TVqGdTym4vmlonO1P9FzLomXG7CTNgRXJoecaAC1i7HdDqB7c=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB4266.namprd02.prod.outlook.com (2603:10b6:5:2b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 11:56:14 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 11:56:13 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgIAAD1IAgAAKt9A=
Date: Tue, 8 Feb 2022 11:56:13 +0000
Message-ID: <SJ0PR02MB77585322044616B1600B5D83D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
In-Reply-To: <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61b94113-f8b6-49b7-56a7-08d9eafa018e
x-ms-traffictypediagnostic: DM6PR02MB4266:EE_
x-microsoft-antispam-prvs: <DM6PR02MB426637FEE198BF5D641AA260D72D9@DM6PR02MB4266.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ubroAxCk+RjkzwUziCEIPNNvn8NGYePFiinNcLRnQ9XWyHdIygaFx43QuX3JwzR2vWPq4Oxh25+FOy0NWOm+i6+PRQwr+KiCom0tnN+2/KB6JGrsVo4p9Xia/XCtQ/9UEnvLi2U+mf5NFH5s3a50dX0Oq7MtwjlyYoYr5VJd6Yes9GhEhNcm6ypRqjSwA6hhB+cPNrpStHJdNFQKLnBcyMVoPVYRZp/X9SaOhQ+PCmxq9l/iIT3MCozEkMh3VsVjbHt64cePcIF49JR0+7+YhMJMG0aamGY3gqLHGlbxeLG0MKbo31KF15qukqrP0/FxdssyD5uZUjySUFo+YZjP5P22YP2p9vPxTfzrLO/+IElkN+ejlDZWLy9gAezEXlFHPiyzfklMki3u3qiZ7XfHrQddVOWBwGVcyOTFy3nDGNNVWyvy0ds25z5Zl0dDqej9/6KrRFNAE7DuhOvuMZobkoQZAY/W359StM7LQ4eeEpos8bS0SbC5kuNfwn3PlUXfYjGKXybcSl7HY5Z6zlgJKD72lMRYYk5l8EGtiDNlJX+7d8YxxcsW5+z36F1ka9pgRoaGQeu1efBskjcUlGjquFt+1zMZJ9jYOzgaucHcX/bpsWt2M0rVr/EXpc4WqPkVBKEhgMBDwBecxzJdNao520/eeoGpHh2hhwd0xRJF5Sh8TSp4/VK1o/3IylGS4hq1Ni9cO94TmRSuqqken7zcvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(64756008)(86362001)(38100700002)(54906003)(71200400001)(186003)(55016003)(107886003)(26005)(316002)(33656002)(9686003)(6506007)(7696005)(508600001)(8936002)(76116006)(66946007)(66556008)(4326008)(5660300002)(66446008)(52536014)(8676002)(2906002)(66476007)(38070700005)(4744005)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3g4eGV5Z1VxWWZhYUxXOURlcTZJQjU2MDJCMTJVL0xpeWwrdVFwQ0hWN211?=
 =?utf-8?B?Ty90U2ZEaG5NbERzV2ZiUnVweUs4RUFoY3JpeDNhcS9ibUc4NmVPR3ZLM2lJ?=
 =?utf-8?B?T2NIbTZhQlI3YjZnUDN5b0xoeElGb0Q4MXdCVE83MzZ3alNrQ0daVWVDTlRi?=
 =?utf-8?B?YjdLWnczZDlTa0FXdlBITXhVOEs0NnNSSXV4WThYZVZSZktjeDEyS2crMmpy?=
 =?utf-8?B?a1ZjSll4a1lkUUxhVm8yeFFXQ0MrYkFGMXoyc0FVT1oyVjk4RE5yb0hyaDc2?=
 =?utf-8?B?Qko5WjF5WkMvV3JuZThKZVF5RjBvTTV0YlJ6OC8wWUoyOU14c01mRUVleUFP?=
 =?utf-8?B?eXU2WFZaellucHhMSHZQRDF4RkpVNVNpUXdtaXM1VCs0VGgzVFdNbDRmLzZW?=
 =?utf-8?B?cDd1Um1saElTc3ZPOG1IVkZuTEY5b05MUkZQSTlRTnZRei80UDZ0Z2YxNEQv?=
 =?utf-8?B?NVlUYzV5dVZSNkFFakFmYXJQSHZWU0pGcytNZTFGaEp1Y1lmYWdTenZoRUVx?=
 =?utf-8?B?QldoOVlqN0w0S0hxMnVnV3Qxb25rRFYvWWRmSUdTRHljL1JLR1E1c01tbldW?=
 =?utf-8?B?RjAzdGVralRkNlplSXFNc2JBTGYyejFia2RVS1BZWEZjbVFYZU9pb2F1Zlhn?=
 =?utf-8?B?TkVvY1FsYXRCRjkyQnpDM3A3M0dkdXFMbGlNN01NTXFkRTdkNzhKR2dhR3Ft?=
 =?utf-8?B?WHNXWm13V0hvZjBlMWg1RnVvdlRsRzdBSFYwOHdScFpuZlJiUE1RRk5JTGZ1?=
 =?utf-8?B?NDZ3Y0t1UDdrUVc4bk1RLzRiamprRUMzS2xBTTQ1aXZnZUR2MTdSYThmczJz?=
 =?utf-8?B?bGFSWFUzSGZabnp1QmE0ZytxS0VNQ294ZnZDbFZvZDkzQUhZazBRdVJkbHV4?=
 =?utf-8?B?cFRmK2VjcXJmSHF6Z1h0L0ZySis0YTRORmF1M0QzdHhvV2dhSjZWQW5vZGVl?=
 =?utf-8?B?UDdjRWdXcnJmVnBrMUZvNEtJV2ZJUDVYM3N5YjR4eXdFYU1hek5mcWZOZmhq?=
 =?utf-8?B?Zm95aDJEd3J3d3hORUdIYzZzd2owS1pwcTVGZHdtbXc5RnVud2pkaHh0dkJ3?=
 =?utf-8?B?bUFpTm9aUHpNRHA3emZ1NmRWNEQxMFBpVVlzUmZFUGZGL3NZY1ZOc0FOYkFN?=
 =?utf-8?B?UmZWMWthRTNNZjZlRjhtWTIvL3NPd1hWaVZLR2R4c29CSHZjai9ma3Z6eE1J?=
 =?utf-8?B?cDBKclBROHpLVkVMMzZ1aFR5bk1XNkpCQUI1bHZ5SUJhVVA3U2cxeStoalNw?=
 =?utf-8?B?T2VZQmdkZEFPWmlOUjQxSmJGZ3puWUhrYnkvTnZ4NmQ5MDF4Kzh2Qk85Y3Vj?=
 =?utf-8?B?bi9wRFRGOXBGZklHY1VGaEVXYVN0UG9Fd1NTeWF2YVRjVG95T05pbmQ0aVpS?=
 =?utf-8?B?MDUxaTZiRVo3RnFrY2JJaE9CQXJPYmZYek4vT3lqaEFTWng0MExxOEl3SG85?=
 =?utf-8?B?YTFhZHZPL3pLYUtPeTE0QUJQNFlpbzBwQ2MvakxuTFU1anc5T21ZK05CZHVw?=
 =?utf-8?B?Mm5UUnB6VlRXSnp5d2c2Z0NQbEFIMjAxZ0FDL3ZIc2h3cVBiWHBjTXVtUFRn?=
 =?utf-8?B?eEVJTmhLeGlWc1Fsa3FmWUEwUmp2UDc2d0RjdFZlRnhJWFAxcEFCTjZySFZX?=
 =?utf-8?B?bE92bUh0cEpHT3BULzErNHhIWmczOU0rb2JVVnZQUDBjQmV2RCtZWk9pT0o5?=
 =?utf-8?B?amMzZ0dFMWVHVzdDZFptVmI0ZGFvWitJRmJnVUJFV1VhcmQvZ2ZJa1BmZDNB?=
 =?utf-8?B?ZDVET3pRZHdtd0h5NEVDYUN2MGt6UG8xdTV2cWNRSEJsbUZkS0kvSHFTWnRW?=
 =?utf-8?B?bk9aV2RmRlVjbUZveVd3UHkwVmV0SWdCemNkcXdSVlpCdWtqdTd6Y3FJMzJN?=
 =?utf-8?B?eGxzUDBoTlVScGI4RG43SjNvNWFuMHEvWFI1YnJ2aExHNVl6OW1BT0h6RW9P?=
 =?utf-8?B?WGZkUXhQVENiRzZtRmRjSDBuaU1VdzJKa3J6cTFTdStKV3NsTFpyOE5hSk1n?=
 =?utf-8?B?bCtlL0VBZlgzYi9lZlVZUXBKMGFUTldDS09PcFdqMTJESFQ5QWhsdkwxTUNJ?=
 =?utf-8?B?RUNzWkg1a1czODJ6cGtEWEowbUFLTnVnU2dmdGF5QUhFQis1MVJJVnNKQ3Bu?=
 =?utf-8?B?V1pmdHlJdnIyZDNSd1hTMTN4OTd0czlVa0MvTGd1aGxpdUgrOWRCd0ViWk1M?=
 =?utf-8?Q?Zu1hSbJY255b4bAJfZxT2oc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b94113-f8b6-49b7-56a7-08d9eafa018e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 11:56:13.7356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXgHF6YQcNCdYoeD9ShA/Iy5VBAzRIw2DqNHDd+Bfc+Bfd+0gm3l3ZQW6QpXBte8HhVxE9/Y76Za9Qw9hm0xzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4266
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

> I think you should go with local patch honestly.
> As the patch is now.

> --
> Giulio Benetti
> Benetti Engineering sas

Ok.  Please go ahead and start building with the patch as is.  I have tested it on my side.  It builds and runs without needing any manual steps.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
