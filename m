Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26392C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 05:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C548F60648;
	Fri, 24 May 2024 05:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zWRpqno05V6j; Fri, 24 May 2024 05:13:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C44BF60669
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C44BF60669;
	Fri, 24 May 2024 05:13:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4C921BF314
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 05:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DA4C60598
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 05:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yiwyb47A_Z1e for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 05:13:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2405::600;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8D0860817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8D0860817
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::600])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8D0860817
 for <buildroot@buildroot.org>; Fri, 24 May 2024 05:13:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfKqBkqSGZW9MJcfhELPPlbAXSOEcIKyvv+BwyzH0/wy0F7WzCA14u3YX2ZmhwGHJSTvZ+pDv7oupk+M3aerPUMsAfBTUAE7k7U6vLjKfZSOJbbCoSEEKg0MXU5Hc9OQJuuvBZBxOH6baHmzQsOGt2nczubHmLgNJYYAoD+MTE/mD4NpwkCMjSapsFn7aEv/PkHqA7QNnPeg+Vp68qjC90NUg2ofkuKsjj8ocHApVOGu31JPQpOiBYkxUGEp0ac5pDKqH1AkakHD4bLr9xWumXSQoRoOjqlZakScBChOC3THIckYSMxKcFbrkomN1xabmzgff+RMKpOirYbHkFh0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOBkJvim2Fn/Nx7oqKVBOdu3n9SUEJvXqyvLGLM3WKQ=;
 b=Mha61xsocf753D/4+unJ8V/iRMg1bjLSb91eNA7vD2IC2v3piwc07WhGT0IMO5YiSdr1eys1ArwmQQzQFL9WRB364em4wBaFJKMt+o20NCNaDaa/KnVHF3EOAR0Z/EXems3U1p9MLQZfqJZob2qSsug7jprn4UaBjarSy8ysIEWJjKolZw6toF+TpYJy6kWpblne9ihbRrdzRiXUKh8UoPvOJxaVjSUS9bMy4kSLUsFLD0JJy6Ji9ktdwRgJqL7Zpg80oZkteNMUSIGE812p1EFpreHmLxCDJ0wDmMiOCd4XZ7cbERhjY2yWi2dOy6jpGLZTAPIYnqveBraPNgAj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 24 May
 2024 05:13:28 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 05:13:27 +0000
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] configs/versal_vck190_defconfig: add hashes
Thread-Index: AQHarGMGoz5QfJpYlEmY1g6km7tPO7Gk+GOwgAAOzACAANFXcA==
Date: Fri, 24 May 2024 05:13:27 +0000
Message-ID: <CH2PR12MB50046AE384EC6E246F6FAC96F0F52@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240522161338.1278400-1-brandon.maier@collins.com>
 <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
 <BN0P110MB16738955F9A8C09D69A9AD26EBF4A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB16738955F9A8C09D69A9AD26EBF4A@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW4PR12MB6924:EE_
