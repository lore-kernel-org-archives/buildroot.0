Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894E0C004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3480840C6C;
	Thu, 19 Jan 2023 09:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3480840C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQGwoxWyvwW4; Thu, 19 Jan 2023 09:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 193D240AD5;
	Thu, 19 Jan 2023 09:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 193D240AD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 027EC1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDE7B8224E
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE7B8224E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_5UwnMFKiBW for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:57:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 985BB82241
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2077.outbound.protection.outlook.com [40.107.7.77])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 985BB82241
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eth9+lzxtIA3pCoVsFoBfBvz3E7QW3NJ45Au2O+1gp6Yz6UT50CvviR0V0ZgEUehz/HZDG26HvDjWpbB6npqot80D+l2PHWXfi8+CT5fclv5D4yJ6SVkEtNyehb7EZ2gcERlMTJmizUZyhI3ct2ewBNk+Z1ChobL1Sl/ouEtif75jW0AEBfaHRaamgib0Wf0qIONM8dsLSellbrk3JO2nl1kqBFcl2GESkQ3PD6kB04oVWCsROdaCift8EjseBi/dW0+FtmO8B5FCNnv51dMw9/a1IVefEz8PxbjZr1OSIgeQi4uDhNyRQYEhGFcfU7nZ4AHw0tVf9I5pp7tB493wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZg7Db5DWr5ZsBLzV6ntIk5d3+K4MQxRVjjnS5+O8ac=;
 b=j0/SpyTNTHq50Vg8xPtcxvwG4rX4LKQfyJ1qndU2pnPGBsxIPjLJDp3b74qMr4Ac53XZZMhW/0ABoSmkjpreDuOdsJLdfMC5SMzyboBv1aFPS/RCRulmqOVSWf6bRBgBrnq67M5CwhDhbXlbpaxW9Em5QAjFLq2vjaKRAKvLN0297weI1D+shpbuXYkxYFHQuvX+IddGRbHewSh4PhzQtFK93Z2m9lb7saPNNsmAoOB6CedaixVPYNdVTLPIGFdAPcMHUK0hcKsz6desFqzdEfzzcyofvxoC2os3q3GjXUdwCj0g55GbPc7deQvrhuXiChqJxQXO+yRtXReuQORCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1698.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:331::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 19 Jan
 2023 09:56:53 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:56:53 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 12/45] package/gssdp: switch to https download
