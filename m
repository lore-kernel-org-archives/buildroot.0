Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE684C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 10:44:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1507610EA
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 10:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1507610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=abatec.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 724D14014C;
	Thu, 14 Oct 2021 10:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrjlErZfifSo; Thu, 14 Oct 2021 10:44:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B70224014F;
	Thu, 14 Oct 2021 10:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C20701BF30F
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 10:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE5594014F
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 10:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tNhyE_Gt7v0s for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 10:43:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::606])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE9564014C
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 10:43:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TW4bTN8+qnCnfsNeqd7WxNtW82SUFiKischOWH+yO9KhJj+ZMS5AmJ03wTHH+9t66eAf2Jaa1DYGuA8W3dm7Q3vocVBFm2ntJ5KYVcpqdHTP39r9qD5OIMYS7DjLx4+u/5swH6sc3LvHVxNVrJSWI8gi9VO2n9Qb7CfylcL/NlAXsqftAT0hYgPcVa+sSJ4oTHWordF2dXSkuslxxGAe2heyWZtqvh87KiLDkMYdfRMcSefWm21ahuYrYi23FpMy+WcEaMiSCbXZo/KEYzoj48SdLCGRUqiC5X8Wq3cFtAf8xjSPtvBaEHHvLGaHRtSKPy3WStzEgso4MTcOhEmznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIYKyCysw+Xlp+c/18oH0gNt4atvdT19ztguykGVLAo=;
 b=mVC9pKp3G3GobLDjD4iZKtEeOeZGsmqp35u5FWPWRnDOljpkrOJ9EIUfLAp69Ko+es88WoMiWEiu+lvoc0KfQ6M2VyOaCUf3htK75C+NLY6TaStZi1/tTGPStZr/ek3uzmylM0LezspgitEty20gW2BQUAbMfJ04GWlZixH1mTf2iSLMM95B0L9hj1kN45unWn1d3Qq6IgQOLTKGIUkdbAc5Gq3iUkCR7RKtgunu9+yVTMosFgWQ7Q+f68CtiESUpVaYvUr9gtDCQ9fZ8Krj5kgibxblgkp2PA+fXmdDmMVrNVm5jahnXqEq2Kc4yCZkhlSYCunwDNXuUb8epNIVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIYKyCysw+Xlp+c/18oH0gNt4atvdT19ztguykGVLAo=;
 b=ynwRb5yD4ZnXMNplmBM8KPnbf2py0T5SuZCZzWYzF8eATgAPZAoptmEXH/6RhFkIvoPC1d+hgLrbcB/5OKTCp88Igz59nDrEBcfwcG0uAb4lMVpbIZyBCt0TkbyT9UdTJON7tfrTIheRwq2bGICOr1jkUMAn0hdI5jnzp48ujtA=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0143.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 10:43:48 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a599:6569:1134:70e]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a599:6569:1134:70e%6]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 10:43:48 +0000
From: Lang Daniel <d.lang@abatec.at>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Arnout Vandecappelle
 <arnout@mind.be>
