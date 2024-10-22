Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB55CDD0FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 23:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C393C80CD2;
	Tue, 22 Oct 2024 23:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkh1oh81PDWa; Tue, 22 Oct 2024 23:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9AC180549
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9AC180549;
	Tue, 22 Oct 2024 23:00:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E0D64C2A
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 23:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D9984035C
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 23:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7oMQeHPIdE0 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 23:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=adam.michaelis@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C9E44402D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E44402D2
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9E44402D2
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 23:00:02 +0000 (UTC)
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MM3GXc017997;
 Tue, 22 Oct 2024 23:00:00 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 42emgnrc44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2024 22:59:59 +0000
Received: from xusxph005rp010.corp.ray.com ([128.13.121.135])
 by xusxph005rp040.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MMxwjH031434
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2024 22:59:59 GMT
Received: from UUSTOE28.utcmail.com (uustoe28.utcmail.com [10.221.63.42])
 by xusxph005rp010.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id
 49MMxwEF010537
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2024 22:59:58 GMT
Received: from uustoe1z.utcmail.com (10.221.63.19) by UUSTOE28.utcmail.com
 (10.221.63.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Oct
 2024 18:59:58 -0400
Received: from uustoe1y.utcmail.com (10.221.63.22) by uustoe1z.utcmail.com
 (10.221.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Oct
 2024 17:59:58 -0500
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.149)
 by uustoe1y.utcmail.com (10.221.63.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 22 Oct 2024 17:59:58 -0500
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::20)
 by BN2P110MB1303.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 23:00:04 +0000
Received: from BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452]) by BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
 ([fe80::67f3:4412:7c64:f452%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 23:00:04 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Maier,
 Brandon L                            Collins" <Brandon.Maier@collins.com>,
 "Buchmeyer, Neal                            Collins"
 <Neal.Buchmeyer@collins.com>
Thread-Topic: [PATCH v3 1/1] linux: Install artifacts to staging for kmod build
Thread-Index: Adsk1cvoqvWK/JpqRPCpFdnQ02fW3A==
Date: Tue, 22 Oct 2024 23:00:04 +0000
Message-ID: <BN2P110MB1160D79F220B89EF4AA5F69B974CA@BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1160:EE_|BN2P110MB1303:EE_
x-ms-office365-filtering-correlation-id: 10e1cee2-9875-4e46-178e-08dcf2ed443f
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?siMG5tSneoVDLLoSxb4afOTbt/F9B7/V/avaDPMHb07K4Z2Sw8drD05okEPr?=
 =?us-ascii?Q?seMeUe8a73hrX4IfU33+hdEEGjIuQvRxp4Ud5yJ0bRIKPlCgxh9eJePp7asc?=
 =?us-ascii?Q?PPPB1IkKJrwPLrWumomL+e9PRvWKCZkRJGk7GalbboY9ik1xb9vK03J7pbfi?=
 =?us-ascii?Q?ysAKLcketKAV4Un4+ak4ismORYrwIxXjzgW8rFZ1yiVDc/rAfruwII3DvuzN?=
 =?us-ascii?Q?ujG9v/Ybgs4UfJ3AjFePOq2bcSH3HnGbjjND332OkuNOK+/LW4kQvSDlwX3m?=
 =?us-ascii?Q?+lZc54YCfXb782S73nDawMMStYtcr17u8OGn4rs3c+A7K+ZCAX9V9JEGcbgz?=
 =?us-ascii?Q?izLTFUoRsVwdH/ssOsPDt2ZsUjOaAQH4Dohb9GNXS8AGSTixpXPNb6Nu0R/E?=
 =?us-ascii?Q?pzBb2kPlpVZ2AZZ7JiGHjgmPg2Vf4NFMlkyfyQp1AsosDtXpw9x4VFcpxF/k?=
 =?us-ascii?Q?VO0c1Yypr3B6ev1gLG70N6HmCcmi5ovqi0sjTxHBBW7R/t3sWyKCIvvr0BZj?=
 =?us-ascii?Q?g8GpFvdsfzd05+cp10AmTfx4oJT4NhQnu3l+MijAmlqMUt67znCmbztgBMcf?=
 =?us-ascii?Q?E4Co4vG6CfnZkTs/HMUW5Swlqonu1Jj4WcX6Bc5iGcYmGNI43xiZT96aKYe2?=
 =?us-ascii?Q?pQ7Y9mlkSYQ90MvWm+0dONGyuY2qLk9oE+kbaYWUb1y3EQgVd8qbaZX8ncKW?=
 =?us-ascii?Q?pSCy59Fr46HIu7iAUMb4ko3EXIoIyVcg5jwefedFRGDIRJ0IuDdqgm8kLXPD?=
 =?us-ascii?Q?LAlZF3v9HiF9YlCPCzFInCNHFcnGgFqBBaGgxT/mq45H1xDHePgx+V002RK+?=
 =?us-ascii?Q?3S5rbo/yzTNoxZaBZ+bRARqx8pAgNxDM1BRGaoHnbDOIedknfHyk+//8Dt8d?=
 =?us-ascii?Q?g6dphneY0d3XxakMnJSeNdSvxzqqCQtDmbfTiDwmCZIuvMGaN3YsAjbA1sii?=
 =?us-ascii?Q?a0twl85SAb7vpeFwlylaJ7q6QY81Yz2S6iNRL58laI5FGNNLc+KYrxRPWejN?=
 =?us-ascii?Q?6wQJU74Ufkq4xR2vvsf5Y5GQiZn0n11nCYKJcUixNmUKtNCHmtzNF7kBg8+l?=
 =?us-ascii?Q?UWlJ8uZIH3BWk/1DRDaiYj59AoF2DACH0iz/YNV9WLZVnb24pneszUgbqjCe?=
 =?us-ascii?Q?1eEVFBSRn9wV+LHjQQNASqBPJRwVHDZmfrnnUC5GlGVE2/HvWyPYTY9B2pF9?=
 =?us-ascii?Q?yWEq7ydE60Gm6BXk6W4tote2BFExtTq6OUcZefR0j5lOS55mBLORAGJAKE4z?=
 =?us-ascii?Q?KfLLM0RQHmU+wWCOJKTu+xSv07qvKVIwGSM/4L9IUEnvYItzbKHJ7CVVhTID?=
 =?us-ascii?Q?LQKh5Z7b/1We4QeDoaFAICze+yH5ELT66wlNfoTYatMzA2hwkxI5HDKCCXmE?=
 =?us-ascii?Q?cV7NBk4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dwCw9Op8xqjXWsvc3Og1ySKunJcwzouHkIIPZjvYg3SpmlkFccS6/+SDInpr?=
 =?us-ascii?Q?V/wd2Bl4fv7GHBrqAk4XLhsvJdG8INAQi1rp2YrLVyEewMNQ/tLBXJJFVszm?=
 =?us-ascii?Q?9NOq18vx0ymyRZyuUWrjgU1VewyeVQ8zFz2apC5vBnS6H1M/acD97AfIjtO/?=
 =?us-ascii?Q?R5LMalzOIbXrsHDZOMz66CDYBvVccnve+Ha7Fag7CFSw2SnJV+YVTbIir+mG?=
 =?us-ascii?Q?KTLtb4ptH5+1hdBu7KGLOBC1zwpkB2VnpL/clNuuIdJUQKhbx0sqyEcvUVWM?=
 =?us-ascii?Q?kq+EncKmbcyiV7Fls5isBNxKzGdIcjnMsIP2scTVy3PpyLchmnx9iN8fwM3I?=
 =?us-ascii?Q?jl/1Sl/YhUfGzUjfT2e1pqRfM6Gn/T/tGFD88tUGgJdzySuWUr5RlyZuEal8?=
 =?us-ascii?Q?z/GXWOxIiqDdphP1cVzYiqxRHV9hKshF55NhEI2zuYJvsRqg5CyUllXLy8Zx?=
 =?us-ascii?Q?WF1sCjIUfbV/yxq/CSa3bwnYR8aKiJnGik7IzMzkLYaIjEloVTZvbCbl+WxJ?=
 =?us-ascii?Q?eFmY9MXTz0TjBMtgA+ll0ukOkM0dK3X+wLW6XsLUUZRBqWHsSc7UZD1b8eWY?=
 =?us-ascii?Q?Z5SfXc5XVHfWz+37GkDgfspWCYxr18Rrr/+V9MbpkRn7HPYMCwmSsuCmdu23?=
 =?us-ascii?Q?xAessNPYnTDBKbaaObsA149rshFKL88R/EPaqxI15hOwOdmgmZwOT3anFKRs?=
 =?us-ascii?Q?925r9BSWudv4XcBKDuERRYjBoSTGj0xxZIXP7PJtcNoUHjat5ovKujG/PeYs?=
 =?us-ascii?Q?CKGbTVoSFfPNNCh4lbRloUJGZr81D3n53VJp4Ff0g2pu9U1cqejUsIECm/Rm?=
 =?us-ascii?Q?hj4mbxcx2PKQiWTa4ByUpk49QEv5oSWwNloCIP4CELOPc5yeT+jCLSrGK5Sh?=
 =?us-ascii?Q?y0t0Sw6vSC4LfdfIX2SIMo7pe90/+4nLSRcqXnJC8xvXHfXTizD+wW6+PnpF?=
 =?us-ascii?Q?LLlj6KykcxCA3VHIAWkuqHdHiEO1wavXEgMk6qrXhPOXkIyBwerWqNbuuuvG?=
 =?us-ascii?Q?KvczVYxVbPedj0ESqmbn5zik3Lakvzb53mkA0EoFzXlUW6jl7N5IDX0zJ7OS?=
 =?us-ascii?Q?I1zGQoQ/cHxvQWOfXt8AXaj1YD6f4bRnzQkUMbmP1IZvskcy/UNKsh5PFj1u?=
 =?us-ascii?Q?SUUVGy8fQoqLzhmS3xWdwKOXHo/Gx/TXjUGK20YeizKVgCMOkHTgesrVs8Ir?=
 =?us-ascii?Q?0mA0LSzcNcgmVYNHXuydD8FOEe6GqjWzNUO9rykujkAL7w001gykxuqW6zof?=
 =?us-ascii?Q?1ndAuQfIeAW7nh/fkcraqF2RF7wtK80V+nGyPG34f3VcQ1edHIxPaH7Dw4uc?=
 =?us-ascii?Q?5zULhpxMPITGCiQqy97AsGmt4SDjqgzpFdrqPrrtpgW1plsHVZDGo33UQ4kh?=
 =?us-ascii?Q?sJ1//KReeIYZCcGmgA6HxYNI9mHCd0KhfbgtSN/YZb0avc2NVLQxovnlbS8q?=
 =?us-ascii?Q?Cy8gHtHSckGEgTrdAkIHqwrN+MQBIE6LtJK/aCK23wfVEu/Vrxv9Xqqade94?=
 =?us-ascii?Q?CUIqaVXyc5P/Zuc=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=Vl8lLCDHmjRd+fQnKAgKdV2Su5VrLVyh2MNKosLs4hBkQtvze4uyfLs4meyNY+2WOodOZWyiOuRDmLekpa2oeRb/KwL6J3/lozmtOTsBk6hhQPT3DQ0SJMRLenPiCmVxSr6VoU0u1jUjd90hOyENXO8/r2rAtu4yHUn1OPzCEWAd8yoWxu8Kp1QKISmZBbI4M7fJrDt7SU3BJGx1i7jSHpBZF1LAsvcQAVHVoJJgIutw8UwRBZqb7mhwyYKneWiKrlBLa/RSEzKM9lePgZIdkTy3y/DbPCt9BW3poNgp7a/PaHjHAxlvgPDOZn4iuGzVkBVEwDsZJHoUYcd63hBTxw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQXC0WTYyVSZmHsafehyX31NBge/Jy7emET0DFPw91Q=;
 b=sjCJdC0M+eizgj7XgJhu/mhDGAY/gTQYUQXZW+opgJgXsySEf0OCb6TeBbs38Oavo0d5AnhvfLOnyDruXgGfj8QsSmfiWh94dtCTIr9CQA4mZfDvesGHVbW9HAovXqgYPwL4tggIBEAh9IWZwl6KCSHM6IhOgSPf4W4DSyQ/CtHI/fc8H8amisVWiHd0/TR5bWuwuPBiQI6ahwfcdCfVYE0uBpr7DAe4DO7Ntt2+mt97CjNPQ7pRIrj1Ce3b8Sjp+fvo8JlSziMrlYRibVYJqfu/GprY6Dxg/aa44zbcStlnCxDCgmcEeXJ5+HR7NRUfr72+gRHn6UfYDyPC4vSneQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN2P110MB1160.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 10e1cee2-9875-4e46-178e-08dcf2ed443f
x-ms-exchange-crosstenant-originalarrivaltime: 22 Oct 2024 23:00:04.5812 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN2P110MB1303
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_23,2024-10-22_01,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_23,2024-10-22_01,2024-09-30_01
X-MHuser-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220149
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220149
X-Proofpoint-ORIG-GUID: UhKqYkYR59aJeXPF1PgeGNBTOpzF8LM4
X-Proofpoint-GUID: UhKqYkYR59aJeXPF1PgeGNBTOpzF8LM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_23,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410220149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=hhH83Tnn4j02Wr1k/G6ZcVzKD2vGE4XSIMUGFMK8U9E=;
 b=GgsMMVgRM2XGgBm33RlyughH1G7XLU3beXmDu+gfFPUsPv8DJMQXepQAixqaNcBxltOT
 hGeMq7siL7njEEDPIbFOTvBOzS1H9Iqw2Du03SjVcxP+v6nJm3l5tw5hH3Rcl2GaY0cD
 dsFgACDa2pQnfV2v5Xbj4lFJQQy7XTVXSDyI4z7dfbzFnKX82/nZVB7Gg8ksHGmxC2y/
 qcWFAlFcj6dfVO+ok/Xgt+MrrOFUothioousvlrtycN/5GrUjlTGM/Wz2LoXSCidLQj/
 JcwIV30qLSRLhgKJjukIatOnbs3Q0gQPc22uZOnb+N9vJCbEAR0p0eH1bVIQ4rfEPK49 CQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQXC0WTYyVSZmHsafehyX31NBge/Jy7emET0DFPw91Q=;
 b=BdRDg1cpRHtWV+kYswfAx8jgp6q+qC5GbpRqfL7DlsEtoUpQ0N/GQcS4ZpLbyzgdErMbc3vSqGq7brXQfk3w2cYGQQ46aQhyqkztyrm100VJl0r8YAsPu52XtDrkwZFE08vcAtcuo7vsY0OZDFBfTuJa2TlrbYmBCgJIGzRn4+s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=GgsMMVgR; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=BdRDg1cp
Subject: [Buildroot] [PATCH v3 1/1] linux: Install artifacts to staging for
 kmod build
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
From: "Michaelis, Adam J Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Michaelis, Adam J Collins" <adam.michaelis@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From 59282105d9121f41386c799f4c81cd3f6546ca39 Mon Sep 17 00:00:00 2001

This commit adds an option to install the necessary kernel headers,
scripts, and build artifacts to the staging directory so that a user
could use the exported Buildroot SDK (make sdk) to build out-of-tree
kernel modules compatible with this kernel.

Signed-off-by: Adam Michaelis <adam.michaelis@collins.com>
---
 linux/Config.in |  8 ++++++++
 linux/linux.mk  | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index e8c0722de0f9..372cd9ddd7aa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -454,6 +454,14 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
          /boot if DTBs have been generated by the kernel build
          process.

+config BR2_LINUX_KERNEL_INSTALL_STAGING
+       bool "Install kmod build files to staging"
+       help
+         Select this option to have the kernel files required for
+         out-of-tree module building installed to staging. This will
+         then enable module building from an exported SDK without
+         the full Linux build and Buildroot.
+
 config BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
        bool "Needs host OpenSSL"
        help
diff --git a/linux/linux.mk b/linux/linux.mk
index 469a80db9f55..a26e9374b39d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -585,6 +585,25 @@ define LINUX_RUN_DEPMOD
 endef
 LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD

+ifeq ($(BR2_LINUX_KERNEL_INSTALL_STAGING),y)
+LINUX_INSTALL_STAGING=YES
+endif
+
+define LINUX_INSTALL_STAGING_CMDS
+       # Install artifacts needed for module builds into staging for SDK use
+       if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
+               install -d "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch" && \
+               rsync --exclude "*.o" --exclude "*.a" --exclude "*.dtb" --exclude "*.dtbo" \
+                       --exclude "Image*" --exclude "*.c" --exclude "*.S" \
+                       -a "$(@D)/arch/$(KERNEL_ARCH)" \
+                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/arch/" && \
+               rsync --exclude "*.o" --exclude "*.a" -a "$(@D)/include" \
+                       "$(@D)/scripts" "$(@D)/certs" "$(@D)/Makefile" \
+                       "$(@D)/Module.symvers" "$(@D)/.config" \
+                       "$(STAGING_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build/" ; \
+       fi
+endef
+
 # Include all our extensions.
 #
 # Note: our package infrastructure uses the full-path of the last-scanned
--
2.29.0


In response to v2 communications, I was able to prune some additional files (mostly from arch/) to reduce the size of exported files from 123 MB to 91 MB. Most of what is left are the actual headers and build scripts necessary for module compilation.


Adam Michaelis
Prin. Eng. LLSW
Mission Systems
Collins Aerospace
Cedar Rapids, IA, USA

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
