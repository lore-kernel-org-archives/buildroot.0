Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6147DC4167B
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 12:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B57060BFB;
	Mon, 19 Dec 2022 12:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B57060BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axEXbWwpoMsw; Mon, 19 Dec 2022 12:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F3DD60AED;
	Mon, 19 Dec 2022 12:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F3DD60AED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63FDC1BF267
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 148E440155
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 12:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 148E440155
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uc_yf4PSoXjQ for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 12:42:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DA0040116
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DA0040116
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 12:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxwR3n4L0w73pwEvkalh5Rz+26KQXhgZC3goAOnFwP/OT0xueRx2X4lTu5uHjg5VX+aZQ8l/RFGGc8RXPS4wxTIzxFwqiHYgnJjDZvNzjto7lr/iTRyA8kO0iNUfXfPqtEKzuCUzYAzrA68VoM9AtcC91nBaHZiIpNCg4reZ5VLsxLImxLS4ImdjzEo9TQcz47jTBZnx+kGYK/GzZ0aNOwXZadJ/kFb6BkG0GGzdpzcCoub76/w5v2LCkaUReRWGoaRRRWMf5Bhdd1vyo4ms6VNFDRlh8Bai/uP6wEzx3CjXK/4nFUC/fTySSsWkwwRclENCA9uaQMvDjIdosOsa2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXETVnS7rrEhITxSn+Pcn50pk1mY0bon7mRluA66hu8=;
 b=JmuqNdUyu67dKLMKk0X9WW6iPHjR17DqmcJlMIGjWdh6QthkxjUN7URf7NpmGFE7+IUZnuKewWQcUcZ3Q1Oc5xB6AS6HMArKREHD1Fb2XOBzWd7mGntq3RoenixC2prvlCudlEEdRXT2y5mWeMFxkH5D+SqZAQBqdVtHGuEz3yYNE5qfQmu8akxRL68uOtuzHMLwTq8wiC6pEHOveLmxH2/jiS4ONuae8uaOBW8egEsNqoYxog0vDzJGB5F59iTxDe1MYCOiew5VlFQTY5oOtwFkGhDtjV7vDuwe+q4Kx45MTvMuiyp7lbaJLy3qF78PMXs3RCdtXEbheNrJr1x4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by IA1PR12MB6458.namprd12.prod.outlook.com (2603:10b6:208:3aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 12:42:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%4]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 12:42:24 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v3 1/1] configs/zynqmp_kria_kr260_defconfig: new defconfig
Thread-Index: AQHZCunxreoATmu11EyHtGzdNPz2p651NzEAgAAAe2A=
Date: Mon, 19 Dec 2022 12:42:24 +0000
Message-ID: <CH2PR12MB500431446F132F51F9B98390F0E59@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20221208094620.38498-1-neal.frager@amd.com>
 <20221219133626.3e8ad15a@booty>
