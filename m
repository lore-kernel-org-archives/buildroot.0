Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EACC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 10:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0CEB60C20;
	Thu, 19 Jan 2023 10:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0CEB60C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7CUU5v03zaW; Thu, 19 Jan 2023 10:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EC2460C16;
	Thu, 19 Jan 2023 10:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EC2460C16
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C95DE1BF400
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0A9441972
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 10:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A9441972
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 80HoawnAtvUf for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 10:10:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F3E41942
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2049.outbound.protection.outlook.com [40.107.6.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71F3E41942
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkQHjxcEIbFYNzEgsAoUI13A4IJRQFy1rmUi8ykQ7cH3ivjpkaJKX8DEysyCfK6EzcL/M+kaGy3stonS/suC3mzYzb9pWmN4mMd58aydS0iRiTHCgHQgXPf3wTJ57U7AdSyICcTpiP2jsBMeMyu20HbYsr0gJ5X0KvbB3ltiQPwC64l9vdZh8iT7bmeX0QiglIC2bDDh9sUVXiB/NwD/ncWUJ4cnfJ9bjDyMTvX4oMxN/BHLl5IVx4px7Iw8T9/YRSayU686kYWAiiuyahUdHK+WEkTDrWMjtE9CsApqp1rP9/5YpCfIJ1nxVZM+ZhVrqhM80cJvBMhSz+QYj1tQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PuKnN1ppkq/O3tdbCTSBokCjmSvjuRcvDxt8vVVDcE=;
 b=DxIBJuPWlMTi3eZ+JqNMAtmSYf2/GUqRYFsSAeh8/iUaqgrQkfw4Lq+KaB4BlRkd72U0K+g9hIfFvzoG9ctHn8t2YE5KeOc+G3zdZ0KX/U47etw8oxEmbeE0Bq5s+oUIhPx02IoOk6gBlo5WcATX6MrbLs5+vxPI7Wq9F/5YFO9eyyyykwQFomQY+mZ7WQBDIKzsgeA9A2Fc0eGWclW62qrLEaqwChPzY74ZLAuWtJNmn0yUhaUVv34Lyvverb7GiGt+UrKT8gc4YLdVJYs+Y3+FOIsck66ZWgoevOmIabKHOtPnsZCPpU2nAuYPU/7lXD+oX8PByqXZz51GUgnAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0616.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 10:10:25 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 10:10:24 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 28/45] package/libgtk2: switch to https download
