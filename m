Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A58AC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BD1560B1C;
	Wed, 27 Jul 2022 08:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BD1560B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pP-lHKm8F4Z1; Wed, 27 Jul 2022 08:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8972B60B0C;
	Wed, 27 Jul 2022 08:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8972B60B0C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D1361BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA42F401C5
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA42F401C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7N-GHjIA4gh for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2426840151
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2426840151
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:35:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCduI+/zWHWWHfLSWGLCRZo4Q8SD+V7VcZGDpbdMxTKcSuISDE1Q6dhGiE7jXZqmNhXkhozrgI3bTIvg7i40XF1+xwKqk3E2YIZVaC8j5FRkIHbZzyDI23tFmLO809WulH9dy/y8wHixOQIaa+fjV15wryWqyNleNohzth9ICA29mYRyksEZ3t6TlY9gA41RJjqaAbsxjBVaIEaMMmR45yD7JtQco/8kAS5UJbCNuUkadLuETg5t65zaV0gzV8hSPWtypteP7/+aK5myrsXYL4Mh+tpCHm9L/5KJz1HlYvaD2WgCEFLzcM0d+BvDWI+Rg48qdFGhNqERg1WklRvcbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDzgVf/tkpxRDUVO5tnVnQmldwhliB5hQVsehYwOxpw=;
 b=QJ+FnT8F92SPqF5t8IrEbWVmM8bXvw9VIfrsToQ2jcgKa8aHwdjQVyJPIJiSjHaPCi7aJEbSrxWgpJSBEDf34JbMUce8TT7C1XmmfgzOdnjsWTOOEuG36k2oAhKuQMdOae5OBcaZW+9BGxntthoS/VMXDadNmdoZsbqspnQ8YP2mJRuc6Hz1Awr9Tj8RjT8Vn8GitQ54n/owwaZiFE9hix8+mcQqhUTajqaRr65vg21H9D1XBcteguQvF9IXZAKBuBKAeKzotEr6A3/Ne6qv637ie9xySmkbWQDniyyOa6I/A9GrY2s86jMExvWyPiAZcJvpE1vSjW7z9cltymwgIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0743.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 08:35:20 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::fd1d:ab76:5962:e87c]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::fd1d:ab76:5962:e87c%5]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 08:35:20 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/paho-mqtt-c: sample file path without
 white-space
