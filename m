Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8B4EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 08:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAA5C61360;
	Fri, 14 Jul 2023 08:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAA5C61360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IU9peRS-un1u; Fri, 14 Jul 2023 08:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5425960AD5;
	Fri, 14 Jul 2023 08:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5425960AD5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02A591BF31B
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 08:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE1FF41B75
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 08:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE1FF41B75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cj4yvGYs4ekk for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 08:13:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84D2941BAB
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::623])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84D2941BAB
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 08:13:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMo2buT+4riX/P/VmBnTfHO8I0PfI3EcJNzsQYj0M832w/97ZFYEGlyt09ilChfPnr1qW/DA0yOyU8pgcz3yqp7CP2GzoffDvt5IR3aAvNWKcLEvnXnPO1mctYTZH2gK8TAW/xB/zIk5WstxrcG4Wejw5qrGII7bKRns1pB7XGzixurXH8Kwp9viDCxuYZ8rpEKDNcLNC01gReu5SZMZP3eVjkK1agoHk2LMH3t5jD7iIbvabvb321Fa7yK+7HG5l2aRrzTQbkI/+LPPzmtR3keKINOC7x08XNhOSyw94+MCNTdGtGc5VVCrhdp5zU3dISnQ6QFTgyeClXoFa2fJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L/m/OQlDuFhInwDTlfQl3ZRRsZUXlFtRDkvuBLeqOk=;
 b=XJeGr1CsyLl2zgbRZl2YCYA9NF2MWlJ2RFt6HKh6C7GUhw4IxzpBrXDmDUlJZHzbpeozfWB8nBv5GY3BvyDzJ0wwDLtlaiULb5+nUKsABtm+BImzgajXDBLhGOeYXyBhdmnK1/ujA7b5C0/WOR5l0XK/tsijMDLrRFk4CoViCwXvkzO6/f5Z7GpGwaRA+CNX2S6IDmkPPO9KS8XAqX96SdKowtqnwzWTm7VCIzqS+9+xIHWsB/Qx8j1vy+XGuHwP3kI9XgYGYvyMbuUe7Wpm53un7B/56/LYBfWe6WRgDPq1dTyAtpERzvRNG9LpCnVOWCkNpql7m/w657krmc7teA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by DB9P190MB1035.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:224::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 08:13:28 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::601b:b544:2969:e9ed]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::601b:b544:2969:e9ed%4]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 08:13:28 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2] DEVELOPERS: update entry for Daniel Lang
