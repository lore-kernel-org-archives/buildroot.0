Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4832C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F3A9400CB;
	Tue,  2 Jan 2024 21:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F3A9400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aF-NLdOT3Cyn; Tue,  2 Jan 2024 21:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5010A402C3;
	Tue,  2 Jan 2024 21:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5010A402C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1DA1BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13A32402C3
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13A32402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTSl2nmfk3TD for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:55:25 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 898B2400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 898B2400CB
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 402LoiEA017985; Tue, 2 Jan 2024 13:55:22 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vajqfugaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jan 2024 13:55:21 -0800 (PST)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 828D2401CE;
 Tue,  2 Jan 2024 21:55:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3A496A00A2;
 Tue,  2 Jan 2024 21:55:20 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9CB8B40525;
 Tue,  2 Jan 2024 21:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYoo3oRai1bUnYRHt0KZuBTA0tu2aIiTof+lB1f7PesNiVgZNkZTv39xKh/mXSfSc2uizecBoLhQrUSPR79JCcwSyhPHg0RNAZizG3c2OpmKeVroAZyxUNJAzSUNBalU/XCIaPqFyUV/Rx5Kca/auN1W9zn1h4wnksVsm6b7P2ROqgGZ0Xy5VqjGXLSB2RhlCG17u1TE69Rk7wwajh3pg7VkvfIW7A6rnugkRFKLmxQCE8HUuPo/QfF5JH9mx+aUlyfPsXXT0sJVBfXAQExQR0r2JSSlDY2zM5tyjuQUunRIm6+cM4WKKcfVc7Duvg5JcnOCGrKvEeVg6GP+pG1sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7Dus4v3JXphp2Qq1OcJCfbAfYFYoJkXJ3nMJGKpAGM=;
 b=QV0aIvRtN1D5xHrhKKAsnKrv++BoqBTF1k3uOYn0UEeRl+NsD8I8XMqMkGPnLZ9YLGAcCQ/LkE1NERuO9Zy+dfc8VJDfrpvqBj5G8ETtkbOf19uxle7nuYJEIoWzjENH+c8A79z/6DseQXh+Yx99ABMuKwmmEbNwF/dAq72pVVxaqBXCHmw1cYmHjNNg9s/HlJq5bB2lgnuq2t/v/v5h3s5Ox1PIY9FlrfmazSXsvz5e3uR638MhkvbryDv5fKx+NbCR1nfBnk58dR5TufToePxqk+50YUEBpV7ZRb/RSvBygNG+WfyBDSa0tvBWfMkCSjH2Ct3pBeeoPKXRsMbuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 BN9PR12MB5036.namprd12.prod.outlook.com (2603:10b6:408:135::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.13; Tue, 2 Jan 2024 21:55:13 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10%2]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 21:55:13 +0000
X-SNPS-Relay: synopsys.com
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH] package/gdb: Remove special handling of
 libstdc++ for ARC
Thread-Index: AQHaPZQutoVlLcl6I02iCV0TgAZIoLDG/lqAgAAPZu4=
Date: Tue, 2 Jan 2024 21:55:13 +0000
Message-ID: <DS7PR12MB90419624B8739BAF541F133DA161A@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20240102155552.1902447-1-abrodkin@synopsys.com>
 <ZZR2I87QpH7JFOpp@landeda>
