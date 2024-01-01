Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8C7C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 14:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A84260BCF;
	Mon,  1 Jan 2024 14:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A84260BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pmzut-2DK_GR; Mon,  1 Jan 2024 14:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83E75606A0;
	Mon,  1 Jan 2024 14:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E75606A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFF2C1BF35A
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 14:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B81ED606A0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 14:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B81ED606A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bq5Or8kYqLDt for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 14:47:46 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6836760595
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 14:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6836760595
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 401EbIAk005638; Mon, 1 Jan 2024 06:47:42 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vajqfnd20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jan 2024 06:47:42 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EB2F6401C8;
 Mon,  1 Jan 2024 14:47:38 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 9B03DA00BC;
 Mon,  1 Jan 2024 14:47:36 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A0B6D40169;
 Mon,  1 Jan 2024 14:47:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGXP0uue5TQZ6DFINg+XrZ9UWzWCF15U7L5nQIONH9H8USmR7ubWGUBdbIsAlAE3/1V4BushfZ6fUW5vFh7ljg37q4f1FbBZiUdbQ0cZLTcsXyHXUOmGNtt6x0tIzUGL5QrOFQMYl+FGP+uwIE+J303nKCPvVeA3MWA6QTFGzHeCTS5I0WBjCyidHdW165yUmrCDe021MYL7DyVHOtvffV6PLII2kle+vcLUtDr/RbMfzM61GuNxQEQNzitYjAHdLDikyi/cwOfHdYLhnfKvghNxY/T+L8y0uur3sLS+EIRYIQFeFFPDupBGJqqhCHpxNj3zG3yeVLMAjhhukYEvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2oO3O7zd4E/33itpwrmm2UdMFwrL8quT+NkWFLdZC4=;
 b=ciLc9wvbj8EaM5+GywEFpDbt0ukFnFUvUwyzkn1Ezrwqk4T0YLQYT+NeGOR2saZJPEf6fLEKWeSMSxpAknvj7YvM6t9SWHcW4W/wSpgdlY/0dK3XI3TeadhLQ4ITjPQIvUGypSW2bSC+UN7/M0KGL6I/tWSJBp75KY+cV9cGwOfyZpmSDmvPubd3zN8NGI7iBPl9iNTzG08arGwcFirMdl/nxmsHACq0EofKGDlEKS45yV29zpzcA6HjTY8JMkgXZEmMAwzJvD+CoSJRt8HQP9PJGPY9RwQXROtRdWHN5buzOgr17670EFO85aewf4tNLQAt3rnG5UloJCI0SaWdZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 CYYPR12MB8992.namprd12.prod.outlook.com (2603:10b6:930:bc::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Mon, 1 Jan 2024 14:47:30 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10%2]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 14:47:30 +0000
X-SNPS-Relay: synopsys.com
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Waldemar Brodkorb
 <mail@waldemar-brodkorb.de>
Thread-Topic: [arc-buildroot] [Buildroot] [PATCH 4/6] configs/qemu: add
 qemu_arc_defconfig
Thread-Index: AQHaPCfajs8H6qhwkUKdTtgOk0FSD7DD78SAgAEauDU=
Date: Mon, 1 Jan 2024 14:47:29 +0000
Message-ID: <DS7PR12MB90412F6E4FBE2387F715BC76A162A@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-5-wbx@openadk.org> <ZZHOxLRXJ9U8apJA@landeda>
 <ZZHjRSzIb7WUnhUo@waldemar-brodkorb.de>
