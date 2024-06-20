Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D660AC2BA18
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 731E44352D;
	Thu, 20 Jun 2024 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7xgJHeTw14-Q; Thu, 20 Jun 2024 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 285E84353F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 285E84353F;
	Thu, 20 Jun 2024 13:42:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2E561BF3C3
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 13:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73A5D40529
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 13:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIk0ktIwfMy2 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 13:42:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::60a;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EEBFC4353F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEBFC4353F
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEBFC4353F
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 13:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwmpfy+PFNC5NDk7Jm3KZXyajwnD+dniBXIql6SYZ3/O68J0HAmM/X72d8Gh/rezWuNKYXjrsQfNTGKr3RuUefIfujn2FJf4X5YkFepubcGQNb//BQbvoOL3qZbXVOip4WnvLSTPRzWVtpzXHmJ9fMMAkmlNufo8lnkiXunXy+XeP2PijCvKrNsRxaVDyjJVXzV33n4lpSeQCbO/GN1zE2mvkPphBOJASOq1s4Aie+/KTS5k+1ZAZzkjLk2E9pTOOoLjtUO9YCdNTN1J2+Y4oWhQgndKa+e8IGIymDYSpgpqHVRkHc8SKTJ+Tm67cGDYEFikqaf9tFpeiN1FMv5Mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuWGYKr9RmUcVl1G1bTY85XP5pqIIif+NX8+PBXHGVI=;
 b=HTrnP1+ekY0KCP09GaPGxLyGqOQm3uNG6w55sW0LLArb74A4toRYwndx+pWogyVc879OTjH95UygmKx6myL9rML8pnn9GWlxr5/STJhKwc+jHNUm/QzP+PL7Uvx0KwAybwrcdeveyrZRwh59IC3EakHUzlBsiT32Nl/yr/HvE6uB0DZzim2dWAoiBFOul7MkdYQH4kVaoxo2B46NcnavTN0nN28G4Ijl4Im4h56UKKloRI3SSC5+1FNZYlP7kARovvf+5ZGZnvsb943M7RS8I69G+DCJ3xoCelqqKC7D+EL7WmQBVUC7uPyQa4GEpwUMiVhKnpBf8MZglBuu1INFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SA3PR12MB7952.namprd12.prod.outlook.com (2603:10b6:806:316::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.18; Thu, 20 Jun
 2024 13:42:40 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%7]) with mapi id 15.20.7698.019; Thu, 20 Jun 2024
 13:42:40 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] board/xilinx: re-add hash file for xilinx-prebuilt
Thread-Index: AQHawxUClYY1HYkxqE6aH4rWLdd6/bHQpOpwgAADkZA=
Date: Thu, 20 Jun 2024 13:42:40 +0000
Message-ID: <CH2PR12MB5004E97FDF74EEC7C7B0A4E6F0C82@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240616070849.2608438-1-yann.morin.1998@free.fr>
 <CH2PR12MB500403A5982F031A0ABA5AA1F0C82@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB500403A5982F031A0ABA5AA1F0C82@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SA3PR12MB7952:EE_
