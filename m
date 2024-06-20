Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42587C2BA18
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 13:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E013E400D6;
	Thu, 20 Jun 2024 13:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWw4LA2jrWct; Thu, 20 Jun 2024 13:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A93FC40529
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A93FC40529;
	Thu, 20 Jun 2024 13:33:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 386501BF852
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 13:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1965042F34
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 13:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsGVXXO4xW45 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 13:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::616;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD3CE42F33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD3CE42F33
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::616])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD3CE42F33
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 13:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTESepdgvu4OPkqTbyIbSzEaSPFXOld35biuwRTTjPUqtbSZhUrXXAlAL0cRt+i/iVyhkxLGb5NF6vW4F/PBsVmj0RGvE6QVtCfkIvNwtcR7u4GT29tqyJD3+sFp2NDo87IXqGpcKlCThl6/YHCYsPdoY8dzZOiVLxHHrvmnMlgngGtjcPxGGRDS4lFMgnUMiF3hFHoK23Jquq4X+i14WgIATR6fm4VceT8EkwF8NjkDD9ZHU9S1pY1QobAH8Um/x684y/enHMQbwOtRKR4EbltRgZGTjiCZ47uHMRD3g7AflTabsqKkbSL4AHFPmfDiwmqxOV9gb1oJcjCXN8fpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWO7BGrUl4+M1gOdR15GHAb7Q1B3l7c0T8yqDuU3Egg=;
 b=Zy2fPt9cXNNq4sZkDtPBZHdfMAB+OcDqU69pcOPB6/701/9w9NGWfQz1AnnZfoQIzhFHIYl6FPxd72mwYVIry3PO31S8trKD9Bidt35wSDeGfsRwiPur2VXrM25BXpmOlyYRiQYg1Pae/p0ycYJqj2tA9J08gT+KassLC3H1YVhffB0JsBp3Is0yca5MJ0PDTM3xghTzxpcNQdYr4v7a4TxEyENLJZEYyGMcWKQw5WhHQ4PFhkkQXFgdi/idUkEy+LYu0eGqYwZqXjTOP5WmoYqYiGXcaQwifM/mi7VtJ0Ugb9b4AnVi/JXeErxB5zNk4eM1yDm2Mjczb52Xq5oBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DS7PR12MB6021.namprd12.prod.outlook.com (2603:10b6:8:87::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.19; Thu, 20 Jun 2024 13:33:04 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7698.019; Thu, 20 Jun 2024
 13:33:03 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] board/xilinx: re-add hash file for xilinx-prebuilt
