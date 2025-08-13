Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95617C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 08:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6244260771;
	Wed, 13 Aug 2025 08:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2_1yTKSa9Gq; Wed, 13 Aug 2025 08:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D21360741
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D21360741;
	Wed, 13 Aug 2025 08:24:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 804D3938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71B0480EEB
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKhJNkWh_pr5 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 08:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::604;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BAA080EDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BAA080EDC
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::604])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BAA080EDC
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:24:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OH8sSle5hjctpBCP4vyXTbc8YlqMmOUs+3IstGnCl7C8GCPMJy8SU4rR51sBR/d7Z2yONmaCHU2cOANyFn+lAW9+fFxFavFDZd5UtTmMOZ2ST82xc9rABeeVy3CEvHxP2KDydx1NPvJWcLwKV9JOA/dGaGuwN2AdXX2ITXu2/592l0laFllcNvY0mrrAW5rOINPflWI3U+iPIxH1EAIHHQMNmjk8LDthhp453wLPsh5IJIDsM37FwaQL2Ub1jOwrQO4yYXRzdca0F4sHv4jzsEYxCdOIY0BrX72IR96lWULqVQ+bJZPJUwoA8Xu64ogP9dIcPBIwL8AFvt+wuwKyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2cz/vXM9H6NtAOyWS+GOgxz1SAK+muVYahC/dqf/vA=;
 b=EKccFrONpYzghKleeT4F3PoWHi0PtGOtwCjwXHw2LdmkiUyxAhfPyeElMPC68atF5C6QPiEakgy+lxHJs2y5Qd3rhAB0GRXiAsIwEHEvxc33CnKUjuYnVmCqdToIYYbEnCRL2AgCztnpHmOcf/AvUYbxb/+xwoIOQP40+yEbMBb1D68pcJPW0kwoG1LbIrripXUeD2svtBSwhpauqucdcKOjH3lKpNg1p9IHF2CvhWSTriUK0iVCdy1rkn1hZXM7K7oygaV/1yxofxEvdnhRXJ8qP+YX5rlb3WfbCBsB1KlKcQypILdPKEZhyEYjJhwrl6wsCt3n97twtIwvafElmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 08:24:35 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 08:24:35 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v2 1/1] boot/xilinx-embeddedsw: only allow apps for
 device family
Thread-Index: AQHb/ulYo+cxiCmX+0u/2/Gmy2Hiu7RgVnqAgAACkeA=
Date: Wed, 13 Aug 2025 08:24:35 +0000
Message-ID: <SA1PR12MB561593A9B88FA9F9CD4EC245F02AA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250727112633.3245247-1-neal.frager@amd.com>
 <20250813101329.1b28d58b@booty>
