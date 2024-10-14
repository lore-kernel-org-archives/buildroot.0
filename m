Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55637D1813A
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 18:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1936960750;
	Mon, 14 Oct 2024 18:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id carXBgTb58am; Mon, 14 Oct 2024 18:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ACDB60768
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ACDB60768;
	Mon, 14 Oct 2024 18:10:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7A51BF358
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 18:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 887AD811C2
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 18:10:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjRIBq0jezTh for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 18:10:21 +0000 (UTC)
X-Greylist: delayed 864 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Oct 2024 18:10:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD6A1811BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD6A1811BE
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::622;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0622.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::622])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD6A1811BE
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 18:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=mXokR0eRUK6v20KsNprBbzBrhrpzMiioShFy0zFd2tMg1DbY1klbidz2SWERJkdoJWvNeZFgmLmR87fDSKquX9x7WGZDYxTBlh8Vk0CWDPfruckQj3MMQ1qBc7KuwDprIZArJIbbop7KNgcw6e+QTiYso0FirUqeppPcDoP9U35KGeCXUPaattTniLYunKFu5i545KNDIsSmJ3J82V6lLLBosBqaulG0mG5p8lXmnc/tCthlnP7DYQZGNZXMydM46VF1qplhndnnKLmu4QwKKoG2XMotgz4ZcQ9P6rk2+PCVUg+BvfA0DWMUUqYrIHTlWuoZ9Nf+M1eHoA+KPlI2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uvOCbq9atSR5nujuYLuF99Fo2LyCO3EMJoxqGkOb5I=;
 b=slek6qfieH1YqYcr7JbwUyS9HWuUG4az0zo+k2ZTaM73SYJiJ0EIsP3UrUMpaKrjiuwf0273/PhJixKgik+Yt9NksrWIj/y/1XhCzEQdEkJXlLYsUiZa3C54Pw9pNHA7c3DLepvnsU8tT1Kdz7C3ln/4hjMAJnZRm48ton2/z5m5gPWPXDP0rJaWebr5qq+SU4TR/1q8JK3uVoBe158KgoYiabOS9U0Lez0FHe6RqeO9DIOa4N32LmJl99bN1VR+94ui0mqGnuemYPHEC1L4EONjaYjKJgCEbXoYAFOX+67+4Qk25G0kXxCnVcSZzmHy6onRtW0Xbcz4yyHUrwIeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 17:55:46 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.8005.031; Mon, 14 Oct 2024
 17:55:46 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Aaron Sierra <aaron@bubbl-tek.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Thread-Index: AdseYjOalmSb4XjIQIehFuZxCltXDA==
