Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D625FC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DAEE610F9;
	Thu, 19 Jan 2023 10:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DAEE610F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NdTFVOgqa4fd; Thu, 19 Jan 2023 10:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C4E610F7;
	Thu, 19 Jan 2023 10:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2C4E610F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA5C61BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79B5B418EE
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79B5B418EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_ZP55611hIZ for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:16:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3829B41848
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2078.outbound.protection.outlook.com [40.107.15.78])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3829B41848
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ite5EN3XvKvXikBFVjB9eGWwtluz9qf51+7+9cBmN51UPWXf3cEL5EzXgUlh95n8T2MPj/DnGV0DBqpnLTLqAdy0kBbF/EXelIJU8JQdtKpecG8fkzL1taQHCpYinl2ElvEIJA2fQwnMpkhUluRlSSH+UUug7KvZP/mLVtstyf61P7rOSfOPqyF2qnVHiGkLYaK1a5M3qemC3PJHZqb5ipUapafBF2Xvqs4LZgGVcgwtRGsOWvZD4CLNiseo1FcQW5UzAqW603r6oRrlQD9y+9zH35yx9FRh9Lx3/CRcifUyWyedj0wubr9bsXrNQfjVAtdvSKKSwo07yOSswSHH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzXVvntmWVnami+wWoM1vJMRKPtl3bdFaI+Y/B2mgyU=;
 b=dDiFA8t8FJ7GyMtJmf/ZKcOPa7mEtz+zJXo/B+2bjMSIVj2uCyaZ77xsllpOlrikB9rR3guc5u4MdIPBgRsKlY07VGCnfJEl0Klvq5LlXCqyBe4PI4VAzAxnpfPLOQBM8mU98itU94BGVN8OoNCEqKgQhADNNDZKgqAURnSB1Rf8rcSZn0j+Q7olvhT5Huc/++YDPqYd/bnhn4GGNITFPD3GvxL7Pto4zCm/Z4VXD4xV2QFPy/vScHh/HnZZph8yifS0sMDRtFyMhPZl0N2R5ItpjApIDJGyYe9A2hEOd3x+s0Ujnc5S8bLStiHKwR3yO+ly5XBHZPtzxCke1LyfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AS4P190MB1806.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:4b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 10:16:04 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:16:04 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 40/45] package/mono-gtksharp3: switch to https download
