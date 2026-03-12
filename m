Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAB0FED2E4
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 08:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6881884B22;
	Thu, 12 Mar 2026 08:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WACmCo7cdFr3; Thu, 12 Mar 2026 08:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D03F84B95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773303302;
	bh=4zt5UpKDhUu6BLgHjnh00ra/rhiTnwSaPkf2Gjs5og4=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pN7EfgjEiMlShhMBo28pU7wBknoDxBKhIVpitSfHhGnGysWvYCPInTTsLLIOi/Hz4
	 uD3SjpN3+SVZs4ItydD+7PFhhgnEjloY+9XyBs0v5BnIfUZClslxZlVBzVJicb3JdP
	 fulT7SiZDDmtPzwRcbaLsyGHdCkvzFUlHXsUe7gI1ve4QmeOSHHb5I4zqgxYJ9HNx9
	 h4PYshNkOPFE8ISILYhd+BsSD2zcl1tUgGoeqhEIp8M1qMU2KhYQhmvN59+zq8os8C
	 rJ/ovD/rCfRuKFEKMIX37FdWAZ4LWszBl+dVrkj2UEwLGW1BZoUJ63XOPztxZh91h+
	 Te7xE+76DzeYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D03F84B95;
	Thu, 12 Mar 2026 08:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90BC8282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 08:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8245D4009B
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 08:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgZqMPKvPm6N for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 08:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=jimmy.wesolowski@mobileye.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB85140059
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB85140059
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB85140059
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 08:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjNPfDTcqigavCrX/prZlS/JLjWTTVy6Dp5Fg0uskyQpW4rczQLG3dvf+2+hzX3l7a8JNvTGVKGtCzAXJfLvxEzrlbzpQUpngVEKWdHEeMJxsCCOsPGzaa3rNZ6ukb9fSLNNWbyj/lLSSLPCud/L4RhXL9a7bWBDWj+flg4gMYiv1B3OGrc5uZCIGR0FrtmiltOGp8dwA/25Qr2sU/Jn8QXTwWtYDhTT2Daspd95rpdSk1OXsCdVkUV+AjUnqwUG7Nf2oRCOh4naIrNoWLxfHcEYcPBVdcGMneaRKEzmUGSUG6VaEkcRV8u7sx0wVU9nntnJH9szPqZq9W4OieP7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prL5GMzddaRyYDNkDrubzl85ZK4AhI0/axcr4/KRUaY=;
 b=nrDcChMRfVhdufAQEbrjgqaK5+NPr+yCbch7dI9s6mYAFfc43xEYbCHhxTF+q8A0rWzixtGK3ijLxFAPTdpANKKOl8Qcd6oSA1nKfncyJ5e0BCviaTiQZHa57xFD3GUiMfBLo4KOEJOu2YGkWM81rNNfHygq4jVJg4MZg8Ktws8EQyx5hTva5t8bDazVvMTA2+S48lqFq5xFZIH/m0RORA2gfnn8GMM4lbuZDFOWGUMNqJIRggPbTAf8fXU24vD6YBwbLuvPvJMC1Z8icyL21aZ51jqZJ/wvo8lZwC8F4lNKpeksYl9GCVCFoAqeu/3h442/t1gN/U7YBxM/pagkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com (2603:10a6:10:2a7::13)
 by AS8PR09MB4534.eurprd09.prod.outlook.com (2603:10a6:20b:290::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 08:14:50 +0000
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f]) by DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 08:14:50 +0000
To: Andreas Ziegler <br025@umbiko.net>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Guenther Harrasser
 <Guenther.Harrasser@mobileye.com>, Chris Packham <judge.packham@gmail.com>
Thread-Topic: [PATCH v4] package/coremark: use USE_PTHREAD when possible,
 allow custom CFLAGS
Thread-Index: AQHcsX05GWN/nkZ8PE+vo8ltN12GtLWqe88AgAAQ42c=
Date: Thu, 12 Mar 2026 08:14:50 +0000
Message-ID: <DB9PR09MB4987B815ED04AC03B664F8B1F644A@DB9PR09MB4987.eurprd09.prod.outlook.com>
References: <20260212110116.2451538-1-jimmy.wesolowski@mobileye.com>
 <20260311173338.167112-1-jimmy.wesolowski@mobileye.com>
 <0692703c261f86d7f708093b729ec3a8@umbiko.net>
