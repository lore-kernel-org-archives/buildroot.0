Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CC0C5DF6D
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 13:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D276D80E47;
	Wed, 19 Aug 2026 13:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9FooXSyPI8j; Wed, 19 Aug 2026 13:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787147082;
	bh=stAXTwDlTmWEANy5szlwsUnCsRbuqCN5gLiDh9KKvCE=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G8kKiAu9+3gz79ZBFqC1pnJmQM/fHeC53mSD1G3zTtSfogNkvH1ljMEVHUqKj5K0E
	 lfxuYB204Wl2e4XaLAcE8zC1lmzuYO/ZnzBO69o05cBuPLd3pcJByCWdpkI6EUuMiD
	 6BTOOc8fSmZKgAOIvE90T6pF4otiJsE/vFFjuMCehvmRKwPueaurBFvjB5dd3xpqPt
	 nXaYTSs6LgF1VcfNbt8VEoBAaQ/w/7/CTHHEMPX++xkV6CBM0HHlFGYkH8HNQW7Ujv
	 o+QLnl7vZ2ydyJ6CVXV+q//8Ql/pAnn2MxMsCX8NHAFwqPrdPFr166UfsEAjLEx8gW
	 1G2h+pOZGK9yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9F3080DC9;
	Wed, 19 Aug 2026 13:44:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13FC229B
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 13:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05D0480DAE
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 13:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZvu5ZhVvDv6 for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 13:44:40 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::606;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=a8kvYE7P
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0606.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::606])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED86C80DC9
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 13:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=DeacjCVb3Xm40AUZkuL0pOi3JXK6P16RY5zQ6TO/7s31VGY5Uu93DozX5EbJ2INSBOYvVLbYn+lwbqVb3F6kPwkp2ZptwGDCoHq7pFRTsheDmf+GLhBp+b0Jd2ylZ6oFe1WaY8vVOn4Jn6DGJrSX9GRvub/AulwUBZ9BD7SV4ahyOEKWoQQ8lDHvWGkmVE5TIPE/wCYLm3I4OyS/ilhOdnh2O2tMMN/X+6SkfXPnxWG2kDDPlK+PB5553qOcVNp4gmeB8OrcxWh/LM5yuLGvEvO/FutylGRF0nfGfWTJVG5hwdtnAGp0pFXNPErm+kBPahTZyQ1EItoZ2/dhs6Fncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcyxT/rVq0jiaptuEobgHTf8PUgfJgKfpckLx8JO9Gs=;
 b=uGkhLDsaVlzQ/XcS4Wi33YHAeNDSVZWMOrPPt5qj1nilzVxBpPlXbFnUYTvpzBJcMuJ4HC8auRKROpKyGVqPqtBcIxFtJKjBe3kdHc/RGTvXWLZkUBOmjv4HvmZ5qimQPm9gVn0gCqiHfvdiaBsRNdL//q59bBuLjfZTaWIHe9BFNnFnH/sRJ5+bEUe3MAvJPe5FQ4J8GxwOXIfrp49GdLvNmmYOZdTLLwI/35K4u85x1Iww6epsfmvKsX7D7n7oNGZAtBa2O9Ts0y5Br5p6f0po/B9lyW4tgqjcDyMuLMCcoQzta1e1R3tRI6noCzucZnyX8UvIWIeCmCVrqLjkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcyxT/rVq0jiaptuEobgHTf8PUgfJgKfpckLx8JO9Gs=;
 b=a8kvYE7P+39FhnCgLyml/EIafItZS6cYOEGJC5ez01Yw8GJd3mPpd17KkZxSjmY9rFDM+ogbLjIAgFcuKuqihTGebUsRVt5RxvE8pNDUeTCSfGjRqtGiEnEqu/hGbtnEOwVb8Za7OCoi7FfFrwxga1Se4faBqWXdnJCuN3YNf3mnL6bHzWzHzvP0RwTeHp9tZn6CDpPKDz2miF1KQWmzMkEhPmR99MvWashITW6Vuq0zRV/v9uHb6lImKQ9W9M7/pAhAD7A/TkBdg6qzURBngKeD/wDo9hGisfJgPyspLT2dp/TRxwTZZoUDIzKWYpkPbofWgrt7HexOhg4t+G6CQw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN8P110MB2436.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:4c0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 13:44:34 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0315.016; Wed, 19 Aug 2026
 13:44:33 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: "yann.morin@orange.com" <yann.morin@orange.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Michael Klein <m.klein@mvz-labor-lb.de>
