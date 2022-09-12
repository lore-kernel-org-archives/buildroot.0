Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE8ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 06:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F3742567;
	Mon, 12 Sep 2022 06:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F3742567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMcZ0cGjSNkU; Mon, 12 Sep 2022 06:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0301042562;
	Mon, 12 Sep 2022 06:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0301042562
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 158F31BF4DB
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 06:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1A7A84425
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 06:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A7A84425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqnLhNYvMQRg for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 06:11:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28CEB84422
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28CEB84422
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 06:11:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDUuGEoUjb4oA4+kMi+oRVM89B+VGuozHColq+kSAugeqC3dsi2vXZFQ0V4XQmpyH/ktZiQMnF6pjUqCx8y8T1Bbo4lDpk4jXGbXnmQqfX82MIUiqj5PV630GdzoAU2aoLiX5O9D36lAH5C5jBbdUtFZjj48dLji9Or0L11EX14dYFIwduxEIe1Z9p2CopuMrld/1QK7YzWLrCWX32RQ7rRrIZoflNXVsieqsRyjhAU5GWtu8tYr/XUVeXS0RoYfB550PW3PYX5jjFmT0COTYmPVKbgZfc+RkWjEbRBV4q+IcciMhWOjVxDCZNTsFpxgUlyyueQHNlfVzlTks6BLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2olhLmuwzhkdlAyCL9BDFQu+it9r0bqVh4Md87KhFnE=;
 b=l6N0GiuCn9eLoHe0IvUoe+323f7SrjUj334eslVEjNzxv0A8K9vRrZXi9haSV7vsfggU70tar8cS7CoXPAUcyWtN+9jCvF7vxs9PkLtTw8+JA0LDt+SwTiq91sT8E+Pq4CxDMkBB6UX/bzju2udRCNjBfuclWmNYJ31LsiJ+ygvU213DJ2U0BBYWNZ0VC8AfNN316wnhWZcy0vM200eMlF8+wtPlNL90zwP+L91Ign/6K/8Ap+VZD/zKQ+WZ3xEuu4eTCIqpL0AW6xlnj2C0SMgGB8UThyRbEfGsaUKMMy5XOltM3JnTA2mcNmvQEURI/gRMJv81sficFYylRDaJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0672.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Mon, 12 Sep
 2022 06:11:00 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:11:00 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 3/4] package/polkit: improve sysv script
