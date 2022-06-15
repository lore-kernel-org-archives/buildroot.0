Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DDFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 10:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FF883133;
	Wed, 15 Jun 2022 10:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDpYgiVlB761; Wed, 15 Jun 2022 10:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32BFC82969;
	Wed, 15 Jun 2022 10:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4811BF5A8
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 10:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7988482969
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 10:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKp5qHDPZTu6 for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 10:57:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E67882907
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 10:57:42 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 557FBC0CB3;
 Wed, 15 Jun 2022 10:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1655290660; bh=Swki/bVRBJuRpdIxA1sqBQEPvilUdlPZUqN+mz2n7HE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lLw6KHoUJREwgb0oCZj6DlvIpyYoBnSSOs+6egA12C6RbQjc1DnJLdjPWy+qeC1z+
 N3dlDhkASg0ECU0SaObYaODd0a0tZZNlQW3Z7JVlm/zWliLUfoOpx/w1miQrNZzHcD
 68l0PQ9hOQ9I/kluHhnMr3KbzB+kGxB2+igd4MiNqOJL0JQRTeV/VgTH7nNu94mzOr
 R/mZTJJGTaala1T7L08Aiq52+s5joUHlIdEjRbxj96+0GK0F7s6ZmWo9lRq1iCU3HU
 fwe3mbY6cqvaKG73einca4NWPAT7vkgbOAJ1f/pnwID6ZsvAYC60kxGczWpwqOC0Je
 LpBfOAIVGaw5A==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id D0D56A0071;
 Wed, 15 Jun 2022 10:57:36 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8C21A80005;
 Wed, 15 Jun 2022 10:57:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="cAM7eJFa";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td6/FyxSsnlDmTYwo4WbqJ3GKdrPJWT0T3uq9hn+GfPcbWq9sX+IUjSvoyw4MWiG2lZGczICSwvbvdqhSfw/nof8tm2WsQipnaV9HM3mstxEJxOecEorUtCegRl95lC9J0c12WZg90sBJ31zSmXz91usL/feXnXfJCW+9tKbv8AWDE+YWp6sDeWc2/Lbq0vr7Q95MyxpbDcp/QzU1JjJclrG6V8tC6B2TvY/+9wzhPM7hkFqdBv26C2uD7wM4ZTUUkvNOLxcyyxz0tPXGbtstJyBDbIeFSRhf+fgIvysF7oGEwu7bCQStVCNbgJBzzeMju5nA1GBjh2eppILtOwQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Swki/bVRBJuRpdIxA1sqBQEPvilUdlPZUqN+mz2n7HE=;
 b=MYyz5XxvBU+A+p0idN3XvZqua6uT6MXwHPxpAiBYKSJZh8X/pw2GQjFBzCoM+yKwyaKCVV02W+xK8ufec34uW47bSudKpvt0NGb/z0k6amI4UXwLLrejA7Sr8Tsa9PRNMLd7n2Uv+thXYSg+CLLEqWuJZH8ji+mcrjw2Fy4w0yPSOCHB0/+kc74DJQBXMPfGz8Yx9oZ9PwYlKdQaLVJohK1XIrE4kHJLnlCu4OOnB1JVy498jkrTrr+EaYyEp0lv54Z79lTSRg9XWFLVUgGDlr3e1v19o78tnXpVW6zet8tiJeG/ux5JP+A5qM3bpNYcMzz+eSBbV1E3svfzoQeT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Swki/bVRBJuRpdIxA1sqBQEPvilUdlPZUqN+mz2n7HE=;
 b=cAM7eJFauotKAvVv0OYw0GnGt4gbsn1qNINHfX61/ssNCIXWSGlxJalR6yK7WmM/gjEgSjS8Es5klShdzx5aerBcz/oHqYRUdsZYi0tk5NtTE262i9VwwCq7cmczqFODet8cxrNBLot6kVAyJPfb7BnNONy6auKH7GdAFl0zaIg=
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by BY5PR12MB3876.namprd12.prod.outlook.com (2603:10b6:a03:1a7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 10:57:30 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::887b:e58:cad3:ce9d%4]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 10:57:30 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
Thread-Index: AQHYgKa1M48yKL+fGECWDKsB+ehK1A==
Date: Wed, 15 Jun 2022 10:57:30 +0000
Message-ID: <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
In-Reply-To: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cd91a8b-7311-4e67-7c6d-08da4ebdd7c9
x-ms-traffictypediagnostic: BY5PR12MB3876:EE_
x-microsoft-antispam-prvs: <BY5PR12MB3876AE784CDF187776867609A6AD9@BY5PR12MB3876.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /K6qyaoqtM3Jrq4jgeCy5R8xUO3eAt1JJ59wdtl+2MQCvNlr95sEjjCMfcT5Zveqh+z1GfVjRdok6CpawdrIBKSPOubxJY5wKgfO/y3icAGulbu3GsEwp+z0woPnMX8oilXGeDtrFiVtrKKrLUvSpyCIyJWvYfoJGV1n203X5uWbB0Y3CxBiCcW6GtiXpUyf3wZ9nsQfEqk56RFofEmuMGA7VaOEVZp1I+QSpjsTWznDl0nx6P58jsDczA1GcyShdkamSyvtUReZjLajd6LMa9IArVATz0078GJRIoK6kPjQ+Y5oHg28xy9YPU7cbHzu/P/lJUn235Kg3aS9lmCOAuez8NGmD07P5piifPZCb35TBTg7yHvf8OfKZyddJvSTh6VXP23lUGIrtQq4usQ1WCpfh+cMMKMfRgQGSuQv/E6CUXel7FFg5NMx418OBVWcNFkKxjv47YCzvvLY75nNcgY81yHSx5k2FkZ1mhtPp/ao5QULUKSqDlSK/fTLcOBP2spqLNqJXiO+nljF77qpCTa+Ud/UpIt9Xhj7NWww9UMQQ+DaHQz0PWzkXhLj62Qwbdb163dFdSfzZ6dYzOOB1qBTBXcywVqKunr0Z1XJ/Wlww8ddkvbXDUqroL1mlVMCNThDZzr1u2JfccXeeJ1IKqqOh2dc/VEaKr02PisWMis77L3a/ENKb3j8TZkR+1UHZpa4Hrj9hsSNwdfa6krrQoxasHr9vDCNsgJE91bIfgny3VKocPg5k8+h3fSrCQFuYRAiOB+FUMnBDJO8QRb08nW27cdtjQyDLKd+ajx9K3zFa9i5OFrmo+JOXeM0zhudZlsRB5IJcIMHFa3j+dn1y3oDuUO3iY73GiadwTLrtKw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(83380400001)(186003)(38100700002)(38070700005)(71200400001)(2616005)(5660300002)(8936002)(122000001)(8676002)(66476007)(54906003)(64756008)(66556008)(2906002)(508600001)(66946007)(966005)(6486002)(76116006)(6506007)(6512007)(26005)(91956017)(316002)(31696002)(31686004)(66446008)(4326008)(86362001)(6916009)(36756003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RklJd0RHYnV0NzE4c1A5MUd5TUdITFc0MVBpRFdUcERJOVlFbE5EdTlTUm8x?=
 =?utf-8?B?Q2w1RHlQQytPN05jcENMMngyUHlJS09NbUlveWcrcE8rZWFGQXZSM1NOWC9U?=
 =?utf-8?B?TUtUcFNQWVkvVlZaKys1QllCQkpQZ2lzbThZYnJNejM1ZFB2MjNSeEExdTNp?=
 =?utf-8?B?YXVQUm83bEE0cEk4WENHYzlGbjJnRFFjT1BZODRIU2N0VHZXVWZjdmlLd2py?=
 =?utf-8?B?clNXbjd0L1Y2WFA4UHp4M1NRV2IxNTZZZTBGMTVKRmdBK1lVeW5QUHhGY2RI?=
 =?utf-8?B?Tm5tanBHQWJJREF2cVF4ZEF3WURXZnJ4amR1UE5EYkN3ZDUrQUlYNDdBNlAr?=
 =?utf-8?B?M2FvMTBRenhONEZuNVJJVHdFcTgvRFNIVHZGUkQ5Y1djMkVGc0I3eDJ5MnJk?=
 =?utf-8?B?WUYydW1KMklqUGw0dTNYdTFzQnB1TSs5dlJNc3pHeXZhckJwMGJoRzJUYWlI?=
 =?utf-8?B?elpteUNVWTlLOHIyalJQUGVnM1pNOEVsZEc2WERmNmk5M0VSRzJwZ3VlTkVy?=
 =?utf-8?B?MmFmQ1FlbG0veHdyRzBwQ1hyanN4WE1seUgzcEtjY000L0NZQnBncFoxMmEy?=
 =?utf-8?B?QzR1WHgyMC9KeVA4N2J2M3IyY3RSbS9hSzFXODFwa3F0bGVZZ1ZpdjlvbUlB?=
 =?utf-8?B?blZNUzM5Zy9FNmR2Z2FyTWdNelkyNG5sR2syS1hSWEpxYzVqb05oZ3ZmT0ZS?=
 =?utf-8?B?ajRNS0x0RDVwZTZMMGlaKzk0UEN0S2NCRFd0VmFVZXRkVzdWVnNrTHM4WVpm?=
 =?utf-8?B?dWhUZ1dpVzU1aEZOaUlGYm5PTmpNN3EwWlZQUFZVclR2dU5JMlR4VmJHTEhv?=
 =?utf-8?B?QUpNYzNtWlZXclQvdW4wVXBZSlR5NE1QV1ExNkZxeUM3MWkzMnN6d013MGFq?=
 =?utf-8?B?cGowVU50aFgySklEc29PKzdmQ3hKL3RnaGk4d3ZhZUVZUWZoOE10eUFRNjYz?=
 =?utf-8?B?eDRpTkZzRUVFRVNScHhoZFN1VGcydDBxQk84WnJvVlpEUmtJeDhxb3Zzc25Q?=
 =?utf-8?B?SzU0eGtWU3NVTjJUYzB6NkNPMXFBQ2xHOEFOZ3dwOTZma05qRVlHbTJKa3Q0?=
 =?utf-8?B?Z2d6VUZtdXpQdlFiUXMyeU9YNlg1N3NmdW9BQVQwcUMvbjdLQStRcHZ5aUds?=
 =?utf-8?B?dUJxSHBlVnVMY01mYUZsS0FwemZrTzR3UGMveTFvdmYzYk5PZytuZ3plUks3?=
 =?utf-8?B?dU1VZjI0L2tpWE5nV2VwQWJnWjZmR0lVWmtLQklCYkJIN0Q1SXVzSjB0bXYy?=
 =?utf-8?B?OFhZdnlNUXUzZG5YQmQwV2RWRDFmeFI5am5xM3JlckRiL1hUcVlqWndOWkIx?=
 =?utf-8?B?QS9VNFlJby95NlpWV1N4S0VDbTBiMzJsdkUwajRhSTBiY2Q2aTRURThhakpq?=
 =?utf-8?B?eml4V1V3UllzaU5rT1VYUkYvb3lYczRZSjhOcWFUNmlINWJHUDVqMnNJYVd2?=
 =?utf-8?B?cGhLSmZDdzZoZ2pnQUtMNnd4V0VRSDdqYStvN29jT09tb0J6ZFVpV3h5eVBU?=
 =?utf-8?B?NmtuMS81Yzd3SVhhSUZxRTlWbFRjYS85NGUyTDBhYjFDMGxMUmprcUVIQzRW?=
 =?utf-8?B?UmZ2by9xbmgzVWhnNlNLbHVmdVpTcWJGWkoyOWoybUttYlNORDI3bW5xbHZq?=
 =?utf-8?B?dStSMjJjOUZucHNydWZWNURGS1FDTlJIaU0zMG56amZpVis0WGYvS0t6LzN4?=
 =?utf-8?B?b1FxenRBdHFQZGFWcGJvTnJyL2Y0dU5Nb1o4VkxSTEd4RXdTZE4wTUlFWjNB?=
 =?utf-8?B?QkdZTkdMMU8waExHT0NDa3VhYmZWdUJkN0NJckZDOE1NOGVDWVJzSTRiVzQz?=
 =?utf-8?B?OUlVLzBoZGlQQVpkNW1ITmZPN1pkMmZQOFB5MnR4OEdVZ2VablVxNjRVcktl?=
 =?utf-8?B?RmllUUFYbll0SEtoN2tLei9JeS8yM0c5aTFteXBzODV3M2hLNjlPWmU0ZGhI?=
 =?utf-8?B?cjBMWWM2bnZXTUcwYnRxYmxVZlRpQUdBYjg4bHF3d21qWU91M2hmbnYzOHJN?=
 =?utf-8?B?NkJQWlR1OFdNWlNnaWNWOUxDRUZUa2VwYUkrZCtjVVBacDViM09NamFRcGQ3?=
 =?utf-8?B?RXJEZzdXMGV5TVdzalJHeFhiRHlDV1RFR3JTTm5yRU94SUxiSHVuanhIYjBI?=
 =?utf-8?B?M2p1SUJ1aFhkOUg3b3NoT2N3SXMvSG9kdUJ0Q3ZGTGF4Qk5sdEYyb3A1cEhI?=
 =?utf-8?B?cXV0cnNlbEdxWHRrRTJGQnFOeE1pTTdYQ0NuS1hMMkVZdXBieVUvSFdCbGl3?=
 =?utf-8?B?bDJaVnJZMER5d1IzdHBtTjlqY0syaWNMbjdSZitkN25uemhFRnRZYmUydXUy?=
 =?utf-8?B?SThzVEt1elI2WFFxcXBLSlBnMGQ3ZXdyY1ROclZLemw1WUhjZVhWdz09?=
Content-ID: <731CA51582473B4BB3CF0784471580AB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd91a8b-7311-4e67-7c6d-08da4ebdd7c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 10:57:30.2125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qH44IeShevRxFaUuTp5qs7o8QejkzRKOGAac3iv2xNVJvpBcdVz8YQu/N7a/fKw24u7h6acjlo+wyMTj114qKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3876
Subject: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie patch
 to allow building
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building bpftool on Debian 11 (bullseye) with kernel v5.10 fails:

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

To be clearer about the setup, there is a clang (11) installed on this
system. bpftool's build process enables "co-re" feature (Compile-Once,
Run-Everywhere) if the clang compiler is new enough to support
BTF_KIND_VAR [1]. When that happens, bpftool will bootstrap itself:
build/bootstrap/libbpf.a. This bootstrap part is about those *.bpf.c
programs and are only built by invoking clang [2], irrespective of the
compiler used to build the rest of the bpftool. To sum it up, to
reproduce the issue, all you need is having the "co-re" feature
enabled and a kernel that does not provide all the data structures
expected.

There are changes in bpftool v6.8.0 that assumes the existence of
particular data structures in generated vmlinux.h that is obtained
from the host machine. See [3] for further details. This commit adds
a patch to revert that additional change in v6.8.0.

There's a patch series pending to be submitted upstream [4]. Hopefully,
those will take care of the problem if they land in the next release.

[1] Checking for the clang support
https://github.com/libbpf/bpftool/blob/d4469819d1d639ae2354f3d2ddd10377f081a576/src/Makefile.feature#L12

[2] Using clang to bootstrap
https://github.com/libbpf/bpftool/blob/d4469819d1d639ae2354f3d2ddd10377f081a576/src/Makefile#L175

[3] Question about the problem
https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u

[4] Pending patch series
https://lore.kernel.org/bpf/20220421003152.339542-1-alobakin@pm.me/

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---

Changelog:
v1: Initial submission
v2: Use a full fledged git patch for bpftool
v3: Fix the snafu that resulted in malformed patch file
v4: Reword the commit message to make it clearer

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
