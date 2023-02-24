Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032EBC64ED8
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 08:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DFE081362;
	Fri, 24 Feb 2023 08:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DFE081362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eD-5RG6GhJnN; Fri, 24 Feb 2023 08:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3FE681358;
	Fri, 24 Feb 2023 08:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3FE681358
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B25671BF29C
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B23781349
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 08:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B23781349
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njO7OQgBDKiw for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 08:53:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84CA081347
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::627])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84CA081347
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 08:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJBrKrjFcfEYwkfSJxls9ArYYgk3J481cFx1ytAU4XQbW1yC607PHFqBokmgN5iVxkHVRBQoGb2FsUSHeX1YZKbRbyxUOAgsafgPei9lidZzYKyUiG9F7ui8zRHsNAPZbdbLQTNXe53idLgz5QR2LJb0bwf5nRs9Gaa7+v5q9YFMlntWUczeiBuATa2+Euivqr715fengDH4lZeWhUngyetrgUxbC0s9Acvf1uK5ZjDoqzx9NlBaO01L8+GhYpdY+8EtN2ECy6+YkqyL1Lal6Lbh5i7Xgl+dLxpjwdozWAasg+YMlTHOvZEDXy+g5uB8IsqqNGO+kSBx3MvdZHfpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aidmdK+j80x88xRDRTtpGDFKf4gFpq7Qbzd+e6iI8k=;
 b=aRByYcf/d10q/6iDAAM+R/jeB7ivYSLHEUVZxikDjlJ1222rN2nG6hoor2XJMouL3Fwv6Qnua32JFjGIgSYIwdmDMF3fpaB/U933w4k95FWyIq5Ayznik3cev7fv/uuEU4PhjN/b26uuT251vmdLq6ylt/Tfz/mv2TWBhEz7YfMCi9HVvmB1P7uf0hitqGU5RoDC0Cg6qUkQoe30BaT2g9YpDKJ3GWrxFOGWawtJvF2hKAXfIHTlU4MaR59cMXQhrhH/XoKdnYFV7L2WMQI63psT8tVvWK8s6fxpEpk3J2bx3DKWe1p84mkz1ADCgYTDXQMu1BUrGENLMDGYVu2p8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS8P190MB1032.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 08:53:25 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6134.020; Fri, 24 Feb 2023
 08:53:25 +0000
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Dependency problem for gtkmm3
Thread-Index: AQHZPTdXcLyahG8d7kCzj6de5lQ1LK7Iv8UAgAJDahuAAYFBgIAAcbKHgAH+/ACADurDIA==
Date: Fri, 24 Feb 2023 08:53:24 +0000
Message-ID: <VI1P190MB0493ED623B08AD74059ADA669FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <DB7PR03MB4841CE1D746B328873113D87B5DE9@DB7PR03MB4841.eurprd03.prod.outlook.com>
 <20230210231454.4f3aedbd@windsurf>
 <d851f407-ddbd-4942-bee4-6b28b5387fe7.84fc06e6-1edc-441d-a0d1-fbc3c0d71619.a6a05d4b-f834-4abc-a293-13151789bb4f@emailsignatures365.codetwo.com>
 <DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9@DB7PR03MB4841.eurprd03.prod.outlook.com>
 <20230213084735.5318a511@windsurf>
 <VI1P190MB049355269BFEE0847C27546A9FDD9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <87ad276e-999c-2503-4dbb-37f54d2b6e15@mind.be>
