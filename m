Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158E4C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 11:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C60638316F;
	Wed, 15 Jun 2022 11:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pb9CSzFp7coy; Wed, 15 Jun 2022 11:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB78F82DDE;
	Wed, 15 Jun 2022 11:10:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A64061BF316
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 11:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1E1F40363
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 11:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="T4sFg+al";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="AKNBnsiY"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yn_-dPYyde2U for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 11:10:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58D2B4017A
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 11:10:18 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AFFD945F8A;
 Wed, 15 Jun 2022 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1655291416; bh=YM2HO/EZdHAEwFaHsiIRiixgaZ27VVVAAtfpdED62w0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=T4sFg+alH4kgdQaHY1p3+Nk0Zmf7HaeRy6jyq+6HP8kqeJ9zG1d98ODze3z5vZ/VU
 zFt5/5RU0EMetSqLD+rEE03SMmaj0kWKehJY97uXttcGWuwfcNUfe8wiga2y0Edytt
 nlc+CKJzb3LAoTBacQ60139/w0qJqg2GNJSwSUHHUqnjGPgP/krxN+ORXknJ9M6w4A
 6wXDO885j9DcQ+PCMoAoM02XEg25qlkdjDkymA/54RgHO/owkFXQKqMcOjR7dvpkDI
 Cz2cpcBNMHg1GWtBdwR1d9ibRjL5N1aW2DYvrawSvoU7xs9PSUZhOqybPe/bTFQbGh
 ey6gzC8ECXw/g==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 922EEA0076;
 Wed, 15 Jun 2022 11:10:10 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 98BEA80005;
 Wed, 15 Jun 2022 11:10:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="AKNBnsiY";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WX9vw7ncfVYK1Oeg3jFgzWwD9dcYyjEDBU13tadvXLuOqPjvT2hgIS4LIwsyycsmU+NWT3tKLELNQehalTZXpeRIND8syppnkhsLQoZQPgCmCDt5G9efQ5PMgHLwq2AG410t6OnbFs7NLzYb0nYAyeQGVCUkXn7pnPPgRb5/zw1Wd2mLkOOOpQ42jzp/b07Pj61b9A9AyzXtbzBS1jNV+6Yd85i01ti1PPQyji9auJmfQ3AsiP90H/QsVwC2zQiy/yvvv/tXUPj36aMoA2hBDqh5Ns6qgr8ZR52/k1RvtOm+eKefMnrMVn2c6Kq2+beyfnZAdImJC4ExKfo8SoA28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YM2HO/EZdHAEwFaHsiIRiixgaZ27VVVAAtfpdED62w0=;
 b=lfLDWcQqjqhUdNQ771upb2AQSa4DYBNyciqYq2tivK6geATGnMAJTv4JNJuCdM5hbULVqrKXquhpLywDpFvmsVRfjuFfFvSTTE2mSV+nc2t1RamjBA1ox8LPcfuHPTwDA1rJr86qSwz+xF1EUp0dWcPwyPu2T/krKXWLIyoohxJVuJm8kcD4lLAJprFKFcXo3CZt/ExA2d36z+gpSICZqkl2jzD0R8+PV1F9E02YJCeEXJDr8w6Chj71IGaFLvfDWHqXBM0ZXbLuk7ZFwoZMYujD3QkzarCVtSe/bKJk3HrUbMSKF0dqNP1k38VLXytNE9pIyZpq3HepHGYaLz0XeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM2HO/EZdHAEwFaHsiIRiixgaZ27VVVAAtfpdED62w0=;
 b=AKNBnsiY1thXGby9SY7e1BkwQyXwXjNNwWfMDubIyhsGPc0NkjbOlwZhvAoMM/SANTyNeir3S2Ul2GmXXaF+M4XztVO/I/PjdbjtidXXoXkEP2xejfq98UM8zQZGL9e+KxoZri3cKIVV+9UPH3W1t/0j/6isxCfANtNybScJCqo=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by SN1PR12MB2479.namprd12.prod.outlook.com (2603:10b6:802:29::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 11:10:06 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d%4]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 11:10:06 +0000
X-SNPS-Relay: synopsys.com
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 1/1] package/bpftool: revert bpf_cookie patch to allow
 building
