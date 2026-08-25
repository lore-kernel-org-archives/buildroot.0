Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00010C61DBE
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 14:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6B48070E;
	Tue, 25 Aug 2026 14:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GekpI79PtST1; Tue, 25 Aug 2026 14:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787667646;
	bh=KZGXmn+pleTFvcIDGKpMcGUtQIk0OWrun8nyncUszWU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=oBOdHpyXcCLAjR4A6NvzU6Mf2wUo4kIBF/3AX9vi1y9koTQNLvr2ao+JEZxj+mtVv
	 fo5O7u6yVP9pWjbWxID94Dv77u+UcYZlVe2dEYEzpyb1bgj94do9mKiI2cVOZz07jq
	 xFzBZix+gif7mg8rgo/Fn/mSEKh721jJYlBrOcYonTax4QkoNxDHMDBW+MtWg76NF6
	 0vbvr6k1ZPtXD8fMQrt15oo1ChixUaXOcyAa7MeBlsxZLPCUzHPYacJi4GO83IDsXr
	 eX/dJaJzKhFjqz1d7vFXlbAvpAk+OTjbUY/bqm74VvLI8ukynWgnHooaSql+npkaFW
	 LB6rc7m9+MckA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E1B80CA6;
	Tue, 25 Aug 2026 14:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AC8835E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1856480CA6
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZYZzf6D5s_b for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 14:20:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10d::3;
 helo=sn4pr0501cu005.outbound.protection.outlook.com;
 envelope-from=stewart.hildebrand@amd.com; receiver=<UNKNOWN> 
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10d::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E0D080C94
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 14:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWwnINhr75xGMv29gBjIf1PW+CGrLzsFc/zYzvhIYpdsjaPQmzZoyGPrIkydlu5qkkLYwhHY8nqivvRfXcA1G/ik4SKeW9GTuS+V7u5sdi3JqNyrOsRmGmLrNwjWMmP33wL2x3eMB7RRwEeOK6Ll/bBb8yDqg/IYhin4G5/7EzoEvIkKj4dg/K45uDNs60m2SxKO/ILI+g8w0HbUUlN8oIUprVEi4BEdpY1pvDi/tnawZmAw+vdHroGnkVDRfvVBlZD/H43q2M73jd4X1gux9xcyIBoxqxyKLrp8ULik2kQHvGKt5nOw0sET3pKnM/Wjs3rBRFZApMS+5zxjchRrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R6Bv3LNayXivfzVfqKHeEh8YY037eDxCaw07zr4jNg=;
 b=Y6zO9I/Q1toISu5ZSJaT6j02DuQFweJ7rWhbCzxu6P1zpyKWopv3auubKh8sRyItLRkD5THCSo+rjQEx89z+/oH8f/SiBWIJIA2yqklKHG/qRuqXk+CONK/laBRrCzgfNR8lmXAUbFrQiWp5c1/ChHbYh5rc8d/Uu18+u1/iCjn+Qm/dYPn68IudBDoMVEFN8v31ketlEZVXXuLsZwykDK8J0asRUg4dHS8ExvoHd2lX4mYHrRMQvP0XZtrwrt3wylOkOXRAdmyZqlrgtsa/MNlL4gxPmKTvyV0N6vBeCn6fuOp/IO/u73XzqzbF5W7UdysbG4En9fJn3HNz8XPhNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) by
 SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 14:20:37 +0000
Received: from DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a]) by DM4PR12MB6472.namprd12.prod.outlook.com
 ([fe80::4a4d:4208:3862:fb7a%6]) with mapi id 15.21.0360.005; Tue, 25 Aug 2026
 14:20:37 +0000
Message-ID: <ffae02e8-5109-4cc7-884d-51f2fd06a250@amd.com>
Date: Tue, 25 Aug 2026 16:20:30 +0200
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20260803145152.102135-1-neal.frager@amd.com>
 <20260803145152.102135-4-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20260803145152.102135-4-neal.frager@amd.com>
X-ClientProxiedBy: CPCP307CA0006.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::8)
 To DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6472:EE_|SA3PR12MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 43735a60-3c58-4872-22ab-08df02b4084f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|23010399003|11063799006|10067099003|4143699003|6133799003|56012099006|22082099003|18002099003|13003099007|41080700001;
