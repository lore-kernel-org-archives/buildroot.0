Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3051EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 07:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD90441861;
	Fri, 15 Apr 2022 07:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gLMCVoJSEbtn; Fri, 15 Apr 2022 07:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F0041850;
	Fri, 15 Apr 2022 07:11:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1F2A1BF410
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 07:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EEA04051D
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 07:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tP7UbLDBnzYW for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 07:11:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::60b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB45640103
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 07:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgBluOwpBbmma0PnfOSmBoXAe9jtVzB8giqAd0s7SSB9ZuLoai2j855h7YXE+QueLBNmpMstA6Nc1js1Z3XeitnQh2Duq1I+Eeh05FybUF4vtetomzrqgLkUV6YHJENfWqNox6I2a39pBOMQJT9js3rXhpr+rDBdZl1WTCC+ytUHQScBoryt+Tpybsjk9jCIkj9Lr3nfMGnXitwEP4Tx3xpBPEVUZSn6gnpuQr/PryXzz1aMTBXQIqjh4tjSLgZLabeFVlrmUS1TwIAEkYeqMg6q9j+ZUbjt/8LMQgRqO8vhMi1iwWMdZtZrwJMcUMEW/kEOb0nnq/M34xr50ib8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLJ9Ans7V1zkk8oQXm9rQiOGANrV8csnQ4XsorjIsO8=;
 b=aBAAzgMVRvT8wk3Fj5ecXs9LS2nsK6Hn2x526iSdTc29sFC2PElX9d3LYheQtCWKGNZCpcv96nc5w0PXyk6K4UvyRpIqTCHiW2/9KVr8fBnNAt+jonRUSIjJhUQv1DYzzrq/vIJyAQbMFDUodNkvtMeAC3uSozI7vfyAsFP8hIZSZKf6+1VX2kAxJZCRkpnElvP+pZFj3yHCPiyjr5cHejNOqRzjlnBgiySo4dsxr5TQFeF63oimKv520EFuPt0aHj441yqX4uUYY4rIWkeCLt59IOXHWRmblmpAWItkg/gY3JvQJ1eZUeMa3aSUcOHgoJ5zkd4lop+XMsF2GW75Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLJ9Ans7V1zkk8oQXm9rQiOGANrV8csnQ4XsorjIsO8=;
 b=YzVcp89AWNRivW/6wi2BZC8v03noenqiZqLVn7kcXO5pospbPUG2T3jUsYs2+/Tdbucg8/0ak8ID/eRt/sl51+/Q7EWEosTYXru/gg6OjCal0JouJyEmD/N5yI+b4b+xhyNqSdmErTyLFH1xQItUWPuvvycilwcKG06zpNKRS5Y=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SJ0PR02MB7438.namprd02.prod.outlook.com (2603:10b6:a03:294::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 07:11:24 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%4]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 07:11:24 +0000
From: Neal Frager <nealf@xilinx.com>
To: Luca Ceresoli <luca@lucaceresoli.net>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump to Xilinx
 2021.2
Thread-Index: AQHYS1jCIBhUrJ2T10y2XXcoR/MRfqzwBQ0AgACRf2A=
Date: Fri, 15 Apr 2022 07:11:24 +0000
Message-ID: <SJ0PR02MB77587237CD0A4E13DED18F4ED7EE9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
 <ce6d3b44-bdad-3388-4fea-39f2d413b091@lucaceresoli.net>