Thread-Index: AQHYf9GGNdBPjuX5nkCxwDk0/FmiVK1PJLyAgAEslIA=
Date: Wed, 15 Jun 2022 11:10:06 +0000
Message-ID: <aafcf149-d0b9-8c95-751c-64ec4dabf5b5@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
 <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
 <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
In-Reply-To: <e8be91c7-8597-7a7e-9714-9f8045781959@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f5ae8e5-8de0-4fb1-ced5-08da4ebf9a96
x-ms-traffictypediagnostic: SN1PR12MB2479:EE_
x-microsoft-antispam-prvs: <SN1PR12MB2479FA904B8E1817DABDA10CA6AD9@SN1PR12MB2479.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SGHQEQoiuYcqfEDweJDBdfesbt3v6DNalwGacMSfTqPrOO3hoNei2omq+ooXXVpMGxU8KUM/19bQdtMvgse+NCa9fPPzl/9nwqfFKmfYvupSZjtC2M4Z0nlvqRy1tcvjEavW7btzGZSi5MPcxBEpekHETCnE1UNi5WLmofh23AAEVTpV7bWQhoEVGarslquZMqtJ+DpSkpZ04yapiIOH2z0Njhzh7RnTgqIx+Jrd5Fcax3X0r2I03FdCUnlR1cK+jtwx+drrTPukHld01MQZD0bxG9TJAQer0KNkNMXTrU8cb6yMAQHDNdCY19ojMfHijXRwWNj5aWmKt6hLacEY3arBeqh/U9tUPFIq2nJYsYp4aENDnky1/UhL7tBt4XgHwpxL4XRblS16Imq+r7OZ+mI1dNaxqUxryT72yKHBfhBdHNPyjtpfPeKo68pJoXHjt94i6tnRHg8di8xoaThDIfKT4dKRRSYH2P2ipbLrN+XbGQTjVdBJuGj3QnEw4cMwmERdH8FnbxgExDXdwfgwriag7tMNSL1WtSl0s+G7xFWU0+KUDdgAf98eCdSiDaOsUfUOeD8SSGmTUR3tn13NMhD7XM4q3KQVT8IwC+AM+D2V8sqD3reXgnCA2M1LsScYMke7Yn9ZT9W6xUJEofVwHjYnz97yhh/C86+sQKgwxNDZnFXcWRGYHnHRd2N4hfAXPahYkvfX0av56wY2LdXV78uno5iR7hE1J39zxN53tqiQhRocD3nLJCxe0r1yFmMw16mfaJpSo4b1o1BZUTJ6KEyqn6g0xH1kOc/0a2uNEvSDxE5CJlJFqEoc4sJIpYMq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(8936002)(186003)(86362001)(508600001)(2906002)(38100700002)(36756003)(4744005)(6506007)(53546011)(966005)(107886003)(31696002)(76116006)(122000001)(6512007)(31686004)(91956017)(66446008)(110136005)(66556008)(83380400001)(64756008)(8676002)(66476007)(66946007)(4326008)(71200400001)(54906003)(26005)(2616005)(38070700005)(316002)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTBjcTdIQWpoV3M1bDNZZTVKVVR0ZUFvZzU0WnhHWjc5OEJGaSs5RXBtU1Iw?=
 =?utf-8?B?bGRabE9LSkpKTkI2NmxIUHpValpQc2tadlhnRzROdzNGQ1U5dHZ3ejR6NTg0?=
 =?utf-8?B?RFlLN1lseXFWVXpjL05OZnFYeTV2Z09Fbmp3VVFQM0hQaW9ZbXlrM29iNUtr?=
 =?utf-8?B?amd3N091aDBJRWgyQ0lXSmdjSURheXNkem9rZ2hrZUhyRVZaQkQrRTltRzRK?=
 =?utf-8?B?Y3IvNDB2dVlsT1Y4RnlVZGlBSmJWY0dOd3hudGlGa0kzbkllQ2x2S1NhOHZU?=
 =?utf-8?B?VHR2amtvQ2dGRmY3eUhVOVhpdXVmWXdRQlVVV1lPd1lXdmVuN0FsaTRaOG9x?=
 =?utf-8?B?ZWFEdkluMG44dVRwRUNCWmMvWTBzdlZqNUc4QXVIa3FCemh2S042aFd2NDBr?=
 =?utf-8?B?RVJQUGNsQ2RhT0lId2ljTDdqQXd3OUEvdHJ6eFJlK3JPUHA0QWJFYXdiMVFB?=
 =?utf-8?B?Qm11ckk5SlRpcTh2Vis5amYyaVdTV2oxdUVOZDliZmRpRml5YS94UTFpanU0?=
 =?utf-8?B?OUwzOFpXMlh2L2Z1a0J5SUxkNWVndmFwTThBNGViNUlvRCtEQ2w5NjlxUWFY?=
 =?utf-8?B?b2hyMjhxVWVZRnFhZTIwdlVQQjNLeWlRRDJaQS9YR2tYVnV4b2hKOGpmTndT?=
 =?utf-8?B?UThOTFh3eWR0VXg3UExlUVB1SWsrWmswd3gra3hqa3Nha0xGWm9xNGgvNHBZ?=
 =?utf-8?B?UGhxSXQwZ3VtUndidzkrVDBDclNxUVkzNTNGVldEUjFCVUc5bFlGUkJTWVJV?=
 =?utf-8?B?NGlhSUdXM0EwZ0ZoclovaDFreXZLZ3lxWEpvTlZMbngxSnZmNHkvY0k0TWMz?=
 =?utf-8?B?MWRYZk1ZWTJSNVJJSzV6djZZM1pubGxaQjZSRFpvTUZzeHpTVWNVbERDOW5w?=
 =?utf-8?B?YlN4VXdnK04rMGZIejRweEpvaE1IZFBkVlpVc0lNVjhxNGtCcHFjdW1WNm5W?=
 =?utf-8?B?TkxoOGgwN0wySENoelZYTEFJYzFseXlNeS9DUEZ3UkRJT2FTT2cyanpCYklj?=
 =?utf-8?B?ZnlHa0c5SDNML2JOL0J5eFgzSVhzSUpDWExRSjhadnBXdXBxS0pVUmVjY253?=
 =?utf-8?B?VXVCTThwbVBwaGY4SEp5ZzJ5cXl6cFlEZkV1TWVVS0Y2L3JKYXV4ZERKM1Qy?=
 =?utf-8?B?aVNiL0VRNUVlRThMS0U2UTMySlpRbUhJamtHU1BHdlAzMEQ0b3BUT1k3WEdC?=
 =?utf-8?B?SDc2ZSt4Qk8wVGV4dEZmQXhlcFFxNE4yRVFSOXVTUmNCR1NjSjhCd1Z1cENB?=
 =?utf-8?B?VzkzQUFoWnBPdTd3SHAyTHZZNUtkUTQyUXJhOURnUTdwSGl1Mm1iVEZzOWM3?=
 =?utf-8?B?MU56emo4clMreDFzRVhJdmZ2U21ienBac01zbGFYdHl6TEwzY0hwTUZyMHFH?=
 =?utf-8?B?RTFrUzQ0VmNqRnYyaXlPenA0eHJ2ZGdrcWNFc2RhVWxyK2lHVWdJbVA3VzlB?=
 =?utf-8?B?YkVYQTBrL2JGdG5SbCsxT0dOOWcyN2E5djNhMGthTjlyYUl3SC95b2o4dldT?=
 =?utf-8?B?dzhFeUFSMTZkdE1ENitiakZyQzl6UlBNVGhocUd2S0RqU1lnN055SnhseUU1?=
 =?utf-8?B?cDZKQksxaFN1bDJpQVZFeVhHNnBpL2dFWUdEWWJyNHY3OSsyRDdTenVLZDBC?=
 =?utf-8?B?ci9pV0N2a0tiVE8zYmdhYTZLSDZYa1JlNUdtdnVpTGowcFVFemtheXZoWXF3?=
 =?utf-8?B?WEdvT1pEZ2Z6YzMyR2lIbjlSMkFGeXlrcE5IUFRiTVM2bEdrenR2SVZYVGJm?=
 =?utf-8?B?Z0xiZU1Qc21XNHhVR0JLRERxNmd3R0xJNmdqa1FOMW9VcWV5dFhBbHZHcitW?=
 =?utf-8?B?a0VOcXZ6dEZzcE1qNnBOd2MwVHN1L2lFVGw1blh0QnU2ck80NDJKUFpDUmw2?=
 =?utf-8?B?bXBvdDNCd1ZRY294bFkzMXppZzVIdWdjRDBmYTVXMmpRaFI3aGxqQjZmOTJ0?=
 =?utf-8?B?bXVhRmJWbUw3MC9xL2hNeU1JV3YyTTFTUHE4SkM5ZXkwSHJBR1VkRkFSclA3?=
 =?utf-8?B?TjZGaWJFY05NUks2Ri84aDBvSHpXNWNZTE93UEJGbDNwU3FUQjhTVkNIMFJC?=
 =?utf-8?B?c3gyOWFSQndOb2NnbG9QMERkdTJZeGVqSSswVVNnSk44VGlPRDd2a3cvMVIv?=
 =?utf-8?B?d1ZFNkljS0l1dVRob0YrUHU3bzJhZ0xBeUVmYVhUKzV5V3o4U3ozOEJvR284?=
 =?utf-8?B?N05TYUJOVVRQbzdCWUkrckdpd29WQUt2Y1c2Z3VzRkVPa0NzbFRKTWFWbWNB?=
 =?utf-8?B?bUp6RGVjWC9aaVBEWEp6OXRVbnR0MGZkbG9ZUVgyZkdyVE5NQURvMlVIYmRD?=
 =?utf-8?B?VDdRSXNKdE1ZdGV5bEZvbFR0Skp4VittL1pnc1IxaHoyeE5FOTdrZz09?=
