Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264B8ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 09:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B240340CDC;
	Fri,  9 Sep 2022 09:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B240340CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oo_6pOC7z24q; Fri,  9 Sep 2022 09:18:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AADBF40CD0;
	Fri,  9 Sep 2022 09:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AADBF40CD0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5A261BF3A6
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9030A82741
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 09:18:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9030A82741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06ZO_Jsa4WKA for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 09:18:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC3A4818D7
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC3A4818D7
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 09:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVVlXv3jLurzxbjLY35sjomL85fA0nJXo8tvImPbZTeVGsa/ICq3m3JOlgTU2oEO4BLEa3qLPtmnCaTV+KMQhREbAVuFqrnmRVqVlE26zVKFCxlS8J0SN5Osx8L+d4i/UjwLb1Zi6dQjaPbrPjJlZ5daLAPd6pnoxYhMRU+rwSWliXJwS380Y6CvGV5ygpcyjmgwurfnsxchfkd2ec93AuFjGJ4CDgcGWIt4Xsc4IY1IvYgWF8C1lUJFAa8cKC20W5vH8J1nxHeanbK6v2Z/NpnzlTnkeEFJqFHOTCGHgyLWHYSx3DlIVkmgfLqvd4oXiGj1cE0nS4RK5mZyKyGqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLXf2ztH9mVowKIQ2kcBk/HUmmiZYj7RTM4B2l32j9k=;
 b=QWydSsWN6UAXBBDobM43XchEqz7USjhkcVGLHVzK4jznC6eI45CIEajja4BAMgrmhihI4PJ8fjRV79RqL3zWJAEI2+ow+6J1RVuLD2GKP7PoW7c9sGt8+TTF+uf+2t2ZnKOUIZvuxBmI3PnHNRUd9QVY8I8pvXmcl5zzwQWZMvFoik2SjfYQFf9vRS6VG47vfJV7q/066A/AJiWAYhQ3iBXPqmzPUtdXA3hg8YXwZjOhDI3dsPdJkBepTnoe4PirnzRfPM8Aqbw8x35IqjZVuxopqYqov8cHgEtQdrgSkhd5c+0FThryf9aBomj7HEjSP5owHAJA6o37Ypc3CoXWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PR3P190MB1018.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:93::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 09:17:56 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 09:17:56 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 3/4] package/polkit: improve sysv script
