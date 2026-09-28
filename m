Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8F2CA5FA5
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 15:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A06C80CB1;
	Mon, 28 Sep 2026 15:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fbc1xjVLuhh4; Mon, 28 Sep 2026 15:17:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1115D80C53
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790608661;
	b=Vh3068XHdSUOGNo8IJ2Y/cnhcScqedGFkBj0HBG9pBJLBwG7arwNzfR7MRXz9m/s7RlU
	 seTI57WJdYq0o7W2RO796NOdshVWft9ykqljGVIaIoBzrS4HKFRRr5ykdbdev4ocgSWTd
	 D2+D6mMRAwoTQrrXllrwPxtgt+fOPMmZggwOP1yJyfJ6ZkBdHRpA0iGrUxlsCbZ6yjnUB
	 udu5Ji9HRS7OkxfMUtUhHaS33dS+2YNq9T4FWEYLHUSXs5Y+4Kw9FvFiX1qLefRKpCUAj
	 Uvsx2C4B+MRSG5ycN6gmme3ItOg8yBM99z6MF7vBbutzBzOtS9XSvxT1w4I2gyw183w==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790608661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-forefront-antispam-report:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n36a8KkJJGyKYZhIgOdjC/wEwD1tXoK1fx4nbkK++B0=;
	b=Fa7+hDydyM1rOvIgBGD39LRbZTa5f0695g2kzGkLNEMOAHDwdPK2+tcMNj9Fs3Eti+TV
	 P9w//DSEhEMhsJGY+QfBC6HQJo3Ot/gyKLfV1Wa+yo41LiegDlaC3GkgXAk+P6FXgBnwJ
	 uG5pXODqSquUkPUlENpth0VoVG2G9zepEeSD2qi3KOINY50DztkS2Et7pZBmHGIfJ5/5Y
	 dAnWc8Xg+gGXjjIZeke9/Ggu/4FjbTN53MWf6AVFH8LQogJWEa8tkKRUSw3BYKCITett0
	 hvnVKH6jzbxwfKG2c1xOzm4j92JBZsVbEpaOoueL9kZx6/2tG60gvjNWVwJTFNlvI1Q==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790608661;
	bh=n36a8KkJJGyKYZhIgOdjC/wEwD1tXoK1fx4nbkK++B0=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/UVfztIrA7GtxdNRLClEABSzKvzPfpZxVVa+aYbeHzr+o/VEarDZ4nQC3MZl3SZS
	 7Fi3O4UYuriRbuvuV1wtmTiNpMMDW7ZHrs9XpbEJzoQd+uVfdd+l4kc1pfHpimWYNb
	 YhbHRdQKPDrB3BRkEKN+Rh5I0b++WaQD1o0jnoiwxEPIlqy8vjZNlaJ5fqrix2QIOX
	 FBFoUrG0mh2ukFqUo03Ttjqq6Nr+Rbh++R2N6cY5ITzJzMrIygy/iVOqNn1xWaJDSS
	 X5flCm0y8WjYupFCn8dAHHMRx3xcCJxrOBBW7+SZ2gkBT9GsQ+0myY8Urs/qquJ6/1
	 mKDkkGxLJEqFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1115D80C53;
	Mon, 28 Sep 2026 15:17:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9098D2B6
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 817DA605EB
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTopGRKh4UMG for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 15:17:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 178E56067C
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:d::61a"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790608658;
 b=VhuQt0H4gXnqSB0llDuamJFoXz8skA8eHjQE3gXsFyABUk4cHlpVLGCgCG+eU23VKQD6
 SiGFwx1KpY+tvrZxSsMS+Q4yTI+eeA6OPEEjfHPDd8I/JE+xQ6jOpoNGcfIhxkk8fDgwP
 8BZjFEmGkcKR5opLoubxeBdlGzydOiO8Mi+a20TMvTiVOWHT0CVDnPXHBUugGRSNMsXLY
 cwGsTomA9oHPIriCjmgFMOu+A8SLokdu+9L8pdI5A0D+BR1v+ZktTiM443bYpnV38B1tI
 PnlZVwHgfs5nN5+PkAofoJY2j09wkcU1aPoVbmuAIHL+zQ7eAwfdefHwwjh8Ep4Yxfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790608658;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:
 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-forefront-antispam-report:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=Fv8O7M5N5B6w0noM2HGCaBgW8vN54lBjRSZYrcpG/Ok=;
 b=hEsUQNGgu6su+mKw8RgJKTvW/sskiFKeffNrNTlrnrxLZOf/TccpmZI3IPx3JLqEo6ki
 /78xofDd4pSdQ1NacZHzV5tFpTg37fZ6CcRJaWPyEpIGOPMzFs0oJbYQKEm8VWrlV2ei3
 oBPTg4TJrggCHWJzvO/Cm+DkLCTY3mERey0oeabkxhtecsBfR/tSXiyMWI2YynWWv3Wyh
 wuwf6hH7gu64rQS7rOW8L8o3Zk8SgkRUxgzEaIZ0ksRqqp5M9kiqAkJCxbqfUSeKd64/1
 QUPg0TGYcz5pcGd7ubH2q33bIT4gL8k3GeIHdJJ1GoXlNL3ppZG4lsOyBD95OaE8CZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=xes-inc.com; 
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=jw4j6sD7; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:d::61a"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::61a;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=jw4j6sD7
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on061a.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::61a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 178E56067C
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 15:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=MPMAhsP6o9uxFZcl4Fd9cDLcCun0GOAGi6Ahlpb+q93YLKCtPNwRySPLBxcSTCYreM6UJrz5L5X8dxNCavmXYq8pJB8MFDkD7KOVstF2Pv9s7tmiUFXnsiXireLDey1q1kGXRKd2/y7Sglki67kD+CSHWIPat9h52YaMUWwoXFAwu+wy+OWuZoy//GBQG287DJe+Mjcb1tTtcP00JBuQQE1LGw8cypzx457lwyxBOwNDuBXYEsIMqaQeMt0poZizjbKyBRxTlysip9mHAXK2mJEOTTH2+4Vu+CZInR1UTSvTEs48eWkS8ahZAQjsgxf8Ja83b5XdFbKtQENs1FE7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fv8O7M5N5B6w0noM2HGCaBgW8vN54lBjRSZYrcpG/Ok=;
 b=NQnnRe7YFUTMszDhL+QiaydGBuumhmiPyWlMuIg8lTg8BqJQyoI9wRBwD2ef+Bwkahn2l0v038VZsgV4J/i7D07tmH4F6GAuyaMqY/GabpZFg1oaD8E3oSgKx3oL4vvR4PfS9liMAMCFzMWtRrH+w9UV1Mdon7RdqtevdO5mF/uyr7FKML/JFU2yfpZlwTy7pm3fC7xQ+V1U4xNPIsGrszBc0fZK3dpZeceUwvVEb4+Yk34kFY9YLggfJsTPu7K2z1hdSlt7H/A9cF6S7PfQc9nOszQYh74vx9YQ4TFgIc61pozAOEmDytQ+wK7Ap9yRzl6m52hmavUExF/5jmD+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv8O7M5N5B6w0noM2HGCaBgW8vN54lBjRSZYrcpG/Ok=;
 b=jw4j6sD7/cex7GRwVPYIbm00W/LasC8Z7eOWaoQ5BGSK+Oa8VEpBVEwoyehK+r+cl/t7RgzmjlF8S4fLXExgvjEhFO50O/rbeKmx9rJ7+i4Q8CLHqMIF/Mie3cTaHwWOfH7OWajPvJNP7bXEL6ecKCqZD9AzedKJJdL3PD+i9ecGlw3xH4+bf9UQIPq8HU7vseP9RwZ/Fy5rmQHvUbbwLzPUZVTbeuPcsGlbyMM0g/A5oB3CRrjGCob9TOLI24nyeQFubs0bIBohz5A63Lwa/lv9oYoGg90z72OeW0QjFXiPuM571GRYmRDBf8Iia7FUYZESYFOBSjX6lWdh6u7gLg==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by SA2P110MB2941.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:63f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 15:17:31 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0451.014; Mon, 28 Sep 2026
 15:17:31 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: John Koch <jkoch@outrider.ai>
