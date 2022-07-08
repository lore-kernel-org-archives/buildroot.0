Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A00C43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 10:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D57A40C96;
	Fri,  8 Jul 2022 10:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D57A40C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9rvmzac6Beg; Fri,  8 Jul 2022 10:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F2540C9E;
	Fri,  8 Jul 2022 10:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F2540C9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 617F31BF37E
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 10:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B6A084721
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 10:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B6A084721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfkXM4fhc8gu for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 10:11:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A53B784715
Received: from DEU01-BE0-obe.outbound.protection.outlook.com
 (mail-be0deu01on2087.outbound.protection.outlook.com [40.107.127.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A53B784715
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 10:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THlm09iuyQxBfV2L9aZbkj7NAEZY601ygKmrUu4pRPyR7Yn7V6QUUbykJliRQUwXM7Q6f7Mif6gfdKJ2cC7HP54f3StlnPQK0s9ijpwbamd9yM/YI+9tMc8dmjxk5zv6+7kF0xjliquA42fYlTcmy6DmGShLIROwurSWWi6Hy5Zg8Dp9253uqoOWDD0EmKCpiEQE/I565AE/240hW1k9aUDgtUAs1pPemf83npq45hamrS1L1giehz2etK9ODccJkmyEHl3SvzOrVa/Jm4vZJf6ZhbwsETOPeq5dzjNwiUv3Qu47UemVYh85enViu7YTF6Kms3wS0KUGCCvukG0bjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8XtryjqqoXh5xGWetGUpytL/2oErT9ilOyoxzRvFh4=;
 b=H85PF+SlKMyfwjb+/MfLABhQMOYVs1pNRko1A16QZtSznd1j4FJU+aGIyf1SMarmM0HFT30hwGdr1H6eTLF3CQzCjbXkCuQqkZOyLIPdAtD3kHSNoPfJ1Xj486heU/8+UjpHiGUnfOTwKqJJniI1ZCQDGzjEOim4omjartuSlfTaCBcAORZr67ARebWidmnVPem4KBRHYPQFv6s+KF0u+GC66i2lJD3rPEA5Z3x88PIyPnPxZp2vXXu7040t81Hn/v1o7gGjYvtVI6PokxvAAi7WumVtF2y1PBj6GW8fvGbNqiG4VcEfcAD0RRaj0v1AMhfwwfyH6SQG31yJ94N3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=feig.de; dmarc=pass action=none header.from=feig.de; dkim=pass
 header.d=feig.de; arc=none
Received: from BEXP281MB0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:5::16) by
 BE1P281MB2917.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:49::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.6; Fri, 8 Jul 2022 10:11:03 +0000
Received: from BEXP281MB0053.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1cba:7967:9546:a1a]) by BEXP281MB0053.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1cba:7967:9546:a1a%8]) with mapi id 15.20.5417.015; Fri, 8 Jul 2022
 10:11:03 +0000
