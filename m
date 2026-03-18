Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEA710854DB
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 09:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6385D60745;
	Wed, 18 Mar 2026 09:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_kba1ZlSh1Y; Wed, 18 Mar 2026 09:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54838608EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773826239;
	bh=gkMmYDC0Ybhn++RTezOjD+Ztoj+KLqjR++CGj8oi/g0=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qm/L6P2oibTGkt+AqGLLFM8avoFYDYOlbmZnA+nuU5KiGWb/qmJWN2uZEdgeCuGmk
	 z1w7zPInecBaOkdF9AwtE1bj6QXM+ccVnu0afd+toeRLuEPzGab9j/q059lYZEFWbT
	 n1koPb8lO2V/gN8Q0gtcXst1g8KvSxbCPk9OgwklqTTmqAW75GUnsjmexOWn1POKQc
	 5/JzKrBXoZxHO7M/HEk072cpx5/H1LLcFwaffAS/SlIHNakHOyNXD17/si+Mi3HFs3
	 liNUaNmOkHTktKY65fPBgEm3lyymF2giF3//WNOvrxk8Z4BQY35ZRBxaQ5BlTZ4JmY
	 Kc8u3QuS1nRcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54838608EA;
	Wed, 18 Mar 2026 09:30:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C33B1AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 09:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DACA838C9
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 09:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUDPeq0aeGEm for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 09:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E1E0381094
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1E0381094
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1E0381094
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 09:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJMb6XpNRF38y9nZdYwASuu8iLQ/4iGWjwdWT01xijHwiJfBIx26TxGCE5NTrFPJ6HRGCmcc3Cy3r6nxw7y5euM8CyiSbImaqwZZaHuQuNIkQ2HjteWujhJBqQgoG1SWhUUYnu4orCGawANSqVIa1XQ5jYWiIKp3nf1vp3N2wimlebR0WxdevjJhVXDFvhrJdziHvLZS33EVHBNl/HqHh+f497ejjLOvHGOxe0G8WQ+UORc/usFBOQE89vJMlVQllMbrCyGU4bk1GaJhHRNLi2Mb+s4nA5zR5MkyfDsOeyVexi8rEU4DLtzdKwqkvSi6d4GJHTJJct1rLG1rOjdLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dtwnqkDVdGcXcboxE0HEy9W17hUUsfMpv/VAhN4hio=;
 b=alh8uGlT1CEsZcX04MLZg3X6M9z7BkP4uYUPGAeI7NUX6zpImE2/w+8Srqxc3EMaVYX6vJZ7RzQz5l8Lsz1dHytI1T0WLDh/O6eedgaM3om3+ot+WdB9zShqijUKd6EunFbWjaj2FOlUrQpsH1QzgK4nVhDq+ntk4lNz5Wsr7QLUd8X6iz9V/LAg0yCehSxoao2b9HkKF/d2SpkRa0sNxkhI1mt/+HNsEUWqXK90WjcTxfF3bjDg+nLrI/c7krSbqryiq3yI/sL2/jYIkn0smY9DrAicNN3irjsn7ddCksEkkaXjLH3teYkrf1XheMTkVMh9rHoB3Idy0QKyjOUIgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by PH7PR12MB7869.namprd12.prod.outlook.com (2603:10b6:510:27e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 09:30:29 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%5]) with mapi id 15.20.9745.007; Wed, 18 Mar 2026
 09:30:29 +0000
To: "Hill, Steven " <steven.hill@collins.com>, Peter Korsgaard
 <peter@korsgaard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Julien Olivain <ju.o@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Neal Frager via buildroot <buildroot@buildroot.org>
Thread-Topic: buildroot: conflict between host-flex and host-bootgen packages
Thread-Index: AQHctrnbFcMTNUAtcUS2hemE3tcmqg==
Date: Wed, 18 Mar 2026 09:30:28 +0000
Message-ID: <BL1PR12MB5032AF04B5E49FFD2A3BE55FF04EA@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <BN0P110MB2020C1A7861CBC35249850D2FD41A@BN0P110MB2020.NAMP110.PROD.OUTLOOK.COM>
 <BL1PR12MB503230F5A4525872321E07E4F041A@BL1PR12MB5032.namprd12.prod.outlook.com>
 <BN0P110MB20208E49672D992D38DADF09FD41A@BN0P110MB2020.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB20208E49672D992D38DADF09FD41A@BN0P110MB2020.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-17T05:54:59.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|PH7PR12MB7869:EE_
