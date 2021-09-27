Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BD9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 08:02:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E59561165
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 08:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E59561165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=plvision.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ABBC400F5;
	Mon, 27 Sep 2021 08:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05-9OsoDbt4O; Mon, 27 Sep 2021 08:02:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 477254044E;
	Mon, 27 Sep 2021 08:02:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2B431BF37E
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 08:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8EEE81AEF
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 08:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=plvision.eu
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zL_rsQb883Ci for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 08:02:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70091.outbound.protection.outlook.com [40.107.7.91])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 538BA81A29
 for <buildroot@busybox.net>; Mon, 27 Sep 2021 08:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mC38c7qmWxDC0Zk4FC9Eoya7V/MlRVaLt7BXS6TdFCj3qijmvZgI/REMg+/aH2u7pVdZh7GOUpAtbLzmk7R/sURngqlr/FkClPiGtxPHtXDhTnzEQpOig/gybxXwePa9DrlwGzGXx0UK7G1cIx3Xr8rgLVNPEKSwNMW7dfIDPqIpuSZLxQapLaTIB6L2N1m9XmUWhgjipV82jmFUqa8vwi7ok3pLFJ3WElLNKaWaHY401prf78orx60KgsthLM0QX1tpXucADziANaxK5Mu26Pgd/7pB3k2WC3MbBEstFbTmEz+fOlpbC1UEmGfyi6dK8gplGCA/rn6eeO09a8T/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=vMcVU5IDiyhsC35iI6oaY3jF23g3iVAECPbP50cJd50=;
 b=BcsWSEa26AqzuTFeP/xu9PBMvT+3WLneNkHRKkUIForC5dhMGnCkMDlfeax63JxANaoCytQHklQbDDU+a3Kx83ZqqbEx+7W+PYNgVdyxp3iL/W0S1k0w1A5AJ2VoZGatPMoyF2Ydm87337trqiXDCI1sAaAqd0iq2ylmUl4F35Tcyj7/5hjkUlsy5OAbnRl8y1+w9tVinXj0RScVATquNW6JbL4wTQEpqOpVaDgvISbA/9JyhpoQaM7hp4jXmrlt4g0MNp4UKr4NNIriUQ0E0uF4ugO0m759oJP4kOluqoBtqM5BBpVNNOMTI8P2LjOXSvHS+ru5/Z9SI/GtcUDHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMcVU5IDiyhsC35iI6oaY3jF23g3iVAECPbP50cJd50=;
 b=EuFbdq+Tt4LepzVEKan771NkYN5oWr44Q0PRuP81jV+JVgoTF8M2XGYc4be/kErFc/UsIeDutk/tLScuItTde9J+i44RWeScFc+FNxm0kFpkVvmRKPQ5EeODb46+jeAd1rHaR+X6BmSb51ZmuosSX3gYTtjTi7yDR6Nhtolx06w=
Authentication-Results: plvision.eu; dkim=none (message not signed)
 header.d=none;plvision.eu; dmarc=none action=none header.from=plvision.eu;
Received: from AS8P190MB1063.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e4::5)
 by AS8P190MB1478.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:3f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Mon, 27 Sep
 2021 08:02:28 +0000
