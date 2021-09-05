Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94633C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 01:38:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F1360F9C
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 01:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20F1360F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A7681839;
	Sun,  5 Sep 2021 01:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yEep67JriE9h; Sun,  5 Sep 2021 01:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A3A80F6B;
	Sun,  5 Sep 2021 01:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A57B41BF5B3
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 01:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 914F6404E9
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 01:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=live.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVBDNHuFaOPZ for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 01:37:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08olkn2021.outbound.protection.outlook.com [40.92.45.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F032404BF
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 01:37:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpbPrriVOi4pyQZL+tSkZ3ooGC1vCyB6lapR+Za2HlF5nO803X0uStGhRL35ioTFrl6kc53HeESS6J8mwQOcGNT2Nyd9T74PCX+fqEf5NZKWz4erxRAe4AyB32QlY5p12psOEJV67KZXkq4NfVpNzQS3bbRDu1QO9OcuoTkv7batmKkSvsUDBLplAZEoS/5hwC5UNvnwV6GG6OhkJgPihoMlKKdXKaEPWnEMsNI0e9vgfHRDu6U5wqYgnwYMPetl2bTMayEctNCekRQI5JW9EAsEC0wjCdQC2w+io3gpFZ08eOa1lm0vv7rHCy9LihX1dKm016wXaWuZlNoD4ArSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GpqBxB8A6zB9EPfNuzKXcMtgN5TkuhgJ3v5h5vm+/kw=;
 b=NgREe84OSHTXPkg1+1YvKK6F86jHt+pT/vUXYcfq/dESwowehXUZSQtZiUAwM/fYBw8tCTcbJNWkc0EisuzIlC2YrpGk0wppeZVdn16KQ2rlBILYC+kwIlrfertl6qhwYh3xSjjQQY7UOoAjZilFl+f+SLPFSLoC6B4+pFUTOTyfUAjVFgBlK/jiGsvwnEHMeXinmsDsf5bE0MVIzeUeDEMhZMKgQnWwpC6/AictNUCsJYGXWykIIsy7PUfM7QlRu7YbQygzgjrW9ky+1S5rWqVJp5S5QWh9/STlqGyElR9V+SQpqo+ZiqLJN6hbbSciZdcFMldYR084tgEPbu5zYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpqBxB8A6zB9EPfNuzKXcMtgN5TkuhgJ3v5h5vm+/kw=;
 b=aOBgKdu3g9lmNLIXyOm7+u8WKk8B42eh7oHLXHZgpCo9KyPnNcV+YmqLiwX6/x4Gt6orcLHkr+DXrZbev1vzovVXH4Ff/7vpYfm0H9NQEEtexiCI0cXnPSjFs0uF955C0pT13GrB1TswdU/XhEKiN79GMNvSGdmLqQQm9RvExWyPkycLx3towEyVWV3MPrlJ9dNsqPawyJgwQb5QQg5A7OImqDthd9R+HR5BDncGc67U7E8DWWZe/r+LWtEyUrZ/J/Q+yxnwGKWuAMHCCxoeV2+X5xavW13n/n/n1aL1hfnyAHWUfiS2PZ6N1PUr3bEZqgTnB02Pi2H1bU3ViAVpIg==
Received: from DM6PR08MB3993.namprd08.prod.outlook.com (2603:10b6:5:85::28) by
 DM6PR08MB5417.namprd08.prod.outlook.com (2603:10b6:5:fc::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17; Sun, 5 Sep 2021 01:37:57 +0000
Received: from DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013]) by DM6PR08MB3993.namprd08.prod.outlook.com
 ([fe80::54e7:e665:1ca:5013%5]) with mapi id 15.20.4478.019; Sun, 5 Sep 2021
 01:37:57 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sat,  4 Sep 2021 21:35:20 -0400
Message-ID: <DM6PR08MB39932194CBD408DED013FB81A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20210905013520.15960-1-james.d.knight@live.com>
References: <20210905013520.15960-1-james.d.knight@live.com>
X-TMN: [/xJKG4kWirCR8/ObvTDvLsvO2EaqtD6PmfHlDQhDTyTD8gDwddtJcT+HVQxywlcGq81H1FE8Pxs=]
X-ClientProxiedBy: MN2PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:208:d4::43) To DM6PR08MB3993.namprd08.prod.outlook.com
 (2603:10b6:5:85::28)
