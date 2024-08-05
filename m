Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751EFC3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 152D580DBD;
	Mon,  5 Aug 2024 07:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NxHw22QMq2K4; Mon,  5 Aug 2024 07:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B0FA80DBF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B0FA80DBF;
	Mon,  5 Aug 2024 07:18:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 909AD1BF333
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89C9D401DF
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVFFBRi0AR_d for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=9409ec7cf=wilfred.mallawa@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2E5C2400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E5C2400F8
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E5C2400F8
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:18:35 +0000 (UTC)
X-CSE-ConnectionGUID: NMCxgMo0St+oSggP5AbbCA==
X-CSE-MsgGUID: La8tMtdsSceSGkXjlS0Ulw==
X-IronPort-AV: E=Sophos;i="6.09,264,1716220800"; d="scan'208";a="23516766"
Received: from mail-westusazlp17010006.outbound.protection.outlook.com (HELO
 BYAPR05CU005.outbound.protection.outlook.com) ([40.93.1.6])
 by ob1.hgst.iphmx.com with ESMTP; 05 Aug 2024 15:18:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+7amElslF/u85TTvHlNcYkwh2CIbSJ9ZL1yIsJYUeCcntbae0J9RSA0TbOVldE0Cj0SubiSNgOp+pVN+bcekxbDMpTf33w6Q6bCEjljQYXbrKXfo8NLtgnAXX9pljOeFPFY814Y2ARgyTtQPu/fk0J9kdExGD3I1zQuhqrhoPC6vv4GOFbRoSd1NXgnaxa/GODWprjVo+AXmU6od728VcibL7DJL3k0J9kmDlcv3CimCuFu3UQS14qKxsdWwHXCJVmxuxaKF+mi8wlLgE1VKhXDjPGTdsPiEdKAQ2j4qCGkimiujNj11PN2h+XjeshxYkskXbkasic/GPsjv37bhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgmXvY34rc6+LG9lDnwfh4pQcZSOHkj/GchdUW2Y4jk=;
 b=QkOBAfH5R2WRSH2MyUqIQno4HCFcqfN4Bb1nLQ3NNSAP5E6H7Jli6KgxcoDyb5i/ghvmj9cWnSPYIXfEnaIOLxqeEqvlAS/a/wO1gJhIfH3WZovUrvhvbXtS1NMCOACgDdzR/KqFulzZE5Uk9IK8cqkVYVriBNhNU960I8trCCSYmgE7mxImdnEYc3KwGqd97LO/39qZTGTb0VqXKYMQqZS2tRcA95y+Puy/5lqytUAgdTT1Hy/WWUyGTFDUfYkKavqdE8EGc9+2iUahRRzqiyjZFsZ2t8QIuWXX4pP2zU+Drm4cImFMm9GEpLBsvb0vJD1W7SLu9Cw+zgeSDcj+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from PH0PR04MB8549.namprd04.prod.outlook.com (2603:10b6:510:294::20)
 by MN2PR04MB6845.namprd04.prod.outlook.com (2603:10b6:208:1eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 5 Aug
 2024 07:18:32 +0000
Received: from PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e]) by PH0PR04MB8549.namprd04.prod.outlook.com
 ([fe80::5b38:4ce0:937:6d5e%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 07:18:32 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v4 1/1] package/libspdm: bump version to 3.4.0
Thread-Index: AQHa5tsK0ekS2dJn7USofczrJ14XmLIYP+OAgAABwIA=
Date: Mon, 5 Aug 2024 07:18:32 +0000
Message-ID: <0f038952778a45fb2a80ade4f0fe2d007d580474.camel@wdc.com>
References: <20240805015711.112117-2-wilfred.mallawa@wdc.com>
 <20240805091215.6ab959fd@windsurf>
In-Reply-To: <20240805091215.6ab959fd@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB8549:EE_|MN2PR04MB6845:EE_
x-ms-office365-filtering-correlation-id: fb48f7a5-285b-4696-136f-08dcb51ecffa
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eHZmUHY3V001d1ZzRE5Gb2ZlRS91Y01xNXZmZWdRbDFOb0NWWnRWbkE0aFRn?=
 =?utf-8?B?Wm5lUUZtbk5EME9NVzZRK0FGUi9GNWdKaCtMaGxjVk5VYk4yb0VrUndHeVFO?=
 =?utf-8?B?NU1sV2p1b05PY2VQSVZlQ1d4dFdlNHZCcU9na1p2MlJDbG5lVkMyT25aTmxa?=
 =?utf-8?B?b0t4ZEZabHYvQWlpZytzRWFiaUh4OS9pV3EvREhtbi9xUU5abjVJMkVoMmor?=
 =?utf-8?B?L1prL2NWa2UzNUNVNEN2cjJxd0JJakN1aFVqN0dwK3BmTkNVNUpjOVYzSUpi?=
 =?utf-8?B?aTIzdUE4ek5jT2VtTVdUWHFNbTFiWEZDQ0FIWU1FNnk2U0hEb2Q0eVVXK3Rz?=
 =?utf-8?B?Rmp0bnNFQUhXalM1dDJqTzI0bVlwTXQ4N3NNOVZpcjhRVnMrZndubWVzTE5J?=
 =?utf-8?B?SzVGRkNjY0xrQUZybmhobG5McjF5aStsQ3lMQlo5T204SDVKSXViZEFBWVJV?=
 =?utf-8?B?KzZYckNmSjhha0ozMEovdTNBN01iR3VIeGpzUmNIaXRrVGhUNkdMb21WdE9s?=
 =?utf-8?B?UmpqN1pCZmJWQ2xZQmhFWEtyYUhJQ3BnWE5WUWRROFFUSmpPaHI0QmJSTEh4?=
 =?utf-8?B?WHlFRlhVSFoyV3JlV3hOYXUzdTl4OWZBcXNuaFlmYWJIUDNwTmhQZm9aY0lx?=
 =?utf-8?B?RmJMczhtdVVseEhiYVM0ZzBxekt3bGthNkFDOVNjWHE4dEMrYUx2L3pha0I1?=
 =?utf-8?B?SE9ubVNCVjFiUFRNR1BGY29PdGNoZ0NwQmg5YnZxMjhVZzJrcHQyNkQ5WDlO?=
 =?utf-8?B?VVVHVHBzMXJhUGFjRUlocDJ6ZnRGeDZQclBYdTNoaDJUdWkwMHZIMlgzS1U1?=
 =?utf-8?B?M2hqSjY2dW1oV1Fnd3prTTdpR2h0bHBxajRaa0dzRWNFMVVSNUcrcEtuNlNO?=
 =?utf-8?B?bCtnckpIYTVwaFNwc2M3UDFFWmZFWkx4aXNWZnc5NXpyc1ErTUliZ0cyb2xF?=
 =?utf-8?B?OVlHd2ZqV0pEb2toOERGdHZ5SjJoUkhoM1ZSTlR1bHVOdWo1R2I1WGdYRlhL?=
 =?utf-8?B?UDN6L0U1TEFyNXdWbEVNUGRXVFdoVlphSGRtTnBidEZvS2QzdCtqejFYTjRM?=
 =?utf-8?B?YlRpelhMcStnbzhrVE8zaE91R0RxS2NmMFFJc2d1SzZSTGpzWFIxaWVxdVAw?=
 =?utf-8?B?SVBqb2Zqby9OUnFDZzVpemFkVGZzLzk4NDl4aDJVVDkvMk1sUUJWdXRLaU4w?=
 =?utf-8?B?bFFzcHZXZGliWjFPaWJEWnNtbVlvaTM4d0JvVEkwcUt6Um1hYytkNWxLSHF3?=
 =?utf-8?B?cWczeFhLenBlRUN5MXNCeG9ueUlWeEpCeGtEaU1jVmpqRW1HcGpnQXJINmVv?=
 =?utf-8?B?NjZvN3lTdGwxczdjOXo4WDliNld6Nm92enU2NVlmZjNhMjhXS2dEbXpMQ21S?=
 =?utf-8?B?Sm5US3l1RkNIbTdTQ0NrT2VEMHpaNlFkN216eEQrRVRFQTA4Nk5QSGMvYUp6?=
 =?utf-8?B?TEpIVCtLSjJmL2JaUTkyQVl4S0xnaGRFL0F5V3FLRlh2ZUNTMEtXMkZaYmZO?=
 =?utf-8?B?U3Y2SmNwK0ZWMTgxdmx0L0pTQWdXN0gvWmF2cFF1RHZnbWM3cjk2bU13MEM0?=
 =?utf-8?B?WUVrZ2hzZmNVbFZLb2h5OURYMm95VlRvSDF6VWlsd3dIdzREMDhHR2J4eHYr?=
 =?utf-8?B?dFhRWVFNeGRMS3FYYUtMT05oVFVZSUpzc29yVHFuWU9mUXEranFvc0hDb2hy?=
 =?utf-8?B?amRJVFI1S3hjMldHejMzUFA1Q1dIQmxtOHNqVXZHamNNNnA5OWt5dmEydngv?=
 =?utf-8?B?MkU4QmxNS3kvS0FIaWpzb2dQdm90NVg5VmdFVTJZZDVwMWoxRUZjT3pNMjBM?=
 =?utf-8?B?aVRPVG9nTnZ3alhjTTRYa2oxanJkelR1UUF1MmhyY0k1QU1HV0l2dnJsSHhG?=
 =?utf-8?B?dzhIMm8vdzVBa09jeUc4OFllRTRyLytzeC9RRGJMMWV1SWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB8549.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWJXc0pXN2JjdTRhR2x6UkR4SEs1eDhTb0VtcE16N2MrSWljaWw3YmhkazUw?=
 =?utf-8?B?N0xmbHUycEt4WCswSzVXbVlGVGNhWFRSN25OVWcwNGd2aUhYN1FUTThDZkFs?=
 =?utf-8?B?WXVSem9zTjNFYnJHTkpNdGlCTEVZQXNJV2Exc2lQWERVZHd5TXVkTXRqT2lQ?=
 =?utf-8?B?QWlEbWZZNkNudUYzQzJobmY5WTdKRytVLzN1UlFPTlhQYVNscEdDMWdyWTUz?=
 =?utf-8?B?WHgyL2lWUXl1Ulo1eFo2QThoeWVXeERLeFQ0NXFueGg3Y0NvaTZBTGF1SDNR?=
 =?utf-8?B?OUZKeXpHNUNBMXM4dkxndS9lS2dCeTBsSldOK3plWWNGYW1IaGFHZ1VwWnpS?=
 =?utf-8?B?TXE1bklSc3NuVFh5cGlpWXYyZVBZZXExMUlqV3BxQktWZGhpblVBOXFDV0VS?=
 =?utf-8?B?UlI0ODFqdFJqVEhHQUlWdFNpdGZFSjZYWEtJYTF4eG90Q3p6SERrcWRjaCtz?=
 =?utf-8?B?MUxtOGZIRmlqTWJqMGE4SG9xTDNTUk1oNWVEbG83MlFXOUVTd05BbHdhc216?=
 =?utf-8?B?bUFROVFDNDdFRkYwVVdwbGVTbVRTc3RIYnZSRWNYUEd2ck11ZGFySmVNY2U4?=
 =?utf-8?B?cHk1KzFGUUtMcFR1amRXN05LZXo5V3ZySnFKMkV1cnhKV2xoRENaZUlXN2gz?=
 =?utf-8?B?cWIwd2FsOWtySmZHaFdxZ3BhelA1OXExT010Y241b0hrYXV4bTV1UFNoOVU3?=
 =?utf-8?B?TTM1SGlISmRZQkZEeU4xa0FTMnhmdFFmdW5RSndQcURxaFZNQ3VkaVpvK0E4?=
 =?utf-8?B?aVZ0TVdmckpFZ2VQZUdLSVpYZGMrMnJvcnhzaU9CTkdFcWJFZ2hoaGhvRHg5?=
 =?utf-8?B?R3c3U0wrYUZzREo3TUE4ekJNWnNGc0RvRzFvVnRxR044R3k1UGh1Y1N2c2Va?=
 =?utf-8?B?VklCUW9jZXY3dGFLK01zNk1OR3ZuazZqUTltTHV6cGh2VmFwUEZFM2FkcGIv?=
 =?utf-8?B?UG5mdWFiSGN6N2tubmRXbEI5TVloYmdscHBCOWMyY2l3VDN5YXlZeW44QW54?=
 =?utf-8?B?RDNjclZxalg0dWtZbDFQYVBBOEpoVnRyUFltMjJwb2VDalp3YUtpZm4yVDVy?=
 =?utf-8?B?SVhGU0dBK0hNUVNsallqdi9UNG1UbWJsaFNvM3R4K2hzYkxaSTJ0dXVCbFcy?=
 =?utf-8?B?MFVzaU5Wb2dtRlVjQWV2OHQyUkcxSFdxT0dBT09nREJBTWVkV2VwZkkyL2FB?=
 =?utf-8?B?QU5uVU1pVmo0bUtqdzFGLytEbmFleUdYZnUycTZkNVNZNUpuOHRyQnk3b1JZ?=
 =?utf-8?B?VEl0ZmJMc2ZZSVZVM0YvMmtEMldUN1NFRGtha05KdWpnZjhORXNDakVZMU0r?=
 =?utf-8?B?ZjNCYVBDS2JJRXllRDZ2NTd5M0ZVWitqek5XSkE4eHB0UkVVaC9KbDkwRENQ?=
 =?utf-8?B?VWJQQXFkTlVOanNqbW9qMnBDdXVzOXBiU3JaUmRSY1pVZmdSL0R3YW1hK1RM?=
 =?utf-8?B?MEFIaktwZS85V3FRL2h5ak1vRnovSHFiRU5VcjJSc1Rtby9PcUNCRnkvMkpW?=
 =?utf-8?B?UFYxZ0w3L2I3bnQ4amVXQVRrRVYyZDdYWm9ZckFTeTZ1N0kwc3FDdVQ3OVk5?=
 =?utf-8?B?ZHA1UlAzTk9ZRmhoenpSdVVrOEwwK1pFbGJhT1VYbGxpenhyWFpURGZxNWdk?=
 =?utf-8?B?eC9RNkV5UzAzNlBnWDNhSFlsdXRZV1dFVXRkc3BVemlHVlpUQUcvS05qKytz?=
 =?utf-8?B?RWhNL2lRUFRyR3pHSk1tZ3hLL0gxYnJxbzVKRkFCSHlqcWpmTVhyWnQyY1J6?=
 =?utf-8?B?bGlEWDhUUTdubEo0aHhrWXk2ZktQVlNzbjdJU2ZuazJpTHQ1ZE16MlA3Q2Mz?=
 =?utf-8?B?NXB2TGw4ajJ6akp3cW4vWFBUYjJ3R1pUQ1JiK1JObTEwMnZFS1hMTGFFUi8x?=
 =?utf-8?B?SXhjdzMwcmxzd3J2YTZKSHBneXIzTjhUeWNBbjJ2b2dTL2Z3Zk9hS3Z5c2po?=
 =?utf-8?B?TnlvQ0xPS05wcFRYUGkxSlQxSVRQd2k5THFBb3NPMTNDS05wYlpUNGRSNFBs?=
 =?utf-8?B?eWVJRFlpMFNxNmlLbDE3Tis4dmh0Z0dCaEJSd29vb1BKL25oRmlNTkd6Njcr?=
 =?utf-8?B?cHpGbklPYlRiOEhzbFBIWEljWHg5clduQWN5Z2hnaUlQeVF0MFVBeHFFbFdQ?=
 =?utf-8?B?NS9IOWYxN0VOMFZ0cEVuYXhqNFVMMXNTMzhoUEVsd3R1Q2l4UjVUNGc3OU10?=
 =?utf-8?B?akE9PQ==?=
Content-ID: <1D3926554C42ED4BBA0F0EE8698F2C70@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: w55jVc/Zm3KiNu4Q3CVaxQERIu6kCvYwooXffHYjl1atm7Yr+loPE2psTdZUn4b+1qjbRXEwy45ev/m5yzj9RqacanCuI9l4dwnvW/FAKm4n31AEebAy7hyhIeHxt6SVMHaSSJYzv/OnJdY7G3xAeQolN3x+2NOEkq50M0UFalwX49BjJsHNzGRL6N0dvhjuhf0/NfnwMi/+5HVV6syUXkLDiz+RdZFaLS/dgoE520BLDLDQnfcC+u3pYLRMuVApYV2vGKnI3XMFdEGNCbKBMkRyZLz5CUdIwqOGk5D8GljqlBGhnJbvmtFLZiMMekPCf9tbiXpr30+PmSxFH6kJPdwmpbCI0fKuaeFCurRA9m7lNuIFqpagKBN8+G78dq0PCXFTccFwkn0sFz4g9fbwcX8P+JMAG77R72O6wEKB5xcB/clJWn4687R+DMHyNxyjZqW8NWwlgMU7puhThzbRTIMnd+OMjlSXcyOQFHgwN/CE/egK21pLS0vft3tnxDhiKEn3OG4XRrjqwRpbTHJK6GXY/vZShuqudLSwbqGN2QEUYZ6RTRA9Bq6UabqWDPdx89OCENHm/aguUrCK2upeWKoEVHC/gcMWKOYGf5whAtG8Y1TWrZ2sonsKdDJsik6U
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB8549.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb48f7a5-285b-4696-136f-08dcb51ecffa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 07:18:32.2098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxOEhqZkM2guaoi1PssrpubSbVSJF30qTSuKQptMM0BsLrFFpGK+GUmVzqDU5/8/ckvGmr8HaY1MaWOFSlSV/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6845
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1722842316; x=1754378316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=TgmXvY34rc6+LG9lDnwfh4pQcZSOHkj/GchdUW2Y4jk=;
 b=DSaaYTiz/i5oSi8UF+9JXYRJoCMCbubZ5Enf8xy7pMjcfAhDmI9svMie
 wjnV9hj3aX+V8LXrxQ0B0Z6RAyekgReu2oznrzFVTlhrvPYn/7PsW2RB3
 wRgkMkG2nXesMOIhNJjWEMhZeA2HvbuE2FodfQtav4RuBElwnvG0F3r1+
 UtTkQnK56TbjhZa0wwBs/vbeBnp4SRKCgpcQs01F7sJ7viqgOvwwqxdQS
 /NVUSKvmqsbmzHhV07w54Btrx/yX4oRt8oCKF4YAwBDi5537AY0/LStw4
 wNWRFGR7SyvxXPW/IuWZNHCjqZ8hwBo2dLYFe9GEg17Ihyk/fyluFtHJG
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgmXvY34rc6+LG9lDnwfh4pQcZSOHkj/GchdUW2Y4jk=;
 b=Mui+12ip7KuIVqUKeDRGtJrIzK/kM7Gt2C4WUzNtMGa5lyL1bEGySveDSqOYKi1zjdeNYTAQsFVdliON7Qkg34h2nt14+hhg2daPW4zzo2WyQsOx4vQHpuiIJEcuTNJKoMrWZ8S0XJ1LpLbbVWhCLIOedmCjS3oMrvl9aDMQzdw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=DSaaYTiz; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=Mui+12ip
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v4 1/1] package/libspdm: bump version to
 3.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Reply-To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAyMDI0LTA4LTA1IGF0IDA5OjEyICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHdyb3Rl
