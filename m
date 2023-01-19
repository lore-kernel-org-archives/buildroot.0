Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ECEC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5719820CF;
	Thu, 19 Jan 2023 10:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5719820CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mK2-lqSWlIwc; Thu, 19 Jan 2023 10:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1273C8131B;
	Thu, 19 Jan 2023 10:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1273C8131B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 797FA1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5375640897
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5375640897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgQKd2uTlKIM for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:14:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F12B54035F
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2072.outbound.protection.outlook.com [40.107.13.72])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F12B54035F
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfHffuzpWSRESwaheZehvrG2NiQikyRz1esIgpqLausQW5fLCnZyfP8qJ6gdbMEKrr1v9TfIqa28cLn1WjF0N4FM3wqK/ypkDUq5GPvIiLYRhsaQLF+pY0WQL8OmyO66iLwftHXoQd2FlsWZpK2V3ycAnKUlq45OX9gAlWXR0XCSlVxxK1Q2Y+fz7w+JLsEvwIAMURGmocjTGGmFFR7XSaPKWHGLJ3TsoMfC5+hdXSZ7QUp4z3GDVJpK4M8BVhiMkLtOmljXogWfJYgJfvgBEeLyCU1umeqJV55zt05e53NurOmIzocSLyfVHykjIjhCAEF3JN37GhtRUiPqY0r46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvCCpTYAlUqT9dgf3Bo1VcMUZN1IoM0V+UyTHLLlEiI=;
 b=e4YWFiOeHMRUM6hhtZInR5MouIUschdKSf7Rg/jhJJkhr2btGIHNHUp1wYHepKEfgKFaQj0Dssd+zOUkL9QytNKwdoh+qank/trMK1FATM2T/m0++iidwAY7z+l226rsduPI34up5YQX08BNch5MdaLi0XgSLqVb6jUQxKpRjkIWBZzAY9Jj8twJcVf0TbGxrNX1Yoa1ozVBgo+4/vnwkz3UK0KM6EP6f55JNU0DwUeQ4R+nNOYpBbezhahIZ9hImw1FQRwH9fHTcQqXFWgFw/YhA2HFKXFYwHBjKReiVgarnU24paLFzrU192ybAlpRE+Tww0r6akdxur3p9Cw8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM8P190MB0801.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:13:57 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:13:57 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 35/45] package/libsoup: switch to https download
