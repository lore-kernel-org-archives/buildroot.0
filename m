Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A255C678D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 08:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D76D41964;
	Thu,  2 Mar 2023 08:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D76D41964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSqet-dKFlYA; Thu,  2 Mar 2023 08:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9162E41836;
	Thu,  2 Mar 2023 08:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9162E41836
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0611BF97F
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 08:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F6EE60A63
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 08:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F6EE60A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z22kGAB2R_Mu for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 08:50:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C26D560746
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::621])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C26D560746
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 08:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qob2SNj0bOz1Gf9i/WZ2C0n/EUMt0eOfG+OjpA4Bl4GBtd08sGsB8dWyTKgSuDvt2xGQbtSYnSTLULfeezksrzDv7zDgA6zMwZ1OPrw2Ub5xKnQ1gE1xCDyFbk9K02vbbasGGT6wCYxf3khNgV5/Ctq/nNwUajMrpkNgP1UG1dvLgTVi2hARv2a50qvDAYt2BexRXlD47Ms3pJZmR1nIhLIEYwrVYzd26YE0PmKsZAsiZ4SdMThfiN7xFKn6YAV8+5unxZUr/oXFWAa/CyPb2iA2JbAE7MmhJmCIdEOGMisgsUsMnm6EyhABKP3+Vc0T1RzgCaVy4oZjpfy7Bu9ZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fUiAkXVRoQZoyCmkuC7ljwbwLH2WEa0wBk55pG7CLg=;
 b=TSDaiwz3d5/wT81RjZYVuDDWIOIDS3lUeYqLBmXMeufaSE6K7xch1bJ1s5GvH37/niQWPoux/6wjL3Yp0LJZiaAgLZ4lgLUvGWI+lQ0BaVil5cFzDhCjwyWrJOk6e+3z1ptTmS77brS/JGDa1zCPPgOquc8nFmoGkfRo9xLf9JHBXmwNfyGU4eGFXjQ3X9sNMKSX4+nBMTnTYx57nE+rtAW2p1xBFjgWIQs62s0ZpCwDqVCrcltNcNwMwcJyfCXHAqHjPyDSntd//DjIdiYMsJjfDKr8woj6TbJR9BMDhcqD/nS5H0XdRHG7h9v/nWVo5mlecIXNA1Qhi0w6ejZJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS8P190MB1887.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:520::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Thu, 2 Mar
 2023 08:50:35 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 08:50:35 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH] package/pkg-autotools: force cross compiling
