Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D6EC55184
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 15:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45CB940524;
	Mon,  3 Aug 2026 15:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtzXWXstTkEc; Mon,  3 Aug 2026 15:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C14040546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785769208;
	bh=+Ryy3MiDRG4DEvsG5Tg9vDQ80lxFhMIAc5elmeREBYc=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=j6jzTIjibTMW2V2B5YYn+JG8mv8xRHRNnOIryjUuse5GzMpWLS0jvSNcmvBMemeJI
	 03siZkmtbJH6m/tsT2CBl7zBrpY6AbyYrs8vMw+I94f5rvE71fyJ0gC6PEF4Q7eGej
	 dadIz1n2dvyU3VgkWTbx3mM7BiQRjnmV34JwMyZGze7IkF0WA/zmYaEzgIViFtYpSh
	 spXJhxBS9e6kn8xO2LuFZcbS24YISABP/9xpq6TsyorARcfXhhAW1fUwIFxv/gazH/
	 yB2iENybwEPSsUUWI5hqy/jVz8H/Ut5P2Vj1iFNdyEtEt+OuuxPrvw5GpChgLGm9Gy
	 hoeabFd2R/KYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C14040546;
	Mon,  3 Aug 2026 15:00:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA28B2CE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C4214008D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JbREwF6c-VUM for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 15:00:05 +0000 (UTC)
X-Greylist: delayed 322 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 03 Aug 2026 15:00:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6162B40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6162B40042
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.76.20.194;
 helo=ewa-mbsout-01.mbs.boeing.net; envelope-from=matthew.l.weber3@boeing.com;
 receiver=<UNKNOWN> 
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net
 [130.76.20.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6162B40042
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 15:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 673EsVjR021085; Mon, 3 Aug 2026 07:54:41 -0700
Received: from XCH16-07-05.nos.boeing.com (xch16-07-05.nos.boeing.com
 [137.137.111.38])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 673EsRaM021013
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 Aug 2026 07:54:27 -0700
Received: from XCH16-07-01.nos.boeing.com (137.137.111.34) by
 XCH16-07-05.nos.boeing.com (137.137.111.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.69; Mon, 3 Aug 2026 07:54:27 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-07-01.nos.boeing.com (137.137.111.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.69 via Frontend Transport; Mon, 3 Aug 2026 07:54:27 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.143)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 3 Aug
 2026 07:54:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=G3X6Vy3DRCYr/x8u3XOfPciZPQ0JEVyxLDptyYAikc6IsvtmK9m5uK2cISgYcVSPbEYw2Yh/dQX/0nKjK+vNRPg4M3MqMFBqF5B9+dQwPjR6smfRQ+I2YPz+rst2RUhDYeRtDLy1ayNWaYjLH3zjzuQokMQuYVuV33UuR6Xx8ZJEki+lZlJJAlEd4CzHJgZWIVBbZynUdNhY940lAGeLUN3OMaqFKcSBeR5R7USeahTmW62r4go0R1wJPoThDKslxT4AODH2QkqVIYwJz8fCZgkqgQoEDBr8F5dgyswVPClrH9SWcxSqNZn9ndVNlrh3+BLrFLdUZ9Z1EiWg7dT/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAyOf8ZRIT0oGacVguG0YkCsKHsufJySfXpTfoJHE8Y=;
 b=lvoFH6nnvQsspIKtq3bIMTLxZOhVMsAOkHDeCJBfveR887E3RT4hYHKmRzK/YKNZaqwRy0QOaPRvGYoRuWXRpWQvJa/QvDiidWZT61EQ9XxYkacQeWuqLgg8fgFawV48sJZJMVifzMVhWii5+dccGTLPU8CXurDnkEmrdvGUVGlvXRWyNIHB8lQA1Dn06eck6zMGR/JqolBhSTVX01Q6xO606exYCjYY9PH88/2f9ythTf2Sd3E55FNc4kx87Qp8tY0JQuydUl7XKWO2Rf1cO7G62qtNfk6OvLO8gXcSQZSeaP8Wq8sDuDYCfdPB1/X+NS+ACHs2GEBVWltTS9GWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19c::7)
 by BN0P110MB1228.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.21; Mon, 3 Aug
 2026 14:54:12 +0000
Received: from BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932]) by BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9d97:573f:176e:932%5]) with mapi id 15.21.0223.017; Mon, 3 Aug 2026
 14:54:12 +0000
