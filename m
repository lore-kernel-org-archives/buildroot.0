Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF9BEB5979
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 07:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D33B40C91;
	Wed, 11 Feb 2026 07:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxW0Lz2Ml9Ae; Wed, 11 Feb 2026 07:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92F840CE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770796749;
	bh=sjCSf16s4ftj3YzukwikqkueWMO/MjFva2v8s3ktQ1Y=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qnt5PcxiAhYWMyMX24timQP5TRf5Fzv3Vl7vbtlvxY/HDEd1SFWK9FwoLqdJxiskM
	 UapCU/rWlG99ksTZvG/elI22LWnSwAVZZS770eW6oinn92ZuD8EqS9FtdvbBn9a8k/
	 1pbRZJ4S5HdUQb79R1oR7FDPLGVn0UhnySAWvNafgjDiooMZmjRviIIDOxlNpx3ltN
	 LLDog/+fnkK7j61JsZLbnSma6qAz6i7Hh9jqu4vGZP5XqnZm615w9IHgaUYl0ArMwR
	 T41iXhhp7Rsd1gYOeiVWFZ1jabZz+NdSbQr+u9Dd8iLu9y8SHW89G7gOprZY5tHz/c
	 c8msqH80482qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92F840CE4;
	Wed, 11 Feb 2026 07:59:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FF1023D
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 07:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01090405FF
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 07:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqcUq7thbSZs for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 07:59:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20a::4;
 helo=pr0p264cu014.outbound.protection.outlook.com;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57EBA405FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57EBA405FD
Received: from PR0P264CU014.outbound.protection.outlook.com
 (mail-francecentralazlp170120004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20a::4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57EBA405FD
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 07:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLzyG1wgySeENY2TNWqng27F/BJ+J5wKL5pGKQkD+EcC6tyVdpdMLOxplc2LyW9sWSZ+ytwWUbU1fscrd8Acu48U0xYzKpX/LO8o+257kwhJ9HYHmEvWl67NDNHqFqby1Nf0Qcqj7SSI4vxIyyE4MJFmTk7e9UPovL6fkP78GQnSkcRQ2woJw+g0iBvSC5Zu9VJ5eeUW3HvyJm1LSXuGkS0aLQEbsFuSBx9jmpk90rOso+CTNtMIKZtwQAmXsAQZUxHdLXmnvlVIVNyDgkMJvoZOELvj8L21Xn2r8bG65cqrbjCWyATy8UkYKo5VSah8lRB16UzSXlTnd4Mrh5qyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/SSatBSGO3O2Lsgzq04KD0h2zAqXZ9bTDc2A9KCWAk=;
 b=ot9kOxSjGP1pblbMv54uXdwDPCRwceWRtiUfDC9jiMdsxyQWaeQf6VL8eCdMmNfoDbjeoPLXHwwqyDzM/pUrK0xFNEE3fUG78qi8VruDEIJ8+bExSOfXybZY50A05qUAoNT8FDL5eOxDQR7mt0Ysh411ZvIfUTHvOz2ajZgn2lG/KVVWyOKWLDiTXaw3/ceH5yd1ee9+VHtTAdOaXaXQN7z56QIfAmSzpKDoe5WksisVtru91+FJBOtPCv+qFYYS5X4Dj81Pb0nGPooT9bza0h6PJ8I8Wk7VpTW3FDshvUeciflvDSEjNLp+LxZ8oM0w4KOlaUm9vk8Qx+41QEFUzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartandconnective.com; dmarc=pass action=none
 header.from=smartandconnective.com; dkim=pass
 header.d=smartandconnective.com; arc=none
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::6) by
 PAPP264MB7086.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:56d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Wed, 11 Feb 2026 07:59:01 +0000
Received: from MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1]) by MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8b80:947d:34dd:b1d1%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 07:59:01 +0000
From: Sebastien LAVEZE <slaveze@smartandconnective.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [RFC PATCH] package/pkg-cargo: add HOST_* variables
 for target build
Thread-Index: AQHcmpuhwZTZYBeNS0ijj7Y/Fn2kvbV8VCaAgADPMgA=
Date: Wed, 11 Feb 2026 07:59:01 +0000
Message-ID: <39dffd6b027ddcc7aca69b9bd0607cd4b5158696.camel@smartandconnective.com>
References: <20260210144308.689103-1-slaveze@smartandconnective.com>
 <f3f52af6-1504-4ca8-b95a-a558bced811a@bubu1.eu>