Og0KPiBPbiBNb24swqAgNSBBdWcgMjAyNCAxMTo1NzoxMiArMTAwMA0KPiBXaWxmcmVkIE1hbGxh
d2EgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOg0KPiANCj4g
PiBGcm9tOiBXaWxmcmVkIE1hbGxhd2EgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9v
dC5vcmc+DQo+ID4gDQo+ID4gYGxpYnNwZG0gMy4zLjBgIGFuZCBsYXRlciBzdXBwb3J0IHRoZSBT
UERNIGV2ZW50IGNhcGFiaWxpdHksDQo+ID4gaG93ZXZlcg0KPiA+IHRoaXMgcGF0Y2ggZGlzYWJs
ZXMgc3VwcG9ydCBmb3IgRVZFTlRfQ0FQIGFzIGl0IGlzIG9wdGlvbmFsLA0KPiA+IGFuZCByZXF1
aXJlcyBhZGRpdGlvbmFsIGZ1bmN0aW9uYWxpdHkgaW1wbGVtZW50ZWQgYXQgbGluayB0aW1lLg0K
PiA+IA0KPiA+IGBsaWJzcGRtIDMuNC4wYCBhbHNvIGludHJvZHVjZXMgU1BETTEuMyBtZWFzdXJl
bWVudCBleHRlbnRpb24gbG9nDQo+ID4gKE1FTCkuDQo+ID4gTGVhdmUgdGhpcyBvZmYgYnkgZGVm
YXVsdCBmb3IgdGhlIHNhbWUgcmVhc29uIGFzIGFib3ZlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4NCj4gPiAt
LS0NCj4gPiBDaGFuZ2VzIFYzLT5WNA0KPiA+IAktIEZpeGVkIHVwIGhvdyB3ZSBwYXNzIENGTEFH
cyBhcyBzdWdnZXN0ZWQgYnkgVGhvbWFzDQo+ID4gUGF0YXp6b25pLg0KPiA+IAktIFJlbW92ZWQg
dGhlIHVudXNlZCAiLi4iIENNQUtFIGRpcmVjdG9yeSBhcmd1bWVudC4NCj4gDQo+IFRoYW5rcyBm
b3IgdGhlIHY0LCBJIGhhdmUgYXBwbGllZCwgYnV0IHRoZXJlIHdhcyBzdGlsbCBhbm90aGVyIGlz
c3VlOg0KPiB0aGUgbGljZW5zZSBmaWxlIGhhcyBjaGFuZ2VkIGJldHdlZW4gMy4yIGFuZCAzLjQs
IGNhdXNpbmcgYSBicmVha2FnZQ0KPiBvZg0KPiBsZWdhbC1pbmZvLiBTbyBJIGZpeGVkIHRoYXQg
dXAsIGFuZCBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlDQo+IHdoeQ0KPiB0aGUgaGFz
aCBvZiB0aGUgbGljZW5zZSBmaWxlIGhhcyBjaGFuZ2VkLg0KDQpHcmVhdCEgVGhhbmtzIFRob21h
cyENCg0KV2lsZnJlZA0KPiANCj4gU2VlOg0KPiANCj4gwqANCj4gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2YwZTQ0NDhlN2MzOGQ2MDQxNTJiNmU3
MjdkY2Q2ZmI2ZDIzYzI4NmYNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24hDQo+
IA0KPiBUaG9tYXMNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
