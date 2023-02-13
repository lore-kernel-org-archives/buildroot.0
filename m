Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A3C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 14:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4AA260FD7;
	Mon, 13 Feb 2023 14:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4AA260FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcfQV2RGumyC; Mon, 13 Feb 2023 14:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A10460FCF;
	Mon, 13 Feb 2023 14:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A10460FCF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59C311BF349
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 14:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40574400F2
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 14:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40574400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUcdRWTKvKe7 for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 14:52:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31E97400CB
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31E97400CB
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 14:52:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmJgHwBQaOTaVkogdFW5dcFQA97ImygrYcs7tA3AOGs3kTqiZmgsZSKdNYvohQO83P+UORmXClz2i3RRwTRl5TF18T17sKSl2q60p6G2ptrJ7HHIYfBwI6wRyKjF0Ld2MClikt4scNb4R6z0yPhGHHNfjJ2sfw5//Kblms1OrpRUgx5vdYI6lQHrGWMnRATY3MBRvzVGFs6O/hFImVKhEPSLxPUi5wE/O4suGx13B/5LI5yV50Y3OcWbIJVmSH6iXKJ12b5MqLm2wRW3sC5DKdD2Y492gc8KgQno94dNsDhxjRTID8sEa03C6OVNFaR3ulIDUgjtPM6OSPtyFvfPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nxD3/M/qLvwsiOEzN2Oe3SVx9D6A2FAXbG9NyXJyMQ=;
 b=dvL6YaTHfGLz1HEFPj5W+bZxEo5GS7UuAvpHfum6qb3wHkNISOtzbNpwyGI20d/gkdrRF07BbIgCgoEdBiqs9MsrjwUMofIBEUknJOW7TeqgSFS/qgyn1cvyWfN9s3Wrirh/AwTemDBDGqMot1ztJ5Pl8tv0+5Ug8/EuR6CDq8jln55hZlBkcj+wGCYO9Y26BfBqBMCDYFlfEOEsanrOx50X+qSIFQqTdZRc21UuXH/kjMrkKfedLg6hi0QYGZSzC3XBl1uZKwfgCb5rwPGNk/GUIhWIHrMMxYtCov4LQf6OMzcnkMjHPzxgv7ukBym+wvrfi//RtXf+aVRLiPnKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0735.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:52:23 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%6]) with mapi id 15.20.6086.017; Mon, 13 Feb 2023
 14:52:23 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Dependency problem for gtkmm3
Thread-Index: AQHZPTdXcLyahG8d7kCzj6de5lQ1LK7Iv8UAgAJDahuAAYFBgIAAcbKH
Date: Mon, 13 Feb 2023 14:52:23 +0000
Message-ID: <VI1P190MB049355269BFEE0847C27546A9FDD9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <DB7PR03MB4841CE1D746B328873113D87B5DE9@DB7PR03MB4841.eurprd03.prod.outlook.com>
 <20230210231454.4f3aedbd@windsurf>
 <d851f407-ddbd-4942-bee4-6b28b5387fe7.84fc06e6-1edc-441d-a0d1-fbc3c0d71619.a6a05d4b-f834-4abc-a293-13151789bb4f@emailsignatures365.codetwo.com>
 <DB7PR03MB4841EF79C4A0EC6DF2E96CD9B5DC9@DB7PR03MB4841.eurprd03.prod.outlook.com>
 <20230213084735.5318a511@windsurf>
