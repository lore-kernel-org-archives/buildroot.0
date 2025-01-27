Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBAAC02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 13:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 801C940708;
	Mon, 27 Jan 2025 13:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq4QwRr1igbF; Mon, 27 Jan 2025 13:43:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D70240701
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D70240701;
	Mon, 27 Jan 2025 13:43:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33E8CAF7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21EAB40701
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:43:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pt_4B09SegnY for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 13:43:52 +0000 (UTC)
X-Greylist: delayed 1121 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Jan 2025 13:43:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B336A406F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B336A406F8
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::607;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0607.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::607])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B336A406F8
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 13:43:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=QdjpHclAReGnJJAVwuoq9DHH7xWsAw+eJj4TSpq2ea/Ow0cmuAMa2/tvMLR7n+qnitlMrCiyUrhkbNiD9zqz+qFXKsnmNq9zOaLMn0mOYdO40klaWXx8ELoobRTfsBso+0q0T2OxkEnVO/UjpM+q5FcNlm9BeCed9mFbb4HP7NZZH25I3xAybGLDtK/NtD8y/KoSf7r6GMJ7hw/c28/LMjGs5YVIrXSQtJoSfhvm1Rtj3Y3N4Kv/nBC/BJjrR1oHw3eMig2LbITwrEAQeGFmpEzO831TtI3oES21Malx449O2UNiwzmLIdlRaC23Rq4basBGYbeqmw3HkWBpcsFaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqvSYycbsLaxkYhYI9X66UYJCJMD4OxZdD4Wxx0xOok=;
 b=Xt5IH+kmeEp7+g6aKS+RI+InHR26YblfO7yI5GBfK16pRhiU01b1GNaCVBhzBEKHU6P33UgRDkwd6k1GNwrRJKGW2ovu+P1xFIJHGd1XSItJLCEgTQVCVV8nJvrm+xAsAJb8IHKMdE7C7F6dbSpk4q4tIb/FeXHj2yP4uFGZznQoaRA7o5U1xrXFr/Er/B6wec4eVCEoGahdgNIBJMQKaxngfiEExjmdJPehZnRNAuxEMl8jc+bYS0DRCR+K4YiuZk56fVVibJah2lGmkx1G+J1L844lf2a9eJdeMflawMG+z9K8p1Mm+s/fbmlEEAI7glt/bSE/6i00e+hudEINRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1759.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 13:09:45 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%6]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 13:09:45 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>, Fiona Klute <fiona.klute@gmx.de>
Thread-Topic: [Buildroot] [External] - Re: [PATCH v2 2/2]
 package/python-emailproxy: new package
Thread-Index: AQHbcF2joT6BU2KgRUaMei6IUFAaD7MqlyJA
Date: Mon, 27 Jan 2025 13:09:45 +0000
Message-ID: <PH1P110MB1603A238B985432DAF856CF39FECA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20241211191630.1414970-1-bernd@kuhls.net>
 <20241211191630.1414970-2-bernd@kuhls.net> <20241229221255.2138fc09@windsurf>
 <e327553b-93a3-44cc-9b70-48bab7497067@gmx.de>
 <PH1P110MB1603B3EEB73618CFAF45272D9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <25105903-5086-463e-847b-d4a392f0cbd0@gmx.de>
 <PH1P110MB1603F80585C666F0A6C9336A9F1FA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <048fbeab-8e9c-474f-a8a8-8921c09b26f0@kuhls.net>
 <CADvTj4pBcw1BjMSwjvzKS0ULq2CYu1D40aVZ5hQ5_0gOCbnJRg@mail.gmail.com>
