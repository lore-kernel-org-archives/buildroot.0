Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EF2C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F022610D6;
	Thu, 19 Jan 2023 10:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F022610D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXIgeg9Gxu1o; Thu, 19 Jan 2023 10:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6165E60A46;
	Thu, 19 Jan 2023 10:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6165E60A46
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5731BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36DDB822BB
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36DDB822BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tb9padIgVEEn for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:11:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06600822C2
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2046.outbound.protection.outlook.com [40.107.6.46])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06600822C2
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAeL75lVgDIEyGbRt9QWYHrThiaxJElubvQKcpkILPG67uC8/bRBvPRK7FkSG4nBbo4QwQZLiT9wpXr20Y34cNEiB6sAlL4+e81gJDk4hb/gc04QG2DjnsHKuuw2Ov+gvSPlDePZ1x+8zvHBckirEmBqcaaIqWdFhPUtqGsFbTjs09+r3ScUKqa4Yf3DD9YAtnfsCkiSu/J6cTm6kRpcYw3CYjn+1OIPdYlk7RDfkHpFkxUJ1Bu7BXwVBHO1LfJS+yEjCIW37TVKY0tLwopLNd8mallbSLUtUXbZe4M1KsYeDi+ix3R6xfll2OegsyPcwe9f7GNzynH4lRuKLjz7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHot7ITYUxqcSt2YEzSpGLbeQ+w4jSPJ64AoeDpkRaw=;
 b=iTlRi7C1zmmPn7EjtwVQ4m88KjMd23GFzRhUyG+2qt+OlyOx0H4QFtabgUnvcnw4zNgA18KpI47qgSoapxt6NzeSKgXp94ML0xr9tXdSKl8nNvi25SlW/p94HOTKYazKdEAKcJ1nN5Gb1Zk/bBTTAZWrcy7avKH7/1sYpbTbKHrC/pvpBvPavzrGSElFiGw1EUULQ3mwCzdMFjS4wtiwXJ5j8VLtszZ7DKkVbn/0aKfdEXK1IJwcIeFnWEpst9B2Xr8riAeW6PoCyhU5+MKqFRyjd9RIchWPtWhv59a0SNulQdAX4qkB8OOfc7/GFVTDHoVI5D9yPqV5Q8OtGoXo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0616.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 10:11:05 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:11:05 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 29/45] package/libgtk3: switch to https download