Content-ID: <3740AA15B5E554419358400854A493D0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5ae8e5-8de0-4fb1-ced5-08da4ebf9a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 11:10:06.5328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FshZuNOZyEVRQd2fgSBaqvIPJUBuUu7BJHvqEKhrQdWERKtRoQv+e/SrHZm1xjXJuf31+90K46v2Q3H3oKsYeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2479
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
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
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LA0KDQpPbiA2LzE0LzIyIDE5OjE0LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90
ZToNCj4gDQo+IE9uIDE0LzA2LzIwMjIgMTE6MzEsIFNoYWhhYiBWYWhlZGkgd3JvdGU6DQo+PiBC
dWlsZGluZyBicGZ0b29sIG9uIERlYmlhbiAxMSAoYnVsbHNleWUpIHdpdGgga2VybmVsIHY1LjEw
IGFuZCBjbGFuZy0xMQ0KPiANCj4gwqBIb3cgZG8geW91IGJ1aWxkIGhvc3QtYnBmdG9vbCB3aXRo
IGNsYW5nIGluIEJ1aWxkcm9vdCBjb250ZXh0PyBIT1NUQ0MgaXMgc2V0IHRvIGdjYyBpbiB0aGUg
TWFrZWZpbGUuLi4gRG8geW91IHN1cHBseSBhbiBleHBsaWNpdCBIT1NUQ0M9IG9uIHRoZSBCdWls
ZHJvb3QgY29tbWFuZCBsaW5lPyBJJ20gbm90IHN1cmUgaWYgd2UgYXJlIHJlYWxseSBpbnRlcmVz
dGVkIGluIGNhcnJ5aW5nIGZpeGVzIGZvciBzdWNoIGV4b3RpYyBhbmQgbm90LXJlYWxseS1zdXBw
b3J0ZWQgc2l0dWF0aW9ucy4uLg0KDQpObywgSSBkb24ndCBkbyBhbnkgc29ydCBvZiB0cmlja2Vy
eSB0byBidWlsZCBicGZ0b29sIG9uIG15IGVuZC4gVGhlDQpib290c3RyYXBwaW5nLCBpZiBiZWNv
bWVzIGF2YWlsYWJsZSBmb3IgeW91ciBjb25maWd1cmF0aW9uLCB1c2VzIGNsYW5nDQphbmQgb25s
eSBjbGFuZy4gSSB0cmllZCB0byBleHBsYWluIHRoaXMgaW4gdjQgb2YgdGhlIHBhdGNoIFsxXSwg
dGhlDQpzZWNvbmQgcGFyYWdyYXBoIG9mIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KWzFdIFt2NCwx
LzFdIHBhY2thZ2UvYnBmdG9vbDogcmV2ZXJ0IGJwZl9jb29raWUgcGF0Y2ggdG8gYWxsb3cgYnVp
bGRpbmcNCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0
Y2gvMjlkMmE4YzctNDRjZC1kYTQyLTVmZWQtZjE3ZWMwZjhjY2YyQHN5bm9wc3lzLmNvbS8NCg0K
LS0gDQpTaGFoYWINCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
