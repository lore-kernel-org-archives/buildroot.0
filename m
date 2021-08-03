Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935BDC432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 06:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 031B660F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 06:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 031B660F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=abatec.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE99A40261;
	Tue,  3 Aug 2021 06:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsZrAefsitzs; Tue,  3 Aug 2021 06:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B845540270;
	Tue,  3 Aug 2021 06:29:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB661BF35D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 06:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25FE181A23
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 06:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=abatecgmbh.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GdRXhPYazxN for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 06:29:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0a::60f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F26F082F6C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 06:29:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K60/bXCKt5aAjuChDtWwc9Up2EN++WrsXnGA9WC+JZWDN28ECUFXINpaV1O+dqY0BNhz/4SSy3MEw9M7Sqx1vyAfhIwCcuzGCfQr5uJF6NHmLr2hgri+Vi5W6+lJuJX3LycIB0tk9nu6VpVlI2h1q+GSgvPGnzwoVGAQqjochtu586vqgWE7iyGx/mQASajoMf7kDWQB5209ZSDSgMDy0LmGNIyn3a4EhNIk6pY7R6/9M0aAS2a5qYwx/BDG6a/URtcp/C1HiRFBCuTbXZlAnznL4PLMjvn35q6HM/Z2nh/8B022mhYNZeeh3+Xy9F0S/8zWGRRrx+JUPMz057nZHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjF4VAYpT0gDPv/twRQ4QLXMXi//1X+6F0vKov10zNA=;
 b=dgVxWVYmq+/X6zUGiVNismHVpjNYx3VveiU6ncEq2S8QkE3hhtIm/5ozi4D6XTzn1/GWpgL2eWzqSOHAjkmbuOdYLzEviaEj9iXCNnfJPtm8tc7S05wTcpThtBGTKg1+vK2phMtmZDqOK52l66/OxtrgseOYVsQ1lahptBNkipiFBIlWkWDBrYrSpxWmkeLzaK47Zk0JRrjTxiYETqG6MQBKepv+kj3lGTvTXuPdefU2wgkW5okGhij0p9mpd6hWbpZzoIyR77IGioTUgokLsZ5OudTJAeYP6aIwQkP7FTAHt3zAlFVs9/yOfs9Alftaq+TnA/ZbCSIKLrL7P5x4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatecgmbh.onmicrosoft.com; s=selector1-abatecgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjF4VAYpT0gDPv/twRQ4QLXMXi//1X+6F0vKov10zNA=;
 b=HffESCxHFeqv5spPqsXLXwFCB5GruGkwX5+K1kYAp2rwKdqGAKJwVEwYti6/2kM1jos40tytVbh1+APHD+npBv0rx+tf+OIkoUv7ILV9+kI2iBmcbXhimraWJiOZEFfcwk64jMDOuvqzzr9KA4GmIBBjzfYdJYTmsYYByYNsSLY=
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VI1P190MB0638.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:124::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 06:29:06 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::d8a7:ea76:cee:d0a9]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::d8a7:ea76:cee:d0a9%3]) with mapi id 15.20.4331.035; Tue, 3 Aug 2021
 06:29:06 +0000
