Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F05BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 17:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C2EB41573;
	Wed,  2 Feb 2022 17:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSei2uTGE0Iz; Wed,  2 Feb 2022 17:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 691ED41295;
	Wed,  2 Feb 2022 17:00:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 454E11BF4E7
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F7586060A
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 17:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="FKEi+R2S";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="Lg7/tYAl"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQEcpWVAK9Zb for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 17:00:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 994866059C
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 17:00:09 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C3E11C00F9;
 Wed,  2 Feb 2022 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643821208; bh=BXw2xfnye0FP3OpBaZRhmEJfUT1JFkXIhNmDzM099nQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=FKEi+R2SeimlNQdYi/UG/1GN/Kf7zzgs5QwK1aGcAmp1L/QLPIFPj7euHJLv2t3Da
 9bB2dNX34tHqKC7AL0Z1VbweJGF7hH/mbzU7+gwibK7VBd84az1J/ZL3kuNT1FxXY0
 91v/8zckWNYM/ZcLdY09XB4rQu6yMq1dcgnBTC9WviM1DzTFTB12HKNwgJju39fWii
 lo6sTBytrVQQSv2OKLr/3rBIglaoaZQO6qTWTa1CRwdHfYe/KZ21nKiNVG2ZL+ddtO
 Lmf01zqu2oTR2B1RTdcIYLp58NTr/f/3yHyElgbo4vBf150LIK5ZPVFTz4EaHa4ABu
 HJKmCgbWTUAgA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id A35A3A00A3;
 Wed,  2 Feb 2022 17:00:06 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2517D801EE;
 Wed,  2 Feb 2022 17:00:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Lg7/tYAl";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBTM9h8PV7JUjuaqu08vmlFOcUcnd0Sn5cnAA+MB2DuK2QP9YZNhreFsFBk56YegB20s6mDySo9zhptaHQ1ZSlfFqYXa5/NEHbWAosLOCSSRYhtGvkLFFsBjidbULW9OZEFZ/LFJXet/lgF7E9e8F+vOhEm2ZJoemMwF0zExY4kKmpVETzlnFqnOvhX+DIkRh1h/FT05sXbYsi4rGKzSBWlSvhstt8M7hfn4c8kvIPbShFoGUywbBrfn8GqybVIjyDtVA7LaVAQtqnJS5OPkvxhVsXF+9RaZL35CgGi8EKGWrhXqm7+ZjerCDItZT5/Qzp8tnY9YJCEygZFoBjkBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXw2xfnye0FP3OpBaZRhmEJfUT1JFkXIhNmDzM099nQ=;
 b=OudjmDmNQY+Wp907Jh+n/g9jrL5VeJnYx78KY5RHv/gpQRjIrs0/Y6GWn+auRU/P0F4mBvPURUwMOeFxprG9IGlvLY5L42cP/0OSk0t1Ena/z2izOgfsbatVKiFfSia4piRs67csNxwMfS8kwUgFVS9jDlt0iGqY0A0q/IBvDB5ZM4MfrvL/psuyVhSqmUfrAaYogV30VUkH69G2RaOw3E3QXf5gMRMxZxTRG8YD41eoUz964oASHf5PMcyj77Z9NhXtloOt0EingkUqjIEcZoNYazsh1FhkSXMElFYuYDEmT7HeOGyvQd297/6vc9ysP/JTyJEtXBUVgXK0G2Q7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXw2xfnye0FP3OpBaZRhmEJfUT1JFkXIhNmDzM099nQ=;
 b=Lg7/tYAlSUre6EKR7r2yEExEIKh63dPDC2DoZ/wjMBOEEuYUlE3TDauZcYRFH/zVDmmqAFGuyzxjk2zChUIAzyjWoUdH4QHaRyacVJmOpVspN/Kxq5UGilMgWOGOkVOX+zYD2MNBauixHkXdUO5Py+sLljwFNioeoJ/VGsW2hC0=
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 (2603:10b6:301:50::15) by MWHPR12MB1135.namprd12.prod.outlook.com
 (2603:10b6:300:e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 17:00:02 +0000
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::b148:9990:8bc4:4647]) by MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::b148:9990:8bc4:4647%4]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 17:00:02 +0000
X-SNPS-Relay: synopsys.com
To: "yann.morin@orange.com" <yann.morin@orange.com>
Thread-Topic: [PATCHv2] package/glibc: allow runing on kernels older than used
 for the headers