Thread-Topic: Question about adding dbus-cxx and updating libsigc
Thread-Index: AQHXwOhetxGDvJj9gkWy2/jZEL2Gow==
Date: Thu, 14 Oct 2021 10:43:48 +0000
Message-ID: <VI1P190MB0493EE28868A40D1736DCD7E9FB89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB049315D372F7D5E516E916319FA89@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <3f981830-2ca9-50ea-6b7c-9c99b6f65517@mind.be>
In-Reply-To: <3f981830-2ca9-50ea-6b7c-9c99b6f65517@mind.be>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 2b81bf9c-914c-fa19-aad3-13901570fd39
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac635f25-23dd-408a-7252-08d98eff8162
x-ms-traffictypediagnostic: VI1P190MB0143:
x-microsoft-antispam-prvs: <VI1P190MB014312A3A3BA9CC7B15C6F829FB89@VI1P190MB0143.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +t8WMN1iF+QYSULEwqxvAiE5dhB1pzyffR5472DdUZxpzojhPeGrhTwTBENjzmtJjNj3XOkSjRTvsiBcYvX6Fsjk08nDdUZXKJHv/1oe34GVoSorzvQDw9CjrBeSW0YbNQrTrI7UD/vvM8fT96QcWO8tWOk6HlHG2IjFl+xbE6m5aoEBZq7CwH5EufKSV2LaMQpDFSA8mjjbAN7QQjXuRqo1GAi3A2fSW4n3HoqSHyYZhHGAcIU7is3SzWS5cFD/7KO8i4WMhTnmJ5qg50Gzko0Gnk1DL3PPegPIxAgaE8+MNHyYQiH9t47gJ2L5XYO8o6LLb6myyAjedl+QhmtqWgditFX22UlTNr4nbnX6w/jpnhsBdIuGJ6v/jcK+QY0UrfS5QtKF1KWrNTWDJkyBY16M5AGn+j2DUtXkKyQOYHrUoYdvYF4i9JlOsUnchJvZhSJjngwLwQeiRcViF8qghCovbXoBUZbQOj5sstxPi99H5Fg9GWaPrsd084yCePfL+O8SkKLITKNrwtARRsZLto5Jj8mAmT+f7gTocbETGtHyA3mI4+PqjfGtAvfa1rdXi0Bi0XGr4Nyl8C5WWG4u9aqT1coNAziQsUT6I32Lbik8q8RGu88cMqCN9QB2qT/SIjILVLtjLXA1hke3CZyiaQQZKf312VNwSHdc/D4KBPrEVy/nTGM/K6LBH7KY/JywML2YhJqrVJndLmi+b4EK+fMr2ps7SDblL5mxBLcivulPV+mTb+b5kx8J3lWgMGP8soS8hQJ+pqFY8Siz79j8FR3jDV+bHa7TKtMJkSUVIpY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39840400004)(376002)(136003)(38100700002)(122000001)(83380400001)(66574015)(9686003)(55016002)(26005)(186003)(53546011)(38070700005)(508600001)(966005)(6506007)(71200400001)(7696005)(316002)(8936002)(64756008)(66556008)(4326008)(66476007)(8676002)(76116006)(66446008)(110136005)(54906003)(66946007)(86362001)(52536014)(33656002)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?emE/0GzDQFdpE5xaPus6ISPoUvLkD42RPJzlp68KPGLLXB2s4NFzu0Oirk?=
 =?iso-8859-1?Q?j4dhE0buxKVPW9Fbm50PRbXgCM4adtP/KLvm5aeaDnygGRAmlwzv6kcCOG?=
 =?iso-8859-1?Q?+4hlUt9nCFTQ1SMcQuPqIBz2zcmpU/jHGbGjAelqr+Ir13b0ui2ZhCyYlF?=
 =?iso-8859-1?Q?YFtHrOEARgAXS9uVTJmAIlKQpWbbt2azk/4ajA9j0TIPHkzuHNzbv2hxe4?=
 =?iso-8859-1?Q?lGtQgsXiymW8r4VlBGQFT5wWAsDymOrev0vvJTc2KcAHe6Zw96/4CuhJm9?=
 =?iso-8859-1?Q?3Ys+6t86SnzfZ+giNIg9yiAaAaCz4C4qd99mecw+GOvGkWunnv4uWVSpKX?=
 =?iso-8859-1?Q?KJ5ZrmLW8F/eezvIX4KA4TezClXHF3vmuDc5ow52VTJdyLYH7YsUdKYQwO?=
 =?iso-8859-1?Q?J8FqbMsoZOJUy3DhkgpUqVdFJGOn7GQk8ZKXUsiVE/nad2nuXqR/5Dxc1J?=
 =?iso-8859-1?Q?eJ3UFobQqydCmLk157E5C0BeOFP/QzHMexjAWQgivoaJLkhqLgqChil4wI?=
 =?iso-8859-1?Q?POrA9yMuqoy1S/6zYWBqFutUOLRKnRggZ9dszlET7RVEsQbB/t0jG9sI76?=
 =?iso-8859-1?Q?LfU4WcTFaT/M1XMHYde/ZT6b+xIUQTHkdVwGyJUYjvveUmw0IFLHxVO1+p?=
 =?iso-8859-1?Q?PLcM4kw7u3NC/I1k0Bnb6hnXM4NFRkAiTmqKf+xSYJcYWfZFIO3aQF4mF0?=
 =?iso-8859-1?Q?9zZ7EFMFT3dfmpnEqlJ+kOKGnJ4BWFzFH/ysySmkk+kZHSdFVsy6m8VgfH?=
 =?iso-8859-1?Q?YzyRYs2wAiOOFEkUBto0NKKRhgIOlrA4Lq9gpwr/uPwppUl8ZyNhlHAh7C?=
 =?iso-8859-1?Q?woWvlTb+uLdArP9QujHOs9KnNM5UISJBpNbfTndbAqAaBJcK7DDzaAJGqH?=
 =?iso-8859-1?Q?6gVcp7/PMLeaELtdt47bweRnAEBlGlEjedSZKH/xJB20YP3OtOlS8CGkd2?=
 =?iso-8859-1?Q?8nHqIrfshFmEIEuy07kvl+uIHrxPRXTBzuYifyEoR4cgmyNbmPFIu47Y7q?=
 =?iso-8859-1?Q?w7NwzxVo/2EbG+YrPp9zIm9MPmed3T849FumwtQNnAP00+Y62+gjrXqIJa?=
 =?iso-8859-1?Q?s8MNyNpuGHnkVn8dcN4iVNH4yBnRJr8xCNFvhfjEJlAFKn+oyjRb102mRz?=
 =?iso-8859-1?Q?l5VmWJdXOLcoInRZ1FXc/VRBrCMvjbFN6F6wVmoSfmtA+k0tGUDxSYS29n?=
 =?iso-8859-1?Q?rKjlQQqY4ZwFeVWnQfPuyULiwPoHVrg58RuIgsyfONb2fNdhx10HCaYcB5?=
 =?iso-8859-1?Q?/DSr2s22+l/gBFPo7XDKRgZmKsm2l12amft6RuOEyDGOWkO3+7R8jjHa0J?=
 =?iso-8859-1?Q?iOGt2NCOi3KsmTaLEpgz1ENXnsKwMls3Krj4oyWeveIfo84=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac635f25-23dd-408a-7252-08d98eff8162
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 10:43:48.6156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wkKUnyCtsp3cCmqn1stmlniBDmjhNyTo8sAKt0MExE0PXS75W1PGj/WSxnC+4Es6BYDy3k8VBMwS8SRRUbyOtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0143
Subject: [Buildroot] Question about adding dbus-cxx and updating libsigc
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
Cc: "james.knight@collins.com" <james.knight@collins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,
Hello everybody,

