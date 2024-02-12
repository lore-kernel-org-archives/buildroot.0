Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B753FC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 23:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55E5060A54;
	Mon, 12 Feb 2024 23:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W5XMNPml1Wmm; Mon, 12 Feb 2024 23:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD2660A5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD2660A5C;
	Mon, 12 Feb 2024 23:50:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30B451BF2F4
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 23:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DAAE81EAD
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 23:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEzC4eYe5Rsv for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 23:50:33 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::725;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB71A81EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB71A81EA0
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0725.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::725])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB71A81EA0
 for <buildroot@uclibc.org>; Mon, 12 Feb 2024 23:50:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=vw21cEmRa/otjdsPsk3f3Zu1EvcEwXqML+RVBRTFKFb9/eJi16hUqsf8F1B1btobMqWRw5cPQnOtlr03K4jNJBhulmQzpRHAhoDibyvSIq/9KsB3q9TLZZje7kpeq8hus0QYOn88V7KNLEN8/5frt9R6AOH7w7J9Um6EKGiU8ETxLqmrXYZj0VL8jtY/qNSpyAWy01LczzacQciZDVAnzldVnDTlXtwO8sP6hNgRa5qinrGI6Kfs4Gx2Um1rf+45FmvcNyg2NYeMfIYDkcE0Fu/6/F/dLYIe6XdrxWIpBaDt6kvIkooerE76TPuFNAER7peKndvDaPf1b4Z8YzmJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUC58Zpz7V1VgUHjThxRi7diG+ZbKLqWqhkb3Z9NgOc=;
 b=Sp0Mhd3wdHND1kfKLvC+0CKF78NMrMwrRurYOvlKKz4VEJU5TBx3Kc96qbRYcWwsP0ItEMnt8a6TwnCHqNieWR5FxN/FNWuUOSuZ6f++oCZtAxbyBEhajAX4+6Xt4Pm1J90nBrpxIwS8bTDd/urvW00Lgq5eHCTXwQd/QjVfK97VQ7p9qhQ59aaIWT0yJpi4qGcCdB2R3uNnfMTRLQ/c4nfe5WTT9MDtWv+FSv52cUTslTHLGa8sStjxJfKSI8h1l62jfo6/xsvqvHBqhsY12bpgKmguPIsbGrcJHsEY9Kw6y2YrQg34w3KNdO6BHulu9ohVJZ6+5ztlMOeAVZldsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1443.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Mon, 12 Feb
 2024 23:50:27 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5a70:14f9:1bc1:eaa]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5a70:14f9:1bc1:eaa%7]) with mapi id 15.20.7249.032; Mon, 12 Feb 2024
 23:50:27 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Vincent Fazio <vfazio@xes-inc.com>, Adrian Perez de Castro
 <aperez@igalia.com>, James Hilliard <james.hilliard1@gmail.com>
Thread-Topic: [Buildroot] [External] - Re: [git commit] package/python3: bump
 version to 3.12.1
Thread-Index: AQHaXg5AnwIVen1cWkWd3nUgurg9bg==
Date: Mon, 12 Feb 2024 23:50:27 +0000
Message-ID: <PH1P110MB160341A0461A5B88557EDC409F48A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240206222231.8950D87481@busybox.osuosl.org>
 <CALAjcgVd0VGDZCRpH3cpeikpNH0ZZOkV9c667cH6GQhMa8qtTg__833.063844923743$1707444930$gmane$org@mail.gmail.com>
 <pan$a29b1$235b0aec$c06a1ff$d5539253@ID-313208.user.individual.net>
 <CADvTj4pgwRLcuj10aJ19e+OHiwRacPf2OY2cu=v48GrzuFRWDw@mail.gmail.com>
 <20240212005226.GB2106578@igalia.com>
 <PH1P110MB16037A595D457174BA0921489F48A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB16037A595D457174BA0921489F48A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1443:EE_
