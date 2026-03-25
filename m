Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781A0FEA834
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 08:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC78A40FDF;
	Wed, 25 Mar 2026 08:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFsCWzD9Dg6E; Wed, 25 Mar 2026 08:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECEEF40FE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774427984;
	bh=dkd5o0xX2nafvBx3sI83Mgf+KM7yidWSmBb9/pBjs34=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gUGdCZtjTKP2DoYc39Q1GPy1JN30BmQajuYxEtDOBIwMyFom0q0GPYdL3YIp1vxWF
	 ZSdD7oE/FqXnDvdpYZcCRGRNJbVKuaZM2VTL/ZMFLXiylQIh2DhjjZjd87kVxSuM+o
	 NHyGEMmNk+5nHyi0NinpHIZHeXkyI7XfChM6MA3aFJc/7oFCOTZobjRvxa+vL7Wb22
	 9Au9RHN4cRPLADNw33NmaiTk+5PEWLAiTy4/wBepjB26cfFSxaCnHXA0TTln0sM2vt
	 KxemjU/rbBANOYs0zCbz+QS7uUD+84Dv94dOn0AqxNcsJMppxchbDJOA6aAdLTv6Ht
	 mL6zSFMqyjSVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECEEF40FE3;
	Wed, 25 Mar 2026 08:39:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 117F3353
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 08:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB38A40FE3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 08:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahq7EVTxadt5 for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 08:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=jimmy.wesolowski@mobileye.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A74A40FDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A74A40FDF
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A74A40FDF
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 08:39:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaFOTQPWcRR/D2hSZgX6WeUnT0whACD4heCeMUdiUf1V/WB/TeIdSU5Rs3GCpqGMWPAZfjk7Zz2U5gO3Pr5WdxNQyOOmAGZuNJCIi1kx6q+7uJwZjhWtGBvG71/RpKVpBZgwACSHneIY9drsIGP2HbLjB9PH8mDehhS8NPWw7pfF7yfI0WOHoleeKjCyv8dfDoM83zqtf/MSTQQ1Np6eitNHXTS3R2Z1mA1bgdjarHc4np2D8fBBEffsmNgiyDhhImsfjWwGT4O15K/rf3/vk7xXuKIX2QzWFvUhPaSVUW1cI1oI/NMyf4ZuGoFMWJErf3m1hlk8goYFMl2CowzJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHrjcOEtKYcvEupOChcg1uMMOi2ooBFCl+13onUL0no=;
 b=RuRFve7Wr3oO2ZcTjjP5ga1XzbGJrQX/fAJGog3pt5Ahy2kTlI5kCnRmSukuI2BS77EuJlDtr4sKpC3EFk6/rKIkaWpuAJTCbLoovSrH31bDmnWqWOEaurudSo+FFycsxdsyyIOEsYeWEw5XDFgS6Xalxv8/Hx/xKTdZ35L3zegeey/FsCRS5LF1SX/Jkkzl2AL8m5CXIQQQcEKU9UTxyYzzVYUxqCwmZp7xKU4zZFlJ6mZnMtT9w2j55EpJktzyl0ALJ7kTWU7QeuEF3vqlYISSFr+4Ec6Fp2Dy5aEVs9amrucjp30N4OOoTISQRZFZ3fOqGlHAv5Z7UQK8tez+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com (2603:10a6:10:2a7::13)
 by PA2PR09MB7596.eurprd09.prod.outlook.com (2603:10a6:102:412::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 08:39:34 +0000
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f]) by DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 08:39:33 +0000
To: Quentin Schulz <quentin.schulz@cherry.de>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Guenther Harrasser <Guenther.Harrasser@mobileye.com>
Thread-Topic: [PATCH 2025.02.x v2] Package/libopenssl: security bump to
 version 3.5.4
Thread-Index: AQHct53yI+nMmF0fJ0CpenRn1kTa0rW8SjOAgAKsD78=
Date: Wed, 25 Mar 2026 08:39:33 +0000
Message-ID: <DB9PR09MB4987613996011559A9817448F649A@DB9PR09MB4987.eurprd09.prod.outlook.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
 <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
 <b4ab5d3f-e0e7-4c97-9df6-7cfd4ba3db9a@cherry.de>
