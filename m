Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16D6D4922F
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 15:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BDBC6164A;
	Mon, 18 Nov 2024 15:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ao4SUIvl9RLK; Mon, 18 Nov 2024 15:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 844F46165D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 844F46165D;
	Mon, 18 Nov 2024 15:05:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DC730DB2
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 15:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6F526F4E3
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 15:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYTq_sYofFQe for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 15:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=04553ee47=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9435D6165D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9435D6165D
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9435D6165D
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 15:05:44 +0000 (UTC)
X-CSE-ConnectionGUID: UxoNiGEXQuGgL7JI9xGdDQ==
X-CSE-MsgGUID: IZaeXazPT2Szcxz4a8w9xQ==
X-IronPort-AV: E=Sophos;i="6.12,164,1728921600"; d="scan'208";a="32755761"
Received: from mail-westcentralusazlp17011028.outbound.protection.outlook.com
 (HELO CY4PR02CU008.outbound.protection.outlook.com) ([40.93.6.28])
 by ob1.hgst.iphmx.com with ESMTP; 18 Nov 2024 23:05:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXnpDeKkRcf1uJeql+3eOnce3heDjvrIzYeFxZLrGziFnhEjZk+w5dB+aR1TVNHFgeBHMGEpJT0AD6A/0ezpc3Fr7HxieYUGprun/jkt2NYeUltZeIp5CW+otUJg3DhbkbaPzwzEHtGMCVSDYLgjAZywA8molU8WwRd1wquacFcfHUKL9YJ6s8aNQ7IZSlkwx/quE8q44s4DN32Yq7QppJc1btwf476YJ/aBrG4CtjIgAiCgLmuQfHZdJSYgZdvYAX07DrPV2VRxZRF4mLoWy5WRI8ZszU7iVIdqmWerLjT2t+6Y8vWCuRYT9goYXrRwRAAtU0kWZoJiRnxZWrZ/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJmnUIsFJvBKck7Zsr9kt+nYuNztWfcdolrLWnlb7g8=;
 b=TAxtkDGdwqjwLPZkqgxJYqqVRJCN/XquN3UVtw3MOIQ/pAVshaM+bUs61lUHUkcZw1DFUs1yVUHGeFgkoFXMasVa3gPPWj2T3zb3IGiWs5dwvbGmSTr9GA2HdoSnYvl9/0P/2wEk9ZbjcxsSmA+D6JVFt2vAF6yTx23DQHO85c9bJg7j/0cqRzAXFagfi44Qpk7w6kcVyZ8lLmbBp+6Upc0/NKp7rXknxRME0/priqRXtKJO0qVAdhhz1Wt4uQFzz22lI14IzXQ8K41QDXut55OY9aHORabd23Tt3hDEVYBJuloBvttfSky3P+ZKUl6Qoa9rb/3dmyVEf1TxdILpZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by CH4PR04MB9228.namprd04.prod.outlook.com (2603:10b6:610:223::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 15:05:41 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 15:05:40 +0000
To: Brandon Maier <brandon.maier@gmail.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH v2] docs/manual/writing-rules: align use of genimage
 partition types