Thread-Index: AQHZK+zKxy2n4texfUyHfZOlTN/CAQ==
Date: Thu, 19 Jan 2023 10:11:05 +0000
Message-ID: <VI1P190MB0493EC5E0715B1FB907F78539FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0616:EE_
x-ms-office365-filtering-correlation-id: bf1845d4-2cd2-46e3-f2b2-08dafa0579de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zHLotJPrEYzIMR30X2dNR87Llv6mcJNtE61LTN46TR77kGEaZR4PHd1EkAPPt7Fy046eWDgWnviTeRm6oaemwKvzL3rmdbnGPz+VB70l3SJzSFx+4epMhfAY81l4gdbSm7/MPc9+2GPBVD+HnHXB0cYvCs8QlXC6lKAzeO7Nhxsm5RoT2SQilPh/JSfoQounoPL2iu1evuRNVqCAunTTM64rCoxIQPK/HoShR9Y2dJWW5V3pvlE9Oxqr3XMbxYZY97yyEt14OWEyBNdM+vRVDUAKYCKwtD3al564w15q9AKECGPG8obug0XUjnM9e8zrFNrf8HHl0Swo1C1JLciJEfHm4mDlkFijrSC32QLM77Ws3xgrkUf27WDxP2MMgAWJQ4kmWqMRuInUqaSF/FloVmg2qYLRqUCVxK5J46ku0I3a0Tp2W2kTJaE5C4j+IH9buthgSvp2mmeixeP3WQZ79zDN3H53l8zp4MdYYAIXcYis9edFB1czvg9og+fwJPJTmphioV3pywssGU+ljKvz/hjx6wIBc6mYK+Kfjd0nv0CSgbXbie6y2+TN6zX7mBW4fwjI7GWExuR+WUYsGTR1vz7LTQQAMVshtVTKHE8bA/criVHSqH/8ZeszaawyOIxjfR3rhU8PZ/PmZXiagDtm9sBTQ5YnuaAzUxeBwhW+JoxH+3t0zzAFEBHu9AnqVLd9zg3oNRae3Ns+1xmrX8phI9/5Tbd267RcW4B6TwvUuJ4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(451199015)(66946007)(64756008)(6916009)(33656002)(76116006)(66476007)(26005)(4326008)(9686003)(41300700001)(8676002)(66446008)(186003)(86362001)(66556008)(5660300002)(38100700002)(8936002)(52536014)(55016003)(316002)(83380400001)(6506007)(478600001)(7696005)(2906002)(966005)(71200400001)(38070700005)(122000001)(4744005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bRnWj5gPhn3fnZoVm5X+c/lSs6gvlGaRA3tptCa1SZ9y/Tef/CdwTiphk4?=
 =?iso-8859-1?Q?ZyaYmptFI77+RqRpgUziRmlas6Umzp4TRQ+1t2CRN7HA7WX24AalHG1Fc+?=
 =?iso-8859-1?Q?KK1cYA44Us+RCJGQhvgRCL2nK40NDsOvQiSpdLHCLijgohvN9NpOaGldja?=
 =?iso-8859-1?Q?DHzZJmaPQAios2o6EzgW5k71ENRZP0CEogvIMVZo8tNOmu7XMd/mBzbLnd?=
 =?iso-8859-1?Q?l5e+8IkDFqhhTcgaQg3dLPrMQNg3Qhy9AGwkcNyixeoLVKaE3BwBl4Blnz?=
 =?iso-8859-1?Q?6aUEa7/+4unjGYlT64eU2PuBZwCK2C1kGOgxgwr0Qf0upQvVqA1aUScA+b?=
 =?iso-8859-1?Q?3ecxsQLqwEhZ4kabGDhTwfbd88tmTNV0e97ilOzA8jWoOm5S9U7bjfku/u?=
 =?iso-8859-1?Q?hL/scBd5mkNpzVEcAfmYmWVAxo7J+7O5eVXImyf9EfB/zlSaze5JAdSjgu?=
 =?iso-8859-1?Q?gaiRBmubuIdUpKtkhwmWr+XN7SoTu2ecdgNDmSbSv7YNphhnKwVrs7hDVk?=
 =?iso-8859-1?Q?UfgOreiCkwnTdK0s5dJjTHpR0/i3k1fOb7hdwDSzJgX/+xvOCDcbQMJbEw?=
 =?iso-8859-1?Q?k979WtUO9gfAS6kllzgFcoJt9nIJSFUebjl2dqp+U8gVRHiuGvimuHkbus?=
 =?iso-8859-1?Q?elGFk9QRWbuft4TzhZHq79s0ZMx66SVgMjTNS1jwfW2uHh/+Gw9HZzNnxz?=
 =?iso-8859-1?Q?NTGhBIqiSTLVpw/vixzBy28qrFRWrHJaS5XeEbI6ilAcGkTTprdoHmhyw9?=
 =?iso-8859-1?Q?y4EoEk4hfhlO3xHG215WcPA5fZYrc0VeY+f/fWnOq1tG1NUbrgPQF+t3ed?=
 =?iso-8859-1?Q?u+WUe6iWtKUdIF0WdVaypsfRVcpF2/iVPp5vanqTa/COH70YrMwXbQ0dRy?=
 =?iso-8859-1?Q?xTnWIvUrfKIWJRjfoaWJQTH4Guo0myrsJ+FKrnYNPx/cTD0b4FmzAxr+P7?=
 =?iso-8859-1?Q?GJnKY8YqUz3i6X7PMt045saJ3boKlg7EDsnFoe6BGVhUuXlsP778FWUeOf?=
 =?iso-8859-1?Q?9qcvahAUeyJ8QL+z0vXQfuAznvsDc1Pd/Hi3GfIkvEJIpoMTbjFNI1GHJ1?=
 =?iso-8859-1?Q?f0kF5h/GMKEHf9P+s+NTkE0HLNfjl6oxDZK4bGkj2P551Jc61RrHa8vr0Q?=
 =?iso-8859-1?Q?rVBRMaGQamuBA9/JZ9oPV1KqZrO1N1E98kSSUssSARLTWKBfB3NGogdirP?=
 =?iso-8859-1?Q?dqIFmo2zD8J7Nur7FLx0ZykZnv1DPDQr3mab5btcQ1kBZ3S9SltFgJNM6S?=
 =?iso-8859-1?Q?wZGeE15EUomkmShY6Hb9XF2Va6R4PQF/4bZGHfKO7qzvWFP3WId8cx+t2c?=
 =?iso-8859-1?Q?xcoTN7mH7vUpA9S+ryLzQktEMl8hGhnjuMCtlkPS9rYWZ6xBC/GvdIdJ/v?=
 =?iso-8859-1?Q?CKHEzlEuUNTxkhsiX5hHsubjE0Qrx+QFOdFJNr3VZg0jh+WyZES98hywO4?=
 =?iso-8859-1?Q?/K3gBP/Al+Z0C0gep5AZQcipvbI03Pvu92RPfYZpaIOfyS9SfJM38me8gc?=
 =?iso-8859-1?Q?h4C2zqRNaVWQeRac/VcxpYqwxii02BMW8vcJNvd5Cp0YGzOShr+VEDbdI/?=
 =?iso-8859-1?Q?bGzwSVPjcWSiiIxysunYCg5dfOxP5TjmxVPJ+W0VwjpkRohaBQVVDCSNbQ?=
 =?iso-8859-1?Q?PAHUy6hUybIXM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bf1845d4-2cd2-46e3-f2b2-08dafa0579de
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:11:05.2312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uj24fEbuVTfYyiAczo7sAAn3EBBD2onBn9WPaiEE+FpjxYG8jXVd7+43hp062tzqrkC9UVhbRURHtmG0ukotiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHot7ITYUxqcSt2YEzSpGLbeQ+w4jSPJ64AoeDpkRaw=;
 b=MgRASl5rav5ZnF1YdDtm74Lk4ztGF4SRKHfsxH9LgDQsFut4MwL2dfGZknBiXlD89HDOwjXuFd+4llpzAHE2PF6634DGfc+MYmM2sHTk2fMVs3XieKPmkUCmC0hclaestOyuBgJsy9RdGjk9mxtNu82jmTt8SB7y1jUTbRF7Gao=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=MgRASl5r
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 29/45] package/libgtk3: switch to https download
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libgtk3/libgtk3.mk                    |   2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index f277fce2ed..4c93413fb2 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -7,7 +7,7 @@
 LIBGTK3_VERSION_MAJOR = 3.24
 LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).35
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
-LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
+LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
 LIBGTK3_LICENSE_FILES = COPYING
 LIBGTK3_CPE_ID_VENDOR = gnome
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
