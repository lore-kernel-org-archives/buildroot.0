Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F85CCA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 23:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE3142C7D;
	Mon, 25 Aug 2025 23:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3PxUxs-IyVY; Mon, 25 Aug 2025 23:42:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B71E42D27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B71E42D27;
	Mon, 25 Aug 2025 23:42:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E599ECD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 23:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7D306F646
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 23:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpDPJkZcN6wc for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 23:42:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.149.154;
 helo=mx0a-0024c301.pphosted.com;
 envelope-from=yacin.belmihoub-martel@silabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A98E6F643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A98E6F643
Received: from mx0a-0024c301.pphosted.com (mx0a-0024c301.pphosted.com
 [148.163.149.154])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A98E6F643
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 23:42:10 +0000 (UTC)
Received: from pps.filterd (m0101743.ppops.net [127.0.0.1])
 by mx0a-0024c301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57PGqGk51927805; Mon, 25 Aug 2025 18:42:10 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2093.outbound.protection.outlook.com [40.107.223.93])
 by mx0a-0024c301.pphosted.com (PPS) with ESMTPS id 48q9y8m3y9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 25 Aug 2025 18:42:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXKWyvW6YylEvb3pgafEmr9uoRXHpJvRTKS9CTtfiPeGgFsz28Tfr4SEGjipCXfup4trBbTZek/mEJJ21WRILnMeHpWgES+zMaubTdwi+MTaFBxpjMZatGCtDYo6RWKkpCOl0wFMwzzKohRfnrxiL6IX0vC77izeLG3D8SG/cJaiXOuCAFtj4RPRDPPzyJCBa1X4GuZWyqmdUY0Rg+N8UIIIV8C20yJUei+h5foSzoSF0ZnaLtZHac1Q9rGM4fCpXbsNd5mniEG97dTgDT35B1nyHbrkTEwRivrQGNpckkSF2zjeZaYXfuXarGrx2hN8zr6ybgsgZ4kQWxxNbAQteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvrAJmkYyXvWh0TkhxkmmklG71IUevrUerOAGWSuMVY=;
 b=cWHIX97TnYf7wwHzAp59GLp1Uc2LLiHZ32lWwhLlOOrrEJ2Y4YyJ/8WgEVz+k4Aas7nh4BLcLuaPnuAuYFM/arRcrDYs1tyxesFN+yXvIxoQDXa+2Poi7y/jBWqkaJfry/5/zXt01O3+5I7lxhDrc8KJWJ507/2jAIp4zOaSjXaeN5E2dXFzp3Am0wgKuOJbuN2qguzQ2cF2QeDxPhtrcidvvaSPgNuWNa27EtXsfMfHjaoCDcC6KGv2sVCWl+dEGRqDh3SW2xDwxE0qxV54PCCbNDvnNF7emUAXh15F2F9PzWEH41BB1FY1Awk9WAadi0RfB1uxOQ6+A76V/+fkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
