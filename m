Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD3C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 08:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E181E40A0F;
	Tue, 14 Jun 2022 08:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ilsYxAI7tqf; Tue, 14 Jun 2022 08:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9582A409D8;
	Tue, 14 Jun 2022 08:26:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0541BF291
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 08:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34E8260E35
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 08:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com header.b="WprhyGex";
 dkim=fail (1024-bit key) reason="fail (message has been altered)"
 header.d=synopsys.com header.b="NfrDgZkZ"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pHSmXq769xu for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 08:26:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D00A60BD7
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 08:26:48 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 37661C091C;
 Tue, 14 Jun 2022 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1655195207; bh=c5CZu9XTHcYXlq/QKEGpeiATDO0R3rlvORYfgCJnUhA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=WprhyGexqhAKrUIBjqbr35Z/V5dbd5DVRoTWllGCY68xGrIOLVxpXWCdE3AupFVKt
 KL2iQH+HJ8/XgLcFLTJ68AAOh9P2J9cCzhwWDLkxOGr4mKdr1KTl/bcazwJ8jrEIPZ
 o8RW2Y7Qkg6ElUn0xoKOI5QvauQLXl/HMn84tI7dUTF7lvNLBn+u4CtconhK8W7MYm
 AG46NVqfdkFXZjL8DEL+CDw/jncgxurjMASHgR31sox+l86sf4Jx663SXniTBcMSRR
 NKrXj5theKpyHHOuqv8egapFCfqL/jiw7QAw9KUGel6IbaCCeSuwObIfLCzMWTWbW5
 aDZ0ej9IIbtbA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id BFE01A008A;
 Tue, 14 Jun 2022 08:26:42 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 715ED4005D;
 Tue, 14 Jun 2022 08:26:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=shahab@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NfrDgZkZ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0Yv2fl9WRNi2/oGIH1DX//KzShGg5ZgKNUQzWl+wfJAaamRzhQhr50vzrWTH2gkp+TEKLE0HCMuSO2fliJObaEmNu3WlMDwQRrt+AzFHBMI8FgHuq+qOvc1cTavTy4icw/gGQA+iyKY/f2NEda81tHOlpSHdlxIG6PPF9vf0Qv0a5rlKD4aJSZfpCyt+r0mdAOJSI/E9QH0BXGOhRQSzMaMvlfADIkApyZGgjWyJ8Pjx+eOZbSUqnXlwLhWgBb80/gDwzp9KaGZ910fmsEZhfxMaHF9Q8ee7fCdTJETBnxqr9yuBTqWoMLpXEwkrbieURCvU5DEP8rLniB9brbYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c5CZu9XTHcYXlq/QKEGpeiATDO0R3rlvORYfgCJnUhA=;
 b=UbKqVJXizf3caQMzPoF9+5XtnuHjVTazMyEXm8baF1kIJ/TKTboWcotFSON9w9MUcvNrK0rYFZv6UYlC+CtlsV4b+wKQNYfD7xxFUOxNQRfW17crhHyAQHFCSbaS3sHbNEXlZMDB8b3fodpevk57UmuTVTL6un8dtT0d8H9sh6QVTyvOHSb6NznnGNjLHHzWSZoTTzAbWC/rYASaOOVlLubiO6NiAedH8fsRyYjRhtqW9plrtsJ56gs8FS60xcxZZb1OspC8pJCEotpi0cqDb9ZGDdYW1WR14v7mBqiaod1E3GOHqlL5JZvLdN585NUEmr86Gehkwl2lK5DSKqZBVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5CZu9XTHcYXlq/QKEGpeiATDO0R3rlvORYfgCJnUhA=;
 b=NfrDgZkZcR1RP626UGlcPDj48//8DBvBb3ILW97LzsB3RjvhaIuG4EsWfQkaLDHVGxj/PKsgApbzJQmMKPSJgRImFjF3E/MoMUFaUiX5i0x1pRNIrDtkisYrmop2kvM78rLu+iYsAnKhn5nip5N+ttUPwn+7KguPasw0XVH9L7E=
