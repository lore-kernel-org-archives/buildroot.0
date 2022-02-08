Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E57EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 10:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6AD408F4;
	Tue,  8 Feb 2022 10:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBGc5z1W6X7W; Tue,  8 Feb 2022 10:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70226408D6;
	Tue,  8 Feb 2022 10:25:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5504F1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 10:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50E0881366
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 10:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kK7eQedI4kh for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 10:24:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::602])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EE1E8134F
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 10:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE8AxgXLoGechmh/i3m7dXWPvqK9UOCq2L+DHPzb0gxpCiOlXLs8J7pyA62tht4iOQ0zs+I2Ac7kW/qHUgt8yay/ebkMSv0g8hgyBHqjmJ/lKutFHpu7GYmGjpsZ0s8TMbOIl4cCYOquXgDDSPSSzqEdzG+zuLdWWbB2IBKdBejRpjJmi/5V/AWViOGwTQY5GLgQAdG6Qq69jTR+lf1+sUspGACvQHH90uWj7kTrTx+tmvYK+gYiV65Bn/wlmJmn4M/TfI7lxxlhL/Wo3pJlHcNiRTGzgvcw37TUgWqpZvXe08ksMwNy5nnhHPAe5EpejixavQowtraSS2ffATitUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14kM076wZzacY1nNNzpRY6WT6FI3jl66OHFth5Rnvqs=;
 b=D/jrdumx/cs49VlZBfUuoYOuCaGFmfhtXeH7jD9D6DQ+izPs1xPkSySzsJtblRuaamOSDrlqyza87S+zB1NuNULHKd2SilWGr0Q3rkTISiRbvUJylxUXSqCqyycKlJnDfJHcBSrrhI1QIS1/0gL68oYMiZuezl1G/2RTIbDDfJFSX2SvzQI81wBWo4W05RD6hpo82devU/fTpDvQTxkLZwFfXf7ooiX/7u4af/dG0jy9tCofqPzjwKeYHNPm5DoNTffXo413wopD82lc8or2uOFT1QdKtXpMc8GNTWeMfJUBiDTNmVIgqegadOaS4NN7YzxwYIyjQzY4uTrvmnvI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14kM076wZzacY1nNNzpRY6WT6FI3jl66OHFth5Rnvqs=;
 b=jPO40jNDcGgfp95gCy37dAADMkXjsnwxgKgqZn+DXWS0ubOlXglNXF3OPVUZdFGBqjcG8c36U5r8U9vkffm6hwH64ws8B8b/eriblUHVQM0BpDEAa1+uzhT0AiFaPRc3wB6tR1+JrxBlvqESn7a938KQVfXiX1fXsXe4bEFwpRA=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SN4PR0201MB3533.namprd02.prod.outlook.com (2603:10b6:803:4a::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 10:24:56 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:24:56 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
Thread-Index: AQHYHLvCRQMYU+xDi0iUN6JqHwI+MayJbQIQgAAD1QCAAAEWgA==
Date: Tue, 8 Feb 2022 10:24:56 +0000
Message-ID: <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
In-Reply-To: <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e5bd80b-6156-4c05-ec0f-08d9eaed40be
x-ms-traffictypediagnostic: SN4PR0201MB3533:EE_
x-microsoft-antispam-prvs: <SN4PR0201MB3533C66AC15F2543D3F0E31FD72D9@SN4PR0201MB3533.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CtlYdoVgLPVSBB1zeGHfHmOkirQNn2Rfwb9dk7k2bETA7xBezv3jxIJe1Ew8K8GltDyyyvb5FqyBsmObVbWrNQ0SN41qP8sJD3vqBF/bbPbU8vag524+i8Uzn9B8KHNsqQy8OE695FSJXzjlS+rBD4N9HVKCLtjpnElIqi1f1u3XbrXwdxHQvR4jtHaEAAK0JvK/IgFtRAqf/uEvxgYr2Ixi9NIP10X1vgpDW6K15siMfS6Fb0THbaZi2Xm3VwMCTF3iepcTLE/haUuD6lonUPpQo2fC4kqOni4rbctxm/KdOqRbBhG3NVMKMws4XLcwhxNmOq34/nNYI9d5+xjMHV1WAOBQZGDQ0AbUntE5kEdjyjElWL6FppXwhr4wdFV+sJOfYYBj48P1/JaUuprZlENKHclKKP5ewE74mExcITxNVZ2+z7rRbTMWV25XGwAviGNXWWscblbapGmz3dGHGjMD0PMNHuDNLw0oXPq8N2jX05pNAb9IckgAKrc+byqM3uHPgKYXWcsq0DWuKi7wC9a0jCbm7wBBdJJEQFJJl9zw58GnObgCZKPO8v6J5ZV7dDTVVwamHWV1Wl1RbOC1l5JT9ALyg2UF9hFX+p+dp5tCPtpEx1ThxtOnIZ3smhv3a3bktW9i1+oj90e+4f6V8I7HYuuKdt8C3SynjgvlfkFRmu2h8r30LKA+KtHenuc4EuuapLCcmEj9U0tObV5gWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(55016003)(38070700005)(71200400001)(122000001)(110136005)(9686003)(2906002)(38100700002)(508600001)(33656002)(66556008)(66476007)(66446008)(64756008)(8676002)(54906003)(4326008)(52536014)(83380400001)(6506007)(186003)(7696005)(26005)(107886003)(86362001)(5660300002)(316002)(66946007)(8936002)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NnpPaTVnaW40UkViZDlFQkUvN0hNb1ZNUkl2c1pUZWVIQUc0TGNyZVl5SVV5?=
 =?utf-8?B?Q3M5cEtIUXVpMlVSWFBDb0d0bkRYL24xMDFQcEdpOWdaUXVVTXJWUVBsOVdl?=
 =?utf-8?B?MkFsMzJ2MmFRRnRWZkhGTU1FZHBob2tTU3F3cGdzTUJEOHgxUnhzV09lK2tl?=
 =?utf-8?B?ZEFLWlpFdzlWaXdsVDFvTzBGMmpIWUQzS1NueHZ4U3F3VGJUWnl0cjBTTTJz?=
 =?utf-8?B?ZWQyRWQxSUV6cVg3VkttckJ2NlJpbUx6T0RpOWFidTVnbFUzbHBTazMxTUdR?=
 =?utf-8?B?S0U0TVdyZ0FiOGxNY2hnYWdyOU05K1dEa3BqMkVSaEFvTUFDRGVsVUVwY0Vr?=
 =?utf-8?B?QVYzWkZkR0ljN2lZaHVEa2JMbUl2cWdSV1pEOXI5ZEJNMlh5T3lUZTd2b3pj?=
 =?utf-8?B?NlNvZDRYd0lqZnhVZVFRNi9ubDJyYVdvWnhSaGtTV2ZmZ1FTcGlKY2Ywd3Bs?=
 =?utf-8?B?Q0dDOURDam9IalFiUk9Oa1FBYXJvUC8vYTArNWdBSHBMdHFkaVVDaEliR1hs?=
 =?utf-8?B?Q0JrdjhUT2FtczRNemJRLzhGLyt1NGJQZmpKZFQwdlQvTzZDMTJJSVJrbWN1?=
 =?utf-8?B?SFUrR0NuU2NXTjQxcTVNZmh6N3VQT05hYi85dDFiN0ExS3pSc0c0Ykt2ODdO?=
 =?utf-8?B?bkVzTzBITHVsZXc5Q2syZmhScG42TzlQMU5JalMwSG93MHVEanZmVWpyUGFs?=
 =?utf-8?B?OEFvT0oxL0ZtSWEyV2NTeWQzZTVoamhrSWN5dkdyQTRLZGRSZmNJQ0JQc2xF?=
 =?utf-8?B?QTF4M0lkY0JudmFXcFozcnI2QTRyU1JWekt3UGRDRThXL0o1M1BGQ1BaUERE?=
 =?utf-8?B?U2pmdmJMTFNXdjFSMWNCTnpQSlNjaW9DaW1jOW1pV1N1aUFLbGpMUGN1VDVM?=
 =?utf-8?B?Q1FhaURLK043YXlZVk5GbTlRd01KVmhxN0pyd1hJaFgzVHB6T2FsMk16cHJV?=
 =?utf-8?B?cWhEc0JyUVNnUU9ITHdZc3FYM0xSelZ2WThpRFVmRTlFc1djMHpDQnFTQ3BY?=
 =?utf-8?B?N20rTSttd1pyR09mV3JQWjB5L0FtdWw5MWVlQUxwNVpWSHlNN0lnTzhYZUtz?=
 =?utf-8?B?am1TQ0VZZndyWThERkRNSGFObmhFVTd2aUN4dTBrWDZ6SXhzdGxQclB2R243?=
 =?utf-8?B?UUJhWkRqNGFjQ2VpMDZKUnRqZnBBeVVvM3ZVZUFGVGs4dTBnZHRZOGlHRldZ?=
 =?utf-8?B?R3ZXRGtMUmoxYnY4U2RkM2gzQkRiRkgzWEovWEVVOWFtLzdXK3FCWWM1Nk1l?=
 =?utf-8?B?OHM1WURpZm1GcDc5dDJFU1d3Q0ROVTVUaUdvdEF3eXZvUjFGY3liQ0hpaDFs?=
 =?utf-8?B?WXNmWkZ3YlJGTjl4L2IzNERobkdnaUJlMFZPQ1liMHFIYXBiYm9xbFg1V1Uy?=
 =?utf-8?B?S1U1ZTFTRDB4SVRySVduMlE2eGNEK1MxejlTclh4TGg2LzhMM3J4UmpHNEVt?=
 =?utf-8?B?MlR5OGs2RGc0MU9LSHgvTjNBTkFXK2k2SVVuZ0N2QWFLVzJqdFZZNjFYS3JG?=
 =?utf-8?B?bldMYk02djQ0SEI3RFZ3eEtwazRWQ09CMlN3TFJQbFcrMUNVTDVuaDhuQkF6?=
 =?utf-8?B?MEtFdzQzS2tDMEtGeisvckNRa1FNZEYvY2E3ZGp4bHhWcGxpdlJCTGRobWpk?=
 =?utf-8?B?WXpHSkJjcW5WbmFSSytscEoxZlh6cE1jZkt0MDFTRnJYbzUwdDFnV3lMZUlm?=
 =?utf-8?B?Z3R6SWVnbWFMWmtoNms4NGlDRGl5MTFrWmIxQmkrUkNZbVdnUFltaUdHL3RE?=
 =?utf-8?B?TzdGYVVTMUhtSTZuSXVNZUFBSzlKaXdMTDUvcEZTeGE0SWp5cjR6MWQrWUht?=
 =?utf-8?B?cjZmTkU3a3pXTHpZT0crbVNMNzNKMFJiU1ArOU9kVnhKWnFpc3lCcWpwZ3hi?=
 =?utf-8?B?SDRoSDJKOEdxWVBTQUt4UnNNRlFrOHNTRjFRbi9IVUFXSGVtbDFsbnZYVnZ0?=
 =?utf-8?B?VlVxZ2lkTnM2ZmQ5dHFDbUs4MTltRW9BMjB5bkl5dWU1dWNaSjlVNnczSGd1?=
 =?utf-8?B?UXVqVFNIMG5UeW5PeG9wL3BmWlVOUVV3YWNoU2pVY3BBeWE5SGtLWFptdFBU?=
 =?utf-8?B?UFFCV0xyTkEwUmFNUkc0MHVxbThRcXIyS0ZkMzFaTFNCMjZKUk9rcTgvMFFi?=
 =?utf-8?B?UjFRSjZFcldJbjlrYWlLeWRIMEd6REd4enJWWWVjYkRiczloUURma3hGcVRq?=
 =?utf-8?Q?oTe8ecSAuEk7NcWn0brYCdA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5bd80b-6156-4c05-ec0f-08d9eaed40be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:24:56.2945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wENgJ2xXMfqjAJmAH/3NTO7Ia0OosNDMRSMjhPlrthiKN/lvbxAa5oCdhu0vi/Pt8GYjAc3VM2IKoNzlLfcK9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3533
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

> Ok, I was about building your patches :-)

> Please send as v2, so when creating patches add -v2:
> # git format-patch -s -M -o outgoing -2 -v2 then add 3 dashes before the actual 3 dashes in the produced patches and described what is changed between V1 version to V2 like:
> ---
> V1->V2:
> * moved BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to an URL instead of local patch as suggested by Giulio
> * other eventual modifies
> ---

> And if you send then a v3, then keep previous V1->V2 and add:
> ---
> V1->V2:
> * moved BR2_TARGET_UBOOT_ZYNQMP_PM_CFG to an URL instead of local patch as suggested by Giulio
> V2->V3:
> * modified ....
> ---

Thank you for your quick response.  How do you think we should handle this?  It appears that the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG configuration does not yet support pre-downloading the file from a URL.  Is this something that can easily be updated?  If not, perhaps it makes sense to move forward with my patch set as is for now, and then I can include a new update once the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG configuration accepts URL inputs.

What are your thoughts on this?

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