Thread-Index: AQHbOctVi2ZGTZDV30mm0ZiBB6QdlQ==
Date: Mon, 18 Nov 2024 15:05:40 +0000
Message-ID: <ZztXxBOZtE-h6Yfs@ryzen>
References: <20241117-genimage-partition-type-uuid-v2-1-6c5f3f6dfc98@gmail.com>
In-Reply-To: <20241117-genimage-partition-type-uuid-v2-1-6c5f3f6dfc98@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|CH4PR04MB9228:EE_
x-ms-office365-filtering-correlation-id: ad095218-8db6-4e74-d4d8-08dd07e277b5
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ykYb/GenTP+OGCcPfW+QGYAItku8ryQPON933NNdlNlpQne+v7PW3fZ5LwV6?=
 =?us-ascii?Q?biqel9tkOLM7atEcHOpMyoW/Lxd8rZChrwfYi+6g4kALxIOlJTgcGTRW8kQL?=
 =?us-ascii?Q?1zwJUJHXoqF9I6H0ZRtTKlq8mPZQQacQ6jVMA1fqP2Q+YyGllm9+67hkpZ2V?=
 =?us-ascii?Q?O0CGUqh5GYR21B2B3TkKXxr2mIWb8gduMxqpQyWeWtooMNKtCGxM1g9pOPiS?=
 =?us-ascii?Q?yh67UONJ8kEUHD34l2aKCkoAAwfl1JDgFB+7JUHrga0urgFuzUJXb/tlvhi9?=
 =?us-ascii?Q?vVn8mSldayeuoygtYVg8rKL/jXRFotjDaiY7zsUfeUgoN094DOD+Uneb4idb?=
 =?us-ascii?Q?TIn1oiu7OB24JE3ZDJLmbfXC3p6BGQCM7TqAEnOVFZlfWcXov0y3GCQVYDKu?=
 =?us-ascii?Q?vHj/kcprauG2FKAjByfQHbSNOBaeQD8IBj3eovou3SxlZ9A0WHfa8MswF3pp?=
 =?us-ascii?Q?RqIsLRu2CkWJs985U/DSzhUzw+QvLY6cxIG5jfIUHr3efoOfXoSrGX2T+cr1?=
 =?us-ascii?Q?B+Q7galHwurpplYv2845iS9iet0cf/VG7jkrgVo8RpVJStWFs2UkW7RCWIDG?=
 =?us-ascii?Q?kSV1mCPulCJXtkhbc+aAAhp8Cf5G6fMiEuYYGC8aD22E33gpcDmaLrjzFUHb?=
 =?us-ascii?Q?vKMGGBTogKFgeA9raVbUzIYwYtLyVbdvXf4irHZIPj72Xo2gC/qLMf6e2nJm?=
 =?us-ascii?Q?qBqqJplANkCz2mq66lefzeS+fIJdoxsf3N25nVDP81+FXgeJE5hyWRzDiOWQ?=
 =?us-ascii?Q?ThPINR0tnaVObtHftJY1zJ0w88+KvLt1h5X0kSPPECh5xbe1QIj0UqyjwQlr?=
 =?us-ascii?Q?gXIPc0IB588r54gQ4ItY6rnbRlCP7rccmZL2idA4QwNd2g8U2CpHyrk+fkBA?=
 =?us-ascii?Q?fc/sXStzVvCZlkitL6BxUkAHdBLuMG22ohxGXxWLK0lDgf4u+d8iZw9viup3?=
 =?us-ascii?Q?UzKcdZnh0uONmAHLRRKy2jvYXoWd3Bo/an4gPPZ5ZvMW3VZz3lbvp/4EExS7?=
 =?us-ascii?Q?obcGTZzevrsnZ+xNO2950EBAsA++y4fayIcbE3aPsu6nhKXqd7svprSqHQOU?=
 =?us-ascii?Q?t2uYY0oKN07aL+lb1vq8uxyVYaveVHlSG48npLu2J6xRHUvyzdAu4nus0W8r?=
 =?us-ascii?Q?719arctViymbHdYNCnm8xbVd4yZHNBrvxqK9EOBJDxS5Kh0KlZzuXetJGcT1?=
 =?us-ascii?Q?how82kxhmN/t5qccmfwjpJLuZif29lZWlevlN39nYABGTtPmaBXT7Vc6K39a?=
 =?us-ascii?Q?AIKri+673wHs10UFloa4Y30wUHRTUC2Qu7rj9csL4HZ5xhZDh8NNPwpG6vXA?=
 =?us-ascii?Q?f/o6azIPpWoEvvPhrEGC0lTdykFl+0iwGe7HpZ218MERCA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P6DUG9VQzo0ft0v36TLLGZVEju64wK2PmfQDzfkzpFfyEgJJ4exmna7uQvaz?=
 =?us-ascii?Q?DUPj/U2Qc1qPbO9XCkx7RjQfPBwzUC5I1wu8KqdGOdyvaRezcuYFjE9CP+Mz?=
 =?us-ascii?Q?oSJBVsBz/6a8N5yZb+DJRJljzhKKzQZMGIfGAEaeoo6/QoLSPJ0+KC5GvSVT?=
 =?us-ascii?Q?09OsFMv2QqVj/eDmhX3upN2C1bJFsqSzkH+bdAPbaUGBoy+UFp3p3pw2izFS?=
 =?us-ascii?Q?Q6mCsLmiQJandbYciuEfxgnnSBjsrP/zuxuJ+xhbEMjyebm2rkoDc2cxOMer?=
 =?us-ascii?Q?cGl6DHLHibolpY9e1T9jH8Lko+M2VY/Bsft8S4kaxek4z3RqJ9e+jQlaedcb?=
 =?us-ascii?Q?z6P7OYh/0PxwDVaszHmK4Zk4a0l06Re98FPx13o/psqMsOxYT5iFPWnMaRQu?=
 =?us-ascii?Q?hyuqtRLqc1y6dH5noGj1l7giR+iE1ytFjYtzi8mLiWPcaEri1SW8inpt7ypp?=
 =?us-ascii?Q?SopjE+bXtd8bJNCfF56/cbYkbZhIun5TSECSCDp4k94hPjZLhuj7phYg1aVT?=
 =?us-ascii?Q?f8AKqqc7PDBGoJozUSVj4lTMwjY/zJzGYe9oT8BACEnQxDpWnX8AhBA/wKVJ?=
 =?us-ascii?Q?xrkLN9Lc75e0FnK07ipsIRL//1Vly8DlzgiEbOaJr22H7MBF4JviptiihYfH?=
 =?us-ascii?Q?EVf9I/dZBjEcj1xAlstbRtzU6Dl9kupEUc53inIW9EN4ge3bk4h28z1g62pr?=
 =?us-ascii?Q?XuvFRM9F9e6Yf1gj0V4H0jBBdTuQt6SHAlu87u+CjpyktVbw9tr4wF3aXpaL?=
 =?us-ascii?Q?z8DKqJH15JNz7ZS5IZFc4pKePi3tGElh/vR4+LIU3K6pCnrVlDMCJA+9NpiD?=
 =?us-ascii?Q?WLHLDmV76pejjAWlWDDT1DswE53NCkB/SfgMhKlHhKeRu9a+1EHKMk9MTFuC?=
 =?us-ascii?Q?OV9T76zqPyocl9xlsKBpydngqqYXmNW508LrZCEUF7CYrUjSidJ3mnCWMaiB?=
 =?us-ascii?Q?cPQ6q5L8Slqt+aQGuUh09t8J/DLL3LxUU4I8RFTzAPFnKaoWa1KMecQzL17T?=
 =?us-ascii?Q?AqknZ3lSbFaqftBQj+JRFjnLwMsRwTKo05ytgx4mHWT/WfPfjyRJlN5B7hDT?=
 =?us-ascii?Q?1Iu7AGOZK7ACkAHftk5kew3qy9DL39mMd6L8Q7+vY3VBtT0gnnbp7TONFb1u?=
 =?us-ascii?Q?9h07OMbewCCdB9P5EIBILeOAbNTsqTuY2mB+skHl6Z7czqbKkj7HLO5cY6gS?=
 =?us-ascii?Q?ZQHCXbsgq+jQAOEyx1P34vUIREUui3uIUt4NP4mnc2IUTxfrNfFbjr9vCYiC?=
 =?us-ascii?Q?mlRbIoCfPHNtZoia4JEted2kKKh8+Ak5E7vji2LME21+//4UfxjBJV6H42Dr?=
 =?us-ascii?Q?s6vk/kix3cZhmPlOnQXee8XBbWMT+eeKMkq0DKrjEMrIq5sBdjYeU/z6S7Q1?=
 =?us-ascii?Q?UpGfqGfkDhRa1ZAbAQ1kSZNt2r4t9jdCDxfiNstMrAZtjlnN23c3DEKIJ0Es?=
 =?us-ascii?Q?riR1ybGOUat2tC6g0DGGS4MSyt2022r+QXLwCpZMt0Vbq8KkKSJ0nY55DEaA?=
 =?us-ascii?Q?apML5XuCqmv1b4DIzFKzZaxBGTXrKuixxHihjo81UxgUnU1M0NC3z/MNXe6T?=
 =?us-ascii?Q?ovt35fD83rJYr1Rd3e9s4/oC11n2gJXkCHZITcFPPsdu8Hxd21Pma2PLArZu?=
 =?us-ascii?Q?sw=3D=3D?=