x-ms-office365-filtering-correlation-id: 01378ade-f0f9-4414-69d3-08de84d0fe6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|38070700021|41080700001;
x-microsoft-antispam-message-info: 6GpwWNhMUjB0Yrl79I3f9SsKXozvF73TBWcV1RGrCosc2likKNdSUqxf8TPUCzUdebBR8BOksNsCCwDFNRcoawHOax6I/muSSqL3Ah4mO6n/sqhh346A8PrcweQzL9ySDHxoNuO6ZLoYGX73OKCjw93eayduW/u77RzIPA7CyG+yuZbjDG1JDlgKeAKd4+SFL2F2LKqyxGm8JWFarqCIWCeDmC1edZa5hGkOR0Kdvk+J5F9FqEZDjdWYz4yMUFPv3vOXHBWVel9FC57JsxTxsMqJgc2K7HcRkXoNTucOvOxAaaaJheUQx0fbkdZuwI4ITUSnUN0DbBkyPNnitjtZMamDGhm5YR+rUVqk0ixpeFzHRFYLcTouQ1F7mYePUNKBFVlI9xBM4o7T1XD+nqetJHdWFa2Lum7EqUiSfD2Ga3ad/p9Lc9fJeSTZX9Fk0nKxtGU4OcruzY2Ze2Bm3tv15CjxnJuDrNDwVYoIz4viaXUxBKEDb1BVtafkXzhpidhdZwxNwjn9Lcr5ro7588xmntUxh18jctFNp0xJ07SqXuYKEOTanz3e/v093MAKCgg3HKIx/ceavWF2ctMV/FHbYBJMv00Prvr9WVJ8ksQjuvuwEgX6n72WBQDCjdEF89DZCBoU4I0qjAl1BDjsyugJwb3xAwtRpbZ+67Qr+v0I+x0q/lgdNvVXI1fPGYh+RWLyCq/pxXjtaex/1pySdGNdhrZzlgePgGI6SCwyKBWvK1EnEGu6rqlgTxzzWCZdYqWcFYuqhelVcafyU9aF82qN8jFCpNVB1RAoFZYPeSOHJEcd+W5Lv/Yuqwa5Sj9nxSsoPxQAnGCK/EfUJvjm/yfaOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?COQmE3b5ezp6aubuuxIEjHM+6oVE4HqSiBzlFHMM/uat+b1yIMFGb9a8Hw?=
 =?iso-8859-1?Q?zT4l+42wYjadlLDpUQnQAk254/3yeiwDjJ06t+xcuOr39ltUmnmGq9zgAY?=
 =?iso-8859-1?Q?/l5NNL2yiEKbyePtQhA2Re5VzOd3gxnlkPcXGNHlN4rZ18g/fPiiEi6rmA?=
 =?iso-8859-1?Q?x4ZRztJi1lPmz93RPfvz/GAIS8SnJzDcDhkq0lRjGGbGXDbKY9Rl/xGGgt?=
 =?iso-8859-1?Q?LXSjQIEXjjc0l2h3Dv9ce1k2gbR7Zcazjnx/PIsyzdPmGnmXqMI/vvx9Qy?=
 =?iso-8859-1?Q?ZoOKnLXLGhNIJTGdJ+xRB5kk77VYCMzOfM6Pc+LkNFC98CUqGVTmw047x+?=
 =?iso-8859-1?Q?zagvL0GCoIKnXMtFZXNCSFYmJaIbPloWiZf8vT0xkeBJBLS7DODoQevW5i?=
 =?iso-8859-1?Q?nptHLS9/il7QDh3MIN+GFIHND49i3kJjHARNhZCzw0mL0EKVnCUExwPh6Z?=
 =?iso-8859-1?Q?EqR8Nta1zYKJOd74IoOQqooyEUaJ9XLtLrd4tsf4THiEXQqyQrtv2YjeVq?=
 =?iso-8859-1?Q?bhOs6FONzY+4AKcSQDM9OtB+7x+N3/jT+WCP29Xo6yQ6tJTpFaUkyBV4Dm?=
 =?iso-8859-1?Q?tbnU+Q+gciDG1/mH8sAilDh+coaoDdS8Urh80gLs+0NQ/ZloUWWBkg3KCH?=
 =?iso-8859-1?Q?4BUi+kRFMhyQE1XfRbYONNI42sti879Nsqes3fktWnt+RohpMX3Vx7CYCy?=
 =?iso-8859-1?Q?TKTViGsuDBZuJ0pvMJrDWB7Y3V32RZqGwMTDjc/HjKQN2nujbAeCgsw79y?=
 =?iso-8859-1?Q?RYXzQFsOQ/9TXgQAp27QF6l1uqa05YuMVSIQiDXpP36KWaS+uNGUWzzi34?=
 =?iso-8859-1?Q?d5kV2DCT4HwD0rc8LEB1euJ5w8bX88mMYcDctsAA2F80eAft7RAAD8wu5l?=
 =?iso-8859-1?Q?3MPoctk2XpiBPBnid6Z1PSPemnMIdRovHB1NuKRpoLML48ymcsLqc0wTOH?=
 =?iso-8859-1?Q?m2S0WfgnCX+nhUnhmxNA2wGqD9xMihQOhHNN4JlWxf90dXUtjFEnLZvPdl?=
 =?iso-8859-1?Q?qhTUXSgmcWIz88hKtXdaxqmtjk0K0X3fBTSgRv2dUWXYdQUAs6EHA8KbKA?=
 =?iso-8859-1?Q?POiVcaUOsd9IaCfnOTd7uPOaC2EuHkISoan74HwynVIhsQuxOl1EwTrq3c?=
 =?iso-8859-1?Q?3LT8pzm9gzYgRJVeFyduB2xtMsNtp7sjRGyuiz/hlX1gUbvBAxX0qqcY8l?=
 =?iso-8859-1?Q?imdJsbwBkT66B8J2MSYRhQQZ3yQShzXqvZALmXo528YtQDwRozICNoX/Xs?=
 =?iso-8859-1?Q?0l9qHEewtJpYlZpH/sknxnfSt7pf3ejueYS7FH1ZFhQM8m0x8C6pAzsMgM?=
 =?iso-8859-1?Q?QzUDU9rMTDA8bHXUqP7a8FvSUU2XdNj2oTZI/LV6eRjVBtGI8LHFQ/EUSy?=
 =?iso-8859-1?Q?G2MYRnrefFcQo0vYVDL68gMWsgbCMN33RCzSsvxXlxM3jNwgfybyWoXlF8?=
 =?iso-8859-1?Q?yLrDiPlJR//AXX94LevTx3ti9FcTB7Qr0S/C3d7eRjSi3fNi1k2qwnqgY3?=
 =?iso-8859-1?Q?Aunc6BI7DtGKVgopvMt7bc9MrTEVBuxj9GD3NM73h7wMYRs6Ue8gIqj1rX?=
 =?iso-8859-1?Q?e2OSp0O+EGr/HUq0yOEpbpyT976oDsCBXlNQ0dvSf/L17E7LHjonqm6AbQ?=
 =?iso-8859-1?Q?5oSxj6maX/kaOm8x/r5ct7lgByqqZ9zi0+M3tbP34n8dxBfhR6fHq8beI6?=
 =?iso-8859-1?Q?C0jSPSvSK0x4aw3fe1njo0Ny4p9+a6o3LB4Hxol9SkSva1MaP+I/TyuWOh?=
 =?iso-8859-1?Q?sIn1WwUIuMH8v2zTYNYR/yIGyWWtPtBm1MQeZbBuyodH8B?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01378ade-f0f9-4414-69d3-08de84d0fe6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 09:30:28.9791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9C+/r/PPDdns/XM/StorIRSriSnxFAIyBsQYNPsvebLGL5eyHTXJvLI2Mvyptkz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7869
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dtwnqkDVdGcXcboxE0HEy9W17hUUsfMpv/VAhN4hio=;
 b=5kGGYvaMPy1kGcASdvw9EVVFiztVwmCbFdLr7NHkmkneXLu9YedqmJKUbZ7fhlOmyT9K8Im5/WC37FBbROO3WfPBNKkjBRA2j0W3oUJmTJtF/CtEDToFtsc7ubv0A9bWkVX8OGZbkSYi7ct1wVQttX6JfgR6STKWD9wV2rlszPE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5kGGYvaM
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: [Buildroot] buildroot: conflict between host-flex and host-bootgen
 packages
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Steve,