x-ms-office365-filtering-correlation-id: def8fecc-8c00-4971-3f1f-08dc7bb03ed1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?9lhhEW2lsAA+/6g9S7iH/3azjPho1hviJSDkuh4mkf+tCOeVLpJJx/okh3Ve?=
 =?us-ascii?Q?Ner+RrQqfy3gdnvDPQKsIoEvqu7g2XYqfhe/Z9g6L/+I0T66BtSCj7O0XScY?=
 =?us-ascii?Q?fJluyYY5N9p/5xhB6s9juFy1l3OXSD/jdXVsGtpSzK9exPQWEUTi8PUbjwtE?=
 =?us-ascii?Q?uLtKcZY2/vRLKGd6YzFyiIEkgT8ufuECRr4ox71PLFfDlXAHhdXhr/0At45t?=
 =?us-ascii?Q?9L4JusoC7lQ6GgWtqU1vy5wqPR2o7wkQDYe+i324O+uy2k/z8+nRdrf2xEXH?=
 =?us-ascii?Q?cG6D42EwnOyULAMyYJjIV+m3QXwuHsixQAlcRMyTzNxH0SheOr2IveFc530l?=
 =?us-ascii?Q?exIBTa3LvARShqWYqgPHOX8wxoKSA/E3kb3tEftykDQcbCw5d91uMhdL4zxN?=
 =?us-ascii?Q?MX1Q3O035Fp4i7h5E+IHs/0mWIlQwgQ7+nkSfKBWLr980KmqtEWT5JHEAlGD?=
 =?us-ascii?Q?GgLd3W1vNF4HHbpKcgry1pJH7eveQuEJcMHpav1R1l8f/POQvlsRjzwgu5q5?=
 =?us-ascii?Q?Gc0QlRs/KFKJr+PK4LWhxbeDAIK7BYjXZyRiY1kir1iD++EjQ7QKG7mc9l6+?=
 =?us-ascii?Q?sE3oxEPJjqv2D8VXWFMCg32/LNE2pHNQC2a4EVvoXPgUlEn+CzCkSQqizj1O?=
 =?us-ascii?Q?3/S+s0Srx9cfq5bw7KDih4BWNFgmZYKqqU/bJGtSlRQsCvEWmxO545sroyf2?=
 =?us-ascii?Q?RCWdL7u2OAvHu8vnOjflRdsG7TbP0O9TN4j4bT9zidwImiRzrYeJi7Om5C0t?=
 =?us-ascii?Q?JEbw7e7hoCOxVZDfFuWe4u55Vyhq6iVoX3b5c/4QzR4jx1FiWoK3+4umpT5+?=
 =?us-ascii?Q?4kB7QiKAH4VoOoZYiuzoZVCd2qQs4nJcU1rp0i2u88VnGjFs8PUI5ox9+IF1?=
 =?us-ascii?Q?FaCjAEla7B9oSSOE8n4TU7o/q40m3i3jFFnvZa2FKGp7q+arfDVrYa3OPw67?=
 =?us-ascii?Q?i2Ml42kV1MalHmXkGaxWdku++of/bTiYqFZd9QnLm1Jmoa/ElErQdV829cLj?=
 =?us-ascii?Q?c/ea2YBmJG2xi5ba3MnQPLisuBYBAPvVsyZwIGvl6Cr+cZOpeotV4tuuvP/x?=
 =?us-ascii?Q?EiozrIGkBt9OH6apB7F7tdTqHE8PdolC10xnv1rtL+jV3GJlhYFEOIIK/8v4?=
 =?us-ascii?Q?W2MBbDnja6JOG2s2jgPGvUpfcPHoUfj4NnVdlVYkwS4TnqA5nUExPj+n9Wci?=
 =?us-ascii?Q?nfwqurQIF8pNcVN/05f8mlcORRVTjYWE2HNojIQG41YRruMPobj9GRgJyG9b?=
 =?us-ascii?Q?oG8cZMPABlEFpNWEKoqCvcrPTisgToXzcibZvYmLCw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f+cfj0gio0HbzLiCBBYLMi8t6k6zm9urvx6zMi6qnh0M9iQozeCMWCQjnpi1?=
 =?us-ascii?Q?DsMshueUNNqJ3gjjzNbaYwpln9Pvk+jcr8RFQoWtAvU4Pbs2LMMLqUNVjZvP?=
 =?us-ascii?Q?ZieRn6ZmxG9DAhn9Nj/D3NzlazGCKa9/VvTCQ39KsaKFsHBzsYRQbSqQ3WIh?=
 =?us-ascii?Q?VmxHfBdcgZ4GE6UnkEI2uLWgV2zuRyf5hrWhbPSnmsP76lWrh5e2qGZmawIv?=
 =?us-ascii?Q?DaJmFyZxWSwSsJLGd0btSy7zKAQ6lfTaIUT+aQJzFNMJvXWR580XtUNT+ngl?=
 =?us-ascii?Q?+LTyA/1Yt8CIcZpqYZeTnP5YwqSQpT36EveQMjLOv/nfy4/d379G31aJP9JP?=
 =?us-ascii?Q?et6uCccEVhWJCu5OMfRkZXlG+4hCVfNFTJvLKjUp9YOlvBO5FnVMkHCiZo3p?=
 =?us-ascii?Q?CAV51Xm5A/TF7OPqe0HOLFxx18KB7c3KrOwibrSNpj8KLToJzADp5Sh7yFMf?=
 =?us-ascii?Q?4BOMgliTB2EwX+efkO5aJXoRLkpEvFmsLhnimpHQIpgt8dRP2ZSvMddxMptq?=
 =?us-ascii?Q?MXALxJChSevsuLhCGjwNfY2x8cx0+xrIiXPC+T3jLc8r6VhdVQTb05NqwUWo?=
 =?us-ascii?Q?biZaDnRZS/e3Hlrvph2QmbKVsnqMJbfr6FXGylTbafu/VYUpuRcNleQVhJRH?=
 =?us-ascii?Q?qAupGTedzCYr6yIwfqIk6z/VR/ONho34Ahiu3pKcijCGXOwy6+yaURXjYMEv?=
 =?us-ascii?Q?z/E42LW5GIUbPtSgRspbSmZtdTYT98UNK82GwnPafghExKfBVR7MnbjqWArM?=
 =?us-ascii?Q?iAZZOBA2vh86IKGKUttbhBcoAHgsLSkbPBbGbsEULMesz8x+4pBV7zT7GE+g?=
 =?us-ascii?Q?B9O5p/3lnrKGEXbYlHmiD4+ejyznjZigFSrEAl27g2HJLyKwa9xQDd/FuabZ?=
 =?us-ascii?Q?jfW3LiOqhso3xo2wyzLDqmPB7KoisPHDhKRmf1WjS6K7kGBVnle9QLtQ5cB2?=
 =?us-ascii?Q?RrSEgbqbSkK4I2SdFhepUgUe2z/UDluuITtVEKkOugxJKaAwH5spFULc+RL3?=
 =?us-ascii?Q?T+zTXKiOuerlAEXK2a4Ng7O7Ec/jdNHCC6kUWEXHgZJ4gbkjzNAbJ2iE88vW?=
 =?us-ascii?Q?68aawIXdzsKFm/5mZTCFMz5qHCejl7j9Xh1Gy8eTENwIovt3w0PXDlm8nN0F?=
 =?us-ascii?Q?2uVAeZNpDIQ1VKVbnTlGQcu1h9d/RWMqCIT8jI0awrHWnig7GQW4sOnFxLmf?=
 =?us-ascii?Q?Y+NFRf+JfkYu5p5Yj0IkMFElHiLds6wWAKCir6057GvQNqUEdnIRPIcBVbSA?=
 =?us-ascii?Q?SuhbE1govHvNNacimWb/dCHRzf70R9el4LNty1T2a9KzB1/L57QcNCRXesN4?=
 =?us-ascii?Q?U/Bq1UZtQpX7bLoQzIVyfF1Ase5n53m9w4rWo7LYZmjxgdUCwuJ36X5uExXT?=
 =?us-ascii?Q?SWMlU3koGoMhrux9RLM88qPa8tRL3Vd9l1YP5eeJk0griG4HDqk1//UzB2Zx?=
 =?us-ascii?Q?6cXXSE67R0UnHrXHYd+hu3q2X/oaYgG8PVHC/CleJsg6LE2Xk4FqVTkNJyaj?=
 =?us-ascii?Q?QRXGwsMZPBfxlWUqcQekp13uHiuVq6B2HLPt91jW7dA0sp3CQCnR31szAcsO?=
 =?us-ascii?Q?jvEGPf+48Z963W/Msu9Eoj8JqTuhMVXgG0scBy1wYm9GRrfUn03EQW/8v1UV?=
 =?us-ascii?Q?XpzCB2tFS4rMZJb+2dAoMdM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def8fecc-8c00-4971-3f1f-08dc7bb03ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 05:13:27.7724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqLsh7CsQZVCBlplVFqeVoggvlajSeMztga0J/ME3jGfnedt6dYCP/ee1LHEBjcy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOBkJvim2Fn/Nx7oqKVBOdu3n9SUEJvXqyvLGLM3WKQ=;
 b=eD++Tiox3ikyu073eU/OxvqvuGvrEHNf9Z4iBdBvkJmUJz3izHZfxYa2C/fbIFirXZKBO6a0BR43ylVX8KYI2bGpIyktIeG8zom1v8FEz7TnEFEJN5ssk95hvHTde51C/qR1x68BojYoZYZSyE1CwkJf1KhFxSeoZDBvcxESr6A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eD++Tiox
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] configs/versal_vck190_defconfig: add hashes
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
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

> My only concern is that this patch conflicts with the following patch set which is still waiting for additional review.  The patch set below changes the versal-firmware package from one that downloads pre-built binaries to a version which builds the binaries from source.  If the patch set below gets applied first, then the hash for the versal-firmware-xilinx_v2023.2.tar.gz
file will be wrong.
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=397588
>
> Could we apply this patch set first, and then go through and add all the correct hashes for the zynq, zynqmp and versal defconfigs?

> I'm for that approach, I will decline this patch. Please CC me when the zynqmp-firmware series is applied, and I will spin hashes for the Xilinx boards.

If you would like, you could already submit patches adding the hashes for the
4 zynq7000 defconfigs.  None of these boards have pending firmware patches.

zynq_microzed_defconfig
zynq_zc702_defconfig
zynq_zc706_defconfig
zynq_zed_defconfig

Thank you for your support!

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
