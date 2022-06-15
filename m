Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F65C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 05:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 863EA83027;
	Wed, 15 Jun 2022 05:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYPg6oMx1zQ2; Wed, 15 Jun 2022 05:20:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8892F817FF;
	Wed, 15 Jun 2022 05:20:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9A911BF956
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 05:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E594D40A20
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 05:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Grywu4McPuw for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 05:20:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::618])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EFE640138
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 05:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T92MO0QxonZCMgwkQ36P9AXkeOVr6R/psWsWTkuwBNWyO1kOkL1KA1sHU/CEaRsg7yGuFwo2w9C/0N1Naq5H1LPGhwq7X+242Zu5WPrnJ4j5laF5Ag585lgmngGdbFTa1ipFY60ia0l1cKsgcMO2bt+wOQul2fO/OHdv4JnhfYMYLVSn7KPn4k+zeedeRQg64zNY1wjKAix2QkMQQJjJFm5qJafxRc5OD3e/x9gLWZWtGrSZySSlr2IIv3nUy6e95f+4j0GZey+L0bZfQkyCIkNRbyqrNpct0h4vqLykhTj59FqWD4YHzjShV7HXP86iD1xBKxfIKXXvIWVEQWVZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dD+d+oJd+aBbC1tinmVTrCtbcLJfs3xO2gFlu9UrN5A=;
 b=a18HdB3YktWarz+ui6nYFe/2B0yIKmlEjMOT42h/Brj/2nG+31yuiX2rkJt+BTvRSbts1B9IVkw3UlPGbqqwJKl6TgCewzmEcmhOqUj5ia8Pi8osBcWHS213pjxj/o+xcMrF88ao8H2AkbvKWCruHfWJJzdRVdUqdjb5YHZuMaRcqKi0xD68O2RWCv21UIGu60Xzat2lp3/6Ofuo7GR2vMRh+ngFDOlQRtFOF5DnioE6zlFHovkTbUcjR9OmsEw1H4cRweRDUUaghxDeXaSr568P9X2GnJTOiBzQX95rROOPzQlGtd/LeDgSm8mefVuDAeKYLPfJEivQAviCG5pU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dD+d+oJd+aBbC1tinmVTrCtbcLJfs3xO2gFlu9UrN5A=;
 b=ZZ1sJR+7BDJHeTkhFyKFBv1Cvfcrx6mIyQzEkQOWhW3XFX9wAH6MwBsHSXq/lja8mz0I9cJPVDgpMe1PZsv6qVbzzPO1FvWGT8s39EahQCyiHIjT3NeLfLgpaAgv5fOHksZ5Lyd+gDpkaXY6v12sme3WJPvKB8SXYBbnl1qywb8=
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN6PR12MB2847.namprd12.prod.outlook.com (2603:10b6:805:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Wed, 15 Jun
 2022 05:20:07 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::250d:5a1d:c45:222b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::250d:5a1d:c45:222b%8]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 05:20:07 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/4] board/zynqmp/post-build.sh: auto-generate
 extlinux.conf