I have managed to duplicate the issue, so I am copying some buildroot
maintainers on this message so that they can have a look.

Simply running the following as the first build is insufficient:
make host-bootgen

If you only build host-bootgen with its dependencies, you can rebuild
host-libopenssl and host-bootgen all you want without any issues.

However, if you complete the build with all the packages that build after
host-bootgen, then you can duplicate the issue where rebuilding bootgen
creates an image that fails.

It appears that the issue is coming from the host-flex package.  Once the
host-flex package is built (happens after host-bootgen), it is no longer
possible to build host-bootgen correctly.

To duplicate the issue:

Step1: clean build
$ git clone https://gitlab.com/buildroot.org/buildroot.git
$ cd buildroot
$ cat > .config<<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_HOST_DTC=y
BR2_PACKAGE_HOST_BOOTGEN=y
EOF
$ make olddefconfig
$ make

Step2: correct output of bootgen shows help menu
$ output/host/bin/bootgen

****** Bootgen v2025.1-Merged
  **** Build date : Mar  6 2026-09:20:49
    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.

------------------------------------------------------------------------------+
                       COMMAND LINE OPTIONS                                   |
------------------------------------------------------------------------------+
 arch              - Device Architecture                                      |
 bif_help          - Print the BIF help summary                               |
 dual_ospi_mode    - Generate 2 output files for Dual OSPI                    |
 dual_qspi_mode    - Generate 2 output files for Dual QSPI                    |
 dump              - Dumps components from PDI as bin files                   |
 dump_dir          - Dumps components in specified directory                  |
 efuseppkbits      - Generate PPK hash for e-fuse                             |
 encrypt           - AES Key storage on device                                |
 encryption_dump   - Generate encryption log file                             |
 fill              - Fill byte for padding                                    |
 generate_hashes   - Generate SHA hashes (PKCS#1v1.5)                         |
 generate_keys     - Generate authentication keys                             |
 help              - Print the help summary                                   |
 image             - Input Boot Image File (.bif)                             |
 log               - Generate log file                                        |
 nonbooting        - Generate an intermediate boot image                      |
 o                 - Output filename in MCS/BIN format                        |
 overlay_cdo       - Overlay CDO files of Boot Image File                     |
 p                 - Part name for generating nky file                        |
 padimageheader    - Pad header tables                                        |
 process_bitstream - Outputs bitstream in bin/mcs format                      |
 read              - Dumps the header tables in human readable form           |
 authenticatedjtag - Generate a Image to authenticate PSK and enable jtag     |
 split             - Split partitions to diff files                           |
 spksignature      - Generate SPK signature file                              |
 verify            - Verify BootImage authentication                          |
 verify_kdf        - Verify AES key generation                                |
 w                 - Overwrite mode                                           |
 zynqmpes1         - Generate boot image for ZynqMP ES1                       |
------------------------------------------------------------------------------+
 Note    : Some options are valid only for specific architectures.            |
           Help for such options include a list of supported architectures.   |
           If an option is supported for all architectures, this list is not  |
           included in help                                                   |
 Example : Supported architectures : zynqmp, versal                           |
------------------------------------------------------------------------------+
 For more information on bootgen options, use the command                     |
           bootgen -help <option>                                             |
 Example : bootgen -help efuseppkbits                                         |
------------------------------------------------------------------------------+

Step 3: clean bootgen dir and rebuild
$ cd output/build/host-bootgen-xilinx_v2025.2/
$ make clean
$ cd ../../..
$ make host-bootgen-reconfigure

Step 4: bootgen image is now incorrect
$ output/host/bin/bootgen

****** Bootgen v2025.1-Merged
  **** Build date : Mar 18 2026-07:08:01
    ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
    ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.

ERROR: syntax error
-h


[ERROR]  : Command line parsing failed with code 1

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
