Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C81E63F3C
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 08:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90DC740B78;
	Mon, 16 Feb 2026 08:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HgKU67ROlMpH; Mon, 16 Feb 2026 08:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1467240B49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771230462;
	bh=FBEGTju6drnovFWPe6nthmc2q/XUZr7QMvrR6l4OBhc=;
	h=To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QSQt3Pc/D0cxt6d4NCCldn7zYiRQthiFdv3jdyQt68/IMKv9WPegSF6oLamAhhF0T
	 EzPMj60hUyH+signYTNCSeTKVbrHhYi4bNdSfmOImOs6rpgyXiMj4OcnPdgL+QCtvu
	 iwMcdgwaqE/p5PP1MsNteRGYzHtLxQF43IETn0mn5vXwvsHgTmkeeEAipdYKvfM4bU
	 phF6H38uYvWlp0MrBeWkyK6onlnZKi60LuwIUl7cgpbaq5hyVyB9wHz4y1faigIPn4
	 IH0/gL9YmGg7umbK1U2cqRxzXu36KkmU8/S96AZ260jzvVtT/VeHQJJCMCz7Xj9gM9
	 ndMdn1/PzmdPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1467240B49;
	Mon, 16 Feb 2026 08:27:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6E891EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 08:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B41D60B13
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 08:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ffJN_tB9UGR for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 08:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:c213::;
 helo=zrap278cu002.outbound.protection.outlook.com;
 envelope-from=martin.bachmann@designwerk.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ACED760B0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACED760B0A
Received: from ZRAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c213::])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ACED760B0A
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 08:27:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4tamOttot9S28Q0HP3KY6fvZPChsqk6tx7RDkhUX2xr1J7y6o3LkP/WcnonM4cg0WLXmcopBjPWHg6rGl9AAo7sof9jLuKra8l+s7sFyqgbUx8YbvR0gtrq74LGK2cTER9VbtFruOBm3hx5Bu4+eJ0bc4Nx3CxoY5MyGWxG3ou+5tFN2b9CHkEVKyFYyYeole1IKONz5Eak/3HBQW2pedol/qHq9+ok/tsPbKUI4VNpzLUBbdu17H1Zltgb6Irz0AEK53CJ1M71vVWI2HD69drT2rU6IrN7NdytK0s4MROFBa/ymmPnRrwRVz6IRpA9mWknBjY/G/DfyCaKDjZWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBeqctwiW+T3y8tzIEFDSP39emedn8e7Qt2PFhI6j2k=;
 b=U40qfILtWNaBlafDO3XZiYf7dIG2eX/z33Tlas6bvYOdTOxbKGRxRXO1eLnmJuh4KO0Fe2qeDLA6wCDFFUmUuVwh6ybJo36Q/AhqC5xj4BBmnqehcZVH8vPefPJf/JTpvWKDrgihQQm5pYZWzvzIgljGpMxyvlvZW3CwuqC4UuTo5rQVyNe/V8/7ZauNJbBXVQRWITDWNy3Lj1PubelAu9WaTs0vneEA1Pglwv0ltSEIt+tWLVGlrYEE6+Gmi2nh2Dj9kMNM9jYgl9pm0zzBOOUQ/U7gQGbsOMtyIkv6AzASvXxVwKtyU4uhmMnbSMC4gYH5d5gYH5AOanqReqQlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designwerk.com; dmarc=pass action=none
 header.from=designwerk.com; dkim=pass header.d=designwerk.com; arc=none
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:42::7) by
 ZRH2PF97B9F1855.CHEP278.PROD.OUTLOOK.COM (2603:10a6:918::21c) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Mon, 16 Feb 2026 08:27:34 +0000
