Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F59BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:35:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559EE60F46
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 11:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 559EE60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1514E40012;
	Mon, 25 Oct 2021 11:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRqLIRA3HKCG; Mon, 25 Oct 2021 11:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C50C401E7;
	Mon, 25 Oct 2021 11:35:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0151BF37A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CF5680D07
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 11:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="WmfE3ram";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="OwD9rUcb"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULmIKC_gpiEA for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 11:35:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8161580C38
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 11:35:42 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4CFA740D27;
 Mon, 25 Oct 2021 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1635161741; bh=RoPfvlv3nGJ0agVhmQ+NPx7fbWXhoylougK3RRARTDQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=WmfE3ramcpw4Pv8gEAsysx1FnjgHXU/seGJmoiD2e53v+FdXecGLHaJZNJXLadTpk
 fwB0CLUpgoJN3eppyQkD0dmi3WA5AyYXcXqaUiz+Tui8n+ResqkH9M+Iu4BSmQSa9l
 tApxvvS1NJ+8LSrDGwrotVltJRF+wP1BetXbuyet4GfDWoVrNBYGB0J2JdbFbhj9w2
 9KNP0mrQQVLq6JQ2dL/fOCQ1QrdbO2Kw1lTAdR9PiZbgGJOTdP4G3QiRjil4wKBUwX
 jGRHnymfNuehUaBumjt13EZgGfQ9LdJC9/4Vt8d8JZKLs/KtBQZ6EyYYEOM9Cy7gxC
 0Z+oQNInl32cw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E87C8A006E;
 Mon, 25 Oct 2021 11:35:40 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3E20180316;
 Mon, 25 Oct 2021 11:35:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="OwD9rUcb";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9UdUvI3L4OuZd2Ye7j7oz4ll+jg4j4SZX+lrkjRBV/hO+FfDIgVl37tWI9NDO+I+KR6YBt3YJ0hktf40GhimQ+xdWqS2chNrDJTgZsq9NPrcKo26VbVttt/ksSkb1A5Ds0DtS/wYMKWB58eujXuvONE/7k+GPag2eSMylCwKOuUiEXz4jACroJrEXi54WQE/4GIqFdDai60/1SZZku6b5HRqERY4xVUozfHglfp9Q858MttK+Xv359EpT4KkXExBRIldBsQX0M7Lv738D1RsNPpZUp2nWFbYBoahT/2w4ZYguWXYuhB0PnN8pzgrMr/APswMgtMziSaGKzrIGZ1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoPfvlv3nGJ0agVhmQ+NPx7fbWXhoylougK3RRARTDQ=;
 b=Y3Coexid9pVQeu25ZZovgwczjtMCpFFxAW3K3qCElGdrpOjHSpqMdWIysD445/yvwEDek0UDF67PzmG5wgtgxBRe+mURsZV4VJnEyuOeYzzJLLJ0YbsPz9vdlxDjdrWr0gCCuOIm75lO4utWwFthtaLVCLwE4X0M298SlWciqQ7QI0i3GCJifCtJbdHPoZl67Y/XGPJB7eZfnsk3Isq50DDTH4lSUdXXglwO/p9YOadpW1/kDRBq5ZidAMDOEU+zpyEBmuQc0/Hb00fLsCH41tO3nm0R1buqZwBi9OkbGQs90+G97JbVf4F0vY8SYzO4p4+2k+dzN6LFGVo2W0jJow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoPfvlv3nGJ0agVhmQ+NPx7fbWXhoylougK3RRARTDQ=;
 b=OwD9rUcbNuO0dCL1xdRlb0jp8EOK431DsypKxXyoNI6MtlhLJep3lJfa9pvvD3cn6qVtcvBa+R9xfD2gvH2rf+mcNvQUBqOFQT7qvlRQ5L+fMAql6vBLqTtWziVv6ztNJdlWKJovpl+/rvtATLmFUfpoQIKNb0KtgM9y8ksqrQU=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5436.namprd12.prod.outlook.com (2603:10b6:510:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 11:35:39 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::8d92:e907:251f:8346%9]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 11:35:39 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH] configs/snps_*: Update packages versions for
 Synopsys configs
Thread-Index: AQHXxBxLk7uPhPp9g0WWlFzrwatziqvZIaaAgAp+mTs=
Date: Mon, 25 Oct 2021 11:35:38 +0000
Message-ID: <PH0PR12MB54010249A318317153CD65DAA1839@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20211018123245.48740-1-kremneva@synopsys.com>
 <20211018211831.4cf682d5@windsurf>
