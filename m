Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE1DC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 19:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B3784048D;
	Mon, 24 Feb 2025 19:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yysy1EpZsCnY; Mon, 24 Feb 2025 19:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 486CF404CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486CF404CE;
	Mon, 24 Feb 2025 19:06:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1908294E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0711E403C7
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjiEyoM006kN for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 19:06:48 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::62d;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B334B404CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B334B404CE
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on062d.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B334B404CE
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 19:06:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=o6HBY66zOYffP5PhCtmgdM5dctx68yC+JbY5bo6KOmtZ1Jtzvd3Tawhevu2R4MQpX9aagGdRMfdzkdTpcY1WNOAaVInN7hMbDUPEE0DB25uzoC2gWdeGIw9v4EPF2pSeVhgTTKixqz/IvHiqq4Z30RSnd7nq3i0XwJUJjyN/SXrfxbt7DtSNZxZUwq8pokf1afSpt6czm32p6rlHfMHFayulTGcvD0rw1Xnz2QpkQhGHEnt10029hpPQt4Wk6JmLpV1Y6v9zGvdQAecbn7c2VwaIiGP3UWAe6uhE0SG81y8aEVYJWIKBiNLRaEvYw0So8pCR5jxp/SV1EIyAvIOo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tzfGvBvy5JiUMnDJcN/m6Yxuc+FpVfhiqPsieZJaZU=;
 b=X5TUKZrVyM3UNG2zE6QXAudRTrzFLPIDdlBK3XAdQvHdKF0BZ8EYiiZB5COXV53mMTDwQk/qXjFylFCZ7vUe5YYGD5vYVY5RQjf0NzgaLjDoSdG9Auc+73V6m6wQbTMhLjOnfk8Txfpt7VP73RdWuBlIi59q7t1mS76LCOM4hDXIChv535foJX/rFnNjLFGRclhgwQE+/qOagzO/vvkr/7qmgO5bssmebaXhMuL1ipzc1Bz89DGhq/JfhCrFXvw8f/ikqVlYBgHxggkcHmsT/bL2t9Jld0Vc7o2g8PFiI4PWUaYROm3k1W+CbZYygE5pP3w8TSiDV2247lRaA00QRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB0988.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.22; Mon, 24 Feb
 2025 18:51:48 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%4]) with mapi id 15.20.8445.022; Mon, 24 Feb 2025
 18:51:48 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Vincent Fazio <vfazio@xes-inc.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/python3: bump to 3.13.2