To: John Ernberg <john.ernberg@actia.se>, Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 1/1] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
Thread-Index: AQHdI0Q8qaDMu2DNRkmxuO3Ndvv/hraMZAUw
Date: Mon, 3 Aug 2026 14:54:12 +0000
Message-ID: <BN0P110MB2067D19314554DE83581844FF3D5A@BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM>
References: <20260803102918.4064744-1-neal.frager@amd.com>
 <20260803102918.4064744-2-neal.frager@amd.com>
 <96913e91-66ba-4b38-80de-523dbd8f74f5@actia.se>
In-Reply-To: <96913e91-66ba-4b38-80de-523dbd8f74f5@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2067:EE_|BN0P110MB1228:EE_
x-ms-office365-filtering-correlation-id: 82a74db1-fe81-4b0e-2539-08def16f14f5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|23010399003|366016|38070700021|6133799003|18002099003|4143699003|56012099006|10067099003|3023799007|22082099003|41080700001|15866825006;
x-microsoft-antispam-message-info: sABfkJat73Z05r+mR/5I8OpvCn57OjArjeuDypVmdY1Ruj6Xah3iDm1+PBSUz0zhGxOlTjo4lExOuSnR4HBoByI2/UdlSLWU1s1a8136WZwWln25i8qLHDKa1s5g6Y5wV4NNk9oiza+6YfJpWcF1NLwtvldjvGWJzbLWw2kUUDghv867U7BioNf0i+2puoiCPbTJhQbfNkmqiau/BK6EsWpQQeZcBic7KeSDwIhnTXv9vctOncQGjJWLlT2kXilxRxl/1B49VUbpBciqbPVvNuknZin2tiG+0tPW33RiOeh+AI1L8rs0bZKzD0ybxCpvl+5/SMSkcjKD81l/mJyeAy3zhHQYNrUuyL3ChxRYCHYn9qfbpxvea8zYXC0WK/ZdApUNmwraaCSsw4dGED8TVoMnNwkVxU7BHg6UGzfmSKrGta+sXYL9l4SUPSh8qgooxaSsLgpUKZ6P9g8ITPRkX2kyyBWv4rbinde6FuE/3addkMfkmxqW1uylOUhwcsMz92GryWIV2R92KZAgibxXevFsFxLemOpkyqBdeG16Oaa8Yu0m+BIYXjT1cF07X7qum2t+kAQIoYctmbF/jf364DrRq14tZynfoiR+Fw/34fUmAOSViZj7jw3HFmNfQcKlclRVwlu1uiPWAv+yQcUbmvOBzi+6ngj+63Ef9d+tnsqV6jZq5L0k7oq0tthkfeTCSrMSSPwnkdvfLvEW2gO2Xb/WBtSQ3rZTLbgc1GLAFqD2JjDlb8VvkZ0b2sj+AJaS6jwzQfIo5u83boTVFRmTRho+RgTiaw5BtoWh2jyyNWs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(18002099003)(4143699003)(56012099006)(10067099003)(3023799007)(22082099003)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eU0zK3ZxZHEwNm1zdTBlbTJ1RU1zbU5VSHdOc1JYSnlYenlJSmcwMGVibXFZ?=
 =?utf-8?B?OVg0d2tqVWhLRjJZYktRd2RZU0tYMnNYb2VRbng1YnZzSWlJUWVLaS80QzdQ?=
 =?utf-8?B?OFRtQjRUL0NrNE9YY1FIUzhtV3hGOVEvOWtPT0lCZ2JHT1p0WjA5V1g5S3ZE?=
 =?utf-8?B?eTZXUStuT3pDSTlMNHdhSlVOdlFLMEhQUGowN0ZGNnBXVHpnQVZ2WmVvbnp4?=
 =?utf-8?B?SDkzdWRZNm94OTFCNkR2WkJuQWdkZk9FMFZEMzk1bU5OOVhlWEdncDlIY2Fq?=
 =?utf-8?B?N2I0UUhBSGtMWmhWa0JSR1YybDRDTjhVUHE2TENoYmdTRGFWOXVPQW1HOWQ1?=
 =?utf-8?B?TEpNeWFXNy9iNGozUDc0a2dzNTRwc3h1MUVsRWtRL05CT2dEZVJWdkNtTnps?=
 =?utf-8?B?YzBlTFA0c01BQk54aXN4YnMza0JtUU4zYkx4d2pFbm5DMkc4ZHBvK3BxaUVY?=
 =?utf-8?B?Y2Z5a2F6ZjR3QUtuVG4reW5RVnJHV1ErRE5VMGg1NzRWMFloUmF3cjIveTk2?=
 =?utf-8?B?b2VNOWdwVFQxWThuUWhpMGgvZ0t3S2pjQ29STHpIcVlPejR5YmZPcmt5OFkx?=
 =?utf-8?B?MnpabWkxbG9IaE5yenZrWk13eTlPZWE1MFdIM1FDTmxvMFlrN08vYzRtTmFB?=
 =?utf-8?B?SkZQTy8xUjZHa3ZqWDlJWVJIVnNrZXFOMnNNWHgydm96WHB2NmZqOVpLTHF5?=
 =?utf-8?B?dWdMUndJUW14QUQwSDNOMThpY0ExdjVGZG16bWdVS1ExZVkxVUNBNjM5VjU4?=
 =?utf-8?B?WWxXNzBWYmNZdks3RnZhbFExTFJtbndLY0Z4VUE3TnpKRWJEVmgzR2g4ckw3?=
 =?utf-8?B?Z1ZrT2lnZDBxSkt4djd6VDJBT0pidU9SR2NRc09TT3pzMGV6ZWlDTzFBMUNK?=
 =?utf-8?B?Ui9EbmJsNkoydnJGNkY2dEZqOEZhMStZeUhQT3UwbEtDNHBjekNIY3FTNjNS?=
 =?utf-8?B?Y24rQi9hamZ5eDBVS1hTTXJhRmY0eEwrWGVKOXFFRXU1blh5MzdndmhJaDZw?=
 =?utf-8?B?Yjd6VW9nRyt6NVc1Zit5S2psZS9xUFZJWDg1dmYzczMyVFM5b3Fsek41Ui8w?=
 =?utf-8?B?Rzc5VHcwNlhDN2JBckpRckh3MFk5eGFrS1ZKaVhHNTlzYTRhUlF3OXZMamsr?=
 =?utf-8?B?WDJjV1FKNW9jZVc5cTNmcEFCU2pPVG9rN2FjM05HNmJuWG5UcE9HWVdPWHdj?=
 =?utf-8?B?ZVQ0a1FFcVZjMy9JanRUa0hFOHd2NTdvRC94UWRHTUEvRitNMEJPamJPM0lw?=
 =?utf-8?B?NU5NQ0VvTXk2U1lYRXEzemNHS09nM0pDWTYzTDUyRzZJQnJDWmt3aEJZZ3oz?=
 =?utf-8?B?ekpHVG1LT0FmTFgxN2thNnExU2Yya0NvOTRWUGlVTnVoQ0NpRkExeTFGT0Yz?=
 =?utf-8?B?TU0zRUI3QWlncnh2QnV1dkszRjBUY3kxZUhyU3Q2WnNKVmlJZDZISjJ6TjVG?=
 =?utf-8?B?dFFpYWZuQjIxL1JXVkt1cE8yOFFNcWdvREVYVGx5VktrdEpubFU3Y3dXRzBj?=
 =?utf-8?B?YTUrTWRMMTNud1pqOHBDLzhMMVhHaDRTQzFFRHFmaHdya216MWltakRwdGRH?=
 =?utf-8?B?TjI5cmZ2c3d0WElTSEVKNlloaXFiR1Q2amx6V1FvTHdiRklSektoaHhlNzRW?=
 =?utf-8?B?MFI1K1JlTW9wTkpOR0IyTE56L0RCTUcxUXZvTks1a3ZVVUlLMUx0VGtGNnkv?=
 =?utf-8?B?M3Rta2FUV0EvVE14V2NWT0wwWlhsR1E2U0drRzBRcDV2MFhtZ0pqNVFnN0ZW?=
 =?utf-8?B?UGtvalY0TXQ3MUI0UWNBSXRuSHF3aTR6VXI5NHJMYUxnZko0d2VkT3FPRVF3?=
 =?utf-8?B?dXloQkdsZUxJZ0Z6UzlJdTNTNjNha1pHT0ZqNlVqU2FlN1kxK2JiUWhWb0cw?=
 =?utf-8?B?SGlBQmlqU0NKTGFGcEZKd3lpUit3T0haREEvYUpRaGtkb0pnM1UxbEdWY0gv?=
 =?utf-8?B?MDNlQlNoNGNHWWZMN2Y4ZmRCZ3NSMlFzNkx1NXVWbWlnOEZTdko0MHMxcTNm?=
 =?utf-8?B?QmswL2cxQS9IQ2hmZXJwSXlqVi9Ccm95OHVMQlpMUnRCd0dhNENQTG0wei9l?=
 =?utf-8?B?YzhVaUFOT2NwaWFjMkowS1RXNUNhcWRXcWdUZEVwcTNVbk1CYmdWWVRkaWFS?=
 =?utf-8?B?VDdaTkxvZmkwVFV0N1FMKzNXVU96N3dyc3JXajRVUWgrV2R1Y2NuTGpMMjE0?=
 =?utf-8?B?bGRTVlJ1Uk9SZThJVG9LRlhEZWFWb01KS2VsZlQ1WWFuRUQrd2J3Mmlrd0RO?=
 =?utf-8?B?Y0o4SnIrMHVFdHZWQ3Y5cDRBK1VBPT0=?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2067.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a74db1-fe81-4b0e-2539-08def16f14f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 14:54:12.8047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1228
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.com; s=boeing-s1912; t=1785768881;
 bh=FAyOf8ZRIT0oGacVguG0YkCsKHsufJySfXpTfoJHE8Y=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=a9AjdbiV5cpTdLufdyBE/x1m+cOfuX/9jXlAZ36rbO7AaCuEyQ2mgbV6+17RUWAF9
 RK5mVYQozRLye/cvmKMONjAoPcKnbOiz0DMWeXc54k6M2rpysTUrt0KAJvH7m9gvXg
 Jdo7UH6KA6O0zAeGv3tGBY/ro756og/ldhD/HxElaSLCaikcNKwRU+oo1FJ3bNG5fj
 ZoxKDpL8D59acfboyw4r00HN61cUZk/FtmVPKifyH/ldXkCs6BrmKLAyAMObGDLftV
 4TH0u9oAEfRJ/JeiP8w/c9G60No5Aq5XQJrINtY+J8VapP0uBWDGt854hbGRnPo+As
 yWj8RKK1VKLVw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAyOf8ZRIT0oGacVguG0YkCsKHsufJySfXpTfoJHE8Y=;
 b=k9eiuYn2wpDsUF5xbHPgzIzDY9eIa4o5WYCKlVAMEh8VMo9NyINwmzgux2RYpsYnlKgUHGf6aitAzSt48egYd9hO8YM1duk+wXUBhQ0u/kHfrclTX7eX23SgRft9eickIDuLTpdiP1HGbhQWwYM3ZFsS8OcMCYCCnulr9U9ARGY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=boeing.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=boeing.com header.i=@boeing.com
 header.a=rsa-sha256 header.s=boeing-s1912 header.b=a9AjdbiV; 
 dkim=pass (1024-bit key,
 unprotected) header.d=boeing.onmicrosoft.com header.i=@boeing.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-boeing-onmicrosoft-com
 header.b=k9eiuYn2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
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
From: "Weber \(US\), Matthew L via buildroot" <buildroot@buildroot.org>
Reply-To: "Weber \(US\), Matthew L" <matthew.l.weber3@boeing.com>
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "ibai.erkiaga-elorza@amd.com" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "micheal.saleab@amd.com" <micheal.saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "Wood \(US\),
 Brian J" <brian.j.wood2@boeing.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "stewart.hildebrand@amd.com" <stewart.hildebrand@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal,

