Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0C5C79F99
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 13:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE3B4055F;
	Tue,  8 Sep 2026 13:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzsnESrw23v3; Tue,  8 Sep 2026 13:10:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EA6D940555
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788873037;
	b=lldK0jRLPqoy3U9nZTH2XqDUxkpoREj2l/vzW8cxhCBP+MVzmxLCFz7U3ZL3QIomOz3e
	 TLort4S+7b5TlfiEnsOZVgwL9k70udNR54c0V1drv2PgQ96qt7YKdRPDAA04jiCAxpGut
	 tpvnKdg3Y4XGGUw1my1i87e0ZkEjBSBGz4RZRNyjW8AHPrzirnx3oZ6EPVUeE4JpOYwHa
	 arwfVgxy+p/Gyk7oYMMNeCjjo9jekWZwdcFFtXfip1ZShDnKDdPxwk1lvhRUF7yqgvTgF
	 llsfj6z6ecMIZtKieK1+gs/2TcsBKbmvnLpkx7mPTIoMrRoWSF1bll/iRxp2nCbcZqQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788873037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SN8PAoET4QM1+kYp3P5mPZXzDB4+fonukaxas3mUorU=;
	b=Z6+oPzInfcF2n51CiO9F4uqTqg7ZmyQuCXQYJ7uxUo61wzRx7H4tn0VxGG+h31DxLAoa
	 i5aiZZA5zO3FF02E7D6oIWC1+VkcOYTl9I7TXoV8i8CtQmAi2WMa1USWqULiV5rIu6EYO
	 9Tzba+prwgrcafpUpnWxEpyDW/RiPIQC+a6xdD+KN1UQTa4v0MtgPC1cOGjxnUi9X6Z1p
	 CL3MejV4/JO7NCtDJ814ICGWpbMrrwI+gmMh6OgaRNegCLjQ8i+KlgZ2r07dAUzQUp82w
	 Ibbx1Z+Es+VQZmkNtwBtU1upgl4uEF/ZagUo9IJSluTQTQDMPWnpg+JqOO36h+zAFPA==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788873037;
	bh=SN8PAoET4QM1+kYp3P5mPZXzDB4+fonukaxas3mUorU=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0b6FC3Zy/C9CI0OlXW4fp0cunWDMF0MBhFvwwlFHkfUIkkFk58H3q4qWtgQGfC3o
	 K4aEBu/2Utky7v5/xriK4yUbM/017Ho+r0TG6lNT2MH4jAst3GArrVhjGaIS+HXPhz
	 srDhrVLILCvE9MaFCviJaesLChuG2KZNgtcOt4VcZtww9sgq/szo4+oc7FZHqvhOer
	 woSfvMM1Fq0qG294baiwdW9b1u0NTLvzA9ulwWR30GZ22UjBTaJoNNURhF9o/tXa+P
	 RyWdZ6ts36d84tzQidU1egCdFW3dQ+w+0XizAYqFEjOQsCg5vQ1dKu7/VlmlksSaGq
	 e0nB9EDQ1UYHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA6D940555;
	Tue,  8 Sep 2026 13:10:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D6A6372
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 13:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2299C606F5
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 13:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0YlgXV5OFqg for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 13:10:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 28AA6606DF
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::623"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1788873033;
 b=DtBNG9JPJAXFJzhPD9iptagIHvl+WNS36lFzzLOm51SGbY/8COIzXagScnL3iMwcNN5C
 6gOX6ZwwtzcxvZsBIP/3F8JWi289Bzo+WaQRDF2U23qacsabE8FWDeZ4hj1QUlAsEcsBr
 nQ979F5RfGD1zIv8xvbC5kqJUrsPTj0uCKMxPD2Cu81cessgHI4l5B99HpaTBZmjwZgyC
 +YMe9IFkxh70/65JVY/2aSOadfWtoTpefhvz6mLWBC4oT+sQ90tG1YukPhL8TlN2NWaUh
 Y8dRjaTdsZyFKnQ1uaRIzOhH+6ZLfgnA3W83C1bF4RHL+cO5Ds1M49V7+TVC484WKUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788873033;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:
 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=T0O9IxW9qX4k+cN6/ibOdEfC2wOSuj07MLIXQQOLft8=;
 b=hD1uHM+8S5rfZ+/DQchxvM5R1fLCvsR05HMBH1szLANs8sza0a1yb7BefrbAI3RQNRqs
 UwRG64zBs0F9DrKQhksflAqYUtNJ0NQuKp6iSob0kmtrA9cRWue8TQo2obdB7XZ3NQmY3
 oL8wz9h+sKkQ6Dan2NPevnBkxIK10HZNlzebW/3WYAQmm7+XFWt6EqzipLiQP3zJ/XmOv
 h6gIX/8cC6AeZCqCfun8y0VzYVfgeEw2JBd39D9y2wdG5y5ooagRZes0HTPBAOABJ5fmm
 phj2zykyIvRaOeMl+9un3EAGJrLvruDYRfXhKQMD5QXPJTl2wvTzG0iIOMa2UnMxkVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=xes-inc.com; 
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=R9CD35uU; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:d::623"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::623;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=R9CD35uU
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0623.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::623])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28AA6606DF
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 13:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=OvRRly+A30jeodC0sCGA3jM2dmtFm6KYAUbO6y7zsGbU5xRYiboLg0UcIh+nNGABHajUizvG1oSkCCEK6r3ifDSoN6K6ekdGfWz7ViB2K95nYScxsZkblLXjS/GTmcdTJoPsrWuc131fuYC4ADFAoe85I4jA5eYoN69zGx19BfNz1yqpOZCuussDm+s/kdxNgleuIShPUDa2VQSewt5wN1WbveCJxFQQtWWpWi2OYf18TsdLiFq4TARcUIx22iJMKUGgQwXrLzqeSX1rMKlBFlfUn/ksZ7tVAANmVH8SxS1xOKCL2OHynfyBFBWnQUVpwJVToEa6dJ9OxDbmJALVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0O9IxW9qX4k+cN6/ibOdEfC2wOSuj07MLIXQQOLft8=;
 b=Hh+YeYoo4TaaO3Kb2XAhPuQI1p0mvbgYV9Pc/EKC0/MR45uZQVA+EO3WHkLb6vHshSUDe2/uC7RRE4Vj3yFEi0zG3EzVuuwx9Y5jNx/7MZIVQifLwEDCtNm0dw+s4mNf6Ilrms+o0nsErD8GelGNx9NY6ix4TWi/414mV1Ol4X7GkZXSh8o2Rj9utb152+wRi2nyQXnm9R8NyRaO4ecZ7yhxROnAv0T0CYIMnZVoOQJBU5Wc/BqKgh35gFihAKauOOZqHtLop1pAzdkAg7xw5jnCyaL2FqzDgm1T3fnCsTWObD2/JfPVMSAUdvymwD/KyqBe/NPqOgX1e6jZD6WccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0O9IxW9qX4k+cN6/ibOdEfC2wOSuj07MLIXQQOLft8=;
 b=R9CD35uUYGMBQ7HWK2da2F33PY4pnXP6aI5F38KzaiU7+jP3SzYkQVzMW8dOo190UXFt1F0x8bSiFwQ8VCppoyTmXSjXYjB5RVfqz42vnpAy2HUJyYiAKg81EC5VZxw8m5PrGgafwnNf0fdvZ0Nu368jyH/0Ics5+Go5oCQenWJ37sE0Vkl5ThULgVk9lvw1HwWXuBYBgXWi/2r//bWo9xVruFat7qiwuPmYXYixp5qiIWk6PspYMC4PY4J0/bjFArcjruhbDzyE2m3iQkya2pQ8sZN8UTr0DdpS9xU2Hs4VNPqDVhFpNfQQqHxkgWK3+zjuoBllxcytLLa5aUrUjg==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB1736.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 13:10:26 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 13:10:26 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: John Koch <jkoch@outrider.ai>, "j@j-ernberg.se" <j@j-ernberg.se>