Received: from BN7PR12MB2771.namprd12.prod.outlook.com (2603:10b6:408:29::23)
 by CH2PR12MB4873.namprd12.prod.outlook.com (2603:10b6:610:63::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 08:26:37 +0000
Received: from BN7PR12MB2771.namprd12.prod.outlook.com
 ([fe80::2064:53d:ca7b:e2cd]) by BN7PR12MB2771.namprd12.prod.outlook.com
 ([fe80::2064:53d:ca7b:e2cd%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 08:26:37 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2 1/1] package/bpftool: revert bpf_cookie patch to allow
 building
Thread-Index: AQHYf8h2JMM8aUiv2UahKumirHdTLg==
Date: Tue, 14 Jun 2022 08:26:37 +0000
Message-ID: <38e7fb76-2c07-6429-b803-4fd6ff2b1178@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
In-Reply-To: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24923a2b-24e7-4ffd-25e2-08da4ddf9975
x-ms-traffictypediagnostic: CH2PR12MB4873:EE_
x-microsoft-antispam-prvs: <CH2PR12MB487384A7FB72FC5FF2E3BFBEA6AA9@CH2PR12MB4873.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gFR0ewUouceopndcDtti6ddJ9kquP+hf6WPNv2FEF1s218Y7semD2FoJLjASN7Y3zrYfknt+kYi8gRwZ40n8idFOScJrclmA/P3LY/Mq7eAeAtiMhun+GPQm6UUzjmaHTRf2EUqBCPZn/sRq/rI1PdCNIt7n4Rs6ohH9/HQTNJLCiQ5vYFCOohekvnlXoXSMiHve7OSVVD6i6yxoQRGV7ZEtWT+U4gDt1WZoAwFos0J6zmwPFf6uBNrXu3VQdByzLiBIR7VxcAQSfy4IQobZ3lqr0h92SXbV6HtGpe3VbPBdY1wP45/nTC5A37EC5TrFU8bmTQnmpFwulXm4TlkK+xPYm5EPKACjesyQ7013gnbtVi+U06GjX0eQuSy6ltC5RDLrfYnR5CLvn/jSy083K5WvdHBn1uhbqJ5qZ9w9MLzOV/6VfHoGGiY1WU8xE0RIa/OhCeAFQk5RFGNgNq0e6VfP9xvL/T5WTzRes8bITCn5DXEBo4as9FFrLEiXxnc7eTnBqmgxj9lSqn8ITN9Ciif6h6lnRCTJN1rn4aeEw6ZYZKgqbzaCEyzV34HkWQa+UpD2sE/DsC9pw2pwhY1svIhezO8goQn/l0EiIEz2Ri07P5ByK9U0fRfSDN/8OsmzwGDAGBNV5ayrX4KaDjmDqe9MvgX5xae+b9GjVteIzIrWZjePLjzk/bln8keS6lOzftRMUwkmJ4kKa+x8ibyyocPNf9To7rWDXPaZ/YZuAy0UCjtNJBqQI1ln3bKFL+N8pJQoreSfiKa0laYBL+nanKHOdWzEICuzSvUbkXd3OtZ4x2WuczyWHd8YReZOszU5zmDcs52VseDcZZ0SnOPjlKSh79Kax5LrjEJo5AT/jeE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR12MB2771.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(2906002)(31696002)(66556008)(71200400001)(6512007)(508600001)(6916009)(966005)(54906003)(6506007)(38070700005)(122000001)(86362001)(316002)(91956017)(5660300002)(31686004)(8676002)(38100700002)(66476007)(4326008)(8936002)(83380400001)(2616005)(36756003)(66946007)(76116006)(186003)(66446008)(6486002)(64756008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUowS2FNbnI2ZEU0OEZlVnFsLzd3WldCZzIrdzNlalJRUG9Va1pnSHZERjlY?=
 =?utf-8?B?ZmdZR2w3VDcrUTVlaU1ncUczRHFVMWw3SnNtblcrKzczM24zNFE0YmhwNTlu?=
 =?utf-8?B?UnlrSjYza1hsZjdHNExBRDBFQXJUNW5xZ2piam13dnIrb2Nqd05vMDBmcTNx?=
 =?utf-8?B?SklqUU45S2VtTlRzNlpEOEpKbWo0dXZtOVQ5cnpSVjJRL252aWFpR2dWUFUz?=
 =?utf-8?B?SFNYTXMwR1ZvZVRoREZEdlc5M0NTWGxVOVNtMWV4a3JXbHJia2NVZG82MnU4?=
 =?utf-8?B?ZWRaT3lDbWZxZHhqR0pQblFzWkxFY0MrRnVIODErNzNFdUMvQjdOUlFrczFK?=
 =?utf-8?B?QzJVL1FmaVdoQUlRWjQzeHF4WDlaNUtiYUpaWC9hY2ZuR0dZeFV0cmJlQkli?=
 =?utf-8?B?M1dnZXBreXg5RmQ3czQvYTZyNW5ZcmJLYXliaSt1Tk1NM0xiVVF4SkFwUWxp?=
 =?utf-8?B?REcrRXNtWWxTL0phOHFmV01rOXl5YUFIMVhDWlAzODh0ZDhmMkwwQnFrRnhm?=
 =?utf-8?B?NHlyODZaNFNlbXdPMzFFa3poYzF0VFZuRDIwRHJSMVRwbFIwNlpZS1dxckhS?=
 =?utf-8?B?b3FwVHNxcjQwN1M5N1ZsRUZBb01qWmlDZU9GUHlQR1hsUUVDaDUyd0hxbkN5?=
 =?utf-8?B?QUdyVXQvUDhMUkw4MzIvM1pZQkxVQTU3U3VSQWFZVE9qSlBTZFh4TFlvajN3?=
 =?utf-8?B?bkNrT2VxL1F6Rk44bncyU0JTVVhTOWRDTlcvdmZndndnODRxY1J6YzI1ODln?=
 =?utf-8?B?SE8xa0Iyc0FaeFRncTBzRWprSFkrR1pDa3g5SDJxTEtWM0M1MlVyNE9hRjZM?=
 =?utf-8?B?bjRtbmVKMmFPMStNbVFyS2FUVmcyZHJCckZ1OFV1OTA4UjFKZTZZYm5vNEFl?=
 =?utf-8?B?VHJRdE5EdHFYUG5MU2g4dUl2bXhiRXFuZTk3SlUzbGxtVnF6WmN4ejVuaVZU?=
 =?utf-8?B?dlpZdlJoaW4yMkRMYjRmNEY2T2JWVThoMWFxZEFHekZjZDgvZU90aXRReFdi?=
 =?utf-8?B?aXJRVXRKUHRsTTR0VFhmQUpKdkR3SXI4OElVUkZZTGw3Z0xvT3AyaHB3aFg1?=
 =?utf-8?B?M1pGSlVpUkdSaGdIYUtoUnZPTFdFUG5hN0YxbTdZTHFZVG5vdEhNVzdQa25a?=
 =?utf-8?B?T2dRVmxRMTFDNDFhNFhzOTdwSFZhcE9OMWxDTk5qL051WXNXa0NHSkRtN2pl?=
 =?utf-8?B?aFd6UHRSVG1BMEZwWFI4b0g4aURsVVU5Q0tMMzdwYUV3bjRncCt4Um4xQTdl?=
 =?utf-8?B?dGNUd2JScGd6Sld3dHNmUjRFUXUwbmhxNjVJYnBobzdCS0tKRW1BUWZoaUwv?=
 =?utf-8?B?U0Z5UXZFbkhQMllRME1VaFlrV1I4Q2EvazV3YW1MUU1kNStkNFlNa2k3bDZS?=
 =?utf-8?B?dkg5NUdyVFptdUFMMkd4ZmlxbkwxbzZnRUh5SmtwUDY3MDVMS0VJL3lVbVdL?=
 =?utf-8?B?R2dad2pNYjRUcWM4SWRnZWRNb0x1cHpqcnVNbDR1cHViVXVkYjloQU5hU0pz?=
 =?utf-8?B?MWJPSEU4M25mR1VlYkxFYWFBbERXdzc2ajJ5TnM1Vnc1Y05rSzNNOWp1SWpX?=
 =?utf-8?B?TlNyZGlpalgxaUlpSmcvMExIZXloOXRXRitMbmxIbDVyQ0tVWUFVSEtUcmd2?=
 =?utf-8?B?QUZhMGFFVnBXbW04NVdZMkU4aVAvWERTaTNCcWMzdWRMV2Z4UGhUb0RWTG54?=
 =?utf-8?B?bTVnWEU5SDdBNlNUTzA1RWhzTGxjcStqSkt5cEd2RGNIR0xCNVNFdFlMS2tm?=
 =?utf-8?B?Q0tURElqeUV4TTM0Q2xoY0hWYTR5L1o2VkZUMko1d2J6L3FTM3p2VHFkTXBw?=
 =?utf-8?B?bTIxNzZUMG1kU1JJNFBoUklPK2s2b0xER1ZiRWNBL2JwalRYSytlb1NpUms5?=
 =?utf-8?B?RjBiMzFHMlVRVit1dmg5eE9oVENjcVZmTUVEcGQxN1hKQ2o1eVlrZ0R5Zmpk?=
 =?utf-8?B?bTNndVoxejFxaWR3SWI0c1VndW51a2o5aWRwdUlJc3l1ME9kVnpKY1BPbzNO?=
 =?utf-8?B?anpWdEIraFkxSS8vQ2J1VE44QzZBYnBxeEtnL0VtZVVBcFc1VWExcy9wdEpk?=
 =?utf-8?B?VHFOdzh3bHFyZVdCT0NHUjN5T2hCOVJDc0dGR0ZUYWN4ZWt6VTFwcmEwc1cz?=
 =?utf-8?B?bm4zVUZ1N3ZvbVlQQXdhQTVlV1ZCVUdia1ViNUw0bk5OODE3MXJydjI1eklQ?=
 =?utf-8?B?Q2hLOUFPaDY5Rk81NDVVTXp2YXFIOUdwZmdidDFiK3hvckd2UkhCUFR6UEVa?=
 =?utf-8?B?RFNBT1UwTHI3RTRQYXp4Vnp6dHpNL2VTclB1eWY4alEydTUwcHBMMjJnVFZG?=
 =?utf-8?B?SWpRcS9sV2dKZEZsNlJFeDU4SDdacXY4aXhTV2pVOFgxYnF6bWRqeXdub3pj?=
 =?utf-8?Q?a3jP63VgTW01djRs=3D?=
Content-ID: <B304330509A37C4A87E7031E1D5B639D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24923a2b-24e7-4ffd-25e2-08da4ddf9975
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 08:26:37.3827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHKAYikbYo+UulXyCIHW1p6/5cwwoVAZRpedDHE7bYUKdJ/UxWrAJDfcvr0dw+wNKg0qCbdPMU06I14vzoVLJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4873
Subject: [Buildroot] [PATCH v2 1/1] package/bpftool: revert bpf_cookie patch
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
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

There are changes in bpftool v6.8.0 that assumes the existence of
particular data structures in generated vmlinux.h that is obtained
from the host machine. See [1] for further details. This commit adds
a patch to revert that additional change in v6.8.0.

There's a patch series pending to be submitted upstream [2]. Hopefully,
those will take care of the problem if they land in the next release.

Changelog:
v1: Initial submission [3]
v2: Use a full fledged git patch for bpftool

[1]
https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u

[2]
https://lore.kernel.org/bpf/20220421003152.339542-1-alobakin@pm.me/

[3]
https://lists.buildroot.org/pipermail/buildroot/2022-June/644819.html

Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
 .../0002-revert-bpf_cookie-change.patch       | 227 ++++++++++++++++++
 1 file changed, 227 insertions(+)
 create mode 100644 package/bpftool/0002-revert-bpf_cookie-change.patch

diff --git a/package/bpftool/0002-revert-bpf_cookie-change.patch b/package/bpftool/0002-revert-bpf_cookie-change.patch
new file mode 100644
index 0000000000..cb9ebdec41
--- /dev/null
+++ b/package/bpftool/0002-revert-bpf_cookie-change.patch
@@ -0,0 +1,227 @@
+From: Shahab Vahedi <shahab@synopsys.com>
+Date: Tue, 14 Jun 2022 10:12:21 +0200
+Subject: [PATCH] Revert commit "bpftool: Add bpf_cookie to link output"
+
+Building bpftool on Debian bullseye fails [1]. This patch
+reverts the offending commit [2].
+
+[1] Building release 6.8.0 on Debian 11
+https://lore.kernel.org/bpf/c47f732d-dba8-2c13-7c72-3a651bf72353@synopsys.com/t/#u
+
+[2] bpftool: Add bpf_cookie to link output
+https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=cbdaf71f
+
+Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
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
