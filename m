Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC690C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 10:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C43783FA5;
	Thu,  3 Feb 2022 10:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJXJOnV3Lfaq; Thu,  3 Feb 2022 10:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB6E83FBC;
	Thu,  3 Feb 2022 10:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AEF81BF41F
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 10:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8863A4014D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 10:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoFxUCYgCzP0 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 10:07:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A213540116
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 10:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhF61OcAibW4bnw8xy7EU83bd+nuzQwAkpgb25G7Y5Zi6ZI3n9GwqzPQ9KYEUPhXRWKKlLxM9s6JHelZob3C3X54pqMsigKwaLRIFTSFu+akaz82b+Cxu7Lc9F23rEX3w94LQ7GpMbkTuhqBDNMMGjgdXq7KzjY9kTDA9Mbx4fKWbWV+jV/C/PNqCdbS0ilyTVlL43BONGux2dnG4rZ8X7+yCTb3ox8Buy5wjYFXEHamhKAi6QwnxNHMWrE8MTG+bRIlEL6xx9fXiP4SW+EUAxmjJS5gq/w7aMvnfj5giL684cddByXCDWnxh+I1HwuHr6JmlzADbxkoQfPuWphTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+70ISsuiFvBRonAbHk3ZJ6XtP+XAo8PXYSWfqQkJb5M=;
 b=FolUqid71vD8cciUBAnOimDnc+zkX1I8WDRYZqOXgxKBEUdMk/5M3aEbUMAIhaU2ft8srV8m1qBcjwcZoZ/0xdkAkLqmFDSElBdf8wZzNcFkxBw7fWX1dRUTVyvb5G+VMJb+k1QcaAhqCwudXiJ5njviB3rrXuhJDGOmWcTdH6vatb6vG4L6D9naFzdlkFF6q135iATj1KzN1Gt3+LAOgDNaaAzCzHV3WfIhbTn6mq8FAaRwXIl+KBQvYVTsuP9Kv1RAm4FX0q46bHYQHFMGVyzD1WwXHwSJkKNtpyOAGP10+rAL7BvQQlsExqb+gzbG9/IxEehjRG6hmOqNnMwmDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+70ISsuiFvBRonAbHk3ZJ6XtP+XAo8PXYSWfqQkJb5M=;
 b=K8tIZd3dhRaYx7fqrkcB64LSOLfUeO+0g46qVTquPR7JCbAcap/FMUWmsa9hIMXFJTbW9m5/tcFq2Xh0S/KxR21T7FULMAGB6f9uIm00/oqTsn4UOQFFtqcFZ131R8CapwU+/H715O2Ib5A07i5mWwPS0gEJ6oYRj+LbKpz04y8=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB5116.namprd02.prod.outlook.com (2603:10b6:5:4f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 10:07:50 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 10:07:50 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux to
 Xilinx 2021.2
Thread-Index: AQHYGFXQe6rW+OhmpECM57uHN+anmKyA18sAgAB/emCAACQ1gIAAHiFA
Date: Thu, 3 Feb 2022 10:07:50 +0000
Message-ID: <SJ0PR02MB77589ED41FD77C52F936C3FED7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220202165555.3497977-1-nealf@xilinx.com>
 <c36be0d9-f525-ff0b-5b05-d5f512f92105@lucaceresoli.net>
 <SJ0PR02MB7758DE2233B5C11EC28FCCB4D7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <57bd27fd-09c8-9441-8429-bb4983287c6c@lucaceresoli.net>
In-Reply-To: <57bd27fd-09c8-9441-8429-bb4983287c6c@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f11d57b-e8a1-4867-8282-08d9e6fd08fd
x-ms-traffictypediagnostic: DM6PR02MB5116:EE_
x-microsoft-antispam-prvs: <DM6PR02MB5116B2776ADD9A0843BDA172D7289@DM6PR02MB5116.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SjtQjdM63b1bvTtxe79BVVPha0bGjikuq8JsRdsC7EsW+Cdf/x5FMFKDEKURLiPfA8BL9bL2Ks7Y/3OBjgNfWZBkjclELG6iqnoTLacRsZuePgaQk//8OHzCQIpzU064vYd9dWGCk18BOyj0ka0c9RkV+rAcOZTIAR4p9S2krE/xjxt9bncDojzHAB6UY57XNSX96Syk3kIJeKmiUinLvOYEtTTanlkgMMNqiC7f+qHYx2PEaMIRfB6qA/ckFQ/0lNg7jnG8K7ke7HbHR3aWk7gGF+QTXDtbaA/B1YCmErBreMPIxUMSlPDhEiXbrkUoyKPBB4Xa0Dih/df8Xu1ypYVqSKv/WjvCq6qQhhoRt6nx/rLAviUl9QBd8zV0rZmukGvD64BhiI69o5HnbLtxRJMxFOnVIh1msNGE8q1gMLh0oKA3DFpZ5fGU9d9WeqK8sSLsA9iQNcIyPKGI8XqiisftxCbktQiVEXEFhyua5ZFf6+L6KKKR7TepzWaMz4wKGrl75bkdkBc9TeFS9PgWCiU7a7Aqrd/1/HH4lp8aA/yHbVIhqyMb+Dy26x9xG1LrELSG1VBPbqM90thA4KOJg3X/Svf3LKyXurQc4wV1f2nE49/DpAerOjeJQCJNzQ5SspPNFUhTO9McrqUX2ThxlOEEIR4hQnBsoKYrkQi4XV1R3Pedd4CdGH7FmZ8nPIonMuyCSMCLQy/aQyCEPfMAJpYZCOJUe2QdV8gn1ip4syF22TTWV9i8OEDN2PG8O/yCmIDQp787kLqrNr0+ZTzYI9aQzu8RhHbOrZY2GlxwCJWKCCxpitMKH0Wk/UU2TN0apFa3KC3WI8EjJiplDGbwzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(55016003)(83380400001)(26005)(186003)(110136005)(8676002)(8936002)(86362001)(53546011)(6506007)(7696005)(122000001)(38100700002)(5660300002)(9686003)(52536014)(33656002)(71200400001)(508600001)(38070700005)(966005)(66946007)(316002)(76116006)(19627235002)(66476007)(66446008)(64756008)(66556008)(45080400002)(15974865002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGFwaWNsVU03M2dYYjJaZmp3Q2tjNHVCclNsN3Q2TzRBc3Y2MDQrRGxWRGtR?=
 =?utf-8?B?bzdVVzkveFZqamdpbCtLTGhRNUFRTGx6SFE1c3ZNek16QkNaaFBiamF3ZEkw?=
 =?utf-8?B?ZWNuNll0R0NkalozeHBzOUI2TWIrcmJCUHNFZEdOUmtLUXVtU0hpVlViRFZr?=
 =?utf-8?B?MjF3KzdiY2Z6MVUvZDg0dnZVNFhXSTBjOGY1VGRKVGpQSGVHSXEvTHRuS3VR?=
 =?utf-8?B?WlFwcjkzRXMvRFk2Nm5tMHpuanNjbm5MOHNSTGE5OTNhaXZ3NjYzV0RyVEor?=
 =?utf-8?B?U0NSVVhiUEZ2c0RrU1NseDhYd1JWNldNUjlBd1hqWnJmV0I4aDRydm93aUsy?=
 =?utf-8?B?UXBmcWtNcUYrQlg3TWc2a0RHaG1lQTdOcWJLTTA1L3JPY0lrR3ZOTUNabGRO?=
 =?utf-8?B?RmJvbmFnQnJRYWlBM21uL080VWlkZkNyMG9QNzViUkF5a2FnT09CSzZtSEFa?=
 =?utf-8?B?ejBWc1lzaXhBK3huNG9ZVU1IM295K2NxWkZPRVRRbFVrQ29MWktEZXNZMnBp?=
 =?utf-8?B?MmVsUGgwRTVieEZ2UHNQajl3SVRyZ1FmTVdqUjgxcnlTQVVSV3BSVzkvRDln?=
 =?utf-8?B?a1NUaEliQnNLV2tOeWE5ZEZCS0ZmUXpKM2dFb1c5N3F6OGRta1EwK3FISEhV?=
 =?utf-8?B?VkFlbFhFMUlHa3dscStFNGo2YlJaUnRydkFYSlUxN0RQNk1ZUWEzSXlUdWlG?=
 =?utf-8?B?eTJEbVAvdmJjUFJwZXhBZG9rampoN0lwazVTWDhWWUlZMFZjUGg4bm52Y2VM?=
 =?utf-8?B?UUZ0K3diUXk3Z2p1ZkFwS0dPYlZRUEEyVXI2ZUZsUzZ5TytzMFBTMDhObm9w?=
 =?utf-8?B?bUcyY3gzL0RBNlpRNlV4RmtzY1hvR1FJeFdEbWpSeFl0b2l5S3gyTmMrdHZz?=
 =?utf-8?B?ZnJSbzhMS1EwM2NXWUhuVUxXNk5tcWhYemIwZHVYZURjY3pFeGJzWHhPTDZ4?=
 =?utf-8?B?MnVxQm5Ba3RLUG5uUVcxRmwyVE1LcUpxWW1yVmszODZjcnVxQlBuQ01sUVNU?=
 =?utf-8?B?Wit5VFpKQm9EYU9uVUZ5aEZsK0xyN3J5djBaUlVZMVJxM29aQ01oaG0wYitS?=
 =?utf-8?B?SDFiZVRNekxtZlVzd1lUVHhGZDJjMWM5Y0t2Y2JLYUJIekE1ay9ock9MZ2xW?=
 =?utf-8?B?eE5BSWgwZU9pMUUxbFl3Nk5OWnlJelc0ckg3eFNkZnZmQys3TEtqK0hOdEJp?=
 =?utf-8?B?LzdzVjBKTTJPaGsvOXVNbmkwZjQ5TGNXdWtVZlRQZCtxU0xLSUNQTVl5dC9x?=
 =?utf-8?B?ZWgrU1pVMlBZSytlbGNNUnFKbDdBb05FUTNQSDJFY2ZOUW5kYloyRGs1Tkxl?=
 =?utf-8?B?VW1kRjBCNTI4aTZxd1ZHcHZZRElXbGV5R2xIdEg4RmVTUGlyV0RiQ1J0Z2dO?=
 =?utf-8?B?QU4yV1VWWm1hMGV2OTk3QitUOWQzN0ZGTnBPc1RXWGRudjhXUm12ZnFaT3Nq?=
 =?utf-8?B?UCtwWVluOHAzV05FZk85SzZuckUreGpOemRNS1pJK2pWVW1XWUwwNWlSbEtQ?=
 =?utf-8?B?Z0dTbzFxcGtyUDlOMGNpMWlyQWkxSk90V3NwT3RIamJWUE1yU0hwMDJqYTZs?=
 =?utf-8?B?WkNmZkxkOWdXM2ViZWlTMzdQbmRZWlVmK0x4ZHFrRWtWS296YWcwdVlMUzhY?=
 =?utf-8?B?bU9kbWpFYkhWTTNIcCtvcUcwNjVXUzV2anEwMmc2ZUx0RGUrQmRWVStwSzdy?=
 =?utf-8?B?dnVSTEFvaDBGb09PcG1nRmdKcG1RVzBtWlROek13K0lSUy8wc0g2VzA5SjJY?=
 =?utf-8?B?OXp3VHZSdURTTVlRYnBvTGp0a21BVTlBNkRoSGQxcnhJNlNRcEo2UitWWGcx?=
 =?utf-8?B?c3JCRVBFNFlhZ3FEV010N2kxRHkwaFFKK2VYdFpSNGZERTNKVWw2VnFVRUJ3?=
 =?utf-8?B?SzkyeUJZZUd5UHRrdG5qZWY2Rks5WUFoam52eUFLWmVNcTZPOW5pNk1PeUQx?=
 =?utf-8?B?bnJvbERzclZzdXFkdVlUTTg0cTFLaGx2VEVsS2FFRk5qM2VhU2Z5cXl5ZXJ4?=
 =?utf-8?B?SG9NU3dva2VwUFNhQkJNZTVxbmFQZnN3b21DWEE1Rk1zSnYzTGVlUU9ZZzBZ?=
 =?utf-8?B?UEM5U3ZDT0J5bmhHSFQxRDVRZWUrejVnMkdQOU1HTytwb2Q3ZU5vVkF1d0xp?=
 =?utf-8?B?MlFvdDlXcUxvM3l6R210YUVSOTcveGRIWjRFR1lBQ2xMZG1ITm5jWjh2cWg0?=
 =?utf-8?B?ZlE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f11d57b-e8a1-4867-8282-08d9e6fd08fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 10:07:50.0800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJr4Tl197pj6/WnAgW5yDcR/ZrTpS20GzGUbSJE0jIZtBTC7LIHzNyPo0M8ViIv9b59t/kXJPiqbfyuYU1XiTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5116
Subject: Re: [Buildroot] [PATCH 1/1] configs/zynqmp_zcu10x: Bump
 ATF/U-Boot/Linux to Xilinx 2021.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

Thank you for your feedback.

As for the ATF, yes, the mainline version should work, and since it does not have the same build issue with the buildroot compiler, I will move the patch back to the mainline ATF version.

Unfortunately, U-Boot is another story.  The mainline U-Boot will boot just fine with an SD card.  However, I know that the Xilinx U-Boot QSPI driver is not yet in mainline.  Since QSPI is a very popular boot flash medium, I cannot in good conscience recommend using the mainline U-Boot until QSPI is well supported for Xilinx devices.

Xilinx is working hard to get all of our U-Boot and Linux kernel drivers in mainline, but we are not yet there.  I would be happy to update the zcu_10x_defconfigs to using the mainline U-Boot and Linux kernels when the level of necessary support is better.

Best regards,  

Neal Frager
Embedded Processor Specialist
Xilinx
neal.frager@xilinx.com

-----Original Message-----
From: Luca Ceresoli <luca@lucaceresoli.net> 
Sent: Thursday 3 February 2022 09:15
To: Neal Frager <nealf@xilinx.com>; buildroot@buildroot.org
Subject: Re: [PATCH 1/1] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux to Xilinx 2021.2

CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.


Hi Neal,

On 03/02/22 07:20, Neal Frager wrote:
> Hi Luca,
>
> Thank you for your positive feedback.  Below you can find my thoughts.
>
> Neal Frager
> Embedded Processor Specialist
> Xilinx
>
> neal.frager@xilinx.com
> Mobile: +33.6.48.11.37.36
> www.linkedin.com/in/neal-frager-0397463
>
> -----Original Message-----
> From: Luca Ceresoli <luca@lucaceresoli.net>
> Sent: Wednesday 2 February 2022 23:29
> To: Neal Frager <nealf@xilinx.com>; buildroot@buildroot.org
> Cc: Neal Frager <nealf@xilinx.com>
> Subject: Re: [PATCH 1/1] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux 
> to Xilinx 2021.2
>
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Hi Neal,
>
> thank you for your effort and for sending a patch in the format that is the most convenient for other people to review your code.
>
> Your work seems generally in a good shape. I have several remarks, see below, but nothing really problematic.
>
> On 02/02/22 17:55, Neal Frager wrote:
>> Signed-off-by: Neal Frager <nealf@xilinx.com>
>
> Maybe you can add more details before the Signed-off-by line, suah as "Also add a defconfig for ZCU102", "remove U-Boot and ATF patches not upstream"...
>
> [Neal] Could you share the proper git commands for adding comments to a patch?  I would be happy to add more comments, but I am a bit new to git, and I do not know what commands I need to use.

The command 'git commit' opens an editor where you can write a commit message with all the details you wish. And if you have already done your commit and want to modify the comment, use 'git commit --amend'.

A suggested reading is ProGit, the official git book:
https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository

A few suggestions on how to write a good commit message:
https://cbea.ms/git-commit/

> First issue: this defconfig does not build on my PC:
>
> $ git clean -xdf && make zynqmp_zcu106_defconfig && verynice make
> package/pkg-generic.mk:266: *** BR2_GLOBAL_PATCH_DIR contains nonexistent directory board/zynqmp/patches/.  Stop.
> $
>
> As you removed all patches (which is sooo gooood!) you now have to remove the BR2_GLOBAL_PATCH_DIR.
>
> [Neal] I have not seen this error on my side, but to fix it, I will just remove the BR2_GLOBAL_PATCH_DIR from the defconfigs.
>
>> ---
>>  board/zynqmp/genimage.cfg                     |   1 +
>>  ...-fix-Remove-GGC-ignore-Warray-bounds.patch |  68 ------- 
>> ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 ------ 
>> ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ------------ 
>> ...ept-an-absolute-path-for-PMUFW_INIT_.patch |  68 ------- 
>> ...ynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 ------------------
>>  configs/zynqmp_zcu102_defconfig               |  35 ++++
>>  configs/zynqmp_zcu106_defconfig               |  15 +-
>>  8 files changed, 44 insertions(+), 484 deletions(-)  delete mode
>> 100644
>> board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GG
>> C -ignore-Warray-bounds.patch  delete mode 100644 
>> board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booti
>> n
>> g.patch  delete mode 100644
>> board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.pa
>> t
>> ch  delete mode 100644
>> board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-
>> f or-PMUFW_INIT_.patch  delete mode 100644 
>> board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-ini
>> t -file-as-a-kco.patch  create mode 100644 
>> configs/zynqmp_zcu102_defconfig
>>
>> diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg 
>> index ed202f4550..557364e124 100644
>> --- a/board/zynqmp/genimage.cfg
>> +++ b/board/zynqmp/genimage.cfg
>> @@ -3,6 +3,7 @@ image boot.vfat {
>>               files = {
>>                       "boot.bin",
>>                       "u-boot.bin",
>> +                     "u-boot.itb",
>
> Is u-boot.bin still needed, when we have the .itb?
>
> [Neal] u-boot.bin is no longer needed.  I can remove it.
>
>> diff --git a/configs/zynqmp_zcu106_defconfig 
>> b/configs/zynqmp_zcu106_defconfig index bee7c1daf7..3a6947e1e8 100644
>> --- a/configs/zynqmp_zcu106_defconfig
>> +++ b/configs/zynqmp_zcu106_defconfig
>> @@ -1,11 +1,11 @@
>>  BR2_aarch64=y
>>  BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
>> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>>  BR2_LINUX_KERNEL=y
>>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
>> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
>>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
>> @@ -14,21 +14,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y  # 
>> BR2_TARGET_ROOTFS_TAR is not set  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y 
>> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
>> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.4_2021.2"
>
> As far as I remember (but I ask the core developers to confirm or deny), from the Buildroot perspective upstream versions are generally preferred even when they lack some non-fundamental features (e.g.: some drivers are missing) that are in vendor forks.
>
> Is there a reason for switching ATF to the Xilinx fork? In this case explain it in the commit message, otherwise stay on the upstream repo, upgrading to the latest [working] release.
>
> A similar question applies to kernel and U-Boot: is it possible to switch to upstream releases?
>
> [Neal] I was trying to match the Xilinx tested software release 2021.2 with these patches.  The mainline Linux kernel is still missing quite a bit of the Xilinx drivers, so if a developer uses all mainline locations, there will be things that do not work properly.  The ATF should probably be ok, as it is almost identical to the Xilinx fork, but since I was already using the Xilinx fork for the Linux kernel and U-Boot, I thought it would be better to use the Xilinx tested fork for everything to remain consistent.

I can understand that mainline Linux has significantly fewer drivers than the Xilinx fork. However I have good hope that current mainline U-Boot is enough to boot properly, at least it's worth giving it a try and, should it fail, explain what's the problem that forces to stay on a fork.

About ATF I would just stay on mainline. I would be surprised if an old mainline version worked and not a recent one.

> Ouch, now the build I had started ended with a new error:
>
>>>> arm-trusted-firmware xlnx_rebase_v2.4_2021.2 Building
> ...
>   AR      .../build/zynqmp/release/lib/libc.a
>   LD      .../build/zynqmp/release/bl31/bl31.elf
> .../aarch64-buildroot-linux-uclibc-ld:
> .../build/zynqmp/release/bl31/bl31.elf section `coherent_ram' will not fit in region `RAM'
> .../aarch64-buildroot-linux-uclibc-ld: BL31 image has exceeded its limit.
> .../aarch64-buildroot-linux-uclibc-ld: region `RAM' overflowed by 1 
> byte
>
> I have run my build on Ubuntu 18.04 with your patch applied on current master.
>
> I assume you have built and run it successfully. Any idea on why it fails on a different host?
>
> [Neal] I have seen the ATF build error as well.  There seems to be an issue with the default buildroot aarch64-buildroot-linux-uclibc compiler when building the ATF.  I fixed the issue on my side by going into the output/build/arm-trusted-firmware-xlnx_rebase_v2.4_2021.2 and running the build with the aarch-none-elf compiler using the build command below.  Basically, changing nothing but the compiler.  Do you have any thoughts about how to fix this?
>
> make CROSS_COMPILE=aarch64-none-elf- PLAT=zynqmp RESET_TO_BL31=1

I'm afraid a defconfig that requires manual steps to build is a no-go, so we really need a solution.

I don't know a proper solution, but first why don't you try mainline ATF? Should it build (and run) it'd be a double win! :) Otherwise you could try another toolchain, such as one prebuilt on https://toolchains.bootlin.com/ .

--
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
