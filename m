Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA0BF4486E
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 13:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B3F1406D8;
	Fri, 10 Apr 2026 13:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEyhFKfp4S66; Fri, 10 Apr 2026 13:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A41405B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775829007;
	bh=0Dzi7lswWVykMv7IduEydwSc0C9/ZzQGzqL1g92OO8s=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RndV3jtoATQKjrpQFs9hMASRvMWrh/4Nuh0IK/ex+S5XFfwzt/R/d7ogp0yUVaxz0
	 /nvGJasS4MitK43MH2SJC7nA/bh0mRLHIyBJf6+ExWkYep0bHg053LqgVVVa/5SNls
	 fHYHgA0fM7SgNZ8d3ysBYMih7G0D563WkNvySgH9IY9sHtxg7tC4StCWF2WZuoI3vI
	 VLv+X61JcJ0ODIdxrJoF85uYHLDiPX4U8m6Ncl9DkMAFw92K2Tu062OWAz6lGy/REy
	 1LpJ6n6tI2p7O56RYwxHR6aFTUmg+wyMVqzdA9oYf2p18UY9uy3KGhDvctWlb1J6ze
	 To0IVNOgm57fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A41405B7;
	Fri, 10 Apr 2026 13:50:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7AD3194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5589809EE
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MDHlaXw6k3x for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 13:50:05 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::603;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3690808D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3690808D3
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0603.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::603])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3690808D3
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=x4mwtVt5sBmKJJs8KOmNJlgxTFL/84ybVQ1YVwHxGAk+6fAgjeJ5Fye+Q8vGSDwRjDsAtVAQxMhc1wLuGrUgteQdO64q0LsxEpEP9sSMHjIBCYUqMj9w7Lh5azYD3C7NRNprp9OUKO0Jpths+jD3CsJqcmb2EvqRfi745Ka1Gvma+OnIDWVZUOMzkY90ksPkAyM/UroG4MfZwN7HcPckh6NZ6WCxWEQS+Mb3fvtRws8xqcbcgNKE6csTmRmd1BmKEm8twJCGo7WHSJomlABswN20wnlN7t1idK48Op4GcEa+DFurhHfWN33dXQQ08SwhleAkiwEzWpGIySrMANMqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luX0xDzhYuTxP35/EhGfvFpHuJmiDh5Fxx1DYJe0CZ0=;
 b=InfnbKXGOg8eHusrBwNjR/lkQz5ZSPS1mp52sEfLdN8lgbQsC6WCM4rYUILOgP3VIqs61ldu90SzNqNaVBhYE+HiFUt4DqQUO7oSFuJ+/ACOLnGmgJkDmmZ36b5S+f1gvhNh5Q8EaP2pHkMpU3SXLUozL+mSMF0rkCyurdMu2ZwOX7QXKKhm1VyYiZ2YTui8BSYIiseOZskL7LyyDrlPhDbtnm74UjvwJ2Q4A/IgqaOZEY9iwuI2WD/2g20IZrh6oj7947WfDDDUPC1wlIT4IecCgkhSO0rqFbo56rk3rpQQFBKg8zieeIKIzGfShFsbtIaQbOWzuz0ZyoFuJNwPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN0P110MB0998.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 13:49:58 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 13:49:58 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [git commit] package/libgpiod2: bump to version 2.2.3
