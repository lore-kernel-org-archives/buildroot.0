Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C9CC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 07:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87BB66103E;
	Fri, 15 Apr 2022 07:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ebu9bCpsV91n; Fri, 15 Apr 2022 07:01:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81D6A60AAD;
	Fri, 15 Apr 2022 07:01:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 357781BF855
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 07:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22CF560AAD
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 07:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BmaZ3Y1xeiRL for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 07:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E008D60A69
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 07:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/euGs2nqPpXeu37xynJmizHC12+jIf/bzFSRVCLs3tJgwmH14wRz1oVsT4SqSdhSaGQwk3+tHAFjglYUtK8YI7ItZGk9Sxq1V1EAfiJQrQ65jwode8dPqxD4CYCGpFcxpWNinIKRTQPmge1kRRnhU9KbuK9xuhaTmEwCeeHQOSjOCVebvEzQ9Zc9iMEJ/VYgyVs+ElnZ7s0FoXtXiKSWei+HG5i+5VOr2V4bFNd5Kc+oaWg+1+maD44KzxOCEEk63FqBb/ZxxYx1l0MUi/k85ETfclvd9rOTjBfnTtA6H5i9bfEqGLICq3CxyI8+qPyyIzfq9YdTbEK/RKB0dFBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpFBRAJN3lxwKN+TrUPeneDID0k/RFsbtR93/H7HgOA=;
 b=CYyD6nY+IEBYJ/RBQPl87yhWAdv6zBDWdRyXvvTFOq6A26+y2DERh6BnzJ63zgSfahT3gFscqJi820cDYz2rfKzT9mo7qI1fCjdl/sqCKNAmasomLWVG3SG8o3z+uvDSwiztgIublnGhGxMde5GmPEv9HzxY+rJr+wI26FkgOSRDADDsX3U35ws47jBmQGgOmoH/4bNmU9LFi9UU+QyZVn6TEU/BoY7vQO2ywOPT41yEwsuKWWWTQaE5I0C/i/jdAfuY0McoyMUXtv1cY7pMO2O9Xlrlj/Kxf2KGC0Op7nC+SIDBH5bs8QLMYrZBSoLuWBIkQeD3VUDP/9A2GZw8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpFBRAJN3lxwKN+TrUPeneDID0k/RFsbtR93/H7HgOA=;
 b=rMQPpUD1PJyV5hpJYxmxiS6oMw5xK+XDgwVxF3THKqN+pv9AgTQNm6O78AQ4mxlhHTfL1kPLt88aTeeKCyj6xDAkDybB8MgdZQetG0BH78nklt2EL7U7pmQPd6krCWO7abGb4K8QrRtDcYJ0iVJsU2j/1s8ptpSyOPmzTdOwHkA=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM8PR02MB7960.namprd02.prod.outlook.com (2603:10b6:8:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 07:01:11 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::61ac:c1e9:f4ec:156c%4]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 07:01:10 +0000
From: Neal Frager <nealf@xilinx.com>
To: Arnout Vandecappelle <arnout@mind.be>, Neal Frager <neal.frager@amd.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 2/4] configs/zynq_zed_defconfig: bump to
 Xilinx 2021.2
Thread-Index: AQHYS1jFvUnRxPiCRE2A9Pxr5IVQoqzv3bCAgAC2dWA=
Date: Fri, 15 Apr 2022 07:01:10 +0000
Message-ID: <SJ0PR02MB77583C8A9D6DFBF19D9621ECD7EE9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220408145531.1641356-1-neal.frager@amd.com>
 <20220408145531.1641356-2-neal.frager@amd.com>
 <0013bb7d-ca34-dd99-7119-8dad8c74a819@mind.be>
