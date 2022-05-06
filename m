Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FA0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 11:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3011761103;
	Fri,  6 May 2022 11:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZUeJDDQ0_8G; Fri,  6 May 2022 11:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF91610BF;
	Fri,  6 May 2022 11:30:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B78DE1BF2BB
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 11:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A48184157F
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 11:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38og4oVEtw37 for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 11:30:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::608])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F6FD40924
 for <buildroot@buildroot.org>; Fri,  6 May 2022 11:30:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liytVr6cUipbRWJQwGx+c3a+NxEW4Q0Ivo2u7fAjtCIAn0M1ZGH7GxN4aI/3wZKKAAqkyCLUr9QWqBbFY897AM02PkKPR/IwQtPb/G7JWctBs5D/3Tio5WMTdta7G45Rv0rNXZykVvGIAYH1XsdJwLg6b3OzD1qMzbO9LKRg44vl6tMNCILUqqqe3hrxxM9fUBz+r3dAu76ecTryOiecO+FCJM1e7Cay7wK3DjMkaEi6mHvHCY1sfRYEDM+fqwrvUuHDykikbZzPzdX4y2MU8nReeOoF9b/me6NHIj7VyIcK9dZRZ0sCdFx5sGxWgdpN89JCO7KBEslLKWVKDF4e1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAvIh1WELEjh1IgSk4/+9cPfaeKEozc9Mki7/UpCYpE=;
 b=Bv/FMPLaT+Ww4PEQJfqit3g3tPgA/GnrIi/dr+F8YP3LmC0EksPOZN88lzFnwZST25FUb5cAdG2XNCasPDFE2EcFepifFR/gqMU0joAB3KTZiC/MTPdKNokwkmew6c6iATcJHivEHL8zTT4jniQLUOHhuCIZ7PgXuNLO7iZer4wDOULh5ANJQJL/QwxxlwidBoI6IcRThw6U/DdJpi31OX8VaG7gQTcOoD3j2/fcYag9S6/J8VYaBRnr1S6yq024GwNIKyES0rzyLJ14GHMEtIa0QraclfvUZZD66ZUsUtTghVfWwAbNF7uSjc5uUIp31DbuVqb1F6LvGgFXeI7l5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAvIh1WELEjh1IgSk4/+9cPfaeKEozc9Mki7/UpCYpE=;
 b=XxgWS++IhpdLuAha08WFDrAtzYbHsLgNWO4+RBi6/FwpPFxxQkGtxqW5t4hq9I35sIEv96MRaax2RMqfDoGtJwujzQFHDHknd01GYW/d/mo9369Ses1Y3MXsGZkOSjMjQP5EFPGMO/Xin42QpJ7D+N3Zo33D75O/uTVYAX/m98s=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MN2PR02MB5917.namprd02.prod.outlook.com (2603:10b6:208:117::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 11:30:52 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 11:30:51 +0000
From: Neal Frager <nealf@xilinx.com>
To: Wesley Revens <wesley@sonifex.co.uk>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADrLk=
Date: Fri, 6 May 2022 11:30:51 +0000
Message-ID: <C3D5AF93-A01F-4D76-ACAA-D5C67C380DD1@xilinx.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
In-Reply-To: <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a264cd2d-92c5-4164-37ba-08da2f53dff0
x-ms-traffictypediagnostic: MN2PR02MB5917:EE_
x-microsoft-antispam-prvs: <MN2PR02MB59174F5A4E10662C56992E7DD7C59@MN2PR02MB5917.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a2RUOsr09K3MJMMdMSWLmmqBTMzf/sHEWQG78KfZOSey3aGElgSxBLx+WEhYkhWfv/BE0YPKkjSkCUMc8hLrLiErhqUwtqznGSBb0jkW058szVwhamIbe++ft5i7v/MOXcqha74Guki9wRtXWvzS8TZbvppU3EF4+N4voT8N3eFp8UJzGbh5D4Mzcw0FNv5twrbfTmJbe+5fYgXc0b1bZlmp22DiD6dDRmz97+zDt8Zx4Z9W8uri06oOpFpTdwdzCXwAjm6XZFkPIDLeSIc/6u0zgdPpZAQ1UYg/37zJo7+/NYojoXa+8PSCg4pZyhk/gpKdKCxb+RvW8dBACp4qNyWZ45nrDqYtoplt3xankDkuovrEia0VpL6Eo84tuo8yBEkxIhBs1TPd+Jft37aDTzN8cod4putdvlSC39dD/SLtTvEz+B3+3Zvs17SlP9yPoqTulkFRAkrFYiTyL+ZeNm6ghxz9YJ9wJQZTMjUxBnXkgYRzEEen/Iu9EA1qrZO6rUHtzd2GBc1/6kW1yF51TdL+mhOeDrFkeSGykrWgyZ5wfb/+STw4YMAfTADkk+n6KI7dSALef1z0SMfnyQvND7ENdN87R0DDJ+tjJxpZ6roB0O2LnncG/lKhg+Co3VmPBCf/qGXxL7dGRB2evWeLqy7BJ4BUMKXOq03CUrJCVhAUTdBioDvCC0iMckx/SXDcC/KOQxdO1cS8U/KgHzgUDuKa91OH4d5StyuyvCDROVK6P6D7jkPCb+g9S7AJSdW8wqrFDjgw+ljJtBDy77G8aqyyl1TI6NXAwS65O/HQkoYrLigBmiPoQGUSyEU5AURFNC+PBdrGppKPLYL8xdU1hZr2E+MwpxN85gik/pM6sb8BvLgMI6D0j1slN7bmwq2T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(66476007)(6506007)(6512007)(54906003)(2616005)(53546011)(26005)(71200400001)(316002)(966005)(6486002)(66556008)(8676002)(508600001)(186003)(86362001)(2906002)(36756003)(8936002)(6916009)(4326008)(5660300002)(33656002)(38100700002)(91956017)(38070700005)(122000001)(76116006)(66446008)(64756008)(66946007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2JyMVhOOUxJTXBpOVhvQ1hVY082dnlJK1dtdWdOZFpjNFZmZWRYN0tQanJ4?=
 =?utf-8?B?Y043eVhQMHpjZk1JdDVjSlVGZ01mOXpLaS9jWlI5eEtTZUhiNWRqOFBRWm9Z?=
 =?utf-8?B?ZHBRQlVoN0pnUXA5Zm4yNmJ2Y3QvZk9pYTllNXVNVklKT3YyTTRQTTl2NFJD?=
 =?utf-8?B?bjVvSnlsckdwNlNvRzZzL1ozbmZyZWo0THV5Si83QTcyOVVieTd6cWlBVmxq?=
 =?utf-8?B?cTRsNFB6T2V6R2c2YjRQeTVKSW52TFNGMkZPcGRyaFhMNlVxblE3OWhsMUt4?=
 =?utf-8?B?TUthdUY0M3E5YWU4M1lsTkNCVWJEdXNyaVRPQlRBY09saTRXMmlYekRQanhL?=
 =?utf-8?B?dXIrL0sxMVdkMmQzMWU2UnI4U1ViNHpQeVFwczJMZFlacStOTHVvcjl1Ym9z?=
 =?utf-8?B?Y0dEVlBLRklFZ3paczRZOHNlTEQwMDA1akZudDFKcW00a3loK1JXUUEwRGg1?=
 =?utf-8?B?emRPMkJyK2tBT1NKbWRpNkgxQklaL0xGWStDK0hMY0RBUDBJc3JJeHQ5VWlW?=
 =?utf-8?B?QVdWb3E2ekRUY1ZQbXJ6b200LzQzb3UzRkl6UDNveEw3dm01RGhxVHF0elRV?=
 =?utf-8?B?dWNiOHZzVFIwQVZyWWxNb0N2SUFQNTJsS1FEUG9hZ0x3ZUxaa25IUFFNaUMz?=
 =?utf-8?B?UVRQNXdTTVRJTUZTV3oyS2NBR0RFL2RkY1lMR01DUzJNZS91ZmhLRCt5cGg4?=
 =?utf-8?B?VFNFaUwrN2psSVQ0UmRGeU9xVFV3eW9SSVl2SlgzQUhYTWNaeTVIekkxZit1?=
 =?utf-8?B?NlQreTM5eHpWSXhralc4QUxUbFNCWGtkZlErbmkyRmhkZUhhaXMvSlFjMmNw?=
 =?utf-8?B?c0RoeC9wZERqQS8rN3BBQ0FNUndoL09JdzZZT20ycVF4SStIUTdjaTl6RVNw?=
 =?utf-8?B?Tk9VRUpoRnlCUEd0c00ybjJlQ0F2UDdCcUNkVnRWRitZaThUOUc3Mno3YVN2?=
 =?utf-8?B?VGRKNHZwQlUxc052WWM3eXpMdTAvc3VmNFJnRGY2SmJScWRETjVtVG83S0VR?=
 =?utf-8?B?bisrZ1NXZEg5M3I4TTIvelhKWE1lcjNrdXFEU1ZjbmFGcFlHejB1WHIzSm9w?=
 =?utf-8?B?aXYrQnVzNWUwaC9LYVR4THRKanRpMFdTWDhpd0lkYWNsSjVhOTlzazIxaGw0?=
 =?utf-8?B?RW51WmJJN3Z6WkFvcGJNbzF1bU1GVFJpVFlBbk1vc3NmeFFoV1dhUFd5YTNt?=
 =?utf-8?B?ZXd6WkpxWnJvM1NzUnBnQmd1dUJnR0dmUTM4SXFvRjFQMjE0TFhDMG8wVGU0?=
 =?utf-8?B?YWU0ZnB3alk1Rkc2REJOVFd6RmhGUm11d3Qvemh0NHdEenVCK2MrYmlnVnhN?=
 =?utf-8?B?UU8xTlFJd0VnVGJoSUg2anlWRmJmSU1zR0dMbUhTWFZWUk9OeWFQODByTWF0?=
 =?utf-8?B?WWNDcytEUWQzSkJnMlN0WG0rL2loRURseVAzWGxDM1NEREp0UzZaQXRYU0dz?=
 =?utf-8?B?eFRtSDdBSkNLbFVkcERoYUFuemNWc2g5Z1QvV21UUFN3RWpBMHpSMksyL2Z5?=
 =?utf-8?B?eUlidC9BVlNiMHpMUzd2NndzWGxiMVRVMDdYNU0xNXdnVWs3VXpFdXFFWUls?=
 =?utf-8?B?Qmw0U2pDazlxSzFESHl1am5wenlOU2VwazJpN0lzSmNwL1BoakdDUHIvOVNB?=
 =?utf-8?B?TkhiL3phbjVhN2NBMm1UTndEblZEM0JRU1FwYzJKS3hWQzkyUTB1ZjBCM094?=
 =?utf-8?B?cElEN1JwOGdIdUpab2hvOGNrZW12c29wYzVWRkc4cXU5a2p0bFRHcFRZWVdF?=
 =?utf-8?B?S2lBQ1crSGN3Y3R6UFlUL3Vka2U2dVBYaGdXRjFYZVRxdjdSSzhkZk5la2J5?=
 =?utf-8?B?ZG1aT0M5a25Ba3FtOE1UU3gvWG5FanN5MWZnVjc2aVhsNXRieVVFWHJNOTZO?=
 =?utf-8?B?RzJEcitabGtydGxFQzJlVWRWd3EvSDVkR2VVQ2h5Y2tkNmh0MjN3THJKbTNq?=
 =?utf-8?B?bFpFdVJtQkdvQm9neWF0ZEdqWldYdklNTkF0bU02NCtMYk53MXo5STA0cVNu?=
 =?utf-8?B?UDVBME0wWTliS2VuWE43YWwyVjJZb2Z0L1RaakpXVktxcmhSdkVjOUtLcDZH?=
 =?utf-8?B?ZTlDdDB5T3Vrd1ZZRmFUSWhFUzBDZkhXV1BaUlVCY3dIaHFMYUx3Vk1hNzE3?=
 =?utf-8?B?dVBDcjlFd2wzYkUzSlU1WDg5Z1FNSXAvakVoME5ZYzRDN3kzQ0pjUWNPa1gv?=
 =?utf-8?B?R1ZVL1ZvQnQ4Rm5sV2FUUjRKeW9zanJqb2M0ckJITXRuOGVTRW1rWWZqMU1a?=
 =?utf-8?B?ZGFtWHhuY3hHaVFMdTdXaUd3SFhQRVR3Z05KVi9QU2RwTm5ON09KQW53ZzA5?=
 =?utf-8?B?QjlLNlgvZFRIdWhHYlNvVWVWcy8va3dqV09sR1FFUEwvY3Q3SHg1dz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a264cd2d-92c5-4164-37ba-08da2f53dff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 11:30:51.1730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hvw26pXmjChahit4JyOn4YpdEHnMj6varlak3k8sClUvmjI05euR1LphMswufUwaOsqAEPJsDMoVqAxYXzI6Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB5917
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgV2VzbGV5LA0KDQoNCj4gTGUgNiBtYWkgMjAyMiDDoCAxMzoxOCwgV2VzbGV5IFJldmVucyA8
d2VzbGV5QHNvbmlmZXguY28udWs+IGEgw6ljcml0IDoNCj4gDQo+IO+7v0NBVVRJT046IFRoaXMg
bWVzc2FnZSBoYXMgb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gUGxlYXNlIHVz
ZSBwcm9wZXIganVkZ21lbnQgYW5kIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBj
bGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZyB0byB0aGlzIGVtYWlsLg0KPiANCj4gDQo+IFtD
QVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4gDQo+IEhpIE5lYWwsDQo+IA0KPiBJIGhhdmUgYmVl
biB3b3JraW5nIG9uIGEgQnVpbGRyb290IGltYWdlIGZvciB0aGUgS3JpYSByZWNlbnRseSBzbyBt
eQ0KPiBjb21wYW55IGNhbiBldmFsdWF0ZSB0aGUgSzI2IFNPTS4NCj4gSSByZWFjaGVkIGEgc2lt
aWxhciBwb3NpdGlvbiB0byB3aGF0IGhhcyBiZWVuIGluY2x1ZGVkIGluIHlvdXIgcGF0Y2gNCj4g
aG93ZXZlciBJIGhhdmUgbm90IGJlZW4gYWJsZSB0bw0KPiBnZXQgdGhlIEtyaWEgdG8gYm9vdCB1
c2luZyB0aGUgVS1Cb290IFNQTC4NCj4gDQo+IEkgaGF2ZSB0cmllZCBvdXQgeW91ciBwYXRjaCBh
bmQgZm91bmQgdGhhdCB0aGUgTGludXgga2VybmVsIGlzIGJvb3RpbmcNCj4gZmluZSBmcm9tIHRo
ZSBTRCBjYXJkIHVzaW5nDQo+IHRoZSBwcmUtcHJvZ3JhbW1lZCBib290LmJpbiB0aGF0IGlzIGFs
cmVhZHkgcHJlc2VudCBvbiB0aGUgS3JpYS4NCj4gSG93ZXZlciwgYWZ0ZXIgYnVpbGRpbmcgdXNp
bmcgeW91ciBwYXRjaCwNCj4gSSB0cmllZCB1cGxvYWRpbmcgdGhlIGJvb3QuYmluIHRoYXQgYXBw
ZWFycyBpbiBidWlsZHJvb3Qvb3V0cHV0L2ltYWdlcw0KPiB0byBteSBLcmlhIHVzaW5nIHRoZQ0K
PiAiQm9vdCBJbWFnZSBSZWNvdmVyeSBUb29sIiB3ZWIgVUkgdGhhdCBydW5zIG9uIHRoZSBLcmlh
IGlmIHlvdSBob2xkIGRvd24NCj4gdGhlIEZXVUVOIGJ1dHRvbg0KPiBkdXJpbmcgcmVzZXQgb2Yg
dGhlIGJvYXJkLiBPbiBib290LCBJIHRoZW4gZ2V0IHRoZSBmb2xsb3dpbmcgb3V0cHV0IGZyb20N
Cj4gVS1Cb290IFNQTDoNCj4gDQo+IFUtQm9vdCBTUEwgMjAyMi4wMSAoTWF5IDA2IDIwMjIgLSAx
MToyMTo1NSArMDEwMCkNCj4gUE1VRlc6ICB2MS4xDQo+IExvYWRpbmcgbmV3IFBNVUZXIGNmZyBv
YmogKDIwMTYgYnl0ZXMpDQo+IFNpbGljb24gdmVyc2lvbjogICAgICAgIDMNCj4gRUwgTGV2ZWw6
ICAgICAgIEVMMw0KPiBDaGlwIElEOiAgICAgICAgeGNrMjYNCj4gTXVsdGlib290OiAgICAgIDY0
DQo+IFRyeWluZyB0byBib290IGZyb20gU1BJDQo+IA0KPiBUaGVuIG5vdGhpbmcgZWxzZSBoYXBw
ZW5zLg0KPiANCj4gVGhlcmUgaXMgYSBiaWcgZGlmZmVyZW5jZSBpbiB0aGUgZmlsZSBzaXplcyBm
b3IgdGhlIGJvb3QuYmluIGZyb20NCj4gYnVpbGRyb290L291dHB1dC9pbWFnZXMgYW5kIHRoZSBC
T09ULkJJTg0KPiBJIGRvd25sb2FkZWQgZnJvbQ0KPiBodHRwczovL3hpbGlueC13aWtpLmF0bGFz
c2lhbi5uZXQvd2lraS9zcGFjZXMvQS9wYWdlcy8xNjQxMTUyNTEzL0tyaWErSzI2K1NPTSNCb290
LUZpcm13YXJlLVVwZGF0ZXMNCj4gc28gSSBhbSBvYnZpb3VzbHkgbWlzc2luZyBzb21ldGhpbmcg
c29tZXdoZXJlLiBJIHRoaW5rIGFsbCB0aGUNCj4gY29tcG9uZW50cyBhcmUgYmVpbmcgYnVpbHQg
YnV0IEknbSBub3Qgc3VyZQ0KPiB0aGV5IGFyZSBiZWluZyBwYWNrYWdlZCBpbiBhIHNpbWlsYXIg
d2F5IHRvIGhvdyB0aGUgcHJlLWxvYWRlZCBib290LmJpbg0KPiBpcyBsYWlkIG91dCAob3IgSSBh
bSB1c2luZyB0aGUgd3Jvbmcgb3V0cHV0IGZpbGUhKQ0KPiANCj4gSW4gbXkgb3duIHRlc3Rpbmcg
SSB3YXMgYWJsZSB0byB0ZXN0IHRoZSB1LWJvb3QuaW1nIHByb2R1Y2VkIGJ5IG15DQo+IEJ1aWxk
cm9vdCBidWlsZCBidXQgSSBoYWQgdG8gdXNlIHRoZQ0KPiBYaWxpbnggYm9vdGdlbiB0b29scyBh
bmQgdXNlIHRoZSBYaWxpbnggZnNibCByYXRoZXIgdGhhbiB0aGUgVS1Cb290IFNQTC4NCj4gDQo+
IEluIGZ1dHVyZSwgd2Ugd291bGQgbGlrZSB0byBiZSBhYmxlIHRvIGJ5cGFzcyB0aGlzIHN0ZXAg
YW5kIGp1c3QgdXNlDQo+IHdoYXRldmVyIEJ1aWxkcm9vdCBwcm9kdWNlcy4NCj4gSSB3YXMgd29u
ZGVyaW5nIGlmIHlvdSBjb3VsZCBwb2ludCBtZSBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uLg0KPiAN
Cj4gUmVnYXJkcywNCj4gDQo+IFdlc2xleQ0KDQpJIHdvdWxkIGJlIGhhcHB5IHRvIGhlbHAgeW91
IGhlcmUuICBPbmUgb2YgdGhlIGJpZyBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBwcmVwcm9ncmFt
bWVkIGJvb3QuYmluIGFuZCB0aGUgb25lIGJ1aWx0IGJ5IGJ1aWxkcm9vdCBpcyB0aGF0IGl0IHVz
ZXMgdGhlIEZTQkwgaW5zdGVhZCBvZiB0aGUgU1BMLg0KDQpUaGlzIG1lYW5zIHRoYXQgdS1ib290
IGl0c2VsZiBnZXRzIHBhY2thZ2VkIGluc2lkZSB0aGUgYm9vdC5iaW4gaW4gdGhlIHByZXBhY2th
Z2VkIHZlcnNpb24gYmFzZWQgb24gdGhlIEZTQkwuDQoNCkluIHRoZSBTUEwgY2FzZSwgeW91IG5l
ZWQgdG8gd3JpdGUgYm90aCB0aGUgYm9vdC5iaW4gYW5kIHRoZSB1LWJvb3QuaXRiIHRvIHRoZSBR
U1BJIGZsYXNoIGJlY2F1c2UgdS1ib290IGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgYm9vdC5iaW4s
IGluIHRoaXMgY2FzZS4NCg0KVG8gZml4IHRoaXMgYmV0dGVyIHRob3VnaCwgSSBtYXkgaW1wbGVt
ZW50IGEgcGF0Y2ggZm9yIHRoZSBTUEwgc28gdGhhdCBpdCBsb29rcyBmb3IgdGhlIHUtYm9vdC5p
dGIgaW4gdGhlIFNEIGNhcmQgaW5zdGVhZCBvZiB0aGUgUVNQSSBmbGFzaC4gIFRoaXMgd291bGQg
cHJvYmFibHkgYmUgYSBiZXR0ZXIgc29sdXRpb24uDQoNCj4gDQo+IA0KPj4gT24gMDUvMDUvMjAy
MiAxNjo1NCwgTmVhbCBGcmFnZXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToNCj4+IFRoaXMgcGF0Y2gg
YWRkcyBzdXBwb3J0IGZvciBYaWxpbnggS3JpYSBLVjI2MCBzdGFydGVyIGtpdC4NCj4+IA0KPj4g
S1YyNjAgZmVhdHVyZXMgY2FuIGJlIGZvdW5kIGhlcmU6DQo+PiBodHRwczovL3d3dy54aWxpbngu
Y29tL3Byb2R1Y3RzL2JvYXJkcy1hbmQta2l0cy9rdjI2MC5odG1sDQo+PiANCj4+IFdoaWxlIHRo
ZSBLcmlhIFNPTSBpcyBiYXNlZCBvbiBhIFp5bnFNUCBTb0MsIHRoZXJlIGFyZSBzb21lIGtleQ0K
Pj4gYm9vdCBjb25maWcgZGlmZmVyZW5jZXMgZnJvbSB0aGUgb3RoZXIgWnlucU1QIGV2YWx1YXRp
b24gYm9hcmRzLg0KPj4gDQo+PiAxLiBUaGVyZSBhcmUgbm8gYm9vdCBzd2l0Y2hlcyBvbiBLcmlh
IFNPTXMuIFRoZSBib290IG1vZGUgaXMgdGh1cw0KPj4gaGFyZCBjb25maWd1cmVkIGZvciBRU1BJ
IGZsYXNoLiBBIHByZS1wcm9ncmFtbWVkIGJvb3QuYmluIGNvbWVzDQo+PiB3aXRoIGV2ZXJ5IFN0
YXJ0ZXIgS2l0LiBVLUJvb3QgY2FuIHRoZW4gZmluZCB0aGUgTGludXgga2VybmVsIGFuZA0KPj4g
ZmlsZSBzeXN0ZW0gb24gdGhlIFNEIGNhcmQuDQo+PiANCj4+IE9wdGlvbmFsIGluc3RydWN0aW9u
cyBmb3IgdXBkYXRpbmcgdGhlIGJvb3QuYmluIGluIHRoZSBRU1BJIGZsYXNoDQo+PiBjYW4gYmUg
Zm91bmQgaW4gdGhlIHJlYWRtZS50eHQgZmlsZSBhbmQgdGhlIGxpbmsgYmVsb3cuDQo+PiANCj4+
IGh0dHBzOi8veGlsaW54LXdpa2kuYXRsYXNzaWFuLm5ldC93aWtpL3NwYWNlcy9BL3BhZ2VzLzE2
NDExNTI1MTMvS3JpYStLMjYrU09NDQo+PiANCj4+IDIuIEtyaWEgU09NcyB1c2UgVUFSVDEgZm9y
IHRoZSBjb25zb2xlIGluc3RlYWQgb2YgVUFSVDAuIEZvciB0aGlzDQo+PiByZWFzb24sIEtyaWEg
U3RhcnRlciBLaXRzIHdpbGwgdXNlIGEgc2VwYXJhdGUgZXh0bGludXguY29uZiBmaWxlDQo+PiBm
cm9tIG90aGVyIFp5bnFNUCBldmFsdWF0aW9uIGJvYXJkcy4NCj4gPHNuaXA+DQo+IFRvIHVuc3Vi
c2NyaWJlIGNsaWNrOiBodHRwOi8vbGluay5zb25pZmV4LmNvLnVrL3VzLz9lPTFuWHZ4eFB1RXAy
WmphLmRkZVBmamtBbkJWLVoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