From: Lang Daniel <d.lang@abatec.at>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/paho-mqtt-cpp: bump version to 1.2.0
Thread-Index: AQHXiDDcFmwsF3Rro0KGSNE1ay9XxQ==
Date: Tue, 3 Aug 2021 06:29:06 +0000
Message-ID: <0362514c96010df2fa774a7433f1cc031ffa5494.camel@abatec.at>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=abatec.at;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efe3a9cd-a873-46ab-49ab-08d95647fed6
x-ms-traffictypediagnostic: VI1P190MB0638:
x-microsoft-antispam-prvs: <VI1P190MB0638FED3C24412633CABF0069FF09@VI1P190MB0638.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VX7Bmu4g9iTgqRo3qvQFK+E7sDt8VfdCMZ7nEJBaLLQ+zp506Imny446Ym5yhcVlfFci5e2LqMSKOAwRDqWcU0d0omN4rUyyljQewMh96Zis1GM5nSwptxqFb0FeIacEXS2xY26KOhwoQQ0E4hGVgx/5NAKZcxCWIt0ZdgRdt8jRsNozii73PeUNfqZi5S7ZWny1pTtQAyh8RUZKdSL438VP8bQdnf+jnGkPJe4MfvDpByR/Xmreplo1MiuNl4DIgbqHA9JA0KxyJvV9sW2PBcsfaE6nbwPefIPsE41ySSd7e279ZCCEbH2GOTEF1f2NrLsDMqZLtoHKTRY9l39nHvdSO3qjlIQf54kIkifvxHkcOK/Y6VTpepIfwl0zodZzoVbal8vEE2QgfSniJEEuhEak7M6/q65hze4AKfok3bfMWNtm3K65+AOBaX62T9PLumukYIUWfJza6w6gcbpxC4o1J7JVRSeOhRTR9I013+hnBMKQ/b3OfO5GaLiFTeq7piuS5aF47q4gnoFk21tozb4jaXnggQX0RtIdieWKhIaPtMAmoVPqC5myI76i+K1xoiJc+WCP/9UGZU2uAPJ+3nx8QqpSk4srcLYNZv7vXjQcggMe4aN0Qi9vYQGjB17lCX14y76EGiAb1rC2rnt1gkscmI+7DoK9wzzMEVSXNNya8auar/j1fz4LPz7YfKnPzvDaqUif4UUTofLxRMm8+ahaxKiFb3Gpo15jxLDbHjRicKKhsf5WsPtU3Lb54q5k8Fbv6fP5gMfmzwM6g9VUehDPeLSvJSf861mPWge6q3c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39830400003)(136003)(366004)(38070700005)(5660300002)(66446008)(6506007)(26005)(66556008)(2906002)(122000001)(86362001)(66476007)(64756008)(83380400001)(76116006)(6916009)(966005)(186003)(2616005)(316002)(6512007)(4326008)(6486002)(36756003)(508600001)(8676002)(38100700002)(66946007)(71200400001)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEo4RnZFKzFSVWI2S0ZrYVZ3c00rSDd4ZEhEMUphcmdFY3NrdjRDQko5OW1p?=
 =?utf-8?B?OGlFUWNNVjZLZFlRcjdHZEVsdnRiQkRMcnhsdmhuWkVkdDJ0TnVwaFBzRlla?=
 =?utf-8?B?dWZ0bXMzdWtyMDFoSzFkYmtIaEdINDE5dHBpS21nUlBNYUdBRlYxMzdWbFJH?=
 =?utf-8?B?VnhaN1JLblhQaUZSTUhRTkNmUzNUVnVOeEhvdm5WakdHVHdHbXJSalNDdkJj?=
 =?utf-8?B?eUk0T09CN1Vob3JGaDB2Uy9RZG1SeStEZFZNNHBzZXkvS2tYNzJWR3FRQU1Q?=
 =?utf-8?B?bE1DVlF2U2xPRllwckFWTHMrWkRZRGp1SGFlZHNKRS83aTdpa2k1bjVlL0J2?=
 =?utf-8?B?QTlHakJzd1J5aUhVVyt0S29wTXIwYWg1UGdHWERDbFVTUmtmdStRMG83TGRE?=
 =?utf-8?B?S2VENHcyYmk2K1hqVmFCczc1K3h3NDkwQXVLZUpxMmVrYk5YbGdheVJER0tu?=
 =?utf-8?B?bGJ6cndXNHBudU5JV0I2V0hGOExGV2lTdlBjd0d3M2RYWlIrK0VFNXVqNTc1?=
 =?utf-8?B?dDA1U0RZMFdReUY3c2VzTHpXUUsrSVE2K0pacXoybGF2ZE5MN1IxdzVYVXRa?=
 =?utf-8?B?U3Z5dGRvNFBoUzN4V1dYUzVxR2RIb2VtdHVaRnQ2M215ZERCd1JJTFlIalY3?=
 =?utf-8?B?N3UycW4wQ1BCT3YzQ0dWa0ZNMWlNOXNXVDlRS1lIcjMveHRmV0tqQVRseXFw?=
 =?utf-8?B?alM4NTFGRjlERm1obFhZaG1NM1lSS1JESWR4R3F5aVBmSHRha0ZJYXpabTM2?=
 =?utf-8?B?WXNaTURrRmdNcHQ0SE9YUEJ3M3dzOUFmWWM0YVdwTytqZEpTQVh1OXNnVDNn?=
 =?utf-8?B?eHp4MTFZeVNQbTd0TU5nRk5LeEw2NXgxRkFXSFNrK0JwdjR2dGNTL3lVU0h3?=
 =?utf-8?B?Tkp2NnNlNGlBNmc3c3pSYldpbHVmbnpTRVVIUEFBNjVaN04xUlJFa1lVUzFU?=
 =?utf-8?B?L3k2aGYrb3FSYnYvZDNJeUFsMmliL3JMN1ZzTHp0U3dWSHpYelRXT1JGYjFp?=
 =?utf-8?B?WEtBMC9uOS81T0kxellOdHpFclZYZGFKcit4WnppRVpNaVdEY01qd01mcTZL?=
 =?utf-8?B?ZzNOR1VhU2RUanhEQUFCN0JrQnhFY2oxcm16TFVpeVdnRnhkTFQrd1Y0a09X?=
 =?utf-8?B?dWErZS81ckJoS1VneW1KMG9RQU0yUmpicEROc083NkhlMU1iQ0hsZlFiQVpH?=
 =?utf-8?B?d3pycDBOcGNyTXJ2eDJ2UWJ0UXo5OUVQa2wyTzhkaWl2aUl0M1gvM1JKTGFL?=
 =?utf-8?B?MlZ5TzZEK09uRzJ1Q0g3eUVGOFhveUh6MEsxcis5ZUZpK3ZObDM0aVMweUVI?=
 =?utf-8?B?NWZDdjIxTCt6L1R1dkV2SVdxUkk1U0Q3NUhUVUJCL0xWeWhNeStYMTNJY1hT?=
 =?utf-8?B?TW9zOUZFSGxWZisrVldSZk9QS29tZXNwMDFobDh6TTdwRi9VYW84WmJQWjBo?=
 =?utf-8?B?REh6VURGOUFDNWpiSTZ6UzhJcHpKNzdlcS9iaTFSeGw2a24vcjFBZUx4dHI2?=
 =?utf-8?B?MEdWYzEwanBYOU5VanRScEMwdXlySFprMVVLd1BRYitxSjhGQTRrK09wUW4r?=
 =?utf-8?B?d2ZicmlvWXhoV0tYelB2c1JTcnRtMGhnSEhteUhRcVR0TnRFWHMxKzMraVhH?=
 =?utf-8?B?ajRnSUhtdUcrRG51SnZPbXJYS1BwK29JbXBKd0toQUtyY0xIaHZkWS9GZGRJ?=
 =?utf-8?B?aXJ6M1RkRk8wUjdjMHhIQ2llaGJQdy9BRUxrWnp5d2ViQk91SDhCbGtYSlFi?=
 =?utf-8?Q?KHOjRSN8NrUdi6DXc8Zcv4zIWDAomfFZyzQb8ST?=
