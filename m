Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF37C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 10:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F6041730;
	Wed,  6 Aug 2025 10:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lT-edmtb_B3w; Wed,  6 Aug 2025 10:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D38941740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D38941740;
	Wed,  6 Aug 2025 10:45:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A5AC931
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A327D408F8
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcaZRpifL7zI for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 10:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20b::1;
 helo=beup281cu002.outbound.protection.outlook.com;
 envelope-from=hhansen@avt-nbg.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3077B40129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3077B40129
Received: from BEUP281CU002.outbound.protection.outlook.com
 (mail-germanynorthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20b::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3077B40129
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:45:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtFvQG7E4cYBs1PnUODQy6ZgOAscicyNBKEsIRoDeTIjQI7XCNjlD1uasaT1a7xCv0RKax5hHTyJZM+7kHSIdsQidNBepSoDMY7VGL4iofz4AQ/dcwmLYBA/V4L8hprFTAZ4poCKrxtYPdO48fhPFcs46adE8k2Ok5otSuwCj2+VfM+zAco/p7qCrP5S/ES5QHOFvjm6vz68ugXUOSj+OOo2QhKEdsgvGkmqQLj+m08fN448j4Bj0NqM5VGYu65XByOvUYWRsdHlYjFY3CRyDHTpoIxQnnmyDdjy8EKP/WUTRkId+wSJjPE9APjByHJBVMR9SvJLI8GYtbnabz4ssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/tCxC+/L4wAaBJg/wMKVt2n76x4GXSSBJoTz/JlWQQ=;
 b=SkCh9MmuheP0M3k1aztZXdR6Fd40A5m6exubcpf9EcKNoTjH8xBG7ja0wluUp7I8Z91f3q/k4dy77NzC8Dr6AkYDlql3eTP5ZeAmaqnFTorgXgJk63LpQiAYixEsRLoH1ax3v70SCnQuDx+SROGgKfGmfnIfBz702mX6jV5v3wlr8Sp8I27LYnmzjNdcJVooMKfZ2kzc9CCPWFtTw9cP+6SSefCVoK0AND1RLYnzhiAMIWOhPuVD90AFibg3MV0Qzs0DqZtd1n95B0v5wUsH4X+ZcjlQ781O6/praRiTrilNLXAyjbn8uB9dnUbRKsTv3gaHyS886QzgYJBW7GicSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=avt-nbg.de; dmarc=pass action=none header.from=avt-nbg.de;
 dkim=pass header.d=avt-nbg.de; arc=none
Received: from FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:191::13)
 by FR6P281MB5587.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 10:45:38 +0000
Received: from FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4aa:48f0:ce1d:f268]) by FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4aa:48f0:ce1d:f268%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 10:45:38 +0000
From: Hans-Heinrich Hansen <hhansen@avt-nbg.de>
To: Peter Korsgaard <peter@korsgaard.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: AW: AW: Buildroot with Advantech EIO-IS200-DRIVER
Thread-Index: AQHcBTNxKSIr2Pk5DkClUIVtQdWYqLRS0b5GgACkLqeAAB089YABhlUogAAmJoCAADNXMQ==
Date: Wed, 6 Aug 2025 10:45:38 +0000
Message-ID: <FR5P281MB507846E148AA626E49A48FD4872DA@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
References: <FR5P281MB50782986E33353F9AFF80C468723A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 <87y0rzkkf7.fsf@dell.be.48ers.dk>
 <FR5P281MB5078D44083ABDE1AAC41FC828722A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 <87ms8ejodi.fsf@dell.be.48ers.dk>
 <FR5P281MB507889A3AEA35D1FD5240DA7872DA@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 <87ikj0kiii.fsf@dell.be.48ers.dk>