In-Reply-To: <ZZR2I87QpH7JFOpp@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|BN9PR12MB5036:EE_
x-ms-office365-filtering-correlation-id: fd3e4f11-9147-4098-adc7-08dc0bdd7f47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U3NiSa3c6g4kZEyf6zfUTrSTRNd9InkOt6IrCTHSEbCRXACgbrUKofvSHW1yHlP0xrmxLrLb3XUza1Sg9geRi5NDeIGCfrJJtABg+e1YWz5F/BN8OwzYWAdLC3SslK1zYhHORDzScu8VyHCreznnuJ3Np8oyxK6oxNgmsCvF8bc2m9ldth5cGgUkGYox6mF5jfK6cv7mEvOzvdureh4ABDnnU8dgb0I59UX0eQXDaEc+YpKqfNsdAmRfafGdZQWnNb+ltSYvA37dvIN6w0RJAmTY4zxGfxLuzLBIGFk1zc9oi2WSIyLGs5FNIZHcYN/uVN6Zg5NCVwAX75NyYLOQXFmw1biO7QHEEN8qnU6p42N+bVrJ4sgQmW6wHpXIO0EjXsYH0RfCCiDZOEK6E/j4pIjb65rfL615D81ZrGOid6do1XJFcg8HNh4JWVe8Q132PepEnALRXsETI5cJ9RkLvTLWaaXU8W0s1J7BYFxA7xBF/UjkgaPt0hOnEePv9j42H4Xal+fNx4sXX5y+slJsj/mior2ES9b/0OZUDgpavXCdar7U/gOm9g4bUNbDvljtFy/Xlo+0CKaFRB7SQ8zJLI8fWz+7v/hY6AAWYb+iN3SVoU1UVDWTXWSqmYHmh6/i+fCBor6EsWgey3vupu6MmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(122000001)(38070700009)(55016003)(86362001)(26005)(9686003)(7696005)(6506007)(71200400001)(478600001)(8676002)(316002)(8936002)(54906003)(52536014)(4326008)(66476007)(66556008)(66446008)(64756008)(76116006)(91956017)(966005)(6916009)(66946007)(33656002)(41300700001)(2906002)(5660300002)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FmDSZ7+acJXqmoIeAZjbSqLQa11p9bK6dHhePSNZbzBOMVar0ZdjL8i5mp?=
 =?iso-8859-1?Q?optNXm+ibfrGV08Ljcs9sg+dX5143KaSF/omMrOHU4CNusEi401Ie1Q/Tm?=
 =?iso-8859-1?Q?9RN1TExfMgvpLH3PvT6jgBx3j136Og6FlZ9lb892DPGo91CVnSvoqClWUI?=
 =?iso-8859-1?Q?G+d7YJoiRqgreZGF14uJ223LAqY+h2OY02x3E/J0B3pqqul65wSRRZpdMc?=
 =?iso-8859-1?Q?LP/pciRruNEDz+p57iNuCOEXUL+squAX+9qrAtFuk2qkrqhWpN9CX8q7LV?=
 =?iso-8859-1?Q?66UKHHyipGMcc2tamUMOTrlpW2aRqBQwNXXwPwS/cEPWRZvReIHg6PbPj8?=
 =?iso-8859-1?Q?8ORjGrBec2pmqejyYjI8iVhvwuLFpH6iUOyuReKHUdaOTS1p3FHi+e61UG?=
 =?iso-8859-1?Q?cEQ4rCAcH06behAi0wDAQu80me/x+POE9aAu9s+r65/pq7fCnvQn1j5mSX?=
 =?iso-8859-1?Q?Imf057gjipjhb0lbhIduNZ6BWKAgN981F4/vnPgCZOlTLpBKsLy3Qnzucb?=
 =?iso-8859-1?Q?YVc7mCOIcP4TvddsaALMZDiyrO9WpZeKzbdYkIP8vjPTnSm3G5LmixH3x7?=
 =?iso-8859-1?Q?HFtnUmqZIHithsbU6VUHbQcwVyxTrcbqMPwtr3+xlU9Jbb5liNu8aAVRrC?=
 =?iso-8859-1?Q?/HEehb0bQZHlHB/fktFRSh5Kf9npgUExXVYdUawwytwHYpTOU0GQmnJKqD?=
 =?iso-8859-1?Q?EQYUbHvrIyUb7WxAbkEj3xX7ZgAhivhZtGukhwKAdDPVVF6jsWVOjqr9pD?=
 =?iso-8859-1?Q?qy5WLecq4DjchQ6bJDCHTb1h/8ikFbbZJm35IWjmF9sdGQpVN+cSEYkW0V?=
 =?iso-8859-1?Q?SBkp3yiDhEdVzh8zunfBz39TMoSGyjUDOyMK5XJNcuCguOQCzAayKpvlEO?=
 =?iso-8859-1?Q?cDKLtPcKAErZtjG4gh78w1MZ7LJGsb+8b3J502YpWmMCC2ynevEqozLD2C?=
 =?iso-8859-1?Q?86XOCtQx/CsnxI1VscJbQT5U9/6OrUOQvI4dhNKeA7kqQzQJagfhJs+Dts?=
 =?iso-8859-1?Q?jPMu+z8NE4bzOkjRLMX9/LdFFBVLX/x02kOwBrSKF5ui18UTLNXO+Wq3A9?=
 =?iso-8859-1?Q?3Ll+FRUOW0ot4RY2Y7uhR8nyYijMof8Fhoh9YuvkrJ/5x5JNiCVoF1XF+t?=
 =?iso-8859-1?Q?gat0tYZz6YJgjvx+cCLIVA1/+7mGz1Ivo3aUzUYSmk2WHE3J1kXohu4U71?=
 =?iso-8859-1?Q?XCDsurhmJbQ//YegtzVKVi4QZiCTbL/e/xHEHoRMdJMHVBhKo9AEYMF83m?=
 =?iso-8859-1?Q?4B46ucm8gGR4dEDh7bghqV3nNdwCP5+txL1hA/QzykwBOZuu43o9oGbhS4?=
 =?iso-8859-1?Q?56FmgrKCiaMy6wdPeECP4+tfG9D58B7U83+9Cz/R1zKoKteLZhrmMt/g6m?=
 =?iso-8859-1?Q?J31fqDcW7AyBetPOv+61YnvmdLU4kWHFqEZ30KkHV/kGjoM0WP9q+Ee988?=
 =?iso-8859-1?Q?PhRuhRQbmhaX02TWzwhpnNnQ2V+4uM2dWBZMFWv8v6B9uS7QJowx7o8qu9?=
 =?iso-8859-1?Q?LiIJB33HjCGEVJdb8ahuwPQHPAWyC05wRxbY5Wx5Vi3XPIaOkq21T08M7U?=
 =?iso-8859-1?Q?ebQ/6B97bFo+A4FoGgODb0ATu2j7l9Glft+lz4UHhHMGgmX+loNBTyUa7e?=
 =?iso-8859-1?Q?Npq16pgV7C0AyZNS3v8D7ZAbrM+m54Ilio?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jr9b/o31nzMcduUiLA15ou6husv2T2Dp0V6njEXL16kjJBTnx2akmzpeEw4DWbFFQHeL9xb4pZoGq7puccE2hIo1DZTQeB4fYTUWaTlzVC6YRO0dSVRnNnpUDrANwJ1WYaKScJxh6vBHEUNgOYKkHLtHV/juGuANDVK4fm4izdED+wpC+3cd1DpPKpJAfdoptg4LkyDJglNJfC5+08dinB/vyUDzMGiHANa+LcAceEYVDEwqyPoO6r+IAjiAEBwO9Q6G5RIKnQYm6sRh4VJUhmULGrlbmSYH5GguKAuT5d55NYbP/8PYLMckC4C1gUfUCyU3bxMiHMEtBhFCpcWMK6H8pP3IjPjtZ2o7ez8H+QQMWzw4oLnq8IJ+PSngA5ld40+BFNX5y0kgx2f4aMw60eL1GybR0UsFwMxsLM+wylnIHWjQmxLKnD/T6fpCtLSbhY9AX1r+UjxwbC63LDpUVv31Gf9QlDJu2aXAcl01T7R1A5SxMHikvkN8JS1nnDqDTp6Wf7uxqUwFaeneZWHWEqVIXhyLDriETjuVNLRNEkI2sKzGNBnxUoK4fhUjU8A57nUGLKJ+3jRcbwFpTF0KQ9ONHwKkUtGQcbUGyhmPNOuMQTn45vMtxfp8ziePwYYWPNm25UUERuY/zA9etB3fig==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3e4f11-9147-4098-adc7-08dc0bdd7f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2024 21:55:13.0800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdGvXUz6UbfUjQVqC3SYNjgMt5FZlYvO/kjdHCyW3VNW8CZ/YKdaGcKC6vFUWuVetWqYzTmBUX7jcnkvY2UzyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5036
