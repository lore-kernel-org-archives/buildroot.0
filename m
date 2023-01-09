Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533A1C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C349381678;
	Mon,  9 Jan 2023 08:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C349381678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IrjZeTjjvXKN; Mon,  9 Jan 2023 08:52:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF0D815CA;
	Mon,  9 Jan 2023 08:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF0D815CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED171BF30E
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 08:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 664C1815CA
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 08:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 664C1815CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ROYbjgU2f0Q for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 08:52:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 533D6815AD
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2055.outbound.protection.outlook.com [40.107.15.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 533D6815AD
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 08:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLOMyGIAS2ktH8lVG2/uiuxkZMzOpKpdRPNCOfNW4k0TZl+3TapDGmRmEo6J8vfd4Xg9DIYa6thQ0CF/9EkhS/Elay5vStKAG1gsepLcEEmMpar2ma2XitxeT5UEu9hyhSvDYIU9hdmY10brg7FGqMQds9fKlyIRtgGwyYNvA2KMHIPiQ5gNQEfNNIfb5/5O8JnqbkStwcYAHerLBOip/pbgYligXC0oaTKeRQ4sIKzyS91HCsBvvzqdMfcaFaSJZGW+S3/dNQEYUOw+KmDIYj0ESHDSkjVnpAwbQ6Fb+iYe/3CZNBvt7cJcnTVmmPJPuhgANyl+i50nwzheqQqRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SMZOCWKEsvkBYj8MAn6VS6LlyrOJ6WRcOtOyftrpJ0=;
 b=PsKD66OolEpQZxsj2Kr2tBy190JALYZcVZk/avVJoW7kp6GwoOIjHNwAnTbhxUSGFy1f065iuARRIwEiM3vrLHV3pDr312TaAVn3gskHynZkL45Y/rqOD4nANHiJ8J7v7xKfZRhHyQdVU5vBFuc/WHjKsUXCPzS+yaAjKp4WWdwHkvLl5yvyb9R8Hp2oJy2O5Y6bRwJxcAqhnvTX3M31MqUaALKFVo0b+6iCn+oQUkCymP21etpgxc7EQ6f7Dq7n1v3PaTtWa9v4r7rb9diugSlcHPZZQ18KAteyVy/y9CApvqCg9zprU1aQXZckuZ4C9mOCYgvbiIgRCiMl50YrKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0715.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 08:52:18 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 08:52:18 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/3] package/libsigc: switch to https download