In-Reply-To: <CADvTj4pBcw1BjMSwjvzKS0ULq2CYu1D40aVZ5hQ5_0gOCbnJRg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1759:EE_
x-ms-office365-filtering-correlation-id: 99edd66f-8077-4275-27ed-08dd3ed3decf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|41320700013|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?djlsR2c1Yk5ic2U1QlJvTE4zUkcvNEtQOUhjVzBVb1BGdWd2TkVyMERvdnpO?=
 =?utf-8?B?UThJbmFSVC93UFNlT0F2ZXBRWFBFVDd0WjFmc3RUQkhXSm5UbFdlbmdyYUJL?=
 =?utf-8?B?RWpQZks5eTBlbWlDSkhYakNzSkZwaE5jZ0duYUF3NExPWlhZM2x0VDJ1S0dL?=
 =?utf-8?B?Uklsc3pTU0dLOFlLZTNhMGR3c1RKSEt3cnM3cFVHUWJyciszUktCSWZHV1hr?=
 =?utf-8?B?T09kZi9xWnIzTXZpR3djZ3NXTE11VGp1Uk42bi9OeWxmWFFSR1R3VEZsZ0lt?=
 =?utf-8?B?aDdxNzZLV0ZnWGlnd0wxYlQ3eFpXcEUrVWRoRkY2T1gxQUh6em1qT2ZIeVdp?=
 =?utf-8?B?bkdaL0xuVmdCcnAxOFlzYzBrV1lDczJXK1dCSnlRb0tkTm1GOXR6NXdzWG8z?=
 =?utf-8?B?bVVlaFFuTk02OFk2UGx5cVFRQnArUTVMeCszQWRTd0poVFlUR2ptRllhNXY5?=
 =?utf-8?B?bEFQMEpVV2VOVGFUQUZzcFR3RFJIZ2JyU3NLOEZmM0x2MWlXNjJiN05ZUEx3?=
 =?utf-8?B?emx3UGJkdEpFWUJUbmErd2RvWlBvRnJuczV3VERsYmZMcE1pVXhibHd2d1JL?=
 =?utf-8?B?dEYzZEZaQjhiSU9jbFlTbVhDTkRFSEE2NmJjaGZWK3hENUJ0RzVnMlVTb1pX?=
 =?utf-8?B?RmJuNjVnc3V1SG90ZURyYStZdHVUWVJYUExtM0FNS2xRN1NSSk1EMFdFTzlY?=
 =?utf-8?B?Rktmc3N5a1JMa2h2U2FkT2wrMEhzYjhlVEVYWnVOK05yUlZlb3BQKzhRcU5N?=
 =?utf-8?B?bFNFNm5WaFdYYjVQTWI0bGFWeC9vUzNqZXN5VHJwcFc0RjBwM1FheGdGUC9R?=
 =?utf-8?B?RUQzeFpQTHIxMzl6YlFHby9rWjRDSnRFMW00RXFXeXRaN0NKRDVERFllUmlK?=
 =?utf-8?B?SldrT0FNN0xtSmZxNSt1SWoveldHVXZXZTI0dVRndUVTNXUyWUkwd3RxVHdz?=
 =?utf-8?B?QkdCcjV3Z3pnNWVXWTZ3Zk03VHZ1TFFSN2JNZ1pZUUh0elVMWXhJUmIyaWZJ?=
 =?utf-8?B?VmdVNTAyTkx1Zi82cldxeXJRcU56VHY3UmdkMytkKzE3NG1kNUVYTVJqaUlL?=
 =?utf-8?B?N0FCbm9GbWZsbWNHeEJFYVZuSHR0WmlUeElhRWNzZlpZQzA1K2NPUjBJY0ZJ?=
 =?utf-8?B?S2d6b2l5emcvOFZiV1p1Z3F2bVVWaG1jQnpaWFhzTjhUUnZIYXYwQnBsUEZx?=
 =?utf-8?B?bjVnNHRSSm82ZFJBSTkyODNtWWt5WTZYTmphZHNTQ1BRZTZYTTJvUlhTVW44?=
 =?utf-8?B?d1F5SDY0ZVh5MU90TTl4U0lZNTdmWVdQcGg1akVnUXFIam1wWkdwZmxESW9o?=
 =?utf-8?B?QzZMYXhocTQvZzNBQjlzYmtpTmxGcmtHQ2lMTkpDNmJRNzJFYkNIaUdFYkxw?=
 =?utf-8?B?b2pyTEIrWHlRbzEzQUFYekxMdlR2WElnOUc1aXdtbHBXNllNS0YrckFTekNK?=
 =?utf-8?B?Y0NJV0NNbXo4NUJrMExRbTA5NHA5NkZ5U1pjR0s0a0xFM0lkU3pvZzdZZitJ?=
 =?utf-8?B?OW4zcXNzVDdZVzlZWmNaMFBnaWV1aXFBUEIwbHg1UStQNTdlbWs3UmFtYlIx?=
 =?utf-8?B?MnJ1T3VBU0hsd2JUMXFYK3doZTRORnNOTEloVlp1VWI4bDd2MkJFamJ1ODVy?=
 =?utf-8?B?N0ZlNjlCVkVieFJ0UUd2VDVUbUQ2c0NFdG9BNEFoME9UazVjTEpHNUp4Unkr?=
 =?utf-8?B?RndLekwvZER1SG5zdDBMTm54VzRhSloybkhQczFhU0JObWR0TVQ0ZlpuL1JC?=
 =?utf-8?B?OVFPNGNQV3JxemJFcG1GVkxLVWw0ZlhDN24rZjArNUQzUEZPQ1U0NFBRcjlt?=
 =?utf-8?B?R2lweUFFRUJtZTZFaGN6WUJzSWdsaFVtdDBjTVQ4UmJqWTJ6cC9ZTlJzSVM3?=
 =?utf-8?Q?zo8h6O02d/A6O?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(41320700013)(10070799003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFJpTENEQ2FmSEloV3F5WVAvd0E2MXlXaWwvT2ZHQlpkMHdVQytHWkNBOHpa?=
 =?utf-8?B?L0tjMjloKy96UHVlNmRVZTEySkROU08wK0FtcDRDT0s0eTNyUFI5YmVidVpN?=
 =?utf-8?B?MGVMODlzRVljOVlOWDlqNHpycE9xc0RMMUxMQmtDZzlVZmVGZkVTUVBWVHc1?=
 =?utf-8?B?YjRYbUN1eENNS1VGN09qUE1wbG80UU1xTE5MYk5idDg2RWJGN2k3M2JlamtD?=
 =?utf-8?B?MWRQa2s4Q25LYlFwU01qcm44bmVHZC9oNEdocndWUWJOQm9EL0VZbGV6dlBY?=
 =?utf-8?B?MEVWelVDc2I5ZURIczgxQU9EQWRaOGNmUGRuNlh1Zld0V2UrWW9QS1ZBOHpP?=
 =?utf-8?B?aUdtVzdoUHljUG9HR1lVcGk3aUxHNzlpeXRVWVVXOXo1RkdMNUNJbUdOQ3Fl?=
 =?utf-8?B?eVVCcXJzN0FjR0xSNDJhNnp5QVF2bFZ5N2ZDRjdBcktDTGNmLzd1Z1V0cWdM?=
 =?utf-8?B?WXVvYVJaVmpUS254Njk3WmJja0pILzhVdVpKTFBGRk9GczdqV1RPMkxUdit5?=
 =?utf-8?B?a2prNlBvSE1wNTlEajZhSW1YYU93UU9VbzlFRklvMm44N29QNmJxTDBiTS9u?=
 =?utf-8?B?REFFNHNOVFZXV1d4ZVl0UFlLNzVET0RVNDY2L0UxcEppTVJwd3hVdG5NejFV?=
 =?utf-8?B?QkNqN1JEZCtzS1hINTUxZWlPZFZnekYyYnVGSk5iQ2lQMklIT1ZEaDVCZTM1?=
 =?utf-8?B?RUhsNGpxdnY4NlZ4L0pJbWFlKzI0Yk5NMDhRWlNXRXAyQ1ptRXRnaHkrRzB0?=
 =?utf-8?B?ZDNPbS9aeVFmcWFWeUJuZDdxamNhRjBxZ3RlemZ3cFV0TGgvakdQakxCSkFl?=
 =?utf-8?B?ZjJ0cmdsWDJqYnMvWGFTY0FJekVJcWdQNjd2RkJXL0N5VFZhTUwrMVpiMHp6?=
 =?utf-8?B?QmlCVlA3bjVNWS8rQ0lMZDVOUnRmZ0Izbkd2VnVIaFpUN3kxVmlmZ0E4aGgv?=
 =?utf-8?B?cGhaeWVlc213L3kvOEFtRVo1c0loanJ0T09YK0ExMkZncFRMaStxUFRMd28w?=
 =?utf-8?B?aGErMlp4ZVVlbElZWDYwT0JQTkk4bGlwVm96amQ2dURiME9JNE53TDJSWkpD?=
 =?utf-8?B?MlZRWUFvZjhHVHNqdE96aEZZTkZCSjV6YmpaWGdzZ0VEWk1VK2QwdGZGbFJG?=
 =?utf-8?B?VlNidkgxTGJGZ0Z2ZlRuNW16dzMzOGtpR2VpTDZUOENqcTlIRWJGcE9DdkVV?=
 =?utf-8?B?bXVpT2N0TGQ3Z05CRzlGOEdlcmh4RGJtNDRmc015RndPeUZkcjNFVnY4WkFz?=
 =?utf-8?B?MmRYdVptSmFNb09ZU3doWGxrY0o4RkU0NHUyaUx6VGduMjFBaklSQXVlek1F?=
 =?utf-8?B?ZENvMjk5bFVuS2o3VlN3ZThFMElNN2kwWkdaaEpENHc0L0QzNnVmTVNPaFZK?=
 =?utf-8?B?bkZweHJoQXBTZlM0WEMva1RwWXJkUnZKQzJuWVkzZnA2N1dmVHgzNWJ0YzAv?=
 =?utf-8?B?TW00TUhWN3NzdjFIZVBvY3BickJmMDJ3S3VuQ29laGwyMWg1WlNFWlJ2MTdp?=
 =?utf-8?B?aVZ4Vy9hdisvd1o5U2sramN0ZUNDNjVQVDUwYU8zb1pQS09DQ2ZsdWgydnNB?=
 =?utf-8?B?dXpNQ1oyTVdmSGtmNGpWbW5mYUVYb01VaUczMkNxNVh2T2EwQTdSdEd4ZW1J?=
 =?utf-8?B?TkZlSGVmNTh1b0d6UTkvT0lrT0hlU0lSdktLWEM2di8vbzlCWGZWdEZOMFhV?=
 =?utf-8?B?K2QvcVV2UkxIaTBIY0J4cTNXNjRvZXRnOGkrVTlRUlo5QTRTQkJybEIyZ0lo?=
 =?utf-8?B?T25iQURUVGhhZW5xNUtPVGthdmNRVmtxR1duU3lZbVI2c2dvamhXSlRLbGlz?=
 =?utf-8?B?a3pmSE4zT2oySlZTWjc3RHBjcm9NUlRtSnFrOTFraTRobVZXZlVOenFiZUNZ?=
 =?utf-8?B?aXQzeUZqQnYrdTBJTWdtVlVzNzZ3Vjg0QnhsMlZ5bTVxbE82RWxkWTJ2c3dE?=
 =?utf-8?B?b3o2Z0NnemNsc1l6aE5jMHQxcjVqVDhkMkhMOGVZVTJJYnRMRzlmbVBPNGhQ?=
 =?utf-8?B?eGFHa0FPNCtRPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 99edd66f-8077-4275-27ed-08dd3ed3decf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 13:09:45.3210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1759
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqvSYycbsLaxkYhYI9X66UYJCJMD4OxZdD4Wxx0xOok=;
 b=ZCoRAMTkkANMKuPXB3QL/UBTA7w34eyRO8c5C0bXNDr+0iSC3wHg8Gw8yZOrm0yuMqdzb39iI+56DJBOCTcu2ntSE5Xqfyd7HHaS5cHXBhvaG/3kM4gxSqrJmPqjUDZHT0IqQCU/qx2cv/0Hj1Kma2q0nXF0evD4eoAKlauGDSETrOLcQgt6HmZMWXzdhxE1ZKaOSHGK7rN4+BmuRmEu3MUi/2iXxAWR1Bh3Xyu4cJh3fYw6giagkj6GbkRhlMlly5NxsMoIefcyenibmH0EU4ljCEVjdr8fu812MK6J0GAV9gjdg9J0X6vp0FwdpnkanYLQQq7lB3u51+T81nfhNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=ZCoRAMTk
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH v2 2/2]
 package/python-emailproxy: new package
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+DQo+IFNlbnQ6IFN1bmRheSwgSmFudWFyeSAyNiwg
MjAyNSA3OjQ5IFBNDQo+IFRvOiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pg0KPiBDYzog
VmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgVGhvbWFzIFBldGF6em9uaQ0KPiA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT47IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnOyBG
aW9uYSBLbHV0ZQ0KPiA8ZmlvbmEua2x1dGVAZ214LmRlPg0KPiBTdWJqZWN0OiBSZTogW0J1aWxk
cm9vdF0gW0V4dGVybmFsXSAtIFJlOiBbUEFUQ0ggdjIgMi8yXSBwYWNrYWdlL3B5dGhvbi0NCj4g
ZW1haWxwcm94eTogbmV3IHBhY2thZ2UNCj4gDQo+IE9uIE1vbiwgSmFuIDI3LCAyMDI1IGF0IDI6
NTfigK9BTSBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PiB3cm90ZToNCj4gPg0KPiA+IEhp
IFZpbmNlbnQsDQo+ID4NCj4gPiBBbSAxMy4wMS4yNSB1bSAyMDozOCBzY2hyaWViIFZpbmNlbnQg
RmF6aW86DQo+ID4gPg0KPiA+ID4gSWYgd2Ugd2FudGVkIHRvIHJlbHkgb24gc2V0dXB0b29scycg
ZGVwZW5kZW5jeSByZXNvbHV0aW9uLCB3ZSBuZWVkDQo+ID4gPiB0byByZW1vdmUgdGhlIGAtLW5v
LWlzb2xhdGlvbmAgZmxhZyBpbiB0aGUgYnVpbGQsIG90aGVyd2lzZSBpdA0KPiA+ID4gYXNzdW1l
cyB0aGUgZGVwZW5kZW5jaWVzIGFyZSBhdmFpbGFibGUgd2l0aGluIGhvc3QtcHl0aG9uICh3aGlj
aCBpcw0KPiA+ID4gd2h5IHRoZSBob3N0IHBhY2thZ2VzIGFyZSBuZWNlc3NhcnkpLiBJIHRlc3Rl
ZCBkcm9wcGluZyBgLW5gIGZyb20NCj4gPiA+IHRoZSBidWlsZCBjb21tYW5kIGFuZCBpdCB3b3Jr
ZWQgT0suIEknbSBndWVzc2luZyB3ZSBkbyB0aGlzIHNvIHRoYXQNCj4gPiA+IEJSIGlzIGFuIGlz
bGFuZCBhbmQgc2VsZi1jb250YWluZWQuDQo+ID4NCj4gPiB0aGFua3MgZm9yIHRoZSBoaW50LiBZ
ZXMsIHJlbW92aW5nICItbiIgZnJvbQ0KPiA+IFBLR19QWVRIT05fUEVQNTE3X0JVSUxEX0NNRCBm
aXhlcyB0aGUgYnVpbGQgb2YgcHl0aG9uLWVtYWlscHJveHkNCj4gYnV0DQo+ID4gYnJlYWtzIGRv
emVucyBvZiBvdGhlciBweXRob24gcGFja2FnZXMuIEFkZGluZyAiLW4iIHRvIF9CVUlMRF9PUFRT
IG9mDQo+ID4gdGhlc2UgcGFja2FnZXMgZml4ZXMgdGhlbSBidXQgaXQgd2lsbCByZXF1aXJlIGxv
dHMgb2YgcGF0Y2hlcy4NCj4gDQo+IFllYWgsIHNvIEkgZG9uJ3QgdGhpbmsgcmVtb3ZpbmcgLW4g
aXMgdGhlIGNvcnJlY3QgYXBwcm9hY2ggaGVyZSBzaW5jZSB3ZSB3YW50DQo+IHRvIG1hbmFnZSBh
bGwgdGhlIGJ1aWxkIGRlcGVuZGVuY2llcyBhcyBwYXJ0IG9mIGJ1aWxkcm9vdC4NCj4gDQoNClNv
cnJ5IEkgd2Fzbid0IGNsZWFyIGhlcmUsIEkgd2FzIG5vdCBhZHZvY2F0aW5nIHRoYXQgd2UgcmVt
b3ZlIHRoaXMsIEkgb25seSBkaWQgdGhpcyBhcyBhIHRlc3QgdG8gcHJvdmUgb3V0DQp0aGF0IHdh
cyB3aGF0IHdhcyByZXF1aXJpbmcgdGhlIGhvc3QgZGVwZW5kZW5jaWVzDQoNCj4gPg0KPiA+ID4g
SWYgd2Ugd2FudGVkIHRvIGF2b2lkIHRoZSBob3N0IGRlcGVuZGVuY2llcywgd2UgY291bGQganVz
dCBwYXRjaCB0aGUNCj4gPiA+IHB5cHJvamVjdCB0byBoYXJkY29kZSB0aGUgdmVyc2lvbiBhbmQg
bm90IHJlbHkgb24gc2V0dXB0b29scycNCj4gPiA+IGR5bmFtaWMgYXR0cmlidXRlIHJlc29sdXRp
b24sIHRob3VnaCBpdCBtaWdodCBiZSBiZXN0IHRvIGRvIHRoaXMgb24NCj4gPiA+IHRoZSBsYXRl
c3QgdGFnIGFuZCBub3QgMjAyNC45LjEyPw0KPiA+IERpZCBub3QgdGVzdCBpdCB5ZXQgYnV0IHdv
dWxkIHN1Y2ggYSBwYXRjaCBiZSBhY2NlcHRlZCBieSBidWlsZHJvb3QNCj4gPiB3aXRob3V0IHNl
bmRpbmcgaXQgdXBzdHJlYW0/DQoNCklNTywgc2luY2UgdGhpcyBpcyBhIHJlcXVpcmVtZW50IG9m
IHRoZSBCdWlsZHJvb3QgYnVpbGQgc3lzdGVtLCBpdCdzIGZpbmUgdG8gYWRkIGEgcGF0Y2ggZm9y
IHRoaXMgd2l0aCB0aGUgdHJhaWxlciBVcHN0cmVhbTogTi9BDQoNCldlIGp1c3QgaGF2ZSB0byBk
ZWFsIHdpdGggcmVwYXRjaGluZyB3aXRoIGV2ZXJ5IHJlbGVhc2UgKGhlbmNlIG15IHN1Z2dlc3Rp
b24gdG8gc3RhcnQgd2l0aCB0aGUgbGF0ZXN0IHRhZykNCg0KPiANCj4gV2FzIHRoaXMgYSBidWcg
aW4gdGhlIHNldHVwdG9vbHMgYXN0IHBhcnNlciBtYXliZT8gVGhlc2UgZHluYW1pYyBhdHRyaWJ1
dGUNCj4gcmVzb2x2ZXJzIHVzdWFsbHkgdHJ5IGFzdCBwYXJzaW5nIGZvciB2ZXJzaW9ucyBhbmQg
ZmFsbGJhY2sgdG8gdHJhZGl0aW9uYWwgaW1wb3J0cw0KPiBvbmx5IGlmIHRoZSBhc3QgcGFyc2lu
ZyBmYWlscy4NCg0KSSB3YXMgZ29pbmcgdG8gc3VnZ2VzdCB0YWxraW5nIHRvIHRoZSBzZXR1cHRv
b2xzIGdyb3VwLiBJIGhhdmVuJ3QgbG9va2VkIHRvbyBjbG9zZWx5IGludG8gdGhpcy4NCg0KSXQg
d291bGQgb2J2aW91c2x5IGJlIGlkZWFsIGlmIGl0IGp1c3QgbG9va2VkIGF0IHRoZSBBU1QgYW5k
IGRpZG4ndCB0cnkgdG8gbG9hZCBldmVyeXRoaW5nIGZyb20gdGhlIG1vZHVsZS4NCg0KDQoNCj4g
DQo+ID4NCj4gPiBSZWdhcmRzLCBCZXJuZA0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0DQo+
ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
