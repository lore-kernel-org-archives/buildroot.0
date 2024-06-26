Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7555CC27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 22:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3BFF82117;
	Wed, 26 Jun 2024 22:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6hIK_biiVYZ; Wed, 26 Jun 2024 22:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCB9B81FCD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCB9B81FCD;
	Wed, 26 Jun 2024 22:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 681591BF3EC
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 22:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 545FF4013C
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 22:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sU5Kr7NexO2V for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 22:07:12 +0000 (UTC)
X-Greylist: delayed 3889 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Jun 2024 22:07:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C4454011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C4454011D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=andy.a.kennedy@collins.com;
 receiver=<UNKNOWN> 
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C4454011D
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 22:07:11 +0000 (UTC)
Received: from pps.filterd (m0346906.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 45QIumRv018599
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 21:02:22 GMT
Received: from xusxph008rp040.rtx.com (xusxph008rp040.rtx.com [128.13.124.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 400m9rd0vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 21:02:22 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph008rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QL2LvB026030
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 21:02:21 GMT
Received: from UUSALE2E.utcmail.com (uusale2e.utcmail.com [10.220.63.40])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QL2KZJ015816
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 21:02:21 GMT
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE2E.utcmail.com
 (10.220.63.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 26 Jun
 2024 17:02:20 -0400
Received: from UUSALE2B.utcmail.com (10.220.63.21) by UUSALE2B.utcmail.com
 (10.220.63.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 26 Jun
 2024 17:02:20 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.183)
 by UUSALE2B.utcmail.com (10.220.63.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Wed, 26 Jun 2024 17:02:19 -0400
Received: from BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:169::6)
 by BN2P110MB1012.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 21:02:18 +0000
Received: from BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9f88:6b6a:969c:b264]) by BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM
 ([fe80::9f88:6b6a:969c:b264%2]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 21:02:18 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: host gcc?
Thread-Index: AdrICvkgnzJ5ZsaDQeq98i+PW5CVnA==
Date: Wed, 26 Jun 2024 21:02:18 +0000
Message-ID: <BN2P110MB1060371DE485BB6BB29E11DAC8D6A@BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN2P110MB1060:EE_|BN2P110MB1012:EE_
x-ms-office365-filtering-correlation-id: b0a15813-14cc-497e-f109-08dc962343c0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230038|1800799022|366014|38070700016;
x-microsoft-antispam-message-info: =?us-ascii?Q?+i/Td+urR3DypKlYHHHRf0ZEhuGmngEXzDCSPKzPuBv1RfL0AuqZNFKrM8Cl?=
 =?us-ascii?Q?TbfXKQ+28tbYx48j5r7RE+cK7O+69SD4A+DP7J2tOTHQYT8eT03tljnh3G84?=
 =?us-ascii?Q?Edb82uIBetYTydXSoNz6Jl7gmZCszkqjDvt+Kl/vqY1hJFol/0pZ2S9vpSmo?=
 =?us-ascii?Q?yvP3xjarb/UdiTkpiBlUUHD56H+N1aBGNYFSm2CDFHjdWEphc/Nj17mejuw1?=
 =?us-ascii?Q?Vuliep3S7z2AvmIrOZzZ9wr46aGOr1DeOPCY4rbLYQcdePImTHVfMz27TXgc?=
 =?us-ascii?Q?U7scc9mKF/cWCHSRxFE6DaPOvPLrR3EZBap6ZpgisRcFAPGQc0rg/98fgRae?=
 =?us-ascii?Q?j9oOfatgiZL9MpyPirXlDKnxoLduawo6ofdcczHU6JHwfuFcaY03WSWfAfOD?=
 =?us-ascii?Q?HMAm21tATtI0aSdRbNCvFIwdJkJAwibq4cJE7Bkp40FAEYOjVUraXkLrZj1Z?=
 =?us-ascii?Q?Og8tCvNfLh0MEvpNAnAXsli2AAo/k0nMIcPPpXHh3CD90WLMYH3f6cw5C7fu?=
 =?us-ascii?Q?6mqEYO8T0gijXPlVTjZDYFutcM3v7sPjjjSphW7eR22Qp8rrFGfMLThcKoTl?=
 =?us-ascii?Q?WkYnxZtVm28uJ2kVyja42hEW1A3IbaHsYv5RQOtfrRG/r1f3/3uHEc5Ge+un?=
 =?us-ascii?Q?UHpLy8AiuhFzI0F7O0YkIY57ialI+NZNYgT4Qo2wS2caHUyU3RvI6fz0B4Qg?=
 =?us-ascii?Q?12LVjGePR4qu80LEkbiZ9qNPnwc6He2g8CD+RpLeQqN4EaKpBhyrPH0w+Qd2?=
 =?us-ascii?Q?80gJXt//Padwhp9ZbSnns6+K0JDR2L4uUop8XR6OF5cH0WUX23yUNyrZ9Vrt?=
 =?us-ascii?Q?rQSpb5vCkmwM5ICFJX3/z+ahoLd3zi0KPZEAJxZHAVc8Nca84T5udOlqQ7p8?=
 =?us-ascii?Q?cb+/yC/BDxT31GF1FzDCpZuCbWUBi1rX98SbCh010faqgpGRZEaBcv5iBsWg?=
 =?us-ascii?Q?5Qrnt58SdYN3YWFn6lUwC4mxN4UKEl5uDbfbktDW7sSpUE5uRBhxkReCQg6M?=
 =?us-ascii?Q?by7f83v3024m5mVbla1lrNhDxnl1CO3VXAF16G+UOcO4/WTwwJH6dr2FE+oy?=
 =?us-ascii?Q?Ul7DRsY1KYnWT8mGs+dDca6TSbUn6hUTzI0gDQfGLywFRG3plpymEhK+3bHG?=
 =?us-ascii?Q?bFmTr/D+nWJV7s2xHKJc6nHoK/Ktzp66CtBLfEXri5eTmifyCpgLr6d06r67?=
 =?us-ascii?Q?68hIP6JIf4Uq/xjw7I4W9zvH8HIgGXKq5FhqIv4poIt7F9j+fbwk8tJyfsub?=
 =?us-ascii?Q?qbCPE2XO7jZn6VoQzClvEyfXNulByrY7w1eGwhh/mrXzsOBpwJC4rFpvfKTH?=
 =?us-ascii?Q?edL49YOvXsjeSFavzx+ltmhQJEPr5bP+tC682XIskD7FvcOEnDTYYyn7IzBs?=
 =?us-ascii?Q?JLVQ9ow=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XpAiPpNL5bRaSuNJ4jWs8VfHrwp4YfzlnJFgwJrcgANeDaHNNozvbWofAy9W?=
 =?us-ascii?Q?ELNIjraIe5ypBiUaVig5CwYBAnNumTkzueXrZ7tqcsRAg0+d7mhx7eEzbrTH?=
 =?us-ascii?Q?q6RcVhdlVGns0/FSK7czQMCCH44IIdIXLIfdVmNekbbEUjENxsAnPKKEWMSs?=
 =?us-ascii?Q?ZJr9aOZDvb1eaD1gpvp9xSbsFT+BoMX5jme41Pl4JPmotAyrQo8JLMQc/L0M?=
 =?us-ascii?Q?oZfvTmW7q5ofaJJfTJjrlxyOVFSDtxkVJq2w0TxXKUigbG0dusvwy4BNqNd+?=
 =?us-ascii?Q?huLQ7PPDiEhY6u9gaBjMwSU0hBZwiPqfOiJBVUez1X4UUnnD9sl0lA6RfCWY?=
 =?us-ascii?Q?HfaGcVHyKDExB1QUErmpStkeFBDHGcIGDGRcoB/Xqag09WWmIiev2uoHv6PW?=
 =?us-ascii?Q?zwDOU2Ws/gl9kM1tLDRoosW4+XQKnGrmdcNNF55tpfKuwI/HdcpYWT+a5lqu?=
 =?us-ascii?Q?6GHPAZ6cSvTApR+JnUZ9eLgUc/nGF9FFOb2y0dji77HAsdtL5Pse1HUXUY6W?=
 =?us-ascii?Q?gQ+dFV22KvnKMedB8Vqwqw/VX2oAYKPZvMD1xYYX0duM10F92YJIC5LvL2IV?=
 =?us-ascii?Q?pQ7+/LpsNwIZHIFlKt+1j5Xb1F3vt4DkYMS5Gexo1miXYjx/TxEjxyb7d+Io?=
 =?us-ascii?Q?7nmnMjyRgLm5wJiptkA1l0PJ/tk0BncI/c2qSlBBBCsJ9CaXHhxdyNK+V+KM?=
 =?us-ascii?Q?PQqu/ZjK1yPgtIAQWSHYZKM9b44nxnlO17zTHtU4Q6hCFHApMd4YcYvKEeo1?=
 =?us-ascii?Q?2UjMFiD6NysVwUQ8eOHNJg4bz8kgYmtV2f4SPVicSCcoeuQ/2vRyOuEt3bT2?=
 =?us-ascii?Q?7UV1FHub1Y60eiOYflpURfVTewQ6OO3HuA+Ssp8OIU6pFLaKqPY6YHyqeixo?=
 =?us-ascii?Q?UiZAZFyqCQ9G56b/QajYakJRiaMTVZHaHNwPneiKZ0q0kkPD7amEr690OXuA?=
 =?us-ascii?Q?ZnGh/rB7yx1prcMNE+tT1MZ1+0enKimSUnP3Ahca5dLmlwl32LaLjTDCdbfz?=
 =?us-ascii?Q?8yoMJwB2mrhK/SVP5ugLm2cO3VVWqm5ZrN1jpT8ETQVgwTjlk+fVZIImtWAJ?=
 =?us-ascii?Q?sOz3U4SltXnZq5RPcEZdy3s0MkYZmaiHWWvsXuiydkWbOhFCIXkbo79Qx5z6?=
 =?us-ascii?Q?111oKF+vBr/XVwSi2IoMfsQjYUyHTgB8ZiygPnLNK8siPm2FAnTIjiiG70uY?=
 =?us-ascii?Q?wqhvjuUzSoyZ6xVUH7N5+2x70t7XKOsGmGDyikHvctkvKHZLy8e5YECmcIuK?=
 =?us-ascii?Q?/80rqUuJC4BeA/rse8tLw656BESQk6G3iZJOUEyFTVroQVVElw9zzfyk9Tx3?=
 =?us-ascii?Q?LBDUbr97iOP4VPc+0OANzVf38HbyWK8Vov+4NhC1WyXfbKPIGD/13q2r74Zk?=
 =?us-ascii?Q?EFOm8LGInt+xIw1bJldAn4Z3ZZPv1s0+FrTJS39T+hPTbHv4BEgluJXtEFBB?=
 =?us-ascii?Q?ELIfG8y+VYPl10nbHkvAwDffuZGbJ2cIXg8w0oKpg3f7hMXuvvSZtJImldS4?=
 =?us-ascii?Q?14kRwRYQFWs+bH0=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=gMPc2tqJrX1cqX/9HJ6WlphN+W5vQ++p7g+hflTbNUrEK/MDSqewH2nv3nG2bMTDbCneboZ5JxwZaD3O4AYvBp1JZy0ER9K0D1fk4rHU+i4R/NmOYq1N9kRg4TrpcnPAOooxMFyuNT2EK8fUKztydyJ92AjjYKpySsZg2Sp8ZpTtphd/HT0KFFnfWV4vUacu4ONvi9mizXB0cNuX+jKWjZgWI7Oj2q4KSgV6r3Awc9VgEeMkUSg6ikzuRrJEiP2COzEZZzDzPD5t+XU6DFH5IvhILwG99YthgySLeyQVEdhEBp7n+ASTMWK6i2fy1hwoJQKp3WadQwVtHYiYIZ2/wg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7cZcTW2Va+kKXHcOSprKBCDjO1nkmFFeyaOAzPb4j0=;
 b=aKEBerQFhZ1dZo61mLbaHnUYzLbH+7DrUtFhKSdlw9WBUAkRBuoTgOfUY+7rEmfMlAHLs2DJBcFUB9lTvhMLHviPtpA2IwRMRury3UDtrIaN4jzxyjbD9L+z7aaN4SktIg1wX0wN0o3OAC59/G53M4QMKOAzIf9Ny4IlE3/AZyIZ3oLv+dhq9nF0ddx4+V9cIxBoWJVikU06lGASzBxsXOW+KksIKtuOGzGPzZotXpR9pvEnI6DRP04c2lGlnEpRJFMk6iZm9wxgD9slnuIlHfb4Zwgo9CQeDcfaPitqZp0Msa7io2LCZIgQI8cVhVDcdOPdYXBJS6AD6klnu28+1A==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: LDkmD0r2KEp8610kqJEUta1N6ZnttlWvnYnDaL2n+NDGLVEm7Qa6k2OKb1RD1SK1vwGPJmEfAVmPAQzw4rQ2T1YVRtNdM4FgmJ2D7++yQ/mKZtqDHG4oJA6ek1PEK10vHViKNYMXHpy3NLcWinHOfpUPwgk8TKn/QNgeZLGYt6R0lHKLuRmb2WRovCjn4/7XiWcG0tTM8yUaTSn6/HFIWob9q0bf+uzIScFzZf/0IjwLLDgso+gGK7jW087OCq6XLzFOlcaZU4LNfBHfKTtiS2VxozLJWoa3OrcV2qmCK+a3L/k7Leapylx91U1PoEdeZtFg0gv9OD5wfvqqzcRtOEKAY5rfUO9IcaxG1gFjcc9/uK2dqczEpGhSQ7QPrp/avCEScN7xU1bCF05YDSMizSJrq7tkTg3mwFbFY+BH7f8COBmY7VxZHCa1tsex4JkUAuktNaALw9IeT92oyF/dqhlOL0tMZgGhHhc8s4Wt0EjAVBKaH3onk97BVyHmjnsYJSPmywauz6qF1BcOSO4TFac3Hihq6Qfa1Su5oyOGHYpAvTckjy+LiNJLGZaRv3p0bs5PxYpCcfdMcZvv+bhDNLVMRX3ZBxS5D/uXT0yRcvFhUiuM1n35T+KyfOP1StPE
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN2P110MB1060.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: b0a15813-14cc-497e-f109-08dc962343c0
x-ms-exchange-crosstenant-originalarrivaltime: 26 Jun 2024 21:02:18.4337 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN2P110MB1012
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0
 mlxlogscore=759 suspectscore=0 mlxscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406260153
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=819 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406260154
X-Proofpoint-ORIG-GUID: zBjF3oElzFROVOsSV-wPZuQ12gxqbjT3
X-Proofpoint-GUID: zBjF3oElzFROVOsSV-wPZuQ12gxqbjT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=830 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2406260153
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; 
 h=content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=Emo/2gojzD8+nFKPCRku+yuFszQCAoLhqM0441wrqos=;
 b=hH/Q7Au/fOEoS22yvZM8IegRcSOj/r0v5r3h8iuF0SQk5Gbaiz8IBfUC4XXoJM/Tyfni
 iMSHR8bs5cYz9Yqt95/7rE7prUDbBP5nsmtu2JbABCcwyc34gt97a/ysuk/XatYOa2mC
 g4p4l4bny15UI5ut6sLNAlPl/ICDQDfmDnBATNxW1QKfB9JsW15olR0JsKbWCg7uWDtj
 JrzWeas0E1UCGQfVHUn0JdsnrCQvwzMk5C6v62Yc8IoGugi1QX4SqQDRMvs+BBwjhrTH
 RbBuRZwJBxF6Re4+0hGNe2VULv5wr4rw/GZDlicrNgsqPGd6Lfn63EwX86tnC0HxEBTw /g== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7cZcTW2Va+kKXHcOSprKBCDjO1nkmFFeyaOAzPb4j0=;
 b=ofFeO9ebEbh0mu7kxIz5ecy7yTmxCmO3p9KnwAHoqdoWJW332MsTpdvIndynBtnj036dKP9Xund1VCRdKv7vMKKo0aMY9gLSUHEXyr1pV0hagt33G1B7LqJVCmRypNECzkkMJrihXEsRgldQmKRWv+d5Svs6yeIS9vRhZFb7/Rw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=hH/Q7Au/; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=ofFeO9eb
Subject: [Buildroot] host gcc?
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
From: "Kennedy, Andy A Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Kennedy, Andy A Collins" <Andy.A.Kennedy@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Many years ago, I recall (perhaps erroneously) that the toolchain build
also required building an intermediate gcc to get to the latest version
of the selected toolchain.  I now require selecting options that need a
toolchain that is older than the version of gcc I'm stuck using (for
reasons I won't address here).  Specifically, I'm attempting to select
BR2_PACKAGE_PYTHON_SCIPY which has a dependency of
BR2_HOST_GCC_AT_LEAST_9 and BR2_TOOLCHAIN_HAS_FORTRAN, the latter of
which is easy to overcome by configuration.  The former, however, is
what stumps me.  I need to provide a gcc that is greater than the much
older version than gcc-9.

Do I have an easy path to this goal?  Assuming the answer is no, would
there be support in providing a way to select the current toolchain
gcc build as a host to host compiler at the same time?

It is good to be back!  I've been missing from BuildRoot for many years.

Andy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
