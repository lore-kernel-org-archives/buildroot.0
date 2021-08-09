Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD48C4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 05:55:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8473961056
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 05:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8473961056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4407240203;
	Mon,  9 Aug 2021 05:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0LEfqGVK7Q2; Mon,  9 Aug 2021 05:55:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3276D401EF;
	Mon,  9 Aug 2021 05:55:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E0261BF39A
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 05:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DE41826C2
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 05:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com header.b="JBNZ+WHu";
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.b="A7pcNosK"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwdkJbEvIeqN for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 05:55:00 +0000 (UTC)
X-Greylist: delayed 00:07:07 by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1479582661
 for <buildroot@busybox.net>; Mon,  9 Aug 2021 05:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628488500; x=1660024500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pFKhWFFsLdkt3YiiUgkwuVSHS8LSgh0Ezh2NUcd3Xhg=;
 b=JBNZ+WHuMZsGfSFqvbfyhEnQXcWeGbH7Kg2jS52rx8W2U66gtA/wadZN
 eRYrtkmwbJ5PKaYkBsggYFCqhQxNo/wYpOSM4w/5VNN7wq3udcEVDRbho
 aPPT84KvwCvih0q3OtV/FSqYH4PfRInGU2RFP9C8f41HAUJ0tQ9/lccf8
 WzbrDWbEasRMJWo87eT7VsgFyzM+VeM27+xmV8o/6XqolSPMKAosCE70R
 ZklCrkHnAEbAQqsVO5jRMLw69aZ33u/kFUaUhry1+zvlVOBqdUnxhUwvS
 qFVvaOPeCUQK/1MsIJsQEjS530HHfqhY7UqEkLIS+IH2OToBrkZFYE40q A==;
IronPort-SDR: HT1+XFpmObSQAwW9ym+TXT4V5bP/9oRgE5vb4ixI4LywiPM6H9kpvvEq/IF/JBJQkH8YpmKw2M
 gvd/MfIKc5or2G7F0tqes3lKwree6RnHC29h4Negg9bG9ezD4yNpHHNXWQ6RckBG12mbqNHDqB
 oNcjxjzsrIVrtSDQpc0ak4r1wVJxNNdbsT4wldudEU9cLKGbZZosBCbXu/LnUqsyCIsJRdlgxV
 utWRvFDc2lOLArhe9FSETOh3GDmL1Ynx/8/squPf7ObtbhOZYAN1zTl7cvgKonaX57NAg3hdzi
 hP/6IanpsaJWGof7uQUqnAUJ
X-IronPort-AV: E=Sophos;i="5.84,305,1620716400"; d="scan'208";a="127551284"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Aug 2021 22:47:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 8 Aug 2021 22:47:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Sun, 8 Aug 2021 22:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nr7smz5ZuHrhusQlitpyGT66x8qAobRL677/vWGUFaj1bwSj6nOzwvtrVTzAn1USyvrLmopQzCVHWsN7dK5BOYUNx4QdYffN8Ruq+rU8HNQH7/wY3q3MzQXuthTo38gwy6v5uuTrAWqNWa6/4nT4zPBvvmk6I9KvSoPw2e2fbLVnMazyO3SkYn5tUrj0eIlmOS+KbYxL45r2OuKUmXCoRgCWBHqISjjS6JooHnOth7vOHEnV3fGEjOU0XkG/kKdLAF+GuKpt9l4SD3/b6D9cFlchgShocCIXBPylThEEKJvWwwKblhP+BP9wB/ptuYns8DXNztBD+mVHRG1TPet/vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFKhWFFsLdkt3YiiUgkwuVSHS8LSgh0Ezh2NUcd3Xhg=;
 b=gGsu91DjLeBXygWrAVaaKOPauwxYwaOgZt6tKrjt5XZcBlTnL8ji0BebvN1tvXmW8is+xDZzx0LZYsWE1b6S42B57q3y3AiY/5yRZgBX2IfUquucofOOiIGanjobeKC510QGgUuMUeQIhX18WkglarYRLaCQi4mXLVos3cNuYIljk0tVwaMLi3jlOmxvavCe/IkTvZOwdSA0aAEpc3dVfVODdHfds+Z8pKtLstnLuMSSrhF7aaBwPO2FMRiMHdZhpH+q8TFSOi2yTyxJ4bBrYAl3FioMiFYqaWVyc64mS1uyDOIQ/6s6xSk5dQAjVZwEaP/EPeESH9HFhJFGdwif6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFKhWFFsLdkt3YiiUgkwuVSHS8LSgh0Ezh2NUcd3Xhg=;
 b=A7pcNosKbhfpp8SwrIoZFABPOOmEw2aZuSfA0nDxvz8Xlnf4lVu9Vdyd0Pp0odoZzDMaJEz9e/+0XnN97A28B5Yac/gRL3Wx8HJP6pLDrk+wJ8F0cH6N6D2AQ0K56K20HxkXjyreinPQ0Bg4ebnjNiZOEvZVdm1zsxSJtDDss4o=
