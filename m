Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7619EC6FD19
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 13:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECCBF402F4;
	Thu, 16 Mar 2023 13:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECCBF402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zu29ZuFcm_QA; Thu, 16 Mar 2023 13:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F48240918;
	Thu, 16 Mar 2023 13:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F48240918
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D80911BF32B
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 13:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0D5D4085E
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 13:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D5D4085E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id teiyuZi_7U4t for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 13:53:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9840340218
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9840340218
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 13:53:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtGZu3ILz6H50pCw5PIsaDk7+PV57g32mlt0W+HQ/QgPfPpbulv2E7chN5Nql3qp3P1NC3elO4IZ4vv2GSzSc2YVELgupX+wfJ3X7bDHk54VgAMNHywOtzKbavPSz3y/2JH/Syyhsj/FewyOi9Esy33SgzprwlwsMstEsRp0w9LohWx7DC1FYpidCgJ/8nQuSTsVlklOpxg4UYiqmc9tPLaqm+T/olRXYox/pgMzOatcpIcvxqAUm9nMJ/JS9ujBJ4V/Gw3/A+5MgU6xXgLX0hrDEJo7K3JE4waAeMVAfrTHDU7JnWdNsdK7rpB3v+0r7BOIRuTO4NtsEj4KM3ZIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulcG4P6DU+VmK4zeSXkY+BZiILarP2epeMcg3fqa5q8=;
 b=jfM4O9xmbqbeVca0IWy9k7SiB3bO/EjyJWSk0EZCmA8Gmsiq6JI5OMXqjYXM+mcTYEY8c+3nGAG2/mydZyGNm9r8Up345xZy4kjLpAxoXbTceVa2/SsioLSVQCF/SoWC403vDNQTwyAQYXwxemAPbTPGVFhJvI7AmbpldkPdOjUm3WrnPnq8LBtaXBbOXFO8gMd+grnh5WxKcy4P30WYYPr7a7DSqUxzTZbBtlpWYWYv0giLsXzdQkmPkzYILj2mTlPymF3qunmITu24zY5HhQxVbz6p2Pf182bL6nVE6ywbd/IGrk8cnyDV8xaMfVkxuyicUorE8kR01dswMrcixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by PA4P190MB1104.EURP190.PROD.OUTLOOK.COM (2603:10a6:102:106::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 13:53:14 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::9d28:cb8e:6b30:5149%4]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 13:53:14 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 2/2] package/bluez5_utils: fix SysV init script