In-Reply-To: <ce6d3b44-bdad-3388-4fea-39f2d413b091@lucaceresoli.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7669985a-a46d-4c5b-e5c6-08da1eaf26de
x-ms-traffictypediagnostic: SJ0PR02MB7438:EE_
x-microsoft-antispam-prvs: <SJ0PR02MB7438291D36666A185B25214CD7EE9@SJ0PR02MB7438.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bQ2BaNf7hzC4VS1EbyE03/DojDqPwrvc0sOqmdgd3A7VYrmAKVC62BYXCmOFHCYHSAKN1+wgSjwtKyegVV+hRZ1nQ0mRVBRUon1TI/EtYfV96VaVbzeeMyRHLldW2Qo4l2iMptdnX1idI91ISFWo7lkUkIf0XGw+I/HUP4A8TkkjZX6rSeAJMvD7i59jDy+xBH4DraL1toq28Y3mAQD4MI1wiE1ji9l0xCu9reSoa9E9DhByTjvx2dEO6Tsl8td4i069IgCaFuq+/0PeUGXJUT8saskDIB2T43VGdTmPlwDP3lsNgR7eMTQ6LxXOtbpuKLyk+YR0BgftjaXqNyRLSxgLuX9e1rjWwSacy9TwrzIMBdlQ+TXHvJZaJ7BakhmNRyN7RM33F+MaZptKVPa/UxTlp4XhBSjqt3QU69dG1Ex2pZpslb1zGrNs2afSxNEfVpMKadI1M7c2kxXLUeV276cmBqnUJEa3710ebOhfJ4YNqvxYsd3Z7NQPVie4cOuI1esNYwDVIm5kFYHVE0bxXiXlrnxsNV9oe1ABdIk0qsr6qQLUaM6Hd/goJ81MNfL+sfpPTe8GCeTCNMrwXpg2a3e0WgAi/GxzMPZBdMoouQkOOTFigRAfLNvDES2ijx40Ejv66WtWdLXWLIUWdHFNYPkZ0tzR0SBChnf99JXH6Ok/yyT41RmZTkXDa23PHnc5X/Gn9mertjJNIUBnXWfnTXZoxf6pdJ5GIm3F1crFnKw0bVC+eRwMo1ef/0Vz8wMs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(64756008)(71200400001)(66556008)(76116006)(66446008)(66476007)(66946007)(54906003)(122000001)(110136005)(5660300002)(316002)(7696005)(2906002)(6506007)(4744005)(33656002)(8936002)(52536014)(186003)(9686003)(38070700005)(4326008)(38100700002)(86362001)(508600001)(55016003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjNOaFVlSnpleTFZSVZHRjRiUDdFL0RQRDFoQm1sQlVlMjZ5K1U2bGRzempM?=
 =?utf-8?B?Q3B1WUJwZTJaSkVsR1hvWUJSQXRsZ0FkbmU1R25lb1FaT3JnWmNaNks0VEZr?=
 =?utf-8?B?S0Nmc0FYOXpmdXJDK0Y5b3VmZno2RnlKY0VlWmhNNjlNVHRDYkdOWVpva1Y4?=
 =?utf-8?B?RVh1TTFETE9xUVpnMTg2bkd5ZHQyb3FxdnZUUkJGZnpzNDNVblVkcnhYekZp?=
 =?utf-8?B?MTlEb09oRitidUhFd3BSb3BpYTljRlp2cmxXVGZVOUVwRkNJcEV3R1VGWnB2?=
 =?utf-8?B?RS9sckdqRlMrVGJ3SithTCtWdkxqYXhnS2hKNmpkOEl4am9iRXF3bE9EcUgz?=
 =?utf-8?B?SDNWU2FIZTkzMUw0Ni83RStBMmM0RjlMS0JNbjZSdjhHYTdSNDU4aGFwRlFT?=
 =?utf-8?B?djFWTERSRFZwWjl2bThzT2M1VFJrUXdxRnNSSHpKMUpvZ2wvOFhHTmhLSmg3?=
 =?utf-8?B?bnBCRzErZzlZSytnS2V2REpmQlkzZlhDczdnRk5nMVFsNVMxQlI3cUU2bGtr?=
 =?utf-8?B?UkxLZUZMS0NHRWNCaU5qeEh3bHFCNmsxWDMxZDNVUEYrY3Q2TDBPd0FTUTlG?=
 =?utf-8?B?RU50MEl6aE9YU3pUS2hxdHR4czlRVTVEMHRNYXNXbnIxekxWUDFuSHV1OWRJ?=
 =?utf-8?B?cld3QzhWRUpudG1NT0JPL2d1aVcraVo4b281TStFWHBsTGp1eWk5SjFPNUlX?=
 =?utf-8?B?cUZQTWpUNkJkbkp0eFdMMk1BK1dpNVphVmkzSU84eFBndEZoZUh4SkVKUGJt?=
 =?utf-8?B?OWZIdXJQT2ZNUmt6V3BIVkFVTFZKQy9rZ0VURlhuNDdTT1ZVV2xvbXlEYnQ4?=
 =?utf-8?B?bWdxWDIzbkRhN1NuZkF4Q1hvUGUvSDFPcStNVVNxcFZHck5aYjh6d3plTlFC?=
 =?utf-8?B?TEcwSmpSYUJiM0NKSXJ5d0VyYmVHaU9oRWhtbndaSnZacXNQWGg0UW5yNUdO?=
 =?utf-8?B?ZkVEWnNXSlEzejErZW5lTjFrc2N0Rlp3RXlWQS9icWJnSmJUdnpZcEtURFJF?=
 =?utf-8?B?SHU5QkY5U2gveFhDc1ljb1F3ZWwyOU41UXpVS3FiOVRmQTVOR1NZL3M3bVF2?=
 =?utf-8?B?VzBMSVh4eGpMZXRRQVVQblptVWs3U1J0UDUrVHlkUy9waDFxSHVDaUxBQ1Rs?=
 =?utf-8?B?bnpSQ0NkY2sxU21YNndNRU03YmhUZVVhYytVcjhVT2dPQlN3MWtlSnM3Si92?=
 =?utf-8?B?WXRMYVhNeDFnWVJXRlZIbkFzTmhpdFQrNEZ1Q3BoTjlxOGQzb2tVWnVpaSty?=
 =?utf-8?B?SVg5UWxlWWhSajFYNGNySWwweXExbDRVT2xmZEFXTnJieWhaZHB0Wkhmb3dl?=
 =?utf-8?B?WDMrdXloYXVYWXlYQTJtSk1ERHFhOFB4U1pyc0lDaWhTeFNFTkZYL0R1UXZO?=
 =?utf-8?B?Z0pkbGZoWHJpTlUzbUMzOE50ejdqZVd4VkZtSnUxc2ZXV3BhQzZ0ME90eGtO?=
 =?utf-8?B?WFRDSXdjQnd0bXFZaDM1VzB1TXBrQjVmMVE4OTZHckZ2WVR5ZkVJZUF2R1BK?=
 =?utf-8?B?bS9vekxoMUVaNnc3TURXOW5XT0I3V1RUc3IrNG9WWEkvNWcyYitUMGNnbC8w?=
 =?utf-8?B?RU9ZK2JDbC9LQzh5KzBEYS81TVR2d0JPUmZnbk05bVJuV2VML2NXbDZ3a0hV?=
 =?utf-8?B?Qlo5R1M0cGpxOEpaeTdRRFJRdDVTWWZGNk94U3JnOTdWMllXOWZDcDl2TjFj?=
 =?utf-8?B?YzNtWGU5UmNGY2RhT0ZCQVlGblNuZ0hnbW8rSzlqV0xYQ2cvWUxLR01kOVNC?=
 =?utf-8?B?ZlNIRnpMUEhBZkZxTDA0NUh2SjMvSmVIRmR1NVhwWklMcksrZHRiZXcybjBx?=
 =?utf-8?B?c3R5eUtWYUY1SU5rSzBPa0dNUU5aNTRqMzdTNUdxa1hJWlhMVXVBRThvWVhs?=
 =?utf-8?B?OG5NZlN3Tkd1UStiaG0yZ214aHRza2s1dlU0bWJUQ0J1UkhqMG1JY25JMHFO?=
 =?utf-8?B?SDF1elh2N1psQnVkSVNTK2JpeTc5bGxZQnBha0dOODRXc3hzZGRlR0p6SXZ6?=
 =?utf-8?B?RzA1SWRkSHJWODZ0UlVFVjhyejJuU085WjNsN21XcC9iWWw0NEpwc0lwVFUx?=
 =?utf-8?B?SXFVVGdPRjNrSmFBYXFsVzJ4RlVWbU0xZG5rYXc1NERvWjR1RzZWZk40RU4x?=
 =?utf-8?B?cWNOVG1RczdKanJKeEoxL3lvTEhiVUhvdHJkOHFpVmJKNEloN0VieStEL1k2?=
 =?utf-8?B?MW4xRkpJNHlQNGZrODRVTi95VXRYSWJuTXBWM0ZVdUR0NCs2QXBIV1d5aEc4?=
 =?utf-8?B?VHF2MUlMMUs2Nks2ekJ5YXI0c0RiZ3ljMmNyd21RTHNTb0xsU0QvY1VNRlpN?=
 =?utf-8?B?dlg1UXNmSzRmbDMzM0phQVZZcGVRd0dNczZOeUtBdVB0VTVXaWNpWTAyTFBx?=
 =?utf-8?Q?oWjLD6VmjkhFHOMyQ8FBwbwv/CAcdWKovBdAJIXkLa0gb?=
x-ms-exchange-antispam-messagedata-1: Rtpm9bFCOji7sA==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7669985a-a46d-4c5b-e5c6-08da1eaf26de
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 07:11:24.5661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Afo8/dEjRXi7gQ9VsKDi8LrkpbPvly6LC2lZQ1ias+EndmV/Sda3tCKNHb4QtZ6WiP9kGpOZUspeI3BwynCFIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7438
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc706_defconfig: bump
 to Xilinx 2021.2
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> -FIRST_DT=$(sed -n \
> -           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
> -           ${BR2_CONFIG})
> +FIRST_DT=$(sed -nr \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               ${BR2_CONFIG})

> Why do you need this change? I think the old, simpler sed expression should be still working. BR2_LINUX_KERNEL_INTREE_DTS_NAME is not exev changed by this patch.

You are correct that this change is not required.  I simply made this change for making the zynq post-image.sh consistent with the zynqmp post-image.sh.
I am happy to remove this change from the patch, since the two versions are still not identical anyway (zynqmp has an extra xilinx directory in the DTS path).

> Otherwise looks fine.

Thank you.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
