Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F5FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 07:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF3E540219;
	Mon, 14 Nov 2022 07:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF3E540219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f61MQAhzEufJ; Mon, 14 Nov 2022 07:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE1D40209;
	Mon, 14 Nov 2022 07:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCE1D40209
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 763821BF3A7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24FEF60D7F
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24FEF60D7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTDvHavRw3tu for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 07:18:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F39960769
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F39960769
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 07:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDtrDRCyALlTBWiPLg1mFhQAjmfsBL+yD/wELEY+YqPKDKgLoBwdGFCUe3wHYdrMnSfCIiWWuib9YLoU0v2j8GCasDunAwfRCxd3UW3YGa82TeEQzalaMh7yv7bhPDWnCbIW+NM2bBGo+nkkiFAG0GBzyie2EGuOrMWM1ORO4Lwtu1ZX+RMbKe2CHs7EMWdaNtpar0h+pYSI+w9XOI23/PgECOjAXfs0qASZGgza1kO4si/mtUx+czJ3EuWcRz8YBjTRqF8bnklGp9s7Y+YjKIuNCoj8dtKNNV0BVcvk6BYiTuvm0ZHCtGau86TIOYj9ARa+RvMm3xBd45LQbrckwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twppRoeAIOJrbx8tmlsGIhiJyYrSsYUXUhqdXMvLjqk=;
 b=fWmJ391MldxVXDhHpWhXEyYbu6X1GrfpXoyYHImDb0nn6JRNqLn1s8qjkWaxWg381hjA+AVRsNG3yXYeEmDxA2PmOEDULddMcNg2pKpDsaCXYw8jEiuMJ2Rlxb9YcuGTPTKmxLwY5OFrhix9H0cwT2ju2okstIcGdODMNqiv+eNIKiyiSeYjtXbUtBWMqQV8F6fP6gdgOfpyI7yr9rDwMFYjbnsECqyS+1rYUwxCSP21pk25YhwZW2anfh1HAsCBkSeSOI6S3eyrjp+tGV7j2U6U8v0Jdd9fXzY26Vlut4bGr/9b06w7EGA9X2T4UaUdHEsRQuaG4GwVjcn2FOPE0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM0P190MB0580.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:198::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 07:18:28 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a8f8:8606:d464:52a1%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 07:18:28 +0000
