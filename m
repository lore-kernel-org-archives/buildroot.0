Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AA3C38142
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142DB60A46;
	Thu, 19 Jan 2023 10:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 142DB60A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cDIr385J0sqB; Thu, 19 Jan 2023 10:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3465610E5;
	Thu, 19 Jan 2023 10:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3465610E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63EFE1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E14F419A8
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E14F419A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vp2KCtmKhX-e for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:07:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04D5640069
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04D5640069
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P86py/VB4NKL9T66wnKHSfDQYCuFFBFn+Q4kQ+Yk/mE60Bmym2QSrfGQ7+83lD5HyvSlS/G/Ca3qn8blQ5NvrG7gArO+McH65+3NApRm0QGknRsgPfoPo6q8alRJ6syVYu1Mwkfj4QCogBVoOyqz3M6YxU+pa7CjI7/AB6BRRFCoZoXB2vKM1t933VLDJLb/vJ8qCluZtZi+QxZnjZ3ByPQligEEtP1tRk/yLl2ImizGoA67MSKfc+TONPmHPJoJp3K1GXZ4UrCtTok9WOauir2G0qyZF2k5LznbyabninCd1HqWzhVLZP2XQCGzK0rHF+QNJda7acKI0GtDnGwSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ak4yyULgPwtwCVbwnpzlP1jAuAPqP2enpSWpjDxxJ5k=;
 b=DghNHMqZlw49QLwPfXVYxqtD9fH2n2RwSegDpCMuEl93qO70pl3mk9IFMM9vcYaLFscMsV6Y3+55E4Wz/EGdmzZBHx6uKuuOBltEI5CQh+r+aejK3/e1j/ENSCTl0pVc2cuGXyTtYhvHL+9zk2RHvEG1z8fSvhAzBuW2rgcTmuzMc3cfqmDXJPbNRYx2BWiTulLi/WND6nZOfor7l6JE5fd5Q6mZ/rRhj9B0EKgZV2gkI8u/hirbdSF6pESdLMqCvNJfIcOaeYS56E0zXqdl4sq/9hcmO2dfFjXN9K66ElyKSibrUSwKam6sEw0RHOltiehUBAfLWcVuj4fY0k5jfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0604.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:129::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 10:07:08 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:07:08 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 24/45] package/libepoxy: switch to https download
