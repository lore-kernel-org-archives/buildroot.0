Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AA7ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 06:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AF6846B3;
	Mon, 12 Sep 2022 06:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75AF6846B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtF-1cIMD_2J; Mon, 12 Sep 2022 06:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8756984425;
	Mon, 12 Sep 2022 06:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8756984425
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAAA01BF4DB
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 06:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F84742563
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 06:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F84742563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jI3WtkpsLdWi for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 06:10:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92AE42561
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C92AE42561
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 06:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0rXlYRw/TnjeqXg9JplA8pk8nTfPT32EeZMZ9cAluZEb+0gC0fY1LxXtcd63az+bkK6E7sgaowlcnub1oTLm9gYBjy5huqNsLzmiBKGFscTge1J3YHIIJnr2xdehqYKs6JLn88qpMXb5H1nQVhaowOEpZDcXKX8F8mID+NcdtZbrX8yDIz8mexTenkbT96+P57KG/7PgVGrT2xZVeFmLU/dvT1FYNorWjBTnh9aP+fU9OhRro8qppUssR+NACddZJtKaw81PWobN8d/Q0c1TZURvlaLg9hgtv4U9Rkij/6UiPGrLixdDOQ0Fw0ZKi92gs7BvxOAfd9Gt36jFeVpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5MCLEMe0G97dSYaEF6VMugMxF4xZuSwtd96Zc159OE=;
 b=OD8sQaLIP3/cXpw4T+ImXieBQoneorsd11DoLtZpBbuXNf9Rs9e8s2fndDEX/xN1gCkoNl7lv2sLIIcGndhtfr67+2O/GDrhUpvADO/QqYFR+OnbKpkXL/Ztd8EHpz2Jd9tUlFUMLMGRDs2/7JtM92t+Oy6CO2qbQOK3JzBYshSXJriUaAeltwrBiS5XW2EWx18tvG1B7/a15x8FirKiSrTKG6J/wKtVx7zBx2d6g0rp0Sap/bnVp4KtfNn6+hAjwPj+6bzU1/0wBLrDKc+cnh2J0jHjU5jIPs92CYMQnPyy4VLVpb4GgiqmqDyfqbGhPsC64EMqsPyuK1aXdjfQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0672.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:11d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Mon, 12 Sep
 2022 06:10:49 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 06:10:49 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/4] package/makedevs: fix recursive chmod