Thread-Index: AQHZJAdubxHi3dSv2UiaAYF9p/8JPA==
Date: Mon, 9 Jan 2023 08:52:18 +0000
Message-ID: <VI1P190MB0493957F9DBAC242D57F78839FFE9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0715:EE_
x-ms-office365-filtering-correlation-id: 5f91f483-e895-41a3-7b94-08daf21ed020
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E1hcjEnjzT9Xj7CyyZ1Nf0OxJbSJWyctsxUS9Sl86av1ktEY+LDID1IHT+liO9P7HnOExMCmTIbR/KphciWtKBid3DxhKHfYGs2Pj59GdKdjKKbf5Q6JWZ1WPSh8GW1/CuH0lsHFpKHDj5dKwQGE5/2JlG/gXxhPwrB5c1FRYmqt1vaZJU1H8Nt5N1qjalHOBWvseUvqg8rrufziOUvQPfm/E3V04y948Ni+oc4pHN48Qeo33EoDCGi7GYZiAQx1xbQavX8hTaRokY5ygdS7wlcKyMNmjY5eltE+RfCH9/q3LP57FLZ9Hz3ql08lr3ha6ScMfs0hUfU8lKMX4xtitGd2J0QHe+Ic5M6K89C6WKIFdru3hz2Wzom020pRjBAbLsOlArHZ6tT8018pKgn4eKQadtNxzJZazkZ6vSPa/paEp4D0YNdMqxg4B+1dpbwMJ4U3GbpzmZP0jlMang18M7KHwh3Jmv4O6wYq0IgQZXe5Gtax3DyO58IzsTw/TVTkjcK4gwtOu6zKfAvrGJ24jrS23WBdTr2f9iOFOPfi11dB7CJ/jT3Dgy5g9OSDNRBxPXe59164tbruv4MccAABiAnN3BWgXd6OGc4Bbm4BPPD+bdlw982U8Ci+uMKxKedzarY3IZ0C2OP/C2KjdRyeiVqD3muxKZEjCN8SFYPiv7ATuHISzgqDK3AtvYeZemHl4VEaZGjiHNRMyNkg0n1UcRIqX9cyDTjrNh1LLSNhcro=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(346002)(396003)(376002)(136003)(366004)(451199015)(6506007)(38100700002)(122000001)(2906002)(478600001)(966005)(33656002)(7696005)(26005)(9686003)(186003)(5660300002)(316002)(71200400001)(83380400001)(8936002)(52536014)(55016003)(38070700005)(86362001)(41300700001)(66476007)(8676002)(66946007)(76116006)(66556008)(6916009)(64756008)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FlB6MvzPHiwMhRaG8eUm8KruriOaSu3/ZYkIrhU+0cCH00L32Te5XBxA+2?=
 =?iso-8859-1?Q?4HBrmhmXNSIXEFdqH/Clu8HwnDaiqeRhBSoaRj5ZOVplbTUUBK1y8INW4i?=
 =?iso-8859-1?Q?6AYkgQR0YnlWJbCW7Wt69PEdRlCrFHKhNrpqvdrkku/7OhUiTkN15glKha?=
 =?iso-8859-1?Q?BUIX69/fo1k8wrL/Ms2/ZPmcL3ImSPWAjIZo0sFW18Hqk8i2JrWvlcRbE6?=
 =?iso-8859-1?Q?bomPuKqEQDKKtYmK0CKSiu8XeVTL6p29VVQz8yqgWq0TgyY4Z4JBrdvT7S?=
 =?iso-8859-1?Q?C3g/bmSVQqJZ+Xmkxq2sS3EeptwudsYw7ifwiDOaB4qLDSAx7l3QxlN8Yr?=
 =?iso-8859-1?Q?AszUxrYWdqH6l2w3eblg3/CeaO7c5y+1MVXIXI91MUxAioYl4xT+HfgebJ?=
 =?iso-8859-1?Q?kbDHXK/342rQQkCKZOp8KDE6EWr6dMbNtMSifxrEXVb70xOmF/KDdfVWGR?=
 =?iso-8859-1?Q?1m4jSKEgy0Io7B9j54b11hEyURvwkRPrkvlDOeR4L0VBT0Y1G7Q7hmtxkS?=
 =?iso-8859-1?Q?tUE2uQ8GgtDMNy9qi1N0YKDncFLzTX23C5GDGTlZxFAP9MO8ovl8/LEbCv?=
 =?iso-8859-1?Q?W/NMmC76CU24rJkPBYc+1o1IgfCZAdmvWLOCdBbpCU/+nru7GzFhtPM+Im?=
 =?iso-8859-1?Q?yp+xEJJv203xGsJVwlHXCu4DDO2QBTke8IPCCEThI+rM8pLyC8GZZtrsCX?=
 =?iso-8859-1?Q?EhFyDU4F9k3ZQm3TWzCwgL6Fqv0yUNrE8Dt8MGNvo1x/xTqBxNXOP0yo2Q?=
 =?iso-8859-1?Q?NXl11EXuDFkfH9r2U6q3b6ZzI/kr7Rm9JeNjahJnil2BpKBQNuYPImG39j?=
 =?iso-8859-1?Q?NI19WbkjzPluE6pjW7D+m5ND+DD4KiWRhOLgEUDP7KL1K3QnLGwTQCR/wh?=
 =?iso-8859-1?Q?PhFfBhTxcbGShB5xuGvsYll9yxbeq2+rdMG3szXLaXSgf5IzhDgdVbSqzG?=
 =?iso-8859-1?Q?AGlaIuhGUxeEcVRtkmQLqv7plARP6hrOMAC6AGHEbwXNra0qO2hpty63ZV?=
 =?iso-8859-1?Q?Thl7msl5j7p4OWU6cJ/v9gJqIl8QnB/NMUzVpqd1yqXv2856ymGdemLkly?=
 =?iso-8859-1?Q?lSMwRZkTuWoSFqBv61WPoYG2qYtPzYUYBQt1+ajuP/J+h3AdblzDXxQt6L?=
 =?iso-8859-1?Q?uf2/Ug+U3b2FvC+e3hGBSMlZELMX9d9V7z9FVtxVYBBYKN3VWnGn0WzYjU?=
 =?iso-8859-1?Q?371VmmijKCajygWONOo1yvYeJBmsh07oNhTICXRCjV5EO1oYweyxdv+Lrb?=
 =?iso-8859-1?Q?2j7HQj3/CQtGhidXuF/+2UsSwvIl8xJaAtxBeGNYSqnwpf0vXe6NrsQf9G?=
 =?iso-8859-1?Q?7ih0DEaIwPmwBKlj3iqxS5mJbUUG0KbaNkleStQNymu5itLUbCWr8Fd1NS?=
 =?iso-8859-1?Q?348KUW/nm4uJZTttSq2jV2W7Ld2DJN+IBoILQ8zFYiqGngN9j0Jr5A7dZT?=
 =?iso-8859-1?Q?DKq4bVLkxt8Pwzz6aXC3mzK40ZvQ2fE45VbcMXv29DZPiFInhpyELx9gIR?=
 =?iso-8859-1?Q?qMl7YwAWJUD2Axlw2RWZMQEkmQpHWO9DJI+yTeCEMe6ZRQwRS35nofNcy8?=
 =?iso-8859-1?Q?CzEQD+aKCo6S7VFbBcADIhtezV640OH5Uh4OvMkoQJp/nJlBAPybpk13NL?=
 =?iso-8859-1?Q?CdzktmtEdNDUs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f91f483-e895-41a3-7b94-08daf21ed020
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 08:52:18.0920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yc926o1S0Fsj/68nACT/aO/88WXbEERZueRb3I27zY6iwU1fFrEEjUkOs6h81yKGWwc+CkgMsmaj0eGCuQhhdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SMZOCWKEsvkBYj8MAn6VS6LlyrOJ6WRcOtOyftrpJ0=;
 b=LpxHj/lzw5oE00liyySjRgI3zqgP658IHqUhgdGgKu+3k05kpZyyXn9Ur2zLDs6ORnvlDwnKCTWC6rLZh4BmVSpmqTpZUMd6AYyL/JBo/paB8MSBVlRsu2uHRe3WVglhttQ3rtkWaDggzfDXfudIPjW0HgO2IlnymNvQW6NIZ1I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=LpxHj/lz
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 2/3] package/libsigc: switch to https download
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/libsigc/libsigc.hash | 2 +-
 package/libsigc/libsigc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index a358732faa..6becfb19ce 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/3.4/libsigc++-3.4.0.sha256sum
+# From https://download.gnome.org/sources/libsigc++/3.4/libsigc++-3.4.0.sha256sum
 sha256  02e2630ffb5ce93cd52c38423521dfe7063328863a6e96d41d765a6116b8707e  libsigc++-3.4.0.tar.xz
 
 # Locally calculated
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 2de49a0c1c..c054575ea6 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -7,7 +7,7 @@
 LIBSIGC_VERSION_MAJOR = 3.4
 LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).0
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
-LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
+LIBSIGC_SITE = https://download.gnome.org/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_INSTALL_STAGING = YES
 LIBSIGC_LICENSE = LGPL-3.0+
 LIBSIGC_LICENSE_FILES = COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
