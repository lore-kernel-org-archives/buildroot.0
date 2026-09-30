Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEEDCA5FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 16:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8821840A7E;
	Wed, 30 Sep 2026 16:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdQBKOQBXvPj; Wed, 30 Sep 2026 16:11:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8709440A62
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790784703;
	b=Mjr6z1PiLXodjKexY2ImnuNVTcHi+lNrxDbjwtYnQCy1t0r71o3w0hGVnhSL4/QCW3Cc
	 qlw0898wtqzU1/lncdJFoD3o71haZN7Vhhu28laUAk0VXcT19OoH9ae3qveumEsTi2NMm
	 3aawHN6ZlguhvcmgfGuF3LQNldcDn/a8cYX3G6TEaxpK3bDTEaMvewYwFjyO0HwB0V3Vs
	 G4Gv7Wc55dqzxQv2/KG1vz+hivM96J8qwe941WNGOWgUTre+NcZXqMbAqOkeS7F0wSMOV
	 e5nd5S/GmsBMz62KOlPbuUQBBoSUM1k/DQs5VWE2m8odfiDP3KKRYTSeKF4dHtKIiWw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790784703;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:Date:Message-ID:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JoAhjBNnFYM6Ue354om/aVaw+eoFJE61C/WsBkAbJYU=;
	b=IocqQPZLSkeCUJQb1DIET58+bdCWjWqmJzXacgpL27sjqzoklSuXPFRmTK7YcJaS6CXT
	 G5aXvmsMHGI4fIi4FNvDiNBG51HE0SlbX+nzRSDbv45XidCm3sTmfBHDzq3dm5CdjtkA1
	 A7YSsdtSWSZ6om6Bm+by7bzx3I02LbyvlPf6o2nYlLhkmObkl0bL5ndp6oxnIj7khmO93
	 Df6x592+iuc09stzCw3T1EWKHJv41a0EAC1klsjy2+xpGhbMEaEfdJ3fQbFEXih+zBJUy
	 b4KwXQtryOo8GxBAeNMDVmjrtph5zGpywhvO1Yzt1Wj32ECcgox0kVbg8fhliVywysA==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790784703;
	bh=JoAhjBNnFYM6Ue354om/aVaw+eoFJE61C/WsBkAbJYU=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m34b4xRwWi0qXCm3BHAJSRp1/xm33h1uuj/NU9M8PdYqXNLTdOI0WeMdFFfSlLxY7
	 xV8QoEFh3ztYvH1CvXkAqU0HmtwAhyRrgWOsfP95wupcwezAaNF8BSwfrc41pn1FmA
	 ego+vwNCGMrZoKe5T71TJ0qUGPiNIemDDyyFCOOr2ah3uQqDBW5qUCqcERy587fDHr
	 ZHx+OtrBuHf5Q005JYsaSlp8DmXKmDF8ccYhogR6iJ/95c6MAXjd7LCqhFpAfhT1zv
	 LM440U1JsRWhm16LA73HXgoqh7LCxsuylcDJaT3Pal3raKad1qBNMJjBOPferm6uSK
	 QnHhcrSIivK2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8709440A62;
	Wed, 30 Sep 2026 16:11:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E087F34E
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 16:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2141810C3
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 16:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNNMDDqzbg7y for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 16:11:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8E7C581090
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790784701;
 b=cbhsiK4BKp09QlkgO+jnJry82BCTvJArv0bPJAvwJg3bn9qwyGXdJOr1Phay/8KEXHCM
 n4JSYidbTRRRQ+Cmx3kiyADDpqfJvEsmCKhKCsWrNB7mMwToLG8FRhyHAXJMdiAeSW7ci
 bCDZNT4L5KEnKVmQf7KlOOTnsh5dnC9KN2vvEc5WSUtN9Q1t5ZVY6nRc8MzY5hG24vYF/
 mmMsyALTaFBQ+1SteaO13vII/14sb7pumC2upBbP10sZAo4xAENu4Pl2+236iVPSdt5YK
 /cUuNa25R2D22SgEdXkbjFtmMpefgQ2gVlXL+7yuBR6Icg3FMaAomaiKwhND/h2/EpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790784701;
 h=Received-SPF:DKIM-Signature:Received:Received:From:Date:Subject:
 Content-Type:Content-Transfer-Encoding:Message-ID:X-B4-Tracking:
 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:
 X-Microsoft-Original-Message-ID:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=xjPnNdDJB/X2sjGZu2xkdG56m2MMEemF5hHlxj4RrzI=;
 b=TDyD+ajgkP7pF0wZf6xapn9n6oZesyYT6vefSGxLVXVMmzFXYutwwG83ozy/Tge1LsEc
 ZEqcx9QTAEgt5kd7KFLnlVMWaGShnF9apmaq5jm1Ua9ETJdyJXHxzDJnWrhAsBVkHDdNR
 IjXhlUFhIpS2k7vur7KFhiTN2hMF0QwUXfMYeT8ju9XXdl69mcL1fibiMP2I2AMHwHqa3
 JOr743sSX1Z++n4Is56KqlzCjDLLElLaqW20q4rTZ2+Zmd//9gttJ8gKYTakXO4LDt+wo
 etjr1PSlPvqHNmNDf9+JY87jP6jU8nPnNGiK53fXTDz84F+X6uXck42rD7lfDRQkzgQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=outlook.com; 
 dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=mFWHD5rn; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=mFWHD5rn
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E7C581090
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 16:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/Y1YxuhVX+8jerYEQsiC5wPUvZ5HMahbPmMP1zrNkU+mPyiu+St2tVpYf4jpxBw9Bluy3pSiPnglG17QPyEVuL9ecu0/4SLqg5DLoOhqxse/CtKt+Xkdbj5fDI358SYnRUk6cyRmiWlzhQiTRuBiB7GxtJujkigZEl3sIE8O1ce4RgnQwpIAiOSJAozAHDQOAhyWtMLyhRuX1vegU9fYLjW9zgXqa8axAcHfHV/xjCw1XoIsJYD6X/B/Y3jEOPV8w4QCIO68hZkZ2TRbGy0VNwe7hhzohxCX8aCDkkI8qsStxtUIy99VBz3ydhcX4Cv/8N9jpv4T+SX+fjCSyl54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjPnNdDJB/X2sjGZu2xkdG56m2MMEemF5hHlxj4RrzI=;
 b=oKV36mZnIZz5uRz+alAyqUZteVf9B5Zbjm4ZiGZni0/pN1fysBkBXwpfJ6rEVvm4sPWv9D4yZQIsX5dNCnfG96VGZYbq6FQrKKiv7kCTdNCYfKbTxU/83fY4Nfov2bGIz7qoGwS+U7+Ud/X8JA6zC7fj6YAcSbgAccWXQrm9oGh9Zf211Atb7E6vUKTuDgGMUe1oG8/86dyYnLkf0NUFMZ57Fctfn236owEwBBB2i7gm9f61q6z3ZLpYf++2ESr6zsmUUe7/8H9E589ZCc7cqoBRxJbHifHmxBazAaOSPZW9PNyQPdCB5QJsMQNgOOkxPfkhMBpfdOuMVhOEDopQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjPnNdDJB/X2sjGZu2xkdG56m2MMEemF5hHlxj4RrzI=;
 b=mFWHD5rnqlrNQInN2Uui+vaIO9dohyJRFjVxsImPMu7XbBmP73IwP4OLiitAFb8L8m/pF6hernsaHTuYCHDT+o240tt7k+YCCEevWwU3OrvXk9Cihi6uQN79SPqHIaFUKfh5eNyD9AGFJIy8EmD0OzwjS8aZPhNGouGfQZC1KU+B43zDA7CIAa2MqGOUW7PC7f0lrOo3LFsRD4ob4MwXuvAknG2fFKsQgnPvLxF/XbiKGTHz3b2h429RuCpKY+O1u/4t6OxgaKRT37mZYONNWX4CzVHQAwToQKmRMZhBVNEpFZS+r/W6W8vvwoozlcc3E754blJnr6nVEfE7MsTlYQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 MEWP300MB0016.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:1f9::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.15; Wed, 30 Sep 2026 16:11:31 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 16:11:31 +0000
