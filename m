Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD664E7DEF5
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9487A407C8;
	Mon,  2 Feb 2026 15:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LL4jiwMIOnxQ; Mon,  2 Feb 2026 15:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63AEB40785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770047211;
	bh=YOq5uCQrVoR9TKK8rs3hStcUANwsIxoXF93fJjNLA38=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SDGw0suxIr3ybUDB6TePs92dzYw9jwqwPCsKz4kL6RRg8aSH8uQC+CSu5VMlW8h05
	 7VDfAev7kl8a0w1H49c0ztzA/e4pkdar8tnSQdGJeuHymwCFTLq2763yyYG1Jrxo+U
	 clJLLnd0uPtU/co9jwQSgaJ90+kxAlCWDeOeeCGxd6nvlRlAc6x1k83Nux9EFu622w
	 hQdVN8xk+UFTbH9VqSYUPSUAQoaWLUemEq4W1ahNpqK/+OWQONSsJBjFbjsaEVOSG7
	 lPx4EhLEmZVkUURh8MF5afr7XvFsgSU6dAmK6X3SBQ9cCVJzjb8JcIT+W+pj6bb/bs
	 K+8CrNRHOu+5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63AEB40785;
	Mon,  2 Feb 2026 15:46:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6967023E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59C90600B8
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66KkbLnftknq for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:46:48 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::61e;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3727960071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3727960071
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on061e.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::61e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3727960071
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=DgwR8zUXc1x0EtBg3HksRH20n0YIp3/PVC0ZAza6ZGDLes9RcOEQAnoJzpDdLiTU5YNIjG6oBwsvUFy2/15t7Mg2Fva+K0zuRqSq96Mq1m3NiVh7/NeNDGozQaPY8lA2SZxPsNyp5nn9tY/6sGTjfrucO1VeKb/H0INL4RE+e5U8GQtiziJvuIWbBg8q4Q31n7QuLUytgt/xsyOo+wBNHIBqVUYdNq/OV/WFrxEOzQ/+dogbZh8BE/zBmVFSuycOqOFq0BAg0EPTGiey6iFniOUSUrms1pKJeZcHHa1k83EDeqvf3j2hXadPuUIcG3T5Q1M7BJMhGCvZi8SLYTby9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nYNhXqO4Uq25rtWiF08trUChpJn1cv1FKBMQJZyfvA=;
 b=S5eNQ+PS8VHjCyTpvneBVzcMa9zifE8/n17C/tQNwvCpd5C/kpx8+btNLcbx4oG0h84po5mpaqyAKlQD3jP3TJ6/AKh4fcH5362pdsMN+NDe77EV09MJh0AFBeUe63wN7ex9Ud1cXSRAsMqAvNjOb7TFg5KMWn+oHDEwuIuVyzcFblbdK5n77hDP0TDb8KT3QAtZt+p7jZ2c6mxZNmL6UE4+ERGaVGjPKRgGFKngFFtJvL5ZlQ54xZ3/sw+AaKUjhZV/MA+W87WLJOmumhHYEpwBX4JMRLluO86bAxJL8Q/3dUs0m5IPGXyUVyzp6AI7HydBW7kCL2EKo56YXSfb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB1841.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:46:40 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:46:40 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Julien Olivain <ju.o@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: Sen Hastings <sen@hastings.org>
Thread-Topic: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix
 RuntimeError with python 3.14 asyncio