In-Reply-To: <20211018211831.4cf682d5@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 2e36953a-3c23-2739-69c0-227a050d1900
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d79ffa0f-2d13-4e32-8561-08d997ab91bf
x-ms-traffictypediagnostic: PH0PR12MB5436:
x-microsoft-antispam-prvs: <PH0PR12MB5436672ADDD4B5A20C09A4D7A1839@PH0PR12MB5436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TzgcqjbgFe4mOtoGcKXytBFzFUGXvVEj6ycN4Nz0zvsBtESm0HXP5bnTOE0/xdjHE5Y+xIeTdPRXhdu8I2IG9CuXe2o1lyNgpGK4bX8+hfJl40kcNkWYP8kW3hQVOQ6Lb5AQgTtSlu2KipMy+1egzzG3EqjbBRZ1hxVPDBJYT60uempnXLiYddorgVS2oE8KrmkMpeBOCaprqW9n2U4ELOAgaZAGxQG+xwJTddUaKnJBb9yJjtNTYGTZjaHVJCIqdzBjU5ST5Qw4konpq0lHA8xqkze68zngERyB13R/dHHRfKO4IOED1vkEJmNda7YrVPM3g19FOnJbtMkgNQZgYvEYkUIRz6Xtvwlcczyw027vwl0VIBxsuCaNbkXQV8KZeCwwt2fPUgXl428V7w8NULfvJj2xgMJ2D6tSkWOFRzcDnQxkNh6ulS68jx3I66RO4q1TjtMGeTfHQolorUca82au6PWMkOxpmaInZSnduwbfwy/UY+DT2nI3zKKMOmxEJo7fI1tTTpj/O+oo2HtclQKBdLcGIwFX2Eh9oz1U0b/ZSIHY2cTDrreuoGz/UZemrAjuMrVBD2S787loSsQhHjiyxuru+ddNlKkS89YrCQPn4YJK+WJtsTyMdkqbrTaHXevKA+CNyMCmtmLi+QnNDA/iSu//SNUCmOd53ATUUl471HBAdqrAfd048Ye/UqYKyn1WoNLyzdryvEmRIhlO6E8U/xL0LR7/TwpVy5r0XpMjWc5He4wZFdf/q/uudRsNRHUrgUppE0MKauF3iXdoEXtKOSIfPcQKSP+WC6lQe0Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(2906002)(316002)(6916009)(86362001)(122000001)(38070700005)(8676002)(8936002)(76116006)(91956017)(7696005)(966005)(6506007)(64756008)(508600001)(52536014)(66476007)(66556008)(66446008)(66946007)(71200400001)(54906003)(38100700002)(186003)(9686003)(107886003)(26005)(33656002)(55016002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?o2NgB+ogNaIgNW8VZSJnY8SqRQbFK/3MhyCYYeXnunLrNDS4DXEVElt1Xy?=
 =?iso-8859-1?Q?CKieIrZdMmNn5yJWh3a4jSQTRn9bi9T4Je6VUkxdX/aPR+Ryf872lwM/L3?=
 =?iso-8859-1?Q?0IaGkcps5zZFgiRGoad8ghKHWk2C3IceSTDu1F8YInWxsjPfZBM1cI523G?=
 =?iso-8859-1?Q?BJy0IK0OL0Pe+nwFwKcsjl0iGZemxmn1c3nUhEocPxYhI0p+GbH+Id5dS1?=
 =?iso-8859-1?Q?6+4a9BHFYlzZNnReDMy0KDWuhie/4LljvIT7007aVk1w6dEQOJtiL6Kmh/?=
 =?iso-8859-1?Q?lpZJ0SO4MUw2vv3zndJ4FaqvhSPdS905DlT71nHkI3613UBHSV0J8vRbgr?=
 =?iso-8859-1?Q?l+JRpn/LZUEb3K8ZFV2cqAAc5qbA1KUhuOVG0Tj8bvHu/ltEawv0Z5G7E7?=
 =?iso-8859-1?Q?7D2k2NZZWv/jAQeXBmVpiPbvxiCdsmNtX9JtcFhoH4WhRM75tBoDiojVSk?=
 =?iso-8859-1?Q?SA3ITiE6D+T42XOov1A1QoJ/Y5BhpwLE6SjkG241HCgmQMV10E9FjNIQ9U?=
 =?iso-8859-1?Q?dLoEpSKhjKpWypd7Fu1vRiQVPDZKhWxt8lSiM/X6Ih5hHeRmWfcWWpbPXB?=
 =?iso-8859-1?Q?uj6NfwiO8XvA3AO0PwIjGh1KWWoXvoFRx+LFKxsaQo8TsP00064+bT2+dw?=
 =?iso-8859-1?Q?EaP2aY+EcDgc32ye192R8EW4Ga5CQVTMEtsqG4ZF071xDbZs8EugD17OKe?=
 =?iso-8859-1?Q?CC3pCoSDYFTKfz72oHRj+yVsC8s96N6fggcf7mFjMz3dZJqoc5WxJUz7xu?=
 =?iso-8859-1?Q?OtsRubde/Fkf9q2GANEJ5GalWVsj/qcgz+0e8DxBIAOAXlvlrF3PhhHaP8?=
 =?iso-8859-1?Q?FXyGZfAo5QEgz4B9tM72l1w2OJWl0XBy3C0JxH7ZucBJq+o8RXaP1r2ZcY?=
 =?iso-8859-1?Q?Gdzs5/ypgw74nlVTMGZjw4ZrjsmWu77lj6O2ijAMUAMeaSzDBl6H7y+X9o?=
 =?iso-8859-1?Q?C1hDjhmBjcaxG22v3dVkrSp/yzgheJudO3fxk1VZacJXPwaXo/1LNNdtKg?=
 =?iso-8859-1?Q?mgG41a+MYzP+B1B4fRpcGNUjrB6vhvNslzblEftWUlIYTqrw83/9/PGOzm?=
 =?iso-8859-1?Q?jxFGrlINExnsDm8ETWjvW8WvLY1jmkC0OORVzWiyLdWPf7Apq19IwqYdr4?=
 =?iso-8859-1?Q?GNUrB1HGPzl0UtQjLsToGGVcwtKRYDWHT+Ed6SVSru44hcQ8mdhZme9znz?=
 =?iso-8859-1?Q?ygfNKk2vPXb2Swtjee8QPlcRMvO+gtVNH92987qJ80kI8OId533mCJOC+y?=
 =?iso-8859-1?Q?ztGo8BG9pEHh9Os3mAAsYKDb84CBWtZSTxCe+pSJv54Yn7hrz1WBWefz94?=
 =?iso-8859-1?Q?4mEprW5gaMdFm5Ssh7zCIxBH3iHFn9+o1btM62+DZlrhAiJXeU9/YVA7kF?=
 =?iso-8859-1?Q?mQHA4od8LPZ9MZ3J9vd84dAxNxfdX3dtdudEyNAjzyq0/uPsN+SXeg/6Z4?=
 =?iso-8859-1?Q?wKiK7dcjIXH/8LTle0EIId48F42hfteqj/FZiot/p7NBcauIISA4JVz+vz?=
 =?iso-8859-1?Q?jcpOX41rS4wMcvPnorhcHw+AJu1PC10GawLYqjw66W6Cqr5aL9NGylojXO?=
 =?iso-8859-1?Q?+PAwzx+KPFaDZ5MhykEHAMTZt2pHMSYA5gYd27xwJQ8OTGisOvEbVtT+55?=
 =?iso-8859-1?Q?HjBonLHzTOx0bACuhQ678EEYR+02fHQpRkloXkVkgY831wlFIhuxabeg?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79ffa0f-2d13-4e32-8561-08d997ab91bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 11:35:38.7964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dethk5vxClhOxaYcara+zKdYFG9cftNaklIGp061cGa3WAlMAKdr6Eu6YRsoP+9IaOWp0wPNas8fv24wAJVuJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5436
