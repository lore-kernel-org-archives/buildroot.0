Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CD9C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 21:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B3A9828DF;
	Sat,  6 Jan 2024 21:47:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B3A9828DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3UomNeMWCp5; Sat,  6 Jan 2024 21:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44EBD82980;
	Sat,  6 Jan 2024 21:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44EBD82980
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34B111BF295
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D25F841ED2
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 21:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D25F841ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUjJzg0ZUHcD for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 21:47:33 +0000 (UTC)
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDE5A41E96
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 21:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDE5A41E96
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 406LGZXp010268; Sat, 6 Jan 2024 13:47:32 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vf707s4xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Jan 2024 13:47:31 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 797FB401CE;
 Sat,  6 Jan 2024 21:47:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0834BA0085;
 Sat,  6 Jan 2024 21:47:30 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1165E401CA;
 Sat,  6 Jan 2024 21:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAk6aPTQx5xqGQmVAIbM1q5XEHaJHafj0cMqCbHXGyMPxQ7TCqWy1/QW75HLSBjF9cY2euQYoIOm8Y7b2vlNEBtMeKa7x2EsdRWKAvlgEXwIH5FAqrBizZSh7uNLOi4E90ZqMm602XLvVLA0QCJK7/AMqfmQ0NrFy0kGaveS4ccbfqlWKjqNm3v4rD+Pc2EvVUshzVljL34iF4L34XGc13CY3KpQaf169Q2AtpPGVCC0yrCJqi5OJ0ehSQabK1S0w00SfMR6Xe9aJ/M7VgCxrmUOJQ7s5XUe8cj0DfJ3KVtnMn3K5qGdk1rHEb5bs2UFSt8siZgGg/48Wpo5NR9iOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMtid3oay26/wXT80nsmbzaDjqtoIJcsITLJITpPD00=;
 b=REku9CRKyf5oH4O/G1NR8ARCMzV9dInovECZ9VieVXr5RSkdwH5HfjVHT9tu+NoCL+3JpC8JnIiQ5VtnUNGnAiVCKhDGLjelaAYl9RorkMp/b9X/aurROnmApnAJXac+nzvNkX7WShE2J83ouGG9pNr9NuHmRWEjJiS6NhdSA0rRxwNlkv71/3WQRqmcEZ/Mup99XWWcVeygPtv2oUAxcE7xIfFnZkWdzXkW5wLecwjt86pgW6USUaAZH8sGvJa1l6pEz6aAoNaj+GPW4N1WkMbk4kG/SyOmQMPOjXiwvCMgAb+uJlLMzejsbUEM8kaFAigs8EIG09OqrOh3CxlSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.19; Sat, 6 Jan 2024 21:47:24 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10%2]) with mapi id 15.20.7159.018; Sat, 6 Jan 2024
 21:47:23 +0000
X-SNPS-Relay: synopsys.com
To: Waldemar Brodkorb <wbx@openadk.org>
Thread-Topic: [Buildroot] [PATCH 2/3] ARC: Add defconfigs for ARC HS58 & HS68
 processors in simulators
Thread-Index: AQHaP0EJT3QQCbIQ4Uaq/QNUVcQh/7DKuZkAgAKbkTk=
Date: Sat, 6 Jan 2024 21:47:23 +0000
Message-ID: <DS7PR12MB90411CB511567B9B6446C795A1652@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20240104190529.1521901-1-abrodkin@synopsys.com>
 <20240104190529.1521901-3-abrodkin@synopsys.com>
 <ZZeaRKqDAiE5m4kW@waldemar-brodkorb.de>
