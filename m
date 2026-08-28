Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECEBC61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 10:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8823A8096F;
	Fri, 28 Aug 2026 10:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEAvs1p4V33e; Fri, 28 Aug 2026 10:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787913428;
	bh=WeGqPa159LOEIv668fA6uXEodmowTW689tnys5T4oq4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dR2LsGvQ1yTRVezAnr4Q3KIjtfRLnD9aFJH906YDJi6i7+yl9KZesbkJcUPt5DSb9
	 1ksYVXXGEn094ZsZmsswj28L6FNPx5Kma9L8m4fge0HWH4OHTNNm3XY6ajsInJrGfs
	 ZLfUEZqZ1sDmgKN8ohvZJ9oDiGtqu425jI1vtavU8JT4Zil5a9gmvCKVCD9TrVy92z
	 Dv49E2nLWefQP9K3Mog6T4C7AbLty2rwkq4u7203kjERT2ikc/0E+lAfXYCPubDo4Q
	 HMF69NeWT+q/lvGTwgThZK0NEBjzm7N9pWsm1r1sjX5OOHo/wAIgHxT/RXuS8mm3iT
	 RK73zR1P9SEow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A2C2808A6;
	Fri, 28 Aug 2026 10:37:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71E1FCBC
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 636FD40121
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5k5l5Sxx0XFq for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 10:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c100::f;
 helo=bl2pr02cu003.outbound.protection.outlook.com;
 envelope-from=stewart.hildebrand@amd.com; receiver=<UNKNOWN> 
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6E954005A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:37:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSQdWNB0SYaVIMeGt4PNjKpjO3WVcS1GuZsdr4RNRcfXTq20U9vP8ja/Mh0YOYhKOaf27UG4B+twgOFn6oYVLEh1SfPkdOLibBv7ApmwnBsZMnOwOESnxYiZdEVgsR0adLLYedtH2rRiJHFuctyy5BmeF/Bgu34l88A4rjyLDwLZHTbsyhbREyh1D6uHhD5hirHA591z4Ma1sJaglOYcl2iqYa6f4ADyxzlK3FZF1RAA/wsyvYwDq0vKJUO/N3PeNOmMytSFrTycJmMoEPLC/pFrn3JlsiZSmn5Xt1krvNVZB1UuuCL6D0TTctolrG4AlR8jYQr3qgKetEjfxBCyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uwkty2MlOKAL/OrKZiZR9sapEdoK9PQ+tIOaOsxMIxE=;
 b=S7DbAs2YokFntyFTknq9q0IxnrPtcbedT9zB1411/iiJYCPZ5ZBjFsJvmRipg3qQ+1qwcqDEk/WwQdUR5iqqKnrqNENvPqEH0KplddzDa9F+zZg/uw8sZmIWRQhOLjWpJsPkDamd8tcz7iRXTUvGoF4Fqr/aJApNLG7nUySKS1MbH6eES3oS8NJKEkqdRH5vr/OU4E8fvFBS7HYO9c90iyNGwjjUKlYd0wCBr0V/lCb9D6iGpm8nsLBm29kt7n1Ay8SjyDcKbhkQUOr9h9X0GfgEh/NDeq0RoES3363gj+81rt3H3uCrftwxzME1rnv42fGsEgXv0SkAuOTSsh8y9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from PH7PR12MB6467.namprd12.prod.outlook.com (2603:10b6:510:1f5::14)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 10:36:58 +0000
