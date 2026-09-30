Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EF6CA5FC4
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 19:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89AEA811EC;
	Wed, 30 Sep 2026 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZ8EDoyQP8AZ; Wed, 30 Sep 2026 19:53:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 83C89811E3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790798025;
	b=SYyBhkqtwkhtitRtVPkJcDHvA/cqL4i7BP5STW7hCfdavwdUVgahgfJysyUUfakx7DJ6
	 HtmAMOfnzqKcoPc5TbysAUl1g/RFGKw3UQXe/zzhp1dbM04y+k5zgVBGnLS0RA2eivaso
	 PEfT05pxoG+tOUBSkNHG55lyldNCb+775zdjMVsJnjLCs5m3YeqfI0nf2n9/RIhVcbWoe
	 qSTzswvPYsl/krtGB1hPwoXs6NHFsXCTZFMKZi9TD/97tZRVJ5AY2UcTAv+QNpJY84YRE
	 qPcwA7nm7Lt41pyiV8Udor9JpJ5B055JMa3yhPdlnKQBSvms/jAtswE3fN4XwnUZ/EQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790798025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
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
	bh=ZC0zCP7xtvVXINPn9Cq6n2ydJtuUC2mSlrUbhueSkk0=;
	b=Jm29POa9oS68nVfwIo8GHJHA2KNFxnkqa2eOzypy4l7o5ws/y+AYo2AXfx1nPsZcrocF
	 5C82A3TLUjuj44m7XiQdl656B5VQzIjMNJNKxNMShlqQ2vB1nf50t2908EBPtbdv8HrJ4
	 sN7Jna1MeR3OKnlwuXEzmHmDAK7/y4qdzvXhK/yx58HK7u6juhXRuVudwJZ5fj6YdcK4J
	 XdBsxz2V8gmiY7yTPAyeEsStzIRWraysjonyHS67XFA7qa0O7Ap8MYSVZV8+I2E3pLOgB
	 Xw3TZAEHZ5ew3SVaeKr9FoItB1GUBauY8YW0skyzFwf1BEnShjLbws1fANSqSs+xIUg==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790798025;
	bh=ZC0zCP7xtvVXINPn9Cq6n2ydJtuUC2mSlrUbhueSkk0=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hPMVIAjK/VMInrA2rJolXbI+xiJttPqLHCqBXmlddie8AZLkzxYBCr6xeABczfPDv
	 rZAMITwOsMKNDgyR+VsDaFv3SYO0UJO7WQLkSxBqkgMvDBcuFUs3PtSz1Xt44vWPzg
	 8cb0KUQuLadd03HAAFuMvG5CreZdGgBQR4Ad1iFPCx/ikfbkCxRyJGvmt5GDEUNHC5
	 QOgtz4Ck2Wz5Ik7rzhpKvfC2ZqnSaV4cvMjotKDC4/r7QL8i1mkPMmOnQhIOBllgNj
	 NPtbtYwVKbnoewoLqMRqWgZp/V9w9oayV54aeRsvkG8QJBxy2CthDes0ZZXP5Whdy+
	 0FuX9SDJ0rb9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C89811E3;
	Wed, 30 Sep 2026 19:53:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B9934E
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A34CC404B3
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7u7HtYXTGnrj for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 19:53:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E87B8404A8
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::61e"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790798022;
 b=QIQ02lvquDCVHb8//8s1ZMTjMKJCwonaqzjQPEaS7/uwr+II4rZ1hlj/d0VNRlwigNrZ
 uEjnUR4lxmGto/dKnls4/Itn35pbhJOD2kEjJtLmYe8XaJ0tCcAMcexINNXUpUSUZIde7
 YRACf7y1OOlo/vgc0XWyOFumRZTY9sm7mVVeM37pDzHUueHKwMhNn8o2EWNR5NwJ02tuH
 E8sfI1lyEfnYL46N5s2cEbOGdliPIDdicDd9us7LSk39JFBtk52CT8r+LTjLuy4ufdDtg
 dapyUsXk1QutJ7vbJoH2Y1BAhaCerlFVA6EDchFqwEnn/cx6O5mkaKZX6G8KYeGBcqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790798022;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
 bh=4F7toeVdVIvYRYg1w7nqiK1dJBdT/mVuKCItYSky5bc=;
 b=ivsQI4Ry1bLLhjoi2EtXLVk9/xzEvoSakqpvEAZQ9/+s/b9jyRama8znJk5prwn46Gx/
 0TtxIRiidzrlu+iCueA/6k4fkOGjkVQ0PXbsNrOemlTeiPQwfxS8DsqNr2ImD7wxXMen7
 vQA+1RJZ3sPqOc3KnJuo7/XvO7iKvhmc4yD+FWgiZxD2bix6aCQCy+Ul9u9rIWMYizI0E
 8JKsPYgnE6mWLIWGv7Npqx1OjPiz4fMHa9uy9g2ag20JocNLgBwRlPbFA/RQPa5OkZRsa
 3DjTGawWmTLTT4QhF/VoVRlX8SJYfCRwRZ+3rT3pV6nBcQi1XNpxkgafuwHmpbKoz4g==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=xes-inc.com; 
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=PjnZf2Ce; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:c::61e"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::61e;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=PjnZf2Ce
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on061e.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::61e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E87B8404A8
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=VJOn9og2XxHvadQteY4Uq90CdYEiqlmEL/JxBxn9L6in7x9UoKsadyg0KLnJkkdk+2qdjWFA4nTBnckQUOkyobKpMWujpBY1+JJ2Ywsgkz/wB2Pyf8oulSb/FdXf1IqxnobjYCPH3TdP9ME1cuyupZADsCU7LmgvgzZv7xgMJLMJ9JH5sNy7i9ej8Fofqsg4vIS/QDHISn206bOzeWUcwQ7vl/O+E6t/6LnkPdgp2NXaA5BmAp5acye+2l5+7Izt4FWe07IgRzZzGZsEYDZdRabTbsm8sj46gA2DNYdPNImthSbm8v9bVsUoZVNlv2fjm7qifqQdQYF5GlH3xgFBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4F7toeVdVIvYRYg1w7nqiK1dJBdT/mVuKCItYSky5bc=;
 b=PbBzZzZJvgyiuqvJT8nLbhYP2/dnu+LWDroSZlr2brC29nbbQfDm63chV9viVlu8Ont/d0qO/fH9tcWyjNkRVPl/hz19AcXnPzRIUMwaFyRziVUMJke36qF6Oh7/MIN3NdDNZLcmhpp9V7H+e2JNA3DCIyycApNdSmzcoitf/WE3pG1bTL0iqMpMszLe1JkXtpLqwx8QFOeHssbPBdGjEpVAdJhTxO/SW6dZpayNXHgw+tKC8Z7IbOOWhwfaM17vI+PF+K8wIdhwuD9YdipFzT5TlFFr1P+d52oGENee4b7yVbWqHrvhyWnFju/aRiQATwvF03BPhIiJt2y5XiyMPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4F7toeVdVIvYRYg1w7nqiK1dJBdT/mVuKCItYSky5bc=;
 b=PjnZf2CeC07HpRML2gTnJghCQOsKUJJZZy4lEXD7kXPiWZOHg8PxUE8jF7fjaUrYtUYk3xd0CtJ/nWf6VqVR7owy54ewgLbwcqm17bcuNFlZhIPz4CtOb2d6nWdlGBCxnL/Kaonr1+tCAXfJ2F85UgBhJHEVNKniHLuKN80gt5CDhrDmKTFcPrUA0KdagAErYpA1IF1dMUrYnSi5QJCmcZYEHD40jG8K9EXmOIOkbI8ybdNHH7bY6GqpmoDejguR3OVduSZAexqKoj0jgs7nAUq2RlZRJxtD1GaYLW1l7/E/+KZxlxbnbXszffI8Zm47e7gQX6amUKgwddnbaOYQug==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BNAP110MB2142.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 19:53:36 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 19:53:36 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Bernd Kuhls <bernd@kuhls.net>