In-Reply-To: <20230213084735.5318a511@windsurf>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0735:EE_
x-ms-office365-filtering-correlation-id: e7aee516-3f73-42e3-5ce5-08db0dd1ea6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h3flGLTods+PjLzkpt3Q0inJiR8A11ceEO9dsowMBecaci7elNS8zOUQX7LFtDTXoJ6FPkopB4x1E8KwgWu6bnBgvG1jhWqs1WC9mIU5SO/K1KzoO2U8JQKsa7KZVsTxj4lx3rGATlcuKQUEf3qZYSM7WQXYmN/9H1Yz85cvCUKmMkJ8rycrT6emkOlv04SlsEfVcencMhBAEiK9T/6bF2uQ27mk2sm5WF3GT0Rv++MmG0lbL0G1R5v6aw58mzNx/+Yhu82AWvYN/FyeCcoL3fOnBYDVoICKoZUgeoLjqxFMqlvYQu/hQnpWGIxvsEIiPvV9dOxy2DmhrmI3IIxGNfNFtwVrmRkvsV33llw7OeA5ESyEUX9L9UToCrtkXW5sJ0ryehpZQSX93m2KbivdqQiB0J252a+UPRAGGGUSTNsi7uFmwhqMTblckh0nuczj35ewN6xS8Z6WCnfrqU7qNBIe1XwBp2NgeFwKjNbmzfLuypEsi27vlsYm53yc/hPK7cJiQZhjLVfpkS19UtlUFlUcPuaJ9sJ4RcccZlYm/z8zljLHFBPH+ANtqVbIFtTZYbAd/cXhdhbeyrn6hZVCC7TLV79oy4I1MaawV6Y3E2mSw9rznGnAyzYEXU9KWpL6HfP8repw+pO4jZOq4gsXBXbjrce+lc2bvnbMRcigybrmKF7lZUwuZf9vT4VBpLRfasEUub1tY4yIE/OeVktopn1Vjgq1FCMh7qgUkBDD5lI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199018)(33656002)(38100700002)(86362001)(38070700005)(55016003)(122000001)(64756008)(6916009)(52536014)(4326008)(76116006)(66556008)(66946007)(66476007)(66446008)(41300700001)(54906003)(8676002)(316002)(8936002)(4744005)(5660300002)(2906002)(966005)(71200400001)(26005)(9686003)(6506007)(7696005)(186003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2NtGps7GxTS+vQp3uBf14ilmBrY1eW9j1mYcOUeYx9jHxdQoJUptDugoo3?=
 =?iso-8859-1?Q?+thsAt2zrvhuxGghyzctgC80XUNq2QrNFLsR48Msa2G7973guyPNADuACA?=
 =?iso-8859-1?Q?zT7fhRTwEK7k/s3v9ZO7kPsl6/Xg480m8FDQJUHyjcjbFUYrrIwJMjNNAO?=
 =?iso-8859-1?Q?bPPp3ZXyR199Kk+p13HaLn5bOqAnZqEcrEwLkdyi6BUAxK2JNjlZttaSp9?=
 =?iso-8859-1?Q?rOr53ytzsieKKpAVNVswNEyUFPSWKE8oEANejAW2heAb+poAQr8udW3PtN?=
 =?iso-8859-1?Q?VLUyY9fdQ6PQnSoQSABJ4xfVekbolaUdRwxpaa7+dIiiKCwr6j3COv4NHL?=
 =?iso-8859-1?Q?PCu8NK+uOjbyuiBEYhRmkcTAEle2sjGTfNPrHK+phZldqGXzWYsft0zBsp?=
 =?iso-8859-1?Q?MAdKplB7TNZEX+NFZR3PHglCg1ML95CWb623uB0YAoF6Rn1fIdhrjSSqch?=
 =?iso-8859-1?Q?TCEvEOs7L6wPil+fJqaJhqWIkyg7k+1n35wHOf93TSOyLcsVsL11u22KzH?=
 =?iso-8859-1?Q?MFtF0elw+tQfzm815ohNjRGwbU6Bsbz7Epm7oQusy2C5lThS6zF/ivSchD?=
 =?iso-8859-1?Q?zQ6ILbB23+WfFx0K/tKuYPkSdWvbcf43vkUsPEAYmvrSVU8Oh+/9jtzQZU?=
 =?iso-8859-1?Q?F2vneRBemhCaagjZHsAc8E9QQH9+d5HMprcQ7X4V2PuiZDLYPsNDO03jS4?=
 =?iso-8859-1?Q?WxYlYQqDjjeH1bfO7O6ApG2e5XCeIFPE9PhTVKdYoohjUk6jz3VLco3Z+f?=
 =?iso-8859-1?Q?L183rnEQQaTk6c+E6Z99Wkr55tHSWd0Z2jXm+GWdJZtpOwQHpu8IwDkjQ0?=
 =?iso-8859-1?Q?8aR/0AcH9+dYDqNKpnk7vnm9Q1slftF2F9XSohAPCC1T+6BflIsMON/YaV?=
 =?iso-8859-1?Q?DE53vHKXLQERKyR4bkKlrRVTeQ4RR3R12hn/TZDtfRA/9i/1D/XaUJwFI0?=
 =?iso-8859-1?Q?1dDPQH4p6z386P6+aI+ADEusj+8tgwxZX9NQMtRP4piB2jNamte0V6oMe0?=
 =?iso-8859-1?Q?b90o24B3otNgkN33ceyKRpkBSMKdOetyfT8TsSi991d7QQbMvH6daeEqn2?=
 =?iso-8859-1?Q?EMI10TV8/o9mTLsEvularSqOPoUChm8hRhuCnqNA1ljWwcS+RAWKF4byx2?=
 =?iso-8859-1?Q?lHMpSrAi6h43nIoJV/3at0paESXzE3wE2eznkq8xOr9I4pNCo2SVD20vY1?=
 =?iso-8859-1?Q?pU10lxQAk7pw72vpn0tss++ciQaPk1+oohZhIp1L9JQE2OaX6vUxjS1ucG?=
 =?iso-8859-1?Q?11Qw+T+gwSPYb1oNicbVJYKwWAmrPhzZyWc2E3qAaB7SY1lmwX1xxMTazY?=
 =?iso-8859-1?Q?3M7nWx+q0PP3JUeT3TeifdvTwOPJC6WkIFNv39RCRQRD1gG70F0WPHW1Yw?=
 =?iso-8859-1?Q?qQl6h2/O/rVnc3l3QIVgYS4zs/ie92mU1lo3p+/DABDSgfQOM0szUM1gZ2?=
 =?iso-8859-1?Q?Pp/cHfOsDs3njl1MG0gDzF/2+yBirpIkxo3UanCNhLRBFat9qpNT2ZnAw3?=
 =?iso-8859-1?Q?+6BUZTsuaaeznr3QW5absGRFfuQWVYNMMVPf9KNA+Onf/fmaQDW7Ql4uZ2?=
 =?iso-8859-1?Q?xC/g/YCsF+qC66gtS/5s7wnscRd1zkEz8+3osjarRQ41PLfcPLUlh9A1PW?=
 =?iso-8859-1?Q?Ox0xuQmZ/Bl7A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e7aee516-3f73-42e3-5ce5-08db0dd1ea6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 14:52:23.4753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8emeXXsn8BnfTa/Tz89Jk/lrhjiW1+sAry4vcpk3r2GVtc6+9cIJkNDf11QLkAnZT/jSIgP3jdtvn0tj7NCxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0735
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nxD3/M/qLvwsiOEzN2Oe3SVx9D6A2FAXbG9NyXJyMQ=;
 b=pwZw3Aob3/EyHCSVIoWYeQ9skNnPWiIf8Q3OLCUrruYbh7qikyy1w9D4k5f8S2hALm5nmVlTJcCTtDJzLM27jevA1tj6YmLqw2Hezas5PLTRSniIwGvIjugv+Ci6ooOKIGcDLvUAe1cj1CLaZ4xy5pE5J8g5K3vwVrHiYD7sM5s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=pwZw3Aob
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

Hi Thomas, Dirk,

> Hello Dirk,
> 
> On Sun, 12 Feb 2023 08:51:17 +0000
> Dirk De Becker <Dirk.DeBecker at ebo-enterprises.com> wrote:
> 
>> Thank you for your quick reply.
>> Will this issue be fixed in the 2023.02 release?
> 
> It all depends on whether someone submits a fix for the issue. Do you
> think you could have a look?

The problem comes down to an incompatibility that I tried to point out some
time ago [0]. Current versions of cairomm, pangomm, glibmm have a different
ABI that's not supported in gtkmm 3.x.y.
Even the most recent version of gtkmm 3.24.x doesn't support the current
version of of the other -mm packages and according to the mailing list of
gtkmm [1] there are no plans to support it. The are compatible with gtk4.

As it stands gtkmm3 isn't usable and fixing it brings up the same problems
of duplicating packages.

[0]: https://lists.buildroot.org/pipermail/buildroot/2021-October/625850.html
[1]: https://mail.gnome.org/archives/gtkmm-list/2021-May/msg00000.html

> 
> Best regards,
> 
> Thomas

Regards
Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