Thread-Index: AQHZK+zHwL/1IUCJ0k2shaGVv1d9xA==
Date: Thu, 19 Jan 2023 10:10:24 +0000
Message-ID: <VI1P190MB049399C22A7BC199765A5CD89FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0616:EE_
x-ms-office365-filtering-correlation-id: 92f21b74-5a24-4bcd-e4c0-08dafa0561c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SSzUxuOjRyzlkVaCnc0ZiN3d1+ToIIUkVmX2Ats8gHPaXKtEAWPfxP49lbOhJyxwu3VpuitDqOARkZPwdryzoNRixWy18/p0tjFMLEeTZUUcD9sIBG1/JQDcz95TIjCAJxmy9NOP956sl6iHzcbpp18iCe1TbS2cwHw2FAdrYXJcbktRSKmS6USkfbUDGFszXYxCgl7kcIANz/wJERTY7S5AtS9WbYXZA5iZvD+fHBP0mnn+rbyyqUrd0lwXrxptJ3ETEps6CDDd3niLQ17X23BWG5MyFUscEkyT1hb4uUuUJHfdrM/CX0utsnYEQAphWZ0kdu6JMJHXompiGdKCce3gaPVqehNWNGbNPBxyjUOgvDhiA5Pd61R7BOZm5KXEQHvtTw6PI9jXtC+kjGSVRsXYqbADtwDGPejD5XScSQXAkzfS39PAH/9U/iEAFbuTdt8WRfJRasfU2jkCOG4zYxh2VQFMh9QMaF83osovR8xUYjhtA4hz8shwpG1R+HkRpz8q/qmzbnDU50LJA0GrsGujA8hYKx83kYmJTzxX6p+poU+U5RLzAPSI2UMFJ9el8+ntWonRtvBAeq9/qMukpplySWyPgUHtUsPyD6czBlrib6CNY3Mri9uHWI9VpxzE1V/8IBLkYtlBnlLRObTtTnJkWCyFnh5pX7WpNd/Urr8ru5YK386HftW+bYCWX43KcNB3dnQEBxFLQDUNYjMDx8tu5bCggHgfsk3BsPGqB/o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(451199015)(66946007)(64756008)(6916009)(33656002)(76116006)(66476007)(26005)(4326008)(9686003)(41300700001)(8676002)(66446008)(186003)(86362001)(66556008)(5660300002)(38100700002)(8936002)(52536014)(55016003)(316002)(83380400001)(6506007)(478600001)(7696005)(2906002)(966005)(71200400001)(38070700005)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?e3bSsIN2eYcO7+pASUfpXl9bGssLv8XyIrCgjk8jQptaafyIdofnPIuuHV?=
 =?iso-8859-1?Q?DE7F98QLTQO9wCjyN1M+7amOtxAEl8H1BQVh9IzarW5t445RgfTnxaeI2D?=
 =?iso-8859-1?Q?ClWd5vq1Dqx0dP3Vr54ozDz4hicvwQsa9P/BQE7tzdT8sRmRjwMLFH9HxY?=
 =?iso-8859-1?Q?wwbjvvoG+fE71zVXL8RSxrsjumY74jxXye1CzsUBsLBpWgAglg0/hs9cB+?=
 =?iso-8859-1?Q?n2g80uJl4wKYKGiHrEumW9hJwvbUd5YPQGWm31nFIg4cdQNv3pWh0DPFZD?=
 =?iso-8859-1?Q?vOODESOV/OOvw6j1Fz1yBEyLHdrbmNzktghPNcJGHSg5tXvsW4UQt6lDae?=
 =?iso-8859-1?Q?4kA1etPN4/2dWSMydPLNJkCBOqd4zEabiEldlF9XLkczdNZBWS1eOIp9yS?=
 =?iso-8859-1?Q?i3yPJqcuLhH5dDOkisFHjj0PYPh+EdHpTAgYgE7STKZGH1w1v2WyhgbGA2?=
 =?iso-8859-1?Q?dNT+bQ/iKJZVAjYcHlnRsDEmhgpqUyTJB1uef5++LTcxXrL513CY/rAjiV?=
 =?iso-8859-1?Q?UE3FBGvMFJwwAbKHtwGXYsyVxG169YK4gktxBUFfd/xV+HT5WX02wo0Z2/?=
 =?iso-8859-1?Q?PBaWA3tOqTJ0c+G7Sct3vGOANRuRfGTRPo8LRwcOMa8AgH3QJ1YewqLP5E?=
 =?iso-8859-1?Q?B0gS9NDxCkn+vx8cIOiQ6uDP36Dagix8sE4dYZbLFlmEmdNitSJlsgsEPH?=
 =?iso-8859-1?Q?39pHIEgsPxASO7dBwT2zI05lDi3xYwDKBDghiwTq5AmReS0Vr7z4j8hgPw?=
 =?iso-8859-1?Q?UtrgJyrAcYInGy0G4F8OqrgykiMJP1a5DJNw1qMviMqlfckPwuw8CB+xp5?=
 =?iso-8859-1?Q?o/b/Ksu6kSvki1bQDgp+wlIJ7PCQMguwDgbn/hZD32kl2HOWboKza3CXb8?=
 =?iso-8859-1?Q?T1cZzCzowJhjZpuEougFHuub+waQ+8avgxqNXPKIQtI4SsqCGSmTkgp6co?=
 =?iso-8859-1?Q?ThFtDnI94rYwNHNOERf0fbwVd8LNKTPZW+rc3N0Ya+gNcNbBSj970yui5O?=
 =?iso-8859-1?Q?g3M5+3ANEXBkCQkvUfOt0stVsPmk0yp1pYeKLSYG3uSgGNCfswgvmvMAXp?=
 =?iso-8859-1?Q?z8Z4IXkWS/GTLGOuxu0sXsCVX4QQsf07HIDG8RHYBzD4+N7Ne/aU8eFk7e?=
 =?iso-8859-1?Q?5wu4zmWzPkH/ExloiQNUaXMvcBQB0L3HAvhwA65E3ZP2e1rGxDbpg4UbCA?=
 =?iso-8859-1?Q?HYP0TwARqjeKjfnDHLM6CX0/Tj+EZICEF8UIvrt76fWEdKnrJb8tlafvff?=
 =?iso-8859-1?Q?L9PZfBYK8gxs8gjOPEpEq9/VDusSJTXg/SzW7yn5fIQUf85sG+9ED6eveF?=
 =?iso-8859-1?Q?UutzOFVVfh3OMoGT3JkjUEAazVBLQOVaUNqpByRi7BU4WxJqT+5PRnGIh0?=
 =?iso-8859-1?Q?cCZrMH5PV5vrb0PLOg+32ozo+syK5hiGNDIELsswRL12n/I9gv8Bqw2vyP?=
 =?iso-8859-1?Q?AaTDMXSsoBhehl7F1259hzIHjxWv+9ouyXq26AL2QxItYDH+x55gWp8epY?=
 =?iso-8859-1?Q?TbFXGvZFwTmgkIYMunZerl9XjT2t2otZNmCVLLShMhaG2Wq9937fa2GNCH?=
 =?iso-8859-1?Q?pCxoiJ2yg0QNWXVuNBXXKjBTP9lpJUSV5iT5lE9Ucr+z0w3v25EqncX8eF?=
 =?iso-8859-1?Q?c/IazUaQ8tJbk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f21b74-5a24-4bcd-e4c0-08dafa0561c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 10:10:24.8123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5HoDO28gkTI0sgiKFD6jJSlQdQhqxDQ0OTN1wQMrxpmHfmzjflwyOCnEbBSCa6nNAqJUa/+nSQMGVata3VK1Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0616
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PuKnN1ppkq/O3tdbCTSBokCjmSvjuRcvDxt8vVVDcE=;
 b=tsvZD8EHFCsxcoLx/A1tVoZVGLloEJC4xAS4Pzb1K0OtPStBbgudARe7H2nqr2JmG6EnU/OQ9mE9BFnnmI6D9HS+0uy95BcsoQCx5sfaoozoTIkqkpFJsq3QnuNKiQUb9NvBHTugL/iTmF2of8qk9q80yTm/gPS37lwTt6wSjiY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=tsvZD8EH
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 28/45] package/libgtk2: switch to https download
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
 package/libgtk2/libgtk2.hash | 2 +-
 package/libgtk2/libgtk2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
index 9b10a1f0ce..7b9a46b697 100644
--- a/package/libgtk2/libgtk2.hash
+++ b/package/libgtk2/libgtk2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.33.sha256sum
+# From https://download.gnome.org/sources/gtk+/2.24/gtk+-2.24.33.sha256sum
 sha256  ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da  gtk+-2.24.33.tar.xz
 
 # Hash for license file:
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index d30e1d9d43..859925e8d3 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -7,7 +7,7 @@
 LIBGTK2_VERSION_MAJOR = 2.24
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).33
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
-LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
+LIBGTK2_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_LICENSE = LGPL-2.0+
 LIBGTK2_LICENSE_FILES = COPYING
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
