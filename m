Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7B4C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:54:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2AF961078
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 08:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2AF961078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unilogic.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5AC682735;
	Thu,  5 Aug 2021 08:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6WK6l4wXLdg; Thu,  5 Aug 2021 08:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE5B681A46;
	Thu,  5 Aug 2021 08:54:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 467291BF9CB
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4301B606A5
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 08:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=unilogic.nl
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N66vVVPmSg_r for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 08:54:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E16E7605C8
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 08:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qdul/JYdeasw7UGAEWFIFA/+jIvPFaW+JnsFGCVUy4BaIVJaukuO5j8yk2/Tq8Lnlq2A6ttwF8WC+w0XEZkwHlBZ0IvRP9A/auzc1y6yky8l8PY30czkblYZ4Gf4ZqSmb1NRIxKiEgncSigJqIkNcdDJJfUdANM/qOW5Q0aDinokvAXN+OhodLEX4IuCnTXKDkOE4LAbmU9mMNZwmqj8xrGoJuLf6DjONzeavrgFLzkGTMdbYMnMZ/9X6QoEyDwm9ZyUk2KIBHGNNYU7ykRXQXqwbKj/qsgwn05GZU20Y563Pdsv5MQoBKRLWNpD9pMhfxNSzCg6IXNbk2yX26CLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW8BdYkLFK0rqgHmyyM0PREsvvTrC2tQShfY3ZOu4qc=;
 b=OZVbt8Od3ZnCx+Y6ogU3/P7zgl0aGUK3rB/5GrFUARLg/7J4zCdOCfVDn+if0eevrEovBDkmfm5AGkx8ktMH5cKUKwVmP/5tRJzI6wy5EBIwFKhxKOSZfhhtj2xZf/6+j1j5fLZhWOt9FLFOcWmaSxJ15XMZ6vfkF5BHxoYZTOCQRSF26FGqlJWmMDZYydPQhimlDAgTe/IX8icQ0zrNFSWSPapXcbRhTABUNqtrQda5J4jGDUKDpzjDuspnf80CKCC+jH3x/xy0fXzr1YwdpTfImfoddBUVFO5R20fOhLznUmRXb5+EWG+JFWd8JL6S20FIrW3cA3ofjuHrA4OO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=unilogic.nl; dmarc=pass action=none header.from=unilogic.nl;
 dkim=pass header.d=unilogic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unilogic.nl;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW8BdYkLFK0rqgHmyyM0PREsvvTrC2tQShfY3ZOu4qc=;
 b=byk/lGQcIDnnM16snvJ4TZdWpZ73T+oU0LTQgFAxcmSt8ftAQQd4GneBjdXgpzqiLbzFxIzLd5GRj3a+nhnw7PSGZ52Am0yWI22PpCHbLxAt3/VHzcUaUdOlrGec6U33VnAq3zWhiYFGcg+v7p+uyexPPe6V/yOWfKLnuo1aLLw=
