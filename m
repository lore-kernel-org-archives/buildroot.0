Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C74C88E41
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 05:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D74881187;
	Fri, 11 Sep 2026 05:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5zA-zyGjOjc; Fri, 11 Sep 2026 05:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4625D81189
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789104122;
	b=gmq33aABfsMbDj86xDcxYu9RwhX25SrejSp3Wt8gKbS4GWE+CLJGYkC8PVWTR+ahz2uH
	 kpf0Ichq3jyQ2HhCFtpyeyztQZhbAYn1jjifeMuF5zieN/9rMwFLcgwZ7ZMgF60uNmCOI
	 etElzKB6pJ8r51Rj96PbQw6om49oIoxBiwtshm8MTdbLrFt4M+4U79TgjOUIEFdwSRhr9
	 ETclnVXz24bJjapLupZOtZdPDLEK6UY68CEyqHCZ9lITFhegtyHpQRp5PRBj56hY8SCUk
	 LYB74ymFeaKNhIZ5nzZ2JZeYjUWnRVhXllGIBM625YEN6riD/Pq2AtO0rJgx8qa/+Dg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789104122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:CC:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n/IbRZ9gg88ev/1sDArRaU7NzV2Vy/uxX5zWhA4kwSk=;
	b=T46bhXSnCDj4OJKzmFRJTNRM5iD2NFOr+XRcT1DDGNFnl8NzT+iuKbhjciDd98NQejeY
	 WYYIdW42cB8cFv6wq4Bm4Q+nPfzMxBeb9iOiVp1xYgAa58LXj6av3CTrzwkRLFKacZtqe
	 8PoZz4GXCEOPiBH3JulUzR4/7dYk5O1kPWKd6dXJb4MieziaQyRHzfaxSblB8INm+QGZj
	 fcr/h77/i6ikn7LkaYbzbWORN7yxpTxvGxSHBMn3xYrDjvPpsB4vxEXYzZWxtlqpeCd8l
	 a3L6NxqhqJBrSj6kpCIF5ZxfUhU5KtdCuGz6j6PQ9O4UmilLOYA/AbTjEaxWc6aDmKQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789104122;
	bh=n/IbRZ9gg88ev/1sDArRaU7NzV2Vy/uxX5zWhA4kwSk=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dEXYxBxUeZkUWxG04wlXGpXSUUxhNZfIwaxGiPqthYBcgOz/vTVvRj5CfJ0PlZInS
	 ncMQ6rFv6xRrW/ajosb3G1uSVQZy2yN/2ng9H4VCsOBVW4mnEUIUjeXnBJcvXUr87z
	 ekQNFjb3Lv1eVd+qyZjpaEKjiuMtYIZzuVU4w8lXM2GcSMaEtWhYsq0th2MoShyARf
	 QtnxgbeB23E8Wnrh4v0tGFuMbgbUzCSbP1y2Arx5Z4xVE4e8jjPr+Jkmhh6g0ss2Np
	 nMnjHdwOivyODbIgl56G8RVfSwenJVbGhVZlgQkc+oJcm1poBC6tE4EotRPnc99R69
	 ZFUQiZhDzpHCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4625D81189;
	Fri, 11 Sep 2026 05:22:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1E6D493
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 05:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A03A81189
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 05:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06JyWnsvT7Dq for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 05:22:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1E87881187
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789104120;
 b=EikGVWR/dWHmgEO2zaf8NZ5vNERBIFUdenkfmnTqueimiq4yJwhuRct5az58NVHrBnJU
 bVOpPFxAfyNF72mCn3JHupQkr8GuGyVQ+cn3JrMFUKr7LAxyahvJQW8WpGjS570QhgsTT
 kBn43XsCilEP3Yaszk86dCpuapxj3dcOJIym/1ReBvA/+yQr6hW7PZVx1Hq4YAnxNmMYY
 emLehAxaMBp3TntzbemrG3Ed9otM56hT/YpeafoGDH6qZZjkIrprdR+INEjq+C6U8lb6e
 t86unjA2WNlEs6zW6PZ6R435SAmrkutHKKjuC9Vv4Mta1Y/1k4fVbZIsKT1zs12gCjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789104120;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
 x-ms-exchange-antispam-relay:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=kelx1+k+rAleXvbnrtA6C30Ag4mr2IOfA8hRhTu7Mm8=;
 b=QqBm+/vbVY+YuW3l4tGHfAodTYQBgCw/QXvuxncdLLwRnZg0D0RgWx/0hfwG3ciKQAJq
 X2wMUPFVu/6NAdNnjYazF30cm+J6jxo3r4zFBdO+pKN3B9t5ndX7IPgtqTYMfHrSseCan
 FPMNUCxXR5zj4VGFLTpokzpnMc9sXiWSv4pSil6fBIbD9YVHR5+bBjXKOzslR6C9q6xQg
 xIqdiuAn4N6zRuW3Y1RsAQAoOORNAhGX3mtKDslbVBHC32mtKhSpF2NohtIIv3vdw/rq9
 qcYFupMIJolxvzKRWcmaXG+aHoekt8qCUuOsCL6ltE9WyHNGJcU+uozzRbi2jheXqow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=amd.com; 
 dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=X00tslp+; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c10c::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c10c::1;
 helo=sa9pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c10c::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E87881187
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 05:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0FGNQXN648HUZTK31B8ndjevb+ruvGIW5DXKuT/j4IHe5nF3d17WYshiZYQ4IHYtfyovbiys2vXAfpAngye9y6CezISu3ftawUGEu3LKWLYGauqukPBVyr2WIe0lX5RwQgna1VuIuTdJ6MP6fd+eR/95MxeyDwaiTuu0j5/7FSRPqVYdBSD4H6ZWZBDRv5MnB+VlBpUQql8inCGi5od81ZZQgssiICLVgf4KDWy4HplrLHWyY1o0kMJ8OAoqRSv/vGtVKm8nzNPB6XjJf9KObyd687yBbyJZZbvdY9BeYYzfisU98tjsTuXJsyI+wZ0FNvakXhb79oTV9zJcBLHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kelx1+k+rAleXvbnrtA6C30Ag4mr2IOfA8hRhTu7Mm8=;
 b=Lo5lvqXZ5UQuGLUK1ICn2oUubc41PCfyBThSEGIJ9lqHGhSzvOzGoZhSOIgG7i1RfI1aXT110vm+vw92vOfIfORYtrrkZL2qp2dCzrWazkgyt4oUd47/dTXrdt9jFizcCU1+G/ZYahf81zLSSmZnIOX+MjDU0jB9zkGtuCQHEER1dAd2lU/m++6tpNbb3jdR//Lr4fwSetxa28LbXzv6+9/BKOLXpdupZ55g/oso/aBBhqe5iA5il26DpIYWdrUZ5Er3KrJTBLjTMewo+voKgMF+23/HJc3ri68Vv9pp+Sha+P337lWWlujT47wejs9yOMVVSrIEd4fLCw4gD+Yx9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Fri, 11 Sep
 2026 05:21:51 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 05:21:49 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, "arnout@rnout.be"
 <arnout@rnout.be>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "peter@korsgaard.com" <peter@korsgaard.com>
