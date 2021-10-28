Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC117C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 01:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C7A960E74
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 01:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C7A960E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B40C44010E;
	Thu, 28 Oct 2021 01:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EfPVJknSh0pT; Thu, 28 Oct 2021 01:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ABE540112;
	Thu, 28 Oct 2021 01:07:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2EE61BF387
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 01:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E015540112
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 01:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tt8Ykn-80-qH for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 01:07:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5987B4010E
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 01:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635383224; x=1666919224;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=OaEeB8lBb95DPbfnPnDsuZ/QO3b7ps6YWK0AY3tPbKI=;
 b=lsT5dOAvxwKZK8McoHpptDd8AZ9F2gsRvbPZuSPEUSzEUG+7vbPYvx2K
 245cG9L7bLzzxRWLdNVtHAeP3mAbbjEFhcYPlOmAEG8uqZYBJnBdAeYze
 oFLuaz99Pfc5E1/M/8ElwzTFa4e64BGoRylGhU8jjQa5mMmOJ0U43tDhr
 s+ok0f0YiMq58zmt4B4l3flJVWloQttMCKt+B378oQzgngUmk9dBMsDAb
 vQUxLPu522UaAVP9D3RU8OZG17kM1lKa9TScuuEiQAJ4cehrtNfr40nH+
 cyaP6z6aNEJklNrUWfON/0Ps1xPmF2IaiLs0aR/XjnE+l1NuqaM7Qwi/T A==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184959151"
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 09:07:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYzkYOuo/b+irfXSCXA8RFO9K0AK03uAkgP0ihDWu1pSO1YvctsdC/kWADRGdfo6g2Vgmhc82U2WMQfL0wmoG9uDY7d49iLWUjYxY7EC3ZUPGr6bYF8u1QA2Il+LJV2NmOz/xHgCT2PqsOHumAbKaui9gu1luSNBU1oRHcIaiqokv5Sm8envQTvK+lnhVqhKiyg+Q0URRv1zrd7PLO4WIiGL17yp/l5qS6IWQ+LS0FFuqKVozpTr8mzjZRwiv1xEFufXfG7RmPqcu/UuYc68dfR0uzRpV2VfsIG4kMzc375EB5uBK79MUrap5mTeDr/sGP/0yA4JWF+DQ1bBWry9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBzI24QYQAhdpdzC0o9w1bZQuByBUeNrNY/RzPt2QBY=;
 b=mb/kKeJV0nDHt4958vJk7Syrfr87zvXAi/KYlNiGkaIzB2zSx3oRYHXJPLL9hbhCDO1o8d/yHArfDDcDXwRtBPndWzMW19g0QpsRRrCgwYu/nrJ5RnhmL+CF9CPE9uaY7/o9Nwh8hEFQ1NM0oM0+AgbHqZV4MIHbHhM+D3aAZI6HpAuk8ZpZCm+8th4QICD9NvZuSfObESEprJh08kMGcYn4fueIABVk9gOzts5M3PRcGSnPpcMyAjvr1CW8w0/iDWhlpyzpYcVfW3VadIh6AiVdkp+1g1vEn+wybhYNH5Z6MwXtUDVWxVe7mV41CsL4XTOgsE4VLi5oyCQ87AuAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBzI24QYQAhdpdzC0o9w1bZQuByBUeNrNY/RzPt2QBY=;
 b=HuXSVWd/S4b0KZp9iCi0ERwjsfNa+68VZjlHR9mWgrrVTt/tmkFZS0Q2OfcsRKl6aOlXTFrSJITxsfrj5/IlfMnAqgIkS53E9YWzVfldQnsgbOV2h8+eI2JxKNlAyYP3G3dt47IglFsfIi+wgsnfU2E7jBGO64sGhF62j3rr93s=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB3881.namprd04.prod.outlook.com (2603:10b6:5:ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 28 Oct
 2021 01:07:00 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::5034:7af4:3e2a:b1af]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::5034:7af4:3e2a:b1af%8]) with mapi id 15.20.4649.014; Thu, 28 Oct 2021
 01:07:00 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
