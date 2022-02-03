Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BBDC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 06:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 191344018D;
	Thu,  3 Feb 2022 06:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgSJRIlcm7wE; Thu,  3 Feb 2022 06:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2286D401F8;
	Thu,  3 Feb 2022 06:24:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0DC91BF371
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 06:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D538B607AA
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 06:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVg-pJXenNjU for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 06:24:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 807F2606CB
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 06:24:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOx7Ucoi6JDx0nPQft0mxreDGNSggOFfnBGvNaGcnx1YgAkJwRtbSCCiNNfsLDrZm5VfjVRUr3cAjXfUeAcNKLHNI7Y92ejfL1Rb8oLdzj72ClWiRrkhKvRpG6SXrsc2l2EnJ5p2rT7BsIiRq8B44Q9esml2umR6KjYBYhKw0VyHbDpxVUH2w8U9Gf+oCy/VMPYVoCsNqSNqcf4mgqjBxKDLGR2jvBcrfjE7Kx09OhK6Yfl+bIfJtIZVl+M3swg6KS2oAeaUnAs6JlLCC+UB7k735ZwnzDCVZ+JRgAKAAkbgsd7HBb01vi8kSX7GHpob4DPh/b6IOruzrEJKJP2y6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjNcl3HXSg4ZyXlmMt1eBUOA/S9uZIBNnpFSA9bZ1JA=;
 b=iBtwnCi2PxtWytYYKgmFFPANZImmVz7hqBjuh+x1U9sHME+PdBcioPlCwicG9f90flpXqfGVgEQ7wAuYzzifatPvX71LotE803Pm/AKrTZZeUtK+LNM/G7WR8uexVn70pJ3tpLrC/1MU8Uc6n8wDEbTNM8dWQcMDLmmY7sNURGs0hml+UVNFg7/zElb5wAY7hu4za6xdmfRgogTPH4t0wRl0aNerH/MjkghHSIvzlLbFtkLqjWHjY9hN+kYIesIJGzY8DzJsLJH+MnRA7tlWOan8gQS7AlGlY9uhcXSLd6QRuzX7Xxy1bjcQByXuCip+6hs1ZUM/8lhS8ypUv/wuqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjNcl3HXSg4ZyXlmMt1eBUOA/S9uZIBNnpFSA9bZ1JA=;
 b=Pcz/6lS/7h6OQSdLKWv42wL+c09qTQHEYXzaAtdenRwG9aC6PCsxXFSK2UdGlnW1KfpQs5y2rGSJTGlXL8XyONwR05Ho1ctjlamlZyB4qpNV7ymB1TAvvc86O4VPLL+3HwdC0Ui3eGH/Z226+Fz7zJormBA0EWX1fC1QhRbDWis=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM6PR02MB5820.namprd02.prod.outlook.com (2603:10b6:5:17b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Thu, 3 Feb
 2022 06:24:26 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::2116:5f79:fc19:9d93%7]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 06:24:26 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/1] configs/zynqmp_zcu10x: Bump
 ATF/U-Boot/Linux to Xilinx 2021.2
Thread-Index: AQHYGFXQe6rW+OhmpECM57uHN+anmKyA2RsAgACC6rA=
Date: Thu, 3 Feb 2022 06:24:26 +0000
Message-ID: <SJ0PR02MB7758745E002B770107A10120D7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220202165555.3497977-1-nealf@xilinx.com>
 <59b73223-73b3-1b9e-b8ec-0cedb0c605ef@benettiengineering.com>