CC: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Simek, Michal"
 <michal.simek@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>, 
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>, "alistair@alistair23.me" <alistair@alistair23.me>,
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, "Saleab, Micheal"
 <Micheal.Saleab@amd.com>, "john.ernberg@actia.se" <john.ernberg@actia.se>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
Thread-Topic: [PATCH v5 1/4] package/xen: fix build error when
 BR2_PACKAGE_XEN_TOOLS not enabled
Thread-Index: AQHdNSa3S5GkhgjRfEyN/3ZSPJS+6razR/iAgBWmcjA=
Date: Fri, 11 Sep 2026 05:21:49 +0000
Message-ID: <BL1PR12MB503268A0338A19259D0B6E6AF0BE2@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260826064649.292291-1-neal.frager@amd.com>
 <a8920732-5a16-49ba-82f5-c9405d210d5d@amd.com>
In-Reply-To: <a8920732-5a16-49ba-82f5-c9405d210d5d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-09-11T05:14:02.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|IA1PR12MB6651:EE_
x-ms-office365-filtering-correlation-id: 588511ee-c823-443f-7723-08df0fc494ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|23010399003|1800799024|4143699003|38070700021|5023799004|11063799006|10067099003|18002099003|22082099003|56012099006|6133799003|3023799007|41080700001;
x-microsoft-antispam-message-info: jupJqyq+0ZIcGCoDda7wMASzVhojjLTL7diyJXJuw8EAxWrqs9XMGGQ+39hb8UP/5vjEfnAnqz0ykC+ft/Cs++v7aapCgJZ+BfqPspTQ4ymqj7lyk1m8l+7XoZGESJlcoYng/ghCSpTafYJSBzi0YvA+qSuTJjqImJEQkAYexksg8OXF9D4hVDdUE0zk6kk3uYaKsPd6NazbCGBHtRLKesTyVDnjhoCvnSt6zmp0aaDZ72hQ9MuHAPZ+rxOdnVsqu0VDC/tVoeSrz+sndo80mA8dNskYuuP3slUJGjpzvvJcwav5Q0htp+TCaWOY/vOyz4E8UsxNXu2pvKtESjXz26g3NEul47o3rHEFWIlA22F18I2vbawqh8cAdUs+ugydmq8iv4Vfl83MLnLVrxmp23ipGw0G2ipX3IS6zEeEz8vMwvcQcEZl23f3UpApPVXXm37hqcjBxW09EhXi8RdPIlu2mOfHkWJvaoqS+VVZ0kJZbJqTBa1j5qj5yiKDMLCLg5ELeYtI7fLNQ2VRV4LIJDL7P8ZFHqfjbiEscmbFwVmw1b79k6usKEWQ8zUfN8ylU/yARs9WcPGEBOyWGTPZGQpYA1dg58xrQ/33Ok5/dMIh0p0d7+B1VXoAL9IoSWmK4+iZun0mYMkV42bMsJNgBFPiGwTyXQeqx+eL0KHKUdFmVpkrVHDtY4fdCVrjS5qZJZhIR7XOAk55ND0veFTNGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(4143699003)(38070700021)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006)(6133799003)(3023799007)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlhQdE02cnlpYllKQUdJZ1BqSkZEUWVXa0ZzZktWUVlLcG9nZGRwY1dHandZ?=
 =?utf-8?B?WTRZN0c3eWpxRENnNWZiQXJYc0xYaVluL2pQempiQWY1NXpFWDV4NDNrK2V4?=
 =?utf-8?B?THYwaTdsVHc5TU5qdkxkbVRlSE0ybGRmMXRJLzVoOC9jNWVsd2Zmbkd3YjYw?=
 =?utf-8?B?NlpqcGtDRVQxaU9XYVM5UVhRRlY5N1JIZHVWRUxTSVpSbndPU3RrYlppaE1N?=
 =?utf-8?B?TVRMak9PcDNEZTEzeDE2L3JESjQzb2I0RVlvQjJoR1pLT2FEZG1Wa1RXVjNr?=
 =?utf-8?B?WTVVTHNpQStlWWtBalJMK0xoaEs2cUoxRHZpRURPc1JFajJQZ0YxemloS011?=
 =?utf-8?B?ek9Qck50b2p0MmkraFVIbHBGMXlEbndHNGI4RldpZmF6Nmt2aGlNU2RRU0ZT?=
 =?utf-8?B?MVpmcHBDU2FiTEI5SDc0cHNKOFJqakQ5Q1Z5bEFnYXZzRGZNeHZsZWZCMlZm?=
 =?utf-8?B?a1JpdEp2U0xQSkJWSkxlZyt0YStqaXBqNGQ2WkNXN1J2QmlKamtYRUpXVGRP?=
 =?utf-8?B?MHUwcDRkcmQ4K1pINDZVSFIwd3RpWTFhSWw0RXlzRTFIV09tMEtWak9HMENz?=
 =?utf-8?B?Z3BaYWZadVg5c2JMV0RENWlBMUY3QnJyczNiV0xMSlliUmpUT1hFS3ZWanFJ?=
 =?utf-8?B?VkZrNkN0ZGxVUDErV3ZUQ2crT3JoUE1WUFVvSmFjR0ZsR2hjd0ord0JBQlNm?=
 =?utf-8?B?aG1Eckl0YTJjSjVMMDlKR0pLMXc5b3dzbnZ2S2RzcmVZdzNBUkhzNW9weEhC?=
 =?utf-8?B?QlBlbmlVZDdmSVBnaEQ1VWh2emJBUnR1dlN4SUk1SC9GT2RSbDJ5NU4xbWtY?=
 =?utf-8?B?bjZ0cmh0RVpFa0dpS2FHYkRDbVgzdWFReWZaZFNTSERLN3lJdFdGNVRzdlBI?=
 =?utf-8?B?TWtnRVFkaC9oZ1ZJZEFjTUJxSlFnakRXSkx6dC9ianByY0QrV3pHZkhqdmJu?=
 =?utf-8?B?RzZzam55cm96K0lWb0MvNWs3YU5udFdGbWQ2Y00yRnRZSzZwb0Z0QU13Nndh?=
 =?utf-8?B?VWtXVFh5UmthK0VyNmdnWTIxY3JtSjRmajhldVRXVHJ2ZlNxNzBPdzhibkF2?=
 =?utf-8?B?cmljV2RIamIreHNpd1g0azM4cUk4eXRhMUczK2J6MDNFNEFkN2xBaVErS2pR?=
 =?utf-8?B?bVFqN0djSk5Sd1lXck00TnhQK0NLWUZSV0RJTjlHMW8xNmRxdU5SczBvY0ZF?=
 =?utf-8?B?c0gyditOY01tWGxTSWpFQXFwRjlqOVFHNUMxZzBNZngvRVVyaDZkQ0RiSHpx?=
 =?utf-8?B?MDk1OHRWQzdqbnkzZUNqTlBBVVpweWRNSUM0dWhKMDNneXVIQ21FYjEwcWN2?=
 =?utf-8?B?L1l6VHJuOXNrTWFMSkUvakZrZUlza1ZqQzJ5RDVlV2FmK1llSnZoeDR5dmVN?=
 =?utf-8?B?b3RNWGVPY0FVd3B3Q2M5WkdBZUk1NmQ2eG9pZHBQUXozUURvaGJ1Z3ZCbi9p?=
 =?utf-8?B?R0Z2NURUQ2VjVlpkTkExUjF6WTQ2RWhYZFhPSWFFQ0QxVFkzaU1Yc0tKcWJT?=
 =?utf-8?B?OVQwMUNHWndMSW9DenlsRkw4dzJDU2czMUdPS1NjOTM5eGRpbWlxMVZITWdD?=
 =?utf-8?B?UWhjVXhxYlcrdGR2TzlET29BR1ZqeHhTNThTYzNQQnBjUlRGdDg4alhmdEM5?=
 =?utf-8?B?YXBrNVozRVhqOGZ5VzJLaDBoeGZNUVhPUkMyUEZJYlpQQVZBSmluRnMrN09C?=
 =?utf-8?B?V2lLRGI2a1RwVmhJTmN5KzYzYVNCTVRXYldwdVpNci9oZWZmUHBKc0J3ejJ6?=
 =?utf-8?B?VUxJMWdqRFpKYWVLazg3Wk4waHlmMTl5RlkwMnJ4bGVLVHhaOHk1SlpaK21Z?=
 =?utf-8?B?ZHpTazY3S240RFZUNE5ja0VlZ05nd2VodWhyQlZkZmYweEVtT0doRFViakRm?=
 =?utf-8?B?TTFRVEJXTFprQk91UVVpZ2RvRWhmeGM2cjI2L2hrTWhFZ1dETkgrdEVEWklF?=
 =?utf-8?B?NTBDVVZwT3NJbUJIa05xVzdyNHcwVnhHNVQ0a2dQcWhScW9OUVdvV1ZUcEx5?=
 =?utf-8?B?eXVvelJHSGJncHBsdVBZVEMyZzI3a3BtaThRd2I5aXZ1TmsxZDJpRHV2aHpy?=
 =?utf-8?B?N0x3SjJEUFlYd3RhZE1KS0ZaZEovZi90WE9qN21hSnFYVDdpSm94ckU0OTNG?=
 =?utf-8?B?TGdSVm81dG5iMGJaWWpBalhuSHZIbWVEWVNlK0ZzckJuYnF2bEVZWFRtSElO?=
 =?utf-8?B?V0FJOFlvbVNQY2hPRUlzdHU3ZGo2ZXRPeU9rZlBpMUM3S1Jrd3FuYW1pV2ha?=
 =?utf-8?B?THErc0RiVllOYUZCSis2VG1mZ3p4VUpnWVpSM1c0bXY1RDVwNCtCdkZ3ZEF5?=
 =?utf-8?Q?5GX6NQDEyUge1WACkh?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588511ee-c823-443f-7723-08df0fc494ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 05:21:49.6165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1daNtAxgAxs540kvuTwbq7dae6OtMGs/gUjMqecu5Vjljh7reLpg9QSW+/8ftE7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
