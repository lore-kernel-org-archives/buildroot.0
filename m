Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2624C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 09:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83C8140A77;
	Tue, 14 Jun 2022 09:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UX9yxOARjzz6; Tue, 14 Jun 2022 09:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58D3540A20;
	Tue, 14 Jun 2022 09:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7528D1BF267
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 09:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E4DE40A20
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 09:31:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yPMg8oM-sQ9L for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 09:31:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB66340A12
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 09:31:36 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3990040C57;
 Tue, 14 Jun 2022 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1655199095; bh=rB4SiTF61EBUsK8oCoLcb2Zq8t8wxtmtxVRO4X2Vipc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=AEF/UolU7Qs3PXgGa9Y0lTJ2mxQyl/QP9dreqiAJA65fHU8tzzramXk4wCayYA3Mg
 jIdyNdjViam82qnm/zvRBNM9pqkRpc7Mst7E8iHPbLLRAzbj8Tcwo7zBDWcXcE0IT/
 uCeF+t3hsSSHwHXuTnZtWMKBFNjvTGkbt1mVeZQu/n/AQK+f5/3bF7+8c9PKkkHo9V
 9EVCPeX6SgF4Bwub7iNb8Uks1SzP3JVLlBlakBg5Isv4jDhTvx46BorsoJwpuyAa+d
 TOoorhfdCtC6aPZYBhT2P6u3wluTD++qWLDKVq8LyrbZEdSBn5EgPP3tOuzg9D9a+j
 cBOnnjB2EbyUA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 93DC7A0083;
 Tue, 14 Jun 2022 09:31:33 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id CF56A4006B;
 Tue, 14 Jun 2022 09:31:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ekWKiJXA";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/7ks00woPROqjhxxEyiOO+Be6DK7j4ZdkECkdYbxJTKdXopRN7vzpmOinRuBONfihbanWfJEwykJLo7FQ8Y3HFgOo/DDgL7rI6mMYgYMfHeHqM7B2K5j9Pzpdpj2rsOsEFipTADw9GE3WcX+83WQ92V2uppLYNwN/kBl62suexvdXG+EFLnMrgGk40ioy/1zkEiffz8Fkko/JrzXl3yU6o12C6YcSbnS14yk4r9+3y9MQg/njztb3m26SYpdIBcBcF4fFQSnhmClvXb0MZ1k3h77Oukpuz67L+11bPGIDjgqZOMI71OwFbrTVYq+QAgT1gBOZ2hrC6yHm0lKjKq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rB4SiTF61EBUsK8oCoLcb2Zq8t8wxtmtxVRO4X2Vipc=;
 b=Jhe0bf4V5FvvaCEoPsTtQbTmEBGcKkML48Lp4K3fsjmzgEmXyDJGRsYU4sjBLzLdm8S5NAW/a2MjZzyXttJCLhoBErbVjs/u92/GYHtQseXycw+fAvH3ZsCvoKX3Alk7hsm5m0xDvgtRHNchFMJ+5VOaCkAFRjrusChrkA97345InTPIKrIFTAbuzv6gLt4Gw3pto3rREfOi5sVyNHLq5fPOOlGxvGvoay/AxLgDNNzZegbX0P5ACuiqAk9oEi+1K8PGkLJjoykUKJTKR4H8KYB2ozinPQ/xn/yoOywwo86MZ2mDHtGtf51+Ps8KnrJCQ6JTIAAjljennEvbyrhkZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rB4SiTF61EBUsK8oCoLcb2Zq8t8wxtmtxVRO4X2Vipc=;
 b=ekWKiJXAl685PpOv6iGRiEMQPDYKHXih2iaPt+BRKItV8fq20fzhr4BvkJb9ezUu3NU5qMfdIWiNqLvmRm0rOGj1P40Ni3ow6ERfiKITiVwBHwW4xJ+H3u5qvremFp3Q9vU6jAdrcq2Fur2D387ZaPYuV9+43TdeKJqVjHVqwt0=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by MN2PR12MB3502.namprd12.prod.outlook.com (2603:10b6:208:c9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 09:31:29 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d%4]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 09:31:29 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 1/1] package/bpftool: revert bpf_cookie patch to allow
 building