Received: from BN7PR11MB2770.namprd11.prod.outlook.com (2603:10b6:406:b4::20)
 by BN6PR11MB1554.namprd11.prod.outlook.com (2603:10b6:405:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Mon, 9 Aug
 2021 05:47:48 +0000
Received: from BN7PR11MB2770.namprd11.prod.outlook.com
 ([fe80::9da2:a1c1:ed5e:c478]) by BN7PR11MB2770.namprd11.prod.outlook.com
 ([fe80::9da2:a1c1:ed5e:c478%3]) with mapi id 15.20.4394.022; Mon, 9 Aug 2021
 05:47:48 +0000
To: <thomas.petazzoni@bootlin.com>, <bonet@grenoble.cnrs.fr>
Thread-Topic: Microchip Buildroot defconfig issues: fixes needed
Thread-Index: AQHXi3aqqf/ud0CPbkCbRj+foOY9d6tqrTyA
Date: Mon, 9 Aug 2021 05:47:48 +0000
Message-ID: <c25884c3-7d6a-da98-786f-3d4250e4fe65@microchip.com>
References: <20210807070519.BBD0882F39@smtp1.osuosl.org>
 <68ad9a9b-54a1-1f6a-88c3-d6c171340b70@grenoble.cnrs.fr>
 <20210807122609.2b3d3930@windsurf>
In-Reply-To: <20210807122609.2b3d3930@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5b76412-0fa4-490c-f3dd-08d95af9385e
x-ms-traffictypediagnostic: BN6PR11MB1554:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB1554897EAE9A1C8BA5561344EFF69@BN6PR11MB1554.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MvpRzk3wNnPqsZwJiqkg5pGzD784JGsC447xOesObR8Bo4iDYHY09oxCnNMMG6E3hL2L6AvfJ+KaqGCPQ8XYVnrcwlipVk1rA2/NsGdHB308Y0HodvdWiKUH0kW2fcDnYnWWK89lr/8zyrnlYPFf48RuIuy6XPkdkgzkHcLsld4U7T9WBYMJWLrTlhxvCUpLWBX++4Pwpmhq4B0hegB0bPV4GIOLtyyy4wq4+hvtByan496Xu1nXgQL0Jr7RJPQ9O9b6WJMKUkP9+BDFuRtDBzaTom7JdMXJ3EDqKjItxpdrbA4W6c8ebOx+yFLyODO7Q+ytqKDXjDYFcGZvszAMoz1t7nsN2raIzkvAVQgV3bPSUjnl97jeaiqdhdvx9JPU8cGEdW8XINkqN8zzlZFLxMNNP5xZl8OgUQDveZ6NJIkCDCpN3JuErLB43OShkb3hQibGoO8U4MHYegQMJ/bKJvI+AbCL0wBeKeJHHbSKFvZpwbJ2i2Xgktxj/PO4K0UApxSCs95DaCkCX/FmUEyb2OzRXfOZVIrIs4TKji0sFMyPKlPmxXOqjzjp5MIo+OMiF1gBNOe4tmY48TIXh5Pe+zTJc4oQ8HehB9/0qtyn29mmzI3sVnN2qeTIdKDfITuOx9MgpvLkUmczG7/w46u2a33Cc7u5l/ijcqVpsKzonqTnoABNQiTKXLyDqcsZ6P4m/NXbnE2q0WZ7e6a76YLT74ZxgSWOgoe5o5wtNTAGUm8vwkAmiKuOS76HrNPxbV4B8dHZVOvwStkJ/Rc6MrXVl2lyF8Pwh9PYqBDqL6Bc2UfzRDN2wug3CdaNxhe5Gf8zw7mrEWqCkR6WOCKtlMeldX6z7xaqrmE7J2h2AkUpVxM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2770.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(346002)(396003)(39860400002)(8936002)(478600001)(66476007)(38070700005)(64756008)(316002)(4326008)(8676002)(71200400001)(2616005)(6486002)(6512007)(66556008)(66446008)(38100700002)(122000001)(5660300002)(76116006)(91956017)(53546011)(110136005)(54906003)(66946007)(6506007)(2906002)(31696002)(186003)(83380400001)(31686004)(86362001)(36756003)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N01HTXFqVXVrcS9HcXZ4cXVucDd1Z2g3bUtPWGdWd2pwVHRTRU9iS0s3aUVx?=
 =?utf-8?B?QTA1UkthdHI5NEpDdmpNeG56dktaVXlueHJjeUtYMWQ4MWVtMHhIUGx0VlZB?=
 =?utf-8?B?ZVdYdkhPYnVhRysvWFpCYXQwTm5jakkwS3JUUlM3ZzE5OWZmYkFvcmw4UlBl?=
 =?utf-8?B?czc1ZW5wRm40Y0ZCdmh6VENDd2RmMFhoSEJnaE9HeVA4cmFnQmxRb3Zna0xF?=
 =?utf-8?B?TVNLclZWK3BIbXVGSzgrK21IMUVEVjg3clhDY2lYYlhDc2xENkQ1bGRYaTA1?=
 =?utf-8?B?Yi9ZRHJJNzFDbjFZU2VKbnZpQVpKUmFYbkQ2cTFlV290bExwVkg3Q0F4V0Ez?=
 =?utf-8?B?Y1dnemczMXg2SnkxQTlFbXdrL0oxTlplbDhwSkJGb2xNQlhnRmVwM2JhOUps?=
 =?utf-8?B?NEJDeDVkWTI1SE52WFVjTHBVcHY1SlZiclYwTUVIMms0eEhCNWxYUmVrY216?=
 =?utf-8?B?K0pzejhoNEw2dFdCTFh5VUFORjRyWldOSk5wOVJyeld4UFBjN2dESGxYWi83?=
 =?utf-8?B?a1FtMlZFZEhTR0JnT2FYVTdyQ3BaNWY0L1N5YU1DZmtvM0JNczRCRkd5MDN0?=
 =?utf-8?B?SVdhNzdSU09KcnNlcXZOWFFSTGRkT2JSZDdBWnRFam1XSlQvdWs1RkxxQXVK?=
 =?utf-8?B?UzY1MkFub0ZheWVrZXdpVkVGM25OdUI1enBFSzg1a083dU1ZeHdMdlNMam9G?=
 =?utf-8?B?VVA0U3gvUTFqc2k2QWJLVS8vU0MrUXl5TE9uRXhVaHBnNnI4YUxKVWRYRHFX?=
 =?utf-8?B?ckJpWSs5Z2djS2RsbnRLZjlKWXhSUkp1ZTJGTkNKeUJIZXVHMWNYMzg0SmNT?=
 =?utf-8?B?WlVCWnF5V0lkZm1OL05MRGpWcVVVaHJjVFVUUkw3SGhBT09zdm9GNm5mZVdM?=
 =?utf-8?B?TGdENERydXEya0NqY0N6eVNteDFybHo0S2t0Y0ZsL3ZDbXRPclJUK1NleWtL?=
 =?utf-8?B?S2I3RE5nTjc3SExLN2llNWVjWTBSQzlCRy9SRDFLZ1FoR2MwUWZGUzRpajhV?=
 =?utf-8?B?UGZLVm9MeWpKb1dXT0JpSVpOQ2tWUnBaL1FRSjQ0RnJVK0d3K3dFcjR5c3py?=
 =?utf-8?B?Vk1kQnBEd3ZOQkxtUXFIam1jWGQ0bXo3UmxqMjNOUGlsYTFsVTJpcHZXb21v?=
 =?utf-8?B?cVMzRjBqOWVSVkgzTHJxRHBEYnFqOSs4Z1o5VmJPNkt4OFYxR3pYbHV2bHhh?=
 =?utf-8?B?ODVESlhhUUpnV0lZcjF1R3hmcStSdGM2SWZNSGxEV050aUlubjRLbSt1NkVL?=
 =?utf-8?B?SmhPejZ0VzZjbWs3b012QWZsNERGMmJ6YVp1M3M2cWhpTVVLMkxCdXZqSjFG?=
 =?utf-8?B?QXJKbUl0N2paaG5LWnduMGxDbzltSXZwUVV4VDU5NDFLTlBOMFJwb2c2bzN1?=
 =?utf-8?B?ak1DdC9pTWEzMHRRdE5FTkh1YmFMWlFDODRzdm84RWRRMERDSGFwZnE4NGky?=
 =?utf-8?B?aFB2N21DT0c5aHhRclZNL2lGd3JueVdzbEhqblhPdTNvMS9FN1BQM0JmQjlw?=
 =?utf-8?B?dFZiSU5KdkRCQkxEanpvb2xQMjRUbXNPM1ZjeHVydTlETy9mRzlsV2NjeC9s?=
 =?utf-8?B?YjhoUllMNVQ3Vy9RYVczWGlYaEhoeWJzOTlML2dvbFJud1Z0R1pMWXJCUHh4?=
 =?utf-8?B?RmVIRFBOSkYxc0UwK05QZmtHNmZyKzZ2dFByM1dsMVNEUjB6Yi9oSzRaaVBY?=
 =?utf-8?B?SkdCRnprYlJZV2pucmxjaHpiSjl1RGd1TmtYdlVwbmNMSVFrdFhDY3dqR1Vr?=
 =?utf-8?B?WnplTzVlUUYvbGw3VmI0UHg3dzNJTjJTL0ZJR3hpVDNqcGcveG1POHEzZEpv?=
 =?utf-8?Q?ZvsoUJA5slo7q5c2lgbbvP8amIToJH1PnzYfk=3D?=
Content-ID: <E1625CE86D80B4489249F1C727AA4E3A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2770.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b76412-0fa4-490c-f3dd-08d95af9385e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 05:47:48.8129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wX9nRQOORXJakQQQmfJD3f+BNddGTMQ7HvaNC6xa4TOJkba9pFvDN3V9QSvtiPT9+ifH1ouEsRGdy8bb3yiS+tHgEBfHPekNIcJxML2YwVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1554
Subject: Re: [Buildroot] Microchip Buildroot defconfig issues: fixes needed
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Ludovic Desroches via buildroot <buildroot@busybox.net>
Reply-To: Ludovic.Desroches@microchip.com
Cc: buildroot@busybox.net, biagio.hkr@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 07/08/2021 12:26, Thomas Petazzoni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello,
> 
> Thanks Edgar for your investigation!
> 
> On Sat, 7 Aug 2021 12:20:59 +0200
> Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:
> 
>> Hello!
>>
>> On 2021-08-07, the autobuilder wrote:
>>> Detail of defconfig failures for master
>>> [list of 48 failing defconfigs]
>>
>> The 32 defconfigs that use AT91Bootstrap all failed. I just checked
>> their failure reasons. The following three failed before the build
>> started, because of check-dotconfig.py reporting missing entries in
>> .config:
>>
>>   - microchip_sam9x60ek_mmc_dev_defconfig
>>   - microchip_sama5d2_icp_mmc_defconfig
>>   - microchip_sama5d2_icp_mmc_dev_defconfig
> 
> I'll have a look into these.
> 
>>   - acmesystems_acqua_a5_256mb_defconfig
>>   - acmesystems_acqua_a5_512mb_defconfig
>>   - acmesystems_aria_g25_128mb_defconfig
>>   - acmesystems_aria_g25_256mb_defconfig
>>   - acmesystems_arietta_g25_128mb_defconfig
>>   - acmesystems_arietta_g25_256mb_defconfig
>>   - at91sam9260eknf_defconfig
>>   - at91sam9g20dfc_defconfig
>>   - at91sam9g45m10ek_defconfig
>>   - at91sam9rlek_defconfig
>>   - at91sam9x5ek_defconfig
>>   - at91sam9x5ek_dev_defconfig
>>   - at91sam9x5ek_mmc_defconfig
>>   - at91sam9x5ek_mmc_dev_defconfig
>>   - atmel_sama5d27_som1_ek_mmc_dev_defconfig
>>   - atmel_sama5d2_xplained_mmc_defconfig
>>   - atmel_sama5d2_xplained_mmc_dev_defconfig
>>   - atmel_sama5d3_xplained_defconfig
>>   - atmel_sama5d3_xplained_dev_defconfig
>>   - atmel_sama5d3_xplained_mmc_defconfig
>>   - atmel_sama5d3_xplained_mmc_dev_defconfig
>>   - atmel_sama5d3xek_defconfig
>>   - atmel_sama5d4_xplained_defconfig
>>   - atmel_sama5d4_xplained_dev_defconfig
>>   - atmel_sama5d4_xplained_mmc_defconfig
>>   - atmel_sama5d4_xplained_mmc_dev_defconfig
>>   - microchip_sam9x60ek_mmc_defconfig
>>   - microchip_sama5d27_wlsom1_ek_mmc_defconfig
>>   - microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
>>
>> Failed because of AT91Bootstrap issue #127, as described here:
>> http://lists.busybox.net/pipermail/buildroot/2021-August/620375.html
> 
> Biagio, Ludovic, could you fix those issues on the acmesystems and
> atmel/microchip defconfigs ?
> 
> If they are not fixed by the release (end of August), we would have to
> drop the failing defconfigs.

Hi Thomas,

Okay we'll handle it.

Regards,
Ludovic

> 
> Thanks a lot,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
