Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625CFC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 10:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A73401EC;
	Mon,  7 Feb 2022 10:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4CVJPLJtHvn7; Mon,  7 Feb 2022 10:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 550D540130;
	Mon,  7 Feb 2022 10:08:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5C0C1BF41D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A465340130
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FeMrZipBUMEt for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 10:08:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B440D40102
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 10:08:17 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3B5D3C00C7;
 Mon,  7 Feb 2022 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644228497; bh=fwRx29tTbqHrvGvAKyELJTalXo+WXBxves5EH9lcJbE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SJgU0vKB2mS9oPhPfJAl9msk+hCdtBGNA6A4KsQfTd4U/BV/tsmt088a1bdRst9LS
 tDhBbD5xStxJY8wGAhjPa5zhZn1S7sxjXy3R0+OcplnKcPvQjf+V4boxvu3xK5oJ+1
 kYiKOhgYE94svWTzui0PJB2T/cJBe6IXHDaogvwz+QaX/DcH89dlPqz36LrOGJCpAH
 uNrw/Yyjqwni+O1n/z/VZJUMcrDaSjNLu9xnK26e65i3T89ZQKOEeVk5TNG7pQNBT1
 FkQFKnyc1o39PWb4wuzSUQaCOvrqk9+5tRIrg5IH1mFzzOcqkMmqwzgrcMtEGPD+/Y
 rR9hQ+MvmqUcg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id E5EC4A0068;
 Mon,  7 Feb 2022 10:08:16 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 01E86801EE;
 Mon,  7 Feb 2022 10:08:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="RTeN+K5g";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddIZiAAyANYeHsmZVVsZyL3qyJ8yedSOEGsvtJTFJ9trYHIlHyvPcA5LPsHT2dcQsFdAwHIsCOMOhzQotbhZgzpuH3zo0eHJIz4M7lJAqCXMzodnuQoBBiyvB0M2A09aozI/mpoyvmAWlRtgnZd5ScmS/hOtugRUdZQxvnvMfvORCqU6YlZIP7mGxkTxAZ0OdEnIQFZaeL+6UlgsaqKmF5VLNN4MhdQrny85Q3CIVWpT3pH0jXUSpeD4xNcrpJG8Tzh/Oo2S98gl4veyxZfDNJJLgrKS+eOPpV/08K1JihBHb3hkoTQfQklhliGD3AaBYWSUA4ghbJUj0itJl4ehYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwRx29tTbqHrvGvAKyELJTalXo+WXBxves5EH9lcJbE=;
 b=Zs6BJ25hVnIOzecsjlJnceaiSfgU4CWL+X6tg/USt+nxQ0LO+ucDm7O0B2IU9THzUEouR8ygZUG/QVMvX+93IJ7Hp9r9/WJ8kgXTQTZenxYC3lV5ptT4wQHA7ponPmxsUwL+/xcvHzcncWEfzEAz6whDDM9PwaNnctr/mGatCb5ealapLPSrEdIA2lAoT639EnmGSacFbnlg084wt0AIHjgBtQdELzljXHlgbmWfIYTMq3UOgH/LqeLmELn3MxCmWZuAvxAoAaRY0x3vSmeQiCqxE+fSJmMieIC6g+4eo+wrWHJ9DE/A+VHF2xuKdwM61E9Tjz0bVJOQpodt0Sn+xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwRx29tTbqHrvGvAKyELJTalXo+WXBxves5EH9lcJbE=;
 b=RTeN+K5gkMHXoPSlsHU/bz8htxd5OOF+xqKyIJ1lmE1djLVaBYS4e8/sIuNCFtjF9PWuDWxXdd72xMqywjBFHP7Smi4gwIuGI4K8/YRAmdZKyyPDkIHkbe8EyLFepDWKxz6l/xrJCAxRkEBzvFtL85fhrwf/dMkEJrY+0Qm5I5k=
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com (2603:10b6:405:57::7)
 by DM6PR12MB3145.namprd12.prod.outlook.com (2603:10b6:5:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 10:08:12 +0000
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484]) by BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484%11]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 10:08:12 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [arc-buildroot] [Buildroot] [PATCH 2/5]
 configs/snps_archs32_axs103: bump kernel and u-boot versions
