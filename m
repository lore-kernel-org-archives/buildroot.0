Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DADC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 20:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05C4E400CC;
	Tue,  1 Feb 2022 20:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vfna7WqFCDL; Tue,  1 Feb 2022 20:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD9B6400D2;
	Tue,  1 Feb 2022 20:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0A191BF97F
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACD6F60B79
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="FEDjlkTB";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="NkEGixcE"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W806d-7myyqV for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 20:09:34 +0000 (UTC)
X-Greylist: delayed 00:07:09 by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1426560B71
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 20:09:33 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2738C4010A;
 Tue,  1 Feb 2022 20:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1643745744; bh=iv5rDvYqJnulPONKGQu+b6Nw4EQXd141nEJwkOxl/Zk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=FEDjlkTBCX6adZOg1sWUIkwbLDwooG567xpWGPghTv1Ppn9Bi5vnjQetCxAXvgVB1
 71stTk+maCNsdX4Wexh6r8GNVcVLuukiaTg4iJfzZF9vbnaqndax0qltveyAmIWs2Q
 U886dKJwypAuH/3HAlSUKy7CYiAGmLbK5z06DaYiGInJ2sWYqkpzw42RahEvoboceA
 xNi4kn3Ce74Z89gZd2892Gr8xUZhYXjkYVXEb66CllknkNgvKU8oSroPIo5UhHS/TP
 A7a8YFCPAKpPAvG6CM/spznvNmW6PWSlghPB4yEo+Nn34vgxphV7gY5O1KpjMwdQQ0
 0MvQJfT4xzhUw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7F271A0064;
 Tue,  1 Feb 2022 20:02:22 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9C257800C1;
 Tue,  1 Feb 2022 20:02:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NkEGixcE";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNdXJY8spaWX9UOdk1saAm4UphuednxyXnaMDrlx5kgThfKpT0otTkg3ad/yzhKoMgUMajJbMVMqeh8qbRwYCc2iO0uGCOCuUmZLcZ1O34xgM1Kkg3y6AFoWRgf4mGBIYMwTRrV1om1iGhSoB9uW0LWZwcPjh6b+v7ziS/QegRrpYXyhi7CbWUErwR8tGb282LzKOzi7n3bvu++AyMkRWfg5+fR6Xzby3cHx080HkP2yfRllkWfLn67WcZsFpPlk3+mnJAr+RimX1peX2Z7Z9cskoIn1nBwMNZu3JfpbV0ivqF+IpWgsG2W8Vwq8KWGvojLcMQ36K+H53Ctlxse3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12RR6wDPh5CSWHhF2ua7wGXmHVx9jSOQumDHGF63H6I=;
 b=aZsfRz4qFU9psTAdftOfgpxn5KFb1XrKtl4/XPHm5AIr4M3wd3vq4PEIKxROVryJ+8iE1slsSWoitSNEjPuFCc8mwkG/VCx0VkL5EOR3TfPj+gSfhd0+sbjguz6B/vdm2cNLKJhGaEQrltJMLj/C734Tw+VejVeS1Cq2g6t+nALzQ6u4jgtF6iP0N1yT5X3RaMixgQNF0LUWBYpjRCT8Q+lUpvNzp61uFSOmaEG7QVJjxZSUtWB5IwqE/FdkOmke8b58bt+8SvAJLZU4EW2UtMJGr1Qb9KuYVpmB0JrChEsAfIHhZNM/GDa3w29oY+SsuzFEOAsN+Tzn+NyhdqvMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12RR6wDPh5CSWHhF2ua7wGXmHVx9jSOQumDHGF63H6I=;
 b=NkEGixcETXPME/g1RSDY8BZ9gujF1KDAtEOvzo1JjTCPQ0t2C9xzHb9hgReFjDQjeKUiU+QN73PlPG2B3oVkswQqKpIAMjM4+cSWGxgYol6YYOu14+4MrgrR/Yd7kud4SxoNAqI+UfWKLH7z+ePn2fJXLv+4nbzO9AijT+KbTqQ=
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 (2603:10b6:301:50::15) by BYAPR12MB4598.namprd12.prod.outlook.com
 (2603:10b6:a03:10d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 1 Feb
 2022 20:02:19 +0000
Received: from MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::b148:9990:8bc4:4647]) by MWHPR1201MB0239.namprd12.prod.outlook.com
 ([fe80::b148:9990:8bc4:4647%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 20:02:18 +0000
X-SNPS-Relay: synopsys.com
To: "yann.morin@orange.com" <yann.morin@orange.com>
Thread-Topic: [Buildroot] [PATCH] package/glibc: allow runing on kernel older
 than used for the headers
Thread-Index: AQHYF3QgLpSNOp8be0i0UG/0NFjv+6x+u6QMgAAQ9QCAAFGgGA==
Date: Tue, 1 Feb 2022 20:02:18 +0000
Message-ID: <MWHPR1201MB023950D2FF59BE0B38B85B73A1269@MWHPR1201MB0239.namprd12.prod.outlook.com>
References: <12945_1643724020_61F93CE8_12945_430_1_dfe1b340bf9e8e2c47987f28f8fd40cca7d16b3b.1643724006.git.yann.morin@orange.com>
 <MWHPR1201MB0239B756E843D8604AD86625A1269@MWHPR1201MB0239.namprd12.prod.outlook.com>
 <22491_1643728190_61F94D3E_22491_62_1_20220201150948.GB3216@tl-lnx-nyma7486>
In-Reply-To: <22491_1643728190_61F94D3E_22491_62_1_20220201150948.GB3216@tl-lnx-nyma7486>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae73bbf3-a90e-422e-8382-08d9e5bdc065
x-ms-traffictypediagnostic: BYAPR12MB4598:EE_
x-microsoft-antispam-prvs: <BYAPR12MB45985D44D83C5319C797D4EDA1269@BYAPR12MB4598.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A4p1YlGej/PAWNXFkBWMUcpzvR5E7BO9ys/sEF055iKm/S+GXDySEf/sLnl6j8XhlYPYkDgtaNqLp0UNoa6iVv/5vqkCdwrhgkroQw27cPEEBIe94rCWJR/nsAZKIHGq/tROAdDR1MhJI3KmBeF5e3HvJMPFu19287QNqvf/Y8ZHlCVSElRYR8tedG44be2vkskV3yM1X0IBNVkIcHxMxv0ozrMD/IQNVlmpl4b4es8SM1B720+lApoIEBFN6NRvKZx1tSF2gc9BOPJq1FlRis+/jXMYz/aWmJ7P/iwvO3U5raUFWLKpcNU7faw9E6wFI3kxNQQxa71n+R01ZJ77RdvKSdBoOTQlaG+VSlwGKXb1Iuvduowy8voGBLSI3ur2uOqEMAR/GboSQVa2axtwMHxSsOPp0NMQK34zP0JsJ6uuzU9KJEBtRb0+tuCAu9D7LjAw2fO4zjL3pJs9CFb9R1Y8KDJokrThqSDCJUUeitse6fOg/IvxVz1FI4vnFrGwnvyIi4gH75rItkjqZZdZNk/Ae2eMSzITvY+Kpx66Q1BhTakfOKUFOCffxCod02o8+Q1YZGE2H21RX6HEeHPwDrbNbvo71GUOuUMWVW9r582QkgDZwB8aZ22nPgmCLyII2yJ9LXcjMl+66whiXpvaC4ZSTGcQ6ErNN6jGhKwbWal+4PKahKoC7/AayPIZ0LBwKoOoXvXjSaG6FPS1jrDTFoLRQIla/qcog8mMIumoO3s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0239.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(55016003)(64756008)(8676002)(91956017)(66476007)(66556008)(8936002)(54906003)(508600001)(33656002)(7696005)(66446008)(9686003)(6506007)(6916009)(316002)(52536014)(76116006)(4326008)(66946007)(5660300002)(38100700002)(71200400001)(83380400001)(122000001)(38070700005)(86362001)(26005)(186003)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?o3UfoWWhFc6owdEzFDbJiZh78v8g1+bJaUSFohepvryqgIeCqkk34+kB7x?=
 =?iso-8859-1?Q?Fb5qY9fiQbmTrAiA/tx68SnF8k4YDagqIqxo4IHw4SmL4YcJAl+6sF4W6p?=
 =?iso-8859-1?Q?fFujKXxBrNwdF8figi1+yalCIoRHBcQ6La9f1m0dlugt/XUaagjgiaCF2i?=
 =?iso-8859-1?Q?7jTVzdTWqwkfQLXTdRCQP2WzHCNZ5M+Hj0eknMXAmt/8Z6q33cJRHm0nDn?=
 =?iso-8859-1?Q?0hj5NVYW1oyg2AqS5AUV2lcWOPz4naBZBNjgPavmgABxVuDxjUNOQPvUVs?=
 =?iso-8859-1?Q?4HxwC9Qo1ph5ger8Ld5yVIqWHjpbSWh8h3/SSK59hp6lha7w9sDeMX6aAJ?=
 =?iso-8859-1?Q?CRmjhwr9Rrh8TK4YcAeMpXmzcBWoCNuQrNyxstQLXuQjGBS0LKjwxpeYUX?=
 =?iso-8859-1?Q?MGpcKn9S6QOJbxwzEUq3+O7y2OryYZudSaguByEszdpXLi9zJkllta49Au?=
 =?iso-8859-1?Q?aejXzshBNeTj1RrJOEfhSYBLl4+wozmyp8d1oFUSS9G0bjtx4rGJ66vSW0?=
 =?iso-8859-1?Q?KP5dXlRnB7dMDmqwsUAcNed5mPlnXjsLBddSRlhoMKKqvIQAEKsOaR67Q7?=
 =?iso-8859-1?Q?a0h3qesYi70SXejC3VXu4WFOrHCKb2x937Jo3H7GJ+oOy0RT217BsAf1B3?=
 =?iso-8859-1?Q?sX10Yb/yuIMD3GwAFoPYs1welk1ZlIFOtCya6M+Ak/oCradsSYnIuei2MW?=
 =?iso-8859-1?Q?VLAZRwgbUKnoRbpvn9OxVsb8hnMGcO0bt156Yt+ueGdl3vq3NCtJVaJOTi?=
 =?iso-8859-1?Q?u3AKoLfAVd2QSG5ck5o5GK891ApoKK0Mp6VKfHbJ/900crO519EOLgiek4?=
 =?iso-8859-1?Q?QxHPe9pq7r6ngwBwB1w+CtSmwvdsZce1yviygZ7pIPRLVyP1kPwjnqvp+8?=
 =?iso-8859-1?Q?vdWc6en/OIQJdhF9JXVPSmAgSf+1KyhtYiaCNRRyvml4QXH6z6xvpM8JK0?=
 =?iso-8859-1?Q?JRJVIzUa8ZMV6pFCzFiy63R+nb1Hjm6YSU3h0KXuY5+D+qtMdVWPb0/am3?=
 =?iso-8859-1?Q?LhMfhiOxf+mf6eEhELGtWqM5Pb23mmpm8wPRGoQxuZN/SQlwPLyQWArWtD?=
 =?iso-8859-1?Q?MQY9qCc5M71r0+Uw8LLhv6YWtFNjKPUEDtDBFQiiqNYHyuinPas91Q6+RN?=
 =?iso-8859-1?Q?nNjrAlEe3hG0YDwG/HRP/fAuDMD/r7tKmvGuG+gAb+xfLTxGccR8BQR3zT?=
 =?iso-8859-1?Q?Wc04sI132fKa3K4rihiLGyIrScpS6LvfKBzE3XrHfzUAXvdYWApdBE5G5U?=
 =?iso-8859-1?Q?UFcbqT5JV+F5GHkqOsouOBAg5Cp/vq+IL+quxSUhULNLpX+YhLL3Ee2PnT?=
 =?iso-8859-1?Q?3QjqZFheerZBCg2sKaDrnGx9370C4ZDJ4CDYqtkfQb/OGGPESk1Tgn28vP?=
 =?iso-8859-1?Q?WEjdN/wYFtM1pJ1PXTC/Jk3zYHXb4P9eQM2QNj2i7vkGs7yXQ0WhXYJ21+?=
 =?iso-8859-1?Q?JeUViJ+ZlLEAh0PaV3Cs2vvdhU216QR3P2vJGrssiZvwZiGge3w7bWc7CI?=
 =?iso-8859-1?Q?Mm8BoPx+vkzN1y0nnfwwzjB/xdckyQWAmNyinQLCTEx7X5A3rHBuyTX7FL?=
 =?iso-8859-1?Q?VK4hr4Fd3UhC1iMU/Ws/lXjggjI8i+7EP6nBNgQZofamqGDhWJpwlbWTeV?=
 =?iso-8859-1?Q?JcIdeM0jWAC1R82ragwiqVsljMzsEQZxaNTNPwYxRzBlW7EQb5wi9ETGbG?=
 =?iso-8859-1?Q?INRkmNxqZhSAA1mQ3ro=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0239.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae73bbf3-a90e-422e-8382-08d9e5bdc065
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 20:02:18.4875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBu5Ng4CrqaNfYsOtlOcqCisiYS9HIEvfAbdy/YxDcDJ8Cb6hSZG1twHQVQHJbfKh9yp6Hq0f3xcSK7VDF9jFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4598
Subject: Re: [Buildroot] [PATCH] package/glibc: allow runing on kernel older
 than used for the headers
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
Cc: Frederic GARDES <frederic.gardes@orange.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> > > +config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
> > > +       string "Oldest kernel version supported"
> > > +       help
> > > +         If you plan on running on various kernel versions, enter the
> > > +         oldest version you expect to run on here.
> > > +
> > > +         Note that the older the version, the more backward compatibility
> > > +         code is added, and the slower the code may get.
> > > +
> > > +         Leave it empty (the default) to use the same version as used for
> > > +         the kernel headers.
> > I'd say there's the third option and frankly I like this one the most - default
> > oldest version assumed by the glibc itself. The beauty of it is it's really the
> > oldest version of the kernel which is supported by a given glibc version for
> > a particular architecture.
> 
> I also considered that, but I believe that a user should explicitly
> request the oldest kernel they want to support (yes, they'd have to do
> their homework to see what that version can be for their architecture).

Yup, let's provide our user with enough rope ;)

> Letting the system decide on itself is prone to providing some
> surprises... However, letting the user provide an explicit version is
> also prone to surprises, because if that version is too old, glibc
> resets it to the oldest it actually supports, and just merely emits a
> warning message, which does not prevent the build to succeed (it still
> fails at runtime in the usual way then)...
> 
> So, in either case, meh...

Agree.

> So, we'd have to differentiate between the three cases:
>   - use same as headers (should be the default to keep current
>     behaviour)
>   - use oldest supported by glibc
>   - use explcitly specified version
> 
> So, two options there:
> 
>   - recognise a magical value in BR2_PACKAGE_GLIBC_KERNEL_COMPAT, like
>     'oldest' (bikeshed, go) to mean the oldest glibc can support, empty
>     to mean "same as headers", or an actual value.

This option looks a bit more clean to me as we don't introduce yet another
hidden option (as in the one below). Though I would think not that many
people is really worried by the toolchain internals, so maybe you introduce
something, it quickly gets discussed and merged? :)

Alternatively we may explicitly set per-arch minimal version in their
corresponding "arch/Config.in.xxx" so at least this is more visible
as not each and every user is willing to dig into glibc's internals.

Thinking out loud further along the lines above, maybe even in the same way
explicitly set kernel version that matches used headers (if we automatically
extract that info from some existing Buildroot variable)? Ir it's really
something insane?

>   - add a boolean "Specify oldest kernel supported", and hide
>     BR2_PACKAGE_GLIBC_KERNEL_COMPAT behind that boolean; then if the
>     boolean is not set, use same as headers (as today); if it is set,
>     then use BR2_PACKAGE_GLIBC_KERNEL_COMPAT is set, or let glibc decide
>     if not set.
> 

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
