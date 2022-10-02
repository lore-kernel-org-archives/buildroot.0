Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D03C433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 15:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9B6A4042B;
	Sun,  2 Oct 2022 15:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9B6A4042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LPzij9AeNxC; Sun,  2 Oct 2022 15:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBAAC40223;
	Sun,  2 Oct 2022 15:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBAAC40223
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B7EA1BF3C3
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 15:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F16BC40223
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 15:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F16BC40223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-AGNSrCjdFp for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 15:24:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C1E440184
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C1E440184
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 15:24:25 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2925xJBE018086;
 Sun, 2 Oct 2022 08:24:23 -0700
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3jxmt6kt8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 02 Oct 2022 08:24:23 -0700
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 533EBC00F4;
 Sun,  2 Oct 2022 15:24:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 3EC7AA006D;
 Sun,  2 Oct 2022 15:24:21 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1198380073;
 Sun,  2 Oct 2022 15:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3RnStZnB4QNdDzqoFDEGuf9KsX5fl66ollHZgtsjmMVjHj5nnmRFNnuM7RNqZxEpD8NpimWUbJo05Amk7EmpaQCuH8jg72bGjSmqH8jcEjI6WieCBJNzJOrPMjshh1g70xuU6vyQGfvLX5w6u5G8UBA4ESbClWY+EkRm9fpAw18N6qBzICxoA1Ptj0bsoQwRWm+Zsg2lmgU7Iq4WkceQLSs4Gz1/ZgKpQOHAIUSY5Tb1GCC6K0OERUecihNLgrxUCg910KJyg0V7cEI59S3VpRY3Rgud/MmuCQoXmcmQEyUcmQL2JC/AH7xx3NiY6SU8AarDPcCP3JcedaaNpq7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbuGizTgc1TUTY4PRk44U2eWBM09HiFofz4lMu762ds=;
 b=eFg5q3A52fJl8NMdbt5BvIPU6zt5M+HGKqhxQALKkO3JWjxSdoBZuK1+QnJ1tCyFR3RoknlIndBX/t296grh/lm8wFtlpr8C+ypOl2NBZma0X0Om4VJ6uDtHT4i5LV4ZWHVyQg2aBn1+uVKSni9vddzyaOVkoW+2eknTpMkfVLs/L7w3uqRIfn8BySVllSazy65PowuF/5gGFPNQHGvm+hB8iEw9Fa259AGSvotaA+nNMNaasMIJ8Z15+qL/F+elr8oeCvL+JyA6ZfaD1ncV5Io8kbAlkh8R5Yz5W9uSFfPPgnDKbxdQkaqQnOcfjCAermiQHbtN9e8/T76FmbbyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Sun, 2 Oct
 2022 15:24:16 +0000
Received: from IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::48a2:6a6c:62ec:90a6]) by IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::48a2:6a6c:62ec:90a6%3]) with mapi id 15.20.5676.023; Sun, 2 Oct 2022
 15:24:16 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [arc-buildroot] [autobuild.buildroot.net] Your daily results for
 2022-09-30
