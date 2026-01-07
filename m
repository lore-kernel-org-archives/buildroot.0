Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACF2CF6BF0
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 06:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB9DE60799;
	Wed,  7 Jan 2026 06:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvyXkOGkFSDy; Wed,  7 Jan 2026 06:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A798607A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767765720;
	bh=CSwJ72sqqNhAa0eD98WZipRHE3LYM1SDljbTdy6CIm4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CwS5UsRHro0lr9jDqm8zOnLrA/OizEEtcBYHi9T1p7ejoUzRIdhffjpoMVV1Sss/a
	 jHeH6ktw+aWM0gT9/EAjm5uDEq4bPlZhDqnP3Y2zEuce/g/ESZHSEQv3gLweb93pqY
	 5wXaElgKwtXea8wV84HpkauiHcgx5VgqBxcEh81ZD+i3sixZCksPQt6CT5nWvl/XF7
	 C4spSrhz2w/AmDNbHE/VNTd3eLKJNXEsrx6u0G22WBMia/uHcd3Ev44bEkCZJDxsVL
	 1DUiBr9qP6elw662U1CF3PCmilMZuOi5zIUvLUc0X3buQNViPGygD2qtGs8Blzdb2w
	 hiSqHPkcvuvwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A798607A3;
	Wed,  7 Jan 2026 06:02:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B09F70B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 06:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DDBE607A3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 06:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwsvwEcVIcS4 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 06:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c405::7;
 helo=tydpr03cu002.outbound.protection.outlook.com;
 envelope-from=yang.li@amlogic.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8BA4260799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BA4260799
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::7])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BA4260799
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 06:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXUzPpHgJiaQLneECcc7UsnCF0uRar7SYmw/NisB+ha6WJowhNsY1YpGSd0eDgkO2x6QLbS5h5aU6UL1Lmv+XujFjBtvsHkO/C3wX9OmCfhQSqIJ6niZxFavO6sKu6J+s2lRW8/EIpC1+tf7ZsOq3xTkRdwOyM5EPqMm9yzMHO+fd6ApWOvHFWOCGg7H/YJMLGkOQH+OY8VxgevZizViRv9zKNGvNxuT+rGvPHGb+Ku5IDNMmM3yJ3kqTHIydxL8duhShJ9CJ121auPzM0yuINbdo0PGR3bx5GioMuPgaT99HiQPmAJrgfXPCq4mBk5Qhw8Z8yzl8yjtKPxyFYGwzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUzGHaIeErEundwiUwAy6//b8/RKB77dog8ibTEbja8=;
 b=LA7nP1D7fYeOAwCCBWmoYNwpiLRIKjeNBJKGfyRD9IZeE5HPKEFK2uDumXKK+3uy3x8FP/bSAILB19UjnoZV9CIbK2g4qle7aSYfW8o1TCrW134wTxw9jeT8Vkv2nX/wBJbnwqK0HICJikB9JunIzxyX79woqSB5Y3Gycw4FvlQKveSYKLmoxdEpre3E6SsnHHC8Vj1QeDgZ8sUfFOikH7RVgMwgl+I11M5sgMWhcqroMBoxcZ1ysCuMlReKqtpevzSeB3xQZptMbsqLZqI3r2+kFq+sk5FubooUUcrDusAZQeHjyJnZ+ueTqwwb3qjd0hnyzNwmO3efa3+hMCoIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com (2603:1096:990:16::12)
 by KL1PR03MB7623.apcprd03.prod.outlook.com (2603:1096:820:eb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 06:01:48 +0000
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::4128:9446:1a0f:11fd]) by JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::4128:9446:1a0f:11fd%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:01:47 +0000
Message-ID: <f9e86e42-759e-48b4-9248-81534b852910@amlogic.com>
Date: Wed, 7 Jan 2026 14:01:06 +0800
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
References: <20251205020659.193849-1-yang.li@amlogic.com>
Content-Language: en-US
In-Reply-To: <20251205020659.193849-1-yang.li@amlogic.com>
X-ClientProxiedBy: TPYP295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::15) To JH0PR03MB7468.apcprd03.prod.outlook.com
 (2603:1096:990:16::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7468:EE_|KL1PR03MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4eba47-64bd-4a92-a88f-08de4db23e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU1IZzlYaHYwRXVocnNCN1pYNVZMWGJTT2wrZ2dXclBWTE9FaFZXcytPaElT?=
 =?utf-8?B?akdqYU9mUEZKZzBmNXNGdkRRVk1wR2JVZ1k4bUZEYlNsaWpkZ0laU0tGekJL?=
 =?utf-8?B?V0VyWURHR0p2NzBRSTZHNGxwcnhIK05DbWFvRGV4VjdIT2tPSE5yL1llQnNy?=
 =?utf-8?B?ZHFSVzJrWEJEbWJHWWUwcEc4SmRrZXJyVnk3U2pJR0xuMWR0Q2FQZHMxa2lS?=
 =?utf-8?B?RmdTOUJpbmlkVGZUYjBJQjR6VE5CcDZyUU9nbVJpQ0RYNFoyeVJTdUU4Szdk?=
 =?utf-8?B?Uy9qK2dwS0I0cjhac1V0R2k3dGlkeGExemFncXUvY3hDNVQ2WU81ZGt5TGFF?=
 =?utf-8?B?U1R1ZmMvaEZVUmMwY3JTTk5pSjFobHBEWDRGdFBZRTZjekp6NGFEWEJBaG43?=
 =?utf-8?B?ZUZFeTFXN3lSV2RVUXRheWp4T1ZDaG5TUzVxNC96SjE0REJ1bHYyTFE1N1Za?=
 =?utf-8?B?VDUvT1VlaHRGdDRlVElCN25BS2xqS2xjSGtIay9Gck5uQ2NJNTJRNUNDTE1R?=
 =?utf-8?B?TjMxeXJDa0xIQ0I3THBkVmhaM0M4UUp2b082MUlxK3ZpcndtUzFhMXZxaFA2?=
 =?utf-8?B?QWJla1UweCtrSVNubHp5MFBheDhXaTBlQTV0VS9tRStMaVUya21CRzJLK2JE?=
 =?utf-8?B?VkZYbWVYeTNvWnlXT0ZBY3hieHAycjNuMGh2THhpN1BYYktsMmVseDJDRVNj?=
 =?utf-8?B?UkJjeWpuWmpndVM2aW1KcDJsT0dSSnY0SWhLd2llZGQ4dkR1YVVCWlc4Smpr?=
 =?utf-8?B?Zk9WWFBqUDFFdDlZU0Z4TVdMcmpZeHJpY1E5Q1Y5TUZ2d3VyYUlMSkphd20x?=
 =?utf-8?B?RS9BbzFRQm5MR3Y2L2l3UjdVR1c0eDBQMlBhN3VUSHVvNi9yUFpUbW5FU2JZ?=
 =?utf-8?B?TW9YWll6OEFjSEFVREhwdWdSV0ZlZzMwblI4VkMySHVmeE1pckhLcnNqSFE4?=
 =?utf-8?B?Vm9XUGt3ZWhTbERjVXl6ZXRNSThJV0xFQ1dOczlML2ZOK3lTVlh4L3k5NWNQ?=
 =?utf-8?B?ZnR5V3BvNFVuY1g2UGc4eTQ5cWNaeUlOWWthOHF4emo4YndzRG1EbmN6UXRE?=
 =?utf-8?B?cDR4NGc4ekQwS0R4TmQ5ZW5FbVhDTE0yTG5kVFovZDdZODJvMlFoam03Rk9s?=
 =?utf-8?B?OVdUL29UakFTVXVHUlJ5cXF2Qmp1cyttaDBHUy9aeEpMcU1FQVgwWnpuL1Aw?=
 =?utf-8?B?dEJ6V1RXb25JU1dMQXJHVUM2Q0Raamp0K1RxckhqSGFBZjhCYWxYa041ejNU?=
 =?utf-8?B?dGNPc09YMFBUZUlDcFhidWd1aVJSVFZwSVB5cWRNbzJNYVdsUit5YkRIUVFU?=
 =?utf-8?B?S1pobEVHY01lRXRKMFdMNDkrWHpIeWhIWEhudWFhcmRvcm9aa1RNVjFocHJV?=
 =?utf-8?B?VnF5clpQRUx3cTd6VnQ0ZkJIWlNQUkFobHVUMEU3NW5VQ05sU29rQ2xsSGJU?=
 =?utf-8?B?QWNGZHRZTnpoeVBTSFBXS0hZbGE2aTFPOW1WdE84Vy9uaWEzNVcxYW9mL05o?=
 =?utf-8?B?VUJxcGlyNkhiMUM2NG9XWWtNRkVPUHhoYjZkR0JRZTh1UWJyK3VIOVlFRUJI?=
 =?utf-8?B?YUZ0dUpkellJU3lhMTArUzNwcjRjczRlNDNkbDZEODk1ZnlOZEJ2bFlUN0th?=
 =?utf-8?B?ZHNLdGZqaVRUU1hxamxoNXRJWGV5MlFNTzRISS92aUkrdmNsYk9NYWlObmJw?=
 =?utf-8?B?MmlTbDdQTmR3V1dTQ0JBeWY0eFRUTW9YMFFxT3Qyd05NVy9ieWFiNWc3Z3lx?=
 =?utf-8?B?djJnM0N0NXVUdGt4SVZuTzRZUzhFQXB0aGhjam9TZWlnR05qK1RVSHh5NFFu?=
 =?utf-8?B?OGw5eTNZL2ZCdy83TW1VbTFKckpsYUE2UVRsTDBsUWhQdmtrOXJwM0VYdVRj?=
 =?utf-8?B?Ull1SnkwQmJRajVUb3JWbC9wQUw0UzM3TnBKM29PQ3JqTHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JH0PR03MB7468.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7142099003); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVc4aVlrYWN1aWZJVVFOY2UrR2tTNm1aTmN1emorZk41Yi9hUnByUGpmcHp1?=
 =?utf-8?B?MVZDT1UrQnNHWGViYTdvaWVWamYzZXVScXJsWlZCbFlmb2VrbGRZcU91YVBE?=
 =?utf-8?B?UDJReFVKak45cHA3engwUWg5aXRjcC94RFlhaGlPdGZzSWVkaktJbVdtQ1Fx?=
 =?utf-8?B?OS9ONVNhZkh4ajdnUUZySVUxc3NVK0pTQzhSbXI2K1Q2TDhzeDBHdnJzS2Nr?=
 =?utf-8?B?UTZWM0ZvemZHWVkyVGVyb2s2Q09zV213cm1QbVdUWTZEMnFHUWpNOVhwcjRw?=
 =?utf-8?B?N1NmYVI4NCs0eFZQWk5HYytrTnhRSVQrYWJBdkM2YTZocy9MZEcxUTNjeWx3?=
 =?utf-8?B?Z2tmVXg0Y0xHYW5FUm1GVkJkcVA4MERjWFZWcmhWRUtTZHhNUmNRcm9rci9I?=
 =?utf-8?B?SE55eUdnK2o5aUt2dWtmQWFpSy84ZGZEUXhTWXJCS0FGLzJkZXN1dWNMRTdO?=
 =?utf-8?B?eG9NQ0VvMm4vWWlMb2w3YW9JVkZNMWlYZmtJQmJSYUt0ZkcrVURuelRzbUFH?=
 =?utf-8?B?UExVMUlCaUZvVHdpTDVXMU9NMnY4dDdLemlrcEw4T1h2QTlBNG5NYndxWkg1?=
 =?utf-8?B?UFFxa0ZNazk4QUh2MEUxanRVT0NGTUozakszdCtqczg5TlA0YW5iSGl4VUp5?=
 =?utf-8?B?b3ErMis4MHFJcm53c3lRLzlrZElPVis5M0NtaW5sSFlvTXNSZ2JoUHlXZDJK?=
 =?utf-8?B?MGw1RU1MdEJyZnRUL0J2YnJpaGFxa0Vxbnl0OGFwazV6UlE1a0NNZ3FXd3dB?=
 =?utf-8?B?WEdROGxQUlZ0Y0RSRk5JRU1mUFZjWFAvWDhQVXB5TU5xamlEQXppY01DYnhC?=
 =?utf-8?B?dFo0eU9LdVVkRENDNERGYjBYT0lHOWVmMkNCQTY3WTgxMjN5djZENGJsMnNn?=
 =?utf-8?B?aUd6TFNzWW01WFdlOGhHNjVnMG12TmFOS0lVbFhhM2tMa3k4aWpoRndlejVu?=
 =?utf-8?B?dlE0alhkalEwaE12NnFGQTI2bkgrd29SSW1NVCtMK1I2Ukwxc3JmbnFaUUJJ?=
 =?utf-8?B?ek9NanVYSE5xZUY2bzF3MnVKM2QrYnNkRDNhcExIRldBbVF0Y0VWc1gvOHVJ?=
 =?utf-8?B?UFplRmJLZEU4RW0rY0wwSGV6Y09oeW1VeVdOSUJyeEUwb3VkZEJ1dmE0OFJm?=
 =?utf-8?B?MzMrMGpMc2lqZDZBcEpDSzFPOEpQbVBGOFRSeGY5MEZXZ1R5ckU4UXZKYkFk?=
 =?utf-8?B?ZndLYk44a25DZVZPRk1OOG9Zd2VtTkc2c3MxbzB1b1Jmanp2WklVVlBjSzFQ?=
 =?utf-8?B?WFlpL0NOTDBEei9YVzlYUUZQazkxTmxabENOTlM1MGtjWm1YUngvWWtvWTd0?=
 =?utf-8?B?OStJQjBDTzFMMVAvdDJodEhLRkk5NGJYZmNGQmNDYXVXSXd3RnJ6NmZ2a0V4?=
 =?utf-8?B?M0cxZzBoMmhOcUZSTFBwSDhHUDN1M0pmN2l5WWJxZnZQT01IRlpwUEFqT0VQ?=
 =?utf-8?B?L0ZkSUxDVVg0MlhtM2NnaWh3Y2tIQ1pHTlVLRHlLKzhDM2JFZXgxRGFMcGJH?=
 =?utf-8?B?dFJIanlpTEMvQ1I3cUk2bkZvYnZ0NWZvQkh3SmVhRU9pWGszbTU2dGc5SXd3?=
 =?utf-8?B?eHE4VE81aEpIM0NBbGRBeU95V2wxaEF1ZUI5VHdvdXd0dit5RzRTREtLdWtI?=
 =?utf-8?B?bHVINjlRTjBWTEd2NGVURk9KWFl4TmNMank4bSttaXZEbmpseU5ub2YxSkdo?=
 =?utf-8?B?Sm1uTXUzSitIcWdhL3R3aVJFQmVkQTdjV1phSk5IMTNYQ0tzeXVEc0ZIZ1c3?=
 =?utf-8?B?aW45cWpXQndGUHBiczluYVFuTS81dWpOSlhpQVVETEordXhwY01uTHRvNXpt?=
 =?utf-8?B?d1lBbTFTK1NwaFFteUE1Tm5wOGtUaWNVR2NQbDBkOWlFQVlXNXVuZTAxWG5S?=
 =?utf-8?B?NXh4a29nOVVTZlFYVXJibm5qSTJtME9PaGlLcC8yai9nVDF6Y3NOV3FJblIx?=
 =?utf-8?B?ZGtuMGhXWDkyY3B1QVRuaFdXd1B4c2F5b1RHRXFZV0o2Z0RxWFdUTW8wOVlm?=
 =?utf-8?B?c293N2dyVFBPNi9qcGtKSHRCRlU4MVhiQUpmZndPcWp1QThud3BISDFrdUVQ?=
 =?utf-8?B?V0QxWlZWZ0VLOEtXSzlaVmZ1ZDNpU1dQTHJOZDRzMkFNTWVqSW9qU2dmRlZl?=
 =?utf-8?B?Ymhoc2NoN1M2SzFZb0tuTUNod3ZKT1JRMHd1L2s0M0R4M2lLeklFbm5PRE51?=
 =?utf-8?B?OVFpeTVqcXBRdkFkc2ozc1AySkwvU3NqRFRCSGZORU0wc3BJYzlaSWhoVVFm?=
 =?utf-8?B?VFlYMzdneVNReFFaY0lNRVRYeFlTb2N0M1cvUzJrbkEzU3Ztc0dqMUg2SXpW?=
 =?utf-8?B?bUk2REZHeTN3RUJnMEExSzNVcEFZMVVkcVp4TmdGUEVBbWpKY3krQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4eba47-64bd-4a92-a88f-08de4db23e46
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 06:01:47.8916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T82zjQbA7Gly8TBwZ2F7jxXZyRZy6roQt3PmpZ+Mr/eGOmiinfAembX3HRDWJrfG93Uo/M4uPEb3xpjrp8iP2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7623
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amlogic.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUzGHaIeErEundwiUwAy6//b8/RKB77dog8ibTEbja8=;
 b=VcaCzYLDk/vz+91aaoOxfEH5hx1VxNEWDGBypVrxvplb+liVDj9Ht6xkUS90Y48GiGUvEAas6nC8hLTTgHwb5iMVfJr8FC+fhK96MSaPMEFroYV0pSAM8NsTeeWGGlF7yLhKGGWF4B5mhkje1FdMDAfKiU3oJU+J2p1r60PofBtpuF0zcwnd99iQDm53GTFSpLH/cYPFlBH29tI8p/kE8gkprnlgwlVHTpcFmaYsKhvCzvKSPHyfaYOmdLZV8KMZ4stJ06dRKsOlY883oSeXgJJtOvyx7QSZ8Tv8IqEB5LUNJ3XYEQ+DLN4lD2cNquo61rzSIHeljujtzt/nLb1ueg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amlogic.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256
 header.s=selector1 header.b=VcaCzYLD
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Subject: Re: [Buildroot] [PATCH] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.85
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
From: Yang Li via buildroot <buildroot@buildroot.org>
Reply-To: Yang Li <yang.li@amlogic.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Just a gentle ping regarding this patch.