Thread-Index: AQHYxCkIhpMZnQHoTECrkeWuYxQU+w==
Date: Fri, 9 Sep 2022 09:17:56 +0000
Message-ID: <VI1P190MB049336DAB5DD61BFCF9DA8E09F439@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PR3P190MB1018:EE_
x-ms-office365-filtering-correlation-id: f00d098b-e40d-473f-4fbb-08da92442ed7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n1ZoU8quyBvyuYNYzr/yabUN6ToQ2hvVYv2csu7NybPW6z7clyMMVBFWt+6JJB8gbVouYrSKazl0pOMknk48Sx7pgRcyeUkRCA2l/FFuW8nIe6cjPWemg+RVw8nn14Nrugo4/Ohzy+pRYm1olABeM7Xf8odxh4+ppkiZHCcKkmt+UalJhKIUspMQR0jmkRDuxJxCg9VF7XTr6zWbIoprtbUpUMUkZyShuTcZs0KNZ7dOwKQKazPvQF/m7Zj/l5UjhSK4XyweZdvfJfMzWaT0rlbLvM88Zu1ee/YEz0SPmo1LfcKqRuFYQdyY6/D6x3NTozk9XFDDNQDb1N4o7it3pC6XqQYQ/kaTl4Mt6zGbB1CfJH+DJy0V2gQWzE9VT/vu9DG8zq5xVMvN9wZw8t6mql588xeNw6Uu4I2m2jsPPqu4Y0cnBlA6KggVl4JSkEBbEcOa/XrPvdax9xuHH3g6klazLrYq9KvW4wSL6uJbiT73v/cbyXBryZYSh+oHb5DMNUfItuZOy/WPUXuIymZNXbVcT/xeUb4+NdJTSjpod6paZcdJtyZiLNZJf8sljI/Y5vkAIS59StWIzGewoCE2mGmz5EqWHVujOpK20pGn/L0lz9z25jebqAnGpLgtdgjZ3+WIeEXthshGHhtqJx/oRv+L9oLWlXRyZe8EaR/hbSqTGWPVxLGsay8FRt7y7VfjMIrPatDnM1sZFttO1a37pFns6Fiws2ZPD8HEtsOvBUcE72eTQWL04EcUCHdRLMcjSgsXBxozqom13b1+vLG+CQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(366004)(136003)(39840400004)(346002)(6506007)(7696005)(478600001)(9686003)(41300700001)(83380400001)(26005)(71200400001)(2906002)(52536014)(8936002)(5660300002)(316002)(55016003)(6916009)(186003)(66946007)(66446008)(66556008)(66476007)(76116006)(8676002)(4326008)(64756008)(86362001)(33656002)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tI0Suw+MnY6IB0aKNzCDVBGAxJpZGumpqqehGA7i+gu+biSTOjznJI5fX9?=
 =?iso-8859-1?Q?xeBb7U40LfGK6zXjKIzfd3vvhb4VeBHSvmCDDMcjqE/gIUJCEI67VBruEO?=
 =?iso-8859-1?Q?jEv6IJI/7HWeOt1WQLWXpB82YO1s9p6YNVqb5CJjsJoYnTGxEh/a/efBCm?=
 =?iso-8859-1?Q?j/YU8I70bVKz1tug5HfMr+kPQgUS5K2+So3Lbctoe7KFRDzZzZm7K2vfCs?=
 =?iso-8859-1?Q?yWCQ/vBRGHMkwKqCxkZxGma+C77GH7QMcFlm403YbHxDVK03A8uarV4LVb?=
 =?iso-8859-1?Q?PfSFTF/PbU5WMgLcEtQHdrw1CTsdGwhFFZoYsx3nhVo/zmdJLZJU31CFVB?=
 =?iso-8859-1?Q?aj9559zbRg+uZoYaQRuR9mPQbpM1EwD6pV3EvVLGO3JB6/A4ucp35exJJz?=
 =?iso-8859-1?Q?JB8jqbHmN+9wt6Mes9JpaEldHcTxWBmoqQlLCpYb8/DSuA/Mqoiq1lCEDS?=
 =?iso-8859-1?Q?/h17p8uTgCAqJM/XymZfG+tpZanOLEZBAyaW/x8OVATOQeefSmBg8qBiJ/?=
 =?iso-8859-1?Q?LRgiFrutdNfXBNJ+heUxAmaUuRS7fn9Y0VNy+pXJnkxrZN1qMLdkmlpH4G?=
 =?iso-8859-1?Q?Ypzk3Pm8li1byl7FW3TNI4bqvN78HYrDuXK8DRypZkB0lfSzKtzve9TTQr?=
 =?iso-8859-1?Q?4PIGMZf+6OK88W+DaX3XPhvlIyCiomBE0FOazYZO2ssczedQ4Ujft2UrPN?=
 =?iso-8859-1?Q?xcK/AY6sq1D4haXumetwbsY8p/v01TNAUzrmreXv1O31VygUN2Ep91iW4A?=
 =?iso-8859-1?Q?uGOAoLGOuI2JWGsYOLB32xQGdYbMnqv8tSbfyBOEIUZa4mCqITyQYM2HoT?=
 =?iso-8859-1?Q?YJxeoC5ujMK4Aq2Y0M94qu+7f+14V57pzXOYVKBNjEDXLlQnl1ugRv6cqV?=
 =?iso-8859-1?Q?CBgnS9lfTyVrn5nCFvFbRZEQR1bhGm0JhVuSGjmBN8SKcNOfYNankeSTAn?=
 =?iso-8859-1?Q?ukF8p7Ki5YPRwvaJNmMcqCud0rz92I9FT6Zv0mDMjtE8Cc27C2BddTaoEO?=
 =?iso-8859-1?Q?XWAnJfOjyUjPUAcLdfvwu4/D1nETXirBR0BiyL7KPsp/0HZAmRWTC8XH8C?=
 =?iso-8859-1?Q?UyvLxrdIRQr0DCJx8M2rFFslwF2eIFSYZwO72wtWzpf1Cyn0CL6osxcLFo?=
 =?iso-8859-1?Q?Tkt0OW2h5swufwk/iIXsfPaI9L9n4Rs8FCSYD+mVGB96N5eMPWRQ+DTiPT?=
 =?iso-8859-1?Q?UdZGGcNoQmPK3VSM2vqdJYEbKfgJej2xAdGLekGmdBDYQ4e+Mq0M0MczNw?=
 =?iso-8859-1?Q?UsAWqBEsAOi2osAGfYICx5NqriAjKzwPyhk8OQxKI0j43wdM3fyYnli3g9?=
 =?iso-8859-1?Q?vwaQgggodtmec8s9es2U30A+Ymu/uRWuKLGMnxAu8uKsq6dJTOTTySznb/?=
 =?iso-8859-1?Q?owM7l7mAZwbazJ49gn9nX7ZmZsRU7Cn/onedvbuNjKdtHg3/jkQkuMprrK?=
 =?iso-8859-1?Q?iWTkGO9GKSOy+FmHv580ppXKUtnQhWCza++3zYAdC8ugKEmEuQcRBx/S29?=
 =?iso-8859-1?Q?+SnFzWVcLCKwqYBF5B07N7bmkdMfPUW8rgL7DjoWGYsZbJXtrTRYnwP2mX?=
 =?iso-8859-1?Q?KPCvSs9AT5VK2rqkUKspSjcrRp1bPfK2TmyjE8mRP+QcbCHKeQe3zzQgOc?=
 =?iso-8859-1?Q?m2Q8Xyld0Ycjk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f00d098b-e40d-473f-4fbb-08da92442ed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 09:17:56.7328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g8gfGyLpkqnohmVyFeYu3DMAm3Ta6gYT9sEeSM/I8bnpJKjk1aX2nbJyk2wzuARG8Jx5uHLHY+ku1+olErIBUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P190MB1018
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLXf2ztH9mVowKIQ2kcBk/HUmmiZYj7RTM4B2l32j9k=;
 b=SRY+QDNs7pagSnIzAq9ZEgWmRfej8jD+JpXnXjqV10wGWZ78xZz+0i52v9YBq5Yz/FksNpBTNPfd8ant+VJgZKP0j3regwA3t2GcZNbG8qSK05yV/s3IOWnTyfyi7LVAtL5gW8npFhSkXewj86Mmbi5YfJWPXa0oXJijj4EvHws=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=SRY+QDNs
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 3/4] package/polkit: improve sysv script
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As specified in the manual (18.5 The SNNfoo start script),
the name of the script should reflect the name of the daemon,
which in this case in polkitd.

