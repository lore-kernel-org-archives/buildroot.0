Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D13C369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DC3882ACA;
	Tue,  8 Apr 2025 17:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVAneNYF0TEq; Tue,  8 Apr 2025 17:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 623B280F9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 623B280F9F;
	Tue,  8 Apr 2025 17:48:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF52AD6
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC1FE60B33
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cYaAwIYLkx7 for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.183.227;
 helo=mx07-0015a003.pphosted.com; envelope-from=ian.merin@entrust.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1530F6071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1530F6071E
Received: from mx07-0015a003.pphosted.com (mx07-0015a003.pphosted.com
 [185.132.183.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1530F6071E
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:48:05 +0000 (UTC)
Received: from pps.filterd (m0242864.ppops.net [127.0.0.1])
 by mx08-0015a003.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Hh0lw014855;
 Tue, 8 Apr 2025 12:48:03 -0500
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
 by mx08-0015a003.pphosted.com (PPS) with ESMTPS id 45w8ep80n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Apr 2025 12:48:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6XGgeqtF7xWlzqm1XhO9dP75InIU83JPKllldEfaQDGdQIL3cJ2kWfHPvSG66aMjO+s2bkmvnoa7huYfXBI6HUp/k0/2+X1a28z4W9F3FJklCpPndoeh9J78qRTdMXf4fbUbviSr/REJXFzhP/NKUjJZMLFb9MI7248UPQONX+HmAdoMH2jyeb12JJ6EDP/VjIRAWWIcIlLltEeKTQpXXxQmgUs6Jye2pJL5nN3SRJT3a9sq/ScVD9SwfmIKaniU3OT8tRLlTMXPhnJRBFSAOqUiLD+SFJrrZ6xugILbYYYt/lVSpPsar9Lp52oopjlYHBkAbkr0jatKXf5+ig9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQi9EYebhWRiNlv0d/9tfmYv7nFZCeVLP+2H4aSMrEI=;
 b=HXsweFHaeYSsEtx2qXD1HokqCV7LzMr5zXBsfWqPJ6AUDsMz+r9Lgxtawz4TulaZUc2OtzULCjhsIAi8csioxZHFVT96/WvcMuqZ6QfXNdcRyvsZTBWkh0bd6dYECrVxua+4NquQcCCRYK3vdP16hBXC0IixJ8Ec2cNEbHEc77hYMO3SESuVfe9bixXYtq8U6aP631izAmXAXeqC8W5rWTnHtJAZnOvPtXvqbG6ETelpkBv8TBmlsrKHtJg5MF2DgmHYKwhiV7UgbBv084ZH6hlxgSQ0GRPbajVtueyfOHsAUYVPRpVoN/nPqFQNJ6eh57eK3MmExe5GNot4ZkFwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=entrust.com; dmarc=pass action=none header.from=entrust.com;
 dkim=pass header.d=entrust.com; arc=none
Received: from BN7PR11MB2788.namprd11.prod.outlook.com (2603:10b6:406:b2::30)
 by CY8PR11MB7314.namprd11.prod.outlook.com (2603:10b6:930:9d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 17:47:58 +0000
Received: from BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834]) by BN7PR11MB2788.namprd11.prod.outlook.com
 ([fe80::949b:9d7b:ea0a:c834%7]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 17:47:58 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "angelo.compagnucci@gmail.com" <angelo.compagnucci@gmail.com>
Thread-Topic: [PATCH] package/apparmor don't reference libapparmor variables
Thread-Index: Aduoree7xfoPzXm/SM6UqVN8q5zFYw==
Date: Tue, 8 Apr 2025 17:47:58 +0000
Message-ID: <BN7PR11MB2788A512245CC5396C83CD8CFFB52@BN7PR11MB2788.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2788:EE_|CY8PR11MB7314:EE_
x-ms-office365-filtering-correlation-id: 51ec0563-53ff-4de8-3490-08dd76c57ff2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|13003099007|8096899003; 
x-microsoft-antispam-message-info: =?us-ascii?Q?V4xwvNAjotaxSvNkByjpoWRP5UtUrkDLlobPVIHV7eRVK6cvXsFFuUx3KXwp?=
 =?us-ascii?Q?Vt/FzLZU9+fT0Bb4B6qRMoQiHcybeSUJFSOnqDicLS5mq0FCfm8wpphs/B33?=
 =?us-ascii?Q?UR9sKNE4rqKLCD6Of+JUHQY35sNpPVOTn+0fcZMCy252EXGvPuldH3yGLZ+P?=
 =?us-ascii?Q?84oN+IxNDCrqO5Ztl9t/gwjuWV4pNaPuykvGEuD8q/c6yyIGsJcRI/zabois?=
 =?us-ascii?Q?xYtGif3DoNdPY//Nw9KKRJgEiMlPavFHQwBu1UbkFdlnP/btN2NIzVlIGnue?=
 =?us-ascii?Q?MwDOE6ZaGh1Ldw5wEY6wKlW6NppIqK6/EUBD+P4LEibqcHmdR3NqldxJBkDl?=
 =?us-ascii?Q?dG77eYQdBBze1YQftsV5xMhSrf8GX2FA+mt3ndX++mRVLRy0jGfIKSrlZ0DQ?=
 =?us-ascii?Q?faizLVG1YvDj0OtPdEOVqyVQTL6pteL7BLKbXxb1YsV0lsr9AtNC2Yzm/L+B?=
 =?us-ascii?Q?s1ChHcDyeT2zGXJvnGBbdgFoyouLBOBoHMyLvG628FPB7yf8xrFsUd31MYop?=
 =?us-ascii?Q?/E1s9+hwIt8nMuP+OXS+soYYCrsAExjUbl3ndrVKA91FM/MdBkfonWh6I+fE?=
 =?us-ascii?Q?bLhNGyRdTXdZE3fPWFf6zDmDx3EWHa3ZVGLIol1LcGcNBmqJBCcFYHnvkRZs?=
 =?us-ascii?Q?cZVHs79OXxcmIlgY1gBwfTL6cdjKW1lXLglKY42s8SjA2GaoNAhLhmRsScGR?=
 =?us-ascii?Q?WIixXllbilIELjz5FMQ7p3SFqVCyvgF1+IasLwy4RFOJBXOX+0D1ESMwdO8r?=
 =?us-ascii?Q?H90TDu2FxojD75i70Q6diyEDnGlvYEQDUpz9ktOSnuqWovEmpKFot7c+iRre?=
 =?us-ascii?Q?eDh0Atl+BxXXtFGtL6HAkRg1UlLlbn9WrKbFCbSOMdwbS+W85os+3Hdd1Av5?=
 =?us-ascii?Q?XkN1qvXkoZXAFvamBzSN+vBPjTpU9Bw6/8mDzZ3eTfnzPoTgqMqeRAnULS+z?=
 =?us-ascii?Q?UCCXe+AefigobxmWeJKAhN5a0xDbuJpEbweyWL5LegNNOhLEI818Vyw7rCBw?=
 =?us-ascii?Q?R4Zhtker8jAqcok857ISMonRfd8UszCkkFwnkhVwIDYw2Wp9YstpsQENp1Ag?=
 =?us-ascii?Q?+g/yMdbqoC2y/511H5/nLc1vzEo6B7CSSsc43mdXPWKU1mVYU/qj2avp12ZB?=
 =?us-ascii?Q?5YBni4sF3y36ofKysVZL7X4V+MIygcTEKXVdKvci+ZOlnRgrB75T5i5MrasN?=
 =?us-ascii?Q?/Yu3MdQuD1oO2vTk+n0EIiLOyg77MFWEN+CsayNpg2PbEk+90EyTxRat9gr8?=
 =?us-ascii?Q?tft8jgQZbxEZA4VBVxJFwd1qhTLPK7oIJ+mzhew/CIh4iAZMdNy3/5lFB7Lw?=
 =?us-ascii?Q?Bt42IFUqLeu7qfTZarwAK0T8jLYzydc9RrmJfNZIQ1UDFkt6blQNbUwUMQAa?=
 =?us-ascii?Q?ps36fK98mHTB3Hq32n5xXqNq+fkN9av5fm2cQ1MhXVWsWs9EBaUIDVYbVaU5?=
 =?us-ascii?Q?dLQrGIK0orEJ8sLhiqqxw26cizQtyNBp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2788.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(13003099007)(8096899003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BmTFgBJq42h53AdMA+Wxrhi0uCn+IcnK8he8t7i1moapGiIOkl6ZWVpU6BUi?=
 =?us-ascii?Q?G2Waway75P875WbH1LtNIx0XZ2Tb6EogaEE7onN3qNOBhgh7fCV4jxyzCHmB?=
 =?us-ascii?Q?S0XECzUuBT4fnmlXy6XTAM/AS5uek+qL6o2eRD07svdiR1tuG3qCvCl+FE0V?=
 =?us-ascii?Q?aBmyF8Mq/WJ2DLXyvuGNappjyHTWJe7lFTCsp/kHFWVhk+nSirz/csVPkWKj?=
 =?us-ascii?Q?u9af95aAFiZ9TpNkDHhfRi4alJ68LnNOx3M92w4OZ0aCLEzQClaeHwPlkIlm?=
 =?us-ascii?Q?0jKE2/yfh8W/FuKV0v0WON3P8j0rxW9YXXPlyNSEoA8UiWA4NlCVVCyD8ZRf?=
 =?us-ascii?Q?tT6SgYHccA9oFk6ufVa//cEOzLbQmZHXq41rIxStWJzsiYcHvH3FXIkoXzNr?=
 =?us-ascii?Q?su2gep9NuT6UdKPVht8XEQPkWTFNRW59YIZnuGhlnsYM+6SRu9BRtHhMxNaS?=
 =?us-ascii?Q?ss/UuxZCfx2n6aboQ7AuMWQpMZ8fl3YIYqilfsIaskDeb+nka3B4q+U3pMOq?=
 =?us-ascii?Q?TvnvCMvgA1K6JmzatKSlrKZevHwkVO6IwrLZ4dMmxRXVgJgtVjWLCUEVMNF9?=
 =?us-ascii?Q?uWtMUOV6FBVi1Mws+lFjL13JCnJ2wtiTXPq+QgBhh6wzeqevPRmrfsTk+7Ow?=
 =?us-ascii?Q?S6IEGLH4M8YWeByKuSF9aimpUPnq60QSylOjFyYlm3M8jwlo4sBv9p4HfX7O?=
 =?us-ascii?Q?AnsQLAPIdiSlv3yy3iyQHChItRa3wCX88WG/Ms+vq65sdkb5gNhw39SfxMrc?=
 =?us-ascii?Q?zAOiLVCCB+maVcwzeWj3eCZW+QrLacaHVd+pgSXhHZhlnxFXnRErvgMsWr+J?=
 =?us-ascii?Q?jrw1gh7shBnZsuRqWGcDrM6oVhGqwe84PFaNd+WeHuG+hT6keZGWoB4Libcv?=
 =?us-ascii?Q?2fAFFN/7B0vsdX+q9W9kQvy0oS5+RC2ZPwyC0mSUEB7/RqEXEQM/QLEWXRWW?=
 =?us-ascii?Q?RyZh9JpWlstd5OF2cevlyd0OWegG/YBgbHpBsJ8g0nltpLeA6USt3Y4veSIe?=
 =?us-ascii?Q?PMxGn8JFoGv7N5kvmI3kPGO5KM86kSh/H3OTzOrPL51cW7nkRybdpr9QsdK2?=
 =?us-ascii?Q?S8dsEPXt0tTzZmSwsMSoDhJCOgAJxrNg8L+QxeCO2GiBaYB+yqPdFypIZrlY?=
 =?us-ascii?Q?JsU18Ya5MYJN6RQxtbqjawOYq4lAXw//5nFeUnZVN72FrXP2QxsOp0u+GffP?=
 =?us-ascii?Q?gntfS2bbBB7YC7aF0acjDL/qAcS2CmoPSsJX/KzO87v1yaBfeIvgL/GaPy41?=
 =?us-ascii?Q?ZE/eylhMZmtCOxUrJwprJP5CTLUFC3+UYpdCYCEy3uJB2mP6obEpX1J7Uz6f?=
 =?us-ascii?Q?fWs+kYYbrXbmXq0I3ccLscIfr0jIsodxNMhwoVrQ51GY5GkfZ1RLJ+SyowZF?=
 =?us-ascii?Q?bGGhB5hUNuAASqvZIeLgxPP18MGtGqeJgiwO2zrZu3VNUi73G1u+kMrsIH46?=
 =?us-ascii?Q?IwqkNeZe3QGlgAp33n8Ri7uk/+G/AQiY9CA0K4k33pVa0r3nlYF18XvEI1J0?=
 =?us-ascii?Q?3N6EzlmjM6jyIsFj6poImD7BovTK9qXjbRshYHwayyFrolA3kj6RIbM9PE4J?=
 =?us-ascii?Q?tV+EdQf+iQBQr44Apkkya8tsR6To4E+ZEMSyYDh1?=
MIME-Version: 1.0
X-OriginatorOrg: entrust.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2788.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ec0563-53ff-4de8-3490-08dd76c57ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 17:47:58.3094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f46cf439-27ef-4acf-a800-15072bb7ddc1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTY8BAn3oaDWcbrFee85g1jnsrGu9m0r9y0bj/x2cwqgao53JP1vqVnlkmta6ztFffbFrMSjk/GZQW3QS+OSrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7314
X-Authority-Analysis: v=2.4 cv=S8TZwJsP c=1 sm=1 tr=0 ts=67f56153 cx=c_pps
 a=0XndbtkAAnsFgPxdSZG6GA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=FEbzDYiKvWYA:10 a=p0WdMEafAAAA:8 a=XDZnj_NiAAAA:8 a=2AKXuCRHITmR-kV7vAEA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=_V9747d5aIr6gcAV:21
 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=Kam8I3mwdY3oFHMCdhp_:22
X-Proofpoint-ORIG-GUID: kkr6g6Of_8TW6FY0M1HQDxzGY2uNHvEs
X-Proofpoint-GUID: kkr6g6Of_8TW6FY0M1HQDxzGY2uNHvEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504080123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=entrust.com; h=
 content-type:date:from:message-id:mime-version:subject:to; s=
 mail1; bh=WQi9EYebhWRiNlv0d/9tfmYv7nFZCeVLP+2H4aSMrEI=; b=M74mmf
 grH2WDUkb4dmuMYj3tlLsrutzVl9VdXZ90OXUfZqG/q1bRlKY24b3FxIddLAiRPl
 sG3YOsRHhO2dXr1tHrgBivz+1Y5Qq7lHnqMVgPDm2KGeZgiw97mJBZMCRCe9Uz4Z
 V8s0kRamXQu7yUG/CHwmAyhtxSUnBfW2/Y1uaGdXaGChp9H0dIeNx9dWE5kf0zNI
 4SNmNSgpnB+8vqeSIjbwswvukN8siE9Xelzr1kSNPT7o4ROVLtWZLoIBguzuN44P
 UKqUL/K1nDxmCF6CXnyiFFoZbmYLacYPhaV9IJotgPMA1IgM4TWXvqv2VqU2NUIO
 0oSQtnZ+DUJt+BXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=entrust.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=entrust.com header.i=@entrust.com header.a=rsa-sha256
 header.s=mail1 header.b=M74mmfgr
Subject: [Buildroot] [PATCH] package/apparmor don't reference libapparmor
 variables
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
From: Ian Merin via buildroot <buildroot@buildroot.org>
Reply-To: Ian Merin <Ian.Merin@entrust.com>
Content-Type: multipart/mixed; boundary="===============3253988023971729179=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3253988023971729179==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN7PR11MB2788A512245CC5396C83CD8CFFB52BN7PR11MB2788namp_"

--_000_BN7PR11MB2788A512245CC5396C83CD8CFFB52BN7PR11MB2788namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ian Merin <Ian.Merin@ncipher.com>
---
 package/apparmor/apparmor.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 61e62c7515..20dbce6f97 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -7,9 +7,9 @@
 # When updating the version here, please also update the libapparmor packa=
ge
 APPARMOR_VERSION_MAJOR =3D 3.1
 APPARMOR_VERSION =3D $(APPARMOR_VERSION_MAJOR).7
-APPARMOR_SOURCE =3D apparmor-v$(LIBAPPARMOR_VERSION).tar.gz
-APPARMOR_SITE =3D https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPP=
ARMOR_VERSION)
-APPARMOR_DL_SUBDIR =3D libapparmor
+APPARMOR_SOURCE =3D apparmor-v$(APPARMOR_VERSION).tar.gz
+APPARMOR_SITE =3D https://gitlab.com/apparmor/apparmor/-/archive/v$(APPARM=
OR_VERSION)
+APPARMOR_DL_SUBDIR =3D apparmor
 APPARMOR_LICENSE =3D GPL-2.0
 APPARMOR_LICENSE_FILES =3D LICENSE parser/COPYING.GPL
 APPARMOR_CPE_ID_VENDOR =3D canonical
--
2.25.1

Any email and files/attachments transmitted with it are intended solely for=
 the use of the individual or entity to whom they are addressed. If this me=
ssage has been sent to you in error, you must not copy, distribute or discl=
ose of the information it contains. Please notify Entrust immediately and d=
elete the message from your system.


--_000_BN7PR11MB2788A512245CC5396C83CD8CFFB52BN7PR11MB2788namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Signed-off-by: Ian =
Merin &lt;Ian.Merin@ncipher.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">---<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;package/appar=
mor/apparmor.mk | 6 +++---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;1 file change=
d, 3 insertions(+), 3 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">diff --git a/packag=
e/apparmor/apparmor.mk b/package/apparmor/apparmor.mk<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">index 61e62c7515..2=
0dbce6f97 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">--- a/package/appar=
mor/apparmor.mk<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">+++ b/package/appar=
mor/apparmor.mk<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">@@ -7,9 +7,9 @@<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;# When updati=
ng the version here, please also update the libapparmor package<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;APPARMOR_VERS=
ION_MAJOR =3D 3.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;APPARMOR_VERS=
ION =3D $(APPARMOR_VERSION_MAJOR).7<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">-APPARM=
OR_SOURCE =3D apparmor-v$(LIBAPPARMOR_VERSION).tar.gz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">-APPARM=
OR_SITE =3D https://gitlab.com/apparmor/apparmor/-/archive/v$(LIBAPPARMOR_V=
ERSION)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">-APPARM=
OR_DL_SUBDIR =3D libapparmor<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">+APPARM=
OR_SOURCE =3D apparmor-v$(APPARMOR_VERSION).tar.gz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">+APPARM=
OR_SITE =3D https://gitlab.com/apparmor/apparmor/-/archive/v$(APPARMOR_VERS=
ION)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">+APPARM=
OR_DL_SUBDIR =3D apparmor<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">&nbsp;A=
PPARMOR_LICENSE =3D GPL-2.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">&nbsp;A=
PPARMOR_LICENSE_FILES =3D LICENSE parser/COPYING.GPL<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:11.0pt">&nbsp;<=
/span><span style=3D"font-size:11.0pt">APPARMOR_CPE_ID_VENDOR =3D canonical=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-- <o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">2.25.1<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<i>Any email and files/attachments transmitted with it are intended solely =
for the use of the individual or entity to whom they are addressed. If this=
 message has been sent to you in error, you must not copy, distribute or di=
sclose of the information it contains.
<u>Please notify Entrust immediately and delete the message from your syste=
m.</u></i><br>
<br>
</body>
</html>

--_000_BN7PR11MB2788A512245CC5396C83CD8CFFB52BN7PR11MB2788namp_--

--===============3253988023971729179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3253988023971729179==--
