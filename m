Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0548C00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87ADC81452;
	Thu, 19 Jan 2023 09:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87ADC81452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilztGAIpffbV; Thu, 19 Jan 2023 09:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B97ED8140E;
	Thu, 19 Jan 2023 09:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B97ED8140E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85CCD1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D9E60A7A
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D9E60A7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qapAADkKb6uo for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:48:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86B2260A68
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86B2260A68
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:48:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMfshovVvsLLgK7XO4vM6Ae/fmPFuIKK9LbLhm40OXe9FZxO8xXNh1WYYAdpt74VisO2cCzpxTUMxdxuNORle0hOo9uU/fraqPvfs+A+FLtqegdwen3+5GahJX+T50XN+cOYAZJ7wwxRzEl3ra9NTkiG1H0IElupp3wtbF/iEOFCcF1Y+GpKHU/yLk9VH8fDPlVE/bXEgpLYN8fna7f4f8Odp/O5dWNmtDS3M0QTfeR7oc2EEiEL4U7xtcSeNrF3oEtXOBcjhGsrafpogWKBdo20jXUcivHMMoIhxrz+LlpFH2TFamqVEIIP7MqqGfFP5zNfGlkXZusG+gj5xJFdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvDljtzWkN1f25wz2kueRz27AV/021vBeSAgwjxHGYQ=;
 b=luKH4W3w8LToV6Ao0RAMbWizstXg+Hd3s7Fgrc90OjB8t6ygaMGmVF5f/AB21VIeHG7hFpVdVtacmJkmADqKI1qBwBu3zx5KNqxEVLCsIeA1ScYtZRxQDnmqchPrnW4WizS9rZFCZoPvisByp0XL/3D4zv9JKpHmxPdDwXwDtCQbwv7gLTz3+NZcqTYFWaBPm2LFnVVs4lr1a56VBlhHK5MLJoMgI+YlufFF3VyJhqak96Oj6MN0ORDJOLBRwXqD9Vj0DFu5Uj6knigWWQ3ak0qBYMr7a1voM+JgjPrtpe0LyGoqg/TvXBikg2XlSwh9oqvH20cnShINQNP4p0Qluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by VE1P190MB0861.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 09:48:54 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:48:54 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 01/45] package/adwaita-icon-theme: switch to https
 download