Thread-Index: AQHXyjmPBFf6vXtxHU6uYcYx520GSA==
Date: Thu, 28 Oct 2021 01:07:00 +0000
Message-ID: <DM6PR04MB7081C25D109CFECB60F402A3E7869@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
 <87cznqpocv.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: korsgaard.com; dkim=none (message not signed)
 header.d=none;korsgaard.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b3634f0-1665-47f2-6b62-08d999af3f20
x-ms-traffictypediagnostic: DM6PR04MB3881:
x-microsoft-antispam-prvs: <DM6PR04MB38811077BECCC21476729BFFE7869@DM6PR04MB3881.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oki+5lJkBliWFMaO1vASEpSUfF8LXxNQJ3Xl2mV2+JU3PHbHzIFHO5GRhY+RKWH9B6q59pMyHDA/mA0UmcExd+jGqPD54Qhr87HetFSk+i1przIJLBY24QId1WZckiiRvlvhfEZrf4g1mEelOFHdTrKMpr3pp3wAJqqU5B9RTtwYgxZjPiSGoYOwmsZ09nkl5VIBG7oZXOcXnY56R2OSbSv1VDHgNgR1HdPbWOMehycLeOtLYnQ+/7QpX9Snz5yXK3pw84u/ZbhWp/yQLry4uvfK6QI9VapfmHpobe2z8A4TO7YKKXF/zpTLF2U/t/oDT69cFY9ILm8hi8uYqwW5E06+KA8z90PbE9QTntsn1+y3At4ki0o6AJSIFSgl3omOpHqvtGA8d8G58Px46QEBUpt+eNaYjgwgzxIIPtprmIQgnf3qFsKBNAx2jMI1osl9UcJWV47W53OuzRyZIwdRBN0oWOddiuAlzLkRg/NtjGOh4IIUL7cd51oR9P/hKmqaiu0vGwyBUqwZZ3ouJRUDp/KFYIDANrDXMqgRkc+hlqbMy/ReyaPYACg4HjYUVlR4J3hLuxhaBI19V8IeHFl4LKWRrCo0OEPi38F5fBpGj+BxoQSxMih1AI50YGcmAx10+z5KjCIM9He75OvBXYi8RUj3zMKMgLVVBgeZSovuVInrlmo5r1Pk8g+kl+DM0Qzb/zCP5kUMW1DoHRJsnhUDxg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(9686003)(8676002)(122000001)(38100700002)(54906003)(55016002)(316002)(7696005)(52536014)(83380400001)(66476007)(508600001)(8936002)(76116006)(64756008)(71200400001)(186003)(2906002)(33656002)(4326008)(38070700005)(6916009)(66946007)(66446008)(5660300002)(82960400001)(53546011)(91956017)(6506007)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bhXefPhN9yGkO6AoIQpg6PSBsLsVzvQuq8uiuo63a9FGmDn9rCH0kvG1bCYs?=
 =?us-ascii?Q?EeN2k079YkEvNzX7M2X4djTrLmViB4zKi3er5A7Byjpk+OAYMhcD06LRvh3R?=
 =?us-ascii?Q?60PptTb5AtYBah4GgSZ6DK00G9/Se9VNMlfNjgEwFe7Dw9m+ZqNGa4r48N3S?=
 =?us-ascii?Q?j/TZRemapxBX9Vz7lUEJy7qn5GY1TP3Vs12zzI//tNq/gt3J4jhEF7dhBJfD?=
 =?us-ascii?Q?NkkM+3JKkAfhaIIryLUiiNBQfiWPVLdfgvt1GYGTP6YQDlhty1lwj5Hf7GLc?=
 =?us-ascii?Q?YEORKtmGrTZ2jWe0Xn4N5f+1OHbabOIf8Su4YCT7vPrMh7gvVb01IvvCPN5L?=
 =?us-ascii?Q?cKX0mBE+psn1g+IP4i8CwLEnzBsoNaFYbrrSWwpg237MaYbI1+YvMHL8em+L?=
 =?us-ascii?Q?2qFUEjGsNVU9C4cIvzeCYOafGVH5XIninkm/dBCWSe/ff+TqP6SQqq+CY9kV?=
 =?us-ascii?Q?YF+waUHrL1Xo8g5sEi7+whH9bPqlRMlR1m8mMbRTBkMGGhXEMJ4c1/nAAax+?=
 =?us-ascii?Q?fAe6pbFoWuE5jOj5kNpUDt4hXUevAeteZOUXzenNR2ET92wpRkKMEzrTkkgD?=
 =?us-ascii?Q?THIQTNZ4ecEBq8LtcyOe8CjSKs8gUENKQlmmcLq9GPsu6lUFV12ItcrnWKcn?=
 =?us-ascii?Q?xdbsTXkZvuJErziYvMc7CAyFR6iZdXg3sQdsYOqQoSkTPKkv5TJ5GL+htV/z?=
 =?us-ascii?Q?GxBq0dk5J53v3W7fhO7bv/WwO6hIoaWtsrEk3A8wZrpTg/eFijY4oYxoB1vO?=
 =?us-ascii?Q?j4ZGwVE24zDfjEIu6PEXJ1YnzdMHdcw1FWhNhiZhWBW6dP2v+T/1t5XZwsoJ?=
 =?us-ascii?Q?eX8uRRxl9IWV2SPdxNZtN6ubOdLb90+jLAgRAXueN/GasjC6srGSFBMiFzmh?=
 =?us-ascii?Q?hpzClMOIet/mDiqHA3r8AAgyozcVgAbZgfPLOXVIQOU35/9bDblSEhITMms1?=
 =?us-ascii?Q?RMtr7nBevsywATqzvB/n5A/yZzuRaArOHLOFTHqTqytPUlVPkWYSFYRaaOMi?=
 =?us-ascii?Q?rmqDrRVE3CaHj5pBYWNfvpS910zlV9xac23gWs/4Jd5LSiyHB9YMlz1O/TJH?=
 =?us-ascii?Q?OdKYX9Hy4exbEbtVTGrkXW4pecs85qZnwNwi8GrMtsTyYdCgkZq1B9TUW9eQ?=
 =?us-ascii?Q?wD/aqsimkSF2XBG6jcFqkL8tS5CFOIe38CXGpGLIL/yMs3I5/bG14GPmSdMg?=
 =?us-ascii?Q?3pJc6dlpGafF4UCPd2r5arrtzVwBJIOhqdAuQgyd/ZtXqyumXoTUJgQES1N0?=
 =?us-ascii?Q?1i7UvdI5jOjBk4vyGK5l1Ta+ByYKYe1jIkqB9n9HO/JPYquPjCzJ/P7IDFg7?=
 =?us-ascii?Q?PnC2jywHzgfseWLGrexGb/L2ihINeDHsjAZQb6JJC/y5DdBPU1YJFTEHHPw3?=
 =?us-ascii?Q?/vKmmOQPOAzKUR43hIPKMTOnMDxMFoEKXH1AdKqc/YSdTuGztwDM9NMTuzBS?=
 =?us-ascii?Q?Dt+MJuAmKWsQgKKgArAKBYVnVlSeitGXxfLvPaxu1N6UJiNfb43hMlh9q/JQ?=
 =?us-ascii?Q?9dFB8uMgYdjguSXXEcG9owfOPv+LLrdPtDPVThTjVOUoP1LVYMV1KIGMWAsh?=
 =?us-ascii?Q?bfBIO9fhjdBnR0OuvZ3N7dHcIlj92pIRn5uUIGDak1H44C14O/hoU+LHhjZz?=
 =?us-ascii?Q?JbyhTK1Lev2RjIJJvZMqrwYy/qLfGAmlZ4KFivA86d7ufFgkO/Q8Wbbpz0U3?=
 =?us-ascii?Q?/MB779YbDc2+pC3y00eqCDz7MOqSdZKH2/ykAGjxs8Ni51fE?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3634f0-1665-47f2-6b62-08d999af3f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 01:07:00.5607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xM5HVvU0aZwlDyny4ISWc9Jv577yn6FXXwof9YsmKVHgDPh+Xaq52rmdoYTU0eSe/P25HB6+pkQBc11AiMmh4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3881