X-Proofpoint-ORIG-GUID: fEpSDfUxlimsiQT5fRbK2TCNRjw8JeV-
X-Proofpoint-GUID: fEpSDfUxlimsiQT5fRbK2TCNRjw8JeV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401020162
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=O7Dus4v3JXphp2Qq1OcJCfbAfYFYoJkXJ3nMJGKpAGM=; b=
 So/qj9IZqpOgnIvGs7Nw6QlZmKYe+nieOHbJNPRuadi8hTh0F74xQHx1Hyj1+cft
 ljtGOnp4+/uRnlMi381wrIZ6ggbxk3pQ7GDiPApRloBurPGuOa8ISnQRYPfvmyYI
 ynZYlJQqsVrEpHXk7END/YkkFBrVbb6IcPM8AJoEdEDK3DQz6Ec1aJ3TfHjyCRL6
 SbDG30UeNy3YjRJnz5B4kH7l3mFi5gIB30IbGBFId95I5HvnPOrYcMO1no3p1Mfu
 AUs2NGbrssnxSUlgLvd2tWCrzaF91LfNIldJn2KTEnOIrXP/CCTxx2qDp0TccL56
 PnoVYEe3zQOy4kapcI6Ing==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704232520; bh=O7Dus4v3JXphp2Qq1OcJCfbAfYFYoJkXJ3nMJGKpAGM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=gq5eOXNFmRmWijliLbpXXup/qZMkPGCwWm31ae7EWBJqCjhsu107oeMjWW6Hc6Icd
 dop/tCu42T394W/SfYYzMBNLfLIQkstQsS6tFtYU+ugCtzP3cHJdRO3B23/IFHzmui
 tFXhA5AQoA3rBL5CabhjciNHaVTOD27ow8uIatqLKtnHlmM5wWKIrT0BTlplmZAcFs
 TfOjSJcYutD5Gk5emwJ/k4BvHo08FR/9BKEbCl2UNf2spBRo4/BCoUFKLxYottZhrP
 R2dEfld58cOXQiFU0Ckr8nDypLwN3Tx2xOIudb7S5NnnSQbBW+0us1m3TCXURHtZzT
 5Yvobzyn9znBg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7Dus4v3JXphp2Qq1OcJCfbAfYFYoJkXJ3nMJGKpAGM=;
 b=vkQoQNA14myGU84lnyZjx5CD/J62XfW2uplyidUnWPSeTGAk3faaKTcH6SImssVESnds3xKxYnN/yCuhrN9j9IMDqgl1ZOj6bsP2eK7TkLjr0W1fIAvrbCr4yObJoVVaVjuTJkyd2KFrL10k2RVUDZhe5UmMusF51U5YOyRbaLE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=So/qj9IZ; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=gq5eOXNF; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=vkQoQNA1
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=vkQoQNA1; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH] package/gdb: Remove special handling of
 libstdc++ for ARC
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> On 2024-01-02 07:55 -0800, Alexey Brodkin via buildroot spake thusly:
> > Effectively that's a revert of a very old fix [1]
> > which is no longer needed.
> 
> It would have been nice to get a better indication of how much time it
> has not been needed anymore, so that we know wehther we should backport
> that to maintenance beranches. ca99d0ea925e5a8 mentions that it would be
> fixed in 2017.03, so we can certainly assume that it has been fixed for
> quite some time now, and thus we can backport this to all our
> maintenance branches (2023.02 LTS and 2023.11).
> 
> I forgot to add that information befoe pushing, sorry.

Well, indeed it's been so many years since that fix and I'm sure
that problem is long gone.

What's moreinteresting, that option "--disable-build-with-cxx" was removed
in GDB 8.x in September 2016 as since then C++ is required, see
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=cf6de44d75082116865a85cbf94db2632b679361

That said it's totaly fine to back-port that fix to stable Buildroot branches,
but since it's not functional (it doesn't change anyting in reality) I'd say
there's no point in back-porting it.

Moreover another use of "--disable-build-with-cxx" needs to go away, see
https://git.buildroot.net/buildroot/tree/package/gdb/gdb.mk#n188:
------------------------>8-----------------------
# gdb 7.12+ by default builds with a C++ compiler, which doesn't work
# when we don't have C++ support in the toolchain
ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
GDB_CONF_OPTS += --disable-build-with-cxx
endif
------------------------>8-----------------------

Do you want me to prepare that patch or you prefer to quickly do that yourself?

Regards,
Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