Thread-Index: AQHawxUClYY1HYkxqE6aH4rWLdd6/bHQpOpw
Date: Thu, 20 Jun 2024 13:33:03 +0000
Message-ID: <CH2PR12MB500403A5982F031A0ABA5AA1F0C82@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240616070849.2608438-1-yann.morin.1998@free.fr>
In-Reply-To: <20240616070849.2608438-1-yann.morin.1998@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DS7PR12MB6021:EE_
x-ms-office365-filtering-correlation-id: 45acff8c-e32e-40b1-0cce-08dc912d8303
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|366013|376011|38070700015|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?WEpbDKsFPTE2jmd5eNHZfZAkeTI2+9YbedwmGP/GbKtkvc/wBO+9pSFob/UB?=
 =?us-ascii?Q?y2HKn6LByWxVQfzfe7J/sApC45fmR+nG68urTUceFyba64WOv5hpG/4F5jVK?=
 =?us-ascii?Q?CE+o5mk4U7otTO9Tf+VV3HAPdL7CfrhVmbGhH4KC6PYWyAiTc/8cUvssJ4Vv?=
 =?us-ascii?Q?u5303v51aMPvXl2bEEUwyFQGn4K1SR+f9RJIxO90sY+VK/oyKmiCAJXO9H+M?=
 =?us-ascii?Q?hWYgRjTaKS+3XpCHkQBnAdSAz3c74y0aX8+Z5JLiDPA7NHX6mKJ7PK3qYL7M?=
 =?us-ascii?Q?dYJt1ocsQoJUl1SwubJEy+ITMzi4RRkEDQ3rpQ+/A2d4msf1kRl/2/8MR1CN?=
 =?us-ascii?Q?HTwNk+HfKw4o7g0fwF8SJrT7WXVQ9+nruRjvKrE3uY/rUxq9D8o9t2XNZ/0e?=
 =?us-ascii?Q?4dGMSWHdkYhgMbiHsGy68x9ebYpc7qbTd5YqO1oWiNjrZfCCal/eq4fRZazt?=
 =?us-ascii?Q?+9UfZz0ik6DZf3OJqdsMmBeQOsAl4hNk6JmawTeqTEpvCI24kYd0ZZcdERqK?=
 =?us-ascii?Q?X7hmlN7jlz5ukx8vFzWHVGHV2xQSk+uu0/rzd0/XK8veseNh7dgKmWnKAp84?=
 =?us-ascii?Q?xX/H5eOQxAzamqSaXzx3KQtDm9XjsWxNZwlIEjDljwGAyiCV6KC3oNXAF1+u?=
 =?us-ascii?Q?MZuAHO3WTCYX47s404nXdbVFcPmIGT8CnzwmPdXJEMikwNYtURYBOFRhoOrj?=
 =?us-ascii?Q?PaT0oLPIugzcRAyxZfhkZcGRjMPhK3nC7LCVHIg7cxn4sC0crk3/dMrlWPph?=
 =?us-ascii?Q?v/RcT9dd1uGnfPnU4YSwWDr1HS6ZWX8k6K7oFj1atoaVKgMc0sE1dzOerIui?=
 =?us-ascii?Q?OA/oF/pyYIcawUE/Oe7yNdZ+plG4oWW0AVYxJ1cle605li7hdzydgoVHWH8Y?=
 =?us-ascii?Q?BDl7JlKomEB6cG2rnRRNXpPcZyEWqSBH6ZskY4xXapRPuKAaS3iBs3ShDY3U?=
 =?us-ascii?Q?qheWOiaHHvIKpstnIvL49Uh5LzcJ9AZaeBUDvlLjhyhSf6vuDsjLrCNJ4i5H?=
 =?us-ascii?Q?e8eAt0dMx0axZfVXnpK75FTymbAWmE6X9fZL2Yapc8U36I5CAp2P4DIIGKd1?=
 =?us-ascii?Q?mZy35emu0hevzutSkSh/Wq+RUSKOh5oWz3GhBuYmwkZdIuzhogOx4rIwXErZ?=
 =?us-ascii?Q?t/K7Irst5xEZyxGVvAAVD6yjHDnxb3PCaHBwZCjyPEod2aNo4GmqT0PxMJ2P?=
 =?us-ascii?Q?G9GAsmMaxXsdm3tIV9XYZTgMyrjK8GDUamUQbQehFCZl70qLNUXtnUYssKyH?=
 =?us-ascii?Q?1ajjQr5vVDGbqJO29uYbYWhL+HYVsLyDAn/pEkuzCpqWjRI9jDpxeTKdXE5Y?=
 =?us-ascii?Q?d2HBG8G5xDAIyhxfM8onhRNENAd1Ppu3nhs+0ti6vy2Vym49mgYsG800JAf5?=
 =?us-ascii?Q?wTMJpDvOT4BRVsq7aMQvhBgvG0FdHz2GuRy11b1NN7WJ2rzv5C6nGwe11/40?=
 =?us-ascii?Q?hatlR1bT4Ao=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(38070700015)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VOdj7vIw/eOHMkkHYLyPFdIeL41AGj0YsmvQAfJLHVH8He/i2hYWB2fvthRb?=
 =?us-ascii?Q?bFThWVBWIlXy6sXdOzj6OYtTXJvg+tmEECw/sZKyo93fRulQw/GyXQzT/Q9y?=
 =?us-ascii?Q?ejJjVGcAaGNIEY9v1Xz1mZzLMybsrOq0/7YdwbY9aCzLGStRk/HQmXNjsZus?=
 =?us-ascii?Q?yMa5aO2zaA5iDUNCls9lz6+bGEyWfqCWWK47l+WmYwv5b6pCzSe8b0tinY98?=
 =?us-ascii?Q?04cHwGYam4RbRXkMhKStHy56hIaezlpsnfOwRrcjrVVGQWhXEVvyChn20iIm?=
 =?us-ascii?Q?8wEWzs+OFdUd3789g4IKycR3bw9wVbShqg3SpLlM5EM5D2vYggWeduYPyDO7?=
 =?us-ascii?Q?BH6Wia3h1Hie0J0XCL/g73MN1GjaC2q1qM8xo2BIuAdgBCug9I44D9xPUbv3?=
 =?us-ascii?Q?qTY5zsdiLCCEcjLJBHWaoxAiPnCrfdl4Kmdgaww32xceA0ofy6JG/uL3bhEc?=
 =?us-ascii?Q?Y2fNEVYbyy7KFxe/66Q+7fyVKXgd+GTL4fd+JlwYVwYW1NVSEiTKH3h8EdfL?=
 =?us-ascii?Q?7zSiiv4qg8hKlbWMolO3BDNq3wKY02fP6a6jwF08ttXNpNT5o02mGcDok//u?=
 =?us-ascii?Q?5o8rDxmPpgsU+w+huSwjonhtWo1sbiu7ZvnHQf8TqLgYx4VCTMZaK3cVq2SA?=
 =?us-ascii?Q?WetFO8oixjGrMIoDopAjb9TgQrqjWk6k57/BQ6QRssNa0ac229oF+utl5yLr?=
 =?us-ascii?Q?QWZzA+BxPdnh43yUfQOH2c+MwLJgcda93wWBmXRjBRQ6vLx6Qkgvb7/H020b?=
 =?us-ascii?Q?9hNbK1zDW963BYsR3n0Ok0dqHKPM8lTi+vX88LPf5bqnFthCgxiXuJ8mJbkE?=
 =?us-ascii?Q?y5eG6E8Zn2OzOOebPfOrOM+IyQPcr5veqo+zkCpoCaIzkPFFaCj+Ng0wEf0n?=
 =?us-ascii?Q?Eo0WYSoL7C+Q4Mdl++r02nsrx2MTUiwH9QARoD/LkiAySBBbAdz6x9Phw2J1?=
 =?us-ascii?Q?54R1nsMDplyAaprUqHX/3sZzXiaKmvEpDjeJUP1lRta9gBS0QrkXmL7nCHen?=
 =?us-ascii?Q?iciBLZNhk1vCtsLLG9U2gQS88UO6GBTd870Ndu7C2RVycnAF7HcOZNaezW4Z?=
 =?us-ascii?Q?iovyNjI1v/rp8iRIOD6DcZY7UJ423GXXKXghSlEP85aupQFDPeVp3/KHFbhV?=
 =?us-ascii?Q?dHRyUB5NOP5Fygx3ky/dOFVJeXO6oC9/29gnFPpYzHfp7I5uDhmttSoafwGP?=
 =?us-ascii?Q?RKUWIMtwLnHKSTrp6Lz3jm2AlhjwGWkpIyH44m25g9N3zMnAzwnk3ZvS0cr+?=
 =?us-ascii?Q?cMwGVISnaWZcLVP3GudQ3Y0tiitfm9JnP7Yln3GhOeWuB37UFex3mvUboMHt?=
 =?us-ascii?Q?7s/kTnLXmN77+0czCVzVCbFIwjXwyBMHgoXjFhOII7lgUx7PkwGC3OkUPZG7?=
 =?us-ascii?Q?PmWV+o0iVsEpc1IT/5F/RFKbdyu0m8zYVPoJ+tUrl1xyJlSVkzEup7kLq36y?=
 =?us-ascii?Q?LDSrtE1OOHiLvr7hg3Gn0kz0aUIZ+ZXbHxdZmRbAUSeRx6qZUSIZtFuRKP6R?=
 =?us-ascii?Q?NXdYJYC38w5y2YbwlNE0tfFL+GsR21OjVEL3dzMak7w22dwpZbRjmK2/Gn1U?=
 =?us-ascii?Q?heXHsZPWWuUEg1Dgd9o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45acff8c-e32e-40b1-0cce-08dc912d8303
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 13:33:03.7097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jSqzFgsA5jkiOZzbMGLMGdxn5OWnF5iAQQud9ujBi+ea2s4MR53Hjx8Tk4mQKej5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6021
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWO7BGrUl4+M1gOdR15GHAb7Q1B3l7c0T8yqDuU3Egg=;
 b=Z0mQRGCnSg+7fu9+qvDeRMq7FZ8eoBuJRtr9rVmTEr4mOzUecEPAfSj2EWPL/M+JZYQty4/JVWCW86pcrrVtCn9w7G2yWTECL9N4hypdce5Rf/v/m19b94L9q8U9f+8RtyhIZIgzc4dNOJRsT8IK+6Z6Z7o9DgkPkuXlNHfdL5k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Z0mQRGCn
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] board/xilinx: re-add hash file for
 xilinx-prebuilt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> When xilinx pre-built was added in a6648ad8da (boot/xilinx-prebuilt:
> new boot package), the hash file was initially a board-specific hash
> file. However, that hash file, in commit a6648ad8da, really belonged
> to the xilinx-prebuilt package, for two reasons: the package needs a
> hash file for the version it installs, and no defconfig was using it
> at that time. So the hash file was moved out of the boar directory,
> and into the package directory when the patch was applied.

