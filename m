Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39184C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E221D612A1;
	Tue,  6 Feb 2024 16:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E221D612A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YjHuga1rocn; Tue,  6 Feb 2024 16:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9A961042;
	Tue,  6 Feb 2024 16:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C9A961042
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28C811BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA0A241EC6
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA0A241EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GY6QPi27EfvM for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:39:03 +0000 (UTC)
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0709.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::709])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD680417E1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD680417E1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=U+0/gR3+NnHXDX2PNbJhIuJQSsamxhrXJgm/RiehoSV6bosrHUyqoiWEg5yEYGOy9UIcYsfRqX+lq1SZ9cV76jI/Mb5EpwWgM/r8Kc+WQ9E17LKnX/O6v1VHFfDJ6/pIsL26yytIvADLBILk9y2xfcbep2bkirqags6pDQPebnM/zcewdkA9mDNnz7Tg+ECljhytSAyCyADl95WwX/goJt9v2/ltJtZvZIM2EhkdP1YL3GkBEmU1/ikpO0v7jq2S7WFoieTImY3ohxYRlxOZxWnjiDXj1jy6Kve9FNrtffAupINH9y7fl3mtlkM2CL2tli/cNd/QpJ82GCL4RT+I/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH+EEHWxwvqWKDUttcnwZ7BoexzOnVXQNCp/4bWgMJU=;
 b=fNqP+w+gBRvg3mDZu9UOSFxi6Eykk6XKWnn4GN8mZgvvWRNNXhpg9U+kqo76dBu0bpD9xZj/RVAbRKnqCQY3A+gcA3Qmgm4ehkuW/sMrzxHUXTEACNagCjxWHfqrnH93BTJEnGh9t66EGtbk3ejz//dggsg2K1augmM74Ph/mIJjB6KoosWT+AWUnXMJTs6sgNDNNWn0Tev3s3Wp44UKkJIkZalPfq2p0t9eE2+dQRAJhqyYad4a1VPgR291Sber3gUj/pkSuivRQ5k8vYYFwnGOGsstMP7bOB3lG3DV9jyr2O0Wyas6bUxTfNegkzD8FoRHeu8JtEnhahtQI6Norw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1252.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:189::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Tue, 6 Feb
 2024 16:38:58 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5a70:14f9:1bc1:eaa]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5a70:14f9:1bc1:eaa%7]) with mapi id 15.20.7249.032; Tue, 6 Feb 2024
 16:38:58 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] - [Buildroot] [PATCH] package/attr: fix build failure
 on Microblaze architecture
Thread-Index: AQHaWRTK658zcc4TVEGsPuNa5GcN4bD9eJaggAAHfwCAAAHfkA==
Date: Tue, 6 Feb 2024 16:38:58 +0000
Message-ID: <PH1P110MB1603279F794D1616FC3454C49F46A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20240206161152.0e178414@windsurf>
 <20240206155413.1349720-1-giulio.benetti@benettiengineering.com>
 <PH1P110MB160351713AB054CEFD33B1439F46A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <20240206172540.2d1ed291@windsurf>
