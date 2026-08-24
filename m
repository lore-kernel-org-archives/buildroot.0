Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951A4C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 13:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C3280AA9;
	Mon, 24 Aug 2026 13:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWUkpfGa8tec; Mon, 24 Aug 2026 13:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787577263;
	bh=uWhryOYCsT+HBMaNHGJMffX4edStlhBBxAZaaLNgQZc=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UK2LjBOs5iruldcvMjO5h39E3m94YxWNELicquDA7ag4A8HORUV3Ift9zTJs58+Tc
	 p78KOQc+7ErHQqBTYcTRpp44lLOZpgpe7dhl2w0cgwJM+cUHd6v/KoP5wzcxfKnjJw
	 3kL4SiT8a4XSMuz0eY/5EW5mFopt5t84JWpP2OLmaYveGBTUuQ3ow05/7sENTjcX+Z
	 x+6Ph6/4Xa6eZSINawKybfqOipxsauTIh5wa0pIOfWCyyD7h6ZClwM4M3ZsIALIBnp
	 QCWZPywYq1OktwPObiu25ENHrnuDJgV3WTduqcf1+QZc+SzrKV5tkNJDCkLjuuycKd
	 dD2ALLKfN2nOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B0FE8095E;
	Mon, 24 Aug 2026 13:14:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F8A8386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31490404E8
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJl787dFkxMW for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 13:14:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c000::1;
 helo=byapr05cu005.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c000::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D9A3403F5
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:14:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRwXKeieJ5pNWEohJkfmaOnAAkGDgyY0a5U04JuD0CRZejv62w9fTZEKCaNsLKvAJvdXUerA/G1hxUhIWcJZ9VgWfvZECnjLEplAt84G7sXs8meYKjdJr67S9WhhcXKSXSllElXgG2n2mHO6CoiRJ4IC/pq6TEDA9cUGb0Zoo+GC9zDAUUfdIcZyvMW9aARj4n+qH60O6tlodQAQ8kNuQhjOzh88mc8U8a3H77eZ9aQs+9QdQpwGp0BgFVUhGR5EOn6NzTxgAbl5uEiRi1P3hN1Q10Kn0V4+MnDEY8m6HiFvX47H09TZ4wjmUUXMpBTbmwir4BFZf+WaBcG6Te2Vhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgEUzULvae22e4EHXnXZZgkhPhw8lnithwUeKVGifGU=;
 b=r9oYR+PVrqiaJ2kmyIKG0DcHCFpiDWJVWM7fmalxrxLcgyYIwK/hXkG8+FUfTOx3SuWdbg7pNohWXi740QlmEAfh0Ht6tU0oPdErfARXsu0iDbMMAPB7CsW+LjAcVvaYksi31AU7o5bvXGY96SLEvXuGUHuhzKCNQs+8h6Ytny5Qb7CE2qm9M57y5zzCHcSPJrCHdCji3Ey402Ve6Q/OWO6MSoCZGHEYj0Y+LbYrPUAwWJF9DXSMIavcYSMbbf2b/N0gldjJUu9ibdafud2tcu8Kd/mGq/DAS3RC6xN290SY8pyqo2kQ/yOvxNih5RzE8nMtFDe5wuHVfuc5TT/B/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 13:14:12 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 13:14:12 +0000
To: Titouan Christophe <titouan.christophe@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH for 2025.02.x 2/2] package/gcc-bare-metal: bump to 14.4.0
Thread-Index: AQHdM7H939eX1puNAEytZnrfrDbfILatLVaQ
Date: Mon, 24 Aug 2026 13:14:12 +0000
Message-ID: <BL1PR12MB5032D0F041E18C3CEB8F9453F0A02@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260824101844.3181476-1-titouan.christophe@mind.be>
 <20260824101844.3181476-2-titouan.christophe@mind.be>
