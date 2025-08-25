Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD204C8303F
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 23:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE0842C88;
	Mon, 25 Aug 2025 23:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kv7RDNLskXK; Mon, 25 Aug 2025 23:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B930D42C79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B930D42C79;
	Mon, 25 Aug 2025 23:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1C91114
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 23:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9310342C78
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 23:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCFG-hpik3TP for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 23:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.149.154;
 helo=mx0a-0024c301.pphosted.com;
 envelope-from=yacin.belmihoub-martel@silabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9F8942C6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F8942C6B
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com
 [148.163.149.154])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9F8942C6B
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 23:42:08 +0000 (UTC)
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
 by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57PLtED5227299; Mon, 25 Aug 2025 18:42:08 -0500
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2102.outbound.protection.outlook.com [40.107.236.102])
 by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 48q9y8m3y7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 25 Aug 2025 18:42:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ia/kgr1p142SbDThgEtXgnh7sPTSKg7rEd3mr/AemNx9DNaVdhnBZUY9fMnCYalUYG67yXE5+LQjmfgJ/cLYsB7Ot44vksCUMtnG8o5HUlcnFkvviUycNam+AXbr0i79aaKFQ2ETcRTy+nPn1Eej+WNFnB0chYa3ZjJNHGq5BB2kTPo4AO8LdpNhUHhUhDA139zatRZvhjIRQRcAiduqZ5/bLDH0BpcwRDPPj4i5vsTYg7egPKLO1MDGFnp3ZTtrc+fPoys4bP5igaNrivUQaCspuzpq+vnoIGWfZ2G0E0IxyN4gX6ZLO/scQezI0h5WY46zMWLO8c2vHLvzBCkRpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEYIvJ+0ntcfZt7D5DyFKe14CDjYnK7ye4IbENRWHi0=;
 b=ULwl4Ewv3FpIWYcG7SPtldVDV2YtlNTDG095RjyAK4Z+xaQnB7bUc8rIhb1byadYqTHc0AnK4mwlrJuPiiSYM0S1bm2M2af8bTkKred8gIPXpDss6hFRgXDqAH0LTRRux/Q1slisEDsABAGIDwNmjzxTQYxnu4ZSiWCAQfTmDAa8a+JziJCnBM+hzbuO1bKN2PeG9guTwHDs0SduAKitIbLt+tMGaqabPKMYs2UFvu0/sXMIIXrrvonuGIqlaC2c8ABrRLSVlNafkVBpxKvtVyznz541ALi67Hihbmchd5183n9tQM8+W0V2gXoMqGtqFMtKG3gYVtOqhodfJzkPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by PH3PPFCE69B97EC.namprd11.prod.outlook.com (2603:10b6:518:1::d4d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 23:42:04 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 23:42:04 +0000
To: buildroot@buildroot.org
Date: Mon, 25 Aug 2025 19:41:39 -0400
Message-Id: <20250825234140.2080155-1-yacin.belmihoub-martel@silabs.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: YQBPR0101CA0271.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::32) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|PH3PPFCE69B97EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 357c90cc-e8b0-4b5f-f40b-08dde430febd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2LU0nQDnP1/t/QMPrEn4YOLQfVdajD6CT9QIMMXhHAJ8/NV4wKGeH+LYvlRJ?=
 =?us-ascii?Q?pPcTD+cW1mn2umKzJdr/YBvpR8f15rcoFWuqgXn89Bvlca4CSLNve+hI2SGK?=
 =?us-ascii?Q?b78fNOEoHvUOlSZtT+HtPior5CZsIZd6LmDgGkssV50Gag1UYDHvFCaBBUDJ?=
 =?us-ascii?Q?kTIIei3veTqfIsa43TbPdVXuM3qI+5rkVjmsHHwjkcq4DSrYaTWby1ywsBUH?=
 =?us-ascii?Q?zKUFyfsPzP1y1q7eWaaQkHFB3emurlNoX6nLOhS/Tj4Gt0PejlLWHECvDx7k?=
 =?us-ascii?Q?09X9tZTSurNTz81bk+GkzUj2365BSbkWrhkOYOxkGgEn/v3V8yqzATztFzm4?=
 =?us-ascii?Q?Kh5cY9UMRmn6I+mAdl+VBPdcRuEDq8/EwY0KASeDfxSEXA+PPAOGFtGiNJyQ?=
 =?us-ascii?Q?JX/6DzvMDYEjehxJV0XTfJnUE0RfimGb9GtV5rd/T1WyAmzxNxu8VCpBy0JY?=
 =?us-ascii?Q?R6WsptuqdmYsN9f6E+diVtPmcvwuMXLgvom1sV7Zuaa1Yd0oW/IZVBJ3bjOp?=
 =?us-ascii?Q?HPuXyV90xnkWCxqW/xC3IoR6jyDy6wnKgpujJFqMkjx5V0o4MHpPiJWXmRQt?=
 =?us-ascii?Q?V605+KC4BmUWyRKzaHfEixhdYzgYvyo7eojTH9yoE2a5sJbmeMXT2ajtSJqB?=
 =?us-ascii?Q?hYDPVNEEFqR7+ctd1MVebeBx0vq4Ark/sAqqtOoStUtDD/F5GJrDEKUlDRW6?=
 =?us-ascii?Q?76kWnG3DOc0TlZo12DMiwEGUB/XFAo1a3jMYrtQWjBKh5Lmu+8rJqsVQKgUT?=
 =?us-ascii?Q?BeqBLTzffxbSaG2WiDT2DXn8duRyB9boTgo+hzj4ftjpRd3kBMN3xZaytuei?=
 =?us-ascii?Q?NMJKn7xZSjcTUIRlqm30tr8My0vLsEC82NPegBDBZ8ba2jRohl8GpMImiqQY?=
 =?us-ascii?Q?9ck+q7BhjSin5MgBD5lqelGnS5aDqsVS+TS3abbNMiAy+cP8q5k7COVoaI2k?=
 =?us-ascii?Q?tpJDckFcR7nLVz9BX9vPp6jftmRY+8HjAj/IkZUqEvFMMpg/QWBICULOprzK?=
 =?us-ascii?Q?umXhbcyi45KBuOxZSfBe5MOJAeyD9NdL3Lcx2QvB/K5UYxP+h3HsMTF1vAXA?=
 =?us-ascii?Q?Iw6PeuyY8jvj6SHRo2uJDiDxtT7NtE/YHtZvRdyLM9kwf8P2D9Q+kJgScm7R?=
 =?us-ascii?Q?LVKgROCj+ZAzYakte4pW5IcUCnVtwldVOCk+PvTk9xJhD5S9r9WH18aQ2JAT?=
 =?us-ascii?Q?reSrxcf7Z043Iqv9OGd5RzwewVIqG8PcnqUN6Dj4VnPuPk5OpEdW+he4NsNt?=
 =?us-ascii?Q?DarqhrAM0iZcqkT6RWY8zXg2WZsX/Bn9bzo0/xbfCtWXrlCIFvVIIxWedVhg?=
 =?us-ascii?Q?p15ifi2UtjtTW7XEuVG8B8GB0nW8g3JZ5z02x1T8ClJbeQguMz882TGmvW91?=
 =?us-ascii?Q?RRtxUcqRJoFUUzwVYkSQutqPgLIZu/aOHf+uPjDLd1STJRyn1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4998.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mug8jtCojHmPT7M4npOBH0dQuteYiJyOVgzz0yvEY8j2gZqkrGrXuD64r/TR?=
 =?us-ascii?Q?zex7iMQvZPHb1sFFC2NMl5u+sYvBTg0Faa7RANO9QZosvrVyl3lQMUmIUDvA?=
 =?us-ascii?Q?IGg3rEyNQVIckNHvCoZ8hVzLKiwfZFJHwKlIcWVevqArYRJG2PEPjhkEQnsa?=
 =?us-ascii?Q?Vxqa7NYzOQOYrfgedRpjKQ7H7FtLr2RJcTDrTbmCNy3k5WkdjuspBNtaKuCM?=
 =?us-ascii?Q?F1sJU812Dik9nCN1fheVIOx0/JKRvnI2GFPMwpZA0v9eTBfUO6xvVOmGLwm8?=
 =?us-ascii?Q?5Ch91c/iedxEOGHM7Y0zs4FpQFR4it7Ni0ieLDquDvJUwPP5wgfe2KXEtZBW?=
 =?us-ascii?Q?zH2BIqQcjT5AxqkFESd9Xi5hem4ey4rfkEbMLefq7mp8JrWmFny5lchYPCWM?=
 =?us-ascii?Q?+O3LYkNGesUArEyuTT8/xBycyUD+JWPuiR9/UBSq44CQhT3hWe1/TKxv6o+3?=
 =?us-ascii?Q?JFrBZVYb97OowhTonAKjIOY40HXsYNopo3KJL53n7YmBb49UxGxNCQ/nOqw9?=
 =?us-ascii?Q?5YHcTQXf5wUtWDb6WDzlSDuuOmnSnZyxVadxccPcKPCWoi2hYW0Z/WLYumUU?=
 =?us-ascii?Q?0tGAhrxMcCsKSZ8W4nmUqR1LDjgCx7gug6f3bMWueK258fWwkGWfdKt1mB/8?=
 =?us-ascii?Q?ioI7RREQlcmKR5WQ3Zaq62C372s+y023amouO+m95rVgUauXKHmsx/fGkcEV?=
 =?us-ascii?Q?l6umZSXrhiavSlwA3+dOfrqWaEWD8c9+lfkmgpJi0rQWH3DTFZIL5ydRupfR?=
 =?us-ascii?Q?SQmNx5+kSPwKZL0WJvAMfCQjc33TF+UN5EDLigpL91uskv+tMR5g/w1lreVc?=
 =?us-ascii?Q?f6pTXL4fX/kIhhuJczmsMzAnFRc5SFxFhwrRr4S5pXftOd/5tQLHRlGoJkoC?=
 =?us-ascii?Q?8FV3k8Lj2fTZY11K4WaPIUpU618/1Eqo096kGXQlwRSJL8Q7rYGoqUdDMVvH?=
 =?us-ascii?Q?SCgguYEsQZLnygZ+8esrE/gmuHCAebdxHjqGZvOpH/cFecc/JgdBdexuP1jl?=
 =?us-ascii?Q?eMnTEA4ZCnnvoKY4tiEccTEWAiiXl9L0V+J0nQT9nmysVelnGxmaTBNzgTd5?=
 =?us-ascii?Q?E5ay6xU4tM/zlu35uJRJlLD23wHWN5l7D2tIPy27vckB5H4A0KjLWCjRv0Jj?=
 =?us-ascii?Q?0xA1zt1ievPGce1QKnpEYZwKs0eVHKp9+RxOkC4HOq8asHi5a3OSeoGkSQAG?=
 =?us-ascii?Q?f3Cbnx+9jB434Xix08TxmHe11TVK7ZC59jkuD2qIb+4F1nVCRIqCQoX9kfDT?=
 =?us-ascii?Q?tXsSRdUbM88AWMuUL4SDzLeMgFVmeHWnAwkzF+G4fRzYOrFslkfHjVWK8Hsj?=
 =?us-ascii?Q?155IIqXjMoevrmEh0kkrPEVTef51p/kpNLnrAo2xKCNVdErewiBhX2MzTR67?=
 =?us-ascii?Q?BGhNiDvbybcVCSzwzO0MGq9cesD631Hh3d7RMvg2tVAhgvmXROzVfAqGfWq3?=
 =?us-ascii?Q?GdRiTtVjk5JT6O87o34Yn79JTUa2LkXFpVFBARSlZVy3WHwk+G2GQ0qBOqmu?=
 =?us-ascii?Q?HnHiLfqm/Oa5+WoBgO3einbiEFDX9klxvNK8ajdW3AsxOIg7KYU/C7SjInDm?=
 =?us-ascii?Q?WPd4HVhWnoIrVXrAfbDe2bT+EcWYmUxn3VEnMZwqy1TN7aXbVII3a8pH3YtH?=
 =?us-ascii?Q?dkwLOw7OKJ9MBHsDoasi8xs=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357c90cc-e8b0-4b5f-f40b-08dde430febd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 23:42:04.2573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joffukGA9OUAtjN+Kpse2T+6SNrVV1IXpslYntNY12VA6sDEWMG197iXyp6Kvmb4iA+hw/ePWeCkBzTyZHhWWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCE69B97EC
