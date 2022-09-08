Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE198C38145
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 11:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20F5B415A1;
	Thu,  8 Sep 2022 11:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20F5B415A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yA9VQa-ZdCxh; Thu,  8 Sep 2022 11:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B24544159F;
	Thu,  8 Sep 2022 11:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B24544159F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0851BF48B
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 11:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5377440A0D
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 11:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5377440A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wvki3mve7lE for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 11:20:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6A6B40167
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6A6B40167
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 11:20:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyjeHPtTTqf+0/BZ4qT3wzg9jGl0Hpb4vcV4UJEuwn6TiqU0CSohGgOfJvfRcBDV4hHXv/PGEAkBkqChZssuvPn3cproEMeJw0LH/Z37TDuesx6jQhxNqwZt99Cx/h4adhNAcOBQ6RzmC16tw7RdsCcupIqYQhstuAbPqaJLJXwG8qKXpv3QF+DB+fgQsza09+kdV8G/L4ecyN0pbIfnq6kOLw3VEWWl6M4eeI2gAeuAAyCj7je7EuIVEFOb4KSm5IiMiH/w32e+eOU/HxUYo70EjSOO1hpI7dgGsgkOA03xjHFlD2LCkhx+1sJUUCcdpHPJo4fl08k3/yzQNnZ9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Z3cmn5nGcBt1P3j5KtvrDUs/WBL+KALoHvGwngF0Gk=;
 b=nCzYjeKhyTk4YdqsAKz4I5HBYpB9SvhSxXO8rHkvcuMnw0WQhjIaUGdV8NB0TE44co9rvxT1ToDGIT/59I1SdLR+n7MaoUbSgauW21t9b+9Y4HoYQOLXI5pRhnfnp680T9NWx+DajGB9OVH49eCHOHNxhaPRaydveQmuKA+pX/GwmgLooIS9oBtEMzMrPlYH2SZnFT/pgevSkuiMAKc4y8TM5nYSye+4VK61DoNRwUTXnpoL79q77gD4bNYnwvsse7aaPI3T1AvTKN1vXb+HArCGXr5wQa3f1y0NeK8pge1N/tp21hQpi8Yuz5Zx6od6T5hgPgMxi2vz+FeMdKSG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by GVXP190MB2016.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 11:20:43 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 11:20:42 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/makedevs: fix recursive chmod