Subject: Re: [Buildroot] [PATCH v5 1/4] package/xen: fix build error when
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QU1EIEdlbmVyYWwNCg0KSGVsbG8gQnVpbGRyb290IE1haW50YWluZXJzLA0KDQo+IFRoZSAwMDAy
LVVwZGF0ZS1saW5rZXItZmxhZ3MucGF0Y2ggYXNzdW1lcyB0aGF0IHRoZSBxZW11LXhlbiBmaWxl
cyBhcmUgaW5jbHVkZWQNCj4gaW4gdGhlIHhlbiBzb3VyY2UgdHJlZS4gSG93ZXZlciwgaWYgQlIy
X1BBQ0tBR0VfWEVOX1RPT0xTIGlzIG5vdCBlbmFibGVkLCB0aGUNCj4gcWVtdS14ZW4gZGVwZW5k
ZW5jeSB3aWxsIG5vdCBiZSBoYW5kbGVkIGFuZCB0aGUgcGF0Y2ggd2lsbCBmYWlsIHRvIGFwcGx5
IHdpdGgNCj4gdGhlIGZvbGxvd2luZyBlcnJvci4NCj4NCj4gRml4ZXM6IGJ1aWxkIGVycm9yIGJl
bG93DQo+IEFwcGx5aW5nIDAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaCB1c2luZyBwYXRj
aDoNCj4gcGF0Y2hpbmcgZmlsZSB0b29scy9NYWtlZmlsZQ0KPiBIdW5rICMxIHN1Y2NlZWRlZCBh
dCAzNiAob2Zmc2V0IC0xIGxpbmVzKS4NCj4gSHVuayAjMiBzdWNjZWVkZWQgYXQgMTg1IChvZmZz
ZXQgLTggbGluZXMpLg0KPiBjYW4ndCBmaW5kIGZpbGUgdG8gcGF0Y2ggYXQgaW5wdXQgbGluZSA3
Ng0KPiBQZXJoYXBzIHlvdSB1c2VkIHRoZSB3cm9uZyAtcCBvciAtLXN0cmlwIG9wdGlvbj8NCj4g
VGhlIHRleHQgbGVhZGluZyB1cCB0byB0aGlzIHdhczoNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gfGRpZmYgLS1naXQgYS90b29scy9xZW11LXhlbi9pbmNsdWRlL2h3L3hlbi94ZW5f
bmF0aXZlLmggYi90b29scy9xZW11LXhlbi9pbmNsdWRlL2h3L3hlbi94ZW5fbmF0aXZlLmgNCj4g
fGluZGV4IDZiY2M4M2JhLi4yNTkwOTA0ZSAxMDA2NDQNCj4gfC0tLSBhL3Rvb2xzL3FlbXUteGVu
L2luY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUuaA0KPiB8KysrIGIvdG9vbHMvcWVtdS14ZW4vaW5j
bHVkZS9ody94ZW4veGVuX25hdGl2ZS5oDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
IE5vIGZpbGUgdG8gcGF0Y2guICBTa2lwcGluZyBwYXRjaC4NCj4gMSBvdXQgb2YgMSBodW5rIGln
bm9yZWQNCj4gbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjIzOTogb3V0cHV0L2J1
aWxkL3hlbi00LjIxLjEvLnN0YW1wX3BhdGNoZWRdIEVycm9yIDENCj4NCj4gVG8gYXZvaWQgbWFr
aW5nIEJSMl9QQUNLQUdFX1hFTl9UT09MUyBhIHJlcXVpcmVkIG9wdGlvbiwgZml4IHRoZQ0KPiAw
MDAyLVVwZGF0ZS1saW5rZXItZmxhZ3MucGF0Y2ggc28gdGhhdCBtb2RpZnlpbmcgc291cmNlIGZy
b20gdGhlIHFlbXUteGVuDQo+IHBhY2thZ2UgaXMgbm8gbG9uZ2VyIGluY2x1ZGVkLg0KPg0KPiBJ
bnN0ZWFkIG9mIHBhdGNoaW5nIHFlbXUteGVuLCBhIGJldHRlciBzb2x1dGlvbiBpcyB1bmRlZmlu
aW5nIHRoZQ0KPiBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIGZyb20gdGhlIHFlbXUteGVuIHBh
Y2thZ2UuDQo+DQo+IFRvIHRlc3Q6DQo+IEJSMl9hYXJjaDY0PXkNCj4gQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTD15DQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15DQo+IEJSMl9UT09M
Q0hBSU5fRVhURVJOQUxfQk9PVExJTl9BQVJDSDY0X0dMSUJDX1NUQUJMRT15DQo+IEJSMl9QQUNL
QUdFX1hFTj15DQo+ICAjIEJSMl9QQUNLQUdFX1hFTl9UT09MUyBpcyBub3Qgc2V0DQo+DQo+IFNp
Z25lZC1vZmYtYnk6IE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPg0KDQo+IFJldmll
d2VkLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0K
DQo+IFRoYW5rIHlvdSBmb3IgdGhpcy4gSSBqdXN0IHdhbnQgdG8gcHJvdmlkZSBhIGZldyBtb3Jl
IGRldGFpbHMgZm9yIGZ1dHVyZQ0KPiByZWZlcmVuY2UuDQoNCj4gX19YRU5fSU5URVJGQUNFX1ZF
UlNJT05fXyBiZWluZyBkZWZpbmVkIGlzIGEgc2lkZS1lZmZlY3Qgb2YgaW5jbHVkaW5nIGVpdGhl
cg0KPiB4ZW4uZ2l0L3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCAodmlhICNpbmNsdWRlIDx4ZW4v
eGVuLmg+KSBvcg0KPiBxZW11LmdpdC9pbmNsdWRlL2h3L3hlbi94ZW4uaCAodmlhICNpbmNsdWRl
ICJody94ZW4veGVuLmgiKS4gSW4gUWVtdSwgd2UgY291bGQNCj4gaGF2ZSBjb25zaWRlcmVkIGNo
YW5naW5nIHRoZSBjaGVjayBpbiB4ZW5fbmF0aXZlLmggdG8NCj4gI2lmIGRlZmluZWQoX19YRU5f
UFVCTElDX1hFTl9IX18pIHx8IGRlZmluZWQoUUVNVV9IV19YRU5fSCkNCj4gVGhlbiB3ZSdkIGJl
IGNoZWNraW5nIGZvciB0aGUgaGVhZGVyIGluY2x1c2lvbiBkaXJlY3RseSBpbnN0ZWFkIG9mIHJl
bHlpbmcgb24gYQ0KPiBzaWRlLWVmZmVjdCwgYW5kIHRoYXQgd291bGQgYWxzbyBhbGxvdyBwYXNz
aW5nIC1EX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXz0uLi4NCj4gYXMgYnVpbGRyb290IHdhcyBk
b2luZy4gQnV0IHRoaXMgYXBwcm9hY2ggaXMgbm90IHN0cmljdGx5IG5lY2Vzc2FyeSBJTU8sIGFu
ZCBpdA0KPiB3b3VsZCBiZSBiZXR0ZXIgdG8gZmluZCBhIHNvbHV0aW9uIHdpdGhvdXQgbWFpbnRh
aW5pbmcgYSBwYXRjaCBmb3IgcWVtdS4NCg0KPiBGb3IgY29udGV4dCwgd2hlbiBidWlsZGluZyBY
ZW4gdG9vbHMsIHdlIGRlZmluZSBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIG9uIHRoZQ0KPiBj
b21tYW5kIGxpbmUgdmlhIENGTEFHUyAtIHNlZSB4ZW4uZ2l0L3Rvb2xzL1J1bGVzLm1rOg0KPiBD
RkxBR1MgKz0gLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fPV9fWEVOX0xBVEVTVF9JTlRFUkZB
Q0VfVkVSU0lPTl9fDQoNCj4gWGVuIHRvb2xzIGhhcyBhIGJ1aWxkIHRhcmdldCBmb3IgcWVtdQ0K
PiAoeGVuLmdpdC90b29scy9NYWtlZmlsZTpzdWJkaXItYWxsLXFlbXUteGVuLWRpciksIGFuZCBp
dCB0eXBpY2FsbHkgaW52b2tlcyB0aGUNCj4gcWVtdSBidWlsZCB3aXRoIGEgZnJlc2ggc2V0IG9m
IENGTEFHUywgaS5lLiB0aGUgLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fPS4uLg0KPiBzaG91
bGQgYmUgZHJvcHBlZC4gSG93ZXZlciwgYnVpbGRyb290IHNvbWVob3cgcHJvcGFnYXRlcyB0aGUN
Cj4gLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fPS4uLiB3aGVuIGJ1aWxkaW5nIHFlbXUteGVu
LCBoZW5jZSB0cmlnZ2VyaW5nIHRoZQ0KPiBpbmNsdWRlIG9yZGVyIGFzc2VydGlvbiBpbiBxZW11
LmdpdC9pbmNsdWRlL2h3L3hlbi94ZW5fbmF0aXZlLmguDQoNCj4gU28gdGhlIGZpeCBoZXJlaW4g
aXMgdG8gdW5kbyB0aGUgX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXyBkZWZpbmUgb24gdGhlIGNv
bW1hbmQNCj4gbGluZSB3aGVuIGJ1aWxkaW5nIHFlbXUuIFRodXMsIF9fWEVOX0lOVEVSRkFDRV9W
RVJTSU9OX18gd2lsbCBiZSBkZWZpbmVkIGluIHRoZQ0KPiB1c3VhbCBtYW5uZXIgd2hlbiBpbmNs
dWRpbmcgdGhlIGFwcHJvcHJpYXRlIGhlYWRlci4NCg0KPiAtLS0NCj4gVjEtPlYyOg0KPiAtIGNo
YW5nZWQgbWV0aG9kIHRvIG1vZGlmeSBwYXRjaGVzIGluc3RlYWQgb2YgeGVuLm1rDQo+IFYyLT5W
MzoNCj4gLSByZW1vdmVkIHRleHQgZnJvbSBjb21taXQgbWVzc2FnZSB3aGljaCBhcHBlYXJzIGFz
IHN0YXJ0IG9mIHBhdGNoDQo+IFYzLT5WNDoNCj4gLSBtZXJnZWQgaW50byBwYXRjaCBzZXJpZXMg
YXMgdGhlIGZpcnN0IHBhdGNoDQo+IFY0LT5WNToNCj4gLSByZW1vdmVkIHFlbXUteGVuIHBhdGNo
DQo+IC0gdW5kZWZpbmVkIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gZnJvbSBxZW11LXhlbg0K
PiAtLS0NCj4gIHBhY2thZ2UveGVuLzAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaCB8IDE2
ICstLS0tLS0tLS0tLS0tLS0NCj4gIHBhY2thZ2UveGVuL3hlbi5tayAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAzICsrLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE2
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS94ZW4vMDAwMi1VcGRhdGUt
bGlua2VyLWZsYWdzLnBhdGNoIGIvcGFja2FnZS94ZW4vMDAwMi1VcGRhdGUtbGlua2VyLWZsYWdz
LnBhdGNoDQo+IGluZGV4IGFjMDI3MjI3ODEuLjNiYTY3OGNkOWIgMTAwNjQ0DQo+IC0tLSBhL3Bh
Y2thZ2UveGVuLzAwMDItVXBkYXRlLWxpbmtlci1mbGFncy5wYXRjaA0KPiArKysgYi9wYWNrYWdl
L3hlbi8wMDAyLVVwZGF0ZS1saW5rZXItZmxhZ3MucGF0Y2gNCj4gQEAgLTE2LDggKzE2LDcgQEAg
VXBzdHJlYW06IEJ1aWxkcm9vdCBzcGVjaWZpYy4gVGhpcyBpcyBhIHRlbXBvcmFyeSBwYXRjaCBm
b3IgYW4gaW50ZXJtZWRpYXRlIGJ1bXANCj4gIFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzD
qSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4NCj4gIC0tLQ0KPiAgIHRvb2xzL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyOSArKysrKysrKysrKysrKysrKysrKy0NCj4g
LSB0b29scy9xZW11LXhlbi9pbmNsdWRlL2h3L3hlbi94ZW5fbmF0aXZlLmggfCAgMiArLQ0KPiAt
IDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gKyAx
IGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkNCj4NCj4gIGRp
ZmYgLS1naXQgYS90b29scy9NYWtlZmlsZSBiL3Rvb2xzL01ha2VmaWxlDQo+ICBpbmRleCBhOWEz
MTk2ZS4uNWQyODk2NTEgMTAwNjQ0DQo+IEBAIC02OSwxOSArNjgsNiBAQCBpbmRleCBhOWEzMTk2
ZS4uNWQyODk2NTEgMTAwNjQ0DQo+ICAgICAgICAgICAgICAgLS1iaW5kaXI9JChMSUJFWEVDX0JJ
TikgXA0KPiAgICAgICAgICAgICAgIC0tZGF0YWRpcj0kKFNIQVJFRElSKS9xZW11LXhlbiBcDQo+
ICAgICAgICAgICAgICAgLS1sb2NhbHN0YXRlZGlyPSQobG9jYWxzdGF0ZWRpcikgXA0KPiAtZGlm
ZiAtLWdpdCBhL3Rvb2xzL3FlbXUteGVuL2luY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUuaCBiL3Rv
b2xzL3FlbXUteGVuL2luY2x1ZGUvaHcveGVuL3hlbl9uYXRpdmUuaA0KPiAtaW5kZXggNmJjYzgz
YmEuLjI1OTA5MDRlIDEwMDY0NA0KPiAtLS0tIGEvdG9vbHMvcWVtdS14ZW4vaW5jbHVkZS9ody94
ZW4veGVuX25hdGl2ZS5oDQo+IC0rKysgYi90b29scy9xZW11LXhlbi9pbmNsdWRlL2h3L3hlbi94
ZW5fbmF0aXZlLmgNCj4gLUBAIC0yLDcgKzIsNyBAQA0KPiAtICNkZWZpbmUgUUVNVV9IV19YRU5f
TkFUSVZFX0gNCj4gLQ0KPiAtICNpZmRlZiBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fDQo+IC0t
I2Vycm9yIEluIFhlbiBuYXRpdmUgZmlsZXMsIGluY2x1ZGUgeGVuX25hdGl2ZS5oIGJlZm9yZSBv
dGhlciBYZW4gaGVhZGVycw0KPiAtKyN3YXJuaW5nIEluIFhlbiBuYXRpdmUgZmlsZXMsIGluY2x1
ZGUgeGVuX25hdGl2ZS5oIGJlZm9yZSBvdGhlciBYZW4gaGVhZGVycw0KPiAtICNlbmRpZg0KPiAt
DQo+IC0gLyoNCj4gIC0tDQo+ICAyLjUxLjANCj4NCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveGVu
L3hlbi5tayBiL3BhY2thZ2UveGVuL3hlbi5taw0KPiBpbmRleCA3NTI1MmQxMTIzLi5iZGRmZGJi
YTM4IDEwMDY0NA0KPiAtLS0gYS9wYWNrYWdlL3hlbi94ZW4ubWsNCj4gKysrIGIvcGFja2FnZS94
ZW4veGVuLm1rDQo+IEBAIC00MCw3ICs0MCw4IEBAIFhFTl9NQUtFX0VOViA9IFwNCj4gICAgICAg
Q1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9TUykgXA0KPiAgICAgICBIT1NUX0VYVFJBQ0ZMQUdT
PSItV25vLWVycm9yIiBcDQo+ICAgICAgIFhFTl9IQVNfQ0hFQ0tQT0xJQ1k9biBcDQo+IC0gICAg
ICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKQ0KPiArICAgICAkKFRBUkdFVF9DT05GSUdVUkVfT1BU
UykgXA0KPiArICAgICBFWFRSQV9DRkxBR1NfUUVNVV9YRU49Ii1VX19YRU5fSU5URVJGQUNFX1ZF
UlNJT05fXyINCj4NCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfWEVOX0hZUEVSVklTT1IpLHkpDQo+
ICBYRU5fTUFLRV9PUFRTICs9IGRpc3QteGVuDQoNCkp1c3QgYSBmcmllbmRseSByZW1pbmRlciB0
byBoYXZlIGEgbG9vayBhdCB0aGlzIHBhdGNoIHNlcmllcy4gIEF0IGEgbWluaW11bSwNCml0IHdv
dWxkIGJlIGdvb2QgdG8gYXBwbHkgdGhlIGZpcnN0IHBhdGNoIG9mIHRoZSBzZXJpZXMgYXMgc29v
biBhcyBwb3NzaWJsZQ0KYmVjYXVzZSBpdCBmaXhlcyBhIGJ1aWxkIGlzc3VlIHdoZW4gYnVpbGRp
bmcgWEVOIHdpdGhvdXQgYnVpbGRpbmcgdGhlDQp0b29scyAnQlIyX1BBQ0tBR0VfWEVOX1RPT0xT
Jy4NCg0KUGF0Y2hlcyAyLTQgYXJlIGFkZGluZyBuZXcgZnVuY3Rpb25hbGl0eSwgc28gSSBhbSBv
ayBpZiB3ZSB3YW50IHRvIHNwZW5kDQptb3JlIHRpbWUgcmV2aWV3aW5nIHRoZW0uDQoNCkJlc3Qg
cmVnYXJkcywNCk5lYWwgRnJhZ2VyDQpBTUQNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
