Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB41CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 15:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4039980756;
	Mon, 28 Sep 2026 15:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loUCz1WpFnEF; Mon, 28 Sep 2026 15:02:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 495D68078C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790607735;
	b=X1ogfdW+4zPmn5+s2bkOlHk+RtKIZZRiKIuOd+g9FYlwwCLt9PqnQWdvwFfN04WD65Pg
	 o4MwxqmBjUYmV/KvSC+aSspMhjcv5/My/Z3OXq/8+Hvw7lYyKwfZfbCS0Rv59uC8wACyx
	 6gFs0Q27xxZJQVb3scfEqK8Gwz2cUwNKQjDBNF8YC4Uvt15WILCm6R74z0eOBDvn6lIwZ
	 IZCKj36SmyN56m0Z4qBWYctH5ORLdLzmvpjshHdX1pRqM/gYQtJQI5p93trpE++/kND1/
	 RMIRooPxvyZlGO/oeZtlzY6SftLXjLjVHD+gjrZz5RSneYVkIaWwn9Osybx+yEEQ5TA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790607735;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WmJzFskxyAkE8cIMFLLjy7bHNxKcCYVmjCt39YLZz0E=;
	b=nwp9/4HZ/c1VBeKgeo3jlCD4y6EN3ZNIka2RblydWhTR1wZnB+62ONcA+qtbTBJUZiPz
	 P9muL+zpIuDMb1BgY39IqfwuByHa7DnubgNBsmD1oduTdgea9mHKv3aKlIFdTJwSQLDtS
	 rkdONcsU5gQ8qjvyU3MCmoRcJvuyT+FhKpq9sht+8fwQirh2I2B9Q7d+FSS29XH6G0aOD
	 O59Q3Kwe+U0817dsRqV6DBiwmODL9qvCQMMFLWrNtGy0V+EHzyMaUlj0YLQ5xHqOBTFE8
	 8w9/VCSebupsHCe2ex+g7HL8FRNN1KglwLIIl9jUuU52N951mB7uKoZQ0+fLYgNC40g==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790607735;
	bh=WmJzFskxyAkE8cIMFLLjy7bHNxKcCYVmjCt39YLZz0E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=maiWY8x3FWyzU4FvnPNKuTS3e2IyJ80X4T+z1VxhDSQHXJCP3vMjYDRuhp2TbK1pX
	 8kEK7eJux2w8k4z4BPmF8P2uSR9FEia+ByKjpcAbWMwuZVDd5sZKqgKKBVasx11z/i
	 183DmsirjsrgwsTgrVPkmCx6EE7JAI5dD/d5+jywul6nr32o9BY+Kp2ZbttZn0UIiz
	 yvo9y1IQ39W2lvjlju9isEeOUsqpWLTsIbzz8DbKkWW140WoAiVU1Iw041EOR8Dda/
	 z8PrbDdO+JiHJ+XheL6R41v3ZXKqNLY4IVnceYYIvaAs4cHO2IwitXw3cl8QECDhx/
	 yMgcV1z6OWkZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 495D68078C;
	Mon, 28 Sep 2026 15:02:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 942AD24E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A46D606B0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dG3tF1ZySHtm for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 15:02:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 72933606CC
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790607733;
 b=l/rfDG5jwbkLF22z/+BP90gmDQVSJw0C3SDbCB+ou0SN2iTKbEwWTbX2jtPV1zpnrKQm
 Qhu2B0cM+ANf/ULwOoHnkOeQjIUQksljIYE7qSIjaoIZpnuy5x0ZvYgkFOiU02bYaTZZK
 iXqLr9ZoAJFKL5+ogJZqSrS/L9lP5Ag29tXs6mupUVadwrWfnAYjzL4Df3U/2PyYfg+w5
 qzVdVos0rrsyNAy/Gr4Dl8XcFVs/a4dfc1ur6X2Crd5MbR5ZFMmr/wLpFMDT1hQJMaxlY
 3OnnW/uV2nPaTC5uhaY+bMaolUJ8jtoSyr8aWypMspoUvJOTZ+38U+pEBBi3PBD3tPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790607733;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:
 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
 X-MS-Exchange-CrossTenant-UserPrincipalName:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=/MQsAl4sJ+GLdHicFXVY6bV+fPOOGN6vNmEaxoIdYns=;
 b=MsOLlJZBgZsw+XfT0NNgcW89qjNABZyED4j/JrxbEE9nJb/SITUXCRlHnzHZvOHW4uCm
 Sz4V4cyodmc9TlkiKhdbHyr34PlGg7R+17dEdOZ9MZwASHSMF+fOmBpvNfKFM9Qcaz/ks
 tWJulZY88LMJA+lm5rHwxQ7XjBd5EEWSc5uzrDVdmFvU4ZWPk8DSk3YN4dM+IqX/M8A6A
 aMz7fj5op9ByfqTkkJtSAL0ItWLABkxeBw3TIEC9h8B/65NnxyzXuUDJZP4WgGyB8w1Gf
 sIuDGZUuZYXycQahm4lKjSMgCd6FA2EDYXIJ3/ygNdZh6Y+ji2iXjpv5PUr13qNz/1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=espressif.com; 
 dkim=pass header.d=espressifsystems.onmicrosoft.com
 header.i=@espressifsystems.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-espressifsystems-onmicrosoft-com header.b="m6p/KVQV"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c406::3"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c406::3;
 helo=os8pr02cu002.outbound.protection.outlook.com;
 envelope-from=gustavo.nihei@espressif.com; receiver=<UNKNOWN> 
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazlp170120003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72933606CC
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li68XGpX5XiWFExlMKfUQIhkOQ1FM3Z1Nn+kwvXuW8Z0/4P4YBs+o10TdtyPKbUrnjkvSuek8fDSCCLJdJpJqR317B4tZhUwe4FS6v0BzPKkF+RWjs+vkbkpmcSpKE8BiNRe9mqTvkB7CoTx/WL7pjCMhmzdO8CL1XRhhTll0URMOoVoaUftogqf9+Jlll8RhxaH8X4SFPJ6WwI7hcPWwjToWs1OmBqKizM6pRDknSKJsCSqaJzVqk9mc4GCHlY1TR8yr15J7iAOMvrVPVsbjUPlhmbpPMwGBsXqlKmsjPWmWqfe8q7rjqyon7EHyu+jj3eLUvN94DXVCkO1qs/bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MQsAl4sJ+GLdHicFXVY6bV+fPOOGN6vNmEaxoIdYns=;
 b=M7IF8Qj72A3o080NrdPHWC/dY/enTxOyT24n6JHJZHa8YfyIEQFdxQ+5P4C24tiBQzzkQNhT7UBIFjUATEZphjFiTWxKMWsEwWJJ06WM4mEeLkhviz49gWbkFLsipDp/wGdfkZtJl1ns4koP4djnN1iAhiaoaLlcKZvvo1+D1JqZUqrmAVYzlEHTxIzLjluhl76YYZK6hMjxjAfYQoPx4o7fPix1c38N5+mt5R6dM+1/pra0N7AVtHRdhwcKRU0Wuoc1hGx/pt/QElsjcAP/gSK7mg9m4o08Tzcecq3Pge4S6X5hfOcz2tMBKtxh3De/hzWCQ3+bYVjpsE26XfD89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by SETPR04MB9811.apcprd04.prod.outlook.com (2603:1096:101:318::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 15:02:08 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:02:08 +0000
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gustavo Henrique Nihei <gustavo.nihei@espressif.com>,
 Anton Maklakov <anton@espressif.com>
Date: Mon, 28 Sep 2026 12:01:49 -0300
Message-ID: <20260928150149.963781-1-gustavo.nihei@espressif.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: CP5P284CA0275.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:2f3::29) To PUZPR04MB5419.apcprd04.prod.outlook.com
 (2603:1096:301:bb::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR04MB5419:EE_|SETPR04MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 68810083-7595-417b-18a4-08df1d717724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|10070799003|1800799024|376014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: g1Oxu+nfKCvCbCz78jX5tRcwpy9q1eFnQhUpdr8g9Pvgip/o9s2HN//kpGLAUD3xf7z5ARgCp+OxfKZf1ZyqU3/jBcdHO3Vszc077VlgKZbZq5N68R3FF+r5CD/67lZVSlZuDVfhIdvluNG2NGsF++82PZMn9cp4uy5Vrlhb/3kGhZ/++M9SazGTOeEdxmx5+NggaCN/de0KDEb8Vzfn1bSUFlPgom6Uelnp22ELPZ5Mwajf5Lf/vmw9ikScvERv8uxkxO0EpiY4qaiwj0BiGn32QnynEBr262o6kN6K218t8m1FNzGJGVHh/8iJPQtjhaPP5FvUoMZ60cXN6zAhasZnS2yHWjgtudndwAUIytphXcvt0BQ6NPlmaPeLCb/PvOyZ9nXskfwIiMRhAy+4AxYl/IGIfKcmbb1xkrNitZfPVoHnP5kE8SpuV8c6dFgFU0MtDmbdxw902TJB2D7sGDEX0eN5FSwht2IRWL1d3dvnAn33J3HtjfJsILfF9eVZArFV//vEr7PiCX90yWJnLgDOAlFjRYUcCfkj3ANYT4E6/wQjNvdPcGOWKbmc/mJCtFi4OCzuHnSblQZNfflbLe011YlSOE+csFeMa1nm0U+OL24SQS8QbKqU++CgRnb3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR04MB5419.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(56012099006)(10067099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96YMmUJ9Q9mv5+0TfWcshJGOTE/ucN4OLlzfoZBlBXJBRfSuGjBB2NTy8geI?=
 =?us-ascii?Q?sUe58zL8TuRrQbJzFKVYojVAthIr8tU1YZC/4FSIYDhGYX8swH3wPk7F7V0z?=
 =?us-ascii?Q?EXDKY44AfPNE9OC287eAx0iMhKTaLseRaFAG1tOWVfPGCW0+6TZ3He6qSWFP?=
 =?us-ascii?Q?TF4kn13CPofCs4Y2t/lHL+Dk+0tkV1UaSCslz3bxmq/i5R5Ch7SaZndOKr9c?=
 =?us-ascii?Q?r89OMWrqmK9BOb/M7XbVBGzzygfiaTRNhXmZZ3tqgjw+dwCdVtv+2FwclaIZ?=
 =?us-ascii?Q?lUhfVvCNzaM1O038EIBkEIEnQJHqcqO58bpIM3Y0CalHQBZ/A4mAXHE0+1fW?=
 =?us-ascii?Q?YvrORmzykfXrmL45IKVwePAvOmy7XL6h9wjh3qBzFA7cElHqpqRN1OKTtBRq?=
 =?us-ascii?Q?NSkmrn9DTDYjRs8ef6mG7yMah7bEKmlE6d8o32s434Uf58FLy5mNo+cDzAm1?=
 =?us-ascii?Q?ZbscsJs3tvao2tvkiW5a0o0G7Lxg3wd/KKdLfgEieiKy9ds2swPkW4s1d3dA?=
 =?us-ascii?Q?R2vgfKzfSIg0oZD82XGTW6Gzjvz/TcdmNheIMhOJH1wpL9l3JrHSs3o4hus9?=
 =?us-ascii?Q?weDhynGbVzTv99W9OXy999JSH07QZs1exSq6nChrr9egCyMytJ8EfTgXQ3QO?=
 =?us-ascii?Q?q0BXe30WN9ks9wNASoBZKl8Zoanl7nvjmngbvALmyErjk5v03aoSe12O5QeM?=
 =?us-ascii?Q?pWLERZUuO+fdQXwRC2B2YMHkgcOypkrfoYnd3BRGCAiAfvuPmwKiuYXkdbwr?=
 =?us-ascii?Q?RALKMpMX/dy4wT0AOhmgbTwZgmlDa5QmqCbpsvHPl+g906bjll+jj1aE773l?=
 =?us-ascii?Q?+hGwwJilo0qnmE7Kivz8LZWhK38NNlhTHsdmyfw2usrnTOc/HXcFZwuc3nGR?=
 =?us-ascii?Q?iLapmqGf/OkJ8OZcRww8ZxfWKrX4omizET53k4PpGCxIqvJ0Xala4OED9dw5?=
 =?us-ascii?Q?kPnLDnqQIrqCTn5KcCN5Q8rSZsWQFI/BG5JYsVR9EE7Q0PBNdOPx1kGKlFbe?=
 =?us-ascii?Q?bzCu4Cr+EjK9wbGL+KiM5FnmNJdBBWz/0rkyYlj+hLcXxMeHhgDE8kbsfwbO?=
 =?us-ascii?Q?QqCtzbsbuqn+UZ0QBrMtlARlLwdQvfl3RaaDBSwZ7G+mZSarD/l2aUTArxkg?=
 =?us-ascii?Q?Was9XFVZ4sNyl2GX1amSBWt1KfLs0/yY+C6iR3lEtK9dxSMTrNynUaF5nMfS?=
 =?us-ascii?Q?hCHZrMJvBhglJQjykuuDu/2xmKHxLvJI7BdgxhGmEo4NBs6LC2EYhBEWZiyj?=
 =?us-ascii?Q?h/0zpOBHx9dSS35UhIN5WoxV6OJ7pv+D024FXNum798R5supmwseS3CjXHrM?=
 =?us-ascii?Q?/jfR7Z70llRfB8SMEnPt8vaxmhf9+aXSaXJj6N/DXFvUIpC/T3CrPJyg89C+?=
 =?us-ascii?Q?mvYHAm9QFORuUmqksJHCRc0LXy0heO0uZeXGN/cXqA6zOHzfqcgU56TufThc?=
 =?us-ascii?Q?iMMc6bg0dy2s+F26Ffpxmfiuue6GBOnGrfCWelPtl+yb0K5TOlt/Dvyg51Ub?=
 =?us-ascii?Q?oSWV7BmNhBdS9w9eAodRe3olwPSteKfzxc1SzA7lelhDnIFRgqKX8O0AbFBN?=
 =?us-ascii?Q?hJUNbnq3X2l1PkXHjcvs6wfxvtOu+U2G1IuewbW6JzrdHr4GC4Io3uTIjxP4?=
 =?us-ascii?Q?TcphbSFZYpJpMIDbdzIZpuEspfSg31eLlbbTrMaf5hyme6IiCSaWqNN8mTsI?=
 =?us-ascii?Q?xpPh7ZkCcZggGI2aMejV6vZY0BIaSEPqg48bP/uFxbGtAhN/j9VVUQu/SYV3?=
 =?us-ascii?Q?YMNSwzU6GdfFbsmRdjsehBP+9rfIeo823ognjhTixmzrPrz5zU4JglCe12OA?=
X-MS-Exchange-AntiSpam-MessageData-1: op+CSkC1yHd258Wutzk018iI8xF26Ed5rvU=
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68810083-7595-417b-18a4-08df1d717724
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 15:02:08.4153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEBXEgCd0lefIqHvsGnlVxx0zqVW7vueYR3KGq+ecQnpaDrmM6xIziYoXzNrliUCplkDvU29oHvJRoTcRDHG2hv2Ie58362jD7uS3J6ekd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SETPR04MB9811
Subject: [Buildroot] [PATCH] toolchain/helpers.mk: copy only the multilib
 variant's dynamic loader
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
From: Gustavo Henrique Nihei via buildroot <buildroot@buildroot.org>
Reply-To: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A multilib sysroot ships one dynamic loader per ABI under lib/.
92207bc03f ("toolchain: handle toolchains with multiple ld*.so.*
files") replaced a flat "cp -a" with a recursive find and a plain
cp, so each loader symlink is followed. Each loader lands in the
rootfs as a full libc of another ABI.

On a musl toolchain with rv32 ilp32, ilp32f and rv64 variants, that
target directory is 17 MiB and contains three libc copies. Selecting
only the matching loader name still leaves the loader as a second
copy of libc, 15 MiB. The default rv64 variant fails earlier:
copy_toolchain_lib_root stops on the dangling loaders of the variants
that were not copied.

Restore the flat search. Install only the selected variant's loader
as a relative symlink, resolving an absolute target inside the
sysroot. musl's own install creates one, pointing the loader at
/usr/lib/.../libc.so. A loader that is a regular file in lib/ is
copied as is: glibc installs it there even when the libraries live
in another directory, such as lib64/<abi>. After the sysroot copy,
drop loader symlinks in staging/lib that no longer resolve. That
covers the case where lib/ is itself the selected variant. The same
ilp32 target is then 14 MiB, with one loader symlink and one libc.
The rv64 variant installs.

Reported-by: Anton Maklakov <anton@espressif.com>
Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>

---
Link: https://lists.buildroot.org/pipermail/buildroot/2018-June/589607.html
Backport to: 2025.02.x
---
 toolchain/helpers.mk | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 21c710d0fb..37faa8e9ca 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -126,6 +126,28 @@ copy_toolchain_sysroot = \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
+	mkdir -p $(STAGING_DIR)/lib ; \
+	SYSROOT_CANON=`readlink -f $${ARCH_SYSROOT_DIR}` ; \
+	for LD_SO in $$(find $${ARCH_SYSROOT_DIR}/lib -maxdepth 1 -name 'ld*.so.*'); do \
+		DEST=$(STAGING_DIR)/lib/`basename $${LD_SO}` ; \
+		if [ ! -L $${LD_SO} ]; then \
+			echo "Copying dynamic loader $${LD_SO} to $${DEST}" ; \
+			cp $${LD_SO} $${DEST} ; \
+			continue ; \
+		fi ; \
+		LINKTARGET=`readlink $${LD_SO}` ; \
+		case "$${LINKTARGET}" in \
+		/*) LINKTARGET=$${SYSROOT_CANON}$${LINKTARGET} ;; \
+		*) LINKTARGET=`dirname $${LD_SO}`/$${LINKTARGET} ;; \
+		esac ; \
+		LINKTARGET=`readlink -m $${LINKTARGET}` ; \
+		case "$${LINKTARGET}" in \
+		$${SYSROOT_CANON}/$${ARCH_LIB_DIR}/*|$${SYSROOT_CANON}/usr/$${ARCH_LIB_DIR}/*) \
+			LINKTARGET=../$${LINKTARGET$(SHARP_SIGN)$${SYSROOT_CANON}/} ; \
+			echo "Symlinking $${DEST} -> $${LINKTARGET}" ; \
+			ln -sfn $${LINKTARGET} $${DEST} ;; \
+		esac ; \
+	done ; \
 	for link in $$(find $(STAGING_DIR) -type l); do \
 		target=$$(readlink $${link}) ; \
 		if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
@@ -144,8 +166,8 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-	if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]]; then \
-		find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -0 -I % cp % $(STAGING_DIR)/lib/; \
+	if [ -d $(STAGING_DIR)/lib ]; then \
+		find $(STAGING_DIR)/lib -name 'ld*.so.*' -xtype l -delete ; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
