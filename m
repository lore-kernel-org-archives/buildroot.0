Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8ABC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 21:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 260E640373;
	Thu, 30 Dec 2021 21:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fHri8-fTTb6U; Thu, 30 Dec 2021 21:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AAB9401F1;
	Thu, 30 Dec 2021 21:12:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C50FB1BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B14EE4038E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxiR7nef8Ezm for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 21:12:12 +0000 (UTC)
X-Greylist: delayed 00:07:37 by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0C9940373
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 21:12:12 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B2FAAC55AD;
 Thu, 30 Dec 2021 21:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1640898274; bh=+yZGE66X2bMF2Pmop59ZdRWdIOZp+SGEXhg/N8ejoNM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SkQiuoTYInnh5x5TVcG0Ot/H5N1lTHY0CNphiUogp3FtbA0vwCzyK7w003R3EyxYj
 MTA24BQBaGyJL13AK9Y2MW2x+hBFamI/O4x6lIW0eXVppMtQdCsxOttwBvW4jFI50t
 G68qV9Mr6xHlWUecR9KzwM+kt4yT94MS8RwwGGdyoc+LHEqVL8n9CRrPZGzj3e+gkP
 VKsUa4Q0LP7OgIdVBthnxSBjXpvVHmstE2oV9d7NSeYYkwnzzk4GW6DuRofBiA4Duj
 87flh3FpDTtZcLFdS2YOrakFgMeFL6tfVW+NXSLLHtUaxpZcrQ7aMnXQLjAwQWx1TM
 y1ZBbAcGlzPTg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 981AAA0071;
 Thu, 30 Dec 2021 21:04:32 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 265838007A;
 Thu, 30 Dec 2021 21:04:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="b0mag9Ri";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3btPxPRpOrW059Wzee9NhodoV4etb237XHktqlbrhtS7n+5hLbVs+FEVGzdNWFLnHdEXN+NYkKGlxrA43pLU393Omg+0MELBkm72wDligtiSioC46tNcSDkRvPYrDyWyDzg6pl7df59+AvOdQgIxtujonJ8pHFqCjhFg04oQLgGYD4DKHJCSb9HVgO+zW5BXeQuWupeG/B/hEskrN2Ndak7OT385grMeg+r+P/Q7k84HVgayujho+Fql64ZAGagAaegXpFLiikVAfhf5uJXztSQRm6xwqANagh5NEhapoZthQSo4oT2q6wKDOgqknz/oaYUCMiXl7WKdC03fSwXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yZGE66X2bMF2Pmop59ZdRWdIOZp+SGEXhg/N8ejoNM=;
 b=KjzxtCH0sxaOInJpfK3HbepoBhJOvO39RWAxipj8v8Sq0jB9YSQhAsqPk1Rs8GolOyzA2zkD4/t6rd1lm/+iQ/yfVnoaPlVsgeMUcL6mFJWLFIpx0Ne6XAN6S9ZBiBOJ9tHjc8tGpgqw/9H7g4MvhfnVz3N5Lir/z2G9irEl1AefMKmz1sEp3TVw9G9MMeJC7rJ0ev8gNvyod/0/ubBHVSeyn+l2VkDBu/tJKNWObS4vv38C/rZ1+iiHgUTme9J8pnjgSlIhcSgEboSIGgshg9QNjDORyA8F/XFa/GuFORJjy6q4vkUwL2oL2iI/SdAkaEndy3nF6OPE+oH2VEDfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yZGE66X2bMF2Pmop59ZdRWdIOZp+SGEXhg/N8ejoNM=;
 b=b0mag9RiT6o+3VIGKLlFm+P38a/5ywmbDUKHYkNlrvc4OzLZF/sEHN5w/cewoXe+Wk9k7sKajzZme2htk6JhVFO+m4iNgDMzGEJKEH3RXOV+kxrqEdUkMjBByV0NuFnqnKczh0OQESOcYNAywW9EkYfS0Ab93O8N70CHNT21ZFI=
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 (2603:10b6:301:50::15) by MWHPR12MB1151.namprd12.prod.outlook.com
 (2603:10b6:300:e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Thu, 30 Dec
 2021 21:04:23 +0000
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::5929:797c:9283:10f8]) by MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::5929:797c:9283:10f8%4]) with mapi id 15.20.4823.024; Thu, 30 Dec 2021
 21:04:22 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH, RE-SEND] openjdk: Add ARC HS3x/4x support
 via "Zero Assembly Project"