In-Reply-To: <f3f52af6-1504-4ca8-b95a-a558bced811a@bubu1.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB3425:EE_|PAPP264MB7086:EE_
x-ms-office365-filtering-correlation-id: a2dd9eaf-56bd-4351-2290-08de69436b37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aGVkc0FraEdjUlNoN2QwZHluTzhoRnVEcU1Bdld6TDZORzYweEtuWkN5MUcz?=
 =?utf-8?B?TTlmTXFDZDA2UlBwR1E2M2J1VlVKSmVIWmN2UlZzeWwyenhuUzErcUMwbHRP?=
 =?utf-8?B?N1RubVArNWJkZ3ZuRFBoaTEzc0dZUUppZWVnczVIOHdza0swa2VzTlppUTR4?=
 =?utf-8?B?eUJaSmpSdDdvN1NtQ3ZOU1lpQWlqZFFVU0c1TXBWMDRHNzFIOHdTMWtINmMx?=
 =?utf-8?B?U1o3QVVBa2cxZTRTNWM5QU9sTFBsZk84dno4ZWI2Z2J3cnIzcGN2UzVlakhX?=
 =?utf-8?B?M1pSbUtBK1U0b09SWjZqSHpIRnkvSlh2NERQcGFKKzRNNFBSa3JlT3dIN1Fs?=
 =?utf-8?B?aFNwSUpHL2ZsRXJKT0JQNE15RjNnUXVqTEpMUDI4WUVJbG9MNkd0dTlLdFJt?=
 =?utf-8?B?KzdrK0UxcGxkcVFwK2c4ZTZmeEVFK0NBTzBTcEdjU2Zqc0wrOUc4ZU8zNFhX?=
 =?utf-8?B?TnROMmYzSjlleUNYRFp4U2NrQzREbitYNFdnYm56b0haUlJSNXptRnA1cWto?=
 =?utf-8?B?VVB6eUs3RVFpZE9NbG9KN1JWN1RuWGIrY2RMcWtpRjZXSFNJL0JRaHRBUGdr?=
 =?utf-8?B?Y2czdFJYVWgxTkNJYTcwdENnbXZMRnJlaW5tMkcxK2x6QzJCYkE0VWFjZy9z?=
 =?utf-8?B?eXpLZEhGelA5RnVubXRmd2gxand1d0ozaGdWbDNDSTh3R05SQWQwMG9mY0dm?=
 =?utf-8?B?b2RzSTZrSGE0eXNRZUxYS3pDWitoWE0xOEpJdXAwVjhVdDl0MWV2QnM4N3NG?=
 =?utf-8?B?K2lTTVhtMWM1c1MyNVJCOGcwc0txaXl5OVFyaFRuWWJIMzgvenBqL2tYUFlQ?=
 =?utf-8?B?LzdIS1crS1QwaWdEM0FiZm5xc2wrOXVFaU5vMHRqellXd1YzMDk4UmdLRlhV?=
 =?utf-8?B?aUhFWTJWV3RuZTFjbStrMjBwWFBqdW10c2czRzBzVXJZV1hhQllVN0pJeDdB?=
 =?utf-8?B?YVB3dlFGNFdPeXlZdnVFQng1Mm1ZMVJ2KzRjSUVHTFpQU2xmSHpmWktMVElH?=
 =?utf-8?B?ZUkyVWV2RGtnSUZWdHB3Sjh0UlZBZ21TSzEvUCtBUjl2dWFkY2NpUiszNnhs?=
 =?utf-8?B?U1dTa2pUMEdxcjkzMlg3LzQ5QW5aWHY2cWp1cHJvUURkUEZaMjdEZWxTcWxQ?=
 =?utf-8?B?em02MndKN3hCdFBjclFLV3JmaytEMmZFYVpyMFNOeVVWS2N3UnRyZERNa2po?=
 =?utf-8?B?eHIzU3I4TitLbm5samZBS05mejczQXBJeVVaVFQ1Y1J5NHlETlo0bGcvTWI2?=
 =?utf-8?B?NG1QNDZGaWxhRlJGQjM4WkRDSmdGWnExYWdRc3pFaG5MbkRpeExxT0dOSThx?=
 =?utf-8?B?dFJyakZHREF3L0hVSHFXZU1aQjNrczdWbVdtVVgrOExIcTFwWGdIRU9JeGs5?=
 =?utf-8?B?dHYwWUpzdW4xendpSGJwRmxwdmxQalBpdWJhd0hnMTQzMUJMUUwxMmxyVVZo?=
 =?utf-8?B?bWNNUitRbFpGVGpiMkV2TUk3NW9mZE5Pall6OFFQRDZ3UkVzOFJPMnNleXQ1?=
 =?utf-8?B?OHRmaGxZWlJOYzNlbXpOUjVyRmJwWUF0MVUvcTBuNW1VWWVBdFdhN3hRVFpl?=
 =?utf-8?B?aGhuelF4cGV2RCsrL3NGMDlOVjczdHh2aFlGWXlJL1d5THRTTzJjSUNzaHEv?=
 =?utf-8?B?OThtZEZIVEZJQnA5OHgwY0tvLzFFVmJqdzZjZlFoRXpqWHBrbEdGWncyeEQ0?=
 =?utf-8?B?Q0RySkZHaGpSbTJmZkwzZ2FMTzFDNEU1bjI5VE41MG42VzlVYjdRaFc5MlJ4?=
 =?utf-8?B?RlpCQlRCd3BiWVpsS05LQjdFSHZsYTBJTVExMDZKeDkvUlcxL2JtKzRWb2FW?=
 =?utf-8?B?VVM4YmdRcDdFWTFNMG9BY0ExaUpXT0U4bzNFMFVPOElyT0hZQzNBZDJkM1Zh?=
 =?utf-8?B?UDdoRjZvWXFFbUY5TFVNNUNsR3lKcVFiOU5sbmdnb2l3YnBCSVdOUWFsK1Jm?=
 =?utf-8?B?YjdEVTlaUjNOUE0zNDJieFErTG5OVzhDMzBORUV3K2RUbkV6SFNYeVBaeUE3?=
 =?utf-8?B?U2xKMCtNMXVwc0lSdkhwRGZRUTlyWTZNZlNwQjhNMW1pU0s0MWo3K2RwSDc4?=
 =?utf-8?B?b2ZJTmhGcFZvQXdrQjNwa1lvYjZleEFFUDE0T0pwbmhYOUROcjN1S2k4L09J?=
 =?utf-8?B?WWxaQ1RablFDd05sbTV1QlRuNm1nWVpLWHJjOVZtcU44QzJGTFljY3d0b2lu?=
 =?utf-8?Q?Fr54GTOvz90qhv7NBqIjYts=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW80UDY4UW5yOXpCTnpzRzZMVkd3U2hlaW45azVVTjRteFBXNmhMVTFLRjNY?=
 =?utf-8?B?ckgvSkxMVmplN3IyR1pjclR6R1NlenJvRk1qM3pCR0pUOE5LUS9wbk1oUWw1?=
 =?utf-8?B?eVVqcStkb2x5bFEydEdXNUhoOXp5RnRXNDBoUlMrOSt2dFlNZVdiYzdHU1Zn?=
 =?utf-8?B?UlQwenR2ZkVHazJqdTRKdUVaNkRaNlFqNjVlaFlJN2VoYzFEMjg2VmZJVkRI?=
 =?utf-8?B?ZDVidVNZWktpSjJFa2s4TFd5KzJwbkhwWE05UWk5KzE5SGtpUk9NclEyQ0NU?=
 =?utf-8?B?SzZaQlpYWk9XR0s3WWNOalNtU1B5SHlVL045Nmp4L2U4QWtHMStaTDYwTDZK?=
 =?utf-8?B?Q3Q1d2l0RW8rOGE4ZVpsZGV0TkZqeUJUWkJKMzNFN0dPOVV3N2g0SEt4bENJ?=
 =?utf-8?B?cjFxM0IzcWpvZGoxRFMwclpQTGtKeHY5by9XMUdoOTVNSHoweWlVVW1VcHc5?=
 =?utf-8?B?REpCeTAwYk1oeVVyVHhjQURJNlFDMEpBUmQ4WWRObnJLU3RaS0VkdVhiV242?=
 =?utf-8?B?WHNwQ215NlgxUG1GNXN5N0FWMWVTQU1CR0l6NnNJRGlHT3J0WXh0V1NXT1hq?=
 =?utf-8?B?Vml1SFBpVW1oNEszVlhVMTNreWw4L2xBTWsxODlSenVHbVhhaUdNaDhaNG0z?=
 =?utf-8?B?bzZtZm9iWEVsNVhNdjQ1YmFKQWN4K3EzUXhDTFQ4VldWOStQSFdLYWdkQU9M?=
 =?utf-8?B?U2FYcWNYdmdSZjk3OWRMMU9IODhROXJwYUtROWpyMW9XOEEvRSs0VkEzbTlY?=
 =?utf-8?B?ZWpMT2VUclZVUHRCNUNUM2pHRkVBd055dGhsMzZTcngranN6YzQyYVgwdyt4?=
 =?utf-8?B?TGZWUzRidjJudlQ2dnU4SmdNbjZmSmZlcXdEQ3pSUFpHZ2FzWUFjMWw3UDFS?=
 =?utf-8?B?cnF4SzBqOU8zanNLek5ZU0JuR0hkWDBWUk5YVkpJL296MXdkTVh6RzJZcG1H?=
 =?utf-8?B?bHB3SlFNVVNzR1dqckdvNTlScVB0M1hNWk1ONDZrZlBsay9IbWF5QWRZVnFv?=
 =?utf-8?B?Y3JETE5RNnp2dFdwUms4azE1VnhIWHlqbFJlT1ZrVjE2ZW9yRjJNc21tZWhC?=
 =?utf-8?B?ZU1rRjAwSWFDS2tmcVdoUFpqaE9rMlJxZXIwUTlSV0tJU3VDc2pldi9qVWJK?=
 =?utf-8?B?YmZSeHVKejQyV2w1MFE0NTVzWVhUWDEzNVJhZklzVTM2YnVkMWtmWVF3cVN2?=
 =?utf-8?B?bTRFUFd2NW5KSmNOZ3Z0eityM1JmTGtObXZjNnkraWpsVEtCMDA2eGREcGhu?=
 =?utf-8?B?ejllbmoyWkdOU1hTaEoxRGZ1alJSWHRCMlQ5c2s2K0xhaldHanFvdTJqSkhh?=
 =?utf-8?B?SnkzV0NBQ3d4Q1dmc3MzenNOaml6WGpHWTVZVWxMaWE2S1YreEFncWh1SXBC?=
 =?utf-8?B?TEYzZ0NIRGkzQlhmZThhT3pEd3NGbXZHTDREN0xwb0dSdnNTUDA4NDlHRWM1?=
 =?utf-8?B?MktYMm5McnRSckxSRHJtbnVrWnh2RTRUOVZqVFdwU29XQWpTanpaUE14dGRX?=
 =?utf-8?B?bkQ5UDVwQ0ZyTVpLclpGV0RMbEpSQVllaVc4NmJNMFNETEJ2dVc2K1hWTGpZ?=
 =?utf-8?B?VFpiSUw3WFZBZW45UlRPM0t5TUNTRjgwSlI0L3pjQkdxeEpyZEFUSXVySDNO?=
 =?utf-8?B?V0grcUo4SkZPSVBMa2ZhUlY0WDFpVkM5eTRodlRUS0JaV0JvVDQ2Wm9vRXd0?=
 =?utf-8?B?enNJNEN5MXFwdk15SEFuTHM4aVQ3U2prcWNobklsYldSbmVIa0o2SnBZTWhm?=
 =?utf-8?B?ZjFFdUcwbmRuRm5YNzFnWDRDMWswSTFCb21ydTd0Q1A5L3oreXcraVBGSS95?=
 =?utf-8?B?R3JWQjMwTEl2S2VwMmNzK09LekgyNUpRS2ZQYU5JQnV5MDdzT3lKa3pKVXVB?=
 =?utf-8?B?MHFaZjRCK1VTR3l2bUJiSGRTYlV1d0ViMWNoWEQrYmdwa0s3ZlpDQWVGVmcr?=
 =?utf-8?B?YnB1TmU2N2JwS282c1lRcjNDWmhSL1hTaEFtbzQvdCtvMWl2NHg4N3pxTWlz?=
 =?utf-8?B?T21TMG93aytRaWkxWEdqeFFWMGlMeHFIcXJSOW43WGpQajJsN21rNkhmVVJE?=
 =?utf-8?B?ZDJ6SVNlTUZOS292MmFWaU1xMUpxZVBFOWtNbGEyc0dWOVY4SkEvNmNzelhB?=
 =?utf-8?B?UEQxcVllc2tVL09qWUtEeForOXlqcVp0VE9yVXdyL0h0K3NqaHo2WDZFZXRk?=
 =?utf-8?B?SHdqWCs0RW12WHBmejFCVVJrTE1iSVg2bWFFSW9wRUwvMENOSlhwVzdQZ1N2?=
 =?utf-8?B?YTV6dTRlanJBcEt1TXZZdmlZZGNsbVF0QzluQ2N3SEoyNmFOQy91bk5Ea3Iw?=
 =?utf-8?B?RVEvSDZWTnJUSCtFUDBJWitSRisvL1lxYThoY3Z6UGdpdWY1bUpEZz09?=