X-Microsoft-Antispam-Message-Info: p/r+OqJ0ZS+JSEQVnsU1uwqB+8tkEijR+sJnQ0IzVYP5lLm9TUvopYa55t+N5f9PmHEECTGennDmYWxoJ6Jr/N3OdygGQjy/22FgpAhna5iDXcgA0BelFzMcTxS8w9wHz+K6hDQHIs48Iv/KcPRwQA9KSfRZeHo4S0JNZdsk9Mj5WyO/uJOiuJOBXcZfIwVFz+tHwmVcuf74gup0/M/motrCCluyS5IGInNqApr5TIjc6L86FDUfoBVlC6coLqnCNcC7r4EUvr+85CmT4sCFg28f9qXrvQxYQTnBJ8usRxeyXw6i6ah03HJf9i2osNfkd/e1a7/RCQoXeWBY94SfOOMB/59Gv6sk8Yhz701wEnbDWBDLlTBPW+ezyptOwM08z/xH7TMCy9rn2CIzUllTwG6xZwaqRXBVaV0+rfijs9Bvz+xn4kI65iMaT6luqkZpug+IQZCFT+kR4/BUH/xhETT4MTOPVQTE3x/G9QWKW4dG07KjdKIMd4hAXf0Yj5uWOGxnyj4mgJ8olJAbTWmeWLrCoDgwwaFVi19nn85YSi53JTWJ0Ql160wfyLkm/q/vemkx6vzjxTU4lYZH4zyqQyP6mjN5NqpO8r5THCOL2xckJ1aSI6N3uOcseOkV3fTNfFvSDiydGjL4XjNNk0R/8sQtb5VE7EcaEg0cYZimFHL6n9+cfxOipf37oHaSSfPdPXSfONKjui2ccNpm0V6OWHplD0mjLqMesq+gY2xWyNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6472.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(6133799003)(56012099006)(22082099003)(18002099003)(13003099007)(41080700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWQ1ZCtVeElCa05DdkJqdDV3OXB1dzFlV3lrbFBHNWhTbXNzQ3p6QW5KaGZ3?=
 =?utf-8?B?SjdhbzBBYXhDVHR3R0hJYmhvN3NuQk1pT3hmVEkybmhRdmtqbjlvOUJ0UnJZ?=
 =?utf-8?B?VmQwU2xyNVdQbEkyKzhPL1kxV1h4emsweDYwQkFFMTZSUDZhYzJFeFZSU3k4?=
 =?utf-8?B?UmlaUlN1bmdFVU9NNWFsK1FTUGdtRkFtNWhsejAvby9QUCtQYkVMWkdWRnNF?=
 =?utf-8?B?cjVPUHlMYmVBVW1BYjUzdElMYjdpbW92d3BpMHFXSG4zWk1WKzZSNjY3cXVF?=
 =?utf-8?B?YmQ1b000ZDZWL2FTM0U0cUFpbm9nZWtvSjJ6VGxJZlViTUlYQmFhZ09ZQmtv?=
 =?utf-8?B?bmM4UEJWdm9hWjRSa2ZqRCtUSVpMZWM3Znc0SXNuL0Rsay8vWEhKTmRvZFdr?=
 =?utf-8?B?bDJ4Y0J4ZlI5cVN3OFQwbFd1UStpWjl2VXo1SlZsejNpV2RiSkR3V1g4VnBX?=
 =?utf-8?B?NGtSeG9hcVVwQXN6QUc0SE10ZU5ITS9pbkNzeGJLdWpJMzNKMHgwRjV5endm?=
 =?utf-8?B?WEhSR3NJMzRRVTdheGJ1RWUvdlBidm41SUpidnIwbUdWRGgzcTl1QWdlZXJN?=
 =?utf-8?B?ZE5SVUcxdkJ1cWxTbk5QVHY0MVgrS3F6L21NWks4a05rRm1vRXRQTUFjdE9G?=
 =?utf-8?B?UEttUTl2b2J4NlRrUGs4REU4aTBZTnhHd2dmOEdwTVlWN1VDL05XMDY0Y0pp?=
 =?utf-8?B?UzZRRzJMRUpyWmZpMHlWVERDeG5iNjNXQnA5M2F4TXh6YkdKYUNuVVk1Y3dB?=
 =?utf-8?B?SVVuN2ZDTm5WNTRiRVBqei9CTVhpY08vUUxuSlBmOWZ4cG54eTUreDljVkFw?=
 =?utf-8?B?VEpGdFQ3RlRPRVdQV3FIU2pKejYyU1hHakg1NmczZ3Vndmt6UjJDVFowb2Yy?=
 =?utf-8?B?SFVYK1FOSzRJUzRvQUd4bDdYSS90LzlxWXpvREhTVy9pVXRQVnYzRGdVVUVI?=
 =?utf-8?B?OU5QRG1paEFxVDN2cW5BSkJ6ZDRxYmpJTWJpY3UrRld3dlRsRVMyTlgyQlRG?=
 =?utf-8?B?azNhMFIxS3Zxclo0S0xCbEQxQnRYTDV5c0VvWmpJRDlXRzJzaDg1dnkrVkpq?=
 =?utf-8?B?N2lTM055M0kvNWNXVEFlYVg1alRVUjUrK3pNTmprQnorc2VScDZqUVFMWC82?=
 =?utf-8?B?dDlkemdVL1p6QkcxSnkyald2c21qSmNOcVVXZ3hXL3FxUzQ1YUNiVjRpeFVN?=
 =?utf-8?B?Ly9iblNhUldwWnZRZHo1RmhWWW9adjNxRmx2YzhMcWF4RWJZc2szZ2pyeC9X?=
 =?utf-8?B?MlZuMHBEZXJNZjBFVzBZQk5zRk4zdmgwdTdmcHpYUkxzc0dTaWhmam02ZEVr?=
 =?utf-8?B?NDdZNE1zamtBUTlOc2hpUWlJUElITnZ3ck9KL0xPb3ZEWWhOU09nTk9wYk9q?=
 =?utf-8?B?RHFRWWNnYjM3cUZWL0JaTFRsb1Y4bnFDY1UraTdoTGpQOERmVmlrREJLQmdi?=
 =?utf-8?B?dzFFMHRZbDZpYnAvYktrSWpzWTBFRUtBNFNmbk5uOVhlWHNWRlUxeWV0SEll?=
 =?utf-8?B?M1ZGamZ5QXc4WG5DalI4VEdPRE9iNVl1MzRUWGVKYTVoZnRmM3k3NHBZT3Bx?=
 =?utf-8?B?eE1YSU8veFBvY1BkeU5rb2kzUC9TZ0Z5WU05czZZekpGZ21XZFh1OVJ0Ny9M?=
 =?utf-8?B?ZWU5VGY0S01Fa2lHNElsTGI1anh3cW5hS3hQdVViV2dXZW9wTS9KQWxvT015?=
 =?utf-8?B?aEdybWRTT3dKSE14Q01sUUEzc2s4SGdrcHZ4b1lsdzBFdlB6aWN0UGZBNURt?=
 =?utf-8?B?L3dqZ3B5enJMWXUrN1VmcFk2d21XZHpmNUN2OW43Z2RGWXB6WitnOHRlUWpK?=
 =?utf-8?B?QnB0VUpOV3F5dlBIdC9vaS94OFBDL01RcW8rdjNxMmRDakk2Z252WVUxVUlB?=
 =?utf-8?B?NCtaRFFGZ1Q2WkFNNnBhamg0WjR5am5RT3IrK0laS1E0QWFCR1dKUkNWUml0?=
 =?utf-8?B?Y0VFOEIxV2RybjdCMGh0UVJLYzZsTDczck9xYjd6cUh6eEFTZnVad1ZOWlVh?=
 =?utf-8?B?aG5IQnpPVVlvY2kya2VucXJiTGFPelVWTCtlUmtrK2NDMTMya3JqdElqSjZu?=
 =?utf-8?B?eW8yazNST1luNSsvUlc3Yit0Yk85eE5yMWV1dGN0bHY5eWllVDZtUUIweVov?=
 =?utf-8?B?OFpxZ3lhSDgxT0pnZkQ2bFdjQUJlY0dRbTY4ZUJQT3h6SHMrNHh0ZDFOQlZP?=
 =?utf-8?B?RVBKVDhLMCtlWHJ6Rkx3V1g4c3lrQUxtRUFrVW45WTFkWUVnQVJJektmVlda?=
 =?utf-8?B?UzB5Mm9DNGpDYlVWQXhBTmNSMTR5TnpnbVRNcVk3RzFacEV1MW5iSUh4L0cy?=
 =?utf-8?Q?+RsyZx7C0yDtLzIYh7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43735a60-3c58-4872-22ab-08df02b4084f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6472.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:20:36.8579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwI0Utk72EbXuff3PWVEpNfQwnU3jRRm1LN3XUIpF1eVClb7gfPZLuiMDI5VxPMYnQqLNIRB50toxRAR48oUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808
Subject: Re: [Buildroot] [PATCH v4 4/4] package/xen: add custom git support
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
 yann.morin@orange.com, matthew.l.weber3@boeing.com,
 Matthew Weber <mathew.l.weber3@boeing.com>, brandon.maier@collins.com,
 john.ernberg@actia.se, brian.j.wood2@boeing.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/3/26 16:51, Neal Frager wrote:
> For completeness, add custom git support to match the capabilities of other
> packages such as Linux, uboot or ATF.
> 
> To test this feature, use the following configs to test latest release of the
> Xilinx Xen vendor tree.
> 
> To test:
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_GIT=y
> BR2_PACKAGE_XEN_CUSTOM_REPO_URL="https://github.com/Xilinx/xen.git"
> BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION="791ade0eeae73a851f728cf2c9964dd303cc7d8e"
> 
> Add to package/xen/xen.hash:
> sha256  bb4c156bedcf2e621f8de258fcc3d84a189c522fcf39df8de3865ba53bc10874  xen-791ade0eeae73a851f728cf2c9964dd303cc7d8e-git4.tar.gz
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Tested-by: Matthew Weber <mathew.l.weber3@boeing.com>
> Prior test details: https://gist.github.com/matthew-l-weber/c17f14a3793ccee440a383e4177ff3db
> Reviewed-by: John Ernberg <john.ernberg@actia.se>


Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Tested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I've tested this on VEK385 with this config:
BR2_PACKAGE_XEN_CUSTOM_GIT=y
BR2_PACKAGE_XEN_CUSTOM_REPO_URL="https://github.com/Xilinx/xen.git"
BR2_PACKAGE_XEN_CUSTOM_REPO_VERSION="xlnx-rebase-v4.21_2026.1"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