x-ms-office365-filtering-correlation-id: 782d7a77-8110-4ab1-2b0f-08dc912edab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|376011|1800799021|366013|38070700015|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xWYgLPUKCXo45oXyOdIq1RIufG2eo8I3oRmHjOfiS2a69frEQCz7vW8jtpaw?=
 =?us-ascii?Q?Em/Kpv9kd6wMUBsm0fsJVNupV410rqTSYZQBm+w5uWwlwmC4+EQHRZUuiVje?=
 =?us-ascii?Q?hXqpB9886Om5e1TBtvP8ANQtwDLkpNrPbL8mQQG1m8x/nO95oSM7DDTAyXOn?=
 =?us-ascii?Q?KKlDSmU4TXxUtCC7v+esCfrYItf3yaZ11OAmGSBx47zWjbkdWU6CfWDkmV2g?=
 =?us-ascii?Q?Y9GS8dhscbrcMxLkNTApPQ3jSLg04gyQ/87bLmDhgpTuW3/JSUgu0sWLhwQi?=
 =?us-ascii?Q?Zj8W4Ce1/MrM7jX2I5WFblRLnNig6dIMeEZcrYDrL12kSxBdqAjaYdbly2lo?=
 =?us-ascii?Q?N5j5YKj+IdVC3vGuCAbp5qxdtuLWrZIG93TJfXhyqocH+MnOeicsP6CdWHTu?=
 =?us-ascii?Q?njy8UBmFRlcPB/Mf1Z/ZJNqIb6CCZP6/N/U+y9dvE+hFHzGDmgUzF5HuLGp8?=
 =?us-ascii?Q?MNnAoA5rCaysxOAbLCSfAFTR0UM/LtncIQRwl1gycoTc9K80URXynMH+FB+/?=
 =?us-ascii?Q?UCtuAM5hLT7p/9qrKWgOIrKFihUmh39c5GINHaN4iqiW5LpoUJY0l+RAbB/u?=
 =?us-ascii?Q?7OPFzJ3LPBPmvuCmEOMTZIh0BehqFhBL8hagG32flC6T9C6PxDuTAsXd3afG?=
 =?us-ascii?Q?VHyX/4B8jx0gIoTjlJnW3lKxnjUhYxl2n2zdj98rAoF0V+ryxFz/rTgvEdwt?=
 =?us-ascii?Q?uluUATq0laCI7aZbxBa1Q3vfpd5lH1afbVsG6E8+LnHblC5BGctnJSwmkal1?=
 =?us-ascii?Q?F3WbRoBSZyUXuPvlypoKr1wHl6O0PuxC9vkgh4064/+B3lXXcVL26ti2EwQI?=
 =?us-ascii?Q?KdufCytm5PRRtZSb8tu/eaFKR3vV76uxgbGeAWChvVmanm3ja0WEWV4+h0y6?=
 =?us-ascii?Q?i1pb6K3LvoB+cYv8PYGnY1VpjJ+6g3Z+6vVPWGhxKjgcYz56kZt2xmOA86eK?=
 =?us-ascii?Q?hm1gRyzm2V2icGoFCchqX6Xdqh9ch2lVgJ8F1Rs/RG5+fc4Xu5ZTu8ceb/zz?=
 =?us-ascii?Q?aMoEdtIgePfTdVSjFSvs8o+TnxfD4BX820P0eY19Den1xzrZyjssa3hd8l0D?=
 =?us-ascii?Q?qqiHFUDnAtHs/ljfJnnBy3YjlMmCqVq7C/09C7ewPCshV+G+Q165EjR6x+bn?=
 =?us-ascii?Q?n89DOGPIwFuFTtKM4InK1ogk5NfA63PwglojRRlY+0R/X9hB4NJFinNDns2j?=
 =?us-ascii?Q?tUhTNcvbVYcG6iglQcfbHhTP69zLwtKgLRv38su11Gjam1QW3Cdqoh3d73pW?=
 =?us-ascii?Q?R1vc1tCroAeLg/7BXqJqzCrm3cspe2D4WTrEnJmfw96Nqw2YM4Qws7xqjJsM?=
 =?us-ascii?Q?thg1BvN75cz6QkzLPf+/eHq2TQVcTZ9y5knZ0eJ8u/8m9NA09iL+rAhkowJ4?=
 =?us-ascii?Q?jDPaYQvK3BTP4jvO5NDozojypkNA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013)(38070700015)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z/L+3qW9GqX5/VipheFcGqbQhQZzdhtZvJcgTyxGMGI6thh8y8Tn7nyPH2pT?=
 =?us-ascii?Q?iz3gim86isReUF0UXIYGSSzmfIShC9YHgMsqroC1zgYqPd/tR4HXSLdgFOOC?=
 =?us-ascii?Q?rjaKTFIInLDjEvpaEhQNQREbUPUAxTyvuf3qd0j8S46Y5jt1xLMtn51jlBgZ?=
 =?us-ascii?Q?P2TbO1zTrdVRSFhieml7bxExH595Lva1B+7qHYIEaPLoQrgfJZe2m4dB6jLj?=
 =?us-ascii?Q?bR9bzFoEIverDv7QItdba4BaGQWz8poqwNoQcJAc1bARZs506bET3XHmLcT1?=
 =?us-ascii?Q?bs1WK1CfwC+xgYVyZyg51OBK5iCaGJ/1tq5HM7bJfvZnQUYWzLSNagV/4ZTQ?=
 =?us-ascii?Q?SAVK520xjKqOB2PmKiGPOPJ/6e+c3DTQJc/PEvvaTJ5iS3nNpqtanNrdPu1Q?=
 =?us-ascii?Q?jPoTB3JNAvU0ALz5sBr48UhPTS/ivyhHcP5EVcj45iV5YDBnvYUxUzt7PlPy?=
 =?us-ascii?Q?fzN2R17vcxNcHJDU0+aTlPp+Tadsdhmy/0czAbYkQuYFzNr/xK00tGkogfDR?=
 =?us-ascii?Q?WEADQ3CK7xCYxE8yQ79Cake8k/W3fRPq1fwQiCV0AUVYPVqCB1SkQ7S0Lcte?=
 =?us-ascii?Q?Xs8G5AbmSpRKt1FCyf+SfayeVa9mMw4NvvTE66qwj6UiqforEGovJWvGfl/+?=
 =?us-ascii?Q?GOalFZtemVKUpb3yH9ytVbdTOMbPySszUpEHdivPyECq0cyjvEwg+EUANz02?=
 =?us-ascii?Q?IzbTcBI5HOTdvzuAtuH4Fttm1xMLPtUGm5MG+Ck/W3duUjXkKujwzw+t1BF1?=
 =?us-ascii?Q?f7CllU0zN/JiU9DzFA34lD7AHVYRppXfmtwPfSpC3oLFdPPAo6fORUlMS0Zl?=
 =?us-ascii?Q?RvPLL620i02Btek7EszhznaCNhb/7w8TBuAGKgN4oZiGOYjITSTCeKByqDVb?=
 =?us-ascii?Q?+NI3IuQ96K9qGroBimgi31tqS2ORFUTezoHTDTe1Qg43l0PRx99oOp03UuOu?=
 =?us-ascii?Q?LJ4+V/oI39pOdSw1zm5vto54foBl07n5CWM7SXBKF9Gpj1utF+Pdol6JmvIN?=
 =?us-ascii?Q?WpOZWO/N1gHTQrhxVUWzIAzyAD1gHJlgJMUQhNDI14RQvVvRb6jYiFlFKVOl?=
 =?us-ascii?Q?AhDyK6hJWyiZDUeEU5fjr1QuEK6Mcb40Q5qHJTUNSiVyEvPqtdeBUuP05rIS?=
 =?us-ascii?Q?k+S7iGgz1NPtPlgv5tIse3V3Lxy/FZyvWLruP3nHLed5OJTYIOJppEy8YHwn?=
 =?us-ascii?Q?VW0MfUD+T/dxt3d4NP/tOGoyH7d8ItnGfvqi9Pju9Mx3ZE2vAYwT/b6xLRNi?=
 =?us-ascii?Q?yeMq6rha8g5AgUTVzpjLxO+eGZPQo1AXbJZG/l0VTR2U1kJdi8jMqUK+PWBA?=
 =?us-ascii?Q?umljxC9lGHvKB+WQem9O8J24AF+qmrx0SWnLqnsZ4mIXV+nAZxeYcyr+iqRO?=
 =?us-ascii?Q?yzQlmbm9C7QVKx0vsLn6YMlfn3TLXWitqqZkkOI+Pc2IJaIYH4a8+jUZw9IF?=
 =?us-ascii?Q?ijkLX0kE2UBIe+eWSdx+44nFaVsE+H7fu0r8+mKs6cyDJLkoY1fnEnZBQn6i?=
 =?us-ascii?Q?5750m9dxZh7iKL/AeWXIVNt49dlrvH8gS8M7ZcbXoRZSllonKRP9IxP9X2uA?=
 =?us-ascii?Q?WfpnZyWLKlLzXe61HC4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782d7a77-8110-4ab1-2b0f-08dc912edab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 13:42:40.3665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nw+g69hunT8k8RSHPhAKjXVyL5wen6D/2z8+4jvQi1Z2gQ2fxnI3Ger2kjdkrxTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7952
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuWGYKr9RmUcVl1G1bTY85XP5pqIIif+NX8+PBXHGVI=;
 b=kJFgHoUJXL8PxES5qGTk3Ju+0fJPZDgvt6TEdNn8LsIliQDgMRuMqT/UXd7suHWQyXfKNt7qzHzgW0kS7fZrY+OxZUxEfC2sZI1kjq+PTeX+1YZA2KywQOvkNsbWYZ5n3qBAWgOMaPIDdxqXVOLHWjGUJx604ZglU2CTnpMRocA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kJFgHoUJ
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

> Yes indeed.  In the future, I plan to bump both the xilinx-prebuilt package as
> well as the board defconfigs.  It is important that the defconfigs configure
> the xilinx-prebuilt version, so that we can bump either side independently.

> Also, even though I will keep the defconfigs on the latest version, users may
> want build with older versions, which is why it is important that the version
> is configurable.

> Re-add the initial board-specific hash file now that it is required.

> Fixes: 551ba16a0f09fe550acb3ef6d12a1b2587d03292
> Fixes: 8271323649c42420adaf4513b0472a7203f7784d

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Neal Frager <neal.frager@amd.com>
> Reviewed-by: Neal Frager <neal.frager@amd.com>
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

Actually, wouldn't this be better if this was just a link to the hash in the
/boot/xilinx-prebuilt directory?

Also, if you are the one who applies the xilinx-source patch set, could you
make sure to do the same thing with the hash file for the xilinx-source
package?

https://patchwork.ozlabs.org/project/buildroot/patch/20240618074922.3555070-1-neal.frager@amd.com/

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
