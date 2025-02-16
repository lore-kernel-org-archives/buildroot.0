Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A8CC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 14:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A750980F29;
	Sun, 16 Feb 2025 14:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RB1__mhSjxic; Sun, 16 Feb 2025 14:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90BD380F74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90BD380F74;
	Sun, 16 Feb 2025 14:47:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7604DDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A01F6081E
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ih8wOD2jdsuM for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 14:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2412::623;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26A48600B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A48600B6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::623])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26A48600B6
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRGATUjVh5pKhPngV8vKbpSQhoTVnA3/JHsGvX844HYkZ4Ml+RjrKOyXy1I8qykoUNVQCcyjfW9/Y6PTw+LW2veam9RY1YC8g2bItnXuMC3mMZZXqJKWcDdRtszyz+sqVN4il1cUUnMWjFPjZGwRd2Zlp1ELZqfxziii+PQ6PQUzLG6sbSor+PZRyNJxQFl8JHAr8D8+PIWHjgtm1+Tbmf5HP09idddSLN8lrl4CdlgQJAQpKqi9r6VV06YQvJw9HiXBs+0l94UroJ48s80LLSL4wx4ieOkc3jJIiUntL92CaQtRkw/oSsfoM6sCBDU+ayUDFm5Q/TbNfGSyenqkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ1cM6aEYKe2V7p1sLh/YE8966use+dD49osef1uAtg=;
 b=OoB3lPoOUfiX6SOLhl0NWLzvMbUzwIglkjRgVO3VP+MnNfkIg3c+kbWTY99BVd8abFsqP2GDFiO0XLhISNRvi8d5Z4qUwtzn54Ovmuy6WF/WE4i5GgmJxKZVu/+PyP1Hq4uk6EBG74P8dLK0OLK6cCvyXCBxLzbU0KRlgVGjLT7kcoW7W6s9kk6KGHFdODHfr1CYKyTDwQHLFZq8/J2ae7Tiof9ss6EO2vaX5CVro0STrSaJcEXuvFcsiYe+mm/joT/1XkF9YRf/UFmpIZjjFmwcjSyxadvbYwAsLz7MiHfT1YL0tLMmbzRCl8E/1P9zwYoCYITrLxQfAlIck4WjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by PH7PR12MB8595.namprd12.prod.outlook.com (2603:10b6:510:1b5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Sun, 16 Feb
 2025 14:47:43 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 14:47:43 +0000
To: Arnout Vandecappelle <arnout@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Thread-Topic: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
Thread-Index: AQHbfwEU5tKPK+VZW06b30ul8C4XmrNHWSmAgADZeXCAAabggIAAAgpbgAAGDoCAACOTwA==
Date: Sun, 16 Feb 2025 14:47:43 +0000
Message-ID: <SA1PR12MB56159381FF71774E1B3D9AE8F0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
 <20250214225831.23731a2d@windsurf>
 <SA1PR12MB561562D664DF42BDA071B195F0F92@SA1PR12MB5615.namprd12.prod.outlook.com>
 <5649b489-e2c5-4504-a928-58409a547768@mind.be>
 <SA1PR12MB56150FD6D7047F9A6929919EF0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
 <67e216f7-9783-41f5-9c55-6fa224a7aa22@mind.be>
In-Reply-To: <67e216f7-9783-41f5-9c55-6fa224a7aa22@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|PH7PR12MB8595:EE_
x-ms-office365-filtering-correlation-id: e46a2d05-2b5c-4132-428c-08dd4e98deb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?c1BiUmpxN2RLMDBHb2NJWUZoeHo1RUhyVFdXRHBxWFBtUmE2NVAzenNPZUNx?=
 =?utf-8?B?L1YxTjFEeWN5OWNNQkNqNEExcitsQko4YU1vbWZWTUhOY3JnQi8yZEhDaERY?=
 =?utf-8?B?QTlGdjBvZUF1bXE4SnNESzV5SkFBUGNvZ0tPOWhtNGJpNkFwcjFUeE5QWERs?=
 =?utf-8?B?Z1lLTVB6eEJWd3ROV1FHUFlRcFhWTHdXZXg2WVRVbVpiSVRubzB0UzQ1Q3Bz?=
 =?utf-8?B?THg2dkdqMkRYUVJNbUZyYjFRQzRGSHh4VnFQN3lXbVlaL0RVcTJiQmhoTFFu?=
 =?utf-8?B?SzhWUVFUSEQxUXZPSnRVODZXblkvL053LzJoTXJrWFBmVzlqa0hSUkdxS0RY?=
 =?utf-8?B?dXNQY2RuUGNyRjBrVkRTVkZrTlBvbXpSUVBxZWV6TzVtNTBQNGdqZGRSRU1m?=
 =?utf-8?B?d0lLQ2l1VzlxNFVHYTlGTEE5ZzJ6ZWhuaXIyYTJCczF2L0F4bCs0by8rWi9W?=
 =?utf-8?B?UFlsVkN2TFBHcTk3TjdjSmcyalRaSWRjOHJScnFtSGEzUWdrWG9EaHQ5MHNu?=
 =?utf-8?B?VmJZbDdjalA0Ynp6MTJuSUFKVWxCT1lQSzByc25CMlRNbUxoK1NUb2RSaWlZ?=
 =?utf-8?B?bkp2OXE2cjdVNWhQY2oyZ3lvNDhPdTRMZVQ0eVV3eUIzMmU1cVM4UnVnZUJx?=
 =?utf-8?B?bWZaUVVXMlZoOWFoR0hxazdYWSt0V1JNcEk2QnBHVVBWeWsrbEpWU2QzZno4?=
 =?utf-8?B?M2FKTnB3VjFFVHE5YWsyOTVzcElrZXRvU0gyNGc0TnQrN3l4VG1SdkQ1azZY?=
 =?utf-8?B?NjdzK3pTMEovcENyYTBDQVpNRlBTY0VUTmxvQ0Y1VUI2ekpIc2tkN0xhdzJX?=
 =?utf-8?B?cnBUOHNpTUszdGZuM3ptalJuYmF3YTZ2MzFnSnFNdmwyZ2t5dklwdWFVS0tk?=
 =?utf-8?B?UGtVdjJyWlo3NHFydUVVNW8vWHN4SGI2aHc1OVBaeVROeDlMZythRGpNL1Jm?=
 =?utf-8?B?aVlyT0ZQbk1mdEJBdXlRSndMVUVGNmhxR3g0N1FXVVpHSXpWMmNDTi83Sm4z?=
 =?utf-8?B?ZVJOTjlKdFNUMmxFVVhDeTh5eWlHWjFZTGwrR01RTHI3QVlOcWRhMGtjcCs1?=
 =?utf-8?B?bGJNZE85TUdQcFA5Nm9jRjVEaWJ4MHRXeXhhMTB4VEZQQ1VLQldQQ1pLSTBn?=
 =?utf-8?B?TStUSnFGV1ZISi9sWGowajI4aUdBOWl1WWZIVVpNeDJrUjdFNHhoaHpqNlVv?=
 =?utf-8?B?WkgzZXZ1b0Q2NEVVRFpkVktRNTdCVzhaWDM1Vk1sZFJuYmdQOFJUSUZaS1Np?=
 =?utf-8?B?Q09wTUh4WFFOVkJydHNUaVdpanVzbTBHTm50MFZnYlRoNW91SFpzbWtkRVRa?=
 =?utf-8?B?VjRvQjl6YUxHRDZqdU94RWMwY2pNbnQzUG9zaXQyT1c3Qjhoa01sYlRKKzNI?=
 =?utf-8?B?aUdOeHZ3ak5ZSUxZZ3RxYUM0YndNdVZKclFta2pUMi8razBsTHdGNSsvZzZJ?=
 =?utf-8?B?NGo0Y3M5cUQ3aU91N2FFSzZtcVlYdmN4VXpPWExDMzd5bU44YWJSKy9QTE9p?=
 =?utf-8?B?ckM1RzhOMjdqM1krMzJBazJCNzk4bHRscy85T1pJcVA4bnNXUHVKK3BUZGRF?=
 =?utf-8?B?c2Iya0UwbmhIVXFodXc0UGRMUG9jOC9lWFo2cVZzbmY0enhZUFJ6MkZ4bFpH?=
 =?utf-8?B?VWRsQWlRRGdsNmxibmJJalFKMEJva3g5cDhiQW5mMmR5NjArUGNFWTFNNy9l?=
 =?utf-8?B?dWFFTzNtMkRFT0VvOVlJcE5PakpwT2lGdXRBTUpKeWdZL2JsUzFsTDBhUUZJ?=
 =?utf-8?B?TVMrZGJ2Z2RJaHN1K0dGVzE0Nzdrc0pzOWxWZ1BGcGVHRlMxM2hhNUtibG5r?=
 =?utf-8?B?bGswUXp1dTcxODhKWXR5SS92SEsyUFRTR0NnSjl2Umd3bys5WkthZGR2MFEy?=
 =?utf-8?B?N21Jb1NEdG1nR21Cbjd0ZnQrTmZqOFpTNXJYOTI5eU1xMXlaVzVPOVpYRTEr?=
 =?utf-8?B?YXRLSG0zQnIvZ3lJdGdBWjRGTUVyRTV4WFI2Q2VBc0ZRR20xU1l6eGNrUTRI?=
 =?utf-8?B?RUN4a1Q1QkJBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGhWVVh1TVVsbzZXOHNyMGVXcWJDaFArL1RSN2J5bXNpNlFoMDRYK0pqUHdh?=
 =?utf-8?B?bUYvUkJXTG9JRXFOYkYwZUNXWExIOTVOc1FZbGZKMzFXSVRlWHBMZk5ERDEr?=
 =?utf-8?B?YzBHais3a3NkWjQxRGtRNTltRDBOak9zTXhKYm5BclZ5M1JCRWpHcEFGRnIz?=
 =?utf-8?B?bFp1VGl5dGU0aG9LZHhEZy9nOHpmOWpLRjZjN2dtUi9Db2U1QWVIQUFXcm1I?=
 =?utf-8?B?M3gweU01U0drN3MvU2Q4K1FJUCszeEY3U05lOGNMQ1Q3ckJQYWlBa0EvL3ZY?=
 =?utf-8?B?VEpjb1hORWQ5S3o2b0xnQXphQ1ppVGczNkxHNkx4Ti9nR2hXRDhvME5CNExt?=
 =?utf-8?B?UHJTT3haVWtYK2h5RS9senY5UmFuWXNSSXJGSFBEbmZjWDVVdEpkWnduQ1kw?=
 =?utf-8?B?eExJL0d2cTlqNXZWUDN2b0xBRjdXSVpjbGYyeGV0UThDV1VIVWI5UHh3eENa?=
 =?utf-8?B?TFVsOERrcXZuWCttMitzWkgyVm5KSy9UZGJYZlRqcXdDNWlmdkFidFpoTE5t?=
 =?utf-8?B?MXlFeXRtbHo5R1k4U3o1dDFZUVY2dVRueWlKMmtMYWJYRE00cys5VTJEcG9p?=
 =?utf-8?B?SitMNXpLWkdONVlQS3Q2MU9EdnY4d2lRenl1Y2ZNUnpVZFp0bVcyNTJxK2M4?=
 =?utf-8?B?KzlmRWJUUlVFNmc1d2tJbEhseUoxRk5hWTI1UW1yb3BQQzhjVERoamR0WjlD?=
 =?utf-8?B?OVpBK1BCb2VhOXNtZTFORFh2eXRCTkNSR3RteTAzSGlXYmk3dXVTMkxHNGdO?=
 =?utf-8?B?a1Fyc05KdjI3RndVQkFRMlZFdm9PR0RPYXRIdU1lcjR3bW1wVUU1QVh3L054?=
 =?utf-8?B?UHlLS2lkaHRaVGJPbHNZbkhIWi9TSzlTcGlCeFdwRjdsUGZwM3VvTHFnTmJU?=
 =?utf-8?B?ZzhCb2RZZlBsRjVqYWlKdmZiZ2JmN3RUZUVjdHk5dU1jdkxIdTBLajJJYkEy?=
 =?utf-8?B?dkJ6RjQ2ZnNEa0hjcW9rZ0xpM1Mrd2tjaUdnNWxWRldaTElpS0txTXJBS3pV?=
 =?utf-8?B?UGZKdGs2eGdoRVVrUGdTOE1mUmd5YlNEbkgwTGdSOWYyOEErL1JJb1k3d1hV?=
 =?utf-8?B?NTZMS0tSeXBKdEJvMncycmlZZXJ2TCtCOURVNldSeS9abjlMYUVCV2NveEZq?=
 =?utf-8?B?dXhwN0xFQnpUN1lSKzZlME96Z2FjZ3RJN0ozV2NCRGVwYzcyc3BEeGVKeUNW?=
 =?utf-8?B?OFp1OHNPeVU4YmxyYzJYMVd1K0E2eGRkbGtUS0ZMYXNtSFBvSzZLakxpZStZ?=
 =?utf-8?B?NWp2RHNycW9rMjN6RmVuZGI2SEx4bHhSME9NQUZEa2RrcEZ6NE93bkZRSEk5?=
 =?utf-8?B?eTd4eHJURkRUdDZpR09yakxMSVJsQ0dkdTlrSTFZWFgrR0JJZjk0NExoaTd6?=
 =?utf-8?B?YWdZRlI4d2t5eGpkY1ZTeUl4UEsybEVvb0I4dTc2bkxBYVNTOG1vQXdZQjg3?=
 =?utf-8?B?ZXhYMWZRRlI5YzJjTlVNQlprcDNiY1BqdXRrZ2laYjhSWTcvS3huZFJXM2Fk?=
 =?utf-8?B?UXVEZ29zb2tFdXRhTDFXVHdqbW9pUm9qQUQ2K3NySjRxT3pPY2dNcXd0U3dC?=
 =?utf-8?B?bWN5SG9YZGNvb0ZVYlE2eFU0VUk5YUlKdlNSanJtVVhMbEFITEdiT0I4c0Na?=
 =?utf-8?B?OW5QK2JDaXJUYlZ3RmpYeWJzU2NHUjRmV2M5czFWRURYcEpyRnRwMzNvOGl5?=
 =?utf-8?B?cGU4Tkg2akU5RXVuUWEzOFdqN0JXL1dUT3BXcTZPM3Bqaml0VGNBbTUxVnp6?=
 =?utf-8?B?QnQ1Qmp1bHhreC9BRS8vUm82MklUL0RxZndMS2RtUWZDTG5tZG45UUx6amRB?=
 =?utf-8?B?RUFFVkhDKzlkUjVIeHVQaFd5WkRYN1M0T0pjSU5xMzVaVmg0aWhUSEM1TEVw?=
 =?utf-8?B?RzU0REZGc3hHSkJ2OFI1SzZSVnY0d0w1TDEzK0N4TXNvY3R4UWhKVkcrUm9D?=
 =?utf-8?B?RHlBTW9YaUpVaGNnUUpzVUhLSGZhditvbWxnSGJMOWZNWkxQdHE3WmlJRHov?=
 =?utf-8?B?eFdJSytWOEkyNk9peWZ4ZlhmREVzN1QrOE1JL2swNkd6eHBqSWtMVm9NZlFu?=
 =?utf-8?B?MDBjK0xZZzlGSktiQ3Q1NlV1ZC83bFVoQUVMeHl5SkNuQ2FnR0REdzMzbjNC?=
 =?utf-8?Q?V2Hs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e46a2d05-2b5c-4132-428c-08dd4e98deb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2025 14:47:43.4942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tweZsy/LaSYNNSBXroln3rUBs/w9P+GJ0Yhy0WgiloufC+bt3YU8JV/zwMQUUe0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8595
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ1cM6aEYKe2V7p1sLh/YE8966use+dD49osef1uAtg=;
 b=OGMyTWHSe7TM5M25G3AqhuUwn14HxB3zvVIfive02cw3vd46E/dgvyvwYo5d396mD6vzPLgJfj5InYPTPvTosK7z10jqPLBCfr+nPUQR1mQgyyBaj5vCOF06dQcomrdHJw4kfsZDt0hCwcOmQP60Nv56WqS6Ij8XSp22pJ+sYHo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OGMyTWHS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LA0KDQo+IEhlbGxvIEFybm91dCwNCj4gDQo+PiBIZWxsbyBUaG9tYXMsDQo+
PiANCj4+PiBIZWxsbyBOZWFsLA0KPj4gDQo+Pj4gVGhhbmtzIGZvciB5b3VyIHdvcmsgb24gdGhp
cyB0b3BpYy4gT3ZlcmFsbCwgdGhlIGFwcHJvYWNoIHlvdSBoYXZlDQo+Pj4gdGFrZW4gaXMgZXhh
Y3RseSB3aGF0IEkgaGFkIGluIG1pbmQsIHNvIHRoYXQncyB2ZXJ5IGdvb2QuIEkgb25seSBoYXZl
DQo+Pj4gc29tZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzIHRvIGNvbW1lbnQgb24gYmVsb3cuDQo+
PiANCj4+PiBPbiBGcmksIDE0IEZlYiAyMDI1IDE2OjUzOjU5ICswMDAwDQo+Pj4gTmVhbCBGcmFn
ZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOg0KPiBbc25p
cF0NCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLS1kaXNhYmxl
LWluaXRmaW5pLWFycmF5IFwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLS1kaXNhYmxlLW11bHRpbGliIFwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLS1kaXNhYmxlLXdlcnJvcjsgXA0KPj4gDQo+Pj4gSSB0aGluayB0aGUg
ZmluYWwgc2VtaS1jb2xvbiBoZXJlIGlzIG5vdCBuZWVkZWQuDQo+PiANCj4+IFdpdGhvdXQgdGhl
IHNlbWktY29sb24sIEkgZ2V0IHRoZSBmb2xsb3dpbmcgY29uZmlndXJlIGVycm9yOg0KPj4gDQo+
PiBjb25maWd1cmU6IFdBUk5JTkc6IHlvdSBzaG91bGQgdXNlIC0tYnVpbGQsIC0taG9zdCwgLS10
YXJnZXQNCj4+IGNvbmZpZ3VyZTogZXJyb3I6IHVucmVjb2duaXplZCBvcHRpb246IGAtcCcNCj4+
IA0KPj4gSXQgc2VlbXMgdGhhdCB0aGUgbG9vcCB3cmFwcyBhcm91bmQgdGhlIG5leHQgbWtkaXIg
aW5zdHJ1Y3Rpb24gd2l0aCB0aGUNCj4+IGNvbmZpZ3VyZSB1bmxlc3MgdGhlIGluc3RydWN0aW9u
cyBhcmUgc2VwYXJhdGVkIHdpdGggYSBzZW1pLWNvbG9uLg0KPj4gDQo+PiBIb3dldmVyLCB5b3Ug
YXJlIGNvcnJlY3QgdGhhdCB0aGUgc2VtaS1jb2xvbiBpcyBub3QgbmVlZGVkIGZvciB0aGUNCj4+
IGJ1aWxkIGFuZCBpbnN0YWxsIHN0ZXBzIHNpbmNlIHRoZXNlIGFyZSBzaW5nbGUgaW5zdHJ1Y3Rp
b24gbG9vcHMuDQo+IA0KPj4gwqBUaGF0IHNob3VsZG4ndCBtYWtlIGFueSBkaWZmZXJlbmNlIHRo
b3VnaCAtIHRoZSBuZXdsaW5lIGFuZCB0aGUgbGVhZGluZyB0YWIgDQo+PsKgdGVsbCBtYWtlIHRo
YXQgdGhpcyBpcyBhIG5ldyBjb21tYW5kLiBJdCBzaG91bGRuJ3QgbWFrZSBhIGRpZmZlcmVuY2Ug
dG8gJ21ha2UnDQo+PsKgaWYgdGhlcmUgYXJlIG9uZSBvciBtb3JlIGNvbW1hbmRzIG9uIHRoZSBs
aW5lLg0KPiANCj4+wqBBbHNvLCB3aGVyZSBkb2VzIHRoYXQgJy1wJyBldmVuIGNvbWUgZnJvbT8g
SSBkb24ndCBzZWUgaXQgYW55d2hlcmUgaW4gdGhlDQo+PsKgY29uZmlndXJlIGNvbW1hbmRzLi4u
DQo+IA0KPiBJIGFncmVlIGl0IHNob3VsZCBub3QgYmUgbmVlZGVkLg0KPiANCj4gQnV0IGlmIHlv
dSBsb29rIGF0IHYzIG9mIHRoaXMgc2VyaWVzIGFuZCByZW1vdmUNCj4gdGhlIHNlbWktY29sb24g
ZnJvbSB0aGUgZW5kIG9mIHRoZSBjb25maWd1cmUNCj4gY29tbWFuZCwgeW91IHdpbGwgc2VlIHRo
aXMgZXJyb3Igd2l0aCB0aGUgLXANCj4gc2VlbWluZyB0byBjb21lIGZyb20gdGhlIG1rZGlyIGNv
bW1hbmQNCj4gd2hpY2ggaXMgdGhlIGZpcnN0IGNvbW1hbmQgdG8gcnVuIGluIHRoZSBuZXh0DQo+
IGl0ZXJhdGlvbiBvZiB0aGUgbG9vcC4NCg0KPiAgVGhlIHRyYWlsaW5nIFwgcHV0cyB0aGUgdHdv
IGNvbW1hbmRzIG9uIHRoZSBzYW1lIGxpbmUuIEZvciB0aGUgb3RoZXIgdHdvIHlvdSANCj4gZGlk
bid0IGFkZCBhIHRyYWlsaW5nIGJhY2tzbGFzaCBzbyBpdCdzIGRpZmZlcmVudCBsaW5lcy4uLg0K
DQo+ICBDYW4gYmUgZml4ZWQgd2hpbGUgYXBwbHlpbmcuDQoNClRoYW5rIHlvdSEhISAgSSBrbmV3
IGl0IGhhZCB0byBiZSBzb21ldGhpbmcgb2J2aW91cy4NCg0KPiAgUmVnYXJkcywNCj4gIEFybm91
dA0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1EDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