In-Reply-To: <20240206172540.2d1ed291@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1252:EE_
x-ms-office365-filtering-correlation-id: b9f3af10-af4a-4bd7-cda5-08dc27321dcc
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 04cKfsk8e5hyTDXzoLVVbtYe4kz2+kBSZZcofkoX3ZVIDEj8Meg+8TPGoyB7bDwLkRj+2/HFgEbbJQxL+PeSNIluq8wx7KC5ujSLX+18P9S4tPpFBl+Up+LfGrj/8kH4BTYW/wgLf4QA8CAfQzfKfJwD2H97W0jaYU4VF6q2ZdO7Cgiyn4Wy5bTM9/4b5dVNl1H9u6sBJBI5Nzav5Ls0McUJ+UXmdZMlaR77g43tkOTW7dsJyHvSCzWgw4nedvvfknNO/vEOVteUMIlRelzjdtiCnCc4su/0yiYvt8ZfSWzw3rUEKWy0MoamuUoG9rbJrx0R/vg9f9+79d5RxHahyKo0m4KYt7R+GxzPr5DavCA2W/WeDks/3Hx9Oi7gyzR3cZkPWBArfxRAATbusSbQ/nq+cuMhBTtVkONJEbJuQHVaNa52xrZGfKavAZ0cXwQPf2gdn0tJ5L0cIV3+QbShuFRL/v/qM/1lV5/Aj5F7ylGHWC9EB5U+cYNA9n0/rkUDeCXa0Z6zTfzzeYYyge4GT4bIlc58e2lRkhtf1hBbfW+Y0iS9HRsOy/RUe8MUg2zLYMS6KVjBToCFV6mlGqxcsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39830400003)(136003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(41320700001)(53546011)(54906003)(26005)(6506007)(83380400001)(508600001)(5660300002)(71200400001)(52536014)(64756008)(122000001)(4326008)(76116006)(2906002)(8676002)(6916009)(7696005)(8936002)(66556008)(66946007)(66476007)(38100700002)(66446008)(9686003)(38070700009)(966005)(33656002)(86362001)(41300700001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GYOAkzEz6OA242cgX83iBnMR/JJ8X+zasv6Og6uKgV6KQo/ry1SsQYHJLIKx?=
 =?us-ascii?Q?3z0+x5wM8HkkViDJ1tVJX6b8Vo5dqLkB8QieRjAn92JaFQOepuN3b5B3e61g?=
 =?us-ascii?Q?uvfsvXjV30pt1CEbtOXtctYpISBf90FofSN/xJPRrFxYwsHsN4B6ySuboalS?=
 =?us-ascii?Q?RIzlP1FwLrv+p7Ej/ir6TIQ28Lsnj/HQ9L2ZpGzlWCc7IFypWU7H68qH+bMR?=
 =?us-ascii?Q?MxS5tKpngIz2bXkUnyjbzd/cr8TcNQXPFZgUfvPpkadKtfmsH6BOmkSaql6L?=
 =?us-ascii?Q?BB4vlcRgUbwUPq5Dlgsc5VYONUO5PgujC3G68s86dUyG9yXSlPYPXrykVBjQ?=
 =?us-ascii?Q?NHfBfzKFJLPQwlaVUVAqxpOAdEx+VHHUePxkVHmdv2PzmllcQ7YfsmqWay3v?=
 =?us-ascii?Q?7kNEERxtvVLvBytJSOXsavEqUgwQHXaGpTVcOA/IgPQk4miN3EKWq0IzWRor?=
 =?us-ascii?Q?aAbivVNUiWCFLqUOK9qKFaRFifpYqObamdexwYfIEFWWMe6OrIPhzdiINjQl?=
 =?us-ascii?Q?JZsGYQWDyg0BlhLL1iV5W/I2KIOSDp8oirFFEMDf1xmJMWiAj8hxbx4Afn0h?=
 =?us-ascii?Q?yQ+WCszZqOsmlGtqSgi4G8OeGmcD0ELXo1mMRXDF9xVNY/dKhzXoWrPuqFZH?=
 =?us-ascii?Q?7srITvFu75cJb0IYIFGsezq9jEomalNI/VM/Xs23DVanHyYntZOJAsywtCte?=
 =?us-ascii?Q?x30ICprKu9lh9rfLkEentT/kuVlOjxBYqXHahKXrEY4mvexANq2sqrju82vK?=
 =?us-ascii?Q?8ZM4vUlbzzVUhz8Xb3oK9p9h0+Z/BZCY9brsac2leBtMooU8kqUwW1oWKsow?=
 =?us-ascii?Q?E9HbsWPUYkQH+x0JewROMaY+CFBtF0cufq4q6ztuOJnD0dljBzV6rQjV30zq?=
 =?us-ascii?Q?Er0oJaZ0BLidYe+DtXxmxsjFmzOVgYGYUx4PGkJWjTuM9X5mGpLjVs5KkBxi?=
 =?us-ascii?Q?5DCKZyt/Nr03iC0NH//Jpl1SNywAfEAlUTCU3fJq0pAuj2MHIf3MpcBnvajx?=
 =?us-ascii?Q?MYb8d/1lWCZj9lydSs4QcGYbRNcd2A9ODlemrqM07xNWIUnb5mT2C030i0Jm?=
 =?us-ascii?Q?LbSxQ6GaIl1+QQY4VnfOxUGHAXKQ2tPhxOUOzj9LZVWY4lhItWZ52UfxEq2h?=
 =?us-ascii?Q?+QVcmXimTtLpnRYN5pYAnXMQE9IuBQ+c4HDum0irk9SPN6WOYkNvGfa5si2r?=
 =?us-ascii?Q?SFdKEf19qY2QTG3Sxlq5qfuaZ+fCTn79kp78aKtFsr92s8OmUupsLW98HVKU?=
 =?us-ascii?Q?ln8wURqb6xEZGPvw2S9+z9ancYQ7rvTzKP40aEaIAhm2SaFbzQPAdX6rHM1k?=
 =?us-ascii?Q?7kbH/VCOvdEAngeI49GfNvKfgSlsp6VhBJpC5E6bm0cTV4s5E+hPIV/QHDut?=
 =?us-ascii?Q?bMAXx/zPSRg8zqdiVXV8ORYrbO6vVS/sMkZUpA1rTCxLDZOBurJsxmrcukzp?=
 =?us-ascii?Q?pWaxlDfEL1crdfYBGfV33GIV+9nbzTaZ7m3ziMukkUNvuWndFyJ3dmA4PUMx?=
 =?us-ascii?Q?NXFEVIPq51r/TQA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f3af10-af4a-4bd7-cda5-08dc27321dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 16:38:58.1030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1252
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UH+EEHWxwvqWKDUttcnwZ7BoexzOnVXQNCp/4bWgMJU=;
 b=uSdEddAbFGC2CDzAK+EA8PhAVO+ZB/lgyqMQjRiqaqYvdpAebEAxKE/J58Vxf0mTN17qwbCguiKjzeXUqiqL9st8H4xBzyq1o8iJt247baBrO4yH5VhnryxkjZOK/5mHWmoO4/EgBnJBTfybpWOUav5uDan1hOBsPz6v+e24TSN1gq0Bxj88fb90H48iI4R8Xb9RcZ3xFMSdofi0bglBA4QI1EBMnj0TzZ9cXMIeFoTvpo0xgV6MDTnbK0FTmveOZImHDFXpVcUDzLyQazIgCQ5IRYdsLT5t31/PQTg09bLZrgDSJjbdSbTpDeSzVmvd/RK2qnUkZjjZ+JiqAn/jYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=uSdEddAb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/attr: fix build
 failure on Microblaze architecture
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, 

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, February 6, 2024 10:26 AM
> To: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>;
> buildroot@buildroot.org; Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Subject: Re: [External] - [Buildroot] [PATCH] package/attr: fix build failure on
> Microblaze architecture
> 
> Hello Vincent,
> 
> On Tue, 6 Feb 2024 16:05:31 +0000
> Vincent Fazio <vfazio@xes-inc.com> wrote:
> 
> > Would it make sense to patch GCC for Microblaze to address these at
> > the compiler level instead of constantly patching the packages?
> >
> > I tested https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c6 back
> > when we were solving this problem for xz and had no issues
> > https://gcc.gnu.org/pipermail/gcc/2023-March/240834.html
> 
> It would definitely make sense of course. Have you been able to get the
> necessary changes accepted in upstream GCC ?
> 

The mailing list conversation died out very quickly, but I can try to submit the patch for this specific fixup.

I didn't feel comfortable with migrating all of Microblaze to elfos.h as that got very nasty, very quickly and the only change we (Buildroot) need is the `ASM_OUTPUT_SYMVER_DIRECTIVE` macro.
 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> engineering and training https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