Authentication-Results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none header.from=unilogic.nl;
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com (2603:10a6:208:46::31)
 by AM0PR07MB6339.eurprd07.prod.outlook.com (2603:10a6:20b:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5; Thu, 5 Aug
 2021 08:54:09 +0000
Received: from AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6]) by AM0PR07MB3987.eurprd07.prod.outlook.com
 ([fe80::3cfb:3f55:9e55:4fe6%6]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 08:54:09 +0000
From: Pascal de Bruijn <p.debruijn@unilogic.nl>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 10:53:52 +0200
Message-Id: <20210805085353.3457-2-p.debruijn@unilogic.nl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805085353.3457-1-p.debruijn@unilogic.nl>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
X-ClientProxiedBy: AM3PR07CA0142.eurprd07.prod.outlook.com
 (2603:10a6:207:8::28) To AM0PR07MB3987.eurprd07.prod.outlook.com
 (2603:10a6:208:46::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from optiplex-pbrui.unilogic.local (62.133.193.10) by
 AM3PR07CA0142.eurprd07.prod.outlook.com (2603:10a6:207:8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.5 via Frontend Transport; Thu, 5 Aug 2021 08:54:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02bb9b00-aee7-4faa-8271-08d957ee96b7
X-MS-TrafficTypeDiagnostic: AM0PR07MB6339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR07MB6339CF775698A0B0FA97F3EE9DF29@AM0PR07MB6339.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/X+MJxtwjzZiXKvmr4bbfnBliGERaPrKOarFK8eF4vLuxRHzx4kS6zxV7eTI6SbufCzyN3BDtt0wYnMIvC+0r4++v75jg11n+VyFWl/vdGV54OZFzwlyftcchotDMJrACax52JpaBhhT90z19Pmsq/Ig/9K1PgKS09eAckcwIB30dsK7pLBKyw0gWkJYuqTdRzBt5r7LbijboijnfEMIsg4ACftcfjK1FGI3DvhPmRmZKu3hFKbHfYf7fY+ytKv+jPe+pQmB/0xrM43p/OyDKTpVBkdPXxeyXtUEpz2fFLFkhkCaEIXfwcShXCOAZMSDyL0zW9tpuj1pR+Eax1Eo+7ujGywVLoQ2c26gQ2Z41snCzvrJFqvOS5SQ57TNK+vef7F452Kjezsn9Udr5DiQi3hm1gwKWwKFlnamBo4KjfFSYF/i5jyb4lPFzsWkGlejoN7Cyu9IrcpkMpydOHi7Gqtn+fmk2m1kRfNY+B4RJHWlXPMTi8k8rIhESYi/pd4zU/K5rZ244YHZZ6/iuuLO0utEIgFGzZYHurUDt4udsTw7eFvqmykedCt4o5hx7ngBEDyE6J2XafZuOPrUxjEGdtii2GOOCp97ulvWek0I5wwQZmOURZJyEUFP/Bi4m2n5DXrAorTAT1WhEfaQbE/1I0rOHNTrPcbBxvez1YHvxkxAGK7VYRf+o+3tzNxkMXYHYdJpzi2THHSUTfJfSWffw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3987.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(136003)(39830400003)(346002)(6486002)(6512007)(83380400001)(8936002)(6666004)(8676002)(6916009)(38350700002)(38100700002)(5660300002)(478600001)(86362001)(1076003)(26005)(2906002)(66476007)(956004)(2616005)(52116002)(66946007)(6506007)(186003)(66556008)(36756003)(316002)(107886003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z0GXiaHjA8lFWnv5zfppfV/MHEBhSBsVf/81yPmwTnaGpCpaqBaAqcb2B13L?=
 =?us-ascii?Q?BFqUy27mavVeOD8hCKkdWR0yuklkKaNXB2J6qHN44YhX0It+ntcT9ZUfTLRE?=
 =?us-ascii?Q?d1p5t3slDKm8441EzTWytOPL2KrXUynnIAIkc9XVJLEDlKM2E0pPjIb36pOD?=
 =?us-ascii?Q?IOI8qbCD7C6VNRk5YSUyHnrvcTvJzor3yGkV2tMG6ncN/PRnRj7VAJnT3Rtk?=
 =?us-ascii?Q?yI3aiHIeaJ/W83xzTRcSqJrldemgDNrB1LL5q3lzyP+ie/VdqE/jxmiT2X4c?=
 =?us-ascii?Q?hK3WYuMWlbS+iYjb/yMFVBiINt4HfM0poR+IReTUk62iNRnx0DPhLcQou9cx?=
 =?us-ascii?Q?KpKhyWhe2MSErGQ3VUWkAKNK5neqI8CHyPjPJNyNykJxV0Ww4+KbCSQPd8i8?=
 =?us-ascii?Q?DUaVzYwS8G258//KtBC6k4ZmXwVpw4WARsvgW0Rkpeo30uXvkNO8kjWHu7AS?=
 =?us-ascii?Q?8siWx633DVy9sUACO/VZdY6JI0WVhB68LJkTwFJ/fliv/26bqGxZde3Vn7ze?=
 =?us-ascii?Q?anhXPzMi2TxojNzEOyVLobcRH7eMc0YFYPrPko2ITrG6FQ7KjLHDPl8wuUAj?=
 =?us-ascii?Q?4dCOrvwuD9pCf0sguj6cpffsUdaZUFtH9GDh8jUL1i1y8NXfhXgRiwQ8PFp3?=
 =?us-ascii?Q?wDylUoaSYlQF6i5vQqAdOZ1XkxMhc2xs8pam2zrQmbGRCPbWdmKb+vRf/vW7?=
 =?us-ascii?Q?or8Ip8zzC6Y6IB2NtQdI9Cl+uCsRuCl4jNrqpuu8/DBYgQVuYTQS6erfY5Ai?=
 =?us-ascii?Q?3jVfwV8m8E2s2K9S7LLFCkAVtIbzdOHjfpksJgdZdBIeUq1+ipxN0PKyeKt+?=
 =?us-ascii?Q?8Ujxd8IcRfW0wodqW0sBM1mRNcFr5pJexaq94oBY9ymEM/QpfeH36ZPx2k7l?=
 =?us-ascii?Q?/K+bPDeJITBmT6Dl5BvpIEaBzzHB1rIzoQxF1o5YHkr0ikYRN3vfV7iG5480?=
 =?us-ascii?Q?ze02xw2OzVRgPzlsqIwJ5WMyvNFi1XDuIZwEP/OsuCpTSvNIBEpX0egLF8V+?=
 =?us-ascii?Q?NMfKQXniyyAr8llMyDGf/Gumv0fTiCnvARWqkc4jJmHAMujt94Xufncl7SFW?=
 =?us-ascii?Q?wH7hYsuvLfaXTGSObv1N/hNqnG986QWWAGTHYcVojw3eGDAIOdPr85bj0Al3?=
 =?us-ascii?Q?7XtlJUJ95K0Z8nEjJwb3ziGBj1qiOkxhRLlTcgS9eEQkpJJSRMgPDaha1pX2?=
 =?us-ascii?Q?wxc3AKfg9Boz7a3esGvKtgIasTyBQUGqNSxQfH3X9sTCDNgmMxvpRjxterZN?=
 =?us-ascii?Q?3yCISHW1dpVdxWdzPk72jHwkdS3uYFqZqWj7E/pUlxJ49txD4vIV9K4Z0KLP?=
 =?us-ascii?Q?BWmW2WKAFIoj/mARxlG8lX6B?=
X-OriginatorOrg: unilogic.nl
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bb9b00-aee7-4faa-8271-08d957ee96b7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB3987.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 08:54:09.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 80e1d02e-cf3d-42a6-8024-091a212ef6af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iksW3+9Eo0/uVxCDeHc+vhB5OwZWcGHYwbvE0WItNLhtbdb3QPJIYAfii1jRKTb+395XSG3SMOwjKOcSVIxGVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6339
Subject: [Buildroot] [PATCH 2/3] package/php: opcache link against librt for
 shm_unlink
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: aduskett@gmail.com, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

shm_unlink is resolved at runtime, therefore verification needs
to be done at runtime as well:

php -dopcache.enable_cli=1 -r 'print "test\n";'

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 ...he-link-against-librt-for-shm_unlink.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/php/0005-opcache-link-against-librt-for-shm_unlink.patch

diff --git a/package/php/0005-opcache-link-against-librt-for-shm_unlink.patch b/package/php/0005-opcache-link-against-librt-for-shm_unlink.patch
new file mode 100644
index 0000000000..177a7a2b0f
--- /dev/null
+++ b/package/php/0005-opcache-link-against-librt-for-shm_unlink.patch
@@ -0,0 +1,26 @@
+From: Pascal de Bruijn <p.debruijn@unilogic.nl>
+Date: Wed, 04 Aug 2021 10:01:00 +0200
+Subject: [PATCH] opcache link against librt for shm_unlink
+
+We do this by modifying the fourth parameter of the relevant
+AC_RUN_IFELSE statement, which is the result if a cross compile
+is detected.
+
+Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
+---
+
+diff -Nurpd a/ext/opcache/config.m4 b/ext/opcache/config.m4
+--- a/ext/opcache/config.m4	2021-07-29 14:53:58.000000000 +0200
++++ b/ext/opcache/config.m4	2021-08-04 09:20:16.950350469 +0200
+@@ -295,7 +295,10 @@ int main() {
+   ],[
+     AC_MSG_RESULT([no])
+   ],[
+-    AC_MSG_RESULT([no])
++    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
++    AC_MSG_RESULT([yes])
++    have_shm_mmap_posix=yes
++    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
+   ])
+ 
+   PHP_NEW_EXTENSION(opcache,
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
