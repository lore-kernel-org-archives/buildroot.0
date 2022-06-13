Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A751C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE5E4045C;
	Mon, 13 Jun 2022 20:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHpkYYSxIGRR; Mon, 13 Jun 2022 20:48:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F415D400C1;
	Mon, 13 Jun 2022 20:48:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E03381BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDBC981430
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="SyKmeyNz";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="doZq/6Sj"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICXpIF-_YF8d for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:48:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8795A8140F
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:48:51 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 59D8C40913;
 Mon, 13 Jun 2022 20:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1655153330; bh=rdBQEexbX9RRKUjfX2Jl6IiCJ2mbQ1gSy5kw7bBsqEU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=SyKmeyNzrVwsH7+xvDmlO52xnaPVvd+IVaoE/SJpUZBbB5XFeRqsqjLmXVzludEyc
 eHhhOft+beazOsYOuTx/148J3mOcK9kbgkIfUete4k7Eq6HXPaLMw5lSgwR2jivjoa
 9byHo3Mw9AuuLW+ClclyBP/d4ojVGfcqd9OgAnyvga2V5mG6+Vzn58yaiAtnJ1wqBd
 ooAut/eoKHqSyJbi0jqwohPAUpv7dW95cdr3bJhzN/KhZOOres7LlrYyVNp6ww0oDh
 IfFuKSFPYxezLKVhyFFzMOcWRMy5lDjAf1KCzZI6P6Vyqu5IHHMGhRUs1Pr6FkeJsI
 LfckdxeNnhx8w==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 087F9A0073;
 Mon, 13 Jun 2022 20:48:45 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2047.outbound.protection.outlook.com [104.47.57.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 191B6800CA;
 Mon, 13 Jun 2022 20:48:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="doZq/6Sj";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlnsa4eaK+zywBZOMJAQKpPMtV9YuGkklmnQe7nZG3gfdcWLMm36nF+nv0ISKbrgWniUfomDygy/TdFvGiIXuKCwj3npbq3w2jUXPA9MDg82SD5wytvrn2Qym17ko/4Ito5KrQLL+7nFGKs/2JeTXSkT2jBJ1DdcRVNUZ1XPmC+zrqloS25GbAGAV9ckWti+UlPN46jkV5njdUIgSNDlcY/PJowgJmGnDxtWJglm7FVVDwFAc3D1GeJOrUWGtvJJ+86GDzIabcC/wxRsNDkG9yFLq6WLhzhslL0XGfooNpO1Y9TQTlK6vN7d80qYoEGI3s+INETv6y7+ZKK52R6Ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdBQEexbX9RRKUjfX2Jl6IiCJ2mbQ1gSy5kw7bBsqEU=;
 b=VcgwijcQbdDFQrD41t3kSkfiwOwza61V4VLhoWW6NJVe8ywN+cTkNd/Co+dC6fqv9YGEz/Z/oRSBg1X5Dws4GO9wsfmvbELIj+yP01EvWSk7/IuZJ3DFR5xAC2fduQ3QLh8f0fQP2CVno8Uibtu9SJoKxk7ig7hgANA4Vk75VJPkc9Yx2MVlCHHp5+1/Si2jBSxmIiYVQBveRtrf+pE9J/wB7XT+185s00DxxEs8R4R/LRIY7q2Yc2de/dt3Khyvdi2qQhrljirQM8TfTtuoEIklsYFC8z02K1fMIGtLY1t+uxllHhdNxAaQbT5ULN9U6rlYDApfQ/ccC/miZoxE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdBQEexbX9RRKUjfX2Jl6IiCJ2mbQ1gSy5kw7bBsqEU=;
 b=doZq/6SjGD/AtSd100+bWLFJC/l3lKlkJrIfpokAoNswMpJck9CN4KoVsIaUZqA3xIrsS/fDZwn6UcEmWh3eU5tDBoLdTeP9E5U6gZuQKvLePeL+vyLU2ccSa1ZrjWNK2J1ClVotnL8exgej5+EOBdWpPAxR5r5r1j5o8yEm4Fo=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by DM5PR12MB1546.namprd12.prod.outlook.com (2603:10b6:4:8::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.17; Mon, 13 Jun 2022 20:48:39 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d%4]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:48:39 +0000
X-SNPS-Relay: synopsys.com
To: Arnout Vandecappelle <arnout@mind.be>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/bpftool: add a patch to fix cross
 compilation
Thread-Index: AQHYfM6sRE33fFkIREGzvMCEBX5Ne61NzJYAgAAHuoA=
Date: Mon, 13 Jun 2022 20:48:38 +0000
Message-ID: <fcddbfa3-9d7a-e809-630c-b157b5d6c8bf@synopsys.com>
References: <48ac54a1-f946-8f98-42e4-e39d2ab7130d@synopsys.com>
 <6592891c-1b2d-d1cb-f34b-3e96f23e74cb@mind.be>
In-Reply-To: <6592891c-1b2d-d1cb-f34b-3e96f23e74cb@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d1ad577-6363-4640-f1b9-08da4d7e17e5
x-ms-traffictypediagnostic: DM5PR12MB1546:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1546017B29AD565598DE1EC1A6AB9@DM5PR12MB1546.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VBYFU8w7pLXW4rGmPq2617RYk7x2MW5tDg3y5QbcKGZex/pf7Re7nFoK4bOOn3FFNVSuZaBzUIKhiIwb1d7jKatSbw5XyHOXSLwF3mKqzjnM9WEkTv1lugUR8ZZF3T9uiYZ7h6CXSsQcelt8W194oSIs4bAEfu9EJxxwVCfjYzbFxMLqmrH9JPVZ9fIoY1w6FdQtDwTs6q/aPAlxbrmswIqZvpUdiRNls4MZZ3qd/IqVvVULqfd13e6CrY480GMzH0dwmZ483bSnTjiYa43Du+EtBsFSz8fsLSu60XUDkb6Pr8LFM0WPC5gZoCUCGDmaBTngqWbkNHKZpOVYps090Iu9x9Gom/6nw9AmXMHYVH2KsUsyYRnL2tiB5gIrzFXB7PV6lKPs7w0LW3xHQISG2vO1smXCfxuXiESVDl+y7f/Ep/ra3aWXHNUubpipFCtv8Snt+o17WXBW/pdQN2I1yuCp398Uh6ujtL1s1MGJFRH9L1pe99ISP+vg91fUMuFkbeCqKjxY6PAzQK/lO5IolCbInZDcQKuJqYC/JmYkmrkBcp6wIXXDXMEvxc/v4XXEhOmq50zINLIz9rE3SktL5uZfajT4z631evsbto/7w686p8zqnianRuVIhPhdrfhxBhgrgf7+Vw4sVGzhuRUhcOTGh6Y+A9AEnJRto5ZbLB2S6S/IS12aV+ZiHwTgMv5bF5hog4YarzphvWGrzJE0WhnR/A+E8V3AGL1Ay15ngFAyZFLgnKtWe/+VQA6ib5Zr8p4q+f6Ac2CsK2oFnyuGwUltukbWsg95Q/UfkNJvJNrU4so6H0K1zc4iLYP0EiN/dRm7dSSVjuyRQieCc+xjzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(53546011)(38070700005)(31696002)(91956017)(76116006)(2616005)(186003)(508600001)(38100700002)(83380400001)(6512007)(122000001)(5660300002)(64756008)(66446008)(86362001)(31686004)(4326008)(8676002)(36756003)(966005)(6486002)(316002)(2906002)(66556008)(8936002)(71200400001)(110136005)(66476007)(66946007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjVVeHNZalg5eVYrbllEblZTcG1Wd21MY3N3bU5VSWFIN1VzSGRKUW9CRmZV?=
 =?utf-8?B?c2RWajZjbk9WT1NMQ1pUMUl3TmtPSXVJSnRHcDBDcWdybzUrOXpZNElTZzM4?=
 =?utf-8?B?cHFtbm4zcnNCZEZ3RlJQQ2JtMWdUV1lZamZ5ajViVjRHS09HK0FLZzZhUVQ4?=
 =?utf-8?B?Mk5jNDJESEc1Lzh6ZXUyWGhzUVJqaER2V2E1ZEh6V0s4Ty9abkZlRUVZUnAx?=
 =?utf-8?B?RXphSHp3Tk9FUjBoRDVnaE0yOEdTQUtKK2tCREF1VzFXcWFYdlRrZ0dzRmV2?=
 =?utf-8?B?MlhKRnUvMVNNaDZrUUV3VFhxeGxBMFYzdUNlQUk0VUROdS9vME5TWnFuZGJW?=
 =?utf-8?B?UmQ0a1BMRGYranEyVzIxalExUklVV1Y1QlJabk10Z2R5SGRuYVpRS1pVS1Rr?=
 =?utf-8?B?TnFJelVwdWN4UDhMZDZMeEY2MXRQMzlnS2U0R0psUFppMTdJQTJJWlZkSXhs?=
 =?utf-8?B?WkpQUlR6ODZnWk0rUHlybC8vdytRdG95M1Z1V3B2UlNtSGNkRlUrUHhuZmVZ?=
 =?utf-8?B?YzJQMmcvMStYS0lSZ0dFRmhNcDBHMUJXNkdWWDhZdWhURVF6dFdxbWQxZjRS?=
 =?utf-8?B?dFdUSTA3YnVKMkc3bFpUajZsc3ZScU9LZUZBd3lkWTl2bVhxQVhFTEQrM1d6?=
 =?utf-8?B?ZUVaNFErNk4xcjZPcDhQZ1FxNFA1TnVJSlE4NmZ4b1NiMVBQYkJZWE9kUlhC?=
 =?utf-8?B?clE1R2hIZlpJcmd4dDdIazh3ajlkcW16LzBFbWRNcDF5RFBVM0Z0NzMyZnAx?=
 =?utf-8?B?MUN6Y1hnY1JLVFRrdzdwMm5hMzFPZDdPY051MTdhL2lJMVNXWGF2aVVOdTlr?=
 =?utf-8?B?dUNLelJkeGs5Q2QyMTUyL24wVUdRY04xNzVueHBmUWo5OFZvMXJKVXJGUHhN?=
 =?utf-8?B?aVFHYUJUU25FMHlSQWxyN3FtUThFSVpjOXMzTjBWbHhCNjFyU2dHNHFlYk4w?=
 =?utf-8?B?aC93b2l6SHhNLzhrcERKTmdFMzdYVVBlSTZab1BBb2NuNlF3YXhaY3NDVFAv?=
 =?utf-8?B?b0Y3SjdiU2pwa3ZsMk1tVnozc0lTSHcrRDFUYmZmeWdpUVgwUEpSYllrRHJv?=
 =?utf-8?B?aExZUElRYjIvTjJKWWlPMTd3ckN2cEc3SmdKS0tGaG1STFJVTTRneW5PQTlk?=
 =?utf-8?B?bXZxTXkwSjZ2WVFBRk1qVzkwcmVTRElPVDNSYS9FRzZ3VXdCSzVlK0Ruem9j?=
 =?utf-8?B?MUwvZzZ5MDJoRDdLd0dTeGN1cHZhNENWbGxDblkraWRXUWFWL2J1WThhYXFl?=
 =?utf-8?B?NTNISUpLMVEweEpEY2VDQTY4WWlubnB4b000dWZ2alN4UFhFaHUweWVJUUpR?=
 =?utf-8?B?L1RXRmJQektjWUdZcngwQnRqSVVBd1ZycTEzUHo0YkNQd3VXUDg4MlRpMDNi?=
 =?utf-8?B?amc1WTZjK1dXdkwxVmtnK1M1bUExUFp2SFdHVURRWHBzbGpxM3BWaTBtUVIz?=
 =?utf-8?B?M2RONEpzRm41dTZaRU80KzllY2JBUkU5QVZPSnhuSkgyZDhOMlVONjBSTUNQ?=
 =?utf-8?B?YkRqVzQzNm1tK3BQNFR5cGZVTFUwbldBUXE5WVllTGdPcnRPWk95V1MyS2pT?=
 =?utf-8?B?bGtLcWt0WFVuSk9vd3Zzb2Uyb1duNkMvamlxMkpmNndHQ3p5R2M3MTRRdDEw?=
 =?utf-8?B?N29SdnZoTlpuc2F3WU1wdVNmbWF3bnVhUTJsS29LNDNrdTZZMThEa3JrVjlO?=
 =?utf-8?B?UTIxQTZkeUdjTEsrQ1JBSlFibDg0UHBHZEQ4UnR2QzlFT2I0NXJTNjR2VzVy?=
 =?utf-8?B?R2FJV0tkSENDRlA2U0I3TVBvaVhYR0orOFlsalE0MjYvK3RFaE93OFcyWGhp?=
 =?utf-8?B?akVTNVZjMW1JdEZGbVNyMWt3a3Ywb21SVCt0aE9TZTJ6Znd0NW5MenhydkZC?=
 =?utf-8?B?QS95Rk9LNjJMTWtrVklVRWNuNGxvdkpLUUJPdGx3R1VRdm9vbEZseHhub29p?=
 =?utf-8?B?c2YwcXk4dWpkSUlKN0RmbkhqdGozSkZHSmhoWUgwYXJnVjEwWWphQ1pTWVJw?=
 =?utf-8?B?TURQWnpZN2E1VVlEWEZkTGc0ZzdSZnpEVFVmTjIybStOeUNuamVueTJRNlB1?=
 =?utf-8?B?L0oydnF6aUpJVXd1ajI2M1RyUDBoT0swU0RteXNTb0p2dk1NNGpTNDVYRi9a?=
 =?utf-8?B?bU9IdzF0cS9iZlZOeFRHNDVmaUplWDlsWVNjRU5iWURsMzdHTm4vRnE3K1Bk?=
 =?utf-8?B?UnhORjZtM2ZHSkFERy9GSWhaQmoxaXJpMUFwZ3lSK1FHa1BmalZYamYyZERY?=
 =?utf-8?B?bXBXWmthYXVPUVlJL2lkL0N1MndGNm9tcDcxUXppN0NHMFlwSTJacVRNWXZS?=
 =?utf-8?B?T2JKODNLem1kcTdXWU5nQTNXMUxZVmFnWjcrVE16TFhpeHN2cVZJa2M3OVFS?=
 =?utf-8?Q?O2gQtFBPV8w8Tjh0=3D?=
Content-ID: <1DDC4861F88C1347AFCEEB1FD0B20590@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1ad577-6363-4640-f1b9-08da4d7e17e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 20:48:38.7885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRFl+eRDKC1fPMYHBMnnp5EECBmENbzXHetvngpv6r/Hd+2t6k7PTFzF3QOKHpWUWdnHRdwBafo0z+an9/X58Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1546
Subject: Re: [Buildroot] [PATCH] package/bpftool: add a patch to fix cross
 compilation
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
From: Shahab Vahedi via buildroot <buildroot@buildroot.org>
Reply-To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout,

On 6/13/22 22:21, Arnout Vandecappelle wrote:
>> The patch file should be git-formatted and have your Signed-off-by.
> I simply took the patch from [1] (which has your signoff) and added
> the additional Makefile.include changes

Thanks for the tweak. I overlooked the "Sign-off" part. I used "diff"
because of what BR's manual suggests [1]:

  If the software is under version control, it is recommended to use
  the upstream SCM software to generate the patch set.

  Otherwise, concatenate the header with the output of the
  diff -purN ...

The proposed patch was made for a tar ball release that is not under
any version control per se. With the hindsight, maybe I should have
checked for "v6.8.0" as branch/tag in upstream repo.

> (of which I don't really understand BTW why they're relevant for Buildroot).

That extra change (setting "HOSTAR") is necessary, because in upstream
that was already taken care of before the patch submission. However, in
v6.8.0 release "HOSTAR" is never initialised and the fix is actually
using it.

[1]
https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches


Cheers,
Shahab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