Thread-Index: AQHYxm4YvZRfU3mX20KIOU63UGtg8Q==
Date: Mon, 12 Sep 2022 06:11:00 +0000
Message-ID: <VI1P190MB04938CD2B2328F6504FE88B29F449@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0672:EE_
x-ms-office365-filtering-correlation-id: 141a3451-c7fb-45e1-a7d8-08da948590ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FK8lwstcTMmxbj1VFy/f2McPogTuijtPO5yUdG+7NbWXWzjm1DvrF7oEXxgJf6gHkqN4Iesv8P8Royz39zy481lfpwhTy9amprYvPXoLcOIEyIQ/cp5/ND34R/6WU9usKSlPSPKLCMXvED2u3eebgOpCHNsdndZlr8u08lAsXmWTADsyrPNJiS/6m27D+YBU1ZZN6CdZsSRCG4s265VpsmjKfEjo4zYXWzgVdYFN12jJts+PgLxXs56v9QW3hG8ax8pf/6gd5Mr3NgjfhcC8gf6eQX+0RziIFoi/r90LqhPFK4CGPg1HWTOnwdTgmKKyDzHaQ/mmd5cYQfZcAoOwiQk1wCgz2017WX5TpZBET+6j1n+7nfIFgk4F1tmRdng9UHJnj6I8L4mD0tXIIrHcTZCelAQzNVQQTeZntlN0DcSLuoPCmTnFgBXp4dnGiuib8fJI0T8s0AK3wup0iG7M5leNIMKcXcoiLYti2jG4yH7WXo76yOPt2Rvx3olvfPmlEhgxFH6aapYHXR2/t9OActbtG7QhP4zL0RJTH7Buz9RXQUyKab3SEWRofLdTnsGj0+kaj70qe5/9dBCmkhoQ8VAgxMInpCcjpzGBwFh0oBZvAPoWvvwyqfM4Kwd0hDCw08LSCYG7lMLO1lWT4vzdZybW8pyx0IRFJ6pdmJ9WUeB89oXXej2VSsB67oBX+mFPGdcP/RWCp//S5MQESy2/snl1/1CcBixOgz43uRtyGeUAZtn2sz26FUKlw+RXB3Mk6sWe9MrKamHpih21qSxqhg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39830400003)(376002)(346002)(136003)(66446008)(83380400001)(122000001)(52536014)(64756008)(66556008)(66476007)(4326008)(66946007)(2906002)(76116006)(33656002)(5660300002)(38100700002)(7696005)(8676002)(8936002)(55016003)(86362001)(316002)(38070700005)(478600001)(41300700001)(6506007)(71200400001)(9686003)(26005)(186003)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jhRARxbJM7McC24za/yjYcq4NDo0KfxTLhNN0mZL+1gwmIq81kqz9P+LGL?=
 =?iso-8859-1?Q?dpS4+esOC5MVVqplPdEsEb1TyCuXKmAa+SQWY44Kwcy9xQAd1e3ptj78w7?=
 =?iso-8859-1?Q?eiliyJHj948PgDK/LuZ7PtilbbI33W17HfjLxILYnGsczJY0EftomuhcED?=
 =?iso-8859-1?Q?MPGOndScC/SkBgH/1L/WCinUmoXnLz3Sd/nsnEUU8cUq9fVqE7Nk6D5G5x?=
 =?iso-8859-1?Q?fACtLa+cnkF1ba68HO1Qa/pTOS+3YIhNOWWtt4r7R4ArseEpTcTrJpYavM?=
 =?iso-8859-1?Q?C55+6NNbcdlzQCmNX7UjNBM7pMIzuZTzC7e8t3CTpsRwOx5RfArG9V2jP3?=
 =?iso-8859-1?Q?VQlf+8aW7bLDnp7VP6u1J41kT4Y+kSNFFE/u0eAbcbhGXRvfLXcVBEhbRy?=
 =?iso-8859-1?Q?ni4Q3kZ5IKD5cW6RU5DKinwnaStmALenqFrM7o+tENm0766TWwRxGttT9s?=
 =?iso-8859-1?Q?ZCvNNQiJoz2g4Fqno6hAPiwkMzyP/mI0vH1in0TL0kqfaT4a87RSLq+sZN?=
 =?iso-8859-1?Q?LjExw3cgi4GIc6YkFYaRmJogXllfbFZY4P+EEjJltqDER3VZVI0rI4abG1?=
 =?iso-8859-1?Q?ItiYDmftahRSMwKu93x7aF6qJ/wfFh/DKcbA+AWwOMg7JYUGaN0IxwjgAy?=
 =?iso-8859-1?Q?YpmnbVOBFTXwtadOsGf5T8LJ2hUAo9omup538Ut5+3+LEO643/G21ePqJ4?=
 =?iso-8859-1?Q?vlvQMcWdwKWlKG6P6BPotWh48etIR7AiAcj2Z9jM9E8jtX9qNXO1FftAbc?=
 =?iso-8859-1?Q?iXW2t/Bkk5pYAeRdT2ThPgC1M3e8TksqhlOEMdjYqRJgbzWN5MYD0uYys3?=
 =?iso-8859-1?Q?Yq0jwjq9OLZyilFrnLkZkeI7R689AbQz1lP1KMiktIhPo0yF00ARymZSkV?=
 =?iso-8859-1?Q?o7RFvKF5z/ebmDcXIdkjaa9VDYSj2C+t9CHOdZ7M5oMfutrw+fBQ/o8lYX?=
 =?iso-8859-1?Q?ugdFn5bgmBEKOadwifRTyy7p0n/QlRRI0oafIvOwvU4VEDWqke3pmsxuk9?=
 =?iso-8859-1?Q?CvariNsNjQsmZTcWEiDZNC/N68/joaKOLcdgz2qUkBZqJGuNoXC8sIqn4Q?=
 =?iso-8859-1?Q?17G6IZiKjI6pKCjPcS+jo4uOQwhgBMx0MTajp90t7BiWZHO2PzmH0btBpQ?=
 =?iso-8859-1?Q?ievXI17PHhB52/2QPlKASONEu/SnYWFatL/E6TGZ3pKtnAAt6gZnGBAcvH?=
 =?iso-8859-1?Q?3TzdCKtv7Loqg6rBggcebRpVJtZ7s6DbivZ3TGMdBeJs542ruun38P1H0O?=
 =?iso-8859-1?Q?tLWp6VpYnmpmTvnEL1urHMr6elsGl/TDmplvT5ilEx7gQP4IZ9NdlSfFFK?=
 =?iso-8859-1?Q?bg4NNfGYi5J/hQllk21DqugieV1uDzxTzb55IByVt82ZhZDCqOVt2/c5Ih?=
 =?iso-8859-1?Q?CQJU78i/1l27slnjJsVicNOPg2j7QBzViT7EqoiywW/SHEJqfRjnDr60g3?=
 =?iso-8859-1?Q?0SFrseyNjpQygXrXu55wpY4Ucw+zZVFiZRZouwTNbTMlkOVt2VKhEmSa2J?=
 =?iso-8859-1?Q?d+AeoSYkww/YqS/3rxMeuidG9F5JWHP+0RvKJWJeF2wzoJcgM49jnt1koY?=
 =?iso-8859-1?Q?CHW6QlUOJIgnnmDJsqVoN63abWpB3wAHiTKbFaHeDTdxSaVafmPMvjUoNq?=
 =?iso-8859-1?Q?TUp2t86KPjFMU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 141a3451-c7fb-45e1-a7d8-08da948590ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 06:11:00.4920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7XbJJjbxssVp4GujqXWE2nEK+MPV2rX1MYTD8OhiE+DBqHkgo2YNb+jELBGMpcv5w18OyBhtEp4W3bnDkroKJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2olhLmuwzhkdlAyCL9BDFQu+it9r0bqVh4Md87KhFnE=;
 b=zjiMjKASY1uCcCSD325oZeZwVPfA7RQTQgRdba52LQbBzQFtn7zx07HH6UIZhIMe4sMsThCo06MzISFi1Jn9ZDygWJqWse4rdWDoR23Y552sXCWsFyqx6CxBR1qgjFGxJVxt1/v36NJNHZsR/GHAVZgetd9I0tuQ4g7Z4hssUw4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=zjiMjKAS
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 3/4] package/polkit: improve sysv script
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As specified in the manual (18.5 The SNNfoo start script),
the name of the script should reflect the name of the daemon,
which in this case in polkitd.

Also removed the redundant reload case.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
(no changes since v1)
---
 package/polkit/{S50polkit => S50polkitd} | 2 +-
 package/polkit/polkit.mk                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename package/polkit/{S50polkit => S50polkitd} (97%)
 mode change 100755 => 100644

diff --git a/package/polkit/S50polkit b/package/polkit/S50polkitd
old mode 100755
new mode 100644
similarity index 97%
rename from package/polkit/S50polkit
rename to package/polkit/S50polkitd
index f07e2d613b..5810e780a0
--- a/package/polkit/S50polkit
+++ b/package/polkit/S50polkitd
@@ -40,7 +40,7 @@ restart() {
 }
 
 case "$1" in
-	start|stop|restart|reload)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature.
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index a8b371acf8..f94579a149 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -68,8 +68,8 @@ define POLKIT_INSTALL_INIT_SYSTEMD
 endef
 
 define POLKIT_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/polkit/S50polkit \
-		$(TARGET_DIR)/etc/init.d/S50polkit
+	$(INSTALL) -D -m 0755 package/polkit/S50polkitd \
+		$(TARGET_DIR)/etc/init.d/S50polkitd
 endef
 
 $(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