In-Reply-To: <59b73223-73b3-1b9e-b8ec-0cedb0c605ef@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64680b2e-cb07-4358-afd1-08d9e6ddd3df
x-ms-traffictypediagnostic: DM6PR02MB5820:EE_
x-microsoft-antispam-prvs: <DM6PR02MB5820976B627889F1E3A7576FD7289@DM6PR02MB5820.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pL0OOPyn1araA81O6J9jFGxsQpLDBa4cxqs4kUpu0FhAfLZzRA1qlo1ggce5y7hDnZEyKlFrg7XVQhdVb3WOhihqI3ltvK3lgeTyTG/Zppp18aRmzopIKZyXW0GHZl1sXuFyx4tKyg7+I53dUhqm7n1HevfAni7lkqv1WjbNFmVJNsTPrT8kpqOsEoyJoWvxzbjJOLTQYKwRWugjqOWOXu8Ihib1TJUQ4yW5CeleF/OBErEquuGG6trI5paVL5SiLwOwVeQ6Wo2vkm08Y9hDvZJGAM7IO9dToCFuHYj7m/NwUGMKAXBPwYCrDxe/G4K4zqUbuUiwISv8TtI8ujrKXOnhN9qwcKeHY3wbQhHhucH+UT8/2RCFBaP7FUsc3u0+VOwdEfQ0MdgeajuyQPUtWgXtxvedFG2NAlIFWppDTcNIsYAuApDFkeIrO5QvFEaiLadmj1fyGY50TD8pRmk0KBz92cHMfD0hAfp27NsO/C0U13BM3jIbBcgDtQDQFsJm0WgSfHzjvSSBB4UGhFoOgxUEssZyOyi0sGSkMrrmpItpQ/V3es9cdwNi+M9l4SuXcdrfDm7jhtTdVgf/2a+MW3u7wtyh9DmzfxipVlTCptfa/J47QfZkGKltErs65UcXitlqoLlKoDusQUctLls8REg++fQb2k64R1Mn7oAsqzH0nAQZVREL0ClwjneazjF1yw6tZxoETsmGqJOCRfH0qFZ8qoulFkmNUPO1qfH/xUtPOIfdnAlOkJuCKxdAyoBiDR8QlffsODXJ55Hs4YDaZrGeNTovw3ndHE+r8DmHBBIZojLokrHlnT4zg3L2NgR73rkmMdQA7jIHY1HY+v+f/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(64756008)(66556008)(4326008)(66946007)(8676002)(110136005)(33656002)(7696005)(9686003)(30864003)(52536014)(76116006)(66476007)(122000001)(19627235002)(86362001)(38070700005)(53546011)(66446008)(6506007)(83380400001)(71200400001)(55016003)(508600001)(2906002)(966005)(5660300002)(26005)(316002)(186003)(38100700002)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0tOVTVjTEVSOEVwZGpjVHRsU0JXL2l3cHkzQStJUXRZNVdiTmc3cTRYVFRz?=
 =?utf-8?B?WnRUdFJPSmZEQStKaFRLazYrZC9JT2twYnIzVlJKWHlRcXNZeURNZUF1TDky?=
 =?utf-8?B?MjhOWmxxU29tRkJUcTJ2bERHN01UWVdYOHdVVGxmMUx3VElkZDFlN3ZrTGZS?=
 =?utf-8?B?enNxU2l4VmVYVFFLNyt1SG9hWWlsYi9KaW4rZ2djeXJWZUJvWmdldXZ5QnJX?=
 =?utf-8?B?cFNKLzZuVXgyOFExV0xNL1ZhNnVsQ3Z5MnI4OEVZM2liOS9Kb2lFTERERDYx?=
 =?utf-8?B?SEN4Vno1WjBRczN5QW5YRC81YWpiK2JsaDNlWEdJT3NydUpzM1l4WmFSNEdQ?=
 =?utf-8?B?bGl2T0lESHNkbGJ3YUZzZmpXckszdk02Q09NNHFBNWx1SHozK0pieVpqUUUx?=
 =?utf-8?B?MVFjc1l5MTYwd09mYU5oVDQ5cXdMY0ZjSXFFQmkrWm5zUm1DVmY5ZzJNa1M0?=
 =?utf-8?B?aGhkSGdMeDREbHVJK3VMUjM2Y0c4N2hlRkxNbWRFWFRmbm5WejdJNTJIRzZi?=
 =?utf-8?B?dnk0R05CMGZRanpzUDhUa3REYzdWWHIxY2s3QnBDTHpkRFFLeE90Rys3azM0?=
 =?utf-8?B?TUJWUERSODE2NDhVaUR5YVF6Q0VXYVZPemFhYlpqRFlzUFdpa2wyRzR2dXYz?=
 =?utf-8?B?MzViNXpHaElqY0NmczQzVTNqeXMzZHREaXhnQ1FnWEFpWnEwSjdXZXJBT3Rn?=
 =?utf-8?B?eDlLc3h3WnY0RThOd3RILzk1dU1QM0dlN09zU2hyNG5kaGdLNDVWL3ZYaWFu?=
 =?utf-8?B?b2Zta09Oc2dVZDNjRHJ3ZmxOZU8zTzJHQTNIQWpYVnVhTk5waE9yeVVhTVlM?=
 =?utf-8?B?cXpLc2tNbGNMSXVDQ1YzMXJ0VnJzOGgwVllqMlVsNS9jeDZ6U1lpcFVoRmNp?=
 =?utf-8?B?N05jT0Q0R2hzU1NQYW15ODA1Q2RNVUMxNUI3eWplL0hQZllVVEw3L1VQNzkz?=
 =?utf-8?B?OHdRbTMyUko4N2tXTmRFK0pFQnNkZUtFTkhxSkRJek9jY21NUmlNZ00vUFJK?=
 =?utf-8?B?SnJEZUordkMwV1RIb1ZXNlk3WmhtR0tkY2ozSkV0R0JNd1I2UE9uUGVKYmQ5?=
 =?utf-8?B?S0pQb0lMTmM4MnlOM1Fud2xFL0RXdUFodnNlejV2citVRzZXcXMrY2JMVFVH?=
 =?utf-8?B?a1k4SWliKzhzSlovQlUxRzYxN2h2N1psSFE2ajZTb25tNXc0MEVRbkpIUjla?=
 =?utf-8?B?ZzR3OHFvU3cyZGNBblBxZ0xDVXZRU3JjK3Q1UnM3MlJkVy9ha2hQOG9JR2I5?=
 =?utf-8?B?cmk0amtyaFh2TGIrVTNRT25ydXNlMXdIWTRaZTBZZlZiRkRuWnRMTnZyRFRY?=
 =?utf-8?B?ZitNWmhVZy9UN2ZRb3JJQW11cVRUME5YYVZiYm9vRWdpeWk3UTFSeUliTFEr?=
 =?utf-8?B?b21aR25jUG1DbW02V29kcDR3RDl2a1FYNjVxQlB0aCs5ek1tNmFtZCtaU2lp?=
 =?utf-8?B?Y2JqVmUzL21uOUFrcU1VN0dvV0lONFBhTFh5SU1FTkJZaXVtcXhlZFRDbklJ?=
 =?utf-8?B?UHBBMkVnZm5sck9Vdkhlb1lKYVdVUmYwdFZvMSt3ejNVbGRGdVVzTEp1alkz?=
 =?utf-8?B?ZXpVd245T01rZ2dPeGZlamMwdUVNc05nNEllMUNSUTZNMmtBa3oyWlNKM2RQ?=
 =?utf-8?B?VXBnbVY5YksyYmx2WmJpeEp0Qll5SzhPVExBWnlOYnJ5OVNIcHdpUytTL05q?=
 =?utf-8?B?T0NzaFVsNUUyYVZVbVdHK05rc3hYdmYzSHFQWDlUY2F6WGIrNEEzV3FScURl?=
 =?utf-8?B?NlBnQmlNTEk1eVk1SVIvczZXYWZDejd1UlIzS1AwNmhJdUViMWVpaFI3MGhE?=
 =?utf-8?B?R0srWk8rV0xBZzdraUJBRmZTRVFtczhmRUNEMVA3TXpYb0M3VjFzZnV2a3B3?=
 =?utf-8?B?ZFdNQkt1VDJwTnc5V0lyVUxjS2VUdVlPNCtkR3BjUGp5N2ZEY2tZNUlxLzVu?=
 =?utf-8?B?akRnRWNhTGVmMHlnekRUTXNZci8wTktUaGk4Y3lFSmwzYTdXcmVHWEtOY0NU?=
 =?utf-8?B?dnUwcHRsNE8ycUZxT3NJNFBUS3padnRISHBtY3hIRE1BSUdzMHcyMFpoeEVI?=
 =?utf-8?B?bGZGTmtQZG1RL1FSb0ZVcklPRDBTSkhYMkZJcVRUSDh1SEE4aFF0RUZpcGZl?=
 =?utf-8?B?SDF0Q1J0bmRBYVh5Wm9XVjJJTWlyNVNHdVEvczRUZDdwNisxZksxclgyZkgz?=
 =?utf-8?B?YUE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64680b2e-cb07-4358-afd1-08d9e6ddd3df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 06:24:26.5355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yB6Ix5xAzA6p2A9igAqAfTCfGlpHRyqYSLAxyL/WzB6todTqfzt7G06Wj6l4kZxD8+kCBy0xstWgGt8d2b1V7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5820
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