Subject: Re: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Sean Anderson <seanga2@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2021/10/27 22:51, Peter Korsgaard wrote:
>  > diff --git a/board/canaan/k210-common/busybox-tiny.config b/board/canaan/k210-common/busybox-tiny.config
>  > new file mode 100644
>  > index 0000000000..7adcaf1db9
>  > --- /dev/null
>  > +++ b/board/canaan/k210-common/busybox-tiny.config
>  > @@ -0,0 +1,241 @@
>  > +#
>  > +# Additional config changes for busybox-minimal.config
>  > +# to reduce the size of the busybox executable.
>  > +#
>  > +
>  > +#
>  > +# Settings
>  > +#
>  > +# CONFIG_INCLUDE_SUSv2 is not set
>  > +# CONFIG_LONG_OPTS is not set
>  > +# CONFIG_LFS is not set
>  > +# CONFIG_FEATURE_DEVPTS is not set
>  > +# CONFIG_FEATURE_SYSLOG_INFO is not set
>  > +# CONFIG_FEATURE_SYSLOG is not set
>  > +
>  > +#
>  > +# Build Options
>  > +#
>  > +CONFIG_NOMMU=y
> 
> That is already taken care of in package/busybox/busybox.mk

Right. I overlooked that. This should not be needed. Will check.

