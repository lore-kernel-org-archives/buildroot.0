Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933F6C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E7A860F25
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E7A860F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EE94825B9;
	Fri, 23 Jul 2021 22:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVBQa6k2fW5w; Fri, 23 Jul 2021 22:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 368BF82400;
	Fri, 23 Jul 2021 22:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE9A1BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DAAC60715
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="VFRAxh/I";
 dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com
 header.b="yF9GVZm3"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_ZN6vT3cwN0 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:40:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A598A606EE
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627080013; x=1658616013;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=E0wM/IBEJBlbRZA3CpDm4FAp9uJQO66IO5XUuizUpOE=;
 b=VFRAxh/Id0856/9XyB4Caq2sYCS4JB/0KzB6ZpMvEc+JjcxS+P4CXt/M
 JKC8wQyVR9CGu9iNpQCmabprdqnC4ecZ1yQvHdVS7Fw4Nbna1nxVJNA4I
 R+Q3Y7Bv+Wlra1jX05DvE1AYVqpXWZHdKC8Ewt8E5ktGwGzr3QwW8BZNs
 gp/sEClOlZi4NwllV9CQ2bMQNpmSUYTJRXz2kHcqgkaf2BzHTV4Clo7Eh
 igZuH+TKTdEe4Go5XbmRkCHERjGPPYnHw2ypMZQHbLFOGByoQBmYKx/s2
 wfUaWH3SMH4aG6M0xuHvGZdukB3xwg5UXdtB+E1Fcla+eQsrtcpT0sjQb Q==;
X-IronPort-AV: E=Sophos;i="5.84,265,1620662400"; d="scan'208";a="175950651"
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 06:40:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RceoRNANFJKlB8zfDm5W2HS+PqwXXIdYU3u0gNYXBBRgDaxtCrcmBU5e/yzYcz8yzMQljUXUmcxID2B7qbswYKPmE1tad/qlhEnUe/Ip6wHYPrjp1kHbmAc/Or2hPlOQwExGk89HiYEfFVxUQ662j27kmHk42ZY/V+OIe/URTUEiRGeTIrUZmUWAPc0M7SChBpcnfUJ7WyD7Rfa4sZT/M7oXAcv4svZYxBJU/c3FlQtqdXBFof6EYrhN3QAWGLJ6eQEpCv2H4BKcz/or5gq+0JoBB210Z5UIZdUDyjCHMqDcFb+CiN/W4WsI2xHuwW3m6rjtYs+ZyPB3XrpIyH45Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FLY5cUgwMWDAoRDESk0iJnxwqwMJmv3z+goQcy0A3k=;
 b=QAZteeoJeYqwY/osL42Y3w8Vpx5POxQxAd6UG+pcyu97u2Kp+97bo0Rm5i4PYr3Qxp/Me6sWUVJuinFT5+PJtRcFkAHCIOIA/B/ihv7ZYsTMbB1VCy/c/Ntpa1nizBBpgwZf2hz4cm7+pO9BnftHJRFROwxvaTkXBDaRDk4SbsR+MK0o5OfEe0kV6UVms6aq9jGQdfKsgUsT82oMs9sPKWXoddFHOvfvKfg4el2KuLHOVbBygHP/dVshyhEIvLluOaoxuKlh2HaLUapWvSDK4UZtzaVIPVk9N0b9WxoGJ4XBYukRhcxe2SLsXchmAqZl6Iv/23OAhs4gKNSWnrNXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FLY5cUgwMWDAoRDESk0iJnxwqwMJmv3z+goQcy0A3k=;
 b=yF9GVZm3kI4YI2Dbxfa8i2YSxTve+yDAQoWEt/U/9XJIdt/TAQIuKdU0NUitZMIKaI0afmLJGxslfJwT9Ut4wcTUvd4/W/Jx6msKDxcL797mPlpIW9faAT6Y4IPf7DgnJ8xpPCRAYqPtAMYPtyck4LXl8ZL+0HdHq+NB6uNLz14=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM5PR04MB3756.namprd04.prod.outlook.com (2603:10b6:3:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 23 Jul
 2021 22:40:09 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::44e6:14cc:4aab:3028]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::44e6:14cc:4aab:3028%8]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 22:40:09 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot
 <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Corbin <mark@dibsco.co.uk>
