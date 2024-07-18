Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B4AC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 15:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413BB8104F;
	Thu, 18 Jul 2024 15:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O150Bz4COQLl; Thu, 18 Jul 2024 15:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5267F80F21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5267F80F21;
	Thu, 18 Jul 2024 15:10:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1812B1BF35E
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 15:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 120E6400A4
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 15:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncYfzyYzhY2R for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 15:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c105::1;
 helo=ch1pr05cu001.outbound.protection.outlook.com;
 envelope-from=murali.karicheri@sandc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 784384000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 784384000B
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c105::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 784384000B
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 15:10:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0AVyzvPEuO1hak0R7kn4S6dcsVDz/acySR2dqR8tZADlgSFkFJnfpLoYy1eBH6yeFkVgkFpuMhjd5ZzaF4kNO3hTVJrc8JIShTps4nC3fcLotbyMwVsCCEexTScIRiDl09heaZ1D65QSZelGuERVAHK6+adf8CM+NYcLvr18SMZJFyzumJSxbJJ5BH9PLkRsHPBMzQapTiCWv9FApkTCtd1zBTmTVDwHQw1GIeUiejpFOTkepX3YjNFXMIyTfTGIOfuG9tj/S1hDxoC0Fm/nnoMxJSFcLjqtMhrI/Hq/GkckFID4BRNv6ap5HYHoq/rZy4SIoSrK4H2HEicvHY8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azm1btphdW0YFY7dniE1WVidTPC5M/38AG0M7tTSnXc=;
 b=GlYAapZDyoiaPRm/wkgwTmyk11pIUIabvh36qPUwsMmddhUAYSE79NPchiTAGGCJPP3g6/sSO/H0F+ya7+4aqvDvMZNBqmf9JXXXITSED2igbNewkAchjFeM6ApUx8GXvokxZRSLH28JhLDN1IINuOtl3owOqdNMl19exJuX0k89nD+3evLB+BhDQ4IWOurzfeLJOMpWakoFBk4ZapS8w+Rlrk02rVgrMWub152xYQyHAm38Z390Kq6saJQ9W79K77VfQ1a4R8rEm1cedASznNSLe8xzRXYDv3+HgzhpL3hVXc4aJVlRPYCY9DufUkVp6ghPILpaCYsrpTrXI/Krhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandc.com; dmarc=pass action=none header.from=sandc.com;
 dkim=pass header.d=sandc.com; arc=none
Received: from DM4PR02MB9216.namprd02.prod.outlook.com (2603:10b6:8:104::13)
 by CH3PR02MB10197.namprd02.prod.outlook.com (2603:10b6:610:1be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 15:10:45 +0000
Received: from DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023]) by DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023%4]) with mapi id 15.20.7784.013; Thu, 18 Jul 2024
 15:10:45 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Florian Fainelli
 <f.fainelli@gmail.com>
Thread-Topic: [External] Re: [Buildroot] Year 2038 time util issue - Build
 failure in 2024.02.x
Thread-Index: AdrYdRrLI2+dOxCgSY+eBBejGyACkQAEDKAAAALmhoAAALWmAAAkMS0w
Date: Thu, 18 Jul 2024 15:10:45 +0000
Message-ID: <DM4PR02MB92160AFDBA95B4F77009E65F8AAC2@DM4PR02MB9216.namprd02.prod.outlook.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
 <20240717221000.5ced2d0d@windsurf>
 <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
 <20240717235322.5f90b271@windsurf>
