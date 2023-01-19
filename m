Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BC5C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 227F7408DD;
	Thu, 19 Jan 2023 10:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 227F7408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqmMrZUW3Ty6; Thu, 19 Jan 2023 10:13:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CF94035F;
	Thu, 19 Jan 2023 10:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92CF94035F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 955081BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70C8C610E3
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70C8C610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBDgxvohilDa for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:13:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72CA8610D2
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2071.outbound.protection.outlook.com [40.107.13.71])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72CA8610D2
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnGc7Oz6o34726iXlmfTKnvSa9FyudKDGcBEySmGYrpgqDvujT6Y2Ud18kvi+XFD4KDRqbQ7XjB9vMVlloGXUolJrw7A73d/8J611CbFVmMnWmWXpxQMnAUZjSO5qcPeLrA0+WsAMdzM5fs6pVA8cPRAASgSjNcLm0g0icopVSEVMBHisJjIwRZvkYzWkj1xAf5PkRTzrrT7hB3Kd+HRB0v/LFwZevojTwDB32xShzWxnG0OUo8HqzERck4i6imCP5mdU31UMUwNLXOPDwpG5BETXzAx+F75FygEE9vMh6SyXSLUqOVgFTJIgdhfTctqwTQjxQjjxszvoc/DaPwPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar9bklr8sPzLh5cozHfmJ16ECMsEDRjYcC+KpHyTVc0=;
 b=dBOZsJ6Wzf2cUQ7cGgAPelXajZ3xVwtwBShdILFABNcybYSr0CuzUgD3w5/+T23bj/XPNzfolO+hWQdYaZMa6WY7pYFp7ATZ4Us6+XLxHujTQUMPuodGdBSKlfGNH36zr2kT/40BO73NEOGOcImOsYPcARk5p6xbMsJrYAsSKqwJpJ8TJrDz+tL2wcyEmJ4HhUzlZRSRt2iZfJRA3u8LMbVb6rttc3+r6ur2mAzJ0snS6WZb1zwTJf+e3cscxJGjFnFWzlwQdjahDr7N9ByVxv04GhDJuICBfra2jl9PgjVfXrqUDbS1xxVz2NDm/5fhJNxVm2uxx2sxZdNAb29zwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM8P190MB0801.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:13:32 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:13:32 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 34/45] package/libsecret: switch to https download