> When the xilinx-related boards were changed to use xilinx-prebuilt,  in
> 551ba16a0f (configs/zynqmp_*: migrate to xilinx-prebuilt) and 8271323649
> (configs/versal_vck190_defconfig: migrate to xilinx-prebuilt), they were
> correctly made to use a custom, non-default version. But then, it meant
> that those defconfig would no longer have a hash when we would bump the
> default version in xilinx-prebuilt.

Yes indeed.  In the future, I plan to bump both the xilinx-prebuilt package as
well as the board defconfigs.  It is important that the defconfigs configure
the xilinx-prebuilt version, so that we can bump either side independently.

Also, even though I will keep the defconfigs on the latest version, users may
want build with older versions, which is why it is important that the version
is configurable.

> Re-add the initial board-specific hash file now that it is required.

> Fixes: 551ba16a0f09fe550acb3ef6d12a1b2587d03292
> Fixes: 8271323649c42420adaf4513b0472a7203f7784d

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Neal Frager <neal.frager@amd.com>
Reviewed-by: Neal Frager <neal.frager@amd.com>
> ---
> board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 ++
> 1 file changed, 2 insertions(+)
> create mode 100644 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash

> diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> new file mode 100644
> index 0000000000..c955cd79f5
> --- /dev/null
> +++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
> -- 
> 2.45.1

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