Thank you very much for your feedback.  I would be happy to split the zynqmp_zcu102_defconfig off into a second patch.  No problem.

As for adding comments to the log, could you share the proper git commands for doing this?  I would be happy to do it, but I am a bit new to git and I did not know the proper command to use for adding log comments.

Best regards,

Neal Frager
Xilinx

-----Original Message-----
From: Giulio Benetti <giulio.benetti@benettiengineering.com> 
Sent: Wednesday 2 February 2022 23:33
To: Neal Frager <nealf@xilinx.com>; buildroot@buildroot.org
Cc: luca@lucaceresoli.net; Neal Frager <nealf@xilinx.com>
Subject: Re: [Buildroot] [PATCH 1/1] configs/zynqmp_zcu10x: Bump ATF/U-Boot/Linux to Xilinx 2021.2

CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.


Hi Neal,

nice to see you've made it with git send-email :-),

Here I would improve commit log by stating that you're dropping all local patches because they are now upstreamed

On 02/02/22 17:55, Neal Frager wrote:
> Signed-off-by: Neal Frager <nealf@xilinx.com>
> ---
>   board/zynqmp/genimage.cfg                     |   1 +
>   ...-fix-Remove-GGC-ignore-Warray-bounds.patch |  68 -------
>   ...64-zynqmp-zcu106-fix-SPL-MMC-booting.patch |  52 ------
>   ...2-arm64-zynqmp-Enable-booting-to-ATF.patch | 114 ------------
>   ...ept-an-absolute-path-for-PMUFW_INIT_.patch |  68 -------
>   ...ynqmp-pass-the-PS-init-file-as-a-kco.patch | 175 ------------------
>   configs/zynqmp_zcu102_defconfig               |  35 ++++

This ^^^ file is added, so it deserves a second patch after this one, basically this becomes a patchset of 2 patches

