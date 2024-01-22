Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168FCC47422
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 02:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1533F415F4;
	Mon, 22 Jan 2024 02:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1533F415F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qFG4Lt7w0lX; Mon, 22 Jan 2024 02:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45D77415F1;
	Mon, 22 Jan 2024 02:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D77415F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C937A1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 02:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9035A60AB1
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 02:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9035A60AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axMvnqbdGOvC for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 02:12:31 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::718])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 663B460592
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 02:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663B460592
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hq8vuRt/y6u6coFoP4WQ6vvxysEbc9deBYWm1wvNvM0cvfRkpm1cGlQGCbN6Kgl6ezgMPfrvYnDBcGZeGyVt5AtkrA+CS6JUOPJhewLow1oZ4fAhe2hdwTdmnzbupZwONGpI/rQmMKJu4ecB1XNNaWrM2pSrYemh4q4ZxvqSoJEl1JT1nBzBZiJtkkggnTVQJsvhws60i1omL5nlJ1lXaTMlQH+K5M9CG+sJIiJoXF70xhOkwccXgK2TMaJZiPU9oNJ+Szq1dkBU2I2fdje6jT6nzYU0ya8kag6Jthnz+60h6yEn7Z34sa05p4s2tNLgiem1npZrQz3RjBClWBHPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHqcspg532g9KHYkJFSU8Y37sN3v5IyLYYrF/14anDA=;
 b=B4AEBZK+dPy/OsXpg37ucwK8SLIZczsYhGpPxO9i3iOxZCat8ng22O2OUu1gaQ/evYL0Q0rcb1yaNrv04Cl+1ax7gSVzSW2whO/KHJpjtBAuIiWiVEObgd4usQf+Wf2VGyt7wCo1j2n4gcODGJGhqJXlxcfUKrx1T8meRIhpXzBGiAdgg3hkGJXFFVVteSCob9DADuwgasbHt3oiyNtIIQs5dqdXoiZLC9RYG2BieNQqvi5MG8FeNjqvg7Ar7lSa4HpAY26i8ByZuJqErTD2UUYzoRo8QT7TRaKdUqx4UtkvNBb8fZ+TzWesOZ6Mxm7YP1MBQzgWmr6jOH/hJkUBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com (2603:1096:990:16::12)
 by SEYPR03MB6996.apcprd03.prod.outlook.com (2603:1096:101:bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 02:12:20 +0000
Received: from JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::3a7f:117c:235d:5bc8]) by JH0PR03MB7468.apcprd03.prod.outlook.com
 ([fe80::3a7f:117c:235d:5bc8%7]) with mapi id 15.20.7202.028; Mon, 22 Jan 2024
 02:12:19 +0000
Message-ID: <4b9cd30d-bb10-4db4-b285-c3c4e3155a63@amlogic.com>
Date: Mon, 22 Jan 2024 10:12:16 +0800
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240119031503.2967130-1-yang.li@amlogic.com>
 <20240119122342.6230902d@windsurf> <ZapsMGs7sk3V0SMo@tl-lnx-nyma7486-2>