Thread-Index: AQHXxnMZC7UD45SdUki8JbDfq/9cr6xL5u8AgAANtP4=
Date: Thu, 30 Dec 2021 21:04:21 +0000
Message-ID: <MWHPR1201MB0239219A4C47B50911698503A1459@MWHPR1201MB0239.namprd12.prod.outlook.com>
References: <20211021115915.32447-1-abrodkin@synopsys.com>
 <20211230211458.4449d869@windsurf>
In-Reply-To: <20211230211458.4449d869@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 2e202644-2243-28c5-4cc9-79539a0faa69
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 386bb3c4-fb53-464a-10d1-08d9cbd7f411
x-ms-traffictypediagnostic: MWHPR12MB1151:EE_
x-microsoft-antispam-prvs: <MWHPR12MB11510F4AD676ECE25DB5A64FA1459@MWHPR12MB1151.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0UQ74ryiP47iGJoe6hLy5V7o1QKblQXjUsTz85fnnyP4mpUWn65VBmzqiPhqKrtb0tv0F3rcAqaQKXLGPF3Pmscq2Ecu5aNkVtiivcrV6S5bchJx8cF19Orb8DjBi2qvexB5AhNz63qM1pt19kW1JnX7hfrKmjzoCW83AvCR81UkcNREYeAFIDtNQLV6C6kINE7ZhW8NxeSmA7iKmMP7oSosm0cHz6GyysWnwSTnnQz9vCHw0bmwYw/oZPrgEpucwH5Y7GQcoV1tMaVF117ooo0YglbubIeKN8sm+UL3+mC9uQc3z2LIR/7dZJHJ84LBZFR5W/CE6JcOapHyLpjqAccEVT8xplRCb2WOX+JG3JWZEVDJ/pnIEf1njdcNRMi2pUpqoV6dGyXB0+PLBNahFq0nSx+G2LFfYiifuLeQ4TdOqP6rykQDrMbsQOaSYLcGkKhwIwlV//gy6g2zSgGI5jTUcIvjuz0ICsLnLEFXBpHRdQe1xGb3T/nQp5bxxC48WD7UE5+sI5V3aL1AbS6LjAbxD7BS3y1sQ2kr9tLF9jSx4LvmG6AcY2Sj59B9ORUuHGe0wGk5OTZXMQDi2hqjij5gXeE7zOKefcy1SWP3Lj/3eVVicNX1prYplrdLiFlHFx79Eb8E//6q2eIFESWbhLEWpRwHad5zUMmPXEZtYoHSaZgsYlczN8bHQslNG5IuUPEU5e+adug7w1RLZZr2cn4ALcleDmupWnnQd92ZqtTlvGYcim12bT9YhHcQqjll7UqyquJivt/HVESLLHLpUJ6k4g3tteqlPWOfOHBR+2E0hpmPJ/ML9ygS22lHpm8m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0239.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(86362001)(38070700005)(186003)(26005)(122000001)(2906002)(83380400001)(4326008)(966005)(38100700002)(6916009)(508600001)(52536014)(66946007)(55016003)(64756008)(66556008)(71200400001)(66476007)(66446008)(8676002)(91956017)(9686003)(316002)(6506007)(54906003)(7696005)(8936002)(33656002)(76116006)(32563001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kssnNfyoiBBDvAMm4pHzyc8NzYf4YhgW6j4VMyqlqOQBjhurjIYwDXfw0l?=
 =?iso-8859-1?Q?/yoR7KEuSaW80Dwuv78qWJHVNdHLWzs/Jpf3HN94B1es2+pHTTyRvbEwfQ?=
 =?iso-8859-1?Q?daoKdhinKR7cwkbP9xWrLTrwdIBDpuHTDBKo80916YKOFQiM/d3BQEqBvW?=
 =?iso-8859-1?Q?lVppkyscdXLMeunWBLLoT2pMV+/A6LtyOjX09IGD07Rkb0+N/xOA5xlX+J?=
 =?iso-8859-1?Q?w7/PstV6eM6H0n38FbIHo3gSv+8PtG4LnOW4K4Penb3zMAHdGvCha8EkL4?=
 =?iso-8859-1?Q?0ZB2TrWuv/NsqeLnD2KGvmhEtFf3XoCNaCWBnxaUUhsi+s8blGanOiKMJ5?=
 =?iso-8859-1?Q?OA0Bw+nwQYA5TX3g1sUtPl8ehfb3pFgkY3jkw6LK+9Wa1YYPYnk7qVfdgE?=
 =?iso-8859-1?Q?6RwHvRhMcYjcna3mYsRwQJpOErfcaXBRhqtp1ymVpd3jtfN1/LXJ8aXz1O?=
 =?iso-8859-1?Q?La2kkS6mmvJVfyQpiqjHLtvonaL6yBsSr6CQb8eJ+ovq66jndT1MhO8rZU?=
 =?iso-8859-1?Q?yMfqvstEOiRVMqCNRS0KgeHVyHJ9YO51d6hpKvBdRvxRaZGXvlV5epV6ce?=
 =?iso-8859-1?Q?8AUY3uZ3OEqC/XRiPiaYDA4cv+n92z0PdG/7pCKargOwjXMzcKlZ+qpa58?=
 =?iso-8859-1?Q?lOlZxBZM9Ih0w6ECpyS95P3YHMOXNAMCR1WAhXeiGTnPKIHrqjP1/VSPKX?=
 =?iso-8859-1?Q?l4If+XUFfu7jjOIv7ilyyJOLDp3OAdl8pWPorJ43/9xjDLdA+/623RxFtu?=
 =?iso-8859-1?Q?sxknbHXSNmx6CC9Px2fB+xd++JZgx0R6NE94LNCKCOdWR6GylqFJiQe4pE?=
 =?iso-8859-1?Q?0cSaZyKI8rujWhHYYu4s0Npg41Bwobh8E7NhkVTIs0/ypB4Qm6Xe9Nc/Wg?=
 =?iso-8859-1?Q?Yol71cU+CEAwVfq3+XQxon69SmP17JfEsgOQpaNMLjl8xRf/ZgTsTylcS8?=
 =?iso-8859-1?Q?tn2/ulw4tGR16/cEc232Gc9Zbm5mtdn7TcAegrJPFd/l3rkYTlbX3FbufO?=
 =?iso-8859-1?Q?1THZcLxTxFGwPROTm3ly3TjusaXQirqHYKZ+/THrmT73zMufBIEgJZXs+c?=
 =?iso-8859-1?Q?INiN9dbUwpViaB6dTDToouKEO28FrO89k0iiR9T8fGjxGVtoy4bTninUp+?=
 =?iso-8859-1?Q?PL7OoRTHBqzFIiEAkS7fih66VJAj3whhechMX96V8KAuxK+epUDdaJrAmM?=
 =?iso-8859-1?Q?bc8dSL6Zgbcc1i6BQ3BbeqwSlhtCsb7dYULp3W+qmUPoDq47eEklx36YEP?=
 =?iso-8859-1?Q?QhSnPFChmS5Tf0W1t3g4+S6YC38JHHXREXdMTL0o+niyG8TmheZcs5+zUv?=
 =?iso-8859-1?Q?ggrBfLzpJGvcnanO7jw2h8l5eiXh88PNEiAyMHrs9JMWjd2HoEV83LsyS4?=
 =?iso-8859-1?Q?1SpTos0NdChqx6ccBdzggDHnrC+Gcfuab6n+sIrE2tPkUk1vrE2ee98l2F?=
 =?iso-8859-1?Q?HBhiC6Ci8nZg4T64OoUYiFCCbj+BInomMasKZVxXJdx7M4ffQcEutK+p6c?=
 =?iso-8859-1?Q?n4FvaOkJQnTnfua34ePz+x5J8PLn8stOmtIUDDJIo1aGb1Eyw90+eCa900?=
 =?iso-8859-1?Q?hzGof6/AW66UPPWhHahwSrROZiR/GPA51IT6p0/gCax91NHgxkcmrMHEHT?=
 =?iso-8859-1?Q?gZMFg8NzylfQ1ptfmXGbjLkur0Vc0tKPF7NrN07tPYlN1p6AKYDl0JYA?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0239.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386bb3c4-fb53-464a-10d1-08d9cbd7f411
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2021 21:04:21.1587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tG/4oRuazmCGIklQ3/ORMRxx1dm6BRRwayGUXWid2paCAlCTYiyDEIu6wqXVUU/nzZ7DTo+JtchqH95tOnaqOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1151
Subject: Re: [Buildroot] [PATCH,
 RE-SEND] openjdk: Add ARC HS3x/4x support via "Zero Assembly
 Project"
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
Cc: "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> I have applied your patch (finally you could say!) but there was a
> mistake in it: you've added your patch in package/openjdk/, but we
> support two versions of OpenJDK (11 and 17), and your patch only
> applies to version 17.