From: "Himmel, Lukas" <Lukas.Himmel@feig.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Rebuild of individual package uses old libraries from staging.
Thread-Index: AQHYkq+o+dSV2Rioj0OBcttPzBB9Xw==
Date: Fri, 8 Jul 2022 10:11:03 +0000
Message-ID: <BEXP281MB00531EDFB577BAADA237A3849E829@BEXP281MB0053.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 796a768c-7c01-4091-9b8d-08da60ca2a2c
x-ms-traffictypediagnostic: BE1P281MB2917:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9SzCSi7uIDPx6bsG0Ts4vF5qV4TpFJuCqdM6niG8vMlccucYXT/9apwr9a6J8OEVoV57RjXBxByMXNi+LIlMIFqpE8xYTP+u/YJh1nllA42kMXmVTFj6XMnBUkup/eN51KdupPR5R5YxU639U+AU/wWa5Fng9xk4XSNdHfwsAw0ZHvyV0OGDYZL3+VwU2pI46v3qypXFoYi0I8FB6L/DQvkrUTs/mqwCT+cYb4J4ha6V9hwfHkEpBxkFzXStG0v/PsfBUBCG2I4qkaVpzeDiQcxY4mckl6vDKNPtCk0ppiq3KfNX5WPgHNC/s6BQ04O7JVBAa/CQYzQX188U9XviB7Yab0DI8MxSWo1cwDQhIJ/f7DJeLFoPmiKOCo2HB8GpTpzOMtTwDfR1drS8B3VHRwenBYC7oNRuJzbF02kteRmNbMDXkCxKyYuhTEddTLbRXx9eisx2MBSkQgNFDJWr+aUCS5SPpzPc7lG3wYgOwdphl2tZ6KHjM0O3lV9MV8gp2Tn/n+pkHX/G2tRO9Mg621K4eX5XxTgwzJA5QXHfhSqGnK5dMitk2VeGokfIUDje+9XhAUjGLLz43uAHN9TWIUwCr6Y8unskv7lni72wFvC4m9gx+5U1Yhp+dDmq+irQwySTDm6amKVWkZZCc/zC8fvzX3S1sISv2gh6PPvpB5HB20Jmy30zAlDXwV3XLD5w/ahCh9DaFy1aloBf1CdwZbMW/qHpd+b4GbFVoAbFWENZGxoYhbPD/yPftrVbg0/iB7tXR7hk8zMx16bo1uoAqkR5Lfs/KhJC8ow6/2ZdcbsCSPBDDrlhmMNk7dLc50UT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEXP281MB0053.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(71200400001)(83380400001)(86362001)(7696005)(66446008)(38100700002)(478600001)(76116006)(5660300002)(8936002)(2906002)(55016003)(122000001)(52536014)(9686003)(26005)(8676002)(66556008)(33656002)(6916009)(66946007)(186003)(316002)(64756008)(41300700001)(66574015)(66476007)(6506007)(38070700005)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BUUQuUSfeMNDtT4u5PaaEX8bZ2c892q3ug4r0Buh7XcAX/X/0Rjx2wKO22?=
 =?iso-8859-1?Q?iQ+m3SmH3ovYVX718pY6SGJVsvgyOpPO3Dwh8NG/CjDDenYDHiITGBmxjW?=
 =?iso-8859-1?Q?f0Kp+3wI5bZLg6Txjnp/bAAxuFaHHQlY+gQdKSsfbxkjCtyo+tY/YELtUv?=
 =?iso-8859-1?Q?tQGwHsTMTwbHkruj+IACmB27xE95ze+hHioZExQjy+EewSW2Nmw7YOs+EH?=
 =?iso-8859-1?Q?sZAA97vMuS3Qq+et/2AJgjd4A2G/vT4sM0mLonof6s5UzDGSe3qJ7sgSxG?=
 =?iso-8859-1?Q?mYjC6Kin9ER2g/mHscUeG4Rir0lP4+X0Fwoy2adtRr04k0rqQVcJSlDEBT?=
 =?iso-8859-1?Q?VHgVEbY07/iDcZdjBuTGOd9AtvVseMbtTJVpdRP9SDR2YfUj7zEZ2jPsEc?=
 =?iso-8859-1?Q?NDoJSUmgz9GaZjtT1Xbzp8wOaJwUAfU+XVuLiGEUNBNGUb29xkf+09Qvng?=
 =?iso-8859-1?Q?Gm7e04WY/7R0JSzNNkyXRai4umdilnaG+GBWGOZK1e52JXeL/7krk8NhNM?=
 =?iso-8859-1?Q?zg0IvnyvoxJVFWGHoGrd82qBWaLscqkMjZTh08QeKLu5C5f/MAGm98UamQ?=
 =?iso-8859-1?Q?9pr+W8kodVOOTAVnksAoiBpMvl23vuWZ0bH0vVDIMGzMahGhJQ6phNuoiF?=
 =?iso-8859-1?Q?sl18BX5AXNaX+7CIsBNG+UlMOJYAP4LRnf4qhYO3PU6OFXYX6i4OJTKvZb?=
 =?iso-8859-1?Q?tp+17pjsZarOUUOj3ndBOWRMtv9BLpoToefaGRKXe88Raqp81IyPSJ2H59?=
 =?iso-8859-1?Q?O3UGQIxF68yWUia+duExXlz8Qj07oA/CaFG+cx9qbTxcTUQaNzqrTsZ3EW?=
 =?iso-8859-1?Q?8hINMxIcgVBFCrAha7Z3D6maHusP7pF2PjEztaZKAnTRUX/fy8a/Wq7O1f?=
 =?iso-8859-1?Q?xa3I8jcGxWwpA4rrWudZCH3w00nzbE91DXZLPXv/GdTwTx+ZA0vtmoOwa7?=
 =?iso-8859-1?Q?2iPr3IXM+kD7AZAmxR35IKyXAtH5+I4ZH4YvTL9tiac0MoCr/RLf5USeDR?=
 =?iso-8859-1?Q?t1aY0LT6HqprbUEV5rq0vtA1ZrVvAMgAWyafHMr5eDdwjECWPjRUuBp8wx?=
 =?iso-8859-1?Q?xgvJTVVC9xqY0yP4LWsGvH2H/1NmIACajUomE15bsqODRaVS/wNg24r+0a?=
 =?iso-8859-1?Q?ca2GEUUpvBOEYuye0PzGfnaCNNTEUnMIuRPi4otgTAPz7gnmDhjQ0ptQBu?=
 =?iso-8859-1?Q?CFTQz62mrfQ7x5Ii06fBVM/KAidFYALd/Seirr6vOPksmriHXLcADIKJGe?=
 =?iso-8859-1?Q?uXNcj00xIqnDRY2jHvnbdtA/LpTLDP2vCgPuhM3L2RLFREfILOPVZJPEt0?=
 =?iso-8859-1?Q?+8VImtpnD37ml5XQG4wwBRSPW3NswQAkEiAOeheV9VzegsvqeJ8KVcd9P/?=
 =?iso-8859-1?Q?rfgPt6UmzBHx+YEhiU7JhSOD2ATglt3XrdkJ9GcBmNeulPrDnRYYjcBbtx?=
 =?iso-8859-1?Q?cUxa0DdUBSx8xBsJByOHDZyqa4iiZF5SbdLy5h7WszaAIk1aC7jGGVs/e5?=
 =?iso-8859-1?Q?8Re7dJw09pr8vZqdh88byAOnlaWeubBipIh16AE2KfcjBZiZxF8hpgPuVI?=
 =?iso-8859-1?Q?0wGB3F8npXHUWxPkSrv4PGSO3eI9qa/yu5+5Oq4K2TneHhvXV34Q8GBtgt?=
 =?iso-8859-1?Q?VSv6RGT6zrgGy1T1X6Z4LKRu4ZtHMfEZuw?=
