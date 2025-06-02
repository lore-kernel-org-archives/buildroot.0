Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD4C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 12:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678BC41E4A;
	Mon,  2 Jun 2025 12:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoiZuSwi69eU; Mon,  2 Jun 2025 12:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9367340790
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9367340790;
	Mon,  2 Jun 2025 12:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FCA0127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2632760AD8
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GUMJNPo7tQ4S for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 12:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::626;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B24761074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B24761074
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::626])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B24761074
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y52u0KpJBRlwTggNE6H3y7q3T5dxBOBDsfmlKTYzKzMHoSHYV1izaLM2lcISYb3WJ4x3PUPCoFyMobYflx3A1UO4gyxoMeHkhAUBUFY9k+4yY862cqg8afgypljaAUrp/I4prZ1dGguWTzFm8G/C08kKMDTp/paFX5rwCGKszlq5knseoAFX21I5oTwU4GgDqy1UK9e7vLuek1Or+FTgOdmSSh4zu0MjJTFKsVqHS9mYoN9lTt9fTO/x3YEICfqQUBn+FVHYdtfF1JK6S+xIgwr+c6bCaGgL7bdXmGXfcaXPrSP1uxnybPLDqV41TMk1Lg70T2Irjf0pjgcoGCn10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2QQP/+defTkJ04ID/AiIrh69NXRyh4pyk6eocIVtlI=;
 b=XfDNaXndgI5u/eMVYlPpjWOwycYvMXrhTkh/L88zY3TxgCHz5Blk0iuTnLqKCY+7zck3U7SUblzSQnf1TiZ8i+5wyGaMaodcCvmLMBEtc3Q0dwrUy+G+lLUGHFaSwNdaVb4VSXIOgSbWLMFZjBsyyJZAnZG/0Modu2Lh8r06lspi4xhfQI8UO1UcWnk4w8VPQcUtTG0+Mzr6M2VXjsnqNfVswz2dSnBzvUEi1YwndZfk2lBWU+WhrjmTTlKzWaRvcH8BOVsNkQPhzDLuGH/tImMERhbIOU0IQnYq+O3C0NuItyAN3+6PyYkJrcQLF4ov/ukqdGsPNTw7+FpSzTJdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 12:00:15 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8722.031; Mon, 2 Jun 2025
 12:00:15 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] package/bootgen: Re-apply fix build on machines
 with modern flex
Thread-Index: AQHb07DAjZN2lLbTsEKx3lejdGp/rbPvv7sHgAAD6ZA=
Date: Mon, 2 Jun 2025 12:00:14 +0000
Message-ID: <SA1PR12MB56159570A18BB959B664426FF062A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250602112307.4185883-1-neal.frager@amd.com>
 <87ldqapdwn.fsf@dell.be.48ers.dk>