Content-ID: <D42BA264E2BE554FA03920933C17E7EB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QKk5MmZPv3vsSotgptzaRFp1dFzlLr5IIyg2GuYR6q9aEdtu8NCmhFvXOQ/I1DCpOB9G8wdfvjVQ5BBLguafeS3wWek32f+CWdFolk5tEd80zTSS6vzXUVIqtHtm81oCezLe5Yh7LKo9xzkp3wWajofZWIEbI5a5TcwcJ7ZLUKOC1T9Os9wdB1gTPC6XpdyfS8BKKUVx3xn/nzIAER0wFjisPcRnFSP2MNV8TjVpEPN5pPxF3CCpVskYJr6dtcU7l8II21TgcM0jFjpqxzyoUmBGAwEly1I9jFOD+smV4uemVteJIpuNFUzZVkTALndFPmmyVg1Go12fzyq5QyMKfvWjEqfQ8OXuCTfFwd1EKFWVJZKiH0RoRFocWoaj+DxfxhoCl5yptQ9Dbrt8zyxiJNRRyGCMNpyRLh6dkqPoh/dXqfFH/V1alKJqhqwBA7u3He9mHRZCqINn4It5WE6ZqJT3FxH28kYf3QIbbBrvEXhzKjUln4XIJX3E6uCv4y5zDks8WDQ2cWzVObFn1rdmkDJPCm+uPY10vXBwu2nDcLkt8RtN+FfCBc21Jq8IFcOg+IK30CaZIpxg7/xpKd7B+HHDDAknnKdLIz64hCuR/l6EuH9C6oeH3xG1A35Ym7dD
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad095218-8db6-4e74-d4d8-08dd07e277b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 15:05:40.8789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZ56EFbM7RHiuEsG+ZAlYi7zB6O8+Awau1+qjhibDMiI0tXkoiFKLqj93O5lhOnU2/sbDVV/L38/ZXbo/tcokA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR04MB9228
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1731942344; x=1763478344;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=qwX3egqie+br48N2q9tmvfl5Wpax+YC0T75lnRo2Yh4=;
 b=S2sM5j+t3gd5dsmxHTrlHLe+9C94BZ1fUEWfzV6CvRAX9DpEMpDdyJP2
 aW+ks1e/RmunOHkaO35hc4VXYk5DDOL4fKYBD91Br0FY+hwG+kXJJn2Zg
 XOPj26lbCTqLTWL4xc36xRL04PwfUAXwmF9LWn+EeHt2IukgO56F1zlcL
 BZKEUNAYiNf9kC6lx//cLAeCeKVup8Qjmg2CX3cIfODDO8uszZGIcYLLy
 kkBgi5BqfZU8o8ThOSunViry6wl7mZr+ZLTWDO0QkIeX7hRvyYE11TqFT
 GkLSLAEp4PhAkLCnTtWXapLdFQ0m7dECWUdHEjCBUYlRvpotI/ePMsCld
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJmnUIsFJvBKck7Zsr9kt+nYuNztWfcdolrLWnlb7g8=;
 b=WL5X03Wh/i4sjX75u1tM1FdnxOFyat7aeDMKieZs6CKCwmhn/1slDx+9/1VuxpZKrk7NdPUyIqUD69ny9MMyLOejfiQdqbuUapyXLwl4TbXtyMUEc/7QGwjsZUjutvNYXYwwqthbJ/1gSYIaRoD0LDgScSiu3Uo3E9Ladcf09nY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=S2sM5j+t; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=WL5X03Wh
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v2] docs/manual/writing-rules: align use of
 genimage partition types
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Nov 17, 2024 at 03:00:38PM -0600, Brandon Maier wrote:
> Buildroot boards use a mixture of the GPT Partition Type "L" (generic
> Linux filesystem) and "root-x86", "root-arm", etc (UAPI Root
> Filesystem) for root filesystem partitions.
> 
> To have consistent guidance on building disk images with genimage,
> update the docs to recommend using the UAPI Root Filesystem types. The
> UAPI Root Filesystem types are part of the UAPI Discoverable Partitions
> Specification (DPS) which helps set a wider standard for system boot.
> 
> See https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
> ---
> Changes in v2:
> - Update docs to call out root-* partition type [Niklas, Thomas]
> - Drop GUID board updates for a later patch series
> - Link to v1: https://lore.kernel.org/r/20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com
> ---
>  docs/manual/writing-rules.adoc | 37 ++++++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/manual/writing-rules.adoc b/docs/manual/writing-rules.adoc
> index 03e4f2c61cfe4820fe6d06d193b9215d423bf4d7..3964deca867494ca4df70f3c0d92f9982ec6deec 100644
> --- a/docs/manual/writing-rules.adoc
> +++ b/docs/manual/writing-rules.adoc
> @@ -198,17 +198,32 @@ image sdimage.img {
>    chance, the byte count.  In comments instead use +GB+, +MB+, +KB+
>    (not +kb+) in place of +G+, +M+, +K+.
>  
> -* For GPT partitions, the +partition-type-uuid+ value must be +U+ for
> -  the EFI System Partition (expanded to
> -  +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_), +F+ for a FAT
> -  partition (expanded to +ebd0a0a2-b9e5-4433-87c0-68b6b72699c7+ by
> -  _genimage_) or +L+ for the root filesystem or other filesystems
> -  (expanded to +0fc63daf-8483-4772-8e79-3d69d8477de4+ by
> -  _genimage_). Even though +L+ is the default value of _genimage_, we
> -  prefer to have it explicitly specified in our +genimage.cfg+
> -  files. Finally, these shortcuts should be used without double
> -  quotes, e.g +partition-type-uuid = U+. If an explicit GUID is
> -  specified, lower-case letters should be used.
> +* Every +partition+ of a GPT image (e.g. +partition-table-type = gpt+) must
> +  explicitly set +partition-type-uuid+.
> +
> +** Every +partition-type-uuid+ value must not be double quoted

s/quoted/quoted./


> +
> +** Every +partition-type-uuid+ value must be written with _genimage_ GUID
> +   shortcuts (for example, use +U+ instead of +c12a7328-...+). For a list of
> +   GUID shortcuts, see
> +   https://github.com/pengutronix/genimage/?tab=readme-ov-file#the-image-section
> +   If a GUID shortcut is not supported by _genimage_, the full GUID must be
> +   written in lower-case letters.
> +
> +** Every +partition-type-uuid+ must use a GUID from the
> +   https://uapi-group.org/specifications/specs/discoverable_partitions_specification/[UAPI
> +   Discoverable Partitions Specification] when possible. Some common partition
> +   types are as follows.

