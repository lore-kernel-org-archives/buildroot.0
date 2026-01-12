Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B83C9EC94
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 14:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E6480792;
	Mon, 12 Jan 2026 14:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL3y5rnSABKF; Mon, 12 Jan 2026 14:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C03E80710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768227952;
	bh=3gBLEsyBhi6IsHaBXZruc5yb5XVLue9/kmQKEF7HGnc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jBeAFCY73NNQ4RQxU7g0Ca+PwEUmj0JUQOWLitqr6gXYZQHd33LRyNrnjT7hOIP/o
	 kIOj4LG/scJj59XxLJ+o3FtOkKjDgk1qX/HqwlFDJU8wvltm6nKYy9DKl3iLTyGr8b
	 W3yodoaAvlskwZb4YX7c51pGgfkS51MVBnYCTQbsAjEpBSbJw+ovniTkSaHmYp3s3X
	 /leHWSfUvmAK4HM491ap7ZgeZ3i8I38goYaygOFnFUMH6VgXsmQVpiBrl4SmWdSpYx
	 OVTT3TlQ/1FdvHeo8M+GQuH5qH6na/ypvvYqCsWmDvp+IoQ6phzHso39iYtW4d5oJm
	 I6XfzR54oAg4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C03E80710;
	Mon, 12 Jan 2026 14:25:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 176CC12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 14:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06585400AF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 14:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Znoa3faZx7S0 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 14:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c202::7;
 helo=gvxpr05cu001.outbound.protection.outlook.com;
 envelope-from=konrad.vite@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E2B7400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E2B7400A5
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c202::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E2B7400A5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 14:25:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMwPGvMQTq89Eguaf+zcgCdQQtbeczNJSzmhMYtSrT9pPg3usBmEGPi5RGj9KrPAjHLVsJtov7O3xQAXv42w3lZy5Zzz41GqgGFKouheP+1zE0mfGdEDDdsBtTpSdEU5/7ctPyIE+e5xCNh3M396nJwf9Ha+kVra/6Bu/46sTWx+oL9Iz+a22gc0A5PGqUuAEZeTiM0AFgk2yaspb02dXq90P6J46LrQ8RUG9vU6xwUSDwXGeNIUfNeEMh8Kph4+BCiHEdxJvceBb52DpGpxUaTJHTj5pXH0l3cn8C03qHZYjh68NzvPBvc5tX01unv1A1b3GaPATCKb23eWn1/HHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IJcvWRVr14IlTr5sRB2F8eyt5OGW4pS63jKdkU+7Zg=;
 b=E+CnvBWCPdr8FSGdUHoVDxMNWedicuzSrglvPVdzWdX4TAWWjPFa9c/J2ilOXfdw3CSjU5jumAaxAjbERQM+gHk49jKW/LQaQwSj26/ZGufTDlD+lkQGGIYBOEp2CvYc+9FcUn3RgKzkluxtGgzJs2S92j6lnA9l/49vZOYOouL2hXkhoPVFJMzRj7vVFDzprkww313ru6quCZGiWCnlx8duiwT7EWchfWfuPEPyDuE6i1WSXPDMyFFD/EIHY2H/oZAKMLe0Ne2ltME5bW1pGh87fAtQkgViN5cw62yuV5f7fSJVio4lfyeMvlYi4SBV72poKZ8xiKZ9if8wU87Rhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from PA6PR04MB11987.eurprd04.prod.outlook.com
 (2603:10a6:102:514::22) by PAXPR04MB9137.eurprd04.prod.outlook.com
 (2603:10a6:102:22b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:25:43 +0000
Received: from PA6PR04MB11987.eurprd04.prod.outlook.com
 ([fe80::ca30:5ffb:efb3:6777]) by PA6PR04MB11987.eurprd04.prod.outlook.com
 ([fe80::ca30:5ffb:efb3:6777%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 14:25:43 +0000
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Konrad=20Vit=C3=A9?= <konrad.vite@cherry.de>
Date: Mon, 12 Jan 2026 15:25:23 +0100
Message-ID: <20260112142524.82048-1-konrad.vite@cherry.de>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To PA6PR04MB11987.eurprd04.prod.outlook.com
 (2603:10a6:102:514::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11987:EE_|PAXPR04MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e98255d-e6fc-4999-f221-08de51e67829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmJsa1FObHl0bElRYTdCZG5kRjdINGlReVNmWVUvendvb0w0c0NIcksvR0Nx?=
 =?utf-8?B?YnkyM3N1VFF0dmh4M1JYY0tuQkM2c2VsL3RteEl0NERlV0hVek1acGZjaGt3?=
 =?utf-8?B?RjJmbkR6QU5aNlFYdk9PSDFpaUxYN1ZpQ3lXNnNUb2t3cTRmV3ZaWmV3Zk42?=
 =?utf-8?B?dWFTb1BKd1pFeTBuNCs5Skh6VWJMYVlwK2ZLSGQ5UlVPejVJWnpIWVFTZC9o?=
 =?utf-8?B?TnppYlh6bWdQY0ZFL25ubkJDL0RCWlZ6VUFGL1Z4UERJdUF1UEU1SVVoWUR1?=
 =?utf-8?B?Z3RMSGczQzFIOTZGSWhPcExXbUJwcUoxQURvQW9CMTJKczdEakVkdWZ1SEFB?=
 =?utf-8?B?SjdOS0NJZ2M1VkdUd1F2d3NBL2szZlN5Q055VG0yb1pJejRpOGRCQTVHc1g0?=
 =?utf-8?B?U2dPcXJNUVJwSXBmTzNSSk9CVnBHN1JPZytYSFJOQTRKQjdqS1N2MEFIOFdl?=
 =?utf-8?B?UWVqdDRHejBBQ3lDSi9nR0hRQ3FTcDEzS2pJK0d3dzR6RjJiZTRqcHZZTWdv?=
 =?utf-8?B?KzNqTzFGRzdFZXUvNkFXMm1HMTlXRjlrMUJyRE1SYmtlb1dFdElmVGxFajlx?=
 =?utf-8?B?aHlXMEtXWTh5STArcnQ2MVpSQnR1SENwTzVPclB6WnFSK1lxTHVLRzJ4Rnl1?=
 =?utf-8?B?R0ZRbjQvRmlRS0VxVDZWMTRyRlNSN3JIVW56c3o5RUkxdUgzZkZ0Z3dGMkx0?=
 =?utf-8?B?SzZuN3Q5Z0VhZXNOMEdRZDh1OXkzNnM5cFBrMzFybXpZM0dkeThDTFFRTkxI?=
 =?utf-8?B?aDJRWTZWKy9ZMElEUGRtRkVPOVNham9EbURtV3dRWDZkQ1lSM2liT0hFTkZh?=
 =?utf-8?B?b2JPRmxUeFN3WkRNRURiakNUK3pIQ3p3enFkNjBpWGFFZWUvRkNTUjZGVFBR?=
 =?utf-8?B?Y05haDFZQTUzZnFra2R5WE41bnBsYkhUZEJtaDV0UW1Kc3c5cHBCTlB0VUt5?=
 =?utf-8?B?cmdSR0RtdlBpZmQzYVV2M2p1RkZYZmk1c09mSlhMZVhGaUlIUzZBMGdUU3lE?=
 =?utf-8?B?YU9wSDVQdy9LNnJnRFdGSWNkVVoraGZtREMxbW0xTHdPV1BnTGFWUFd2YVZ1?=
 =?utf-8?B?U1VpMzJOb0lvZXBuazV0cmcwYW1JbFRVMUlEdDcrWEhQWXphVStSMmZtcERD?=
 =?utf-8?B?WkNZMXhwb3NEVy81cldISUp1K1kxWmIrMFlYQktnUjZOeUN5OGlmMnh4cUkw?=
 =?utf-8?B?c0hJanpjZkdKbFd5bEVQVHlYcVY4NllHTkdCaFF3TDZtR01zNDBXbXpGWkRS?=
 =?utf-8?B?M0RyaWhLUzNoTW5Mb3JReXd5anVqMHRTMGJOajNTYnNyNFRrV0lSWk9GTkh2?=
 =?utf-8?B?M3diTXdacWorbFUrOXZaYUJvczBaSmdwSE84UU83QTV3eFE5NHdmQmo0YzlR?=
 =?utf-8?B?eVZXajR2WFNsNVd4UmRSRVMyd1EvS1JiWUlnblFWZ2tLVXB1aExYaDI1cSsv?=
 =?utf-8?B?VjJKSXcyU0V0by9paDJYSXVFcHA4WWxoRVVSNktBb2pGYWhtMlBjOUpEczBm?=
 =?utf-8?B?YkFRZG0rdHkzSUIrdmtCVlIyL1FyTi9OZmt3RFF4bHRVSTVobVpFSS9JMDVK?=
 =?utf-8?B?OEN1NWk3NlNjMXQ5eE9QbVl0dGFSbEhUQVU5UGd2czlCM2ZzRTZycHdSMnZl?=
 =?utf-8?B?dFRFSFRKMlBxUG1wTmVmaXRMYXFOY2JVeCtPaWlISnhJYW5aV3Y0QVNydm5s?=
 =?utf-8?B?RWlwc29Hd25HN3EwN2FwaEhuRjl4aU1tNGkwWXhlQnhwQ0lTSGN0RjRZL2Y0?=
 =?utf-8?B?T0lyRDZRTHRVM25xS0hzMUNGWmlhMEF1bncwaStibnViQmxlNlY4WURSd1hZ?=
 =?utf-8?B?VEdPZEVxUm9PU0hQVGR2QWdaRzRUa0RxVEFYQ1Z6MmFsakdWNXVLeGtnSERP?=
 =?utf-8?B?dnhGdm5DSEE0QkxQNVVhcnR0SjFWSXhGRzArRTBvRUM3VmlRUDY2SFlzc1Rk?=
 =?utf-8?Q?+OZ/iZ4+vxd1bT1wfqMuST+gGGyuKJqX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA6PR04MB11987.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0dCOXNzb21Jbm90UnRwdnNsL0c4eDNVcE5VbTk1a2VTVXBRSU5yL3V2K0dy?=
 =?utf-8?B?U1pacjAyVGZrc1hHWTZ2V0NJdjdLTXkzdk5uam5XRm5HWEFsRFRNRFp2UEo3?=
 =?utf-8?B?SlQ3S1ZvemVFcXllUlNCcFRLUGgrdkprVTZMbGU3anh1bXRsdHUwMC8vSDBq?=
 =?utf-8?B?YU5YQjM5OUpGamlZNVpxb01DR01FNkszZitHZDVvdFMxNmUxZkFGVUhRWkc2?=
 =?utf-8?B?YVNnK2Y3RkJqdis4TGFTMlRRcHlVMUYweGd4aGpYK0lPNTVOVlNzNXlVTUtv?=
 =?utf-8?B?eW5GVzUwa2xySFRwZFhyQ1Y1VkYrYTNnZ3ZSVnpTcmhwRi9XYkZ0ZGZEVERE?=
 =?utf-8?B?aXVNemdhNlNkZ0RQd3RuUnNKUzNSNWdWR3k5N2JwdGxmOTF4TjUvV3NaYUov?=
 =?utf-8?B?eHM4QWRUcUY0anU1MjdKV1l2ZytLaGxkYWJrZ09KUzh1RHlxL2drTDRTTjFs?=
 =?utf-8?B?VUxkelNlTlRxRUQzUEtMTmJoTlVLODlIY1RTWkxlUUVuMW5nMXBxQkZHcXVj?=
 =?utf-8?B?NmkwTVMvSk5JMEtwdzIvOGlJNjBQNGRHUUwwTVJrREx0SUo1ajF1NGRZSFF3?=
 =?utf-8?B?T3c5Wm1OVXpZSmtObTNLQlNQbDFvcVFNa29JMmZvYklRcGNlS0RxMlJZUEYr?=
 =?utf-8?B?L1FtMnJub0d6b0xhbHZ1c3BiR3llYks0Z3haRFIwY0dxUW5sM3ZaL3NvYjAr?=
 =?utf-8?B?RU90YnJ6WE5QYXR3aGJnNmxaVUIxblh6Q1NyejQ3L3FUSlVYSFdJajFZTWhn?=
 =?utf-8?B?MGlScXZydlUwMllMeExKUms1aFdFVmQzZnNrTUw3QWZVT3lrdUtWd1hHekpB?=
 =?utf-8?B?SGpkdW5sRjBEWGdMSzR6NE5ITlZIZmFETkxyMGxUbUR6N09ZSFgrK0FqTlZa?=
 =?utf-8?B?T3cxazVIUnB6SEs4aDVTR1RaNFZndEJaTGdhUXA5OTFSR3RlZHRWd1VaYjRs?=
 =?utf-8?B?VE1IWEZETmMrZWNWbXBLY3ZpL0l3TU54QjJHbHk5YzBMbjMrNkxVdkcwbE5R?=
 =?utf-8?B?MS9VYXNNZEFkYy9IdmZjbm5mUGY1K2Rud0JWRDlEclZjaHBzeFdJZkY3amxq?=
 =?utf-8?B?OFA2Q1A0em1jcVAyaExrWWFXZXpJRitkVnYwYmhvcWRJNXNBdy9oeXZwOEgy?=
 =?utf-8?B?SzRBd21DbG12U0VDdHpjbXhSa2pudUdZTVVJUVAzeHpUZDYxMWFOQlJjZlIr?=
 =?utf-8?B?ZnhXWTJoZndSd3pIR1ZzUEpWQnNrSkl2aC9tenhES2k0TGV0NEZ2c01sY2hu?=
 =?utf-8?B?NXgzdWEwc3o5bndQMXFwZHNzWnh4cFZsazc3clUyQTJ1NlM0NkwzQnowZWUv?=
 =?utf-8?B?cmsxQS9pcXROQW1mbjM2MTVtZUFQYVNsTU1GS2tVOTM3THZqbDgzeWVIczFn?=
 =?utf-8?B?eFpsR2p0Z3pkeTU3bGN5NFkwMDNOWW1jQkVKb2owRGg5N1VHRHVMK1FDUlpS?=
 =?utf-8?B?azdEVmtnNTJWVzBQV3ZTL1FudWcvSlFjOWdmbmVzRjhTb1RQcmpqK2NlK1Rj?=
 =?utf-8?B?K0FEZ1A1d282QnRGYi84M2tkVzlFTnBGbFgxaUJ2M1JRbHVRcno5MFdWOE10?=
 =?utf-8?B?YUpzZTI5ZXJMblFzanE0MkdmK1B2TCt5LzdJVGtVYXNGUTcveWlMTkh1ellk?=
 =?utf-8?B?RDgxWjIrTXZmNWlUd3o3UXUreHBNQ2dwMHRYSlRJdTVDaE9QdXc5TzZoNG4v?=
 =?utf-8?B?MHo4QzkxalBDcEFkaWJySkdLU0RWWmhlYWNFRDNwd1dPeWVLVE11TkZVRUx4?=
 =?utf-8?B?YjFHS0sydll3cDZ0bGFJV0FESnk0K3dPTXdHUm55cFoxcW93a1k5akwvN2Y3?=
 =?utf-8?B?K1htWkI0c01UVDJiWDVaWDdtRGxKNDc0ZVZYRXNRSk0zb3R4cGFJMVVUdHAy?=
 =?utf-8?B?aklrRGNBUUEzSWJBVjZhWHFZbHRJc3FQUWtmNERoYzFiY3VodVYyUk9hSTg5?=
 =?utf-8?B?NElXOFFDRTZEVCs5ODFZTjN6aG9PR0orR1BtbjV0dmtkMHBhRVZCWlVJWVJC?=
 =?utf-8?B?WWNXM2I5ZzV4SHU1ODkzYnZXUnFsKzdNd3VaU1VGeW9lU2lwamdsWTk0N2J4?=
 =?utf-8?B?eDlmY3lveWQxZEdmNHNNcnFKcWFFak4xby91SWdCa3NYYlZQZSs0MzBWOE9J?=
 =?utf-8?B?NElzTjJSNEVwN1lCOW9UUkxPOVYzQ2NNK3ljbVVDcnpRR2lXaisveHBlMTZx?=
 =?utf-8?B?cTRvZUZocm1VSmttajhXbkx2MWZoL1p0Z2lxL0pQWXpsWjRjN1BjcmFqMW9T?=
 =?utf-8?B?dVZNZG9LOVVxdGtCem12QURNUXRORGRoU3pjMVJxMGtmL1g2Y1hTNElVb3NE?=
 =?utf-8?B?d3p4UmVWMkpKTTlBS0F6RmdTRmIzVVNZdi9aNXlpUlRoZm9kb0ZGUnlEVW95?=
 =?utf-8?Q?UeTkwNW3oeSso6vjQT5WiOb2M906cZC2EbfpF5RlwbMSu?=
X-MS-Exchange-AntiSpam-MessageData-1: iLjRWDqqYsqxMw==
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e98255d-e6fc-4999-f221-08de51e67829
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11987.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:25:43.4612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2bQwnCWTwc2vzXFyoXmXAvWliR4ltKzkU3ot1rkymImAhbAm4yU4HQZvblc7e7cpnHghwu6fJgyk6PALCtfuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9137
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IJcvWRVr14IlTr5sRB2F8eyt5OGW4pS63jKdkU+7Zg=;
 b=IDS1CKWf0hsVrGoj9W+w4sMZxerrxgQ5Tx/uzimMiWhBBonZTDFa3ka8VHvt0B+50PvjhBEMS5GQIhNJZefrgfMIWt/JE0ueUFAU/OA4cUXzpWWr37hcpJIS5CtQpxNhBumNRHgI2U9z7EVPdcYo+Fz1vRxa3hhRH+6zSJiut78=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=IDS1CKWf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add
 'no-tls-deprecated-ec' configuration option
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
From: =?utf-8?q?Konrad_Vit=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Konrad=20Vit=C3=A9?= <konrad.vite@cherry.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIG9wdGlvbiB0byBkaXNhYmxlIHN1cHBvcnQgZm9yIGxlZ2FjeSBUTFMgRUMgZ3JvdXBzIHRo
YXQgd2VyZQpkZXByZWNhdGVkIGluIFJGQzg0MjIuCgpTaWduZWQtb2ZmLWJ5OiBLb25yYWQgVml0
w6kgPGtvbnJhZC52aXRlQGNoZXJyeS5kZT4KLS0tCiBwYWNrYWdlL2xpYm9wZW5zc2wvQ29uZmln
LmluICAgICB8IDggKysrKysrKysKIHBhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLm1rIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlib3BlbnNzbC9Db25maWcuaW4gYi9wYWNrYWdlL2xpYm9wZW5zc2wvQ29uZmlnLmluCmlu
ZGV4IDAzZDNkZWY4MDIuLjU1M2YxYjIxOWYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlib3BlbnNz
bC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9saWJvcGVuc3NsL0NvbmZpZy5pbgpAQCAtMjI5LDQg
KzIyOSwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElCT1BFTlNTTF9FTkFCTEVfU1NMX1RSQUNF
CiAJICBCdWlsZCB3aXRoIFNTTCBUcmFjZSBzdXBwb3J0LiBEaXNhYmxpbmcgdGhpcyBvcHRpb24g
bWF5CiAJICBwcm92aWRlIGEgc21hbGwgcmVkdWN0aW9uIGluIGxpYnNzbCBiaW5hcnkgc2l6ZS4K
IAorY29uZmlnIEJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5BQkxFX1RMU19ERVBSRUNBVEVEX0VD
CisJYm9vbCAiZW5hYmxlIGxlZ2FjeSBUTFMgRUMgZ3JvdXBzIgorCWRlZmF1bHQgeQorCWhlbHAK
KwkgIEJ1aWxkIHdpdGggc3VwcG9ydCBmb3IgbGVnYWN5IFRMUyBFQyBncm91cHMgdGhhdCB3ZXJl
CisJICBkZXByZWNhdGVkIGluIFJGQzg0MjIuIERpc2FibGluZyB0aGlzIG9wdGlvbiBtYXkgcHJv
dmlkZSBhCisJICBzbWFsbCByZWR1Y3Rpb24gaW4gbGlic3NsIGJpbmFyeSBzaXplLgorCiBlbmRp
ZiAjIEJSMl9QQUNLQUdFX0xJQk9QRU5TU0wKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlib3BlbnNz
bC9saWJvcGVuc3NsLm1rIGIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsKaW5kZXgg
MjhkY2I5ZGZjMi4uZTdhY2NkNTY5ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJvcGVuc3NsL2xp
Ym9wZW5zc2wubWsKKysrIGIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsKQEAgLTEy
MCw2ICsxMjAsNyBAQCBkZWZpbmUgTElCT1BFTlNTTF9DT05GSUdVUkVfQ01EUwogCQkJJChpZiAk
KEJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5BQkxFX1NJViksLG5vLXNpdikgXAogCQkJJChpZiAk
KEJSMl9QQUNLQUdFX0xJQk9QRU5TU0xfRU5BQkxFX1NNMl9QUkVDT01QX1RBQkxFKSwsbm8tc20y
LXByZWNvbXApIFwKIAkJCSQoaWYgJChCUjJfUEFDS0FHRV9MSUJPUEVOU1NMX0VOQUJMRV9TU0xf
VFJBQ0UpLCxuby1zc2wtdHJhY2UpIFwKKwkJCSQoaWYgJChCUjJfUEFDS0FHRV9MSUJPUEVOU1NM
X0VOQUJMRV9UTFNfREVQUkVDQVRFRF9FQyksLG5vLXRscy1kZXByZWNhdGVkLWVjKSBcCiAJCQkk
KGlmICQoQlIyX1NUQVRJQ19MSUJTKSx6bGliLHpsaWItZHluYW1pYykgXAogCQkJJChpZiAkKEJS
Ml9TVEFUSUNfTElCUyksbm8tZHNvKQogZW5kZWYKLS0gCjIuNTIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