Thread-Topic: [Buildroot] [PATCH v2 4/9] board: Add Sipeed MAIX-bit support
Thread-Index: AQHXeRNqg2/imBJvY0mqcly0otv+ug==
Date: Fri, 23 Jul 2021 22:40:09 +0000
Message-ID: <DM6PR04MB7081EB636A8B06DE6FFE16F4E7E59@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-5-damien.lemoal@wdc.com>
 <6a1b7aba-9fe8-d0ab-ffda-b24167b0cfce@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mind.be; dkim=none (message not signed)
 header.d=none;mind.be; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c5504d4-36dc-4a26-1ee2-08d94e2ad3c9
x-ms-traffictypediagnostic: DM5PR04MB3756:
x-microsoft-antispam-prvs: <DM5PR04MB37563E50D6EA903AD10286E2E7E59@DM5PR04MB3756.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wscu5/XbDITe3PbyKdtUQ/oKuhOemdXyMfLYjKMLpmRH1T9dxkJr0fEUZ3krw6fC9SvwwqZ+tuKEuvObnR9BEGL4B4cCe/oOzzkI4As/NZPnNCYJa1Q+T66VClRTLLPQDhJzfM9hO01yiyQuU15THnSSwHUc356ySRPeZJihrrFsJasIOeZTZs2PM+MD6akEii6uzLQ5tNGDW4TVr5y4T74lICrXw27c0Srvd4wjB9xP0FyMNeN3jfFmEgto8ddFWMGTd10xGgzqkTupgvzW3UH1dO5LBxNqa6NQdgL4tYwTDH0K9Ww7dmuiFYA8VQshXrWz9eLQGxbO3Q8xQF8zCzPDApZBW6ekSPgNpP0TB0I61RUk9gtBmY7EzMIMGDRgZ/gLDjFW7wHcphh6eD81ZM7JKyasP2AVJ6tvU0xSrJugMDik9krxhoTIfZUvOHSAlANinsYFOjKDHLWiz6HdwToX8DOnY70Ax6dfQrJ3JgnXbm7vO+DVDgGdI7neOU32Ktdtu7ZVlH6NZgyqfGUhFwXQUvVDPexikO1MVUMgvOmhsBAzFbtudmNmBJtt6NXxpeXjI6Quzw6OSWhbWkLkZNlao7V+Yg0GRdC86A/ry5C81870sFie4kK/VrRQddW9UGDv5p85pLRbI0/ba+GroNYgUkOAeaxlPesawiniNwS0cSL3ywGN0SHoezdY156KxzIE3VE0Z44SwggrqVU4ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(4326008)(8936002)(33656002)(66946007)(2906002)(52536014)(478600001)(5660300002)(316002)(53546011)(122000001)(91956017)(110136005)(76116006)(6506007)(55016002)(71200400001)(86362001)(83380400001)(66476007)(8676002)(66446008)(64756008)(66556008)(9686003)(186003)(7696005)(38100700002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kXrGv7c/qgqUOYy+6g9kr5appNptjQK6WbJ3Zr6/71qOkwu9HES1iV/6u/1J?=
 =?us-ascii?Q?k9a4topKkqc0ZtpK0R94F4riCVguGx6vEvcUPQ48Q3V4Dge7nu3DqxMk4AEO?=
 =?us-ascii?Q?5HrOO9IzIGlqnTLtVYQt0l5MX+T5s8quHhCC+T96dWWSc5vctdmacHlaWOpS?=
 =?us-ascii?Q?354QgYu250i10qLm7w7u7pFQ5VY8EfSWG1NJ0xWRY1OzIYnTtDZdZnC3Qb5B?=
 =?us-ascii?Q?BP+Teusvz2pTLBaM93WCHDtMnxEumWUl6OY1OHB+hInQ7gIZgwUAVWkqz7zS?=
 =?us-ascii?Q?J/U8OqWNpoGEHKkou89NhbdxswJ/SvyKeZ5h4m7c9TtwC4V4hQyCFfv0E6CJ?=
 =?us-ascii?Q?ps4zNv3JNjNP2nWc9Z4PVXqsCjqC67Wy3AHa1onzJxi6GHh9MHUYAL1uUQOQ?=
 =?us-ascii?Q?ILoya9Qp1lRjHAcYzcZXOwvtdR8nVAiKOC+qygQLSDY5+6HtCH4sxlTegsqd?=
 =?us-ascii?Q?iNAK/P+WxBgt2jWKvnHycGqCDTtgzeTEaT2pjfLm60kGRq9Kn4T4zcuza3M0?=
 =?us-ascii?Q?3IUoDY3q7Yp8K9QUDkJePoslAmVstBTP2BJSzzCUyAlp4Y5ZfrKBaeISyFbw?=
 =?us-ascii?Q?VFtW9ATrhxIvAqBKfQPWBuiu8PCLBdTJlAfjdf2pWNRauT4PVnr6opBYy0vw?=
 =?us-ascii?Q?kFDUMQ8cGPhsNa3I3YtpfeuKyT9izqpULttSzLYZsJ7ujiD3maksJEhM0zpu?=
 =?us-ascii?Q?fFh/EfTeWhasNTyyucDCzlzwksb62UD4j0QaxPT+LZL9R2RC5nih7uOKZKGv?=
 =?us-ascii?Q?6cxW0VyY293g+35J7WK2uyk5Fxt2IxCD6pbWLHAXt77ORnpgV5hTIZg+V283?=
 =?us-ascii?Q?N2uQ7HUm6eyXOM51O1G8B8QtnrKQEIkutinYOyEFp8rr0XTevnETYEzmyQgb?=
 =?us-ascii?Q?qu8ipLW+g9AH64cAiAoHz776iAcpzAonVmYHl9g7/WOGl/I8lNJG79d39JaM?=
 =?us-ascii?Q?SnwnbS0gFFeXsHZYItlRMD87wTe+7zHLs/E3omjzzEcvEJykfUGJ4rt6ptZ8?=
 =?us-ascii?Q?k7m9/uVfTDwPFCLymmqWo6G0jkFP6nuY8Gx/c7qto5QCg+9BhW1ByeG0oNsv?=
 =?us-ascii?Q?krm/e3pQWczs2MJZZdU9JB/CZtHUyZEfex3QWd7T6WEgs/c4Z2EwHKNd3Dom?=
 =?us-ascii?Q?lynYRbsYHoOh+GlxRYCmdOqomxa00d7abpp4kYWvSHTfyfmrS0kUSI8Mfznf?=
 =?us-ascii?Q?7ELdtTYkg69FDX5g4T+HqZAOL8ac/LxTXWVYWN1SOHebVKri+9HcBFGzLpkA?=
 =?us-ascii?Q?VAdlOMz9zmInlcuawTVzV/jAjyMq1smtkLy88cwyWun4ao6f9C5p07MSnUyB?=
 =?us-ascii?Q?KbeAiTEhrlWD1qrpHAQXHyvGSxmEgoAKTZHTpLkZCUKzJYmGbGxE37F5df4l?=
 =?us-ascii?Q?4UkQbzzDqYmpKz+0/YLDSz/UJmQqbVhhuTCKj+zOi+4eXQkIhQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5504d4-36dc-4a26-1ee2-08d94e2ad3c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 22:40:09.7346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZY1FNpmw6haIJLjCXA2/Fz3bowczcMqcwZLWrQShCcDE8lu9vkfz93biKAh/gtM5YUO7hFzrjhyXsCr20S3kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB3756
Subject: Re: [Buildroot] [PATCH v2 4/9] board: Add Sipeed MAIX-bit support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 2021/07/24 7:25, Arnout Vandecappelle wrote:
> 
> 
> On 15/07/2021 02:48, Damien Le Moal wrote:
>> Add two configuration files to support the RISC-V Canaan K210 SoC based
>> Sipeed MAIX-bit board.
>>
>> The first configuration file, sipeed_maix_bit_defconfig, enables
>> building a bootable kernel 5.13 image with the root file system
>> initramfs linked with the kernel. This configuration uses the busybox
>> busybox-tiny-initramfs.config configuration to reduce the size of the
>> busybox executable (to save memory when executing shell commands).
>>
>> The second configuration file (sipeed_maix_bit_sdcard_defconfig) builds
>> a bootable kernel 5.13 image that uses the board SD card for the root
>> file system. This configuration uses the default busybox minimal
>> configuration.
>>
>> Both configurations share the same device tree which is provided by and
>> built-in the kernel. This configuration is set with the kernel
>> configuration snippet provided by
>> board/sipeed/maix-bit/linux-dtb.config.
>>
>> Both configurations also share the same init script provided using the
>> rootfs_overlay root file system overlay. This init script replaces the
>> default init process which causes failures due to excessive memory
>> usage.
>>
>> busybox-tiny-initramfs.config and the init script overlay will be
>> reused for all Canaan K210 SoC based boards. These 2 files are thus
>> placed in the directory board/canaan/k210-common while the Sipeed
>> MAIX-bit board specific kernel config snippet is added under the
>> directory board/sipeed/maxi-bit.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  .../k210-common/busybox-tiny-initramfs.config | 1183 +++++++++++++++++
>>  .../k210-common/rootfs_overlay/usr/sbin/init  |   26 +
>>  board/sipeed/maix-bit/linux-dtb.config        |    2 +
>>  configs/sipeed_maix_bit_defconfig             |   23 +
>>  configs/sipeed_maix_bit_sdcard_defconfig      |   23 +
>>  5 files changed, 1257 insertions(+)
>>  create mode 100644 board/canaan/k210-common/busybox-tiny-initramfs.config
>>  create mode 100755 board/canaan/k210-common/rootfs_overlay/usr/sbin/init
>>  create mode 100644 board/sipeed/maix-bit/linux-dtb.config
>>  create mode 100644 configs/sipeed_maix_bit_defconfig
>>  create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
>>
>> diff --git a/board/canaan/k210-common/busybox-tiny-initramfs.config b/board/canaan/k210-common/busybox-tiny-initramfs.config
>> new file mode 100644
>> index 0000000000..f0367e5460
>> --- /dev/null
>> +++ b/board/canaan/k210-common/busybox-tiny-initramfs.config
> 
>  Wouldn't it be better to start from busybox-minimal.config and just add a
> fragment that removes the unnecessary options?

Yes, can do that too.

> 
> [snip]
>> diff --git a/board/canaan/k210-common/rootfs_overlay/usr/sbin/init b/board/canaan/k210-common/rootfs_overlay/usr/sbin/init
>> new file mode 100755
>> index 0000000000..286346ddc3
>> --- /dev/null
>> +++ b/board/canaan/k210-common/rootfs_overlay/usr/sbin/init
> 
>  /sbin/init, not /usr/sbin/init. Doesn't matter because you have merged usr, but
> it's better to follow the standards.

OK.

> 
>> @@ -0,0 +1,26 @@
>> +#!/bin/sh
>> +
>> +# Mount sysfs and procfs
>> +/bin/mount -t sysfs sysfs /sys
>> +/bin/mount -t proc proc /proc
>> +
>> +# Use the /dev/console device node from devtmpfs if possible to not
>> +# confuse glibc's ttyname_r().
>> +# This may fail (E.G. booted with console=), and errors from exec will
>> +# terminate the shell, so use a subshell for the test
>> +if (exec 0</dev/console) 2>/dev/null; then
>> +    exec 0</dev/console
>> +    exec 1>/dev/console
>> +    exec 2>/dev/console
>> +fi
>> +
>> +# Print a fun logo :)
>> +echo "          __  _"
>> +echo "         / / (_) ____   _   _ __  __"
>> +echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
>> +echo "       / /___| || | | || |_| | >  < "
>> +echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
>> +echo "        RISC-V Kendryte K210 NOMMU"
>> +
>> +# Start interactive shell
>> +exec /bin/sh
>> diff --git a/board/sipeed/maix-bit/linux-dtb.config b/board/sipeed/maix-bit/linux-dtb.config
>> new file mode 100644
>> index 0000000000..de2f8fd074
>> --- /dev/null
>> +++ b/board/sipeed/maix-bit/linux-dtb.config
>> @@ -0,0 +1,2 @@
>> +CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
>> +CONFIG_SOC_CANAAN_K210_DTB_SOURCE="sipeed_maix_bit"
>> diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
>> new file mode 100644
>> index 0000000000..94920c5c84
>> --- /dev/null
>> +++ b/configs/sipeed_maix_bit_defconfig
>> @@ -0,0 +1,23 @@
>> +BR2_riscv=y
>> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
>> +BR2_KERNEL_HEADERS_5_13=y
>> +# BR2_UCLIBC_INSTALL_UTILS is not set
>> +BR2_GCC_VERSION_11_X=y
> 
>  If GCC 11 is really needed instead of the default, please explain why in the
> commit message.

Not really needed. Just used the latest. Will switch to keep the default.

> 
>> +BR2_GCC_ENABLE_LTO=y
>> +BR2_PACKAGE_HOST_ELF2FLT=y
>> +# BR2_USE_MMU is not set
>> +BR2_TARGET_GENERIC_HOSTNAME=""
>> +BR2_INIT_NONE=y
>> +BR2_ROOTFS_MERGED_USR=y
> 
>  Why?

Without this, the SD card config does not result in the system starting the init
shell. Not entirely sure why. Will have another look at this.

> 
>> +BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
> 
>  Why is this needed?

Not needed. Will remove.

> 
>> +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
> 
>  This doesn't seem to be part of this patch?

Yes it is. This is kernel fragment config that specifies the board buil-in DTS.
Without it, no buil-in DTS and boot failures. There are no buildroot level
options to specify this since there is no standard way of specifying a builtin
DTS in the kernel. Different ARCH use different options.

> 
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
>> +BR2_PACKAGE_BUSYBOX_CONFIG="board/canaan/k210-common/busybox-tiny-initramfs.config"
>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> 
>  Why do you set this? No others are selected, are they?

Indeed. Will remove.

> 
>> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>> +BR2_TARGET_ROOTFS_INITRAMFS=y
> 
>  This will install another /init script that ends up exec'ing /sbin/init. Maybe
> it would be better to replace that /init script as well (just symlink /init ->
> sbin/init).

Hmm... All the default init stuff is disabled in busybox so I do not get that
init script/process. Will check again.

Thanks for the review.

> 
> 
>  Regards,
>  Arnout
> 
>> +# BR2_TARGET_ROOTFS_TAR is not set
>> diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
>> new file mode 100644
>> index 0000000000..eba06bcbc6
>> --- /dev/null
>> +++ b/configs/sipeed_maix_bit_sdcard_defconfig
>> @@ -0,0 +1,23 @@
>> +BR2_riscv=y
>> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
>> +BR2_KERNEL_HEADERS_5_13=y
>> +# BR2_UCLIBC_INSTALL_UTILS is not set
>> +BR2_GCC_VERSION_11_X=y
>> +BR2_GCC_ENABLE_LTO=y
>> +BR2_PACKAGE_HOST_ELF2FLT=y
>> +# BR2_USE_MMU is not set
>> +BR2_TARGET_GENERIC_HOSTNAME=""
>> +BR2_INIT_NONE=y
>> +BR2_ROOTFS_MERGED_USR=y
>> +BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
>> +BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
>> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sipeed/maix-bit/linux-dtb.config"
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
>> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +# BR2_TARGET_ROOTFS_TAR is not set
>>
> 


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