In-Reply-To: <ZZeaRKqDAiE5m4kW@waldemar-brodkorb.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|CY8PR12MB8067:EE_
x-ms-office365-filtering-correlation-id: 6ceb3c38-d4bb-40f5-56ad-08dc0f011108
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BnatDV/uuJcharmM5Im4zkfbmBodoJSDL2v1l9TNnCTTDwIHjfHGJE+cMr3O0mGUkfu22QpbZZ9GqdYtz0gfV1/wez7c0aqq8W9jwgb/a80yMim2itwZ4CYn0No+0U4Y/1+UGdRjS4Ja/SNErbpfYYVE3uXiYHmb60VIxXo2rQI1Ga5ApIjr5UIZQp8H80Q8hRY5ynismEAvbpoVoBWkOLn+G94IdSvFOk+EpW+QbW4lAsQHBNgnMwuZlrjYbuf4Ww0McsWfdeCra+iEyhxfWsJc6iTBBis5rHdyXsQbcoima6vcHDrWyrAs8AfQc1asV+sGLquO5LHTnbVVzSjpPkpj+lZkfQVzpPRjTL27GoEy6vmcGwMlMPeonz6l2P4PypZjCyBth89a47MHatbV7zdioJlDGScT2gxgXhx31cNyicIc5EX0Q50nSucIhYLV07fLGKOqDw4zckHCsoLicxhrhPzonMQJMSUq9s4SSdmU8UgOQUXCTj63vbaofNIV/uvq8hNYN5sIPexBWJSq5K+VjSGybH1/Q/0IdBOkFJx99pUfNUoiIc3VStj9FbrY2XDCDK2cizs3sIWE0QYqTS2/3E/GruS9gOEU5WH3HP4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(66899024)(26005)(9686003)(7696005)(6506007)(478600001)(71200400001)(966005)(38100700002)(122000001)(86362001)(33656002)(5660300002)(2906002)(41300700001)(83380400001)(38070700009)(91956017)(66946007)(54906003)(66476007)(66446008)(66556008)(6916009)(316002)(76116006)(64756008)(4326008)(8676002)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fCTX9qqMjIdpH7a3CmehDWne2bBqoI/3ljT7Pwg/YkaQ77N1X/KaL7qSEC?=
 =?iso-8859-1?Q?1wealueW81H7ziMHGrQJzqDT8wrLklDCx4PORHokoRvgi7A/4by2MsxKD7?=
 =?iso-8859-1?Q?MwaVf/qcyTu3eIYb0iph27S4DQrYmxHnqgUQ8GxfcOEdcW4yQC1wEXQ1IB?=
 =?iso-8859-1?Q?L6FqPZLWDVB7LSEj9VJuvRdrYDj59iOtqOGt/FKeukicbPHv9Gb8pZ92ZO?=
 =?iso-8859-1?Q?M3IEepDYrS96iciAXK1D3P+deSfslJGpEMoP4Rqd/QDO/q5RvC9J25kmjE?=
 =?iso-8859-1?Q?hG5ZbCX13kCZCnf1VpfnNFS0aRx8xREqAEatkd6eYsd8X2WH/C1MsqI38P?=
 =?iso-8859-1?Q?aZnGdkJ+pCl26bMRXfd0u4+MoRi7Ncp9dq2yYgs0PgOj2x/gRf/16exynX?=
 =?iso-8859-1?Q?GgeL2hebn6lJsNH0VMWCXLzIOq5rKjGU6ZAwi5gVJDb6mGAtOeD/WvNMug?=
 =?iso-8859-1?Q?OwMChr4hvRuJYmgN1PoGk77F3HtWGAk0dPzreds0zYp859GP+9aJ369I9s?=
 =?iso-8859-1?Q?Wn1urCTPI/lFHCm9snwf59rN0eroVB7NYm1z+a4iOF9YXWBm9gTnhD5oUT?=
 =?iso-8859-1?Q?5aCZVdTpQFLt+6SYHE2QdeUYGHA1hGrcjXhBlr26PgjfigoP8YQcrHqeZO?=
 =?iso-8859-1?Q?0yg9+iZdXsMF7n8SPiN8DRwDrduUM5qVvzQF8NdqklkGlhKegVTVnVrNbF?=
 =?iso-8859-1?Q?QWeiKsMiIiWoi6OLIzygwLgwuZ1zh5nKwOizzbYkmMWZIBPz8/CwyxFXeZ?=
 =?iso-8859-1?Q?n5valEAoA+9z7Cm+wDuHxYwccWAnVOXc8unbKYhUWNVKsuzQaaHSe4olWF?=
 =?iso-8859-1?Q?YOAQKXO90/shPguEvgfuCwbrgO2sOKJDs/SAHQlnqP/mYsEQvT5RFFg9kf?=
 =?iso-8859-1?Q?SE7ZN77lopeWDGK+KuUXVls3honVdOYLdWxwkVihKWIhvBAA0yAErJdUQX?=
 =?iso-8859-1?Q?QBrOZ3Mp4STeJQ2AOQNk4X2+qlkOo/x7DhHFXjuW0rRTr7iAlp4ScvWd3I?=
 =?iso-8859-1?Q?OIz/tQG1KoC9PaFLUCJSlbtGAcs2ZoFnFb85HZRCWVKInjjFiTYw5AFqfE?=
 =?iso-8859-1?Q?+6DF9HYqxqVj8fY7xvFaBq4xnm+wkAfXfYk5/cx5yBmB2ITPtiSY8UBW8h?=
 =?iso-8859-1?Q?eE6E3JDUh/+ERhu+rJQ409u0nh+4QOS9dIEzOAsF6UQiS26X5MmJHo+xu1?=
 =?iso-8859-1?Q?Dn958lnxBnIC+ITPuonjiMhWX5YiKNpz50hrnEH3/Fp5eaAIf6Syj5omMY?=
 =?iso-8859-1?Q?jV8QpnsrtE5ZRL80saf9OwkaCHSf06sQBGtDT2i87Ze+rcTxwyrE4wV/x5?=
 =?iso-8859-1?Q?ZbcTr9qqpWD+PuWTZMgRBWrtpj7e346pIpX6eeaStjlKFPONDtyVwSAnHr?=
 =?iso-8859-1?Q?6NgXUaViNY8AtUxaFyyixXNdaOWr1IRAduXxuVCTfxQP6oz+YsWxi5Ptaw?=
 =?iso-8859-1?Q?4NgALr9WU3Bvan03Beym+I7+m4qlbydOrIcrBXDqZCgSALLU9Re43DCEsc?=
 =?iso-8859-1?Q?gsH6ck/pXDi8yukhWs42zIFk6oOTa72Xn7+Do1e1UG6wIEtpKoFcBg4sYy?=
 =?iso-8859-1?Q?bMhLhLj1TUYTgvopQH2C4YyWK9K3h1qz247EYcmLQnJ720ymklzR6+s445?=
 =?iso-8859-1?Q?cybypi9B1pkABCqwNShXjf0DN4VPWkT9eb?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LU9b8xpPODjeCwStzaFZsOcJuQvd6N1nUr3VylkbpLxm8b3wyAOmtiyC7JczJvKiZAzc+7qzU3zCOsd6qEBgw2jAn2GYfZy+QddwnhYZ67mPPqOgo7ciMHaSJ44o2X9Cpbfklw9RqjMhruMXWpDk1NUMn0MFahQvHjLNmwyjKbpzyLyiaUQucaskuSRPjXzA+XUUzXHMnITB+PKi+ZW7zMO1odZc/0B60/vrH4fmXQI40Z2BE4RS6BE22Xd7GeSCtaZLP72+nJuOjmCztKSkJQleIexqymMkfob2zC1eHmKqD//C4bpvLDtLgAEHvJCPrcJreccQm9pp7avN1j2sf+PN1xAiaUJYU0uoBiXuahGIjmfdheWLlP6IbQpokj/AnDnagTiFKtgZnEQqa2DJgmAdAeytx1fWLxFf8n7QrebK5scor+vL1oJ1MF+49WQWw21silXwcrIkWUmQllryK0vMSgThbQYTRERyQ0HE4pmaVyNetBDo7Fgv8Qd2WIcC93lSOxEAW8ZeUXdLMgtzB1n8ZEqDYYaLTZ0rJhCKiUDsjFSoBlFKToismYf3g9b39gXjvLtLuP1MLOnmIhuJTRQ7tuH7VZKaHLCakkOO7bHYpm21i20dyj1kh5Vg+NyOoOTcMSf28lghXlV0XG7x3w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceb3c38-d4bb-40f5-56ad-08dc0f011108
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2024 21:47:23.4867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KPkVD0ThjTIqhMLj90kihhFIeCUO58Y/XRaCgomDs6u+d018JmTZvdR/lBPHI1Kuou85rcsH06yxvEEv3BPfQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067
X-Proofpoint-GUID: 9FCi2HIDrMD53QjIl_fTu2TaQwo6J_rv
X-Proofpoint-ORIG-GUID: 9FCi2HIDrMD53QjIl_fTu2TaQwo6J_rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401060141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=FMtid3oay26/wXT80nsmbzaDjqtoIJcsITLJITpPD00=; b=
 XITVzGtteNMLLbLAkzoOjXofEnabcRltM7r1/2AWZzgFTtYmG+D9w/Xpd2R7fnxn
 f1oDP+eJU0ugj1grNPSQcZY2bzRUA+D5RluULzX/qeLpwddKhY6w2KHbe3Cz5gtg
 E2ZBP9D9Cn5ZFSa0j+yyw+14fePsA2pj3rYV2I0/UnlDF6qEwXV/8q1gKrjCxMCR
 r87hd6rIjmWy3uCDNmW77wopwMr7Mj3sJTYJ1f3aVoQo5dwP+b/++HeyzoAkiNbi
 Q3zx96vaxlN0dTSnaIcDmTZbnQd0OIJ+V4Pfe+s5bahTfnlOPHkKpPk9MbE1hali
 3WFGbLBIgEtZUjAkWLrvEQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704577651; bh=34cVUCAA9wS3ycRvswitgZqqDVyBTBkLtBkjcEOUeNE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=hBlKos6a+xIL3tYukulCyPUxiram2Rm1r3g4MQH3ur7lJKnDQMc2H+rHATjpUOkoc
 dhqKt4GBLPvFY6NTk5RONlpZY2IMcunpxPn2Jfj6SDLd8iWCMB1b3hx0PYHjliyCZq
 gjNy9frHrZyNFXfdXWEAYBSbW20yaBJBlH9TJeUDeTleJUybNCF/NZqv2bDwidk0Tn
 CQ1aTEvCg51WjpgnLPYlFP54Vzwa1T13JONpo2crbgiNs3mbGYFO5tqHLH4zp4Y1J5
 Wtqux8CFa1zK3IyBj+tq6NgQgH6BHP6tuv97SU0wQ7yLsJRLHUcHL0BrhOFww9VQMQ
 WTaowckcvbohQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMtid3oay26/wXT80nsmbzaDjqtoIJcsITLJITpPD00=;
 b=AB1ONFHZWxwRT4KQM6vFZ6PgMBbUu6DC0gVK2tpDQRrwzKuwGP/t8DuqRm7fWk69/NeZh8Rn0qxHBftL0gyvWscFUdxWdlZnMJ8D0A8feYjDSY1HAyMp5XNSDkJrOfcXBT4wv0wDGYDKdhrc+5IpCrxq6mKKTZsMUq6Yg1XMF3E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=XITVzGtt; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=hBlKos6a; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=AB1ONFHZ
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=AB1ONFHZ; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH 2/3] ARC: Add defconfigs for ARC HS58 & HS68
 processors in simulators
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
Cc: "geomatsi@gmail.com" <geomatsi@gmail.com>,
 "artem.panfilov@nokia.com" <artem.panfilov@nokia.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "VVIsaev@gmail.com" <VVIsaev@gmail.com>,
 "vgupta@kernel.org" <vgupta@kernel.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,
 
