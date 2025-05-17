Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D80C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B1740B94;
	Sat, 17 May 2025 09:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQ3m06H0w_Me; Sat, 17 May 2025 09:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18AEE408E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18AEE408E2;
	Sat, 17 May 2025 09:45:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 593B71DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 496AD408E2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrduUJx8V279 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:45:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::626;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A8AC408DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A8AC408DF
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::626])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A8AC408DF
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iqe6v7ew2/Lh+m2fMqSqBZPa9eeyifQgySnatGx9o52TLuOK45TKhVe+ilafxFWjzh3TZs9APVsa8CClP3MzLu7Sv92ji13rJUiFUL3usTtmsCWk5OOVr/C6NO7gPh9cLramoTbXAM1Mo3/1RD1lzwo6jFbIEZ1RMwRXrRmleP63v8mqFETT9mw+VfhN91VGTCFj1RJ2Q4YiKMEuv2WkjyLU825cC5ZJ7AmhDlhIhCEW6UOvBlHgcD2IUacKvxPVH1f7/qusnzjb0nob3BsrsFAEs8bJLRVTYBkXyOQhv83XPjWhKNukjDJrNtNBSeIePNQJWPJJoT8sr+5HVDX+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXg+gwhqxhDgQK1R8jgTPSg9gc36tDDiW5Cxo0p2w9E=;
 b=XhOH1Rv3pqkgHCpiWk9lirJQMQ1xTiqhtYn0Xl2/ptPgF2do4Rur+vVpNrwtnT2yd/n7IKJjZu3QkqAXwjGM+kEfJI0GI0+/jeO1xvpTuLPiAokIJPQeFMB+0mSZG80gOnYOW/kkc5Xx4nfUl5AzlL0D7g+ElMCM0sysglhnQ3vY8N71/4T3mHgNANT3043iLRcPmgYzNVafrcwGCXVGHzFgcdgDY03UuJYQO1STj5Jmd7iEGG+EZNbY4Qbvhvm9F+TRyb0Pu7T7Q+CWk3UREZBiOVx8ly9keUtpWzSEhDhI5ERpw71VmgWQbBvn2wVMU8FAyr8VxGtN+BtX/d9t2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 09:45:48 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 09:45:47 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v5 1/3] boot/xilinx-embeddedsw: rename toolchain vendor
 to buildroot
Thread-Index: AQHbqRtChc7/MKRTuEqmyDdbX7oR5rPVKqCAgAGjQbA=
Date: Sat, 17 May 2025 09:45:47 +0000
Message-ID: <SA1PR12MB5615AC9BC3537F1BE1B34618F092A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250409064711.3024937-1-neal.frager@amd.com>
 <20250516104213.0ed78643@booty>
