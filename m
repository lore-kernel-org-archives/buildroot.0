Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA910C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 08:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AD3D847ED;
	Fri, 14 Feb 2025 08:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWbbIQ9dV0R9; Fri, 14 Feb 2025 08:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F89984806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F89984806;
	Fri, 14 Feb 2025 08:06:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94487C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC8A8480E
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCGpvwlk-xEJ for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 08:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::620;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DEBE784801
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEBE784801
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::620])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEBE784801
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:06:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnS+NVFcvzMRaUCSDtruJNiGAu9ClIV6jcYBjeUquR6Y5guMW0NFqm1LRF6qlwEDgauraF4avTyAa4sBYaH8CdJ5UKLGFgcCLpu/XVu4sz4uqv6BRXDL3WjaHxVpdn32ZzHGfY6z4rrTS2JguuGex9e569rcqgMg8rA+DOUs9Yjz/hOAyajHO3RSTLqoMoBW2WCELfflHjmDSc1ugMRcvZQyrvcaFfCpw2Z+qmt4NZxhra0pe70pGioHVhNbdmo7OMAaoh7vqSlasMnoyCAKKGs5hONIRN/PsY5V1oN175KYdlrpAhfli8/f1BdVjTStCtHGoCBWjlNAm9+kqj7H+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3/dq4xe9UNEJTTr2omfdB2zsSakENPaFYqUJv1rG0k=;
 b=hTCCQkiNVcCHTwMSDwk3UWGKghbe6z4EY4qjTQ3ZIXgNxPTBGcW0Q5HzxyGhb2OSDlZacMa4w9JrD7imEwTZ9JHmlPn7s49eVfiT5u3+IKFXrQQtYy7MaudWt1OPwgZRimLX99I0ytxj/tqs5Apn2UGsrInCA9efxOVKQtVbjPu1ZmDb47WCRgQHXcUMEcL/wkLyphOqJhxKCrbqHNVCiOey2QpKj4f+vOMbIIsjZOBXJvS2EUuchpHp1K2AatBewD1AuvK7siFIcx4XdljdYWKaXMV8vOOoqqfiXDBKOeDpWmLt5k/1+wBlDWwMUkJjTluojrowBfumzWMu0GFcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 08:06:04 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 08:06:04 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Example of running a host-autotools-package several times with
 different configs