To: James Hilliard <james.hilliard1@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 1/1] package/iwd: add dbus compile time dependency
Thread-Index: AQHY9/lKQaF4uaMK8USvUyW7Hza3rw==
Date: Mon, 14 Nov 2022 07:18:28 +0000
Message-ID: <VI1P190MB0493457FD4CA083C3A5D56FF9F059@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <20221031174959.604094-1-james.hilliard1@gmail.com>
In-Reply-To: <20221031174959.604094-1-james.hilliard1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM0P190MB0580:EE_
x-ms-office365-filtering-correlation-id: 83ad69e1-a5b0-4a19-22f2-08dac6106d65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TaS26wHdYHhKlWojGCq+kUZq10RTkVO6HaEesKvUnXZuoXpDX0PjcPjtb9+AZjuXPVjOAM/gMkV/M0bCFfswPz1OWqOy7sFoR5g32hdaUVSrL0q3JSRJsYV5Zt22VC727JCly0EBuyUaWXAmuNxwUNStd4ELWJOX5mwIj/3nytjhPJ/PEVm1uPQUWpSGFgl/or1DSCHsb0HBpuKTdwVvM7aoXANgmW02GlPO2kbfqF/HMJvHui6+uglNFKFpi4plEAVumht6R8UY/NOQo+5KXglsrFQAxufAVC5fMDtX9H/NkVC+dk9JlZ9Dw7VYE7b8D/lbQi6wDKvlC2v358LvuBjW42MS4Lt5B1P/SUljc7PIUnQ+dIEUi2OdcXmiMfriIJ1DRb+ehfUz/rl1lTz7DkHffcIKrTvhWvldG2237aAFIr7olx0b8R9O1YWzAR48RlJYGyVVuhk5KXr3PGqpbyYzMxYLozAhOH6dA2Jo8OTtGuK/4az3DH1W14DAX8yQzAk5Ez9jc48Cxnu3ZjGlz2EzbvfN79KbLzX2sNegZPUB0os79jIz/unMmX5ZmytcgKwRvJsM4SeFRqDVYgF0+qdIaaGbLAuh1KhHtbWPmYAfUEL1hcQcQ8RlqOAkgrRd4PO/NIsdZKACEJ82/unYMy97UecdpVQ2YjIpjWaZKPgmkqgq27O0uBJdxBR3kVKu1f3hbxio5WJuju9C56wEstKrsmV/gjXfNl/+pyCTIS6PdzMLcWiujhYqu/OAZp2kC1lW+2Hu2+vwEKmEUk/4tA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39830400003)(346002)(396003)(366004)(451199015)(9686003)(26005)(122000001)(110136005)(66556008)(66476007)(316002)(33656002)(66946007)(64756008)(76116006)(2906002)(8676002)(186003)(66446008)(55016003)(86362001)(71200400001)(52536014)(7696005)(83380400001)(478600001)(5660300002)(6506007)(41300700001)(38070700005)(8936002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gfnIUOiNMbIfXQJt8XzxG8hTY0vETrPpvqqTTbKh4/aZtaKMujNS1JatZC?=
 =?iso-8859-1?Q?fbRG/I0PtNC8J9KubqG5U2UQIPHK++21+YdQmhoCe0mzitbaKJLg4Yq5xh?=
 =?iso-8859-1?Q?vdcNWqbIpop6yoMA4KV9HNGCWk7KHE/biAbL85ZSoWqk9c/Gh1jw8YbxF3?=
 =?iso-8859-1?Q?1zokPvWDfnXryYeSFkn8xDmQNl6ReTrjGjdcITIspKQUenzrT/mXFEmlNi?=
 =?iso-8859-1?Q?Ib8AAhHOdE6SJDG1WcGYwAeHUU1QBYOezqna7q3t40EjJuYf/nkmT/clzE?=
 =?iso-8859-1?Q?PHnrRrjGYZ/MXq+Zgf7JzA8g88R1mqU0i3Mi/bPK/ZP0DBlURgeKQrhPC8?=
 =?iso-8859-1?Q?nMLDrs7oIofOPKXYP6GoXhWlXCEWyNthrcACPS4GIJR/RbrNNPzAdW/SqZ?=
 =?iso-8859-1?Q?HA1FM9XF54dnWaabdntwF51upmiioURxeJlwRwxPfebGUUtV6zQIy+eJ08?=
 =?iso-8859-1?Q?CfkUclR7a4gTTpEeXw59C17m0MuHEvFKSqAsUYK2LThWeeEHnKxXUaTgcC?=
 =?iso-8859-1?Q?29+VqJY0yVkaK8ketjWHHe1cF2KEv81aa/adFByCcmxKBfDDSerI1Zg6IH?=
 =?iso-8859-1?Q?WPO5BjrlMB+64NqT0pdfywBjIcLcufhAxe069gNL/W+MLIb/eOI5GkPXZz?=
 =?iso-8859-1?Q?Qmh5qeTeDdihffyUFe9302bze4mvbQprC0sIGVt+dT/eCROEGAx9wq2FMu?=
 =?iso-8859-1?Q?j6LxN3j/gAnLt4XGXITBQrlOI9J/c7z1anxsjQbnGEKn6WWJAosvxdkjna?=
 =?iso-8859-1?Q?zQHYNrLg8YXIZU202+VS5ZVNvtGqEBW/6o5OVm2uHCRSDG4jHLNshgi22x?=
 =?iso-8859-1?Q?v8EBZdzgBi4BMvvMYhDpnOU6zITEXSegkk+k0H80czWDe39vRNmvPcADIx?=
 =?iso-8859-1?Q?+SEOueyAaLfHaTp+MRbbKME+8aEgQcLMBi8kDdDzGf3kShmCeGfpXYiuqb?=
 =?iso-8859-1?Q?pgEweb2k88N31690+m6FIcStX9OH7zs0QnZELauJKYxVahH22lQiqzuuwC?=
 =?iso-8859-1?Q?903Vhqgd8kRZ8k3KsEZpD4kGxTWBO3bWEm1yyaMdaXxW4fdc8rKx62plRA?=
 =?iso-8859-1?Q?O41Z1XY+0kTz1mod/xDVW6X0Ch2OgS3IEAlq4Wr6J2GqDm74lxJi6vPtE7?=
 =?iso-8859-1?Q?m6dpVwpzVpv7/Afnes6C+UvtlybSZilgd/AeE3q/QSm0ZxK7Gjj/FF7u9i?=
 =?iso-8859-1?Q?J0BqvUMohl5V545mtm8+Qf955/xNF8RHin0BUNkuiajbZNsNqwKRYI+JmJ?=
 =?iso-8859-1?Q?k5s4lbkMaW6znl58ohoQsGVxTUI7j08CYPznYJkX26Qx1M+AEVDlHazDVB?=
 =?iso-8859-1?Q?xNeJ9Y/xkBVe1ff8aNnAPLyMNLnyuGU1ymZLVGEAr5zuxP9M0IjO6dcoc7?=
 =?iso-8859-1?Q?wYmbt8Hp9exiz/y+ysMrBvl0aoc8v4zA93mihvtR6AdJAXARpxRW9pyvkF?=
 =?iso-8859-1?Q?H+khni4Q9zRK28sUFn+dTRBcX5K/KV4UfVDiMaTt+SEXKQtNwsJqPw8YwV?=
 =?iso-8859-1?Q?B9445nZ1/rY1tmz60GMa2WSVKhctlKx2owza/velnBE50yGSDSAlYjoW88?=
 =?iso-8859-1?Q?l5140k+RNfwJ57GESlLbaOYkQo+WytGhzxzkoNUKw4x6lyBF+z4sQGFdER?=
 =?iso-8859-1?Q?kB+pPWPyl/snw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ad69e1-a5b0-4a19-22f2-08dac6106d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 07:18:28.2998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PRdGvEljgapv0JeDDcrvaCSrx/6sNaSrEJfJoVToh4vMdd1MtLRNjDlUrD1tngRYcCDx3a1n6a4ZLv12CFN2cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0580
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twppRoeAIOJrbx8tmlsGIhiJyYrSsYUXUhqdXMvLjqk=;
 b=JWGsu+/5ICk0drjGzYWMQEXcULbFKsVWcEXEG1+1Q9ukbpsp6Hm8IWxPfVQ9+V9+Dv7Mc0XHDEXM+Y6VuwSZlhaW1D9rSX9W+nigxENZanQcGK0Ky2GUxOKDcUAu+irxmiuk5nu+Jzf+yhaI75uVX1aZ1xcTPyN7eZx1tSOYUKA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=JWGsu+/5
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v3 1/1] package/iwd: add dbus compile time
 dependency
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