Content-ID: <E2F9378D8242A445A4CAA5CA1DE40B87@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: smartandconnective.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3425.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dd9eaf-56bd-4351-2290-08de69436b37
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 07:59:01.5063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7f3dead9-eeef-44dc-ad5d-e14fabd26082
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C6EMbE/UXHZdm1eEd33tW7fUI5papiK68K+WJVIeXxvkfk5+KfauuVnmN+F8xjlvNom2rGhkjZSBX6p1f4WEaQY4jgZe8fMe3hl/NSrXUmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAPP264MB7086
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/SSatBSGO3O2Lsgzq04KD0h2zAqXZ9bTDc2A9KCWAk=;
 b=pePnA+wGkPExqrp2wTNjaey6eIIMmxEKXqJ8fQW6rPPYKRIymnHGVdqXsWAQIu8CTrGFwg9K3hJFy5fIVUfLxqADsb+EUUY7LrjDQ35hwLwhtglYdcy4mXUEOOoROcVFUSz3zi3IPsQMxyldMSovd23eJCjSB/UmP0+WLqOq6ioAf+MufZTwXb5g/dJR8pN1/yi7JrAIGb8rZigkl22EvjXfLBHRLPfYrSclaKnAwF9IumHmezOMaig06+GmUrFBces7dnJSNkuA8LQwrTZ3Tw9Bu7HJLqKYxqaajHqfG8aJsAyDbWLonxgTH9fQYv12IKJZX9dLsXrCwpQM4gxdSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smartandconnective.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=selector1 header.b=pePnA+wG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartandconnective.com;