Thread-Index: AQHZWA5EUMHUf1s1gEWlDvA+7k/aog==
Date: Thu, 16 Mar 2023 13:53:14 +0000
Message-ID: <VI1P190MB049333A9311E7A4ECAE13B7A9FBC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|PA4P190MB1104:EE_
x-ms-office365-filtering-correlation-id: f3ace57a-e9c9-4bd4-1eb8-08db2625c9f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eeIPu6X+kXxE/GexMhnOYRw9Am9JGH4bj3bFaHpb86g4Uk0fulc8bbx/yHsQEY1yHAyWLjFigPogtwd6MGjEOwothstILtijbtqcpjncoNOoeahluvt+cpqUC80mKV5vsIFNDSi5czu5xurbXbnCo6UehN5e1In3Pfmx1hzDHNxVKyA0cgPp2pD6OQg1udtjul2ujmO1AHCG6B0sXJJc0HDJ+spw3K+QHe0z5fI5cYqBzPANtj5vCpWi+pBFLn/wgfH33H58bA9U3tyzxkR/kf5SzbKsrb3X1tHkQgr3uUNY/iZcyP1GLQ1WQAlqiQlPLOud437D9JoQPVvI1qtGuDcrUBkAwUnTPAHbzk5k33nkKxJ4RMGyu9GfpTfZ1IambYTUa2L79e3a1URdS7pdH6NDNI+cTkL7+mb0UzSxNmHxiFKggT+ALEKSeFlgTn8fKcdZnaPT4h5dED+PEcRkO68uIINpFeYTFEtJ+EEV/mvOd/1GGbvNtVDw3iKMYEa/o1O5peizPuf+2P6Tkdyw8p7rTYSNjKgDruM1gJQdKdwMTDJ7iovGZE/iAlKpFfVL5nlRdQOy2n2oA+p6X2guhyMWF88NL1aCREyDNMIhGs1sT6BDxgTR+1uZcT93Lk0gAPxGSA3cVnmTvjybAg/rKN0/wsv5RQDE8BjMg902v6eeSmyg+ZM5mcUL1t6smd7ZkIJ5adxmhx5rjdQeOGBaMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39840400004)(346002)(396003)(366004)(451199018)(186003)(64756008)(66476007)(5660300002)(76116006)(71200400001)(7696005)(66446008)(66556008)(66946007)(8676002)(41300700001)(86362001)(478600001)(6916009)(33656002)(316002)(55016003)(38070700005)(4326008)(8936002)(52536014)(122000001)(6506007)(26005)(9686003)(2906002)(38100700002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?T7YXXSrgWO4cRWRwE5JtNJLTVdP8DZEJeFYkygb//SXwJgnLhin54QfISz?=
 =?iso-8859-1?Q?LLXE1cxOma/eFeooR6ir7WjifmaccaK/fDEUVFGLrHaGi2qnBv219VVmcH?=
 =?iso-8859-1?Q?zSk4sE7RNOujP+S7Hmqs0lRdt494+rsuHYlgQu/YB7bYqzKxx3Kbj4WDO9?=
 =?iso-8859-1?Q?g3J551pY8CgP/UOkhzDGGjwR4W4ISgJsgCJPzpJZLpT31YHlcbObQwjv3M?=
 =?iso-8859-1?Q?jh+rYotKUvteXaCVd6cuxo7Jd7aubXRCZR+sxOwdThNKhosvwHKupl+w0N?=
 =?iso-8859-1?Q?/2b5+ESUP5ZOtDmZJjNeTYt1dcHUEW9zL1VjsxXRgid8y4FkEuduP/aVJg?=
 =?iso-8859-1?Q?2jaSSv7rhMqRPWujeYpqMjITH+ki+/UDj2zio/07M1gLZIyM9J3eOvDdta?=
 =?iso-8859-1?Q?Rk1UTESJI+PJsMhdZ5Ui0aqLJTyggXK0g8Pi3tSAUgZSnTHWIjg0wDlifF?=
 =?iso-8859-1?Q?4s55671jlPvUTDAk2lPaiwTcPncqdb0aqhG+ja0pPMtHts5dL1a5LqRYmC?=
 =?iso-8859-1?Q?mERWYsqNFgMVgI2dy1nrJ3hPv/bgeckRlF3XCQxxYRdkA8j/3WyXZzKcqh?=
 =?iso-8859-1?Q?TGvKJ8sUSWWAWGCPGmVvoI6vuayvAJmyGqf76Oq3qFNBLyC9+JH0L+eMYx?=
 =?iso-8859-1?Q?glM/Rf4oGwd3gOLMfRgQxIj+HdMjcJ6IDmmKKrmqa9XNR9pYXF4UbLxC1f?=
 =?iso-8859-1?Q?2f/zcRk+nv09wxKhAhqteRf3Sajysvd/g/fdQ8wJFf+QE/pz3u6F3I8/gP?=
 =?iso-8859-1?Q?FOyQdmS/QLKgrlil8Ar1sCy7kzIjHto/F4JL0d40aQXkO2JcpIt4RrP+P/?=
 =?iso-8859-1?Q?TrlMFSzgK93qkiPY0GuSsx61odXqmng5ELa7vLTKoGhn+ZxbT2nL4+bVgb?=
 =?iso-8859-1?Q?AwJfrdhoZn11uET94gORZjzVcxQhTeyA3SMTDIaBxai9M4WA9WDD0NQLLV?=
 =?iso-8859-1?Q?Ui8J+W3NcoyjHMq9xqejLBEIWPULsdopjeT6LpEEmdwMgG0VwZxLukJDAL?=
 =?iso-8859-1?Q?959FC86LRwgEf7isvIDL5Fk6CLV7u5PtMzhDaGQIvtrcjuR6+BmUe3lTwP?=
 =?iso-8859-1?Q?d8tBic4xT4NbUw5oonxOQVH+a8qdFW2xOWA6jAYFuFEcQDCtxXfJr28mHM?=
 =?iso-8859-1?Q?A82orXbCGAB176jPLPue/Yx6jpGJSv2SyrIq/JnbJiL08PWchOAlNr3Kwe?=
 =?iso-8859-1?Q?5SuhJRM6gA5AP/roeUriWsTbPHQGM0BGRfz/llPJoxWtn6lI7zUJpl8dLn?=
 =?iso-8859-1?Q?Ph6lFhbWdZp6ap6gMnmqaVCBdHO8U2EKJrZXJAO7XSjzYt4taj1uwHWXwG?=
 =?iso-8859-1?Q?4d687ZOytoR5YIC7DsUYoSUqadBY4GmeVX3wNg6rAIls+iFMhL9//+XXbE?=
 =?iso-8859-1?Q?PzicTLE7XNZEoqskt/yutoKNzFd3X18eJoC+lwMs1jLpcO06U/76FNIQ2u?=
 =?iso-8859-1?Q?x0uWUyX+eA6e7fpYe6RLGn168fDBmqXjDuixZyiklXbRQJew/R+X8di4dY?=
 =?iso-8859-1?Q?B2Jo3p+dR+MamUuU/1c2tUEnXIRky4r9vntTTqah8xOSADm12jhYdzh2Qr?=
 =?iso-8859-1?Q?aeRaI+abY+ugwEyg6km2B/yAXoReULDsBxzwl5EndWEWIlWDj3BMegZ9Eq?=
 =?iso-8859-1?Q?BXMyYZ/qWEM28=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ace57a-e9c9-4bd4-1eb8-08db2625c9f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 13:53:14.6518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xnM+JVhcPpNEqtG/qyDKK4iKptDh12siG41OE8XBAOsFePlLfgl4RqdWJ8fYCSxNDar/l3eu7HcGFB3UZT3m1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P190MB1104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulcG4P6DU+VmK4zeSXkY+BZiILarP2epeMcg3fqa5q8=;
 b=SXwYsJ7DfdgFuXG6soeNOeLHpWiJYTvLfTNMvbdsxUE4tMtalfqZaL0daMwB1ixX6r5ekHmoVBhJ6G3xrjvf2vDsNoNwP85oKKXaSoLMTms++TRVS3uzJDX+jnCDEk0JTU6mw5Bi7/XKTVk/PQyvbS2N6eR/YotWwv1WKCPBAJM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=SXwYsJ7D
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 2/2] package/bluez5_utils: fix SysV init script
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
Cc: "marcin@bis.org.pl" <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use daemon name (bluetoothd) as file name.
- Script doesn't need to be executable.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 package/bluez5_utils/{S40bluetooth => S40bluetoothd} | 0
 package/bluez5_utils/bluez5_utils.mk                 | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename package/bluez5_utils/{S40bluetooth => S40bluetoothd} (100%)
 mode change 100755 => 100644

diff --git a/package/bluez5_utils/S40bluetooth b/package/bluez5_utils/S40bluetoothd
old mode 100755
new mode 100644
similarity index 100%
rename from package/bluez5_utils/S40bluetooth
rename to package/bluez5_utils/S40bluetoothd
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 46ffda6019..54c78dce4d 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -194,8 +194,8 @@ BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
 define BLUEZ5_UTILS_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/bluez5_utils/S40bluetooth \
-		$(TARGET_DIR)/etc/init.d/S40bluetooth
+	$(INSTALL) -m 0755 -D package/bluez5_utils/S40bluetoothd \
+		$(TARGET_DIR)/etc/init.d/S40bluetoothd
 endef
 
 $(eval $(autotools-package))
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
