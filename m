Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9353C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 09:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BDDA4088A;
	Fri, 10 Feb 2023 09:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BDDA4088A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HqGh7t_MrjO7; Fri, 10 Feb 2023 09:17:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A750408D3;
	Fri, 10 Feb 2023 09:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A750408D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 924BD1BF2A2
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 09:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3828340227
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 09:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3828340227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6mVf5kho6oV for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 09:17:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17582401A3
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17582401A3
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 09:17:49 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31A5obCk025060; Fri, 10 Feb 2023 01:17:49 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nhqgck547-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 01:17:49 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 475D64007B;
 Fri, 10 Feb 2023 09:17:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (unknown [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id DCEACA0062;
 Fri, 10 Feb 2023 09:17:45 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3128C800AA;
 Fri, 10 Feb 2023 09:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZgiq089mb8K+nvBuJczzdCW1orQf4/rzqXpZr+UU5YjACMOcLiuQI2yPnXUTeURh1m+arYmae96cTU4NCXu28VdDGFOXl+Bzn71tDx/sbmfoAUTV9h1zYosU4wti3IDZ62q25z+coD3yoaWruFrCQBqjLEWfCXphQpKBr8EYcPD1FhyaBv2R1Qtr/PgiT8zWrEBRhLDkfceysdw5QoZbbp0sDKygNfwsza+0mvu8NO5VAI6Vr5n6yTaNxd+pJwMyKHQCFx9B9kl0fSYR2dxlF4mq38SDLMo0O/PxSEw/P3/LljRnwdEzIEzSJm3ev8g2aALXq74DZADMsatABIz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZutnwfK0fI6X7CsJNWEARt2XLEqg6eUTaeTh4AJ9ac=;
 b=WQTwf3CCx1ot+O2PYV5YBZW40c2GfApimej+BrLI4gKWWALi/OTG+ufLyvUTVDK8QEfja5lYd+AMxvr1nu2fUfXYkWflnJFuwr96bTWXgUKqRy/bJnb7xXjm5gYsIP6NTSjRuKkyBDoyKD6y0FpDjDqNstKqxhXG9c2dhC4fWPBzoWLzYSogNfHgRrOEL8N5h7N+IyZzzK/W8c8GagDerhbzTylNGaIrN1S+aZSVmUw/RNUKTZ+da4+VumWmlRM6vCtLS18Pz+4pUldRfR9fVNnpOTvEaEbpqGKvZPqgqkmB12I4PXEINfp8WLel54v1f7QBr2qyrXnXo8xRn2TOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 09:17:41 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::f311:9706:76be:bcf]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::f311:9706:76be:bcf%7]) with mapi id 15.20.6064.036; Fri, 10 Feb 2023
 09:17:40 +0000
X-SNPS-Relay: synopsys.com
To: Arnout Vandecappelle <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
Thread-Index: AQHYgKa1M48yKL+fGECWDKsB+ehK1K7Gtb2AgAFLvgCAAIb+gIAA10UA
Date: Fri, 10 Feb 2023 09:17:40 +0000
Message-ID: <9a8b4ac5-6ffb-e8d8-3587-2768e004780e@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
 <fce2f167-bd7a-8b93-41ec-c7c339ec070f@mind.be>
 <b98c7a16-ea21-c398-4045-0edbf46caa40@synopsys.com>
 <1750a14f-36a1-fe51-1452-3a72b84979c5@mind.be>
