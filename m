Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DCCCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 11:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0588C60DFF;
	Sat,  3 Oct 2026 11:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rKfDdFGaLt6; Sat,  3 Oct 2026 11:18:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 07B3960E4B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791026316;
	b=sIue8T89QNT9st2dcCuau/RgnlJllKlYbcQ3Y/8B3BKP8i4i0E7BbTFIyV6bhuHou+AV
	 1+OEIssBSrewqmIwYni9DTsnXR5u6ObmpBaUOe6Zu6T1gzo40zfQyl6jRviQmAbVoTQ1G
	 sXP8fNYBgcc19xZAED5UYRCPqYB1oChDhLd7pZLLSHf2ZU2G+Q3F+bcF4BNMuWVy9ce//
	 qTNtxm57knH2265W0QO3lcqFI2S03kH7wFt8grvOpw3RPoxBK9WctZoxeCzZsLlJzIjmv
	 i7/9xAxdyha8UmrJZ4JqwJACvNQs7Mc7hXy5/Pwtxb12hx7dOKTEX1p3e6zCpehphmA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791026316;
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
	bh=rhSN7mOuog1nhaJ6mdleCOZC1YV9ytxsAFrw2RWr3GA=;
	b=spcOuqNaZfQk+zy7MVR4oVlJw/lnbQDhKT5b7o6K0bBBTn14NiuT1p6aHZxL40s3SDPB
	 yTC9/D9e8P354Lwu3taWjpCbmCRiEizCHuDoqMbcclRlQ/kDhvh2HmziGZeph1PM94iyc
	 IgwKX6RB1fPhJ4KhKtphrKQQaiid4/spEsK/lgO8mlfKtr+FEOOe4qhZiZViygnoJnwHr
	 9iYIHXYLLmdqzOnZesajpGq5Qq49PJONEEWfJnkeBssEBu/74BiQTertQwXKioHEZjDbg
	 O9wu0wem49ECPuPdU5oado3rpp0iX1KjyqEYCisgXfZpI/d8WjH6dxDmDg1gs8hGx3Q==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791026316;
	bh=rhSN7mOuog1nhaJ6mdleCOZC1YV9ytxsAFrw2RWr3GA=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OY/2koFX2pocIgRNAZJXzX9ksD4qZTPUDuAvYqccOshyrTBLbKNmR0tj9oirPeoOg
	 L4y8pY0eYAJe+6nk0vVmkWPfrny9X64DPd8fQxvY/h1G1cIU2/4BKvpaSIbQOhrO0a
	 Sjx5S1G1vCvhIhvLmbWUG9vf/269WOHLy4IVVXTTYcySzEtGQahQMc5MxR927QTTK2
	 gdwLrKXrLHiWdv9DWsEoG4b7CHlv5LSyY74JWphNp9oXKmbUezKpMh08cTP+FwOAuJ
	 jSeb3F9DmrupVBhNZTPJ4Ubfjh+kWGsnQQRkqGgSCcMCYR7M+jnCbfFYI4G3SwmnH7
	 cZr4Ys5oZJKlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B3960E4B;
	Sat,  3 Oct 2026 11:18:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71848335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 577E3400CB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1bO9gtLtrtQ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 11:18:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DA2B240059
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::617"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791026313;
 b=LaY58OYjIq7h2vzLQsxkJDRMEU46I5vluvevgEwu00KgHtLDWMPZlvEs9xM/TNzlirPH
 jV6Ijfr7dgrA5FlFovut0Mfr7josnWcy7yYUhRnlnTALfzxbnZpf2eZGnGI+occhOBzUM
 97KqtIBjblfKekc9humjVhX7H0DV9ADxa0+7J61bUzDafSMcDW9WCWxR2nmesrzN+OweI
 ilb/5n0XebpAY78Nu6c+tAGQRffaMIlJ+aSMjtJhwI1xdDJ/aQX1zmtKjyxF1dxwG0nr4
 1wN598ByCrZ3QOxDSBjS7K0npWCiCd6y8h+KfgfyE9YwRDkttjWwwtHXcX1Li4aT0tQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791026313;
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
 bh=9HtELB/PP16mSDSwnHANOsm11qNnMfNnq3AFl6+ngvQ=;
 b=YWd2BM1GrpbC7JFgUe8f+Cjx8ubDRmVbBfRfyF3YqzYffWQLfJ4SzO0dr3cA3a72JwwZ
 opAWAaBpGnm4+l0GUuu9adnrC6FK9B4AkpblhrTDgiquvkG4wER6sBq91ryASW7KPYF99
 zSU+E0OzDxUFdd4zMo0KGFS3AqLYyWwMa9WRdldbjcf8QqpHKfLiQ9f9Yrvq5MMef3Sn5
 vhstWV8jVTNmtW2CxGjPjwmWD7rii62qVwVniCKJKwzyoETB8eZDbgs0iEq7oUrdrOpDK
 nW8Ta4vNyxc9wU1+8zAExXowsVvhT03DxoBggmINXqczbyYXDL0bXz8reB3GiilGkag==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=xes-inc.com; 
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=HYIGzxLR; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:c::617"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::617;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=HYIGzxLR
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0617.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::617])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA2B240059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=M87CJLgCsfyruMYKAU8+l7wfNKBI1z2yBJ289jG9CPWbZjh3dHQ6J5ORFylXaajkhQ/ExnU+5SLnYbY21URy8R2xg/NbhaU7P+ONXxopPF8WRtx2zYdIJEQvR6Uf7WJecxnJjoSb6U9qeihjmTazXQn3cudXMZky02lgKZogvMYtU/Z/Kunb+MZMm/SbdkeesBtWRDfN3kboGhoaKrfMSHV39WCzEEIHrWjn8PyVfIdEQVD8aRn2wsvmVOQlrq9Z+SgtjnOj41Mulw3+lmg9MfccXHpw/4di/dteC7OhWPtJa9DvuEFhukf/vx6XXZHAh8cDc5Fb583Ubfzc2s+uNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HtELB/PP16mSDSwnHANOsm11qNnMfNnq3AFl6+ngvQ=;
 b=gIC97fF+PQ27r1g0AhZDt1GPgO/djSrWnvNElwhsnNJA+CBA4bD5gGyzAsk4y+jnCnSf33XLdTJHH9qAyxj6lDJ6GfHIpyDJ2b4PXze39nymcE9M1EGcnh67SWC9ohUi1b/FyGxtZVbuk1S69IDadP4WQLozmMwObVeBv9y3Pa1p8SDwoTDv8BjMq4AM7OcUBuNRSUuqj1c+RhrflWj9YPNMlxLbM2PJSiCTLiV7UKbbt9XfIkLp1P69YM0L7shdKsMcgecIjGQ/O6PWXaCIUaJSEFwq8mv5V3yFo04ThJ+IX2LRMWSE73JWZSvQeT+Mi8fyBW7JRR8VWjEcT3pCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HtELB/PP16mSDSwnHANOsm11qNnMfNnq3AFl6+ngvQ=;
 b=HYIGzxLR47V5VR0Ypg6urCUZvuyjM3e9VF34wfOfmFoJ4Rp7kDIzoD/Ji49DpGp2DbHAYQiHO5SPo+b+WVE/if6Lhs9nSwQ3kG4cOm8wzA7RQGjbNvxSDIZj6JAqWdwIU0/dnlQD3P3s5h4kI0dpYn7z5cJTMYlGyAa7HY6H2RFAh4NDY2UQlxB0iIA9EA3u7athrsdFMPE+AhdAPDabLtoF4l7/JZ9adai+DkwLfLpmZPHdxkskyvMxjpwXxwsXMBYQ0Frdxqy8NDX/6/N/iYj7xIudC5/NE3M3wETNTsQ+gUAFCGwZQenen4AP5xGR9i3QTRZrXpWiI9/if0VVqA==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH3P110MB3107.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:636::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Sat, 3 Oct
 2026 11:18:26 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0451.027; Sat, 3 Oct 2026
 11:18:26 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bernd Kuhls <bernd@kuhls.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: =?utf-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Thread-Topic: [Buildroot] [PATCH 085/114] package/python-sqlalchemy: bump
 version to 2.1.1