Received: from PH7PR12MB6467.namprd12.prod.outlook.com
 ([fe80::7b8:36ff:4c76:46de]) by PH7PR12MB6467.namprd12.prod.outlook.com
 ([fe80::7b8:36ff:4c76:46de%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:36:58 +0000
Message-ID: <a8920732-5a16-49ba-82f5-c9405d210d5d@amd.com>
Date: Fri, 28 Aug 2026 12:36:51 +0200
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20260826064649.292291-1-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20260826064649.292291-1-neal.frager@amd.com>
X-ClientProxiedBy: CPCP307CA0001.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::11)
 To PH7PR12MB6467.namprd12.prod.outlook.com
 (2603:10b6:510:1f5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6467:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: f65e7360-cae3-4bcb-ac1c-08df04f04941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|7416014|1800799024|56012099006|11063799006|5023799004|10067099003|6133799003|3023799007|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info: zD/dLI1BJ/YXtL5Bi2cqYXw342uLn3KyCKC6TsSMj3fcZQzOY9jbq0PjVopcPQC2sndBriE0s/SC+wWdSz5t8s28U8zae4Re18glQJgrPCnyUPvD1wL2ac13mt8v1xrehpUOY2Gf5rJ8EW6IUlugaFRcUuG9Q3Q2ryfqwY/LJkG/MfAxLTAJtSoJx+2bfCRyvZweWqNlq6h+4djxzSc8ObDHwKqphdK7oP8+6XWJEvzM3DIJtHsfXILsTm6iN4W5R6U8Wjul9tVXhN6OVJH8N7mtvEsUxp9cCzqycpXqeloqLJ9cvsGkFcFA8GdJ0pILitHzlSPaJ39iFUAHsZSPktZy/zPuvB32tO4gIequvQFOKAnS66ejJ5+F1igRqqNZIgQWbblDWjVERIuzMWEXgFSAc1ekEYW+J+1F6D8za+d5sY7yN+V7ejC1JQQENgKfvwUCo5FAG3KrUC1QZ+//LuYdFxmhhUuaFUdwiOcV4O5qrN/wvtgseFenZveSzlkQvBXxVRVySwlnjjuoM3lGGd+eAlEH13jH/nxidXiqNpEDA3uQCu3z7A6E0GdGimamjHgAAHKClnzOTFXuhjKBAz7XYzcendelKVxpAcfV7naoY1DCycgUgbyd8fMs+nuddbUSVSNGL0uoJOy3rjeeBzRRlXaNJiKW0OrTMqYzqAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6467.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(56012099006)(11063799006)(5023799004)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjVzNHJMQTVEeHV3dnRHeC9CcHhINHBEL1JrWjVQdkNjTkZNNGJrcVI3SSth?=
 =?utf-8?B?eFI2SGV0VTdFWDVxVEk5RDhOWk5KNEZCU0VSMzVDVm1uaG5ycjh6OS9COXk5?=
 =?utf-8?B?a1RPYjM0R3VScmxMellxU21iRGoxY0t4NkE5TUVEVjJpOFQwRG03S0kzb3Vv?=
 =?utf-8?B?d2d2UWpMTFl4QTBxMCtyZFNNT1dKMUdlTHhvYkFTWCtFSXlQdW5sK1hKRjhi?=
 =?utf-8?B?YzdKU2tpcFNwNW9XMUJFVVdQRHdYblZQd1BJaHZTL1RCbjFkUFNZMkJyMmVn?=
 =?utf-8?B?VE5KZE90dWFCZkdPeXFOVjc3ZHZDVG9MU0MyazhKa0xuY3dVUm1PeTZGclJi?=
 =?utf-8?B?N2tzWVlTa1hOS1F1TXlaV3p4MXlQSDdTdGVWY3dVTnFiTjRMMW1DcVp5Q3Q4?=
 =?utf-8?B?YzF3T1BKcWdDaFdJNHZKUmEzZEtkaXpka3JUT2UrZWdWbmJ1WDZJVktyQXQ0?=
 =?utf-8?B?aHcwUTJLZnlscHJZbXFCR0J4VEF1aVlpdGZXeFBrK09la29EYlVPU2twUS8r?=
 =?utf-8?B?SGtFS3lpd0MrcEJLYXdiejlhVmJDM3hVekhqVi91YjBDb3VmajdIUGtPYldT?=
 =?utf-8?B?TElFaTEweEV4Vm5YbFVpY0h1NXVMOS92V1lxT2I2ZWFPTHVJa1ZkMGdEZjRa?=
 =?utf-8?B?cGFPNjYzUlFoeHl2SUwrRHNKUDBRdHdwaVFnNWEySTdiTXpJV21EWHoxaGs0?=
 =?utf-8?B?Q2xGeXZiTXdvNUt0QjYyMVcyQjNJUDMzSDYzaUxjZ2hhck1qcEJtQmt3V3lD?=
 =?utf-8?B?cUJ6L0paZC9YTU9ZMHh5MUtJdTA1czRocWcwdlBGWnczUWM1UHhlMWtuVjdn?=
 =?utf-8?B?QlZEZzZyUWVhdy9pYlNHRFhIdXI2K2hkd2I3dEt3QzV0MmQ1aTJXY1kzWFZi?=
 =?utf-8?B?QllPNjZNaFdkY05VenFrZXlGNXMzRUE2RFJoSDFkR2lwVTRDeTBLQlM4TlFx?=
 =?utf-8?B?L3k0SVlyejRDVm1lZ2xrSUlVYUNXYlpRMFdIdUxrN2owbVFuVGtyTUJEK3Vw?=
 =?utf-8?B?aVdZclRxS29WczVJeVEvbm0zMi9qTW00dk1lVUhOUWsxR0lGTEFtNXo2aFRs?=
 =?utf-8?B?R1NiOWYrVWVJdjlGd0tZckRjdGZYQjU4cmUxR1J2R2Qrc25sMGUvNWY5ZFBY?=
 =?utf-8?B?TVdrNVpYRVgxMURKcFRQVmx4OXpYWFlHYk5ncTBZc0NrcTF4OUNEcDZ4d0hi?=
 =?utf-8?B?ajZsamxCeml3MnQwOHQ5cTdjYW9iMkRlckZOTmQ0OHE4czY2dTdoV2Q2Q25l?=
 =?utf-8?B?b0I4ZXhFNkxVVzMzQ2Jrb0U4Y1NPS09uc3lxdnZoL0JvWUJLcHp1b2RZbm1S?=
 =?utf-8?B?QVZSZ3JlbkdJRmg4V2ppcnpPMXFXakpNVDhZcU13Rm5VSnlHUWk4Q01wMXVx?=
 =?utf-8?B?MDVJUGdQbGdtWXZpWVJiblVDbThYRE9KRDNvMDZGWGcwZThDYmlLTVdsT09L?=
 =?utf-8?B?OTAzeEJGdU5uOFFKejQyMEorKytta2VTejVCM1Z5aDJvZ1pITy9PZUpIeDZn?=
 =?utf-8?B?cFlFSUZ3MVVBWUw1cjJYV2hoVVR0dFJnWkV0MGxmZFdqOWVxeU8rTFhvZ3g4?=
 =?utf-8?B?NEVtR1JYNnVXWkVia1krbnJQenVxQlBIT0Y3anJab0l6b3pOTHpZYTZha3g0?=
 =?utf-8?B?T3F2ZTBmWnQxR2dleFRTcGtBZEhDZ1FWekp4SVNBS0E2US9PcnlLeWM1S01r?=
 =?utf-8?B?UU5iaWM1TFZZRnF5RzdhZlRxSDhjUTlaZVJLSStsT0FHNVdCNWRDdlRxSXdn?=
 =?utf-8?B?V0NzbzQxVTNFanpFU1l5Tk9GaGw1WHlSN3RSNkRGWEdHMnBnRERFeTB3bFpt?=
 =?utf-8?B?cUtwaVk2b1diaEo5ZkxZaGpJaGxOSCsxNGFOOXBPZ3YrVnBjYUNOd0ZOK0Yx?=
 =?utf-8?B?S2prR0ovQ24yVE1iNjNSZmlwVkNCRENEeVNqcDZUcjlCKzlCQmpjQjBEQ3JG?=
 =?utf-8?B?YzRpTVZCVzBlNStvU1c4bmdndzdnaG8reDk1SFRVMjhiN2FTVGZxaVFnUEtL?=
 =?utf-8?B?SlpKcEZOQVY1cUhPdUdzRmtzUkVwTmNzdit4SUIvdndNQ25IUFJ3T0NVVjNi?=
 =?utf-8?B?dzJzZGpJWU96elZsaGFuNlN0bmhnMkpINVFZQnkwbEVwQzl0cHh2TzZHMUxE?=
 =?utf-8?B?ZFRSZEl5b3I4ZWJVRGVSeUNXeUxrZUFrVDZERXk1WkNEbGE4YkhFOE81K24w?=
 =?utf-8?B?aVM1cEYrVGlGSE1FbWNaRzczd2o3Uyt0dWtoV3lOWEdqalhNUVdtZU8wNG9p?=
 =?utf-8?B?Sm04d1hQT3c1ZzRIb3JBQzcvNGhvYllza0dISjdWQzFkWXhYV1Q4eTdGVzdR?=
 =?utf-8?Q?FZbg6EbdZG1U6BElwW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65e7360-cae3-4bcb-ac1c-08df04f04941
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:36:57.9538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmAEePLVS9BgHfrDTN0yQmrbozyg7xeelBG0yYVYD7skfPBkVFfZj4RaYtVT0XWWGRWOpfwy4oWbbaI2HOgzZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
Subject: Re: [Buildroot] [PATCH v5 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
From: Stewart Hildebrand via buildroot <buildroot@buildroot.org>
Reply-To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: alistair@alistair23.me, stefano.stabellini@amd.com,
 ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com, micheal.saleab@amd.com,
 yann.morin@orange.com, matthew.l.weber3@boeing.com, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gOC8yNi8yNiAwODo0NiwgTmVhbCBGcmFnZXIgd3JvdGU6Cj4gVGhlIDAwMDItVXBkYXRlLWxp
bmtlci1mbGFncy5wYXRjaCBhc3N1bWVzIHRoYXQgdGhlIHFlbXUteGVuIGZpbGVzIGFyZSBpbmNs
dWRlZAo+IGluIHRoZSB4ZW4gc291cmNlIHRyZWUuIEhvd2V2ZXIsIGlmIEJSMl9QQUNLQUdFX1hF
Tl9UT09MUyBpcyBub3QgZW5hYmxlZCwgdGhlCj4gcWVtdS14ZW4gZGVwZW5kZW5jeSB3aWxsIG5v
dCBiZSBoYW5kbGVkIGFuZCB0aGUgcGF0Y2ggd2lsbCBmYWlsIHRvIGFwcGx5IHdpdGgKPiB0aGUg
Zm9sbG93aW5nIGVycm9yLgo+IAo+IEZpeGVzOiBidWlsZCBlcnJvciBiZWxvdwo+IEFwcGx5aW5n
IDAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaCB1c2luZyBwYXRjaDoKPiBwYXRjaGluZyBm
aWxlIHRvb2xzL01ha2VmaWxlCj4gSHVuayAjMSBzdWNjZWVkZWQgYXQgMzYgKG9mZnNldCAtMSBs
aW5lcykuCj4gSHVuayAjMiBzdWNjZWVkZWQgYXQgMTg1IChvZmZzZXQgLTggbGluZXMpLgo+IGNh
bid0IGZpbmQgZmlsZSB0byBwYXRjaCBhdCBpbnB1dCBsaW5lIDc2Cj4gUGVyaGFwcyB5b3UgdXNl
ZCB0aGUgd3JvbmcgLXAgb3IgLS1zdHJpcCBvcHRpb24/Cj4gVGhlIHRleHQgbGVhZGluZyB1cCB0
byB0aGlzIHdhczoKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IHxkaWZmIC0tZ2l0IGEv
dG9vbHMvcWVtdS14ZW4vaW5jbHVkZS9ody94ZW4veGVuX25hdGl2ZS5oIGIvdG9vbHMvcWVtdS14
ZW4vaW5jbHVkZS9ody94ZW4veGVuX25hdGl2ZS5oCj4gfGluZGV4IDZiY2M4M2JhLi4yNTkwOTA0
ZSAxMDA2NDQKPiB8LS0tIGEvdG9vbHMvcWVtdS14ZW4vaW5jbHVkZS9ody94ZW4veGVuX25hdGl2
ZS5oCj4gfCsrKyBiL3Rvb2xzL3FlbXUteGVuL2luY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUuaAo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gTm8gZmlsZSB0byBwYXRjaC4gIFNraXBwaW5n
IHBhdGNoLgo+IDEgb3V0IG9mIDEgaHVuayBpZ25vcmVkCj4gbWFrZTogKioqIFtwYWNrYWdlL3Br
Zy1nZW5lcmljLm1rOjIzOTogb3V0cHV0L2J1aWxkL3hlbi00LjIxLjEvLnN0YW1wX3BhdGNoZWRd
IEVycm9yIDEKPiAKPiBUbyBhdm9pZCBtYWtpbmcgQlIyX1BBQ0tBR0VfWEVOX1RPT0xTIGEgcmVx
dWlyZWQgb3B0aW9uLCBmaXggdGhlCj4gMDAwMi1VcGRhdGUtbGlua2VyLWZsYWdzLnBhdGNoIHNv
IHRoYXQgbW9kaWZ5aW5nIHNvdXJjZSBmcm9tIHRoZSBxZW11LXhlbgo+IHBhY2thZ2UgaXMgbm8g
bG9uZ2VyIGluY2x1ZGVkLgo+IAo+IEluc3RlYWQgb2YgcGF0Y2hpbmcgcWVtdS14ZW4sIGEgYmV0
dGVyIHNvbHV0aW9uIGlzIHVuZGVmaW5pbmcgdGhlCj4gX19YRU5fSU5URVJGQUNFX1ZFUlNJT05f
XyBmcm9tIHRoZSBxZW11LXhlbiBwYWNrYWdlLgo+IAo+IFRvIHRlc3Q6Cj4gQlIyX2FhcmNoNjQ9
eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9P
VExJTj15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNfU1RB
QkxFPXkKPiBCUjJfUEFDS0FHRV9YRU49eQo+ICAjIEJSMl9QQUNLQUdFX1hFTl9UT09MUyBpcyBu
b3Qgc2V0Cj4gCj4gU2lnbmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5j
b20+CgpSZXZpZXdlZC1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRA
YW1kLmNvbT4KClRoYW5rIHlvdSBmb3IgdGhpcy4gSSBqdXN0IHdhbnQgdG8gcHJvdmlkZSBhIGZl
dyBtb3JlIGRldGFpbHMgZm9yIGZ1dHVyZQpyZWZlcmVuY2UuCgpfX1hFTl9JTlRFUkZBQ0VfVkVS
U0lPTl9fIGJlaW5nIGRlZmluZWQgaXMgYSBzaWRlLWVmZmVjdCBvZiBpbmNsdWRpbmcgZWl0aGVy
Cnhlbi5naXQveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oICh2aWEgI2luY2x1ZGUgPHhlbi94ZW4u
aD4pIG9yCnFlbXUuZ2l0L2luY2x1ZGUvaHcveGVuL3hlbi5oICh2aWEgI2luY2x1ZGUgImh3L3hl
bi94ZW4uaCIpLiBJbiBRZW11LCB3ZSBjb3VsZApoYXZlIGNvbnNpZGVyZWQgY2hhbmdpbmcgdGhl
IGNoZWNrIGluIHhlbl9uYXRpdmUuaCB0bwojaWYgZGVmaW5lZChfX1hFTl9QVUJMSUNfWEVOX0hf
XykgfHwgZGVmaW5lZChRRU1VX0hXX1hFTl9IKQpUaGVuIHdlJ2QgYmUgY2hlY2tpbmcgZm9yIHRo
ZSBoZWFkZXIgaW5jbHVzaW9uIGRpcmVjdGx5IGluc3RlYWQgb2YgcmVseWluZyBvbiBhCnNpZGUt
ZWZmZWN0LCBhbmQgdGhhdCB3b3VsZCBhbHNvIGFsbG93IHBhc3NpbmcgLURfX1hFTl9JTlRFUkZB
Q0VfVkVSU0lPTl9fPS4uLgphcyBidWlsZHJvb3Qgd2FzIGRvaW5nLiBCdXQgdGhpcyBhcHByb2Fj
aCBpcyBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IElNTywgYW5kIGl0CndvdWxkIGJlIGJldHRlciB0
byBmaW5kIGEgc29sdXRpb24gd2l0aG91dCBtYWludGFpbmluZyBhIHBhdGNoIGZvciBxZW11LgoK
Rm9yIGNvbnRleHQsIHdoZW4gYnVpbGRpbmcgWGVuIHRvb2xzLCB3ZSBkZWZpbmUgX19YRU5fSU5U
RVJGQUNFX1ZFUlNJT05fXyBvbiB0aGUKY29tbWFuZCBsaW5lIHZpYSBDRkxBR1MgLSBzZWUgeGVu
LmdpdC90b29scy9SdWxlcy5tazoKQ0ZMQUdTICs9IC1EX19YRU5fSU5URVJGQUNFX1ZFUlNJT05f
Xz1fX1hFTl9MQVRFU1RfSU5URVJGQUNFX1ZFUlNJT05fXwoKWGVuIHRvb2xzIGhhcyBhIGJ1aWxk
IHRhcmdldCBmb3IgcWVtdQooeGVuLmdpdC90b29scy9NYWtlZmlsZTpzdWJkaXItYWxsLXFlbXUt
eGVuLWRpciksIGFuZCBpdCB0eXBpY2FsbHkgaW52b2tlcyB0aGUKcWVtdSBidWlsZCB3aXRoIGEg
ZnJlc2ggc2V0IG9mIENGTEFHUywgaS5lLiB0aGUgLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9f
PS4uLgpzaG91bGQgYmUgZHJvcHBlZC4gSG93ZXZlciwgYnVpbGRyb290IHNvbWVob3cgcHJvcGFn
YXRlcyB0aGUKLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fPS4uLiB3aGVuIGJ1aWxkaW5nIHFl
bXUteGVuLCBoZW5jZSB0cmlnZ2VyaW5nIHRoZQppbmNsdWRlIG9yZGVyIGFzc2VydGlvbiBpbiBx
ZW11LmdpdC9pbmNsdWRlL2h3L3hlbi94ZW5fbmF0aXZlLmguCgpTbyB0aGUgZml4IGhlcmVpbiBp
cyB0byB1bmRvIHRoZSBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIGRlZmluZSBvbiB0aGUgY29t
bWFuZApsaW5lIHdoZW4gYnVpbGRpbmcgcWVtdS4gVGh1cywgX19YRU5fSU5URVJGQUNFX1ZFUlNJ
T05fXyB3aWxsIGJlIGRlZmluZWQgaW4gdGhlCnVzdWFsIG1hbm5lciB3aGVuIGluY2x1ZGluZyB0
aGUgYXBwcm9wcmlhdGUgaGVhZGVyLgoKPiAtLS0KPiBWMS0+VjI6Cj4gLSBjaGFuZ2VkIG1ldGhv
ZCB0byBtb2RpZnkgcGF0Y2hlcyBpbnN0ZWFkIG9mIHhlbi5tawo+IFYyLT5WMzoKPiAtIHJlbW92
ZWQgdGV4dCBmcm9tIGNvbW1pdCBtZXNzYWdlIHdoaWNoIGFwcGVhcnMgYXMgc3RhcnQgb2YgcGF0
Y2gKPiBWMy0+VjQ6Cj4gLSBtZXJnZWQgaW50byBwYXRjaCBzZXJpZXMgYXMgdGhlIGZpcnN0IHBh
dGNoCj4gVjQtPlY1Ogo+IC0gcmVtb3ZlZCBxZW11LXhlbiBwYXRjaAo+IC0gdW5kZWZpbmVkIF9f
WEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gZnJvbSBxZW11LXhlbgo+IC0tLQo+ICBwYWNrYWdlL3hl
bi8wMDAyLVVwZGF0ZS1saW5rZXItZmxhZ3MucGF0Y2ggfCAxNiArLS0tLS0tLS0tLS0tLS0tCj4g
IHBhY2thZ2UveGVuL3hlbi5tayAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UveGVuLzAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaCBiL3Bh
Y2thZ2UveGVuLzAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaAo+IGluZGV4IGFjMDI3MjI3
ODEuLjNiYTY3OGNkOWIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS94ZW4vMDAwMi1VcGRhdGUtbGlu
a2VyLWZsYWdzLnBhdGNoCj4gKysrIGIvcGFja2FnZS94ZW4vMDAwMi1VcGRhdGUtbGlua2VyLWZs
YWdzLnBhdGNoCj4gQEAgLTE2LDggKzE2LDcgQEAgVXBzdHJlYW06IEJ1aWxkcm9vdCBzcGVjaWZp
Yy4gVGhpcyBpcyBhIHRlbXBvcmFyeSBwYXRjaCBmb3IgYW4gaW50ZXJtZWRpYXRlIGJ1bXAKPiAg
U2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+
ICAtLS0KPiAgIHRvb2xzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
OSArKysrKysrKysrKysrKysrKysrKy0KPiAtIHRvb2xzL3FlbXUteGVuL2luY2x1ZGUvaHcveGVu
L3hlbl9uYXRpdmUuaCB8ICAyICstCj4gLSAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gKyAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbnMoLSkKPiAgCj4gIGRpZmYgLS1naXQgYS90b29scy9NYWtlZmlsZSBiL3Rvb2xz
L01ha2VmaWxlCj4gIGluZGV4IGE5YTMxOTZlLi41ZDI4OTY1MSAxMDA2NDQKPiBAQCAtNjksMTkg
KzY4LDYgQEAgaW5kZXggYTlhMzE5NmUuLjVkMjg5NjUxIDEwMDY0NAo+ICAgCQktLWJpbmRpcj0k
KExJQkVYRUNfQklOKSBcCj4gICAJCS0tZGF0YWRpcj0kKFNIQVJFRElSKS9xZW11LXhlbiBcCj4g
ICAJCS0tbG9jYWxzdGF0ZWRpcj0kKGxvY2Fsc3RhdGVkaXIpIFwKPiAtZGlmZiAtLWdpdCBhL3Rv
b2xzL3FlbXUteGVuL2luY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUuaCBiL3Rvb2xzL3FlbXUteGVu
L2luY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUuaAo+IC1pbmRleCA2YmNjODNiYS4uMjU5MDkwNGUg
MTAwNjQ0Cj4gLS0tLSBhL3Rvb2xzL3FlbXUteGVuL2luY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUu
aAo+IC0rKysgYi90b29scy9xZW11LXhlbi9pbmNsdWRlL2h3L3hlbi94ZW5fbmF0aXZlLmgKPiAt
QEAgLTIsNyArMiw3IEBACj4gLSAjZGVmaW5lIFFFTVVfSFdfWEVOX05BVElWRV9ICj4gLSAKPiAt
ICNpZmRlZiBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fCj4gLS0jZXJyb3IgSW4gWGVuIG5hdGl2
ZSBmaWxlcywgaW5jbHVkZSB4ZW5fbmF0aXZlLmggYmVmb3JlIG90aGVyIFhlbiBoZWFkZXJzCj4g
LSsjd2FybmluZyBJbiBYZW4gbmF0aXZlIGZpbGVzLCBpbmNsdWRlIHhlbl9uYXRpdmUuaCBiZWZv
cmUgb3RoZXIgWGVuIGhlYWRlcnMKPiAtICNlbmRpZgo+IC0gCj4gLSAvKgo+ICAtLSAKPiAgMi41
MS4wCj4gIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3hlbi94ZW4ubWsgYi9wYWNrYWdlL3hlbi94
ZW4ubWsKPiBpbmRleCA3NTI1MmQxMTIzLi5iZGRmZGJiYTM4IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UveGVuL3hlbi5tawo+ICsrKyBiL3BhY2thZ2UveGVuL3hlbi5tawo+IEBAIC00MCw3ICs0MCw4
IEBAIFhFTl9NQUtFX0VOViA9IFwKPiAgCUNST1NTX0NPTVBJTEU9JChUQVJHRVRfQ1JPU1MpIFwK
PiAgCUhPU1RfRVhUUkFDRkxBR1M9Ii1Xbm8tZXJyb3IiIFwKPiAgCVhFTl9IQVNfQ0hFQ0tQT0xJ
Q1k9biBcCj4gLQkkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykKPiArCSQoVEFSR0VUX0NPTkZJR1VS
RV9PUFRTKSBcCj4gKwlFWFRSQV9DRkxBR1NfUUVNVV9YRU49Ii1VX19YRU5fSU5URVJGQUNFX1ZF
UlNJT05fXyIKPiAgCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfWEVOX0hZUEVSVklTT1IpLHkpCj4g
IFhFTl9NQUtFX09QVFMgKz0gZGlzdC14ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
