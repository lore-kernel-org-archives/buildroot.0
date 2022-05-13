Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96750C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 09:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F785410E4;
	Fri, 13 May 2022 09:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbIuZnJUvSwT; Fri, 13 May 2022 09:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC5D40985;
	Fri, 13 May 2022 09:06:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E741C1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 09:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4E4B40003
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 09:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7WnoY9Odrl9 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 09:06:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::601])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0AAF4010D
 for <buildroot@buildroot.org>; Fri, 13 May 2022 09:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVfx+z4Iuz5whIjNJB+sdCYiaEwtd0S+cSmmotR/pZFe77VAyqme1Y7h0hf52lDJ7C4RWid3wPGh5Tf45vXPfFW95hJEQA+EFP4NcIjA61rU4KZaC6V8YiajCsNSOuRVjNLWdPMrULTBrYLnixQ2bAFi56kwqAaZwH46AajJIQUEbB3CBNZR2FDj8GIgPJMwGIVvoMNhD3O9jUFSDGCYcYacaz0MJpRIEQfoF15A7ZwlAbq/2GWP7IOgYP5zxAE7GeffqDd2KLdwmWPj5mcBOLVaz80pp0X5gbJ9DjDypGqsTBWr3K2lLxgZ91/CoIO6EaqCnS9j03bgKJRo5v1q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBZPdjRrpggauRgAI01GKeS1AZeJxuaz+YiFIOP+Gjg=;
 b=Xsbl+Fjh2gOXitJW87Wk5v941j0erjIbvT84OxQmwLCVdqZeF2Nlruw7Rd9jpt+PYmdHAYumFJskmKPE8VX217gwtLoUAnOstAuRzppTH1I18FWRuDaCvC+t4dUWIcLCgSwHv9TcwmZUB0MwrF4JljWymXaq36UDaQvJ8YovRjtIMsjpeXlP3536fQCR3vkypDhBHTN4wttReX1Z6tYln+kO1CP1/0Xbzh03bbnpYkdqbcV840MNUfsa+w0XfBjz1KUAIVDLJQUZMHnzl8V4amytyGcCK8vtG+3AWiZjh9b1tbNzTn4HhL83clWfCrYS89qSAOzCQRfGhHvQhKab2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBZPdjRrpggauRgAI01GKeS1AZeJxuaz+YiFIOP+Gjg=;
 b=C9e9utA1e1aLUMTEi0baEceGzjcHQ/gQbmATWjszGDD+i9kd+tZXbfRIbTNSHx4M8L3/LN/t3qRtuZ7W40TnUv5OmRvApDsDHA99TKamtB/0eHoSPsGpU/Iox4+MERsZmhajbiKKrN7pEmq5bfn2CV2winCoVO1LLzJUWzeXX/c=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by SA0PR02MB7244.namprd02.prod.outlook.com (2603:10b6:806:ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 09:06:47 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 09:06:47 +0000
From: Neal Frager <nealf@xilinx.com>
To: Neal Frager <nealf@xilinx.com>, Luca Ceresoli <luca@lucaceresoli.net>,
 Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig: transition to
 tarballs
Thread-Index: AQHYXwIELEy/0Pm99UOOfHYHNJ8zuK0OSCO6gAAGK4CACyHP5oAAHg6ggAAnsZCAACrQ24ABfTcAgAAZeWeAADjQu4AAk5KBgAAxKwCAABaNAIAAB08Q
Date: Fri, 13 May 2022 09:06:47 +0000
Message-ID: <SJ0PR02MB7758C4D738BDB949E2A2C0DBD7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
 <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
 <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
 <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc977da6-c5bc-44de-05d2-08da34bfe8df
x-ms-traffictypediagnostic: SA0PR02MB7244:EE_
x-microsoft-antispam-prvs: <SA0PR02MB7244199151D23D8AFDFE1E5DD7CA9@SA0PR02MB7244.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VrtV3lYODqndUvwKs+j0iHrfTKbMQdAbPABIeGSVy03hbYvTY16GVIfHELwrgrIPyg03/ue86FcKchuFo7oxz/3t2O3CQuMUEr5wLQaT244zTZR54FZC3XGTF6rJuRlqYvqH9OtzOnBfe7mrA4PDqSYbRJDKVHnH0wqQVWYBztTh6ZfiWo7A4cxXeHsm/VjaZbz0LBHNfmqJ3eBz78XhZXQIIYRCkyNI/OkIdQfMa9MgM5T5KEjV5B7lZz9VtC/wvM+7czfILBt7FQnKkzZBt+KBf/HMFuGnAcT7Hv3jfc0SyyV3ck8dLeha3mSYbJTn5sTPG//F4fRfesaqrtb6FQjnfxVC5PppyZb7cf8HQZsvQd+JUR5Vd/qx/ugNTWrZIbFRreyZplIFR3qCgsCsN/yHtSP+PM4FGLi47xwY2CMVm+SF88VsUy3qP20Pp5rfMXT4x0uQVGpsjEcVZtG5fB2Yx2PE73g1VMw8PGtiAQ8TlVHFma2gsdBu+yROM2XgQLDfmVByMKXfzkIyE0vkDtSsGaoBcSJ6ANE7Jw2YatfKP5WGb+XKXO7DjqdX/Za4uRGNI44TiGg5jYbeZlFLpqS4BUZhYIDJnW2s4w07VMqw0UFKBgj+O8q1E/zM6FFVTNMJZQahg/85OmvLbM/WNkOmp+BUWYunDBXwqFZDlzqD/O/fnZ6L0d+IrsxJqnS/6OoIg4JwnBG71ZrCLx6eCSG3nXtyVb9sFS9eoIzGuSoY4WUggn3/gWjqN3UG70cJ42fD2yo16IEWy4n/CxBTM71TuyUqBZnC3XLzVoErFusB6nEWOzbWVPYega3lQ5S2gLQtcg/xdcylOyyrq2qzOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(66476007)(316002)(110136005)(33656002)(66446008)(66556008)(76116006)(66946007)(38070700005)(122000001)(186003)(83380400001)(54906003)(2940100002)(9686003)(21470400002)(26005)(66574015)(7696005)(55016003)(86362001)(8676002)(71200400001)(966005)(52536014)(8936002)(508600001)(6506007)(5660300002)(4326008)(2906002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG1Oc0s1TVRzWTRJZCtHMzA5WFI0OHRCOURuL1hIbEt3QzdZcWlWUkZ3bHF1?=
 =?utf-8?B?WDAzOUg1MTdLZkRGUGJPZnBlOGdQUkpaeGFqc1BtQTZHVlVwV0lEWGhyYXU2?=
 =?utf-8?B?VnNIWlNjRjMrR2dwdmVWMUQ2RDdEL0d0YTVlcnh3azRIOE9JbXJtdlB2eFRt?=
 =?utf-8?B?K3d0RjAvWnpldkVlRnVXOTY1SnhPMllIa3VsM1RzQzBIektJNEpkZHVqclY3?=
 =?utf-8?B?dE1VSTNXM3JLODdOKy9TQThjYnZaYk5LSlk5azYyZ3EzRlFUQ3c5bW45cExa?=
 =?utf-8?B?T0l4TDJjRVNJaDZGdTRvd2k3QXJtVDRmREdrY29EOXNxQkdjaTBkeFdLYmYz?=
 =?utf-8?B?QURPdUZHSmgwQ2o1TDY5K09KNnp5U0hGLzZlZExjZGFNa1d1dkFQampRU0lN?=
 =?utf-8?B?djl5eUxLOTNoYXhtN080VG4yRk9jU1pmSlNGdFFpTU5janpFRlNUQWgxNy9Q?=
 =?utf-8?B?aWZaQksveXpSSGFYV2NLWE5Ua05kZFJ5bGhESHVtN0VBdjQzV3c1UllieUN4?=
 =?utf-8?B?bWc2Ukt6YnhYaUU4Ty9tOEE1aUFtclBMWjZiSXo0bkRLaWZwUW5QYi8wWGNa?=
 =?utf-8?B?aitJaGdTQW1aM1dwYkZPS25xU1VQbVZZTlE5bWJUUUN6S0REbHJaQ01JMjRq?=
 =?utf-8?B?dVNKQ1BQZmZUM1ZHSTJNZUszeURaRHZCK1ZpVEsxeVVZWnlrQWRuMGRLZkZE?=
 =?utf-8?B?b0JJaXdGd3pvS0Z3NFRtL1FaTVcweWZJM1dBN2R3Tm1rL3lnb3pTcDRQd0ZN?=
 =?utf-8?B?dmw0RWlkc0lvdnRKVzVJdk9QYkFkNVZOb0Q2SEt2T3JVeGpEOC9id0pHZ0Fj?=
 =?utf-8?B?c1JlSkEyY2RmaHN6Q2pqQ3A0U1BzdDc3OFpIV3V6cldpNEVVOXVvNXd6bXNP?=
 =?utf-8?B?UDJTT0JwYWtqa0RGRklMUFB0TUo1UjV2Q3dwMjVqVVMrWkkyS0hTK0pVQkt6?=
 =?utf-8?B?TzdJbEp0WmRJa2JUNFNjdGdpdmlYc3ZjcDdER2hjVEtreVFVdE8rZ1ZxR215?=
 =?utf-8?B?RVRJdEtaQ2QvcW91WU5KREhvQjh2N1FWNnhzTUNWbm90aCtGVmR6TG9KcFFJ?=
 =?utf-8?B?OGJrbjZnME8rNkIxRjVEN1EwVU5wUTJOWUkvMmhjNnp0WCs0a3VWbVFnSXl6?=
 =?utf-8?B?SEVlZkhtVHQvSnVFNVpUL3l3Qlk0T2VzSVNhTHd5YmMvTi9uc2tYMG9oMGxV?=
 =?utf-8?B?aU93NHJaTFRERjBQclQrcXJmT2dtZkY4cFFEZUd2dndFZ1lMNW10V2J4QWND?=
 =?utf-8?B?UkJuTnpBNFY0M0ZNSGd1S2lpOERzVkRXN2krNWJRV1NCNjJydE9QNzJtUlQw?=
 =?utf-8?B?U09TZ01wcmVkOU5PSFc4THgyUmpienplRFRaNStEZ3ZjYWJ0Tk9kUVF5N0xK?=
 =?utf-8?B?UE5XdGN5S0NKUmttQlhzK0MvZTdVSUZ5L3BaUXVPWmlUQkVVWi84S1l1UXk4?=
 =?utf-8?B?b01qcVhkcHJ5dXVvaFdUZmNnMG1lcWVRdWJRWFA5MVJ3Q3gwbDdwcGN3YWZn?=
 =?utf-8?B?TXZ6ZnBPamVBN1dpOFRnMllsNEZ0US96ODRCM3dDbWpFTWl5SFVKNUE4dDZE?=
 =?utf-8?B?bmRhL29Rd2RDMjYwSFBpeEhPa3dqZWdPbzUyaXpLdkpxNlExLzJBbjJ0cjcw?=
 =?utf-8?B?bzVCbW9Xdlc4VVRMZWlFN3V0OVc1bWNHRUkrOUl1RHhyajhQQlRkN2tIVmdP?=
 =?utf-8?B?VlRJZ1JKOStsbWtmREJBaFhTdnRSdS9qM2F3T2RwbzZCbTNLYVE5VzJwVmtp?=
 =?utf-8?B?WGc1WXRwMGc4dCthTCtlSDQ5bEtIZUs3ajlKRVhsV2Y3dEhrWE1aamtVb2pL?=
 =?utf-8?B?V0E5Ni96MDZ3V1dEY3JZUTZYUExyb1oyK0RmNFhrNm15dDNncWVEcW50WUdJ?=
 =?utf-8?B?Z1ArVFY5eDlxTlBXRTliVTQzYWZsWi91dTM0MXFab2s5c1ZtR1FFK0Vidmd4?=
 =?utf-8?B?TWZCN1N4RHdtU3hXOVljYjJJd3hyY2dROGNFb3I2K2VKZEpFaG1pUHV1YUk3?=
 =?utf-8?B?WmtUR1RrSzd0K0I2MGdLRTNMOFBIbkd0TXBWUjliRnlCQ2JhU00yVGRhU0Zs?=
 =?utf-8?B?OUpld01lUkRpUk00SDBManZUcXZQZkJQYXZlZTA1UEZrd2NEd2liR1JhY2pm?=
 =?utf-8?B?QjlUdGFlSDhjOGtPeHdVTkZUQW51QkcvMUNadGU4OXNqMjhkckZTMGltdlhn?=
 =?utf-8?B?SGdLT25weWkwVTIrcDk4YUdjQ29QR25UZ2YxekJmeFRHZUp0K0FnT3A0NjNV?=
 =?utf-8?B?MUlZd3F1ajhMM3BwMjRhTmZ5TVVvUjJwUHRBVzNPRUhQdjBLUm93empaMEE4?=
 =?utf-8?B?OHcrak9WKzRGaVk0NzI0WUNMUEZ2VmJrbjZWTDhYQm1NekljVER5Zz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc977da6-c5bc-44de-05d2-08da34bfe8df
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 09:06:47.6049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6laUqYZbEp8zE4R+05DlXr2PtGzIi5obobGISC9zv177kHEhZXqCzwYA78VkRmv89pLORyrTaYUR+GSDyivgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7244
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVjYSwNCg0KPiBIaSBQZXRlciwgTHVjYSwNCj4NCj4NCj4NCj4+IExlIDEyIG1haSAyMDIy
IMOgIDIxOjMzLCBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0
IDoNCj4+DQo+PiDvu79DQVVUSU9OOiBUaGlzIG1lc3NhZ2UgaGFzIG9yaWdpbmF0ZWQgZnJvbSBh
biBFeHRlcm5hbCBTb3VyY2UuIFBsZWFzZSB1c2UgcHJvcGVyIGp1ZGdtZW50IGFuZCBjYXV0aW9u
IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcg
dG8gdGhpcyBlbWFpbC4NCj4+DQo+Pg0KPj4+Pj4+PiAiTmVhbCIgPT0gTmVhbCBGcmFnZXIgPG5l
YWxmQHhpbGlueC5jb20+IHdyaXRlczoNCj4+DQo+PiBIaSwNCj4+DQo+Pj4+PiBJIGhhZCB0byBh
bHNvIHBhc3MgdGhlIC1tKiBmbGFncyBpbiBFWFRSQV9DT01QSUxFUl9GTEFHUyB0byBnZXQgaXQg
DQo+Pj4+PiB0byBsaW5rLCBwcmVzdW1hYmx5IHRoZSBwZXRhbGludXggdG9vbGNoYWluIGhhcyBp
bmNvbXBhdGlibGUgDQo+Pj4+PiBkZWZhdWx0cy4gTHVjYSwgYW55IHNwZWNpZmljIHJlYXNvbnMg
dG8gbm90IHBhc3MgQ0ZMQUdTIHRoZXJlPw0KPj4+Pg0KPj4+PiBJJ20gYWZyYWlkIEkgaGF2ZSBu
byByZWFsIGFuc3dlci4gOiggV2hlbiBJIGluaXRpYWxseSB3cm90ZSB0aGUgDQo+Pj4+IHNjcmlw
dCBJIGRpZCBpdCB0byBoYXZlIHRoZSBzYW1lIGxvZ2ljIGFzIHBldGFsaW51eC4gTGF0ZXIgSSBk
aWRuJ3QgDQo+Pj4+IHdhdGNoIGZvciBpdHMgY2hhbmdlcy4gSSB3b3VsZCBsb3ZlIHRvIGJlIGhl
bHBmdWwgYnV0IEkgaGF2ZSBubyANCj4+Pj4gYWNjZXNzIHRvIGEgenlucW1wIGJvYXJkIG5vdy4N
Cj4+DQo+Pj4gV291bGQgaXQgYmUgcG9zc2libGUgZm9yIHlvdSB0byBqdXN0IGltcGxlbWVudCB0
aGUgY2hhbmdlcyB0aGF0IA0KPj4+IFBldGVyIGhhcyBwcm9wb3NlZD8gIFBldGVyIGFwcGVhcnMg
dG8gaGF2ZSBhbHJlYWR5IGlkZW50aWZpZWQgYSBzb2x1dGlvbi4NCj4+DQo+Pj4gQm90aCBQZXRl
ciBhbmQgSSBoYXZlIHpjdTEwNiBib2FyZHMsIHNvIHdlIGNhbiBib3RoIHRlc3QgYW5kIHZlcmlm
eSANCj4+PiB0aGUgdXBkYXRlIHdvcmtzLg0KPj4NCj4+IFNvcnJ5LCB0aGF0IGlzIG5vdCB0cnVl
LiBJIGhhdmVuJ3QgZm91bmQgdGhlIG1hZ2ljIGluY2FybmF0aW9uIHRvIGdldCANCj4+IGEgd29y
a2luZyBwbXVmdyBidWlsZCB3aXRoIHRoZSB0b29sY2hhaW4gYnVpbHQgYnkgY3Jvc3N0b29sLW5n
LiBNeSANCj4+IGRpZmYgd2FzIGp1c3QgdG8gc2hvdyB3aGF0IEkgaGFkIHRvIGNoYW5nZSB0byBh
ZGp1c3QgDQo+PiB6eW5xbXAtcG11ZnctYnVpbGRlciB0byB1c2UgYSBwZXRhbGludXggdG9vbGNo
YWluLg0KPj4NCj4NCj4gSXMgdGhlcmUgYSByZWFzb24gd2h5IHdlIGNhbm5vdCBjaGFuZ2UgdGhl
IHp5bnFtcC1wbXVmdy1idWlsZGVyIHRvIGRvd25sb2FkIHRoZSBzYW1lIHRvb2xjaGFpbiB0aGF0
IHBldGFsaW51eCB1c2VzIGFzIHRoZSBjcm9zc3Rvb2wtbmcgdG9vbGNoYWluPw0KDQo+IENhbiB5
b3UgcG9pbnQgdG8gd2hlcmUgdGhlIHBldGFsaW51eCB0b29sY2hhaW4gY29tZXMgZnJvbT8NCg0K
PiBJZiBwZXRhbGludXggdXNlcyBhIHB1YmxpY2x5IGF2YWlsYWJsZSBwcmVidWlsdCB0b29sY2hh
aW4sIHBvc3NpYmx5IHdpdGggc291cmNlcyBhdmFpbGFibGUsIHRoZW4gdGhpcyBjb3VsZCBiZSBj
b25zaWRlcmVkLg0KDQo+IEhvd2V2ZXIgSSBzdXNwZWN0IGl0IGRvZXMgdXNlIGEgdG9vbGNoYWlu
IHRoYXQgaXMgc2hpcHBlZCBieSBWaXRpcy4gSWYgaXQgaXMgdGhlIGNhc2UsIHRoZW4gaXQncyBu
b3QgYW4gb3B0aW9uIGhlcmUuDQoNCj4gVGhlIGVzdCBvcHRpb24gd291bGQgYmUgdG8gZml4IHRo
ZSBjdC1uZyB0b29sY2hhaW4gb2YgY291cnNlLCBidXQgSSdtIA0KPiBhZnJhaWQgSSBjYW5ub3Qg
YmUgdmVyeSBoZWxwZnVsIG9uIHRoaXMsIGVzcGVjaWFsbHkgd2l0aG91dCBhbiANCj4gaGFyZHdh
cmUgdG8gdGVzdC4gOigNCg0KPiBWaXRpcyBhbmQgUGV0YUxpbnV4IDIwMjIuMSB1c2UgR0NDIGNv
bXBpbGVyIDExLjIuMCB3aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2ggc2V0Og0KPiBodHRwczovL2dp
dGh1Yi5jb20vWGlsaW54L21ldGEteGlsaW54L3RyZWUveGxueC1yZWwtdjIwMjIuMS9tZXRhLW1p
Y3JvYmxhemUvcmVjaXBlcy1kZXZ0b29scy9nY2MvZ2NjLTExDQoNCj4gRmVlbCBmcmVlIHRvIHBp
Y2sgeW91ciBtaXJyb3Igc2l0ZSBmb3IgdGhlIEdDQyAxMS4yLjAgZG93bmxvYWQuDQoNCkFub3Ro
ZXIgYWx0ZXJuYXRpdmUgaXMgdG8ganVzdCBkb3dubG9hZCB0aGUgcHJlLWJ1aWx0IGNvbXBpbGVy
IGRpcmVjdGx5IGZyb20gdGhlIFhpbGlueCB3ZWJzaXRlOg0KaHR0cHM6Ly93d3cueGlsaW54LmNv
bS9wcm9kdWN0cy9kZXNpZ24tdG9vbHMvZ3Vlc3QtcmVzb3VyY2VzLmh0bWwjZ251MjAyMg0KaHR0
cHM6Ly93d3cueGlsaW54LmNvbS9iaW4vcHVibGljL29wZW5Eb3dubG9hZD9maWxlbmFtZT1nY2Mt
eGxueC0xMV8yXzAtcmVsZWFzZS56aXANCg0KVGhlbiB5b3UgYXJlIHN1cmUgdG8gaGF2ZSB0aGUg
ZXhhY3Qgc2FtZSBjb21waWxlciBQZXRhTGludXggYW5kIFZpdGlzIGFyZSB1c2luZywgYW5kIHlv
dSBkbyBub3QgbmVlZCB0byB3b3JyeQ0KYWJvdXQgYnVpbGRpbmcgdGhlIHRvb2xjaGFpbi4NCg0K
V2hhdCBkbyB5b3UgdGhpbms/DQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhbnkg
cXVlc3Rpb25zLg0KDQpCZXN0IHJlZ2FyZHMsDQpOZWFsIEZyYWdlcg0KQU1EDQoNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