x-ms-exchange-transport-forked: True
Content-ID: <19D18D58DA2470489E30EBB04F0A917C@EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: efe3a9cd-a873-46ab-49ab-08d95647fed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 06:29:06.6489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOuOmmbInbbl9VmCL7wRXT0J/UdZ0swyP2FTqNC8xOA/eDWhnFAf2jHSi/RmVDCcRLWNdXd1XUVJiZFvEacEFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0638
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-cpp: bump version to 1.2.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

"This release brings in some missing MQTT v5 features, support for
websocket headers and proxies, ALPN protocol lists, adds the builder
pattern for options, and fixes a number of bugs in both the C++ library
and the underlying C lib."

https://github.com/eclipse/paho.mqtt.cpp/releases/tag/v1.2.0

This also makes the patch obsolete, since these changes have been merged upstream.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 DEVELOPERS                                    |  3 ++
 ...FindMahoMqttC.cmake-fix-static-build.patch | 35 -------------------
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash      |  2 +-
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk        |  2 +-
 4 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 1547ff123b..2c53575542 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2910,3 +2910,6 @@ F:        package/qjson/
 F:     package/quazip/
 F:     package/shapelib/
 F:     package/tinc/
+
+N:     Daniel Lang <d.lang@abatec.at>
+F:     package/paho-mqtt-cpp/
diff --git a/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch b/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch
deleted file mode 100644
index 934dca219e..0000000000
--- a/package/paho-mqtt-cpp/0001-cmake-FindMahoMqttC.cmake-fix-static-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8aeafa1c2ec90b0e95ba5944266eda115457e10d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 15 Jun 2020 13:40:22 +0200
-Subject: [PATCH] cmake/FindMahoMqttC.cmake: fix static build
-
-Static libraries of paho-mqtt-c are not suffixed with -static since
-version 1.3.2 and
-https://github.com/eclipse/paho.mqtt.c/commit/8cc51c78b76a1eabd1df3124b0887ce8b01070ff
-
-See: https://github.com/eclipse/paho.mqtt.c/pull/704
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/eclipse/paho.mqtt.cpp/pull/275]
----
- cmake/FindPahoMqttC.cmake | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/cmake/FindPahoMqttC.cmake b/cmake/FindPahoMqttC.cmake
-index 53f15a3..0ec95bd 100644
---- a/cmake/FindPahoMqttC.cmake
-+++ b/cmake/FindPahoMqttC.cmake
-@@ -5,10 +5,6 @@ if(PAHO_WITH_SSL)
- else()
-     set(_PAHO_MQTT_C_LIB_NAME paho-mqtt3a)
- endif()
--# add suffix when using static Paho MQTT C library variant
--if(PAHO_BUILD_STATIC)
--    set(_PAHO_MQTT_C_LIB_NAME ${_PAHO_MQTT_C_LIB_NAME}-static)
--endif()
- 
- find_library(PAHO_MQTT_C_LIBRARIES NAMES ${_PAHO_MQTT_C_LIB_NAME})
- unset(_PAHO_MQTT_C_LIB_NAME)
--- 
-2.26.2
-
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
index e5406e0b81..d9b86ce207 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  cb0343349ed91ef51d0e76ae860d19435a730d3d355e57886bb090014cb70bbe  paho-mqtt-cpp-1.1.tar.gz
+sha256  435e97e4d5b1da13daa26cadd3e83fe9d154930abaa78b8ff1b8c854b5345d8b  paho-mqtt-cpp-1.2.0.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 161e53d484..827946605a 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_CPP_VERSION = 1.1
+PAHO_MQTT_CPP_VERSION = 1.2.0
 PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
 PAHO_MQTT_CPP_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
-- 
2.29.0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