In-Reply-To: <20250516104213.0ed78643@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=7d28a796-8895-4ee7-9cca-285a32b12434;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-17T09:42:47Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SA1PR12MB6919:EE_
x-ms-office365-filtering-correlation-id: ccf931ca-1a67-485c-939d-08dd95279a1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KsavEgjzqqNudvEbx0gpSRVlP8BAAmTvUyWwHBdhwQLURAqV1tWOIiGRH+GE?=
 =?us-ascii?Q?RVb7OSXgpH4VuwBDxBwrme1kJ83Oy+4LwI1EALoR0frcLHM09u925hrugLDu?=
 =?us-ascii?Q?3EWYQk5WK2i7PD/LJeuYNVmUPxU27pbtUMkkKyfik9vOaCl7SmvrheX/4lOY?=
 =?us-ascii?Q?xVYecLPc2ySK6J3PZVUt8JwkhoBd1/wMWPPDkKQ2RAxWA88vYx3xGiAUwyfd?=
 =?us-ascii?Q?ze5qe1Y4PRmsuPkalIDE4LTVFYqqes4i5G7QnDCKrFI5oXd4+AnWEL5hV2gl?=
 =?us-ascii?Q?ZZPsWuNZXqr9xlzhmJrtWer+szq42WmQFqBmqcF3WjnGvJYUOHY/BC4s0dCB?=
 =?us-ascii?Q?37bkQBLk66H0MuxRFAaBC3ZpN80oS/rquxxIMBxLcBlrkk/hFE8JAbHmUcb2?=
 =?us-ascii?Q?vaDQ4199HpIO8pIegNMC2SXl2dXiUsr6xKkEUfAq2X3VOT3SZhlJrIfxpQ1w?=
 =?us-ascii?Q?Xjppwa58o1qDnsIRWo2+PumbCOOjYwGgvfNtgNrz4wQKHcVxEt9jzwK7GZrU?=
 =?us-ascii?Q?ANCUfGG9PIQ1rDkU8yOic3E3NgziCg+dbaI5Njq6LAszkDqgM5TFsVoMlA0T?=
 =?us-ascii?Q?brNmxuiwqBWjTHauQC809eDLk7o89HsSP1c26+BNEG7r2sg/wqWNg9rkEneU?=
 =?us-ascii?Q?NEKItnmjklfjKSmDnCRYAl1N/H7n/pHrbBDLpfx0+TWDDHtxOTP4WpGGbxPO?=
 =?us-ascii?Q?zaw9KITEVGx+dL4if3I6UcG9BOwUIgtNJ+Trni5KbxCk3oYRReW11Lm4haLD?=
 =?us-ascii?Q?ao8gIjaYL3TrQ9mi/LQLqiM4jSnYpzEQj5w6HXoYQDvgG9JqRpp5kc/6NqTE?=
 =?us-ascii?Q?EJ8e5+fFdWj3QOPrCSLTVv4eVQcCeTYB1FqNm1qmW9hI47XKklYZ/Wb4cUxV?=
 =?us-ascii?Q?8ujN4MClX5FQOx3lIS6LtJp1baKnojzIcuDI7aoNWaIG5QINyHWajNaJ3iCI?=
 =?us-ascii?Q?CtHIiIGVjH19AqExliqC2sTnt/7i67V34AWxvuv1E9UHAIhRLe0cNmxoIway?=
 =?us-ascii?Q?a0NPnLeWrM8o24i9wf2Hw8i0tEBEAs85AE1PV+erzT65DHqLq5tViHWGnaoX?=
 =?us-ascii?Q?Tc0XOXemx9Y0uwdowyeBbtWk4k7MPp9C+l1tFwHJb8H1qDIaf7SR7dNiDdY/?=
 =?us-ascii?Q?lTiMpZWCx3arj9lSoSfycSLwXoa8/zZEj52s1XXVbzvyJMv60LDtz+KccSj1?=
 =?us-ascii?Q?VlKFyc2TmusVlRLLEbfYxAyrLQrrq+Fby3LM97alS4dL16OBGVDVNALftoZo?=
 =?us-ascii?Q?aa16UF2mBIEFo39ejdJ1lQU3AyfBpKbjpjUh7XiI8MIUYA2SnyiB+YmvMxCI?=
 =?us-ascii?Q?f9qaKeWLAADvVDVEebE9vJX6+RCLnYSy5Nck+ETIWhxlCAVLPbTEMvPooJL6?=
 =?us-ascii?Q?NjNRBm+fDEqImWyKUeWuE/R344rFPVWV0yUNxoap+vdWaoLMlqwA+FGrUlMx?=
 =?us-ascii?Q?dibIJSyqGbgW1hKikGYBJC9seqX6H7278S1UH7tXNxGFEcW26iSGlFgtQBNC?=
 =?us-ascii?Q?pueGTSrEkrINHtqnhcB+RHcBMUJSIdfwJbBe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L/y6RWS2UVCgtxIleH7e4ljccc/eEBsbiE6LP4yeUPqHX1RXitjGkN0jT2Wc?=
 =?us-ascii?Q?ZZNDYdl6rbLuV0QPfVtPJizW/agkm63Rd6L+DV/Z4E+Xob96JeQJjk27riSn?=
 =?us-ascii?Q?UeQJDi6nu32S/vFHYTMRs4bXxcenA/VmW2As04IDqOBul8aLnStPZP4DFs23?=
 =?us-ascii?Q?0KTLqGjWsy0Ht0Z+C3e/GZuD5ADJr9wwHzw35hVQdV8cGrR5EwS/ED7seH3t?=
 =?us-ascii?Q?HhYIk4I9H10xrlR2H+5tvFyPqklJmHVUEvtfQLsnJeszbrCVrm0TMiidvX/P?=
 =?us-ascii?Q?dg/0MNlDbdQxXh3tEM9+qKC4L0dsbIY4ak5symi1YDD/CK7jLCK5o9/agY7Y?=
 =?us-ascii?Q?HnHDlahytWq/vsNjxLQUlUvwKIX2aCp4XMaXt7mn7Alt1hjRhlvlTIFOwTAB?=
 =?us-ascii?Q?OacUksre0DeZXStvu0/ON8Y+K82TDWv8WUYlPWAe1L8PiOuOYNf6Z/uUbIfT?=
 =?us-ascii?Q?jwQCrb50aoQNqKE3ftQJgbDWCe3K1tryPYDLDoDCVRQ94vMYKmhSk68HbR+p?=
 =?us-ascii?Q?Z35/VbBLPtR6qmeKkwbXeDxceoDzC9tl9UykziMzIz8DyPn5SGPpQoxJ/YVX?=
 =?us-ascii?Q?cTWoFKwqFJ94CNy7L460nC44kOpwDS1MTgDRMUfUyuzj8D9GNyDkoMvJQVg/?=
 =?us-ascii?Q?uAxOhA6MTi28hnZcVu7Rs1bYGfmP3hhoYYyn64WzlrFcixNgt6KR1rgy0FOx?=
 =?us-ascii?Q?1wVgmQ8/f+Yi6FnlIciuw3ocfnttTiZMGHXXvc3S4BDGnNXU+tYZGVfqJ6PJ?=
 =?us-ascii?Q?xsIofkU7NBo0yhwpTvJ/R+0nOTM+Q4EKMtYj5PmqiABUVW4EE7ddLq24stWW?=
 =?us-ascii?Q?UDEMLoOE7t5JxgHuF/siDO/n7xhxVn81rdfPLsmfa/8zAPdqYbUijbfdOLy0?=
 =?us-ascii?Q?UqSUkl/3xakXvotIb+3HL2hURd/p3Uujmsb1DJvqKFoOogXqdiAvdh9r/hKK?=
 =?us-ascii?Q?cZk/JEoQAVjqd4iOHD0UlD+BiSi241Imm2M59CoIPrxdOBZuUe3wwm9aHFvW?=
 =?us-ascii?Q?kr5lLhmLVntFK7SUCvMfY0jJ7jys4GWn7ZZgf0b5GFcRTiMbfNta8XFR41k8?=
 =?us-ascii?Q?tvLmoxPr0jgNQ2urkszEHXtO8qr6Na4uEivDZwz+1F3hl2WI91bDaGwX+QYw?=
 =?us-ascii?Q?eWQ0EWja3vCQVNDGJwfRpilEEIz5NozuX7uv9hFExL/UOP90JXhqXo9tUZ80?=
 =?us-ascii?Q?d6rz5bs/0yl1gSv5kz8BEFwrGXt74V6PtbUa4HT3eyvta9dNKlYv8LPOE8pE?=
 =?us-ascii?Q?m/U5yMhq0LZhWwZvsajjKeyRKY+/ceASS7IqSF+QI+xFRBAfcaHO2Vby3LZA?=
 =?us-ascii?Q?1kkDVbZUaQsgnBCGE+KpVLa8jE9DnYiwdK7+65MSoWD0RJixK9M3IWBxNt1a?=
 =?us-ascii?Q?LFvekhxI4RE9qT1Oc4ow3n0m0O6E1Q7NN7PYCjfQAin+ZsAF/skOdh2XgiRt?=
 =?us-ascii?Q?ltcTrrRegOesR7sKuBQEe4qtJQ6WG1+wlIDEjdbzfrlHzLo90GHFDe1w6w0J?=
 =?us-ascii?Q?h8hv4JMK35P9OS0k1NXtdQZrk5Dd9Yys0YbtQdI+bWADSWDF4212UmGf+gum?=
 =?us-ascii?Q?Z8ZmwCvIgonaPrZzUaI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf931ca-1a67-485c-939d-08dd95279a1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2025 09:45:47.7866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnljxJbX+LqgGewXN6tG+sZ7GR4mzhwZtMRRsgeOHUqZuS+4T+f7K740XtFVd+GJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXg+gwhqxhDgQK1R8jgTPSg9gc36tDDiW5Cxo0p2w9E=;
 b=tevBe1rmL5Wc1H/M3qrIoxkjCQim7tyhpDr1P96GHyqQoIm2gTXqM6Y9VSc8ZSwtdpqX/zeo77zmM1fEG6tBwmPQ4e0s3zOdde3GoYXAuSFBg7i5KqnyHHQLPTB7XAqrscQrm3gnsrof7iysI38rVMUxaqHLZWyn5VEoFychO6s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tevBe1rm
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v5 1/3] boot/xilinx-embeddedsw: rename
 toolchain vendor to buildroot
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "arnout@mind.be" <arnout@mind.be>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Luca,