> -----Original Message-----
> From: John Ernberg <john.ernberg@actia.se> 
> Sent: Monday, August 3, 2026 7:33 AM
> To: Neal Frager <neal.frager@amd.com>; buildroot@buildroot.org
> Cc: arnout@rnout.be; luca.ceresoli@bootlin.com; thomas.petazzoni@bootlin.com; peter@korsgaard.com; michal.simek@amd.com; ju.o@free.fr; brandon.maier@collins.com; romain.naour@smile.fr; romain.naour@gmail.com; ibai.erkiaga-elorza@amd.com; yann.morin@orange.com; alistair@alistair23.me; Wood (US), Brian J <brian.j.wood2@boeing.com>; Weber (US), Matthew L <matthew.l.weber3@boeing.com>; stefano.stabellini@amd.com; micheal.saleab@amd.com; stewart.hildebrand@amd.com
> Subject: [EXTERNAL] Re: [PATCH v3 1/1] package/xen: fix build error when BR2_PACKAGE_XEN_TOOLS not enabled> 
> EXT email: be mindful of links/attachments.> 
> 
> 
> Hi Neal,> 
> On 8/3/26 12:29 PM, Neal Frager wrote:
> > The 0002-Update-linker-flags.patch assumes that the qemu-xen files are 
> > included in the xen source tree. However, if BR2_PACKAGE_XEN_TOOLS is 
> > not enabled, the qemu-xen dependency will not be handled and the patch 
> > will fail to apply with the following error.
> > 
> > Fixes: build error below
> > Applying 0002-Update-linker-flags.patch using patch:
> > patching file tools/Makefile
> > Hunk #1 succeeded at 36 (offset -1 lines).
> > Hunk #2 succeeded at 185 (offset -8 lines).
> > can't find file to patch at input line 76 Perhaps you used the wrong 
> > -p or --strip option?
> > The text leading up to this was:
> > --------------------------
> > |diff --git a/tools/qemu-xen/include/hw/xen/xen_native.h 
> > |b/tools/qemu-xen/include/hw/xen/xen_native.h
> > |index 6bcc83ba..2590904e 100644
> > |--- a/tools/qemu-xen/include/hw/xen/xen_native.h
> > |+++ b/tools/qemu-xen/include/hw/xen/xen_native.h
> > --------------------------
> > No file to patch.  Skipping patch.
> > 1 out of 1 hunk ignored
> > make: *** [package/pkg-generic.mk:239: 
> > output/build/xen-4.21.1/.stamp_patched] Error 1
> > 
> > To avoid making BR2_PACKAGE_XEN_TOOLS a required option, fix the 
> > 0002-Update-linker-flags.patch so that the part that modifies the 
> > qemu-xen sources is correctly moved to a patch in the qemu-xen package.
> > 
> > Move this:
> >   #define QEMU_HW_XEN_NATIVE_H
> > 
> >   #ifdef __XEN_INTERFACE_VERSION__
> > -#error In Xen native files, include xen_native.h before other Xen 
> > headers
> > +#warning In Xen native files, include xen_native.h before other Xen 
> > +headers
> >   #endif
> > 
> >   /*
> > 
> > to package/qemu-xen/0001-Update-linker-flags.patch.
> > 
> > To test:
> > BR2_aarch64=y
> > BR2_TOOLCHAIN_EXTERNAL=y
> > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> > BR2_PACKAGE_XEN=y
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
>
> Reviewed-by: John Ernberg <john.ernberg@actia.se>

Tested-by: Matthew Weber <matthew.l.weber3@boeing.com>

Verified hypervisor-only build (XEN=y, XEN_TOOLS not set) on aarch64
with Bootlin external toolchain. The check-package was also clean.

Regards,
Matt

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