Thread-Index: AQHZTOOwiKwRJkOlc0am+70bZmr8lQ==
Date: Thu, 2 Mar 2023 08:50:35 +0000
Message-ID: <VI1P190MB0493CA480A72DCB0A86ECFAE9FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS8P190MB1887:EE_
x-ms-office365-filtering-correlation-id: 8473bd26-d757-461f-4237-08db1afb304d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hWvow1VCiywIu619nDllWyyMYeqQrbhUMdF38oaZlK1b8O/QrlYhjqUKy1pKEne75ucp7Gurkj/S2HfH/OZPXGh8qXkNMe2Fjs9ajrHZ3qsggU8L/VP8oL7ODA4viQ0ejh9SyNfGwR4djUSLlcoPbPt0oUW8UWlqoZApTz+V3d/ABU34fFUOXO7d36rnWnf3jwhJMHXePfurPNpfgw5055093uZ6oB136vhbtqtH0mA+SVwiMbWojJyvBGDKkeCkYtEQ4sDAR2Aeg6MwKrEFugoqFBry+7uDB1JmtsD0TTaGjnbh9y03XUicdtV0di3lfoR/t6i+elWhsBmjBWM8+2m1y58vaF6jtkwtyc8M25lA7WDF/p++i5rkDvfZq1bg2qOrD+U0q6KTHyCmTqJ1dZ4mPXIVZ0QEx2LOc8kMmvlEsV/c+Ol2B/i75kgTlG/rxj6Op1hD1veAZfAxyLCwimoqZM0N5NyRCxA3IrNb3L27pbHizraur9XQvUyQtt4iQmSx9fU9jPnxvS2Lm9gF8bBcmQj68ndGlHvPNAiAo8j4dPalwGJSNB1nGRJGR2/NKaHstYQ8A6MVsguR1Ly8KF82iGjkqF12Yb0BAi1Ag8GfnBaZoYmmyAYKf6W1B1TIc+VbalJFJDDbdKLZNDR8iuLr2wjxlQ7V1MYCNKV3R0EsRPoRgBJ+4RsPReCY/UGx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(451199018)(33656002)(8936002)(5660300002)(966005)(316002)(478600001)(71200400001)(186003)(9686003)(6506007)(26005)(4326008)(64756008)(6916009)(7696005)(86362001)(66476007)(66556008)(66946007)(8676002)(66446008)(55016003)(41300700001)(38070700005)(76116006)(52536014)(122000001)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PmY5Jyebuj2Q00bWXunPRxa/wfLo+YdDIfmsIX5znM71VJlFBQZfrq9Rnl?=
 =?iso-8859-1?Q?EkJgkntkmPpUyOyp+E18TKJjLw6J/fgCZqHPORQHm0hLl+oigY47NsbfTk?=
 =?iso-8859-1?Q?Wk+GcspsjaQhOyLOuoTueMgTNakv+x4R03iZzGNt6yQVv9IfZbqIYXriYs?=
 =?iso-8859-1?Q?zteee8dCXUNyEwE4wlVlW++NZSx+rUkTQlghRWUI/dsruEfIBVegJiDMqB?=
 =?iso-8859-1?Q?v6nqL3EcH7my2oJkt/pVuK+qKbqoiCegX4n7aws6GPQuOUreG0zcIN1eS9?=
 =?iso-8859-1?Q?knF+ZaoIoTw9Msq4fyZSgq59cRmqzng19a00qAOJxWNq4Dud99dgqy0YIY?=
 =?iso-8859-1?Q?WPHvhqWqFyVqmM5DC33XNRISiyd46aJpU7IHk5T9ocgb/zy4tPKV4DC9T3?=
 =?iso-8859-1?Q?GE391FweYvWNU+XHwOwOCQVpQLuQ0X+VHALGZyN8DACeEN3io61KJ8CKZ6?=
 =?iso-8859-1?Q?Emco4yN6HEF6OwjSRtEnE3Q8NaduHoqzoycH1dZJ6j0idjl3gyzppV4Y6D?=
 =?iso-8859-1?Q?/0lSCxmjBzyyhYHU75jz0frJi/lpyXvOA1/hGwJuozO6c936ZK8227g/wN?=
 =?iso-8859-1?Q?/x3842pC3gpeuFym+jNKgACi7P1gKY+AFtMaon8rDSuEkIV6A5kMSniPvy?=
 =?iso-8859-1?Q?mF2L61uavMaK2WEkQJb810LNz7R7H6fDFj+HkrLBckgnqiXNblO20qp9Uv?=
 =?iso-8859-1?Q?UVF0fvi+ns0ZtOtVJQMgjiObZPYn/veyz2604yhh5eyqnwfjuydTLgS5H8?=
 =?iso-8859-1?Q?Fpcw2ihrUJi22OWFDW6YHjOU8SOLNYK0Ok0CsECm7hpkTjgP3/yTpZ9kVF?=
 =?iso-8859-1?Q?kXtbda0jMJxjhv81jFuPdBOwVXSrOsOxdKKNehDXzFmLCoO3mEP1eM8zi/?=
 =?iso-8859-1?Q?Q47o5uSPXzhCdnlcS65BK0ZRt4CoFWKdvj2pR0t0m3F34B4iecw744zg0e?=
 =?iso-8859-1?Q?hV7KrHCzb+QOdyRqiSFqe91SY+u4apzg892zFvk9MRanTVvaMOVewDYuwh?=
 =?iso-8859-1?Q?218TI90WssuoLHbIp/XE3D4HKK6RnNYq5pLpxasvljwijSauuDLELCqNIo?=
 =?iso-8859-1?Q?HmZW3YNbhSHBfag5BBrojXMQ1VQnaWahD4AMNWnQUulSDfkD9bAj8SeE+0?=
 =?iso-8859-1?Q?GR3ykQs1DrGNFAHz1Sy93DZjw54IoeVGTJPerBwY4RbKYmnR4h5qBTbORR?=
 =?iso-8859-1?Q?+lznLmhMC4XiUda7gId1wf6imNHBtpMcojfPWKUk4+Nb5fnGGjvRrSSEn/?=
 =?iso-8859-1?Q?zgFBCcmpg/aZtS7slSDHAN0zG710kLcfcBfKvxH6nQ0/DC058aAFBraFeX?=
 =?iso-8859-1?Q?xWK6+j1RpTZaHynC9cBT02JRN41yOo1ICUkbFV96MuRs1mvCS2scpKFggC?=
 =?iso-8859-1?Q?fwDKY20hq8BXC7I2Owk6OZ38Ldm2W7acJRXXl3Wht580zkDsNZ9gCvMWFi?=
 =?iso-8859-1?Q?VF9T9tYfkC53/QkV5U5DFSk0BK5HBAft5F1hWwVbNnUGgqF2ABehbYn39S?=
 =?iso-8859-1?Q?NfEBkmyPWY3XNN4oSnVjXRcSOYyfedTCVtfOGyES83KT4wFd3wq+PL5Bl7?=
 =?iso-8859-1?Q?myCT8tNNRbmNnQ3M0rMozvpibuzW2rUbIYfTSB/JJ/hNdiO44pi2Svy+AC?=
 =?iso-8859-1?Q?SzPjAd+d+4bO0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8473bd26-d757-461f-4237-08db1afb304d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2023 08:50:35.2227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uMS1sOhrmjYKaUGJkr7u73llw6gMZT9CV8Jpbtqu1Xw0XH5TzIbxsHFuAISrwHQR74FPv6y5+uYhcA/hzVmhcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fUiAkXVRoQZoyCmkuC7ljwbwLH2WEa0wBk55pG7CLg=;
 b=jcv2LE7+SU1yLJR0bO4anTlVBrt6bAi+0TJmxOjcDA7HJbAv/oh/WL3f2TdZ9Xel5QwbtvBfssW31GovQ0VyBwcaRdiDdhDFa7IImo67Tw1LvSnhYGX3CWaOvNR4oKRJsSG7VcUgvIXA+Nv5LNWWJ69BKZVJXynppX4Yg71bc1w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=jcv2LE7+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH] package/pkg-autotools: force cross compiling
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default autotools enters cross-compiling mode if --build and --host
differ [0]. Depending on the host architecture and how toolchain
providers set the triplet it might be the same. This triggers autotools to
compile and run a program on the host. If it is executable
cross-compiling isn't entered.
As pointed out by the autoconf mailing list [1] one can force cross
compiling.

[0]: https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.71/html_node/Hosts-and-Cross_002dCompilation.html
[1]: https://lists.gnu.org/archive/html/bug-autoconf/2023-03/msg00001.html

Fixes:
 - http://autobuild.buildroot.net/results/6d4/6d4bc520c12313508d0fadee11d5b88c35a3cba9/

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/pkg-autotools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 717ff81593..aac80369e0 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -195,6 +195,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
+		cross_compiling=yes \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		--enable-ipv6 \
 		$$(NLS_OPTS) \
@@ -229,6 +230,7 @@ define $(2)_CONFIGURE_CMDS
 		--with-xmlto=no \
 		--with-fop=no \
 		--disable-nls \
+		cross_compiling=no \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