Thread-Index: AQHZK+tSS3cQmqIKGkGjNfBhoJrLNw==
Date: Thu, 19 Jan 2023 09:56:53 +0000
Message-ID: <VI1P190MB04936ECD2319CA4F2652EE209FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1698:EE_
x-ms-office365-filtering-correlation-id: 17680ea0-d636-46da-855d-08dafa037e1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S+tGoyL3U12okvyUeS9DvC20i4WiURJW2WUvCgoZBSSAS4UjXhfXLafRSzNzBCqM5T6PpgZXsJTdgRpgK7Yoyd2lROhA4R+dDT7Guk6U/M3ftu/y3ZGIvo91K2KhN7/8dRa4Rw63eUn9FJfMAhLNPQxvteXB8I6OQaHKh1yVLaLsaCUa1c4ISimV/vDrwo2I4EzMC7Q45mk/VpVFmyhlCEmPhrEP2KCD+TTwQbl+0N65WtM63Ut8m9zrzubgSh0pm/FLx4L3+OELhEZcwd17Zzqk4LX9PolGtmrFu21eXV8mE8Tm17U+7o2STtllkwLHGc9Tu4TzD7pF8bwtgpZfHbO5CloDuPQ9iiNUHm7sTL3ArGILUfJXLddRl8tDxLKrIDBvA6j7Yn4syPyDdcvvMz32ybCTwXBoQ/RFXWCCDs1aCUvrK/6HLYFVxCbCT+8ye1cDSZmyceLzUW7gsdFzZtkN05v6l/Ys96V7S+rhn0pVWkkuCmCLxaPZFxjXwNs+OtYOdLtkIpVBITi88SNL/M0ZaDWOAZawyhSs8G7VxlIt+wrlC+gX3bTxHjEphImpPrybyqGY1wruTPSmcpruz2e8bLJgR1lEsV+KIEQajn2RMF3h551+/GLfrjgqjw6eYg9AEwb6VFY/HtSmiYXYMk80b8r/g9cH2TitRFKfClNKyueFS1W52ZnpkYOtKCgYgvYYq1U47s0eCGgdlV397jL4fAzBivOLtBSXj3xcBTw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(451199015)(6506007)(26005)(186003)(9686003)(7696005)(122000001)(71200400001)(966005)(33656002)(478600001)(316002)(54906003)(4326008)(66946007)(66476007)(64756008)(76116006)(66556008)(66446008)(8676002)(6916009)(41300700001)(8936002)(83380400001)(52536014)(55016003)(5660300002)(2906002)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3PwMJ4g+J/DK5Z9TYsZae3bgZl+KZR9ob+va3UmmFzoBgZOMki8TaGUARk?=
 =?iso-8859-1?Q?Pe2TB4gYEyxvpftSWW4ixYr6pI/dh/qjuLsxle/KMTyMglFcQctKdYJLSr?=
 =?iso-8859-1?Q?GrnrR03DJUlxVqe4AzHY+8FadCeBo0rK4hFejzpJFvaYhUu6v5JCXlcyad?=
 =?iso-8859-1?Q?tvuk9CZo+tgBV1TIiZd7RuUnF5TW/HBS1Vg1lS7jhPGKEgoydrdhsK3Y+4?=
 =?iso-8859-1?Q?vleN//gcCEDAqAMLAA6dgWLNKVTP60T1b+wesNzWh6WHcVZ0TwKMldJAsS?=
 =?iso-8859-1?Q?o4Xfti6e8GCVwW67vTb8qYWdZk+wfAWJ6Q6kVaLaaZzQ1sHlKXgxpUqquf?=
 =?iso-8859-1?Q?ikvzO3RVJ+JmfYEjTeeMPJdcoehp4T4iAvuZTo7SLxGSxx9JmHrKuTJWNY?=
 =?iso-8859-1?Q?ASWzdEsVlTRft8/UL4f9zb4ynjN9916SOuMu+c2Jz49Y5jzRPCkbx9xzjx?=
 =?iso-8859-1?Q?pNqDxkyQIZLwZ/SRF8s6/eIf2BIHOni3U05OHQjlHHbU9OQMpzjK+DxwAM?=
 =?iso-8859-1?Q?12KP8MctdYFd1czaxAtfhbRult0ktgZr3t/59kNOwoHZ8JI/xixuC16WLJ?=
 =?iso-8859-1?Q?eSaVaqlAUjC3UcRIbSZsIxRl3uA+ZPGoaKZw0HhpVzVfSUzZejaJjzRP+M?=
 =?iso-8859-1?Q?QpUM8YvtL1yKjGajV+xOH+RXoeon94UBGR9i5X3nSLsX3vVR5p59XpsxWK?=
 =?iso-8859-1?Q?8xvLaMSphIXN7ma9i6WfEJAf+ZTRZbZDVseDh1HckxLFIfNfjcdLPhXhc5?=
 =?iso-8859-1?Q?CKOUbrtqGnTgWYglR7ZrKApd5w0V9L6ciwU0smAsC2Bwklr+rkpa+z7vu4?=
 =?iso-8859-1?Q?wT6vGKJ00EckGyXxyx6d/YCFG83Lup6VQsVuCLDGJgHFSwqbBVR9LsxxJa?=
 =?iso-8859-1?Q?tobu7E69326he4aiGP34fhHC+RtDVM1pXZKwf+tZ5xe3tDqPPatyUHW/SC?=
 =?iso-8859-1?Q?c+0hZ7hHx53WQKzg7oUpPpk5Qq+euTkmYXAT6HWvPXhImQp3ot9MBaOSIB?=
 =?iso-8859-1?Q?5NumyVSOlA5FR+bO4UYKM1M1gDYkDJVnZNmL6m1IBhYDf8xdOthnxKS6u0?=
 =?iso-8859-1?Q?wi1Tp9HEXRP0fDU/O1sb+Yw7Qn26jocUc5NnajxrEBIF3jdyt8ear2iXri?=
 =?iso-8859-1?Q?SrlGdbQXKf9s6jZ5wExpTzBTTNywHmRotrUGbHT1Yfkfg6bBXFoNPOqD1Z?=
 =?iso-8859-1?Q?UJnW9bGTduH8QnBPFN6/GifRXWVzIKTQgvdHCQS+3umx9Q6W38cZMeKODE?=
 =?iso-8859-1?Q?Hz6n6a1P7HIsssfFubRW3Ur3VX+Zz56GfPt6ZCvBQSSkzK6rdVYu+SgB2l?=
 =?iso-8859-1?Q?p9Z0Xw45OjozTzYJFW0C75v0wR85d3tlzyajKW8lg4gcKmK+GAl06mzslY?=
 =?iso-8859-1?Q?VIzL57yosjoS3TptUCu7AVHNJwVUBPyZvrfF7IxehX93AQRqpETBM9FgO/?=
 =?iso-8859-1?Q?+oEngvbxSeleOpQvZckyVABOvRtzKdvOCMNr3h236fsAEM/3PoYJbZY/KY?=
 =?iso-8859-1?Q?Huu2Ci/LjzVj0KUhQ9YOKxsrj6MP85iut3IjCA1OJJDgbAoldpZsKvg8gO?=
 =?iso-8859-1?Q?+J0aEczbGdDT5rb3SGczdpmWmwxKlkbCNkOMs9MbP/jEhhIwWD6W+5fReO?=
 =?iso-8859-1?Q?PBvtN272k3Z/o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17680ea0-d636-46da-855d-08dafa037e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:56:53.3874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VuWnElO20U9/mPgY59os7JwmniWDKYDhAu/OOE+7Rr1JJWtARfnRGRK+kF/RJCL0uVdsff83GQns7JUwLGoiqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1698
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZg7Db5DWr5ZsBLzV6ntIk5d3+K4MQxRVjjnS5+O8ac=;
 b=X7rOdGM0JvZ10u5vwZZKczgG0PpupfDzGiwPw3OwvlkM09YWkl/rNrcCwU5/V0wqYQCJXfJkEaMuZHK9Voes3pgOWK0pFZQNCi5kN4/RuDF/kBuZ1jeqmYyTlKbW9rGOje6fyBe5J07bV+K6tZBRLJNyJvysagHxIkmk1qpumGk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=X7rOdGM0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 12/45] package/gssdp: switch to https download
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/gssdp/gssdp.hash | 2 +-
 package/gssdp/gssdp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index c9bbd66083..34ccfa8044 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,4 +1,4 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
+# Hash from: https://download.gnome.org/sources/gssdp/1.4/gssdp-1.4.0.1.sha256sum:
 sha256  8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582  gssdp-1.4.0.1.tar.xz
 
 # Hash for license file:
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index f1fed3713d..f7ebb44acd 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -7,7 +7,7 @@
 GSSDP_VERSION_MAJOR = 1.4
 GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).0.1
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
-GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
+GSSDP_SITE = https://download.gnome.org/sources/gssdp/$(GSSDP_VERSION_MAJOR)
 GSSDP_LICENSE = LGPL-2.1+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