In-Reply-To: <0692703c261f86d7f708093b729ec3a8@umbiko.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB4987:EE_|AS8PR09MB4534:EE_
x-ms-office365-filtering-correlation-id: d32b8c6e-1bb2-4b70-fd39-08de800f6eb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 6zirp1y0MjnoF01jcppAbZET3QWuCkoLTGE5XrWpGwJuOiVbaNTf/yIO8fVRMtsAZ0nxLlTEIlSsmt8F40gFh5iF4DOiG4zuub1E1rEg8cr4eIeWGHytcTd1kuJj9EbJJ8rsKelpqlTacGf3rbrgB02Fom24L64Ky9y/3Zy889ukzpKkQZbl3czQIUoMjf+Xe9h9rEYc2ybsiXq/BOKkOwwCk9faiWJ7iVtjx5IcyYTZjr314xI841kFCafRY5174VBeG7A9aJTb1t/+qB0k7EsGJ184/wVEM8CQahSSSEBpCmYX5fCo68Gz7ZJWUZuAKpOLwk3PdSFN5TzX5yNSGjQJrw+gkS64W6uRmBEHbyOGOlhAbT2gNf9b/YYFxJpFfWtk/Vg/cKzz+W+Un+4lxtiQ2RX7suQ122ScEjSqbh+lbtsvJuHtKyXOhsZmbu8wbMZz7L5tuSDIhrFazrx0YW+IWfXUOsfFGhUyY3F4Q7/DwGO/3a0DvXNBreMlRy5ztPY5Da8bgnX8BcQPh7cAB4pstICoWFgd8crBMicqftQkaonXGlgXxIAdNiZmUKEz2wo/pS9A8dKlWZ5T0rH9prGjS07nhH0nFhqHMvKLsq1+4ic/GMUZpQlDEEYYEjMXV9LDq1A7PjEbyHanVoeB4K/5kBGOm05VzkbKRmC4gc9h8jZcIfky8hXDvn9fz+2FUoiWNaxi5fi1IkPKtut+c+F2u0LRxgMlTUl19QjBwmbB7pwVbU5zbK+uZwRwwuugBYrZCb8U+paSwCllx/XhChbCmyXqM00LleSKy9CUHQY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR09MB4987.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WIncRlklFs/BptTcBBPQfKRWfZ625lFoHc3lfNQ56sjSzAXaKoMQGvZ9SD?=
 =?iso-8859-1?Q?HZmHIB3pptcea/Ni/aoRJlGFI7Si6HAdUOcUJ0LqId8ODe4YVE+eqCqS2w?=
 =?iso-8859-1?Q?n2CsTXlb4JsEy5G0OwP8IpRl0XGdj/DrN8wdCr90aGjLTBLabIptt4DJid?=
 =?iso-8859-1?Q?WA3d9GsqhMmptaafcTzZlyemrWaDnid8+ZtFlKbDX+x8v7jZLoXm0q/XpP?=
 =?iso-8859-1?Q?reUNiU0UUYHRmWy2qs8c3PYqCzTrKpGfKNc69i32PR3deVui5TfvGkQswX?=
 =?iso-8859-1?Q?QEXJC9IaJqCVP+b4jKXfvaNOU12e2f0fcT/rp63T7CdMO9kNgejJKMsH6d?=
 =?iso-8859-1?Q?Z0osG1h013znCPnSq0LZ3cn69eOxZ3Vvdn7P16kcnDHVcUQUyzzRgqKKGp?=
 =?iso-8859-1?Q?4f+jh4dVMIzPs2OZurTXw0oPL3NU/QOm2dm/srt12uFGI+kaFPpBHQvMNe?=
 =?iso-8859-1?Q?wunn605xE3/gtpO0hjkdbezKGWkQi6Yx578WCnc0TVSpmZrKl9stUjpo5f?=
 =?iso-8859-1?Q?E/RabyKYaTHMDWVLdE9ygpxOrizH6OTWXwoe6u1LjRX5zqssXriY4VR+cj?=
 =?iso-8859-1?Q?nB0TpxU2Owy/z5XJotQaRPAE1aXypW6kGRnXWrKHJKpuBDMaM7LBuMANep?=
 =?iso-8859-1?Q?WE4JuyiAAqbNvP8QVR7YNIQ20injozYnjsbNB90NIfk/HY44EB8GaG1cte?=
 =?iso-8859-1?Q?XWdgzo807O8/w+RM9n/G9MQ59BuvlkfZ6tpy6QWUBiemHo9hC7aownYZ9z?=
 =?iso-8859-1?Q?yjmgf5opZ5jU3kYpZp/jLd6Dlz8lzygSrrec7Lmo6DsloYlF2HYvz28kU3?=
 =?iso-8859-1?Q?8QtorZeBtvyBDTyAaeo/a/x20dYF68TUDTI11txdC8NgnxZ+yNXkENoJUr?=
 =?iso-8859-1?Q?KhwvbISjvO/3Xa/sfSmUDAZ3FhQ/5UVakIMgBxNcs4gsIN8cHJiDtFD112?=
 =?iso-8859-1?Q?SZJCScpwflcRkpmDeuPGCluyY52E/hE9UduNocUalEs+pISc1ZMmfrTVTr?=
 =?iso-8859-1?Q?FMVLbKuOJ2vtfSb9hxQDlmgaBzPV+Vw1JCP2WtrJpmFKlQ7dtjyFYKd76f?=
 =?iso-8859-1?Q?OO5cY+XDV9/8gdVKLnDxTefvzNVsKwoQ8ZVsxGTCPcS9ZgFvi4CNjDidPJ?=
 =?iso-8859-1?Q?LROixeUsomstNGQAB8nmQ8DJOdVVom+5jhhrrIgjUUjfTt4ORU5z2krI+N?=
 =?iso-8859-1?Q?y0AwqsBAAQk65atKl5B8btlMNMzkA7lJuNMG+4Cd7HjokctQppyM30EaEC?=
 =?iso-8859-1?Q?busMaJH7J0VX5jFdFCN1Hah4KnaJmy9C9Wq52u8ONvC0CCV6uF1WSibU0j?=
 =?iso-8859-1?Q?ABGUAAaj1Lf9RO1OsIBqT3pKJlGqtYOOYF2B3P6vey5Xt57Z42mBjGFnGr?=
 =?iso-8859-1?Q?kKtaqeVNY9BaEE1TMRuqzdUZLOfmWcX2y0YDQIn9PuImL9dotEP2DdECe0?=
 =?iso-8859-1?Q?ApSLTcxqihiqtspD9EStMXP0Mb6XwAbFc/VswYkg+u8j65Mo6J+s9Zr8Rd?=
 =?iso-8859-1?Q?nI1zVoo+803L6uAdgr1xt9+BnA7rXogjRjfJEBUTPg5asU3XvRR+BJUmWV?=
 =?iso-8859-1?Q?nciYAenOiRdRDSx9htj6QlDyrGRoTlHvJSEoqXKwvdSSy6eaSozN2JrFAA?=
 =?iso-8859-1?Q?6V6GSt8OGNfl89f/yCvoQ/b5Q47bFs/qghMwN1WRKOe63RawNCddIkN+Q8?=
 =?iso-8859-1?Q?D82WZpXFUK41h/YyWqL7btYT4iSaVSSkVU7vcKDndVFmrr2rmQk7O5/NJj?=
 =?iso-8859-1?Q?I4F3ZMUnmAew18fGPmq5vDCRBQ6lpGBVpCRNizFViQhJJl?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB4987.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32b8c6e-1bb2-4b70-fd39-08de800f6eb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 08:14:50.3138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPklzpKSSNkGXQfLtyatIJ721b/pmU23PgoQFX5ovp3o+esIGHdKcGTwBeq9YTmqP54xII9uEy+9maX7oPSyjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB4534
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mobileye.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=prL5GMzddaRyYDNkDrubzl85ZK4AhI0/axcr4/KRUaY=;
 b=ipl2Q96HfA6PcgI97MLXA9D0Q1RGbZ070y9iV6lteOyJb4g3rXOtAgcUf7yc9nWxdkiF6ifv+bO0P6VccP4igaxy3SjPPKlAnxgpyCGtTuyS7R9t6NKbR8/nMpf7TiKXvBw9DTvOR3UjCKbQ7v+DNk50dGh/433R1AYx1ITk4wI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256
 header.s=selector1 header.b=ipl2Q96H
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Subject: Re: [Buildroot] [PATCH v4] package/coremark: use USE_PTHREAD when
 possible, allow custom CFLAGS
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
From: Jimmy Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas, ALL,


