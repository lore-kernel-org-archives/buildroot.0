Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73072C3DA63
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 15:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F37481DE1;
	Thu, 18 Jul 2024 15:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOsJJsNZI7pc; Thu, 18 Jul 2024 15:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEFD481D5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFD481D5C;
	Thu, 18 Jul 2024 15:06:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 415D41BF35E
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 15:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D3BA81D24
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 15:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPRv_euvIqc0 for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 15:06:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c110::;
 helo=bn1pr04cu002.outbound.protection.outlook.com;
 envelope-from=murali.karicheri@sandc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B69D81D3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B69D81D3D
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B69D81D3D
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 15:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcQWlwuxLJkVOA5xCFT491Hm/uDnrwSqNtGJdQMONzWiA+AOzMA3MqNhpyU6kztPnXmrgeHJWCJNhNi3zUBYuvtThSJOpDv6JzxAQ4B1KQCdD2izj33EJy2RSnkf7GhZ95aJEg0sdO43sS9iCJJkQmLVx6iWBQ0kHdSquV0K8iB2KxOd73KS+zhbSa11gGlJr6Vr0kzDj0bjjMHJXgAvxB7HIjFWlppwiLxv8hrxM1nCDrXHMS+VL84WW0tt7zl2up6RHukY6lHUnGztEFc0kmPP9o6S1G/EZKqdUXhCCmqCqHOxI2V8r4bFb+0mg4bE9oP8Y7s5YLhALLAR9e5B4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsZsefGW3RhU1gEAdbLnZwy06+Lra2vtGvMZpgyzCPk=;
 b=dmJ0gxx7Khlm16ff3/iabwDLw5a3Ta7d7LUkgNwbX3Kan0+rBbtbZWOVa4UzS5/WzzlesKdbVMuBE1eJzOohu18+Tbe+EQf+J8X1U4NyZfJqH7V7gEda+JHHQtfFauuTYQzRaljKurd2kqseX6F41Ehgq8eZEvLjxY9L34R8JHq3brLvQw0JTcA8ClZt3pmfZgnyTl/ESBuStJIhNr4/aQQ6ovBnxuNHtpBoPpke+k8EpQkZ5q1uUH8X4kgl8R7987e6Tjoj6jWJza+FJxN9DMMD/xHdUIGcETcok9C0gpKYmE25cOq3oZ+WBuGFdfhvk5FOJiUkP1jp/BQEZJeumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sandc.com; dmarc=pass action=none header.from=sandc.com;
 dkim=pass header.d=sandc.com; arc=none
Received: from DM4PR02MB9216.namprd02.prod.outlook.com (2603:10b6:8:104::13)
 by CH3PR02MB10197.namprd02.prod.outlook.com (2603:10b6:610:1be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 15:06:47 +0000
Received: from DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023]) by DM4PR02MB9216.namprd02.prod.outlook.com
 ([fe80::8975:c8f4:ef1f:3023%4]) with mapi id 15.20.7784.013; Thu, 18 Jul 2024
 15:06:47 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Florian Fainelli
 <f.fainelli@gmail.com>
Thread-Topic: [External] Re: [Buildroot] Year 2038 time util issue - Build
 failure in 2024.02.x