Received: from PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8)
 by PH3PPFCE69B97EC.namprd11.prod.outlook.com (2603:10b6:518:1::d4d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 23:42:08 +0000
Received: from PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16]) by PH0PR11MB4998.namprd11.prod.outlook.com
 ([fe80::e321:4da6:3811:2e16%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 23:42:08 +0000
To: buildroot@buildroot.org
Date: Mon, 25 Aug 2025 19:41:40 -0400
Message-Id: <20250825234140.2080155-2-yacin.belmihoub-martel@silabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825234140.2080155-1-yacin.belmihoub-martel@silabs.com>
References: <20250825234140.2080155-1-yacin.belmihoub-martel@silabs.com>
X-ClientProxiedBy: YQBPR0101CA0271.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::32) To PH0PR11MB4998.namprd11.prod.outlook.com
 (2603:10b6:510:32::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4998:EE_|PH3PPFCE69B97EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 942c7e36-c8f5-4b65-8839-08dde43100fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e8n0vcdxV9AX8rNBi9Je1NMDfvhwQHc0byRDSLvRN0ELGXaz/fBEW8KjBHh1?=
 =?us-ascii?Q?61jQhuhdgvwvuFMCuIoSvrrU2w1YKhc7+K2yLm0uPLmx8ALdanBtPzAwIB4G?=
 =?us-ascii?Q?yjj0WGd9cHrlZU/GMOxLzyB/haI14zdb4eiIIdupbCZJEF1XJMcdNbFeoHOm?=
 =?us-ascii?Q?AqUPy8cCdcdvENtqvqbeYbYeIWX5hRNDf/WdoDu8I+mSYtmLgtw9gvMzBcKy?=
 =?us-ascii?Q?NKG2WKAtx7MyzCQJAp9khu30TBmo4wlg6V1BftQxXGepnPFo+U2IclnB9qvc?=
 =?us-ascii?Q?kFYB6pvrwn+gfEaqjybHP4z63jMxhpt7RMlOg7arl/CTEKI2D6KYqQIQqZwG?=
 =?us-ascii?Q?SsKkP/tj1cQz+Mxp03iHG2WDAwnB4avAi9mf7f/oaNiHm5v1CfemRjI9wejK?=
 =?us-ascii?Q?dHhxbKwsAYHT8vEuUZ4q+VaKIK1YG4spyr32N9zHkTWvm53luGiS5d3byxJY?=
 =?us-ascii?Q?UUhTPL0R5J/m3Zs7RlMlWVqKthpSapbv1HIFcrSqg4xGYGItYNDylLO082HO?=
 =?us-ascii?Q?KyF3RBEX/HNrPkru8Jy2IURIwIFj1DE8TGl6aQCQZ/c2WPSSJ6fBej7kngNr?=
 =?us-ascii?Q?evqi2KlhQuJOUQCtttP3l61NYUUVxBIWxm8l8MotJKHitXG2UeSmE78r9/g4?=
 =?us-ascii?Q?JQnbQfs0JiYGQhS/kZpYYkHFyPTtfeWLSqfY7+XTwTEcmLliHqRxN4KXUSv+?=
 =?us-ascii?Q?Rc39S5DCp6ScGHEGiR6uJTLiv2TIDz3UYxUFNzCDnmyn9LY8oEkUYU8MJOcf?=
 =?us-ascii?Q?oyOmf0PYRhI7dunTwlGRqHBpjYq5+GHhe6azmJzEIVe5tFcN342zjnBdF/2X?=
 =?us-ascii?Q?VZXDJrZzohiRWuFj96o3/+gnboecZW0Y76bXVy5COL3tR5kqGcBn8V504Bik?=
 =?us-ascii?Q?N5kigWfigaJ4fise95CEP8/zZZ2KwjfPvkhyceNjdZExmIEm/jKQnI3+JL2c?=
 =?us-ascii?Q?2ATgkCPry8vaDeoiOAb3spM4ZyHsjSLf7eekJ7amosPgWxgjWW9GO6zHo6ue?=
 =?us-ascii?Q?enxmJs6GrhRVIXI+RDIEwX8MCVCloY/L/gC7ekcwWF+hEwhmDeYHh02vcC71?=
 =?us-ascii?Q?oKAXmbjTngwR1v5Pc7Sz2MAYXVskUcP+8D6ZHRtN+9gdJ91cVMSXfKbPXjbU?=
 =?us-ascii?Q?EDhHw/eaCzIEP18gWF8zUPYILQF+OYRUUa+0vUjRSmAb7MtDvlPYUTQt8yXE?=
 =?us-ascii?Q?dqIQCc+gG7ye7ZQ9KpwmPL7+GMPVNz1cWcrk7MCiw72e++sMD2sIVEaPSftj?=
 =?us-ascii?Q?gGR0qzKafOrKQnVXEOQq0F1TYcV20j6+XN0YOZkW96i/fG0/bvT3QgMFg/SB?=
 =?us-ascii?Q?3x+H7xMOkA0FzLFpRkuRz+h3GSaXwdXCfBMrAJI3yzs4HKaOylvjfKFws0wY?=
 =?us-ascii?Q?pSO6qvs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4998.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?va5K6fogsfBgvfe1dWJrZWMFszXBFilFzosPlzx/jwHuA3wyD0KOsNnbmtqu?=
 =?us-ascii?Q?anU2wVU3afc/beuzKuvIaYWv01fjOvZ+O5Z1d3MeL2w7cJRXarcyzVsdgN9i?=
 =?us-ascii?Q?GDJ69kUbOkadne+H8Kb8EbUw+m//BTd43Dwj3Zh9Wxh/9aPAPoEdfMw9elBo?=
 =?us-ascii?Q?592BmWIKSYw2arBPO8zUu5+0anv0xmxYJiih+HNdp3MVJJ3ggl+8d5Pj1Qub?=
 =?us-ascii?Q?bGhSGbtrM2qVpRbL7lIO+TFcMHo+ERp9teZcsxmLWM1WgSIssQ5+sBfg+ClY?=
 =?us-ascii?Q?/vqn5EsjX/dojhjlvPijsFQOolu8BDcte1fCRYqUqMkjSBm7DgKgbaoEUsyY?=
 =?us-ascii?Q?U1TbqJZgzKdA70RRWHwnzyrfKbMY1n4TIgSR+nx/Qv6X4iKiZs2+JFcF2dso?=
 =?us-ascii?Q?S41otzI2e+BxG2PWFbTwR+ZDG4nuBsiApeTuUvsQe8+/rkc9fJ7pkklYES7C?=
 =?us-ascii?Q?/njzeZj9rfBsW2KoROaZBBtz89bjyBiz7otuGX3NkBHg+SobNEcoDuml3le2?=
 =?us-ascii?Q?FgMKM9T2GmjLYesvDH/RplnMCpdR0Hd9rvOtO5tlje/Kzxm3c8iN7WEf0h/2?=
 =?us-ascii?Q?heMp495HDmLtWPAXhpwpST/LyRqlCyPUeRj3W068HgFFjSOFdjFuQEiKp0WL?=
 =?us-ascii?Q?91zgyIvHxvq5LGC+FIwVnwqyyW5OqY7BRVDfPy92HyjHkGSy+8M3wfG9lRAy?=
 =?us-ascii?Q?bzvGvZLyk4xY4jpcv7rUgBuHUhEs+CMncv5fL+QxxLpzBcos9R4NnTQb67Lt?=
 =?us-ascii?Q?xrZ7wi+yg4IgvPrleaTvVkB23WKnudmbOhKByEoZChjtt9nfPWAWhDRPnsme?=
 =?us-ascii?Q?wPTJujFpDmjY5VjfVc9p9iA8u4qx0AfEg8zy7StAP6lmNJU1T0RhUWYwt+rk?=
 =?us-ascii?Q?2ilriiMUNW4ZUxNf7pBS1DF7Y0gsH5D88MBoMCWTC6EcCWyE08zOL2xzLWXO?=
 =?us-ascii?Q?sdIRVfTH3svhrJAHA3pyr9LQ/NOeyyL15/zYpKmMUTI2xyK5XsHt3xtBvi+l?=
 =?us-ascii?Q?aeK1fkQYjs/jdEkf4rJBC/T9DnbPBO5uEA5V5u63jUU3kwVAsUN6s5Gi0FeO?=
 =?us-ascii?Q?iEkCm8icgefNBbTkQG5ZOF07Uq1pOmGdGyPou4vfSYz2SV5xDLr0JkDlez4C?=
 =?us-ascii?Q?wuDYbN4i4L+PVeKr/8qskQPFORLN2rpL1n/uySg4NMOVvgkOkgFMXidYWXJ8?=
 =?us-ascii?Q?o1ZJcHgB/7jKA9dXGtn+BrGaGwmKg6h9IjW6bonERPs+l7tl1bZ5R2xjj7be?=
 =?us-ascii?Q?upIyCiBLky1YNVvm3idkrS1M37WQnFRxAR+4najl2lTh1F3MXFsjHlHei9rz?=
 =?us-ascii?Q?LQ2nClYA9RhYWy+fqht+1UMre4Fafb0CYEh5+nVsfaw8pZdKI8ehdZktWck1?=
 =?us-ascii?Q?q0lYnk0CWxLVjHI0PFaPg/FDB2zQWehb8XjEbv9iqBOey/56QvLnlWpU8ZFP?=
 =?us-ascii?Q?8yLhDCsDVyw4bF6ETBdAGHrD5Tbt7I08ULLrnB4mMQgSvhvUqNhP+/Vfv2lm?=
 =?us-ascii?Q?jSdhgbtO39R77ib2/bGBqOER+hYOOJaamvnULl7EBGR3xKlZo6ZD56qNHBtd?=
 =?us-ascii?Q?LJgRciv/7G/c2Zv1HcViGQ0pu9av7ErgIszxdFeLYz0XYzWSEvoBLlF9ZqRc?=
 =?us-ascii?Q?f2SSNWz2y3EnWLYHlnrP0FU=3D?=
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942c7e36-c8f5-4b65-8839-08dde43100fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 23:42:07.9746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acmuQuAjC05fuZZ/03BlLCl92a5MHEGjFmVPKYQAggV9aKMcSfoxTsKL+3rZhqW58+KeAC0RciC/DLK8ORlInA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCE69B97EC
X-Proofpoint-GUID: ez4GH0MwgRvMBGFyIhyoh3KJkRCd8lpt
X-Authority-Analysis: v=2.4 cv=Fd83xI+6 c=1 sm=1 tr=0 ts=68acf4d2 cx=c_pps
 a=XL6KAwzBRdtyn7N5rzO1KA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=i1IsUcr2s-wA:10 a=NEAV23lmAAAA:8
 a=2AEO0YjSAAAA:8 a=Q7dcJNShv6juRldcqtIA:9 a=0lgtpPvCYYIA:10
X-Proofpoint-ORIG-GUID: ez4GH0MwgRvMBGFyIhyoh3KJkRCd8lpt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDIxNCBTYWx0ZWRfX9bU4FVECEdXn
 BpiuHjqWLqYCuJfq9rAxArPhx8cwx7MKQjELIR3VhEBT6D2r9LkwYmI2fBzqiOlJiGQgzp2y0Vm
 lZwAPlMw2yEESfPwFBILlzyJi+3uy/EUzx3b9+b6mytl5R2EG7aj2XR4D32KnXWKoLufgm2H8hM
 77C33efHwipfwDMvbVPU6MRTNEt0gIhfoqyGROMvzJZ2Wgzt+AHS3TUkfZkVy93/XqyJNP/3B09
 DaqRjjPollSM5IxS/fTHATL34XfiX9e0n6LaCyEVlD4ipISBpwVjhQZGx5Ys+um6YxBgS8y+g2X
 KW+1lHEfypMqz3FhEYMqSkzQnTciSLzCCpqpV9xlIMvEwMZsCiSLfEyknPhyzk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_11,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pps12202023;
 bh=RvrAJmkYyXvWh0TkhxkmmklG71IUevrUerOAGWSuMVY=; b=jHr5ZSu5hDHR
 EsD0ywCDnVaU+V32iGGwm8A/E2DXVQAwHk71AD3UscuOxBDn0u5W6aQhGPJdbnms
 95XUIhHtYw2fr1I6U19ZHNqBOEhIWYF79xjzWX5QOUE9yMU8+67rAzsk8c9++d/P
 dtpodjQpJNpvqYjazb08tLh0kV0mmpQ2LLaHg7O2bZMd893rhdxrvVbBG0mj6TJ5
 Klb1x7H2yIrxJ/EBmuHZdYoT3OE2/Q9Rum3u8ZuEMzSi88tQR3oniDbCvXKE+WDC
 dZKdh2rS2qrZTbTp2RGwEN1yvWzB/l840t4okubrq6N6fmJQJ/TZWpVoR/UwsVYs
 N9K9uSG1ng==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvrAJmkYyXvWh0TkhxkmmklG71IUevrUerOAGWSuMVY=;
 b=CBaKzDTzyi3iu7XRlmi52R/56x6Hq2g2KsQrC+BzObgnH/ORXFr4woYG8gFNFlv4lgKSipg3LsuwC1LOgMme7vyiD+m8jx5VVgvN4wF963/QkzPHPGck2NuCVAcjmMD/AOMhbqa3+hrZSRCTWVNdZuA6Vz8kx+kgghvwkpQt6Y4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=silabs.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=silabs.com header.i=@silabs.com
 header.a=rsa-sha256 header.s=pps12202023 header.b=jHr5ZSu5; 
 dkim=pass (1024-bit key,
 unprotected) header.d=silabs.com header.i=@silabs.com header.a=rsa-sha256
 header.s=selector1 header.b=CBaKzDTz
Subject: [Buildroot] [PATCH 1/1] package/python-pyroute2: add missing
 python3 ssl dependency
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
From: Yacin Belmihoub-Martel via buildroot <buildroot@buildroot.org>
Reply-To: Yacin Belmihoub-Martel <yacin.belmihoub-martel@silabs.com>
Cc: Yacin Belmihoub-Martel <yacin.belmihoub-martel@silabs.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pyroute2 needs _ssl from netlink.rtnl.probe_msg [1].

[1] https://github.com/svinota/pyroute2/blob/4205dfbcd0fd4ac7ca78196a83f411906f5a5d72/pyroute2/netlink/rtnl/probe_msg.py#L5

Signed-off-by: Yacin Belmihoub-Martel <yacin.belmihoub-martel@silabs.com>
---
 package/python-pyroute2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyroute2/Config.in b/package/python-pyroute2/Config.in
index 9e685f9d1e..ad84a4ae4e 100644
--- a/package/python-pyroute2/Config.in
+++ b/package/python-pyroute2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYROUTE2
 	bool "python-pyroute2"
 	select BR2_PACKAGE_PYTHON3_SQLITE
+	select BR2_PACKAGE_PYTHON3_SSL
 	help
 	  Python netlink library - Linux network / netns / wireless /
 	  ipset configuration.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