From: Fengwei Tan <tfx2001@outlook.com>
Date: Thu, 01 Oct 2026 00:11:07 +0800
Message-ID: <SY8P300MB004173404881C9FA17A9E265B58B2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-B4-Tracking: v=1; b=H4sIAJo0vWoC/yXMQQqDMBCF4avIrBtIBwnaq5QuJpNRR0FDoqUg3
 t1Ylx+P9++QJalkeFU7JPlq1mUueD4q4IHmXoyGYkCLzrbYGArB+HWJJhJPVPYakT2TkAsdlFt
 M0unvn3x/bufNj8Lr1YHjOAE0X2SrdAAAAA==
X-Change-ID: 20260928-add-btop-package-422cbcaea6df
To: buildroot@buildroot.org
Cc: Fengwei Tan <tfx2001@outlook.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261001-add-btop-package-v1-1-abac8d5acf14@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|MEWP300MB0016:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcd0580-b3a7-4cc4-4da0-08df1f0d7d21
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|8060799015|25010399006|51005399006|24021099003|19110799012|6090799003|5072599009|23021999003|260925184616899003|15080799012|5062599005|41001999006|40105399003|10035399007|2607281247196008|3412199025|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXE0eWE2OHRkOVBHK3FrdSs0VDRyU2NYcDMwNEt0OWcrS1Naa1NSUXlWTDNv?=
 =?utf-8?B?NkM5QjhWcS9PQk55eG1rTUx4RjVpU1pQMTZhWWxZY2RUd2FGeEJ0MG5xV3l3?=
 =?utf-8?B?OE9NdGtKYk0yeC9uMGFvaTg4aUdUSE9HY2pwNXA3REVRSkk0eXg3Rm81VEwy?=
 =?utf-8?B?TFNCS1F6T3VBTWptaXU0aU1IRVNWVnFZTDArUnR2Ym5DWDRCT3FOMVFLZjhm?=
 =?utf-8?B?MDdYMXlYTnh5SlEyYyt5N1lGbm5YYlB0L0FTNkdqVFdlTGdWS29SMncrREpH?=
 =?utf-8?B?MDcyNG9NUklESUE4MWF6VkdWRDJoT2syVWVFeVZwb1VJTGh2OXA2MXZ4ZDR2?=
 =?utf-8?B?dFNlRHN3b1VYZXVvMUNydUM2dDBYbXo0SXpzNEFndU12UTZ5VG5NL053WEVO?=
 =?utf-8?B?Tjh4Y1l3QUkvcWk1REFmVnMvSUp2Nk80OGxkeU05N1IrVEJZMVlHMVdNRm45?=
 =?utf-8?B?MjVUeVBhdVFPbU5Dak5Mdy9SMTQyQzhicGdDMm9Fb0N3UGdsc1NOczQ1Tzd0?=
 =?utf-8?B?NzFYQ3psSXdRQ1Q3dUlNeENnOUNuUklpSnh3dllwN3FWMjVMb1VCQjRkNnUy?=
 =?utf-8?B?ZnYyV3ZyTFRRZHgrMGQ4cWgzVVJKN0MwZnhBVFBGNjZOZU5SUzU0REYvZE5a?=
 =?utf-8?B?aEhRNUpIYnJ1dk51NWZpQUtVZVlJZEpUWHpHcDFzQzRPbXZBVmtKUWNJYStV?=
 =?utf-8?B?QTlzMnl4RDN2RTdQdzVEOG1NSzJNR2c5UmMrZ3hGeXNBMXRBMVdEYUJBekgy?=
 =?utf-8?B?SXlYNmVSSGh2TjhXclhwL2w0cGRpcFVzbTN6b3NhZFZIK05oc2hUZDg4Nmpx?=
 =?utf-8?B?eGhFWFp1L1NYaEhSUjdSdUREdmVtSXRnZkpPTXhoWkQ5VFFiWHpBS1cwb3Fv?=
 =?utf-8?B?NlRobmF1NU5GdHFISi9oaXRsTTVaU1hwdXJEY1llcmtwSzF3RzZDcTQ4ZVdQ?=
 =?utf-8?B?SUdmZUpjYU1oblhBeW8xaktqV25mYUlZK2JTNWNZNzBtSyt1eWNYd2NYL2tK?=
 =?utf-8?B?b2YrSlJ4ME1tL3pvajc4OG14anNLNHN5SUJrUXhHaGR6UVpzNk91SVhYOTEv?=
 =?utf-8?B?TytRdkhKbFlVcWdMRWZCNGJWZ1JJNDFrbTZKMHRkcmJBSWJUNlpFeVlaUEV1?=
 =?utf-8?B?b09XRko0bE13TWgxRDNYWE96aTdONkZYeVRGQUxqZENXU2FDQ0RLeHk5K1pU?=
 =?utf-8?B?MzE3bzFvNE44TDVHZ2paV0h4UkVjejAyZnQ0dGNRdXVEOThQZzhaMXVZZkQw?=
 =?utf-8?B?UTBTWDRzdWdCYVA4S0JTNkMzeHMzZjZYSzBFeTN2RjNjYnd6cDk2bGM1SWl3?=
 =?utf-8?B?dnBYSUE4bDVnTVQ0elNzQWNmVUpveE5MeGtQQkhGK1Z6MGw1aHBIZHgwb2J0?=
 =?utf-8?Q?eVI6L458x9NWsx0AG0OhehzUVaR+s37Q=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkk3UG8zakszUDk5bHNERDduaEwva1ZWNE9na3RSdEhlcVlpUWREWkZ3Vjdr?=
 =?utf-8?B?RC9uc09yN1hpLzgvYnhVZ3NQTms5R2x3ZFBvVG1GS01HOGZIbEppclpmTCs4?=
 =?utf-8?B?d0hRWSs2Z2MvYWp4dlhPTjFnT3pHTEdIYVJLSS9KL2lBdlBTR2QxZVhBc1M5?=
 =?utf-8?B?NndIYW1XM1J5ejkra1A0SFh2NWorUFZST0p4SFI1RTgrMEpNNi9GRGprb3o2?=
 =?utf-8?B?TG5qMzNyc1pJMlVHZzNld3BuakRSeEgvQnhhM0NvdDhCV2JmNWJtY2NsUkdi?=
 =?utf-8?B?dVorZ2RLUFBRYzc2SmJ5Z0tKdjl6d0hTWUhJYitUUEtZd1M2ZXFIK1h6Tm1L?=
 =?utf-8?B?WnRWWHpxcUgzZysrcmUrYXhudTd3cjYxL1o4RVhvSUlreklsVm4wemI4cGlj?=
 =?utf-8?B?b3pYZWVpVEp2K0ltQVlmNGF1YUpyZURTNU8wKzhxc3FrazFyOXY5blg2elAw?=
 =?utf-8?B?cjFYUlNOcHZCYkQvcEttWkZKOFFlUlZnWktHNm1aY0xkamNnRFR5NlZUYjJI?=
 =?utf-8?B?RkJMZjVDb3Yvak1Rb1A2TUovaVM0NDBKVlNYc2NXeG1xRW14TnpoZm53MGJx?=
 =?utf-8?B?SDgzU1ZQek05R1pvaklmRi9xNnNNdXovVHJ5V1RjWnBMZ293VmJRTzduL2dx?=
 =?utf-8?B?ZEoydVJ3MnhKbm4xNkdNZVIxUEptWnlsWDVqY1VkYzFBZS8xUlpGSGRaYjFm?=
 =?utf-8?B?ZTdoRFp2NnhSQ05RVzNQRW5pSXJkTFJXYmFxUGhhR1U0bGRoRGhRbk1aN2hU?=
 =?utf-8?B?TlE2UUVwRTl1aUVudjZPWFEwT2dCZkNmL0R0R2dHZHRlalhocTUyVFJreFZM?=
 =?utf-8?B?UFk1SHlEbXJ5T05xUkVDSUtaRDE1R1Nna2JFZXRtRjN4WkFIMXNBcmY1NElR?=
 =?utf-8?B?Sk4wdmZSMytIYjJ1eWtqMUV6OEkxWVZ3MmZUa0c5bzVhckUrQXIzSWtYTkxs?=
 =?utf-8?B?QWU5Mmc4eEVvQnE0UkQvU2JXT1Q3LzhjQklSZXU5eFpZbmtSMUdhUTF3dG1i?=
 =?utf-8?B?QjVFQzZ0ekl2RkM1Ymd3NVRGcTM3cTRYbjc1VUk0d3ZBVjNveFVlS205VG1T?=
 =?utf-8?B?SmFrK0tndWI4dFFvY2lwbTU3Z3RiQS9tRFFDVWNaWnE3V0YvYTZYcUFRODd0?=
 =?utf-8?B?NEVMZWlNUm5Zd3BQMTd1bG1XYnBMcWxoZlhuWktxTVpNK1luZDV6UmlxOEFl?=
 =?utf-8?B?cHExTmxSNlhYejdVOFd0MU1LNGNDTC8vbDBMNDNLalFqZDZqbTQrdldIS2Vz?=
 =?utf-8?B?ZmZqaTYyNzR0ZG9Tb25xWDEyTmQyU1NIMUl2Szd3TVlQdXloVWk1R1pwK0Y3?=
 =?utf-8?B?VldrQWd0SDcwUFlnT1RxQTNTanFKVVlYWndtRjBTam5SUFY4NDRmTHl4V0dr?=
 =?utf-8?B?VlBUWEFWR3RrcGtGVTdOUEZpUGFOc29MY0thWUQvaWpWS2lpVXhZeVU5SUV4?=
 =?utf-8?B?VFlqcm1qLzVlMFBrSndDdGdDVUF2dXY0U3VxcmtWYklPY05iL1VnKzhYcGJZ?=
 =?utf-8?B?MU9HN0lXTVRzWEpQS20xdGxMb3cxeUxmd0g3MC9tbEZWbnlpK041YjJSeTV0?=
 =?utf-8?B?TTZwZ2ptSnFuWWk5MldhdUtNbDRpM0UrMGhpYy9GVDhKWW9ySlA5UktlbGRB?=
 =?utf-8?B?Wnp2WE40Ry9xcmdKNnVyNHdPL0U2eHdNeDRBRUEwTDF5c2tkQXR5WW14YUdm?=
 =?utf-8?B?Q28xdktpcnVueU1PUUlwUzdsVUhXaVppSUxRTW1ma29aTENSWDJpL0VVVDJm?=
 =?utf-8?B?R1Y3TjM0a050ZVY3WEJqYXZTQkorRHpWM2FYeStzVm0vWUZoajJsc08rdVgr?=
 =?utf-8?B?K3JGL3RPbE5mOHpQUVZLWTh1dkVtUlVUOTg1YkloS3llYVRFYTEyeXBzRG4r?=
 =?utf-8?Q?3pCJqGbJlynmg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcd0580-b3a7-4cc4-4da0-08df1f0d7d21
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:11:30.6877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEWP300MB0016
Subject: [Buildroot] [PATCH] package/btop: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Btop++ is a resource monitor that shows usage and stats for processor,
memory, disks, network and processes.