Thread-Topic: [PATCH 2/2] support/scripts/size-stats: properly assign
 pre-compiled .pyc files
Thread-Index: AQHdL+DeAboouUzIYEak6xY7PtCvTA==
Date: Wed, 19 Aug 2026 13:44:33 +0000
Message-ID: <PH1P110MB16031631D241E9E2C84C0CF49FA5A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <cover.1786368449.git.yann.morin@orange.com>
 <c45315df9f1084fe0f6f932e1523cfa9c4e6d992.1786368449.git.yann.morin@orange.com>
In-Reply-To: <c45315df9f1084fe0f6f932e1523cfa9c4e6d992.1786368449.git.yann.morin@orange.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN8P110MB2436:EE_
x-ms-office365-filtering-correlation-id: e89b6fe2-b187-419c-7f79-08defdf800b0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|41320700013|38070700021|6133799003|56012099006|4143699003|5023799004|10067099003|22082099003|18002099003|55112099003;
x-microsoft-antispam-message-info: 5IRRHEbo+g0B23xgoBRwwe/iECaEsXx0r38HDdt7XcUDTcFLy5jW8jP5Wx1Tq9xKAs43wPiOl1fSjVkPA3O2IYh7FyyHyKS1RciTFBVQk899fcKbanGosj6OORHAk5QDd8nUmZA8ROVEcuYHhHj20u583fZXjPgj8dB0lUnk4PwFO+U+6MzInYCU6XvdSe9P+Nh3AqpIVMqnk5kzmH9O5+8l8/mZuf30v7K27p4D38YzhfqG7ZyS9xOrQ6nMW6BpLJmbLZ7YSsY06BsMw9zASRNJ1O6jboY6ynFvFeHQpSr+pCwJP9wWHFgvVKBbRUdZebge8RSAglFOSnzbnGygGAP7BexljZoaITNRCFiZi4QC7dM5KLuOgTS02600O7IhdYIxmZVl32Epeb5nnumDUXk3SJAPRUyyhYFEKbw58xNAd/2QEViYc+iU1rLkbeQgu9Kzc89HaphCZFCDPuDn9bLY1G8OnxJ9qN76lTB+LxdNfQdfJQ6AFyznyaQ8HOqChvrwf63fi3SAhljcQOfmU8gx0HaEi2JXckmxCYACvmhhOsCPziKoswzBbTrknv9w0u6AMXfyx6YWeeVu+p8sdOnSJLf0ckkEtMi5kXlZT2xj+hSWmVxRkQ2hdytVr7RSwSTiz8mMyGmBRmoPvlt/lwbGR4Skzuir9CcTrHXCMN1zez/zL6bwxkMNqJQmawiMnF4gZ66k/DY3uuzBf24bO/9JSSZN2ZuGYPs9cLUPV9k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(41320700013)(38070700021)(6133799003)(56012099006)(4143699003)(5023799004)(10067099003)(22082099003)(18002099003)(55112099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dbrw5XM6h/OhPV3tGwgD/CI9j0QlNEEbnsYuAvovrNVeQWnzJvp9sYmxmaFM?=
 =?us-ascii?Q?cvtw8i0ioWRVJ2Bb0D91KOaf2U7hIGDhGiosA3zFdnkek2FhCuDC1XYlzb9A?=
 =?us-ascii?Q?WeDp//ihMeZEtWKCVLgudTmmBlSSTa4yDYpyDUWIwm8qmbcF3ctDn9MlhKVF?=
 =?us-ascii?Q?O+tyehX74sgPAvGNtYkraYQ+Py6z6UtKX2O9+eds353t6KmHFhmzexFfNRoQ?=
 =?us-ascii?Q?z5fIG8XTBPUjMf2C+S2VS0Mxl/4IOWcnR8gEWD+7j5PED1JQdJD4JFgtaehV?=
 =?us-ascii?Q?Pb0sn0wGfZ+2aWhEc1zwuPs3QuWIGIvG9y0sOnJ8Qw8EzTVtMY34XKx0oIl7?=
 =?us-ascii?Q?z7S7FQvMUsqPEvgdTdTQMAqTiDifrfXs7tIyDmiw+K3dL22MaeX3iM2Z4DKg?=
 =?us-ascii?Q?WOeanp6mTL0BMddOpb5W9wsTA/hJmGvHydXmrjuRvf2QSKeBd0vFB0j+pI+V?=
 =?us-ascii?Q?eE7ifPdSkqzHE4sHrreETLCGCnDScR2qJsLjCbXkvN1f71/h+CiP2y1k2tmE?=
 =?us-ascii?Q?r+vMPeMcui1Baai8nT2Opf0L4ThyomrJ9G6YidSQZ4TmtNg0aNs65RlWTvyu?=
 =?us-ascii?Q?t2MY6kXpiAxww8s9E1ulF0seTz6vpmqxFmXuqZoE4xM0gB5whYvcUabl5wwB?=
 =?us-ascii?Q?lycmPsbS9bX3Fa09s9WtsmmoDMn8gI/4DAgP0euHKlxfMWWCJLoAkMu7asDl?=
 =?us-ascii?Q?T4lYZt2X0x4lbS4Csp8qRj1m5vT5hejWpJZmPsAgS/8kix3GIASdLcHNwP6F?=
 =?us-ascii?Q?1L17wstLA9/O9umx0tDsLPN6m0b3hPb/Y3IzRZGWSo1yL173mue84SPMZ2Xa?=
 =?us-ascii?Q?/FM9moKftyBvTmDl/c5ZcfqNzLOZtp8bvQID11Q6XqRQ2GoPnS22qf/250Ld?=
 =?us-ascii?Q?VV99CDlAgmr1bMaWLInkyF4DS4ZemOkHaqL8lpac3Y8YaM0YOHZCHLNBRxJ9?=
 =?us-ascii?Q?A59D5MJb5O4m/D5XU7lDHxlkOqZe1jqMmD/lX4iUmHxzmz+ysXgkbyYvuL0H?=
 =?us-ascii?Q?E3G8w7MhiNTb/ABdTbeh8B/8iYDV3yRvqCEdaRhDsc3W4Tj2VtIFpG3O0LDt?=
 =?us-ascii?Q?6KeHZRBoTFHJn/Lefehi9+f7ffAW2HHYhGnxkqOpvZYhcmGOyA4UW9Hk91UV?=
 =?us-ascii?Q?YYiwTIIkjYUOvK6ks4iTejRxXN8YnOMpTH3jDh31MsuBAGp/gofsowXwG2Se?=
 =?us-ascii?Q?mcfeXHi9yozq74zx0FnzU12X92kgR2kfE9rkjSibIYEjvUEQ+dPvnY77UlLB?=
 =?us-ascii?Q?QOMxZBCWMBZDQeFJDVsEJr0WO07Uw5vp15Mk4Fqds9JnJLHkUZB8MODxpqxH?=
 =?us-ascii?Q?wNvGAhN2dsTXdR43AaBwU6Nee0JKw58H+NjYrln9aqSRDvLJWPhGE4MQDwBt?=
 =?us-ascii?Q?9yRCfHEIwjjJBW9oaTlZc+Uspj4Z5lfpxhWgojUYDhSiKpq9j9Oznm5JTpkL?=
 =?us-ascii?Q?yBokp8z1ceLAIkGnZu2QZGOKzmwOmUmtZ+gr9xv+xaVRi0jFQLgEdCpj002H?=
 =?us-ascii?Q?CYWqDFJXFj1504CyHDsU3hFneXk7DXKlAz7hsqI+cPUsamedYPMQXzYmh92j?=
 =?us-ascii?Q?F7gcRF4JxXKYzLGfGViucbm4ksUn/+x1LbbMmjLcxAQl5KWlCwev01OlRcz9?=
 =?us-ascii?Q?H6HijKLJb5RwHlNCYSpAT8OA9S9wrl0YKkbqNOYW/Y89?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e89b6fe2-b187-419c-7f79-08defdf800b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 13:44:33.8083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8P110MB2436
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/size-stats: properly
 assign pre-compiled .pyc files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann,


> -----Original Message-----
> From: yann.morin@orange.com <yann.morin@orange.com>
> Sent: Monday, August 10, 2026 8:28 AM
> To: buildroot@buildroot.org
> Cc: yann.morin@orange.com; Michael Klein <m.klein@mvz-labor-lb.de>;
> Vincent Fazio <vfazio@xes-inc.com>
> Subject: [PATCH 2/2] support/scripts/size-stats: properly assign
> pre-compiled .pyc files
> 
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Since commit 3fed42456693 (package/python3: use the provided pyc
> compiler), we abide by the PEP 3147 guidelines on where the pyc files
> are located. In practice, this means that, for a .py file /foo/bar.py,
> the corresponding .pyc file will be /foo/__pycache__/bar.pythonX.Y.pyc
> (where X.Y is the current major.minor python version, e.g. 3.14).
> 
> Add support for this layout in the size-stats scrip, which so far only
> supported the legacy, pre-PEP 3147 layout of having the .pyc next to the
> .py.
> 
> When we associate files to a package, we only have the original name,
> and we must construct the associated filenames. For the .pyc, this would
> require that the version of python be passed to the size-stats script,
> but this is not so nice. Instead, just scan the pycache directory to
> find the corresponding files. This is not much nicer either, but at
> least the wart, if bigger, is in a single place that would be easy to
> chop out or rework if need be (e.g. if we need to add support for more
> similarly target-finalize-generated files in the future)...
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Michael Klein <m.klein@mvz-labor-lb.de>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  support/scripts/size-stats | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> index fdcaeaa546..9a0aafbf2e 100755
> --- a/support/scripts/size-stats
> +++ b/support/scripts/size-stats
> @@ -77,7 +77,23 @@ def add_file(filesdict, relpath, abspath, pkg):
>  def get_associated_files(relpath, abspath):
>      # also check for compiled .pyc file
>      if relpath.endswith(".py"):
> +        # Legacy .pyc next to .py
>          yield (relpath + "c", abspath + "c")
> +        # PEP 3147 layout
> +        basename = os.path.basename(abspath).rsplit(".", 1)[0]
> +        reldir = os.path.join(os.path.dirname(relpath), "__pycache__")
> +        absdir = os.path.join(os.path.dirname(abspath), "__pycache__")
> +        try:
> +            for fname in (
> +                fn
> +                for fn in os.listdir(absdir)
> +                if fn.endswith(".pyc")
> +                and fn.rsplit(".", 2)[0] == basename

It's not an immediate concern because we don't have support for it (yet), but there are multiple optimization levels which pyc can be compiled for (1-3) [0][1].

I think (untested) the current rsplit will fail on an optimized file pattern and we can be a bit more future-proof so we don't accidentally run into this same problem again?

Maybe we can leverage `source_from_cache` [2] and compare the file names?

It's probably overkill, but I think this is one of those easily overlooked things where if we did add support for optimization levels that we'd miss fixing the code here to account for it.

Anyway, something to consider.

-Vincent

[0]: https://peps.python.org/pep-0488/
[1]: https://docs.python.org/3.15/using/cmdline.html#cmdoption-O
[2]: https://github.com/python/cpython/blob/20e6c2fc7c174342214d561845419c4030f8638f/Lib/importlib/_bootstrap_external.py#L299
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