In-Reply-To: <20221219133626.3e8ad15a@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|IA1PR12MB6458:EE_
x-ms-office365-filtering-correlation-id: 3f4b4a02-9051-42b8-fca7-08dae1be7a76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JPdI1JuRAGbSgLcgIvs8/4L1NKQJBQwj7JUPsX23p3/mlIzTXmCW5/Rcx7BJdFVouxdYdDzjUzIY9CzrN667YqiQjEf4sd3uMriEqLsoyF8m/qbNqL+U9A9RTikmMKKBflvKZ86rIOuMeCnxov1rNiaNbQ2Ll62pxJU3dkoY6Qtgv3mvjYcOg1HlWxxKJkDr7VJg1jEHWjEOEDFwP8q3geNSMRq27T/jE97zZQ8EXVqDCRMv2+AipmOtDngGbCr2Khf/8QN1jMHBBPvs8KbMkga8P1IyZ2cLp7oYJjvvna09GpdCWJ9od8vLablyfYmIoe0xr7x1/RJN28DtrrPwU46L5pbRFcsVRltGr+IpREWBgOg9TYxQXg5zrnp6XwQX0Jr3xpMcegzp9PMnRrs5onZnKd3w7Xvv7tV2xT+bxsFC0iloSwLsUy36CZxgZCTWEl7hFEHQwToq4BQOBeFpqOScv8gb63g/zt3hvsNYxrYroPbZS6/Qw7FEF0Fywe7sC68L0HtlhU2iL19XBf3fMdGgAzJcGdVC4LzOTn9nacaxvPZ0wFdR5zhBN6VdgSaETfR6G17q7SAonBWxcR7AqDfC+iNxlNxeUmt+jWYK/vgT4Sl1YnmfkjFEdTdeTFWwk/QOXs64V7bjKxh82EUd7+0UCBHYispi4jB4DT29Ac1K0EP8/YaKKjaFWx9qn16r2QkaQR3WqUOO1ASj4WD6zLMXMsnbgMMqxfiN+dySXUFdv9XafCru1mPKVjX/C3nsJtAKhhlH3dA/CA3AgDRIPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199015)(966005)(478600001)(71200400001)(7696005)(6506007)(66946007)(66476007)(66556008)(66446008)(64756008)(76116006)(186003)(9686003)(86362001)(55016003)(316002)(54906003)(6916009)(38070700005)(38100700002)(8676002)(122000001)(4326008)(41300700001)(2906002)(83380400001)(8936002)(52536014)(33656002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?39v1mDo4ZSuPITP+SjbCoZE2bSYnVg7I27JwCgYpdAc6OMYYtOBy5FakuJtt?=
 =?us-ascii?Q?hvbQkksDNKi5+vY+9Bo91RaEgPAG6rLcqDQ1bntBY8kFZ74i5VrWxLDHDr0M?=
 =?us-ascii?Q?lUKmDnly+DP/cVO+QRLjkThfYv/ro54KUJApAHEhL+oth7ec3YdotcBkKDcu?=
 =?us-ascii?Q?TmneaD6r/sPajg5bNdx0OQzsvIzqZQVbdVJJe3F34ZpkMdna/CSIya2N1xdy?=
 =?us-ascii?Q?9DRDM96N+LSKt56fTpkjLowlUDAurml0m+u4Z4L917P4HBCdD2egHP7XPoWA?=
 =?us-ascii?Q?nW5UZqlUWd+pLTvDkQJaLvN8bUL10NEHhCckZB2RIHB6b25ffkRJZZ9xd+7Q?=
 =?us-ascii?Q?lmATKhJBe5/EFdScrNzDC65AA5ZDBJHeRdEvCbRLPzIRdvKVZ3d8LvBFQmsm?=
 =?us-ascii?Q?uUA8HD3EAVTPx76g14lJY+KJo6u4hc8DlPUE8hNA70cDOdkiC7wUKt7HYqoQ?=
 =?us-ascii?Q?H4ka9tdnzTomkBwIsYpjs0UGj3WDf3yfFLO/BdfsHNyMpAPyKHdqnVIP3YhF?=
 =?us-ascii?Q?Pnx8SaXzN4u9WtvWEb2H+4QURMovUqXwL9TfIBSkR0vNtdk+fQifp5SwH8q8?=
 =?us-ascii?Q?Sp+stOXMFzCcVDuhaYE4ddVwjFUy3zRkZVYYH7MITtj4ueWsXC8LAjemnbJe?=
 =?us-ascii?Q?nOYWRhtWHYJcqvJM5OgU1KsCq8hvLfeGxA57PIso/LFzGS+/bH4iqJniPevM?=
 =?us-ascii?Q?kWS6oEM7KKgZp+sF4olBLijD6tk5KzmYzVJufDN3FkvkG2MTaakZ8tJvOiwC?=
 =?us-ascii?Q?JjrfVwvnzIqqjrIrtKGOqKJNRPS6MJZgrRMb8vEFanSymmteTzE2Lr9E8kEB?=
 =?us-ascii?Q?uVTVj3VFScgJpiXbdD+AW11lev4lfnTKJxRry1o0+VhrG5Kaje8HqD60bWmy?=
 =?us-ascii?Q?+jnPYqohad+pDwpMVZ5ZJYh4cdx5s6dlMMiVEKj0xk66lD7BXKl7dF2GPKb6?=
 =?us-ascii?Q?awMwT0mbhH8TFNTSLRGsfcV9WjiMaN69pMY9HfvsYis9BnHzXiUt771yEovR?=
 =?us-ascii?Q?tf6Keo3c+RhActQ9szIrGaW6VRwIZ7G5yCmXn+NdDoar9FmA93QXOeIu1Ksu?=
 =?us-ascii?Q?D4ag2G7Qcdye0uVwyIXgsZecAw1YA+zverpFeP5Pk7sUm86L2uV8sfCa1pt6?=
 =?us-ascii?Q?67cgeQ/wtIKDCmIoOebydSmvM11wIjmjN5CLSvYgwc+2GFl3Jl9rVNhDv3yu?=
 =?us-ascii?Q?XQ6GAAuFFzzPXgP3AUDjGM7NRYG1CpeuF7BUH5i0npY3tUjIPMmCtRBaUzDb?=
 =?us-ascii?Q?RX/JlgwPuLp0T4rClOTGns9TB4kkZVlKXdwoIM7WMkyAajFsSU1CNwR5ShWn?=
 =?us-ascii?Q?6pr7s8ynCGskqYEPnRUfbyNdAXJMdhX/1zYGMJbUJChjfT4JTDAfBPJLe2t1?=
 =?us-ascii?Q?i3RwTQATk2AUzk5VBKAu3jvN1XOwjNdb1B4oDpY0d+acmvIMU8s4D2JUbub6?=
 =?us-ascii?Q?C+PtEyX5VDxVY9ZMEwLW52P86//7PhGZdtVze8h3o1bWEtGnbtsdMlrg7I4A?=
 =?us-ascii?Q?1DQ/76lN2R09hinCgq0zY1NA6QHayDgn2Mu5rklbJ+kgExIFQ0mmF84cb2gi?=
 =?us-ascii?Q?v7sd42wfBEP6IlWAHGGzwOYY7fQiymVPv+zYmEJMcvhrsglCnRSH2Hcf2px6?=
 =?us-ascii?Q?u9lsti+orPhfjXLnHiHKRv4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4b4a02-9051-42b8-fca7-08dae1be7a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 12:42:24.0376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xB97OKIKWXpUV9iN6dnudg6BOwvzKHCMmFtj8yayHa9TiQyJmopEkfEOfz7YL+7d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6458
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXETVnS7rrEhITxSn+Pcn50pk1mY0bon7mRluA66hu8=;
 b=WBG8MKby4bfDxtHhaH0x+6qxJhiJ9wQTzZXopiXaPLCMegHKDYie170xoyRShOPWmlhii5j+RUX99L2ILAdvU+FysTlh8oay+41NEV5sV6cI6XJkR3OdFXvgpabbDsYyCv59xaXsy1TeDAJhLuJla1UUShV4FI1KkEahYqRUxmI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WBG8MKby
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/zynqmp_kria_kr260_defconfig:
 new defconfig
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

> This patch adds support for Xilinx Kria KR260 starter kit.
> 
> KR260 features can be found here:
> https://www.xilinx.com/products/som/kria/kr260-robotics-starter-kit.ht
> ml
> 
> While the Kria SOM is based on a ZynqMP SoC, there are some key boot 
> config differences from the other ZynqMP evaluation boards.
> 
> 1. There are no boot switches on Kria SOMs. The boot mode is thus hard 
> configured for QSPI flash. A pre-programmed boot.bin comes with every 
> Starter Kit. U-Boot can then find the Linux kernel and file system on 
> the SD card.
> 
> Optional instructions for updating the boot.bin in the QSPI flash can 
> be found in the readme.txt file and the link below.
> 
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+
> K26+SOM
> 
> 2. Kria SOMs use UART1 for the console instead of UART0. For this 
> reason, Kria Starter Kits will use a separate extlinux.conf file from 
> other ZynqMP evaluation boards.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Please do not apply this patch enabling the kr260 yet.  While it works with what we currently have in buildroot master,
it would get broken if the following patch gets applied changing the work around solution for handling kria u-boot.itb
generation.

Once we have decided whether or not to apply this patch, I will update the kr260 patch set accordingly to use the new
solution or stick with the old solution.

https://patchwork.ozlabs.org/project/buildroot/patch/20221216100044.54270-1-neal.frager@amd.com/

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
