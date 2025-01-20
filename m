Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F38FC02185
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 08:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA41660797;
	Mon, 20 Jan 2025 08:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JFzW7GE_UpA; Mon, 20 Jan 2025 08:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF31C607D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF31C607D8;
	Mon, 20 Jan 2025 08:56:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A464A69
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 08:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7289C408A6
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 08:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8umOEaLqK-qZ for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 08:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::623;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A173A408A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A173A408A5
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::623])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A173A408A5
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 08:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3eGE+rZhVGxaVoxC7iP4MIC6+8NKEApJ+i3HOvCfkEfJ8OJU+TX5y5UEkdNpqi8yfIXfnqjn2O/rKMcvN0GdWPITYe2Jobsgl0gLtwKpBN+0SHae7z2fuxRaVOW8CtyLFyCyni5nyMt/mHNOKnKOqXHJlsuqtFJ1Xgt5lKsl9aq/F/MNVA6ORTY2jRVGT9aEK5WhspcxhXbhCwxih4HQCPu1h11ax4EkcyojQ//FMke55e0JBkC717a1g2LJKOmlOVMOQg3nAiO3nxR0atUfD2VohM9tAchbjcvBj7WYqoVQJdChBfWg+8YZeB3qCPMZujMm4Vtrj/Vgw7pazfw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7z78Ne0stSfLstR5OC8D/yC3m2CcX3rotquEjDvJEwk=;
 b=DkM/s1VvSqzH1Fszdc3nYykxaDqcg4a3MDZok7GWIoE6Myw4gBBsUigyacWPmra7L2GUD4MkbNPevA2IY8pKEAB1QyCsRsxUj6OReVowXTxOCSMPC/mRXDtdoaBbNoC8pn9KTSht/ZKWCsZirXkYEztWWXB39fWC+h3Z8nzYCB3g9IvH5yGqx32Mk4xlr1XzyKaw7h+CfeUhl5pQTUvlpiG1M4cnSOJ8RgQVAqnWnw/hh5DhGMnQmGXXGX7K5OHtz+1rnZJgIeLEzVi7V4ueEVwohZFJQVZJoJYuOdWNAD/3U4hdvcCvLdQ4+rABkW7qmSuo7nDDNd1/1erXhwfOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MW3PR12MB4426.namprd12.prod.outlook.com (2603:10b6:303:58::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:56:44 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:56:44 +0000
To: Julien Olivain <ju.o@free.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/4] boot/xilinx-embeddedsw: new boot
 package
Thread-Index: AQHbYPWBhVaRfB4GtEOH90lZwahO9rMeJsGAgAFGOlA=
Date: Mon, 20 Jan 2025 08:56:44 +0000
Message-ID: <SA1PR12MB561580FBB5E6EA1A8827619BF0E72@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250107111540.1548042-1-neal.frager@amd.com>
 <51444d47c6d11c0e28f5cc634a4d8272@free.fr>