CC: "j@j-ernberg.se" <j@j-ernberg.se>, Adam Ford <aford173@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, Zach Vargas <zvargas@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Updating nvidia-driver package
Thread-Index: AQHdT1x7IhOhJ0NA8EWQLcxlpPSBoQ==
Date: Mon, 28 Sep 2026 15:17:31 +0000
Message-ID: <PH1P110MB1603E9C686228F68DBA684C49F8DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260902195708.2168193-1-j@j-ernberg.se>
 <CAMQGCcjXAx56Jtk31ArAZJyPxc=cXU48KyrzObu-p-F19agEpQ@mail.gmail.com>
 <PH1P110MB1603534783B4E17496D192219FB1A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <CAMQGCch9MS-piL46iV09KS=OfTRgWaXUMqHDA0mcWEso2NX6Bw@mail.gmail.com>
In-Reply-To: <CAMQGCch9MS-piL46iV09KS=OfTRgWaXUMqHDA0mcWEso2NX6Bw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|SA2P110MB2941:EE_
x-ms-office365-filtering-correlation-id: 836a8192-1cb1-4119-0901-08df1d739dbb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|23010399003|1800799024|366016|56012099006|4143699003|6133799003|10067099003|22082099003|18002099003|55112099003|38070700021|41080700001|15866825006;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(23010399003)(1800799024)(366016)(56012099006)(4143699003)(6133799003)(10067099003)(22082099003)(18002099003)(55112099003)(38070700021)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 836a8192-1cb1-4119-0901-08df1d739dbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 15:17:31.4102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2P110MB2941
Subject: Re: [Buildroot] Updating nvidia-driver package
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

John

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of John Koch
> via buildroot
> Sent: Friday, September 25, 2026 5:24 PM
> To: Vincent Fazio <vfazio@xes-inc.com>
> Cc: j@j-ernberg.se; Adam Ford <aford173@gmail.com>; Yann E . MORIN
> <yann.morin.1998@free.fr>; Zach Vargas <zvargas@xes-inc.com>;
> buildroot@buildroot.org
> Subject: [External] - Re: [Buildroot] Updating nvidia-driver package
> 
> Vincent,
> 
> 
> I looked through your older post and repo/branch. There was a lot of
> good stuff in the branch. It showed me capabilities the updated package
> was ultimately missing. I spent some time addressing those shortcomings
> and polishing the content. I am hesitant to remove older
> compatibilities, especially if keeping them building properly isn't too
> difficult.
> 

I'm glad the madness I concocted made some amount of sense.

Without seeing the explicit changes, it may make sense to just bump the package and only concern ourselves with "present day".

I talked with Zach (CC'd) about our specific needs and I think it's ok if the update doesn't work for our specific use case as we can use an older version of Buildroot for our purposes

Ultimately, I defer to the maintainers and other users of the driver to express their needs & use cases.

Thanks,
-Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