Thread-Index: AQHYGDuZ5QO0C8Vs9EqwlFiJlujPqKyAeoTU
Date: Wed, 2 Feb 2022 17:00:00 +0000
Message-ID: <MWHPR1201MB02399448DED9B92CC064520CA1279@MWHPR1201MB0239.namprd12.prod.outlook.com>
References: <19291_1643809720_61FA8BB8_19291_487_24_41ca9ce22939ce2ed0c41973db7d612542850824.1643809712.git.yann.morin@orange.com>
In-Reply-To: <19291_1643809720_61FA8BB8_19291_487_24_41ca9ce22939ce2ed0c41973db7d612542850824.1643809712.git.yann.morin@orange.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0546ce9-484d-4b43-6a6d-08d9e66d73ed
x-ms-traffictypediagnostic: MWHPR12MB1135:EE_
x-microsoft-antispam-prvs: <MWHPR12MB11359E103E1089DC95F2591AA1279@MWHPR12MB1135.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A8QRvvZGy8uU3NGR/uvgyE3QNw33BkWdyH2UnrpQShSiJ3Jk7Ss1YGaJi49IskBUnk583/sfkV9+E12d5YMutyRwtotVBM1jlmz+Q6U4bSS1MpRJGlDqYIN9ev1ztXHuNK4aZxEAaq45epf8lhDu/sd+REKtMs3IOEeU8v0MOu5v09ph2jJ5qBLcDCm1w1eI41Hmj+ApuUmHP8N+xPTBajU6S2H0cw4V7NQD5IdhK1r6o5oEu8Yfi+hI5KROE7GTGlzLK/4nwsWhZOvgmY4w7L9QFWoz7uB/A/vsO8I1An6v+SLgfIAYxmrxL4F7fW3XdLTZWax+WXkc+kN96LxUkNypszFuKTnB9z4uVJf45pOflHtobuJ/tRNNvcK3k++SiDuC/n24M1VE2Z1OJS1lt+iOcO8dbBIxFWVWVKI18wjoQIZwCJ8D2VHlDiDDi1IZjCKiXF6OVAwJSjnck9AKAXq4nfqISoe2aPBYTtJQa3Ut5IM1AnjQTVIqsXJGV6tbr/HLKsBx2y8gghnp/vT0T+YPe00nQ6MtVvB0PNyhQeIdpR/wvAfzLZeJpRNH0XjtSxrmvDRFVrYv9vCmasUmJ9gLYunJufLxqmwXyc/u5VChGBHZSrtBu+goZ/S8UDKPK4KoJt6F/lkTcHm7lmgUslMsix0Elk29QrlMeAvmrVJK9Ptu7lRbv+K0KFJd2gamC7LNDuewIgTQcz5chFGjew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0239.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(66476007)(66556008)(4326008)(8936002)(8676002)(91956017)(4744005)(55016003)(66946007)(76116006)(66446008)(64756008)(52536014)(38100700002)(5660300002)(38070700005)(508600001)(2906002)(122000001)(71200400001)(6916009)(54906003)(7696005)(6506007)(316002)(9686003)(26005)(33656002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GdvASypK7Ai8nFeLM9+zhqeLRX6KK/neKw0LMtXC+1r0JQxaI5L87IUeia?=
 =?iso-8859-1?Q?9KoJf0zWZNKaLMHIg0093pxb7p3bsND4ZxYmQo6oMo7lKW6IBg2NV5zZ89?=
 =?iso-8859-1?Q?AZFzOTavz/JZKLtT18DKo2EyCYELHsxdgfho1xKB0gM/SzjiNK919zBPS5?=
 =?iso-8859-1?Q?y00Ds0VqwVATT0T6KrFr9/R/8ebu7Q5x+RQLG9OwNba6QHaNuI/75j+q6q?=
 =?iso-8859-1?Q?N/SdTy9AJNAkDLao0E2cIFIyu4CtU/7ODIKeAs/r09WXo0daaMfP6CVqwX?=
 =?iso-8859-1?Q?qUj8UY9OU1duOWImkmP19/ouBHNcJlpWTXNr2XFE1d/n81BtWoa1AnKEVS?=
 =?iso-8859-1?Q?mQGfoQsN6FSfVNSmC5hQ8t7t/Vf7JvmDwXZhEkoneC7m2pfLfbQVJxO4Z8?=
 =?iso-8859-1?Q?3GWYNDQqn1IRQOuFzLbGCl2zsP7525SwPvp3frLeuRH9vzOsYM6jH0wE0r?=
 =?iso-8859-1?Q?zwr+erJ2yBDeGRQ+fI8Q/sG9C7v0Qv+WqvhjUigy6wWmSqR91s2GK9Ye5h?=
 =?iso-8859-1?Q?2rOVxtV+3YmHpbo+TN601oMm6eEneFTgr9kYUNQ5tcz8gXLHOdYFSjoBUK?=
 =?iso-8859-1?Q?xM2D0lMxp1NKBMWbN33YuxAk1nDlUOKS2/Wk5ll0y0WRr36SEnmEZxGUZv?=
 =?iso-8859-1?Q?LVEjUxH2Wbp/q9xp/4fdxa0fSxTXH6fPQn9pq/Pt/OyxK33UXGES2FMrjF?=
 =?iso-8859-1?Q?8zvyoMNpPqzi7tTb6hBfS3r/fSo2gISvgGfTNeyYfEcMLRXap//EJ54N7b?=
 =?iso-8859-1?Q?97A4J3p1hxUOAJjuZ6iEsib0UgltCAdkZ2QC40Bdam/Jng9WKa5dSvlaAC?=
 =?iso-8859-1?Q?vLBLUT2OQkYpvN9ng0yCplzx+3iV9Y/vVVOOXNmhBzXJOaBYBdJtYV2f6F?=
 =?iso-8859-1?Q?8RlBlFku9uN7C2rrRAAUlbKlEuz79lpLoqmUu64aeUNJsRhqK7ZtqM89Me?=
 =?iso-8859-1?Q?D2ZrMrTn4TGUz+FtuIUu12UcF3jQvMSSERy/2oMt8w4VHgNTiydzlBJrsx?=
 =?iso-8859-1?Q?iv5gcvjf0OdCnu8iAg7hW0TVu02J0vxpsbd+djB0V3BQII1aaPCLlZ25lA?=
 =?iso-8859-1?Q?tCL7GLR4iZIBVSjvOCukK4W9Cneemq8opfxSrTolRPvPXUzFVRKy5591q1?=
 =?iso-8859-1?Q?4A+ZLR7JBa/quHPKAgEEyT+/uTg2LQUmAcwPdTT5/UU4TXDE0SFyrcaP77?=
 =?iso-8859-1?Q?IOA4HoRN2Z5KqxrVlwyGg5TZMRAgqr6mEKqNha1Hu8trjcFd/qx9PYZ77A?=
 =?iso-8859-1?Q?Em4ebj1jvsAj4tzu6rK17zNtJs+ml7OaOKP5WqSI2m+5tUpFjG6N6Wggd+?=
 =?iso-8859-1?Q?gs8JTViWCv4/b11+4kjgyPUnYayEKai8jcACGlDqC1WYvswF80WGcidIdo?=
 =?iso-8859-1?Q?1WwYRFN9jh/u43HFzbcapJzNtpJGnhRWXKDSKE+bfz29c/miUz7J3pdBlU?=
 =?iso-8859-1?Q?eKeRrVNZUIoZmrUChltGAwCBocxYnXTJaGWqjHo02eFoLNsCVu4JBl4LmD?=
 =?iso-8859-1?Q?PoO1LQ2AuIu+dxVmTZRTkIfA8Q6k7S/iXQlHaDmg0GjVYiv3QtJe85zpdm?=
 =?iso-8859-1?Q?CE9XYk3sTfx1KEer2KwtEfA/ZytbLa2OgwQIjMYw1hcflbB2B1HSy9wefY?=
 =?iso-8859-1?Q?LQgI5l2IVv/ikqGf6+QfxdXOb7hxLi30O3UVgykEQBse3YzaNIibxg6f16?=
 =?iso-8859-1?Q?fdqxSwl9INTvFA24SaE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0239.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0546ce9-484d-4b43-6a6d-08d9e66d73ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 17:00:00.8993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcBJ0pxxJrpsEtNX1o/cf7xSWzx9NTCBfn/Vmbxy/g+xnJrj42Q2UszoqZRtX8qoIoBJIEudFHtLLEQJ5XsjDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1135
Subject: Re: [Buildroot] [PATCHv2] package/glibc: allow runing on kernels
 older than used for the headers
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> We add an option to glibc to allow the user to enable compatibility
> shims. To simplify the case, when that option is enabled, we just let
> glibc enable as old compatibility shims as supported by the current
> architecture.

Looks reasonable to me. I mean to not have all the flexibility proposed
initially, instead adding an option to fall back to something much
older compared to used headers.

If more options are needed later, we'll get to know it at some point ;)

And thanks for doing that, as I meant to do something similar a while ago,
but never posted my local changes.

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