Thread-Index: AdrYdRrLI2+dOxCgSY+eBBejGyACkQAEDKAAAALmhoAAALWmAAAkC3Rw
Date: Thu, 18 Jul 2024 15:06:47 +0000
Message-ID: <DM4PR02MB9216C83095A0E186A22A67408AAC2@DM4PR02MB9216.namprd02.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 873bfac7-5230-407e-f7e0-08dca73b3ea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?cdT6wwx5GfHHzRlB+rrEziBpdtlD4mJAIvaoMsQvV2Z6BJxA1Zq3vk+HOT?=
 =?iso-8859-1?Q?ZxWDckVum9+T+4v9eGCn+yJhV0t4UpyBO0VvhSyRJgktwHNlRjDCRyqhBw?=
 =?iso-8859-1?Q?BRBBs9707KYXDlhG1WUjqzQxlUqCoVi6Z9M38TFHpxYWX533l1JOGuMGrh?=
 =?iso-8859-1?Q?UK6x1Bqv6PW9SB6yIV3fZ290dYXvM8VRsCuYjF09aljPQlDnmpPiPsls/+?=
 =?iso-8859-1?Q?TUTaQU+klYcllDamyu07UVVel/1AmDnHCP2x9waCWYkjyrGcLfSQDTFO1l?=
 =?iso-8859-1?Q?fOOAZOdnL9sTj+SUt6pCQWh6QrmDd+nfTyoamLRf+LredbTMLeW39U9uB+?=
 =?iso-8859-1?Q?adIZoL9Os34irhUXr+xj3vpYZdPMUms38gNolt5JUr0a1gmwOhERD2amLF?=
 =?iso-8859-1?Q?wZleiRwTZiGPdC2helGSTh+Forb+4XzmQ8B4lMp9JWIDChMZNujab5lTNE?=
 =?iso-8859-1?Q?nSKpistg1fObNi3JbH11fpz0kbm4mBHQLvUAsCbQe+est1863nD+L3CJjh?=
 =?iso-8859-1?Q?orpehC/t0kuxuumMpnyOb6wW218SqNs+1bp6NGCR5Ye3pKuXXMLajQSw6d?=
 =?iso-8859-1?Q?SBpzl0YctgSnsvXBwLScrqDSXq5iUKePyEgID1HHezDeyPZxtQyDVwXR9V?=
 =?iso-8859-1?Q?p+wWYdtw4XmaShJfOV9ohLGwyzrnZjjdQanue6rUCSoZS0xvuqKhJSZvr7?=
 =?iso-8859-1?Q?V4qcOM/LyiLjnI3RuoVb+R11vuP9yO5KLqK126cbh4SoJk5I69N2lJ/Wmo?=
 =?iso-8859-1?Q?wwSEyxmPoJlG03Sujk0fKAd1gMmKqb4+Fb1rNyTuWpCVLnODubWH3oCXhB?=
 =?iso-8859-1?Q?oOvEQFANJt57qM0GpGP64CJ7bv3Ng9g8BH+f5nYEvxTzIJ8HyLP4aNHHjl?=
 =?iso-8859-1?Q?FLl+YKsXEi8oO7kwMuRq3h+HBzMf39sMOrnX9HBMNIJKtpWiRmjcY8Dfva?=
 =?iso-8859-1?Q?vXSN0xGh3kRoQgOVolerH8JLlO7+4gXiwbi8SW7rVzzdIUjG+q2zMfGUkG?=
 =?iso-8859-1?Q?VXcdiT6BeazVd0TSSUx12iYdwynhUhngtf+R4SE5toi5eQ34ApQOsyBT9i?=
 =?iso-8859-1?Q?xtbN/wlvHh2o7Qtc1Y1WKT/78iNMEvDjht2BQKb09Jx7EPW8Va0pTd+60m?=
 =?iso-8859-1?Q?14q22nUrvLrq7B8UiXMPXhNyMBRZwrRvcHw54415jVAvY+zE875DmQDdoa?=
 =?iso-8859-1?Q?KWlOJKDVk4Q8QWZl//bjApwlmnfEQCOUaoxzAqJq/fRLre+kybueqIEThD?=
 =?iso-8859-1?Q?vonI+HZPlJudgEaHXZJUv+eUIBh4nBbdDIyiw01Q3Ybf1b7GO8Lz7jcDTv?=
 =?iso-8859-1?Q?zVdsYzxohcL+A9EfhWZwxNEFgOXinWmdbBi9IGZ+XnOXBmLRDmiJk7r0WI?=
 =?iso-8859-1?Q?bs6UutDmJI5cwEgBC+6wPsUSlIToMI/s+JqV7nTzzAyakzfZS+tL6/8lN3?=
 =?iso-8859-1?Q?gujAqIFa9te6vlY85shinRUmN131ffKRhy6cRg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR02MB9216.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?V0xl+VioGgvtyrZ5bVurS18JORlb+5X303xTGPwHkuUPkI2/ol4m+y61Z3?=
 =?iso-8859-1?Q?BDnZKVEnUpVed+QPOzDymKh6Ej44AqduCrewUs2ldP5i5ot79vtBijs6Jt?=
 =?iso-8859-1?Q?Z4dbFJ9qv/E1JEkui1IpMQgKzoi2508Oce7vn/YjkkYtLHhMuGWeoEx005?=
 =?iso-8859-1?Q?G51yUaRteQf+p4l6C+sMPcZtTwkccSPCXVzddbLH+BYR3/ecj9S6UeHzGB?=
 =?iso-8859-1?Q?iOcYu8URs0Z6kuW8KCTNu3KVU2oLM3X3rk3k2xCfuZsKEhlihN38HqQgJ3?=
 =?iso-8859-1?Q?MgZ/2RGBOPpUnKmkyIjJaXU42hdWBWc49GZ7Qh4qHnDoD92++nRxe7ayMc?=
 =?iso-8859-1?Q?1rnus4UnBcqQo6pq8XYm5K3JId7VTZ6c2f2qWhojwjvp9h6FXsA3SWTdyl?=
 =?iso-8859-1?Q?lhg4XB+NI+4sJjb9+NFbXKfXtiUOU+r08MYFbbZAhot9JL02rUS9fZunTK?=
 =?iso-8859-1?Q?HpfzKhPmKDf2GscLFGPAC+arVoKyvFDPBvG7EQjn+YwHY1PFgJgMteWJ2d?=
 =?iso-8859-1?Q?R7uKGyiLe3WFMWksgOfkha5q+bSnyC8N5zqVGYw/3CClsioq6RGN/rTzgv?=
 =?iso-8859-1?Q?098LKW1RdJKlYxvgHbe8Jy28XirerUFKqDAO8nBkeLy7bhKN91N4eZ/OZA?=
 =?iso-8859-1?Q?xhIKPZDupLeeY9uSc3YYsNm4Kf/KyyCAXmCSuQCwyDCDQtkBwxrXs9snQU?=
 =?iso-8859-1?Q?N5K1LOJEimPBj9yYmuNCcTdR0cV95WTbzjpAKNaRwGmzLbRtRhY7N7Gd4o?=
 =?iso-8859-1?Q?SPtlnOmPPZxnYVNw1KjHp9ITsf+63kJ9xgIj6mPFUsYN6hBXXJt4k74Oxe?=
 =?iso-8859-1?Q?uxxpsNOI4SL+81OO+llfWEjbmwpPgKrbGcQW7oS47oluJVtiiYdzfH+DZ9?=
 =?iso-8859-1?Q?uwoMmGhr2DzOct6n5aKTe5TiYPHm4xJL5R2WgU/VfAeSxoxTlXmEpRqJSa?=
 =?iso-8859-1?Q?9lzhqc0l7j9va/6QhkbQ2CICgHgWLquTWyy2t4L2kiG0kjHMG1bkazg00E?=
 =?iso-8859-1?Q?guXnhvfOAX1XS0XYAXTZQOJrq4AutdhK5qJCwNfpjWEhtbsgVRh9bT3Tin?=
 =?iso-8859-1?Q?yiYrHXF/PbgNac9Z6vuY8hz3rpapWk2wDE7/scPIrMIBVIJHuiU1tuOxw8?=
 =?iso-8859-1?Q?csgOMeg5kvSK/GVJkfSE432TqSkiv3Gi4+2EtkCOWOqBQd503Pk36sczYx?=
 =?iso-8859-1?Q?SAb474OnKn/R16qlb+nZ8ebhHMcKa8frfGlIaHesMK9m9HRtykOZZQAnZl?=
 =?iso-8859-1?Q?mSuAA62dQYViAue6LMBnRwWGv9Tr4ZmVLkPLNQjufr1x1W/73xg4ZWO/hq?=
 =?iso-8859-1?Q?iJg40fFDsIxePVx3swPSUMAUd0cMuG+44eiXxcW+CUCl+KLN05OlxWCZgR?=
 =?iso-8859-1?Q?Bpp96H+HRLc717Lgk3f1CMGRQHWLJCnD8fi8T5ykRZelCZlrlqmHZvHhVX?=
 =?iso-8859-1?Q?RZFj8KYlKoBoYwJJujitfmB9lOwqtH+mNpVld3s3TjzZrqkeEx4YdYHbBb?=
 =?iso-8859-1?Q?Kq37hrrxUhK/xMvDnVDr3P2LvaYkyOzFDoIJH2Dv9vCtrSM6oehsi2drEB?=
 =?iso-8859-1?Q?q3AuhT1vuWqLhhNmMhanMH3yU26sfBsD0PA5SnLuoJCr7MnGANchsCyAsK?=
 =?iso-8859-1?Q?+pLkm0/2BF0UzZFT4y5QDedFg2rZok9Ncl?=