s/follows./follows:/


I think that it makes more sense if these two sentences above are swapped,
such that you mention the Discoverable Partitions Specification first.

Otherwise it is a bit confusing, should I follow genimage or the
Discoverable Partitions Specification?


Perhaps something like:

Buildroot follows the
https://uapi-group.org/specifications/specs/discoverable_partitions_specification/[Discoverable
Partitions Specification] whenever possible. This means that the partitions define a
specific +partition-type-uuid+ depending on the mountpoint.

_genimage_ provides shortcuts for many of the partition types in the Discoverable
Partitions Specification, and these shortcuts must be used whenever possible.
If a GUID shortcut is not supported by _genimage_, the full GUID must be written
in lower-case letters. Some common shortcuts are as follows:

+*** +U+ for the EFI System Partition (expanded to
+    +c12a7328-f81f-11d2-ba4b-00a0c93ec93b+ by _genimage_)
+
+*** +root-\{arch\}+ for the root filesystem partition, where +\{arch\}+ is the
+    system architecture (for example +root-x86+, +root-x86-64+, +root-arm+, or
+    +root-arm64+)
+
+*** +L+ for other Linux filesystem partitions (expanded to
+    +0fc63daf-8483-4772-8e79-3d69d8477de4+ by _genimage_).


>  The +genimage.cfg+ files are the input for the genimage tool used in
>  Buildroot to generate the final image file(i.e. sdcard.img). For further

Perhaps you do:
s/file(/file (/
here.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