Thread-Index: Adt+tqXxjQdaN+RgSxS5d4rmTSozLw==
Date: Fri, 14 Feb 2025 08:06:04 +0000
Message-ID: <SA1PR12MB561545FCE581A3061A9C6BFBF0FE2@SA1PR12MB5615.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CY5PR12MB6035:EE_
x-ms-office365-filtering-correlation-id: 1c96e6f0-8c4a-4741-140f-08dd4cce6d86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?F55kVUMZzznm2sXA0UxVayXFk9PcjpTCeoBmhaR1fLlPlqMga9nwSZC04fNb?=
 =?us-ascii?Q?j4dQJxpqXldIOUWOkSTtTESv20YDTtP5V8u5i4udiNIXTzhLeQOsO5mYvWSw?=
 =?us-ascii?Q?Y3JuxioPhioMvtDP3TJIhKMQ5OqzbMwCGBndCZK4DYuSyWRMzVsH11Rh6BFH?=
 =?us-ascii?Q?dUGnKSjSLXPaBH/Kg267g59xDMF24fOIh/aqS74bp1TrD5BAsK276pp/nyLp?=
 =?us-ascii?Q?GhOMf/jKFdWQnLZd7AGWT2k/CMTLFgjOfdh3Qjc+Q4w+l74UfVvqFo+qUBDn?=
 =?us-ascii?Q?IxK1V8vfSJs5aeBnoMs9aOOPfVJADYCKrgrpFbsbSktWuqFf1pJEg28fT7lJ?=
 =?us-ascii?Q?FGgmuQndeFmtMh/lAnwmEV3ApUZwrGtOG2Ax2oNkp/RA+cO4wOSVcZ6ExqNm?=
 =?us-ascii?Q?FKS9GrpgWriYk3jMnhqWh65mW7uaRz/nsgrBHFjyXgUPXbmlFwVfjwpbe3Ed?=
 =?us-ascii?Q?bRdPAQs1MVJuzY/sS///2VF/6qpx2lYYH15VMIeejKRosFY9HohKA0QdkkZ2?=
 =?us-ascii?Q?2hmoQI/YjdkvK5lvf8QfQlXoiYNONqfyO/LXexgw8qeUndFK5hDp6rAx2uCk?=
 =?us-ascii?Q?4899qZVsmYDFro82gNrlP+boPh6X9L91uCmgtOJLkdA3Ixt4EXcloJpB3RJR?=
 =?us-ascii?Q?u8jk8uf7voA8EyuJhSPq5wlUvun3jgIx3KYFa7hexGN1BlZmdF+2UPM1/38T?=
 =?us-ascii?Q?AWSXK9t51z5PE0oYzpT3/lcHZxGaYt2vOHZmWBHrVwWn7r8RmIyKzCYvm/14?=
 =?us-ascii?Q?XCwDXYI1j400TNdUlPk3WWn9vUlA2UGWqWPkVlBCTofN3b87gzvV+t+8liSW?=
 =?us-ascii?Q?1KZk1NIGn8klJ87VMhlafGZ+pIBq5m8mHwbMtg/lK1d/ufybLJmJ0hjRNB8I?=
 =?us-ascii?Q?bpTlU3AdPGoht7tOA4BKGEZxlk6hZY8eXUN754nGm70JE6Y9WQEFWXOyVotb?=
 =?us-ascii?Q?hSW8zBlVtfFJSeQPmnTPMGYd0wL7uWJP3gLiY5djcr47vlgPs8zs7djDuM+l?=
 =?us-ascii?Q?EfV4tfXNXLkkmXhiRSZvRtxO3fNt2e31X1KkPGvst5SHZYBtaxmlGaC/skTO?=
 =?us-ascii?Q?auZX+LajwXAELmO0vvHQYc6mhSEvv2RP01+VwIbxotPzIe+YJk7VJvVKHcy/?=
 =?us-ascii?Q?OqJut9PoG5y9Qq4hZ/gQD5QW9o9cU/9w4I3MGZcpLN859/iyy7uk+ggKv1y1?=
 =?us-ascii?Q?fJ5yZmprkzVLDHCyzft8VrpgU4+ZJqDFxi+zjR64/uMU6HjKZprCj3fAZbSD?=
 =?us-ascii?Q?/omOLTC/mvb+iketCdtN587EvS3iV5Ky24qxhd4FqFcSY7v1x/nMB7xyVf/y?=
 =?us-ascii?Q?8xOocv4eqfOPIJsOcisEAhNKLUc9/c4XjbkBhb9ruKtQPlBx2WAv1/oCmhmq?=
 =?us-ascii?Q?JGlfY0On/m1bKvh3LXtMpO2xzFwv+oX8YIQ7VNNTBCYhZzGQsxiGcDb47w11?=
 =?us-ascii?Q?8LBgX48u0SOiqYY4TWufnP/DonJU9NEV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?63c8g0Rawu24eQlE1TGEnFHzLulVZ+GgwX2WDFRH2qeQ0XzUYf3G9oGuUAHQ?=
 =?us-ascii?Q?4xVBQ45DlxfvwVqK67VeUxWk48HHahlQ9XeyH5QqmNWQLsTHhmtl5IwNuwJ2?=
 =?us-ascii?Q?5r5BQCz2DX5jjSd/8MTsTrA+fbH0P+/Ur+wrks1SnjM75KW4CGwV1V/kBAZ/?=
 =?us-ascii?Q?cWW43BoPZswpxjHycDJP4xFpn2dVwbYf6/3GXI8sAIPRlWUmCaPWs29ItUV2?=
 =?us-ascii?Q?tZDN9rz9dMxUQ2vnx7vKV+Cb3tfSTmxD+a7j1btzlejjGGDSUAr3D9XFgtdk?=
 =?us-ascii?Q?iRMz2SyJVqizGGgql+YVXUJR1N0HP+7P3IcTnz7362HOf5sk07sUoh94Y1sY?=
 =?us-ascii?Q?w90/SVDuQIEgePu4dhdsU3K24qZXUJogOhyeHAK7Yx9uEfHvK/hKhx4Es2n9?=
 =?us-ascii?Q?bgGtdAm5kd3IgDZfcKn0DuRhEgSet+/oS2Bhyr6husS8f05MQQE6fSqmzYKe?=
 =?us-ascii?Q?kCxGsnS8PEBajW2mhrROJyr6VdL8ai436ndnhZQOAh/rq26S/j1KV86v12/B?=
 =?us-ascii?Q?kk79jM2YkLJ9aRG3oLEc98zkiMtkPdcZdiR6lRT3qohUWrQ0JxXaJ+p1ekYb?=
 =?us-ascii?Q?t+jmJh6gGB1GjkE3O15QamvNepq9jzZDqSFbUcqHM3mqd/8RrxPjYVAS1Bvo?=
 =?us-ascii?Q?+ksWMl+4wJ8j1ou60eaQttAzkP7u5l/fKu9sHOmmZ1mkvfpAxrmEadQsJESD?=
 =?us-ascii?Q?3dFF10XG7SvY34Y0uMErZ3d8rKNLJv/Du17rPKpm59fz2zn72ZnachWdV/FU?=
 =?us-ascii?Q?KrVP2OWmIE4bHUWBOEwIfMF1CoMpvsaMAN21bD69zLW7FKBg/PyfefHMSNnC?=
 =?us-ascii?Q?QXzobJpOFoLTa0NAwBXl//A4sgaAgVrZjKJdc5Qt1YiQbx8YPu3tunEcSW1w?=
 =?us-ascii?Q?3kkz/erbmHkBufIkLOFEiAo9zgAbVbksnzb67mPcn/jVxfkLJyYJUW2lACWp?=
 =?us-ascii?Q?LdlwOX4lVyN4+VWaAJULHhmWUUsaeUqoUe9g1+u/XXQaWrMdNchF/kjCovC3?=
 =?us-ascii?Q?TarcKBKW26EW72PW1JojYFuwN7pn6Tj25PekmEdZiwMeTKRfVMNKApR531my?=
 =?us-ascii?Q?r4MiJ6AW08i4q+R/XGNAk0Lu3c9Uy/GdcExBel3UesaawsXkHxP5l2RTPpGD?=
 =?us-ascii?Q?+wWQki3FsRbz5ZP95uOqs+D1Q38v+OVxDMQav3jTYmrjJcxiZSFzEyS6m2pK?=
 =?us-ascii?Q?+sl2A2F6BaYp23C8F0dsDPMIrlD/Sz2mVnKdgzh59nStnZgGJNP/YifjpCB1?=
 =?us-ascii?Q?unwEJfU1L8SGjArN0AIHQgVJduG9Mv3KkOYU4JEMfpiYA2uIy+WvqJiwSYFx?=
 =?us-ascii?Q?rsMBRB5QVNj9CwXkyEvm/Ncrb9KtExGEHP8ZX0Af3pLSM7lBSaHNWsz5QmJC?=
 =?us-ascii?Q?dMrEtEsncbdE8A2pQXJe2bRCRCwSmBQwDVZZgELXgd7h9oM3E+bLcHhdHRw9?=
 =?us-ascii?Q?Ar0U5/Dr8YcmPjwyYu5nreuwjnBOga2wE8mK/0CHOBWbJAW/jbjIeT+pTKr8?=
 =?us-ascii?Q?ZEqHp+e6lBpX7h5j9XhYAtsSGRcNPmDvx0tIrkVlFIdncti0Dowj3MjU/Lb3?=
 =?us-ascii?Q?FSzqnPBO6YdruLRUEYE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c96e6f0-8c4a-4741-140f-08dd4cce6d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 08:06:04.0522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: abvHGM9yNUl+jfCX2CLIhKyY2ySFxzeHiLjDN71gru5kqdSR2+JfxZx3zMxQxv+4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3/dq4xe9UNEJTTr2omfdB2zsSakENPaFYqUJv1rG0k=;
 b=3zJ8PIc1DKnzAtlmZ7ta05fQW6vWliYfX8vGz9t9d6R13JBLxesqqoT8FxcKZomkQ+tvUJsf0oPVZ8V9YLb1hALzbGoVIdUa3FSF4oHZaD6lN/K+HHPU1CYaVov4PlIKLNqGrDviVPm6SJYSDY/HcbMMJFIH7enckkkPRRJ2GaU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3zJ8PIc1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: [Buildroot] Example of running a host-autotools-package several
 times with different configs
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

I am looking into expanding the toolchain-bare-metal-buildroot package to
define multiple bare-metal architectures in a list and build several
bare-metal toolchains with the single set of packages.

Since binutils and gcc are host-autotools packages, I am wondering if
we have any examples for a single host-autotools package being used
several times with different configure options.  Is there already another
package which does this?

Thanks for any help!

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
