Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBDFC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 09:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BFDE61188;
	Wed, 19 Oct 2022 09:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BFDE61188
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voDP8dqnqDhY; Wed, 19 Oct 2022 09:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B7A61178;
	Wed, 19 Oct 2022 09:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27B7A61178
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9791B1BF28A
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 09:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CEE683EB4
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 09:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CEE683EB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwFOLzgwQP9O for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 09:14:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86CEE83EBC
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86CEE83EBC
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 09:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/OVRzH9CzEXdRSZ9HF9Ny+ZiGgitWr6mY1xJLEW2EzEY6lc3SvntEZj3kXFxW/UhRnj5As0eyQ2d46KiMhwFutAjgNI8QmnSMkIVEVc3OXewFf3n2sSn6SFjEVrhRnDZ7DYrUibjn+s1Uxe45gYWANHRYfo7Yzm3R2ePw46z4J+xNaKKF24ODX3jtZ4gTqkNzwKT38nOdZX+lF9MlGm88b6TTCre6UzvAwg+Tnb+Zo38XWTPOZScWWseHTb1Rt4JVlL3y4m3WFOBbRsvHICkAB3H30oByoKY84+U0YgRzzr/hYPCzC3dB2JEywzzrN4ZSNo6mZ8OO+Tw0uhjGQhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdzTOu2/7Xoo7RW31H6vPqpj3QNOipYlBKG1/90FYAE=;
 b=JH1AkDQMKAEoTS5gQUZLQTLovMWY+td4oorGy5480BOruLHJzU3OgUwcZweCGKlMyJ3OoWcByQTCfJHz/fRIf4jnFIs92XuRh2rXukwR+Yo85ebvuF07GFo7ymUXa3k0p4Zcp2u/2UoGTkbiQKCm19YmSABKhZZbIhA8KqVHW0vLpqsuHj7njT4BXJaGiKQeiSf3HU+BEOfLwmQB+qeHQXQ5Rc5mIszNwoh0rp2EBrSVi1uny/vPQBZGlXLsUsVVnkq3E4srk1dF7ON2HX+oxW/y2txiVCks4swQ5cwWRBIkizuO+8Yczc3HEslBH7gRjmmLzN/FQhsAGr3beqmxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB8P190MB0620.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:123::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 09:14:20 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::818c:f70f:e157:b158%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 09:14:20 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/paho-mqtt-c: bump to version 1.3.11