CC: Adam Ford <aford173@gmail.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, Zach Vargas <zvargas@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Updating nvidia-driver package
Thread-Index: AQHdP5NqlwXpBywhNUSA5JY8+bNddw==
Date: Tue, 8 Sep 2026 13:10:26 +0000
Message-ID: <PH1P110MB1603534783B4E17496D192219FB1A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260902195708.2168193-1-j@j-ernberg.se>
 <CAMQGCcjXAx56Jtk31ArAZJyPxc=cXU48KyrzObu-p-F19agEpQ@mail.gmail.com>
In-Reply-To: <CAMQGCcjXAx56Jtk31ArAZJyPxc=cXU48KyrzObu-p-F19agEpQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB1736:EE_
x-ms-office365-filtering-correlation-id: 297db6d7-47ef-4573-67ba-08df0daa8ca1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|41320700013|38070700021|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003|55112099003|41080700001|15866825006;
x-microsoft-antispam-message-info: UghTW7SsbHz2Ub9Bf+jGRIPNGj7xjvy+g7nf+dbf4TuTvtmKR2HH3T87LESLma1diUD2be0VTfszqyVNHwMyuSKWEXqcbHU7DcRJWnDK5nh1w4Vxa0LEHSsG28isysxt9IxbM0r/HwLlUQAoM1kamnZamrp9jKY5TEI0fBmcCizV+as/hdDLXf/40KvgsI4a1O1gYDSjMWeJ0fPLAaiUxC9gVOrIozffURDD+lEnDBFLeEU5Il4Iu2+ileta2iiuxoDR4SN7AKwJi+x0LP346mQydqIDKLRb1ejMdTN7mCx2oCXR88jtvtH2ykJJX/su701tjYDEexYnSovqEoTSpyq/EMbbsN22k5IpqSU+LDOVbNjIhKjvpp9pfQVXJBZzGn4wxfwu7n4ZI18wJIVdi+jPDR4bLZQRFWzdTE9yZaindqWWUQlHD//ZczDbvmysEoaIxUr3PHUIhY5XDPHPcY/9iOdrBBV+0FHjOj1SUkNiPcU7s59x1bwaF5xi2NJkVMJzEDMNmy8Hdm0ZZ770EhFF6EOaQqRWZ0ZKd48dlyYdwTKzA3iBJkKc4ehCCVbaXUrweKTgQEhPgshnBOeKziFKZRPlruQfYgWQBiZXEcgi05J71AJr0u2NLqtlJfGfyJ2+Ij2keiazzWK0N2IAIIdHkzhmL1vEqdge7PxlgN/LFChwcUEFdbCWemNFuVSsFRAZCh2n7XcSZGOvMRFPpEH85rdf/lfhQZtrwb0gEBU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(41320700013)(38070700021)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(55112099003)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDN1ZnBXazFwK0ZJUDdmb2VEbzZGakVHeUdJWmNTUjkrdm5FbTZJZzBvU3N2?=
 =?utf-8?B?R1dZR0t0Z21LNUFQTnYxV290dHZWNjQ3eXlBMTVkV2dZelMwL256bUtXTTZD?=
 =?utf-8?B?aFBBT0NNYm9EVGdlUFhKekdLeUJCSS80d2xBRkZ1dGF1UlVseGsycEUwcmxI?=
 =?utf-8?B?T3M2SjVaTjNnVi9vY1BGaGhMS1kwZ1JhQ2VsSTRvTkpFZ3ROMG1RUWxpZGV3?=
 =?utf-8?B?VDNvdUV2ektqdkdwRTZ6MzRwOXErSFdJRk5kMXV1NXlWUVVJVys2UEJ0YUxC?=
 =?utf-8?B?bEo2UlJTejUyU0RZdmRBMFhKWHdGbm9GQjZNeWtnV0FCU21ISzhrRDBIUVAz?=
 =?utf-8?B?bFBMUDdORzQxTk40c0had2wzeGgyZUJodWRreXdGdENJQ3NrV29lSXlpUFlL?=
 =?utf-8?B?blQwOXM3V09Ub0tDRndoWG11NnEvWjhtZHhLaXpHRVBadnRRTW9nM0lmdlNs?=
 =?utf-8?B?VkVnVGR3V0VJQnZuTkRvb1VYRlhLRFNvY3orRnBhU0M0UFRuUHRINC9Ua3li?=
 =?utf-8?B?LzB2aTRMWi9HcTM4NDY1VHAwalZ2RjlEenhMT050UnZ0LzVXN3B6QjRTSC9K?=
 =?utf-8?B?R0U5cHhuQURjWUpOMTFkVnhQdjh2dXVRcGtTc3RWa2JiUVhZbDdId1EwWWpj?=
 =?utf-8?B?MnpCQTVFWm1FM2lUblpnZDYzbzVGMXlvbzArQnRteWhpZEdxSitWbXlOWWJF?=
 =?utf-8?B?cjNTNlNVdlYreG5VZy8xbE9NNGlKUmdnY1psR3NENDhPR0pmcVMzcnFHdTJZ?=
 =?utf-8?B?VmZuZ2RPeit0b2QwTkhLQ0tzQXlKbFR6SmtUWHNzS3l5Qk9UUHZCYmtZRDFV?=
 =?utf-8?B?dkZmbFhMdm1vQmhLem1VWmgyVXZHeUFpeFJ4TWtoZ05xTk05RXRuN0g1U08x?=
 =?utf-8?B?UWJMWjBlTlBjMTdHeEhiVGhyZ2EzUklab1Ntb3hIdko4OVBBaGlTUzFnMjBu?=
 =?utf-8?B?VXczaXVYN0tnV1BoR2dsYnBOTXd4c1lvd0NpUWtqZFgxTHJ0UkJTYTlycWM0?=
 =?utf-8?B?Zk9JTUZDcFpYajJrd1NwTEtZV3JNWnVvcTg2RkYxbk0yK0xjQkFOeXQvbkcy?=
 =?utf-8?B?dmxiN05aSzV6eGdMd3NYWm5zZGM5VHlYWTF0ejFYSmlqRnpnN0M4OGhJMXlM?=
 =?utf-8?B?dzJYWW9YdlZMRXhhMDRvZzN4SmpRdDN6WE9OTEp0bUI4bytidHRiR3lWRytn?=
 =?utf-8?B?SWpSYjlsRE5QSys0V2dXZWxKTkZIWDd4eGhGRVNRKzByZTdRUXBLQVVJMFRt?=
 =?utf-8?B?SjBPN0F5bGNCSGlmdVI3cFVzWERBSjYwSHBLU2RNUzlqdDIvRWQxUHd6Y3dE?=
 =?utf-8?B?Wm1JUUZya0Q3RTJnQ1lpRUhlOGVpTXc4V05SUVVUK1Z2UzlWazcycGJURlY5?=
 =?utf-8?B?VTZWQ2tzNkVYNFE4ZytOWnFmM2lBTFA0OUdvbmN3TXRsTklIcnZvckd0ejhs?=
 =?utf-8?B?SFpHbkFQQXh5YXVabU0yTUptMFV1c0tiWjhqWlJTdWtwdmsxUHFGZjN2RmNQ?=
 =?utf-8?B?c0MxZEl2aDVZVVI5L25Nb1JoUVJIN2xnemVIcUJveEZHMUYrYkY3emJSUE9a?=
 =?utf-8?B?aUNHeHM0dDNkZC9ZRTJzMzBzQ2JZelJMcERaODFXRTNSRDlzeTNkbmlkamI3?=
 =?utf-8?B?c1l5NXZ2alUxeFhUMkM4alYwbmxObWNNWktUVS9zSjBmQ1Z2OXpTZXNjNW1C?=
 =?utf-8?B?eS84WW5jMVJwZFFRNk9GajdwMjBNdklGSDVzcjZTbG5vd3dIWFRiSDZucVI2?=
 =?utf-8?B?disrZDN5c2hxb1RFeUhrVjkweFhMNk00MU5Ic3JkRlB6OUVmbE80a0RvTGg4?=
 =?utf-8?B?QzlBOFFNeWd0ZzB4blhaVXZnUmUxWm5TOUw5ajY2L01TVWxtSW52bUZ6SlUv?=
 =?utf-8?B?UjRyZ083ZmZKOFJVQTlERHpGUVlHTWV0V3N1encxN1oybmh6THFPTC9DRW9r?=
 =?utf-8?B?RXkwMTJGN0xYMUNoZ3BIayswZUt0NGtzUnVHNk5OY08ySWliT2U4WGMwN1Vt?=
 =?utf-8?B?RTkxUk1vcGdQZnQwZC8rdGVBakVFZkc5dTBtRFdxSWdxa0dUU1AxM0tTVkhP?=
 =?utf-8?B?aUUxL0Fhb3pKNE5BbWRTTFZuVnMwNklqRkNFMUlqdmd1cU9PczJWMkV1eGlJ?=
 =?utf-8?B?cFN2NGt3RTQ3OFkvcnd6NU9xNWJmQXdVSFNwSnhuOWZ1S3RCRWprNE1hbjdj?=
 =?utf-8?Q?CQcWtBtN/dYDdKua7CrP19LP0L+ulJo6ArP2VA8gUiDI?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 297db6d7-47ef-4573-67ba-08df0daa8ca1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 13:10:26.4585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1736