Thread-Index: AQHY1Ve2/kr9KROIVkus09g9MmbZka37NSIv
Date: Sun, 2 Oct 2022 15:24:16 +0000
Message-ID: <IA1PR12MB62101CDE60207D49C8BDD984A1589@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <3jt0wnw0cp-1@m0098571.ppops.net>
In-Reply-To: <3jt0wnw0cp-1@m0098571.ppops.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6210:EE_|DM4PR12MB6085:EE_
x-ms-office365-filtering-correlation-id: 6a42d635-aedf-4f97-0dc1-08daa48a2b20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lZ/CKVudGKlR2PRx6hjR2y5GRvMz7At7yzVyrbG8FbUVH/UMu4f25oGcxWiHoB8MVnY5khCM+Rn4p5HmA7jhArVlzyNV+HX2Pz6kqYu9tAUW9q6X419hUqXVVBREHn+NfwXIM8fZ2CQywUfvQwf6wulyfVg3WcQT7mPL/z/6U1pO33ukB6uH/HX+HewmQPze+9mP5nhBk9ybIRLxrVhVYm27v8BEMelcUNwxR5V4G0R3PRhgWxb4Z4jy0Tw/N9ny5moFGIKpcP59N5iAckt0K4TJTVFBSB02kQukc7+stK6J/oui68aet9wzB2cAlFFCpwgr4C/Ar4j1kBxqHU+ZHsJy8DHuiszoFI+z6pstRupewuL3XUn6E23HChcm4/2PDPcYWX0B6p/WK4ME3GCMKHO2CeUrNiVj4/8j+Z52eGr00roTumoIrRDMWTPjDMhQdC0nh56gPoWvOnkOnEGENad5CtOA2I0XDnSzUdQi6Z5hHyJb5frXkQQy45lWWgoqPBEqVHO6CPY6OLGWGjKz9AAEMAUSDpl2GyjhAKeBKMcw18+a3zWr0/6HbGSSZysnPoKniqsy3yIXFGsntjeUHYPrNIpciQDSkfVGwGTHop63ahfkUFatFbo1iV8ERzQK2sCbYNKEXze/ln9hdIvCsgkm7qEaB60QhAAw1JQIdzFlsAUTlibupQY4FOr0OC0HY+tBeymInNh6aQKgJ24XzcYcVw1ueclIICloIreI2sYYebJ+fglZr0CfKAIM/O10ezglXUCUVUsor49ew6WCb/Q57FknBPGRDQX9j6QuQzCR5sWLpq4btB1etUMulw5XcHHX4STfqTVScFBKLDBE82P6KG8LhwKw7BpjtXt9TBsIeunrjeaL1r7y64/BSp9a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6210.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(396003)(366004)(39850400004)(346002)(451199015)(8936002)(4326008)(26005)(6506007)(52536014)(9686003)(66476007)(71200400001)(66556008)(66446008)(33656002)(5660300002)(2906002)(91956017)(64756008)(76116006)(478600001)(66946007)(8676002)(38100700002)(7696005)(966005)(38070700005)(83380400001)(41300700001)(86362001)(122000001)(186003)(316002)(54906003)(55016003)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?i/ZqRPwadQwDCwim47wyx1OH5WnW9UjwEX3MkaYQC0+9u+S1/Rl+88Uf4R?=
 =?iso-8859-1?Q?DG9K9U7Bxz6BUurROXPsVmMA3nYpNDLKkm5GgUrMukOaJUmB/4ou/xhQst?=
 =?iso-8859-1?Q?Uh+5LbEvj8EhSrkjyaei3Mc32vdgNe0qH709d0roxGlmLU7034i4U540N7?=
 =?iso-8859-1?Q?bdlSuhS3zRl4/MH8EpivtyThBEBnvDBYnUVKjyczV8COoCBeil8mV5kvow?=
 =?iso-8859-1?Q?6VObyhVWTzyYyiqB3mgjagSss/BuMIdUeNCd/FnXna1XXj53rY9VskKT4n?=
 =?iso-8859-1?Q?UiVfoNWO/7Zn9y635SutPT13ZnLXShEWU/OyGEBPhTVuo+e9z884BbWxNM?=
 =?iso-8859-1?Q?wx2jmyjAkHeSmzhz4lOctXPxZ/Nv0ukwB34qnrgwaJnB8fk7CvOJ6IcRKc?=
 =?iso-8859-1?Q?RP940dlVfMb4bTpPHXusuICMnW8XUK0FAdXo4s93n5Hb2cM5mhv4G4usiO?=
 =?iso-8859-1?Q?D5eAWgrAg3vovsylKVpJzdhVREjBAccRr9EyI5goMhS7rRQ1stHVK2fnm4?=
 =?iso-8859-1?Q?NRhBluP4m+KiAkCUStkb20aXZiQUFLm4WZ3Qiy9IPchLbTCMWSIg0r9co1?=
 =?iso-8859-1?Q?BH/9rQOWhKYSpnvUpBuMC3RCwsWGf4CgE6vx1a8R5IuEIpWqfrUup9DSEY?=
 =?iso-8859-1?Q?63ah5TpHNUKKL0kqGgSBGEk7hP+WtN7HKiagdYhmma9gVPiv4udCO3gwlE?=
 =?iso-8859-1?Q?zv6SLHY2LQsNNA0qNAVXG8wenO7qlI5Mu3EisH9CP5/cr/ovsQa/7sNEUX?=
 =?iso-8859-1?Q?LeuVOrVQD+uE+dePCyRhqylON/9ObBAf0KhDcT5TNWRQY7BL4iPPkiBpu7?=
 =?iso-8859-1?Q?JTw/QVOwrzZNjBrxXolN6BAhJNXfhenWRB2QtNCzyYgN5lbPVmGt/ebVLU?=
 =?iso-8859-1?Q?ipMEVnRm0hDXZNV/pixwC1+n4ML+/cezmF/QW3gjCOPhHJkYfndm5n3OLd?=
 =?iso-8859-1?Q?OvKQW/5DF2ixn/IU0tCBHsFp599ssT6dLymEH8yMvWTgu2HLug2JOn0FQE?=
 =?iso-8859-1?Q?3MLKkLhpcY/J3LJuyJ2SaHkZrG5F49yWCWoBVma39pvDRnm02hgkw+i4T5?=
 =?iso-8859-1?Q?i2zD3YVgQUofh9zaWeVqtvF746KRdYZesFTa/O3yDZ1PIr68RbUOj+LjTY?=
 =?iso-8859-1?Q?Ol6MROsSgaolbp4adpX00igGxKwsiiHi0Q8Hhcsz068tODN0B3L3lUF8r+?=
 =?iso-8859-1?Q?WTdVSpslyC0UCsrweWBDwOsT8PQuHbi+9ik+6Z5cUtOCZCFdmZhYkLTH3D?=
 =?iso-8859-1?Q?gqEATXZuNMMCCXVhDixqDDxab0HXhLe45HL/n6mPnKHbGo7oOx/mJT4Yxh?=
 =?iso-8859-1?Q?GZ9Pq6UTVYAE1VpmgKJVRd4yU2UQS3v84wa1XGEARdkaIXF8HGktv/AUui?=
 =?iso-8859-1?Q?6Y7uLnddHIfXzsKcpi3zN4DtTS8njuWXiDWKjSH/sy73Xao6Qqc9tfx2sT?=
 =?iso-8859-1?Q?w1xBJ65a55IzDcbUe7tzVkLqQMHPwY1DrTjOT0QTjGOogLMZ5lr9oUCXgV?=
 =?iso-8859-1?Q?LjxyIG0YiFp9CwKauzcDef0Up1vHUGAIin6H6KLv5nC6eBdjSAN4VSkrew?=
 =?iso-8859-1?Q?4X82WF55Z7VN0WTePkuoBiz1CN0gDXDj6AaVYV7jUP1MKdzZbI8oN7XdwA?=
 =?iso-8859-1?Q?ugs6jrugjDsaIshoJ1LECRR1FrAfqjspZt?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6210.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a42d635-aedf-4f97-0dc1-08daa48a2b20
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2022 15:24:16.1997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vXD1XcA52JNW7F4yjjDtPnfPWYH4X5XruC2kouESXMMpjCP16I1Hoblnl4NktY/DfMyejhyL5Fgvvs23eMD2KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6085
X-Proofpoint-GUID: NGe-Qiex8eiI0Ua0gxl9RNM5iumA1o7g
X-Proofpoint-ORIG-GUID: NGe-Qiex8eiI0Ua0gxl9RNM5iumA1o7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-01_15,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210020101
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=mbuGizTgc1TUTY4PRk44U2eWBM09HiFofz4lMu762ds=;
 b=umsIVIYmzs7TwotXqZsZkpdxCSHcOWl9qUun972p/OXiOyV37YuFW85BL2sP3WWm4+yb
 7dp5gNr0GZ8/FzKkI6vueDCdo2hbAZi1U/3V+73LrZRk+KCudMzlGMHTyPvL8mzgMlDW
 OCBW7UhZrZ4hvW6QU0Riije0cZH6l36Dh6TQ4DZ7O8fpDyFcFOSKf3OHj19Xb8psE/nZ
 fW4uS3uJtoZcldm7H8JsBj+cJX9u5q254oIZDIZAI96Cq7BVkWEx6Y2zuoUz07HFwhRE
 eUB3x5DFtqr4aTPsik4adCi0dqvIyTxDi9Chvdfg5w2/L/gYvyNCue259T74k1zj8ofZ ZQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1664724263; bh=4C1pMaVDtL06zGlmma9Q8JI9ssPMXqQjK0r4JEfoQDY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dWwVpH9GyEXRzgF+7zHE5jO6S/ju0NLbb/+aQj/YpS73N/m+dVs/kVt/m+ke4tavu
 DRkRVutN2yX/4Hdvx/heukLd64jtJF+RD+F8z7QxEc3Vuoy5V07DPKcZQm/2WbvBnF
 OHir1oCpmz7vtCs20LZsfbEDoHm4KB4e1rMVau2RT68CwRgNTKjLleKso8qwC+bwtd
 aoiPyNjeehEPGRLXU4Rsv8v0tNjWxdS5SOLOYWFeDVEz/qWuPMP3OkY8K2jcvsRVTJ
 ujZZuESS+ct5DdBLo6s2wrYnK6eCJ5OgEjZj2cQMvUWzCec31KPBPSW+hmRBwoDw8/
 /h+ri+ZUfPdjQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbuGizTgc1TUTY4PRk44U2eWBM09HiFofz4lMu762ds=;
 b=ktn6F2nemnywSC5bkbKrbeRp1pM1hYdK/sX5dH6M8YLaNOvo9K8eQs4C23bXneLJYsxo4vzuZbmeO5xfmIDDVpyj33xTzrFL6WqXTMzozczjGHn3IC4l591HHl3Q4hXGL+XJTwwFLr52ujC1RF17YKV+SOvFLW25x+29R4NcNLM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=umsIVIYm; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=dWwVpH9G; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=ktn6F2ne
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com; spf=pass
 smtp.mailfrom=abrodkin@synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ktn6F2ne";
 dkim-atps=neutral