> In 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4 we dropped dbus as a build
> dependency, however we still need it when building with systemd so
> that the service directory is available via pkg-config.

Sorry for getting this whole mess started.
I only did a compile test without systemd before submitting the patch.

I guess the comment in package/iwd/Config.in:8 should be removed then,
since that's what got me started.

> In addition we can drop --with-dbus-datadir by unconditionally
> requiring dbus as the datadir will then be fetched from pkg-config.
>
> Fixes:
> checking D-Bus bus services directory... configure: error: D-Bus bus serv=
ices directory is required
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
> =A0 - always depend on dbus
> Changes v1 -> v2:
> =A0 - depend on dbus when depending on systemd
> ---
> =A0package/iwd/iwd.mk | 5 ++---
> =A01 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 002988cf33..5ffbde334e 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -16,9 +16,8 @@ IWD_SELINUX_MODULES =3D networkmanager
> =A0IWD_CONF_OPTS =3D \
> =A0=A0=A0=A0=A0=A0=A0=A0 --disable-manual-pages \
> =A0=A0=A0=A0=A0=A0=A0=A0 --enable-external-ell \
> -=A0=A0=A0=A0=A0=A0 --enable-dbus-policy \
> -=A0=A0=A0=A0=A0=A0 --with-dbus-datadir=3D/usr/share
> -IWD_DEPENDENCIES =3D ell
> +=A0=A0=A0=A0=A0=A0 --enable-dbus-policy
> +IWD_DEPENDENCIES =3D dbus ell
> =A0
> =A0ifeq ($(BR2_PACKAGE_READLINE),y)
> =A0# iwd client depends on readline (GPL-3.0+)
> -- =

> 2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
