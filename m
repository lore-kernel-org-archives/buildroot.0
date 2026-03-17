Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD94FED9E2
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 15:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A8B683EA8;
	Tue, 17 Mar 2026 15:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gc7m41xQl3C2; Tue, 17 Mar 2026 15:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5483483ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773759628;
	bh=9umfxBFMKWKA+LPIY8sK44MwyusHYoBWbXSUtQf6MQs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hV2I6gyuIdgD0m4+eYuzUZR30lvq+DZrH1DL40ddSdf4nK3lOY981N06UgjSLhamL
	 ByQWWIjwsciYyl2uEaZwG1p2dpuVK2Pb6bw4Y38hAE9crNwK7UEnmBpka1byk/FQbG
	 m1oet7+tBXsmR8xwnzpjqMmeggQdMDxV7562Xk8L1dhih5J+BDyyMjRRdgVvM39KK4
	 UwbIKa/XTMRs1n7zPnp/IsAz5xfy8kaO02e9tnyQWvzAF0clG/EJ4/9fZrB9y0UN3f
	 AMABzZmY0jy9nbvxVeNRe1G/tmYjQr+1uupsY11Kl3nBQ/FVJsqg/PoeM1gZa7HlMw
	 aovlzQRtGKIDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5483483ED3;
	Tue, 17 Mar 2026 15:00:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 351503BE
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2689C83EA8
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaGeWGtYIv4n for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 15:00:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::3;
 helo=mrwpr03cu001.outbound.protection.outlook.com;
 envelope-from=quentin.schulz@cherry.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9F1C83EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9F1C83EA0
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9F1C83EA0
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 15:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rK0Mo8BwocP5UR1Hn/do7sTyqW4JW0bLSCbDg4TW5PXJZYVhLtoLn6Kh6ONAR8S6stNIiRy4GTfPaqBwWz8Xp6TGKa0mJKDudSEx4wzaO08A4finpVJZ27bY1jsn0QV7X1qRQ9J7ttKRHRfVzbr2gSO4IYY4QNCZMKdOqTbe796WPXUDURENa9AhwOfvZt75BszehGYfdVqtSkKG78KtWblPL18zwikblLsDhpvIQWOGTkjdBBpNcguF/smLxjihpv4xL0OOe5VgqtATIfx536zHLTIGkVHhC20nInc4OLYHenwOBYkzGHXcIlFQnPo3AMUDROwbfIm0gtyzXZbijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XDR2lSX6hbYc1f/vv/cxz8iKqG08XkdW9ZUYcWPlHE=;
 b=flBKdEVP4S8z5ihp4OyqMP1HbRunt+zN9zql1x30g5jE62wsoCeW0zXCCZn2kr0zwJbARJVj8qKQlZ+yyPJAUncNb2UzIk85Ij4f0VdeFdmsztLmXsHtVAa4k/Rb2Yvf+nbCkYa5YqT8Rgdj3kM5Jc+lQWNY7MYlBDoZkic21OqrzDwBYXZzTA7woFGFC+neo2FGpDaTMm6hkxzhvKAt1dbJboOb4VWnHwZ7xpE63FrKPlQjql06LHBM/pRecAv4SDd5/5BX0twgw+AOBWZGabiO8XUM172Mt6Jad9WEDkCRknDgl0uCe0ousu0euJRRaA/9snQrH0iXK03Puctr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10544.eurprd04.prod.outlook.com (2603:10a6:800:26c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 14:59:36 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9700.018; Tue, 17 Mar 2026
 15:00:03 +0000
Message-ID: <d703edf5-c644-453d-a3e3-7e2024d1890e@cherry.de>
Date: Tue, 17 Mar 2026 16:00:02 +0100
User-Agent: Mozilla Thunderbird
To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>, guenther.harrasser@mobileye.com
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
Content-Language: en-US
In-Reply-To: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
X-ClientProxiedBy: VI1PR0102CA0095.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::36) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10544:EE_
X-MS-Office365-Filtering-Correlation-Id: 2350528c-9006-4d8a-fecc-08de8435de74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: enHbft9olzPRG5X4fIreKCNRtwCLEcOKu8BmYkcEih50MhjiYzfyQa7m5e9FQMyEBu1onozAyLiiPSv07Ulj/7hrEV5EoIE7PwXKYb/zYS3lxloFULWKXgW2PiNBRPsWAsBTJGo0t3ttecf9xLG3DtlEf80O3HIwKTOzjPt+7n9qdPO+rxtLmegYtghe0nd42qxE6fWJCHXhs3PxaIPfxx/K0QXZZ9TehXdlxkGEAUfJWe36XiyJp0Us6ZDrhys3qgyH6SHfT3UvkOvr2zKMDPqiElHchuMyEGUtzgWb1Ervu77NVJEtlBQvAfwxD2zI0Y0OSCeu3tGpb7504CvsmBlIYsFgkbVcHm0t9OjEmt2Qw/50mHh7SC+3qDKWlmOIeqNVGHb5o3zTJrqhwpvhPZuLbISXSN7QnG7ZUwbLefQV3CYRvKc8RHMbb2/PgAw7JVhs+3PaySG1m5dFN4556+lCrUQ6WjP4KwxhIA0XHDoQ98IT1YyUnwiJuOjLNRKEBZvK3c6IsMWiztSLlCCfXFhMRmPMLrK5lPxUK6/jXDQwqkgYR9l4TU58HwpVceDQQrTJsQAPb6XcVotIrTpgxyMq3fmiDKGLa4SbDhvRFU4K6eGFh5l/EbLoO3oSjx4WZKDwgo8DXpt0TQVxlcn6V4mE7pyrTnSU1AgS659xGHM/aztT5TKpPjqZ66nOHs+v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDNody9yUFhZeDNIUlNCREZVWEtiajhmb0taalo2azNpMVR2SzVNQ2RuWlZk?=
 =?utf-8?B?dlYwaGdqaGErTm03WjU4MmFISS92QUZiNkczWjJqZUM2b2J6aTRDd09saEZ5?=
 =?utf-8?B?cS8zNUQxUkpzVCtrT0R3c1RaeGp4bnlOb2hqT29uN1FFSlprMng0UHIxOERi?=
 =?utf-8?B?VzMyYzhRanRLTmhjOGJka2F1UU9HT2hnalNSV3hkOXQ2cnh4bFNJMzc3cXdl?=
 =?utf-8?B?VCt1bWFkYmZadVduZER6bUcrZzIxajNkSXQrbGxKNXBXTDNlVlR4RnlhTTJ1?=
 =?utf-8?B?Ukc5djJiZUo0Vll2QTBTTmVGT0NCamhtREZyYjNZc3dYenNsazUyRy85STNJ?=
 =?utf-8?B?SERDcm9TUWw5ZDBOM3VxN0J1R2VZY3dMUjQzTGIwYm5ab28raWEzTHJibjIv?=
 =?utf-8?B?NHFmTGlqUmlNZ0E1Qnh6RGxua3dibitVWnJFdm1ZN3Y1em1ZSDBpWDBjODRU?=
 =?utf-8?B?a3Y1aVIxZ294eDRDeUtDSkFJRWdPNFhjbTl1cVY0dTZ0Mmhpdms1VStsbS9I?=
 =?utf-8?B?dU9kQTVRWDdkZmRlc2lNV2ZqZ1duRnNtdUJCSXRPQzhCdHdsU21yM0ZOVjc3?=
 =?utf-8?B?Skc0NFBOYlFvd2JKU1U1RDRnTGxJOXEwRTB0a21HeUgxR3BqeGFDbk8yZktW?=
 =?utf-8?B?Y2ZCcmdIYTIxK1IydFlBdzJqcG5sTndPQUlBaUdPUmhobWFJTlFKMDRLZ2Zk?=
 =?utf-8?B?ME5FeEljUWYreVhVNTBIQzZFTlIxMUdpdEtzckQxTW5sMDh3TE56bEFlbGJC?=
 =?utf-8?B?dnc0blZmTFpGbkx5YVBiaC82aWpIL1JJZmJiWlNmL2hZYnJ3MDFIM3ZJNHBK?=
 =?utf-8?B?Z2lGR1E4NjNZcWZHbHJ0ZXlLNVRETVZxNzcvQ3Z1QkhvNUFXalVMc1NRR2kw?=
 =?utf-8?B?QjZpVm1xWnVGWnVyZG9WQkFXTlhvVFpjOXRkNXpLZXM5TXUzTHdLaGlGQXdm?=
 =?utf-8?B?emJJZGVaclA2R2J3U2FCalROK3NXbXNaRGNwR2drUUpodTdJRk9XSi9kVTlx?=
 =?utf-8?B?UmpYVW1SSmhLdEh6MS81ZEk2YVVRck9SejVDeUhHdndvUXcrODZQemhBSWhq?=
 =?utf-8?B?MWs0UWhKT0ZRY2dhd2pETktJT2pyR1JIKzFTb0ptQUxEdmwrQjk5OWV5RkY2?=
 =?utf-8?B?WDJ0eCsreEhkdHlhMDRBaTdCVVA1Q01TclNBN3R2Y0dQNDc5ZmF1S3ZVWnBv?=
 =?utf-8?B?bEcya0x2NXRMeWZaeVU5OW5qNG16bkJFYzhXVUlxaVg4YVpCU0NmcmR0Q3dN?=
 =?utf-8?B?VmdEZElQSmU4RFhkUEYvTWFQWU9DbWcvK05xMGVUNlljTzQxRnBjL0R2L1BU?=
 =?utf-8?B?RE0zN1I0V3g4MUY3cnBuWS90S1ZicFdOQkJVaFJzQVVXTk5Ga1RGOUplVTlI?=
 =?utf-8?B?TkRnN3BvdzBzQTUrMzZYSjlwNWZibWRFbDllYy9CbEpxMFR3SlZQekNvRFpS?=
 =?utf-8?B?eENRZVUyamRGTUhPZHVoYVJmMGhtTHM1Z0Y2KzhuYWJNYzlvTUU0S0RXaUpi?=
 =?utf-8?B?bXRpSW02cE1pOU5vOTdNK1NXMXRPSDUyZVBLcjNOeU9KbmNrLzVZNXpjcDUr?=
 =?utf-8?B?eTRYWm0wditMT2dHQy9teGJhU2x5UEp5MmRJQUNxMDJZUzJpMFh1OFpJaXl1?=
 =?utf-8?B?Q1hpd3RjTnhRdCtXVEtPZm9aZGJybnhlNTFkOVIyNDh6eFJvVkZQeEVXQTEy?=
 =?utf-8?B?V3JKTEhaQ1hoZGlCbS9ScGx3Q0w1S3lVZXRZZVlCK2RoYi9CQ3ovWlFIYndI?=
 =?utf-8?B?Q3JmSVppSnZWUThQK1R6a3hkV3lzY0VMRE0xdjlpcEhoV1BXN1ZIWUNuOHdG?=
 =?utf-8?B?bjJTSURLUWZSeFR5aFA0STVlSGI2YWhSank0OHRGYnZmOCt2MFNwdVJVUFhu?=
 =?utf-8?B?WklpVXVXeUhCUU83azVQeEFIVmc4RUwyeDBIMWhlVzEvYStEQjVWR1FIRUsy?=
 =?utf-8?B?M1NoUUowT2lDSm5sbEtlWEFKSWJVQmhHcmtYeWVWTEtOUDRHRG9mbjNJVHFK?=
 =?utf-8?B?VXdJaGE3VlpkeUZrRnhPbmY1amYzbHZkTG5peFZXdko3S0crdlBIVWRpUkpT?=
 =?utf-8?B?RGxOdEhuVjd5bEhZT2ZEM3lhQ1I1NDI5N2o1eVZVanRCZ3FzaDNleWpqR1l6?=
 =?utf-8?B?R0swKzM4NDVYMjkvV1lpT0hjOXVWVkpHRkx0TENYNVZPcTJkZ1hrTVpSZER4?=
 =?utf-8?B?ai90cEFZKzZFL2FVS3RIc2hXUklTTEJFNG9JbjE4NVJPSFlGaTBNR3VZTjdZ?=
 =?utf-8?B?QmZqdDl6dGVNVUNwTjNNOHAxK0lwcitFSWVuR3MxQUhvc0h1YWRxN1Z1SkQ2?=
 =?utf-8?B?K1prdHhzblVqVUdDMWtiVkZ3UjhKQmVxVU5nS1l1QTJIRjFLSk44QT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2350528c-9006-4d8a-fecc-08de8435de74
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:00:03.7450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbFiDOAfBJLHE71yhrg0qHkWfFjEziJOgnwK6x2htjyOB1x/ug46beIvS2w1KINNkrwB+RGHvuws02FSec8VyIjOmdqvIEoLxXoKDD+Siyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10544
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XDR2lSX6hbYc1f/vv/cxz8iKqG08XkdW9ZUYcWPlHE=;
 b=dR8TCZ4yeAFFFhuAlqqmH8HkY9QKw6f15g5mK0HQbBm9xq/Egq8LydzX8CVThK81QcW4nUWscFrfnCt1w9/ftAJQwz7KwPSeQ/FodP3/i9SEamlgdJKYma2tAtYkAgttRTqzJ1/tW09qSCQmtFLq7drjmobOZVN+E/LNKUUHbso=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=cherry.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=cherry.de header.i=@cherry.de header.a=rsa-sha256
 header.s=selector1 header.b=dR8TCZ4y
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Subject: Re: [Buildroot] [PATCH 1/5] package/libopenssl: bump version to
 3.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <quentin.schulz@cherry.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jimmy,