Thread-Index: AQHclFsfNTJxnoJYjEm2uBRsnlCAAw==
Date: Mon, 2 Feb 2026 15:46:40 +0000
Message-ID: <PH1P110MB160369E7FCC011812C0F2F8B9F9AA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260125122938.260135-1-ju.o@free.fr>
In-Reply-To: <20260125122938.260135-1-ju.o@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB1841:EE_
x-ms-office365-filtering-correlation-id: c6b9c16f-cd90-4c73-815e-08de627241b2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|366016|1800799024|38070700021|15866825006|41080700001;
x-microsoft-antispam-message-info: =?us-ascii?Q?xrG4uOrDSTEWftT9x8ozHs/c2/Va1BwSBJF+xSXQW/EdFwdyP0ijSu5L8Onb?=
 =?us-ascii?Q?9egoLK/hIESFl0anV4xqd7Q4FrRoE7HpEA/yQ9pRzFS4b//in+WLfsERMtVX?=
 =?us-ascii?Q?iGIC5ciU08EBh9ec7eE5gqxh4x9SFRN86Yw80TdJaq+xOQZ6SNCoq/q//Ym1?=
 =?us-ascii?Q?ISlUvZO9N17Oh8oWjXW7fYtfAMZIadWbfQN8AMziS6La2Ojjm2S8icWBF2ci?=
 =?us-ascii?Q?dK1L3qGG0c04HabQPQdvV3QmrS0qAcqGXzBzXweOBgmARXLwYtlMY5SHY51T?=
 =?us-ascii?Q?zmXtPKWFrIG8YpLiLxjpQ0fd43LKoJjX1U1Qjjl+0vIJiQpC3MWSYIqGA7Cu?=
 =?us-ascii?Q?T1QnuI3vdJ9oUUvFPJPO9iAxW71pZXjSx9wKmnaO76MQNm86Et9juGVyWKTS?=
 =?us-ascii?Q?uuiluD8IXAl3elbHxl6n+AVfZsQw/jNVaf/TbafhAVkFcqGxF+Y196HIoE8N?=
 =?us-ascii?Q?AyZ7LHvESihCwglZ7dC6wVYoqVuPRrSCTzBFSuBalVktf29t48PDbFVx5A+D?=
 =?us-ascii?Q?WTVnkaGRKyrDBkNNHcTcdjX7Gr4MbMJqT4ForEDUybi/a7Yv3FleePLUJnsI?=
 =?us-ascii?Q?H6ZUl7BU8A+lbBAMAMU2vZOfE1txpcdB7I3pj19BC4OfZNpFkxc9+UsT3oxe?=
 =?us-ascii?Q?pN2LpC9fHkg6j5ik5Bl91Xg0PgeRFmAkJGnOJqRfCCga+62lloS8AocG3t5f?=
 =?us-ascii?Q?9IvtXJ/tAwlSlxJ5V7WZ+sjf+un4Yw8FWVe3bF5BXrzAg0jiAWWBug8Bl/WD?=
 =?us-ascii?Q?JaU+vu8Dbvf8han7sEmBVOVYv5gCRCyNULTllC/uEDxBUxeINNDKhp1dnRH0?=
 =?us-ascii?Q?742AnIfyq488iyTgGzBGbf4dVDqfafOjk7DE2klG9KJXsY9DZuxu88msbyaz?=
 =?us-ascii?Q?BxwgUq+mYv1SPp7jwltjS2/bO55Kewm7VXI/6DPWzOP/X+YNpwCZ5eR85ClW?=
 =?us-ascii?Q?omLDaKRAWBsezlx7LEi6zqYjwTu2tvLv8lahiNr6GI4hYWsZt1eHs4sb+M19?=
 =?us-ascii?Q?V6ZJ5+xdQdWs303bciJmqx0XZ1MeC+lB6EAusMfKgPcRKMQo3xR4/rCuc3Dc?=
 =?us-ascii?Q?8AlwKrR3ctKE0OehyogpwFAS9hr3E6LgSk9p4ugUwOidPlv40LDrS3K/Qy1P?=
 =?us-ascii?Q?IX68ocT8JGj+oUd070JUpL2I8TFgxlUQ45J6oVNx+NieBkoZFoIFVNs8VKj7?=
 =?us-ascii?Q?ePcwdRMKk3AuAunFqxDtpQD8q6FtXn6Cm/8FQWBiodoOe4VF+OgNAC6KBuIY?=
 =?us-ascii?Q?nQtC7uGANjfGJvuHhwbaiWn2z7/5TbqpeBWMYhbtSK7pCYYzc/8grdP05Gdb?=
 =?us-ascii?Q?fJC1vLZazGgADj53U/r1iY9xwOuAeFftPir6oZEmAbfNQHzhC+xavcyXY0mg?=
 =?us-ascii?Q?A2FGa9QF76cfzVj+tp5N/DScxP9qGzBrMDs3K7jFduhj34EdTqh2ClNNt+BA?=
 =?us-ascii?Q?rDLs8WS1GwcnUq0y69mDlOMYxAS4aEGCVxXerPLbVWzCMQsSSRihxrW6EICp?=
 =?us-ascii?Q?Z0c67i+48L7AMlzWMhIb5HcITYSoo0Rpa4jpkkcgV+r4QPoC0foEmMfKBXDS?=
 =?us-ascii?Q?5mQOnODqpVnnHI6JDajQpoKlmcvqW4mE+0ESlwrPXVY+MRb+WDWhDVYFSSKq?=
 =?us-ascii?Q?nb5S+K4CBvqxL9LZ7E5kdlX1lKTl4CqNyFEmiUSlq/nfK5pGxvx8hh+iLnTz?=
 =?us-ascii?Q?qeuHjt804CMSMsNTdvTbi12aDrs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(366016)(1800799024)(38070700021)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z3hMbQtia9dKtidJgUry2vmDf44daXiHlSRTTAj8rTk9dBtBURqvH6g1aTnZ?=
 =?us-ascii?Q?CESh1gyCTUPF9+qfppR+7tTAC5aGyTgC0RzQn6utn7mUxb74bQxfNHF/GCqH?=
 =?us-ascii?Q?8jwU/Rc9Y5asv3sCsTvO4eRGl5UeygvmVdeFQaXKf58w7tnyTNVvbHb1e0o3?=
 =?us-ascii?Q?dyNSqVzopqx/neB9qFKalyI4W3vh68ccpyCPZ/flxnFpvdxo6L6NW1OEnIKE?=
 =?us-ascii?Q?PwGl3HS7F2sj6GsNEC70uupsA8yoMHpnk0hT7yrpIuNor4lJE0CGPjJt+Uh2?=
 =?us-ascii?Q?wG52+A6EfFgHihjbWxwHKmiuKoebg2rMxqCpvxtV76o273tfnLOX6NJHOSxQ?=
 =?us-ascii?Q?oBoCPtU/8XDDTTyQdaUcv1rrxgphJNHO0G9HqBT8XZGr4g/GrcCslkBMbeW0?=
 =?us-ascii?Q?odiIsMy0R/IR5Z26DYVSeV3Z5iWXuaW2/EoL0x4ifilzFef7tYW0hZ97I9vF?=
 =?us-ascii?Q?BpdlnXxpcLxZMuxS5mzCQfg7GfZFjJLGBQQUaq84G2voQjNXtoOJAbcW/k/R?=
 =?us-ascii?Q?EOCAezvGT4EywSrWO5xGKoaOtdWkC3KEems736LwJsMtvDjuFgnlK7nxxxrB?=
 =?us-ascii?Q?7gS9KidPFE2vPmpUoKSWnqaen+aeywqsmQ+v03pWxC7i8ph68m98BIZ8u1s5?=
 =?us-ascii?Q?CfsB4O4hn0w666oBL6qn6WUkJeGJk/eEcvWeNsVSrK2Z6Fy/3ajOq6iERN6b?=
 =?us-ascii?Q?xXuV5WnG/W93j0Ftv+JeAZz7/oN+480FhgMW/b6A5MAbiun3MCOy4LkrnTXJ?=
 =?us-ascii?Q?euJ9TadoWn2FpKo0bJc/gXlLQMom/aYvGH2cADYX0w/ZWrIE6sK1Su0pgYzS?=
 =?us-ascii?Q?JEFVmKDoFnq4cyl6HfDib9R1d1O+jUH1zeCdcTcE8EWmuaaqRcDFSrOdr4td?=
 =?us-ascii?Q?MPWDi5g6Ia0FyAzJ9QOigsXNNoY5ABUxkHMjcvQhRBogtCuOI7ZOijz342XP?=
 =?us-ascii?Q?6CFTDpDUnUrAC9IH53/W5VdUeFQhPO7Xn4soXfaOwqlpYzeZoHQ6OfD5GKRw?=
 =?us-ascii?Q?jgGE0mzfqR5oegQQUomBUuhnLcpm/khpIr/SrXyPAzPWRxzzFNj+ZA2vCJm5?=
 =?us-ascii?Q?3vxX0MNLQh+Mq1eob6SchCRm5bjnhZAGvKtoGbgAD9IU/7a9H3RG3PTvXBNf?=
 =?us-ascii?Q?Zk0/eGvzgwyCT0Wp9f7pd/ETHa/Ed6+iqcohGBVZL8obU0d8WWktTcSgJKE7?=
 =?us-ascii?Q?m/Pdpmd+y7IUy+AHdtbE26oFskrO5znBMt4uKnZBur8uvhzpjq93kqXPsEzn?=
 =?us-ascii?Q?A5jEdmVl8RXY4vd73HZgG0d2K584LjjWvxopJMDfVKYxE4+qb3W3L+KYfPM9?=
 =?us-ascii?Q?C6vQ27ze3hZE4iLI8cvJY6y2CLg+2bMm0Nv3o1nMisu6hbVVqA+rqMvniZuU?=
 =?us-ascii?Q?+oqxz9pAzfLOa7S+ZXQ0zjGsy1fMzi1IkVgQgRtPdkUKRDVy8VBHor9QPWPU?=
 =?us-ascii?Q?SS1JVXlhKPfsKxKsODPg8nxHNKrBkN6becweOq2VboyAlqjRkIP0svaVFbVt?=
 =?us-ascii?Q?rVBSdNT3GkheAmk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b9c16f-cd90-4c73-815e-08de627241b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 15:46:40.0631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1841
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nYNhXqO4Uq25rtWiF08trUChpJn1cv1FKBMQJZyfvA=;
 b=dYAzUIKAeSS8TrvqlPLBJB+FxmgPmLFKDCR1xoJMz4SZ616s4nZR6XcTPb8HD0YkwYb/FhU+PLc6KdZheb+AGIRUWZCYKVYSL0KcPFlE8qRrsUCjN+9CXYwBfVuQ6eFdg7NbhgzRoq+o1QVs3rELIr5XUkpW8VrMbeuQHAWDEaCAZXhWz5CMkUOt2AhcyAFaZS8OAefa2lqSOjKtLTuio6VfFIQhO63y8VWIIRSWKnBp6ePqspRn+d7fW/9s6TLRrCl/dT28K+dEJcwKf3hC3Nv/wgEZ+8Tln72hJGACFwc9VwYz+ZOu51NuIYYVncZN+9dgIIwL3O7tTzQvHjZnjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=dYAzUIKA
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix
 RuntimeError with python 3.14 asyncio
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



> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Julien
> Olivain via buildroot
> Sent: Sunday, January 25, 2026 6:30 AM
> To: buildroot@buildroot.org
> Cc: Sen Hastings <sen@hastings.org>; Julien Olivain <ju.o@free.fr>
> Subject: [External] - [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix
> RuntimeError with python 3.14 asyncio
> 
> When running "make pkg-stats" on a host with Python 3.14 (e.g.
> Fedora 43 for example), the execution fails with the error:
> 
>     Checking URL status
>     Traceback (most recent call last):
>       File "/buildroot/support/scripts/pkg-stats", line 1387, in <module>
>         __main__()
>         ~~~~~~~~^^
>       File "/buildroot/support/scripts/pkg-stats", line 1368, in __main__
>         loop = asyncio.get_event_loop()
>       File "/usr/lib64/python3.14/asyncio/events.py", line 715, in
> get_event_loop
>         raise RuntimeError('There is no current event loop in thread %r.'
>                            % threading.current_thread().name)
>     RuntimeError: There is no current event loop in thread 'MainThread'.
> 
> This is due to a breaking change introduced in Python 3.14
> asyncio.get_event_loop(). See [1]. Before Python 3.14, this call was
> creating and setting an event loop if there was none. This situation
> is now a runtime error.
> 
> In order to fix this issue with newer Python version, while keeping
> backward compatibility, this commit replaces the code:
> 
>     loop = asyncio.get_event_loop()
> 
> by an explicit event loop creation:
> 
>     loop = asyncio.new_event_loop()
>     asyncio.set_event_loop(loop)
> 
> This commit was tested on a Fedora 43 host with Python-3.14.2, and
> with the Buildroot Docker image plus the python3-aiohttp package
> which is a Debian 12 with Python-3.11.2.

Should we add `python3-aiohttp` to the Dockerfile (in a separate patch)?

> 
> [1] https://docs.python.org/3.14/library/asyncio-
> eventloop.html#asyncio.get_event_loop
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