Thread-Index: AQHYxm26u5NoP0ZT5UiUf6PsEUTXVA==
Date: Mon, 12 Sep 2022 06:10:49 +0000
Message-ID: <VI1P190MB0493EE73057259713E72F57B9F449@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VI1P190MB0672:EE_
x-ms-office365-filtering-correlation-id: ab4522f7-21de-4026-2b23-08da948589f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2YgIVInoXHF2ndDXVOGiEnztz/Y0BG5HmqhbI5JH/8LgpY38paIUsEV8OvChwY9N31C8uv2Ti08tBvwpdljGrYgBpfX8EMTARNg7dZXkTB3aERImfAUDmcyW2zDniDdCODooF43Mr/eSQovQUwQ3SOOg8IMinBh6E903H93D/umbhSJuCYPiawMIyhBftvfDNqBRQIoWaJcCJaXc9QVJvVBmoC7chD3cgs4YdG2x1OEQ4YtA5m2c00snxxnljupxR5NS9+Yug1DbxFdsLm9JUkhb6gs7XvZMqyEWQfcFTY/TLvJRi9ynvnTBQaMO5M69WIAcMPEkF7fxWfz62ArSJAG/PAFcO9dXdl6we3aXQGDydLYQXvZZhPsY7dXRAfO1xguGEpinN98+YL+2ot2jGhW4YCcFMWt0eGmlyCgl2g+Un+H0hmOTvMdS2vorDbuSqeYVVvOcgh/0hQEUKl33falt2RByfBBhPGkIUsetYqz3aE9xS1tQdGzx4TRd5vF/v0RHrPQ9vz8qMTBK0IcF2IWDF+xEE4aXeTqfBr1jhfEbmqOq+Uu6kEki9WuomBgHXoJ99C/ZrCezcZUMGs6/BQxeLC8k16gesAdaNHI7AQZpsJTAEiaLmF2JWdv5M3e+/Lrjoy1jrTHmuWmoI/baQp1r5OUlSa3cAhXXiRlueduYWpayx5ax+euC/xltWbw+a9qbiJ7PNLOXyvyrp2KL3etb6l4vZBJjNBQlOIRl1wgwKjFn4zkv4IIWyFCKOE71eb44TAdVIVWwJnIZiOfw1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39830400003)(376002)(346002)(136003)(66446008)(83380400001)(122000001)(52536014)(64756008)(66556008)(66476007)(4326008)(66946007)(2906002)(76116006)(33656002)(5660300002)(38100700002)(7696005)(8676002)(8936002)(55016003)(86362001)(316002)(38070700005)(478600001)(41300700001)(6506007)(71200400001)(9686003)(26005)(186003)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7q4DsKywMCSaQjG+QZtPKvLdfZmApjm+zeR/6YOPIJ8sbnCgcugC7i046e?=
 =?iso-8859-1?Q?0MzfliXbcVCCISBdQblXjPZzkyu8CsmwN11riuTWk+h0A5zaszgZCAXJ1N?=
 =?iso-8859-1?Q?tMl/X4Q6YFLOE83JzB9THOVZV2hDKI7ln8hIsmkX5G2TZZroa0h5pM7Lc9?=
 =?iso-8859-1?Q?RSrsWPiYB4JFLcnIAoZu/6ni1OkJ2mzjFXQZQWdbAHGN4fibaWjiOwd6s5?=
 =?iso-8859-1?Q?fOr6o1+e8jaLQKDhWTBcsrph5jKjqN4zmCRoTmccuetjzEzsDc5MsRQYDS?=
 =?iso-8859-1?Q?2qyEORUUeLyqmwkJslEw3oJqQzwZSWexazPwM32CcoXw6vk1BreJt6GLmY?=
 =?iso-8859-1?Q?CEvHsu2dimpFk4gU60AA4xRJIhAYW38THUHKaJooYXaA1OzWRqUgzPQHcF?=
 =?iso-8859-1?Q?jlpnRUlrw0o3IyuKot5LG/w45AsfgC3x5655saNN4V1AMHpWoBmrI390F8?=
 =?iso-8859-1?Q?fbuBTLlF+NKW3Dum/+WAAzPxznRkRTn2UIfQtQEUfWEAMAWIsGZ0cayPnv?=
 =?iso-8859-1?Q?STNMRduYnLtfHcmqP82j8cVa46KIygXTfk2C8ofmxSltgWtUbmUbnsGpAl?=
 =?iso-8859-1?Q?gEl3KKZkpxpLbKHUEs0fPk1iVvAlmgvscQLRT8LEzvPhBzKwG3yLnIfF/R?=
 =?iso-8859-1?Q?fEt2T4erXVmq/9+2LIjHNzrP/KG+wfn4THIL6KW6mewHgaMQ3yl8tCFoCH?=
 =?iso-8859-1?Q?v+T+mrWnmqfiV+V/WXQZGAPc95Ll44bp0uslw/dTUz9uJyb5LZpT4oDytJ?=
 =?iso-8859-1?Q?30aJmUIXsIsxzfiPBGSLrXvHcVM2Xmi7YAE3R7NNquy3blD6bgoYB34AnZ?=
 =?iso-8859-1?Q?9kBlEZVb6ViKMNVa4oC8WhFjUGU+oKh/yW9BIOu2TYfua0UatsdLLBpKt7?=
 =?iso-8859-1?Q?jioS3k7dBEfwu0478AlmMSjnUc0doKMWX2uCyGJnO86Mo5HUzyL/27Oa03?=
 =?iso-8859-1?Q?6QW1nrM5GPtrPdV3RK5sFnYEb44dWNR1PoYZX5WXdG+K+hZPJqp9NsC1+C?=
 =?iso-8859-1?Q?SZ4794XFVE1dO/MBoG6G1pyKPTzVo0bxLU9ziEHXD7wU1Z848sq7xqEmpN?=
 =?iso-8859-1?Q?MVLZ10mOvhiJWTX+23qud0T66iMuLZccyfzut+RSsAOkWxaaRBEiE9VGd/?=
 =?iso-8859-1?Q?jUPeDyH3oznRMPGzMBnvdlzYK22JDEMeETmqNDgqxN/g4t0E7PDdV6P8xa?=
 =?iso-8859-1?Q?tIAi3G9iv7dhKgu193HDZa6d4gaOBb7BYYUX3XJHKtxMuYzOzvd4xP/eZ9?=
 =?iso-8859-1?Q?3KgwQDC1RreWiBx27gs4+PzFpoqUdq9mFJeV3wlonH2qLYscmgeXejRkf+?=
 =?iso-8859-1?Q?l6D28gZ1u6mM7qHMGJq1fBdicGwwV1u0pdXZ7N8T5C+6dYJtAJd10SFkWs?=
 =?iso-8859-1?Q?8VpPvkuVJttls7jEBqd73qinkWdm3GoihAxbjPSRivhxSLClDPyxKyvnXW?=
 =?iso-8859-1?Q?1TEbHkgOA01AYbm+ce7Y4Slhws35Cl3tJFrGgJ8VyGU7uCs5ASXN76pHYO?=
 =?iso-8859-1?Q?8bojnsQexr0yZo4LTV8035uR5Q9rw9YFHJPOeJVA7I5iIDmHujDAZCjb0E?=
 =?iso-8859-1?Q?PCP1NpUP80QQT4f3z810RtRumfQw+hrjLc9QkPpEiWcgnf+auWQhzdEo11?=
 =?iso-8859-1?Q?0y8d+dlALIN9w=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4522f7-21de-4026-2b23-08da948589f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 06:10:49.2272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PKqp012U1wnzPDzw1IPn1Cgr1w2/A3icVQnFcKVOR/x8IRIxd3EMTy/XzTuZlD2CAVYA7RzQOgzZmfUn2Gfo7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5MCLEMe0G97dSYaEF6VMugMxF4xZuSwtd96Zc159OE=;
 b=i4N4Kt9WBwoSvpVqJ1+Gb0PpUbJgl9fL5l+x2lLrW1cxbj+mlBwqYqruUvCNSOb8wHsrC/ICpIP16eT8HGhzZPUDfH+iV7aAvXI3FO39sH0KJU2t4Py7atVcn1jQR2BwjrrZ/CAh45BkF9U/iEzMBc/3YhNee5j6CZopv6Bjibg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=i4N4Kt9W
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2 1/4] package/makedevs: fix recursive chmod
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The logic implemented in e745c0b to stop makedevs from recursively running
chmod() on dangling symlinks excluded everything that isn't a symlink.
Other file types or directories are skipped/ignored.

Logic has been updated to exit the function if mode shouldn't be changed
or if path is a dangling symlink.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
Changes v1 -> v2:
  - Integrated into the polkit patch series, since the changes are needed
    for the polkit tests.
---
 package/makedevs/makedevs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 2796cd5e78..a5c9c7d64d 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -446,11 +446,12 @@ int bb_recursive(const char *fpath, const struct stat *sb,
 	}
 
 	/* chmod() is optional, also skip if dangling symlink */
-	if (recursive_mode != -1 && tflag == FTW_SL && access(fpath, F_OK)) {
-		if (chmod(fpath, recursive_mode) < 0) {
-			bb_perror_msg("chmod failed for %s", fpath);
-			return -1;
-		}
+	if (recursive_mode == -1 || (tflag == FTW_SL && !access(fpath, F_OK)))
+		return 0;
+
+	if (chmod(fpath, recursive_mode) < 0) {
+		bb_perror_msg("chmod failed for %s", fpath);
+		return -1;
 	}
 
 	return 0;
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