Thread-Index: AQHZK+yUXMfEjrob80GUuj59E7AnXQ==
Date: Thu, 19 Jan 2023 10:07:08 +0000
Message-ID: <VI1P190MB0493CB304540BC15D1FDC9899FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0604:EE_
x-ms-office365-filtering-correlation-id: ccac8962-7098-4205-1e2f-08dafa04ec78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tonq7xpqFVXUcUiGOmeXsSsvcyajdeLRbDBoR68hYoz4JWfavkN9ty7ld86M2qvlvJ3F0rDqJElBicKQeQPI8AXDcn6XhnExg/UqVGVMRRoWbUvngHrceM+hUVAcQbhBYKCOUc3C/EDy9iCsnW4rEieirVk+OCqD7ufpjTYGxfJFox668TZPPBXq7jAvYw3t9v+OxZwCg2r9f/EWGpzBskSadG4uORb3Mt1s6rwJ3ySjSBDsZAuUb0dzrgLIuP4rSG6kwI1Y0V6IG5SX6Zk4t+xWBmGufmBuYTTUobh6m7aPu5On4A3wpkuLx1UWWFI7uN6sjmpA3XfCI4p1Z4ZWQjPTaEWGaUIwVXv9DP1S7ANuoKr3wAWLuOv/hs12Max11LhnuRPoZJnN8fxOBhmwrpVfdhpjyS1LwO6gQbKi/D3PTiEy91H438xyrADsk9QPDTmHvKHyf1J69/KrPZnO0PXfxDbZgBRaf6VCbES8m10oWqmN/npXOzGYWZLq73xRvqNl4BifkUGqBAtpf9UPegBoStl13L7H0GjTK+CXYFNeojDQ6aaeDT1E8c902fr/0rbEvOkIJjq8gPICQpD1nHsFt+46U0LvG5XKw3UhC5vBD3ElweyyP2BCHIpa5R5f7D6msVKURkAS+dvtqbQxQOsPneUUs0w/K10uINyr1zT4leeCnOVcktnaBn4l8ZzErJ9uGBF6YdNUek0nzQvAWVnFcXkiHMHWw7r5C1PDWl8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39840400004)(366004)(136003)(346002)(376002)(451199015)(8936002)(52536014)(6916009)(5660300002)(41300700001)(4326008)(66446008)(64756008)(76116006)(66946007)(66476007)(66556008)(2906002)(33656002)(8676002)(7696005)(478600001)(71200400001)(966005)(86362001)(38070700005)(9686003)(26005)(6506007)(186003)(55016003)(316002)(38100700002)(83380400001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Holu7SuwSwQAaF2u2KX0eHwbU/6R7sWesOobWElUtsLWck27Ez5WdxdSTQ?=
 =?iso-8859-1?Q?AJOVmaUwsFjvQxfhz73p7BuHjUsMDTWtzdtytvUka6GXCbe/lMA/Z2cQd5?=
 =?iso-8859-1?Q?lz1ZN17/FalcF+O2Sc42usO2Sa90GgCxh1hVT+dzqff2VrMwV/GwzTq6tu?=
 =?iso-8859-1?Q?rSD1zvaK1JWs7sbwCuKFzB54eRMbG3g7lTAiOuFKoOhFRZrf+eoOfw2myx?=
 =?iso-8859-1?Q?FxoeP/ekJcUbuZKkPONrl6qTE2r8SigIgQfL2LnojQYB206rIsQdjg1UKM?=
 =?iso-8859-1?Q?6Tt2GFPRIwVkt3pA8VWAysATj+cR8iSZgTWY0FoSqqe+6sMlSZLR60d+El?=
 =?iso-8859-1?Q?XOqpS2feqJtRft2MmywoztkUb/k5MNzVBRJDszyxAD2MFCXRsqFDnBcL0a?=
 =?iso-8859-1?Q?k3YuBhvE1Q7Ov7aOYGE291VwNwhp3VTqxKCjtiDOwAPfeXbg2nSbij2AFP?=
 =?iso-8859-1?Q?t5RILyE1wuX8gw6YrHcYamZnG54d/38x9VFv4RzG35Mlb5ECUem9J9LNMi?=
 =?iso-8859-1?Q?elYtgb0PghU2uvj/AER3w6xHknngkwv1sJ6e9z3XZ5UOtXVcExbqC7lkfW?=
 =?iso-8859-1?Q?EGo4TnFj/QGaT4XBDr+aodRrq6Cy+riTfa+mMMO9Y7dcEAlopNNVV1vJjO?=
 =?iso-8859-1?Q?aOCWH5UeCBXiwji5XJiF6e9gUrAW4DJqQ0MfFFF7V9FHoV29eUFeLpxyy6?=
 =?iso-8859-1?Q?0DOkPuRC24DTcNc/48bHUkY2OfphIQjXFxCSj//04vI5P89QqzcQKfZgNx?=
 =?iso-8859-1?Q?V8zjkCPnsfrmyooaK4KyDaID+z57zUEmv0FVg1ZoF2Trexk3Rn8I5hhKoh?=
 =?iso-8859-1?Q?Sa1RAmOhKdTxEbadZTWhmQ8W/uWr33G8LNCcvZgsIHWz2EYvMuMG+Rziq9?=
 =?iso-8859-1?Q?EscgbU4AsOrzqfxVz2QlfuXJ7pHHzA19J/Iu4bnNddwEr+MpH0jShwaUAx?=
 =?iso-8859-1?Q?qXOeAwhxonaxi67FT+Jlw+yASFRNtb16ALWP5vUkfaNIEZWNfIAS370FJ7?=
 =?iso-8859-1?Q?1HSG3uhk6U8HLdqa7aPxJ2mqro+mtAt/h/NTOgvCYKfzXaJ9RehTcNqm1f?=
 =?iso-8859-1?Q?hJOL5VXnJ95vX1m0UshEqVekDg24bZhQcrZEm6gX3VgXTbZeVMH58Rs5GA?=
 =?iso-8859-1?Q?Af9Ap0+Qw2s15r7uqSTBmyKeU3lh5lDbpP81iQrZG4LqPRSRPR4EzE1EDP?=
 =?iso-8859-1?Q?Z5fRPa4LjXRjmxUMSJ6W5ODZ1+P7/WbxRCEEPFPjkCnil9zXKynfYVG+nr?=
 =?iso-8859-1?Q?iR0DulMqjintz3oSC0uWvBATUqS4XwEma06VNCOdCrz2gv9wLZPJwO12pG?=
 =?iso-8859-1?Q?uOYUQr9epWeKolkMSNo9kRJfDPGU1276jt4v9AYgZYZPKQLfrQIJtXv+E2?=
 =?iso-8859-1?Q?qlnJtpWL2Xma+cfkJPAcoJzZ5Pf17/P6mBJpQCj7vGq8Rcl57hscN++/rM?=
 =?iso-8859-1?Q?Wsm1TE49pXmpqFcW+dgUEc2sIKwtgTKkhFDjmlT6TLDoQP2+nFzhBMNyhQ?=
 =?iso-8859-1?Q?RMTkMR2ApExykBnJ0qSvv9zJKvgkb2t2wI8E9jVF86mpccO5vURSh2x/RO?=
 =?iso-8859-1?Q?aNwf4RdIYQcKRJYWxeOhhyDMO50odQ/I+V2fKj3vuLx//YCcrWqtt6i4hw?=
 =?iso-8859-1?Q?lvtnfU2ZKuNdk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ccac8962-7098-4205-1e2f-08dafa04ec78
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:07:08.0298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGzAUtyLJqW1y09yXS2tlbjZwCxfbTPehQgxS6upps4unAa6wNuG+T9IKt9h9UYTR/aOhRmyCvLkwKs5slZJFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0604
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ak4yyULgPwtwCVbwnpzlP1jAuAPqP2enpSWpjDxxJ5k=;
 b=crwQybr//jJuNqmEE5yE0uwYNqjQLGdHGF7v3FCqkNEuk+zpt9BuCKCeNtwG2YLlw8Qmv1yNpBtZoRFhnANVzeTHsDhR6io8qezBQpVCKE+P600BDfu3X/xc5Qc+YNOJ77G4T6qWnzAVhWNF0P5reK55pGubmVsBiLy+fjA9+GA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=crwQybr/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 24/45] package/libepoxy: switch to https download
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libepoxy/libepoxy.hash | 2 +-
 package/libepoxy/libepoxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index bf6c52f99e..27adb70f40 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.10.sha256sum
+# From https://download.gnome.org/sources/libepoxy/1.5/libepoxy-1.5.10.sha256sum
 sha256  072cda4b59dd098bba8c2363a6247299db1fa89411dc221c8b81b8ee8192e623  libepoxy-1.5.10.tar.xz
 
 # Hashes for license files:
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 2af2e2f6e8..1630428844 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -6,7 +6,7 @@
 
 LIBEPOXY_VERSION_MAJOR = 1.5
 LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).10
-LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
+LIBEPOXY_SITE = https://download.gnome.org/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
 LIBEPOXY_DEPENDENCIES = host-pkgconf xutil_util-macros
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