Subject: Re: [Buildroot] [PATCH] configs/snps_*: Update packages versions
 for Synopsys configs
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "buildroot@busybox.net" <buildroot@busybox.net>,
 Veronika Kremneva <Veronika.Kremneva@synopsys.com>,
 ARC Buildroot mailing list <arc-buildroot@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, all,

Let me elaborate a bit on that change...

> On Mon, 18 Oct 2021 15:32:45 +0300
> Veronika Kremneva via buildroot <buildroot@buildroot.org> wrote:
> 
> > * Bump Linux Kernel version to 5.10.69
> > * Bump Uboot version to 2021.04
> > * Specify GCC version as 11_X
> 
> Thanks for this patch. However, why are you forcing the version to gcc
> 11.x ? We normally want our defconfigs to use the default gcc version
> that Buildroot uses, unless there is a good version not to. What is
> this reason in your case ?

In fact it's not that we want to hardcode GCC v11 for ARC boards.
Instead the point was to override "default BR2_GCC_VERSION_ARC if BR2_arc" [1]
and finally switch to vanilla GCC (as well as Binutils & GDB) for ARC processors.

I guess we need to do it in another way, basically dropping that
line from "package/gcc/Config.in.host" and then stick to whatever is
the default GCC version. Though as of today for some reason GCC v10.x is
what used by default and frankly I'd like to use GCC v11.x as that's
where all but a very few fixes are in the upstream release for ARC.

So either we need to switch to "default BR2_GCC_VERSION_11_X if BR2_arc"
or bump the "default default" to BR2_GCC_VERSION_11_X for all.
What do you think?

Now you may also ask why don't we drop all the ARC forks nonsense from
the Buildroot? And that's a good question ;)

The point is we're now actively working on support for our next gen
processors (ARCv3 ISA) and so would like to re-use existing infrastructure
but re-purposed for ARCv3. But the good news is ARCompact/ARCv2 should be
now serviced by vanilla upstream releases (with needed fixes applied
via Buildroot) finally.

[1] https://git.buildroot.net/buildroot/tree/package/gcc/Config.in.host#n5

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