Thanks for doing that :) A few things to improve though, see below.

This series doesn't follow the naming scheme required for backporting to 
stable releases. See 
https://buildroot.org/downloads/manual/manual.html#submitting-patches 
22.5.4. Patches for maintenance branches, specifically

"""
However, some bugs may apply only to a specific release, for example 
because it is using an older version of a package. In that case, patches 
should be based off the maintenance branch, and the patch subject prefix 
must include the maintenance branch name (for example "[PATCH 2020.02.x]").
"""

You also said on the #buildroot IRC channel to "Please wait that I test 
it on the runner." so please consider only sending series once you're 
done with your own testing.

I highly suggest to provide a cover letter to your v2, anybody not 
following the IRC channel won't be able to understand why this was done 
(and people who do follow the channel may forget about it). There needs 
to be context and justification why this is fine to backport even though 
it's a major version bump.

For what it's worth, I've done this in a local branch and added an 
additional patch for OpenSSL 3.5.5 security bump (see 
https://github.com/openssl/openssl/releases/tag/openssl-3.5.5) and I'm 
about to publish a new release for one of our products based on that 
(just so you know there's been *some* testing).

Cheers,
Quentin

On 3/16/26 5:13 PM, Jimmy Durand Wesolowski via buildroot wrote:
> From: Kadambini Nema <kadambini.nema@gmail.com>
> 
> Release notes:
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.0
> 
> Changelog:
> https://github.com/openssl/openssl/blob/master/CHANGES.md#openssl-35
> 
> Rebased patches for the new version.
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> (cherry picked from commit 9868ca6ec98afa28a94aea50cc940db7df860396)
> Conflicts on
>    package/libopenssl/libopenssl.hash
>    package/libopenssl/libopenssl.mk
> due to intermediate security bumps from 4.1 to 4.4 with commits
>    0ec6cf7f69da "package/libopenssl: bump to v3.4.2"
>    cd6d8b9b251d "package/libopenssl: security bump to version 3.4.3"
>    dbf192e1764e "Package/libopenssl: security bump to v3.4.4"
> Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
> ---
>   ...nfigure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
>   package/libopenssl/0003-Revert-Fix-static-builds.patch      | 6 +++---
>   package/libopenssl/libopenssl.hash                          | 4 ++--
>   package/libopenssl/libopenssl.mk                            | 2 +-
>   4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> index 629d9c26ce..2634d69f35 100644
> --- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> +++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> @@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>    1 file changed, 4 insertions(+)
>   
>   diff --git a/Configure b/Configure
> -index 5a699836f3..f9152b1702 100755
> +index 15054f9..ac3206e 100755
>   --- a/Configure
>   +++ b/Configure
> -@@ -1549,6 +1549,10 @@ unless ($disabled{asm}) {
> +@@ -1685,6 +1685,10 @@ unless ($disabled{asm}) {
>        }
>    }
>    
> diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> index b4b78c97fc..e800b782ad 100644
> --- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
> +++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> @@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>    1 file changed, 4 insertions(+), 4 deletions(-)
>   
>   diff --git a/Configure b/Configure
> -index 2a5e58805c3b..0e8c1ce5cc74 100755
> +index ac3206e..764ef89 100755
>   --- a/Configure
>   +++ b/Configure
> -@@ -1466,10 +1466,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
> +@@ -1509,10 +1509,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
>            unless file_name_is_absolute($config{prefix});
>    }
>    
> @@ -29,7 +29,7 @@ index 2a5e58805c3b..0e8c1ce5cc74 100755
>    # Allow overriding the build file name
>    $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
>    
> -@@ -1764,6 +1760,10 @@ if ($strict_warnings)
> +@@ -1807,6 +1803,10 @@ if ($strict_warnings)
>                    }
>            }
>    
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index ea288054e9..9f8b23005a 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.4.4/openssl-3.4.4.tar.gz.sha256
> -sha256  7bdf55ac20f2779e99e5eca306f824fad2b37dee5a06cc35ed5a8b85a6060010  openssl-3.4.4.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.0/openssl-3.5.0.tar.gz.sha256
> +sha256  344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0  openssl-3.5.0.tar.gz
>   
>   # License files
>   sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 8e3ae4cc21..5e785e1bf0 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOPENSSL_VERSION = 3.4.4
> +LIBOPENSSL_VERSION = 3.5.0
>   LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>   LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>   LIBOPENSSL_LICENSE = Apache-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