In-Reply-To: <ZZHjRSzIb7WUnhUo@waldemar-brodkorb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|CYYPR12MB8992:EE_
x-ms-office365-filtering-correlation-id: e79ac558-b466-4c39-ca39-08dc0ad89479
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uwc/+3ro+Fp5FjGlmIQy5uyNMLLdq4o2Wj+3I6cY0Q+wsT6ENfBkRsGIb1ARNsE5WChV22Uq+YeWPAEFietbAwkzumeER19plKNo6yyuipjw9tASZ6CFeGhXV7hQ0I0md7VKnSZ+9VKtsUiUlgAkHbUXGjUJW8XA985ldheBo7M0+dm+ZCdQDxNfeoGUKfHk6PQYqaZtK+wePteDqQ8BnzpkOLfrU6lysf63Nr74Qhgikt/+9cmmk/rL3AF1Zdm17A61HoaNVAwe8oBUs766StjVKKpJu2lRMgnxDRJvWhHDuzkCTUN5/hZax4eIeUVisDtnPdEm+95RjQ5trUdz8RJkziYfy0hEXKW5qp+tdFqCaCOVR6jk+sXU8hLedxLnujJMvwjXaRPB/Gc98kaDiolJ2rv7+RWnLbg+Jl6v8Z9AaPkgXoPb52X+CLRlFxH5Qwwy1b4I8pGTukr3LqBamj5ENQTRw8DoQnUB1ePsBTYZaJzx2APIe24U41q3bmNXUpRuW/ey5omTPLV8mN5tUMShT6FYQHrlLZkkf63QXIS3uQNNL9D0zirptlyXmxqL0yFbDg3A10ek6tZAi+o2EwsTEAfsdHvV5HryhmlmTud5Bal4XZA+6SG3/KyynI9lzC2Lg2RkD/uCm1NvEreeLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(26005)(83380400001)(86362001)(38070700009)(38100700002)(33656002)(4326008)(52536014)(5660300002)(9686003)(71200400001)(6506007)(7696005)(76116006)(54906003)(8936002)(8676002)(110136005)(66946007)(91956017)(316002)(122000001)(66476007)(66446008)(64756008)(66556008)(4001150100001)(2906002)(41300700001)(478600001)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?684EIgZPjEYICLnm6CEgOXyYgAS90ZZZu1bAI6zqR4IG6hnNP8prDTtWc7?=
 =?iso-8859-1?Q?sZ/56JKQ4GzEqFM8qa8A+H/mP9y/0V6xs1Rz3JgPlXY7zAic81yM1YuLrS?=
 =?iso-8859-1?Q?sdvVHLUG0eRm3nhCKnuo9JOykNAW9+4YI3zt1pxS5vUvdDhtK/GItNKSdr?=
 =?iso-8859-1?Q?elxUaargYg1vKH+K0FTIxJBOUQFKwHSsefjSPfiyZ3SDXwFpo7DpBW64/W?=
 =?iso-8859-1?Q?VzkeU0rX4ZIg0NFsXtINY0gYpFvNLwi5o28vN9VBI+QzsMBrYADEbOQv1i?=
 =?iso-8859-1?Q?Ldquu0jQT77zAYG2ed7PrILdQv6l1qa5Unr2aMqLq6xdmdeUP3Xxxiv3hE?=
 =?iso-8859-1?Q?vBCbuIvPQFJiEOBcXafKkt7QsW1XgfWq3dXAnk8cCF41ZJiHtxMg2hWGEC?=
 =?iso-8859-1?Q?T3kp842Xv7rKGyBllKV42yzcagE2PlokDVCkQAtBfZVVkAgdNaX0Uv1BDR?=
 =?iso-8859-1?Q?gGo6T8mqWndQG6My810sYTx7thjZAbYOZFRSnEFcsmLYIisXnRDZu+EyFf?=
 =?iso-8859-1?Q?sRlMwfcfma/781pywN2RbtsrSapgEWXNcAOwnSNFZ/JVoi6BXS0ij+VoVj?=
 =?iso-8859-1?Q?tlFjDbbc2HoJQmX4b5yJR7vuVVdnu4rWpv732cMsXmsg1dkQgL9rV7shsg?=
 =?iso-8859-1?Q?dxT0lxTCIayKq/U/93Jqn3sfwk0Xuwic9k3r6MvvZ/IZa2fbWFj71XO0Lb?=
 =?iso-8859-1?Q?OfPV4CmFp89VPxkq73nQh6qQ/ipTXFliw784r264Bkz3jA2LYtDt98aO6o?=
 =?iso-8859-1?Q?AWeu3FUbN+EB7DDSbx2+VOPOi3Hk9S3ptDW4xUdVttN1Kty3H45CpY9Wlh?=
 =?iso-8859-1?Q?XF4BK8E1KMhOYCtRPhqjqeVQ7gBtLuywcOy9SJ8cmSouxj/XmsN72dEMDV?=
 =?iso-8859-1?Q?N4TU4gcZtqMSDfsUTQ060HzlotxFPd91CRYODfMbdzn3ZAQt80NA8KWklb?=
 =?iso-8859-1?Q?GMs2Y48U8Rk8h9eHNk91oOsoJKDcXcPBWpp2Uudl6tprcJ5PRQo7c9zt1f?=
 =?iso-8859-1?Q?YGbM+1F8MxATHoMkV1BPuJ8by91JQIfwTD5GEKzSj84Yiv+Q44l0PeJCIs?=
 =?iso-8859-1?Q?qcefMm8wn9x7JCjKNgjtUayhdKeaK/eVSERf/Sa4XxZaVSwBEtpfiYt1NN?=
 =?iso-8859-1?Q?jpvCyWWSeNwp+a4vQn1UE+jAUMYleVvNZdxhoYQLfLDHUtwpQN8sJ59d5i?=
 =?iso-8859-1?Q?5Wu7btmP+8z/5PPrGCyAP8j0GyhdekQyLKHXtD35RifYcVBKDykucFM4TT?=
 =?iso-8859-1?Q?3UzMem3v9For2q18mWTbdmslzD+g/s2oN6YO07OFxOpEadbt745JIOw2Q0?=
 =?iso-8859-1?Q?E4aVrtMom6HYQJc2UZoYuqFuxvuxN2J2eRf3mZma29ImWklUa4ElvHCA+r?=
 =?iso-8859-1?Q?TVoEMsItPYpIw5vXc0cYye0IRDO0Ef2zIe8cqz9kEcBdGkuXMwkMecTMr6?=
 =?iso-8859-1?Q?uGCCZ6Y0PcM9TeKwvk7jgMJMvws8GvLBwpNHWRrkQxnB1MJ/q+yEOWEKEB?=
 =?iso-8859-1?Q?nvitcQpufMSDcFgE6qQcd6A33QzlRc412YcbUvdcddI1ZDc5dJ7rWPmUQR?=
 =?iso-8859-1?Q?SDoDwmFLvARrEcwPidD/Sg0tqMTe+17VeiOnPQxyis3zoH+YOoytLoCAiJ?=
 =?iso-8859-1?Q?lYyePijldNSc3hzzxfxgszTuYV3wZy7MPL?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: b8Nhgf7fqeY/cwZUqxKBzHWzJwD9GW2TWs/pocCJ8UkejG+u9R8jn4LtHx8uY5l4hSPUPVGtKvVEd8AcxTmMWAGixnTD9eFX7ainUSjd/GdInZEGXv2s8SAg3sjQeGhAe2WSb1BduUgzmIICjU2Bqz61zUWWfHI36WT8V+lMxkVlsBt7PIbiRdEzMYjbD0adGhsfVXaLvR79YQ2z/1AEK0bxPqY9GNhpNCBv3vB4DposICE9gx8yGysKF6MmKg60mq+ps+B5a/ZoHwTPn8kNBVay8WBJ5dZau6FKHPZSLhJlBSSuR/SAeiJVflVIuyOwjFpdGGzxlyuNL1hVEtNh/Px1sePFhkE912umEQcdjjQNTXKQeLbf/wF0/37IDvemukNz9uQN+0G+h7wReqtKf6NiNwn9ekzApgP5LE4SEwoIkkjKlZF4mL91VRlnacq6PZZJH6E1l+ahTAmoYlsrO1LDF9TU9OB5891RAR7SYLfdcG99H1+tkRIjb6jzj4e60YbdspxnmiZxaEEXkV0WZTgBOWWPpAEGOWX1O5+9lXD3a6jjbz0IbM1yBruQ1Pj74pg/Xt7xspCfsV+RwtpvxEfAQ76Ea8nHXLgjhOinfHYWMHYmrmAJUDDI4QTL7/vUh5XeHebs3Hcc6jIGrrC8Ag==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79ac558-b466-4c39-ca39-08dc0ad89479
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2024 14:47:29.9543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+xnDZ4ZcfXz+wnO5yhNNNIdRWMMTWl3vCp1awH86H/REz8bXWT8X7nA3+/KS4kZZvOpUa4TpqgHwQN5pgXckA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8992
X-Proofpoint-ORIG-GUID: bw3XUNFz1vtgL8oI_AAl1y0SLViM-unQ
X-Proofpoint-GUID: bw3XUNFz1vtgL8oI_AAl1y0SLViM-unQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401010119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=C2oO3O7zd4E/33itpwrmm2UdMFwrL8quT+NkWFLdZC4=; b=
 KfaylAIwgDQH6m1QAMap1P6IuBrI6ru+wm8ADgxy+E31XN5ikUKNgHaoBdgmTM+E
 eZVFwl2/YZH3k7hSVf/i0oHCPv+3nsuyRooMTxLafmFBEGxTwvkw0Qr6/9bTkQaU
 NF1s0yOZ8iVzPrZY5x+Bi0gN6liZTFLQ20Nerjk5xReRHkgmUbtvfsD49y1n9tbV
 EMpysa02ZBYvHsQcpTrnpJ6xbBs0cVgsUbOnTH4sWzakNCJ/9lzeJ3NzQuzTCxJA
 WFZ1R831bvudBywmeiFfnAzYJzvv76kwx2aoGOqftqBiRClApuO+TgnzMd17ZRjJ
 +knK6bSF2sVaIITxWzkP4Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704120461; bh=C2oO3O7zd4E/33itpwrmm2UdMFwrL8quT+NkWFLdZC4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=fpU0gDZJ4AAYK+NgPTM3FsvIIuNs/ccPObBFT18gul4PTQYF01TPu9DEGo+ETrjcV
 cJ3eUcz1vhSRvLCm30KDuLWitf52O5/kS4SbP6vDEPwmuIAnRE+xHK66vy0fb0F1V1
 jlpMX4Qr89dzyycbsSjQxPwHBOrnHZ8J/5+KFxkJxQnQLXZGeYROWaGg8BX59N3pn0
 GL8tm3W9wdTeYUJNbsB7qlHVAJfhXsCwWuGnbxhM7wYeWAJjTH6Z854CbUTgYa2F5t
 SIzKVQelHpmuYOrJX6hT3mvNUJxLQy+JOFDHGYmMtgmmTAcGWTL04coYnS5MuQvZ7I
 iAwDt0MrLddnw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2oO3O7zd4E/33itpwrmm2UdMFwrL8quT+NkWFLdZC4=;
 b=gNwSFSdnNiCmZx/nlgTEhhhi6HHEmT2m7sjshh+LzHKgP1Z6dexo5/MKAl7q+L64WXQKMiucGldX4h9gWapewpy4p7eNJh3+ktOQxCKDx10Mgbwt0Ub6Bj93tjg37ZnAWUnIryhGfUaxA4H5LnMl0Z7JqkGhr7tHl5P1rTid+Lk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=KfaylAIw; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=fpU0gDZJ; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=gNwSFSdn
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=gNwSFSdn; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 4/6] configs/qemu: add
 qemu_arc_defconfig
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar, Yann, all,