MIME-Version: 1.0
X-OriginatorOrg: sandc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR02MB9216.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873bfac7-5230-407e-f7e0-08dca73b3ea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 15:06:47.5393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21c4b724-f908-455e-813c-11c8d17f3e9a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMMD/GdsCDJpFIGGYfeTP3OmZXaul+10PwuO2o1HVi3pYzv0rVeRzVXHhyClss8PsMDQkd5BM8Mos/6Xyjj46ZB96StI57kOp+qeu5LNuQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR02MB10197
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sandc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsZsefGW3RhU1gEAdbLnZwy06+Lra2vtGvMZpgyzCPk=;
 b=uC1gA+1CQHxZEBSHtt+JOuPfV6/Qz/zDtc5yrI4he+tbnvKXwMzFuTaWCkZ5RB8SG2OWH6gYZDmo5QVKOefiiBk5cdgIancOjQQeBv5s5MJ8uG6cTQvILBDtZEUVC/dO0b8MNFLQzbSYJChdAG0k58QvjI3Q3tFKd7WGnFB8hk1ubIkzfocMdFE2oE34lesRFyzeynl68gXPVPdf3nbwU1YZymTv8IHmya/WFSC5ZqnPSqwX9UthcS+PnFBhaHhdqjoyIHXMvqPIP7PSr57SkMlBZ6N9YZZaoZHR2U3nfDHaiTX1QKbMpAahVUqgWZ2Jg0zVUbqi58p5JyVXESOTEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sandc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sandc.com header.i=@sandc.com header.a=rsa-sha256
 header.s=selector1 header.b=uC1gA+1C
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
> EXTERNAL EMAIL: This email originated from outside of S&C. Please handle
> with care and check for warning signs before opening attachments, clicking
> links, or responding to this email.
>
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
[Karicheri, Murali
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
