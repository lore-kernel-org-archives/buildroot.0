Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D190BCD8C92
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 10:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E49461B68;
	Mon,  8 Jun 2026 10:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWG2VpcLXpcI; Mon,  8 Jun 2026 10:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67A2A61B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780914498;
	bh=HEe7mYd7Kzx+Xne2/l1KDjfTlUnNhf59gyoqxv9/MRc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=orkb8Pw5C9VapMgNjELqonFlq2bMvjmwAQjvNQhMLr9tzdrYrV1dSLsSlaZqrBeUo
	 0QCLhayoL6rK6OjPskAA+TnFD7icstAvGRGwSVcWPM+S31AHRRazRpwfyL19OHhMqA
	 SCzd7OEQITlE0Tu46HjzsAiNdmI2zlLu4zITqWKRF7N+UnAS/nJ4LwGqkla5kPugfx
	 ZLcsU/dOxgStQ1QUnvNL8szZPN5o4ckxRFfnwTfLIj1ZytPNmmorYcx9yZ1I20e+cq
	 MJySDx+Xrjbky8H56A4ROF++fC5OBc0CeeXZjQjtA0wA489o/n3EkJEafft6aP7ypL
	 Dz9Ji8U/rlobw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A2A61B62;
	Mon,  8 Jun 2026 10:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FB74EC
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 716FF40B8A
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uiU32EMSN_1T for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 10:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c202::7;
 helo=gvxpr05cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D5AE40B77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D5AE40B77
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c202::7])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D5AE40B77
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGEJBszTuOhXvferiAJDrmCRzesy/NH3kck4uYbkyVZ6e2JG+fUyp2jZNcIUGKE2pzKkUP2TJ+xwmMqaOv5P3TDtP3pYnBEHxof8lwo0XoWlBW3lEdiy8ZQRKTBQusSgmhTyDwis61BFMIrrjWkFiUJzZue94nHTwTAjKBgl9XZto6I1YVYSOTe/zXgmVAFu+K4BH5VPj22uoj774nWsj8sI2NxAYKY0SPaV4V+5NZAIPT2FtV54hbQQMiHJN2NGrrww24laxnQ6SVRNBSNSGf6OCXjybYkFBliPIFqVs10nxTTEYkzfEkyeL59n9zYpCQfwGo9Nnu+9WovQMxj3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EjO9qU+78en+LHBZyFaGckzN1Y8Rm005nlHTN/vsM0=;
 b=iE8lq5oKbkrohGPY7gIdHKQfqjXMx0fA61G9ueYWALbW50XP402C8ssd/8IoktDMa3xFKCr8Ggat3/jcTdZuxyv7Ex/d8qL+2b2ELqOp/lz15Yd2FDS7WeLIHjx3Mj/nJB8RPA2cXRedBuTTiS3bo+tTnxTmMKcmMQgKvtm9wkACJRD6fi8OjZLI/1t6jcIs2Y0HHomTrrXakLUg6Jons9OEGUBIuK2rJxP+8Vmj1n+RmnQjpGyjy4JQfQ2axp1ZqFkLGKt2HoArIO4Xtr7AlCjxuJTCb3ixd6posSmdGbqoxSKMMqKbwM40s+D4FYE7yMXQpHqPCtQmX3nJKpBcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by GVXPR04MB10897.eurprd04.prod.outlook.com (2603:10a6:150:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Mon, 8 Jun 2026
 10:28:05 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0071.010; Mon, 8 Jun 2026
 10:28:05 +0000
Message-ID: <dda9cedc-20ee-4b00-b912-f807bc24cd3c@cherry.de>
Date: Mon, 8 Jun 2026 12:28:04 +0200
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>
Cc: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer
 <ps.report@gmx.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <fcef4549-6961-4824-a4c7-a73552bf3bf9@cherry.de>
 <20260410100912.127932-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260410100912.127932-1-thomas.perale@mind.be>
X-ClientProxiedBy: VI1P195CA0050.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::39) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|GVXPR04MB10897:EE_
X-MS-Office365-Filtering-Correlation-Id: cac418a7-06f3-4fad-30eb-08dec548a065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: CC3Z+adQ7l5ehUqxF6SCfDxK4SXGNet4bG+EdIDYldG3fm8SfD655cSYiYGpFPntnuEX42qHXmsfPkrBr+pnemyXnYMlknhMNFfSFHabO3xS+P+XdGU4edCQUHul3vgNJaJg/H3eIk8PqPVNvqVkoID4NE/D2nAyjPPQAPDdSTMyW/pwMk8azWjFPlCy/5spfPamh6ueMj3eStp6fy3PdXBIdn8+V+62N0Mizcn3knnBQ8Rl+CnvPUcOw9qMLNk0zexLjzKVekF6cTpdsUo30b3dToEb+G6/JrBSwnfFBJGBcyvpzLiDP0DKPOT+nT+ycgVQIS2X8vI6/qanEWb9jWr1PfL4YLIOBB9Qrzb6Lhe7wyB/ZMVQQj5iNq7TWmX1s7kTRpbS0e9aa+SUll/qh/UmscjR0DFBbGTtL7lgP3RAXyVVUv7Han6ozbDveDlxiKfXofYOeR1w27nSxlR7ImSgFX1AuE7ZWdr29SMGE1a3hh4vW6qo6iUxfoyAYqhWzEFWAG/YfsJzqwmuAIpaBF+qKVDNxKXezZcq61xA/ABuitPFkEEDsB+D2F+pRfjeXIoqQJCBgPu8La27OiLBywxl9RM2Qy3+yG+VZi8r8NFHL+zmZj1rfWd1VtLmJhGrjAzZZDKdkvyO2CRg6+gaa9tqBF79YjL/Ig72trinWdtfGc2lSQwd4TnQcPHJIqHsAflkER22sab30wUneeGmSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2ExNVR4ZS9FeFN1TThqd1RsdXNmbDg2RE1uaC9qOWJLT2Mrc2FOSjhWekFN?=
 =?utf-8?B?SEc3YTBDREFzYksyR0Q0bXNVSzRRcWtHRzRXNHJmNC96T2FXdHJOSGtpQy9h?=
 =?utf-8?B?OVRxLzNUNTV2K0JBNUo3QWZ3OWZHNTlKbXAzNTIwZGh1RkoyT2Mzb1Rxa0VR?=
 =?utf-8?B?NHpkUzhvcmxiSWVTYVEzeTFPS3JKSExOVVhMdngwaGVEd3ZSTnhsUko4UnBz?=
 =?utf-8?B?akI4MWNJT0dZMlFkSkVDcnNFMkQ4S09TdFRaVmVWNHZPa1pzek85RlNnWTd3?=
 =?utf-8?B?K3pyMktJYVVBdklvWDNFNi9acEZ1L1JSSEw3bXJrNDJpY04vRzdvU3NYTUdG?=
 =?utf-8?B?Vk5VMW9PQjJ2M0xleEtqOTZEVFlON3ZwTVRVWVZUdGZVT25IdkJBUTNoNTl0?=
 =?utf-8?B?eWxWUi9oekhyRGdLVHpwN3ZaTUdQellxWjVmb3hkak5FM01RdWlCbEx3K1Nh?=
 =?utf-8?B?VzR4OXJNZm8vcWgxUkRpOXZzNExGYW1iOUZQeFpFL3lPdk01VnkwMEFxQXpy?=
 =?utf-8?B?Y1lqaEh5QU1UZS9BS2ljd09oTHEwdFFuNUtkcUcyNklVellRZGVUbWpvRlAx?=
 =?utf-8?B?NlFnTWdjMXRsSGxtMlIwdnBkWGZBcmU4MUVRL3JwVjI1Z1VJZDhBQ0x3RlNl?=
 =?utf-8?B?OHl3aVM5eTJ6MjRyR1lxTFhWaVh4S1FMYjRXUnFjSkNQclljK2h4dlAwMjhz?=
 =?utf-8?B?eld5cWVJM1VsRThCMnB4OHpyNUIxYTBEN3lIVWYzS3dHeUVwekNCbFBiWVl3?=
 =?utf-8?B?SmFQL1JkcHpKRG83ZFF4ZXVncWM2OSt6b3JlNDg3VVJ4U1NMa25VZUZiWXJY?=
 =?utf-8?B?VGRoQXBsSWZyN3Vpc203citaK0hTaStsZkQwaUNRanQ3RkRzUlIrUWt0SE9y?=
 =?utf-8?B?MmlrVy83alBWZmlSbytXN0YwOUhkZzNVMGJiNm42N003YkZXakVXSTZTU2d5?=
 =?utf-8?B?UnJzaUZNT09DOHZjT0JsL2lraGZlM3VrWVlmZ0Y0RkdDa2R4SFFnLy9KSkxQ?=
 =?utf-8?B?MTRjRUs3RmZjY2RNUEoyQzlHMjFWVjcxZWRjUVJpRC9Gak01WXByOTN5YXRp?=
 =?utf-8?B?K3RDVEJ2a0JGZ3doTEM3VlNYN0s3a0FSWnJOd0JObTM4QXN1cmZSR1V3OStH?=
 =?utf-8?B?V2JZdlY2Zlk5TnNjenVMVDhXcWk5SjZ1RVV0NFNsWFFVSEtNbzRYQkhqUTdY?=
 =?utf-8?B?SEpKMVZMZXp6cmdPQ2JPVXc1YVNUTjdOZVFhb3YrcHZSa3N3NEFwUlR6b3gy?=
 =?utf-8?B?ZTBQNmp2ck00LzY1Z2lNdmZ1N2FCMXVrZlZoL3BRRFJXTXZ3anpJdGRtUjFm?=
 =?utf-8?B?UkJpSEJSY1A3ZmVWMS9oeHNkV0VzMVloRyszZHV2dTQ5YmVGMlpwUEhuZ2ta?=
 =?utf-8?B?bnJBMTE1YlRCdFh6RlZqKzh1RFh3YjZGeG1HWnNnTnJqblZxK0tLNGpjVnJt?=
 =?utf-8?B?anh0Z2pON05KSE1WWmFkMzFyeUl0SVRoQnFOL0I2K1F5OGExbVY0MnR3TGcr?=
 =?utf-8?B?NHVlaEEvbHhaOUwyd0VIWUJvMTY4TFBxSFVlY3lLNjlSampha3ByNmJEVk41?=
 =?utf-8?B?dzJYcVZKb2pqK252K2N4aUVzMm5rRWNaRlQ1L1pvUVJ0OEVpNnoxcVVyQXpO?=
 =?utf-8?B?cHJpSEc2M0FlUklLcHlHWDBUQzdzSGRweXkrUENLQ01vYzJvYW9LR01mL0Ji?=
 =?utf-8?B?RTJyM1JTa2dabnBBQVpaS0lzVWRBL0U0N3UvZGczY3NuTExCbGVVd2tpQlNW?=
 =?utf-8?B?aXZIUjRjSjRLVXJiaW9XRmVJUldUTXllOThESExpWGkyeXVaWUMzSGRMYk9B?=
 =?utf-8?B?bVV2WGQzUThheEZ5UWxCT2E3bXVkdHpGekwwdXljWm5iSUtxVXNXUUoxRkxk?=
 =?utf-8?B?dUk3ZWtzTmJTZzVBUTJMdkljMkJVNUc2dEt2Zlpzd0lYTzhob3YxS284T1E2?=
 =?utf-8?B?UDNnZ2ozN2pnZ3dKK2J5ZkFDcDZxSkkxWE8yQUIyYjYrdEVxVGNEVnV2RGZp?=
 =?utf-8?B?SHh4ek9Lejhic285QnVGaThYaVlyY3F0SUI5K2ptTlAyME9yVDA0OTVMVXVW?=
 =?utf-8?B?NCtNMWM5S2UyRTVkUTNYSFVKbkw2U2NwS0o3Njd2SEk0ai9UMVBKTld0Zy9m?=
 =?utf-8?B?blBSU1FkOERnTzRmY1VEdFRvdEZpc0RoakRLY1NjZ2pBbHZ3WjFNMTdLSUpV?=
 =?utf-8?B?N3JoWmxLcnZQeVFaWlVZMC9pMC9QRjFZTC9nQzVhMm1tMS9tOFl6VWdiYlVK?=
 =?utf-8?B?OWQ1R1NWN0JtUEdSbUtCS0ZOcHU4cEpPM3VzckRRcXRUZUVzYlpydzE5U3h3?=
 =?utf-8?B?M01mRUdRTnh0cGRsUFhDKzkvanJ5a01zVThJWmxXdE1yMmtEYUFnQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cac418a7-06f3-4fad-30eb-08dec548a065
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:28:05.3612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1MjFmaETI1Wfi4SmS9HfUDDSytzWdqd//8zS2LhHt2h8I27chso98eu8GWWEpALG7wbBrsOlahL6cPfM9sJoJpsx1fXivhBU96ag9SpJIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10897
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EjO9qU+78en+LHBZyFaGckzN1Y8Rm005nlHTN/vsM0=;
 b=Osi6H5CzKorWzTSAURqe1V3WJn5Ui7JpnpjYdxHFE7fg9VXfXgmtDCHPRoiV8ChLkBnQnnRWWRdxDasilGi0JclSxw471p6IOc8hN6z0Sez7rNakHTn70a8QdEU4k/ZEgsgTm5eV02/YVHd6JebyPFPjhC1m/XYsqRWhCcHLbH0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=Osi6H5Cz
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 2025.02.x 5/5] package/qt5: bump packages to
 latest 5.15 kde submodule version
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 4/10/26 12:09 PM, Thomas Perale wrote:
> Hi Quentin,
> 
> In reply of:
>> Note that I made a mistake in v1 of the series for master that I necessarily made when backporting for 2025.02, see...
>>
>> [...]
>>
>>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>>> index 3ad2bdfc04..0e375e83fe 100644
>>> --- a/package/qt5/qt5base/qt5base.mk
>>> +++ b/package/qt5/qt5base/qt5base.mk
>>> @@ -4,7 +4,7 @@
>>>    #
>>>    ################################################################################
>>>    > -QT5BASE_VERSION = 2b9835f5c9bcfe3105b60a8dd33c1db7d8611378
>>> +QT5BASE_VERSION = bebdfd54917e25d1c100e6bd9f5dd53c2e645fd8
>>>    QT5BASE_SITE = $(QT5_SITE)/qtbase
>>>    QT5BASE_SITE_METHOD = git
>>>    QT5BASE_CPE_ID_VENDOR = qt
>>
>> ... there should be a change to QT5BASE_CPE_ID_VERSION here too. See v2 here: https://lore.kernel.org/buildroot/20260327-qt5-5-15-18-v2-5-4c98e853266a@cherry.de/.
>>
>> I already didn't like much sending a backport series for 2025.02 before the series for master was merged so I will refrain from posting a v2 for the backport, but if the series for master gets merged, this one here only needs
>>
>> -QT5BASE_CPE_ID_VERSION = 5.15.14
>> +QT5BASE_CPE_ID_VERSION = 5.15.18
>>
>> If you want to modify when applying without going through a v2. Otherwise, lemme know I'll take care of the backport whenever possible.
> 
> I will keep this series open on patchwork and do the modification myself when
> applying so you don't have to bother resending. Thanks for the notice.
> 
> When the "master" series is applied feel free to ping me as a reminder for this
> series.
> 

Ping :) Note, the last commit is from the next branch and not master. 
I'm not sure what's the policy for backports, maybe it really needs to 
make it to master first, in which case we should probably wait a few 
more weeks/months before applying.

bc1a1dfece63 ("package/qt5/qt53d: disable assimp support when 
BR2_PACKAGE_ASSIMP is not set")
79b13f6e675d ("package/qt5/qt53d: force using Buildroot's assimp when 
selected")
11e380fb0300 ("package/qt5/qt53d: always disable assimp support")
2deee0c87dfc ("package/qt5/qt5webengine-chromium: fix zlib license hash")
ff4243147d54 ("package/qt5: bump packages to latest 5.15 kde submodule 
version")

Let me know if I can help.

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
