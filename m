Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D29CD3420
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 11:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0324940303;
	Tue,  3 Sep 2024 11:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scmzZEqRLjSj; Tue,  3 Sep 2024 11:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F829402F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F829402F3;
	Tue,  3 Sep 2024 11:08:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2619C1BF406
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 11:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 117DD80E21
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 11:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQI_hulMtBkN for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 11:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=969f4f420=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D5C5380E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5C5380E1A
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5C5380E1A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 11:08:51 +0000 (UTC)
X-CSE-ConnectionGUID: X4InePEJSWGEH8IINKCS0Q==
X-CSE-MsgGUID: 5NqFFmmrQE2jUqKlPWLJ8g==
X-IronPort-AV: E=Sophos;i="6.10,198,1719849600"; d="scan'208";a="25807100"
Received: from mail-westusazlp17012038.outbound.protection.outlook.com (HELO
 SJ2PR03CU001.outbound.protection.outlook.com) ([40.93.1.38])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2024 19:08:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfU1HvFRqGu4t6x2EZ4Z7/N4RsqFYJlSDNonBa98WzgxzkMinS599kRN0tm3JK1sud+Pd1UOaIxXq5DC/BBPJHx20VdRO3EWgrH+fZgZY6YbChWf0ZD1s4H0KOUfStURwswk5W762S/GnFbRfYbG6T1N8mCtzoKn4bXwIzlhecPiKH+wP1gh1cY2T/E0YqSoMOhT0B3QWTv8TlulAOIs1VkZEPG52sJ+fTYGc4g7ZQE5sC2IkP6ibqfX65NG1sHeVNg3uvW0EOxA/C9BeamGHC0nnMxnVSg36FntySSgpMdhI685qQ9dKofrptii7T/9DdUF0+awORVn5am3iokdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK+gY+AIIImyn6u4vYXhwgqGIJRsqtP74kQWXRp3QOo=;
 b=I0UUZAYB6S7oaXxQUHntITEjlZeDXN08pjyHJ+hVtYZscOjhJJvFFn6ITwvmRdgpfq+WNOpLJhToh43K4qvKfAFostsii9Oog1tkX52340Ose62E1Q4pJ3qwp9m7WH2uV0PAgT09yLw4RmF/sAtUMINECmQWJFP65FZOXx2z8Q3D/xaZ0cos5hrckHY1XyT7FaIYBfuQMnlWSSB7EhQ1z1d6/4768+9j+mZKJpnENfTC2iQinN7ygez/v24DSTeSn93YVLoe9dupw+5TXaK2FLF5Hpai2iiRulkLYlQnqyFbBAp6k+PcMmAs0mLKv3J9EOvYXTk2Mbk2zGsw31auLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by DM6PR04MB7115.namprd04.prod.outlook.com (2603:10b6:5:24c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 11:08:48 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 11:08:48 +0000
To: Fiona Klute <fiona.klute@gmx.de>
Thread-Topic: [Buildroot] [PATCH next v2 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
Thread-Index: AQHa+9hWBI88W/7iHkCDRf4EFYXEy7JF65qA
Date: Tue, 3 Sep 2024 11:08:48 +0000
Message-ID: <ZtbuP9we0h8B9YE0@ryzen.lan>
References: <20240831190126.366600-1-fiona.klute@gmx.de>
 <20240831190126.366600-4-fiona.klute@gmx.de>
In-Reply-To: <20240831190126.366600-4-fiona.klute@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|DM6PR04MB7115:EE_
x-ms-office365-filtering-correlation-id: 075a0dd9-5903-4779-31fb-08dccc08c8e4
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?LSTmK4Og3XEV11zXe7ZSV6UdHaHF5lr3movn0TvcgoHtNsa9jja6tboqVc?=
 =?iso-8859-1?Q?p2XCAgfFaJNv7WRjqberNcDAYYZRV+sU33Pe4+Sf1NBphXEpYCDaSrYHnh?=
 =?iso-8859-1?Q?rOSbrgI3FukvM2zMNi3mVpbEEsY5KGb4vAB4jPhM5nDyrBQFRiYDdrITQA?=
 =?iso-8859-1?Q?9e9EN0w5igFZhuR3IFXJA55kPks8N0oqfUaZNSHufvVb9NK8mpuE3bCjg3?=
 =?iso-8859-1?Q?bZOxfDRsuqdnFdMpeGUgHo+QypXsS4+DcRRN8Gzc8IwF74Mf33QhVcWcp3?=
 =?iso-8859-1?Q?6uBtRRBjujB12DHD36zHk0O6pkbtPNz4sdAQx5eL0xilhLC20unfwLi9c7?=
 =?iso-8859-1?Q?fXp/98Ocpv++GKI7O1k66PFEtEHKC+L4Uq9RkF4SQTJhJVJTapbkJxPtFg?=
 =?iso-8859-1?Q?z35AAUMkuH47nMZfr3krruAYnoUsPVxYU7yPqwcTwbxA+utomgNNLqyWCi?=
 =?iso-8859-1?Q?/9vIvxoo4u+wOxTIGtormgf9ot2D9GxKZuYk/MLE0v1PA54/9THiC3tzTy?=
 =?iso-8859-1?Q?FD8nUJAslLHbFnz5vbGQqoJmpJuEBaIBzJFmUnXjy8QAJ/5iA3AgyUGXAi?=
 =?iso-8859-1?Q?s86TAN9aP8sjTFYdmRn3Sgt+W64VbVkcjkZMNd5oyyWTSIrOUdG4SmgmfC?=
 =?iso-8859-1?Q?A4ninK1K2aflBj80jxIB3FO9//O1WHnGHl59nM19adMD+VJGA4aJfv375p?=
 =?iso-8859-1?Q?rGzeudJrVTDeP/2QXPrjnbnD2tf+HCugLzmYVhSaaUd2rjPMjNhNXHp8VZ?=
 =?iso-8859-1?Q?ZmyCtDzSgy+ZEc8TpiKMR33NH56wy52HarRKOHvlz54KUDARTQdBzXKq5e?=
 =?iso-8859-1?Q?7d+56TaP/hbt796hvL35bLbho0Lkb7IWK2wRc0ak2Hxn2AJqHb4bVvtkHn?=
 =?iso-8859-1?Q?l54nUplB6ltEk5mUKsHd0zq+2vQFYxs8WZVxEQepLV6B7yiUGSR2ZtD7nO?=
 =?iso-8859-1?Q?9Lk8FdVG2iK6YCHEHUXbR7d2pN5fPJiX5NELbwpu4h5vQX7j/XPa/qiAbO?=
 =?iso-8859-1?Q?udcHtqAJJdWWOwBlGFqPYgfxIwTCJlzfEv3gqHEMlsGmw0Z4hLx9DSKnXZ?=
 =?iso-8859-1?Q?zFImvntoCixxwqTx7/C69n/ixwsweWoLrQCyFZsUH19/1PPAheNNh5YMMb?=
 =?iso-8859-1?Q?dNo5dteYMWIkU9XrSx6vl3emx3GPOUMBGNgi5oPn9apwgYTNdZ5REUI30P?=
 =?iso-8859-1?Q?E27zYoLQJTDCuC3wB5AaCSJclxA2MWuXo4fi8uOxejMkasosnhfJC4kYeq?=
 =?iso-8859-1?Q?8i2z+elAxq2iL3IqQNXsl0N3koVD6NjpKmpOsSFFEcnb5MV5+GID4LaPj2?=
 =?iso-8859-1?Q?91WzR0OfTsUlEX/81aYeXPrpWYdH+BXeCN3T5bsj9EWaXTgyCRk7xWORaE?=
 =?iso-8859-1?Q?vEc9i/vOrQO5w7i0oxnQvpSLSyaH+lnQT8A1Ulp/umeHyqOnfd/updCj60?=
 =?iso-8859-1?Q?KeqwTlxoj81f8NK0k5tGgJ/iJB9rBWqiSftAcA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?S1Imux/nQ7q8MF8IUYMM9OBvcSWBWnaVbWkf3YjnKh11heQGaUAPbHRuVv?=
 =?iso-8859-1?Q?sqWXIcgXU15gM+o1ihBiWa2qlSZlCXkubm5g8mhp/BPAlcQvlWh1LfXVsy?=
 =?iso-8859-1?Q?xfHz8REqBXyVYrnInqaOPh8LcI6hlVOiBgbySCWuKoRUxd6FVK+9Ks5NBE?=
 =?iso-8859-1?Q?8mwDazuPERVJLNIqxbYEEuTXJKw3UkNFhYn1FsK8HvAK63q7VPOz7lafF3?=
 =?iso-8859-1?Q?oWWFF3VHIrun+YFUKRNvrra6zOeKNA1EBnaUezVvRH1iWQVsRhH+k+Rf8m?=
 =?iso-8859-1?Q?B2V9G0/L+i4o8Fg9z5p4UwwESpEscFwKtH44n27h1HER/L41nGKgADaWDl?=
 =?iso-8859-1?Q?eO0b5oVffJU0s+tDV/dyDJY3MSezGTl7jkWNCORx1d6OMPq9rcKKOlPiCo?=
 =?iso-8859-1?Q?+uqcvQxpusZvfWfIdsXZWcwdqMmOK/1MVgeNLghBnEAIELii8hNjiQ00iV?=
 =?iso-8859-1?Q?o0dxJBPh8d8D7c0zhf4Jttwd2hi/P9m9me7H62pSe08bq8krHl/kWRmfRF?=
 =?iso-8859-1?Q?njiUM9LnMH/CZz+h7r7xxcYipnuefPNqUJXVj6YrKxeTHGc/2lmnTejF3l?=
 =?iso-8859-1?Q?ab+1GzA5SXebMsj1t76y5OjoaaZgheQ2uO8NCROzIuB/UMV3PsBu43flWb?=
 =?iso-8859-1?Q?DjnQqo75F0wmYdE8UDDtu5GMJADIDtDos6X4/ON+bsG49Y49IgDhK1QutB?=
 =?iso-8859-1?Q?6lst45W7kRTXO+6mmH12VUwimWzOxBHKima81p3BZ1St1zeWJeIZeKcv2T?=
 =?iso-8859-1?Q?WaJUxT5vqF7AmzUxrllc8w3rvE6IoMX2ioQQ0jDEvV2DOt6ap2LdQDo7sH?=
 =?iso-8859-1?Q?TP495E3X8elIZUloTun4o9bAsRi2LAV3LgIgW1WJaXQNsP/ZAHB4m4wxKX?=
 =?iso-8859-1?Q?dHxGVJh1vNlU0M8/YaBad1P60ZworkUyupQAFL5Urz1g4shlVgSlDkI7l7?=
 =?iso-8859-1?Q?m1tSufei9/y+WxfrymfRs80JxDuLzO7fp+emQ8RoLx1L+ESNwm6EY+e137?=
 =?iso-8859-1?Q?wcDPwgK4zwuWaft6aYaxrwz2uqeBW4cdCgWQwNo7JYMx1ceyOLTTtW718Y?=
 =?iso-8859-1?Q?Qx2CDfOmx4UM8xuDJFO0cXjv3Fq3UEjZoqLdTdHn1+Js3tEvZGoYQ2zr1L?=
 =?iso-8859-1?Q?0VbLrq9gQDjf/mKKm4lnAUKdqIvHS6f4UVSG5OZg+loa4SVXsbYQFFFHXp?=
 =?iso-8859-1?Q?vKocDpiR0ohn5yZBXioo4pnMZf951xjMSLi9tp+xAQ19w1JzI5tDmjUqwd?=
 =?iso-8859-1?Q?YJ/K7vY5AYvTRoJ5WP1SklCoJgQFQZq+A75AVAHjFJQlLAfa4JJRoNjEjG?=
 =?iso-8859-1?Q?H1+FiPvvtIHMZllGO10m7cDs99sCkbjCK2YP/h8iy5MbAkWmxtR/9Tq0qJ?=
 =?iso-8859-1?Q?Fzt9JwsOwum7Iqn7qwU+s4nrzirSFA4VM/don2vduY5zqnI7NPaUjZXvsM?=
 =?iso-8859-1?Q?TN9stE4vCBMRY87WHvlDMHkfBu3pEd/7ZzzNVZm+EvbiMeWousY4Acar+L?=
 =?iso-8859-1?Q?REFoEfz0qTZ0G4C6TK9FXvBbOgnkc0Sm6xf8NbavMZmGZBbpaJy/TmUhj1?=
 =?iso-8859-1?Q?oQAfT340KtTQf/GGhlTMPHRGXTQv5RosY9+6vl4GYyMOZMxS/d/2EBneqm?=
 =?iso-8859-1?Q?r8vf/2+K6YDaXDIQXHHP+x62jggNkeuqecKSbI1/WB7T1M5h5JmU+YIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-ID: <6FEF8D6ED8475840BE218990FCB28451@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ppjqaJOsenbpzGoQiU0xi0Tex9XzfGI+98jkXGcliYJCAZrOt287QJwY3+VzAfRQC571vh/iH0ySYPS2DKab9YPeRzFHTp+OPmGPrL4OIEfIGipi+9uV6I+Tqfd1+zo1+ww5tyRJNHMEKt9VCIOisQBIFQss7VvQZdmGs0QaVoxEufA8bYP6hWOdeatr3At5RVoW+aUHlNFdvQilcErqzpXM+qs+gvLPvXk0Fj1QalP2H2HFII2h1ZaNjrs3GiZ2fKl9nC46TzkxLoU9WtRXRTHfd3AnHViHmwXf+itTjKeQci66y4uvHQoGd9IrlAXxD5JDNYbZb2hiwlruGFFF5uWX2RThAR03Bp9Nn5AQN3TGvsG6qfr7sB/nZC9f65H8zI4h+ae6T9ECddKa7PTRSp3ObikqUJdaECdw2ZKAinRwxlcF+X4Qm0LX1DCCryUkiQcLXjUTYAxoyOI6gij1xbULDL7JbZuERbn4kmbNiBCDf5f8VH4ZIX7SJI2K2lDZ1YbopHr32ms7tTIZqt23l+ROXGFsrlyTmNkEW6Gwc7m1dRNN0yFMlUlliAixkhPgCRPzwr1kFsiRakgBQHfqFZXdr+GbrT0GOjaBqW1C0cMUFU8ozU32Tmo2iBAphM7P
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075a0dd9-5903-4779-31fb-08dccc08c8e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 11:08:48.1816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ha9sujy2f8mG1fz4LNUr1DTvzD7DfnmKsg2nr63wQu9P5DXZPvErXwICTJ94EON+TTcHmX7dvN/0RRbIrIQFsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7115
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725361731; x=1756897731;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=/iLFJvhpdtiwH7a5ELEoeMrUynTGPEaJZB75vIZiUqg=;
 b=M8hGhPHkyvvDRw2s/1M6ot8JVz6e7gHozt/sRzk+daNSTTGdAEcY6qQ3
 k34gDM8KKV+6pfkAmOFzEUBhSJqTOXjZuuQbf9AfnVKtO8LaltTQyx5cD
 VDQs5SC+E6kaxHUYO58O5KQ3YwLOadZX0CVgrBBMVmLBsrsIEq7itos2F
 rKawjo7y6+1TN/rDQJux/gSDufplArRw8R/a8nUobHbzuaU6F+tJX7snv
 ENkcMr2XKXKtrMv9m7Vp/BozoDE+pM6CSglB2wlgEsRcA3YrcN31GZPtn
 P/iIe+InefCE3UqQ9aFK55QXPqYiPAi2Rl/Yiq51nM028BAHiKBDx3E+U
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK+gY+AIIImyn6u4vYXhwgqGIJRsqtP74kQWXRp3QOo=;
 b=r2UMR+cBTP79OPhrKERQu6zzQgfhVh9GHt55zGysfQK5fu6pAmSi/oD33h7YaEZSklgTTDjlvN+f3zzEhgoWkvX+jJvidVePfCrWVs3UeoBHDTZvB2utTvegzOt0t2ihgoXtzlqj035keQaVfAQiNoYv+2NidKO9CWlh6o6M6NY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=M8hGhPHk; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=r2UMR+cB
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH next v2 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?iso-8859-1?Q?Jos=E9_Mendes?= <jp.baltazar.mendes@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Aug 31, 2024 at 09:01:26PM +0200, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> The new config deviates from the existing
> configs/raspberrypicm4io_64_defconfig only as far as necessary to
> demonstrate booting through U-Boot instead of having the firmware load
> the kernel directly. The sample boot script loads the kernel from the
> rootfs and uses the device tree provided by the firmware.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> The config I'm usually using is a bit different, including using a
> mainline kernel (which seems strongly preferable to me), but for
> defconfig maintenance staying close to the other RPi defconfigs is
> probably easiest.
> 
>  board/raspberrypi/boot.scr.in                 |  9 +++
>  .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++
>  board/raspberrypi/readme.txt                  |  4 ++
>  configs/raspberrypicm4io_64_uboot_defconfig   | 60 +++++++++++++++++++
>  4 files changed, 96 insertions(+)
>  create mode 100644 board/raspberrypi/boot.scr.in
>  create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
>  create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig
> 
> diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
> new file mode 100644
> index 0000000000..a5c986ef99
> --- /dev/null
> +++ b/board/raspberrypi/boot.scr.in
> @@ -0,0 +1,9 @@
> +# Please note that this is only a sample, we recommend you to change
> +# it to fit your needs. You should override this file using
> +# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
> +
> +# load kernel from the root partition
> +load mmc 0:2 ${kernel_addr_r} boot/Image
> +env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200"
> +# boot using the FDT provided by firmware
> +booti ${kernel_addr_r} - ${fdt_addr}

Hello Fiona,

While I'm not a u-boot expert, I am slightly surprised to see a new
buildroot defconfig use boot.scr instead of extlinux.conf.

extlinux.conf is the default configuration format in u-boot:
https://github.com/u-boot/u-boot/blob/v2024.10-rc4/doc/develop/distro.rst?plain=1#L69-L71

Even though boot.scr still seems to be supported for backwards-compatibility:
https://github.com/u-boot/u-boot/blob/v2024.10-rc4/doc/develop/distro.rst?plain=1#L367-L368

See e.g. this buildroot commit that converted rock5b from boot.scr to
extlinux.conf:
https://github.com/buildroot/buildroot/commit/b7dbdd3d775b8e94664c6f37b11afc8a6a352e35

I don't see anthing exotic in your boot.scr that wouldn't work with
extlinux.conf.


Although I am I but confused why you set:
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
but then you do not use this device tree, but rather some
device tree provided by firmware.

What is the point of setting BR2_LINUX_KERNEL_INTREE_DTS_NAME if you
are not using this device tree?

I would strongly suggest to use the device tree that comes with the
kernel version that you are using, as the changes to the device tree
(to enable support for additional hardware in an existing SoC) might
often look different once upstreamed (compared to the downstream device
tree).


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