> Did you verify if all of these tweaks are needed? This looks pretty
> extensive. Perhaps we should update busybox-minimal with some of these
> instead?

busybox-minimal is fine but gives a larger busybox executable. I added this tiny
config to save memory when running and avoid failures due to memory allocation
when executing complex-ish shell commands spawning multiple shells (e.g. pipes).

>  > diff --git a/board/canaan/k210-common/rootfs_overlay/init b/board/canaan/k210-common/rootfs_overlay/init
>  > new file mode 120000
>  > index 0000000000..a0b71977c0
>  > --- /dev/null
>  > +++ b/board/canaan/k210-common/rootfs_overlay/init
>  > @@ -0,0 +1 @@
>  > +/sbin/init
>  > \ No newline at end of file
> 
> Why? Isn't fs/cpio/init suitable?

In the past, I was getting errors mounting devtmpfs. Trying again now, it seems
to be working as expected. This added init does adds mount of sysfs and procfs
for convenience, but the main point is that the last exec starts the interactive
shell instead of /sbin/init. The default busybox init executable is way too big
and fails to run.

I could just overlay /sbin/init as a symlink to /bin/sh.

I do like the sysfs and proc automatic mount though, and the cute logo added :)

>  > diff --git a/board/canaan/k210-common/rootfs_overlay/sbin/init b/board/canaan/k210-common/rootfs_overlay/sbin/init
>  > new file mode 100755
>  > index 0000000000..6ec4748c03
>  > --- /dev/null
>  > +++ b/board/canaan/k210-common/rootfs_overlay/sbin/init
>  > @@ -0,0 +1,27 @@
>  > +#!/bin/sh
>  > +
>  > +# Mount sysfs and procfs
>  > +/bin/mount -t sysfs sysfs /sys
>  > +/bin/mount -t proc proc /proc
>  > +
>  > +# Use the /dev/console device node from devtmpfs if possible to not
>  > +# confuse glibc's ttyname_r().
>  > +# This may fail (E.G. booted with console=), and errors from exec will
>  > +# terminate the shell, so use a subshell for the test
>  > +if (exec 0</dev/console) 2>/dev/null; then
>  > +    exec 0</dev/console
>  > +    exec 1>/dev/console
>  > +    exec 2>/dev/console
>  > +fi
>  > +
>  > +# Print a fun logo :)
>  > +echo "          __  _"
>  > +echo "         / / (_) ____   _   _ __  __"
>  > +echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
>  > +echo "       / /___| || | | || |_| | >  < "
>  > +echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
>  > +echo "    64-bits RISC-V Kendryte K210 NOMMU"
>  > +echo ""
>  > +
>  > +# Start interactive shell
>  > +exec /bin/sh
> 
> Cute, but why can't we use the normal busybox init / inittab?