>   configs/zynqmp_zcu106_defconfig               |  15 +-
>   8 files changed, 44 insertions(+), 484 deletions(-)
>   delete mode 100644 board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-GGC-ignore-Warray-bounds.patch
>   delete mode 100644 board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-booting.patch
>   delete mode 100644 board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.patch
>   delete mode 100644 board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
>   delete mode 100644 board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-init-file-as-a-kco.patch
>   create mode 100644 configs/zynqmp_zcu102_defconfig
>
> diff --git a/board/zynqmp/genimage.cfg b/board/zynqmp/genimage.cfg 
> index ed202f4550..557364e124 100644
> --- a/board/zynqmp/genimage.cfg
> +++ b/board/zynqmp/genimage.cfg
> @@ -3,6 +3,7 @@ image boot.vfat {
>               files = {
>                       "boot.bin",
>                       "u-boot.bin",
> +                     "u-boot.itb",

Can you please justify this adding ^^^ in commit log?

>                       "atf-uboot.ub",
>                       "system.dtb",
>                       "Image"
> diff --git 
> a/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-G
> GC-ignore-Warray-bounds.patch 
> b/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-G
> GC-ignore-Warray-bounds.patch
> deleted file mode 100644
> index 0c1a9ba2a4..0000000000
> --- 
> a/board/zynqmp/patches/arm-trusted-firmware/0001-Coverity-fix-Remove-G
> GC-ignore-Warray-bounds.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From da003e6ada7d0217fe99dc7c649a731f8ebd3c34 Mon Sep 17 00:00:00 
> 2001
> -From: Deepika Bhavnani <deepika.bhavnani@arm.com>
> -Date: Thu, 15 Aug 2019 00:56:46 +0300
> -Subject: [PATCH] Coverity fix: Remove GGC ignore -Warray-bounds
> -
> -GCC diagnostics were added to ignore array boundaries, instead -of 
> ignoring GCC warning current code will check for array boundaries -and 
> perform and array update only for valid elements.
> -
> -Resolves: `CID 246574` `CID 246710` `CID 246651`
> -
> -Signed-off-by: Deepika Bhavnani <deepika.bhavnani@arm.com>
> -Change-Id: I7530ecf7a1707351c6ee87e90cc3d33574088f57
> -
> -Backported from: 41af05154abe136938bcfb5f26c969933784bbef
> -[Adapted to apply on 1.5]
> -
> ----
> - lib/psci/psci_common.c | 20 ++++++++++----------
> - 1 file changed, 10 insertions(+), 10 deletions(-)
> -
> -diff --git a/lib/psci/psci_common.c b/lib/psci/psci_common.c -index 
> 2220a745cd6e..6282d992a2f0 100644
> ---- a/lib/psci/psci_common.c
> -+++ b/lib/psci/psci_common.c
> -@@ -188,21 +188,17 @@ static unsigned int 
> get_power_on_target_pwrlvl(void)
> - 
> /*********************************************************************
> *********
> -  * Helper function to update the requested local power state array. 
> This array
> -  * does not store the requested state for the CPU power level. Hence 
> an
> -- * assertion is added to prevent us from accessing the wrong index.
> -+ * assertion is added to prevent us from accessing the CPU power level.
> -  
> **********************************************************************
> *******/
> - static void psci_set_req_local_pwr_state(unsigned int pwrlvl,
> -                                      unsigned int cpu_idx,
> -                                      plat_local_state_t req_pwr_state)
> - {
> --    /*
> --     * This should never happen, we have this here to avoid
> --     * "array subscript is above array bounds" errors in GCC.
> --     */
> -     assert(pwrlvl > PSCI_CPU_PWR_LVL);
> --#pragma GCC diagnostic push
> --#pragma GCC diagnostic ignored "-Warray-bounds"
> --    psci_req_local_pwr_states[pwrlvl - 1][cpu_idx] = req_pwr_state;
> --#pragma GCC diagnostic pop
> -+    if ((pwrlvl > PSCI_CPU_PWR_LVL) && (pwrlvl <= PLAT_MAX_PWR_LVL) &&
> -+                    (cpu_idx < PLATFORM_CORE_COUNT)) {
> -+            psci_req_local_pwr_states[pwrlvl - 1U][cpu_idx] = req_pwr_state;
> -+    }
> - }
> -
> - 
> /*********************************************************************
> ********* -@@ -228,7 +224,11 @@ static plat_local_state_t 
> *psci_get_req_local_pwr_states(unsigned int pwrlvl,
> - {
> -     assert(pwrlvl > PSCI_CPU_PWR_LVL);
> -
> --    return &psci_req_local_pwr_states[pwrlvl - 1][cpu_idx];
> -+    if ((pwrlvl > PSCI_CPU_PWR_LVL) && (pwrlvl <= PLAT_MAX_PWR_LVL) &&
> -+                    (cpu_idx < PLATFORM_CORE_COUNT)) {
> -+            return &psci_req_local_pwr_states[pwrlvl - 1U][cpu_idx];
> -+    } else
> -+            return NULL;
> - }
> -
> - /*
> ---
> -2.34.0
> -
> diff --git 
> a/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-boot
> ing.patch 
> b/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-boot
> ing.patch
> deleted file mode 100644
> index 4d85e1bb12..0000000000
> --- 
> a/board/zynqmp/patches/uboot/0001-arm64-zynqmp-zcu106-fix-SPL-MMC-boot
> ing.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From e5d72ed8339eb05285448aad3c89d21e4d18fd29 Mon Sep 17 00:00:00 
> 2001
> -From: Luca Ceresoli <luca@lucaceresoli.net>
> -Date: Mon, 26 Feb 2018 09:40:34 +0100
> -Subject: [PATCH] arm64: zynqmp: zcu106: fix SPL MMC booting
> -
> -The U-Boot SPL generated with the current zcu106 defconfig cannot 
> boot -from MMC:
> -
> -  [...]
> -  U-Boot SPL 2018.01 (Feb 21 2018 - 17:47:14)
> -  EL Level:  EL3
> -  Trying to boot from MMC1
> -  sdhci_transfer_data: Error detected in status(0x408020)!
> -  spl_load_image_fat_os: error reading image u-boot.bin, err - -2
> -  spl_load_image_fat: error reading image u-boot.img, err - -6
> -  SPL: failed to boot from all boot devices
> -  ### ERROR ### Please RESET the board ###
> -
> -Fix by lowering the rpll value. The new value for the RPLL_CTRL 
> -register comes from the current psu_init_gpl.c from the HDF file at 
> -https://github.com/xilinx/hdf-examples/tree/01ad8ea5fd1989abf4ea5a072
> d019a16cb2bc546/zcu106-zynqmp
> -(generated by Vivado v2017.4).
> -
> -RPLL and sdio1_ref clocks before and after this change:
> -
> - - Old values: RPLL 1.36 GHz, sdio1_ref 272 MHz
> - - New values: RPLL 1.16 GHz, sdio1_ref 233 MHz
> -
> -Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -Cc: Michal Simek <michal.simek@xilinx.com>
> -Upstream-status: accepted upstream in a different form
> ----
> -
> - board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c 
> b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
> -index 4d18abe000ca..e6fa477e53e7 100644
> ---- a/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
> -+++ b/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
> -@@ -10,7 +10,7 @@
> - static unsigned long psu_pll_init_data(void)
> - {
> -     psu_mask_write(0xFF5E0034, 0xFE7FEDEFU, 0x7E4E2C62U);
> --    psu_mask_write(0xFF5E0030, 0x00717F00U, 0x00013C00U);
> -+    psu_mask_write(0xFF5E0030, 0x00717F00U, 0x00014600U);
> -     psu_mask_write(0xFF5E0030, 0x00000008U, 0x00000008U);
> -     psu_mask_write(0xFF5E0030, 0x00000001U, 0x00000001U);
> -     psu_mask_write(0xFF5E0030, 0x00000001U, 0x00000000U);
> ---
> -2.7.4
> -
> diff --git 
> a/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.p
> atch 
> b/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.p
> atch
> deleted file mode 100644
> index 487fff6812..0000000000
> --- 
> a/board/zynqmp/patches/uboot/0002-arm64-zynqmp-Enable-booting-to-ATF.p
> atch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From 5e3cac50cc981e01d9072241035a8d4162560c71 Mon Sep 17 00:00:00 
> 2001
> -From: Luca Ceresoli <luca@lucaceresoli.net>
> -Date: Mon, 12 Mar 2018 17:18:38 +0100
> -Subject: [PATCH] arm64: zynqmp: Enable booting to ATF
> -
> -U-Boot is now able to boot to ARM Trusted Firmware (ATF). The boot 
> -flow is SPL(EL3) loads ATF and full u-boot and jump to ATF(EL3) which 
> -pass control to full u-boot(EL2). This has been tested on zcu106, so 
> -enable it in this defconfig.
> -
> -To generate an image that triggers this booting flow, you need to 
> pass -'-O arm-trusted-firmware' to mkimage.
> -
> -Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -Signed-off-by: Michal Simek <michal.simek@xilinx.com> -Backported 
> from upstream: 
> http://git.denx.de/?p=u-boot.git;a=commit;h=5e3cac50cc981e01d907224103
> 5a8d4162560c71
> ----
> -
> - configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig | 1 +
> - configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig | 1 +
> - configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig | 1 +
> - configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig | 1 +
> - configs/xilinx_zynqmp_zcu102_rev1_0_defconfig    | 1 +
> - configs/xilinx_zynqmp_zcu102_revA_defconfig      | 1 +
> - configs/xilinx_zynqmp_zcu102_revB_defconfig      | 1 +
> - 7 files changed, 7 insertions(+)
> -
> -diff --git a/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig 
> b/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
> -index c5bfa2b12638..488c72258b0e 100644
> ---- a/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
> -+++ b/configs/xilinx_zynqmp_zc1751_xm015_dc1_defconfig
> -@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> -diff --git a/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig 
> b/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
> -index f86dce403a42..5d501eec0edd 100644
> ---- a/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
> -+++ b/configs/xilinx_zynqmp_zc1751_xm016_dc2_defconfig
> -@@ -20,6 +20,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> -diff --git a/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig 
> b/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
> -index 6e947cf56827..6f7eaebd7676 100644
> ---- a/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
> -+++ b/configs/xilinx_zynqmp_zc1751_xm018_dc4_defconfig
> -@@ -16,6 +16,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_CMD_MEMTEST=y
> - CONFIG_SYS_ALT_MEMTEST=y
> -diff --git a/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig 
> b/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
> -index 1c934858c61c..7a3806cba4b5 100644
> ---- a/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
> -+++ b/configs/xilinx_zynqmp_zc1751_xm019_dc5_defconfig
> -@@ -17,6 +17,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_CMD_MEMTEST=y
> - CONFIG_SYS_ALT_MEMTEST=y
> -diff --git a/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig 
> b/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
> -index e13c7c56f310..e4408f182ca0 100644
> ---- a/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
> -+++ b/configs/xilinx_zynqmp_zcu102_rev1_0_defconfig
> -@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> -diff --git a/configs/xilinx_zynqmp_zcu102_revA_defconfig 
> b/configs/xilinx_zynqmp_zcu102_revA_defconfig
> -index 5b2cd495ee85..b52f6789fd4b 100644
> ---- a/configs/xilinx_zynqmp_zcu102_revA_defconfig
> -+++ b/configs/xilinx_zynqmp_zcu102_revA_defconfig
> -@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> -diff --git a/configs/xilinx_zynqmp_zcu102_revB_defconfig 
> b/configs/xilinx_zynqmp_zcu102_revB_defconfig
> -index e6530fbfe7ff..80592554f682 100644
> ---- a/configs/xilinx_zynqmp_zcu102_revB_defconfig
> -+++ b/configs/xilinx_zynqmp_zcu102_revB_defconfig
> -@@ -19,6 +19,7 @@ CONFIG_BOARD_EARLY_INIT_R=y
> - CONFIG_SPL_OS_BOOT=y
> - CONFIG_SPL_RAM_SUPPORT=y
> - CONFIG_SPL_RAM_DEVICE=y
> -+CONFIG_SPL_ATF=y
> - CONFIG_SYS_PROMPT="ZynqMP> "
> - CONFIG_FASTBOOT=y
> - CONFIG_FASTBOOT_FLASH=y
> ---
> -2.7.4
> -
> diff --git 
> a/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path
> -for-PMUFW_INIT_.patch 
> b/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path
> -for-PMUFW_INIT_.patch
> deleted file mode 100644
> index 95ab7b3b75..0000000000
> --- 
> a/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path
> -for-PMUFW_INIT_.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From c7df098a71e05dc81cee818747759e8060b59626 Mon Sep 17 00:00:00 
> 2001
> -From: Luca Ceresoli <luca@lucaceresoli.net>
> -Date: Mon, 4 Jun 2018 12:21:01 +0200
> -Subject: [PATCH] arm64: zynqmp: accept an absolute path for 
> PMUFW_INIT_FILE
> -
> -The value of PMUFW_INIT_FILE is prefixed with "$(srctree)/", thus 
> -forcing it to be a relative path inside the U-Boot source tree. Since 
> -the PMUFW is a binary file generated outside of U-Boot, the PMUFW 
> -binary must be copied inside the U-Boot source tree before the 
> -build.
> -
> -This generates a few problems:
> -
> - * if the source tree is shared among different out-of-tree builds,
> -   they will pollute (and potentially corrupt) each other
> - * the source tree cannot be read-only
> - * any buildsystem must add a command to copy the PMUFW binary
> - * putting an externally-generated binary in the source tree is ugly
> -   as hell
> -
> -Avoid these problems by accepting an absolute path for 
> -PMUFW_INIT_FILE. This would be as simple as removing the "$(srctree)/"
> -prefix, but in order to keep backward compatibility we rather use the 
> -shell and readlink to get the absolute path even when starting from a 
> -relative path.
> -
> -Since 'readlink -f' produces an empty string if the file does not 
> -exist, we also add a check to ensure the file configured in 
> -PMUFW_INIT_FILE exists. Otherwise the build would exit successfully, 
> -but produce a boot.bin without PMUFW as if PMUFW_INIT_FILE were empty.
> -
> -Tested in the 12 possible combinations of:
> - - PMUFW_INIT_FILE empty, relative, absolute, non-existing
> - - building in-tree, in subdir, in other directory
> -
> -Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -Cc: Michal Simek <michal.simek@xilinx.com>
> -Cc: Simon Glass <sjg@chromium.org>
> -Cc: Emmanuel Vadot <manu@bidouilliste.com>
> -Signed-off-by: Michal Simek <michal.simek@xilinx.com> -Backported 
> from upstream: 
> https://git.denx.de/?p=u-boot.git;a=commit;h=c7df098a71e05dc81cee81874
> 7759e8060b59626
> ----
> - scripts/Makefile.spl | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl -index 
> ef018b5b4056..252f13826d4c 100644
> ---- a/scripts/Makefile.spl
> -+++ b/scripts/Makefile.spl
> -@@ -167,8 +167,14 @@ ifdef CONFIG_ARCH_ZYNQ
> - MKIMAGEFLAGS_boot.bin = -T zynqimage -R 
> $(srctree)/$(CONFIG_BOOT_INIT_FILE)
> - endif
> - ifdef CONFIG_ARCH_ZYNQMP
> -+ifneq ($(CONFIG_PMUFW_INIT_FILE),"")
> -+spl/boot.bin: zynqmp-check-pmufw
> -+zynqmp-check-pmufw: FORCE
> -+    ( cd $(srctree) && test -r $(CONFIG_PMUFW_INIT_FILE) ) \
> -+            || ( echo "Cannot read $(CONFIG_PMUFW_INIT_FILE)" && 
> -+false ) endif
> - MKIMAGEFLAGS_boot.bin = -T zynqmpimage -R $(srctree)/$(CONFIG_BOOT_INIT_FILE) \
> --    -n $(srctree)/$(CONFIG_PMUFW_INIT_FILE)
> -+    -n "$(shell cd $(srctree); readlink -f $(CONFIG_PMUFW_INIT_FILE))"
> - endif
> -
> - spl/boot.bin: $(obj)/u-boot-spl.bin FORCE
> ---
> -2.7.4
> -
> diff --git 
> a/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-in
> it-file-as-a-kco.patch 
> b/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-in
> it-file-as-a-kco.patch
> deleted file mode 100644
> index b32e162780..0000000000
> --- 
> a/board/zynqmp/patches/uboot/0004-arm-arm64-zynq-zynqmp-pass-the-PS-in
> it-file-as-a-kco.patch
> +++ /dev/null
> @@ -1,175 +0,0 @@
> -From 4c9d54ab5a41d65000c8d249b6fb1b76056f1812 Mon Sep 17 00:00:00 
> 2001
> -From: Luca Ceresoli <luca@lucaceresoli.net>
> -Date: Wed, 20 Jun 2018 12:11:50 +0200
> -Subject: [PATCH] arm/arm64: zynq/zynqmp: pass the PS init file as a 
> kconfig
> - variable
> -
> -U-Boot needs to link ps7_init_gpl.c on Zynq or psu_init_gpl.c on 
> -ZynqMP (PS init for short). The current logic to locate this file for 
> -both platforms is:
> -
> - 1. if a board-specific file exists in
> -    board/xilinx/zynq[mp]/$(CONFIG_DEFAULT_DEVICE_TREE)/ps?_init_gpl.c
> -    then use it
> - 2. otherwise use board/xilinx/zynq/ps?_init_gpl.c
> -
> -In the latter case the file does not exist in the U-Boot sources and 
> -must be copied in the source tree from the outside before starting 
> the -build. This is typical when it is generated from Xilinx tools 
> while -developing a custom hardware. However making sure that a 
> -board-specific file is _not_ found (and used) requires some trickery 
> -such as removing or overwriting all PS init files (e.g.: the current 
> -meta-xilinx yocto layer [0]).
> -
> -This generates a few problems:
> -
> - * if the source tree is shared among different out-of-tree builds,
> -   they will pollute (and potentially corrupt) each other
> - * the source tree cannot be read-only
> - * any buildsystem must add a command to copy the PS init file binary
> - * overwriting or deleting files in the source tree is ugly as hell
> -
> -Simplify usage by allowing to pass the path to the desired PS init 
> -file in kconfig variable XILINX_PS_INIT_FILE. It can be an absolute 
> -path or relative to $(srctree). If the variable is set, the 
> -user-specified file will always be used without being copied -around. 
> If the the variable is left empty, for backward compatibility -fall 
> back to the old behaviour.
> -
> -Since the issue is the same for Zynq and ZynqMP, add one kconfig 
> -variable in a common place and use it for both.
> -
> -Also use the new kconfig help text to document all the ways to give 
> -U-Boot the PS init file.
> -
> -Build-tested with all combinations of:
> - - platform: zynq or zynqmp
> - - PS init file: from XILINX_PS_INIT_FILE (absolute, relative path,
> -   non-existing), in-tree board-specific, in board/xilinx/zynq[mp]/
> - - building in-tree, in subdir, in other directory
> -
> -[0] 
> https://github.com/Xilinx/meta-xilinx/blob/b2f74cc7fe5c4881589d5e440a1
> 7cb51fc66a7ab/meta-xilinx-bsp/recipes-bsp/u-boot/u-boot-spl-zynq-init.
> inc#L9
> -
> -Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> -Cc: Albert Aribaud <albert.u.boot@aribaud.net>
> -Cc: Michal Simek <michal.simek@xilinx.com>
> -Cc: Nathan Rossi <nathan@nathanrossi.com> -Backported from upstream: 
> https://git.denx.de/?p=u-boot.git;a=commit;h=6da4f67ad09cd8b311d77b2b0
> 4e557b7ef65b56c
> ----
> - arch/arm/Kconfig             |  1 +
> - board/xilinx/Kconfig         | 41 +++++++++++++++++++++++++++++++++++++++++
> - board/xilinx/zynq/Makefile   | 10 +++++++++-
> - board/xilinx/zynqmp/Makefile | 10 +++++++++-
> - 4 files changed, 60 insertions(+), 2 deletions(-)
> - create mode 100644 board/xilinx/Kconfig
> -
> -diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig -index 
> 22234cde2ab6..e04979d0ef7e 100644
> ---- a/arch/arm/Kconfig
> -+++ b/arch/arm/Kconfig
> -@@ -1293,4 +1293,5 @@ source "board/technologic/ts4600/Kconfig"
> - source "board/vscom/baltos/Kconfig"
> - source "board/woodburn/Kconfig"
> - source "board/work-microwave/work_92105/Kconfig"
> -+source "board/xilinx/Kconfig"
> - source "board/zipitz2/Kconfig"
> -
> - source "arch/arm/Kconfig.debug"
> -diff --git a/board/xilinx/Kconfig b/board/xilinx/Kconfig -new file 
> mode 100644 -index 000000000000..aa3fa061edef
> ---- /dev/null
> -+++ b/board/xilinx/Kconfig
> -@@ -0,0 +1,41 @@
> -+# Copyright (c) 2018, Luca Ceresoli <luca@lucaceresoli.net> # # 
> -+SPDX-License-Identifier: GPL-2.0
> -+
> -+if ARCH_ZYNQ || ARCH_ZYNQMP
> -+
> -+config XILINX_PS_INIT_FILE
> -+    string "Zynq/ZynqMP PS init file(s) location"
> -+    help
> -+      On Zynq and ZynqMP U-Boot SPL (or U-Boot proper if
> -+      ZYNQMP_PSU_INIT_ENABLED is set) is responsible for some
> -+      basic initializations, such as enabling peripherals and
> -+      configuring pinmuxes. The PS init file (called
> -+      psu_init_gpl.c on ZynqMP, ps7_init_gpl.c for Zynq-7000)
> -+      contains the code for such initializations.
> -+
> -+      U-Boot contains PS init files for some boards, but each of
> -+      them describes only one specific configuration. Users of a
> -+      different board, or needing a different configuration, can
> -+      generate custom files using the Xilinx development tools.
> -+
> -+      There are three ways to give a PS init file to U-Boot:
> -+
> -+      1. Set this variable to the path, either relative to the
> -+         source tree or absolute, where the psu_init_gpl.c or
> -+         ps7_init_gpl.c file is located. U-Boot will build this
> -+         file.
> -+
> -+      2. If you leave an empty string here, U-Boot will use
> -+         board/xilinx/zynq/$(CONFIG_DEFAULT_DEVICE_TREE)/ps7_init_gpl.c
> -+         for Zynq-7000, or
> -+         board/xilinx/zynqmp/$(CONFIG_DEFAULT_DEVICE_TREE)/psu_init_gpl.c
> -+         for ZynqMP.
> -+
> -+      3. If the above file does not exist, U-Boot will use
> -+         board/xilinx/zynq/ps7_init_gpl.c for Zynq-7000, or
> -+         board/xilinx/zynqmp/psu_init_gpl.c for ZynqMP. This file
> -+         is not provided by U-Boot, you have to copy it there
> -+         before the build.
> -+
> -+endif
> -diff --git a/board/xilinx/zynq/Makefile b/board/xilinx/zynq/Makefile 
> -index 5a76a26720cd..03ad5f0532ee 100644
> ---- a/board/xilinx/zynq/Makefile
> -+++ b/board/xilinx/zynq/Makefile
> -@@ -5,10 +5,18 @@
> -
> - obj-y       := board.o
> -
> --hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
> -+ifneq ($(CONFIG_XILINX_PS_INIT_FILE),"")
> -+PS_INIT_FILE := $(shell cd $(srctree); readlink -f 
> -+$(CONFIG_XILINX_PS_INIT_FILE)) init-objs := ps_init_gpl.o 
> -+spl/board/xilinx/zynq/ps_init_gpl.o board/xilinx/zynq/ps_init_gpl.o: $(PS_INIT_FILE)
> -+    $(CC) $(c_flags) -I $(srctree)/$(src) -c -o $@ $^ endif
> -
> -+ifeq ($(init-objs),)
> -+hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
> - init-objs := $(if $(wildcard $(srctree)/$(src)/$(hw-platform-y)/ps7_init_gpl.c),\
> -     $(hw-platform-y)/ps7_init_gpl.o)
> -+endif
> -
> - ifeq ($(init-objs),)
> - ifneq ($(wildcard $(srctree)/$(src)/ps7_init_gpl.c),)
> -diff --git a/board/xilinx/zynqmp/Makefile 
> b/board/xilinx/zynqmp/Makefile -index 05ccd25dcef3..960b81fc5853 
> 100644
> ---- a/board/xilinx/zynqmp/Makefile
> -+++ b/board/xilinx/zynqmp/Makefile
> -@@ -5,10 +5,18 @@
> -
> - obj-y       := zynqmp.o
> -
> --hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
> -+ifneq ($(CONFIG_XILINX_PS_INIT_FILE),"")
> -+PS_INIT_FILE := $(shell cd $(srctree); readlink -f 
> -+$(CONFIG_XILINX_PS_INIT_FILE)) init-objs := ps_init_gpl.o 
> -+spl/board/xilinx/zynqmp/ps_init_gpl.o board/xilinx/zynqmp/ps_init_gpl.o: $(PS_INIT_FILE)
> -+    $(CC) $(c_flags) -I $(srctree)/$(src) -c -o $@ $^ endif
> -
> -+ifeq ($(init-objs),)
> -+hw-platform-y :=$(shell echo $(CONFIG_DEFAULT_DEVICE_TREE))
> - init-objs := $(if $(wildcard $(srctree)/$(src)/$(hw-platform-y)/psu_init_gpl.c),\
> -     $(hw-platform-y)/psu_init_gpl.o)
> -+endif
> -
> - ifeq ($(init-objs),)
> - ifneq ($(wildcard $(srctree)/$(src)/psu_init_gpl.c),)
> ---
> -2.7.4
> -
> diff --git a/configs/zynqmp_zcu102_defconfig 
> b/configs/zynqmp_zcu102_defconfig new file mode 100644 index 
> 0000000000..336f5c2dbe
> --- /dev/null
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -0,0 +1,35 @@
> +BR2_aarch64=y
> +BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.4_2021.2"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> +BR2_TARGET_UBOOT_ZYNQMP=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/master/bin/pmufw-v2021.2.bin"
> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

As pointed above this ^^^ file must be in a separate patch and it deserves also a maintainer. So please you or maybe Luca could add an entry to DEVELOPERS for this board

> diff --git a/configs/zynqmp_zcu106_defconfig 
> b/configs/zynqmp_zcu106_defconfig index bee7c1daf7..3a6947e1e8 100644
> --- a/configs/zynqmp_zcu106_defconfig
> +++ b/configs/zynqmp_zcu106_defconfig
> @@ -1,11 +1,11 @@
>   BR2_aarch64=y
>   BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"

Since all patches are gone, this ^^^ is not needed anymore

> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
>   BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.4"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
>   BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu106-revA"
> @@ -14,21 +14,22 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/Xilinx/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="xlnx_rebase_v2.4_2021.2"

It's worth mention in commit log that you're switching from ARM to Xilinx ATF

>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>   BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_GIT=y
>   BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu106_revA"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>   BR2_TARGET_UBOOT_ZYNQMP=y
> -BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/53fdb7b6c92860ceb0ec5fd14deee302f4a84269/bin/pmufw-zcu106-default-v2017.4.bin"
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/master/bin/pmufw-v2021.2.bin"
> +BR2_TARGET_UBOOT_FORMAT_ITB=y

Here ^^^ I see that probably you're switching from .bin to .itb so better mention it in commit log

>   BR2_PACKAGE_HOST_DOSFSTOOLS=y
>   BR2_PACKAGE_HOST_GENIMAGE=y
>   BR2_PACKAGE_HOST_MTOOLS=y

Thank you!

Best regards
--
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