X-Microsoft-Original-Message-ID: <20210905013520.15960-2-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2607:fea8:e341:f0f0:5cf8:7779:fa4b:9c0d)
 by MN2PR04CA0030.namprd04.prod.outlook.com (2603:10b6:208:d4::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25 via Frontend
 Transport; Sun, 5 Sep 2021 01:37:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6527fc70-a441-4ea6-1091-08d9700dc9cb
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNVetrSOn5BNfyVtQLPp+4uO88leeQog/O231rPu5XNmUpfV3us0pnluD1VZQxZkb19KEBjydWm5EtTW6RNt3eveClkeJ79JaxA7joZkrzgFKbltx5cWiA9b6mTc3fYh2b5jX0YHuuCe9IAInqexJ07Yw/LdIN6hX46fiDVZ6oHW68WPyQAVe9BQPH7yNd8B9AZA6Js3gjJoJm2ejJKpgTu2WK1Bf9yEoktgC8MImVPY54ci+MpusRNx7uPQIonB7VV/TjHMekMlrnYMUd8TQrmgQf9i1i3vQ/Qt6m3u/cGfBOShnS1h0T9s3vJNSnmlZJDCz1ijc1e6qudVkifXVSFbR3l/ZNxBwAHNbSuL6nZ92XwZww0jMADeH8s05OySDLTH0M/i0fGopBKCZ6LenwTQCEAExWr7yRCXOKDbKZK9H+LDNM5ZF0jbIHVorrUVq4IJNTqP/BOC2Vr0wijNFuHfQH4TZbUtjcZLic1g/KdgrcMSWKIx2ib6mrvS5NerdNPi0RVsSL59hoQqSDhhkwkI+WRCcc0oQv2LbmU24aP1MNo3hc42JcsYrmR1B+nF8TzG9rgrHet1dMfCOVwsc/F97rIQ2/wohNv+pjxAMJeDoobtXbqe9wRz5d/4M2MSJNQrTe73gnZKyzGJ3UGea0M80n010q//qlJngtjF0EkuKBZFxv/4h7AcIHpa5FUP+L/NzfBqJ4P75jtoaBp8C64XZZGV+Hq/mho=
X-MS-TrafficTypeDiagnostic: DM6PR08MB5417:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yfyRMu4MPTFnhMBeHMbt928mwBz4qJfnaPBuzb9i+aZ2NQ9iSMJWflKtXmqzFGH+ankrKm0W4OfjX36ZN0ZLkibogr8ZsoVwLQ4SC0q7Y83JkuFUaQ9MXZpbflSfBJDiCbJA2ZmFimkyEgOYsbjQQV5GXMdlLGZAoIlC2CdigLGFzQGVWwyR15MFm4UHUkxUDqVuzcNvsYRecj5zCGuSzCz7AoCEPe2RtAaLxvdV/CM74sZuQ/bWNVquisC40CTh9Y+Puc6aaGYQmAv5bV87UR1IywONVk6J0vyRCZm77oOJLZSEPPnfGq2mcFwIlGmBbUnBzGikkU3pd/AWDXRGC4XXELtxOz9imyR/+YmlNbkbS6vkk11CFNA0W/kepJGe+ZbEudQTM82P57tPPIxwjMZGGxDv5gm+s3aTZz2FLZnd4mj0mSM4UjeC4zd+uSIg
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sD3x0xSP9RFgJtBDeMgFUM+0UcVO10gsWipt95e67HtAd2LB5Jidx/taB9VjHCr2jctYplmloAg0eLDVTn7fV8mHca/OoqmrGBQZapTICPc04CyJj7dpopuJddTN/11LBUPN6miKZRX7v71sAq5l5WROjldrid7LkJFXs9VHbvW+nknP0cUKf8BDrNmWTIVqHQw3Xbg3/M3tbYVwz0L2Aw==
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-124b4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6527fc70-a441-4ea6-1091-08d9700dc9cb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB3993.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2021 01:37:57.5907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5417
Subject: [Buildroot] [PATCH 1/1] utils/getdeveloperlib.py: force
 foward-slash for pattern matching
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Force relative file path resolution of DEVELOPERS file entries to use
forward-slash separators since pattern matching assumes forward slashes.
This is to help permit uses invoking `get-developers` on Platforms where
`os.sep` may not be a forward slash.

Signed-off-by: James Knight <james.d.knight@live.com>
---
 utils/getdeveloperlib.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index b205817033d1d488c13e88f3b1bdbf82aa6b1224..fb8c7546d74f764468e6ffeb0d18b169aefb80d9 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -249,7 +249,10 @@ def parse_developers():
                 if len(dev_files) == 0:
                     print("WARNING: '%s' doesn't match any file" % fname,
                           file=sys.stderr)
-                files += [os.path.relpath(f, brpath) for f in dev_files]
+                for f in dev_files:
+                    dev_file = os.path.relpath(f, brpath)
+                    dev_file = dev_file.replace(os.sep, '/')  # force unix sep
+                    files.append(dev_file)
             elif line == "":
                 if not name:
                     continue
-- 
2.28.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