Thread-Index: AQHY45rubhhyoF6g8Uu+nl6lv0mLCg==
Date: Wed, 19 Oct 2022 09:14:20 +0000
Message-ID: <VI1P190MB04938FB6F9AA6821AA4F67D19F2B9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB8P190MB0620:EE_
x-ms-office365-filtering-correlation-id: cd0d0397-86c2-4653-86c7-08dab1b24e2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1foi6ZtS8pWZcotJGI8W+EzhYt7LOBKMFnJmGb3C0v6+NHuQbC3kR1MiqOcaFklFyWIM5u1YL7Wm1g60wN1vD4MY+3MJdWFrf/Gq0iDy3bs0m96L6LxYvQ9AtzT/O7aSQYTSISrJzhZFyiWyqJ0GsAxrMYZB75o41gz14uEOhPMzZQCLwhD9LV8f1DCQdYjfIrruiX0nSiXQh56N+y7wgQC+35Nb9zC4q5a8T67Qn7oQu4r0km4MEt+mUv40AI3fugmznmLHrQ+8Dw2a36VjKVDHggn0N20IsmgfNVQFizpWhZYzq4pFmYbvgtpLxjnhbLG1X/0wVrobokydwOO7Z5wo0UqYBUWGcVuxP0G1pL+6ue1YmlydXqjt0FzE8Wynb8QbbjdXdCA8oXKyKs/rzZ0LN3w1Oqt7/APAFkzocnyzAuMiW3fdfjWsECVFpDCHbJ+2G2Imh0wYhYLPHHxwu7/GmcRB7PuHCsnxAuknMErXYRGfmqIWzDbOqrWp8msAt9HxB+iUpFkTMKZhnDAGAD05Pr/PODXT7bNAMgOcUZt7DXMxDlf23ltQCYaCA5e492TsnpLi3Wm/r5dQ3N7RYcBUWivRkwPlEU31Bfo4n4GL+Y+1bYcQdeP7LJQ20Q0c72iUDkO23xDcd10qq3/+FGRqNFhbzC/cANi6R8l7oW6okBH9XRlj4YC1LAuxZLiFx16bera75is0gqofhjgPhXg9c7C+s5Wn2x9VpYyOYTVFKTOZmMbXKlKK1//9URrjZlx7++Vt74ELw5xnvy2vSuyWuC7b8bF0lqTI8Hi8dZ8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39840400004)(366004)(451199015)(4326008)(6916009)(66556008)(8676002)(64756008)(66946007)(66476007)(66446008)(86362001)(83380400001)(41300700001)(26005)(7696005)(9686003)(6506007)(5660300002)(316002)(8936002)(55016003)(76116006)(52536014)(38100700002)(966005)(33656002)(71200400001)(2906002)(186003)(122000001)(478600001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FzKJTg1+CL6O/Y77hit6IspFxKcjbpNcpfOIUH6gUxI7Olw5xs8uLeOIiE?=
 =?iso-8859-1?Q?mNAatx2gdEcFGa2dkiH/I5XE7LuwiNod9Hx6O8pKO00m4vXP0PKVYOhVx7?=
 =?iso-8859-1?Q?KZB6ceFABprI+CC26ZYsrvyXQheB2RXe9i1iPbQgxWt5UpexCh0iaFjdl7?=
 =?iso-8859-1?Q?23JfZhrSyPeSDFpJDO9TcQeU34se6m1gWm38QRV3Y0YoUxcmFM0jeCV/Zh?=
 =?iso-8859-1?Q?dBsbsvf/btTqqLovBI9dU5xuJFkKltYbcIt3dfjtalkwmcge2euXzuCrXk?=
 =?iso-8859-1?Q?S3QbqmADSgBl43O6JVy3lLvtHfLc30RdhNZKcTqLD30uFHmBXrnGbq8vI7?=
 =?iso-8859-1?Q?WN2cjz4LtVAToEfDreXHItQZE0xCyQ/UJNfVi5sqkbT8C9DE+cfP6EMJ+e?=
 =?iso-8859-1?Q?ATzUk9qg+1jCLr0eaKOUt74v+Cp0cB4/D7MSlNErKsSWv5f8oO0zXvEPp/?=
 =?iso-8859-1?Q?DePYGommBqFAHaQRblIv+NpIs7lyOsZr/XBZMKydxSRh2UJni0elp478BM?=
 =?iso-8859-1?Q?eZHkB9K+ryQr6FFc4bHyjTnx+XfZ0rRJ+oq1kGjlFzQPfkkNqv7cwDwwvt?=
 =?iso-8859-1?Q?7O+QGqPnM5mR8NMx1g6FJ+SRa//mTRlN7xF8FZIEG0b47b8/jGhxw+F8Mj?=
 =?iso-8859-1?Q?tBSTnFHUWRLjJ3tSm5EDElSuhD5wcG/fh6VnYFrPvoGwgzpzCAYj/nThHR?=
 =?iso-8859-1?Q?M0SD77HOc5EUV/eTljsoFNEOjdauZQ04CDRSks4g/1BA+ugqN7i1wJoMZj?=
 =?iso-8859-1?Q?dgCtAwMyaATUoGaTjRen3azWx2wqdNJQ27GxCeiBOnyqUTOhShwkyP1Vzj?=
 =?iso-8859-1?Q?77bIAAeM4UejSRX9Ueyd0PieiQj29r8FPUlnmPHuLC//Y99VEX/AyPC6Bc?=
 =?iso-8859-1?Q?67SmWjzFF1uR/XJ7hksQ63CikngHKK1zBPreaQLz+CA8TeyitxSlF1keMK?=
 =?iso-8859-1?Q?uu3S2XT0gma3DTiuXtAnA0kXeL9JUb5zUbThRjSDyvaIKi4jmR6joDgrPx?=
 =?iso-8859-1?Q?3oCm3z7qhdEYztBQvCgugRdAuYGbd8zHEW1uOZNhONc7TYqPg69EzvLUPZ?=
 =?iso-8859-1?Q?J4I6/kUc0KjyExT6cP5G1+1QDGaWkxMfBTMSGcuw43EOxQipwS4M55lEwK?=
 =?iso-8859-1?Q?7YwnHN34/ijU2i6mFIl3IpOhArNuFs0AVy/9cYGrNOOn6+Wk3PTQz4GZOd?=
 =?iso-8859-1?Q?4KjSkVgfq/oZwSqyNpgtbBCFvxWj8IkUztDlv7Fpqa3aSHJjrRP1ffsCQO?=
 =?iso-8859-1?Q?e6AWaVaBeXnOAK8MzbhQXr3qrRj8s8vrFz+brWNTjtIfRYzHsBOiUXEzmJ?=
 =?iso-8859-1?Q?rVV1D3hAzgnfetIc3PkZwvHPxOxBipJwXpxTrTn3bzywWwsT0uCevwEJO7?=
 =?iso-8859-1?Q?97Rc3tus2CLMMN9zVSwDr5v5CkaFWbThIbPY3kbKDsBg2eD1sClvA9Gakf?=
 =?iso-8859-1?Q?SSfc7cXScPDwpr8fPAooDdRMrrR9pF0ZLjBsKU4b7msNi1Yjh++QHmUuzq?=
 =?iso-8859-1?Q?y6IBYxd75l+1u9HrqsTWW0BjAJxrEpI5YLP51xJgxXK4H4AOqvQ8fPnEu3?=
 =?iso-8859-1?Q?0mjwzyPqY0vSfgdMgDt+VhgnnomNQkhHUJjxup/3dDV2pNmdsav90/3Ntu?=
 =?iso-8859-1?Q?6CfiOBul2bR04=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0d0397-86c2-4653-86c7-08dab1b24e2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 09:14:20.0026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXVDKL+xxsTU8oF5lIJCYwSEOx8DKapGsILcFs86GewAaTi0xKZRx+/U7KNfV6n0DO3GH63K5OxpCaNNHpI2UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0620
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdzTOu2/7Xoo7RW31H6vPqpj3QNOipYlBKG1/90FYAE=;
 b=v991OOnvSdPiYsGRJlLSQmi1gxPcnrDjiljFmetflhsoNVaoWsMNifbTq8v9yHNSpPXX9TzVl2LyhpXDoDPykbmKA0xHeZQ9cq+W0+5Dv5cBEDnVylsK17btfnRm4afgn0guvce+HrEiZjNcAawJQiFpG6hGo+OkUQMl5gwv2wM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=v991OOnv
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version 1.3.11
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Service release. Issues resolved:
https://github.com/eclipse/paho.mqtt.c/milestone/18?closed=1

https://github.com/eclipse/paho.mqtt.c/releases/tag/v1.3.11

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 931bf5b9c8..1949abdf1a 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c70db96e66adacae411d5d875fbb08bca6ff9945de3d215b3af93cbd22792db5  paho-mqtt-c-1.3.10.tar.gz
+sha256  d7bba3f8b8978802e11e2b1f28e96e6b7f4ed5d8a268af52a4d3b1bcbd1db16b  paho-mqtt-c-1.3.11.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 1b6fc5785c..30daf863ad 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.10
+PAHO_MQTT_C_VERSION = 1.3.11
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