Thread-Index: AQHbfxH1ymT4W0FWa0+Ea/EHdFC6EbNWz+9A
Date: Mon, 24 Feb 2025 18:51:47 +0000
Message-ID: <PH1P110MB16032D69F83AF15DD926F5C29FC0A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20250214185452.3820300-1-vfazio@xes-inc.com>
In-Reply-To: <20250214185452.3820300-1-vfazio@xes-inc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB0988:EE_
x-ms-office365-filtering-correlation-id: 70f8338f-bcfc-4e23-3187-08dd55044ad9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JvobY8ZCFEdiI/HEt7Y14TeWCcp2wbfJX+1dy0DIZGfVPTe4bIlCc5cObpa7?=
 =?us-ascii?Q?/g12aJDfBTW5nsDD/aS6Y2RSa0/HWUfpELpxFZ8a0mVLh/zVgSVuMbn6jS+9?=
 =?us-ascii?Q?9+FmCSajS+e3JI0E8hErRNQCYrDNER653KNLH/VlY+7aH45OYmeW9pqbsQAc?=
 =?us-ascii?Q?GXHS9P6QLq2H0caHzhE40R3yHIuNV6mt01iDXByE4HDUAU0x32D6x2HM7xz3?=
 =?us-ascii?Q?9CO2SNlwneoaf7pISW7PDsasBeED7yOdgqUylIFab/je5LzaUIogzVqwGaeM?=
 =?us-ascii?Q?DvBB/OmcKraD3aanF4x8ZlU4JXhZcpUQhDalBEs6RE6ZZn3MvD42pEbt2N5b?=
 =?us-ascii?Q?U01Mpy5X7ZNQo96m5LCCBbw6BtgLRhvSsowW6RGmsUTVY9vKjAScomHAgkzz?=
 =?us-ascii?Q?pO5rPOaF+lUDeFeDjOgesFaFiyRAeDO1Q3uqzyjpHbA35LojTnMu4V50U0Wl?=
 =?us-ascii?Q?0Z7OhHJ9SQF/2KYGBzn28GlsQQrkYUtNHOTH8CtEKvlnEfkT6JaLjhhR7FRI?=
 =?us-ascii?Q?LMIThjWtddx3JUpebuNPQ1llwtRbz+uOTZ49ipgHsXygD6Pr4lnxs3jrrk1f?=
 =?us-ascii?Q?k7MRnw6caEv9A7fb/r0dXl8ykYTdfepH36wjC2ZRVPwr/xCD98IlYKmZqXDt?=
 =?us-ascii?Q?OP6oCE/bFvFviDPJC/RA/or2lp0hKqE7C/gS77eLQ/Gg4aXFM0R4VsVheKTp?=
 =?us-ascii?Q?/PRumGBUj9sgHuHLWWDcPVG9nIb/Dzoy1QL9/H6DpYA6WP5v98i//bzJ6d+o?=
 =?us-ascii?Q?/p8CArE0prZbnnvObWG2cjLfOzcQbA3h1+y2vuONah92Otca+kYAQ9XJD4Jd?=
 =?us-ascii?Q?oBO0vucWr5/X8MrxRIzuMlvasuj1HpTgog3cfcZzOqVROj9Cis+7GETAbHoG?=
 =?us-ascii?Q?w/9LBxqGkVPcw0FEof1FRUTBM2z+HbQf0ahq3MQLBO24NfZDdeDez1Mu7dDH?=
 =?us-ascii?Q?suE/unw4N/0nxwQEFpUC0cZX6Xrxlh+fcIAR/gT1KDKGQBWzVikWKYDxKvfn?=
 =?us-ascii?Q?Ilp32oabsA5sqLW9733o5XuMeCwpGJLkWVbDHYNP3ls0NakAvFJY/UR3woH7?=
 =?us-ascii?Q?yXAnK+K/OH2l8Ev4gVwdBZL7NWR//Q3ND1WDcNb2bEz2Kg6eq1DEOrw0u/YN?=
 =?us-ascii?Q?7vJ/Rhtv7yseR6mdjU0OscelCU8UQXnpcgbTqmHVNIb4aM+lUV9+xbXdVdhE?=
 =?us-ascii?Q?I2vU0ihY0ILf7Fa/NVXgXcqrSm9vtNps87oqR56rG8ZFASPfh/A1L4lrcRVF?=
 =?us-ascii?Q?lnF+w6+aoe//JFHrB+O+rwXj7utUmz+VJmpMPi7EV5G9diTTig2I1+7Hca3D?=
 =?us-ascii?Q?Jz0hskgWsV9CWvTkP+B0mlCWUYt9GTJ9a9Ksj0HxocXlwTeWZQF5aoeNHUqw?=
 =?us-ascii?Q?qSK9c07yBhvzdirYjIDbIeIVOgJg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gOjAWnssF+x+T3Q7zAiFSpua+N82u1cVZ4aIH/cW7kcoc7oWiWNQRLTKgr79?=
 =?us-ascii?Q?jXsXipf2LwZ67hr8n36b3Yug+UbXh0LRYYZ5kCuvckaM68EF+1SSQ2+NQdwu?=
 =?us-ascii?Q?OI2jsnwmPZuppQY1iTIjZ0DzJgTcf7/9TJJnmxSvUUzEFL7jz5kaiDwC1JsP?=
 =?us-ascii?Q?xf8nvW+/Uj1/qmLps5r01zN5+MLF5N+AXilNLPrSs0y3gRfjbQr1vIFOyM98?=
 =?us-ascii?Q?Yah/dlEljbDieEcGvDODACfJYE/Qnl6tZxi0FRGe3XLxgJPFQTDT3tiLuLN7?=
 =?us-ascii?Q?DZOqN6d5FqPeU7b8sAMve/ntwL1qzcmUFpdtpiezh3n0zDef0mhs48qSAO4u?=
 =?us-ascii?Q?UYIg+5/ocb2Cp93yNz2IEx3Jzlf1jqJOcYVXcSbDqkcYBb0buXZFOcVqL0C6?=
 =?us-ascii?Q?0YIl27lGCoePnLhT22P+bR/nZogjdC0a2WzRS54Y9CgtrEyj1WbHzod/HH5N?=
 =?us-ascii?Q?82DkwIRcn6NsTcCTHBA/a7MfmzYbItwp6E7iVMWSfBr0pJwLSJ/at9UVYyg/?=
 =?us-ascii?Q?cMyhoWPkfN8NNsmfFwfKBGJMwLxZSwdbDoy3otPTixZInJZRHP7UEqQA2phv?=
 =?us-ascii?Q?T6GTPFfVg3+rW6Vqn++BtVhqNkK+PpVwhguWsb/+sQMHUnK8okTAeOQSyePS?=
 =?us-ascii?Q?FykBWZN8NXnpT2DFTegKeskErKmeNdFVIdJ+Fp0y6ULCwY0KQdNcFjkkwkW7?=
 =?us-ascii?Q?edJ+2yJB9CLJ2qj+Odduv3e0euxckj+qUwKoD03gUx3qj77ev4VRfm5yejS5?=
 =?us-ascii?Q?nlNukvkBmt2vYo+QGOzaBAaYyVq+0/QwUcqG2ibUFNuoOflLaZxpu7LSj48B?=
 =?us-ascii?Q?qGSG55CokPGo/WmC5My46tQwTqA9HQlAnXrDcxsM8idJRO9asWlJHbS6F8qc?=
 =?us-ascii?Q?zCkO8q2451eP9apthoa7VLZkCzSV3WzE10a9OdcR42P76J7f0pXxHniScyAW?=
 =?us-ascii?Q?A6wKI661/ONJT6I8R55qpimlrKfwAWzZQQqcMpXmjMtNXR0D1MnOlVq2vIHm?=
 =?us-ascii?Q?Dh9ZjwqWkrgxwPMLQ/BKtNDaiqB7kdbNu4oHwxBUFOuVQ4ZnGTn82zIWDBSR?=
 =?us-ascii?Q?Nw+wLzajz0/FHECaXauWw+lEm7sQboNfZJd/iX11isvVbHHVvAY4QMaLZ41k?=
 =?us-ascii?Q?zEovU4STQifX8uXw7Qyn26Lj0x6EDXiRoYV3O1ClBtf6ptvDfRuMm+2vEFC1?=
 =?us-ascii?Q?qiLaOVCRN/TLvrJjRCwfHN/1HJbUrsgLqfVBhuB7Vs62y2pqJ2F6zMoTs4nm?=
 =?us-ascii?Q?3Xmm+108YGB39vqQkHrtQ18KU7LKbrVBeEGp1xqr3N+D64/CUhTly0lFzWTT?=
 =?us-ascii?Q?L3kKyXwNa9gOozQwRS0OX2g+fUx2k69KC6/8x2LS/EC2qLTXjBsWYtuqCcua?=
 =?us-ascii?Q?uSkCId+1DRI8mUyAObPpLYp0MWQ3WfvbpwipIbQSnc5tUoG/ELw3aZ6NLrIv?=
 =?us-ascii?Q?saevx3X081BZ7C1A0tMQ20sqb75WtoUh7ujOr5F8Fz9LLb2CLG/Ut1deqep8?=
 =?us-ascii?Q?3gwjYwKvoB+nQWI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f8338f-bcfc-4e23-3187-08dd55044ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 18:51:48.0226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB0988
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tzfGvBvy5JiUMnDJcN/m6Yxuc+FpVfhiqPsieZJaZU=;
 b=upL/zN8+ODgtK/qpgIjC9mmGvgYP9eRx+lJpSoA8j5hvkpQ20IkQkK0vDKi6BM3gZzRzFKHrZwB6qc8eDGZsaIvIkzQUHj0bevO56onEm/bfzxSsjhr6leOQeHd7JSuMISllmwj1gDxYGKNcVVAAbhUMkyU/TUtkurjjtqk6nDkSbdRR3Lz/svwNgkfUqcoEkjF81jgdxC2p4srhEhBv9Owu2Ry2KiKk5mYKVaGGaQLBgcfnklmARK+VqFH0/neDFMA/QT4PEigKDME6/vn0SvdsqLCYF+hW8ejQasqVNSWWI0sHK1EHgAvW7Si9LSjTlKYZjIPFPY9eZ/XMepINlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=upL/zN8+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH] package/python3: bump to 3.13.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Vincent Fazio <vfazio@xes-inc.com>