Thread-Index: AQHYoZOjTW0aRMr5CkOgkKwjIhn8uw==
Date: Wed, 27 Jul 2022 08:35:20 +0000
Message-ID: <VI1P190MB049338FB77B48163B93C25A99F979@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01c92792-7bf6-4268-09f3-08da6faaf0bc
x-ms-traffictypediagnostic: AM7P190MB0743:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 217qi6sCA8ipriO8Pun/sH4imezQlKiJqC+nPJ0Wd1wqNeC5BnvaxvjSwkupVNPSsK0sHUqwmjKPT7NiB6MZwoGNdkFTICsUA1/KJE+u3COps/XolE1pKVqT1A6HE4j+ZNYSDd/oClXp67jgD6lzXJRxfpsbqTr9YcNz6meClRci/A1x0ePseLl92momZLAfS64R7M6so3pvaWjWRZQds2hvtXFfxrdKT1k/tDJiSsFwGoBcwDNkfgYMOJ4UsL8YJFLGN8UexyIfKifg21KWGIjmfcBK+UV5/+AMV/i99nnhkHzMgKKKMi7IbHuR7DplwneOvxt2JACoaXbSIrrNSe0zP649UhhR7QozcoVxuo3/09Xdz+0QzzIM4X/PtigxbJ0IrmvX8YYaQkxSxw6fgfm+ydREc21BH2sx+H9LBSnFsqC0paX1JEIGnBPHPfbnWvQWzRPVVUD8KQNdMQBE+Pit2Iecb2c3Emh5tOPyJChE8mqxix5A+DtlG/ndgrq7c5txa3ubJPZS0OYvizRediRMU1+SuuEv3eKkjZw2+XZL9av1qZMY2gOHVnByV66zKjoDyUTq3tVtIJX/yRLA1uNsoI3kR2EoWgsy4MUDuim8U6uHg1g3zrTJVQPPlZkNQOM3Tnmna/6NeKxr5ptYSu3D1j1dkbFDDyJpj4uhXbAdrMFdJcphoM9mLVcvy3+0hpV1C+1PkCES7fNkzmijiwx/IlPUfiLysclKjnzKLKncGwjx1xIpTfr16NJB3Vcu4ndIwLK9HEoUmbWMCeQpUiRcTos3vpFhBsIT7mMga3BQd4+vqauMlcP41ibtRWt+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(366004)(39830400003)(76116006)(66946007)(64756008)(66476007)(186003)(66446008)(2906002)(66556008)(8676002)(71200400001)(4326008)(41300700001)(9686003)(6506007)(7696005)(8936002)(26005)(52536014)(478600001)(5660300002)(316002)(122000001)(55016003)(38070700005)(38100700002)(6916009)(86362001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FkIG/09IHqMono/jPOqEehjnAtZLByq16HwQRmqEYpJ8+zsc4X24Q//eIp?=
 =?iso-8859-1?Q?ljASbzkXoT67Xj8uPGZJwEJknVKFurLeGjMRnvJuIouJAwHcaF9euqOshq?=
 =?iso-8859-1?Q?CVreWsZjTzSo6kvjL21CDMHfGrjSePz4D29pFN5wME3JlpYu7hkfcL5MWw?=
 =?iso-8859-1?Q?XIhc9UpbjdOwlPu/IaphsEOUDytA2xysokKLEjtwn9Y6VdG9cxMUEaf56O?=
 =?iso-8859-1?Q?w+bJ7dwOzq3w5x593UoODVIoYlZjRLe18fOKiPl0P/l7mNpknvkqPP1ZfS?=
 =?iso-8859-1?Q?Q7ZdXRhjV0QUWJOcitPUT5377+16bLnF1+yJLR04caDgW7rw+GXe3FLT4z?=
 =?iso-8859-1?Q?quc/3MfVcEJG4pYtCbtsuu0iZVEt0FNL67pc8DdMBK/tFpXu7LB23ZLrR2?=
 =?iso-8859-1?Q?qaIJmDKjMvAUWMIp+etpdYyyo7wQdEA0S8lHAVPJ426MHK9jQqYAq5oTll?=
 =?iso-8859-1?Q?bz7Xu77xH9nq9R5r5nTF/KMpw6ca66GKW3nTz6N8Ca/uNzmF6FzL21Cceb?=
 =?iso-8859-1?Q?t4/2nJRhq9apMIZhN+egTqzTBcMU1/T2bJtuMagrcMwChvaAhyzIxsAPVj?=
 =?iso-8859-1?Q?S0Jh01DxZnW5+hpLTkxKqGVX+Ptp/+rBLusjAIH+7vYBx8wlHzrkXq9Dj8?=
 =?iso-8859-1?Q?O71BIRxZrNS4K3iDJn07XvfMl1AdZD2/lDCIZ3VhNA+S7hPVztII45BPh7?=
 =?iso-8859-1?Q?3BOzqb4Xl5BF9bW9HWOZdFoRnRa9W6p7gyXuEujaEnOmR7B+Y+ADYmyiDD?=
 =?iso-8859-1?Q?lDUheS03dCtRgEU9CbZtGBMbSwgD0f5Dr1Xn0kJGgBz1CVpXQElOPtjEGp?=
 =?iso-8859-1?Q?h50fOVRh7tehbWCEIOrKc4h7hMyQbnCeIMORHIdNTz5Ooa1OzRjsoHd2V3?=
 =?iso-8859-1?Q?IFCVm5owTobToGdeCqcYXYs5fBoiBR+CUo69uHtRumk5tzb5mMkHpeJiKH?=
 =?iso-8859-1?Q?XdALonc0ngEotsxBK1iD6KQlUAl9KMvVDr57+djFEIzVRMDMi7Tlfkg9pi?=
 =?iso-8859-1?Q?TxReqADQQaQcZ/WOCdxNBtKW5gBtL/cao9/5+2pZN0WX1NH1A+tISuyuUu?=
 =?iso-8859-1?Q?H/RXPCZUetUC62YIrbN9GOkd4s0qXRvDhfwQHIQqug67F5M4eHhge/dP1/?=
 =?iso-8859-1?Q?/4hoLXgWTouXy4zT2Jz678UPp2ZeLPPcG962Ow9JiOcyCfDS7vzGgJNBAD?=
 =?iso-8859-1?Q?H4qdIqtq7RPJKmxqf+GHB44VX+OAkXxuHJ/adIz5XmkRawjBn5e/CjgSgb?=
 =?iso-8859-1?Q?3jtJKsep8Jl9vpQbX+uBqj91vemFKp4W5Zm/VskKKiQ/lLDNbv8MKUF6Bk?=
 =?iso-8859-1?Q?6Hk+sly5q36b4Xs73zYKCukrJnhzQAwAayFlNiVieteDVXF9yjBts7681g?=
 =?iso-8859-1?Q?RsT2137Jwzomp6MWU7Qu9iKALEc/NODH5x1oQLiH35zwPaooHZtVUSViBV?=
 =?iso-8859-1?Q?NQOvjXlmawha2Ex9itB6QhHt1OxyrhC/eZz06tJclggRNcviX3InHhiXdO?=
 =?iso-8859-1?Q?a6tP80s1fBDuu3jRJ2uhPjCaNHLmO6bx8zU87PbdCWl+ZNaaBs1bIfLIuj?=
 =?iso-8859-1?Q?3hxNCzxtES09dvoXPKGuUzb8cVJGBWiNXOgjdi5J0KfzDb3aac4okf3KE7?=
 =?iso-8859-1?Q?25b6jvzPPt1xs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c92792-7bf6-4268-09f3-08da6faaf0bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 08:35:20.0012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T06rEIPwR+FIzs0THTabkp2N2xICW9SkOOIWYeXnXzGoA1ThH0mjTqV0+hu9x/3s+dAlH+GfkyFAaH3OUrX0ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0743
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDzgVf/tkpxRDUVO5tnVnQmldwhliB5hQVsehYwOxpw=;
 b=CWOkFknc/ysN+XEbVw5Wt01owCF7xUzzypEEYGPIbMZ4FxUEXuOKK12TcfHpwMb+P3GTyu2CszkpNn3qRpk4N7ph+9m0nV4cyP/S5GXwD3ZRtYnDQHnbDd7/0iFGm3+DTvgzfmtehlIa27DwR5BZWVQSxuJNdCmf8iBWbsWh4as=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=CWOkFknc
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: sample file path
 without white-space
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default sample files are installed to share/doc/Eclipse Paho C/.
The white-space can cause problems later down the line.
Therefore the path is changed to the one used by paho-mqtt-c
when configured to build the .deb package, which is share/doc/libpaho-mqtt.

Before:
Install configuration: "Release"
Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_publish.c
Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_publish_time.c
Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_subscribe.c

After:
Install configuration: "Release"
Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_publish.c
Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_publish_time.c
Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_subscribe.c

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/paho-mqtt-c/paho-mqtt-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index d6356a7ccc..1b6fc5785c 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -11,6 +11,7 @@ PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
 PAHO_MQTT_C_INSTALL_STAGING = YES
 
 PAHO_MQTT_C_CONF_OPTS = \
+	-DCMAKE_INSTALL_DOCDIR=share/doc/libpaho-mqtt \
 	-DPAHO_ENABLE_TESTING=FALSE \
 	-DPAHO_ENABLE_CPACK=FALSE \
 	-DPAHO_HIGH_PERFORMANCE=TRUE
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
