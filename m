Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75211C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 10:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A524031D;
	Mon,  7 Feb 2022 10:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OOdTn9p3gLVT; Mon,  7 Feb 2022 10:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F0694027A;
	Mon,  7 Feb 2022 10:10:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16AF41BF41D
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E23660B2C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 10:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="ly5AnLGB";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="ok8Sg2x/"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kr-zO8fVpZ_0 for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 10:10:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17E55605A7
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 10:10:01 +0000 (UTC)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F017940817;
 Mon,  7 Feb 2022 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644228600; bh=2TOP+9vaft6jfZeF+SfU9/vhjQj39+ht69s6XLp0dtA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ly5AnLGBNn5p67HMu8tPfkp/XKmfBFAV+mkIdykFSVZxXTDMcuBf2MifNq4PlZYb7
 OgdzRQQQav1TE3vrR6SVzMymDf9CLFOik+/SO4FUnWZ5RcDtF0QYuufcBiJIey1KgN
 eO9czwwkPNz1jX8xIAu6X2yAiiOxewjiCNjCokCBAFrCWJa/CpJDlx9DkN3S1MYsL1
 rv/1Kh2F3FNJMnno/YGKVyDzHl6Z7UaId0UoNOgLBPkvSHEn+R7p9u/YskbV5Rbzgi
 3cSdH+u5UGDJLgFVBcNdMddqsZGuVaYi2GB0lQjUiDt5MjXBLXIq4Y1vPaoOgAIuPb
 GqkIN2DISoiJw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 5E472A00A8;
 Mon,  7 Feb 2022 10:09:58 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A5039400DA;
 Mon,  7 Feb 2022 10:09:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ok8Sg2x/";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4mTjnKULMaEXBbWQOVtzjva0wjK3PjyVcbfiHDTwBmAmly1VkxfS8Nuq197r5CVR6xBVfg79SeNsPk1fxwzplr/gAqlgugFZKO1HLcfBHQBFUkjOAQAbuj7Hvzx87ks0/47NhbdDRje0ttTmsvtFYul7T3WALqDRQNBbrC87q8qGS/cfN74uXe3PZKdE5sy5v026FBihI6MEh7c2oQ7TH3caUai2IWXzQtf72ieSijcmFORbhTUoyFJzvabrm6FHLahOaAo+pAkyvbL781yGtLOfEws+sHBzWzM29cwDWm/Hw05zvm+CRXvmpFI4H8ioegOeXl3PhZq5sMLR8gyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TOP+9vaft6jfZeF+SfU9/vhjQj39+ht69s6XLp0dtA=;
 b=WUWDgaCK4/v043shNBOfy0hTFzmRCiTHHeVtFm4gXZtbM3e/QJQeju3ZjHKYedktivKfAq1+nC77cMjMPO2hAnqjG3RvEjorszF/by6RVz0uhukmm1PoLLQExxM3U448MwemSv50vUn9eOCqtuHP7h17618LPE2TB7EikBznToWN0xRprIJ1VLhkCuJWtKZrP3kcK3i0aRWNlvLqwLR0ZBJ1HkfQB7Df68Kc1HO0EA73BQG8wBKEUfKFeFIIdexAVyLYD0wWq0H3unnEtBWSBf+rn7JW6rvVpHXl3GHBkU6hV0jri/4X8pihQ1BFU7IBvhn+HNXxXClCFKcTa9ClvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TOP+9vaft6jfZeF+SfU9/vhjQj39+ht69s6XLp0dtA=;
 b=ok8Sg2x/rqqHELd1bzIZfEevCMYVNi6z4xNbXmhbAgFJeSfArCjSql85ItBYhv8N2+WxHu6rSsxxo6yFWy1A1ew0qsPDXqgaH7AiY9l3B3/9mp7b4N7bU27n3UBSmObfuO42Zb7qKOPnnInnhdJ0RR6RdhiPbuHinL8+kYCZ4k0=
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com (2603:10b6:405:57::7)
 by DM6PR12MB3145.namprd12.prod.outlook.com (2603:10b6:5:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 10:09:56 +0000
Received: from BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484]) by BN6PR1201MB0228.namprd12.prod.outlook.com
 ([fe80::d95b:ceff:cf14:c484%11]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 10:09:56 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Sergey Matyukevich
 <geomatsi@gmail.com>
Thread-Topic: [arc-buildroot] [Buildroot] [PATCH 4/5]
 configs/snps_archs38_haps: bump kernel and u-boot versions
Thread-Index: AQHYFnpLQMd+GMmo1UCqHj+pmE5UZayH6KN9
Date: Mon, 7 Feb 2022 10:09:56 +0000
Message-ID: <BN6PR1201MB02282CB9FC3F150C46838A37A12C9@BN6PR1201MB0228.namprd12.prod.outlook.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
 <20220131081214.12773-5-geomatsi@gmail.com>
In-Reply-To: <20220131081214.12773-5-geomatsi@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54934311-28d9-4d81-fc33-08d9ea21fdd0
x-ms-traffictypediagnostic: DM6PR12MB3145:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3145F2ED6ED7828FAA48B774A12C9@DM6PR12MB3145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:94;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4vcRzgKU9uwpn5P0CXscs98zjhXHyzBELTJsYXCUwvfTZwgU0OLqVnZstAqXuNKl4SFVMku8XZhRKKWh8GMNu/ocHXlkejzfm+BY0cz4KUcCI7gy4g+hg1+W0vioPpmnzef/YvO69wwd2UBrcE6ZkeGVDg51j3KY3PINloiDLTZPk/mup0XPE72s+RzRink4hblq3Iu8f6at+5Zq3l35wo5BegogJZRFD61+RgcOJYlk4YAgX6eyMZxEz2lhdl1MAUg842hdv3Ul86u9UH+lod/0gpGcSfSSdNJsa2s4cbK8/0WDD6jTKqMjMg5moARz+Jcnp5KLG7m8sWZ2IfCjrjINYCV98NkqLUGiI7/U55mHltHTwBpNZp5w2DsNnksYMJ4HbKcKJ/2r227Lj+7xpLdfGuQoqKb/6WnFLIp7hRVng90elOdSpSU055SleCFjUyLT9RJWjFO3mH+9fB7eUvI3VWlTRVatQBVfgPnCktTfmCYKLTcW5u7pKXPHh2Cs9NJbwRQQeSAnd3/HblbyioyYWgMpZ5mev8Xd3XIbXe9vdxbUWh6bF0W5xkCcGueatFli3wUaPytmzH1IfWQMAq6lVpTW3BB+EXcHPakdKQbALH98We7g3XeEWNvFHaoQbtwN16TG0j1uWm8Co7pzLcNmNb/VVgbCmeC8FDwrqbKGJNWTRUZze1kq644/VKmOnLHUQ5oY/tWfK4f+6Y3/nld6Ke2/LEvZQHsZJyMvwTsKwfiZHxJydcSTb3I4ld82
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1201MB0228.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(26005)(186003)(107886003)(91956017)(86362001)(7696005)(9686003)(2906002)(66556008)(5660300002)(33656002)(558084003)(52536014)(4326008)(66476007)(66946007)(8676002)(38100700002)(66446008)(71200400001)(64756008)(122000001)(8936002)(316002)(76116006)(110136005)(38070700005)(54906003)(508600001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tCP+gaXyHnTZ/8r0mIDNo8Bqc9jWYQhlJwYzY0N2rorzlnG0DRpHhvJUkv?=
 =?iso-8859-1?Q?Gv3j7bPnwzydJMj0Twi+802b280whWfoKp9+azo6xk7Jr9FJYoLf6vrY0Q?=
 =?iso-8859-1?Q?4bc01da3wxRH0ywbU9X27WQ21zI0OJd4dLtn+oc8jrjkCQf5rjIljBpw+d?=
 =?iso-8859-1?Q?1raoCSH+0AHyjPfN4Y+6Hvl5gXixw2XPc+tqaEJ79ekrBEVMLo3ZZxx4EF?=
 =?iso-8859-1?Q?glZi8Apf6HpihEqlqd3IloTtpiDC5dHf/zg/2d9LXCEVrDeIeXE58g4pgw?=
 =?iso-8859-1?Q?+hxPY32HiGKxXkUI8kaq1e662wa1vUJHGmo1Fk/T4kmeenKyV4hdtdKNjZ?=
 =?iso-8859-1?Q?M5EXHmTOZw/0Jr8MCETghL+4ZSNyfs2XbCqAqdoobZFyLDeJyHDRv+5eDG?=
 =?iso-8859-1?Q?cM3ybZV/Ske5/NM9ZPrYuAwjzt9N4MWaeISaO5VTV4perSu2Bw+OSAhkne?=
 =?iso-8859-1?Q?yhCyzp2xUJPVTACjjaIm2EyeoN8ER1CjPrrkA1LHLuZzSNA2EreZkiBB6g?=
 =?iso-8859-1?Q?gNq63BMxibIw00RH3okl2nW6cfzw/1VkHOy2snb+rM5fsToyl8bK9HCtZv?=
 =?iso-8859-1?Q?fjSEvpaKDWHGeo7Tg4t235/Y95I/D6T7eJf6Gw4LHJafZsCcu6QFJYbGYS?=
 =?iso-8859-1?Q?2CDuXmRXRblH9o/jV4LOkO3XF+fHQA4MLM7hjmP0E4OfWlTswyxKby0oMu?=
 =?iso-8859-1?Q?JP+46lkEtrmV239K6fv+0CjE9YSECzjw9inC2QIM3KnlQJal8t25kRfB21?=
 =?iso-8859-1?Q?depms16Xws6XWM1TE9gjSaT3su3ZEPPuwlcI7Y1w/oOCxwhrl0wTs+Gzon?=
 =?iso-8859-1?Q?MODduo4DDzvt6lauO9iuBg4iQU09z3jm4x1CG0bD1X5OANhyzkEocFp83e?=
 =?iso-8859-1?Q?CWUet2Cmln1QRdRwrJYNf9wVqZOpcvi9kx0dmBVNAOUgSc8jO2VOUrJySi?=
 =?iso-8859-1?Q?j1OPZY7up38xDAu7OImR3FeuOHDqZJV82l40DDl4kSH0OldG+s4IODrSpI?=
 =?iso-8859-1?Q?3/YmKTIgyfCDawAUVssWU1xcMifSFMAqYObQfsK3Ob3pHO8VhjZ8YeV9kW?=
 =?iso-8859-1?Q?prlcSsqx/QLlgiuwSO0KxhunpaLGzSzAOYZjEr1BdCkLPdORWPf6fBeEFR?=
 =?iso-8859-1?Q?1o44hmgrtBtRPdtmMLR1wsk6mVqBVCkVeXa6cI1NNcpcQ+Y1sjMg7GF8dE?=
 =?iso-8859-1?Q?LjFIw7bhgMGiLPBZWOCnmUb7tZRexoWktlwo38icbhg+X9AD25KaUBlYtq?=
 =?iso-8859-1?Q?wZqwZ/a4Im0zwkiDzsgjdSblK7a5T2ZtLHX5DMFXCR/fzwNwl8lpnbG7Gw?=
 =?iso-8859-1?Q?783bF4+d2iY6zFD0JQFjGnQJEsuwvP4TjYSrjcvHLFWYf6RrP0OBuXPANg?=
 =?iso-8859-1?Q?UppM9QGQU9Z+4r57KRJ+no5Rh4V0D00xVwYuBO5vUZxWDpzt3CjXhwhj9O?=
 =?iso-8859-1?Q?SOJUUqno+M0vGfqYkYAA5qwasXhsLY9FFr2JQd5A0TLamyiAOBvAaa3+sE?=
 =?iso-8859-1?Q?ZQiQavRfK3TOvhYoAvD1asCnrgo6L2iF4fKuofFlm76YsMv4y53UV3zNFC?=
 =?iso-8859-1?Q?NczqzmlT2IxbKZ4gZfJPUKIaDNzEyFg1wUrzRwUyc/VDeyXJcdHrQLyWQG?=
 =?iso-8859-1?Q?hbyfyXEcg4+70+bM4Pn9dL4HA++6g3stRvkLK3uywv2PoLFj8uRprA8w?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54934311-28d9-4d81-fc33-08d9ea21fdd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 10:09:56.1537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TyffsC27oBBy+cvhjtLQeVFMGPd026Qi9zTvJASEbsrk/o/zSxcikQ/A3wLrT9ncswW0HDHWj+e36AJ8phS3gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3145
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 4/5]
 configs/snps_archs38_haps: bump kernel and u-boot versions
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
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey, all,

> Bump versions:
> - use U-Boot 2022.01
> - use Linux kernel v5.16
> 
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
