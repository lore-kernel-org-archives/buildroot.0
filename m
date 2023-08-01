Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668FCC0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40AE61154;
	Tue,  1 Aug 2023 21:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F40AE61154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_46mhdbg7Aq; Tue,  1 Aug 2023 21:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 259026005E;
	Tue,  1 Aug 2023 21:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 259026005E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 296731BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3788440AA2
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3788440AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ugNBTGx2kV3c for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:30:10 +0000 (UTC)
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7005::712])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA23540CC8
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA23540CC8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQVploF1BAGZ6t3DM2uMH9jNRgkqkw39jCFe/oWia72AsyDVoK9c3ZPkHg+RDcepuVJ/f8EbNoOa2vjxlPrbsxZaEdrCKbHf92OGA49xxvJ+aSq/rpftXeHuRYw1NxovbPW4y97HyTh01hacPk/9jxQynkKV5hKI1nLrMU6lg4iZmNbv3Im5GGZGCKV/VoFY3RVvmZX+ditENSvu922mUyJZa0JH2DEq7z4onfNSvIF5GAxtal1Df5UpUlnKU+N+VH5C4ohxjj+fsbBu7sxTQi2YcvvEnqAdiPa51dL1snyu2GJRos0UOCffmcAIOd1N647zHjN7G+/Zow3wPep0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I3aeYcoYXvWe3HcWsCan30Iwl0Pfp7w8sRTwZIXSKo=;
 b=Tn/dXCORc1w9+sYSPL+uum9J9P9s+6fIUK7d2HKacwBBnTiBSU/2TF42715OJjav7FWEAX9MJHqkAlQ19H1VGNqjf2VT6YkfXc1Wh6I2mHOgNPluMZdkEEZwsBJaaziI24W7gincfSG0hqSmBIo3KVgJDbrMDsJ7QkR35G1TZeWnMsjIHwAnkcPEVoFGu8Igs6CBz9hn2iUQIeKfflHz0JO626ysf6U4x0gYa5iRfnXxFnarnN7RolWPTRDdojpMvZb1qT7xPa1FJJOTCwSyB4fzqpoJVVKwgPNZxG4ZL36aD1mXLQ7Dfu3k+XXtxGVCX+bXyNh4rsH++5QNdjDX5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com (2603:10c6:1:25::22) by
 ME2PR01MB5748.ausprd01.prod.outlook.com (2603:10c6:220:d2::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.45; Tue, 1 Aug 2023 21:30:03 +0000
Received: from SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::c574:9949:1619:eac5]) by SY2PR01MB2778.ausprd01.prod.outlook.com
 ([fe80::c574:9949:1619:eac5%3]) with mapi id 15.20.6631.045; Tue, 1 Aug 2023
 21:30:03 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] Update schedule of sources.buildroot.org
