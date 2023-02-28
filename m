Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C57EC64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 09:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C10CC81285;
	Tue, 28 Feb 2023 09:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C10CC81285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88-s6BtVSr7a; Tue, 28 Feb 2023 09:48:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F8D381272;
	Tue, 28 Feb 2023 09:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F8D381272
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C607C1BF21A
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 09:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98BE04039D
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 09:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98BE04039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDnhWvQ-gyF4 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 09:48:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16FCB400D6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16FCB400D6
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 09:48:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0GzK/JGl5zavBbmABheAEvT6bXHbEwmOwd2HSdWF0SLN21Vx6ITygJ53XUfVI1c9Hf+ZRa/EOxrGXJdI4mAEVTOJpJlENyuGXg2kwvT2Kx5+engroFcfBVeuC09Gva2sqdqHAbpYN/4BL/UmPaNp/eWMXRgn9gqO83phLH/moOshTKsDTs4YH6MDJGpXNc4s5FpXBRgem1EaVAykHCAuCSrzjyWVqGG3BFeVGQ27LkwzE0knaUxY06SkFuOqZ74hkC8ymtHKMq8qvLdE8yZ4555RXxylVltKgBrNKtghdG9H/ZgIM+EDZD8wmEHRWKikK6asvfpw7h0JFEbXkBwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/P8wDf1v3ee05T+VB39W1QIZNr/LDcfTAvygOY397U=;
 b=ke/VCk9YV0JoN65riSz/jiqGFhGh9fLbqeq31e35dRmR1v+vgBIJOlJdFFyrYRYTSGCuy/S4gwNzlxnPitjXNaUKH79qOG6oG3vRSreevjqoudAlurfEZjcCNKKow5wBJKUhD6mYsgDGisBXbfXcNM3AteHIQgq8K9G3xF44wIBuWZ7FdhVc5bpTT5h8lYy8qCchJDyXgr9rJa5h+63+mYrgowDWi7ux2eZqcIylwNoiNuO6QZr5wV6wDLkhCR76lZV/wCt6yEZeE7JxWuULBsfVnBDSsRldc+DVSb1w+3q4llYSDwSuDdBak++Pu3RJK9BKy8GyDNyB07o0pOLnEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM0P190MB0594.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 09:48:22 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::154e:a633:142d:bb0f%4]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 09:48:21 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/paho-mqtt-c: security bump to version 1.3.12