Subject: Re: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] Your
 daily results for 2022-09-30
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
 Buildroot mailing list <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, all,

> Gitlab CI failures
> ==================
> 
> Below is a list of Gitlab CI job failures in relation to defconfigs or
> runtime tests you are in charge of. Please help us improving the quality
> of Buildroot by investigating those build failures and sending patches
> to fix them.
> 
> Results for 'master'
> --------------------
> 
> Build failures related to your defconfigs:
> 
>                         defconfig |                        link to the job                      
> ----------------------------------+--------------------------------------------------------------
>                snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/3101769991
> 

That happens because upstream glibc doesn't have support of ARCompact architecture,
i.e. ARC700 processors are not supported even though changes compared to ARCv2
which is well supported in upstream are really quite subtle, see [1] for example.

We haven't seen this problem much earlier since we started from glibc fork
used for ARC targets and in our fork we used to have ARCompact patches. But later
we got rid of ARC fork of glibc and moved to purely upstream version, see [2] and
that's when ARC700 problem became possible.

Still we've started work on getting the same thing ported to Buildroot, see [3]
but put it on pause for a while. I guess it's the right time to finalize that
activity finally as there're still ARC700 hardware in the wild so let's
make our precious users a bit happier ;)

-Alexey

[1] https://github.com/openwrt/openwrt/blob/openwrt-21.02/toolchain/glibc/patches/300-arc.patch
[2] https://git.buildroot.net/buildroot/commit/?id=40258a3f395fd4c285e7ded27b25edd71f5c33b4
[3] https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot/pull/30/commits/c0b51289470ae089f19956288a0dbd1fb5a76c83
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