> On 05/10/2021 09:46, Arnout Vandecappelle wrote:
> =

> =A0 Hi Daniel,
> =

> On 28/09/2021 11:51, Lang Daniel wrote:
>> Hello everybody,
>> =

>> I would like to add dbus-cxx (https://github.com/dbus-cxx/dbus-cxx), whi=
ch
>> compared to the existing dbus-cpp package is in active development.
>> The last release of dbus-cpp was in 2011.
>> =

>> Is having two different=A0 dbus C++ packages preferred,
>> or should dbus-cpp be deprecated?
>
>=A0 I haven't looked at the details, but I assume dbus-cxx and dbus-cpp ha=
ve =

>completely different, incompatible API? In that case, dbus-cxx should defi=
nitely =

>be a new package.

Yes, they are two different projects with different APIs.

>
>=A0 We could remove the old dbus-cpp, but generally we don't do that unles=
s =

>there's a big reason (difficult to fix build-time or runtime problems, maj=
or =

>unfixed security issues, ...).

dbus-cpp has a few dependencies (mainly dbus, expat).
I'm not aware of any security issues or build/runtime problems.
So leaving dbus-cpp as is shouldn't be a problem.

>
>
>> dbus-cxx depends on libsigc version 3.0.
>> Version 2.10.6 is currently included in buildroot.
>> Updating libsigc would mean updating cairomm, atkmm, glibmm and gtkmm.
>> Those updates bring GTK4 into the mix, which isn't a part of buildroot.
>> At least I couldn't find it.
>
>=A0 Ugh...
>
>=A0 Updating cariomm and friends will have to be done at some point. But I=
 believe =

>GTK4 is again a major API change like GTK3 was, i.e. there's no hope that =

>packages that currently use libgtk3 are going to build successfully agains=
t =

>GTK4, right? In that case, there's no solution other than adding libgtk4 s=
ide by =

>side with libgtk3...
>

Yes, GTK4 breaks both API and ABI compared to GTK3.

The problem here is, that all the -mm packages have breaking API changes.
If compatibility with GTK3 and the current API is to be retained while addi=
ng GTK4
with C++ bindings, the following packages would need to be duplicated:
- libgtk (3.24.30 vs 4.4.0)
- gtkmm (3.24.5 vs 4.4.0)
- cairomm (1.12.1 vs 1.16.1)
- pangomm (2.40.1 vs 2.48.1)
- atkmm (2.24.3 vs 2.36.1)
- glibmm (2.66.2 vs 2.70.0)
- libsigc (2.10.7 vs 3.0.7)

Maybe I have missed some, but those should be the major "problems".

>
>> I can try to provide patches to update everything and integrate
>> or create a separate package for libsigc3, since both versions can be
>> installed at the same time. Which option is preferred?
>
>=A0 The "update everything" is the preferred option I think. But since tha=
t could =

>get a little hairy, we would also accept simply adding libsigc3.
>

I guess there are four options:

1. Have both, GTK3 and GTK4 with their respecting C++ bindings (-mm package=
s).
Which would mean duplicating the afore-mentioned packages.

2. Duplicate libsigc and add dbus-cxx. No GTK4 C++ bindings.

3. Leave everything as it is and don't add dbus-cxx.

4. Drop C++ bindings for GTK3 and only support GTK4.
This will break some packages and every likely become a problem for people =
using GTK3 with C++.

I think, GTK4 (without C++ bindings) could be added regardless without dupl=
icating packages.
Would mean, that buildroot supports three GTK versions (2.24.x, 3.24.x, 4.x=
).

>=A0 I've added the other maintainers in Cc for confirmation.

Thanks

I've added James Knight, since he is the listed in the DEVELOPERS file for =
the affected packages.

Regards,
Daniel

>
>=A0 Regards,
>=A0 Arnout
>
>
>
>> =

>> Regards,
>> Daniel Lang
>> =

>> Software Engineer
>> abatec GmbH
>> Oberregauer Stra=DFe 48
>> 4844 Regau, Austria
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