The default binary init is way too big and fails to run (ENOMEM). Even if we
could run it, it would stay around and consume memory for nothing.
That is why I just go straight to an interactive shell here.

>  > diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
>  > new file mode 100644
>  > index 0000000000..bbbe00d44d
>  > --- /dev/null
>  > +++ b/configs/sipeed_maix_bit_defconfig
>  > @@ -0,0 +1,14 @@
>  > +BR2_riscv=y
>  > +BR2_PACKAGE_HOST_ELF2FLT=y
>  > +# BR2_USE_MMU is not set
>  > +BR2_INIT_NONE=y
>  > +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
>  > +BR2_LINUX_KERNEL=y
> 
> You don't specify the kernel version, so it will change every time we
> bump it, please specify a known good version.

Any version including and above 5.13 work fine. How do I do that ?

> 
> I gave it a try here, and it fails to boot with 5.14.14:
[...]> [    0.253373] i2c /dev entries driver
> [    0.258022] random: get_random_bytes called from 0x000000008000569a with crng_init=0
> [    0.271672] Freeing unused kernel image (initmem) memory: 608K
> [    0.276809] This architecture does not have kernel memory protection.
> [    0.283241] Run /init as init process
> [    0.289488] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
> [    0.296422] SMP: stopping secondary CPUs
> [    0.300340] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
> 
> Any idea why?

I was getting the same when elf2flt had problems (buggy relocation). What I sent
is working for me doing this:

make clean
make sipeed_maix_bit_defconfig
make

And flashing loader.bin gives me a working shell.

Not sure what is going on. It seems that elf2flt riscv support is still very
fragile. I need to address the comments I got on my PR and dig further to check
that I am not overlooking anything.

>  > +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>  > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
>  > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>  > +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
> 
> I see you are adding documentation at the end of the series, but perhaps
> it would make sense to add a host package for python3-kflash to make
> this work out of the box?

Yes, we could. Do you want this with this series ? Or adding it later is OK ?
I need to check how to add a host package. Not sure how to do that...

>  > +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>  > +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
>  > +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>  > +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
>  > +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>  > +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>  > +BR2_TARGET_ROOTFS_EXT2=y
> 
> We have genimage in buildroot so it is easy to create a full sd card
> image with the right partition as well. I also see that there is some
> k210 support in u-boot nowadays, would a setup with u-boot in the SPI
> flash and kernel + rootfs on the SD card not be nicer?

+Sean who did all the k210 U-Boot work.

I have not tried but I think it should work. And as long as the final memory
usage is the same (e.g. U-Boot not sticking around in memory), things should be
all OK.

> Any specific reason to keep the kernel in the SPI flash?

Not really for now. It is just very simple to use :)

Going forward though, I hope to be able to use XIP to execute busybox from there
directly. There are patches out there for this board and got report that it is
working with nommu. But that is more for the cpio case than the sdcard case.

Let me dig again in elf2flt to see if I can get something more solid.

Thanks for the comments.


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