Content-Language: en-US
From: Yang Li <yang.li@amlogic.com>
In-Reply-To: <ZapsMGs7sk3V0SMo@tl-lnx-nyma7486-2>
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To JH0PR03MB7468.apcprd03.prod.outlook.com
 (2603:1096:990:16::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7468:EE_|SEYPR03MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cf6a4c-6063-4703-fd9e-08dc1aef8fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62NowFudrX13rkVV9oVvAVaKoQexSStKFkRjCOXrBKhvX4qFLcJKUkzL+SMQivVxe5u7zf0sp3Flf7cWXRzvIo6Au+gQzB5ETQexvHfdlPspW18AaIhvEPCfpfQttKpMATq/zvvTpM+QF4NXCIQbWVjJ9EM0qar6g2OJf+HYvIMc1W9szmcZFOQqMrUpXmBcw3WmMWQzi3sJVkUYkNy8MiRc4CbJkxMb6eHy74xIX1uRPBs01jcd1+aoqFgXFuERYR/OMUSaAmsKQry2VjCTFjciMZz6JGKfXjS9A9LQSB6naeuUTOy+XGo+YJkJyCqkoESCHqPu8BRk5sJgImooDdrmZkLoc+DxRSc6slnktL2YxX5JJKXJpc6RxUQo4dMon6+L/k6kEqDV/7+hnJzOZJUqOm8C5pzFZpbFwstuIAP7hp7s4Rl6++qodx38cBjeB827ooj5bTOgBqAOTWptdsoqJ7qKHSpRmOg5aDWR8uXXTQFIS0fccpESqHpxa23CrwKzUtp2qKs5Vk4oRfCX5kgJ9xHir5Cgj326XkeGCAQ7VAnV5PMnb5iMYAd02Be+rf2IuBOvEdNkJo5reRd62vv/SCt7KsZr9NEdHHlU+S20rbXUOX4kQdm+UUPyFkXNOjJM4u8BcLNqdWsyNUeK4lEWUbBBV5Pmy7nVYKoQyYPkAtjhtvYRd5T1dFuF18JneADdvrF3WrAHflPG7coERA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JH0PR03MB7468.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(376002)(396003)(366004)(136003)(230373577357003)(230473577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(36756003)(31696002)(86362001)(38100700002)(31686004)(2616005)(26005)(83380400001)(6512007)(966005)(6666004)(6916009)(478600001)(8936002)(8676002)(53546011)(6506007)(316002)(66556008)(66476007)(66946007)(54906003)(6486002)(5660300002)(4326008)(44832011)(2906002)(41300700001)(45980500001)(43740500002)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWtOVGs1UTY5S2I2aFpGakdDeDVnNWd4VHhyK3NzN2xJdnhQK0EzVTYvTFpP?=
 =?utf-8?B?ZndPK0pBN1dLZkRYK1JxSjcydE5ZRnZSbmxmc25Qai9peFNBTmh0MDV0c3B1?=
 =?utf-8?B?RWRXZDJSSEtUY3ZiTGJZU01zMDlVUUlvUm1MNWZWbERkb1FWc1ZFY3FaT01t?=
 =?utf-8?B?bmN5NUVVWGNyOW5DbUtOWlplbVBCUVprZUFISU1LbTJyaCtuUXRvWGU0eS84?=
 =?utf-8?B?bmNwaisvY2dzS0ZrZjZyaEFoclZkbytySWpxNXJqM210QTQ4ajVLS0tnTEs4?=
 =?utf-8?B?dGlJam9oSEM1T2hweDdzQVFjUUZYOUJVWTNOdm9RNDU5aTdFRFRQUmVwZFhq?=
 =?utf-8?B?OVlnOGdMR2pPckZmdkd5WlVUUHBGSDQxdzVBVXA4aUdNeEV3aFYvWkZ2dFhx?=
 =?utf-8?B?OGtsQm5veGJ4L0pGb284OEM2QnJrNmJLNjVocU5zUi9XUGVtS3hMclZ2clVN?=
 =?utf-8?B?Y0NuWWZKVjlMMWM3anptT0JUZDROdDNJMmpRd2hSY1Q0RUdPSzRsSkZEUFpy?=
 =?utf-8?B?RTRubTg4MENhY1RPQlFkbksrLzdaYUJKQXdwbWZEaXlKQ0ZJbG9XREUzalFt?=
 =?utf-8?B?ZWJJdGhvWE52M3RScSs3bkhsQ3JqSkFWdTJ4blhjdDVhU1pNc052dTJWd1oz?=
 =?utf-8?B?MTEvUlFVUXJMaUZwalhvNlVXVXhrZ0ZZL21oaDVjdVZwODd2WWxmUnNUYm1B?=
 =?utf-8?B?MmVMQXRHeHRjSDhwNmU2R2NUTWlYbUtnbGFSbzVsUzlsWWVLcGZCS1BsRmNJ?=
 =?utf-8?B?Ti8vVi94Q3ZwTEorSjNaQlRSRjUrdXRQbkNNTVdzRnA3b2pINCtaa3ZneVlm?=
 =?utf-8?B?aTFKTHpUNlJlVVVQSGFJY3hhaDlWb0lsaUhyZEpsQVJHNUMzcTYwTWJUL1E5?=
 =?utf-8?B?MEZ1K1ZHQS9rMTgzWlJjWUVicEFqY0MzYW9vbEVVcS8zUU5DRjljOEVGWk51?=
 =?utf-8?B?WFNQaDV4S0dxNFlMc3FhcGVQV084VUpqUWZHZE54ZXNXTHNuVXc2UUY5a2hV?=
 =?utf-8?B?L0ljRlQ5TTNjSFlyVkU1M1RMK3diN1VLZzRIb2ZZUzZYdGR3QTZUeU5KMjhl?=
 =?utf-8?B?SmtRUFFGcVVQUWhKVmVadmhFUjlsVWdsSnNIZ0hEdHNETFA3bHNXRU1LZDNE?=
 =?utf-8?B?dEt2cnA4eG5DNm9OcDRxUEVVYzg5bkR1SmRESWRJL1lkMTh6aW56OFAxNzk4?=
 =?utf-8?B?REM0Q3dvT01RcXE2NjVZNDN3ZVdUdUJpNVpHOTBIMTV2TnRyOTBUYlB1V0Yw?=
 =?utf-8?B?bTk4djZsWE1JMEJFMi9JK2RoVlRqV2lSdW4xdG44ODRDWjU3akUzVUJTdytq?=
 =?utf-8?B?dk1pRzdTa0wzTExtYmhCTVhjbGpTL0R3MGhZdy9jdjZlS1QvL3hFSUhyS3pT?=
 =?utf-8?B?dDVaUjVJUHRnU1dzQ0dQNHBsVGY3MVBYaldIVE5xRS94SUdQcFZDMFdJUElD?=
 =?utf-8?B?cCtObkFvdXZPTXhpRnJXdHloaS94VHBSK0FIUCswZTBFWDF4YStTbzJXZ1l5?=
 =?utf-8?B?RVg1VGxGWXlIYXZTaWFrUkJIb01mVFNJTFlUVXpCVFhCT3FGTFlhTitsOVI2?=
 =?utf-8?B?MzU4ejJJbDloS3RPVzZhYnFwQVE1TzlmZDcwcFZ0eGV0REJDVlhpeTFIeEZZ?=
 =?utf-8?B?dUJpNklXc2pzYUpxZHpISlBrOHIrWFl2WEJxeHR6K2F1Z1NPZVBZY1RxRGll?=
 =?utf-8?B?N0FPWW9ZMnMrbUF0dVpoaG0yYVdjY1ovMTBmei9MWEFhNGl0S2hnV3luc2NJ?=
 =?utf-8?B?bUNyYW8zOW1aQWpLOXFlZms3dGtOOG83aStsNXVnSUM2U09pelhRM0lTL3dW?=
 =?utf-8?B?dDN4UTQ1aU9CVEpXYWQ4NXNQMFRndTJCMjg0QUlZZUpCZ1FQSWh3amRnSXcz?=
 =?utf-8?B?R1BNaDJpTTVPcnk1eUt5VG8rUHVhTnpvQUpFZ0QySXFjejBoTTNiSnlkbjFz?=
 =?utf-8?B?VlErWm5YSkt6V2VPQi81V3lNclRnYTlxRHlqY1RJc0xmSEt5YkJOUElORUx0?=
 =?utf-8?B?M1NHVGtzWkhSanAyd01ZU3pudzdZRWFsWmlmRERoNWt6V2lDcHpFVllrS1R6?=
 =?utf-8?B?cHBoYzlGZEVoT0dKNUYxNjY0bkd0bnpvMytVTVpNRjl4cnVKVnNtTWRucjBt?=
 =?utf-8?Q?nG3ExUEduRpkU6UZ5Icx0KMGu?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cf6a4c-6063-4703-fd9e-08dc1aef8fed
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 02:12:19.5161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aD2UWd7wjElqOht7uwqZZ+JvTM+qR81cDOFHVKGoKLcXADwvkKmBov+MmcFCnLEnBq7HZRqp3++h6xWAFf+VhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6996
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amlogic.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHqcspg532g9KHYkJFSU8Y37sN3v5IyLYYrF/14anDA=;
 b=ndLl7pUc0wGnd/6YR6IcHB4bLir4+NW0J4UtNwhligAiN+Gp7mXn/ioZkEpFOpPhrn4ujl6vlvjQVgBlTK871EhvqpMYrLIMdh+r+1J/pDhA4/MgXLEyfoGXT6W5TNWWz5vcpiISKCnqo3mudrXIRbygho6CK3uiVpoTmktRue4h+4GFTKxTtYBoRyymZeReJDrC5QIlbAu8zZXj7cvFXAFh6PQetFhSekrh/AdY8JQ69CBg+ylcjdbYjm20+M7um0HiD6Yy1Gv8tz3aXPm2fThBfxf/s3wTbpSJQ29DPOAMTNR/dWalmsoF31K2LSYsOtavD0seJ/xIuNvEjlEkEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256
 header.s=selector1 header.b=ndLl7pUc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add scripts for
 Amlogic
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsCgpPbiAxLzE5LzI0IDIwOjMzLCB5YW5uLm1vcmluQG9yYW5nZS5jb20gd3JvdGU6Cgo+
IFvkvaDpgJrluLjkuI3kvJrmlLbliLDmnaXoh6ogeWFubi5tb3JpbkBvcmFuZ2UuY29tIOeahOeU
teWtkOmCruS7tuOAguivt+iuv+mXriBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRl
bnRpZmljYXRpb27vvIzku6Xkuobop6Pov5nkuIDngrnkuLrku4DkuYjlvojph43opoFdCj4KPiBU
aG9tYXMsIEFsbCwKPgo+IE9uIDIwMjQtMDEtMTkgMTI6MjMgKzAxMDAsIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4+IE9uIEZyaSwgMTkgSmFuIDIwMjQgMTE6
MTU6MDIgKzA4MDAKPj4gWWFuZyBMaSA8eWFuZy5saUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+PiBB
ZGQgc2NyaXB0cyBmb3IgaW5zdGFsbGluZyBBbWxvZ2ljIGZpcm13YXJlLgo+Pj4gK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfQU1MT0dJQykseSkKPj4gVGhpcyBvcHRpb24gZG9l
cyBub3QgZXhpc3QuIFByb2JhYmx5IHlvdSBmb3Jnb3QgdG8gYWRkIHNvbWUgY2hhbmdlcyBpbgo+
PiBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL0NvbmZpZy5pbj8KPiBJbiBmYWN0LCB0aGlzIGhhcyBh
bHJlYWR5IGJlZW4gYXBwbGllZCBieSBZYW5uQGhvbWUgYXMgb2YgY29tbWl0Ogo+ICAgICAgaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzEwNGIwZmVl
ODM5ZDNlNDg4NTMyOWU3N2QxYjhkNTUzZDU1MmZiOGUKPgo+IEkgdGhvdWdodCB0aGUgcmV2aWV3
IGNvbW1lbnQgd2FzIGV4cGxpY2l0IGVub3VnaCwgdGhvdWdoOgo+Cj4gICAgICBodHRwczovL2xv
cmUua2VybmVsLm9yZy9idWlsZHJvb3QvWmFPaVpOVnZPN091SzNzQ0BsYW5kZWRhLwo+Cj4gICAg
ICBBcHBsaWVkIHRvIG1hc3RlciB3aXRoIHRoZSBhYm92ZSBmaXhlcywgdGhhbmtzLgo+Cj4+IEFs
c28sIHVzdWFsbHksIG91ciBvcHRpb25zIGFyZSBub3QgcGVyIHZlbmRvciwgYnV0IG1vcmUgcGVy
IGRldmljZSBvcgo+PiBjbGFzcyBvZiBkZXZpY2VzLiBXaGljaCBkZXZpY2VzIGFyZSBzdXBwb3J0
ZWQgYnkgdGhvc2UgMiBibHVldG9vdGgKPj4gZmlybXdhcmUgZmlsZXM/Cj4gSSBhbHNvIGNoYW5n
ZWQgdGhlIENvbmZpZy5pbiBlbnRyeSBmb3IgdGhlIHNhbWUgcmVhc29uIHlvdSBub3RpY2VkLgo+
Cj4gSSBob3dldmVyIGFzc3VtZWQgdGhhdCB0aGV5IHdlcmUgQW1sb2dpYyBCbHVldHRvdGggY2hp
cHNldHMsIGFzIHBlciB0aGUKPiBwYXRoIG9mIHRoZSBiaW5hcnkgYmxvYiBpbiBsaW51eC1maXJt
d2FyZToKPiAgICAgIGFtbG9naWMvYmx1ZXRvb3RoLyouYmluCj4KPiBUaGUgcGF0aCBpcyAnYW1s
b2dpYycsIHNvIGl0IG1hZGUgc2Vuc2UgdG8gbmFtZSB0aGUgQ29uZmlnLm9pbiBlbnRyeQo+IEJS
Ml9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0FNTE9HSUMgYW5kIHRvIGhhdmUgdGhlIHByb21wdCBs
aXN0IGl0IGFzCj4gIkFtbG9naWMgU09DIEJsdWV0b290aCIuCj4KPiBJZiB0aGF0IHdhcyBub3Qg
Y29ycmVjdCwgd2UgY2FuIGNoYW5nZSBpdCwgdGhvdWdoLi4uCgpTb3JyeSwgaXQncyBteSBmYXVs
dC4KCl5fXgoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+IC0tCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX19fX19fX19fX18KPiAuLS0tLS0tLS0t
LS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS06ICAgICAgIF8gICAgOi0tLS0tLS0tLS0tLS0t
LS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9fLyAp
ICAgfCAvIlwgQVNDSUkgUklCQk9OIHwKPiB8ICAgICAgICAgICAgICAgICB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FNUEFJR04gICAgIHwKPiB8ICszMyA2MzguNDEx
LjI0NSAnLS0tLS0tLS0tLS0tLS0tLS0tLS06IChfICAgIGAtLSwgfCAgWCAgQUdBSU5TVCAgICAg
IHwKPiB8IHlhbm4ubW9yaW4gKGF0KSBvcmFuZ2UuY29tICAgICAgICAgICB8Xz0iICAgICwtLScg
fCAvIFwgSFRNTCBNQUlMICAgIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0tLScKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IENlIG1lc3NhZ2UgZXQgc2Vz
IHBpZWNlcyBqb2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVzIGluZm9ybWF0aW9ucyBjb25maWRl
bnRpZWxsZXMgb3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZlbnQgZG9uYwo+IHBhcyBldHJlIGRp
ZmZ1c2VzLCBleHBsb2l0ZXMgb3UgY29waWVzIHNhbnMgYXV0b3Jpc2F0aW9uLiBTaSB2b3VzIGF2
ZXogcmVjdSBjZSBtZXNzYWdlIHBhciBlcnJldXIsIHZldWlsbGV6IGxlIHNpZ25hbGVyCj4gYSBs
J2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWluc2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4g
TGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRhbnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlv
biwKPiBPcmFuZ2UgZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0ZSBzaSBjZSBtZXNzYWdlIGEg
ZXRlIGFsdGVyZSwgZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2kuCj4KPiBUaGlzIG1lc3NhZ2Ug
YW5kIGl0cyBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgb3IgcHJpdmlsZWdl
ZCBpbmZvcm1hdGlvbiB0aGF0IG1heSBiZSBwcm90ZWN0ZWQgYnkgbGF3Owo+IHRoZXkgc2hvdWxk
IG5vdCBiZSBkaXN0cmlidXRlZCwgdXNlZCBvciBjb3BpZWQgd2l0aG91dCBhdXRob3Jpc2F0aW9u
Lgo+IElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3Rp
ZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRz
Lgo+IEFzIGVtYWlscyBtYXkgYmUgYWx0ZXJlZCwgT3JhbmdlIGlzIG5vdCBsaWFibGUgZm9yIG1l
c3NhZ2VzIHRoYXQgaGF2ZSBiZWVuIG1vZGlmaWVkLCBjaGFuZ2VkIG9yIGZhbHNpZmllZC4KPiBU
aGFuayB5b3UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