Thread-Index: AQHZK+2MkpdkmdI9VkeNGvUD/ly0Hg==
Date: Thu, 19 Jan 2023 10:13:32 +0000
Message-ID: <VI1P190MB0493972115370148D1D25A7D9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM8P190MB0801:EE_
x-ms-office365-filtering-correlation-id: 5fb183d5-62f5-43b4-8047-08dafa05d161
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1G8bP/gQMjjtB6iE3z/aUiQMxuhcyn2vIylxuaUywZl1NaDQh5Yha2GGHQatmQnqO/dctjWpx419WhLanl4By4fncbEYnU0A4EXTC/c8SsBlnOTW+g4VQFNCkW5AQqpg4s/5EFny2zORJ1ZignHydB57CxalFm+JuRafdnr90D4e8IcVnG8MFVVhJ3OPoHCXxU+p0bH0mbfRHxahiAjC2ln0ZrNeXqOYsRb/fAgtzHRemm1pmATQzqCJvXRvKiO9EKydytk6P0tEXbniK+Fbmpg82gUUVDWMAkmpNxKEeBn00R0JIM4dA0gr65U35VoSfcw9hf/Y0Jark7fDuVJ1LMcGlmZFq8eFVnI3T89plKlVZErCObTawlpwT2ZhqpQrSDobanPLmkxm5T0dog2bpGnY90x7DjujTOoeF7jbhAPjjCEnkhPNhjfTW+UhV1HQ3/Sco5uEHypRwcyEkBgrDNPtYeYnyI/Q6MM/oEK55uu9E8odFFAPmB2uo+e073uFyjq/uo54AWNnhk/zTENXkTXLuRTXWqmuBNDjE4kzDOyNIPf1UBBrZCBH+nEjgjhFdAGb8d0lx6wjv+XD+wpJuwFx+d1P0l3WtL+fR7qQd19xvM7OfA+z6NnmBPhGpNeQphKfSXoNhELqqsbEsjpfo/3C8JWOCnubCBFxTu3TfMd1d7XDNs6LN8M6zApeidGwr5Q3avM+g5PTm+vhF5ghgVWHxiaS66Ls75tjKQZ9BSU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199015)(38070700005)(6506007)(33656002)(86362001)(55016003)(66946007)(52536014)(66556008)(5660300002)(8936002)(66476007)(2906002)(122000001)(76116006)(4744005)(38100700002)(316002)(64756008)(966005)(71200400001)(7696005)(478600001)(6916009)(41300700001)(8676002)(66446008)(186003)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EK421QADD/qT8MjA7eWMqvbeC544kq5GNbD1TrGn5SoPKR/Bgr27wnsvNu?=
 =?iso-8859-1?Q?OEHqpKUSacuEn6sBgKS70pZCGamMApfKG165lHHna58hjzlwMkK0jDapKh?=
 =?iso-8859-1?Q?gHHPiSubm01x6uUn0qm3NSLYeCpa7rp5wdPUPAlBuUFuUwwNUbYSGrcw3I?=
 =?iso-8859-1?Q?jgUSUAYZOXEN5xL4QQ63LE+R0FM5xu+xjN0TSZTo5Q8IM6Fwapqk1ryul8?=
 =?iso-8859-1?Q?yKtQBG0Lu1QJDxhVyXW1RfOyx+IwoqkgPJW8JalHAwBqDfua3AmGpEdcsk?=
 =?iso-8859-1?Q?CXCsX7YQvZjRhCblvNy+TRFeeZCqSTLji8aDvbAyQskc3TpATlnuHU7xE/?=
 =?iso-8859-1?Q?Uz1kWkRIZWAWv2GK9CL5nmhX0VNHBbogcjKZa/PZHueSOUyOs1I+PbFoBH?=
 =?iso-8859-1?Q?AHUiGrpQUgvYmvSJSKmnVMqzKFqheYhDreOY2hDvEJP3qq6dWjhs4WN+kU?=
 =?iso-8859-1?Q?DaY/YE9u4XbOepvVTTiMFXZWCTSGgL4KX61/RL4jH36IknI8SdDp4BYUfi?=
 =?iso-8859-1?Q?ViJ8u9+hQE59BbuFcf6Vx9laqcBe9i1OuaYpDmiMWB72zgralBVXMNK1NV?=
 =?iso-8859-1?Q?Kb38DiGvn3QhLFPqXMOzHLCnBok5b2z+mE7lxzRd2ZYgVMWKo2/SprSfTS?=
 =?iso-8859-1?Q?s8NiggeTaL2nH2TfWvHU0htkSFBl10EbJ30ZAfrUIikW9/pIv1ovpVbYxc?=
 =?iso-8859-1?Q?ONsuurkKVmD+mGrZiIX7uDBuSVuaqUbmdrMZGDBAwH5OFnDBLeDiNIb2Jy?=
 =?iso-8859-1?Q?tYZRgs4zlipfreNMlBIwicF3ITB6OcYBuEHHQxnmw3xoojSPHNmbRNQhV3?=
 =?iso-8859-1?Q?+7LqKsuND1In3PkFXwK11lUZsqwvqmkcAJxN6eR4xDGz6RJ6eHFknEVhz7?=
 =?iso-8859-1?Q?lfn/MkiP5yksxMLbzPz6QiEY5FyCiC0Aqtw2EJOELzh2sra3rYR/Mbw+OA?=
 =?iso-8859-1?Q?NdnrHdyMtx2l47mOWsceOWzctp+gY7nKwvE2KKiN5Y6OLLLj0ceUoIugd2?=
 =?iso-8859-1?Q?ZPWpJ2LkGh1QIA4UrvRlC7kzI7gG1jviUJedMk892ESKw6JvieQjttk+WM?=
 =?iso-8859-1?Q?CeRVoAI6Dt/tvOnT+2pmpz8zph/Ekx1atsprjoYuHtLIRxSGA+sdIOiUZS?=
 =?iso-8859-1?Q?Mmtmt54xD5NgOuferQ9SLXHC2doo4G5yeyx1hTmEBzy4Cz6haekxTYzUhH?=
 =?iso-8859-1?Q?IOXAqf0JX8L0w3J1rOsVkK9PGWzAzI6ORfkPNuovvSp1Iz7A1CCJN8WIgW?=
 =?iso-8859-1?Q?NA9XYNCwLoZBR4b9GmaIUMOwWS86No6Spi9OC+AjrWd0DfSXQ/Au8UX1/D?=
 =?iso-8859-1?Q?zMkKopJuJ7D0flZU5AcSIBkKovE5UiER/kzCd/Zex/vSiWbtCVIhzI789y?=
 =?iso-8859-1?Q?2atEEeTM2BLk1XV/fPJPScyoFh7YVWbyKmbBUb7VUjBbKtkC2zDt5HTzRB?=
 =?iso-8859-1?Q?3569Lfwfv65kVjvael82GOs7fSAlOnmc4Wxp0YGK63GrIo3+S/UXF0gZOD?=
 =?iso-8859-1?Q?wYRF6+wx+1C2nbWxbwIvRWxwMSmxe8V/W9E2HP94MJOa3ErVGLo8up6Wox?=
 =?iso-8859-1?Q?wZWXZLzpoQw+8dlDh0asiqFbu31TECmbOG2Ag/+JacJp6LZ0Ko1gDzyWt0?=
 =?iso-8859-1?Q?vjqUcKUJ6hYOE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb183d5-62f5-43b4-8047-08dafa05d161
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:13:32.0642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0o+4ZGXw0AhePaA8FTTJGNuYgTxiy+2E/ejnGAhIil4haryHApJJpypDWE38TW1dgq6+/ISX3RdoKz1tkAdqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0801
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar9bklr8sPzLh5cozHfmJ16ECMsEDRjYcC+KpHyTVc0=;
 b=YbPO6FjPkPNVO5BKncBFNV44ztgyp/Kim8zX5r0zb7jpRrh7ksn8MyQDUDz4ViX6fU1UkZBhB3INrfvKXXUgpG/62rkgsGeowspAq9f0VaAz+7DmBD/cHoMFV3jENwt2NNu/Qu6EkC1AontxftjBXIMy4jVXqhAcd0K70C6btt0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=YbPO6FjP
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 34/45] package/libsecret: switch to https
 download
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

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
=A0package/libsecret/libsecret.mk | 2 +-
=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index 82fe38ac1a..e98c66131e 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -6,7 +6,7 @@
=A0
=A0LIBSECRET_VERSION_MAJOR =3D 0.20
=A0LIBSECRET_VERSION =3D $(LIBSECRET_VERSION_MAJOR).5
-LIBSECRET_SITE =3D http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBS=
ECRET_VERSION_MAJOR)
+LIBSECRET_SITE =3D https://download.gnome.org/sources/libsecret/$(LIBSECRE=
T_VERSION_MAJOR)
=A0LIBSECRET_SOURCE =3D libsecret-$(LIBSECRET_VERSION).tar.xz
=A0LIBSECRET_INSTALL_STAGING =3D YES
=A0LIBSECRET_DEPENDENCIES =3D libglib2 $(TARGET_NLS_DEPENDENCIES)
-- =

2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