In-Reply-To: <20260824101844.3181476-2-titouan.christophe@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-24T13:13:33.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|DS7PR12MB5984:EE_
x-ms-office365-filtering-correlation-id: 0d380357-6be7-4f38-11e0-08df01e1971a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: G2nUlkhZYZxuZ26SYXroFFSLfMvc7gcVL/EkVSU2dbp9VoaYGuwJvtV2WAwZwRX0mj3SQgfvFPZBDX9VA6uwbWnebEwm5FCsRY9e8EZ+Ll9W10mYkI3Y5a7x0oeB++GE96XhQJGvN7HcmVzuq+Qni8F0O2KKQ3IUjzWTR4DMta1oCVKSECkxDUwSbMS8pGWvPXSwqAOJB8/HTLy83O7u19yYHmH7aem8D0VqfNUQTOlQN1/3vrhaNcceXTG0m8+x4dRrtDm1ShGA3vG77bZ1TY+cLuKpqOwE/r3c80ZC1rzq89Cn2ml+dI4xlKGj0CsV2wIrPLRw4n/V9nBWIbp7x5RczM+52N7hIAtXPqpIBGI0Ujf4FVrmWI+ZcLIuKGt75iOulcBvVKuiB3t/aISmZ85rbbKZeCepap2PE1xEqz0jxdlx9PlG8rwMNhuqbm0/Lqcbm047EzdAG1spCWssD9lhFfC/sVxIcv9rdDhVSwqTElaf7Tm85PahIjVLfeZiALnEvAGt7T0QIWhaT70T+I13aJz28C0irR1vS3T7irUBDKl++gP8MHXhwFKNv/jfYzgBZQe/x5KALbM3HXOZfInlEU7z/AXylNUHrGAR573s02kdDduxM0HjIiFlmXEEhymE5Rt/rG5ApOcIQNR4ddMikl5q2mM2RJzf8egLZbyIjYa7lrgmTUb8Lf1nAFt1PgcZvUsv3AvJpTHuIqtzWl04jYHiWJzyreTzptBspfY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9VfKRMclgRaCn5fhTgC4DGDQTkIICRcSosiXy6Kwr2a3pfQO2gFphwneIBAY?=
 =?us-ascii?Q?9UuyFIzlYkB6CFj1OkAmJ9u2v5uYPMyGAlvvWKRnex86dpAy9Uv4T+k5ZcRp?=
 =?us-ascii?Q?iLpIHn9amNomDdxPwZ3YGWZxPs9I2KZLyHivnqQVxyaeTWJOZcdXCYhGGQb9?=
 =?us-ascii?Q?uM9pHbQ5hnx8Wv6nuZipWQ1sGumCrwU7FklPTorLcnCLvHcV9iX+5ITtKhz8?=
 =?us-ascii?Q?tJ4D0mRbW1p9OvpKZ72TN+ejIIlsRT9yE8B9y7UvsHlL4paseTP+iJRVzq0z?=
 =?us-ascii?Q?OHt9oaDRI5uhlLEaZSZ/3r060Bylma4NMhFD0SM85kbWrGGeRKykffkV6xbb?=
 =?us-ascii?Q?gdQesIn4nk+90M5wRRwr+FGrhm8ZGsPz//1nTMQgn9qigpQCuO9IpaqGQzLl?=
 =?us-ascii?Q?R1IEuxycmtCVnvxPMGb66ZaDcdnEx9P44KpIbtpNj5EFFv6PE13hsRzZ/q7k?=
 =?us-ascii?Q?sHHaVNWtHrHWLXtNWqTckjLRYeza7Zvop66WW/L5LV9YK8iDGJwl//J8FELT?=
 =?us-ascii?Q?DVpbKtNdtUyyQR/xMMvOm+sq22gzxf6kHlvd7MQbNMKH2loPPcMID5T7MHsS?=
 =?us-ascii?Q?650tzzivpyegHXvwnMvkNGulBIQeJCUjCQ8XMeaIxP1Q4s05fXqvk9jDIb7S?=
 =?us-ascii?Q?no7woR/MfgHdwx5cANvDz5JFaS+5+8DVbR7YY1sgT9BZhoEH7Jp2TeDZ1q34?=
 =?us-ascii?Q?HLvr2S+e8hhs6oiwtOVionCh+cSRArfMSm4caP+6vjMTZE6uCngZttDwY/UC?=
 =?us-ascii?Q?Y+mOSXwhRUA0pAyH3RXmjTwE0B3hwWsPWQunVFErzVQmPr6TnYGXDCawBVy9?=
 =?us-ascii?Q?E4H3f0OwJlQZPaVprDx5DscZHaIINk6rmMyGExU1bkhyB2FnSTCWaa3HKslG?=
 =?us-ascii?Q?5fsYTvXCR3vOz+rUgWQus6RlkwG+yUdKcBYgM1vAcz7GW/7sD2LYM7R+y17M?=
 =?us-ascii?Q?Nx004lshbuIATZKjpdEUbTEYf+mWZyikpqxrnOfsBw2PupGPX543MKGQHUMU?=
 =?us-ascii?Q?OCA1sYbhHC6QRuY4WNGfUdfNaJ8PE2wjxvm78IB5DNIqPr6w2T2fcJP5/gKz?=
 =?us-ascii?Q?GiImWBML8qzE2h9ulDi1cgYdrBsBURNFwg6FnzgHmdFBoj2wCd2IHapdgtdg?=
 =?us-ascii?Q?AhIfNbpVi7XtWdVMbG+idcNkFIRLSTYzTREMALMeGLAV8gmPLEA51HdYi2p/?=
 =?us-ascii?Q?4WJC/nm/JfWyjymYFq09Y6SqkJSO0bfRAwdd4HiH7Mv4jsSfXYq9BCVOUrGm?=
 =?us-ascii?Q?Y17ItLSvEqZU9WZiE36KLO5tRp25UtG7FIk6rHPPXbltPy8DFKhOESobTq/H?=
 =?us-ascii?Q?/Nblazo0wIZxdrsJdw7b87cAqUxY/qatPpO6b6MyZki1augrfyoLJNf1bsXh?=
 =?us-ascii?Q?WIRLWIlALc+XopvC/UYlSioGP17DEIDSKWL1CXKnqylGFgWwjI/kPr+7ZR8D?=
 =?us-ascii?Q?KRqV3uiRps+1xnBjJ/berWYbKedrzssAipCEK8uhaVTwz+hjZ4X3QdS7fQGf?=
 =?us-ascii?Q?5t7eXv+BgovGKUdAxI/VdICyQPyhvOdPH7k4WXUbBfi/190tm0KoAwzQHyrG?=
 =?us-ascii?Q?LDxTEF6fJTnz6eUkRoeFE9r2SraJep0np3uKcKrdKVXyvULAxZi3+qsOs+tQ?=
 =?us-ascii?Q?SxxdSuOLNogYOd3oLmvk2wDd+pQuQSZJ3k0YKfaiKLivY2itgndOXp6bK/Zi?=
 =?us-ascii?Q?PmZr4hJAGB+Sz8C8JzU3S94xZhssCHPwh+8ND62tg14iOgjB?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d380357-6be7-4f38-11e0-08df01e1971a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 13:14:12.3911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yi4QuUB4fAL6Rr/kbveKrSwdggUNCf6qBLk4nbx4vSfUfSZrLCnvKlpIGeD9e5Vq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5984
Subject: Re: [Buildroot] [PATCH for 2025.02.x 2/2] package/gcc-bare-metal:
 bump to 14.4.0
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi Titouan,

> See the announcement:
> https://gcc.gnu.org/pipermail/gcc-announce/2026/000192.html

> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