In-Reply-To: <87ad276e-999c-2503-4dbb-37f54d2b6e15@mind.be>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS8P190MB1032:EE_
x-ms-office365-filtering-correlation-id: 1a4a6c2f-770e-4b5d-4838-08db16449700
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qLtr+KTwTjERMUoHogzCBYyjf6ohXbvCGrPpJoItEg2EDC/+38YEu52Kw4QvU7hzIVaCjhuQLNY2GVa6ynNt2oiTGAhyxrB+Kw/mhLpJHjpRskyNLDwLTeaZLQfkkgcYZPIStDIYg9rsw8FClTozgRPox8SWnWIKgzARAi+icv7sUCh0tX28McYOgkltUkasP4O0UHxD2YaTxEKkDFesBR7xRKGswnSKvl6K91YkbJkEndjZMRWay8d+DaBnkuDn/t7V2dLh7JoLgxsZJhaMzXe9T01qRFhbD9esB4t83sJ4dEl5wG8cKsLj9w9YKkNjf2ozKBjyfRtpUywTUTnKFwrXPBpv1ObnspblVIwpy/AWjT2ON1xMTxTbMQSELSRR6fJzVGdR7d4hMzIa1dgtiN3biFprfLqYc1ITi77xdml6BzCoNhehoT028bdytt0frwIDRKgnJelfQvEyGg6CI12W+H67/m7cVefpY3WxoxWTdKZ9pYLhpBCzpRY+0nAzQmw+XxpA6XHBqN/ppm5oaR1DFa8UKCJA8PyC9oEu4ymFK9rupGeRjafSWMHkYE/boatJTrGZBZi/MIBv715+OkgIBVQk3JJu4yaVi2tIPJqDVz6NlcYcwQqQrxH/+mTcGzZ37+39gIpZQHabLSwn9nSU77CEYt0CrJhvdMITTJvYUbjjGuqpBxhCekZSGzrv1LwlHmJPKsRth9/cX+44CzlCpyUD2GcsekAxYQxpSA5jiigqWqvEEWPXNOOH/gugkbM1CK6l0TxIqZy2WNzb+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39840400004)(346002)(136003)(376002)(396003)(366004)(451199018)(52536014)(122000001)(8936002)(54906003)(316002)(38070700005)(9686003)(186003)(478600001)(6506007)(71200400001)(86362001)(7696005)(966005)(2906002)(55016003)(33656002)(53546011)(110136005)(38100700002)(5660300002)(41300700001)(76116006)(8676002)(64756008)(66946007)(66556008)(66446008)(66476007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tb03k0FYUtMFFzB/b3B+o535mvRyn49PWMDOfrZbnnrqzCcJVX3Q2LlVC0?=
 =?iso-8859-1?Q?eybc3nH/aD+EIlRKqt697/AkRUYF4Mx/kJfQJrMBpth9PwXFQYNtA1h/pM?=
 =?iso-8859-1?Q?+XudGylbDzrFK1EAQ7/8Q8qcWpCQtDkgjgojQ7BINYezXZLiy/ydBDontG?=
 =?iso-8859-1?Q?LBMz2qg2QwMJ0KSm8lHTRjS0aVS+8IW4nyjVIzRlTrDWtFlKIFUBpxhc+D?=
 =?iso-8859-1?Q?+lnQ24ywSf8j2Ky6wENInKaa8hlL7Q1+EDImvrQY/itbTB5dD7W4ZB3XF/?=
 =?iso-8859-1?Q?cL0Pqi7519LFiudrQ+bikEmSIFbUIbsw9GEGchU5J94zry7JcoL/mGyAtM?=
 =?iso-8859-1?Q?bLmuwBJUoVwdUPVlC+/UEDBMXJgAbpJ9IjOgVFu/DkIkgUlIadjP+Zb8/r?=
 =?iso-8859-1?Q?R/Vs6M1EjpuPZnHUZg+qNAd9WjmvCsGR9qeL3wVmhGodMGebXL63WZP2Ap?=
 =?iso-8859-1?Q?FxK07iuI+FDHmEMj8UIb80SoD2EZeDwDqRqnljR2vdUWsFqN7ed2/RtQf9?=
 =?iso-8859-1?Q?oteiFEJuz3LHvgDz/NxFQ4w47kKEwS2nGUhKnT7vWjIkDLzjPbGTB15gQ9?=
 =?iso-8859-1?Q?KfC9img2Wyvv4CmhhA3N+HiM/5me1S99ibm0nSkTlatrLAE1SL2adK9dzE?=
 =?iso-8859-1?Q?ruesLpGdNCyYJCpguG5gMtvYyK/licyWV1/ZlkUnt6A0Xq7qsCF6vNxBiv?=
 =?iso-8859-1?Q?CSNSffjq/OW9EDauR26xF4oXzU6rY8puAAR6AmBSuR+tXB2F8dMshE9J2B?=
 =?iso-8859-1?Q?lHdFLfQQct11M2pkbFLXLMNgwtQHqtIQqJralTWKrA0SeZYQFICiaR22UH?=
 =?iso-8859-1?Q?d2k4wtxa8fXYdsr5FmyBpLRKRLR4EoAjfKQWxJ0a4rVhe3SKWbD3vdtSkF?=
 =?iso-8859-1?Q?bSO4keGXDlIt3qtx66UGJovY9QqT12lHVLgkdOLKW6nwceuaxvtu+qrazu?=
 =?iso-8859-1?Q?fNYuKRpqRj9zpYWDRhoOhFFPI+7yEgEDJhjEXO54Pyht7CVE0MUeqI9RXc?=
 =?iso-8859-1?Q?Q573Qe//oBlyRjjAnK+IZJ5vVyAMuG4LnjlAY8y4YYcjqXxNUTVpbvdu7t?=
 =?iso-8859-1?Q?qtkSP7Yti15nDtvypcZJYYAPS3ipw3AXWz4DnHQc5Wy+prvK3nR6tdDj+h?=
 =?iso-8859-1?Q?SYY5CQMjfhhpqnV4njiq7jJDokwnkt5RWfh69e9IgbbKHj5njBL264y491?=
 =?iso-8859-1?Q?Y5MkY4Wz0K4FqW8ztDJSWAQ3fHRbe9aMqFug5mgR3VUWlRCyhkEhPNvWdS?=
 =?iso-8859-1?Q?MSwxCc2DM1h+Ke6LuW04O/NuF917SXQqdzaerck5Z/GcRkRWZiGhLGkLA3?=
 =?iso-8859-1?Q?/n/cOS/QJ6XAlazP4kYgCLa/fksL47IoJoRnoDHT+Ls5Ac3dEdhe7UypBi?=
 =?iso-8859-1?Q?Ktuo4S65nL/8HHTHAmxt+pygG8KMKzFu1fzSuQu4lZBXjwFw/+rHx1InIU?=
 =?iso-8859-1?Q?Nx4X2KhjVik90VA9AsMq2lRIrC0f31wQ1k/RO5KtT/hF3jKnvcsZTij0y9?=
 =?iso-8859-1?Q?3cninwTHy+QkQm6L75N18agZzOAVTfsGxVMf+kJfHyp8CZ8KCcmAo5tFlr?=
 =?iso-8859-1?Q?gVSXQd1p4+Y62LxkaKNvQahCTyOVhlwuLQ/vjXwGmxLUNqchQZEKTDQVtt?=
 =?iso-8859-1?Q?2AToRNCW55uLj39pyz2A6bur6pNvtLe3g1nuR0SwEbSqvHcPC3R328W74+?=
 =?iso-8859-1?Q?Jvw5Orb8b8w52A5YbAg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4a6c2f-770e-4b5d-4838-08db16449700
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 08:53:24.9866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uyag2UCjsYBuTammLcGllPYcH+jnNlRB6OtHQt51yr2nBzFEBcDWf0I0aSSB5mPkYi/H8x9ZNSNXbtuZtHc8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1032
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aidmdK+j80x88xRDRTtpGDFKf4gFpq7Qbzd+e6iI8k=;
 b=jJKD+slfpGFW05Ts/HGnjXoufjXm+wI3diAd3pdJkuEvQ+EhIFKw3MkIDwrJVUkX4MUCrAjAkdJ4HpmAKLTexupOO6IV5MMTFVkwKy4pRfDFRbhLxzXvrcu0wH5zoXlHO9b+a53YcEvLZjGjJpq44GLm59GD9tZBuNF4gNcdvV8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=jJKD+slf
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] Dependency problem for gtkmm3
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
Cc: Dirk De Becker <Dirk.DeBecker@ebo-enterprises.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steven Boucque <steven.boucque@ebo-enterprises.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> On 13/02/2023 15:52, Lang Daniel via buildroot wrote:
>> Hi Thomas, Dirk,
>> 
>>> Hello Dirk,
>>>
>>> On Sun, 12 Feb 2023 08:51:17 +0000
>>> Dirk De Becker <Dirk.DeBecker at ebo-enterprises.com> wrote:
>>>
>>>> Thank you for your quick reply.
>>>> Will this issue be fixed in the 2023.02 release?
>>>
>>> It all depends on whether someone submits a fix for the issue. Do you
>>> think you could have a look?
>> 
>> The problem comes down to an incompatibility that I tried to point out some
>> time ago [0]. Current versions of cairomm, pangomm, glibmm have a different
>> ABI that's not supported in gtkmm 3.x.y.
>> Even the most recent version of gtkmm 3.24.x doesn't support the current
>> version of of the other -mm packages and according to the mailing list of
>> gtkmm [1] there are no plans to support it. The are compatible with gtk4.
>> 
>> As it stands gtkmm3 isn't usable and fixing it brings up the same problems
>> of duplicating packages.
> 
>   So we have two options:
> 
> 1. Drop gtkmm3. It has no internal users.
> 
> 2. Create cairomm112 etc. packages (or whatever the latest working version was) 
> and live with their unmaintained status.

I have just submitted a patch series [0] that would duplicate the needed
packages. So far it is only compile tested for all of the toolchains that
support it via utils/test-pkg.

As it stands right now, all of these pre-API versions are still maintained,
each seeing their last release about 5 months ago.

If dropping gtkmm3 is the preferred way, let me know.

> 
>   Eventually we'll end up with option 1, of course, since gtkmm3 is EOL itself 
> (they're only working on gtkmm4 AFAIU).

Just like libgtk3 gtkmm3 is still being worked on, at least for bug fix
releases.

> 
>   @Dirk in conclusion: the best you can expect for 2023.02 is for the package to 
> be dropped, which isn't going to help you, of course.

I guess I'm to late with my series for 2023.02.

Regards,
Daniel

> 
>   Regards,
>   Arnout
> 
> 
>> 
>> [0]: https://lists.buildroot.org/pipermail/buildroot/2021-October/625850.html
>> [1]: https://mail.gnome.org/archives/gtkmm-list/2021-May/msg00000.html
>> 
>>>
>>> Best regards,
>>>
>>> Thomas
>> 
>> Regards
>> Daniel
>> _______________________________________________
>> buildroot mailing list
>> buildroot at buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
