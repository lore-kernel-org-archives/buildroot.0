Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB43FC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F796409D5;
	Sun,  7 May 2023 21:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F796409D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCnl3lOtlwss; Sun,  7 May 2023 21:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1452C41793;
	Sun,  7 May 2023 21:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1452C41793
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3005C1BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0900840639
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0900840639
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7F5DIf0DyWx9 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:35:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD70400D6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn20825.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::825])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FD70400D6
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:35:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evtSpYtEqEwCdGnNfFV3Pf7PyphbW4rPOv51uf2m+XOprDEp3NOXmkTYNG3ZroDxiAXlHLaDMo0NecajHfKTpHIWNN04Xi24gX2ZBiNq2oPcZfl7iyM3J8SvCqi9Veq9FzT+/HDrH8qPLzL7wmSJARa7CpEUnCT9Gbd1mOmr32jL3RYy01CiVS2XYLW4rSG3Z1KfiwCPt6EnMeQFodgHWwByGT2CymkS6X2HJ+c0t5V+a6yhfaaFFe/DwkSkBzmoFX8oU1wN+uuNrLkDm4jykVK/Nk6I13SqjVHas5119GWnfAe/hWS2CbSsED24duYHtZFzf+3fBtL89uQRyv2ung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chalJv1y3zE/5nchSc200udnDfybBStmlE7CnehyC9w=;
 b=R6OMqdp1r3Z7CQXYxpBkKcXUZPLZwTCYzVj2hEdETLM6mg9lHvT+jr00kuZ3VFriFovRpuPjuaJhr5bTQ2TgsjvaJfj5hQ2wUQ4fs4ZO3Mh70Wkted+43ULGWUhx4eKCp33pH63vDLiBGUEX7CIs5Hb6NquFZa/BVUZV14iFiYd41qlnaBgO55MRGwfaIReiolIFcZH6a9cl0snEOhqnt0cOB2DpRdk3ra59jC2BFE+VuF3ce3aVXjWduKbrm7vF+ZzIcAkk5IQ905imR+pdo5W3FOi8G3THH7qLMW8geqcmWDHbetWzOZGC2oq5pNNDOVY0qOFJKr2UXBY8ETUbUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by PH0P221MB0831.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Sun, 7 May
 2023 21:35:09 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.029; Sun, 7 May 2023
 21:35:09 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 17:34:32 -0400