In-Reply-To: <b4ab5d3f-e0e7-4c97-9df6-7cfd4ba3db9a@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB4987:EE_|PA2PR09MB7596:EE_
x-ms-office365-filtering-correlation-id: c4f793b4-fa85-4e44-5457-08de8a4a0a25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|38070700021|22082099003|56012099003;
x-microsoft-antispam-message-info: Mqj9acozORBd4ezSz70zNnpSEZu/7dqj9WQ9nC9Nqj0yyl7NI/DfVOb3EWjG+3DBAflnqDIHbIpQ2+aktaCFcOXHdnfgl/JjwPY7dc2KiieX+4xCB3eKfEs1aGkkg1Fy41bFtg2Gf1mMQfwqFfAN90jwtLzZ2s1GQ7puHcdbzTDIDSYusHCyyW1Tn5tt8TLoqzFsQLAyBuNW30BWQlHM51i6CEkXje5bdS/EpQ/J9drh8/rVWNeLsHee2qftOsMHB/53rtwPKUftiYOm5KyrWYEfy3Fau7BpSmhL4U4Nd1iNF7jZk8JZ1trXG6oAiMzDzDxrIQOZl88vPl4c8tnL8oQQEBk0vKx6qyUxl/uHDSjiW1pIJ2ZA0MpitN1ZGGjfyTV71OHAPHh837iVzz3zgxB87y87boDx1N47sfQtjUUU5WC5LYB8z7DN6IHF/O9PNXBUmnY0BD+A8zQRlbCfStgzfevUdoAZna/KLxjZPSbCbCmGYdrokTGnt6tnCrPWV67uMvk+ljz0PyyhDlWbD1Plem8sUWM835zjb0m4t4Cv+TKYUaV3TGxA81vNJEZJ8JFaoYWW4BKRqOrrcEG2InXKc2MNM/WAQeeO9EMhvAnnkdnvjJYb/RD8K1vhPf+zgtUcKXNbl/qSUIhLkejnToJvA01Bt4eZFMfQTSy1WxoVZ0y7ttn8j+THOyDLG4T+jLcjHKLIVX8MWL1DjHm6RbMEVI924zd3fINIcCYBpt/Q7vlKhxRbEcXNl4ZdyWw0057WHNHWucOGligKz6bSci7VzaEca+FBZH3QyXCQpxM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR09MB4987.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(38070700021)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?i3LeVF138nPMTXIAT3SfSs5q9nIV7mLk0Oq/IiMz2hHFfV34TrDTxkXI/z?=
 =?iso-8859-1?Q?NK7z/+HZ/9tVK91ye3ReMQTqwPaaFaWPu/dVMSaa302+NOjJZ93RbnKTVT?=
 =?iso-8859-1?Q?G2cPdOUdWeahUHteDOoax8uwgsKcw6s8Odb95Vcb2Z2dKux7wnwBKe5x/5?=
 =?iso-8859-1?Q?XYcZp3vy5jsM1/94jlxhexlXAkxPDQQBq6nJDtVdas3eKHEHBVhcEUZg3V?=
 =?iso-8859-1?Q?lnCYlTEk6n7wYCh71Ogy55yN56a2ruN1ST7Si/ivFdMPf2ARiHKr8V8qiU?=
 =?iso-8859-1?Q?W7CMS+PUBzJesImGYGcqYAOnFJRjnrf+Sg6/MQvdspzpov6GycHdO9pAVK?=
 =?iso-8859-1?Q?tx3bFddVgv7Adib2XjfFtus19O/QNleSYvownfnEetvkkNZVh5il1/76NM?=
 =?iso-8859-1?Q?EaFgm4cB0om1le7oyW5T5B+dzwV3zt/0+zTrnKNAXE07KaWJddwZ7hmxrb?=
 =?iso-8859-1?Q?MOWZLoyY8p3u+e+PxaqHc7YVsH169+AeOlqEvRzQN0qAVw+PuMrEzLs+b8?=
 =?iso-8859-1?Q?jaXoazU/i7PLLtuAOBYsGtqav3oAkvBD9b2gZBMAfdYavumr/UYp9wuHuw?=
 =?iso-8859-1?Q?RDaKyHNTtb2raSmfDVPMTndlg8qW6gRtR6YH+k4/lRzRimixQSE114YXI1?=
 =?iso-8859-1?Q?wgmK9oHKiLmc3JOXDcgkJBxCiDg3gtCCaen7LV6A49EImuJa0QDUy/XlC1?=
 =?iso-8859-1?Q?1H3hHM6kZcFlfUiMfLHO1X5TRCoe6q6mdrNOVZBEdqMW0OHOyrep8TVEVn?=
 =?iso-8859-1?Q?xJnpCVksFYBpt0KY/vex5W9EPbw6Yei7Sk0Ie9N4m5V2pgh05qdLHYH9U+?=
 =?iso-8859-1?Q?Tohq0c17CJ+kWAJianiEsdCvHiRQ8FFxKD1qm5rdkQnzFbXCW6a4CBKJuy?=
 =?iso-8859-1?Q?hD2HCuivl6RdekmeF03f4+90Talyj+F9xcLuJzvRsi24tuxpuBUMlfTFqs?=
 =?iso-8859-1?Q?PXgpZwvaxRO3TkMffOB4BusIBOy7iHWR7/VfAjzUWibo1n57agrawP1RLH?=
 =?iso-8859-1?Q?5x77DVuivItHHigmTNSggh1UVvYFQOc4FPpJdkmBw3sDTh18Or1Y9xMb2T?=
 =?iso-8859-1?Q?M7+m3L4xIOgRySeoYxorAEelKn/pFX0Bg/GwHa4zhKGM8n1w+fl6UzWuyB?=
 =?iso-8859-1?Q?7vcTa9peFkFO7zmdtLyhxlrWoOhWiQT0mjb8wupq5Na4xBfcgoLLz67mt4?=
 =?iso-8859-1?Q?xO0PL8JrTjwI5VfZBgYeEe4KMM4MXhU2iftZY+jdrqunst3l8Zpuev8rni?=
 =?iso-8859-1?Q?Kjvo0jPmfyh8K7lV4hisZCgA9FD077ckNoL7VekQ8+WQGSBq5CwDjXonvW?=
 =?iso-8859-1?Q?lG0EzdwsunxsFzUWGmnCizr03t/gqI/v+imlkZpznBhGe2RQE2bz2JBf9A?=
 =?iso-8859-1?Q?DxLHDqme/8fAn6jnI0Txdm34SyS2jfrmagGYHhYzUgeIFPWchXW+kqJzBn?=
 =?iso-8859-1?Q?BTw+cMwjvBXKKK9PVCaklolVS/fJZrgalZLe3C/wD5Iw0NvriG4h0GiJWv?=
 =?iso-8859-1?Q?BByNgay2QNVqDhmgIFiPA8Vc3FLRzOSheFDfbDYx7+x3SnC/lrU9TSY7W/?=
 =?iso-8859-1?Q?eeszu8qvrYR6lFcHEjXRJG9LOAP1rPMjYV5u7MKk1yDqOPKVlFX8/uHlzz?=
 =?iso-8859-1?Q?LqopQZzbzRSxvINSopvr1A89/TdsWeCdY6/kGnFN4rAtM6OqeIFmMF2vsY?=
 =?iso-8859-1?Q?qujXeKWWNWvAzcyssgVEc2x3WZqCHjicfAXnu1ZWrak3wi6TVe8HjAGxUA?=
 =?iso-8859-1?Q?a0qoXIPmGKysWV8GqqkB8WoimJWdsG7m5cYdngJTat0cOu?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB4987.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f793b4-fa85-4e44-5457-08de8a4a0a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 08:39:33.5506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJhAsv0RJqOha4vvS3yI/jFot1IfbqFEZCRirAyYd7zhogfrd8IPXnNW5ajCIAJdHyl6n953JBvwQE3xHmL1kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR09MB7596
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mobileye.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHrjcOEtKYcvEupOChcg1uMMOi2ooBFCl+13onUL0no=;
 b=PznEVa/mlyINIXZbKEAIrhk9y+64zvpvGYbuWui49UoX7RdrrveBc5xslk7fyaONnvyLNqH47BiXWf9pahxCQXFGR91Tzxb0ifd+eJNNEod2JUVj3TwadSaxVJdm8P1Bw5409XYNvfo0zusYmYwuVxVMqtArth/dMXwNK35+PGQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256
 header.s=selector1 header.b=PznEVa/m
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Subject: Re: [Buildroot] [PATCH 2025.02.x v2] Package/libopenssl: security
 bump to version 3.5.4
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