In-Reply-To: <0013bb7d-ca34-dd99-7119-8dad8c74a819@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7572412-0c5d-432a-646a-08da1eadb8be
x-ms-traffictypediagnostic: DM8PR02MB7960:EE_
x-microsoft-antispam-prvs: <DM8PR02MB79601D08039AF7CDC699F9F7D7EE9@DM8PR02MB7960.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4iXmB21yaNNYYRmqr1OCCkMKe3pmifxAaJqndQObEVNy9Aq+ykf7TjZhrMVWVjB4e4RHzD20yrCIdjWTxOUdnrCvxF01S3Qx1JNlirrmHOtDlW48Md0eWUl1vfl/cUMNfScNgFqV/MQFa4dpUSO1xXaQzbvUV6mP/Ko96OPLTK3B+1kH8jiWpwr4Tn4aZ04IL14ps+X46x1jmg/3B99/LeDalRwamJ4g/F3iCl9CguIfYPnxBT6ReZme3/5UGPynXjCdipsojV4JDu0QxRs5FCoWp2tdJYk/UVMgvVAX/8yZw2YSjozmeNM5FCZm3ykpNpRMY6NpLCDo2KvdiENDQoca5j1b4BE5S+9YS8Qsc5/NDsGJHARtoUZtc4wFefsEPEEdB2+deba5iewhl36DkkJLCKQk4Ae9gTm24cPH5H0jpfQ4cq4fTKszDV2TvneUTFjQ+z2Qup043e7/VD5izxul//T5m4Bnb/MVq5nYI3MZVa1ba4F0RaPpNOPyaD9/m2cAA0ltJvlTZGyi+Q7M2PBqAZoeVcOWrqAcSksgdipTSUh+5YN0eYexZAPY5DlX7zZQzx69fYScDRzBUHImoVtlYHbAVpiWsAn/XUF3KSwOQx7n/6TH3Aq3l/LMszKVSYJhmDFJrG2Xn8g+5taQCqwyjiZhrxAQCOHlxR7Ecdw5ujL8eNHfspQ/5XXOQn4AAMEb7F2gzlO7/ZwWfjqalcjsuH4JRarFnPYNJlliGhiTs9N95PXLHuY36XjIVAtyjip/E557vKtz4URLeT/chD9tPFsksUb8T5zCDGpi9wIboR4+bwn3VxSMLH7qPLPR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(55016003)(54906003)(38070700005)(8936002)(110136005)(316002)(122000001)(8676002)(4326008)(66946007)(64756008)(66476007)(66446008)(66556008)(76116006)(2906002)(186003)(7696005)(5660300002)(508600001)(86362001)(52536014)(6506007)(33656002)(71200400001)(9686003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlJ4K2pZTzBaQ2x1Wk54OVE0UEJ6NU9RM2FHQ1FLbUNIdEF6QnBCaklXbTlL?=
 =?utf-8?B?TmZOWWhJMmNDQnpENkYvN0EwbjV0UzJJUnBlV1l3UG5EanRiTXR3L2hESlBM?=
 =?utf-8?B?dUlYWXdObW5XTXI5NTNPeE51ay9XQWQ3Wm9TL1F4bHZyTjN3KzBnZDF1VW55?=
 =?utf-8?B?SEx4MnVLbzE5V0xwNDlkMnJDS1VWQlYvZEFNa1EwQVliWDREV3hlUVQxOFR5?=
 =?utf-8?B?MHRSMzhLQkdYclhMTkpIR0sveDd5Y1N4aXNoSjNxUHd1WXk2QVZCc052cEFs?=
 =?utf-8?B?cVlsR2twWTIycTBSVlpDQlQvVjFteGVndWx5c01rYm5iNmYyQ1BmY2xoM2lI?=
 =?utf-8?B?cVQxT0FNY0ZQRzBHVEE0T0FyblJUdGJwbmRDOEpxUGFFeEl1U0ZhcGJhdlhy?=
 =?utf-8?B?NGhWQ1lqM1IxdjZFUFp1Z0RyV1UvcVkvUW5TZmw4Qmc1Tnc5OVFPUXNZU1l1?=
 =?utf-8?B?QzlLazN4VVVWYllUWnNGaS9ES1IvU3QydGxCdjVpSEFrU05ycjNYcXVGYkl5?=
 =?utf-8?B?V1EzbTRLMExsalNCSlBEU3BsMXh4bWd0VkRuejJ4NnNJT0FKM214bzlPR2xw?=
 =?utf-8?B?b0t2YmVzZU90NURmSjF0Qm05djNVcFdIKzB2WXhLTHIxQzVXSi9CQW9mcmk0?=
 =?utf-8?B?QTVCYk1iYmswUys4N2M1ZEhkd3BTandJN1hkSDV0U09zUGxVeFYvNUlGaWxY?=
 =?utf-8?B?bG8rc2NZNkl1OVJaUC80WXNERXphRS9OSjlLVXRMRHN3UkQ0MzV6OHExVTdx?=
 =?utf-8?B?ZW5oelliVFdqZDA1V2JhRW9XV3h3QUJtRHZ6ZnkrWGFOU1UvMFVVVDkrcldj?=
 =?utf-8?B?RUhRQ1ZDZkpPRG5kZk5wRTVJK2RtWVhtVlIwVjhnUEh2SHd3UHM5SjMzcGV0?=
 =?utf-8?B?blVXK0U1R055eTRLSldLckRidzQvU1lpTlRDa2Y3Nmp1Q25VR3ZneXZGd0ln?=
 =?utf-8?B?djU4bklpNHhPYXV4OUtwNmNqcHJmcWczV082VWlHVGF0OWRrL0lFaU1ZQmEr?=
 =?utf-8?B?SmZEbEt1eitiTUs0aXVpUjIvaTVJSGhGb1JWMlh6MEV5WkgwT0U3WXN4QU9H?=
 =?utf-8?B?NWVFZnlsUGRobk5TV054bUcwK1BhVTBaSWRRcFBXTVFjRkpwS1Rpd3gyQmFG?=
 =?utf-8?B?ak5XYjdFa0ZHMVFJU05MUGY0RE5VUnhLL0ZoSzhUOVFJV2E5QlNtUHdZd0Zx?=
 =?utf-8?B?SFFnRWhTWVF4RHUyYWpEOUloQXNhYitHa0twUkFTQ2Z1b3FXalZ5NmJ0RGc5?=
 =?utf-8?B?TG1DVG0rR05oOGVUS1JEZGtDT2JnNEZEWWwvdkNRaE9UL1JFQXlOb0sxamxp?=
 =?utf-8?B?WWxscDNjZU5aV0lpUW5zQkNTUS9ZSXNIYkZlMFYyZTBvZXh0anY4ZFlVWEVv?=
 =?utf-8?B?M2tJNmkrcHJMUU1sRUpGeURoYjR2VW1jU3p1WUllQ1hVZ3NEODFLOTVIbGE1?=
 =?utf-8?B?SGlOQTErellkbCtFUTFhNkY1NW9kOWkvaUZjR0Z3eGszYmN3ZW9kb0VsbUFS?=
 =?utf-8?B?U0VNcVlwWDUwdmNBTFZISlIrRXN0dWpzMlN6cnNhQ1E1b3lCcmd2bkdUclZ6?=
 =?utf-8?B?R1VqN0NsZ0lNdkxnVTU1cTdTSW5LQkhubFZPUmJCVjJXR1VKTFNpcUh3UVVW?=
 =?utf-8?B?VWFUTmZjTTF2SnpBZFNObU9CaXJJUjh2UCtydUpzSEpUNFlrM09aMkpRNmtk?=
 =?utf-8?B?OGtwWTdtWWNycTE1cFZ3RlY4MndLVFp1OTNQang4RVVEakwzclB1YUFEeXgw?=
 =?utf-8?B?U0pvRE16YmlZd2E3YkQ3U3lySkNoY0N4V0x5aG1ROS9RVDAxaWpycG05cXJJ?=
 =?utf-8?B?ZmI2OUM3bG0vUCtCYm5MYUMyeWhkN041NHk2TEY3NlNzT1NjdVExak84d291?=
 =?utf-8?B?WVd3RDZGRU0rYytEZFRURmlPSk1rMTJsSXVpUGVDRDhZeGVnNUZDbmcyWFJk?=
 =?utf-8?B?OVorc1phb1FzeVdDZ2JnQll6Qy9uUE45aEZPUlZ2SHBSV1FwUDd6eDRVSk45?=
 =?utf-8?B?elZSVGluWnF3cFhKcllreFZ1Wmc5UjJ0V1cveVJhd09HczV1Yi9tV01pQjlR?=
 =?utf-8?B?ejNGYktneldmeXlrWlh3THo5YTRZY0dpTTFqSkV4akZXR1ZkM3NyemNwR0pi?=
 =?utf-8?B?Z1lyL01RblNFTHpzMXMwaXJlamNYK0g3MG9kOWdtdkxxbHRwSFhOcHZ0b0pR?=
 =?utf-8?B?U3pFOXF3VXFCNmhWZUFiT2hSRUttcGpLTE5HV0prZTZIUUdNSG12cWJvcTk1?=
 =?utf-8?B?eE9pSTNwOHpheEFBU2FKSU9PQXNoRWlVSXFpdjNtOHorYzJqQktHeER4a2tq?=
 =?utf-8?B?NmV0WVpZUEZFRHdtcWg1TklIaTlzRzRGYVpTcGZISFdpT1d2VDlaTWthWmQ0?=
 =?utf-8?Q?CKCL1tBfH8lIf6QE/Hph6VvYU8vY4DmDaZA4XXpA8+fv+?=