Thread-Index: AQHYf9GGNdBPjuX5nkCxwDk0/FmiVA==
Date: Tue, 14 Jun 2022 09:31:29 +0000
Message-ID: <3062ce96-7e99-d221-61c8-4b87c87c113b@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
In-Reply-To: <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5efbfb36-6b4a-4bbc-552e-08da4de8a92d
x-ms-traffictypediagnostic: MN2PR12MB3502:EE_
x-microsoft-antispam-prvs: <MN2PR12MB350289826739A3E9854A7E0CA6AA9@MN2PR12MB3502.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NeYbr+CGLx6JqnaGS6QwKi80BCLK08ET7D8mWv0BiT1QA2ylgBH5bTUICSlgmdINFhoGNwKRiwvGeUR0urBPvTrN1H9H+B+poPjkzYCi5bQA+bzYmcWOJDGYZmkcQA2Nb1isUo57zMPa+65f+3D2at19Zdq3WUgVJxL05wqIiOtx6/PD/6T0zjuLUw5DOtchADiLzwjmKTAewGqx/tXlKnzPUQkPSdfA6CrXMQw5qoWUijizhH+fl+/8axJM58A0BRJyXpbQFW2OY7CCmVIXdHCXkVXL9hzrkZ4Rk09zIgtJbrKdw2ve9I8Wgw0nGWPmqsDho2A0chDuXY3q4ZTAWSW0ltMgeqt2x64TGFTHq/zhzvycIVhPuSzvDPSupZUm0Dn2GeRb3sVIQo7Aq1/pD3ZF0krqny+xAX+JVovOwfsWfB/xwkMjqFapwVUV42LZg8W4bD0B2SkRETYDbR1xk6ILeMuxBrqqcbSWXIv6+KKg7OH9wDUsEiG7EJwik76DGyQxqVRijn4I+XRwE6v1uMcXHFloS6C2Sqq5rO0z/Y8SLDrLYNfwnA1Oecl3OqGs1SAz/kbLRmZUHuKCTnqJfyW/EK4K0QpGfOoTwFip4oCPiRYR1axJpbxx5GyOcA+nhNaYJ/LTSewXNbm8kHalNH63RBgr4skZS19GsTPDNKBhbB9QnaJF14VLiG9q8eSbbCr2HUO3KDgMNFIFuH/2Kat23dQ2yIKufdWzdZ1vMhkq8v6JZrl7Cth7yow1rF59jVzvHJ9GmngrTUBQBJkFZ7uDoZgS1EoYuzPMxcG6C21YLgmJuUf5BxNeoBoIKSk8JAplacOyd86w1n0/g4Lb9OrjLIYAOIb6tgjy3EbhP3M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6916009)(91956017)(54906003)(8936002)(31686004)(36756003)(76116006)(5660300002)(71200400001)(316002)(66946007)(66476007)(66556008)(64756008)(66446008)(38100700002)(2906002)(31696002)(8676002)(4326008)(38070700005)(86362001)(966005)(6486002)(508600001)(6512007)(83380400001)(122000001)(186003)(2616005)(6506007)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1NWcGE2UVhsU21KN1FPalc0bUN0aVVJc1VPR1pWR0I4M0tlUW9ZVWdFMDFS?=
 =?utf-8?B?eGUrdnYvc0VpOGJ6d0NmZzhSa3hBUS8zU3VQdDd2V3dXcm4vc2k5WVd6UHoz?=
 =?utf-8?B?RVNSZnNaamtEMlhDK0UvTDRLdHNqU0NDSEgrMnp6RXZvVHRnRWpNTnNqZjBD?=
 =?utf-8?B?b3VKUjRzV0ZvMy9kU243emQ1eTVEdWRDUnVIN1Q3UjNwemNGUVJBOWsxYVU1?=
 =?utf-8?B?bHM3WXNKV1ZUOU84MGJqTVNLNHZJNG5xQVFJS0hKY213dGozWUUvNW1XTGE4?=
 =?utf-8?B?U1RrRTdDL1NwalduODZNRUQyaEc2MDlxbGl6Qis2STV5U3NqbUVWYTYwZm1V?=
 =?utf-8?B?bjIwNy9hbHlEbXBXM2NwWWdGNi9abDViUUQyeitPZk40a21CbHZrUG1OeVVR?=
 =?utf-8?B?dEVsLzUxUThCZXFLQVVtR0owbHUxcUY1cjRFZk5aZnJJcEVra1J3SGQxTXZT?=
 =?utf-8?B?OXZmNFB4VnBzSGtHSkdKUGRYalpEQXdIRk13RXdvYnY2UmdNL3U2bHJGdGUr?=
 =?utf-8?B?YmR5WUNkZ09vdmtQaDBzYUJEUXJUMkxuVTFjZnRXcEtjTWRqVGo3V2VmazBU?=
 =?utf-8?B?NXpMakRrclZhemxrQWVidnM4cklRK3Z2QzVLUElBL2xXM0huSGo3c1QvYzhT?=
 =?utf-8?B?MnozL3d4Tm1VUWtZUW5hcmpBYVE2VVc5bGRrQUFlYVZjYjYwNjhIRlJZbUtC?=
 =?utf-8?B?T0YyZjBhQWxzUHh4bU1STHRTZk5zMGRKQnFmbktsNTZQaDNaYXhMa2haKytV?=
 =?utf-8?B?Q3AyTENHZTZDdU85NDh4a1VsU2VzRkxpSTFIaXU1LzliNFpnTjdNSXJHWkIz?=
 =?utf-8?B?K1J6UVF1WC9VQVBBSTJ6TXFucE1JTFU3ZDV5N3BwYW5zcURUVXA0c0hhRS9s?=
 =?utf-8?B?TzZqTk5raVNWWUk0a3dpM0pKNWxHZFZycDFSSDhHUHlaMFZidWFrWmJmOStB?=
 =?utf-8?B?WHNVS1g5N253UHFRUEFMY012RDZNdVoreEhZZ2FqOWplTklxV1pMMWlvdHFy?=
 =?utf-8?B?VjFSNlRmdTJ2MG91KysrTzduak02Sk9yTWRaQjNvNXBSODlEaDJxR0lEU1J5?=
 =?utf-8?B?VGdTVGVhY2pidUM2S1g5Mkg2MXFxWGFGRE5FN1ZOZVpEZ3Rlblo0czZ1NDEr?=
 =?utf-8?B?OFZsS0M0eXJlVmNtdXAwWllKRG00d0tiMFl2YVN1WXZQdGsvUEhocU1CVTdo?=
 =?utf-8?B?ZlZzUzhWbXJQWFpxS1lDbEdzRTJTRUh4ZDVrdEtCenhWRWVQYzBnMmYyU2N3?=
 =?utf-8?B?VW15N2ZGT04zSGtONWFwcWVVbnJlZGw4eWJhRWVVY3RuRnJXc01XMEpoMTlk?=
 =?utf-8?B?NmpyVjNMajc2Ky94dmY1TUZZM29kTldhMCtEQUlIdmYrL0RHanQvWnU3cVVm?=
 =?utf-8?B?d1hsRzdwSUtCYzBKNkdGUEMwZ2hqZENVSDBjUzF5YmprYTQrU3doZXRZVDE3?=
 =?utf-8?B?ZzBpRVU3aDU0aU1qazEvYnY4R3ZaMUx3WHNzdGtmRVBwbG1hU2NlTHhqanky?=
 =?utf-8?B?QXBSNC96bk9ZZm1PYjk1K1VrVjRpUGVmQmMrTk0walBoRlhNR25WNlJHWFY3?=
 =?utf-8?B?TmlGbFZTQ2kxbkdTOFRYSkhDM3kzSWQwMUF5YVhKbHo3NzJydUNFM3VPcjBj?=
 =?utf-8?B?TTA4NmJYRlY2S1NWS05KZG1EYzVmNlpKMVMvbzd2SHpEUkJscVVscWxsT1NZ?=
 =?utf-8?B?ejZwYkhLQU9hblU4OUlYWGZHKzY4aXVRSUgvMmMzZmlwMkUrUW43VTA2WG5w?=
 =?utf-8?B?czZPWFRuSE9maW9sTkdwNnhITDRQby9hRFJsaDFJY0RoKy95UlF6SzN6SXdC?=
 =?utf-8?B?bkw2akkyaFNPQXRoREQreU5KUGZuN212N2UwYk1Ja2Fub2VrUFpjWnV1cy83?=
 =?utf-8?B?a1hGaFdBWS9XM1NRaEpPUGhsbHlhb1ZKYXdPN0EzYkpIVkJZaHhlZk0zQkVl?=
 =?utf-8?B?WkkxQWJaYjkrL2RUcXcxZ0tLVVhQTWN3MVYrczUvUy9XRm0xbjZrQ2dHQTJh?=
 =?utf-8?B?N3lUeXhjZWtKdnF0d1lOVTUrYWdVVkhsODQ5clZPNDc4amRlVUdjREtvekJD?=
 =?utf-8?B?TmUvVUFFZVJ3bWwzd2RwY3BsaVhsZnVRTGJSYjExOHIycXNSaS9YOC82eHYr?=
 =?utf-8?B?S0RVOUpEeHhCa1NDS1cvd1Y3akQrYkk1T1MrcXdPZmxSdVJ5TlNLVDhrMnlI?=
 =?utf-8?B?WE9IYTR3YlplMGZZVlFDNFhsMUtpTjRpTnE2ZmhYVHc3dDFTL0ZqbklDMlIr?=
 =?utf-8?B?MnprZ0RwbW4xY3JFQkRkK3dpMXc3bFhaZmF2NWxNY0tGMGZXU3NWVEVueDhv?=
 =?utf-8?B?VUpON0JXaEFSRHhWbEk5VGZFN1ZmNXd4VDBkaE5lSFdOSWlvcHJjamlsK00z?=
 =?utf-8?Q?C8oQO8PBNUrjvnqg=3D?=