Hi Quentin,


Thank you very much for the advice!
I will have a look at b4.
Thank you for the review.


Best regards,
________________________________________
From: Quentin Schulz <quentin.schulz@cherry.de>
Sent: 23 March 2026 16:50
To: Jimmy Wesolowski; buildroot@buildroot.org
Cc: Guenther Harrasser
Subject: Re: [PATCH 2025.02.x v2] Package/libopenssl: security bump to version 3.5.4

EXTERNAL EMAIL: Do not click any links or open any attachments unless you trust the sender and know the content is safe.

Hi Jimmy,

Your series is somehow malformed, all patches have v2 instead of v2 x/5.
Your v1 had it correct so I'm not sure what happened since.

I highly suggest to use b4 (https://b4.docs.kernel.org/en/latest/ and
https://pypi.org/project/b4/) if you can. Otherwise, I believe you can
generate the series with
git format-patch --cover-letter -v 2 --subject-prefix "PATCH 2025.02.x"
-M -s -o outgoing origin/2025.02.x
as hinted by the docs in 22.5.4. Patches for maintenance branches.

On 3/19/26 1:42 PM, Jimmy Durand Wesolowski wrote:
> As indicated by Quentin Schulz <quentin.schulz@cherry.de>, OpenSSL 3.4 is
> EoL at the end of 2026, and thus earlier than the Buildroot LTS 2025.02
> (end of 2027).
> OpenSSL version thus needs to be bumped to 3.5.x, which is currently
> 3.5.4. Note that a new 3.5.5 release is in the making.
> This series brings all the related commits from master to 2025.02.x.
>

Considering we're using this series in one of our products and that
before that series we had backported the patches internally and they
were the same as in this series:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