Thread-Index: AQHZK+oHpsm6BF0in0i5Lq8oYfs6JQ==
Date: Thu, 19 Jan 2023 09:48:54 +0000
Message-ID: <VI1P190MB049394F865BD2222D7D40CAB9FC49@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|VE1P190MB0861:EE_
x-ms-office365-filtering-correlation-id: db6b64f0-9718-4c74-3f74-08dafa026084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KNVxVu6g3g3MZE6EENrc6NbUYP52xHpXAVCDmr0byGagWk8q+WyYsnLVt2nDxtOjr85XFVoL5UT3RPWjjuEx/R0m6hPWamLLr3jBVWu+NJ9fVZFOzfU9TUPL7YZgW2dCyjxn8twX9TRYmMNfMS8FPbW6FRWQ/dwFP8Jh2VszqYVblEXNwl/ABQ0fZxAiGxWYu3zlvNPU0GjgPRtHkctHDzlbfEYjo3p8XFXL9t/SFeWVR143l4PeKe7S/RJvC+PI2QcpsUi4fa/ZH8V9+b6U/3/1R1w0i5952Zs9C8t7qoW1WKrrfdzg8UDbKBVg913M64nC5OqzYyRf8qecQVjU9EUUpc3NGnEJ27xXuzNDulZXJQ5eKU3/W3Kgn75kPOInUPzYna4/3CgMkEt0GhMJpAlddtJEIj0ZeHzB5osfiC/2f6lJK/p4QrZe4azGmYBW5Y0IXBOVKetnbgQhHdiB/HEqyRkZNfQa8ZH5NHUYBpRMNnPVzIfXL79pKYU9vOwaesOXyhfbxgV40j1CnjaBzWVaWrPVWcmOtf4oY95mPmHreY8bdTdiitCuThDLwxlM2bmqYNqznMMGEx6XkxjMWR30iterscIQaPKdTO3TEVLB2r4//+f/mSlPJv2J/iOyZSGxZlfGOrNkCAuL8zJMSqgUivv9anSWw5XkN01Zh04EU0XzyYpaZKU+JHXdLYu1+XVyQ5QHJ98Mv86kds1GBUQLJbjcgj/8FfsVDtGBHWkQGGdk1FXBMhmdUXorkgb8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39840400004)(346002)(376002)(136003)(451199015)(316002)(122000001)(6506007)(38100700002)(33656002)(2906002)(55016003)(64756008)(66446008)(66556008)(66476007)(38070700005)(66946007)(76116006)(26005)(4326008)(9686003)(52536014)(478600001)(6916009)(8676002)(8936002)(966005)(71200400001)(186003)(7696005)(5660300002)(83380400001)(41300700001)(86362001)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?debzxBjjiwsx2K+oBzxzqXfISETOJKF6NnJ5fwBuiU4SR/3ENoybJbRXpP?=
 =?iso-8859-1?Q?u6iT5b9EyJVWmP7udvEmXkmsHNabj5pHLCNwN8aZiX4EN9Hn0Ck18SJUjG?=
 =?iso-8859-1?Q?xBqR+ZBA1THvfiQexAq1Qf16bgpyCvQNldiifr6Q9LxQF2fyOhI0/RyP5r?=
 =?iso-8859-1?Q?Y23wsbLpLg9ig13EWxI7NBb5BuaXUcbRZqBKrVkqPD5bp7aQtwpL30exe9?=
 =?iso-8859-1?Q?LaKxQFwidx+/yGb6KEkdOMYL183DrdbGvPcRLXtR4yj6zXKsbeJiF/HjRL?=
 =?iso-8859-1?Q?VMFFgki08BNY7+pB6ic2vWDoL9JE9EMpFfrcGqPuP11BZIXTVv21Hd7t0F?=
 =?iso-8859-1?Q?xRe52yDrRdHJEQB6El9Iom8F7w4ysTGiNK6hRSZhaR48Bd1+VHS9BDM8b1?=
 =?iso-8859-1?Q?QcHRH2K1r5E7N/PomdGxcqwWe+3ie8zEwnTgz5LnJmhz2ZNurjf3Udga8t?=
 =?iso-8859-1?Q?5buuWLg2RfHSJ1N4z2s9UsXGI5xMtqP9xQ50mIEahFl8miAMqPWIfMWL5a?=
 =?iso-8859-1?Q?EiYStH3FT9Ab53ob+C+R+xHw9rJRWF5g+b34z8xcclFFkiwQdjgAg6e6cf?=
 =?iso-8859-1?Q?rgwnlOBmj/rxSiBL1e6vbKyS4BbaRmdhmcMMqg3g+tvkGis6wa0cjPmZOX?=
 =?iso-8859-1?Q?F2BnzWGkP0zbbzk8beTh5ykPTz/1RtR4Zi2gx4iDwd6V02a+Vb5gUEMXJ/?=
 =?iso-8859-1?Q?iqTbRFfMlJrrY3TyMtit8CR5/pMlhYPdr5oX5gxt1AYvv8UybrgiTiXbeS?=
 =?iso-8859-1?Q?lIMrhp5FJkJvQ8fWwNgTZBIGVWJDwWP/fqvBpDS0UXQAJb88laWjqz8Qx9?=
 =?iso-8859-1?Q?ksBA8HOY+/po4fSzmYNzHUfMkNG8iysKum5AvsHHGjHu4kGyaVY3qEdVPq?=
 =?iso-8859-1?Q?7Ux8vW24mWUhPCp0HTsjNaMqI15kAQ4ywdOlDkceBVQ4flvifYij4d8nkN?=
 =?iso-8859-1?Q?SnCFkrE1YJf2mzrGwm8eKYaUm3KY6rXguQ1Ev/Z7aa5uGcXTDGp1FUlRJi?=
 =?iso-8859-1?Q?9E6lxOZn8FRCy5B/chl6ezl0zdrgyVa5cIYEgAOZWV/kKO798NosFr/t6M?=
 =?iso-8859-1?Q?4IQLyag9Lvm55+HgYJC8/CKi9Ud0fdB/QR/OAkzb3N+EH4En91OGumyl1x?=
 =?iso-8859-1?Q?xzjS1XZ7pAQ/rOMR+eOtG8goULcThJO8iJCl3jg0FuUs1hdI3nmzW7p+c8?=
 =?iso-8859-1?Q?TVTYmNhDHWG46nE+Rn1CPqoKXxzrrmDWVs3vMhHj1mS4UHsjkQ7O7Gm6t6?=
 =?iso-8859-1?Q?aQ/F0oVNdP7kghqRjhmXZhUQUndl9E2Hvqp+SgaY+QXLnsA6IFL9hD3ONM?=
 =?iso-8859-1?Q?eNeFkXMN5tHvvCK2KEsErSkv8ePFqqRPXOVLmDqmXcjMGpXbUPHZrq27Eq?=
 =?iso-8859-1?Q?hx3iU4M00mCd/xu5rY9NPZAoZAuszIaDNUZAAlwVQ5I7kpZL6q6JACnXUk?=
 =?iso-8859-1?Q?lYDkJiio6MKKHNPcuDSSbYTgaKUYpxoORxMUXpRf6np26CEKvdhE8nSaW/?=
 =?iso-8859-1?Q?gvoJB9l48gDo9FW0iVFcXEtdOogtiuAhM3kEHG/ShECMJd5GSTribq8v8+?=
 =?iso-8859-1?Q?2RhazmBvJ5hkCwFmfcPRKJmJ41R7Yp0YdkpUGwchrAMBzWm1P6UpR6b42X?=
 =?iso-8859-1?Q?0i+eW2SljsqzU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: db6b64f0-9718-4c74-3f74-08dafa026084
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 09:48:54.1879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KqK/OqjDhCS6Apx79lyTsrpsqemCCxdqdImy2sOjOsishXJ6oTxR7paYoEhWKdB15JJx+AGA7gUL7z1B2L9TWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0861
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvDljtzWkN1f25wz2kueRz27AV/021vBeSAgwjxHGYQ=;
 b=W42zwHiZeq4i+Ug4cgwTY/S5lONQkKDzqQ5fcFuZ9Rc1B31LMOY/xu6mJ3FFaHmzA7VDzUxGoXc5teG0SV8fZQqGsnhu/a69u/fP4Rw2LPbgKbwrIgRFplSw4q3s1UnF07D3ywvgijL5LlTV20lnLK0HMI6VSSQWncZgjqi/ooE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=W42zwHiZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 01/45] package/adwaita-icon-theme: switch to
 https download
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/adwaita-icon-theme/adwaita-icon-theme.hash | 2 +-
 package/adwaita-icon-theme/adwaita-icon-theme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.hash b/package/adwaita-icon-theme/adwaita-icon-theme.hash
