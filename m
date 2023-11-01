Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBC0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 13:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87FF384AE7;
	Wed,  1 Nov 2023 13:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FF384AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glKmcgW6m_qj; Wed,  1 Nov 2023 13:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B876F84AF1;
	Wed,  1 Nov 2023 13:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B876F84AF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53DA01BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 13:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BD6884AF6
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 13:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BD6884AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9uBv0_uhSDR for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 13:23:40 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02olkn2082f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe12::82f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9943E84AF3
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 13:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9943E84AF3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQT9ahjbpS20wfTDDK8IonBQ7xHPg1k8eIOoqnk3EPcZz7+atbxY76ymjymmRPJb6f8kk2JoVSPSP29lUoZKBSf5ZhRFin+gdGfgbWADRZE+a9iIcIazeCL6dqrXXXyRG5upIwAi9/Ytxh7Tq759AgikxE0BPc+A7z1Cm7OomFIV5AeDILVseLtKa4qSqsT1ksukbd18/T8qqTd5RbAR8t1feoJACTZFUTkFNW7vb8I8Xk5TpC3CB9WnD+ew4Z6XxMkJwnKgt/i8TAyVZD+Po1mdXTKMbB4ToGqC87JxRk8rZLnw/QNoSk95u7Epw7+gCsgK+j81LPuIHI7EOLyZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Skn0ba0ma4z4PwVNjd9Jmb24BXl/HEI43I2SLu5VSZ8=;
 b=WXFmgECWuRnbNXBdS8JrUcrjfUV9X1yxASYHOMCGBEBbPqKMBTrz4vksGokmOu6eA+OYfgj/Rzd/vlNHoDXqoYg16gzSZGeCrjrc43EvrJUYpByQJfREgXAQh1FzVwUYQqzhQAQPMhMI4FImIUav6EqsGkGccAj5+fDK3mV9jmwFz48TLeuq2WDCAoKAmlc3yRye6pNRUJesJwhmeWhiDg+dEZYOe8xIFXsrjn5vl5iVqXS8q+olefjMFyVG+1Dx0UUNmDrUriMbJaIJczYZDYwt9rWD+ibYOZH5u5h2I07D8Ugt/ZZ9HGG2jE+6n1SwYDCMUs74aU5nA9ptWd5JGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ab::22)
 by AS8PR10MB6723.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:563::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 13:23:36 +0000
Received: from AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19e1:9e36:43f0:6498]) by AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::19e1:9e36:43f0:6498%6]) with mapi id 15.20.6933.025; Wed, 1 Nov 2023
 13:23:36 +0000
From: * Neustradamus * <neustradamus@hotmail.com>
To: Peter Korsgaard <peter@korsgaard.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to
 version 3.4.9
Thread-Index: AQHZ/2QUaBzkkXnXsEipws10s2ALHLBb+9OggAmSYC4=
Importance: high
X-Priority: 1
Date: Wed, 1 Nov 2023 13:23:36 +0000
Message-ID: <AS8PR10MB7427D308C41CF4B40A594100CBA7A@AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM>
References: <20231015123504.189034-1-fontaine.fabrice@gmail.com>
 <87r0lhocxl.fsf@48ers.dk>