> Sent: Friday, February 14, 2025 12:55 PM
> To: buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>; Yegor Yefremov
> <yegorslists@googlemail.com>; Vincent Fazio <vfazio@gmail.com>; Vincent
> Fazio <vfazio@xes-inc.com>
> Subject: [PATCH] package/python3: bump to 3.13.2
> 
> Update CPython to 3.13.2.
> 
> The following patches have been removed:
>   - Quirking ac_cv_buggy_getaddrinfo on cross compile
>   * This is resolved by always assuming it's not bugged via
>     ac_cv_buggy_getaddrinfo=no
> 
>   - Disabling lib2to3 in builds
>   * CPython 3.13 no longer ships lib2to3
> 
>   - Fix cross compiles when host and target are on the same SOABI
>   * This was fixed upstream [0]
> 
>   - Fixing the MULTIARCH value for musl/uClibc
>   * CPython 3.13 moved to new platform triplet detection logic [1] which
>     supports musl. uClibc does not generate a platform triplet so will
>     not fail the check against MULTIARCH. See also [2].
> 
> There is one known issue [3] that may affect 32bit platforms that was
> discovered while testing on musl libc.

I have a patch that should work for this that I will add to v2:
https://github.com/python/cpython/pull/130391

> 
> [0]:
> https://github.com/python/cpython/commit/909d5ac2959ea88e1d3b38f356
> 76a1c7e5dd44f6
> [1]:
> https://github.com/python/cpython/commit/c163d7f0b67a568e9b64eeb9c1
> cbbaa127818596
> [2]: https://github.com/python/cpython/issues/118942
> [3]: https://github.com/python/cpython/issues/130115
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
> I have run Buildroot's suite of python tests on glibc and musl. Both glibc and
> musl passed with the exception of scipy/numpy tests.
> 
> The uClibc tests are running as of this submission.
> 
> While CPython has no advertised uClibc support, tests are passing so long as
> libc is built with TIME64 support, which is enabled by default in 1.0.49 when
> the toolchain's kernel headers are >= 5.1 [4].
> 
> Note that the test suite is run on 32-bit ARM. Other platforms have not been
> explicitly validated.
> 

Most tests are passing on uClibc. Failures are largely build errors related to no rustc support

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
