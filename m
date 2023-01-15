Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D3CC3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 17:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E83410DE;
	Sun, 15 Jan 2023 17:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60E83410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBaCB_XhhMCc; Sun, 15 Jan 2023 17:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356C9410E1;
	Sun, 15 Jan 2023 17:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 356C9410E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44A291BF288
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 17:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03FE840327
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 17:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03FE840327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLbdvJs6U5Vr for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 17:25:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10C14400EF
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2041.outbound.protection.outlook.com [40.92.21.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10C14400EF
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 17:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3ys2o0G/Ra4xLU5aIIKYCoeeJbBQkyPkUCxO4d9prMpL4bPJuVInAvt7LKMCfOl8Wud6tJXbGIb5LQW5bS/cxvg8eDb6qDB32ii3zSfCz+fWO1nmIMcFTfbMd7HPW3RsUnShuR66va9k5xS6sfxLOQQU6rcNQ4frcK+3YR6xT/3fI13vhXSGn2E1tTXqnOEQOnha7tikJOzpVWmyf2mg+Beas7wd1Os9hdvz8mDNrm1dwouqYlSAYIjX+ZAGgKi7jSPUAm6bE1CwNGYdyHoPuskFWvkjI4gwb9awQjN3Y5g81nIHCwjmfCUkNng/DpsjdDsVEKRL8X1dwjwzohR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0+SSw5NQ7l7Ad9YSoRR/mMm+kprUkW/yoTVqFckXm8=;
 b=PWtJu5EQ6SmnlM+XngqYOP3oZvauw4y1z9q4Kh/zEyR/I7BIKqcuAQ7E5J5bPchLeo3Hx7G/1sziablBVsaUr6hJwnMITYCstu9+Hetb2Ouix0gH9pJfETLkgpAqe9epu7QsiXaAexZU4EnmKhTIiwCy0JdSWqqp0GXH+ky7dzhLwhuiebInQzL1jVEuczWmaqC6MqvYoepOtx6dy125hjveXmRE0/ekZVFq9BYoqvSOf8uj5hyrvJ4TnTAShaMuoLWM/zHoH/apJvyprBOGMTLjTDd9KLU10pCsxPreIsohI45CB3kSA4P7YCIvg62hXlSAaLvaXwd19Q+uXQnssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR18MB3898.namprd18.prod.outlook.com (2603:10b6:a03:2e8::11)
 by SA9PR18MB3773.namprd18.prod.outlook.com (2603:10b6:806:4f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Sun, 15 Jan
 2023 17:25:44 +0000
Received: from SJ0PR18MB3898.namprd18.prod.outlook.com
 ([fe80::4836:f2ce:484c:c8bf]) by SJ0PR18MB3898.namprd18.prod.outlook.com
 ([fe80::4836:f2ce:484c:c8bf%4]) with mapi id 15.20.5986.023; Sun, 15 Jan 2023
 17:25:44 +0000
From: Nathaniel Husted <nathaniel.husted@outlook.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Interest in podman package?
Thread-Index: AQHZKQZlAiDMCAI+Y0uiUd35MgBnWA==
Date: Sun, 15 Jan 2023 17:25:43 +0000
Message-ID: <SJ0PR18MB38980CC71C1D6B7CFF03EAA595C09@SJ0PR18MB3898.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [0u2Gt+Xla7mfQpF+ZtKTW3TXhBNDwXoBhwhabqJ1sZfTlXdLr2GV/fnStAHTnei+b7PPE5nSjeI=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB3898:EE_|SA9PR18MB3773:EE_
x-ms-office365-filtering-correlation-id: 311f45ea-6cfe-4f12-7479-08daf71d8863
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vR/p9vuzqUfAL54R4xvwDZ6TD+DYVhaw0v1eFSoR2h1qY9YQtfwj1w5JPOszmD+nNvdiSv0U7Y8hVRmlv7gAk1JCmk1D0RTKn8/04ebQJmUzzH4bzE7S/YyWlCxMLgKxF+kRCOwS94uHAJEOXsg3GqwhH5oXOTeDrs0bc1Y3TpubG2prBeZlR66BSYJUiZcYPiML0tosDH/Sl1a7Jqnsw+smUJwgi3Qh2R3XErA4a3Mh4YPUR8zp8vpSAN58zlxIg/sYa82X0FkFt0Og8PE7n1Dc6dJx2VTowoeWPlEnUtulFsB9B+dle+GgcpMw+WcmBdn6F886yeH3sB4qq6cjcIsu0ePYbLDxZ58BKQUTaP48OGfSiCVcWV9IT7fDD8YGt3HkeGhIov2rekG/Aj94RAnZ/lmdaT29mkAweY3V79ugqDDXPp1lh5zpC5DRbtgFNO5+Xs2nW3Qpk5Qb8lNH5KV9d+HMrhy8wnQX36gHbhhA04dNindBqkC+r90dTmuJzVQXmLiV3xudWw1QJDUCL+H7uxDuoHpLEBtW6axxsTbr2Dx0ekyai+CcgdDQrVi764s8z+VrFD4j2N9izGMU24P6p/OrltQeHnKFcR2wSVKAt4tLjsAIuZH6F7I6Un0wffKSvsDo2sQsLGzXVVvaqQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTBXRXAySVJLemhXZFdPdU5RQXpHKzl2Qld2SXlmcmhMQWdiTGwyNWNWbUlh?=
 =?utf-8?B?dVhkSGJlcktLQVZUaGQxNTRLdUFhM2pPZ1pDVzk1Vm1VMk1pcDRpdVR5YU9T?=
 =?utf-8?B?dHdtQTF2eVRTb29qL3FHZVk0RElyTmQvZUs2YnFpSldZYk9DMkt2eWlEQmZE?=
 =?utf-8?B?UmlibnBIT3N3MUhZaUNzanBhNDBHSUY5eE5Hbm1yVTZHR0lXZXFud1o2bDhr?=
 =?utf-8?B?WGd6VXgrRDZpVk1PTXRKREszM01EcFh4WFBRMU0zQnpsYno4QXl0ais0MlpQ?=
 =?utf-8?B?aVAwNUl2Q3NxcUM5eFA5SUh1djhXdmZCM0Y4dFRuSkxNRUxTUS9oZ29ON0VC?=
 =?utf-8?B?dGZ1MUxLbC9kRWxjYkVHT0pjRTRHQ3dHTnU4UmpvWFpqd3BZZGxVMzlJYmxj?=
 =?utf-8?B?QXpTdXl2T3ZseUtaWlpRd3JxYWNEMlJqK3l1aXUwMHRncmxpR2dHc29GMUNw?=
 =?utf-8?B?MDFPSmpoc0tFbXRSSzNWL1IrSEE4Rm5JeVhoakU0VzBKVEsrdDhTY3dsc2JB?=
 =?utf-8?B?TmhwMHUrNk9JMFZ3NzVBVW1IU005aTFGK0VPNnFHRWRiWU5KSU8vNmhibzRP?=
 =?utf-8?B?dW0zd3kwS053K054TTYwaTBzQUI5SUF2WnBFa2RrYTJpS1FhWTVpcmVaYjFk?=
 =?utf-8?B?QmU2cnU4UDQzSEpxL1VtOTZiZEdBTWhxWWdQTFU5VWY5UHhkSlJTd3JDa2g1?=
 =?utf-8?B?Z1ZJd1ByRVZzRHhrTXlGMUdWYW5nRllGRmM0RlJzNm13MkxtZ0J6N1QyaS9m?=
 =?utf-8?B?VGl5WHVHN3BMTk10SU0zRDNOL2hydU1aOW03clpadnVrQm1ZSWdONThObnJK?=
 =?utf-8?B?Tk5HY3NIdng0cUpXeTFuNDFlYWh3MkVRMG5MUTZwR2pON2FCWUszdlhpVzFN?=
 =?utf-8?B?NFRZSVMyS1UyRnpTaW5QSjNzUWNNZjZZMk9FOWdSaXNTdWxIRGlzWmRZMjVG?=
 =?utf-8?B?N0pIQWdLaFFJbCtPYXdxUnZ4M3JxblBDTVVIam5SajdQTjNKc3VUbmFvU0Iw?=
 =?utf-8?B?UDNkVzdoR0IvZURmaVBSSG9tWmJBT0pVQmgzUzhCa1kvd0QvNmhJWFUwTDdR?=
 =?utf-8?B?cE1rNi9CMzIwV2hYYThtVkF3V1B4aHpsbmpCRFcrOE5sMTd2d25aRUp4S0Ni?=
 =?utf-8?B?OS9YYmpORjAvaDZBUkZiYzA0NXJNMm82OUY5WmNIZzBWdHd3bXdrYzViL2dx?=
 =?utf-8?B?c2lnbEZWYXRhUUVoOVpSYzd3WVQvQVYrUHJaOTZEbDlBT2FXMWZkcWxyK2tJ?=
 =?utf-8?B?VG12bnJhNGJZalNUOWRNTWxNVUU5bTN2dCtENGdpQm5nODZpR09uSFpNMTly?=
 =?utf-8?B?ODFMM2FoN29zMVMyY0FQMDlWUU9CaGpCMmFrcDdHRW5NRVl6Skw3amNCakk2?=
 =?utf-8?B?ajZFc3dTN1pYWUhPUnRjbFVrd21uaThxeW1ialZWWjJ5Vlo0Wm9GSlVyckg0?=
 =?utf-8?B?UXVsUUQ0eDJYZUhiOURIeWNEdEZ0N28yQ0ZKSlRVZytzUkM4SDYrOWU3SS9a?=
 =?utf-8?B?ZXBXWWJ5dUM5eGVxd1MwNDNJeFdBYlNFc04vUHBwKzBramZ6Y2VaUnBBNGFX?=
 =?utf-8?B?THlKR00vTDRndkdoNjRIcjR4VGQrRzFsOWRDMGlJcVJuUDVyOWhjTTY5d3Ur?=
 =?utf-8?B?ZVUwcmd5OTNWVHBYVVY2YmxyKzYxK0VBYXN1Y2U1VEllbElNRlA0ckY4RHBT?=
 =?utf-8?B?SFdHUzFXS3UwdDV3UURhSjN6RXpQa01xQUtienJnNGYxN3RpOEFHY3pDUFdk?=
 =?utf-8?B?UUlsMVMvUGdyK1hYaGcyYUNlNUxSY2x5Q0FRUnBvQ0c2VE1SQlAxdXFpckZt?=
 =?utf-8?Q?59d222DBbB2nuPyrjaYuxeV7wOcrTJ4gq5TPc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB3898.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 311f45ea-6cfe-4f12-7479-08daf71d8863
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2023 17:25:44.0365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA9PR18MB3773
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0+SSw5NQ7l7Ad9YSoRR/mMm+kprUkW/yoTVqFckXm8=;
 b=O+DcBKwZehU/x8a/QNvYb29m1HQLqTRCAkKqW7UpQP/o5a307DQuJlLtG7dCAqE1pDX5nbzgwOcULTEGWoEZTFhlvylYLheWXLXgW1H0m9MJFCrtOArLvG9CWM5kmtrPTA0EbOOPAsYsWRHK9tazd9YJDK8K0UaGWFYUvw6BTnPHOT99mwN8vNuYYCBcSry/+azfJ531/pH1Qhl6glqLPv+S2mF4EgqV8BA593N+QyBsdPwI7iaC/6F937L+WX2n5LBQ1TZW+pKBQsEjYKRNnWCJ+ocRC/4PHTLq3F1zWjDMLhD2KxVJtySsJLuSdhoj8BZa+7veEnbVrWShWam4jQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=O+DcBKwZ
Subject: [Buildroot] Interest in podman package?
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
Content-Type: multipart/mixed; boundary="===============4672033383900050511=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4672033383900050511==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR18MB38980CC71C1D6B7CFF03EAA595C09SJ0PR18MB3898namp_"

--_000_SJ0PR18MB38980CC71C1D6B7CFF03EAA595C09SJ0PR18MB3898namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxsLCBJ4oCZdmUgbm90aWNlZCByZWNlbnQgc3VibWlzc2lvbnMgb2YgY29ubW9uIGFuZCBzaGFk
b3cuIEkgaGF2ZSBhIHNldCBvZiBwb2RtYW4gY29uZmlndXJhdGlvbnMgdGhhdCBhcmUgZnVuY3Rp
b25hbCBidXQgd291bGQgbmVlZCBzb21lIHdvcmsgYmVmb3JlIHRoZXkgYXJlIHJlYWR5IHRvIG1l
cmdlLiBJIHdhcyB3b25kZXJpbmcgaWYgZm9sa3MgaGF2ZSBhbHJlYWR5IGdvdHRlbiB0byB0aGlz
IHBvaW50IGFuZCBhcmUgY2xlYW5pbmcgdXAgdGhlaXIgb3duIG9yIGFyZSBpbiBuZWVkIG9mIGEg
c3RhcnRpbmcgcG9pbnQ/DQoNClRoZSB3b3JrIGluIHByb2dyZXNzIGlzIGxvY2F0ZWQgaGVyZToN
Cg0KaHR0cHM6Ly9naXRsYWIuY29tL0RyV2hvbVBoZC9idWlsZHJvb3QvLS90cmVlL3BhY2thZ2Ut
YWRkLXBvZG1hbg0KDQpDaGVlcnMsDQpOYXRoYW5pZWwNCg==

--_000_SJ0PR18MB38980CC71C1D6B7CFF03EAA595C09SJ0PR18MB3898namp_
Content-Type: text/html; charset="utf-8"
Content-ID:  <E957FA954A30AD4FB2F570D69A463E21@sct-15-20-4755-11-msonline-outlook-ba224.templateTenant>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IGRpcj0iYXV0byI+DQpB
bGwsIEnigJl2ZSBub3RpY2VkIHJlY2VudCBzdWJtaXNzaW9ucyBvZiBjb25tb24gYW5kIHNoYWRv
dy4gSSBoYXZlIGEgc2V0IG9mIHBvZG1hbiBjb25maWd1cmF0aW9ucyB0aGF0IGFyZSBmdW5jdGlv
bmFsIGJ1dCB3b3VsZCBuZWVkIHNvbWUgd29yayBiZWZvcmUgdGhleSBhcmUgcmVhZHkgdG8gbWVy
Z2UuIEkgd2FzIHdvbmRlcmluZyBpZiBmb2xrcyBoYXZlIGFscmVhZHkgZ290dGVuIHRvIHRoaXMg
cG9pbnQgYW5kIGFyZSBjbGVhbmluZyB1cCB0aGVpcg0KIG93biBvciBhcmUgaW4gbmVlZCBvZiBh
IHN0YXJ0aW5nIHBvaW50Pw0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+VGhlIHdvcmsgaW4gcHJv
Z3Jlc3MgaXMgbG9jYXRlZCBoZXJlOjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+PGEg
aHJlZj0iaHR0cHM6Ly9naXRsYWIuY29tL0RyV2hvbVBoZC9idWlsZHJvb3QvLS90cmVlL3BhY2th
Z2UtYWRkLXBvZG1hbiI+aHR0cHM6Ly9naXRsYWIuY29tL0RyV2hvbVBoZC9idWlsZHJvb3QvLS90
cmVlL3BhY2thZ2UtYWRkLXBvZG1hbjwvYT48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
PkNoZWVycyw8L2Rpdj4NCjxkaXY+TmF0aGFuaWVsJm5ic3A7PGJyPg0KPC9kaXY+DQo8L2JvZHk+
DQo8L2h0bWw+DQo=

--_000_SJ0PR18MB38980CC71C1D6B7CFF03EAA595C09SJ0PR18MB3898namp_--

--===============4672033383900050511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4672033383900050511==--