> > To simplify ramp-up with Linux on32-bit  ARC HS58 & 64-bit ARC HS68
>                                  ^^^^^^^^
>                                  missing space.

Thanks, fixed in v2, see https://lists.buildroot.org/pipermail/buildroot/2024-January/682466.html

> > processors we introduce 2 defconfigs with instructions on how to build
> > embedded Linux image for them and how to run resultoing image.
> >
> > As with earlier images for simulated platforms it's possible to
> > use the same image with either proprietary Synopsys nSIM simulator,
> > QEMU or even with real FPGA-based prototyping platform called HAPS.
> >
> > That not only convenient, but also helps to work on observed issues,
> > i.e. run the same image on so very different platforms and see if
> > earlier observed problem is still there. That way we may easily
> > verify various platforms against each other.
> >
> > For example, if one image works on nSIM & FPGA but doesn't work
> > on QEMU, it's clear something needs to be fixed in QEMU.
> >
> > But if exactly the same though unexpected behavior is observed on all
> > the platforms, we may say with quite some confidence, that we're dealing
> > with a pure software or tools issue.
> 
> It seems networking is broken in nsimdrv for both defconfigs.
> I am using nsimdrv -v
> nSIM, Version: 2022.06 (Build: 006_FREE)

First of all, 2022.06 is quite old and for good ARCv3 support you'd rather
switch to a newer version. Here https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi
we have 2023.06.