Thread-Index: AQHZK+3kWSp3MZOD8Uuez1p/M47SPQ==
Date: Thu, 19 Jan 2023 10:16:04 +0000
Message-ID: <VI1P190MB049341D1604F54C89F6BCD049FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AS4P190MB1806:EE_
x-ms-office365-filtering-correlation-id: b084b39b-dc00-40cd-5fc7-08dafa062c32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9eJ4KHEqVxQwPIJCY9W48qAgKbfyukAOqCOXH+cEaB1lw/dhynp941KBJryyMKOfJWf148T3ql1n3qqeU+TRuEXblGW0dPow9gm80k65+9EXhr/c1fG3Y2L3SHKhfjDd5rBbuxpQykYOy2Wkp3+F5qB2i84+ftbrKHK77RQnaqHn+W9Xv6Kn2+A7SuHNSXOkY4XMq7NRuM0iiQSaEyo5+Tr6igKslsa/cZobh5xVtBfwyRN/LK1V/0AknSlqymKE0mF31y83NTVJFWpV1Q0+15s+OvdllnffTFPWUpKuqP3J8wgda+GqW25cOfnnOgg0ShA/onLKfatrOzfTjhNak8SyHf1rRpyZZUuFftLmun9oHHXIiSB42JeLhOagOM6/o5AJcYQjr1AQk0BTW7p+L3HNrN5mKiPq6PQcta2PiG5BihHNy8GdT4Q57CxsRDG2cB8pBcohH7qpR37WJ8OLT2IUIEdimYV/gGgrO/lhFJl4DAEVO36X63LD4O0vE7qRmFOSXJtDUC254sRjj9jgjBMzQiFkiWRLl98ScsBJTMkPVlGy1Usb67WHFeCEoLUPQgd6jwMPvG+3ECXuhc8jsrl9uFNtGsbJw+07xR8KNXMVhbJy504OdBYNSjmgbf4Wg320+U2jGLDEe8s0P1X0uUg6afSkjL060q/l8cdjudDKpaCAFZYgKs2PsZDWnxebYj1MjMC55Gx+EhfJy4RWqJogIYtM2J0ZZ1jBCKIInIM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(451199015)(86362001)(38070700005)(5660300002)(41300700001)(4744005)(8936002)(52536014)(38100700002)(122000001)(33656002)(966005)(478600001)(7696005)(71200400001)(83380400001)(6506007)(9686003)(186003)(26005)(8676002)(6916009)(316002)(4326008)(64756008)(66556008)(66476007)(76116006)(66946007)(66446008)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QHQayQknMsX5m4roZCQKkWadJsx4qYiilOY99Jgw7xf9aVD32qAM+Hm2dM?=
 =?iso-8859-1?Q?MsVzV3ho8GV6xSKDd2+b3lXd8kM4QceYR4h4xomzoxH0CWH7WaQKqBjQwe?=
 =?iso-8859-1?Q?n4wjsk0DsK99QnzqLLImaWc0O7z1uKdmgg7kb32hp5aKmqbKZEzxzuIazI?=
 =?iso-8859-1?Q?qyvSGKU6egW3Q0A0zhDwD1Ql6oB5+CUaCO9zWU0CNA5gAxD3XbRotNhPf5?=
 =?iso-8859-1?Q?S4+F3jJl+gbDWx88uTdO7+U8XojER8pVKXObzixmeO/dBIUJjlkM9PEm6Y?=
 =?iso-8859-1?Q?GEHHu3L1JLV5gHPJSug0GdMz3joXJqYyi/UWtTsFV/fSBIskMyEVEVRWtS?=
 =?iso-8859-1?Q?Ifh80aG72aAVmd7swgc1L6r0UPOLs4Dp6Up/Y/djS5AB7JgxnPFP2XrC/9?=
 =?iso-8859-1?Q?QUULvXzVO4ytOKj0GTvnCJHwb2HYDy1HaV7DKYlb7p8gOSXYKf/y3CcymD?=
 =?iso-8859-1?Q?l/na1/lV7crahtrHv8IYarG/y+U6prJsFLFOkUHJ/MdhqhRBFFbhtwd5PN?=
 =?iso-8859-1?Q?mtZOSmnOmgPL4ScHLr263BWOI2WCWKVFW1G+OYWKZv+k6ogCG4rjzmHzLY?=
 =?iso-8859-1?Q?MGRrzfqe6TGwkPVvVCSmI487MfLukDMCR9VDJvPsYPMN6tFPjwu0AK0OcD?=
 =?iso-8859-1?Q?paHnIj1chLW7zWyrutvfCssLm2WfvIkrdlNIs7nEHHFR9nRFQioNWx+A6K?=
 =?iso-8859-1?Q?8iURPKPWSihUF6egNSLew/l8AsMh4YMmn1pyzWfi/swd9jNKMw5+YW2DBU?=
 =?iso-8859-1?Q?CTp5CUJf2sa3DF+891dFrsw/UpVq/YUTbdBG5YbwqH/YPCCMATprQ0ePFi?=
 =?iso-8859-1?Q?W9XnE88wpKrYHetU5GNw5XByC4vMo5KnIlL+uYV8Anj5Z7ksDZpIuNC5Xa?=
 =?iso-8859-1?Q?5koqjfAly8NvjVHX/I7Gk8aHleav4cd3b2cCUDDJ7OTMpBAH9ek/t8jfRc?=
 =?iso-8859-1?Q?KFOoRCbOMrXF9DvjJqP8KukvUw0thOod9euq176FwD9LvMheogoXFJwfbd?=
 =?iso-8859-1?Q?9Z0cxPL2q7wQS+Da1qVYEkpAmpHk9Y1iHML4nme8UQBtt4n/1gx5PkjM4O?=
 =?iso-8859-1?Q?CL7g8vax3V240H/9cBvDJ8bM1rsa3TWFGf61daDr+0AkrWn+95MC/HB1Nt?=
 =?iso-8859-1?Q?pndzL3OTjBlo8y/wypu4YOqxe+UiuXIfpadynREUpdolMvYFbqUfTGW0Q/?=
 =?iso-8859-1?Q?FshsrBvjIQeXJtAHw20GlRyXLJDUoS0bMSBb2UA+Fcgm4QWURvpl7x0r/K?=
 =?iso-8859-1?Q?/D9pRfT5MWRn2HEss9Rt96Ii34wM14E96ZI8o+cPt+sfEMg1AL+NRjyU/h?=
 =?iso-8859-1?Q?NHOEbT7FPIMBY46dIztSZnC2ZWtdRNOXFDJDraLALrZ6Xy2qpJIVBRGPkk?=
 =?iso-8859-1?Q?WQb7q1UrZFBr5yUBwOOmoNLvq5fUTl4M+oGUenBGKWTMENs32PhQbrbYev?=
 =?iso-8859-1?Q?hCW6VjQF/7p7Xj5tOetlHqpCxT47mlKScElVjinRm6vtGyRGFseG+YrSgS?=
 =?iso-8859-1?Q?1gHvmVdl3tCrWr8iF2+0fa9kGlZH7QpmcfzPbvNU6+qxNVYod7bv7GvrBE?=
 =?iso-8859-1?Q?gkYcr9gp2HVHFVxPd5LVymJCsK48C1PcbFmObpKR/4xtBTKvrN2PHjLmJY?=
 =?iso-8859-1?Q?auNIbIU9bEJOM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b084b39b-dc00-40cd-5fc7-08dafa062c32
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:16:04.4280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6yuEYyuHgAVuweWSvPnIN2tp1ZXjxoTH9JgZkZbPbcD46HJeV3tF8XfYFeykzAKqom9wvSRMqGwyYEAIyFvDbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P190MB1806
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzXVvntmWVnami+wWoM1vJMRKPtl3bdFaI+Y/B2mgyU=;
 b=J/VuKFQgNqSxOhYk7kTidO+4RmZNCcUxkk3yVvPFXEvJAX3JGIXnbntfbNEVBbJTk9+VAluYoO0cm9hk7qIa+BQ4O8fI7KTrpDuZs2YUTWYws2pPzvh6sUHRQzgtHdq+e9WfhIIBX12acf7KJ1N47DyeL72D1iIOpQS/czYe9KM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=J/VuKFQg
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 40/45] package/mono-gtksharp3: switch to https
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/mono-gtksharp3/mono-gtksharp3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono-gtksharp3/mono-gtksharp3.mk b/package/mono-gtksharp3/mono-gtksharp3.mk
index 126aabeda2..27fcda9482 100644
--- a/package/mono-gtksharp3/mono-gtksharp3.mk
+++ b/package/mono-gtksharp3/mono-gtksharp3.mk
@@ -6,7 +6,7 @@
 
 MONO_GTKSHARP3_VERSION_MAJOR = 2.99
 MONO_GTKSHARP3_VERSION = $(MONO_GTKSHARP3_VERSION_MAJOR).3
-MONO_GTKSHARP3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)
+MONO_GTKSHARP3_SITE = https://download.gnome.org/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)
 MONO_GTKSHARP3_SOURCE = gtk-sharp-$(MONO_GTKSHARP3_VERSION).tar.xz
 MONO_GTKSHARP3_LICENSE = LGPL-2.0, MIT (cairo)
 MONO_GTKSHARP3_LICENSE_FILES = COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