In-Reply-To: <87ikj0kiii.fsf@dell.be.48ers.dk>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR5P281MB5078:EE_|FR6P281MB5587:EE_
x-ms-office365-filtering-correlation-id: 19ba14c4-3ca7-42ae-1281-08ddd4d661ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|19092799006|8096899003|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?AcVGZMwC2nhpWuPpF2OGfephOxnvYD1OlCxUeRjY+QJNhkSA4jvjCltN4ALD?=
 =?us-ascii?Q?XFu/9LWidBcPNZU4d6B37ncqk2NDbjjEDN3luTjGkcgL62grhdADc0XgDlVI?=
 =?us-ascii?Q?oaW3aWGJFR9SzsAwevySeMnO2dlVrzAd+lvKPeGQufkI1rJ+AwEnTYcPn9b0?=
 =?us-ascii?Q?5RWuVExNYAH/1nF7Lcyg3EDHBmkkfVk/cg382bfyi08+b30zaVBTPJ6Cyp7z?=
 =?us-ascii?Q?/zGFkz5CSriHRUl7RHI4chGHh5mGUU7NNimIVl53PigC1H+4UN4tzmt+kWgg?=
 =?us-ascii?Q?bh2y8qwb19uqgrtbJB4FrM7MO6VDg6lpgwSR59ip4dg1NndI9sZZeueS9VW8?=
 =?us-ascii?Q?dgv05I4Yei+JJDW3VUPDx04Z3ddfN9fm5xkf2BFVSU7GZUvoEYofkzFycTNv?=
 =?us-ascii?Q?b5U5Tu/IEsFDUFvrpD5RSqgF5p4Lanu6vRxd5cdOqhOZxm0T4q2CUMS2oZc1?=
 =?us-ascii?Q?Zg5cqylTWHDFufKTnwMbxvgrFV7srnNlfmD8UTdM1aGPaomz73wiXt3G2CvS?=
 =?us-ascii?Q?qYcpdLhxewoEt30BMNx2FDqcH0upOhOBTGhc73eN0hz7zQ0X4C9mZ+z1ce3T?=
 =?us-ascii?Q?EkGviTTAJduwjFbAlJvBM4P70J6pdVhwyVy8jvwMJCacJeaKRTvSNweqfm28?=
 =?us-ascii?Q?S/jnqX6BXDV0FplhwwN2We8DRRpMekSiEer1SpH7ydA5WiaBnaUKFZpxRJqp?=
 =?us-ascii?Q?V95z+laXU5yd4xlb9/uhW5UTj8UIZNGvm7ru9XjbTRbqwuEKjnDgc3XBwHr0?=
 =?us-ascii?Q?RXNLVSnYHd0eBF/wbQ5fmsOoEa+NVJ6mLyQw/jGtD/Mz4esVKK9Q3fTRsbkx?=
 =?us-ascii?Q?8EDYUYOJ01FWbplsg2ULjZMsnpivJU1q2Z8Gu/3ldZkUnqVse8rT7y3r4002?=
 =?us-ascii?Q?MiqWKb2J2wi8YMFo09qBjuQLKDVCPkBTJjpwIgeY9SbFWrwepl0gKQicqB8y?=
 =?us-ascii?Q?kITgoli7YHcQKr3mmdsqqVH+LURZtxnVcThhgQ9fcYhWcrFjencsuNKGyhp2?=
 =?us-ascii?Q?lkzqgMxkbKBZoqzMVRQkDKI9raoxlovPTEewIMmrTzie8DLzvD8P4JdiykEs?=
 =?us-ascii?Q?ykEqUK27nXlQCIfBvy9r/wV6gr1OGkv2G+f++ZwlaNf9UNvLoCMBjGSWAqHg?=
 =?us-ascii?Q?MUccKgnQh3IUZi00LUAk72tOEt/+c5yROcBPeB8zEzqLZs2tqWeiRmJ8Pf7+?=
 =?us-ascii?Q?t8NzWPrfiOzH9emxNid7Bn+VkoeKZI2keA6PbSJkM2dOhjWsGVBkHB2RHwRK?=
 =?us-ascii?Q?+57sjwiwbIa8amfy+WFJmMH22OvLzuerZ4zThHodAAz1KV9nk/hNiqR5k2ux?=
 =?us-ascii?Q?W3ec3I6zy1EM9X6+Ku5yxuYnKSpN3hvOD99CmquGdQ0MssAk7D1innizH04W?=
 =?us-ascii?Q?VjojmPSuwf47gBHP8UycEYscFPPJHPZbl/GlRk0y/XLCPT4wA/f0f2igkoeN?=
 =?us-ascii?Q?8hifZIUnGuKridDJ2zLSyc20SusNa/JneCHD2lqqHgB6Nu4z2V/OgA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KE6kO8u/fXz06T8dkWjsTMsD5YLAiFy2fQSDwqYjS7IKtQctvtV9H5EN8O+p?=
 =?us-ascii?Q?tiW8AMkzc+7NWqwTOeLzPbSkwKl3uTdp6bkVBDuPzYB6riX46dAYDtzCQjMN?=
 =?us-ascii?Q?TUy7h48YHS1Yhmbs1ijA+B/ev8RiUssAWr7jVyvsNYjwwqq6Ydvk5c+eTYHr?=
 =?us-ascii?Q?/rzM6/lpw4zgpdL67mSG4ZPmt0Qx8NdYonEXIfxMP/YRBqRIp+Bc4HEk8vJe?=
 =?us-ascii?Q?PYym6fSwvlpBeXE0ga0dVH3kuyI/FPfQi1sleXVDabyDFeMEsM9wqLfNXl4e?=
 =?us-ascii?Q?PWxQZ20GXY5pqdM9umLMVQ/g0vXQ8OusU2f1BbNEK5ww+X+4LE9j8++IW32t?=
 =?us-ascii?Q?MxHh5Mr+Ybp9e9cJJ030pO6AX+q1x3Oluke1lS0di94u0/M7a51o6rmZp9Hy?=
 =?us-ascii?Q?Hd/hQSPmjwm4mYTdLldNp3tPUlM9uWsgwIRjE9OtKBTslRkO3Opo6Nqc5EQJ?=
 =?us-ascii?Q?cPKU1rSgoKMblxQ7iC5fKCqJ2Eegl8SffuWlf7lNnPw9Oqtw7y26DrMX9v1o?=
 =?us-ascii?Q?1oKhWZKX+am0EGYqOlX02UfdtY1yiOd9BlWJtDaapf8D6KYH0K3yjZpuZhlN?=
 =?us-ascii?Q?pcriokiqlr/uq9Xfl9r1/9lPRfu97YoFs0oktfWxrSy9D4VgxI7H/ZrlxTFe?=
 =?us-ascii?Q?om0e60xoRx60FtxfFJIn/M3eUi4XRtyFOtOc/+fwKb/s4n5aznM2kxYiQ9+f?=
 =?us-ascii?Q?79FHFmjlTz9E/1b8J7Vf9DsX0kKGh/Sx9zCOi9pP84QDFv+INo1PiG0cFtBN?=
 =?us-ascii?Q?v0M3Wt9zzZW1YjySoDLtFBBZgyJTilNnK+/B+Qu7MP4yrrbTzzSP7yrCQiRv?=
 =?us-ascii?Q?5WHhpn5Xx2BC/dU+wXL32KGRlxzdeqFR+NrYM0EQqSYHP5DDuXOlCos1sF8z?=
 =?us-ascii?Q?pCYx3f7NX3dsCg+r2BzRlVEJmVkKT+0vvWpz8HlNBj6llxxK8FvP6sDqZeW9?=
 =?us-ascii?Q?AWaAcAhJhQEBqCMmmAGkUj1EaIMX2aUvxzPoJ39VyNTUj0D9x5FVaWKaH/rJ?=
 =?us-ascii?Q?v1lZmVMgDAbF8sMm++TolTRvzFDa5+SBAWaBHCYAuf5Db0ZxipcaNyxxFJcn?=
 =?us-ascii?Q?hYL6Od0gCJAa7hWPJ2ZRFqBiQix9gjyKJDJl4tgR808bzk11zL+HDO5CG8g1?=
 =?us-ascii?Q?zDL/j8hM/w7CTtBoXQ4juJdEoZedYk4hGpdoLRtugfSbsiprcBt7oEe5uMoB?=
 =?us-ascii?Q?DlFycEXNwvKCoj1om6HVFn4gMYMbwChVHDLTDO6LfgcM6DrF4AuVmnxpH1Fz?=
 =?us-ascii?Q?Hr2eCZSOcQ41fzdcu8z841aIANWHQsr1q/Fd3APYOBSbDhFAh7+hEyXPQ8no?=
 =?us-ascii?Q?SSYM32gPWF4PVsI3xGxsSvgJOJZnJMvDsL0oMakLJywDhYKjLEWo5UhntiR0?=
 =?us-ascii?Q?sTXI2wM5Sxxzz2sFw6bH/gP22hDU2hFvV9XIQRkz5/m3eZwE7KW5PGM6EqKB?=
 =?us-ascii?Q?PsWRlklqEjnfeHqr4wr96sBsNc0ygGKs/ghPo72gq0mI4IYX0tAkg4WTUpwN?=
 =?us-ascii?Q?HzjEHTWtBHe0QzMLmUHUSd5+lN7AcazeuDlTD4IniphVFeHZnfKJ7NJapcv7?=
 =?us-ascii?Q?7Rsb8DUunLAD+0w+QPkS/HXIGa99eULdnPHd/yOm?=