x-ms-office365-filtering-correlation-id: bf0ac5bf-e3cf-4a23-3fd4-08dc2c256377
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PQNgryIUdlYBAqQkvNXaVxAWvtFbiCEkRB2ek/iytU4br0pjJQg6cZ37/LcXu9SGp9s10e6aQ9HyzyaOfctvso/G6luHFqwPtUJBsAdkveJtvK0R0MMXlO5rbioZ7SaDe7n2FEDuWdWjAEkr57rMlitf/50JzpkcHSn9N/GaeCnGLb/UseR6bdZeCKf3kTkdmLrxQCRrP7kiIAHJxTH8GaVxVBnVhuEgmeDNcoDZWO7oPUc6aeuF3/fxdpgwaN+HWAavbErq9rufwx886KlXEaERhxe57uvoTmqRTik6WPvCO+hSmO6Ysvldte9nWrVNCL/58UX6Aw0zrU2aQwUgTj8sFMlhwkuPDaVSUeIubf5ARvDITCU1xocKKiun5PM9/x1NffEK5TQcAFS7hr6/A4HUPsV2gecEmLn7hrG5f2lkOq9dU5whx/aXRCYsCQGQobvk3DCtNzI4QUqjWPOPx060PlgxK033Vafjtbi21rcM5eSRaT8yrkR7sVllt087fKGVHiLYTnbh3opAaPIRsdFeMrgT4ljwRaU/w6xruQF5KkCkUthJAsoVeeYscmIDbcc8aagjrZiZmCe9Ck9QyBtzuJagXEMWnocYhAoM3u8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230273577357003)(230922051799003)(1800799012)(186009)(451199024)(66556008)(8676002)(4326008)(8936002)(86362001)(52536014)(6506007)(33656002)(66946007)(66476007)(5660300002)(508600001)(966005)(53546011)(7696005)(38070700009)(71200400001)(66446008)(64756008)(54906003)(110136005)(76116006)(26005)(9686003)(2940100002)(83380400001)(38100700002)(122000001)(2906002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFNjSTZoNlFhMEFWeGxmWlp0MVVQNDcyeEYzVC9Md2owMFpWT1F2ck9lcTVp?=
 =?utf-8?B?bXVvWTdsUDlYMndGWGgyaHlSTkVFNnM0SXFhRE5waWpxdUdMNjJIektsR04x?=
 =?utf-8?B?YVllYjh5K2NxYkZITWozaUtyWlpJL2NENWZ2V1FrVDIwRzBpWWxobXBZT2Z5?=
 =?utf-8?B?aHpkN1VVQ3hkT0kwdWVaSHJ1SW4ySkl5NmFub1lOVHh5R1l6WjdWaGxiSytr?=
 =?utf-8?B?bFRXLzdvcnJ0bE9OOXZwaUZoWGM3TUo4OUJEdmlqdTNsd2xoMDgyUDQ2Vjdy?=
 =?utf-8?B?bHdYN0t0bWtJOHAvMGZKM1FpTExoZE5ESzJ2QVJacGEyZnNmMFlPREpRWlI0?=
 =?utf-8?B?c25wSlNHbG80Mi9nUy9BQkpTZkoybjdnUytGdWtWajhzeUxOSW5LM0NxOTlI?=
 =?utf-8?B?SmhYaTgwVWpERkRLK0NRRkFmb1hwSUNGZjJiQ0xqQ2dUejFzUnM0Q3E0ZVBM?=
 =?utf-8?B?NlRZdFpOc1A3VkgyTUphbTlsT0IzcUlYdUg5K3Y5YmpaQnNNemhGaEh2VDJo?=
 =?utf-8?B?dGxTOHFFdkpRcTZ3NmRrWnJFdkNFcjlRK1Q3V2RJYmxxbEJLVERvWEtGaW1U?=
 =?utf-8?B?eW1TTFV6TXc0bHVXcitXRUtNTGZuWmNlY0ZJWmhncnhwSW5TaWJWMk1qc0Ix?=
 =?utf-8?B?cFB2eHpab1BDb2FPVHRJT0NGZjM4b3liTzV1dDI3VTZGVFJCOUxod0lOOVcy?=
 =?utf-8?B?clhSaVQzL0pOZmFwd0dzcVBLR25ZdEZBOVUvMHFGN2tSamJ4UmNsNEk1ZG94?=
 =?utf-8?B?QXZOaWxUYS81ZE9YWXg2SkNpM2ovR1RjeVBMQmx2T3U0a0k0ZGxaMm5RSms3?=
 =?utf-8?B?ZE9ZT3ErVDNLcHFmZE9oV285QklFaTlZaEJNMXFLRFVMckx2WDRWR2NtbUJ6?=
 =?utf-8?B?U1RmVXJseGdFbUc3dVdnaGJ1c1IxUlAxV1d2T2F0VXZnaUJta0p5bzlpdnFL?=
 =?utf-8?B?ei8zL0NyV0Q4dmdjU3BiQnFQSVR0NFg4NWpNUUVOaVVud0NuREVIdmZQckhF?=
 =?utf-8?B?djVzZE9sL3FDVEhBbm43b2MzdnRZYlo0Y0NhRC9YQW9lak1nNGZBb05RK0s5?=
 =?utf-8?B?V1F2WVNvVjVvZVY3UGtCc2RBMDlIY2VUa0puMXdSalFVcUNQbUlYYW0yQ1g1?=
 =?utf-8?B?c0t4djltZXBzcE5JYnRuVTRzYjVJM3psY1NZNmxlM3B6KzU5R09MQmZjN2tB?=
 =?utf-8?B?YUJSVlNqOHlHK0dhTklOdDhIMUZ3Vk1mRzhSWU0vQjRsWDFVVGo0MFkyMDVF?=
 =?utf-8?B?YTZYeHVmR0F6cHRONjdQUmh6KzhMdGc5UWFnbjc0ZmJZSHc1NXYvdURYQXkv?=
 =?utf-8?B?cXEvNVBCM2RuaW9kaEtWSnRlVFkvZGZuV3NKNksrS1RmODhya1czWFlwYnlV?=
 =?utf-8?B?TDdLaWtoSDJ6djFTQlJkWHBKTnJyYnl0MXozMWRCc3V6SWhWd0NyQ0hDbFdK?=
 =?utf-8?B?ZTYzazRVS09aZ1gyOUxuZ2dGNWhud0Z2bkxOTjA1QnFRWmFBeUdMSzVIMWd2?=
 =?utf-8?B?Yi9nemlzTFBwTUNZUWFzZlVSeXJjOWJJT2F6NFJPV0xiQ3h1VFlkSWxFNjdl?=
 =?utf-8?B?UjVXVmlPZksxUWFqK1dIeVlGWFl3QTJueXkwZENla0I0T3NPWTA2QlQvRURB?=
 =?utf-8?B?NXE3WXJrdWpUR3BYdzhHYXp3eXQzUHpTalY5dEhiVFdWdEdkbEFuaGtBSFVJ?=
 =?utf-8?B?cjJkY3NXa0lKdGFFenRvUzQwbWU3WHUyVDJwN0hhbVFqa1ZEWFg2NUpNOVg1?=
 =?utf-8?B?Mk9jN1dZTnVhci9xWEQ4ZVo5Rm1paEgyeGVNVGJuWUxaRnZrbXVHOHJHeFJv?=
 =?utf-8?B?LzhvakxkU1ErcnlDMkxBSi8wK0o2R1pNS2ZKRWY1R21peXk4Q2hNSjcrd0FL?=
 =?utf-8?B?K251VVcrdXdKcHpwL05CNnRkd3oyNnZudXRJaWsyNjNhNzNWR05rTUxKQys2?=
 =?utf-8?B?RHN4N2k2ekFpdEx2ejQvNktMVnVXUlFhUGNpZ0VUWkJoYWlHWjRVR2tHT29l?=
 =?utf-8?Q?3CodJiVPF6+vHOLiJ0YTn7XDOFsaEY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0ac5bf-e3cf-4a23-3fd4-08dc2c256377
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 23:50:27.3792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1443
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUC58Zpz7V1VgUHjThxRi7diG+ZbKLqWqhkb3Z9NgOc=;
 b=KfclOFv7Xse7Dx++uT21V5+dPM4M45wZT+nJnzTNXlr9GxfM5UOl6dVKDXYpAMiv/kjBfPG6wB7sQfukuq/Jez5gtRcg/6i6ldy2W9Q+2a+OjNNsKd+rIraQet1KBx65bdA7Ewr6Z1Xwlu+JBSxk4ee3s+zNFNFeAjnOgmL++f5YdXcQBiO5xn+Ut1kiKxCd3NEy85WU02G5kxeEFdCMq83P0VJga4uKbHyCRQ8wRix9/o30VzmcjzK0oEks7qQGzR3Yh33W9J2NApkUcOY7SlsOk4vE2MAa71wWa7EewHmRmys+RwMhsCNa/2+k/MH/R3JiPWYOieXzqoBfxjDlKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=KfclOFv7
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [git commit] package/python3: bump
 version to 3.12.1
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 "buildroot@uclibc.org" <buildroot@uclibc.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGJ1aWxkcm9vdCA8
YnVpbGRyb290LWJvdW5jZXNAYnVpbGRyb290Lm9yZz4gT24gQmVoYWxmIE9mIFZpbmNlbnQNCj4g
RmF6aW8NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAxMiwgMjAyNCA3OjQ2IEFNDQo+IFRvOiBB
ZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT47IEphbWVzIEhpbGxpYXJk
DQo+IDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPg0KPiBDYzogQmVybmQgS3VobHMgPGJlcm5k
QGt1aGxzLm5ldD47IGJ1aWxkcm9vdEB1Y2xpYmMub3JnDQo+IFN1YmplY3Q6IFJlOiBbQnVpbGRy
b290XSBbRXh0ZXJuYWxdIC0gUmU6IFtnaXQgY29tbWl0XSBwYWNrYWdlL3B5dGhvbjM6IGJ1bXAN
Cj4gdmVyc2lvbiB0byAzLjEyLjENCj4gDQo+IEFsbA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+IEZyb206IGJ1aWxkcm9vdCA8YnVpbGRyb290LWJvdW5jZXNAYnVpbGRy
b290Lm9yZz4gT24gQmVoYWxmIE9mIEFkcmlhbg0KPiA+IFBlcmV6IGRlIENhc3Rybw0KPiA+IFNl
bnQ6IFN1bmRheSwgRmVicnVhcnkgMTEsIDIwMjQgNDo1MiBQTQ0KPiA+IFRvOiBKYW1lcyBIaWxs
aWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4NCj4gPiBDYzogQmVybmQgS3VobHMgPGJl
cm5kQGt1aGxzLm5ldD47IGJ1aWxkcm9vdEB1Y2xpYmMub3JnDQo+ID4gU3ViamVjdDogW0V4dGVy
bmFsXSAtIFJlOiBbQnVpbGRyb290XSBbZ2l0IGNvbW1pdF0gcGFja2FnZS9weXRob24zOg0KPiA+
IGJ1bXAgdmVyc2lvbiB0byAzLjEyLjENCj4gPg0KPiA+IEhpLA0KPiA+DQo+ID4gT24gU3VuLCAx
MSBGZWIgMjAyNCAxNDoyMDozMSAtMDcwMCBKYW1lcyBIaWxsaWFyZA0KPiA+IDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+IE9uIEZyaSwgRmViIDksIDIwMjQgYXQgOTox
MeKAr0FNIEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+IHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiBBbSBUaHUsIDggRmViIDIwMjQgMjE6MTQ6NTIgLTA1MDAgc2NocmllYiBKYW1lcyBLbmln
aHQ6DQo+ID4gPiA+DQo+ID4gPiA+ID4gICAgICAgICBpbXBvcnQgbWF0aA0KPiA+ID4gPiA+ICAg
ICBJbXBvcnRFcnJvcjogL2xpYi94ODZfNjQtbGludXgtZ251L2xpYm0uc28uNjogdmVyc2lvbiBg
R0xJQkNfMi4zOCcNCj4gPiA+ID4gPiBub3QgZm91bmQgKHJlcXVpcmVkIGJ5DQo+ID4gPiA+ID4g
L2J1aWxkcy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3B5dGhvbjMtMy4xMi4xL2J1aWxkL2xpYi5s
aW51eC0NCj4gPiA+ID4geDg2XzY0LTMuMTIvbWF0aC5jcHl0aG9uLTMxMi14ODZfNjQtbGludXgt
Z251LnNvKQ0KPiA+ID4gPg0KPiA+ID4gPiBIaSBKYW1lcywNCj4gPiA+ID4NCj4gPiA+ID4gc2Ft
ZSBoZXJlIG9uIERlYmlhbiAxMi40L2Jvb2t3b3JtLCB0cnkgdGhpcyBwYXRjaDoNCj4gPiA+ID4g
aHR0cHM6Ly9naXRodWIuY29tL2JrdWhscy9idWlsZHJvb3QvY29tbWl0Lw0KPiA+ID4gPiBkY2E4
YjViZWU3NzQyZmZlZGY4MWEwMjdhZmZhZGQ0YjdlMThmYzNmDQo+IA0KPiBUaGlzIGNlcnRhaW5s
eSBhdm9pZHMgdGhlIGlzc3VlIGJ5IG5vdCBydW5uaW5nIHRoZSBwcm9ibGVtYXRpYyBjaGVjay4g
SSBhbSBhDQo+IGxpdHRsZSBjb25jZXJuZWQgYWJvdXQgdGhlIHJvb3QgY2F1c2UuDQo+IA0KPiBJ
IGhhdmVuJ3QgaGFkIGEgY2hhbmNlIHRvIHRlc3QgMy4xMSwgYnV0IGZyb20gdGhlIGRlYnVnZ2lu
ZyBJIGRpZCBvbiBGcmlkYXksIEkNCj4ga25vdyB0aGF0IHdoZW4gdGhlIGhvc3QgcHl0aG9uIGlz
IGV4ZWN1dGVkIHRvIGNoZWNrIHRoZSBidWlsdCBtb2R1bGVzIGZvcg0KPiB0aGUgZm9yZWlnbiBw
eXRob24sIGJlY2F1c2UgUFlUSE9OUEFUSCBpbmNsdWRlcyB0aGUgcGF0aCB0byB0aGUgZm9yZWln
bg0KPiAiYnVpbHRpbiIgbGlicmFyaWVzIGFuZCBiZWNhdXNlIHRoZXkgYXJlIHRoZSBzYW1lIGFy
Y2hpdGVjdHVyZSwgdGhvc2UgbGlicmFyaWVzDQo+IGdldCB1c2VkIGluc3RlYWQgb2YgdGhlIG9u
ZXMgZnJvbSB0aGUgaG9zdCdzIGJ1aWxkLiBTbyB0aGUgaG9zdCBweXRob24NCj4gYXR0ZW1wdHMg
dG8gbG9hZCBhbmQgZXhlY3V0ZSBsaWJyYXJpZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGJ1aWx0IGZv
ciBhDQo+IGRpZmZlcmVudCBsaWJjLiBJIGZvdW5kIHNpbXBseSBkcm9wcGluZyB0aGUgZm9yZWln
biBweXRob24ncyBwYXRoIGZyb20NCj4gUFlUSE9OUEFUSCBjYXVzZWQgdGhlIHNjcmlwdCB0byBl
eGVjdXRlIGZpbmUsIGJ1dCBJIGRvbid0IGtub3cgdGhlIGZ1bGwNCj4gcmFtaWZpY2F0aW9ucyBm
b3IgZHJvcHBpbmcgdGhhdCBwYXRoIGFzIHBhcnQgb2YgUFlUSE9OX0ZPUl9CVUlMRCB3aGljaCBp
cw0KPiB1c2VkIGluIHRoZSBib2R5IG9mIHRoaXMgcHJvYmxlbWF0aWMgbWFrZSB0YXJnZXQgYW5k
IGEgZmV3IG90aGVycy4NCj4gDQoNCkkgZW5kZWQgdXAgd3JpdGluZyBhbiBpc3N1ZSBpbiBDUHl0
aG9uIGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9pc3N1ZXMvMTE1MzgyDQoNCkRy
b3BwaW5nIHRoaXMgbWFrZSB0YXJnZXQgaXMgcHJvYmFibHkgZmluZSBpbiB0aGUgaW50ZXJpbSBv
ciB3ZSBjYW4gdHJ5IGRyb3BwaW5nIHRoZSBQWVRIT05QQVRIIGZvciB0aGUgdGFyZ2V0IGRpcmVj
dG9yeSBidXQgd2l0aG91dCBmZWVkYmFjayBmcm9tIG1haW50YWluZXJzIEknbSBub3Qgc3VyZSB3
aGF0IGFsbCB0aGF0IHdvdWxkIGltcGFjdC4NCg0KVGFuZ2VudGlhbGx5IHJlbGF0ZWQgYXMgSSB3
YXMgZGlnZ2luZyBpbnRvIHRoaXMsIDMuMTMgbG9va3Mgc2xhdGVkIHRvIGRpc2FibGUgdUNsaWJj
IHNvIHNvbWV0aGluZyB0byBrZWVwIG9uIG91ciByYWRhcg0KDQpodHRwczovL2dpdGh1Yi5jb20v
cHl0aG9uL2NweXRob24vYmxhbWUvbWFpbi9NaXNjL3BsYXRmb3JtX3RyaXBsZXQuYyNMMjQNCg0K
PiA+ID4NCj4gPiA+IFllYWgsIHRoaXMgZml4ZXMgdGhlIGlzc3VlIGZvciBtZSBhcyB3ZWxsLg0K
PiA+DQo+ID4gU2FtZSBoZXJlIG9uIEFyY2gsIEkgbmVlZGVkIHRvIGFwcGx5IHRoZSBjb21taXQg
dG8gZ2V0IGhvc3QtcHl0aG9uMw0KPiBidWlsdC4NCj4gPg0KPiA+IENoZWVycywNCj4gPiDigJRB
ZHJpw6FuDQo+ID4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBv
ZiB0aGUgb3JnYW5pemF0aW9uLiBEbw0KPiA+IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFj
aG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXINCj4gPiBhbmQga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlLg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdA0KPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZw0KPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