Thread-Index: AQHZtirv6fwzmHMHe0qo760S5yEW9w==
Date: Fri, 14 Jul 2023 08:13:28 +0000
Message-ID: <VI1P190MB0493E124A4F5136F4D451EAE9F34A@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|DB9P190MB1035:EE_
x-ms-office365-filtering-correlation-id: 4269193e-8412-4188-4bed-08db84423424
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Fh9uSPm9i7yeqfPtPBRC7rCZkhzOIr6DNfXOxbctj1ZIFy/dWk9sIDrtUzGgSdn2XGvV/TM1Gou5twNrsnOZwcj+G7UzfBjAeEpRhjse/PXi/jBL5kx+YF42X4nCVmRGm4uoyJRctm1gd/aMThqN7SP8U2bWApgdTK+375cPoVVoTYa+J6WBzmzeFIL6tpC+GSqTPYii8/HYu4OyIdrLCCZHRCG9OmE6GSlzGMTlwNP6XHlntmGFKYB8kOulBx83KWQndo9FtaqLuC0QKAKYf941j68cClt+MoXFXM2hZu5Uybg6T7dBgl3KH1QZObzrvJILP5FffHF/wSUF7hpZdyk1Td0/735f1cLWzsY4QVA4g8v0p5JHX8iEWevAt1J2dSlg4KBP5TvIG9MqRi9MzgWD17pcHI0xaqKXQeEcgo/xjFZADVYu9oNa2I7aJC/CNElazB8gfeAY6QBdnvzit2ayUDd6xpawLvd3fGT4pzGETLCJydNCXQgP4Zmvb8Bfw+jhS4ylDkKWfnEsIORBxE3PqL8nIdISBrp4mJ+qjn+qE8UeGxbGKf/yZ9wVXm+QZoUQgPn0SjZ3zNXXOBT1nK9kF19B65Q3ixvR29ynhxkHYR7dL6OQJ5cN8jJ5A9v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(39840400004)(366004)(136003)(451199021)(86362001)(4744005)(2906002)(33656002)(83380400001)(8936002)(8676002)(316002)(41300700001)(38070700005)(5660300002)(52536014)(38100700002)(66476007)(64756008)(66556008)(76116006)(66446008)(66946007)(6916009)(186003)(122000001)(9686003)(6506007)(55016003)(478600001)(71200400001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bBOCtFztZKiZM65TCkKpepSDfhJYC0cmiZTtaIb+4cJFThjo4d6qr3K0pV?=
 =?iso-8859-1?Q?fl2DBYjwErJwWr+5QC8UQAWYgBPoA5BtrEmvARynWk9BseSq/5akjMTqax?=
 =?iso-8859-1?Q?iqpkJQZeE/ZTPycPeMFZpUPB+B/5LnAVsuOmxYjFRfBZHb8sbAo3IcBzit?=
 =?iso-8859-1?Q?LA6W8WOIZy6Z0sKvgQ1/wBjd+awjZKqev7Ie584370fqw5HF6JKzWDZEuc?=
 =?iso-8859-1?Q?r9Crud2ji1vduvQ29AVzMN971GcYY7Sy/j+wlZ+KR/BEn6ZdrNBhUsJ5/Z?=
 =?iso-8859-1?Q?pyDxyglt20C3IIZxzgXVQe1Q32pVwocBP6e/zWuT7QJsAdUsT3O8ngIvNy?=
 =?iso-8859-1?Q?2m6QnSfaFlhDGYu8l6p2riRqdpN3MVq1JldlcNDOfzg3zcCDg/QDKqPxeK?=
 =?iso-8859-1?Q?Y9oVOKY14ISxt/WJubiE1x8BGeB9MDKQ7DAPwxSa/IgPS/tKGuQcbF/P7/?=
 =?iso-8859-1?Q?RXEW9HVmGVHc7sTa19YY1iECtbbhZWbL9ebAuRtyqUYLiGCJZXETbOwUSf?=
 =?iso-8859-1?Q?35/uET9MhovSIdvmXEGYv5jMCW58bOUYuQ768n0rp1FGSJx26QMgJV2lMH?=
 =?iso-8859-1?Q?FmyCc2YD4W/HgcjHGvaeN+Q/mB0J/FO5HyoCgHJBoGWcapiq+tyEwOCpII?=
 =?iso-8859-1?Q?kspYaZtbY7Pif963ZO7hNlpLgrHGgHtPTo+YRRefU0e2hlpR3wGKWKYT1H?=
 =?iso-8859-1?Q?4haTuC39+hHgeCra4sg6g0CD5f39kTdfTM1FqhJmH8PcmPYfo5tYMgm2Iv?=
 =?iso-8859-1?Q?OL4T4rb2Ps4iWRos6fg5RgEWkeRTc+psmDga2617o8st/Jac6/PAT0jD1h?=
 =?iso-8859-1?Q?+GyAcL8+e+B8NUQa8FxLG7GTRyBudWgbbREDYniiznZHCoiDHXL8IxX43b?=
 =?iso-8859-1?Q?vHr+QH17WF8+KTa8sKxq+ddQlEWP/dkyvqQP4tqDoMEGwmwGdzRO9dvMBC?=
 =?iso-8859-1?Q?Km2ATg33UhvjeeTQWsgnQDIAwUJTuohw7X0+u+zDJpqsOczHQqhKDzfMr6?=
 =?iso-8859-1?Q?5YroFgd+LyWCHnsK5/SO+tV7AXmO4ePl95uetbbxIpBWmbKmbfdfqXou9a?=
 =?iso-8859-1?Q?HkP+y+fPsZQfmilR0ppc8JVwcoKh8baINEAMToKf5WTfowUV6nATAUNBIG?=
 =?iso-8859-1?Q?AhNZN4fK3LM6qVCQOYoWmuY5uNv1C9DRM68ce1FlFMyRmRd9LvQ+5QpmXf?=
 =?iso-8859-1?Q?uKN9uQ8k8VCRd7tKVB3Ql/DaNs6H74SQ1HGImdp+0GTU9+v02UeujY+Xcv?=
 =?iso-8859-1?Q?XDH6Wp88UU0dzbL1NfxB+DrmUBb2Og4dRx+Q/ahaI28QNpVp6BnxnzKqZD?=
 =?iso-8859-1?Q?S3e/ySnWzQzHySPP8CcdK3XYmbISWtySbB95JVWsVGTIl4Dj6U2Rgh+C8z?=
 =?iso-8859-1?Q?FpQ+btXEHbnLQXsGkP6foRSwBSeg16xSRpQp/b0No+R2NULNqDDERYqtlr?=
 =?iso-8859-1?Q?en16/2OVGPsfPtviIqqwRqEMWBViY3BdyAe3edzos6IjY9qndPwjcYbniZ?=
 =?iso-8859-1?Q?fKhuyZeHp3u1SpT5Gfk05AFrNWbic04ZCiwXPWaNkFtVHqI4pOhwOHk/e4?=
 =?iso-8859-1?Q?UpHAia8gJpVkS54e8/oLjAMy8E58jMqQazDPguRI5HQEdyjBjEK/RmK2Dc?=
 =?iso-8859-1?Q?nu+HMEIi8VjHe0UPzO6Lk3Mb6IvA3Rdu18B+mrA3SypdlmWDFRznkpe1Rq?=
 =?iso-8859-1?Q?vER71Wy6DUatsxWqw+0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4269193e-8412-4188-4bed-08db84423424
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 08:13:28.0252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FNVoG9+Ba4MafIXCzSywsLP04GmnwDkHT6NTPbgLuWf20A8PWzczrdTmvp4Bi1SN9mNBDHj9R2H/9l27WbkwsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1035
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8L/m/OQlDuFhInwDTlfQl3ZRRsZUXlFtRDkvuBLeqOk=;
 b=nDrjljSF+o+fqPk3Lk8dKcEPeghkejVyn7ZQ0C6/4GKiz8rqRIre+Z0THuWLShGCc2VbDY0XwCiRXt2E/ha+HnX18EC5YNZg/bHr6opNke8hwCm4yLlXJz7AZfqVG32vMudyw+o39nL4UZK6eXZvFnLawez69AfAVqGuPoajfKY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=nDrjljSF
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH v2] DEVELOPERS: update entry for Daniel Lang
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
Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v1 -> v2:
- resend because tabs got converted into spaces
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0918e9f721..32d0a5d0ee 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -649,7 +649,7 @@ F:	package/odroidc2-firmware/
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
-N:	Daniel Lang <d.lang@abatec.at>
+N:	Daniel Lang <dalang@gmx.at>
 F:	package/atkmm/
 F:	package/atkmm2_28/
 F:	package/cairomm/
@@ -663,6 +663,7 @@ F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
 F:	package/pangomm/
 F:	package/pangomm2_46/
+F:	package/sam-ba
 
 N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