Subject: Re: [Buildroot] [RFC PATCH] package/pkg-cargo: add HOST_* variables
 for target build
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

Hi Marcus,

On Tue, 2026-02-10 at 20:37 +0100, Marcus Hoffmann wrote:
> > Host-side build scripts (build.rs) using cc-rs resolve tools/flags
> > through
> > HOST_* before falling back to unprefixed variables. Without HOST_*
> > set, they
> > can incorrectly pick target compiler/flags and fail in mixed-
> > bitness setups
> > (e.g. 64-bit host with 32-bit target).
> 
> This sounds sensible.
> 
> Do you have a defconfig that reproduces the problem?

I'm based on an imx6ull_evk and had no issue with cargo build until I
started integrating some build.rs logic with some openssl-sys deps.

However I was wondering what's the best approach for fixing this.
Injecting TARGET_CONFIGURE_OPTS in the cargo target build doesn't seem
ideal because cc-rs will fallback to the non prefixed version making
the error more cumbersome (using target cc instead of host cc).

For example:
warning: openssl-sys@0.9.111: arm-buildroot-linux-gnueabihf-
gcc.br_real: error: unrecognized command-line option '-m64'
error: failed to run custom build command for `openssl-sys v0.9.111`

To avoid possible misuse I would also remove TARGET_CONFIGURE_OPTS in
the target build. The good news is that buildroot (package/Makefile.in)
already has TARGET_* definitions which perfectly match cc-rs
requirements along with some HOST_* but not all of them.

> 
> Best,
> Marcus

Thx,
Sebastien
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
