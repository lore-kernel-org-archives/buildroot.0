Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384C0C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 12:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2AEE41738;
	Thu, 26 Oct 2023 11:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2AEE41738
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Wb0pMQeZVoU; Thu, 26 Oct 2023 11:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B911441841;
	Thu, 26 Oct 2023 11:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B911441841
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0E51BF239
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9242612CA
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 11:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9242612CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rn9IL-tcO2GW for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 11:59:55 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E8CA612BA
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 11:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E8CA612BA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Icyy5TOfvjtEktd8zuuUQi1IiPmGzgiXtNdICnvhLzNqSzW71Zi7tAJMmDYMRLCjpNmHbW07VSf6oidRRm9M8ynjWj2/CJ9njIl8MkdVjwtWS8KwPKjFAGt8VW4L0fGmBokHa17Aq6cHAAtmGzoTiEZHaoBNoU/VB/iCMqufO9Z4vkt5lcmGrvpU0bVk3OQtHZUQrzPWGrsXYTfnHFY3YtJpJKgvNXhJ7a/Z5WCH7FEqIG+3gYZl5xGT9zSGC5ZDhVgiBx6u7tsI5dIg87OE0b1f0NpYy0zC/jgET1+prg4Ff+1rPcROVvvtTGFFcLUsHYv48mtOpoZTyz0Jvg2ZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+sG8bZjpRgu8q3Huuijj0C0r6A5QTfjv6iLshLZfaE=;
 b=Katu0s/E2ms2yFw5R/tWQxt9VKnQulw0x2sqN3Ne5is1Nx2FgfkGLQdDsmEBLDmcO3OShR+qmmsYqrOpdAtCQ5sdep6wORgnGOqw2slGRXIbMrYvT9OltmzRTH2nSIltM2+DS8rwBVhY/y0t1xfy3Ob/NXDSIXwwbdoTwfryX5oE76iC2OiEawYutikbLNQWrxGWSGGR8tbMgIStalBY4UTyr4Nj4CFRmC7/+/K3iZanCiBM+w7IDM2NNhYqZaKP2lKl8BOkXFQ/6u0UW6/Um9/mTfA66BYsgiEEtfMDnibC7qd2St3Uxpm4qTp1JTFsG1K2Y082NmlywrWRS16QMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB7648.namprd12.prod.outlook.com (2603:10b6:8:104::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 11:59:51 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6907.030; Thu, 26 Oct 2023
 11:59:51 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "peter@korsgaard.com" <peter@korsgaard.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v6 01/10] package/binutils-bare-metal: new package