Date: Mon, 14 Oct 2024 17:55:46 +0000
Message-ID: <PH1P110MB1603BAEB621A821D82C0A2C19F44A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1068:EE_
x-ms-office365-filtering-correlation-id: 64419b7a-ad33-45a3-ad26-08dcec796e37
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BmvS8g3kygebA82lxa/VXMDckTOR21Qj0TthcxwR6xDijYumuQic3WGA8+TY?=
 =?us-ascii?Q?cRNiST3oM9iTgOKm2L3iFdrXk0mhO3Eg7CSHqDTRaGP+z434HzQ6ZMMbpCQ2?=
 =?us-ascii?Q?6wJTaqHKp6Sx9Miv7AsIjI95NDjGt4cv6dSlSVfMjQo2lxnlzondLN4bJVCt?=
 =?us-ascii?Q?xdiMDt6yth0QQIgzf0jrMU94w2zJLe1BXjO1Q8LQL4zD9qlaeF3bL+b7i/aX?=
 =?us-ascii?Q?En6FuKVMPV3TEofjKERbtK7x0XsKyIknGZbNf3m20hqYyP0GsZcD7QtWPuLZ?=
 =?us-ascii?Q?9QzloN8i0dnSDVuqFjvZe/12m5bq1pgiL9Sk1M0MEi8QL4I8b2PCnYw2F4Cl?=
 =?us-ascii?Q?SRvTT7wuBU886WcBnXHUDxiy/4TfyGhZ4ZxJgd9PDQAATXXYKwTa9RsWF3FV?=
 =?us-ascii?Q?7QsbKcOqeazUMOxdMPYgccxmwzGzgT95cHXYVzkH3g6iHMA/3ZDWD6OsVxsL?=
 =?us-ascii?Q?ZgmQn6MIeuad7BuqRDxssfr44k54IL6OmiL6qe/NC9k7sHNKGGVgds0+H5V2?=
 =?us-ascii?Q?JMDaNJzHfwmtZdKtJq7F/ZKVoAreFektgJR26L9uG7Qn6nywtQY6i1kpC6Fq?=
 =?us-ascii?Q?vrBxpFwRidUnfl2BAVqaAHTe/inEh68KE+J0ODAWdna2wlZEvGAue1e16Nea?=
 =?us-ascii?Q?JUV6QNSXBnAPFyj29v6xuGKgSQaJik6WxI173zpU45iEpqFfMgTj9+QdA8+t?=
 =?us-ascii?Q?UEAnRmQ+6bmb1AYTwRXOz4H91aIetAbSz6w016qhv2sKB4ELkgBCsiEh6r/T?=
 =?us-ascii?Q?5rycR2Ulw1cCQkZ/PpvH50W1gjOPANHBCaijURjp7sVfLEfBkoaaGLIpDc21?=
 =?us-ascii?Q?5V9x34ymK7mMxxZ+nS+p2QbmZtuV6KAZyOH9NEB/aA4zwjQi2x+a7ebYZ1Sv?=
 =?us-ascii?Q?mbNmAl0XdQOG5Eyn1EJbJwBHLzlGuIvzOjxYl31clnsZg875EvDHP3x0d2ra?=
 =?us-ascii?Q?KjhwPY6DS18lXfw0vEhkF+EKcvcp8sN6QO2f+3xnGxMQDfj4eulaEijxXeRQ?=
 =?us-ascii?Q?2SFZqBd1piwz03f71HIQHqKUOx67aWRFpbEEeAjk8Nsa8zGvJtRjC+A4WrRf?=
 =?us-ascii?Q?9DE/wnhwgfwbdeNPuxoQob7C5LjWJkj6WIAnOcdQUh0QfDaUUNSkxuIibe/+?=
 =?us-ascii?Q?1nIan6vt7QvtvP4UQTD8gglP4K9NNsLjs1OmXA7luUWrqdO9NjpkCPLI2khH?=
 =?us-ascii?Q?Aq2GPWazwzXbuFNLSKhwC1bXF3IPk2FLbIW8OfckYRF0zQBEN8E6ArbEpD2S?=
 =?us-ascii?Q?Ty2v84MvdorsFrwYY/SJqqCJvuNLaSZ8YoPbPzTtBKxERdtpOf8+GF5YkANJ?=
 =?us-ascii?Q?Lwt/6wzWR3c0lB8rcQbiOX/R2NtHKKDxww7E4HKTqzmZ2A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Uz3oqpAyS0zYTwr8/ErgFCqZwNZGfAVaQAtq99zywCSk/y/fh7JOhk0053SN?=
 =?us-ascii?Q?H0kZODEoSHIyT1lih++1H6NCpvBI3ECwDcXXvMl3TeUgb+cNam5sagzFwVdB?=
 =?us-ascii?Q?5aF/G3CpX2E9uXoJLcBXk7BxC6G1moylkz5tJcJmu311A1QTU5Koggemx/De?=
 =?us-ascii?Q?wf6ucHSJ9DhkoS+FOZmdQ0eG0cCXK+t+5XyqhJGYvauyJ0BQpxPrY3C7rCr0?=
 =?us-ascii?Q?MLuUAj1B2NPhiGE/AiGbp33pdNQQ9gda+pNTInHR69vW4NvtDMpuspmtokC1?=
 =?us-ascii?Q?sDdFWAGNbehu6v3Pv54ydSCcy2s9y+ynpYsI0Jg/2Bi5hf27L0mk2XgIW/gx?=
 =?us-ascii?Q?ozCsXdCaOO49eBzG/2Wg6pRKe2YBTevdy5uQZszmA9ibQQwi+jX5SvAU1Cvx?=
 =?us-ascii?Q?Pt4BkdKMRT1dHzcczCUs0N/N12W5URKbTbFordyeK/MTDg/zq/G9PZe0k3iE?=
 =?us-ascii?Q?re/cObdMjOfOosBk4QKcE7YGXlvQl0zUuMOtrbj6yMVhq2EXQ34HSDaCdMyT?=
 =?us-ascii?Q?JfklULarLceVck/r31NLQe0oHJZlS7xfEm2mLvcjmuREzcfcSZi5zI5F5qvm?=
 =?us-ascii?Q?/E4Xs1C0UJvkDg9elq+fMayYMtQ8YvVLJGynuiyajSY+qTaCv+q+cOl0KDEQ?=
 =?us-ascii?Q?a5tQGADfTWI69ZjwgZfDr2O5IHD9wwNdfYMfg/aGoVujZVR6l5oK0W1HZOCK?=
 =?us-ascii?Q?lZbzdMzNRvPbUTi/m9vNqm6BEka6gGG3H5+tmURSuG07ViQxQlqoOy5uPk2D?=
 =?us-ascii?Q?k3zcsIwM92L2fGqAr6Q6JOWAk/LuqgnR5FG+WWSiF/9rFfrNXRviZYRVPjUH?=
 =?us-ascii?Q?eL4VMbRpgxCHGf+pGigi2kDw4A3TimuMgtp6KWo2GxSmqR/AJ1szbLQefyOe?=
 =?us-ascii?Q?Nqg7igD3Nq4+ZJZSCrFrsvfGIU8hKg8ICqrcuWZlA3YF8ACN8B34LNi/r/Qc?=
 =?us-ascii?Q?P3ESamadGY6ljsZWQ37sdphI111lMqQQxyFfeKjehwyPg5cktmG58G5h0sS3?=
 =?us-ascii?Q?Mlx2leiZAGnJkID3LKbfTmjD3C+cjogVcSqTiX9//apzv+JXsA4BBjHTCSGZ?=
 =?us-ascii?Q?A6mLY0rhjJE3dzq6mlEzQhBuHa8KF6vrwhvirgF+Ys9TEqXx6wa9PoibwuzO?=
 =?us-ascii?Q?PkT8JmBTC8o+dE9UeC6ZgDb/zLkfhxv0xI8x95N3nypMRsXQcOe7BJbBFndp?=
 =?us-ascii?Q?SJdqG9cjSQCVunYdolZhny2qdkMYbIcxee3old1fFWbnic3vXRQmj1UFjrW7?=
 =?us-ascii?Q?17M7BYCuH9CcMvujhGvITKQPpPlD5rH2Sm65Avu/0aFBsWZqiyipOOi9703l?=
 =?us-ascii?Q?2lPEB6sNCcYmnWalKqUt+kb6US0OcREAEDf6fUlG9htNlLbSqG9LReLCkeg/?=
 =?us-ascii?Q?qx+1n2VeCe0opbGelJaAdRTVZHUIWSzy4nhWPLH2/XeoQTmPLtzfiJW9X7ED?=
 =?us-ascii?Q?A9N1vnRJliC89XefNKjVNDsq39BOgqi4uq0ORm1bAOHBpAe26Vp1jh1rMzMd?=
 =?us-ascii?Q?lMCXsHj8FOzMC3c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 64419b7a-ad33-45a3-ad26-08dcec796e37
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 17:55:46.3658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1068
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uvOCbq9atSR5nujuYLuF99Fo2LyCO3EMJoxqGkOb5I=;
 b=lwJU0dQx/ZOrS9gn7/Y2Jc3RDB/MtsbOltkjf7KMzBplBLiNxUG39q4oYzski/x338GC1c9DRLufomeLloGvmx+JIP5Fn93xBn3ia2pujEeni6nFcqtbromEU9l2FMSJrtdlMf26ooz8DvijtxlkhmXTkYbkblqOaEYz9p01AwSX751ITkD+DcZ/hiwcJyQ5ykh2vXTV59pnA4vx3yj2fE5Dg3Lr8pkEPAIv3AJce/lZUJDjuUvx29blM3Tikf6zmXd/BATUNWZNYa6tTNQZUqMZ7727254hmLtiAAjzuXaOjAdF9ubXaHhqv2nlrmkMjn0GHmehnJ5Nrqp1EabHYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=lwJU0dQx
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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
Cc: buildroot <buildroot@buildroot.org>, Andy Yan <andyshrk@gmail.com>,
 Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Aaron, Andy,

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Aaron
> Sierra
> Sent: Monday, October 14, 2024 12:01 PM
> To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Andy Yan <andyshrk@gmail.com>; Andy Yan <andyshrk@163.com>;
> buildroot <buildroot@buildroot.org>
> Subject: [External] - Re: [Buildroot] [PATCH v2 1/1] package: Add iotools
> package
> 
> ---- On Mon, 14 Oct 2024 10:38:22 -0500 Andy Shevchenko  wrote ---  >  >
> Can this be pulled eventually? Or is there any comment I have to address?
>  >
>  > --
>  > With Best Regards,
>  > Andy Shevchenko
>  >
> 2. It would be nice if the package populated command symlinks in the target
> filesystem. That could be done in a number of way, like using an explicit list of
> commands maintained in the package Makefile (iotools.mk) or adding a host-
> build dependency and leveraging the --list-cmds output to get the list of
> embedded commands for linking.
> 
	