Sure, thanks for taking care of this one - much appreciated especially
assuming all the extra troubles you've been through here ;)

As for version 11 I'm not really sure if it makes sense to kinda retrofit
ARC support in the older version so yeah I think only v17 should be OK.
And indeed it was not immediately clear that there're 2 versions which co-e=
xist
at the same tim - so that's my bad for sure.

> So I moved it to a sub-folder + ensured that
> version 11 couldn't be selected for ARC. This also raised the issue
> that version 17 has an additional requirement on host gcc >=3D 4.9, so if
> a package ever did "select BR2_PACKAGE_OPENJDK", they would have to be
> careful that specifically on ARC, it's only available if host gcc >=3D
> 4.9. To avoid this, I've moved the host gcc >=3D 4.9 dependency to
> BR2_PACKAGE_OPENJDK itself, even if not strictly required for OpenJDK
> 11.

I hope it won't hurt indeed. But we'll see...

> However, there is one thing I didn't address as I wasn't sure: do you
> support only the "zero" variant on ARC? If so, doesn't this:
> =

> config BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT
> =A0 =A0 =A0 =A0 bool "client"
> =A0 =A0 =A0 =A0 depends on !BR2_powerpc
> =A0 =A0 =A0 =A0 help
> =A0 =A0 =A0 =A0 =A0 Quick loading, but slower run-time performance.
> =