I am sorry indeed.
I realized that having the `-lpthread` in the custom flags did not make sense, since
the `-DUSE_PTHREAD` is added automatically.
I hope it is the last change for this patch!


Best regards,
________________________________________
From: Andreas Ziegler <br025@umbiko.net>
Sent: 12 March 2026 08:11
To: Jimmy Wesolowski
Cc: buildroot@buildroot.org; Guenther Harrasser; Chris Packham
Subject: Re: [PATCH v4] package/coremark: use USE_PTHREAD when possible, allow custom CFLAGS

EXTERNAL EMAIL: Do not click any links or open any attachments unless you trust the sender and know the content is safe.

Hi Jimmy, ALL

Sorry for another iteration :-(

On 2026-03-11 17:33, Jimmy Durand Wesolowski wrote:
> This passes -DUSE_PTHREAD to coremark CFLAGS
> BR2_TOOLCHAIN_HAS_THREAD is set, and allows passing any additional
> custom
> ones defined in the Buildroot configuration.
>
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
>
> ---
> Changes v1 -> v2:
>   - do not add mips-i6500 through a patch, but copy it through rsync
>     in POST_EXTRACT_HOOKS (suggested by
>     Andreas Ziegler <br025@umbiko.net>)
>   - allow specifying a port directory to use through kconfig, such as
>     mips-i6500. The default stays linux for 32-bits architecture,
>     linux64 for 64.
>   - allow passing extra PORT_CFLAGS through kconfig  (suggested by
>     Andreas Ziegler <br025@umbiko.net>)
>
> Changes v2 -> v3:
>   - do not include the mips-i6500 files as they are redundant with
>     the linux port. (suggested by Andreas Ziegler <br025@umbiko.net>)
>   - fix indentation in Config.in and coremark.mk
>   - drop the ability to pass custom port (no longer necessary).
>   - adapt the name and description of the patch accordingly.
>   - author and signed-off-by reset due to patch significant changes.
>
> Changes v3 -> v4:
>   - add -lpthread in CFLAGS (since only CFLAGS are used to compile
>     and link).
>
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> ---
>  package/coremark/Config.in   | 10 ++++++++++
>  package/coremark/coremark.mk | 14 +++++++++++---
>  2 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/package/coremark/Config.in b/package/coremark/Config.in
> index f0e13eda63..2f3b6f9551 100644
> --- a/package/coremark/Config.in
> +++ b/package/coremark/Config.in
> @@ -6,3 +6,13 @@ config BR2_PACKAGE_COREMARK
>         used in embedded systems
>
>         https://www.eembc.org/coremark/
> +
> +if BR2_PACKAGE_COREMARK
> +config BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA
> +     string "coremark port extra CFLAGS"
> +     default ""
> +     help
> +       Additional CFLAGS to pass to CoreMark platform specific port.
> +       Any additional flags indicated here will be added to the
> +       CFLAGS_PORT variable.
> +endif
> diff --git a/package/coremark/coremark.mk
> b/package/coremark/coremark.mk
> index 9ea8693e71..38d8ce99ec 100644
> --- a/package/coremark/coremark.mk
> +++ b/package/coremark/coremark.mk
> @@ -9,14 +9,22 @@ COREMARK_SITE = $(call
> github,eembc,coremark,v$(COREMARK_VERSION))
>  COREMARK_LICENSE = Apache-2.0
>  COREMARK_LICENSE_FILES = LICENSE.md
>
> +COREMARK_CFLAGS = \
> +     $(TARGET_CFLAGS) \
> +     $(call qstrip,$(BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA))

Qstrip unfortunately removes _all_ double quotes from the string.
Escaped strings, as in

BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA="-DUSE_CLOCK=1
-DMEM_LOCATION='\\\"LPDDR4-3200\\\"'"

(entered as -DUSE_CLOCK=1 -DMEM_LOCATION='\"LPDDR4-3200\"') thus get
mangled and confuse GCC. Running the string through 'echo' works, it
just removes the outer quotation.

+       $(shell echo $(BR2_PACKAGE_COREMARK_PORT_CFLAGS_EXTRA))

> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +COREMARK_CFLAGS += -DUSE_PTHREAD -lpthread
> +endif # BR2_TOOLCHAIN_HAS_THREADS=y
> +
>  define COREMARK_BUILD_CMDS
>       $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
> -             PORT_CFLAGS="$(TARGET_CFLAGS)" \
> +             PORT_CFLAGS="$(COREMARK_CFLAGS)" \
>               PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
> -endef
> +endef # COREMARK_BUILD_CMDS
>
>  define COREMARK_INSTALL_TARGET_CMDS
>       $(INSTALL) -D $(@D)/coremark $(TARGET_DIR)/usr/bin/coremark
> -endef
> +endef # COREMARK_INSTALL_TARGET_CMDS
>
>  $(eval $(generic-package))
> --
> 2.43.0

Kind regards,
Andreas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