x-ms-exchange-antispam-messagedata-1: XlLzbC1nAYPQgg==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7572412-0c5d-432a-646a-08da1eadb8be
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 07:01:10.2902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLbVHLsBw0SLP89wovPgnWNyAn0U3lb49uQnpgjzT/3Kyz6ucoJJIeK5T5k8hlO3sd2yAcy+08Y9JglsZftFbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7960
Subject: Re: [Buildroot] [PATCH v1 2/4] configs/zynq_zed_defconfig: bump to
 Xilinx 2021.2
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
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "ju.o@free.fr" <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"

>   We generally prefer to use the upstream kernel rather than a vendor kernel - if it works of course. Is the vendor kernel dramatically better than upstream?

I understand.  Unfortunately, not all of the zynq and zynqmp peripheral drivers are fully upstream to mainline.
This often causes support issues on our side.  Specifically for peripherals like usb and qspi.
Developers are certainly free to choose whichever u-boot or Linux kernel version they want.
However, I see these defconfigs as promotional examples of how to use Xilinx zynq SoCs on our evaluation boards.
Since we only perform production and regression testing on our software releases, 
my preference would be to keep the Xilinx defconfigs on the Xilinx github for now.

> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"

>  There's also a xilinx-v2021.2 tag, which sounds more like what we'd want to use.

The xilinx-v2021.2 tag is functionally identical to the xlnx_rebase_v5.10_2021.2 tag.
I tend to like the xlnx_rebase_v5.10_2021.2 tag name because it includes the Linux kernel version in the tag name.
Same comment for the xlnx_rebase_v2021.01_2021.2 u-boot tag name.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