MIME-Version: 1.0
X-OriginatorOrg: feig.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0053.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 796a768c-7c01-4091-9b8d-08da60ca2a2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 10:11:03.2948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 314a146a-c437-4394-87a0-b87e4ef86d60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtdOOaBVZFrHRVafQRe5+RSUNZWcjwn3l6ajQtHFrgYAjFA4vanSQm8CT/Eo1CK26h6RWquhMNCvLJnw9BPYRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2917
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=feig.de; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8XtryjqqoXh5xGWetGUpytL/2oErT9ilOyoxzRvFh4=;
 b=kvHNVuJ+Jpd5h9VKLzT7nIM9PTNtiEBXE84aOTJ4Z2+vNaQXz7FRT81Zs55VPN+0PlbQ8lUywNAyWhov9fq7iaH7JvRVc+QFqaD8k1T7wgzHV9fbjKb1UAeket5vh/9wsjjiuDRSl5FKf27TEAE6HO+TCrI3TPysopdwgnQ8E5T7KhFdngQVH9avcE4AOZ/IK8Sk/iy9x+yBb60a8fYwrWpCvvb0osJ7BbU4uOcMiLzbQxq4wklPsLf7EVrZ5Q4PtbvihSOO0vW31ntcmWW5vkenVyOLGVvlbrclqcJDehF4oXBTjX8j18LeeMcdIMlJWSmUcys5KoYlHtW0VfGsww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=feig.de header.i=@feig.de header.a=rsa-sha256
 header.s=selector1 header.b=kvHNVuJ+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=feig.de;
Subject: [Buildroot] Rebuild of individual package uses old libraries from
 staging.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

my workflow includes rebuilding individual buildroot autotools-packages usi=
ng
the make targets "<package>-dirclean <package>-rebuild". This works fine mo=
st of
the time, but I often run into issues with packages using pkg-config.

These packages tend to link their executables using old libraries from the
staging directory, which haven't been updated at this point in the build
process. This happens because the "-L${libdir}", which is included in basic=
ally
all pkg-config packages, allows "-l" linker flags pointing to package-inter=
nal
static libraries to also link the old files which are still in staging from=
 the
previous build.

So now my question is: Is there a best practice on how to avoid this?

My only ideas were either to somehow clean and rebuild the entire staging
directory or using relative paths to all my static libraries, instead of "-=
l"
flags. Either method doesn't seem quite right. Any additonal pointers would=
 be
greatly appreciated.

Kind Regards,
Lukas
________________________________
Amtsgericht Limburg HRB 3178
Gesch=E4ftsf=FChrer: Dipl.-Ing. Wolfgang Feig, Eldor Walk
________________________________
Achtung: Bitte beachten Sie, dass sich unsere Gesch=E4ftsadresse ge=E4ndert=
 hat.
Wichtiger Hinweis
Diese E-Mail enth=E4lt vertrauliche und nur f=FCr den angegebenen Empf=E4ng=
er bestimmte Informationen. Sofern Sie nicht der beabsichtigte Empf=E4nger =
sind, benachrichtigen Sie bitte umgehend den Absender und l=F6schen diese E=
-Mail. Das unbefugte Kopieren oder die unbefugte Weitergabe dieser E-Mail b=
zw. deren Inhalts ist nicht gestattet und kann eine kriminelle Handlung sei=
n.

Important notice
This message contains confidential information which is only intended for t=
he addressee. Unless you are not the intended recipient, immediately inform=
 the sender and delete this e-mail. It is not permitted neither to copy it =
nor pass the content on to someone who is not authorized to read it. Acting=
 against this notice could be considered unlawful.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