In-Reply-To: <87r0lhocxl.fsf@48ers.dk>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [JYWcf07sGvhUdacAi1+vgAy/ZYCr+avF]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB7427:EE_|AS8PR10MB6723:EE_
x-ms-office365-filtering-correlation-id: 24fc3be2-76a0-4a15-3316-08dbdaddc0f3
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XbJHEJA6HPFqyeOPsthDvSspl12Epl2wmVV4wCrTnIXwq7OB9h8/6PsLwRwAzntRo0rE/WxJ+x2o7j4mgIoIfZd7WGosrnmSCYEcoetHJTWKc8IhcQC6txH9afa75BVNs1L08QID5UkQK9BjkINP/JtCHEZqSTUBWTFxFaWV4OjVsQrXA4kNPrxeD8eSb1wPVoCYXANG4wVbCobf16h218f8zdHem3qcPEUHF7kzLENtpwuyEAd0s0Nqb0erRaAhs0BrBjeJ+hKfCZVr8NJ8SGSzCBumfdyWR50b+D21nRkXkr7GVDja3L6GAdMIysvsFZO/bLtHDSa8qALPIoyoj1bWeNQ29+VHk3s/qls0MkovKF+IGRgcdMxPFxoR26KhWeFLgNspWKvk7AFpLRdJBrGTO6/NopOkDJgze8iyjCSEkYX+z/9mxTcemNlxln9wg4VtJmTPP6i1poRX24AS8yyeeChFtY/LDYBc/dgPlpnGdgJMaTcWjheSLF/EMVDDGZG/1BXnF0ENAN7MrmjJAY41rDpP8xQzxLN53xgegFFcN8iYW0KEbMQd7AtR7yzrepsYOVYkdM1NGar/ulAkwwKKiiznPLqTxNmqJY7raCmq3jvFnOn17ZHo3fkhre8P1SFK+w4xaF+e22BTOvzNBA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OI61p2mcBq1MLZlFryVqbWfDDHgbt2/z6EU/pF5qswKB1eOsjhJ14V3Lie?=
 =?iso-8859-1?Q?bYFhyS026XVKpc1yrFn/zT9JsbORS4oNLaj3ePT0lLibZwikM//oNKRvIq?=
 =?iso-8859-1?Q?ycDtyZgK648w5Eh2ZOU5jMQ94hhZVk7zmwbQ8HQnqCWPff1SK7N8VjHbtd?=
 =?iso-8859-1?Q?CowKS5x8WYbxlU94JNqqcOkoA2EcUHPztHzeGKi3zE5W5h3ayqQ8MIdPl8?=
 =?iso-8859-1?Q?gUKEwRVCNwERvXU+KShlQN91JYx2+Txzl8i7foMpzA/peC2cCHg/CuaPLE?=
 =?iso-8859-1?Q?SLEnAEdcYiOX9Uew6eXSNQjv9beKH5jx+KlSsowPnR4tm2yVY4/5bxIdEi?=
 =?iso-8859-1?Q?C5+h1PuJGnIQMlA8V1eMhjzJcnRskAzdq4uD40PU6Y3fL7DXSV1pNvS5ES?=
 =?iso-8859-1?Q?A4u+j6wPrhX3H1yMdF58Si0EIIHv1XhDEKLFtLTvetxE7YGDXPy0jV9owB?=
 =?iso-8859-1?Q?vRoOrFablxmSU2eH43p1J9+81tofFEwV48dmGTlcytLtMEjFnsYfO4ZoKa?=
 =?iso-8859-1?Q?NbNL4oSLBTEw7/112ap1lY2BgJqKayvtorx/eEU0EjIJ34GcnustlxW/8p?=
 =?iso-8859-1?Q?VWb641oO9WGF/vfRqvlgNEJ84duhENLuu8jGtZutuiNBbXIvzQjE9m7DED?=
 =?iso-8859-1?Q?3nGgCs+9VLsJyeAjluBUrJ5ZtgHmOOTro9jeWWwQTmQXrNcbYceX7U8Hh0?=
 =?iso-8859-1?Q?XQMKhohU71AUCOf/j+9o7V2ub0Q5SHlqb3v+OZXLE4kmh0f1fTXUKJBjEF?=
 =?iso-8859-1?Q?oSm57i25Rh+H2KfroRSsUgMJftFFjdGLjadGEAMS9dTN0RYZ7ofVu1Y5Zd?=
 =?iso-8859-1?Q?3yERPquWGUNNceKBpn/AMd+NgL9Re82v6Y8r4P/Uf+XK+CzJQ6vu8xsD/7?=
 =?iso-8859-1?Q?vdZcC9kXNxlc9BsALJiU0NtD2APNnltY+eaYtJ69QxK2f3Y/zdeh2YUXTd?=
 =?iso-8859-1?Q?ej8kFnVWJ1Oiba0cF9zZOB5UTBqQ+QWc9dwiFysX06D6IyS2g+A++06qx2?=
 =?iso-8859-1?Q?VCRb4LaVx2A+q0uNJf7zTPwpdgqVv1d9i1+aI65qxs0Aze3tnJ32i4ud8z?=
 =?iso-8859-1?Q?O0ytyh211vNIh6Y2XXDP4/OmEOKS90Y/KjTwzgKMPQKsjtFVQYPAw7CXoq?=
 =?iso-8859-1?Q?EtmSeR6wqur/QmLVMlIPytrJzWcJMEqhAG1TOfUPdjMeTxFp+KpSYTRkuE?=
 =?iso-8859-1?Q?EL4X2EGJ9DRBl3shGrPYUT9CT21mK10GogqksxK75MTwZw6Czf1qcMvLam?=
 =?iso-8859-1?Q?SjfZfckiYlQpiZTn/CdQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fc3be2-76a0-4a15-3316-08dbdaddc0f3
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 13:23:36.2275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6723
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Skn0ba0ma4z4PwVNjd9Jmb24BXl/HEI43I2SLu5VSZ8=;
 b=mQORAxa/hv7NBY6Ug0sC33vgSX8wkk6lpD4sdysiGKa5fa6OHgz/YcmydblpR2zNyT4sZsyZM/Q5lS/3OyYneKpcThV8BtR/NCurhtEWYYPSZ9KLHLoYjhJ5iT9bQdxMl28Drb0BnhUCBGegpaMrcMz9k/bgQAVmqnIyfz6D1ZkL3rYG3qDdmen/ZBSc32l1jbW0kBPNSmaUWT8qwjG9R1YDrwckDoBcxS339yi00i8T5tcSWLjZvkz3MMbe0SL38vV0BMLfJoi+QiW/jpNUHqmMB89dHv/fQdsyLrnhSunC5DWBCvvYVB8iz4TxUEnuBWIeuMTYGbwpasVyc09n/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=mQORAxa/
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to
 version 3.4.9
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter and Fabrice,

There is now a 3.5.0: https://github.com/cifsd-team/ksmbd-tools/releases

Regards.

Neustradamus

________________________________________
From: buildroot <buildroot-bounces@buildroot.org> on behalf of Peter Korsgaard <peter@korsgaard.com>
Sent: Thursday, October 26, 2023 13:12
To: Fabrice Fontaine
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: security bump to version 3.4.9

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix two security issues that reported by ZDI.
 > https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.7
 > https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.8
 > https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.9

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.08.x, thanks.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