Thread-Index: AQHYw3SdjHiqcy2gJUmRaJMxm5f2yw==
Date: Thu, 8 Sep 2022 11:20:42 +0000
Message-ID: <VI1P190MB0493629D882E578ED60133919F409@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|GVXP190MB2016:EE_
x-ms-office365-filtering-correlation-id: ee4cdbbc-afbd-47d5-2932-08da918c2afd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Anym0m4cqCK+JMjgb3WU8MkRBgiTHgH2TgPKOUMTH7ovxAZW+uXOBNkJ6g4S0aJCwoz65Ly+NVGsnbuw2l7bjYrENFw/jGXm40nPE4yEiVtZw7tFy6HtE5C2jBhB1r5107FQDcsU0uE60q3SOCTvsp1NbWI1fKJesH1JSX8ASXGaQHTzbU7RPwirUdc2FSo5Rub9lrZ5YwX5LwtnVEwe3+oHprpIIDuI95PIG/mcKYvc6InGCiIBD2CLuBUZLXzX8T7vZ+AUUvc8lj2Tm922xh7u7CaSCT/PYVu8O/z9psVor0Yaj/6m2j/nIzrd+exc7uwUfqJ0n5MTCUHYhB42RLY4Dafe80LlOKg3EzIDBIlrcT/vqjHbOOt6Klhh4pTo+wx18Le3swaO6MXYfNhffU2hwT5ajH2Jwvv+36dbCOurHq7JBZU76GBjQ/cPeV5ll6SeFKnvOk3Wo7fs8mwIuAGsn5Icyw0TUp9o8kvHCqKdD4abH/CDENCeuEAOvLd+ENx5/6s/wDSWxrGbHq/AUhZpeOOpW9Y5UHt+6RJVZ4bsN/JXfyJR9J2PDGlCAVKyp7LTGPFgALm/ek0G2r/7iY1kFaUqoFyrHFlOVGrqdqib39IoeM2/44Bji7C3deSHt1hhGRx8IjxSBRNGX+3sTCzP8/C9KYdrihM/y0PEbHG1S9wHkyEqagkejZhvEHLaM1XrkaYScc4f4QWlNk7r86EMu6yRntnJrDEfeFVGT0b4ZFJQ1RTpnV/WlBmVG3NGq0oiVc8sVGvYJKgXI0CUTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(136003)(346002)(39840400004)(376002)(9686003)(7696005)(86362001)(6506007)(41300700001)(316002)(478600001)(186003)(6916009)(71200400001)(122000001)(38100700002)(26005)(66946007)(83380400001)(76116006)(38070700005)(66476007)(2906002)(8936002)(66446008)(66556008)(64756008)(33656002)(4326008)(55016003)(8676002)(52536014)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7vxP7TOkas9KuJOcRDdnO3kTK9s4xegsd5jsCI1bBWl7IN0+rk1KfIr2Z7?=
 =?iso-8859-1?Q?U9yarX4mm6scZU7gu5LmhBUkh8ycNcWp9hk8yE1K0Cf1+FjVPu7JDWxON8?=
 =?iso-8859-1?Q?KBKmL8No+ErsdBKEwv6fgAzS2TLT/1SgAdOQ27u1J+kITTygaVA6Ru5z/G?=
 =?iso-8859-1?Q?Lv1quXUqW1Flu/AKSwk33v45WyuTaz6hsDaMB/CfRW/1UPLbn3Tk+ViyvD?=
 =?iso-8859-1?Q?snVGk+HJIouVWf5uqI8QyjCZyOIsCyGTAjd2X5htk9Rk/ZqiP9gZnP022i?=
 =?iso-8859-1?Q?swjp4MZnpbkYU/LCeXm1F/N0h2awViQ5CQ/5QbhnpbYUWlaM11Wzdb2eE5?=
 =?iso-8859-1?Q?SEM59V6VxENmuVeqz33k72kXZScp5Ug1rPVfhz8f8tXHIt0DWAGS9uKjrC?=
 =?iso-8859-1?Q?psii8nZQMguqD/e0A3GLgnNV4EwzSiREx4ldm5WTEUDxsJIYuOI9NDVgC0?=
 =?iso-8859-1?Q?BsPUPOwPHZQHHI7tHombV3+ic4449vs55IiMyakrc4MjRQYFcfhpcdTlLx?=
 =?iso-8859-1?Q?3sR1EGwmmR0KYMefgbrkUY1crFaZlp+RlYb8hWKuCh6fshBNnRxr/K359/?=
 =?iso-8859-1?Q?j8nzElTDsKGkBXA90qpcag0Wpiwxui5I6rwM6GdTtCSoegQX9L/GG9ZnGL?=
 =?iso-8859-1?Q?AW0hwYka/wdVJs9gctpWuTSCYk8E9b16wX8KFuTW5CQKxca8JnyeIfwtNW?=
 =?iso-8859-1?Q?EUGkHUdh7Zag9PiGDnmiZ06MDspci5E+qZ0otbYTZslWE78QzZkUC5CORI?=
 =?iso-8859-1?Q?DhBI9UaA2mpCm0HNu/T5eQgciWgZ6MsWGsaMCg+OXTy/rKWuTzDMenZ5N1?=
 =?iso-8859-1?Q?HS7vJYx8dnuXOgKWTEdTDA7V6pK9h8L/UykHaPsqm3eJ9fkvxaLTGHKPtw?=
 =?iso-8859-1?Q?uS2JTQIXpmlDoHnvf1w3p9lNbd69rlM7Bpp/d6qYBJM6C7qXw/2belAUnp?=
 =?iso-8859-1?Q?UrWewohd9Xk7/MlDHipelHVvUliWv35biL052U8PQExt7g5ZnXCGCqVkpQ?=
 =?iso-8859-1?Q?F/CyBgh+GXPFz4eUJfddWrzwpeSwAzqyYFoBPnYZDcz5yeJWrqjgO7AA5p?=
 =?iso-8859-1?Q?n0OGqdftcWRecXrA71hMe79CwG0192/HZ4+GP35eslFgmN8jKwla7l8V/i?=
 =?iso-8859-1?Q?DstbmfLgZSzv2IBHEFNhpXQ3yJSeR3n2zWUDbm+JdfvjDYD7rphHnNgQxJ?=
 =?iso-8859-1?Q?JngiAdmRE2MTgsshBvPxqUl7ASjUbYYBUZ5OZDWCv/QOcYdnlIdHVWOxya?=
 =?iso-8859-1?Q?ihKYUAMpUnEfx5uYnldIfaJ+EjpVptQfJfna40B0byCMruQLP2raQ4a7VB?=
 =?iso-8859-1?Q?KIjtMQuv4nvDca3xJD+L7GWCtVdGljKoEA+uKbSJtC+anURxn+mskFQPMa?=
 =?iso-8859-1?Q?pyP+OvlwxolvKy2qKCQmYD+BcndicdgKj7O4jzy8PpSSDHWjEHtrDTn4VM?=
 =?iso-8859-1?Q?ib4/91HYulLOHBVsOdmGH6+rdBJoK20hMUf3jlRluBX+LRi2vHjoOAGHvd?=
 =?iso-8859-1?Q?iEGuuJPGjEQASg+SZzKbjl/IwTCCwgqw1g3BDaRyF8ZHfdlHRqLCq/vcwX?=
 =?iso-8859-1?Q?Bmti1XEjrazjESR+kQ5sm9KkxJw/UY57LvsUbUKMD/nE/VZqiUbwjlQTF9?=
 =?iso-8859-1?Q?N4OdXRDjKzBZE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4cdbbc-afbd-47d5-2932-08da918c2afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 11:20:42.8717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYf4lgCUM5FPpgCfRyObeLQzL3B4zzPcFNtOGhggYL6enRJDIrleqjabvpQfYpixsy4Zw/YMwR16e8tTZcZHNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP190MB2016
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z3cmn5nGcBt1P3j5KtvrDUs/WBL+KALoHvGwngF0Gk=;
 b=keWmWP1BpfqqtVE8l4dEJ+GrgLQHdR2znfYOFq0wfpgLG9A93xBrULR/xQClWP2VaQWPZO6xdy43w1hYgvgEn/voHZodnn91QSNxxRknRlnIR5ChIlw2eMgdmNW/tyztZ++Eti3ndN7xrMn708TMwP9pmbk3xtEomZkPh3AihKI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=keWmWP1B
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/makedevs: fix recursive chmod
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