Subject: Re: [Buildroot] Updating nvidia-driver package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvaG4gS29jaCA8
amtvY2hAb3V0cmlkZXIuYWk+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDQsIDIwMjYgNDoy
NSBQTQ0KPiBUbzogakBqLWVybmJlcmcuc2UNCj4gQ2M6IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21h
aWwuY29tPjsgWWFubiBFIC4gTU9SSU4NCj4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPjsgVmlu
Y2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgWmFjaCBWYXJnYXMNCj4gPHp2YXJnYXNA
eGVzLWluYy5jb20+OyBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPiBTdWJqZWN0OiBSZTogW0J1
aWxkcm9vdF0gVXBkYXRpbmcgbnZpZGlhLWRyaXZlciBwYWNrYWdlDQo+IA0KPiBJ4oCZdmUgYmVl
biBtYWludGFpbmluZyBhIHJlbmFtZWQgbG9jYWwgdmVyc2lvbiB0byBhdm9pZCBjb25mbGljdHMg
d2l0aA0KPiB0aGUgZXhpc3Rpbmcgb25lLiBJIGRvbid0IGtub3cgZXZlcnl0aGluZyBtYWludGFp
bmluZyBhbiBvZmZpY2lhbA0KPiBCdWlsZHJvb3QgcGFja2FnZSBpbnZvbHZlcywgYnV0IEknbSBo
YXBweSB0byBoZWxwIHdoZXJlIEkgY2FuLg0KPiANCj4gDQo+IE15IG1haW4gbW90aXZhdGlvbiBp
cyB0byByZWR1Y2Ugb3VyIG91dC1vZi10cmVlIHBhdGNoZXMgYW5kIGhvcGVmdWxseQ0KPiBoZWxw
IG90aGVycyBpbiB0aGUgY29tbXVuaXR5LiBIb3dldmVyLCBiZWNhdXNlIG91ciBzeXN0ZW1zIHJ1
biBzdHJpY3RseQ0KPiBoZWFkbGVzcyBmb3IgR1BVLWFjY2VsZXJhdGVkIERvY2tlciBjb250YWlu
ZXJzLCBJIGhhdmVuJ3QgdGVzdGVkIGFueQ0KPiB3aW5kb3cgbWFuYWdlcnMgb3IgZGlzcGxheSBz
ZXJ2ZXJzLCBzbyBJIGNhbid0IHNwZWFrIHRvIHRoZQ0KPiBYd2F5bGFuZC9MSUJfR0wgYnVpbGQg
aXNzdWUgZGlyZWN0bHkuDQo+IA0KDQpBdCB0aGUgdGltZSBJIHdhcyAibWFpbnRhaW5pbmciIHRo
ZSBwYWNrYWdlLCB3ZSB3ZXJlIHVzaW5nIFhvcmcgc28gd2lsbCBiZSBvZiBsaXR0bGUgaGVscCB3
aXRoIFdheWxhbmQuDQoNCj4gDQo+IFVzZXJzIG1heSBuZWVkIGEgZGlmZmVyZW50IGRyaXZlciB2
ZXJzaW9uIGJhc2VkIG9uIHRoZWlyIEdQVSBoYXJkd2FyZQ0KPiBhcmNoaXRlY3R1cmUuIA0KDQpo
dHRwczovL3d3dy5udmlkaWEuY29tL2VuLXVzL2RyaXZlcnMvdW5peC9sZWdhY3ktZ3B1Lw0KDQpU
aGlzIHdhcyB0aGUgY29uY2VybiBJIGJyb3VnaHQgdXAgYSBjb3VwbGUgb2YgeWVhcnMgYWdvOiAN
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtTWF5
Lzc1MzM3My5odG1sDQoNCkF0IHRoZSB0aW1lIGl0IHNlZW1lZCBsaWtlIGhhdmluZyBhIHN3aXRj
aCBiZXR3ZWVuIGxlZ2FjeSBhbmQgbmV3IGRyaXZlcnMgbWFkZSBzZW5zZS4gDQoNCkluIGEgaGFs
Zi1oZWFydGVkIGF0dGVtcHQgdG8gcGxheSBuaWNlIGFjcm9zcyBhbGwgbnZpZGlhIGRyaXZlciB2
ZXJzaW9ucywgeWVhcnMgYWdvIEkgY3JlYXRlZCBhIGhhY2t5LWFzLWhlbGwgYnJhbmNoIHRoYXQg
ZXNzZW50aWFsbHkgdXNlZCBhIHB5dGhvbiBzY3JpcHQgdG8gcmVhZCB0aGUgbnZpZGlhIGRyaXZl
ciBtYW5pZmVzdCB0byBjb3B5IGV2ZXJ5dGhpbmcgdG8gdGhlIGFwcHJvcHJpYXRlIGRlc3RpbmF0
aW9ucyBhIGxhIHRoZSBvZmZpY2lhbCBpbnN0YWxsZXIgdG8gcmVtb3ZlIHRoZSBsb2dpYyBmcm9t
IHdpdGhpbiB0aGUgbWsgZmlsZSBpdHNlbGYuIEl0IGhhc24ndCBiZWVuIHRlc3RlZCBpbiBlb25z
IGJ1dCBpdCB3b3JrZWQgKGF0IG9uZSBwb2ludCkgd2l0aCB0aGUgaW4tdHJlZSB2ZXJzaW9uIHdl
IGhhZC4NCg0KaHR0cHM6Ly9naXRsYWIuY29tL3ZmYXppby9idWlsZHJvb3QvLS9jb21taXRzL3Zm
YXppby1udmlkaWEtaW5zdGFsbGVyLXNjcmlwdC12Mj9yZWZfdHlwZT1oZWFkcw0KDQo+IA0KPiBJ
biB0ZXJtcyBvZiBrZXJuZWwgYW5kIHRvb2xjaGFpbiBzdXBwb3J0LCBJ4oCZdmUgcHJpbWFyaWx5
IGZvY3VzZWQgb24NCj4gcmVjZW50IEJ1aWxkcm9vdCBMVFMgcmVsZWFzZXMgYW5kIHRoZWlyIGRl
ZmF1bHQga2VybmVsIHBhaXJpbmdzLiBNeQ0KPiB0ZXN0aW5nIGlzIGxpbWl0ZWQgdG8gbmV3ZXIg
TlZJRElBIGhhcmR3YXJlIChBZGEgYW5kIEJsYWNrd2VsbCksIHNvIEknbGwNCj4gZGVmaW5pdGVs
eSBuZWVkIGhlbHAgZnJvbSBvdGhlcnMgdG8gY29uZmlybSB0aGUgZHJpdmVyIHdvcmtzIHdpdGgg
b2xkZXINCj4gbGVnYWN5IEdQVXMuIFRoYXQgYmVpbmcgc2FpZCwgSSBoYXZlIGNvbmZpcm1lZCBk
cml2ZXIgY29tcGlsYXRpb24gd29ya3MNCj4gZm9yIG1hbnkgZGVmYXVsdCBjb25maWd1cmF0aW9u
cyB1bmRlciAyMDI1LjAyLngsIDIwMjYuMDUueCwgYW5kIHRoZQ0KPiAyMDI2LjA4LnggcmVsZWFz
ZSBjYW5kaWRhdGUuDQoNCklmIG5vIG9uZSBoYXMgY29tcGxhaW5lZCBhYm91dCBpdCBwdWJsaWNs
eSBtb3JlIHRoYW4gSSd2ZSBzZWVuIGluIHRoZSBwYXN0IGNvdXBsZSBvZiB5ZWFycyB0aGVuIHVz
ZXJzIGhhdmUgbWF5YmUgdmVuZG9yZWQgdGhlaXIgb3duIHZlcnNpb24gb3IgdXNpbmcgYW4gb2xk
ZXIgQnVpbGRyb290IHZlcnNpb24gd2l0aCB0aGUgZHJpdmVyIHRoZXkgbmVlZC4NCg0KPiANCj4g
SWYgdGhhdCBhbGwgc291bmRzIHJlYXNvbmFibGUgSSBjYW4gcHJlcGFyZSBhbmQgc2VuZCBvdmVy
IHRoZSBwYXRjaA0KPiBzZXJpZXMgZm9yIHJldmlldy4NCj4gDQoNCkF0IHRoaXMgcG9pbnQsIGl0
IHByb2JhYmx5IG1ha2VzIHNlbnNlIHRvIHRyeSB0byBzdXBwb3J0IG5ld2VyIGhhcmR3YXJlIGlu
IHNvbWUgY2FwYWNpdHkuDQoNCldoZXRoZXIgdGhhdCBtZWFucyByZXBsYWNpbmcgdGhlIGN1cnJl
bnQgcGFja2FnZSwgcmVuYW1pbmcgdGhlIGN1cnJlbnQgdG8gLWxlZ2FjeSBhbmQgbWFraW5nIGEg
bmV3IG9uZSwgb3IgbWFraW5nIGEgc2VsZWN0YWJsZSBvcHRpb24gdGhhdCB3b3JrcyBhY3Jvc3Mg
dmFyaW91cyB2ZXJzaW9ucywgSSB3aWxsIGRlZmVyIHRvIHRoZSBtYWludGFpbmVycy4NCg0KLVZp
bmNlbnQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