In-Reply-To: <20240717235322.5f90b271@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR02MB9216:EE_|CH3PR02MB10197:EE_
x-ms-office365-filtering-correlation-id: 1714c4f0-24b6-4a91-d304-08dca73bcc99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?bHMIT6fICTPAB53WtUrhTo7wo9RTe/fno0usaSB6cd/+dCeEo6UrJFqVgK?=
 =?iso-8859-1?Q?7RC5ppWWTk3odCTmQ6jQFub/pllRTUlZvPQXDjB/OWxtVRa/aphBFTbUlw?=
 =?iso-8859-1?Q?m2e7xAzM2cSBU0UzNsIxhx01JxAcxtQ7ZE2KTwUy0kkabAdgHRUeSof2O/?=
 =?iso-8859-1?Q?vCMiBvzDapucbOBJ32j/n219ovoL6DIEu4PW28CjyHGPDIqKc3EIHHKDUb?=
 =?iso-8859-1?Q?3tW3dwRQdgIa0KBd8jYXXuXo2OyCkp4aJvrz0KuJSP70sSP/XxEUQEsaHE?=
 =?iso-8859-1?Q?xZuPBpqPO273GsSHDDlmDCgd7IS9Eq3rRnaGy44Iug7GIXguVM1cVxbs+Y?=
 =?iso-8859-1?Q?CFKvK4FRCr6Pd7H8TneeDRaBCk1K0TytoF/nEXJuurRoJwRi1c+K2/UC9U?=
 =?iso-8859-1?Q?LfslOG5Hk8G2qYH2Ra2pmD7b4rjl+RL24OJzy1ltILsxEpOC/XkhjTAHfN?=
 =?iso-8859-1?Q?tin+c8/O2dpNh3qftlr2MK8IaCodXDtU1bvdFUMGMOthHaVXxIkIQvQAMJ?=
 =?iso-8859-1?Q?PqvK2s6ME9CTemBLbQIaNP7ZYzz9NZwYRyUUFpHzvxy3vO9k2IoxSQ0cts?=
 =?iso-8859-1?Q?9ZWe/BoF+iDlw50H4h7gX6ONlUFYXKhgh7uZ5RPEGkpGDoG2EHWyLQ21I3?=
 =?iso-8859-1?Q?jYUavo/16YrHU7zWqPWW59UJ+IqQj1eMWgpa/sVQwJzN/uOxhDznqrI/Tv?=
 =?iso-8859-1?Q?AqDL3HRMsqUUs34/t6dHHGN2eMP1m1dL+PkA/KSM0I6DrN1GEZoqVVcoD0?=
 =?iso-8859-1?Q?NpWj66gg0ks8YLRQNCCpzSpGNl049qCuPpaSYgJA1jeGwOwQa6ycexoRMq?=
 =?iso-8859-1?Q?klLj9uCCaH9NQES5zLSpRfNSZq0I/xnw4mkZMcvzU+g/jzaio8osbqf7p9?=
 =?iso-8859-1?Q?uWr1r/qPWmFvGc4+uWw0+PY8TQar/01afp4/t6AKFW2MehxZzV556U5TzM?=
 =?iso-8859-1?Q?wh8OQfMl0OOINlrui7vqB7LaKZ96sagU52kFvZu1tMEMJlwTM44fMg/fWK?=
 =?iso-8859-1?Q?htycCN9MbbmheWwZr7c/v1KIBGkfDDsOjaP6l1hLKzUJsJZjPDxp8fIrct?=
 =?iso-8859-1?Q?I9PwBKHWRFbtdjCn8QC52u+ParazHialf4d0OWaFuabAQQDbHsFUyX77GE?=
 =?iso-8859-1?Q?n2/Fdl4Gm+U/HTKyl3bxEKXqFjR1VTk0R7x2anOJ7kMQ6tLKcA1yq2rYGr?=
 =?iso-8859-1?Q?WGPL5xDuQp4A+dkvhcyovZMSJDFktD90Ar33RmhcqwxrLV17DC3/QKM+h5?=
 =?iso-8859-1?Q?sKsxq5wLhID5WrxfDw1nGUr6/YFpTCmoMlgJvIx/o2rYQwcze6bEe1+rPn?=
 =?iso-8859-1?Q?a5gMjvSICy6VfkUOL++LlwL50GwSoqjZdUUL1udaP7Mo2xHqeAgS7fBA8z?=
 =?iso-8859-1?Q?7UfFVf06dpnAD765zVvejYFiG7V8PfCZQKihZmBWn4Nb7SB/Lsh/2Gf/a0?=
 =?iso-8859-1?Q?QhLHg9TTMWl2EoX1CQrqFwQs+XSUihOgogknSw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR02MB9216.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?psNplA1DwFOl01dlzxp/MgJnTMUbOUq1jPAI6rk42qa3dCRuQtE4hqTn9a?=
 =?iso-8859-1?Q?V9FS7zbhjojc4sowo+kT1j3BSM2TuLjx0ss4dlsEleHu/CH0jrGwXe8PHs?=
 =?iso-8859-1?Q?1tjH2AXtcWgMQsj4GtCy8vxbJE7KoydKLJyjGGqqMoXGlxn5NryLhGvPsm?=
 =?iso-8859-1?Q?j5QLR9DHf44Tu/7rn/EEENcJR3ZIfXPcueScwg39Mf70aSytlQtbRIeIOm?=
 =?iso-8859-1?Q?UKQxa2qoblDQbW/0fBGecN37cnyQu3QqA38wmA0leyNUokaSRbr+ibVGSw?=
 =?iso-8859-1?Q?hU4TLNjovFf0kltjKgC3H+1+A0/5NGjPwpL8ckXdD0RtwXSzztSLmjJ4DD?=
 =?iso-8859-1?Q?paXVsrygmlItQZ39bYpQED3g0YXau17TX2AcKUKNKEJeTUkzCmp7/UedKH?=
 =?iso-8859-1?Q?Qys5OQi1q/mnjVuNcfTv6tyFrX2mK6FKIvaL1BzpyEaCkMJV4MtpbUVOsH?=
 =?iso-8859-1?Q?aTVODlrhsiCavb7NyG82NCheX23V6hujpRvRkh4sfQu9RTS1Mfft+qM+30?=
 =?iso-8859-1?Q?eJJvxaSHTATTmV9aWYj5zjoUqvUDbxRwHR3tsYCXDXMrl8PtTK8qJQw09x?=
 =?iso-8859-1?Q?7HAuUiomb754cFq4VVxkwPi0zQJ79T5TQyZL5mQeUaYY2Z81rgLHpiiLS0?=
 =?iso-8859-1?Q?2aKOO0kAV5osPb9Wbd2Ry16/sWkQ4INI/t6xq52D6Oj54c4as9o3Dof9h+?=
 =?iso-8859-1?Q?iM6RJSXV2l6fTnCY7zMYE8hSnhgBDEBE0ijJBTi6ZU13oqxZNJZfjNYC7T?=
 =?iso-8859-1?Q?s+c9hVKkAoLmSIcUYxO0DdwEsYupE7Sl+6WdOEqQakDIak+qnITHF0AZoJ?=
 =?iso-8859-1?Q?v71zp8kLgT8YfHFo4iK2eSqT3DfZC7AHGSQkKgSPwQoJnFl0S7Vgy9PS6r?=
 =?iso-8859-1?Q?YIGnOjhsXSzZuxBw9J2eKvPVHPSJOviRm5eptteXlfVJZ+4X92eHxez4da?=
 =?iso-8859-1?Q?yOQsAJOlJNk2mUmekm015JGqvJE5oKUf+G96BGgrXOLF1UQ/XycYkffgyG?=
 =?iso-8859-1?Q?cTfsUWHy80xahXetDRsNvuoccvAzR7VakkXKMg4XSwfIiTCSfMznfsJVef?=
 =?iso-8859-1?Q?DzEQ6tQ8sq8JH498m8wDZ8p/romB+HHAelyacOzJJwaOpPa9T2sEveGary?=
 =?iso-8859-1?Q?u/lFS7xeJhwMWV5nNzKEUNVGo2S3SUwbpvos+UkJgyaBihd+SJUbWfwqfa?=
 =?iso-8859-1?Q?NWPskMubpdPg6lHpp2mMLxcA7isDaC/vP7E8MNQnOgV7Rbi5bCPRT0xJUc?=
 =?iso-8859-1?Q?1Q0CdLgM8J+lKfVOzl346c/urzFnbvLLZg93DC+dth7mkk1beSse+kGSXl?=
 =?iso-8859-1?Q?ULU5sA6s1ENaF7uUq3RIaNyQmG5FnvUvR9ILv314oppM/dzO7UDwyYHc1u?=
 =?iso-8859-1?Q?LIwrK6AZbRHEwaChLPcNK4fPN7+ymRWjU3K3KulGibNC0a4KQq8a6b7j0n?=
 =?iso-8859-1?Q?G5MPolqPNEyGrdcKbtAWVvDlpfcv7jI+F+6BAtXVxwD61UVv6HrmXodVWj?=
 =?iso-8859-1?Q?rFuRQeVmg06rC7i94PgmBLX+Qnbu2MBJ/r6m3nwjyV5v+QqAXFddwRkiIg?=
 =?iso-8859-1?Q?l+9fkC8xSxf5WWo9xAv2uM/qSPd9DQC8mG9POV37rWbmNt83gcrUnKoTMf?=
 =?iso-8859-1?Q?3YvQpIhXlJWHlO+PmVR/2WlD9zPCuYBivJ?=