> config BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER
> =A0 =A0 =A0 =A0 bool "server"
> =A0 =A0 =A0 =A0 depends on !BR2_powerpc
> =A0 =A0 =A0 =A0 help
> =A0 =A0 =A0 =A0 =A0 Slower loading, but faster run-time performance.
> =

> config BR2_PACKAGE_OPENJDK_JVM_VARIANT_ZERO
> =A0 =A0 =A0 =A0 bool "zero"
> =A0 =A0 =A0 =A0 select BR2_PACKAGE_LIBFFI
> =A0 =A0 =A0 =A0 help
> =A0 =A0 =A0 =A0 =A0 A non-assembler variant with wide arch support, howev=
er
> =A0 =A0 =A0 =A0 =A0 performance is less then client/server.
> =

> =A0 =A0 =A0 =A0 =A0 http://openjdk.java.net/projects/zero/
> =

> also needs some depends on !BR2_arc for the client and server variants?

Hm, indeed we need to add "!BR2_arc" here as ARC at this point supports only
interpretive mode (that's what "zero" mode stands for), while both "client"=
 and
"server" modes are 2 flavors or tunes of a true HotSpot, which is by defini=
tion
is JIT'ed. I must have been in a real hurry to make all these stupid mistak=
es.

Do you want me to send a separate patch which adds these "!BR2_arc" depende=
ncies
for both BR2_PACKAGE_OPENJDK_JVM_VARIANT_CLIENT &
BR2_PACKAGE_OPENJDK_JVM_VARIANT_SERVER or you prefer to do a fast fix-up yo=
urself?

Thanks,
Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