Thread-Index: AQHZS1kVViD9wUPei0O+FbfpjSVbvA==
Date: Tue, 28 Feb 2023 09:48:21 +0000
Message-ID: <VI1P190MB04936158D6DA5D95425FF1E69FAC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM0P190MB0594:EE_
x-ms-office365-filtering-correlation-id: 2775b75a-3a79-4372-2cb4-08db1970edae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wDf1EMe7PWRcDtgZqzf31MWc6w3UfQ1+2Bzt3Pa3lbFczrr7xutDj18xcclwrAJPlz4VXf0IWnpwt5W9RBNOoRiGocWoheDakSg0ezEpVjh35w31uIV3VTUKl04xuJIWPl9P2pyxXOaK1ZG9zOkgSJZcKuwGyGE2NgVMBpqxhiVr3Eu38Oc0WoBlKe94xjwAkd+JrsHiv7OReENzyCtFJrQ7QnEQ6tc2Me16frzuR1ATGpX7YaqccsIYgiIShIZCf2Kyz83xEt/n3iU1+T2qGm03fazno/lH0PP3K0yKHPdC8+xUqXPjSS0nQGHMIKlGq0k+sKxxNOpEaJovMoqv56oFPz0MRv56SBNhDF0RPtTaAY6ij3xhmfGFfur94hsHQntnXxkO1u70slU6yECGt4/d/4pYuX8lVFq9zxQApq1lYM9vyN+whwc3/SnzApdWpu+vvrlOeBJnLU+1+ECNkDcwm+MReTrcpxk8LK59lHYmkvyFgnjyWvSue1izzRLdElTjLMTQIQYsvmZT1r9RysCvw/d98FBkoUT7WcRQ7qHp5nn1J6vxTnh7a6ris38Waz2ROJVn+J1ssZ+3rnCwCvqCTXH6Mc7mg9ozM3baVD2lZpfSMZd2msgvpOI3ZbbOMcJyuXRvbJDDuDQ/8GYciCETwWi+cQ+AJLmkAMWHmwY6M0JBc1zAblTvbaZc90wl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(451199018)(26005)(186003)(9686003)(52536014)(38100700002)(122000001)(8936002)(41300700001)(38070700005)(55016003)(8676002)(86362001)(66446008)(6916009)(66946007)(66556008)(66476007)(4326008)(76116006)(83380400001)(64756008)(478600001)(316002)(5660300002)(33656002)(2906002)(7696005)(966005)(6506007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?w3rUVPP+8ofh7wbaPYT2wCi4matsUOEqdG7GjCb+XxKoM7A4MwshbKtYQQ?=
 =?iso-8859-1?Q?//3ov9hgClROmpizDXTYzvklR4yXHg8MD/ZsKGY4rPkx4gxr50eQR5OixG?=
 =?iso-8859-1?Q?Nx2GEIt01JnGvXq8d7dbgFYcnaxSGAeSo5lRfuam1P95LsyYc6ASkIlYtH?=
 =?iso-8859-1?Q?kRdAl83Iyp2iAVL0UFxlkvD/vMDGy7DDmEL9IR7+8YtVG8eymTGEIwPXsi?=
 =?iso-8859-1?Q?mN+ElAGfSOBn7MXcaeNNp2yWqOhsapD1druhtHozCFGlNinxlDvOw/fQu1?=
 =?iso-8859-1?Q?+iQqM0Mt+MQiIzkw+DV1hrx3bGqirIROfShwJ5HG00Flyw4fK6wntK3mPG?=
 =?iso-8859-1?Q?YR+YvYBdE73ScMa1xNRkr6Il24N+D3/vA+iK1dos+7xihxaC8KW5uHDqAG?=
 =?iso-8859-1?Q?R/npjJk+sEZHmaQe+ZdUapZ8ZV8IbqnthSMPTiWmc4254327b5VZgZNIo8?=
 =?iso-8859-1?Q?BYaJKX1Y+dH8kjxIoWvDikhaW7627B+rs8hMUdqTmNBkmCVkYBCVbMJkWJ?=
 =?iso-8859-1?Q?YnUhgKse1zcwPFWZ4w042lWrad6vfSHOdHUkVIlTji9g15C8acEDIFJZ3P?=
 =?iso-8859-1?Q?X0aaqPbBEtwO9X4uRRoAphMD+PGRv0nW1FvF759AAq6tLYPuK8luzf07cV?=
 =?iso-8859-1?Q?Gqwss/0TdazwLapKL73ysBPrjz5OC2sknStmHEVHdhev+srKvJ0ZGVPWEm?=
 =?iso-8859-1?Q?qQGF2RQq5d97nDhfhvrLrrk23jhfYuX/rczrCX+yzOeAYEzVFREFkD9BCc?=
 =?iso-8859-1?Q?KUlyJgq2x2USZpIblK7kyQbyqdKZR1qw8B6yt4ZVUX1v7zSRRoshKf5Tg7?=
 =?iso-8859-1?Q?THq7OhSU1jhUapOAXtp5rFZO6LQ51YiCGtAqaNzrIebU1RgKKWBdG8S/CY?=
 =?iso-8859-1?Q?AAkCQ+mwxMoqdfh3s4TJ43EFQV4Ethqyl0m+ikO8L2OoyPNgpApEn4/9/Z?=
 =?iso-8859-1?Q?QaqOsjw2OCyVglNsgkn1/7cu/XuOObTihYwgSsqFfg6AdpGev8MTsam6uL?=
 =?iso-8859-1?Q?cYsVxx/6Y+ryoys0X3KKOQb6M5mmPhI6myMQ28wmDnK7JZGng16e3CUQYH?=
 =?iso-8859-1?Q?Wa8TArUD2SpHTNFxuv1YdFl+NhZ1MOTyip+n86R+Z22yuAJ8oLPYm42MdL?=
 =?iso-8859-1?Q?XK9NyY0yQkuDa+MTy+CCGQ3cVlAM7sE8z2NJRL1uWtpTnRHjqT5G5xJILI?=
 =?iso-8859-1?Q?kiwQ6VEPkwoaGayUfdOgu6NCZspbM88c/lo4hU8vRY4yh958iksK/U503V?=
 =?iso-8859-1?Q?ZY0zr2hzBvFUPJ2+AC53gGPtcOusMN8ykjiQ5kBahnsT+IWkRNwpRhNc7f?=
 =?iso-8859-1?Q?qLg+0yV8/QUbB93UnJDDT2bSEaUJQHwj8lglt5yjVXLegSv/gtLSCijEHT?=
 =?iso-8859-1?Q?2YTXg4N0hDjeNbAPRMXk8L3VPmnKw55GkDTu0xAUTW48eEL9CqSrQMJjig?=
 =?iso-8859-1?Q?vgt219EhgfEy3BYaz73Aig9UtOE+bD03jSWQfWp89wlAwhTT7IG3OVs5p/?=
 =?iso-8859-1?Q?uXZWLb790qZasQbRM/4j4foq64hiK8qIDc/9ayYTF4X17tozo1x5HwHtMJ?=
 =?iso-8859-1?Q?7RK+WuJSWNpk3+pwVXbKjj2+szv8kxoHSf6Jbl0E5wzeXNXNOB08Jk41NU?=
 =?iso-8859-1?Q?xSGBNCdrCWwVA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2775b75a-3a79-4372-2cb4-08db1970edae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 09:48:21.7391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAunZbBAVh34e9wevdWrj+JHMsWSNsfwLYm9lNk2dv6Ezi1DWuHULakd6HRn0J1urUQSV44T/+sqcOHxrGtsow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0594
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/P8wDf1v3ee05T+VB39W1QIZNr/LDcfTAvygOY397U=;
 b=QfhQmtqt315P1SvX7v3KptVmH/RP6sPhq7JqfYa2dY6X9iybIJpIeRv2jTGAbprPVvUyjnwSTxX8JdbVF6mEO5L5dyki0tnvJkGYclhgcAQT8EAvAV0mp0q8rQIiVITAjejx+M5U7JSh+mj7GcxPOaDy1TStnCrkFQLsG2VhXOQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=QfhQmtqt
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: security bump to
 version 1.3.12
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

Contains a fix for a possible race condition that can lead to use after
free:
https://github.com/eclipse/paho.mqtt.c/commit/911488a9f0fdad31c85ec86712be52587afdbbb8

https://github.com/eclipse/paho.mqtt.c/milestone/19?closed=1

https://github.com/eclipse/paho.mqtt.c/releases/tag/v1.3.12

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 1949abdf1a..529c538ff2 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d7bba3f8b8978802e11e2b1f28e96e6b7f4ed5d8a268af52a4d3b1bcbd1db16b  paho-mqtt-c-1.3.11.tar.gz
+sha256  6a70a664ed3bbcc1eafdc45a5dc11f3ad70c9bac12a54c2f8cef15c0e7d0a93b  paho-mqtt-c-1.3.12.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 30daf863ad..8d1fe009a7 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.11
+PAHO_MQTT_C_VERSION = 1.3.12
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