MIME-Version: 1.0
X-OriginatorOrg: sandc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR02MB9216.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1714c4f0-24b6-4a91-d304-08dca73bcc99
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 15:10:45.7232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21c4b724-f908-455e-813c-11c8d17f3e9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SmsSFz/FUbevVoXk1Jf5K2Gwp/nq/CYDZjRHadXdMli/KfqM/Wl5QxHJH23JPXwJSSlegcfiv8E6JpBRvJykXzTlkzSazHFCBJDYxTEnNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB10197
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sandc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azm1btphdW0YFY7dniE1WVidTPC5M/38AG0M7tTSnXc=;
 b=A6oFAqCiK4wggPKdMLNpDq5UUCDVtqtbFoQfj0yFO+s80nVmAkmZJFOrNT0Rbrvo88awJZtv8kEkuajmgg067OFTAlkRZ4JFoeUF4lI/o6fGo/jjpNCehPjHgyPomAvirZwU1zJylU8NqOd+KpOPB11XYrEZHNEIiBuqnfLE9+0h5btb8sGZXwzk47SQ9yIdY5gVhCIOL7+CYOpx3ku4c4DOaJ7p5atKA6GBOuMyp0mfr8nKZJzO8yugcazKXVwe0tPZQnM6ldR6MGiUJEBBcRwNdG6b2oMTBYBCwWdBzSb8XOecDP7hK8ocfz5Y6mJwq/J2mppz/EgV+HhXcDmX2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sandc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sandc.com header.i=@sandc.com header.a=rsa-sha256
 header.s=selector1 header.b=A6oFAqCi
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sandc.com;
Subject: Re: [Buildroot] [External] Re: Year 2038 time util issue - Build
 failure in 2024.02.x
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
From: "Karicheri, Murali via buildroot" <buildroot@buildroot.org>
Reply-To: "Karicheri, Murali" <Murali.Karicheri@sandc.com>
Cc: "Karicheri, Murali via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Wednesday, July 17, 2024 5:53 PM
> To: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Karicheri, Murali via buildroot <buildroot@buildroot.org>; Karicheri,=
 Murali