> Yann E. MORIN wrote,
> 
> > Waldemar, All,
> >
> > On 2023-12-31 18:25 +0100, Waldemar Brodkorb spake thusly:
> > > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> >
> > Add a bit of explanations in the commit log, especially given the
> > following...
> >
> > > ---
> > [--SNIP--]
> > > diff --git a/board/qemu/arc/readme.txt b/board/qemu/arc/readme.txt
> > > new file mode 100644
> > > index 0000000000..93bb9c2152
> > > --- /dev/null
> > > +++ b/board/qemu/arc/readme.txt
> > > @@ -0,0 +1,8 @@
> > > +You need Qemu fork from here:
> > > +https://urldefense.com/v3/__https://github.com/foss-for-synopsys-dwc-arc-processors/qemu__;!!A4F2R9G_pg!fgGSAQfVckRuijplS-p83y-PGaKlg6lK_iA1kW3cneXd4lEGQc_FCtOb5-gwAhS2NWDw2jkfqPDZYkeaBQ$
> >
> > So, we are dropping all the arc specific versions for the toolchain
> > components, but we eventually introduce a defconfig that relies on an
> > arc specific version of qemu, that we do not even package in Buildroot,
> > so that users can't even enable host-qemu in Buildroot.
> >
> > That is a bit sad...
> >
> > What is the rationale for introducing this defconfig, then?

If there's a pre-built binary of QEMU for ARC, can we use it instead of packaging
it via Buildroot? I.e. what if in Buildroot's Dockerfile we will just pull-in
a binary instead of installing it via "apt get"?

> Qemu is more widely known then the nsimdrv. And I think when ARCv3
> support is added to Buildroot it can be used to test it, too.

Indeed, with QEMU we'll be able to finally enable runtime testing for ARC as there're
no license-related limitaiton in case of QEMU such that we have with Free nSIM.

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