Best regards,

Yang


> Removed patch which are included in this release.
>
> Changelog:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog
>
> Signed-off-by: Yang Li <yang.li@amlogic.com>
> ---
>   .../bluez5_utils-headers.mk                   |   2 +-
>   ...0001-gdbus-define-MAX_INPUT-for-musl.patch |  33 ---
>   ...fix-build-with-a2dp-support-disabled.patch | 204 ++++++++++++++++++
>   ...eave-config-files-writable-for-owner.patch |  35 ---
>   ...03-input-fix-HID-compilation-w-o-HoG.patch | 140 ------------
>   ...04-input-fix-HoG-compilation-w-o-HID.patch | 120 -----------
>   package/bluez5_utils/bluez5_utils.hash        |   2 +-
>   package/bluez5_utils/bluez5_utils.mk          |   2 +-
>   8 files changed, 207 insertions(+), 331 deletions(-)
>   delete mode 100644 package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
>   create mode 100644 package/bluez5_utils/0001-transport-audio-fix-build-with-a2dp-support-disabled.patch
>   delete mode 100644 package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
>   delete mode 100644 package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
>   delete mode 100644 package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
>
> diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> index 7acf62b226..a140aeca01 100644
> --- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
> +++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # Keep the version and patches in sync with bluez5_utils
> -BLUEZ5_UTILS_HEADERS_VERSION = 5.79
> +BLUEZ5_UTILS_HEADERS_VERSION = 5.85
>   BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>   BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>   BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
> diff --git a/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch b/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
> deleted file mode 100644
> index dc823e9277..0000000000
> --- a/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 9d69dba21f1e46b34cdd8ae27fec11d0803907ee Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
> -Date: Sat, 2 Nov 2024 16:10:18 +0000
> -Subject: [PATCH] gdbus: define MAX_INPUT for musl
> -
> -This is the same solution as was done in src/shared/util.c
> -
> -Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9d69dba21f1e46b34cdd8ae27fec11d0803907ee
> -Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ----
> - gdbus/object.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/gdbus/object.c b/gdbus/object.c
> -index 84f116bf1..7b0476f1a 100644
> ---- a/gdbus/object.c
> -+++ b/gdbus/object.c
> -@@ -20,6 +20,12 @@
> - #include <dbus/dbus.h>
> -
> - #include "gdbus.h"
> -+
> -+/* define MAX_INPUT for musl */
> -+#ifndef MAX_INPUT
> -+#define MAX_INPUT _POSIX_MAX_INPUT
> -+#endif
> -+
> - #include "src/shared/util.h"
> -
> - #define info(fmt...)
> ---
> -2.45.2
> -
> diff --git a/package/bluez5_utils/0001-transport-audio-fix-build-with-a2dp-support-disabled.patch b/package/bluez5_utils/0001-transport-audio-fix-build-with-a2dp-support-disabled.patch
> new file mode 100644
> index 0000000000..2fa6796a94
> --- /dev/null
> +++ b/package/bluez5_utils/0001-transport-audio-fix-build-with-a2dp-support-disabled.patch
> @@ -0,0 +1,204 @@
> +From 0b7395a3479686f46afe508a345bfa50fc20767e Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sat, 22 Nov 2025 17:10:46 +0100
> +Subject: [PATCH BlueZ] transport/audio: fix build with a2dp support disabled
> +
> +Fixes:
> +    CCLD     src/bluetoothd
> +  /usr/lib64/gcc/x86_64-suse-linux/bin/ld: profiles/audio/bluetoothd-media.o: in function `endpoint_init_a2dp_sink':
> +  .../bluez-5.85/profiles/audio/media.c:728:(.text.endpoint_init_a2dp_sink+0x2b): undefined reference to `a2dp_add_sep'
> +  /usr/lib64/gcc/x86_64-suse-linux/bin/ld: profiles/audio/bluetoothd-media.o: in function `endpoint_init_a2dp_source':
> +  .../bluez-5.85/profiles/audio/media.c:715:(.text.endpoint_init_a2dp_source+0x28): undefined reference to `a2dp_add_sep'
> +  /usr/lib64/gcc/x86_64-suse-linux/bin/ld: profiles/audio/bluetoothd-media.o: in function `set_configuration':
> +  .../bluez-5.85/profiles/audio/media.c:512:(.text.set_config+0x35): undefined reference to `a2dp_setup_get_device'
> +  /usr/lib64/gcc/x86_64-suse-linux/bin/ld: .../bluez-5.85/profiles/audio/media.c:525:(.text.set_config+0x8c): undefined reference to `a2dp_setup_remote_path'
> +  /usr/lib64/gcc/x86_64-suse-linux/bin/ld: profiles/audio/bluetoothd-media.o: in function `media_endpoint_remove':
> +  .../bluez-5.85/profiles/audio/media.c:250:(.text.media_endpoint_remove+0xc): undefined reference to `a2dp_remove_sep'
> +  /usr/lib64/gcc/x86_64-suse-linux/bin/ld: profiles/audio/bluetoothd-media.o: in function `endpoint_reply':
> +  .../bluez-5.85/profiles/audio/media.c:361:(.text.endpoint_reply+0x267): undefined reference to `a2dp_parse_config_error'
> +  collect2: error: ld returned 1 exit status
> +  make[1]: *** [Makefile:5491: src/bluetoothd] Error 1
> +  make: *** [Makefile:4096: all] Error 2
> +
> +Fixes: https://github.com/bluez/bluez/issues/1675
> +---
> + profiles/audio/media.c     | 19 ++++++++++++++++++-
> + profiles/audio/transport.c |  6 ++++++
> + 2 files changed, 24 insertions(+), 1 deletion(-)
> +
> +diff --git a/profiles/audio/media.c b/profiles/audio/media.c
> +index a7a8575f9..418a9d06b 100644
> +--- a/profiles/audio/media.c
> ++++ b/profiles/audio/media.c
> +@@ -56,14 +56,18 @@
> + #include "src/shared/bap.h"
> + #include "src/shared/bap-debug.h"
> +
> ++#ifdef HAVE_A2DP
> + #include "avdtp.h"
> ++#endif
> + #include "media.h"
> + #include "transport.h"
> ++#ifdef HAVE_A2DP
> + #include "a2dp.h"
> +
> + #ifdef HAVE_AVRCP
> + #include "avrcp.h"
> + #endif
> ++#endif
> +
> + #define MEDIA_INTERFACE "org.bluez.Media1"
> + #define MEDIA_ENDPOINT_INTERFACE "org.bluez.MediaEndpoint1"
> +@@ -106,7 +110,9 @@ struct endpoint_request {
> + };
> +
> + struct media_endpoint {
> ++#ifdef HAVE_A2DP
> + 	struct a2dp_sep		*sep;
> ++#endif
> + 	struct bt_bap_pac	*pac;
> + 	struct bt_asha_device	*asha;
> + 	char			*sender;	/* Endpoint DBus bus id */
> +@@ -246,10 +252,12 @@ static void media_endpoint_remove(void *data)
> + 	struct media_endpoint *endpoint = data;
> + 	struct media_adapter *adapter = endpoint->adapter;
> +
> ++#ifdef HAVE_A2DP
> + 	if (endpoint->sep) {
> + 		a2dp_remove_sep(endpoint->sep);
> + 		return;
> + 	}
> ++#endif
> +
> + 	info("Endpoint unregistered: sender=%s path=%s", endpoint->sender,
> + 			endpoint->path);
> +@@ -354,6 +362,7 @@ static void endpoint_reply(DBusPendingCall *call, void *user_data)
> + 			return;
> + 		}
> +
> ++#ifdef HAVE_A2DP
> + 		if (dbus_message_is_method_call(request->msg,
> + 					MEDIA_ENDPOINT_INTERFACE,
> + 					"SetConfiguration")) {
> +@@ -362,7 +371,7 @@ static void endpoint_reply(DBusPendingCall *call, void *user_data)
> + 			ret = &error_code;
> + 			size = 1;
> + 		}
> +-
> ++#endif
> + 		dbus_error_free(&err);
> + 		goto done;
> + 	}
> +@@ -497,6 +506,7 @@ static struct media_transport *find_device_transport(
> + 	return match->data;
> + }
> +
> ++#ifdef HAVE_A2DP
> + struct a2dp_config_data {
> + 	struct a2dp_setup *setup;
> + 	a2dp_endpoint_config_t cb;
> +@@ -552,6 +562,7 @@ static gboolean set_configuration(struct media_endpoint *endpoint,
> + 	return media_endpoint_async_call(msg, endpoint, transport,
> + 						cb, user_data, destroy);
> + }
> ++#endif
> +
> + static void release_endpoint(struct media_endpoint *endpoint)
> + {
> +@@ -602,6 +613,7 @@ static size_t get_capabilities(struct a2dp_sep *sep, uint8_t **capabilities,
> + 	return endpoint->size;
> + }
> +
> ++#ifdef HAVE_A2DP
> + struct a2dp_select_data {
> + 	struct a2dp_setup *setup;
> + 	a2dp_endpoint_select_t cb;
> +@@ -735,6 +747,7 @@ static bool endpoint_init_a2dp_sink(struct media_endpoint *endpoint, int *err)
> +
> + 	return true;
> + }
> ++#endif
> +
> + struct pac_select_data {
> + 	struct bt_bap_pac *pac;
> +@@ -1486,10 +1499,12 @@ static const struct media_endpoint_init {
> + 	bool (*func)(struct media_endpoint *endpoint, int *err);
> + 	bool (*supported)(struct btd_adapter *adapter);
> + } init_table[] = {
> ++#ifdef HAVE_A2DP
> + 	{ A2DP_SOURCE_UUID, endpoint_init_a2dp_source,
> + 				a2dp_endpoint_supported },
> + 	{ A2DP_SINK_UUID, endpoint_init_a2dp_sink,
> + 				a2dp_endpoint_supported },
> ++#endif
> + 	{ PAC_SINK_UUID, endpoint_init_pac_sink,
> + 				experimental_endpoint_supported },
> + 	{ PAC_SOURCE_UUID, endpoint_init_pac_source,
> +@@ -3478,10 +3493,12 @@ void media_unregister(struct btd_adapter *btd_adapter)
> + 	}
> + }
> +
> ++#ifdef HAVE_A2DP
> + struct a2dp_sep *media_endpoint_get_sep(struct media_endpoint *endpoint)
> + {
> + 	return endpoint->sep;
> + }
> ++#endif
> +
> + const char *media_endpoint_get_uuid(struct media_endpoint *endpoint)
> + {
> +diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
> +index 08ca360f4..fc23cf33d 100644
> +--- a/profiles/audio/transport.c
> ++++ b/profiles/audio/transport.c
> +@@ -2745,6 +2745,7 @@ void media_transport_update_volume(struct media_transport *transport,
> + 	if (volume < 0)
> + 		return;
> +
> ++#ifdef HAVE_A2DP
> + 	if (media_endpoint_get_sep(transport->endpoint)) {
> + 		struct a2dp_transport *a2dp = transport->data;
> +
> +@@ -2757,6 +2758,7 @@ void media_transport_update_volume(struct media_transport *transport,
> +
> + 		a2dp->volume = volume;
> + 	}
> ++#endif
> + 	g_dbus_emit_property_changed(btd_get_dbus_connection(),
> + 					transport->path,
> + 					MEDIA_TRANSPORT_INTERFACE, "Volume");
> +@@ -2769,6 +2771,7 @@ int media_transport_get_device_volume(struct btd_device *dev)
> + 	if (dev == NULL)
> + 		return -1;
> +
> ++#ifdef HAVE_A2DP
> + 	/* Attempt to locate the transport to get its volume */
> + 	for (l = transports; l; l = l->next) {
> + 		struct media_transport *transport = l->data;
> +@@ -2785,6 +2788,7 @@ int media_transport_get_device_volume(struct btd_device *dev)
> + 			return -1;
> + 		}
> + 	}
> ++#endif
> +
> + 	/* If transport volume doesn't exists use device_volume */
> + 	return btd_device_get_volume(dev);
> +@@ -2798,6 +2802,7 @@ void media_transport_update_device_volume(struct btd_device *dev,
> + 	if (dev == NULL || volume < 0)
> + 		return;
> +
> ++#ifdef HAVE_A2DP
> + 	/* Attempt to locate the transport to set its volume */
> + 	for (l = transports; l; l = l->next) {
> + 		struct media_transport *transport = l->data;
> +@@ -2814,6 +2819,7 @@ void media_transport_update_device_volume(struct btd_device *dev,
> + 			break;
> + 		}
> + 	}
> ++#endif
> +
> + 	btd_device_set_volume(dev, volume);
> + }
> +--
> +2.42.0
> +
> diff --git a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch b/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
> deleted file mode 100644
> index 09ebe5edf1..0000000000
> --- a/package/bluez5_utils/0002-Leave-config-files-writable-for-owner.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From b1fd409960001a77cda2a09ecc00147ebd9c3667 Mon Sep 17 00:00:00 2001
> -From: Fiona Klute <fiona.klute@gmx.de>
> -Date: Mon, 9 Dec 2024 16:40:43 +0100
> -Subject: [PATCH BlueZ] build: Leave config files writable for owner
> -
> -This is needed for builds running as non-root users, so the build
> -process and any distribution tools can create/move/delete files in the
> -config directory without adjusting permissions separately. Limiting
> -writes from the running service needs to be done in the systemd unit
> -(already the case) or init script.
> -
> -See also: https://lore.kernel.org/linux-bluetooth/4d1206df-598b-4a68-8655-74981b62ecca@gmx.de/T/
> -Reviewed-by: Bastien Nocera <hadess@hadess.net>
> -Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b1fd409960001a77cda2a09ecc00147ebd9c3667
> -Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ----
> - Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 297d0774c..29018a91c 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -32,7 +32,7 @@ confdir = $(sysconfdir)/bluetooth
> - statedir = $(localstatedir)/lib/bluetooth
> -
> - bluetoothd-fix-permissions:
> --	install -dm555 $(DESTDIR)$(confdir)
> -+	install -dm755 $(DESTDIR)$(confdir)
> - 	install -dm700 $(DESTDIR)$(statedir)
> -
> - if DATAFILES
> ---
> -2.45.2
> -
> diff --git a/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch b/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
> deleted file mode 100644
> index 941e9fb68f..0000000000
> --- a/package/bluez5_utils/0003-input-fix-HID-compilation-w-o-HoG.patch
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -From b111b5e15eb74e08b74cb3c7e91bcb21f54be4c7 Mon Sep 17 00:00:00 2001
> -From: Thomas Perale <thomas.perale@mind.be>
> -Date: Thu, 1 May 2025 18:35:35 +0200
> -Subject: input: fix HID compilation w/o HoG
> -
> -Commit [1] introduced a dependency with the HID plugin in the HoG code
> -As a result, building with --enable-hid --disable-hog caused linker
> -errors due to undefined references to HoG-related functions:
> -
> -```
> -> ./configure --enable-hid --disable-hog
> -...
> -> make
> -...
> -  CCLD     src/bluetoothd
> -/usr/bin/ld: profiles/input/bluetoothd-manager.o: in function `input_init':
> -/home/../bluez/profiles/input/manager.c:122:(.text.input_init+0x1c8): undefined reference to `input_set_auto_sec'
> -collect2: error: ld returned 1 exit status
> -make[1]: *** [Makefile:6376: src/bluetoothd] Error 1
> -```
> -
> -This patch moves the reading of the HOG specific configuration of the
> -'input.conf' file: LEAutoSecurity, to the HoG plugin file.
> -
> -[1] f2778f587 input: Add LEAutoSecurity setting to input.conf
> -
> -Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b111b5e15eb74e08b74cb3c7e91bcb21f54be4c7
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - profiles/input/device.h  |  1 -
> - profiles/input/hog.c     | 40 +++++++++++++++++++++++++++++++++++-----
> - profiles/input/manager.c | 11 +----------
> - 3 files changed, 36 insertions(+), 16 deletions(-)
> -
> -diff --git a/profiles/input/device.h b/profiles/input/device.h
> -index 7b87ce5903..036a88980e 100644
> ---- a/profiles/input/device.h
> -+++ b/profiles/input/device.h
> -@@ -25,7 +25,6 @@ void input_set_userspace_hid(char *state);
> - uint8_t input_get_userspace_hid(void);
> - void input_set_classic_bonded_only(bool state);
> - bool input_get_classic_bonded_only(void);
> --void input_set_auto_sec(bool state);
> -
> - int input_device_register(struct btd_service *service);
> - void input_device_unregister(struct btd_service *service);
> -diff --git a/profiles/input/hog.c b/profiles/input/hog.c
> -index 017e320f07..f82648fec8 100644
> ---- a/profiles/input/hog.c
> -+++ b/profiles/input/hog.c
> -@@ -57,11 +57,6 @@ static gboolean suspend_supported = FALSE;
> - static bool auto_sec = true;
> - static struct queue *devices = NULL;
> -
> --void input_set_auto_sec(bool state)
> --{
> --	auto_sec = state;
> --}
> --
> - static void hog_device_accept(struct hog_device *dev, struct gatt_db *db)
> - {
> - 	char name[248];
> -@@ -228,10 +223,45 @@ static struct btd_profile hog_profile = {
> - 	.auto_connect	= true,
> - };
> -
> -+static void hog_read_config(void)
> -+{
> -+	const char filename[] = CONFIGDIR "/input.conf";
> -+	GKeyFile *config;
> -+	GError *err = NULL;
> -+	bool config_auto_sec;
> -+
> -+	config = g_key_file_new();
> -+	if (!config) {
> -+		error("Failed to allocate memory for config");
> -+		return;
> -+	}
> -+
> -+	if (!g_key_file_load_from_file(config, filename, 0, &err)) {
> -+		if (!g_error_matches(err, G_FILE_ERROR, G_FILE_ERROR_NOENT))
> -+			error("Parsing %s failed: %s", filename, err->message);
> -+		g_error_free(err);
> -+		g_key_file_free(config);
> -+		return;
> -+	}
> -+
> -+	config_auto_sec = g_key_file_get_boolean(config, "General",
> -+					"LEAutoSecurity", &err);
> -+	if (!err) {
> -+		DBG("input.conf: LEAutoSecurity=%s",
> -+				config_auto_sec ? "true" : "false");
> -+		auto_sec = config_auto_sec;
> -+	} else
> -+		g_clear_error(&err);
> -+
> -+	g_key_file_free(config);
> -+}
> -+
> - static int hog_init(void)
> - {
> - 	int err;
> -
> -+	hog_read_config();
> -+
> - 	err = suspend_init(suspend_callback, resume_callback);
> - 	if (err < 0)
> - 		error("Loading suspend plugin failed: %s (%d)", strerror(-err),
> -diff --git a/profiles/input/manager.c b/profiles/input/manager.c
> -index 95ca0a7ee5..1c0b6122a1 100644
> ---- a/profiles/input/manager.c
> -+++ b/profiles/input/manager.c
> -@@ -85,7 +85,7 @@ static int input_init(void)
> - 	config = load_config_file(CONFIGDIR "/input.conf");
> - 	if (config) {
> - 		int idle_timeout;
> --		gboolean classic_bonded_only, auto_sec;
> -+		gboolean classic_bonded_only;
> - 		char *uhid_enabled;
> -
> - 		idle_timeout = g_key_file_get_integer(config, "General",
> -@@ -115,15 +115,6 @@ static int input_init(void)
> - 		} else
> - 			g_clear_error(&err);
> -
> --		auto_sec = g_key_file_get_boolean(config, "General",
> --						"LEAutoSecurity", &err);
> --		if (!err) {
> --			DBG("input.conf: LEAutoSecurity=%s",
> --					auto_sec ? "true" : "false");
> --			input_set_auto_sec(auto_sec);
> --		} else
> --			g_clear_error(&err);
> --
> - 	}
> -
> - 	btd_profile_register(&input_profile);
> ---
> -cgit 1.2.3-korg
> -
> diff --git a/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch b/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
> deleted file mode 100644
> index b2824e5e18..0000000000
> --- a/package/bluez5_utils/0004-input-fix-HoG-compilation-w-o-HID.patch
> +++ /dev/null
> @@ -1,120 +0,0 @@
> -From 9c52188d753002a6afd6ae145f921a2ff52c1c81 Mon Sep 17 00:00:00 2001
> -From: Thomas Perale <thomas.perale@mind.be>
> -Date: Thu, 1 May 2025 18:35:36 +0200
> -Subject: input: fix HoG compilation w/o HID
> -
> -Commit [1] introduced a dependency with the HID plugin in the HoG code
> -As a result, building with --disable-hid --enable-hog caused linker
> -errors due to undefined references to HID-related functions:
> -
> -```
> -> ./configure --disable-hid --enable-hog
> -> make
> -/usr/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_accept':
> -/home/../bluez/profiles/input/hog.c:184:(.text.hog_accept+0xbb): undefined reference to `input_get_auto_sec'
> -/usr/bin/ld: profiles/input/bluetoothd-hog.o: in function `hog_disconnect':
> -/home/../bluez/profiles/input/hog.c:205:(.text.hog_disconnect+0x12): undefined reference to `input_get_userspace_hid'
> -collect2: error: ld returned 1 exit status
> -make[1]: *** [Makefile:6344: src/bluetoothd] Error 1
> -make: *** [Makefile:4695: all] Error 2
> -```
> -
> -This patch duplicate the read of the 'UserspaceHID=persist' config entry
> -in the HoG plugin file to remove the dependency on the HID plugin files.
> -
> -[1] 1782bfd79 input: Add support for UserspaceHID=persist
> -
> -Fixes: https://github.com/bluez/bluez/issues/1228
> -
> -Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9c52188d753002a6afd6ae145f921a2ff52c1c81
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - profiles/input/device.c |  5 -----
> - profiles/input/device.h |  1 -
> - profiles/input/hog.c    | 14 ++++++++++++--
> - 3 files changed, 12 insertions(+), 8 deletions(-)
> -
> -diff --git a/profiles/input/device.c b/profiles/input/device.c
> -index a7bc4d44fa..3642cc3267 100644
> ---- a/profiles/input/device.c
> -+++ b/profiles/input/device.c
> -@@ -112,11 +112,6 @@ void input_set_userspace_hid(char *state)
> - 		error("Unknown value '%s'", state);
> - }
> -
> --uint8_t input_get_userspace_hid(void)
> --{
> --	return uhid_state;
> --}
> --
> - void input_set_classic_bonded_only(bool state)
> - {
> - 	classic_bonded_only = state;
> -diff --git a/profiles/input/device.h b/profiles/input/device.h
> -index 036a88980e..9056695026 100644
> ---- a/profiles/input/device.h
> -+++ b/profiles/input/device.h
> -@@ -22,7 +22,6 @@ struct input_conn;
> -
> - void input_set_idle_timeout(int timeout);
> - void input_set_userspace_hid(char *state);
> --uint8_t input_get_userspace_hid(void);
> - void input_set_classic_bonded_only(bool state);
> - bool input_get_classic_bonded_only(void);
> -
> -diff --git a/profiles/input/hog.c b/profiles/input/hog.c
> -index f82648fec8..a3c876cf9f 100644
> ---- a/profiles/input/hog.c
> -+++ b/profiles/input/hog.c
> -@@ -40,7 +40,6 @@
> - #include "src/shared/gatt-client.h"
> - #include "src/plugin.h"
> -
> --#include "device.h"
> - #include "suspend.h"
> - #include "attrib/att.h"
> - #include "attrib/gattrib.h"
> -@@ -55,6 +54,7 @@ struct hog_device {
> -
> - static gboolean suspend_supported = FALSE;
> - static bool auto_sec = true;
> -+static bool uhid_state_persist = false;
> - static struct queue *devices = NULL;
> -
> - static void hog_device_accept(struct hog_device *dev, struct gatt_db *db)
> -@@ -203,7 +203,7 @@ static int hog_disconnect(struct btd_service *service)
> - {
> - 	struct hog_device *dev = btd_service_get_user_data(service);
> -
> --	if (input_get_userspace_hid() == UHID_PERSIST)
> -+	if (uhid_state_persist)
> - 		bt_hog_detach(dev->hog, false);
> - 	else
> - 		bt_hog_detach(dev->hog, true);
> -@@ -229,6 +229,7 @@ static void hog_read_config(void)
> - 	GKeyFile *config;
> - 	GError *err = NULL;
> - 	bool config_auto_sec;
> -+	char *uhid_enabled;
> -
> - 	config = g_key_file_new();
> - 	if (!config) {
> -@@ -253,6 +254,15 @@ static void hog_read_config(void)
> - 	} else
> - 		g_clear_error(&err);
> -
> -+	uhid_enabled = g_key_file_get_string(config, "General",
> -+					"UserspaceHID", &err);
> -+	if (!err) {
> -+		DBG("input.conf: UserspaceHID=%s", uhid_enabled);
> -+		uhid_state_persist = strcasecmp(uhid_enabled, "persist") == 0;
> -+		free(uhid_enabled);
> -+	} else
> -+		g_clear_error(&err);
> -+
> - 	g_key_file_free(config);
> - }
> -
> ---
> -cgit 1.2.3-korg
> -
> diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
> index 9b39b19c08..f8cb573b18 100644
> --- a/package/bluez5_utils/bluez5_utils.hash
> +++ b/package/bluez5_utils/bluez5_utils.hash
> @@ -1,5 +1,5 @@
>   # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
> -sha256  4164a5303a9f71c70f48c03ff60be34231b568d93a9ad5e79928d34e6aa0ea8a  bluez-5.79.tar.xz
> +sha256  ad028e49254bc4551a13f08fe7904c63d02ba650d77be8ae15bb3b0a0ad94a6f  bluez-5.85.tar.xz
>   # Locally computed
>   sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
>   sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
> diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
> index e3b47e1e80..724c0fd122 100644
> --- a/package/bluez5_utils/bluez5_utils.mk
> +++ b/package/bluez5_utils/bluez5_utils.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # Keep the version and patches in sync with bluez5_utils-headers
> -BLUEZ5_UTILS_VERSION = 5.79
> +BLUEZ5_UTILS_VERSION = 5.85
>   BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
>   BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>   BLUEZ5_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