> <Murali.Karicheri@sandc.com>
> Subject: [External] Re: [Buildroot] Year 2038 time util issue - Build fai=
lure in
> 2024.02.x
>
>
> Hello Florian,
>
> On Wed, 17 Jul 2024 14:33:03 -0700
> Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> > This looks similar to what I encountered a few days ago, the actual
> > issue was that libsanitizer was referencing scsi/scsi.h (sorry about
> > the message being in French, he he):
>
> I think I should be able to read French :)
>
> >
> ../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix=
.cpp:1
> 28:10:
> > erreur fatale: scsi/scsi.h : No such file or directory
> >    128 | #include <scsi/scsi.h>
> >        |          ^~~~~~~~~~~~~
> > compilation termin=E9e.
>
> I am not sure this is the same issue. Indeed, I don't see why this missing
> <scsi/scsi.h> would be caused by BR2_TIME_BITS_64=3Dy.
>
> However, I see some host-gcc-final failures in our autobuilders that seem
> related to BR2_TIME_BITS_64, such as
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fauto
> build.buildroot.net%2Fresults%2Fff2%2Fff2dbfdabf0bb6a0d82ea8a80122ab
> 97fd75bd3f%2Fbuild-
> end.log&data=3D05%7C02%7CMurali.Karicheri%40sandc.com%7Cdd0d63a10c
> af48bad13108dca6aae284%7C21c4b724f908455e813c11c8d17f3e9a%7C0
> %7C0%7C638568500087203885%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0
> %7C%7C%7C&sdata=3DL5M0l3d3AZUCXIZOQMHHg7y0WRV%2BuhbrM2k%2F
> 0eVRy08%3D&reserved=3D0:
>
> /home/autobuild/autobuild/instance-0/output-1/host/i686-buildroot-linux-
> gnu/sysroot/usr/include/features-time64.h:26:5: error: #error
> "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D64"
>

Sorry to send my response multiple times as it got messed up by our email s=
erver.
The issue above appears to be same as what I saw.

Murali
> I don't find your <scsi/scsi.h> issue in our autobuilders though. Do you =
have a
> defconfig that reproduces the issue? <scsi/scsi.h> is supposed to be inst=
alled
> by glibc.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> engineering and training
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fboo
> tlin.com%2F&data=3D05%7C02%7CMurali.Karicheri%40sandc.com%7Cdd0d63
> a10caf48bad13108dca6aae284%7C21c4b724f908455e813c11c8d17f3e9a
> %7C0%7C0%7C638568500087212824%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> %7C0%7C%7C%7C&sdata=3DBFBdZRQW5LF0QSuELFtLbH3TF%2F1p2L0%2B5C
> R0Xj1PaN4%3D&reserved=3D0
________________________________
NOTICE OF CONFIDENTIALITY:
This message may contain information that is considered confidential and wh=
ich may be prohibited from disclosure under applicable law or by contractua=
l agreement. The information is intended solely for the use of the individu=
al or entity named above. If you are not the intended recipient, you are he=
reby notified that any disclosure, copying, distribution or use of the info=
rmation contained in or attached to this message is strictly prohibited. If=
 you have received this email transmission in error, please notify the send=
er by replying to this email and then delete it from your system.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