Thread-Index: AdnEMbW/GqCIjib8R+iHlW1XZFDX9QALs1gAABewrWA=
Date: Tue, 1 Aug 2023 21:30:02 +0000
Message-ID: <SY2PR01MB2778658D3FA17984F3E654C2940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <20230801121118.72610acf@windsurf>
In-Reply-To: <20230801121118.72610acf@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY2PR01MB2778:EE_|ME2PR01MB5748:EE_
x-ms-office365-filtering-correlation-id: d0cc9e40-4d9b-4a71-e58c-08db92d67799
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nhw8FZ3y2J5v/JVmvyOJ+QoTpI+/i2xNogPae1IWTsZcNvOFNuxqS96eLXyH/kliMqNSLsBdJoP6Bncxu6to5dS6JDdtoUEW5lO9p2sQbKc10QKhjcdmFI3+6XWZFvnyQJuu+/7bqfYRdnpT+MlFbeDmlEliskyyBZUYhZUYWgpj6RXu6nbQg8qkxaSWCJnLe6LbxCaltjjf9VUm6rg+0DZxBoBKTeTRx5lYjEPJTjZ9pgL2kgjc7haWbQCqozYbEc+TMRtm9dSPgnzKoOEHilAe/XQcFbWvxQhhR98Q3liPOrdLxwchN9SAqylXKmZe04gcwZObg27IGQf4X1vylVXS+EjLg+T0tckPjjprqdlh6zEY7zQLqZX+ehN5/N7BCzhZ98IghwVQh/e1v/He/48n4xq9OWnlhqbPGUQN7r5KHy2v5F6G2HxEEx9RhLd59kqbFX/fAYLa4UWildE24fplEG8mQrjCh5UfSFyhptWWTezYE5VZQWdZQh1NjXobd2oNE2gH3QmiRxiKIOoMlZPYL34WvNgS3/mzMJ48OPZQHG4CVJ8lru7QwO50wke+cOUc9q4szKz79ub+JGYjM0PzXu9jlliTiqRiYvowJLw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SY2PR01MB2778.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(55016003)(2906002)(7696005)(8676002)(8936002)(15650500001)(41300700001)(316002)(4326008)(66476007)(66446008)(66556008)(6916009)(64756008)(76116006)(66946007)(478600001)(71200400001)(83380400001)(122000001)(186003)(9686003)(38100700002)(52536014)(53546011)(6506007)(26005)(966005)(86362001)(33656002)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?okxc7aYHqDJ1VFHJC7lNiHpQT5zSmWfBuTDyjWdvzx2cYyLS2W07EFbO97XY?=
 =?us-ascii?Q?W+I9/ZsJYRhMLEDcdUHiGpoAeML0sxvVWOWycExQ0edGMsoyENgXorxiVXrS?=
 =?us-ascii?Q?ws2St2A+cYEApQKaaSZu31sT9G9eYMJbgOsq8CBEonuc9G06YIhXo4+cqZTy?=
 =?us-ascii?Q?5xeaWA4joZP/ickE+PIcL/vrWexCEPwd45ZRmhLfV1VjXxJnmo85sLGhkqar?=
 =?us-ascii?Q?a5j6CINyjhAV8l8r2ATgr/ZRN/ssb+ZYrk2UuebLeL5T0B4ciTW+6hjIJyTS?=
 =?us-ascii?Q?jOQtw7fex1bpsynNxvA18+nNG83xgiNtlksj/T+c/KBjTZAeLhd8eE4FFF1r?=
 =?us-ascii?Q?mMTdOiXg71mgaGPcyTHdWXGWusep6xT8ecdrE8MzUXhHpYSixXW27KVFck3X?=
 =?us-ascii?Q?6z97+5/fnSPUEUKGu7v7H94Ad5DFd91Xk4En2QNPVp6NOC3t34ATPuzUTdQb?=
 =?us-ascii?Q?dgC58U5E6R9fCokMpvT1SA+XAoG1df5UP7AAQyr9Mq6+EmyvlGczI81pDyyr?=
 =?us-ascii?Q?10pU1o2A1h5znuvgOM4hJEqIHRHilvuM6aDAny0wvMb1mI08kVU4Zvz1xzK7?=
 =?us-ascii?Q?xJ13sKYylijqRZMgwHidhWFbdSxdZcXaZqVsgBfJ6Rkr3SYCfsmy7fYGncMT?=
 =?us-ascii?Q?eYodyQ/2m/w4Sn3IvdtWp0JMEIsJGE+kYZ0GbMMtuYB4zybPgveqQE8BqCgu?=
 =?us-ascii?Q?MYdisc1fj5UFcM3YcKbHGYSrNsg2i2odCzoEQrdWzf/rTAHlgA7Y2sJye8Mf?=
 =?us-ascii?Q?dbzoWSLFVBiuZyPSTFzyJ/BhnKLFwyd0siy+gnw6BH19tuKmTje4Sr42VXtq?=
 =?us-ascii?Q?uW7am58stBTHJspQM77W7lLhyfRMzbJuogGytDJIjjO7CPhZ6B2rRo8WXlvn?=
 =?us-ascii?Q?vqor9RLVIWPASOsI23LWRsbicqUaIrZbXIABnY4C42FHQBj+ajIygzpuWiRD?=
 =?us-ascii?Q?5S6PutjqIkIkQeN1lkMCA2KQo1huySKJSzCIIxO65nEC/tDCPe09fmQCpDMh?=
 =?us-ascii?Q?Tj09MBbuB6M3W76ENvPQO8DMVC7MWy+0GvfJT2RO3XrUPZB7RFygLe7NN+k+?=
 =?us-ascii?Q?vLK0JXFw0M5CimzhTiF+78Y5TzJBQtk9C0Igxq8OnzrhouvrpcngopoGYTNU?=
 =?us-ascii?Q?OR6WBTI18VzNpjC9Z5AaFJXHnHL9C3mzW5DqPooTpTkzFmYe/7zgp+64b4Hg?=
 =?us-ascii?Q?BqCJR8D2ZmNxz+434bdeo6H2z+HwR9hQJqWV7Fpo80uO7u5SjV8MU0DgWQCm?=
 =?us-ascii?Q?zawnxz0uDkPNVsStuCPQNoM9pb7glsCCCTrDXI87DKvmmKFv3j2xHKhUfzrE?=
 =?us-ascii?Q?JYNYTkIkntDrNXHDXHzkpcyGg8mdJgK0DdQmaHMeUnqIiDql8k9JniltJJcu?=
 =?us-ascii?Q?WiAZ2elbc9GLARfljyRh2TL+77BoFr2FmjXWNIatOKsH9FZijR6iSVgak1qq?=
 =?us-ascii?Q?q+3HIIdMt4tXcOkG8yNVe3GHdp8DaPaCV/tijZ33DcmTSkqiLWdRK7Uowqht?=
 =?us-ascii?Q?wjcge0X/X1478OxKhTXIL+t6x6cZCFJtl2vnsK2ho5PUM4b3G0ZNfRhpXV/O?=
 =?us-ascii?Q?DSyDt6QotdseAkc+VOftrHEi2LFhphuN8be2imQn?=
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY2PR01MB2778.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cc9e40-4d9b-4a71-e58c-08db92d67799
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 21:30:02.9888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTghO915a78BvpTa3dpxd7V3BTiUzHfooYaEsuh9usITfJZw4R6Oc4fOr2oBUNHVOxk0u0os73FbBFj8YSkPSLPdYOe/58pAVTisokz240s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB5748
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I3aeYcoYXvWe3HcWsCan30Iwl0Pfp7w8sRTwZIXSKo=;
 b=oIpZc2Mu0n7qbbkq4X04gu8rHPjR4pXwHNVolm6G/V6EmV/R6g6gQZGJrMzrZ3+1/iSsdg4GD3cDsysoQ9OQ/7FC6EnftM42iudbLy2FtaWR9xZG2GrvWvtf6ZVJlwTdKioaM8OddlPV49mEjp8RMZlx8RQpbZjNfc429vEyKKjbVRiemqWhgNI3zEbhtlg9r+vIGc9TBsRuii3CFJ6WkKkK+z4O4vbRRuJetZBrMEU5pTvgteMIHTlLz4FmcHcC52/Xa19GLMkHyOtfiD0oexLEQDNA0Q8DyYu8QjETJ74dLlvss//ad8E86nG3A8lS2yrpP6Wu8BnCTgQeSXvR0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector2 header.b=oIpZc2Mu
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks a lot for the update.

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Tuesday, August 1, 2023 10:11 PM
To: Afshin Pir <Afshin.Pir@gallagher.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org

[You don't often get email from thomas.petazzoni@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

Hello Afshin,

On Tue, 1 Aug 2023 04:36:24 +0000
Afshin Pir <Afshin.Pir@gallagher.com> wrote:

> I wonder when http://sources.buildroot.org is updated normally.
> Because from what I see, it is normally updates pretty quickly when
> packages are changed, but there has been no update for last 2 weeks
> while some packages like openssh have been updated.

It is normally updated constantly. I see right now the script from Peter Korsgaard is running on the machine to do the update. But I indeed see in http://sources.buildroot.net/openssh/ that the latest openssh version is not there even though the bump was done quite some time ago. I'll try to see what's going on, though it's usually Peter that takes care of maintaining this part of the infrastructure, so I'm not super familiar with it.

Best regards,

Thomas
--
Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel engineering and training https://bootlin.com
________________________________
 This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
________________________________
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