Thread-Index: AQHcyPDr/HiKj6nnkUa1QKfodhCahQ==
Date: Fri, 10 Apr 2026 13:49:58 +0000
Message-ID: <PH1P110MB1603F003E8115D527FAB219F9F59A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260410132316.CF960810A4@busybox.osuosl.org>
In-Reply-To: <20260410132316.CF960810A4@busybox.osuosl.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN0P110MB0998:EE_
x-ms-office365-filtering-correlation-id: ee672662-1b44-4908-9041-08de97080def
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|41320700013|366016|55112099003|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: ZZnP/zkG8ezw1k5JNPiwSv7ZUIm39MvYUqZyCCTU4masU8JSuZkjWvCGmoBCAgc+CX61q2If07GcUzYGBwTuiGRp+Vv5lOXWixOqXAUOtgqDKgXiuIDsPE14mSVlHBYZdoq/NlvfikDFGS0h8HR+tTaMYO7E8obRhRUnarLLbAoc8jtVFL+Y+hTTJPZDgdPud37sb+szIUm/BkFMSWMYUWZ9F4+YDavANrEhuT1BrDeWBVtvNjy5C6m/R9Yv8JsfBgbf6eK415GeTUbYTioznJk8JBW1sSRXr8dkJaHyOi5I8KXnGrD5gkpndrgzMi2qWAp9jCTFS0D4cMsP6EYu2PV20qciBnVp98FknF1MAZCG9ILGwwOO0kOPuyRyZMuX708Q3AoQ86JspjtCy7VkOJEoGhZD8Q3fMCxTFHb3FikmgFn/+AchrtSONPU3xCOsGoVfQi9cC/TNGFpcFPhzn0LquvfauDi7sckPLaGXP01ssrjqbkWpR8v12rDOiooWJA1mcP6io938V+p88Hi/22ftQWVDbMMg9V6HcLUvD3QyXk1tOodDpVgIESYvw9N+cc6edxzmECrgeW92kaVEtDr2tOr6j+n2NT5YNv6E0jMIvjqgcC6iQJ7wVxMCGJ8PuNkFDHNI59s/WS9lEer6uZ0Tjs5zWdf+whC4bZkPRiHSVqrqErk+tHuhf9MLVb2iWOBcHNmW7NEB35Zn9EPHLWGvOkOmJR4zsDn86njq21w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(41320700013)(366016)(55112099003)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y1a9sW4fOI3TcZPTFkjW5kxs96gh0s8e/5YoOribXeeRPdmZfAmox9gn+NAq?=
 =?us-ascii?Q?l+SoD704zOH+oCE9uXiot27C9Q0oP0SLP6OyxGndNOhie8sZhzjdOgPew25H?=
 =?us-ascii?Q?q5vSllENR0mUYGarUyd9cqnxwMWEIeikTvD5dmqRAZkhv6+mQPCdz/P/Vajj?=
 =?us-ascii?Q?kifvDPBXe/zEmXV4kCnH2sz+hfxnB5PZgHiUHXOsNV/ARtD2yDjO1qAVjyQo?=
 =?us-ascii?Q?/qj0zPEYjPR32HKdNcfyn+ctKJta6jYRvRrzKazZsQjGOcoLiOJoFfMAPJUu?=
 =?us-ascii?Q?8VzaXlkpeNR3B0+Ri/nCHpe13Nvlw7YFl3+brMwyYujtKcrHpz29RjCtV8JE?=
 =?us-ascii?Q?QLubMAB6mLJ0P5HIS8juSZIE4u2PxoCq4MhuYcl4nT5EKAZmakreskuGysP1?=
 =?us-ascii?Q?O25K24SCflxUKELBnB9EHHuFksB07J/rK1oxNrAahi1JWaYxB4ZQJfPJKwLD?=
 =?us-ascii?Q?kCuzugNL4sc+GcSpRCJJwiyBythz+OpsStzwmwP9slouCmId7Tx7rO2UmJ3t?=
 =?us-ascii?Q?3Lyun1rOpDw7gvGRtHuwL0hpGT/alk2ZnLZFvdX6thmzpxi0uRkvmTzMqhaV?=
 =?us-ascii?Q?z/6uHqsFEo0g86KMFhHpabswVhdjCBnAdlXHB4TIHEEG49PHNLID2oFKS3pX?=
 =?us-ascii?Q?43Pk2ap/TvzQjQn9CPAKneKojaiC6WPgY7sZSQbk5xt9USAA23kBSUcQHzNM?=
 =?us-ascii?Q?IoXhe8Y9o7lKCBJKhEzWGqVnefkJmFlJc7XT+NkkUlthxaSTH32igtMlBw5t?=
 =?us-ascii?Q?mpQhzDhBvETnUqAzpolXp0Lb8VqrOYxk3VSi3wnI4sZZLVpGWAM2uIntWmrE?=
 =?us-ascii?Q?ss7ta8mZlTvS5+h7j8msREnuxhhzX07bOMA1KLVKWjeX/X7i9KkmZtt86e74?=
 =?us-ascii?Q?62LR2wugxv+JLhEoeQGJGU+6ehi59NzY9VEhlZHBK9GbkwBiol/f1jQbdfqa?=
 =?us-ascii?Q?Z467kACktt5sJLr1THBfWXG6NSIVLl1ZavJhDcrOhc5/lJHQxsEJcd4v9HGb?=
 =?us-ascii?Q?sbZZ/u8Al6j+HibBXihL9DvcOGqLU4qvTLcc5n53gwyUUVQ0KhRHqrL6MG9s?=
 =?us-ascii?Q?/Ji+54IZMmOPPdon6R02HZSplR9BtqSjEEyib3KGOG8+V+HFqYe/Jgn3cdsG?=
 =?us-ascii?Q?v8Y/WadcvPGDfTjgRwgmf3AoYz/8TUVywJBkkV7vFaTsATmF1UkAz7V/6FZB?=
 =?us-ascii?Q?nwSWu9PjOPD/hpyJxvwBOkIM08THtd+i40Ugl9ZImfANr5tC/o+vrCOWg/yK?=
 =?us-ascii?Q?7GR7NNSDFDbdSPuYOS/qh18Cn2Ylu7OSK3/VoP7zVaPFjER9kx8HYm6vm1AT?=
 =?us-ascii?Q?OiHlNe6B2TfqlSc+9biCsZCBL0/KT8/BWPEc/XQrpo2nIQD3kvLqKpuvx7OP?=
 =?us-ascii?Q?Z4TA2UV3H4m1oI0bhZBuFLPF6lOCmIKQwzKxkEvHLw1qlo3lcYA0MX7GRno2?=
 =?us-ascii?Q?Sh6jfc2zpDbn1AbAk6wOTDFm0oXGHtFWCkFdbitFQK7H92/kwUSFGHL1dJeG?=
 =?us-ascii?Q?Fl3/CVBAd/ek8ixh+O2vzOiHMPeuyIRnT9uErVfW2T9asQswwYzLSvsWsnA4?=
 =?us-ascii?Q?Y8SIbT6vyWT5xpYI3D/836gCDdif5M83giWsvXxLtv7sxl9wtMh8dgvnsW55?=
 =?us-ascii?Q?u0xuipPAh2lE9wV7pPH0a7PkYDwmAytUFeDAwgU7UKEH?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ee672662-1b44-4908-9041-08de97080def
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 13:49:58.2026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB0998
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luX0xDzhYuTxP35/EhGfvFpHuJmiDh5Fxx1DYJe0CZ0=;
 b=naJ8Mae++7yc1fzIlbItyxJxi0vnWMZZ5guIl2XJ1z7tf8nUSTQVBVp0niJElV0rB7FZD+rNmhsla2WGMWhxdZinx6AKA47RPmyAeO3uCr+7sgjSI+js3hCJILFFe1giDcZxwnT7zXLZ2HgeFH8BT0Sl/GjO6Jd8ev1982HbOq/HEMBq2wbrjv9FPX8GAXwO16UFY45SBPpEhrf++YotKGY/vaYfSFNWQDrgg3HdvpkyGQA71j5S+b/cFJmTHJSHidmrxtut/u2hN72a+gzG5LAgwUe2FzcxstQ6azDhFKPgJoGC9zRceVwsrbFPWOF43hF7ITZdxEiVT5ukQHpM1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=naJ8Mae+
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [git commit] package/libgpiod2: bump to version
 2.2.3
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
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Marcus
> Hoffmann via buildroot
> Sent: Friday, April 10, 2026 8:22 AM
> To: buildroot@buildroot.org
> Subject: [Buildroot] [git commit] package/libgpiod2: bump to
> version 2.2.3
> 
> commit: https://gitlab.com/buildroot.org/buildroot/-
> /commit/1afd1a6d4dbef3c78d92fb3f228c9bc5e592d90b
> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> 
> Changelog:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.
> 3
> 

Just an FYI that we (well, Bart) cut 2.2.4 very recently [0] with some security fixes.

There was also a new release of the python bindings (2.4.2) with similar fixes [1] and also should now include a discrete license file [2] to avoid pointing to pyproject.toml

[0]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=v2.2.x&id=08dda33acce9c1358b0cfb57e36bd621a5445fee
[1]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=c3655b5f641b87656c11da3ac708608d2c0e05ee
[2]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=51ee19fe1ec8a94b5ecfdc7627b0c574c7874a1b

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