Also removed the redundant reload case and make it
not executable (is installed with -m 0755).

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/polkit/{S50polkit => S50polkitd} | 2 +-
 package/polkit/polkit.mk                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename package/polkit/{S50polkit => S50polkitd} (97%)
 mode change 100755 => 100644

diff --git a/package/polkit/S50polkit b/package/polkit/S50polkitd
old mode 100755
new mode 100644
similarity index 97%
rename from package/polkit/S50polkit
rename to package/polkit/S50polkitd
index f07e2d613b..5810e780a0
--- a/package/polkit/S50polkit
+++ b/package/polkit/S50polkitd
@@ -40,7 +40,7 @@ restart() {
 }
 
 case "$1" in
-	start|stop|restart|reload)
+	start|stop|restart)
 		"$1";;
 	reload)
 		# Restart, since there is no true "reload" feature.
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index a8b371acf8..f94579a149 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -68,8 +68,8 @@ define POLKIT_INSTALL_INIT_SYSTEMD
 endef
 
 define POLKIT_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/polkit/S50polkit \
-		$(TARGET_DIR)/etc/init.d/S50polkit
+	$(INSTALL) -D -m 0755 package/polkit/S50polkitd \
+		$(TARGET_DIR)/etc/init.d/S50polkitd
 endef
 
 $(eval $(meson-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