Message-ID: <SN4P221MB06823E01BB288F84CBD70019A0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
In-Reply-To: <20230507213433.4128-1-james.d.knight@live.com>
References: <20230507213433.4128-1-james.d.knight@live.com>
X-TMN: [vGQqbq0Bky8E5mIJzqf4pdo8sVNkveNk]
X-ClientProxiedBy: YQBPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::20) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230507213433.4128-4-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH0P221MB0831:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d9b8f9-a2c8-4bd6-8b83-08db4f42ee56
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvtRtQtMOsBtDaMYSViNzYjvr8mocDzCefY5kWHBt3HgmdQ44+csFQLGwP/9uPrmgT4hjt10QWFteuSYNT4gyAH+y+sX7Wq7ODjgt+U68YiZAxwzbJuFZ5qQ8QipqWyeozz0wDkbsuN+N1tv+Msc4A66J4A0AXiUYlS4PH5DMy/+d0G3RRAf0YVqDUA2p76oDCFUdGW2cQlhOAAEid02/U9BWYfsbMeDvtWRQ9LA8ggiZEaCeHs9AoNGFxZv90ZHFSYdsvu4lH3eIVL4eL64xyIaTI73FpeWt2YDYdKscbJlxj2SuDw1+AYqsoH2BN8A1dGxTNP9gYtMiDbZ3yJ3UPaNB7jQp73O2EcLX6sCyZHpE+O0XTszD6vgbNVQE4jXLXFSx9RQzfQllHEPWDsrLgzp4vsIIKxyHMTaDJ9dq7r5xjvLt3DUTwqHIWbT20sS/1I0+ZN5W3+qtNwRMmtDotP7VOJ4kiitWN2doEnb/LsRMbN7u0V6NPYnmYN8cI9F0IHbLXOmkMrx7ts+9JiA/ZYI8T+NNbv39G12oZtRrezDuCw1myXaOjHPFQFkaxOV+v4y0qiR+P9TFgLlQ93mo08+dIdRLKwK8GzQ7XjO7gflWSXk5x95b8kiX9ngVe5KVC0lE0tzXSTmtXnK58wIECeQ5ghxsHVQViN8ooVRfLNGl3rWCjY0CkdDODVdUFZBt0UzeTZGElZ8zYX4/prhQCwgAT75DRfdKhXyH6aFvAWVIrCAtVQ0Ebynr/bIvW/6GYw=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLT6ysSvE23oxf68kjcVl6Q7BWmPkjvrwza+OgKdON5iC+Q9Eim5gOFOlgHwb9ij6Qo9/Dxf/DFNtaIkSCMdHrZ9+5h2qTYRrz3Zf/xx0gMYsFoDDeek/g70F8FSS9vhEK5ZBrVhWDEFWhAvbgNY2QRXN5ROq41QUClIMlv9KAuHxiy492joIEUB9ELwtf80anwYGTIZnTO+TVu8WvwHij3tZyO+jZSuWwCfa7R4kdQbT5y1JtrO4MrwcSYnVEo2bxRu4tXqScabelob9bT6PAUqePyTgcFS33lE1TNVoOLY99oaJDovVRqm2RmOOyjU/+w7xbOj4hJF0NHFdrJOpLH66IMb0ZvvxFFYlKay22hFNtev7kui3jKaGWYpSt+dF2Ui2OTVsJ1rl3JbR5npeGL+UoahrD9NYzxdJdOUn2OqrrT7FochuKAt9deLBW+LmjKLB48cSfJxr0R2yeZIBdbD2TQiF+opjI89DT3V/ocrzerQHpRaoSi4TWV3/7iNN0WB/9pUJS9yg8m3hQQmh05Y91h3FrTm1rIdcbuLbzSc5B9hIB0Als5nGgR181AAciPe1Fh2ccdn0PeHNHkzIIeVHJ3oJx6t2CuW7yJBE94=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XdmivnnJvfOtuK9ty1ci0ujmQRDjCKqCsdinnAlzMTqBbo6uflHUmbXhM4P9?=
 =?us-ascii?Q?4YRhZ3Ny69AL4tg+Js8ycpeqMrUPCJf/fQQxWoX90ERc3KXj4ohE7wy3iy5R?=
 =?us-ascii?Q?4OLWe4qtDzg7l4q5p7U4u3JWTRM0M3bR9CHGeG18u6c0IqufJASmud9NBE/V?=
 =?us-ascii?Q?ZPpIZj2B48HEQoHl7x8HzOdNZXZ0elHJWDV/7y/cePNagR7tXLdlPsQNsHT2?=
 =?us-ascii?Q?j/V3vTuPhCQ+DN4mY8tla9Qd3T87n64IrQD1R4j0PPRbXU84qjg9Dj2zEW2N?=
 =?us-ascii?Q?590qh1d6GY0k5+dmdaR5stwcJ+k6nig+IvyE2sYFnXvM5irfZ5N7Ote3xDHJ?=
 =?us-ascii?Q?gW1Jqjjz6pRRg1lE4L8hWpcsn9T9mQWLSgGcRMScTFXlkFeSs7VXW9nTqffF?=
 =?us-ascii?Q?hDYjNao/V7afQ5bS1krH2msor+1lxMoYyHF3nH2RvOg2EEKW9J1aD6WQ0XP7?=
 =?us-ascii?Q?BSa0Gi9wQ1WezG72MrMkPpd/jtQ7fk1Z5BPR8ZP8NDVW+aqrqeL5vi626j90?=
 =?us-ascii?Q?omOsRs+FH3MFthK1v4w9mrKeTQqn8C9o1o694wgXZjGEXK+LX5oXCYDp9dSc?=
 =?us-ascii?Q?RYe8WS/i+7BmgeqY7oi4A23eyypW3ZS75Gtu+terHUtFStZDGwG9Nq3c+oA8?=
 =?us-ascii?Q?WYp9J3TivrRzT1rW2kh3p+5yP57z8Ni4zcpPEg3PS1+t7nban66kDQmLM5A6?=
 =?us-ascii?Q?o9ktrUebj24EMVyeBfBkVm9qwl0SNLAzV6yJUfOCCx0rnkGEnYmKrHdrfU8c?=
 =?us-ascii?Q?tjWeftux1Vpy+Hzqp30RMHZYrPVrVsagm4h119p5s24xh4LUccBKldwMDUPZ?=
 =?us-ascii?Q?hlFMQQofuNWTUtgaiwQtyiYglS88D3rPTktGthYzGIrKJLphwYQISiHvhd1T?=
 =?us-ascii?Q?EhdMpvQGZnnvKeon6cH8UldayCNre9qRUg2gdzA7MBZW7VN+794v6/6B9kim?=
 =?us-ascii?Q?xnP62XkVQ/bupwbNlNT1V6cr/khbJvY3Ywo20sp1M4cGAygmM6v+YplANLGj?=
 =?us-ascii?Q?AOLX/lyTeJ0REULZkDk7yM/VyeSp+RonVE/+O7KaoV0/Dy8NJDuCSIZrufIQ?=
 =?us-ascii?Q?8/dAwFPLCiBi9xqd1p+Iyt0h4yNwKDjQ8rRcRF9QxdMtA9jfLFL7+QjFxpyF?=
 =?us-ascii?Q?PRekLZ1HPQIzA4hipeB6UqHoOLbAcvIXbsvrnvEobrysGlhR1ignqjnrZGCD?=
 =?us-ascii?Q?DSDa/5tfRtOBo2pqHPbLoSQ+4Ozwzzk96Eb8ujc2un82EMfr3cxsCl+Daac?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d9b8f9-a2c8-4bd6-8b83-08db4f42ee56
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2023 21:35:09.2343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P221MB0831
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chalJv1y3zE/5nchSc200udnDfybBStmlE7CnehyC9w=;
 b=pL2cQfQ5mmv7O8VXJiBLNHuxBNLhD5i0tY3hH7xCQJY2q3gAJSeopRfMBIT9XgPZwiQtpvZB/PJu2SCC3Gn6tz8CRWL9TcY5cLs+iX713VKSVbd5Fok5Om+ZqevFtGpdj53XMtfWoeOUPnhYz7Sal92m5PvJudY5ZkRPmRlJ8gNo026syi2OtvZ+0Ke8mpQBlF0OyVoKISc2vaOaJocJrV69q2iNZdYLpeDKp/W01viz0nnbCrR7ieZzt3M1HsMWcx1U4XK/e9LwhciKLG3MEEnaJtnWZITk0XTaS5+ugwX3cZ/auYzNYROr+Pl4aeQmtp6Rb+svGswdtcXuxDeKqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=pL2cQfQ5
Subject: [Buildroot] [PATCH v2 4/5] package/rpm: add python support
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When Python 3 support is detected, enable Python 3-related support.

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - New patch in v2, with changes from the original first patch.
---
 package/rpm/rpm.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 2b289fcc9f8d6972bece4492736277ec5efa209f..2964c6a51202772a3ce74c18b7f7e5b5ffa4d49e 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -27,7 +27,6 @@ RPM_SELINUX_MODULES = rpm
 # --enable-openmp is provided and OpenMP is < 4.5:
 # https://github.com/rpm-software-management/rpm/pull/1433
 RPM_CONF_OPTS = \
-	--disable-python \
 	--disable-rpath \
 	--with-gnu-ld \
 	--without-fapolicyd \
@@ -83,6 +82,13 @@ else
 RPM_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+RPM_DEPENDENCIES += python3
+RPM_CONF_OPTS += --enable-python
+else
+RPM_CONF_OPTS += --disable-python
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 RPM_DEPENDENCIES += sqlite
 RPM_CONF_OPTS += --enable-sqlite
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