In-Reply-To: <20250813101329.1b28d58b@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-13T08:22:40.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SJ1PR12MB6147:EE_
x-ms-office365-filtering-correlation-id: 9f6e69bf-12cf-48fd-83e2-08ddda42d615
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DEj4pOfHf41BVmuswuw6qlz1b/529FpXsM48M+YizCdXUtERjkkMjV55Y9li?=
 =?us-ascii?Q?zxLd6sNH+vGe3D1ikt8al2L+2i6lh+gS87vZG61x4a/WrLD5U8GzbzqvXh+u?=
 =?us-ascii?Q?6PmVMJ0YlX/1w78dKksujqgb2HchxmzpN2orx6A8CtwuYZUS37uiSdYi3MY4?=
 =?us-ascii?Q?K4CT7rXQLZtp7SILzc0roT2kDL9OT74UMqn8c8c6qenZpKd6MsgltBwBn7gq?=
 =?us-ascii?Q?QpDp5w4txIuhYOZf13OzqYWfBA1bpafuThcJNtvnM72RMO8pAfWdhs++T2fs?=
 =?us-ascii?Q?t8lxt75OfMwPceQaInaNCk9Ata/wM9mjVY5ZEl68K4nMrk18TLzObySADY1b?=
 =?us-ascii?Q?1h3BNtK9/8r1WZeCPK9qghkqismkGICFaF2ZnjN6oxv7VkplAhbjBjOaKPZj?=
 =?us-ascii?Q?tWRtJvyuj0kQdh/HbvS2bo+jZKZDVyOQfBVaIb5lMHBNNgwbE0818wBi3QF0?=
 =?us-ascii?Q?acb4b8LUgILSb5MCIqS1xtli3TXRkHgij3+fZO8WRot7KiTplXEvZb+xebCL?=
 =?us-ascii?Q?79iaQgQ//QFyVjYmJxRTxNjRlnPWZrdvOEtQSc8p/wv+wz2ZfPAiocVWZOPS?=
 =?us-ascii?Q?yq7YIyt5vUhrhBmKJEQOewXO+bnrKzoCJq8T9ZXi3DPYDyWKhZ+qJiY+Pa9f?=
 =?us-ascii?Q?q0BSB4e6WBc/XmqRM5teRr+WJvmIvCOP9QKezwtYeV1aVBF2AkezivFxpMDN?=
 =?us-ascii?Q?8YgQ0x2BC/caqCOKlzIKveNNFRsCtrIjsku+5x0EMnmPOnhd4uWJcyEXmBUO?=
 =?us-ascii?Q?ciLWL/wd9VaB+BdYYGk7fC+zhxS0vsvXyugwfj4g3kNAffssIy6N2cH+k/1d?=
 =?us-ascii?Q?0aNNYRordFb41PKcnE5M9KFri8grI/p3C67fa/wyDV8c8cTs9w/X2Em1ED9s?=
 =?us-ascii?Q?L43XYlmxCHHAvFiHeXu0eX4kyIMf+qkkx0XdG5G0T4+BgJDsYtibqNW56ppt?=
 =?us-ascii?Q?3U4PaHlg68uBElJlJ/f8wxe2VQQ2YUuCIihC7xs2mL9Y0LZKmTYePUvDoMUZ?=
 =?us-ascii?Q?i5+foZYaGiN3RmuvEZ7iPtm4NkfQfaYjgUNYOKscDaCGleNB/URiCueOtpdV?=
 =?us-ascii?Q?/dUqVeN0ZBWlBR1LjaES1sfZHjXBB+bbRFSSD0oTf6/iqTFjHn4+NFbymOYf?=
 =?us-ascii?Q?QmtAtcr2ogcjImOGMyjaJSCbFs3C2JiHKcGcDCTs44/EjoPd0sVbDD326ycU?=
 =?us-ascii?Q?d5vUZ5B3xsqdPkLhBBY7DON9LZACeK6fqtK1f+ssCmppFtI4hGC8k85JhKRu?=
 =?us-ascii?Q?h1cqz/jTV0rs4Nnbusq/nhqGeVKkTs0fvHHnwp9EovfNC2vBjwESYLW1rkrt?=
 =?us-ascii?Q?vyfJPFYzFdgbAHkNOUO4MjTfS6okeyEwI1KCF7cLN6mfZu8CSZkPyOr4eoPb?=
 =?us-ascii?Q?2gKmUHH/beEMXdR8utAPwAnrMcLmtD8nBIcdjjGSGmP/D6NALgxpSK62AtzZ?=
 =?us-ascii?Q?nA5K55K7t6r3kyPe29xGjeTv493W0qRg15De3CR13xAk5L75L1UayHuVS5gF?=
 =?us-ascii?Q?nCXLA/nLTBC1D7+7OsZTeY2btO2v5Y+fqz0G?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SMyzP4h7dErMlkCcV4GdoP8VBf3rVXILIMuq/+zciDiQEloNO3lY8U2DO5Ld?=
 =?us-ascii?Q?3dCFJmrpI/jMCX5caN3sz+1W8g941OVLVugInBqf6uk+SGO3oq4VmV23Q9g7?=
 =?us-ascii?Q?akkwOnLVPtZphTTPBbst5e9Evne1a/qeylb97opb2QHPvES4711NEZ9OF6OM?=
 =?us-ascii?Q?+jArfOPk96cLt0CzKYhHo6xRf4dYxgREp7TZ0EYdXTq7V5Q4f7HHIAi59R60?=
 =?us-ascii?Q?t0llkVB+JAkuhgjA5so0V1JUeX6SpLtpPzicPeP32zTWWygsWYeMAXvot3vL?=
 =?us-ascii?Q?V/6czXT8FLVTrRadXuhwToOFMOC62IG7F1RZMjymh7iP7A1aK/4VOfBTw9MP?=
 =?us-ascii?Q?wrtRuHk0sxXbn5Sq2xVvvKY3CnX1plmceOP9fduNJpZJMAVg599TY0bsE+kR?=
 =?us-ascii?Q?0F0rjXemQwo0S5uFssGd72MpkXrc2TI2ANcha8S+t9P/TNk5+t7JaWt08UP2?=
 =?us-ascii?Q?ozGDr+xTocSnn05VNLmr4KTn87l+mrVSrrnjy3JAwhAQQnq3cevFZaCPY58y?=
 =?us-ascii?Q?F82akjtFpwNWT9N38GhclMAeq4uWQEyTTjahizrNwI/lrUrkJTyH17SQf+BB?=
 =?us-ascii?Q?e27z31p9sa1NE40bcAJ8uvk7fbeXrnYPoOxrhiRtfWywRvnbk94JWfKSOm06?=
 =?us-ascii?Q?Pc7eaKw4IzFWHux2yub31Nznnyto55/Xj/2yAjGVpKydVDdKoQp2VtLcEmmw?=
 =?us-ascii?Q?VhlDrdSBvt08ax/tYraQA61DYoklflglJHxK5gvAZxdldcApRXsB/r+W6BYT?=
 =?us-ascii?Q?jOAuy3sS1SQCpet0PsqmAdCkS7D262UenB7iLu9MQHD42u7s49amBiSYiL30?=
 =?us-ascii?Q?MhesFQ8ST9DmvVrTd3aukLeIHEQyr4epl8co3VhJx0c2CmzZ0tvxg6GP0XoQ?=
 =?us-ascii?Q?VjohS6hc4+2IR2w6TdcLBmMy2sBS8LAvKC/4sY0S9ZtwqKWwN6p7aj/smlHL?=
 =?us-ascii?Q?uxLVzzepdKoU5Sz6mRBRs1TJlbEoKRf08Df5gKeQy90vbeJ07hS7dZr+nGro?=
 =?us-ascii?Q?hAJW9iyeqsza/Ylh7GUN8Ypj2nHyLj7WJnRQcu2QqY9lpkzaHQGEXdskuIKC?=
 =?us-ascii?Q?Qd7yE6EssGHnPyNyDE1oSAR2H1imSg3peMccouxeTD+f9XsdkliYxWA32LlO?=
 =?us-ascii?Q?VIoIpfYVJnbhzcOKDDIVMxgv97GakGigCX5o8B+fZjzm5PMxf9mx55Vs4ws1?=
 =?us-ascii?Q?/+tkqDktDAwIepK5FPAtkt7sagj3zpF+NZBcEYlkuxwR3JWpUnF29FPorx+q?=
 =?us-ascii?Q?s6kB6pazkwPL95PnVageSCOrq8HBJvYHOtc5ItfVZ3QUmBaGuuKbziEbbJtR?=
 =?us-ascii?Q?q2AtEWCtma2PNRBuaPMI/dqXxLGbLKxEgsvQFML48AVPYrkau2fSVakLultF?=
 =?us-ascii?Q?vmXX+pgRu26+72SIq/0an2i2NxuAmM8SBBi4TmX47CLiPm29WlgX93KHk+WS?=
 =?us-ascii?Q?ACZyF/HtTiqUM8K8T5WTEvQdY0ac8Ad2ccMGfF6BiSmpX4dPxFxgjfXE5uA8?=
 =?us-ascii?Q?W1Wo8V47bh5ThWO/ZyFKk9pWTFPKFg/73NGf1gv6Xt9lglrwAgB84jVeHAKY?=
 =?us-ascii?Q?Mxnx3XZE+piYYCAy8Xo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6e69bf-12cf-48fd-83e2-08ddda42d615
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 08:24:35.0436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IG2amC6Kv+tohuor6++NEsRQOKSnp/jRijoZPt75hS+Ihawe/luRBg1/xOb7rV/3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2cz/vXM9H6NtAOyWS+GOgxz1SAK+muVYahC/dqf/vA=;
 b=Du2GzWN7GX1JT5k0/tEKQR96krpewmFH9wlUQuzeB1jNRN8KJ8mVb7PuwSl7DJcrJ1jPR0uSwO1KAupvsgMxA7kX2QuxOV+FJQ/rZf+KniTeZls3QWl0H4/tOozlXtRIi0934L/9NdJGePHzsZYhN7Ans2ezcClqzYbBR+OgGv8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Du2GzWN7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Luca,

> This patch adds an architecture cpu dependency to each application to make
> sure that users can only build applications which are applicable to their
> target device family.
>
> The versal_plm and versal_psmfw applications are specific to versal devices
> which are based on BR2_cortex_a72.
>
> The zynqmp_pmufw application is specific to zynqmp devices which are based on
> BR2_cortex_a53.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Sorry for the delay -- vacation time and bad luck made this patch
> disappear from my radar.

I understand. No problem.

> Looks good, but with this patch and an aarch64 target that is not (a72
> or a53) we can enable xilinx-embeddedsw but all the firmwares are
> hidden. Thus you should add this to your patch:

> @@ -1,6 +1,6 @@
> comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-buildroot-elf"
>        depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-buildroot-elf"
> -       depends on BR2_aarch64
> +       depends on BR2_cortex_a53 || BR2_cortex_a72
>        depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT

I am ok with doing this. My only concern is that this dependency line could
start to become really long after awhile. When I add Buildroot support for the
versal gen2 vek385 board, this line will become

+ depends on BR2_cortex_a53 || BR2_cortex_a72 || BR2_cortex_a78

Granted it will probably be a few years before another CPU core is needed.
I just wanted to point this out.

In any case, I will include this change in v3.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