MIME-Version: 1.0
X-OriginatorOrg: avt-nbg.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ba14c4-3ca7-42ae-1281-08ddd4d661ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 10:45:38.3333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: afd236f4-ec47-4463-84a2-069e92c28673
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSAFHkXc+Envp/JkMoaKv1num8E/cy+fvEDa21G22S0m6onfNOFGqOLpKB8LQ7tKJ0aLpEOb2sMN+GYVoVLaIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB5587
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=avtechnologies.onmicrosoft.com; s=selector2-avtechnologies-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/tCxC+/L4wAaBJg/wMKVt2n76x4GXSSBJoTz/JlWQQ=;
 b=kP5s8DZtotykljqaLNRd1KNqvgCWn7nZcW1hkkoT9JBpS7n1Vr7Tb5IaOpGh6tkSfswuQHkeoUBtIq06QATl8DRA3+iIY+WVYplV6A3Fe5LEHaeDcCFtYo3dzr2fUM60OiytcgANrCINs08qfJUvBBuQ7BP1xpydlE8zs4bMQsI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=avt-nbg.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=avtechnologies.onmicrosoft.com
 header.i=@avtechnologies.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-avtechnologies-onmicrosoft-com header.b=kP5s8DZt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=avt-nbg.de;
Subject: Re: [Buildroot] Buildroot with Advantech EIO-IS200-DRIVER
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
Content-Type: multipart/mixed; boundary="===============9062015211401723694=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9062015211401723694==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_FR5P281MB507846E148AA626E49A48FD4872DAFR5P281MB5078DEUP_"