X-Proofpoint-GUID: 9Gdg4k6M74No9Rp5Tjef_v0UVYt8Vpm6
X-Authority-Analysis: v=2.4 cv=Fd83xI+6 c=1 sm=1 tr=0 ts=68acf4cf cx=c_pps
 a=G6ldE1qBn6ExQWwk5g5X6g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=i1IsUcr2s-wA:10
 a=1hZRTB2j46K-_JXv1rcA:9 a=QYH75iMubAgA:10
X-Proofpoint-ORIG-GUID: 9Gdg4k6M74No9Rp5Tjef_v0UVYt8Vpm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDIxNCBTYWx0ZWRfX/Pw+AVfyOnC5
 7zjvSDQviqTHTWSGc1D+094Zj4E+prZFNmxkAJagioghe2CUAWjCkIplVnRQqZf8qlHlmDR7N87
 0jjjCpY59gKH+fkXU6BOoq+c8vMCMvVtn+12ebNIweFZUt66mF+PKVkupBhJ1Z+VdOGfuMtWOCd
 meLxb0hVIqLfsSOzai+JT3KxAjlLG9F80WG9eJikcJ8ug13oyErjahB5sHUAvMlvGnmcZ89Vlry
 o7qDsQThRdvWnt/CqWKAZdqdtlZVOKUnC3+/HMb3/oaMSbLxNoFAtBBc503GIHWCkupxILdDsYE
 4H06FyRUz7pqNEIrEEly5S3fNVqGhDKfcsbihZjoEFA2hxZ5eyNRLVJ6a+h4/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_11,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=pps12202023; bh=DEYIvJ+0ntcfZt7D5DyF
 Ke14CDjYnK7ye4IbENRWHi0=; b=i7M5YIqUbo8SbVsMsMwI78iOlXa0xvJC5MKy
 Evae3lsGlD+S5v9nCO9baBEGOM6oNxq9Kq0ze3kL5ZpnWZPxHnRBeb9TytEmhVWX
 p3OaoVyHEHJt+hCkJthlQQaztC0qR1I21vy27f8s+AVBd2/AaxoIw5FAxnC1ZiuZ
 oZkp7L3x/LgaGteZCM0GABErAxxmeUAX7LBsGpT+abj1KRjA0dNZtFHWLo8Pu6Dl
 c0jBPcTyg4ycnA7M75jDC4XKrrxqtN0X/gDrDIDOqgBPeWTwZkPP9IwFRhlGsOfU
 TeLb0+LKnCcSB8SUUbW3hiEGoaWD1f/xQPQOQVftQFC6FseBEQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEYIvJ+0ntcfZt7D5DyFKe14CDjYnK7ye4IbENRWHi0=;
 b=MrpN8mEOuuHV4igC0sHMvdjRhjl3Kj1ROAGqzhgb1PZ3GrbTBDhzAIPtWShHehBJEFh1OsQONQvaXlE5QoDLSm/+CBsleoJFTZLCi9Y4FEk3q767YAd8pfG95r0xMdZELEtF39d6miLUZQhKdR4+dn7xhN2OHkpRhElbwD7bXUc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=silabs.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=silabs.com header.i=@silabs.com
 header.a=rsa-sha256 header.s=pps12202023 header.b=i7M5YIqU; 
 dkim=pass (1024-bit key,
 unprotected) header.d=silabs.com header.i=@silabs.com header.a=rsa-sha256
 header.s=selector1 header.b=MrpN8mEO
Subject: [Buildroot] [PATCH 0/1] package/python-pyroute2: Add missing ssl
 dependency
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
From: Yacin Belmihoub-Martel via buildroot <buildroot@buildroot.org>
Reply-To: Yacin Belmihoub-Martel <yacin.belmihoub-martel@silabs.com>
Cc: Yacin Belmihoub-Martel <yacin.belmihoub-martel@silabs.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds the standard Python ssl module as a dependency to the
python-pyroute2 package, as it is imported under
pyroute2.netlink.rtnl.probe_msg.

Note: This is my first contribution to a mailing list, sorry in advance
if this patch does not fit your guidelines!

Yacin Belmihoub-Martel (1):
  package/python-pyroute2: add missing python3 ssl dependency

 package/python-pyroute2/Config.in | 1 +
 1 file changed, 1 insertion(+)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