Received: from AS8P190MB1063.EURP190.PROD.OUTLOOK.COM
 ([fe80::6c02:47f7:ff7f:2baf]) by AS8P190MB1063.EURP190.PROD.OUTLOOK.COM
 ([fe80::6c02:47f7:ff7f:2baf%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:02:28 +0000
References: <20210920192442.2784967-1-francois.perrad@gadz.org>
 <fba75762-e27c-7530-b133-b11735c24c7b@mind.be>
User-agent: mu4e 0.9.18; emacs 28.0.50
From: Vadym Kochan <vadym.kochan@plvision.eu>
To: Arnout Vandecappelle <arnout@mind.be>
In-reply-to: <fba75762-e27c-7530-b133-b11735c24c7b@mind.be>
Date: Mon, 27 Sep 2021 11:02:26 +0300
Message-ID: <vrcxh2wnn2a1kd.fsf@plvision.eu>
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To AS8P190MB1063.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:2e4::5)
MIME-Version: 1.0
Received: from pc60716vkochan (217.20.186.93) by
 FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Mon, 27 Sep 2021 08:02:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 390abeb4-9918-426a-d4e7-08d9818d2652
X-MS-TrafficTypeDiagnostic: AS8P190MB1478:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8P190MB147805A9FB6317DC6E4E790C95A79@AS8P190MB1478.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMoMN2BI4wvGBRBdseGJrhzXpF/KoCms1MegYjHqaYAMRebGJZDfKaqZUnd8dIDbZks1BmlXL+1cQouD+oiT22BWgk5DRIi7/XQq6D6q6zfeBC2Z3krj/Np+sZqN3G4/RtIiinLkRVkFPqrFLSp2cTonxXobtAX6U1o+OpiDBa74bcum7LlMQ0BQwDKs52bcvfCCEEunIVCtJUuaxeoiS/vUuCSxXLCbKXdxJdMrr45aw3Q4HQKAHXcofumxhXXR4Jy8IERHZa2xO8ak/ybD2np2ZqG05qEVnipj1mNMoK99JTmu8XZY5Rv1xBY0RSChHM+cucMr6Mr3ZP10piTrUOD2Ehv1yTSUSRCMzeHpSDlU00WdkkjBOeV7aZePi+bS3IUg+I9huLKj+1G9XJGbIQ+dXkP9k+Lflw23tSzaKb8XF3NfNx4qpzU+kH0l5qNyDnyhBQG/fsoflojyMSlNWe9kkT73yyxJQDaLeQMMy7XBTZRngBW0H9CXf2etbJwhRnd5Yb7DGDmPs7pLrBfCi8JQy/lRX07rtG3isv4wQc+Ibsb+NWRrSi3AtfOVXI7dAFhovWRsuPwFWrnmiN3sLeiwtwrWu+sH/onNbX+fXYxJd5kUUoDnGDRun59LMDUcXG4Twoe/7bEYUlAvjBQb2OLD0+PRCxGf2DKhFoAXTbYiXqhzcLzHmxbiUrDDoxk9o/xtXowhJBrcrhCjwgDjzuiKJaltLtp2u3JT+FU0qg35uj3ytlMdMw+lsosHURGnSJiQKnckqxjXNn8gXQImCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8P190MB1063.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(966005)(186003)(26005)(52116002)(508600001)(107886003)(53546011)(6486002)(2616005)(66556008)(66476007)(956004)(6496006)(316002)(8936002)(36756003)(2906002)(38100700002)(86362001)(8676002)(5660300002)(54906003)(44832011)(38350700002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YNSlxSxfRzSRCbc1ecaWkFnFgv2D8AFBHWTiexUKUcxq2x0etoOTeTCesthQ?=
 =?us-ascii?Q?FbfjCLacIBGIR8mGeJiNxA+HpiuinjGZuDx5t8stOlKKhJLOnLEMXWV1nAmA?=
 =?us-ascii?Q?Z9UYGFc1POudCnW/ooQYI2XyL/3mCLcZLxHYCTC8rOaBWimRATjs8edkf7PU?=
 =?us-ascii?Q?aWVvSgF9tSDWsExK4NhrEvvlyYchZPKl6zLmhaNzWrTudMUKAJuUEpuxg9LU?=
 =?us-ascii?Q?VudID+TKjcCewihgIEAQ21XU38NrFrCZSE8k+LttQevQllCLcAgs//EDkeP8?=
 =?us-ascii?Q?nLxQXJ3IKfV0bHemoQlxmSuVJgy12dOkLB/lDWKnVDiAgdWoEipXYYxOwR83?=
 =?us-ascii?Q?I7AXS1mKGHHdsoUdi6ts0orB9KzQKW2kdbUZclrJmfc5O2gslehliqjxBuqA?=
 =?us-ascii?Q?e84DUFV54hIeIEA5nXKosNtRq2Q/CdrLX2jcOxQHDlX9C0YWr0Us6X4tmfC+?=
 =?us-ascii?Q?tRGsoSSLrCsvnaaj4rFxBXnhpivGq6BYOvAYLnVQ9SYcJ8pitPMBK82QshTE?=
 =?us-ascii?Q?kpPoe1HuJx6gG8YAghSx4slPpCye9qycKAG8Ny6VCxEvq7/xhN68P7nl/gFy?=
 =?us-ascii?Q?CdVZHJW+WJFiVPywzbUwHWQkrbH3eRHhjGrSECgBTNDZ0V3+Ql5HfEX2xvcO?=
 =?us-ascii?Q?vYIYvHGPaIhPh7LE5hFYKPxKFR5qq1d2dBf7Da5ILY3hlK0hEJuHOSSwrMZD?=
 =?us-ascii?Q?vd55A8MFbEQGznxqun3A0WtxTFrH8DJRoy08yb8rn2rMdGEraR5mM3I1Ddd1?=
 =?us-ascii?Q?9EAeuhkzbhu2cDOi7DC7NJBwQOFoXuEsx/aOnUXw2xow6SqPTBem30VL6lmk?=
 =?us-ascii?Q?8ttLrpEkXdKw1mjBkcxiegME/JJKpb/fOnmRR6PRfntYWq8lZuzYB7CzO1PU?=
 =?us-ascii?Q?QjeISd+uPKWkWkw0Z2i1zVzHr7fmxQUS7NtVvXxSnogwf9Qf0/i45q3JJfZ8?=
 =?us-ascii?Q?HCP6NnB9CAS602wQgiWhaJzNKqvrYziYWCYDbZTgRq14SJ4ysepJdoNxEzsi?=
 =?us-ascii?Q?fj/gGuXZH+1io6noGcrVNWuqI/10bdgmk+V44VCVZGZHj7oNQKElf8HI697p?=
 =?us-ascii?Q?mqcM+r1gcu7vfZ8NROG/av4P8ETfPD5WinPgbQh7Kw7qBDr2+DBYOJ1gBbs9?=
 =?us-ascii?Q?WQepKggXSpjaVSMuNB29bGfavsE/Nk9dEjFB0MmaX3WeCH9Kyz+6s01gZz78?=
 =?us-ascii?Q?l/mExdDpA/oSImZylHxAiIys2u5yYMXwSVM7MKvGiC9c0GTr0V2dcKYPWykC?=
 =?us-ascii?Q?rpSGrBg6JcL5ch80V3snY7Uqk5tQfovCYuYNV/6Gux2/WWL7Fm6h3jNNL0rh?=
 =?us-ascii?Q?emp6/xaHgGzb4ljcUSDkXQVw?=
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 390abeb4-9918-426a-d4e7-08d9818d2652
X-MS-Exchange-CrossTenant-AuthSource: AS8P190MB1063.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 08:02:28.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne3YrxkqydO/azRJss+feDjfWa1VtpeQqW3i5+47HBtl1G9eN8L91HYr2zDrUN8C3BZwRaFIkhNSKaijS8x9hsgm+kVPbSSjTuwK94mcAcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1478
Subject: Re: [Buildroot] [PATCH] package/mstpd: new package
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>,
 Vadim Kochan <vadim4j@gmail.com>, Serhiy Boiko <serhiy.boiko@plvision.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi All,

Arnout Vandecappelle <arnout@mind.be> writes:

>   Hi Francois,
>
> On 20/09/2021 21:24, Francois Perrad wrote:
> [snip]
>> diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
>> new file mode 100644
>> index 000000000..0e5c9714c
>> --- /dev/null
>> +++ b/package/mstpd/mstpd.mk
>> @@ -0,0 +1,13 @@
>> +################################################################################
>> +#
>> +# mstpd
>> +#
>> +################################################################################
>> +
>> +MSTPD_VERSION = 0.0.9
>> +MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
>> +MSTPD_AUTORECONF = YES
>> +MSTPD_LICENSE = GPL-2.0
>
>   There is actually hmac_md5.c that has a different license. So I added that 
> one, and I added it to LICENSE_FILES as well and to the hash file.
>
>> +MSTPD_LICENSE_FILES = LICENSE
>> +
>
>
>   Vadim (in Cc) posted the same package a year ago. He had
>
> +# mstpd requires that it is installed into /sbin, not /usr/sbin
> +MSTPD_CONF_OPTS = \
> +	--sbindir=/sbin
>
> which he later explained with "it should point to /sbin because
> Linux's bridge implementation calls /sbin/bridge-stp in case the STP
> handling is delegated to user space." - which sounds pretty feasible to me...
>

This is can be checked at least by this:

    https://elixir.bootlin.com/linux/v5.15-rc3/source/net/bridge/br_private.h#L51

So may be just create /sbin/bridge-stp link.

>   Did you test this with STP and with a non-unified /usr?
>
>   I've anyway alreayd applied as-is to master (with the license fix), but please 
> check if the --sbindir is needed.
>
>   Regards,
>   Arnout
>
>> +$(eval $(autotools-package))
>> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