Thread-Index: AQHZK+2mM5uJETm0wkyjwTxiY890Tg==
Date: Thu, 19 Jan 2023 10:13:57 +0000
Message-ID: <VI1P190MB0493829FC1BD408EB17309089FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM8P190MB0801:EE_
x-ms-office365-filtering-correlation-id: 95f9455d-1a7c-42e8-5fe0-08dafa05e05d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mRAp/e9b643ezuqHaACj9AsKGDo79xbE7fbNkl2RzEX1MJOo4uofdP69TIO8PijIqph0vDxPwWI/wGHme4FHWqwu+r4tNlikoobUNpqzMTsmZuZS2RUjitrzn5KPyVWZuooUzd8Kq//tW9qsoi2R2aQ/p3HwlSUGY9WW95gFbjseNXC7y6AX5vlR4ESqS3Qu5pPAb9mW1GcSW7t3uV2pZSiS78Roc4by/w7Q7Td0CN/BrH9AEIoLzEPDZQZVUWd8XT/fzew86hv9yN9LrPP7/HsXXUYiUI+ogFcX4O34Y2Ma0H8vVJSwrRNSLszuFx4Jtj/F7syEB3S9b03Cprf1jouTSPd5o22yZOETipYSn3H6jbhycrxtUlsvk1tDvde79AcRtDG2Nvu0f9ZnX9ucDiDok98IIjl3IOCHGH5pqi1DuDWqCoXS+kHiEhqsobtZkXajtdBLaSKX7IGerpNJN3GObFR+PdULmvhZ7EY9YkhUR/iYncRdhFnG/y7ZJ0dNinpkGO+uCG6OawFcDTvOoKVgj+SCD9cm4bGPcz76JzuTEskhr7+jJ06d57pLlXxgFSqdkP93/4MX/wD5tZG0Nr8rkWz+3+HaxSob7CmLJhTLKrcYjYvpuKtkDvbWfQXsLnkF0wfXVZ2JpyFaGbX7Xoqmvvs1ElSJnw++KQd5l7J/A3MBoT5JvAc3e//sz+vp60lJtGlOyo4aRrmC9gltvzuWDCmvdLduILZ7DW6Sxuc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(451199015)(38070700005)(6506007)(33656002)(86362001)(55016003)(66946007)(52536014)(66556008)(5660300002)(8936002)(66476007)(2906002)(122000001)(76116006)(38100700002)(316002)(64756008)(966005)(71200400001)(7696005)(478600001)(4326008)(6916009)(41300700001)(8676002)(66446008)(186003)(83380400001)(9686003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7Xh0eZH51UTUylJEI2JD9AGuB1THUcPl/bmV0YxFjuw1BfnqU8U0oxbU5Q?=
 =?iso-8859-1?Q?q321O2F5hIURwmrE8tnjoLW37VbKANzcbxNBZnco5AI2jAzss+33vNx7ID?=
 =?iso-8859-1?Q?JUA5T/pi2a/wtJssX9QHnyVCGyCbHtBQIsl9k/Fpc3ZBs1VePVXVML6hMg?=
 =?iso-8859-1?Q?TQDNQscRw8+d5G8BZSnIyApJjlKnqvbIvc7X7Bcn6upcBezOtVPyonZLNS?=
 =?iso-8859-1?Q?TJrykKjs98J7j14QouKG32B67k1RKInRH/90IORLJLTDpT3ywlOZ7eKlc2?=
 =?iso-8859-1?Q?q0EjOR4ull2OnLTW14XhaO9KkMw7xv1KY7d7JV1wmRR1dw005fjNp51Hg9?=
 =?iso-8859-1?Q?pUEr6ogoqfYxV8JtvupXtEYjbM6TNmHkyhIBDGGTMKsQdBzwlQdQzu2Zyw?=
 =?iso-8859-1?Q?So7U6hmLU2ux6UIHpfprRP6MHFkh8PSY/lH8PT1xKTL/W6koenf6gUjFW/?=
 =?iso-8859-1?Q?Hi8mUX3cfqpcwxFafjUgHs9a26C9imI+cTfVyseVLvGJWMt22hRy+YNfW7?=
 =?iso-8859-1?Q?aWE0UteS8A+TiXZGhFj5EsAB7w0HeJp8knw2LD+T4B+Hq0Jxk03Ro657M3?=
 =?iso-8859-1?Q?H5jiiqMD0zV2hUd6kl+/7MDm+mJBIx7b/mDM8RPFE519F1+byadM3sCnHx?=
 =?iso-8859-1?Q?pZAhfbF8qpgmhS+Hh1hFavRLS+7oAcFYedlSs75eG/1iqqwjFcq5MT08vA?=
 =?iso-8859-1?Q?Vkmln4XrwXF2bbmyiFwmokvdOpR+m4QecZYKkmxp3N1DgoSVO5aVqbhqvd?=
 =?iso-8859-1?Q?MVpTKNV6Yn0tasjV0Te/nAWGWRk+tx8b+88Nm0KxqqzszA8AJRR6xjEj5P?=
 =?iso-8859-1?Q?5rK5I7dPrFsWeuNAzfuf0CGWOQJHroUlE2TbGAhOTCPbnEaAPno2skgVEs?=
 =?iso-8859-1?Q?1qu8X4tFBJ4GH0K6PfwEfDYnJHw6cHyfwo14R7lg0GlXL9CCOoarFcRfId?=
 =?iso-8859-1?Q?K+G3LcpYWDojx8Fopu8Q6fJ++X2P+k4MB/3yXgfbXsYyGRBOGk9cwkmmAl?=
 =?iso-8859-1?Q?rVMqbFMWMQi3zwiTInHVk09tXl2nYVsQABCbFCbdTv0bQQyJKXf2j6xv5m?=
 =?iso-8859-1?Q?+ejdMkugDDsnRonpnL/ap8jl0BfVFyqZcR/H9BHWbljGGHMkpmUYAo46/T?=
 =?iso-8859-1?Q?g6xq2mWZaXQW9kETZFpOxSQxfqdiijDmJKiBWL543roqUHX9+z6+BBEZE0?=
 =?iso-8859-1?Q?S88xII8lo052Uvi9OVbrfO15bzhOhujAHD7STeOJCv3Ptl+NOrLeCN5Qmr?=
 =?iso-8859-1?Q?oatckw5uC42DQzRjyzXTSUyPuQ/gMjWfR4+XnnJI38NjhSvCyJtj0WvgqQ?=
 =?iso-8859-1?Q?hqGTnYbJe2f5vVACSfq4qoKeEOxsH2GOrV5NwTlkkG086czm99/1mAAWwq?=
 =?iso-8859-1?Q?XuR7ORT/1YeW3kUjKlcJYKIGcWXAiop3bWNs3Eww2xNVCWfLAF3/0KwV0v?=
 =?iso-8859-1?Q?RMi21EN2KxJWrD4skV1NMqZlI29RrLCmvvuvF2DSx38Od0vc2YzpeAFkAK?=
 =?iso-8859-1?Q?j4KtwhQBzZjjYWWzmF0FmQSmZbkAdfwXVF7tKj3IMDTPUTrl7J/drEqRef?=
 =?iso-8859-1?Q?vsQH/If2dZIidqE9ELpg2lqAp31yRszr1Zf95ojgqUuuTD+9Im5YhGb7WR?=
 =?iso-8859-1?Q?eOKstqcCum9uA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f9455d-1a7c-42e8-5fe0-08dafa05e05d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:13:57.1717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQ0qI6OMrge3B2+BAix2enWLLyYeQ23pGHO9KwgDiRknVNTDwH1QhiOC0gfpQTOYsAPsPONBaqmEkXvympEIUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P190MB0801
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvCCpTYAlUqT9dgf3Bo1VcMUZN1IoM0V+UyTHLLlEiI=;
 b=l8FlUwPGH3F8L8S7nlnsXMCVFal376CP25hB1vGKBPdl6x5SnKawHPoRX6A+Ak2zHB9k7Jlw6/d0vnwtFQ3o1Hycexexz6jq/HSwHKirbAsy4DROt8FLPyaE5vIu43xUwgN5Jo3a4/L1GwknI55Vy9Aa5enOe2q7vMO7rO1prOI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=l8FlUwPG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 35/45] package/libsoup: switch to https download
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
 package/libsoup/libsoup.hash | 2 +-
 package/libsoup/libsoup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index b89ed7864e..2f44e63d71 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libsoup/2.74/libsoup-2.74.2.sha256sum
+# From https://download.gnome.org/sources/libsoup/2.74/libsoup-2.74.2.sha256sum
 sha256  f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159  libsoup-2.74.2.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index dcd7ff459e..026ea3a8b7 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -7,7 +7,7 @@
 LIBSOUP_VERSION_MAJOR = 2.74
 LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).2
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
-LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
+LIBSOUP_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
 LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_CPE_ID_VENDOR = gnome
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