In-Reply-To: <51444d47c6d11c0e28f5cc634a4d8272@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MW3PR12MB4426:EE_
x-ms-office365-filtering-correlation-id: 8224b7fc-7990-4d81-a893-08dd39305d3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?035GDUa7sYqiN2mjsVqPdH1zl6mcvy65piR1F8dviR4ckfW0K0+RweNWXUZ/?=
 =?us-ascii?Q?/rNvQav9vsHkY81ekISCMc+hkIx6IxTqvPMo3NtZzqOm++2bFDpZoIycyuZk?=
 =?us-ascii?Q?I9CGFQhPwo+omL9hpukJupUE03CXnvgRINdvk9hkBBwBbgnqYy6k/wcURcTH?=
 =?us-ascii?Q?m4kaM5nRRj7L06XLHLYkQVO+19bXV1Do2rrh6hfQ27Jpq156+l0fQEvGmne5?=
 =?us-ascii?Q?/N0m2gvnVW45R86091YsE1djbK54rbexe7OlWOsvq9gmYiRdIfbxbtTsxn9/?=
 =?us-ascii?Q?jAlp66S+jaqE03YVvX8lli03zgPNWmJfwjdIR3RUDxscSDQzNv+JPtjfb4nr?=
 =?us-ascii?Q?pjg9Nt1KYQhrVzFqWnn4nKZFmJnH7gBBaqpDj2fR3ndKqOl2bBJpF2H1tSAa?=
 =?us-ascii?Q?DF9JfwjNlaqna/VZVO3YAFbVCpdIkIhukSvOMoTMVVIOLKzigr2yNqLSvwdy?=
 =?us-ascii?Q?PTubbzw+LUwaLzwK5UAbYy0W+CAErImzFFxF8y//W3auiNWLYSuUhJxICREJ?=
 =?us-ascii?Q?cYdu5GsyP8J6zoAqOANyN3eNM2svtoOavEnK0f7eOmvafdTVu0Gb/L8Uyncq?=
 =?us-ascii?Q?Ks6+6GCB22fFMfaQ575lCeFVgzN0GgBhMCwmFmDqDazwFfGRwLLIgsY1IYmT?=
 =?us-ascii?Q?4FCkCJ87axMtrYRIQE9YMljmQpjJSlkbQJqNFHwhu/pAK+xeb5FbFO3+d/J9?=
 =?us-ascii?Q?YqRIfKm8n7TVuamZlQ4Ff48Ri8oSw1mt8/du0+ORytVEQvVswQePeAnBfV/R?=
 =?us-ascii?Q?I2+IzIHDtQOe9WT3McPJ2fkeEBIQGznThDl34gaiWOe0UtgCYQjXtAo5CDwY?=
 =?us-ascii?Q?2lcqSqnhi1rw6u6Fy3YYtdBgWGzBFu22rUN7B8cBHPPLUks/OmvjK9uXziV2?=
 =?us-ascii?Q?UrxE38gK1Nj1HCqCufl9W0C0jmvsVl3GnWn3gIwm/4ZD9DfbkCRDgtCV9gXA?=
 =?us-ascii?Q?bYyEItU6j1R1plMUsuhVTZDCDTaVnenRVBjvND0p+g11u1UCQuDSDaCffvMi?=
 =?us-ascii?Q?QuQsZPGVhr44gRv5iD1PbQqCqpWOpzTR/1ZGVH1i9e4gv0Wr4L0JXUVhZ5d+?=
 =?us-ascii?Q?BHg1LIe22wA/MROyDfca2FSSJWM0AyeOqGTsmmJIESmPwAMff7m6P+yuSRpQ?=
 =?us-ascii?Q?ObG6L/lT6yhjNxxebkBVyrjKhR7etgTckFD9PPPrBBU7uuzYrOTtuT4ip8GR?=
 =?us-ascii?Q?SwPTei8kfujHNGR8Gl7VQZOxqV2xYtIk0E0EPGigkvF8C/qzhuc0mZZO0JUM?=
 =?us-ascii?Q?8GjYOkbFCVT434d16quRqsxqBzwNhn6d/h7/AQ3DvtcsD9a2RcS4HEJME+Lj?=
 =?us-ascii?Q?LYoVg55Qfexzs5kBYP3/jhQQPmA+sQ4hzyjjIA/tUz+FTcUz56mUbuTbZnnL?=
 =?us-ascii?Q?cvWoX6ef7ioPqic9txLEYJc+4WIPZfWmQXhl6FkGcLmQ5ianwnXRA14Cw07z?=
 =?us-ascii?Q?tugK6jX/0Lw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DhG+r6ttPLT2yiZpmkmNQyftVXUOT1JhEfIRwt0+bpclYAI3OiNUVzRAe5Ux?=
 =?us-ascii?Q?V7DfebbojB0LuhXl53lOTP6z8S6N8TjmcY9NblBccy6wDe0UJ6IWkENN1Wkz?=
 =?us-ascii?Q?cvewaAVRBBAMgOq9bYFlbzd9luvRqtlEh2W8yt+PKsmQIN+E2hLO5kEeqICO?=
 =?us-ascii?Q?Q5h3qSMKRp35xwiKxLWx72W5BkKPNME5Q4Nfljxx4k6M+EBzliRDMt47T+79?=
 =?us-ascii?Q?xxeSsi7QbaHkNWWfjSpx3RzTaPRdySmBqiS40bY5H2cX50FvUvEJ9CmzUKHg?=
 =?us-ascii?Q?xW1w4MPgCp+gRcaEsUmtUmcMGULIhQjLcUNvgOuHzVoUgMAbZqmTPHfJ7tBh?=
 =?us-ascii?Q?lMA/MUPRYl2mNKwnorFixlX+C7L1MVfn07UNpWPmeeuEZmBC9fULsr+dhYAR?=
 =?us-ascii?Q?i8916aaX8ueha5ssQAfYGuoWlgJzBOc2kI9JjI+ewxxKWn/l/lFS6lFYcWDS?=
 =?us-ascii?Q?udqK2TkvUFmLPU1Vx9miN8jG41vYsfJwvw775GvnX3ONhAbFodgXpC53U2Wq?=
 =?us-ascii?Q?ozaEghJY2ijrB0s8Xx+9l7tYmq9mXn4k7d2VBz9zf1R1Q3F3RNwKeu+z/0pl?=
 =?us-ascii?Q?0aOQ2XL3FwPCqtPQhg+EFf7G29CfUydqdlf2mGovTAWJgJCwoLeavTZxWFQE?=
 =?us-ascii?Q?LL9QhtzdetFFbA89kkOPHgRWHr8uiyFKePovdmbB3zFIFlxBzmodPTOzAkeW?=
 =?us-ascii?Q?hQulLzTwIOzCOwltV2rB977erghiKDuP6gUQ2AmZ4gFMjyXtY9xuqGE3mDyL?=
 =?us-ascii?Q?YiMeq6PkoJfayIJn7/1P1nNwPxtTPeqzcvW/R25VHyFAAtBOI4GOo4MSZqfv?=
 =?us-ascii?Q?uoocqCEJ0RaJL0COyHXYlT1lF0Bo+lF92XtxlCuhvKdTQot0/g3AXTnfdBdm?=
 =?us-ascii?Q?9ipp7fBuJ71COVkQkjZlbcLAR/qw1f6CpUWX/kYAlX30Y7XEgOj5SxfHEtXt?=
 =?us-ascii?Q?ngLhUwqoIYpUjjTrbnxzE88tFT3Z5Y4peLNDnLBzE4Z+GDCcabY9a8ZjSJWu?=
 =?us-ascii?Q?mTl1T/mxUGGg0w0UnKVRAgFFIBLzEKcq58TG0yQzg5o5w+xitk468/uVqbYz?=
 =?us-ascii?Q?e/8j3q7g1Utw/vGRZyVwKDX74I4j5sVJRGR3ZDxcbIyxTvW3MTM3ayVjt/gj?=
 =?us-ascii?Q?GMwD8z8GO1iqsvvMBLZKXRv6xXA1yEKK1pMsu/OlFQEqPxyOqIsuMS9midl1?=
 =?us-ascii?Q?CgWTmWHtySrKkVlq9Yn7q3sawhQpqMkZkKf7zaSTjNvDYJh3oglBLySnljRo?=
 =?us-ascii?Q?Wu+cE9sWo315AXNvBJNpzJbbsRClCgnJhAeMsvgvY/31Mj0wJlMGRpSXoQYQ?=
 =?us-ascii?Q?6oEKNukM/T+fpSwGpIarkaMRUNwh1hdFftgKwDQB4e8Frk2T0H0epHcr5yKo?=
 =?us-ascii?Q?MdqJlS8gBIpx5rTfIa+IzvPix2fYvXrE+WBKullor1rens9pbuNHmHYfNXep?=
 =?us-ascii?Q?xSI3Pi/GXbsFQfqVYrxuZDtsuCg5k/ebRq11GtBZkBzHkAFqjMOfodqySLBk?=
 =?us-ascii?Q?VCdkCVVirdgkxdUXIO4iOLJ6e1Ie/sJh6ybgk5RPzSQ5hgB9VxAqf8mc1VW0?=
 =?us-ascii?Q?YQGVXr5xVJt78n2w/wg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8224b7fc-7990-4d81-a893-08dd39305d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 08:56:44.1607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CPKTvvKYMKgyfxSTgzXyu8lh+biDuABF5VhbbUyx5oAEvoqMqgpkvbsYXRs006e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4426
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z78Ne0stSfLstR5OC8D/yC3m2CcX3rotquEjDvJEwk=;
 b=OBg00QpQNGbpSYFSxvr0J6vNJ8vou9xh3B5Zx3sQkJcnFTykJefBIlGfppulv0sMorpMPlmBsUgjeJiT07ZWHDmAdeYW/4KfMdhyMhxZWOIHsBmJ5ggnhftWW0IvqgSrVddS/ghzUNEudHlMkPuYMm9NDs8Lyx2C9WQ7YMnUAas=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OBg00QpQ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/4] boot/xilinx-embeddedsw: new boot
 package
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

