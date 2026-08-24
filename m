Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FB4C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D0AC80AF3;
	Mon, 24 Aug 2026 13:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umKAH_vd6Z-b; Mon, 24 Aug 2026 13:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787577212;
	bh=my2CFqPhjICUlHcRwZlOq/m1p+VoIesAILcsOHdB/jE=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pTZTdKXG4DhEptmQzi3Pe9SgJdE2rvihhyfVlwx3wB1wAQMxJpZwPznlDpQFQ5dKz
	 EWeJ0b/9tQrYaliTfxUZEulkOoMut4Y+en6OjozmrKBsGUvDPCnt6WW+kQ/W/PoJla
	 Vx75bMG5SZSqHW2fPQ0BmsC89AGjKYSzkTf9JMCUL3NQCVJ5rMB2VjvYeF8nn/70Tp
	 bnLWGX8p+gb9n0V3aAvLkRTo/VKzxwZ2zliza4VOUcYi4ibqugZydzT+w03usY462K
	 /avZqi2DvVGypyFVQnmW4hO8qNPqwrqWWunVmCiWwCm5BjDT/r48Cw7fOCo8sd9WJE
	 SVfnPuFyjq9SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A915A809AD;
	Mon, 24 Aug 2026 13:13:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40185386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3270B4007B
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17rh2vTAC2Yu for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 13:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c005::5;
 helo=co1pr03cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c005::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C46D40029
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 13:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSf2Ec8mXDHzcbQh+dGBSWpBGUEgA6HD9rKSbYORB+Z34RIFm2U5iRGs8xjFCypwppJYqiCdnvm68QTjJDQOLzoCQ3/ZC//iWbwh7LkRGyRkAGbyb8wY2fF0wSIjiPioMzlD/UQUYxuSVhoYnQ34HcTnvozYIieoPCIdbGNQ764mD7PdrqKQkrRn9cjRDwmCnSV1EMWei9j9SlUzORcfN/8UZEqqSWNeka3SoCGXGuIKnyt30HRwrcyIsTczax0oyHWU3Z49lFPlsxVFRDyyTEmQUxGV+0TS4uyJ25GhBGduZP6gjmBMxwotw7WsAWnzNWwhZhzS2g+ajPmyZmnD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhR+Xz8wePEiTAgWepTen5b9Ms4WuRTrJovKF+8jjNE=;
 b=SIxm8G29P/5QTBoC4sAJLW6gJTM/G5tTHSqM5qDLr3MFVi3zKaMc1rySzBsur9WAtZgLjiemDzEd690qO6sJvMv1fr+WAe8TBDcTi6Aqp+Iqu8TvSMSQErGtd+cNwOAzzLXfzc341EBQYl7uLdWv7s+q8tCcX5Uc+rWGW9BBs0XM1QIy4T0N9r63KjE5O6mSuEY0ZMREwCOSlYYJn6XP0mOSS8myPtTUCB79xdzjJ1ADM6GGttuffh75jxwT3Cva99+iUSfXdN4ZaW8Dh91wWm1mIosntZ0luoN4AizrGyHrp0xZOjLOSEOSbSK4UH29TtZaWK4/efBE0S5NJs5c8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 13:13:21 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 13:13:18 +0000
To: Titouan Christophe <titouan.christophe@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH for 2025.02.x 1/2] package/gcc-bare-metal: decouple from
 gcc package
