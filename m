Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9B6C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 18:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6672E80C20;
	Mon,  8 Jul 2024 18:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ELOkor93aH1; Mon,  8 Jul 2024 18:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A73980BE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A73980BE4;
	Mon,  8 Jul 2024 18:14:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A49B21BF2B1
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 18:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9182E402B7
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 18:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFHvO5fAe4VT for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 18:14:17 +0000 (UTC)
X-Greylist: delayed 938 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 08 Jul 2024 18:14:16 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB832402A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB832402A2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.143.35;
 helo=mx0b-002e3701.pphosted.com; envelope-from=david.rush2@hpe.com;
 receiver=<UNKNOWN> 
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB832402A2
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 18:14:16 +0000 (UTC)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468BgWvn018924
 for <buildroot@buildroot.org>; Mon, 8 Jul 2024 17:58:37 GMT
Received: from p1lg14879.it.hpe.com ([16.230.97.200])
 by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 408cg5vgv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 17:58:37 +0000 (GMT)
Received: from p1wg14926.americas.hpqcorp.net (unknown [10.119.18.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 96C40147A1
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 17:58:35 +0000 (UTC)
Received: from p1wg14926.americas.hpqcorp.net (10.119.18.115) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 8 Jul 2024 05:58:21 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14926.americas.hpqcorp.net (10.119.18.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Mon, 8 Jul 2024 05:58:21 -1200
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (192.58.206.35)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 8 Jul 2024 05:58:20 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrEBi9Q60q04S2ZvXMZUBXaIIYpSXN4fDNSgA8e7Wlgm6n6oasmnGlgN9CAccsykhBL3DFCk+MDhw3E+KH14yBxO7gPB0tsIUcNuANSkPTJSEaDrXld63FX456M2Y30iAaCmTI1X5j1UN+vDHT6nbsY0OLD1Ytd08ZpYROoVHOn0FU1J9bXaEiqUa6Gcjuqp/09Tn0ahgNd9UkZSpiNyiG6+ZEEr/o/aa7gPn4mJnj3lMOz72GS/rn7K7t2R5VeUwv7ZD+/C9svcbWAhM8a7yWetMWdAcC1q6cMDCelCGNmnxHi+yq3Xo8tQXn2CklNLroHuPQd9TRV85PFVLuSwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYQXjrmQReo4YlvEjy6fV6HdwJ2n+HVQI/bAU1pRS6Y=;
 b=d78eSNX6oFNJbnMPJUJRq0RrA6ry4/XP675amMt14vBWQQKK8CnT6ywlL0gMq5caEOHBq6I+hFkHKBrYGyKSDM9HXznwCuNKbhqgb9sXypc+0Twq+gsqM3O+NPiPzzf1ttYrKnuoRx7m/EMJuNFlGxIZwi1dwPoKro2RkVFnx3iThp+aQGJUf6QfnTyHuHiTwkCGgZDUo5AWcYCV4XkITdn82UBhANQXPA5Zsv6ur6SrrfXlULvgFhQFlb6qMUKTdlEGdaR83MrVYYMRtv0pnh4YBxo8ORyIGQaVDrKNVKuC3toXDPxrMHzPhaIYPTHVCUY4cPqukfhm6irGEKAWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4b::17) by
 IA2PR84MB3859.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:208:4b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 8 Jul
 2024 17:58:18 +0000
Received: from DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::e6e7:50ad:337b:a788]) by DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::e6e7:50ad:337b:a788%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 17:58:17 +0000
From: "Rush, David" <david.rush2@hpe.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: bare metal toolchain tuning options
Thread-Index: AQHa0Vg7XhcTpE8akEqM07Z9npV88A==
Date: Mon, 8 Jul 2024 17:58:17 +0000
Message-ID: <DM4PR84MB1664512ACED9F33EDD096ADEB6DA2@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1664:EE_|IA2PR84MB3859:EE_
x-ms-office365-filtering-correlation-id: 6a3db2aa-7864-418e-9978-08dc9f778c0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?p7L3T/Cj9gzFRa9LrDrWiHoTukNIZZfK59Gcm6HQTsNow7V9GmdnJCPyi/?=
 =?iso-8859-1?Q?U7vU3m/odCum6QlX4Mqwbw+Uc0wMw40wmX/VSSI/Y8sw9N5rRWPxlOhtKw?=
 =?iso-8859-1?Q?4fCLtPSLNCEiBo2OSIFbUoEUgVWuWDl8Ll37WW7cbb/3Jq5bee2Av1ZoQC?=
 =?iso-8859-1?Q?wVP+yKC3R7063ELS887gSoX3wVEMiOGJ96wS6qNYzCkSNsfSqY3pdjRdu+?=
 =?iso-8859-1?Q?Dym2mMZKZuJGyZ1F95fFsHBBSAtbf5nzHIUw3A0kffuZdTXpFLP6297GYi?=
 =?iso-8859-1?Q?46xsBAJnCVDITyZPkOlyM5up5YVU9DpSA5FeFEnjyB9PEDHdKe8hOlEXCE?=
 =?iso-8859-1?Q?kxPaBxF06yITmd24HuQOxfpy2I2gqFdcHeqNB2O5DGgnde9XaZuSJ12OQH?=
 =?iso-8859-1?Q?57aUdcsfiT5hJxJgjZv6sRe6tl6vNLk+808NIEHnbShCPR7VqhPVAUFnZU?=
 =?iso-8859-1?Q?wg/8o08uo8Hu7dhAvW3tZdjVxdfWPDqbk7bwyuGPfXGbp9W2xfD1oJakhu?=
 =?iso-8859-1?Q?WTBaI0LiEKXPoS6bFFi537SeNjQjNDPPWcCBYSFDNzrJQ/k8zN8GIOq+J5?=
 =?iso-8859-1?Q?NzjMMWLI4UNd9yYycoZrnF3CiQnWBV5K1RP8Hqnv9qk9txTFiRI2pyd/iK?=
 =?iso-8859-1?Q?pS8KNWTJNw+4JgeGcpRKYElrrO1vqIT+CkvX0Vm0nSmrFqhP1cOOR+KSwu?=
 =?iso-8859-1?Q?Rgi+TsZh/jn0HABq5R60PLKvM32HJG5uGxPjy1hD3E4vz505ANAcbnGNV5?=
 =?iso-8859-1?Q?fy7YeBfTuFva8OW4VkzXkoNb+1myjZf6xE+gccI11S6NKRkayRKPEqYn09?=
 =?iso-8859-1?Q?azoLCAMQ2sEYbEoWqzVV63OBFZgrGKozKbb/BcgLT5/13TtbCTnW2TY2eE?=
 =?iso-8859-1?Q?/tQLeKkTD1acHLiHCHx0pBd5RiUCoi1r6BO6Lo6C4AmXTsAaE21YheQRq+?=
 =?iso-8859-1?Q?QFaQfSJqXrZVXmSJvG41zOM2+SKSNiXQyQe5WCDAaiv7nC+3vB4yl7H/pf?=
 =?iso-8859-1?Q?uvTGxJvNUQi8TbQA4o7gD1unAm9Dh69rh+KdYWPsJJSPa2qya78tIqc7XI?=
 =?iso-8859-1?Q?VFePruMwlsmHFE3aL1exIRWHk6WAsm62L2Kh40mshWfP7o806M04Fd1cnd?=
 =?iso-8859-1?Q?d2WBu9Ir+lOzA7x0Do1bnvhZOrGm4ws/I+wrDatNe80ruQ+XZrxGP2gKVr?=
 =?iso-8859-1?Q?3I4g8LuimsNPBdODGnBtwtDtAJ4RuhfKohXauLsHr9tYlsr8NGsCixwSVq?=
 =?iso-8859-1?Q?tNrzkswf+2qj0CUaj+S+wqoqt7NFSb0TzHKL9+RpC/TZ5DejmvsJMvZ6jc?=
 =?iso-8859-1?Q?JeRPop75xRuR0LvkS+Rw3PthSX7BUpq3E7JAZxZ75kTvdh35sv/PGgql8d?=
 =?iso-8859-1?Q?5Jn7fsa23k/VPi3qby0Q1PltZTQDnT1kVFNRHOHPz2S1mjhrrHBnCQy4Cq?=
 =?iso-8859-1?Q?Q3PWULjXGe2GLLuwpI163BSvN0TwP3FcvdpMEQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9DBVu7F9WpfOXL6dkzEmmdCsLFKoLJbLF/39apx/nxCpG/pQD2p0p183g1?=
 =?iso-8859-1?Q?4YOZcrnHJruUwjICmFp/cSzEKuxvHr2PSRCvLO76rRJFQ93/jkzt4xQtJj?=
 =?iso-8859-1?Q?VpTPJphtJUaX2wB1tP0ol6atkKOMWwUoLnIhdV5jA+bICbWIl0vbUapW+M?=
 =?iso-8859-1?Q?n04kHbb3/JVsPUKlle7t60wOQgW5vxL4EFfmk1I1kxIBm1EqPtTh8qJ2ih?=
 =?iso-8859-1?Q?Bexme9nS00KRWweUTdqdCZNXv6g6rJdwcAfcXHLrOpVuvkwJl91ODlJrU7?=
 =?iso-8859-1?Q?Yuiksp4W0KN8DlOcOLflQ/A7TTay/DJQ2NQxbxxygWbelvu0maqlu2rosf?=
 =?iso-8859-1?Q?UqkPKHUiDawASy2m6zM5V30wfx9JuqXDG9uaVv4VOlG+wrTU6kyPlnC7dS?=
 =?iso-8859-1?Q?FejXhNReR9x5Nf7D7rHzSjSmdfJ0A0G9e4Lzx875LtIgakMulmEfTTsTCe?=
 =?iso-8859-1?Q?vdLq/HW5Fb7zLEUkRSoaefy3EDWlEcGuDhxwhUNrQ81Ti1jcCPdxgUjKTz?=
 =?iso-8859-1?Q?V0QoZ7PuErG8omYVG1H+BroIBE3Aty0vUZwNcEohPbKit95RI+hpmAqkEj?=
 =?iso-8859-1?Q?VNEFsdDJo+5LxFQW+2zsuqQn8Tasw14tn5PJH7RwjHrpiJySA+AOyI76eJ?=
 =?iso-8859-1?Q?4bJkhuHq9Gyp7eZ4WA8lY1rQAoOUqlyls9X/YMZ2VvzO+LoDGGuZdmbZlA?=
 =?iso-8859-1?Q?2vJpgJ3qCxfxrT80nXd20SLRuU8TTs9q3p0AlQtXhuyqniBx6jLQZEUpKv?=
 =?iso-8859-1?Q?HDkL2W9yYtXYB/x5CJ5rmmlsXr5yyDrpBk0hcZ6p25bi5WzbnpqXNbi96f?=
 =?iso-8859-1?Q?Q/UOJuBDtrYBXpqssZQmwBm81VfVAmDyxiRCdvN3sPuTR9NUdbzECnTZp7?=
 =?iso-8859-1?Q?V7pZqgkOBbYrQsUPPRy8/tUbHu767ld0wwomiNySMzX0jLmHsn2nf8Y4RO?=
 =?iso-8859-1?Q?a8DKusYkUgkRmYvfo+lvy8GG7yJJM98+E5xrG/JirDTHDwLhwmuaF7uKJj?=
 =?iso-8859-1?Q?Gm9merZKCudvG0hu77G3NC1X/RZwYVwCHRMWsm17FnYQS7NMV7KUM72yUe?=
 =?iso-8859-1?Q?RrsAHf+wJZBgdPmwfNg2zR5tDyKSJqpCtMMPP3t44i1WHhsqlDh3Ku32Yp?=
 =?iso-8859-1?Q?NjfTZXgaSfbMFUiw2rSMhurirYSI/0yEoG+iukjtkBSTR7JKCGEGPa6kYq?=
 =?iso-8859-1?Q?mfRNPucwfnlf3TGdMjrjxlynpjmjPXcBLsE3iTucycVDSvb/TCtx+PcANi?=
 =?iso-8859-1?Q?M9Tfd0lfJiPKQwU/n/vxb1xT9sP73OfYGg5Lmc0a0jz/7Ezir759RgDGI9?=
 =?iso-8859-1?Q?3PoXZryBJZhuxPnqoSntdfmWynHrrgHtq6cGtPXC5cNZpdju49yMP6m54B?=
 =?iso-8859-1?Q?7GwbnMyXdhcOiYY6BfH8rUnc7IFz5CT/ZHNCSIepJnhEGC4sX7PlS9q23R?=
 =?iso-8859-1?Q?2H/8kbIq1yg5y/m7otHPTXA/3UkQX5L+9vWQFDnVSirzDgcTc9aZHCK2dH?=
 =?iso-8859-1?Q?Z5d/wsMt4xdrpHibRRFB9R+JmKTVHAHandqQhCTQDxbvZUDUR8pVVfXnqL?=
 =?iso-8859-1?Q?0M6uvsfl4qx11MSD+2lz02U/WrCgRsQJYEyp+WVAnXnFALIO+fwp61aK5Q?=
 =?iso-8859-1?Q?rO0SUfywN+FpUOrMgQhHcyegRGAGMn92FEHp6l/JxsednT/hjZiBR6dU5Y?=
 =?iso-8859-1?Q?eRGGEUPyCiwpGoa1z9Q92jRUOKznkVA8aETBvlWS?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3db2aa-7864-418e-9978-08dc9f778c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 17:58:17.9361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPnKwK1xVr0GMXBFCePG8MCL7Bv32PfYAV/D/Sbn/TWjH/DHQUPD6Yqw3E8RR8ZY2zgjn8wA13VxeVNzvAOrXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR84MB3859
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 2LSfJ1mWzfKMW17Icc5rL7tAQqX7DHgQ
X-Proofpoint-ORIG-GUID: 2LSfJ1mWzfKMW17Icc5rL7tAQqX7DHgQ
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_09,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=687 bulkscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hpe.com; h=from
 :to:subject:date:message-id:content-type
 :content-transfer-encoding:mime-version; s=pps0720; bh=DYQXjrmQR
 eo4YlvEjy6fV6HdwJ2n+HVQI/bAU1pRS6Y=; b=UwLvN6X40k1Nva6s2xTIDvPE9
 YWeuG0YGnhe+ue1arN8TnOkZ8HBzEMZHtZ4VLQcwlcOduiNw2K4biLKWQy9yt95V
 qIKvy2MVElh1qxhSO1EWa5dCvmM75A4cIUg9PysJ3NtjtPahWsWeJzAeQ5uV7gyH
 RhhdYLN0J31wyFn46ZKytayoNHqNtUYxKyegUgSRIOu+5QgtZxwMTYaWdRTQ6NCH
 /UJXOTAKOIEfxn2wqwXiFCkqw9BlqRo1yJMgStkJo9iLdTB7Y4nUP+P8EUOs5pED
 7x7d9UtkhL3RyLCoL6EV6fBBksCap6dxOtpA/gNyEyLPQwEKKemBslpBvCK+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=hpe.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=UwLvN6X4