Thread-Index: AQHdUyanKW7wzGZLJUyyjhzNlEN2Vrbrq4Iw
Date: Sat, 3 Oct 2026 11:18:25 +0000
Message-ID: <PH1P110MB1603F47084EE0713493D53699F88A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-85-bernd@kuhls.net>
 <PH1P110MB160389B6AC79B213507DF0A89F88A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB160389B6AC79B213507DF0A89F88A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH3P110MB3107:EE_
x-ms-office365-filtering-correlation-id: 276884d3-0699-49c4-da1b-08df21400b26
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|41320700013|55112099003|18002099003|22082099003|10067099003|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info: ps5j8HSOyb13QrecWl3LiYRullFiJlHcAU16/Sdbq2lA77bvVKs3Z7DdL77qIYi0jpViT2MKUS8gWB8BE9nvrik3MaZMRJ/m8j+V0DThGLakydI7Q2HMDRwOu2hV7OfPVXa4IH2m5dmaWJdrIx6diMO2RWcQ5++ukvWwUlfs74JJKIpPm5MAz3UvykdHOEp01MTQD0v6nay3Jl4Wa/pq9Dnh8SLkhd6et8ehj7+l6yK5CAPjOR92lNhqTiwryl1nsULbzxdHTeP/9tPDSCpjP7lyVM96VVF5VXTsh0jPIU6K6B58oK35F1BO7v2/cKzKerYxWNKJkc+IxCdtWpWOflFVzZIKL7bNHK73ZhMMRGh6lJ9TN37ZO9SBrRdV0i3WeTErkEAl8YTCtQbnwNPu/sLEk6Y1QdfUyu+ZmYhHe8v55vg/IzDDGSaylgnd1RrfEkwQEdhFnH8oii5EotqppUwzStwhbwg1MCPIsp+C5cEkFybwS/5xOpkI31lTeICx4la0AsAKVJs027V1oWkZJKdi/ZJ0xKQnqAM0TTkNQbpAWgGACWGerQMXjSCYN/WJfah8KmW+A49keZZdGcA9tDy7j2nRoBgd8Yw7StbPagGXHjBOC3kqpDCtYcSdytqNkSGw/zFZRQdzx8+n9s9PCPKRvCC4KZNcYtoI0Z41jmenVMFZBflkIRpDbZqHX+EMX5kbbQNC1jswhGBMCNWVLgqijEu0okWCCP2uVc0Dpg4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(41320700013)(55112099003)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFBMSFZJU2tRUHdCck9HNVo2RUVBQmFaWmR3MEdud09JRmp2NFpCb1l1NTJ0?=
 =?utf-8?B?YTVRVVZ4TFRBSVhoR1U5MDIxZWdQS29XZndvbWxZRWVyRnZKYllpcEVIVWNZ?=
 =?utf-8?B?aE1TdWJ0YXhZYUFBL2xrNHp6UTV0L0o0R1FwWU0xcmh3dS9OamlybDVISmZL?=
 =?utf-8?B?alZ6ZXpWVXZQTmxuNitiRE5BcjN4ZUpNamM3U0FxWEsyOHgwQ1U3bHlPUWt0?=
 =?utf-8?B?YndEdExLWXVHeTl3dWVWUWhkWXNYK1FKamlQRVdaR1M1WmZlbWNFRkdyVktT?=
 =?utf-8?B?OHBkRTYzTVV0TGlxVnE5OGRtanBuWmNEV3FFNy9SNk80VWlTb09NN1NSS2tj?=
 =?utf-8?B?Z2llL0NHVXN5d1J6Si9oS2tsS3dzWU5pN0FMSUJZV25UZDR1T1NvSkUrbWZX?=
 =?utf-8?B?R1JoRnBEdVo3MC9ENEVpQWdOdDB5NlRza1UydVB4ZWNkVXpsOWkybUxFZml5?=
 =?utf-8?B?bklyVGpvT3RmQWx5R24wT1lNM1hYbTBmQmZxL0tDSjRUZXdsbjVvMlZYWjE3?=
 =?utf-8?B?K0prbWR4aFlpa2hWK3E0eEFQQmJUU2RMaGttaWJYSnhHS05FbG5zN0F4NDZB?=
 =?utf-8?B?NlhuNGExZWk1N096ZC9ORXZ4VWJSSi9GZXRPbnFPeUZIY2lZeWRqQzNDdDMw?=
 =?utf-8?B?WkZkSk0xb1FEYjB6bDlONE4xN21ZVjdCSDIwWTI1UjE5WFFnamErUGlucll5?=
 =?utf-8?B?N2NTcjNmTktzZGFmUFJlYy9KQmxDYXVCdjUzVzBQUjNzcVJKSUVuQUpMOTIy?=
 =?utf-8?B?anNrKzMwdHROUXBWb2VwOWYvTExPYytPdFFmT2VXWHR6aTAvekxuRjdNVk9w?=
 =?utf-8?B?NlVXTkdJVmpJR1NTcDkveTc0eVdiSEg1ZEFad3diTmhSd0ZoenFheUtTRkJM?=
 =?utf-8?B?cWlTTzBOTXc0VFBKNUJVeXBWWUx4dnVPNWdya2pTQmlDMzFhVnoyWWtQcG9Q?=
 =?utf-8?B?WkxtYnRZZzVYTVJONU5pclNuWXhjaWNOaDlKT3NHNmg2eUx2TEdWcXFZZ2xW?=
 =?utf-8?B?NmRIS0F0VU5aWU1IY1dScUNhdDZkRTRPVk1ma1A1UXM4Rk9rd1lmcWsrV2dm?=
 =?utf-8?B?YU9lMVh1bDFza3gzWFpZaGUvbGtPbCt5LzVUdkhvZzgrVUZlclQwOE0xZ2Iv?=
 =?utf-8?B?MnJoTHJnRkRUYjUraVZIcCtqZ3ErNGVmWGRoT0xPcGJFTHJLZ2dPeFFFQUNw?=
 =?utf-8?B?UWN0UWpBV3RZUndvaWJFM0ZyQ0tmSkE0eTNIOW1XWWZwblVEbkMzaXBQYU5F?=
 =?utf-8?B?YlNZTk1DTVZ4UEEzMng0TmhibjR5cjFtV2MybVJTczhJSFYzSjNmM2JTaGpQ?=
 =?utf-8?B?b2phM3N0T2xINGhRZUNDWlRNbGI3SndaNkQ0cGFOdFVtZzNxTzZHcElnbXE0?=
 =?utf-8?B?UFcxUWpiV1M2SFNNUC9aV1BhWCtOaDR2YktYenRHdE9BcjQ3WXczYlRTSVlU?=
 =?utf-8?B?UTRvbTgrL3NxZTZDTmN2N0g4UnNvcU1YQlBsTmJWdnNwenVtYzB5QkJoYkdX?=
 =?utf-8?B?cHVEbzRBY25vT0hPRTdmQUtUeFZiRFZwSkdwOFN5QTdyWGpwMmFxaTdsVlpu?=
 =?utf-8?B?ek5uVzI5M0JJTi9DeXdNbkttUTR4N0ZWaVExRXVidW5OOW5xWE0yMXljeUJR?=
 =?utf-8?B?dTNmM1RRdTNDTHF5RUV6Vk5mN0tTYjd4clA2NC9TRWtKVSt4bU5RNDE3clNi?=
 =?utf-8?B?dERGM2tiSDFrbU9ueUsyQVBySytWYVJ3YzdZNWdtOFBCczFGSlUvWDFjSEtG?=
 =?utf-8?B?RDF5QkNnN0txUXRvdmVncmJNTm8ybUtqTUxpK3lhMlNEeFVERUlUWVpSSGMz?=
 =?utf-8?B?ckd2dk45TXJCY3o5MlBOZTN4S1pCYVBrTGcrRGhqQm5WdmhVeHFUL2xGRTI2?=
 =?utf-8?B?YjluOHFGLzNkZTdNWlJCdS9ZWFhuVkUzdU9kQzdOOW0xYS9EN29wMytSN1E5?=
 =?utf-8?B?UnMvRm43VjVxSzQwVmc3R2MrMmM2U1JuSWpZWlBVN09uZ0ZFUFd2aThNOHFj?=
 =?utf-8?B?c3NDRjdQZEx4THFZSlZRU1R6T1JNQmtMREpOZnVQTHowVVFZYWFJbjd0QmRa?=
 =?utf-8?B?azBHdVpwazFIVWRhVEp2Wmh3STBhVytQcEVQUDRKWGdJSzJvTXBzeWdYTitE?=
 =?utf-8?B?b0RkSy9PZjNWbTZaOUZQRncwdDJveW10aE0vcWlUa1IwcDA5NXoyMTdOT3l2?=
 =?utf-8?Q?v4Am2vEPq3IlUwFDx498Z+7N2pykULOwwqzNa+r+NEpP?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 276884d3-0699-49c4-da1b-08df21400b26
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 11:18:25.7828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB3107
Subject: Re: [Buildroot] [PATCH 085/114] package/python-sqlalchemy: bump
 version to 2.1.1
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

QWxsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBidWlsZHJvb3Qg
PGJ1aWxkcm9vdC1ib3VuY2VzQGJ1aWxkcm9vdC5vcmc+IE9uIEJlaGFsZiBPZiBWaW5jZW50DQo+
IEZhemlvDQo+IFNlbnQ6IFNhdHVyZGF5LCBPY3RvYmVyIDMsIDIwMjYgNjowMiBBTQ0KPiBUbzog
QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD47IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+
IENjOiBGbMOhdmlvIFRhcGFqw7NzIDxmbGF2aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj47IEph
bWVzIEhpbGxpYXJkDQo+IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBb
RXh0ZXJuYWxdIC0gUmU6IFtCdWlsZHJvb3RdIFtQQVRDSCAwODUvMTE0XSBwYWNrYWdlL3B5dGhv
bi0NCj4gc3FsYWxjaGVteTogYnVtcCB2ZXJzaW9uIHRvIDIuMS4xDQo+IA0KPiANCj4gVGhlIDIu
MSBzZXJpZXMgaXMgcHJldHR5IG5ldyBzbyB3aXRoIGl0J3MgcmVjZW50IHB1Ymxpc2hpbmcgdXNl
cnMgYXJlIHN0YXJ0aW5nIHRvDQo+IGZpbmQgYnVncyBzaW5jZSBmZXcgcGVvcGxlIHRlc3Qgb24g
YmV0YSByZWxlYXNlcy4NCj4gDQo+IDIuMS4zIHdhcyByZWxlYXNlZCBhIGZldyBob3VycyBhZ28g
WzBdLg0KPiANCj4gSXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgc3FsYWxjaGVteSAyLjEgaGFzIHVw
ZGF0ZWQgdGhlaXIgZGVwZW5kZW5jaWVzIHRvIG5vDQo+IGxvbmdlciByZXF1aXJlIGdyZWVubGV0
IGJ5IGRlZmF1bHQuIEl0IHdhcyBvbmx5IG5lY2Vzc2FyeSBmb3IgYXN5bmMgY29ubmVjdGlvbnMN
Cj4gc28gdGhleSBtb3ZlZCBpdCB0byB0aGUgc3FsYWxjaGVteVthc3luY2lvXSBleHRyYS4NCj4g
DQo+IEkgZG9uJ3Qgc2VlIGFueXRoaW5nIGNhbGxlZCBvdXQgaW4gQ29uZmlnLmluIG9yIGRlcGVu
ZGVuY2llcyBzbyB0aGlzIGlzIGp1c3QgYW4NCj4gRllJIGZvciB1c2Vycy4NCg0KT25lIGZ1cnRo
ZXIgdGhpbmcgdG8gbm90ZSBvbiB0aGlzIGJlY2F1c2UgaXQgYml0IG1lIGEgY291cGxlIG9mIGRh
eXMgYWdvIGlzIHRoYXQgcHl0ZXN0LWFsZW1iaWMgc2hvdWxkIGJlIGJ1bXBlZCB0byAxLjEzLjEg
WzBdDQoNClByZXZpb3VzIHZlcnNpb25zIHRyeSB0byBpbXBvcnQgYXN5bmMgY2xhc3NlcyBieSBk
ZWZhdWx0LiBQZXIgdGhlIGFib3ZlLCB3aXRob3V0IGdyZWVubGV0LCBhc3luYyBjbGFzc2VzIGZh
aWwgdG8gaW1wb3J0IHdoaWNoIGNvdWxkIGNhdXNlIGFuIGVycm9yIFsxXQ0KDQotVmluY2VudA0K
DQpbMF06IGh0dHBzOi8vZ2l0aHViLmNvbS9zY2hpcmVzb24vcHl0ZXN0LWFsZW1iaWMvcmVsZWFz
ZXMvdGFnL3YwLjEzLjENClsxXTogaHR0cHM6Ly9naXRodWIuY29tL3NjaGlyZXNvbi9weXRlc3Qt
YWxlbWJpYy9pc3N1ZXMvMjc4DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