Thread-Index: AQHdM7ICX3vNvIzJo0qHBLOPgT8yP7atLPLw
Date: Mon, 24 Aug 2026 13:13:18 +0000
Message-ID: <BL1PR12MB5032A91BD2B392902A013ED9F0A02@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260824101844.3181476-1-titouan.christophe@mind.be>
In-Reply-To: <20260824101844.3181476-1-titouan.christophe@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-24T13:12:08.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|LV8PR12MB9155:EE_
x-ms-office365-filtering-correlation-id: 7d44abb9-33dd-4685-b016-08df01e17707
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|38070700021|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: HDxvHineJRnoaTF0PZAnzFX83yYSmFPA957Wt97I5LRYNaUVJDfQ7d6g8u5GLdDycTkqQtVH37ptuBZ4gAykKstJTHvfC6piU2HuA0Nq8D2MwWd8CtM8cOOhyX8eVg8pkB72pvwdkZafjAwBctedxvZlexH85F8M3xdoE2xtDjaDpSYrAj+arxsqrAft9N93OVrMZr6yd8jcsIz6Aif1PXbmCVQDJDvbLVuWeIHayq7ovA4neQCqb7iuKcB9vwu2BPeiVt480hpR6EWyR7cMDZ0RfXHnHkqPANdJ/Cxh+MD+teuF5cqvUHTtFaxb568GU1HHavPLnP7Jxv/ZIoSqM0MCfXzDnf7bG78hIYdhBYTH2eXZ/DIi9PlVmOALTK2YAoIXA7AuDhcV07d2GJGcZ3zussyCDl3xib8msehnHBQeIXGkFnInomiyOdXv7B/bm9MRnh07mszLd1GNocztgX9rHiEHFIcK+3KcKawOURQGw+kSEKIdg8L3uode4zIHE0UUxjrUsI/jKI9aYOl5P/+kDSWCwl9uCLQIsDULykuvT+QxLyv87SaDOV4TeWoFPuMnFG4Gsqu5BBneZTGEXkUCnuJOE4+xeJ9Cjfx7CgNhyPtZ+X8lOduNJtXucSR1wT58T651WIsmchB+0n/vKLt/Bqafkcl+dcMYoYvq7Qy268E4f4EzoE96OVPjF8vP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BaSZYKY7YDwfnBnhwOxC6fiRoZVuiBNzNitjBPYHkmsdx67TeWT13BqHWYap?=
 =?us-ascii?Q?D8+AjIyQm5terZ5GK6o3jBBU0q1WX3lXDurbzopc/w7B8zHWY3nhmcRu8M0T?=
 =?us-ascii?Q?O2o5chFliAuriSLRko5c7FnXSiYIO3OYfWagiYm1HVLEGAhHpUvUQeO69E3I?=
 =?us-ascii?Q?UUY4pV/wnlpgJXPD646V+xqIE/1oC1x796JqctihcyHlZRfiPRpLU9X6faQk?=
 =?us-ascii?Q?Dblbqe11Q59gD8oTmOUaFpoOj+lXS4yFhWbFlHxWrYubWIuS089mzis1zWnT?=
 =?us-ascii?Q?bucShStG0D1NL/e6jP9+9ZI+PM+3jyf4+lLHzVLvSM0PO5yR2AfWSso8k4nR?=
 =?us-ascii?Q?47SOdhBOa0pf0U23dDZHbzfoiV4Zgm0cTLWErGlWC+B9THme00ryh1T7o2ls?=
 =?us-ascii?Q?Atr4Q7gm8HU71Z7au4i1y6/qbSNEfBrsg91CCPznnNZLEXLvd7dy7YEUxDQo?=
 =?us-ascii?Q?E+0JqnadV5azouW9tcTllMtQsKqEyMGDcmPb1IwDFHK09mZ6X4bKCZW6roAA?=
 =?us-ascii?Q?O+oZgS1aJCy5lN+VnZAje0zPJeNcdICdEx7P2T/l2w290aQ+3KXeoINbV10D?=
 =?us-ascii?Q?NEjhq8zLVm5bKgXevJAraqCWqtMKU4/DzHIQhfK0UstPek+H2ygrExmwLqH1?=
 =?us-ascii?Q?XmpJyAEYABqwWkf2pO+eGPEH0JK8XBEXafqVxw/sueb0NsGH9rxx9YhvEm8G?=
 =?us-ascii?Q?AIf6eGA5vTkYeZZNQ8J8a0/+pZXBm6bcnXmnZKjvDPtHEjrQcqWarV+VtTGW?=
 =?us-ascii?Q?MulmczBMl+NsSmdvJ4QUO6+9kpkFiMMUI3PjMN+j/686/4FNcPbIF/tMr2F1?=
 =?us-ascii?Q?bPDHaniBGPvc+tBWbFnnxg7oa9v8hKjuTL1fAF2d2b9Q2ly8I4W84/puvK9A?=
 =?us-ascii?Q?aE/gxZ05HTart1IwCYrBXLel0IjKNXCuT49rOBf2BZtbXjJLkbllPgf6kZQl?=
 =?us-ascii?Q?3hV6pbRuzGvEW84Z4fPij4b4MK1HPMNmkje+uMVtCLHDS8k300IzfafJyYLJ?=
 =?us-ascii?Q?r9cILxwugDRQG9E7K5bGiaX1ADfFKO7MPI7MRWEF0f7CGYVK/uDTm7qQ55yN?=
 =?us-ascii?Q?WMlepBTz9r8fE2Mmf5jI7irmtGHa+p+nPn92fu2r0c03YfO9ox6TAx2Q71/D?=
 =?us-ascii?Q?AOwAN0gvpCD8h5RSIkRxwrTf04AqjvCyAqItjLA6Y/l3Cvjw658NIIn9zHZS?=
 =?us-ascii?Q?D2Vr/tZ3SHo4RidPyoooMxFxEks9+AMC2fdZ6Gr80sQg9SBBii3tFtvqINk4?=
 =?us-ascii?Q?kUi68y2vPRrKdSZ9P7CAjd5K6kOyEU0AGrMQufPqUiUcdjPJ9e3k3Y/pkIxy?=
 =?us-ascii?Q?cl1vBhKB6QpKF5TNyz6lF+iaSuSJimdrasMrcCnsP0HwHWLtSk+mZ/d6/b2I?=
 =?us-ascii?Q?7eJAHKZ44qzs8+IvIl3Hnzc0vBMd1NxdR+a5G2ESe3h2JMfEotJHjy7zbXA1?=
 =?us-ascii?Q?SHEWTmW21B+bcs+4S0b2mHOVwalj2I09ngtFEW0Nf26484IcuBp+CjF6gMuA?=
 =?us-ascii?Q?7BU3BX13/JKOkU3/LLrp1ObKC17hCuGy2fOC3vZ4a3yP73/8cZtkWcdt1IoM?=
 =?us-ascii?Q?cVq3BPkTEr5LbXdtx0qdlKALlVD3TQUhWonADSeGKEbCrPy6kb8FVhzBUlFL?=
 =?us-ascii?Q?mJggYz5vUdtSsia4HamtTRd90dkka5k/imX84ONEn+wd1kcs/LKubNCLk+Ng?=
 =?us-ascii?Q?v2q8neBniLO/AU+/9l0xE/eREpIxVD9RfOShsTFpkV6l3ckg?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d44abb9-33dd-4685-b016-08df01e17707
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 13:13:18.5794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WK5QU+ypo+zeWPPFFOpbcDIqVdUn0yXxDPkfPMawp8m6YfcoSREkLJH7sQo3VD2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155
Subject: Re: [Buildroot] [PATCH for 2025.02.x 1/2] package/gcc-bare-metal:
 decouple from gcc package
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

> Decoupling gcc-bare-metal from gcc allows to bump the version of one or the
> other package without breaking the other one.

> To do this, we replace existing symlinks from gcc-bare-metal to gcc with
> copies of the patches and hashes for GCC 14.3.0 (as they were in tree before
> the bump to 14.4.0) into gcc-bare-metal.

> Fixes: https://autobuild.buildroot.net/results/0dc/0dc8a8c224594ac685f86f9442295c4b6a58d662/build-end.log

> (alternative to commit d40c1725b2010c4daf568dc8e04ffaafd47bcd2f)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
