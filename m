Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CAACC6B34
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 12:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 739874088B;
	Thu, 15 Oct 2026 12:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AwG0xT7GKmBb; Thu, 15 Oct 2026 12:48:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5A63C40885
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792068520;
	b=itkC+jAuz6BnJoa1dTRjfO6Jnxg2u6Z34mOu4MKW+M1zwRjDHpJZSvo//6kncR0hZE3a
	 Jhv65/P5o9e0DcbtfwdsNVdxNnEfdWfPjzu+C6Hf3ieTxKkFMx6BAuhKxgogP/aiQUlrx
	 6RCrJaKyGcu9xYoZncJGXYc6vPwMWAlRefL4cyGH8vArLR3jgW8cmkczhGSYDKSw3gS3c
	 gT8MM4lBCp9gT83MKCyj/MUTVE6OG+HcJC5P7Sz5j0CAKTsIRJ+hJjkLdnn0HBFFe8C3o
	 4kvjBUFw4rmGRD/65R3+IUHIC7LpSsOq1xtSzYunAI5st50ow5YLwwQoiuMVx4z5p8g==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792068520;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4il8OHjBe6IgZi8rdkn1aTnDbaLuhK1nz9Bjy2k5bno=;
	b=X6KVQ1vqqiMG3KeTXg7jb7a+raGnieGh/E49GMs+Kpk/zwqbkSXI742mISMvqXZiLGIL
	 qmOHF7le6lTG1L93PtSHRXyQ6UpaDNHI/0mwpzuMFbj9ANqP6XAmC6B36klFxacf/MIbb
	 Nr1MxDbb7WNEYd1OHE/h6qqRzlznCBb1yCWFNeJVR8/16FEv2mrXMrsGESkoo7HB2At2Y
	 XqyMeCrPQzoKBjMXAcUKQB+tmo0l1+6h354qiPmCuSyvYQThKrGUMiYvZ3+V42MuQZeje
	 XBQn5RZSHfAML7PxIWi+4X2FZOyJsGEKmmdkK7qwi6M4gDpRKIDbKk4YqJbew/GW29Q==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792068520;
	bh=4il8OHjBe6IgZi8rdkn1aTnDbaLuhK1nz9Bjy2k5bno=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bgFe/rrKL0+wYXQjn3S19cbNePwP373IoVylunecXikxx0rogMlnHFGlTAmQGEGlp
	 m9jUzxbCC/5aBh+JaHEdoDRikgdMx01N7gv1lR6bqCMMbRc2UZjLwVmy3MuIU+TFxk
	 IBQhuqd9iWyZpCf+K9Xo2IH+O1FrANDWLLbKNmVtWxSVZf12o0PZqJ5pDMlItzssq7
	 z/u1fR+sMuZqG3k/7d7v1I2iMBQj+lLLD9JLECIL+lXxtdpCcCww+AD8LOM/jvl/dL
	 0TuKRSICjAEaB5e2ygjHMgDhd2btQvnDIn4Dgdh3+bHFqstfc+E3FRWv9fd9RsdinO
	 KZtrMmrUKxztQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A63C40885;
	Thu, 15 Oct 2026 12:48:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE02A58
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D8DF403ED
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGo0Yj3tnlJI for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 12:48:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9C67E403F2
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::60b"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792068518;
 b=RvxqU6UDNwKmRNE/UO6OwsQ8l4voemp/4W16SDBgytl1HQQ1VHC+pX6UxQw7XZmuYkIV
 U+l5TZswsZ5YuK2ubzWy2fdr6i75O8AmUhaNXApFgtJHClvaQ66rHqfAEJvFRfNVSrKbB
 ErCKVJdCmFI1JH+wksXyQuZRro4osoD4rQN09z68Ft5FoQOsOnXlfqmvdsd3on2HgOZKG
 j+0vp5Q7DYEjqcozXFJkLBKdJySu5vNZCmQrmn2QkTAH4gw16ZjUUV3DweEe9yiJv1OSC
 EwwlhXqjbQ5Vs50+arz3LZ9DoBVD+BgQlYzGWMw8ztZE/0WM4cFUFG5TrBBQM9VvO6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792068518;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:
 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=xSuEv2c98CYjYn5X8wsgpkUqNjJL6/uGFWn5UoI2jEs=;
 b=Rd0k9+Uc3BU3wrcqDAzIe+7lel7kjKWm4RQyiTWZJZ27yfbJfiJ4a63VmQXB1qmofNDf
 1u5yz5fMWoAY3idgkcXfcoz6RE2Y6ix7naOkZHawDYIAm6NqfZIuHF9Vg1jAF0jqDj6QT
 XkuBXk9s/ZNb64tiiFJCBTh9PUu6s9B4OdV5dofRLicp7jWKe+mdHxjzuFrI1yijOLlBF
 z9lKjSQYWyxq+bC4C+lh/N9AyJKGFlgGChZ+4rFO/hbucY+dYlfJd66xaa/OoJAXVBxE2
 2/CfrRNu/P/H8G5QI7BmoGJAZ09Bmtox/LaEMRe5MNt7db3qjvr3f/5UwBOVa/z1oXQ==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=MS3gV97o; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:d::60b"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::60b;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=MS3gV97o
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on060b.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::60b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C67E403F2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=ZyPyjraucUtv10pZL8/mufWdAzltOJkRzA5bg3zj7bNZBL5CFqOy28SnZ/xSInbOQV6seq13FbrlZ8FI+Tw8lFo99L27wmWfSCl9SGPRlX9KVpMe5XbhRGUmIf7dgnuLMwWM1hwq0xFvfGwNoBP3wVjr2xvPZhDzM/AmBzSiYabG3waVEi6pZ3S1A3qBi/BrqlZKB7S/w3LLLRkPwxEZ7GCXlQWR3LsppUFqhOcLGzNtaq8mWWwmMLS9V9aDh2/5W1YA3PA1xb5wVzk+bRXDsAgNbW4FLuVW4gcZINsmQqJJM4WtFDdcytj8589NRY+KGqjjDKT3f1vGXoytRPEO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSuEv2c98CYjYn5X8wsgpkUqNjJL6/uGFWn5UoI2jEs=;
 b=aoRaCGJXlR45MHOKA6ydxZag8xH1LjJdC8/5CLEhl0DEgwhaIsDG7GT63bhhlxwAXk4Y4czojTkLXeX8AbrAxUSHpGufpbA/pxX3ASoidz4nNqvPaQH46NqV/DZQyQnfCyB3qohTebr/1/0JuRyHetjicpVM1zf3++V1Yuo0qrHBqMeFNP9+YqzdOXVhtJKX1B0lMDNspFVOzKlvhwbaMyQF9/P/lZwO6AjlqKzVM/2SUsDLBSLzKkpbAa0NhHq38LYREiVu0lACaLSb1r0q76jZmAKXxs27mck/i2K4kvffQRYs0BnV5zBvytonxCA2NsJPfduz/NSsVyPZznBOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSuEv2c98CYjYn5X8wsgpkUqNjJL6/uGFWn5UoI2jEs=;
 b=MS3gV97o/meynpNNjEsVJigcsgmSZGSfpnmnz7or3u2nzSFUknkDZ0Hz0D1/qiGVf+xEzRGgpA5JrCwLQBgiet7AbRh8B86qwxLl+F5l/ntCr6R7SzUmPGdMVuJcizq1U6gVrdN/gXRR31wOb7cZVfTP68pcFHygA13nVhsrCxo/26gCHb3HERwDEKep5nreMuRZQHoQroTrL/ls2kSIVUIow/RCnz78fH/Pcnl1AI3qO/QF1q07qJ6/MMDPpBhfopwUlPM8X3w3acEl8VZBz2r/R7A5qCNwoej30dYBTuOzKHZWkcbCIAi75r+fYmSJASSkrQsh8NUPq2nHgkDuhg==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA1P110MB2489.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 12:48:30 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 12:48:30 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bernd Kuhls <bernd@kuhls.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: James Hilliard <james.hilliard1@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] - [Buildroot] [PATCH v9 51/52] package/python3: bump
 version to 3.15.0