> This patch renames the bare-metal toolchain vendor used by the
> xilinx-embeddedsw package from Xilinx to Buildroot to be consistent with all
> other toolchains built by Buildroot.
>
> To build the Microblaze applications available with the xilinx-embeddedsw
> package, the following config is now needed:
>
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf"
>
> This change keeps backwards compatibility for users already using the
> following architecture tuple:
>
> BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"
>
> Either vendor name is now valid, but the documentation will describe using
> the Buildroot vendor name.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - xilinx-embeddedsw is now backwards compatible with either vendor name
> V2->V3:
> - split patch into series
> V3->V4:
> - rebase patch
> V4->V5:
> - add deprecation warning for microblazeel-xilinx-elf tuple
> ---
>  boot/xilinx-embeddedsw/Config.in            |  3 ++-
>  boot/xilinx-embeddedsw/xilinx-embeddedsw.mk | 30 ++++++++++++++-------
>  2 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
> index a27253d594..31b12baaf2 100644
> --- a/boot/xilinx-embeddedsw/Config.in
> +++ b/boot/xilinx-embeddedsw/Config.in
> @@ -1,4 +1,5 @@
> -comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
> +comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
> +     depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
>       depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
>
>  menuconfig BR2_TARGET_XILINX_EMBEDDEDSW
> diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> index 7d4fcf8b8f..6e37dc48bd 100644
> --- a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> +++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
> @@ -12,6 +12,18 @@ XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
>  XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
>  XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
>
> +ifneq ("$(wildcard $(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc)","")
> +$(warning BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf" \
> +     will soon be deprecated!)
> +$(warning Please migrate to new bare-metal toolchain config below)

> A warning is not very visible, so it won't be very effective. You
> should really use the same logic that Config.in.legacy uses: error out,
> and clearly state how to migrate, practically. E.g. (untested):

> $(error microblazeel-xilinx-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH is not supported anymore!)
> $(error Replace microblazeel-xilinx-elf with microblazeel-buildroot-elf in BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH)

> Moreover, an existing and working defconfig with
> microblazeel-xilinx-elf hard fails later on with this patch:

>  >>> xilinx-embeddedsw xilinx_v2024.2 Building
>  ...
>  make[4]: <...>/output/host/bin/microblazeel-buildroot-elf-gcc: No such file or directory

> Steps to reproduce, from a clean Buildroot git clone:

>  git checkout a4249a20243bb620d095a36e78d3722aa29f8da7 # current master
>  # Apply patch 1 (not 2 and 3)
>  make zynqmp_kria_kv260_defconfig
>  make xilinx-embeddedsw

I re-checked this, and you are right.  $(HOST_DIR) is not available in time
for the wildcard function in the current version of the patch.  I need to
put this in a script to make sure that $(HOST_DIR) exists before the wildcard
function is evaluated.  I will fix this with the next version.

> The patch looks good otherwise.

Thanks for your review as always!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