Caveat lector, I have not reviewed your patch or the sources in a while.

WRT to this comment, I have this note from when we ported it:

# we can't run make install because the symlink installation executes the binary
# which isn't guaranteed to work in cross-compile scenarios
define IOTOOLS_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/iotools $(TARGET_DIR)/usr/sbin/

    for link in $( IOTOOLS_LINKS); do \
        ln -sf iotools $(TARGET_DIR)/usr/sbin/$$link; \
    done
endef


We then earlier in the mk file define the tools per platform, akin to:

# I/O utilities
IOTOOLS_LINKS = \
    cmos_read \
    cmos_write \
    mem_dump \
    mem_load \
    mem_read8 \
    mem_read16 \
    mem_read32 \
    mem_read64 \
    mem_write8 \
    mem_write16 \
    mem_write32 \
    mem_write64 \
    mmio_dump \
    mmio_load \
    mmio_read8 \
    mmio_read16 \
    mmio_read32 \
    mmio_read64 \
    mmio_write8 \
    mmio_write16 \
    mmio_write32 \
    mmio_write64 \
    io_read8 \
    io_read16 \
    io_read32 \
    io_write8 \
    io_write16 \
    io_write32 \
    pci_list \
    pci_read8 \
    pci_read16 \
    pci_read32 \
    pci_write8 \
    pci_write16 \
    pci_write32 \
    smbus_quick \
    smbus_read8 \
    smbus_read16 \
    smbus_readblock \
    smbus_receive_byte \
    smbus_send_byte \
    smbus_write8 \
    smbus_write16 \
    smbus_writeblock

# Bitwise utilities
IOTOOLS_LINKS += \
    and \
    brt \
    bts \
    not \
    or \
    shl \
    shr \
    xor

# Other utilities
IOTOOLS_LINKS += \
    busy_loop \
    cpu_list \
    runon

# Achitecture-specific utilities
ifeq ($(BR2_i386)$(BR2_x86_64),y)
IOTOOLS_LINKS += \
    cpuid \
    rdmsr \
    rdtsc \
    wrmsr
else ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpcle),y)
IOTOOLS_LINKS += \
    cputochipid \
    cputoex \
    getscom \
    putscom
endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