Content-ID: <EEEA4F496D61C64D94822BD5D19CD234@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efbfb36-6b4a-4bbc-552e-08da4de8a92d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 09:31:29.1949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KoEbmTBrfDVK79/boJqEpsMM/uhCOdN0jNFUOGvCS0E5N0z3z6ucG8ecfjAU8U3Aq4iuGHCg875CT/zptUBpbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3502
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Shahab Vahedi via buildroot <buildroot@buildroot.org>
Reply-To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building bpftool on Debian 11 (bullseye) with kernel v5.10 and clang-11
fails:

-----------------------------------8<-----------------------------------
$ make
  .
  .
  .
  CLANG    pid_iter.bpf.o
skeleton/pid_iter.bpf.c:47:14: error: incomplete definition of type
                               'struct bpf_perf_link'
        perf_link = container_of(link, struct bpf_perf_link, link);
  .
  .
  .
skeleton/pid_iter.bpf.c:49:30: error: no member named 'bpf_cookie' in
                               'struct perf_event'
        return BPF_CORE_READ(event, bpf_cookie);
  .
  .
  .
10 errors generated.
make: *** [Makefile:176: pid_iter.bpf.o] Error 1
----------------------------------->8-----------------------------------

There are changes in bpftool v6.8.0 that assumes the existence of
particular data structures in generated vmlinux.h that is obtained
from the host machine. See [1] for further details. This commit adds
a patch to revert that additional change in v6.8.0.

