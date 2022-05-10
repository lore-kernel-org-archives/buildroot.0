Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3BBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 08:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5E48176A;
	Tue, 10 May 2022 08:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GpEAnEkZvIQR; Tue, 10 May 2022 08:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A8B581252;
	Tue, 10 May 2022 08:26:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FEE31BF2BF
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 08:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE0B80C25
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 08:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFcIPIdWaCFk for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 08:26:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::614])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A26C580C0C
 for <buildroot@buildroot.org>; Tue, 10 May 2022 08:26:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaxHkCjisamDMgLhHRXrcbAbGbXmATL7kFNQmpuasbhgeS67eZXxPdynwKlYIvq480GQezoRh+y4JlSfWED9x/0DHiWVOvdfN5X6EjoijMbeiCVU4Sa0zsT12KTH60AzdqMnjCkl8GGnozdSyBpDvMCcrnytBmXADxlwzRnk3uqDflXTr6PVsuAC7G3rUc4zR3nPDQx0RXM9G7/1M9mn1ATEcD6EpcpMiSTzDNIjNbsUM1XkJLZljDUsUcP908IYFOa6yvQm0pu3DFztdpzOQ+wqABfMWjy4qiR2z1oqcEJfIU1GUvLTx5qLxHa3g45OdudjxiNn+dbrLFVCYYDYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJA11tNjLmmpWiJ+0lf/hyP76uKWWz6MH+IumjsXFWk=;
 b=C7+lQP6T+gcncnxajkiMuBB0jZY/Eo8J88ZZzyIpPESy5jtYvcHwfwii27X7JB+kHyoZ5ShBOynNmzPWlO9xwyuf4Sh0ttkR94+ETPbshZkJ4JtyyCoX4oVM4eC9yLDdKuZsLDgpL2ZakEJ9HCZA32B/EH5jF1mELtDMc6+pEevPNnPVyldMVrk2R2iAOfxreiWocvqIQF8+98mJjNwyaqzYbGgrOWlsjlpS7ROC4ExmGA9TG+VQoQrKLdrz5zeRZRmGPi/AlmpG1B6bzc9TV8z4ZgxjYOTPdr+iUdLinC6kR5ksKbkwGXfaSaE8ANuZo2UVQSQQNRDdomwdwKsBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJA11tNjLmmpWiJ+0lf/hyP76uKWWz6MH+IumjsXFWk=;
 b=hyT7f53b5XC5XZCpFTnDEmBEbOs+x0R37sTMX5ElkOLGFaba4JfVx7U1zZegfwamDvSyKg541EFgiSBhw2Lk5tC+1/GixyNB0hU/0zH9P20/niLo7VNT1oT7gGJgehipsmzpiofDuLiKKMv1vE/zPv7Gx9z6+m5C/b5eZfYBqgg=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DS0PR02MB8927.namprd02.prod.outlook.com (2603:10b6:8:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 08:26:51 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 08:26:51 +0000
From: Neal Frager <nealf@xilinx.com>
To: Wesley Revens <wesley@sonifex.co.uk>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADXACABF8KsIAAFGeAgAAdwwCAAAFaIIAAGo8AgAABPJCAAAWyAIAAKG0wgAANy4CAAAB54IAABngAgABDMbCAAJ2toIAAQvIAgAAAj0A=
Date: Tue, 10 May 2022 08:26:51 +0000
Message-ID: <SJ0PR02MB7758E0941247D253A6C78304D7C99@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
 <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
 <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <f4f5acff-c577-b7cd-c708-4415c2a08b4c@sonifex.co.uk>
 <SJ0PR02MB7758243996DD3EB0BE94D176D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <7a83f95f-b3c1-9aeb-447d-9c7361158485@sonifex.co.uk>
 <SJ0PR02MB77588AD2DD701582C5F45A92D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dfd44be7-0dbc-0a05-4e90-ed04501e4043@sonifex.co.uk>
 <SJ0PR02MB7758B99F6AD8F668FE7F318AD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <73ea7940-e778-cdf9-9364-66773632efbd@sonifex.co.uk>
 <SJ0PR02MB7758E384FFAF82E99CDEA261D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758287753500487E7078A4AD7C99@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <193b6338-e28b-b974-ab4d-25bcd173d67f@sonifex.co.uk>
In-Reply-To: <193b6338-e28b-b974-ab4d-25bcd173d67f@sonifex.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c123908-f3f2-43e9-6d41-08da325ed56b
x-ms-traffictypediagnostic: DS0PR02MB8927:EE_
x-microsoft-antispam-prvs: <DS0PR02MB8927DF20BEC00F10E2B6AED7D7C99@DS0PR02MB8927.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w8cMQWvj0BE1jw9DuR1BOl6U9YKF52q/ykcbtflf1ZpHGC3mg4Tn3iX9rPIlh5zeZorWqLbGxu9cyrcNZgQKEOO4RnBkiv0WTjcHo51tLCSRUFO9fiSyDtaMcvvjrHOEHGCVmehuiN0a2kjd3fZuW6EZs86GsyaHjrmrjDk+DRVMrDaoEctADbVPh+LDfq9KPwmV4HKOJujDfUI45tKRU7gXTylqtxiNzAaDote9RspQRcWoZUXhEEpoI+SaIy8fQMb06DErQPhh6jgFPueC6X700klTbmi0CwnSMki9L3eVbzVWFIcl8iST0t4O8cIwDHmXQl1iiMYLTmcJR43qwAoe3w1N4suhtv5FfGd9LUuXyVEX2XLA0+5PHNI1FbBwhUkyLMNfksoo+A6d5lg7LoR0memMkG1ui7Q6aB0/yeE6KjawMS5qZHJl6wsMDClCttbjQ74rTtPb55IU2/RSP0D8NH0D0nXYhpiOiwj/BjNYNI9buaxSsiJMdPSf6Gx/BmXTZdeuUfkqYx6zOJNhN3TLvtlubMlieMudX5TEGcoYWYmgNDgxqovDJxLwgWIHQV4SDJ+qLoERsJQTmD7z75hXgwWI23l5CDj/F6/zk7h3UxbU7bueBeEsgpkw9SRb56f9X2IJA8U9a6FnZ0KCXaWYmbVJ0YLY8FwJCKENbASU5xmCxAhJ3BGtPbk5LNma3spB8mzc+ufsgNnp7C2ZYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(52536014)(186003)(83380400001)(316002)(8676002)(64756008)(66446008)(4326008)(4744005)(2906002)(66476007)(8936002)(5660300002)(33656002)(66946007)(66556008)(38100700002)(86362001)(71200400001)(122000001)(38070700005)(26005)(9686003)(508600001)(53546011)(6506007)(7696005)(110136005)(54906003)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjJVbFAzeWN2VitobGxWRmIwMlo5TnJkemtBV3Y5T0FrOUxvOGtCNGhsSkdW?=
 =?utf-8?B?UVAvZWN0L1h6OXNROWQ4cmpPb1dFTGZZNmhpbythVGtmT0RLb0Fva213aXU0?=
 =?utf-8?B?MmNkWCttdTFxN29wcHBMeWg5eXVtdy9KdHh4MDF4QzZLczRwcXBsdzBlVHZ6?=
 =?utf-8?B?VDBESVZ3ZGJNLzAyeU5Tbkh3RkNDZHFGcnVudHhnTVVOdmxxU3FJdlIvYzFP?=
 =?utf-8?B?aUt2QTlpL0tLbnU5UnRDd0tWbE1NVktlckpVaHkrRVJFQVNIZEk5a1k2OEVp?=
 =?utf-8?B?elFkeDduSmkvam4wcHNaZ0xTaEpTdktmaVJsZnVyZzhMWjcrNGo1c1BRRWRn?=
 =?utf-8?B?YmtEelJnV2VtTDZNK1NNYSs4Q2hHUm13dU53cHA1WVJuNkRZOFRhS0NidUta?=
 =?utf-8?B?dHVGb2FiTlVQUEdoS2JtR2ZsZ1R3blp2WExNNXRjeExGUDJGbDNoTXVXekZa?=
 =?utf-8?B?TEE4VjlUK3lLZ25HZ1JKakJjdGlUZHh0blJYazdkWmhsMCtlaVlBbmp1ZUpS?=
 =?utf-8?B?RTl1UWN0aWlNMm5mczRYeDJsTnQ0cjVLWVQrYW5tZm1qNDhMZDB5T1NjQjNG?=
 =?utf-8?B?UEVxcFRpdWZQMHlVU0w3MUZqSjdRM0RrOXFITWQ5OWwrL241Z0pKeVYxdW9H?=
 =?utf-8?B?OFd5T3VoMk54WEJMNE85aENnZk9rckRJWG1EdDZSWDZ1K1ArbzZUaE5LalBX?=
 =?utf-8?B?SlEwS3ZoNUVmYkl2VHZ4SXVhRWExSU9DTGxTK3NYVWN3cXVpQU5Ud2ZtVjJn?=
 =?utf-8?B?VVNBZEtwUlBZUEpQaTNaSGxKc3RsbUM5Z08zVW1kVFlSVU1yd0NKZm9HNnd1?=
 =?utf-8?B?cGUxcExyRzZBTHNPUGRlTG1WVG0zNXBpVEFTbVhWS3NLQVZ2NXltUStjODZH?=
 =?utf-8?B?R0p4blQvcEh3bjF2YkQyWUVMSG5DRDVwRHVoRGZ1ckJaSnRZWisweG51bU9W?=
 =?utf-8?B?UWZ2V1h4bXh6NUtNaGxteTQ0V0tlZTBkUVV5a2N0ZXN5eXlPdlYwMm9iMDVT?=
 =?utf-8?B?c0tHYjJ0YlNXSU1UZFJ2Y2k0aGk4MzU4ejJ4VmpaellVVSs1QXJmODZGQXVq?=
 =?utf-8?B?ZTRmdTVmV01ndDcxZzNXVktJOXBMUjdLUGtrM25laFd5Q2t6Z1VUejZWT21H?=
 =?utf-8?B?aDM4Y1ZkUitxMGk1VUJMQnBudHdvOWJhUDNEUG1kdG0vVkdIVXRxRVNNVVdO?=
 =?utf-8?B?U1RlMWs3WXRyRzZGa0YvQmdhYjZGa3B2Ulg2a08xL1FwcTV5ZmtjMzJEeUZH?=
 =?utf-8?B?OW45c1lNYTRwd0kyTVN6K1RIaGpTbmhFdnh1eDFJYkQvS09VUWM0Nmhwa2dE?=
 =?utf-8?B?bElkWTBlMXVyd24xdU9rVG5ydVdJNWpkSHRsYndhZmVIRG1vOHhCTjJWY2Rs?=
 =?utf-8?B?eG4xMy96dDhLWkJTeGJYd3owZ052VXJiU0Z2NU12OXltWFZtOHhUMG9DWlhw?=
 =?utf-8?B?bVJqaFNMd1RJQnBHbVhWWWNmVmUyeG01VUVjaDlkd1J3LzQ4QXhYRGtnOHd2?=
 =?utf-8?B?K1p6OU43ZVdiNkxHM21OSVQyeXdIQ1RXMUdENGpwK1R4dXYrdVpxSUdKdVd3?=
 =?utf-8?B?NkU4RjdiY1BjWjNBd2UyWlRSTU9qWEN0dHQ0dE5LWGZQYXJWbDU3SlAzcUdM?=
 =?utf-8?B?eS9Wc1l5bHN5d2ZOaGZ3S0F6REI4aUZsZE1PbVFaejBtT2pwM1M4YUIzLzJm?=
 =?utf-8?B?VmR5RGlidEIwNGtWYkRIVGI5aUNvQklOT05XVmNSTHJKRDVVTXdYTG9Ob2hE?=
 =?utf-8?B?L25mMWpxRG9pdWttUXRlMlNFd0RpM0NUbEpJd2dDMDJSSVhuTnI0aTh5VlN5?=
 =?utf-8?B?S09QaEM1Q1BmU09YWTcrUVBibHhNOTBVYktMYWwyTGFXcGtxK1hDcVZJc1JJ?=
 =?utf-8?B?MHZhVzRzSXdUVXlDbWFTQUNnaXhDYWJNZXdDaTd5ZkFJRXJUcEZQZVo2N1V4?=
 =?utf-8?B?K0NwbHRvOHVFVjVMWXZZZzhSa2JTNGRpMk5aUU81WUNvT2EyaFdvSU02bVBj?=
 =?utf-8?B?Y21mR1V5WW1ZbGo1TURuL1pxdDljcmRIVWdwcXFKZ0xiVjRQZlFxM2ZyVVFv?=
 =?utf-8?B?Wm9Nc3gwM1pzTUdrZGxxd3Y2MysybHc1S2puQk1aK2FLVFZobkRUQ0pvdDhi?=
 =?utf-8?B?MTA2TEdoWTN6QlVEVU9adlpaSG53cWZUc2YwNTNRSXRQaTFZWDlaT2RZV1hX?=
 =?utf-8?B?RldxYTF6UHhFL2hhVXJVaWZZV1gvTVpoZE5QZmYwN0VqeER3WForNHRJTmM3?=
 =?utf-8?B?MVR3TEVOZTJzN09qNlJpYlpRK0FPVnJjdEtyNzFzUHFkK21HZENpMmhYLzYv?=
 =?utf-8?B?TEhhUS9Pbk12dzEwSGlOREpEeHIydUxjUldXWFVHWmorazVYU2hvZz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c123908-f3f2-43e9-6d41-08da325ed56b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 08:26:51.4623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1HJASPaoxS4GWQUyVXQ2XqnfVhvoYWmj4BonPI8lQIE49mrz3aa+xP8sW+MthrVr5ghkHaxPv6S45Hf/5Qy2EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB8927
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Wesley,

On 10/05/2022 05:29, Neal Frager wrote:
> Hi Wesley,
>
> Simplifying the steps, here is what you need to do to get this working.

> Success! - Following your instructions, my board is now booting into Linux from the SD card. My Linux image is not fully booting to a login prompt however but I have made some device tree changes so it is likely that I have broken something in there so will investigate that. I suspect a clean build will sort that.

> Thanks for your help with the u-boot side of things.

Great news!  Just so you know, I have a patch coming that will remove the manual fit-dtb.blob steps.

With my next patch to buildroot, the whole build process will be automated.

Stay tuned!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