In-Reply-To: <1750a14f-36a1-fe51-1452-3a72b84979c5@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR12MB2782:EE_|MN0PR12MB6030:EE_
x-ms-office365-filtering-correlation-id: dce61fb6-3d6b-4625-94ac-08db0b47a8ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rH8VlW3C+dZfMFXVvlJXHnmOWIh5riJMZvFQumVYnC+43l2SRzqbXEy4oufcGQoNW5qzbq9h+jQd3zjfTaRSeJvjpfd8vhfOXLyUGKHmnGpbwv4tfqFtevEyxcm8X0DXmdizIUwKvXPhOtM3islrDlxHnEoDYY3n2e/1vs44K/Fh4rd0QWCOYyAz9LQebTGIAEhW+j+/uIM0ZFGqPX8Uqw6Sya0Zs5UhyXkdXPYeyeyH2aSSscExKaXuWrP11kHr5+ri31+vT4vcWp426QP8AvnW293aQwBvQmJOGJXPMn0IhzdK2elyWE63LtOWuh7G1JNrqv1BGYyE3KZJ8Qa4uV7t5AGRyyveEozJWICVU9sQEAWD08HwOCLtJID3iH9ylHFGB4ZKo0kkVfI6DoTZN0X0PJpQ5lHwc4qZlgBomFjvys6NxLUtc8GnQ1ZP1i8iktojCbYK4j5WQu5I/60LYW6LjJlQvKTws7dj3jcL9as7D74ywWaZIQZFlh/3cNmeysuO72Zz4sxDCicGYrb9uOMrKf5oSzq53gaVkDyxvPaq1A97MNyBTPSss+HbqZdGjGqRfy8NHXgEAvHUT6ETXKbnKuwCkrBItPu82/HFfyyko97ZLWKiapEfE36rdd257dYKkviN60ZUyqDMj+lW7TePxTMSBoraK5k4CC9XKYkruKm+iSYZw4hpJyYBEwiKy4n+02XueTWwB1ZP1M7B6609Bbyv+9IbLibLimDmQ6ZHkFF9pklakrNJrlx6LFAlRTDseB5G62iT6WklWTX01TsRLZT5MlfCJmKqAXBMkjOeoO2yRjsNDFu+tf3If1hs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199018)(71200400001)(53546011)(55236004)(26005)(186003)(6512007)(6506007)(2616005)(6486002)(966005)(478600001)(4326008)(8676002)(6916009)(54906003)(107886003)(31686004)(66899018)(83380400001)(91956017)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(316002)(38070700005)(86362001)(41300700001)(8936002)(36756003)(5660300002)(2906002)(31696002)(122000001)(38100700002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFFwL01QUXovQURCTytrazlBSEdhd20rQ29YNHVqRytUOUtFWGJRWlY5VkNH?=
 =?utf-8?B?cVhDejZzdUJJaC8zUDhGYjg4a0Q4Z2ZINk5NUGR2WW54Tmp6bUVZNHZzQ29t?=
 =?utf-8?B?aTB0NHFpYVp2NkdITVdPQjhFRUtXWGpud1d0c29qbzcwNmdGcng1TjJJSENp?=
 =?utf-8?B?dEJ0enNNcnNLSVpmVngzVTZuVW1GanlmczFaTDBmcGRHM0JMb2xKemFJd1BJ?=
 =?utf-8?B?azhqU1dpUVB3ZVQrdHphQ3hNUDVzczdodU5rc2xWbU5LYnZsWmQrM01jak5C?=
 =?utf-8?B?aU4vZk52eE9zQUJlMmIveVFtVlAzVzJxNWlhYTlGSWNHM216ckE4OU02RVFO?=
 =?utf-8?B?cTZnbGlMZDRqaHpUWXVoRmY3eHFxUGdZVHlOVWhzd2VXNlVRc01sVmc2OU5H?=
 =?utf-8?B?d1Q4RlF2ajVXNHB5NUdVd3ZoZ1paK0grL1NKWGpzNzJwYlZEU2VzcXFBZHVB?=
 =?utf-8?B?djJEd0NQbldOQW1JS2YyS3MvTWxLWmJUbzNNVDdod3M5MUN2ZVYxK3RXRzBv?=
 =?utf-8?B?QW8vN1krdnR0RlZ0TVNiczIzSmJidEJ2UU9nQlZiZTRHbTFWdW11eGQxaGc4?=
 =?utf-8?B?RGxMczdYZzEzVlltNCtMY2t3Y00vZ05nVXQ5Tzlpd0JyQ3hBanE4ZDc3Z05T?=
 =?utf-8?B?bFFTWW1uelhxdjNTbEF4eGQ4T0paZGt0K1p3MTlrTkZlRjJjMHNEZ2RyZkQ3?=
 =?utf-8?B?QzhMNUxhQkp0SlBDTVlOZWRHbGlUREZycWRNVlYyWVE0ZTRMUDhDS0NvOGlQ?=
 =?utf-8?B?dHp6b2l1YkYyVEN1aWpzM0tkeGUrZWNycWZlNUhTMDVndlhqUGFvL2JVMmV6?=
 =?utf-8?B?MkhnbzhKMWVtWTRCUTU2dWdwNUlLeFlkSWZJU0g2OUpCSjRNVjNLdW5WSnV6?=
 =?utf-8?B?RHpPSTgyc2FxclhldElqQ3IyQnI1SzliOUNZdlFxV1Q1aDRHVDRJTUJoRVNT?=
 =?utf-8?B?dWZKZXNuVCtwa2Y3TU9CYkFadFlDdlZIdVA2Uy82YlFjZmxmS0MrVDFScHA5?=
 =?utf-8?B?Y1E2ZjI1WkdtSWJuYzVwL3pnUGdCcTNPUlhLWmdXb3JZeTF4QUhiU1daMGMv?=
 =?utf-8?B?a2RpZ1RtMG1hMFNiS2xQUndKVUwwdGpQZDRweXAvZEpoL014SFlIbU93NG1J?=
 =?utf-8?B?VWYyeUFIdnNaV3FmcFNmSFBwQm1IbDY4T0drNWFWTzVidXdzVm5QbEczMGlN?=
 =?utf-8?B?RUxqNWRqVlRybjB3S2RqNnJzTGNvTnZLRndHYVo0VEdOelRrUFI5Y1U2R0d4?=
 =?utf-8?B?ZXNMc1NGdWlLbFJlN3NhT0ppTHAyYURyNGVWNGNyeEFPeFJodk5HWllHQmFJ?=
 =?utf-8?B?cVVkSGhiNDJ2QjZZaVFBbUNUeDI3NDVCYUdkKzFJVUxYaGgzS3BqazRicjY1?=
 =?utf-8?B?bGZaU3ozNDJVd2VBT1FkS25ZTnNMSFlmT3ZqT01NdjhXckZpdXRzNi91QmpG?=
 =?utf-8?B?SGR3ZTNKQ0VRK1hyZFhndTJWLzdZcEJqb0R1Y0NWZG9ZbVE5SnZuNTZuRkJP?=
 =?utf-8?B?a3VxNVNJQkl4dUNhd2xGY2lYM2MxdFh2OUFPZlBqNm1QNE1PeU9tN3pwVG1W?=
 =?utf-8?B?UzJUV2xNTE5ZMG1uSnlqQmVsNmxLRklxWnlrTVVKQVBabkhXVTdMQ0JUVzhC?=
 =?utf-8?B?Mms0QXY5REdtVGxyay90a0VpQkE0enZUV2FHaVJLYkdIT2hFVlYvS2gwSDJZ?=
 =?utf-8?B?bllvVVhoNk9RRVdTMFB5OWRDK3JwV3pQb2lwelVUeW16eGFWZ29tbnN4bEl5?=
 =?utf-8?B?OVdjYklUSzJTMGY4S2l0QmFlaFdqekFWaGFJaVBtcWwvQjhMM2hHdGs3MWwr?=
 =?utf-8?B?ckdhem9EK2Y0am1OdFpxZFpZQjFBS1hHd2o3Qzh4Zzh0T1Nxd2FqZm9Fc0NN?=
 =?utf-8?B?a29WVGNvbEFXZkc3bFFXL0JyVHN0VmF2WUp1dURncXpZdWJuRTk4dm8yWk9n?=
 =?utf-8?B?SUczcWFnSG5ZWlVINHNZWFZFcEpvbFBLK2ZIcGNYcW8yenNickNyMEdzU01B?=
 =?utf-8?B?RzlYWE9YZ2hicVlodGpkc1ZMeUQwUlUzN1B4WGtnV2h2UDRROWFreS9Danlu?=
 =?utf-8?B?a1BrSWRGQVZqTm1weFlYREhwcjJhcVI4dDlCazdRTUYrTXBwZHpldnlyVmdy?=
 =?utf-8?Q?sLfZEkJDGYoRmiyj5HLrNIRsu?=
Content-ID: <FD97DE6E093D9542BE386BE63EE33425@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6272d2PMKgZJ5iY6YGH2zgOkPVOcibIFRkktgk4cow86LW+sQvMHTUAQibDw/ojhl5MYE2hFs17dIVZwX1C7IATt7BBQPjFtnQkHyo/fEubT6dFQJ5RSqwshCU++lJ39Gpn+qE9xpcHQEx7SjoVYbfdCEnLe5bFBMfmiaQ5qxo2YOI9DekD4Ei5YoYSaKXYF344bTZ44evCfVG2OIptEkFaan2YSg2Yk7Ijl7kDUXX5GgH5yt6+0fDpfTo+dZlIay5+GsiWx06B/ARZ7gOjyRBucw+fvjLrTSZAEOM9CIE3RdWqJ0wFnIyjn4OlRjuIh0nYoJPhSeoPIyztMq3SdS2ogIQE8fMRmMVZZmPu8lQDZRgGPWBHSmKH+FRwdxlyb3OF5fABvXt5KvLhQt9f0sCZ4Fg80Fj/xuMOKtS47csTd3UaAd5MEjlmMJFSBwJ8Joy7j5UioINwvtamDGhJn3aPUdUD3k60o2Zzz3S4Q8584T53pdMqMPkiHH7dmGigskTPthTZbN8P6sXoMwY4vBpeHGs+LJLMy6rOYyGzyBiUh/tjw1165yr79/5khMDD/WPEasuE01YCVkYuIVJcH6WrPkUreACgk2J8HqN4v/qI/8samLMDC2WKrXcUh+cDY7610JRH2uqsZUoI95Nb+5iQ+SZGz6BrFsPLTDWpWTYhuiv7ay5RB6CAVLya+WcezhLjLsys4w2Jf/wyqDUaqj8n9VmhRo2ToWOrYEK2d2NRmVaqhpOo8rqXsVJSpgzDO/Y9iv8BobN78pjn4xFo2nzUYmMP6xVdE9qDtpu4BDVFHe/ly29e775jB+dcg7lJj3n159JPsTB6agbmi0EPVVaEq86ROIhaZRatqf5z/IdVxsnA3Prw4u4ku9wMUh+tz
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce61fb6-3d6b-4625-94ac-08db0b47a8ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 09:17:40.7117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRj62Gi5I+2kPJGHj6Gb2ebVGg4XGfKuEeu4ukeWFDcNq9dy4ZNtr6s7pEEzrfmjzjjmwiKout9XAqGxnXp12w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
X-Proofpoint-ORIG-GUID: dbcLUqL11jdH-foX-UL28WMnd9I8kp5l
X-Proofpoint-GUID: dbcLUqL11jdH-foX-UL28WMnd9I8kp5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_04,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302100080
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=PZutnwfK0fI6X7CsJNWEARt2XLEqg6eUTaeTh4AJ9ac=;
 b=uVXvvU7Hv1tc3Q2nkfXlMPebMxZEjwT65PY//REfeYW239eC9s6wjtxpw60E/N4yeUqm
 FzMYlGi/CcW2MdhDeKWZo4xiviX7Z2W1KZBwto57JD8auNSrZEaawYpQIE/VXK2BKBhl
 uZErfLRLoq+yAWV7T8LX1eLGcKwEqH8ZWTq0Ea7wUosWMJx2iymCJ+RUiDfK6Sf7848v
 ea8SQSu62vgzubZoNi9dGJIJ06jrpXrY/niKXWeU227Rd5FmN08fYzcdriTzHYyHkDNb
 S3EC5yoqQX3MHoFyr0A29OAyHrRQDsHGWli2ynJnx9Q+Lm+PU7ZSMqib/5JpXXk5Hgz7 8A== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1676020668; bh=PZutnwfK0fI6X7CsJNWEARt2XLEqg6eUTaeTh4AJ9ac=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=kVGeKKFqFQX+uqJMeU0DUvSEIIydOErRC2JEls2FY7oJltY8pI9xgO/V2lfMCxx9A
 U276CC3EwbPBcLuynT88B0hJBplAhi/0lhNlf3tdxrxkitpbemeFFkXVjAUZMzihrW
 eku6YN7vUYNiQ6A7tgZBPsgekmkUKDs9GvdTIpgs7/RsXatgcYevmgT91kOadp4bQV
 xAYjng0WVvUifZSZ+A5OdzQsSsw6ukKPAxDVSxNUOdQjOY2ghVii+R3A2XtPHYW8+L
 Wl2jRiFDR/wxVo/rvbV9yjmkn6TNXIW4lwp6EEMpLVumfxHyiaHcY6fqn8bhVRKx55
 C0hzKIDa8bjeQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZutnwfK0fI6X7CsJNWEARt2XLEqg6eUTaeTh4AJ9ac=;
 b=kWZQsUn9FFmMU612D0syFsBzmHH35E+1Xw60oTJavghbTk4Cfq3WfiHN6e7cbCw3F4gDGO1hpDWDQ8QYJ7fU2//S/UAHJsfc7Yj0vLnfhWX7Ncyc4VTJfbB1YQ0m7MqDIoF9swoOXaXro8Af+2+WGCwO66HJX2UcoJCYDF0nTuE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=uVXvvU7H; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=kVGeKKFq; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=kWZQsUn9
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com; spf=pass
 smtp.mailfrom=shahab@synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="kWZQsUn9";
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/9/23 21:27, Arnout Vandecappelle wrote:
> 
> On 09/02/2023 13:23, Shahab Vahedi wrote:
>>
>> On 2/8/23 17:36, Arnout Vandecappelle wrote:
>>>
>>> It's not clear to me why you did a revert of the cookie feature rather than
>>> using those patches. I think the first two or three should be sufficient to
>>> fix your issue?
>>
>> Ideally, the correct way would be applying that pending series. But since
>> there were comments that some of the patches might need reworking [1], I did
> 
>  I don't see anything in that thread about rework being needed, only some
>  complaints about some mail gateway encrypting messages so they can't be
>  read by some recipients...
See this [1] and the response here [2]. Having read it again, apparently it is
not such a big deal. Alexander, the author, mentioned that he will redo that
part in v3 of the patch the way David suggested. So either, I can make that
change when submitting to Buildroot, or take it as it is. Your call.

[1]
https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#m42db58567febf12040f6ba0478e1a6148c284c55

[2]
https://lore.kernel.org/bpf/20220421003152.339542-3-alobakin@pm.me/T/#m293896646128262621c83e8c15c4d977f92ad0d2

>> not feel confident to add them. Therefore, I tried to keep my solution minimal
>> and solve it by eliminating the problem. I know, it is not appealing.
> 
>  The problem with your patch is that it is very difficult to decide if it
>  should be kept or not when bumping the version. Plus, some people (or other
>  packages) may rely on the feature that you remove.

I can try to apply that patch series on top of bpftool-v7.1.0-br1.tar.gz in
buildroot. If it can be done fairly easily, I will submit it on a different
thread.

-- 
Shahab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