index ce6acb8d9a..ae28a7a152 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.hash
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.22/adwaita-icon-theme-3.22.0.sha256sum
+# From https://download.gnome.org/sources/adwaita-icon-theme/3.27/adwaita-icon-theme-3.27.2.sha256sum
 sha256  a594e7440971f860cc61b1b8291be15ffc1b8dd06a9f11485a5a7faf189bcf6b  adwaita-icon-theme-3.37.2.tar.xz
 # locally computed
 sha256  51f83b2b4e9ed2beebc9b8eed2ecad29314a58ed8c5184b22ad8f9df703d3ce5  COPYING
diff --git a/package/adwaita-icon-theme/adwaita-icon-theme.mk b/package/adwaita-icon-theme/adwaita-icon-theme.mk
index 3950cfa636..6b71c41d52 100644
--- a/package/adwaita-icon-theme/adwaita-icon-theme.mk
+++ b/package/adwaita-icon-theme/adwaita-icon-theme.mk
@@ -6,7 +6,7 @@
 
 ADWAITA_ICON_THEME_VERSION_MAJOR = 3.37
 ADWAITA_ICON_THEME_VERSION = $(ADWAITA_ICON_THEME_VERSION_MAJOR).2
-ADWAITA_ICON_THEME_SITE = http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
+ADWAITA_ICON_THEME_SITE = https://download.gnome.org/sources/adwaita-icon-theme/$(ADWAITA_ICON_THEME_VERSION_MAJOR)
 ADWAITA_ICON_THEME_SOURCE = adwaita-icon-theme-$(ADWAITA_ICON_THEME_VERSION).tar.xz
 ADWAITA_ICON_THEME_INSTALL_STAGING = YES
 ADWAITA_ICON_THEME_LICENSE = LGPL-3.0 or CC-BY-SA-3.0
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