Thread-Index: AQHaA0qRbywoKgTFjUeOg7I3CT54X7BcAAPw
Date: Thu, 26 Oct 2023 11:59:51 +0000
Message-ID: <CH2PR12MB5004508423983099FDFC857BF0DDA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB7648:EE_
x-ms-office365-filtering-correlation-id: 800d757b-6bb2-4fc8-92fa-08dbd61b0f4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2ped7GgnEtyFOilCISqHagCNajOapOTzf28fBGomW1kAt+HbqP/Itid44pRdUqqVOmQBYqjhuVNXwPW/lTKOvgriR4Gg31sKvoSb3Jq0atczH5mAxx2KtaVYktJYLEOsA/teyFLKW36xyrbbRsv8svkRmT3cbPbi7PvtY53uGALkXZ+P8YbPfuOPPzvpVbPAiQiuDf0yXo8j0m/cZehnPe7i6rgaFserwKMn0rPw2W7gBoVrU+v1B6Ghiwin3eQCX/rGcOi1D7+IOrYfvLr3sGR04Udrj1dQ3jfOW0xFv/fVUOYHcykpd5/1Csq1wX2Fp+Yc4lJuHPCdIWRV6X/9wCzakKgmg5JLa7sPkAnNGF7nmL1mqNwXTKspURTfJHRjZOfTv/v5evt0UatFkQZdpPTDlMdcuKpdgsI0Vzcx0I8Hq6/Wc9TrVgG3+awU41oAMaTHm49En5vTq2K2/I8qDqvwZ9tqdm49MPL/crBbiLFxNKaMUjS7GxHu0rSjUkCErbBNidhMjIfyuxQE1DER8iuYGyZl9GxoDSFP3J8NjFP4I+P1i/r1yY2sR2U603DvLbWfNf6z1HmG5P0/8xQT+Yt21c6puWDPxUzgzJ1evfepcxzmmCXuf5nGiF8FR+ay
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(346002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(8676002)(52536014)(8936002)(2906002)(41300700001)(4326008)(38070700009)(4744005)(5660300002)(7696005)(122000001)(71200400001)(38100700002)(6506007)(9686003)(83380400001)(33656002)(86362001)(66476007)(54906003)(66946007)(66446008)(64756008)(76116006)(110136005)(316002)(66556008)(478600001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TElrd0pzbTY0MEUvMnRCemozMS8vdHRXaENpTEZyRlV2ekwwMHJjblpXeGMv?=
 =?utf-8?B?VVhHRFB4b2U5ZVdtcVBZNjFXMHZDL0VtTkRkVmd2UEhRY1ZCb1g2OWcwaXYv?=
 =?utf-8?B?WVZBTXY5K2VSNEtDNXkxSGdEbkR3NnkwRmZMbmNQWkN6NzJqaXpFMER0TEdq?=
 =?utf-8?B?L3IvbmJ4OHk2QkV6Y3RDbkx4NnVVMjVpazZnWXAvYVdEM0F0bTZUUFgzb0Iw?=
 =?utf-8?B?QlcyZ2p3S0phbXNLaVNlNnRwaUk4S3Y0UVRWQlROM2RNOXdrNzhrVm1rWlIv?=
 =?utf-8?B?alI1cVdSZitKZnRuQUVnTkUxN1IyWGJCd294eHdZQjRlZzNoaFFFakxHd1VS?=
 =?utf-8?B?VTBPa1lJb2twcWFKR2Q3L1pLMjZpVTdqdkl1V25jb2p5b2loNXJqVFFWSDRO?=
 =?utf-8?B?eWo4eGREWGs0VTVzS2htUXg3MG1TYzNPTUpQYi8rZGQ1elc4MGRNK0p2aysx?=
 =?utf-8?B?UEw4Y0EwemRVUFRrU0NpUnJQazRaaWUwQXBhemE2aDJ3aGw0UGFQUVQ3Mmlv?=
 =?utf-8?B?bzRWWm9jd2piYzNjcWU4QzJqazkxamRkZzF5U3g2ME9LYUpuR3ZNWEVSVndC?=
 =?utf-8?B?Y1dSZll4dHo3UHNSZ29ON3pXaGpVUWlPQjlDRUJxUWttN1BWaHZ0RFFNZnNK?=
 =?utf-8?B?ay9qdkp3dy9hYVFBaXIwTkVCZEc2OElCbE1tVzExMk1pZzJuTTBpQXVScmxB?=
 =?utf-8?B?dmZUNVpxZGZpSnhuL3IrYjlBOU0zdTVPT2Q2cUFyY1J2Sy9mQTI3bnFobEcx?=
 =?utf-8?B?U1BKT3o5VHZXbGdzV3RVaFR0em4vTW1rdXZuVjJOOEo0NmJvQ3c4ZDFvSXV3?=
 =?utf-8?B?SDBTV0YraGwwL0hxK2pOM0tIS01oWVpxSmRscnBJL3RuTndzUHdQWWNxVUpC?=
 =?utf-8?B?a2NNMERxS00rNjdPOElXdCtqQVY3TXJuR2lIUzkzZm9lM0pQM0lVUDY2VkhY?=
 =?utf-8?B?cEhwTytQZDhxUThSL1ZnWFVNRmFETlZnSGp2K25yU3JRUmdvbHY2TkROa04y?=
 =?utf-8?B?WitCdkx3UDM3Slpaa0dVU21mejI4bU9Lb0hIVExneWFQRVlhbHVrMWNEZS94?=
 =?utf-8?B?MHY2ckczUW1WVU1yUWJ1dklYQmx0N05DdW8wRUFMcE1hQ3Q0SWowMmMyRW5o?=
 =?utf-8?B?S3hJSS9BcTlGV295Y1FJeEVkYWk3Ty9jU0x3MnZrYjBhY0JuZ2hiY3VPZ0V3?=
 =?utf-8?B?RFB1RlFPZnF3aXJ0bC9WN2FjZ3ZFa0FuRE5wRnBvYXA2RFg3cndJZTBtUmZH?=
 =?utf-8?B?ZisrM1ZOK0lVUEQ2Q2lPa2QzMGJuMVRRcldhcVEzZmhYYUxHWVhhM1NsTzRl?=
 =?utf-8?B?Z0dhK2FKT0lsV0JnbmMxcldJd3BFQUJjeGExSWgxaFlBU3RMTzRDU0JVZThy?=
 =?utf-8?B?SEkyTHNkNlNqVy9tZUlyUDM2RU5aSzRVVmswT3BBbCsyNkdMemZIN245Q3ox?=
 =?utf-8?B?ZkZORkw2MlBFZHFMTHBGY2U3b2gybGxzWHJTMThmOFYzUHRQSjA5LzZkZTlj?=
 =?utf-8?B?NnVNd1pVTENORU1MOUVQa1ZVN3pOS2FpdkV6Y2pGWFBoVGNGWG9qVVFOWnAx?=
 =?utf-8?B?U3lXZzFCN2VxVUpCS2xNdDV6elkxeUNXQTZteXZCZ2ZKakRzV1gra0crYTU3?=
 =?utf-8?B?MktvZjZpbWxlc2VVQURPTXVXUkQvaHpHcG9ncCt0SVN6eDIrSUV2bzg2aVll?=
 =?utf-8?B?RkZuY1pybGpWSkVYNVU0aW80aHo5OTJ0RVZJWnVHbWt1Z1BxZ0V4VkE3VHhL?=
 =?utf-8?B?eURnWlZtb0RlazNtMHM2WFFDbkVjc29aWWV6R2JwcENWOEdUMDdpaTN4aTlz?=
 =?utf-8?B?LzJnZVdRZlVNRzNMdTN0dlh4dGtnOTd2TkR4dGR3Nmt3cHZNaFN2aGFLSGxk?=
 =?utf-8?B?MXp4aFhMVzV5ekwzQmtDYTFHTFUzSFpDR3R2YWtGOURQWEZXRGJtWElGclFZ?=
 =?utf-8?B?TmFnTmFjdGg3emMrV1Z6TWE2OEpoSmNEdkRFeU82MmdqWWw5aFpGWkhOZ3gv?=
 =?utf-8?B?M1JtZGVCVGF1dmUrZWE5SWF1VDk4QWp0ZFRacmpnYmlYZDVUWDZJd01nYkZv?=
 =?utf-8?B?TER3KzlUdWVmbTlkQjRwT2FBbkNrbW1uWHlRY0hOdFpIQXRYSW95emRuUzdT?=
 =?utf-8?B?a3pnU3Y2VVJtME0wUDByaFpKdldsQ2Zzc1BYanVrMEdrbXl1c0dLd3VPcVhN?=
 =?utf-8?Q?Y6Zgf/qUQ/fpem+UceXYH4o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800d757b-6bb2-4fc8-92fa-08dbd61b0f4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 11:59:51.2062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NbTl7JfrkRsgvw3Pjk6l/hN7qwZhY3rkKMxmRAVybY4iCwYrQdEGwg8w+Gdp6iUd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7648
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+sG8bZjpRgu8q3Huuijj0C0r6A5QTfjv6iLshLZfaE=;
 b=cgEwv/lnNrmlx4pKvmwGnjiyS7HZ1TvYTnpvWMJUb0yShIpoXWehQpGQwLx8h9MogNtWKogG6nn+qXEy+kmA+uesNKXOW4EQT52EB7QFaac/Jb3O+7S65kjqzuGGp20wv8Lh2NFi36sVJv3hbgy5FkgwSLZ01oLqhPYCS7nQw2I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cgEwv/ln
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v6 01/10] package/binutils-bare-metal: new
 package
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca, Peter, Thomas,

> This patch adds a new package for building binutils for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration will be a Xilinx microblaze little endian architecture, so that buildroot will be able to build the microblaze firmware applications for zynqmp and versal.

Do you have any thoughts regarding this patch set for adding a bare-metal toolchain to buildroot for building the zynqmp and versal microblaze firmware applications?

We now have everything ready to bump the zynqmp and versal defconfigs to xilinx_v2023.2.  Could you please let me know whether you think I should be bumping the defconfigs to 2023.2 using pre-built images or moving the defconfigs to building the microblaze firmware applications from source?

Thanks in advance for your feedback.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