Thread-Topic: Python 3.15 update
Thread-Index: Ad1RE40+MrYggCTjQgCbDQ0+6nqxgQ==
Date: Wed, 30 Sep 2026 19:53:36 +0000
Message-ID: <PH1P110MB1603290227FF3E6B8C2942A99F8BA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BNAP110MB2142:EE_
x-ms-office365-filtering-correlation-id: 6c03b032-7acb-40d2-54b9-08df1f2c83f2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|41320700013|1800799024|55112099003|18002099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: TXQkdiAxf3lmRi0CWl2g6A1fui95yVeDWrK1qd+Yfm46XUamhMZzJxbVnWQdhJEh1IkTXltDSGrC3tx+sdt7e0f/RDzcDkBr+bqKqNLAvZL/lyVPejd+yfM0+v+uAaLmYy5WJKPMgdkJ0jPffDQq/Ue3OtLCcsSCUFizPmgwS37XO0KkdbIxRG6up5gF/MAWv2dSkO1ItPPPWqklG+LhTQuZSSwOxQwd8gTumegqsOeUunhSrBBZojHcEKAxrLy4efBr4yoM71yhJnQQLOvQiD4VHU0n3LDG3A/6AghoBm7cdoX6aUrKaHBqzdJ0E3PNtpMhVJ5VqxCEDhERCUJhULJjv/jXI0PlMJ0dfqefMK3eDARf4MEC6wq14mdjgMkBU2BldsPTNgyIrOzsoEbEC6Kwb+gqQuzTYXPGVeAlXlupeZ6+Oirkcew0BSZLd3oMY5pkEf0vQ1dtbvkbKtmb65PKgOq12EQkAZIthop2g0jQmdptCCVAeAi36GVSoPbks3fgYtMOPhXu0pTfHZJArgouGs0yN0WFeWb1JPTScVABP20M8Vab10CKHa1jtocBCBNHgB2s3vTjsuEUkN36LCyQ5XuojV496T++6ergciJBdn8gEUI5wxVfZ4yd8t8+ZSYJuu4LBEELXm5kpYH8+kSIJF3/yfrR1YA+gvDSF2ZJFRdzvwXJbHngR5TS5d6ZgWXeh6QOrA08mTBjCV1uA3+k/GrkZyzQ4B7nYvrBIZg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(41320700013)(1800799024)(55112099003)(18002099003)(38070700021)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iFevwwS8L8PDXuNYxxA9WJi9NEAyvp1kpSujOsB4k9aiSdAwBmid1xlTPYoW?=
 =?us-ascii?Q?q26eavB/6pRD8mCApKHKQPcWB7FmWOT7ZS2koIivzD/v8od0L3uYhwbOBK+q?=
 =?us-ascii?Q?ae0vv6c3zH8jfKN4ht76f6/pjsZ/TeIld6OWk3lCfK+db45I7/Qm7bbXACxQ?=
 =?us-ascii?Q?3tP2AN3cq+qQWT7hDOetV7ZdsmRnJxnJhLfEA9rGQlnhQ9yDdkSGElakrsLX?=
 =?us-ascii?Q?2LFsX/qJRIV38ZhxdgQlYOjeE3Xa6arDGNz1o2sljeMZ3Prnsm9pSJp7Qd58?=
 =?us-ascii?Q?kKYRrWRw6BRbbWXxc0QTQpxZNrw0qU9T2AmcJwJKB4sMQug7pOO9uBYG6XOm?=
 =?us-ascii?Q?Q+zJ3xEucM+KP8Jx5fRwIQYp6tqNh7TM3PZ72Scit7KokUfEKaJ5R7ZLj3pf?=
 =?us-ascii?Q?kY43WW+R5BeZKmAd+K3ZDwQS7Yb/ISj0Ze0N34XO+w1gQir/Lf6Pa5uDyqwq?=
 =?us-ascii?Q?kpwTFSSuzgyC1M1WytVu3Si3XLUaOc0F/9JmRHUr7Byz0vJ6tA+kILT3YFHS?=
 =?us-ascii?Q?QPBl+lsAjfRlEVi6H/dJJhR8ghN1mfEx8jl7ZJsUZNns9blsC2sejCueBjh0?=
 =?us-ascii?Q?gpJEE+AVKmngoLf6Xp8j8C/Lghwj71hzDeC5f73YC+fMkeoCwTQnZTItCxXc?=
 =?us-ascii?Q?11C/NJWsnTYt2Zb1tCuDsIHrrxaMoyuFdzSJeTN68AnakMCiJuhQgjro0lrL?=
 =?us-ascii?Q?mswqGLZlDx0mf4WCvhlEuCZMhEP/TwiuG8tPXjESjS55CwVske7XMYSUjZyS?=
 =?us-ascii?Q?MhZM2qcD/ey3H7cbYVX4ERAXDtZrrbLd3muK6XOffhuL3ppM1ITH6Gt+WWab?=
 =?us-ascii?Q?4v/QvJDCDxUHLi4kFz+LxgkyMdCjBBSibZ/eWUSjVCI7dDJA4XipMlLE3cYl?=
 =?us-ascii?Q?UUUGld4Nlyw0p6rBzAuBX/kcO2pwa6DJPXoB4i12MgfjzCzPUCuAaIbNjna2?=
 =?us-ascii?Q?FMVURRWMUW18VkTq+EOuuVBTSN5JfReB1QU8lPWD4UGbuYNRIe0IGAZv41Vy?=
 =?us-ascii?Q?nR+c95pWnCyFUjHAQHHh+KcYZz5K2q57y3U5VnChuBYPry3zE4wWdaCbFWAc?=
 =?us-ascii?Q?7VfY41F6QJz9jTlG+r9enKdCDtl6RpW1fjLxwqnb2PRDB3D4TIOzn1CQnHyV?=
 =?us-ascii?Q?iGjXgYzsDzxjmxlob4pWLtgcagGGoysT/wdvG+uFb6rNN+yGPcCZCAZzZ8O5?=
 =?us-ascii?Q?BW7Baj4ytlkb2eee0aNUJursDxrd5X1FeyHeH8KfbbUI2bCknzmxoCcpmFgd?=
 =?us-ascii?Q?7nHRUwQCiExuVXRaZ4fNjpEM51dNugcdl4p4EitZ/LZERzaN7dfixKzSehuV?=
 =?us-ascii?Q?QSM9t0QYZGqUTVPImnxI/oRAsSaIVBevHWCcrZz8ICsD0NuqWKC2puiegMQp?=
 =?us-ascii?Q?QcunLkrAfqmWOFP4+boTmVVS2LtWLvWf4jM3Xd3LXh29SKi1Yax3BaiHbEhH?=
 =?us-ascii?Q?wVTX8XY/ZOrjF7h/QKMmjpd07oSJ6vu/DhEIXSzEuXz0egav4euEb7Z4n+cc?=
 =?us-ascii?Q?96iaqYbYVekC1yOLhj0AHMw+G0gSSLDz4o9XHK+PrWBYBqvybTOhO/u+nxoV?=
 =?us-ascii?Q?yIcM5BUrETXOhYv6uIxQaHOBnMxp/mVgXFcWZS1FlWKZoVWuDw9L7/Msv4r3?=
 =?us-ascii?Q?i1tA6nBTVizNriscAzI3FsdfJ9cb/yRuxx6VuRxK+U3I?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c03b032-7acb-40d2-54b9-08df1f2c83f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 19:53:36.2510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNAP110MB2142
Subject: [Buildroot] Python 3.15 update
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

As Python 3.15 is scheduled for release tomorrow per the release page [0] I figured I'd ask if anyone is working on the bump already?

Bernd, I know you did this last year.

Typically I try to start earlier than now to test on the release candidates but I'm a bit behind. I also don't want to duplicate work someone is already doing.

If someone is already testing this out, lmk, otherwise I will start tracking this work in Gitlab similar to what I did for 3.13 [1].

-Vincent

[0]: https://peps.python.org/pep-0790/
[1]: https://gitlab.com/buildroot.org/buildroot/-/work_items/95
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