Subject: [Buildroot] bare metal toolchain tuning options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Having the option to build a bare metal toolchain alongside the Linux bits is fantastic. As things are now only the arch tuple is configurable though the defconfig, which may not always get to the desired result. Has anyone looked at adding configure options for tuning the bare metal toolchain package? For example, when experimenting with an arm cortex m4 microcontroller with a 'nano' newlib configuration, the following changes to gcc and newlib's configure command got me a working toolchain:

--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -57,6 +57,10 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
        --with-mpfr=$(HOST_DIR) \
        --with-isl=$(HOST_DIR) \
        --with-sysroot=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) \
+       --with-cpu=cortex-m4 \
+       --with-fpu=fpv4-sp-d16 \
+       --with-mode=thumb \
+       --with-float=hard \
        AR_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ar \
        RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ranlib
 

--- a/package/newlib-bare-metal/newlib-bare-metal.mk
+++ b/package/newlib-bare-metal/newlib-bare-metal.mk
@@ -28,11 +28,19 @@ define NEWLIB_BARE_METAL_CONFIGURE_CMDS
                ./configure \
                        --target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
                        --prefix=/usr \
-                       --enable-newlib-io-c99-formats \
-                       --enable-newlib-io-long-long \
-                       --enable-newlib-io-float \
-                       --enable-newlib-io-long-double \
                        --disable-multilib \
+                       --disable-newlib-fseek-optimization \
+                       --disable-newlib-fvwrite-in-streamio \
+                       --disable-newlib-supplied-syscalls \
+                       --disable-newlib-unbuf-stream-opt \
+                       --disable-newlib-wide-orient \
+                       --enable-lite-exit \
+                       --enable-newlib-global-atexit \
+                       --enable-newlib-nano-formatted-io \
+                       --enable-newlib-nano-malloc \
+                       --enable-newlib-reent-check-verify \
+                       --enable-newlib-reent-small \
+                       --enable-newlib-retargetable-locking \
        )
 endef


I'm not looking for anyone to do this for me, just wondering if anyone is actively working in this area. If not, are there any suggestions or a preferred strategy for dealing with a potentially large number of configure options like this?
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