In-Reply-To: <87ldqapdwn.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=7890c1c8-fff4-4d77-ad63-96d658b60bbf;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-02T11:57:27Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|CY8PR12MB8314:EE_
x-ms-office365-filtering-correlation-id: d254fd0c-e484-47cc-deb2-08dda1cd0915
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FEx6TdUPM9/oqAyGwbu0mrJQm8IaiicFYsFmRI+xZ7lGMfJBx361+08Xz4+g?=
 =?us-ascii?Q?FbMguT0qtx8JTsD1IwIUE01NATVcEDN/3bIaFdYfWjZfQrWgnXv55Vlm9xa2?=
 =?us-ascii?Q?ZOnKaU0LRpRdW42WoJsm3T3uivWIbq/4+aqkFNBQ9WYLWxmbXWz9TsK00c4x?=
 =?us-ascii?Q?JxfSzj9iMmY6CqlBsi+kLlvFM9wJhpu7xn3znx3Oak+DCki8peLqXTq+5/sd?=
 =?us-ascii?Q?T7ko6UauinsfDNyHlC8QZsxOmwT01enoaoixa1J2nYmgW5H9bP9YtyhVztp7?=
 =?us-ascii?Q?OUXlITEOSAZiFX3e7umFtMU97Q7H1skh0I5mnZkMH4Y+Y49xyoaZqtOx31Y0?=
 =?us-ascii?Q?Lb9b4Oyr3qyDJh/CM4dYteRPXPkBt0tE87JIspYLor0xEOTBt2PtMrBSLSfF?=
 =?us-ascii?Q?tTcYym7zpKybsGQi4fzGOcBSMtLhfmKRXZiOUdtXAm4rY4laYowqyJaFATTh?=
 =?us-ascii?Q?TgnStqoqfBN5hbaQBDhPCMENQUy1Jx6eQoiVYWPo+qsQQNqSKMpPntqHHd9m?=
 =?us-ascii?Q?P1fy1WFdImgy7+51yaZlDpy9gPWe9OznD4VCvHw7G2jVAfbUYy6moRvNJHCt?=
 =?us-ascii?Q?SnM59cYoDD63cI6gg2A2snAOPjDpkjZ2UbrNANkvCJIAbGdcn+AUtQ4/tq8V?=
 =?us-ascii?Q?5SNyMHluCCyQE+Zj1oqtVMkWXL+tgQZ9HeopxZlQXvQz5QBZoK1ud73epOJC?=
 =?us-ascii?Q?x2MQVG1kUkSFei0hcraXRo/I0AUFxuWc7sWFfMuZjqtvS3xkuVjzJx+ARgOV?=
 =?us-ascii?Q?8ZcMQJ4WoZFJZT5DOzPSc8d4G9AcRhKFqca3TlHA7VVo9KUs7XuEeiX89T9e?=
 =?us-ascii?Q?HAEhZeqECPbF2f3esX5ray7eXL02vZnWjo3Y4xjZfhLpK3MEi+AezQcjXY89?=
 =?us-ascii?Q?WQBl0EDMAtVF0+6/BF+Q3RV7YiaM/tNPfrFzIuIJt85vIohfOCgcpBlRyWtR?=
 =?us-ascii?Q?UFyNHVyJ2GlxNXwRTk4EEt3qdrMcbPfi2WehBx2cr9wV1ZQ6cKm0y8wGw3fT?=
 =?us-ascii?Q?vj7GN2efUJcsBmvRLt/VcFe5A5u7T9/CxFTifRm87YTv3W7lh9QWnITB+FPn?=
 =?us-ascii?Q?xK2D+J0zK8egnaCH/pgTLgIbZnWNjoUudhkUKSyM4w9rG9SvKe86Elgd3EkT?=
 =?us-ascii?Q?5navawoWbzFMveP/tYXmjrXP8gSIu64SQffK4gWFE1fW1FYQXrmnsalmRI42?=
 =?us-ascii?Q?zQ6UGKsVL8E7YFYhQmG6SxTvrqx5ydCK2KobNh19S2YllMkLKCWQpn0P/6kP?=
 =?us-ascii?Q?YPlEzoEKVOjUMk0ZVL0rf1ByOy5qgnrwwjjkt4OXT4Huc8azdKSV3Dn4AmHo?=
 =?us-ascii?Q?GFx75StGhOcmIYIymDQA0dZPCd5FjRNERh2Xx1Eyb2sBbUH4zoS2JLbAWQRG?=
 =?us-ascii?Q?VlNKrUvTNTNpcXyM4QT/9Bs119rTtf5AJh9S2YwKJl8HSmWqfi6mMsn9z3Tk?=
 =?us-ascii?Q?KhY4Mb70OpPdzRepC42dnblhJePfiUu124CJTYAWykFEoWOIgLG9Nw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oJ2MgD81gT5ERcqVu9Q3KmF6A4mgJ9As6E2sVquECnVCHkUQCJhDKjQQkBvX?=
 =?us-ascii?Q?2BDwH2bZXyqDGlmWY3zDGyqRa/Qwu6JHlQqfR1mmYKJi/S5ZJ97guGuuwmpn?=
 =?us-ascii?Q?4ZoHgJN1w1XtyCYYJPMcVtRlPZepG2+VpvIEPI8XQqxiSuFDO6ue/vgkiT8J?=
 =?us-ascii?Q?Ma5++nNOSnMJfd0wtr/E29euvY8L7RMUS8dQoISQnxxC+tSdPlDz5xLec7Eh?=
 =?us-ascii?Q?zfJZKU8CQR5StLcLuvTSoh6/J4+dIzCh+uI+3h70LuUbQPIplTFsKjuAtVVT?=
 =?us-ascii?Q?WhvlZpP03IRr5X/9nQFfxhQqC8H+CdEif/5zRMuTijm5dgNB8FLjcnAshoMv?=
 =?us-ascii?Q?eUhwrNKUd2NbxsvtyfCWo67A2tTTG3zcOYDuGbqJpjbhF7T0LcSNcXzNgnlb?=
 =?us-ascii?Q?TIhD/H3KwDjq6KOHi6fcB4+FQURp0Qfu97mJK/UQYGdvSCxUgoBxpSn7Jdhw?=
 =?us-ascii?Q?HUPdoQKKymGDyeMQMKfvaiyAmbDBqPKTvfz6X5z+7RBCuhWu0ywByce1m9vj?=
 =?us-ascii?Q?pir1hLaj/3zcZ/tlGC+W64tVY73ai39Pj0buxtgZZY0g7jh2la2qKosLW2bH?=
 =?us-ascii?Q?aq2xI3ZLFuczPithV5so+f5HGqdFkUY9O8NLgZ19+IedEJi56t1/UrePwwoT?=
 =?us-ascii?Q?brW90sl0kGg+HbcH3GUMtEsruXmsGEV/tWv4KkSoVVf4C+3p5RMc3DBstuKb?=
 =?us-ascii?Q?VNdAaMrtTq5kOisqtcN9XwHkW0jUlFxZsUKg1LPHrWBcYLcSfkiGOAOX0zw8?=
 =?us-ascii?Q?Az9pbR3mX3fmgBFxBBRlR2N6hYpj+w3sCC7EPnu8SV/UV+6IStkJ+mlvaLBd?=
 =?us-ascii?Q?AVYOWQrDxE8c3AAp1AJOs5znIYn3d06sVnTeP3VBjFoLXCTQCTXVCJM3ExIV?=
 =?us-ascii?Q?LHfkNca2rvmwFJTUoFeXieRJem5//T8a55dzBqVtAXol9cSElYLJRVPF7rw9?=
 =?us-ascii?Q?62+AWKreTfYTrPrqTzo89VnV8LbJUGpIEwlEbOi8mSN5BKWa9AWuG8131eh+?=
 =?us-ascii?Q?ieToYxeeBbeRRQh1OCcVEj90M2PWeSxDiCNTAsObrUV5WbGfCib+hSxQH61B?=
 =?us-ascii?Q?p/kt5RlxtiASzbxu+IfwKGrbxO1oNTUjYzPDcVt3JpmkqrD58ueeoi1gvJGO?=
 =?us-ascii?Q?0lm580DyDgq0dTdMkZSe9KPey/f9fWmTGrCKYRPuQ3gucVILP43ZDJYL293h?=
 =?us-ascii?Q?sRiV3zGlSBN0xuWWxhwHtSs6OgkYm6QHazUJLykdM6ni3jZpbQfOn+ARF7A5?=
 =?us-ascii?Q?T1l+tRQTIcp5I0uajDz2BJqcxZ2HLDnaslXUSsEapmEjhMyFqcoxGZI3v2fM?=
 =?us-ascii?Q?04mUvLw8z3XJ2a4X9VSDbIXKc8ekDk5Gmz+PzmKwAW19Tsl+UIyXw/dxWcWi?=
 =?us-ascii?Q?k3Uwmo77gfCb7YQrBmrpdJSd2FTR2MfKUOiLHkUkEiFKFsfOycy7n3Z2mhqp?=
 =?us-ascii?Q?/PGz99uAYpYbWqhE6h2bfoMZqUH+icSF/CM1SckqW10trXLXK5hOx+DSqswp?=
 =?us-ascii?Q?Bbwy5pWSL9EqdITIN9VAq59prrzgpQx5jLIxgQU5A+C8DJu3LMeGUPTPvFu4?=
 =?us-ascii?Q?rivWbLXQ0KNDcMSt48s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d254fd0c-e484-47cc-deb2-08dda1cd0915
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 12:00:14.8986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: remuiil1b7HFyXZ1xswz0figBXbdIe67erLW8XTCwuwcEtvjl9FH4XddNKKuyV2i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2QQP/+defTkJ04ID/AiIrh69NXRyh4pyk6eocIVtlI=;
 b=kq3v+BZuZZbExLqppQ5leE5DvF6hkBkXi3/0t/qJPYFVxeSQdpwYL7gzx4aJ73MPc/jpdvtzIQhBuNSd591ijnY/2JIbAOCCGGi23Z37ccKr0yr2cKNMlfVDYed0scCu/ojmTAv/E12zQ5dJ59rYzofw530aPmvDbAr7bxSPQaE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kq3v+BZu
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: Re-apply fix build
 on machines with modern flex
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
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, 
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Peter,

 > With bootgen 2025.1, the directory structure was re-done.  In the process of
 > doing this, the source files in the bisonflex directory lost the fix below
 > which had been applied on an earlier version of bootgen for the issue below.

 > Bootgen embeds an old version of flex, but uses the system include syntax
 > (#include <>) to reference it, causing conflicts on systems with the
 > development headers for a modern flex version installed, leading to build
 > issues like:

 > ../bisonflex/bif.yy.cpp: In member function 'virtual int BIF::FlexScanner::yylex()':
 > ../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator='
 > (operand types are 'std::istream' {aka 'std::basic_istream'} and
 > 'std::istream*' {aka 'std::basic_istream*'})

 > Fix it by using normal local #include statements by:

 > sed -i 's/<FlexLexer.h>/"FlexLexer.h"/g' *

 > This patch re-adds the patch to fix this to buildroot.

 > Fixes: https://autobuild.buildroot.org/results/056384322246877253cd8d0781717ce495cbe769/
 > Upstream: patch submitted to AMD internal jira process

> Heh, that issue seems to keep on resurfacing ;)

> This should be part of your commit to bump bootgen to v2025.1.

Yes, indeed.  I couldn't believe it when I saw the autobuild error...

I would have included the patch in the bump, but I only caught the problem
after Thomas had applied the bump and the autobuilder sent me an email.

https://gitlab.com/buildroot.org/buildroot/-/commit/4850405d8aa2b4f7aeb84a0db7cd3369a727d214

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