--_000_FR5P281MB507846E148AA626E49A48FD4872DAFR5P281MB5078DEUP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you Peter,

I've found the issue! The name in the Config.in was not correct.

Thanks for your support,
Hans


________________________________
Von: Peter Korsgaard <peter@korsgaard.com>
Gesendet: Mittwoch, 6. August 2025 09:37
An: Hans-Heinrich Hansen <hhansen@avt-nbg.de>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>
Betreff: Re: AW: AW: Buildroot with Advantech EIO-IS200-DRIVER

>>>>> "Hans-Heinrich" =3D=3D Hans-Heinrich Hansen <hhansen@avt-nbg.de> writ=
es:

 > Hello Peter,
 > thank you for your assistance!

 > I've enabled again the loadable module support (CONFIG_MODULES=3Dy), but
 > it seems that the source code (EIO_IS200_DRIVER_SITE =3D $(call
 > github,ADVANTECH-Corp,eio-is200-linux-kernel-driver,$(EIO_IS200_DRIVER_V=
ERSION)))
 > isn't downloaded. I think that it must be found in the
 > output/build/buildroot-config/br2/external folder, but my
 > output/build/buildroot-config/br2/external shows only the following
 > directories and header files. All header files (created by buildroot?)
 > are empty:

No, the output/build/buildroot-config is simply an internal
implementation detail of the kconfig configuration system we are reusing
from the Linux kernel. Your package tarball should be in
output/dl/eio_is200_driver (unless you have customized BR2_DL_DIR) and
get extracted in
output/build/eio_is200_driver-082e737c59aa92bba2c29db46a06cdd0e5beb600
when building (if enabled in your .config)

--
Bye, Peter Korsgaard

--_000_FR5P281MB507846E148AA626E49A48FD4872DAFR5P281MB5078DEUP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you Peter,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I've found the issue! The name in the Config.in was not correct.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for your support,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hans</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Peter Korsgaard &lt;pe=
ter@korsgaard.com&gt;<br>
<b>Gesendet:</b> Mittwoch, 6. August 2025 09:37<br>
<b>An:</b> Hans-Heinrich Hansen &lt;hhansen@avt-nbg.de&gt;<br>
<b>Cc:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
<b>Betreff:</b> Re: AW: AW: Buildroot with Advantech EIO-IS200-DRIVER</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">&gt;&gt;&gt;&gt;&gt; &quot;Hans-Heinrich&quot; =3D=
=3D Hans-Heinrich Hansen &lt;hhansen@avt-nbg.de&gt; writes:<br>
<br>
&nbsp;&gt; Hello Peter,<br>
&nbsp;&gt; thank you for your assistance!<br>
<br>
&nbsp;&gt; I've enabled again the loadable module support (CONFIG_MODULES=
=3Dy), but<br>
&nbsp;&gt; it seems that the source code (EIO_IS200_DRIVER_SITE =3D $(call<=
br>
&nbsp;&gt; github,ADVANTECH-Corp,eio-is200-linux-kernel-driver,$(EIO_IS200_=
DRIVER_VERSION)))<br>
&nbsp;&gt; isn't downloaded. I think that it must be found in the<br>
&nbsp;&gt; output/build/buildroot-config/br2/external folder, but my<br>
&nbsp;&gt; output/build/buildroot-config/br2/external shows only the follow=
ing<br>
&nbsp;&gt; directories and header files. All header files (created by build=
root?)<br>
&nbsp;&gt; are empty:<br>
<br>
No, the output/build/buildroot-config is simply an internal<br>
implementation detail of the kconfig configuration system we are reusing<br=
>
from the Linux kernel. Your package tarball should be in<br>
output/dl/eio_is200_driver (unless you have customized BR2_DL_DIR) and<br>
get extracted in<br>
output/build/eio_is200_driver-082e737c59aa92bba2c29db46a06cdd0e5beb600<br>
when building (if enabled in your .config)<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</div>
</span></font></div>
</body>
</html>

--_000_FR5P281MB507846E148AA626E49A48FD4872DAFR5P281MB5078DEUP_--

--===============9062015211401723694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9062015211401723694==--