Thread-Index: AQHYfAnsw+0e+ELhkEOy+RH/cLEQbq1P9lbA
Date: Wed, 15 Jun 2022 05:20:07 +0000
Message-ID: <CH2PR12MB5004E168E627B341FB336322F0AD9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220609140449.210030-1-neal.frager@xilinx.com>
In-Reply-To: <20220609140449.210030-1-neal.frager@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 531b83c8-2491-45dc-d03b-08da4e8eb5f4
x-ms-traffictypediagnostic: SN6PR12MB2847:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtFwd
x-microsoft-antispam-prvs: <SN6PR12MB28470446DC22A78E11C37869F0AD9@SN6PR12MB2847.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 86BUftFIau5eZesuFfszFsaGN02ChCTVHmINeWJj0FfgbNhTKOVBN1k01c3KdmNuKPXaKSvPJrVYg0STXTiitYLbEKQkZUJKt7SfEjIfUBN4W4NqelkM/GYry9ddGo79R0MpeBuTZ6r9vu7RbtWhMTI25opWCmPwM9i7brJ/jnKDbqbNB8b+BUM/Wkm6+hfAphSZyPeuHqvQyQDvzwL1G4ypxhGO0NbBAQ19hBIahohLjl1rYpcOY6iAUR+9sKNCnlBpA9V0+ukVnssL/wbulahwu6xQyt0+6H+yCtsJkN6aOrbi5V1JKcwwhVMHq1i0YTD2LQCdqUz/hhbPghu3CLT+si24ClydXQevm4+tx4Bak0kovW5nQzSmDfKpYiyzLjCK+21hOlEtmOrVARyH5FDgL2O8WYOly+9ck6BVlhHR5wRFkNy2ICbX4jhkDMdyYvtmt4VmoVdHLWca/5Xy5PU6d4xfTeTa+BKy3wZgsmSak34Qo8YKTeYgF1J8xhQt7O75sZUW6yui52PluHvr+zO/79coV1Oljarm0rMGG20JBYZh5YxzWJVMbyiDkeWzSiMyki7EfqYJrRaGPc9vI38sLWaKhnYtwmu0xQQ9Ia7snufWqL8eHi/K4Nz9/lajEWY4OAVqZedhM2Bd9HHVk9YHl08iMy+3Z/jGm0ybWGTrV4HVBpeEb7xlePMjOuAWAX2v3d9Pwr6rAS3bIRlejqs7vxmYgUvR4ShWZmMV4MQU/PTL8ePepJT+WtZNHChz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(66446008)(8676002)(86362001)(4326008)(64756008)(26005)(33656002)(122000001)(5660300002)(66556008)(55016003)(66946007)(8936002)(2906002)(71200400001)(316002)(52536014)(186003)(38100700002)(54906003)(6916009)(7696005)(76116006)(66476007)(508600001)(83380400001)(9686003)(6506007)(38070700005)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Thv4t3/O/bKMkzMoFQUmdbWQDftkxnL4hTmtPyRXRxa5S44b2TzHi3cwuXE9?=
 =?us-ascii?Q?81IxwUzJk8HAnjTgPk/5/CpazymhjFdBZR9yYpXH9MzXC/+woLjaMFfnIi9R?=
 =?us-ascii?Q?S5F1mxLdCioaN5JBkKWjUOsXRmmSXMO6VDZnKd8T5vI6+npNr7jgQje00kUx?=
 =?us-ascii?Q?WtS3oRoC+D+pkBX0jXpNZhhkFDEOOemCZpPvP1qhOhtVUOKAvAI5I5OdtKXM?=
 =?us-ascii?Q?hIIKKndhlWyUqfopQM3SniQyHYoThqPYbg2H6BdnZUnDtY/5xE0eKBoLWnAR?=
 =?us-ascii?Q?BiI7M+GbNeLgplGl+43fff8/BL5xkqtfUSEMbzILqcidjD0zGM8SbYkQ9CxC?=
 =?us-ascii?Q?q1InSFIJHnbyhCkr7Qp5rRnfSUcS2H3jh6PhEQNq57fxvOGDRz+xWrXAgLa0?=
 =?us-ascii?Q?Mp4sCd2UM/q8nr1RL+I0WIH6gSphrWhSk+3U/ctoh2R3q5R4GkqXIEx4vP+Z?=
 =?us-ascii?Q?0KyED220xMdJg/1MJlA6FuQ9NnC7oWcsZtdOufPNB7EwdsoLMboKgXZG2/1q?=
 =?us-ascii?Q?oKTb0WMpVHIxqsj16kFswsfzPoZLYJ3INQ4RJjEU14TzQ5dFZ6t9mWQtTK7T?=
 =?us-ascii?Q?Ao2N5YF4JLpZDNokRE86pBCOfHKWwT4VqPVkwhQ3nnfLqNDc1EQRdz4dAmzp?=
 =?us-ascii?Q?3mE0P4aVlUNqb3Jh1d+Mhar8oJotq77ygzRHgWlpTZxPLSH5h0S+rJ4Vt9dS?=
 =?us-ascii?Q?ghN46d3TTjXmWAYvT0/VqYJfeJCd/xV0K6WqjUF7AFt8wH6Q4hZ7l9kbpqbh?=
 =?us-ascii?Q?WPecvVWDRECP/8/LTCqScre0Mjmtj2e1xSCHrgcQOU2ktRKJKK7QNSZiCBiw?=
 =?us-ascii?Q?+PQzE5/kHk1H3UrY6M0sQuilPQe6J+7+ifm5qIzmeKF4bWWZumJ9LU5wxNl1?=
 =?us-ascii?Q?5CCERkdTAodAa+UWKAD915j6ry9ZN/BGytV5bg+f4VkE+QmlqMLgOSbhh4fW?=
 =?us-ascii?Q?dhIARrAlLkJuN64ntSY1ThraeVEzDL04UJL+irC2FyCTPsnS9tJeItefg+4E?=
 =?us-ascii?Q?3S3coNHMmDA9Zal4R4zgR4m6E1Bdd0e0pTtzhfBEyiHusd0Mm0K/jDImcnFr?=
 =?us-ascii?Q?gDiYberHAsvQxcvxli/0Ez5xvixNBqzuodMZRrRhyk22Nc72G29ZXiAvQXjH?=
 =?us-ascii?Q?pQaPOA9TbXE69Oz4FkvF8p/aKbASZ4xC8u53KaYIe/xtYnQWDDlXA0oBbWYD?=
 =?us-ascii?Q?2X2dsBslQ5uCV4UIN958KDfvyJ5KRsWRIiC0epWLxuDE3Qc77OIefJFwHkq9?=
 =?us-ascii?Q?bcKIQxYfm7EE7o1mHUIq4LCtksDb+xp363EjBxMA7IgqFRay0OTDQdTrbtlR?=
 =?us-ascii?Q?thZ1cja0NetCL77I6uZN0W0b7qgY4PiU23R9BHUbpbQSC7s473z6rgqoySJD?=
 =?us-ascii?Q?mQXWpvJteqsJ3l1Q1SCtkXafiHlI1YeMrWiTEhEs86Uul5zopb/2f6Go6pil?=
 =?us-ascii?Q?DO4wQ6nPqa9YabzHSdomGcP4mIpajSK1Gjzn7L75zL/UMqSRO+32i5wPpmrl?=
 =?us-ascii?Q?wdMqq/CQ3QatK6pB/ix93bnoGb5C91OPGUrk55ZnklF5GwwHOnZecHixwyFc?=
 =?us-ascii?Q?mfT0hToIY5g/L7KV/f81uVWl4chdqkGON+uGy/lgwqI/RvIRX/7GYo8mUKX9?=
 =?us-ascii?Q?G7sYdEkLFp3jOgnEsDO83iQuF0Fyw4p/UVMTk5aDLDrbJ8jSmLu7+yZt1/29?=
 =?us-ascii?Q?2qCu5nJ5uIrDg3OW+VHn5ySRyngI8JaBTtuOshbPuD4JBmYN?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 531b83c8-2491-45dc-d03b-08da4e8eb5f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 05:20:07.0920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ytVJfNDzLOe764ANyDOSRaKlOkkOYepI4bs/XRArlCxcBTZq3EpdnqQRPk2ku7w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2847