Thread-Index: AQHYFnpIxuU72ueNnEOXTJCYYg9uXayH5/5j
Date: Mon, 7 Feb 2022 10:08:12 +0000
Message-ID: <BN6PR1201MB022839820D3E08D9BC40D4D1A12C9@BN6PR1201MB0228.namprd12.prod.outlook.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
 <20220131081214.12773-3-geomatsi@gmail.com>
In-Reply-To: <20220131081214.12773-3-geomatsi@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c351cb3d-e057-4c80-5d35-08d9ea21bfca
x-ms-traffictypediagnostic: DM6PR12MB3145:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3145BB2FA8EA787E867E8D8DA12C9@DM6PR12MB3145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:94;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ypZRJ4CbGH3XD0r+vXmz/UyOkrT2o5MqhWzaqQo5UuQY7JLXbkUY1PLrUhsWAKV195irJEJwuCmFRCDwdXrNom8WF1sjkQWEvF1DoQbj1k6+CbBF6w3RYrih7BHktjqOxf3rouVjEWTd5sMsdVr63msrUtPigyOhilxX8HDwxFJ1wZaYTX0H0EO7VNG9ZhQ+3Jz1alV2DG0Dq/vPoAJORO3mNiHmyug9GzGUoIaSHFb0JbRzsKKyPqT4kvYVSxQl8WL7movazMRwk28wrmf4XnRkRU9tQ8EmFntQrD8BjOjbmDWVqs6j5VjNHSlrb9XygX+2DgPFIk9PDtIav5CFvAKbv+0s7B8lv4/Dzapqp8ebkcMRBG6k/kGyO5Oq1V6pZp0vUJF0UZyujKVNkb+wqFEt1M0WYhNkn4oDMgwr/EXqyhxBOEScobUackApCQUnz9dHO3C1TvqRHvSAY8UYQE9HdyE3sAkJgS14Q5q5H7gl+sv68Gqp9RzWbNCXmJc7mQaDXp0oQDfqomFT1cKazCv3XHoWKR65pbvHIntkgDncITMx407ZYfb5uuuy5dStKfztaSMgyMup6AIBuktRIvt9BaYJeL25o4i8AkJSOAyxKOH4JpNFjnbcwIiP62SNA0V06APJuTQbQHlBd0EWtuzI8taipLHwozR507aPv4Bvup7Fb1nXW4wXris+wURGR42b1RKaPAYEM8vCJN9RtIegC7iJT7K3Lv+nBfbQShPNraZGjdVeSyNYEe1DYxMf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1201MB0228.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(26005)(186003)(91956017)(86362001)(7696005)(9686003)(2906002)(66556008)(5660300002)(33656002)(558084003)(52536014)(6916009)(4326008)(66476007)(66946007)(8676002)(38100700002)(66446008)(71200400001)(64756008)(122000001)(8936002)(316002)(76116006)(38070700005)(54906003)(508600001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pt5P4newhv7/jQXxDgZWjqbgoTW1bwaxlIvOLLnw5g25IZDtIFENcvPo6i?=
 =?iso-8859-1?Q?jgkk7F2/gcuJtjzlc6oDgniJehLLvtIVinDBrbIZg9cw2ZpcX3CYOpFpeD?=
 =?iso-8859-1?Q?4eED6vCyQKIHrozv65FDUmRA6JYpD0JLI6ut6PHgrFnR2gLaf89Kveppci?=
 =?iso-8859-1?Q?SraEoQvor4ZpZsRAMLND2/b69wmsJfrn7pEI4WjsXjqJBmOH3Y6V7LyTcN?=
 =?iso-8859-1?Q?gaHdGsn7og6leGe7+nkRBILne3XhzWnHFHY3TH+GL5hQEmpxRzhTelqYmp?=
 =?iso-8859-1?Q?28FREvKwPxTo5e1CHrm+9sp95eSvBDqHMf1CSWbs1rVXlUQ63v5A2IRlUb?=
 =?iso-8859-1?Q?faAIk6/KRSZTffFCQHv2PPVAZtRLI59V1Oe3XpXpMv9yTgob2uy/hUgeJj?=
 =?iso-8859-1?Q?/1jb6gILBEjKHuiVdWhoMWOi26/SbP4QO/5IK5Dl/PycWhYWUNdfIzgHEJ?=
 =?iso-8859-1?Q?/N+CS5RgESW40TryXvwSG94iRzAVHlXdHHlmuQe1mgkC0nc7yenmGji9u+?=
 =?iso-8859-1?Q?Ylyjg+X1sBEEOVxUplE0hFI3CZD1eCtRIDQmSOwMecj0euduBUb6VMcjTL?=
 =?iso-8859-1?Q?MeDoNOYYyqMav8/i9u1BA5sgFrkWxWTRWS11RPvbIBfqhggUJ7BjTUOilA?=
 =?iso-8859-1?Q?qdEVa87HStyUyk7l8e0aGUoxeGAwHdf//VcOg2MF06rAvv6UFEKltkyznw?=
 =?iso-8859-1?Q?SWxzBCXsPU8SjFnidgnlR+dSckOmiuWwMbSmKtZl6eA0ueEcrIrAnDA2Kg?=
 =?iso-8859-1?Q?Irf5wovZDQtsK2TtQj4+6k2mFEDqM+UXs7DGhtvLurc70dFarKzlVw/vpP?=
 =?iso-8859-1?Q?b48U8oaZMYRWiBWZxLxat3mEWWBffoaTEmFuTG0Bma5x7gyf65WrCNJUWu?=
 =?iso-8859-1?Q?sQ1ebOIPeGDYC4CgLe9vleXpxwwszB1nPzz5/qFn91ZDiW32w48DfoQvsG?=
 =?iso-8859-1?Q?6Cf7AXLr7brg2f/fu97mrE/7XT2Iwt0GhpAk+msl0hLe5m/PwASMMgBcBO?=
 =?iso-8859-1?Q?KMPoOo+SoL8xb4e8devu7khcDZSZ9nOSorw8PAFDrG3K/LCYBxHWNUHV1k?=
 =?iso-8859-1?Q?WWGO9ydNbJaSakDJI6OBsPzLnyaYgzC/FsmgksMNKfQt2h0uR+fWc9ZRwG?=
 =?iso-8859-1?Q?kr5Owwzq6U5vT5dF280m9npUOifnmmZsWRgojgmZOG1632B9fUhvZDXyeq?=
 =?iso-8859-1?Q?YpZSFDOwGqC1RF8k/YW2YJVwQTsPve7gDOKl3YOAaIa3dFNde3usUK4VfF?=
 =?iso-8859-1?Q?iZSt4T1CpKr+zKR18Sx1AiWCQ99aKOj9Yzfbsu7GssG8No64AEOo2qoE6d?=
 =?iso-8859-1?Q?DKUamKRIEG/UlyvKP2D0NH23jYz/9McjYk++7LT8n/wSL+zOKjX5TZRCAA?=
 =?iso-8859-1?Q?iw0lGDPzcvf28/3heU7cg/St+hurIPOgdeBpyC2OFC91N/lYEs4K3eupQF?=
 =?iso-8859-1?Q?dokteo2L3V4pkxFa9bQbcGb8peuT3wMiF9xJuleT5Tql7zwrCUNeIYcsSq?=
 =?iso-8859-1?Q?gIpMXD5HH8KpNNU/zwm0d7/mweAdwcGmiB+k1+uiu3YqrJO60WOJ/TsQcM?=
 =?iso-8859-1?Q?XSuZPInOALsogMk/u31imxu93+1e4vwW/pyLgA+4nyFszI6z98rPGLx1Kh?=
 =?iso-8859-1?Q?Ghy9tJMgPJbPQBEg86stendySnFXKKLEhmmYxLG1Iz2b+0pbK8qsCYJw?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c351cb3d-e057-4c80-5d35-08d9ea21bfca
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 10:08:12.1229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRl+KfciQHFu171XzJdRJHIHXHhFVB1OpFeJ7/ikwSwWi+eceHv/iKuwg1YXGZvhj17w39lmPeAAr/9sKVhTNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3145
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 2/5]
 configs/snps_archs32_axs103: bump kernel and u-boot versions
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey, all,

> Bump versions:
> - use U-Boot 2022.01
> - use Linux kernel v5.16
>
> Add U-Boot configuration fragment increasing early malloc pool size.
> 
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