Received: from ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900]) by ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
 ([fe80::5237:f3b3:d6d4:9900%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:27:34 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>
Thread-Topic: [PATCH 1/1] Fixing typo, which prevents automated license parsing
Thread-Index: AdyfHSsrkYRSknosSICZzUAn5apaxw==
Date: Mon, 16 Feb 2026 08:27:34 +0000
Message-ID: <ZR0P278MB0869C77817F0EDA8220929F88B6CA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ActionId=d6f9109a-f2c3-4f0c-9153-3facf0efd1f5;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_ContentBits=0;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Enabled=true;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Method=Standard;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Name=defa4170-0d19-0005-0004-bc88714345d2;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SetDate=2026-02-16T07:53:35Z;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_SiteId=5f12add6-5f96-40e3-ac41-2307f36545c9;
 MSIP_Label_f9ecd03c-45d9-40de-a589-e7172fb3fc87_Tag=10, 3, 0, 1;
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0869:EE_|ZRH2PF97B9F1855:EE_
x-ms-office365-filtering-correlation-id: d1d9df18-2355-4355-5213-08de6d353c39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?8lvt+nvNS1bwt3W5tuPSXZ2ooOtPA2rYnggiNXTo56AUWpMvjOyUrJQdm1cV?=
 =?us-ascii?Q?Ym1IH5Q9Va5JqcfbpiqzyFAuifgDHRbXGwHmsv0+3JpFho2xWXsDcSUlGFCE?=
 =?us-ascii?Q?Lj1v2p8Brslg+fZZLd2+cZ5B4PdA9PpbsAqqb7anQ4K06ASrY0GysaKFLZ7F?=
 =?us-ascii?Q?GcHe/wTtA8/utaeNUDmCr1cPak2ix5Au/SbV+PkqYbAyIWM4fn6HLH5Lkuv5?=
 =?us-ascii?Q?YU10AY2MmrOukKy10dDLF6U2WAagx6aCpmB8kzWMX8TsEbMTV6vWxj7GcOCv?=
 =?us-ascii?Q?J+Kecbp/+hROY1fEAiNYRKc0mqMzp3Ti/FdAO21pyEQS2qqKS3S/WUM5IX5a?=
 =?us-ascii?Q?Vcx4htPYYPSUGS0+Wzft2IRhaFZL7sF2zBy6FH+t0bf0IP+eLmDVYAbymzN9?=
 =?us-ascii?Q?AcNlVVjFYQXElMMtGB4hLs8YNlPb1ezTNPy0oIhcoQSGXxv+pmNWYyvgMKel?=
 =?us-ascii?Q?clXRd6HFoHsJOJEJhDtQRV3M4seZiTeZO9hRSLspedEmjWBS2vBFKdn9uitn?=
 =?us-ascii?Q?nlolljlbn+bApCAV3e3TLlA0WpHppndz7JOeg7peMKGAKROP7I/UUTEnWcEG?=
 =?us-ascii?Q?UC7U33/BU20Iy5T5geqoToYg6raEYBEboygQZkETCrCI4/3VhT+BfGeOGtn0?=
 =?us-ascii?Q?wlFrH9C2NPJ6zvCTv/HpvgNqr82lqEwi/mBxjcpSDw0GwDqSZIJnYWmwvS/x?=
 =?us-ascii?Q?cS3jNojMO/J4sMDFmN9szdGJd9gwPYgHRmnZhMsWXDiUdvSKKoz+QpNdqCbT?=
 =?us-ascii?Q?X2yJx0pZos08bfmsDUROj08l/DaoxPU3WPHrx+fRGZ5yRrzrs5qHU3MZ26AU?=
 =?us-ascii?Q?P5BNNKD+W0K8u9wQeGWBDnVxrYjRmqw+/CKW0Sd6cf7mEwkFQDfEIHOSrmp7?=
 =?us-ascii?Q?RauvBgzGVklPP2v6ffu7oM7ZilSbuaoq9ZbGVdvTtowWhkk3rZHZetl3eS4b?=
 =?us-ascii?Q?YQ4DFa6jBKxTbVesHuO7yn2CS+SipEBCiNCRFmx0sZsTimheUqAIsHRW7SFN?=
 =?us-ascii?Q?3qJNhpzYnkAHtBn5DJVw7pIr3aJqlmQ8FWSOzvm2Id+KJm39A/iDgizvOcMl?=
 =?us-ascii?Q?aZ2UI/vMZXQfSuiHPnUTOqNOwa8AQmTx8gs4U/D1oBA7tbo5jmN8pz/WDulQ?=
 =?us-ascii?Q?fu0ERgRMgn114DMEoznj8RaS/+9ioSJqQIQtGylBE39/aBLjFG4tpgo+TJFC?=
 =?us-ascii?Q?wCQPlZdmhatztWTsX4LOK7dnnnysZZbF8tEiHuIBx9H5DxGTeiXiszwsy36C?=
 =?us-ascii?Q?FgYUt4Eut4VZnOvxhw20TIAaNM4N9kUTkKsMVZjjcoMhycWQOduO+gbMusKr?=
 =?us-ascii?Q?iV7rUQpEBduJYGaxZk4SklZKtpwSFsTgSG9rZR3g7AgqHzhtsU5sbQmNyJvq?=
 =?us-ascii?Q?PtriRdY5bElHdXat7MvlA9LGevNpkQDBQt3hSCjltMGQcPQE/nOw1coch+Ve?=
 =?us-ascii?Q?t22u1zTtZ1OVC+jl/vp8D4EhMgZdVGh/4NC8lX40Vzh/5qGvys4rC3pvLGwD?=
 =?us-ascii?Q?pzbeWDJc0uZJuZf08bYsnTfPF0F/UdJsDRnRcdP44UgHsoX8+DycYtt4BFnu?=
 =?us-ascii?Q?um/lgzk08+F++h6ni1izx26FBQrxYCGiENDPTf9PmlSN6+uMjJEfXUDfdqQr?=
 =?us-ascii?Q?rzKazmR0ADPcVQDuUpU+RJ0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RdqBdd9tk3ITqyRQb53Ny9A6kEmfrZtW6bBZdbphUGRJt3ZS7B72xoGCwH23?=
 =?us-ascii?Q?JpfdEQ4Zfv6qbBoQioBMyeT5NNKzKIkhL9ImnukENiTep87rjpLfRZBBZeHp?=
 =?us-ascii?Q?uPM2a1w9Ps8FL1kCW18pckg6blscygWWMhQodbkPWp1Ue90YDqYN9sKeZ01G?=
 =?us-ascii?Q?wPuAkSARFHwj72H3OXQp0h1ZcrKr+YbTN1l30XGSgMvlmP1EHBKBRT4M2989?=
 =?us-ascii?Q?dv88t8e6pBkaWznhvJxE+Qtx2SRu3YyEVXbTtS1TjoBYfYo7ohc6kojIFsM7?=
 =?us-ascii?Q?SLzsSnn3fmVhDqbbJM0DwTUo+W1s5Ci0sL06VI2sYxdGEU7XgfcgLgwsQXfi?=
 =?us-ascii?Q?nl/b+kVY7mdD58b7qiyvsrRUMMtXOEKAf/54hErl0yUU2NNcD7KwgtlUKOeL?=
 =?us-ascii?Q?Vja5QQJcZZNlrmwSCqW4qPnYxozt3ZHYY0isp/cwo7/EmtEOmiUPLEy8oodC?=
 =?us-ascii?Q?12SW5n4n+8KfUVhDWf0kuOHgPJbM3aX1S9TlzBdm6LmPNVDH7dgEEADWkfy1?=
 =?us-ascii?Q?VGp9h6ebO12PVUtYslQOA0BkZNUovKABFQSDigvamfjeRaG0QGupCMZfVTxN?=
 =?us-ascii?Q?zVJRMrXFWD9UGamentEeEXpmB4gFbaceRJ3w65i40WWu0CSWOWtAqZ5dMqGV?=
 =?us-ascii?Q?00IjkTQhNvXljjVK9eSFWjg3pttmf6U3w5ei1rz6Ai5/06f6RfqoQnUKDfmJ?=
 =?us-ascii?Q?vKMpm21lpEzJr4KLJbzilT9dK1QLDoocqdKVc1U2usjKmLEJPBPyCXNRe798?=
 =?us-ascii?Q?7T8SEbcDTcLAK8MNz4kUOjuDjoVGxEsruGSPiPuCfOEm3er6bRlCHdjRR5Sb?=
 =?us-ascii?Q?AlJSAmt6puzEehonWYkvn424tU83sWyvLRNy/64A+fdDxYeBlFqgKu1hwRRG?=
 =?us-ascii?Q?DyN9RQCGoZr6mA/EH+m6Ao0JXOTQrUlhWDtb9Lka0RGciljbQWwCEvpP1cFC?=
 =?us-ascii?Q?tatm/z95GxaCrK7QtL234jpmKVBwIxk1mf6/E1r7PeP2YZbe9nGZGX0fzf3a?=
 =?us-ascii?Q?/gKQ7eneCcAb15tO1CfwpQlKqN1vQi6KhKjQibd1TCmXmLx8QuOCf8kpLCLt?=
 =?us-ascii?Q?ZK7zTeRdetPTRLRQjWYqzt1WY1L/WVTXmSev2sDSf6nYylexIJwjXAZoIi+N?=
 =?us-ascii?Q?ww6PzSKho767HWJgaaz+2QnyCRLNhMOidIqd3GBm1x3ahiXgHeEAKEvd1rfV?=
 =?us-ascii?Q?d/Z6PmE/z3YFK2YinTNwca0LS2Xp3BEdGhgV91r1rI9yLc2DBhrJvZfdLa38?=
 =?us-ascii?Q?wHmYjXJTjYfw8I6xnQNlypaw9tgztv+vQdoh1DVhd9nkuDtIMGtT0tnQPUmP?=
 =?us-ascii?Q?41b5HsHeW8yTs62r+WQHYhAkdjBhDnUpCHbStOcalHaar2KrAr46MYgZJIqX?=
 =?us-ascii?Q?hA+wcoHALN0ULKS+ZDbbaOuu7s2dBqS5++I1bj3aajrknax/V2yXX96LYzZh?=
 =?us-ascii?Q?LRo2wJBCpmxGNfDRZW8yhA+9F7Gh++vGB9P0lpHKMvLaGmYmpdOcHrAqaZZU?=
 =?us-ascii?Q?XLJTh5HCVmu1dzYnqM5YiMa49LLAvrm0P5UcRoXxsNPS8G7Dpn+HN1GQKT1h?=
 =?us-ascii?Q?Nml9V1gpimkTHjw+xi+dK1UE9GR2oJVUeiXXxrzeRxSMO2/Sew0EYmEH35yT?=
 =?us-ascii?Q?uiwZe9jcg4fNA1cQ/mmNoPHM5LxuUGW/jWyfxhqeIgxAs9SlLGdHhAdUeSPH?=
 =?us-ascii?Q?9HYJO5O3E5Dk28YYiOfSEYx27kfxdqf6JLLmFEGgcDatxwOKf00Mh+k2giBe?=
 =?us-ascii?Q?WzsQfcLlVe+NYdQ4rsd38Te6oQ6s+bI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: designwerk.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d9df18-2355-4355-5213-08de6d353c39
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2026 08:27:34.4195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f12add6-5f96-40e3-ac41-2307f36545c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YUmaB9uT5ey1V6ptVRaM+qxk/VgTqMGD8/dsrAxERuQvCtJbAXa/iMkIZAdJFexO6rYxSqswEG8vGt1fF61Rz81a3pVfqC2KNFSnwHPsDW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRH2PF97B9F1855
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designwerk.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBeqctwiW+T3y8tzIEFDSP39emedn8e7Qt2PFhI6j2k=;
 b=dog744vEiG5dFbFThciDdDSpzPiQ2ptOVfSwl2LiQ2YamhDSshzWES3RyClX16EhtoLdYaZGGiY+guikLEpk06BchO95E8S06lmDDUzhBKAZGNeYnloPeHQyfaXA9obHvEXo9Utpr4i6GCFBesTMdfCBM8Anb/YAC0NNN50nEzA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=designwerk.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=designwerk.com header.i=@designwerk.com
 header.a=rsa-sha256 header.s=selector1 header.b=dog744vE
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=designwerk.com;
Subject: [Buildroot] [PATCH 1/1] Fixing typo,
 which prevents automated license parsing
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
From: Martin Bachmann via buildroot <buildroot@buildroot.org>
Reply-To: Martin Bachmann <martin.bachmann@designwerk.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From bbb70ffb0e33022ab02c69cc220f28268a5a1b4f Mon Sep 17 00:00:00 2001
From: Martin Bachmann <martin.bachmann@designwerk.com>
Date: Fri, 6 Feb 2026 15:44:10 +0100
Subject: [PATCH 1/1] Fixing typo, which prevents automated license parsing

Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>
---
 package/util-linux/util-linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index af6044af32..7617041a46 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -21,7 +21,7 @@ UTIL_LINUX_LICENSE = \
        LGPL-2.1+ (libblkid, libfdisk, libmount), \
        BSD-3-Clause (libuuid), \
        BSD-2-Clause (xxhash), \
-       ISC (rfkill) \
+       ISC (rfkill), \
        MIT (hardlink, flock)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
        Documentation/licenses/COPYING.BSD-2-Clause \
--
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