https://github.com/aristocratos/btop

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/btop/Config.in | 36 ++++++++++++++++++++++++++++++++++++
 package/btop/btop.hash |  5 +++++
 package/btop/btop.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 72 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f4b746290e..9796461335 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1130,6 +1130,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
 N:	Fengwei Tan <tfx2001@outlook.com>
+F:	package/btop/
 F:	support/testing/tests/core/test_flat_stacksize.py
 
 N:	Fiona Klute <fiona.klute@gmx.de>
diff --git a/package/Config.in b/package/Config.in
index dcca214383..a3546048ac 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2801,6 +2801,7 @@ menu "System tools"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
 	source "package/balena-engine/Config.in"
+	source "package/btop/Config.in"
 	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/cgroupfs-v2-mount/Config.in"
diff --git a/package/btop/Config.in b/package/btop/Config.in
new file mode 100644
index 0000000000..fe4be53454
--- /dev/null
+++ b/package/btop/Config.in
@@ -0,0 +1,36 @@
+config BR2_PACKAGE_BTOP
+	bool "btop"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	depends on BR2_ENABLE_LOCALE
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no quick_exit()
+	help
+	  Resource monitor that shows usage and stats for processor,
+	  memory, disks, network and processes.
+
+	  https://github.com/aristocratos/btop
+
+if BR2_PACKAGE_BTOP
+
+config BR2_PACKAGE_BTOP_GPU
+	bool "GPU monitoring support"
+	depends on !BR2_STATIC_LIBS # dlopen()
+	help
+	  Enable GPU monitoring. Intel i915 GPUs are accessed through
+	  the kernel perf interface. NVIDIA and AMD GPUs additionally
+	  require NVML and ROCm SMI respectively at runtime.
+
+comment "GPU monitoring needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
+endif
+
+comment "btop needs a glibc or musl toolchain w/ C++, threads, wchar, locale, gcc >= 14"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC \
+		|| !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR \
+		|| !BR2_ENABLE_LOCALE \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_14
diff --git a/package/btop/btop.hash b/package/btop/btop.hash
new file mode 100644
index 0000000000..6a543dfc67
--- /dev/null
+++ b/package/btop/btop.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256  933de2e4d1b2211a638be463eb6e8616891bfba73aef5d38060bd8319baeefc6  btop-v1.4.7.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  include/fmt/LICENSE.rst
+sha256  e0309e3ea5d2c839946816c557ac8da5ec022b3f0bb26a5b5de0f709567902b3  src/linux/intel_gpu_top/intel_gpu_top.c
diff --git a/package/btop/btop.mk b/package/btop/btop.mk
new file mode 100644
index 0000000000..ac7f294b17
--- /dev/null
+++ b/package/btop/btop.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# btop
+#
+################################################################################
+
+BTOP_VERSION = v1.4.7
+BTOP_SITE = $(call github,aristocratos,btop,$(BTOP_VERSION))
+BTOP_LICENSE = Apache-2.0, MIT with exception (fmt)
+BTOP_LICENSE_FILES = LICENSE include/fmt/LICENSE.rst
+
+BTOP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+BTOP_CONF_OPTS = \
+	-DBTOP_GPU=$(if $(BR2_PACKAGE_BTOP_GPU),ON,OFF) \
+	-DBTOP_LTO=$(if $(BR2_ENABLE_LTO),ON,OFF) \
+	-DBTOP_RSMI_STATIC=OFF \
+	-DBTOP_STATIC=$(if $(BR2_STATIC_LIBS),ON,OFF)
+
+ifeq ($(BR2_PACKAGE_BTOP_GPU),y)
+BTOP_LICENSE += , MIT (intel_gpu_top)
+BTOP_LICENSE_FILES += src/linux/intel_gpu_top/intel_gpu_top.c
+endif
+
+ifneq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+BTOP_CONF_OPTS += -DHAS_FSTACK_PROTECTOR=OFF
+endif
+
+$(eval $(cmake-package))

---
base-commit: ea9d29a8afd6026b2aa042526387f084eb00f359
change-id: 20260928-add-btop-package-422cbcaea6df

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