Subject: Re: [Buildroot] [PATCH v2 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Frager, Neal" <neal.frager@amd.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> This patch uses the BR2_ROOTFS_POST_SCRIPT_ARGS to auto-generate the extlinux.conf file, so developers will only need to modify the board_defconfig file to change the console and boot file system locations.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
>  - generates extlinux.conf directly in output/images directory
>  - uses "cat <<-" option to remove leading tabs
> ---
> board/zynqmp/post-build.sh | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)

> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh index 9fd8bbf2c8..7387576414 100755
> --- a/board/zynqmp/post-build.sh
> +++ b/board/zynqmp/post-build.sh
> @@ -4,5 +4,18 @@
> # in the binaries directory
 
> BOARD_DIR="$(dirname $0)"
> +CONSOLE=$2
> +ROOT=$3
 
> -install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
> +FILE=${BOARD_DIR}/extlinux.conf
> +if test -f "${FILE}"; then
> +  install -m 0644 -D "${FILE}" "${BINARIES_DIR}/extlinux.conf"
> +else
> +  mkdir -p "${BINARIES_DIR}"
> +  cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> +	label linux
> +	  kernel /Image
> +	  devicetree /system.dtb
> +	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
> +	__HEADER_EOF
> +fi
> --
> 2.17.1

Any feedback on v2 of this patch set?  Thank you!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