Thread-Index: AQHdWYIJqCwbVSRnmUaMS1QMp2KwaLb+k2dQ
Date: Thu, 15 Oct 2026 12:48:29 +0000
Message-ID: <PH1P110MB16036DE3F68EB57004EBD07B9F9CA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261011130058.3443432-1-bernd@kuhls.net>
 <20261011130058.3443432-52-bernd@kuhls.net>
In-Reply-To: <20261011130058.3443432-52-bernd@kuhls.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA1P110MB2489:EE_
x-ms-office365-filtering-correlation-id: b2607018-ae66-4e95-5312-08df2aba9d2a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|366016|1800799024|23010399003|38070700021|56012099006|4143699003|261009223027099003|10067099003|55112099003|18002099003|22082099003;
x-microsoft-antispam-message-info: rJIofNlI5nT884CnHXyC899LG+bwJfExpNKWcGkg1gdNmuuYvtkaT4iHffz7OyW4wQKX/YNvt3w3DuCbtyrsUBTzU3ZSVCT0i0+x8rpq1pOuF43dLfXrqVNp+zRbbZNTZkYumK0eyIWF47IyVBkbn0rP9rGcrW9/IGB56eJMpoYm0tetcOphM5h4K1lIcuKB+a2ycRilp6wozkpkukpWdweeLEkfr00r76OQ2o4DPxKJ57Sgz+hjX05Ph4YNODGxr58Xzp11FWpoJCQ44g6ZDPqeGKDLdDQJQPH1ELNcnZXXmrWxaLgYyTE3hll55lXQiSnGID/IdeT/dtvdaIMVOq37R34cE2D7RYwzezm/loCmpH2752jl19ArnTIvWiTb1ewIpi7P4IKA8EGZ5IjyLuK60/uAg047U0kGXdlLiMwCQ2bpjOeFu0MQAS/66jLrch2n2r8e2uYrLLH/AEq1xc1wJM1Z5PPvCc+3hVGaO+FZ9LTAja81PfMLHR5tv2pI/0PQ1lfDgTisU2t8GCe6s08sKpG0/SBip0WQpfM1hR40ZtG/D6y7ec55wLdOaTC0y44/6eIOi9g8FtknLVpAtF1delk2HCgosJUoRLuaTjYpIDy57rJYkXz9bMgwM9x8AHM+I7Rqr9lRjYlUaRKBAr/RdVleDVsWo0nfMYnabQQmvBEJZOWLiGQO0/IhqGhZepaHZJvrGRkM0xY5Irf+P+gDP1ELEcZMNbvsq9wenyU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(4143699003)(261009223027099003)(10067099003)(55112099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q27l+gxktSbRph/046ruV4YBlIcAy5/J4pCyeStL5uylkwL2NE3eWX4nBZhd?=
 =?us-ascii?Q?CZVORcLB9TmrOmSBrlE/ZvBlRUflb2+Q0lE8djmrksXleW/cjAKzz5Fm7JFH?=
 =?us-ascii?Q?cpP+Y37CC2ElEyegCZHRGGlXCOe2/NqAubxPrdeDsUnmxNvHRE9BeTuZizCa?=
 =?us-ascii?Q?OfBwixjqG3JB4wQiaVtC2g4Tok0ehvoR2LpECOsnKOywlpVhDvvd9lhMFgZi?=
 =?us-ascii?Q?dFFtLlhRRLCNUb4NL4tAXy23StI617ZQGHTTytgPY1o5UD9oTY9gvIARy43n?=
 =?us-ascii?Q?iqjBwi4boxhSHQTiGiyWZhe4SRGPP7clw7+Q30CacXpXikOgPcS1Dhnvr284?=
 =?us-ascii?Q?2/gAncaq/CZGwyPO4ZhxUpVCUTDUx8LRBCDxywWcCSsYH7nZ/US9l9ZAfyLe?=
 =?us-ascii?Q?GGG0jGC+RamnkPmyK0hw3vA2ZqKL6qWqpscqL46dJToGLaejhLuY8CjPrnGY?=
 =?us-ascii?Q?KPsPloVjhs2QuisU79YTwufrDvI+w8r7oxQc3wC1/sfmZNZN8qeOZZtBV4xL?=
 =?us-ascii?Q?bGkWTfBemjhrEJZd/FHOJSD2VhCZ9QxTL5jL1Ik+FQs8ofvmdQXqOi/JVv7V?=
 =?us-ascii?Q?4mV5Q5zGUotz+cZWQ4PsHIIkG+EuCGrcm8nwQ/3Ym/uHVBixy9VqT5jzTq/D?=
 =?us-ascii?Q?RjDW1fUYRrZ+DAzwLpDnzUWFnf/HW1e30ZPM3sQq4T67a3OyJRoHRUw3myXu?=
 =?us-ascii?Q?VRXrvdvHDqg7K3FoYBCXCH/SHFEpRVJWuO+mgn7QMtftxWYXVw6EiZ0UoWVH?=
 =?us-ascii?Q?X2Cv9N0TQ2YjgGWrOxVGp8jY+Ksh2oO19gRH0PbjfjurEDRElAxfvIZtvy3w?=
 =?us-ascii?Q?yINECEFpqiQKyHFFe495IufxxDwnj3AS0ZO5G5kiNGWy/xlovHDFe6E7qgfJ?=
 =?us-ascii?Q?ZPCiabm4chDsOa7XSNkeWp7iWY+APPkEaNdRrWuOX9EA5AicFAqKOyZGfCWe?=
 =?us-ascii?Q?Bje69qpYRjhAf1L3h4tEyhUl578fo+FiJUVjK+vUhIAnGdh6g6uMA0NmwvVU?=
 =?us-ascii?Q?l6uV8wHlFuvPKIBEym3N/Hlnh5pg/8Uwqw1kCml8oNckKE8PzMrbOoY2VRTu?=
 =?us-ascii?Q?RG4vlUv0HB2fqX7//ADjv/VDSfGEQoZChxc+ATKRrFJn660Tt69Isewxt31c?=
 =?us-ascii?Q?TU7Cfib8NIkh6VVAl0BNBtCD1IT53eU3ccSnIfyjUcHG02ent8mtOLCNbw1v?=
 =?us-ascii?Q?qdM/gIDPgJf0njDrUQq9b5060YQ6cJh5S3P6aNYnQjVrXaS/RauAioYo980Z?=
 =?us-ascii?Q?RaAN6+OxDIUeyxXY2dqge6j1Piz/PtZPzd7uOGb7bRp6F49Doc4c/1Gy/Owk?=
 =?us-ascii?Q?6aZoNEM6+Jmn6YoIcrxY4a2oOOsLLAUGjZJw/QYNp0ZwQyruObgVkPeOEGq/?=
 =?us-ascii?Q?TAxIxtIQJBItqXi2nwztvtBOL2XWl4ugwzZ4981TnNL+0hbdqU8WmobEnrmw?=
 =?us-ascii?Q?aF5wnjh39pB7lMA3nodE8+NsqJtk7E8KcNPaTTksOXrSoM9E50ohRNXARhUm?=
 =?us-ascii?Q?bmRrKTK+YckOJF08drdW7XCVkuk9vB9u05ygbwiSt5jTKJemr3wx0wjgUV/z?=
 =?us-ascii?Q?uuQBOxznfq325LfKiDj7Lt+mQLGkzNrwWAiIt1MCOSIh0mPC5ozj2pHv0KYG?=
 =?us-ascii?Q?89Gy/EnZRg+GPK01DtGV16DxcJOVGVga3F+pzu3x+hfT?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b2607018-ae66-4e95-5312-08df2aba9d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 12:48:29.8966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P110MB2489
Subject: Re: [Buildroot] [External] - [PATCH v9 51/52] package/python3: bump
 version to 3.15.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Bernd
> Kuhls
> Sent: Sunday, October 11, 2026 8:01 AM
> To: buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>; Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>
> Subject: [External] - [Buildroot] [PATCH v9 51/52] package/python3: bump
> version to 3.15.0
> 
> https://www.python.org/downloads/release/python-3150/
> 

I'm doing some testing as I have time. I'll keep track as I go along [1]


[1]: https://gitlab.com/buildroot.org/buildroot/-/work_items/193
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