> Thanks for the patches.

Thank you for the review!

> This patch adds a new boot package to Buildroot for building boot 
> firmware
> applications from the https://github.com/Xilinx/embeddedsw repo.
> 
> If a user chooses to build a boot firmware application, it will not be
> installed by the xilinx-prebuilt package since it will come from the
> xilinx-embeddedsw package.  In this way, users can mix and match 
> applications
> to be built by the xilinx-embeddedsw package and applications to be 
> copied
> from the xilinx-prebuilt package.  This is necessary for the versal 
> platform
> because the pdi file can only be built by AMD Vivado.
> 
> Support for additional applications in the 
> https://github.com/Xilinx/embeddedsw
> repo can always be added to this package as needed or requested.
> 
> The xilinx-embeddedsw package replaces previous solutions including
> zynqmp-firmware, versal-firmware and xilinx-source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> It generates few check-package errors. Running:

>     utils/docker-run make check-package

> Outputs:

>     boot/xilinx-embeddedsw/Config.in:6: help text: <tab><2 spaces><62 
> chars> (https://nightly.buildroot.org/#writing-rules-config-in)
>     boot/xilinx-embeddedsw/Config.in:7: help text: <tab><2 spaces><62 
> chars> (https://nightly.buildroot.org/#writing-rules-config-in)
>      boot/xilinx-embeddedsw/Config.in:9: help text: <tab><2 spaces><62 
> chars> (https://nightly.buildroot.org/#writing-rules-config-in)
>     boot/xilinx-embeddedsw/Config.in:10: help text: <tab><2 spaces><62 
> chars> (https://nightly.buildroot.org/#writing-rules-config-in)
>     boot/xilinx-embeddedsw/Config.in:12: line contains trailing 
> whitespace
>     boot/xilinx-embeddedsw/Config.in:35: line contains trailing 
> whitespace
>     boot/xilinx-embeddedsw/Config.in:45: line contains trailing 
> whitespace
>     boot/xilinx-embeddedsw/Config.in:55: line contains trailing 
> whitespace
>     boot/xilinx-embeddedsw/Config.in:62: line contains trailing 
> whitespace
>      boot/xilinx-prebuilt/Config.in:9: line contains trailing whitespace

> Could you fix those errors, please?

Sorry about this.  I do not know how I missed these.  All of these
issues will be fixed in v2.

> diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash 
> b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
> new file mode 100644
> index 0000000000..fe0f1388b7
> --- /dev/null
> +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> 550ba0b206848adb0085bc1ca5a6b6731681335c92912afb4a6a8dbb4c489a0c  
> xilinx-embeddedsw-xilinx_v2024.2.tar.gz

> The hash for the license file is missing here. In a config enabling
> the package, running:

>     make xilinx-embeddedsw-legal-info

> Fails with output:

>     ERROR: No hash found for LICENSE

> Could you add the license hash which is valid for the default version?

Thank you for catching this.

Unfortunately, the LICENSE file for the xilinx-embeddedsw repo is called
license.txt.  I added a hash for this file, but it still causes an error
message when I run:

	make xilinx-embeddedsw-legal-info
	
Do you have an idea for how to solve this?  Could we update the
"make <package>-legal-info" to support repos that have a license file
called license.txt instead of LICENSE?

https://github.com/Xilinx/embeddedsw/blob/master/license.txt

For now, I could add a temporary patch that makes a link of the file LICENSE
to license.txt to temporarily solve the issue.

I see that the LICENSE file of the xilinx-prebuilt package is also missing
a hash.  I will submit a patch to fix this as well.

At least the file is called LICENSE in the xilinx-prebuilt repo.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