There's a patch series pending to be submitted upstream [2]. Hopefully,
those will take care of the problem if they land in the next release.

Changelog:
v1: Initial submission [3]
v2: Use a full fledged git patch for bpftool [4]
v3: Fix the snafu that resulted in malformed patch file

[1]
https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u

[2]
https://lore.kernel.org/bpf/20220421003152.339542-1-alobakin@pm.me/

[3]
https://lists.buildroot.org/pipermail/buildroot/2022-June/644819.html

[4]
https://lists.buildroot.org/pipermail/buildroot/2022-June/644824.html

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
 .../0002-revert-bpf_cookie-change.patch       | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 package/bpftool/0002-revert-bpf_cookie-change.patch

diff --git a/package/bpftool/0002-revert-bpf_cookie-change.patch b/package/bpftool/0002-revert-bpf_cookie-change.patch
new file mode 100644
index 0000000000..6f9579bd23
--- /dev/null
+++ b/package/bpftool/0002-revert-bpf_cookie-change.patch
@@ -0,0 +1,129 @@
+From d7c78d1e38cde73c85b491a833f0e6e3f0d62654 Mon Sep 17 00:00:00 2001
+From: Shahab Vahedi <shahab@synopsys.com>
+Date: Tue, 14 Jun 2022 10:12:21 +0200
+Subject: [PATCH] Revert commit "bpftool: Add bpf_cookie to link output"
+
+Building bpftool on a Debian bullseye with clang-11 fails [1].
+This patch reverts the offending commit [2]. If clang-11 is not
+installed, then the "co-re" feature of bpf will not be enabled
+and the issue remains dormant.
+
+[1] Building release 6.8.0 on Debian 11
+https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u
+
+[2] bpftool: Add bpf_cookie to link output
+https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=cbdaf71f
+
+Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
+---
+ src/main.h                  |  2 --
+ src/pids.c                  |  8 --------
+ src/skeleton/pid_iter.bpf.c | 22 ----------------------
+ src/skeleton/pid_iter.h     |  2 --
+ 4 files changed, 34 deletions(-)
+
+diff --git a/src/main.h b/src/main.h
+index aa99ffa..2f2b638 100644
+--- a/src/main.h
++++ b/src/main.h
+@@ -111,9 +111,7 @@ struct obj_ref {
+ 
+ struct obj_refs {
+ 	int ref_cnt;
+-	bool has_bpf_cookie;
+ 	struct obj_ref *refs;
+-	__u64 bpf_cookie;
+ };
+ 
+ struct btf;
+diff --git a/src/pids.c b/src/pids.c
+index e2d00d3..57f0d1b 100644
+--- a/src/pids.c
++++ b/src/pids.c
+@@ -78,8 +78,6 @@ static void add_ref(struct hashmap *map, struct pid_iter_entry *e)
+ 	ref->pid = e->pid;
+ 	memcpy(ref->comm, e->comm, sizeof(ref->comm));
+ 	refs->ref_cnt = 1;
+-	refs->has_bpf_cookie = e->has_bpf_cookie;
+-	refs->bpf_cookie = e->bpf_cookie;
+ 
+ 	err = hashmap__append(map, u32_as_hash_field(e->id), refs);
+ 	if (err)
+@@ -206,9 +204,6 @@ void emit_obj_refs_json(struct hashmap *map, __u32 id,
+ 		if (refs->ref_cnt == 0)
+ 			break;
+ 
+-		if (refs->has_bpf_cookie)
+-			jsonw_lluint_field(json_writer, "bpf_cookie", refs->bpf_cookie);
+-
+ 		jsonw_name(json_writer, "pids");
+ 		jsonw_start_array(json_writer);
+ 		for (i = 0; i < refs->ref_cnt; i++) {
+@@ -238,9 +233,6 @@ void emit_obj_refs_plain(struct hashmap *map, __u32 id, const char *prefix)
+ 		if (refs->ref_cnt == 0)
+ 			break;
+ 
+-		if (refs->has_bpf_cookie)
+-			printf("\n\tbpf_cookie %llu", (unsigned long long) refs->bpf_cookie);
+-
+ 		printf("%s", prefix);
+ 		for (i = 0; i < refs->ref_cnt; i++) {
+ 			struct obj_ref *ref = &refs->refs[i];
+diff --git a/src/skeleton/pid_iter.bpf.c b/src/skeleton/pid_iter.bpf.c
+index eb05ea5..f70702f 100644
+--- a/src/skeleton/pid_iter.bpf.c
++++ b/src/skeleton/pid_iter.bpf.c
+@@ -38,17 +38,6 @@ static __always_inline __u32 get_obj_id(void *ent, enum bpf_obj_type type)
+ 	}
+ }
+ 
+-/* could be used only with BPF_LINK_TYPE_PERF_EVENT links */
+-static __u64 get_bpf_cookie(struct bpf_link *link)
+-{
+-	struct bpf_perf_link *perf_link;
+-	struct perf_event *event;
+-
+-	perf_link = container_of(link, struct bpf_perf_link, link);
+-	event = BPF_CORE_READ(perf_link, perf_file, private_data);
+-	return BPF_CORE_READ(event, bpf_cookie);
+-}
+-
+ SEC("iter/task_file")
+ int iter(struct bpf_iter__task_file *ctx)
+ {
+@@ -80,19 +69,8 @@ int iter(struct bpf_iter__task_file *ctx)
+ 	if (file->f_op != fops)
+ 		return 0;
+ 
+-	__builtin_memset(&e, 0, sizeof(e));
+ 	e.pid = task->tgid;
+ 	e.id = get_obj_id(file->private_data, obj_type);
+-
+-	if (obj_type == BPF_OBJ_LINK) {
+-		struct bpf_link *link = (struct bpf_link *) file->private_data;
+-
+-		if (BPF_CORE_READ(link, type) == BPF_LINK_TYPE_PERF_EVENT) {
+-			e.has_bpf_cookie = true;
+-			e.bpf_cookie = get_bpf_cookie(link);
+-		}
+-	}
+-
+ 	bpf_probe_read_kernel_str(&e.comm, sizeof(e.comm),
+ 				  task->group_leader->comm);
+ 	bpf_seq_write(ctx->meta->seq, &e, sizeof(e));
+diff --git a/src/skeleton/pid_iter.h b/src/skeleton/pid_iter.h
+index bbb570d..5692cf2 100644
+--- a/src/skeleton/pid_iter.h
++++ b/src/skeleton/pid_iter.h
+@@ -6,8 +6,6 @@
+ struct pid_iter_entry {
+ 	__u32 id;
+ 	int pid;
+-	__u64 bpf_cookie;
+-	bool has_bpf_cookie;
+ 	char comm[16];
+ };
+ 
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