Please get that later version, give it a try and let me know - if problems still
happen - we'll take a look at it.

But frankly speaking since QEMU port for ARC became stable I've been using it
for most of the purposes especally related to Linux stuff. That's because QEMU
has much nicer integration with the host. For example, SLIRP networking doesn't
require to mess with TUN/TAP stuff with elevated permissions, you may mount
various block devices and even pass-through USB & PCIe devices.

You may find more information on how to build and use QEMU for ARC here:
https://foss-for-synopsys-dwc-arc-processors.github.io/experimental-documentation/2023.09/simulators/qemu/

> Is there a reason arc32 is using uclibc toolchain and arc64 is using
> glibc by default?

Good that you asked :)

Back in the day uClibc used to be the default C library in Buildroot,
so the situation was quite the reverse: arc64 was forcefully set to use glibc.
Because we've started from glibc for ARCv3 as the ultimate and complete solution
and had it working. But then pretty unexpectedly we've got uClibc port for ARC HS58.
Sergey Matyukevich who joined Synopsys at that time made that as a warm-up project
literally in a week. And so we decided to keep at least ARC HS58 with the default
C library (which used to be uClibc), while for HS68 we had to use glibc as adding
new 64-bit port to uClibc could have been a much bigger project.

Then eventually glibc dethroned uClibc as the default C library and situation
has changed - now HS58 was using non-default C library.

But my take on that is we're getting more testing of things:
 - glibc for 32-bit targets is tested with ARCv2 defconfigs
 - uClibc for 32-bit ARC targets is tested with HS58 defconfigs
 - glibc for 64-bit ARC HS68 is tested by its defconfigs

If you think though we should switch HS58 defconfig to glibc - we may easily do that,
as glibc works there perfectly fine.

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
