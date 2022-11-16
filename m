Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2037C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 15:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFF64177A;
	Wed, 16 Nov 2022 15:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DFF64177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjXxhT31XyFH; Wed, 16 Nov 2022 15:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10EA9402EC;
	Wed, 16 Nov 2022 15:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10EA9402EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A53E1BF5DC
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 15:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFE56402EC
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 15:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE56402EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZV0BSEUxGiBg for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 15:33:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84E10402C2
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com
 [148.163.156.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84E10402C2
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 15:33:54 +0000 (UTC)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGFN2F0014226; Wed, 16 Nov 2022 07:33:52 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kw2f38299-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 07:33:51 -0800
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8699EC0827;
 Wed, 16 Nov 2022 15:33:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id A8D1FA0092;
 Wed, 16 Nov 2022 15:33:49 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9112E4004E;
 Wed, 16 Nov 2022 15:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWcYb9ipJ5P78YlAso3PPtcGGB+yGTXdmVyMOpjuU/LDgFNy56wxxx13oscov8D8o455nedPRnY/7bCBsA41oHb1rTHGpChW8+qAxI2/GF99LPLcX0QC87dsJBaciZo6mS8b2cZhRJwivKLbki1nc7F3FvYx6jfrjXWOm/uoVwmm3dpG/yUbqregd2i1O2upYvTwD4n6gQDtJAKQ5m7+M7q9XYGwPbj4TDLANkKpq9JGmvmXeL1dIjLxLz3giyh+DLVo2O0Ni+PX3tDB7cAXYXBlXKoUldhIEz7o5i05xg6Bv8kNWSO8+ND6ze/14vHXvSfjeZvMe5WpYMDWGeS01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGZS8qXSP9/Penoo2lW29N+mlp80g+Hs4XNBjXPk1AQ=;
 b=jID6+5wKQMmTd8P7HW+ppcyOl3qnjN7/Yetk1acb72yaF2y3oexIMhNaCTe3Hl88vLTvf+ysSGEMwioBWVO/U9T40c4u9Ej7ZwY2j/QRcXgaVlFExB6Mmqb/1ZhO9j4LGsP4VLYHDDu6XqLsqbPtP77E/oD57kDFOz99dirA044cQAve5FqcyC20DvJYFxiuFyR67NxbzDv2lr4Qaz9KiaTwkV0vOcCr5DcqnAHgCmotJC/IoXNr5cWdMLgPufc9CZIOxB45FBPXcRf7iEyahBmGGI/cnDNsez+hxIpprwgvjmJeVf5W5+dqtXLLXQ4JGh8bg7G5+sBNUIezJgIWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 15:33:46 +0000
Received: from IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::81df:9e5f:c38b:48a0]) by IA1PR12MB6210.namprd12.prod.outlook.com
 ([fe80::81df:9e5f:c38b:48a0%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 15:33:45 +0000
X-SNPS-Relay: synopsys.com
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH 1/2] package/glibc: add support for ARC700
Thread-Index: AQHY+U1kVBIh94i8S0SyqMcTuY34a65BLrKAgAB7ZKA=
Date: Wed, 16 Nov 2022 15:33:45 +0000
Message-ID: <IA1PR12MB6210F02877F05C126179D5C1A1079@IA1PR12MB6210.namprd12.prod.outlook.com>
References: <20221115235235.74897-1-abrodkin@synopsys.com>
 <20221115235235.74897-2-abrodkin@synopsys.com>
 <20221116085427.3525bbcc@windsurf>
In-Reply-To: <20221116085427.3525bbcc@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB6210:EE_|SA0PR12MB4541:EE_
x-ms-office365-filtering-correlation-id: 7422da24-053e-4beb-2750-08dac7e7f329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z68vI8hyry8OWirYQ4ZbyfUn0zYdSZI/bxT94xibSwIRexvNi2ZxZistxV02zGbZLy3bFDokOzacJrSDdFSXM2uao4rJscAUZOPCoQvIqMx7jXwAz/8WucHDrjkm7Pb6/YGWmnAOBqUXoBXweigYZKzyuGZYZVtX+PixIpQE3NvkDgTgXo+WXO1+2gvHAJc4e9tIMKxbX+5On/+zEkwEN599+HPtKOTFEhbT54nVvvay3f8d7bOqailIVBSmGdn8OUERcQTDacMXF3/uFsqgavG9676yobWloCF0kVOggAFc/WB+BXBNcPdVeU6WAIlOtRLMOdDPJMWvcN7BmB9kqJEk8T/HRGCmpwpn/JHqJE1G4MVfrZyQPqU9ODZLpo3U4c4sY95XRXJ9TSy4U3/g4fHuqoPhLu7z6HAUDhLT06/8lgZQAIixsXHbrlJjce0lvPEcp5VXFy3bo9+Mg/l0M1VLjbRZh06AFxapyptz/XBoUPDVEmYlTUw1qUOmH7RZijsaE1xp8mnEgxXAYqVgQsJ3I/AIEBdAgrGA5reiB+govt2mh6IrFFVb5iLQ+mAtjw6rTPaRAbc/m60a41dwhDpYs3nTSt3uOo7YH3pPoG2FE/ou4IKctcEinClwXtnw94oT6YPcU2R4Fw5apNe90MiCRc3mKEeWRe/UQ6P0kqN84HopKPKoAtk0GZb+jrNGiFVfrkc0JISwTlFr+b79GP3RjJqvuYYHKrn3LSBAaGSIgwRfPPPrbYaGmZzWt8ro6+HeMJ6kbE5GdKZQIUC80Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6210.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199015)(41300700001)(55016003)(478600001)(6916009)(4326008)(54906003)(76116006)(66446008)(33656002)(91956017)(2906002)(66946007)(66476007)(66556008)(71200400001)(8676002)(107886003)(186003)(64756008)(83380400001)(5660300002)(86362001)(316002)(6506007)(52536014)(7696005)(8936002)(38070700005)(26005)(9686003)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zu5GY06d99cpY1nfLRcHFP+gqoKyUBdNqiHBASqBQaPFmHjS/cBtPepNPJ?=
 =?iso-8859-1?Q?aZQ/PbcdjRtFPlfDYc+4rohTHTnaNigSl+PSMngfBF4gtuWQBOHjZ3AruX?=
 =?iso-8859-1?Q?EOTLffZrX7fb3duvL8tbIdTUaEh93Pu7yZVLl0j1Xw4Hi6oxon09eHe6BZ?=
 =?iso-8859-1?Q?xx+t3AAY+Wgy4E1IoKFxF2A+liTIuI4AGwJx96QuBlh3ATsuBOt3QWr2dk?=
 =?iso-8859-1?Q?aEI7YwEDXbGKC3Bw+EQ+b13fAmm3jQvX8+LJmyVuxEVhA9sqeIGfWY1fjC?=
 =?iso-8859-1?Q?JSnlv6lP9HgYFsO2ehkm7H4YSIWFL7vgPil8PlYHVWky8TNFsYWLBPJS5j?=
 =?iso-8859-1?Q?eR/GjnCLXPlXupA/XtMYzeBpwlIvKR7GpV2ZRAjExS2IKeUxU8DjGgbQQC?=
 =?iso-8859-1?Q?CbkvNmvSsO1C7pIdwhgK7bfR/uomUuXxYbBNrF8H8HqhPtKUsiZFdF8T4V?=
 =?iso-8859-1?Q?/nAuAIaPplcsUUTkDuJC5vhqwkGmVu6LFCBS6LA8Od0X55na+rh8FJ7mDm?=
 =?iso-8859-1?Q?NYy/f/exsQyP7jMuL0ozqvwYfdimzOShjPUL9WoUGJbDit339ikFf60BmQ?=
 =?iso-8859-1?Q?LlaohubGiNuEyw5H/p7JH5TnaVrX0kSD3FptgLkL0hxKOg5K3AyJ34O8hx?=
 =?iso-8859-1?Q?OfgY7qBAsWXULa1+TQRcULhZIVlVfqxAdDV+MKurNX1O2z2cId+5j4B1le?=
 =?iso-8859-1?Q?1pmm0UvaVPkhxCL4arROEgp7Wz9jMfZUvgHhAuPsV3m7MCvyzjAwyu1ha2?=
 =?iso-8859-1?Q?CAZ8EPHe+ilrwBRKrG0SjeyP/0ZMa19Mz4x9GLb+S3b4BVzjMjAOmlbm1d?=
 =?iso-8859-1?Q?ZMbNE34wkhXvelLkIErZWpi7jZRJ2ik9GRfnRR8qEhtnfTWc1o3Jy/8m5+?=
 =?iso-8859-1?Q?Q+ZbqcJGeQkuDAVC2jrFJcHOqE6jH+vFS88x8qkbLh5K2GyJrwZfSjONYq?=
 =?iso-8859-1?Q?HiMUzc6FXICtGO8YmnVYtis5pHJZFqysz7pqlg5atGAqttoCT1CTqvNGco?=
 =?iso-8859-1?Q?RTEcJ/TnwQLbAKGxddif+m+vFJdrDd67zSmsjGfpqhmzXWNsV+8L8wwxB0?=
 =?iso-8859-1?Q?plVqtq/7s19dr0Kzmdx9gAeZ4VlY2ee2Hw6IOMCsgAjob6NLfWEhjJG42V?=
 =?iso-8859-1?Q?NWhMcdjcVl+EwzlQCY26qWp8BCTOtEDKxio2sh6wdg2O5ZjBUDHlHDK4Yv?=
 =?iso-8859-1?Q?mh6x+fDB5RmrXHYCcO/h5QwepM6QuOlp3kB+pxH/DD7A+JyXrEm5N9Ha/R?=
 =?iso-8859-1?Q?aZQo+CSkem9u3gtKPJiFu5lnAggCNYQf66V84hTDa3G6TQGBJ1ZaOGp85R?=
 =?iso-8859-1?Q?751sUEyilGCBun4bS171hguAwXBjj6Y6ML2THmBoO4GD15z4UzbJA2Hr2I?=
 =?iso-8859-1?Q?RsRYcOngVUrwF2jwBpLQbUhyJ7Q+WYqR252Yu3lKxNCw3C/fY3dRZyDk82?=
 =?iso-8859-1?Q?uyV2X6zDQ3v7xijblePIbykSsIzXE4V5hIbXldfJRDG3Pwd+l4KLslbdRU?=
 =?iso-8859-1?Q?vBr9R4jNw1EAoE1JvfflYvXKdlgGCxawYs2Q5wDOM3RPKe8pQ3fzSnxvY0?=
 =?iso-8859-1?Q?Oxx7Sc8NAvHLyndz8qrMTINdnb4YnkH3iBhTitTke1P87cw+XceOKA2B59?=
 =?iso-8859-1?Q?g4zvmEltrOfemDqOhluNfekSvnIQfxmmqp?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7b+/SIJLGkbOhoczhQXBlX9dUnhSdSVupeJ4MCAr+Ykid2Z8hrrSEsI2F53e7QnvpYYeRk/laAb6lWMF3F6eRavh0hdOfCDTTxenLDlpSUxlhxXVDIsbLQFPsFfcQ2Sc4M2jyGREOZuB4oE1XU9nQBy569N+LKWcjvo/xFSyG92Y29h7uGbAYxu57F5aauR3mGZwwxu+cJNFoaoRe4NzxnEdxYZffkKVRqHMQZEZOxFzQRw/VkgeLx1OTGp5nEo+r6StMLfx3vZ0n5yzw7QAkC56wN4ADNfnRbQ2yE7ZhwsVdfrkiqOyCwR0q1t3N/Ta3usUvc3UoKfuT8UPJq6RGpJJTc1+gxGqVq2I1tKlSHU0gazWIwxaF3eeIb88TsuMefteeDzkYt4pTuYUgArCx/Ju4ulIjOAE6z1qRA2+8tI1drckl5HV4W6DcaKssawu24Jdo/DlNiZUKj/x3DUakxJI9CfOWgxoJx/KpuOTUssyRnJplU89vwOFhX44VVCs5/EaMJWmyeJhQC+TlfAn7WR4jVicgzy8TTkTXlZ8Sszgu2wGpRytkpcjrPPvl0cg0Sg9+YMCVknDKJiXNK+9mgIT59BD6o3S682X+8zcoEN0oV3aZJM4fdgwIsRj5+m8xIHqbPBtojHSid6/uGkqL/t/2ugKIxtccZkHvwpqcHra1IGShsFpV+uSBNJzoPrgaX4OwSb/5yVP8CnxDRNfWME5dTJyxLwZhhp96WMQkXeSPGtjVJ1r391+cP1QC1FVyGiLrsAzLaGtD6S+wapg4FD+Mc3uTWDFVtlhVKZXPVfQ6ESQiuYtRttk449gjqa52bwBNYmg4fD8W4N/uu4bRhWz9MfUx03nVVi6BXY+xoQ=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6210.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7422da24-053e-4beb-2750-08dac7e7f329
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 15:33:45.7123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dhf27LRzUcg5NDAORMzcINCap0cQz4QI7RCsxZajdRyfo40tLAGs75wFiZ7y+k03+pbDHOu8bqwCK9wqodmjVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
X-Proofpoint-ORIG-GUID: C0CFFnwoPa9Mv-1MiyQYZXROoLv0SJrq
X-Proofpoint-GUID: C0CFFnwoPa9Mv-1MiyQYZXROoLv0SJrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 phishscore=0 mlxlogscore=949 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211160108
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=tGZS8qXSP9/Penoo2lW29N+mlp80g+Hs4XNBjXPk1AQ=;
 b=kfqb0b41K9QEsdkvyM7Rxi4FNi5gQjK+9LymDEpJwWJb0AfImaZlsOsq6ew8SBfwFyaP
 +h6HRsxTbmcLq6XEmaMJjhHoUU7spqPD7nhivjlO7J3yhgb4A3kG/Eaw1ZJlqey2V9LG
 oSQ2NnZ05eMZUSm6qThe5tY8PloGYTnX3yjNX2BZZbfeoparTBlF6lsEk9kSZ59C1hTk
 Iza9m4HFCtJ1tpRbl1064MLEOy+aSKrhe3dhEibeNAq8t2hoyaWEoVdm81NTfYhd4YG4
 unWqEiA/FyZ3voibJVfIpptrIY78VdeGqOIQ6Lp8wO5ZI1ppidYGJtIRDbJdv4g++40j BQ== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1668612831; bh=tGZS8qXSP9/Penoo2lW29N+mlp80g+Hs4XNBjXPk1AQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=PlyWwb+Wc9qRt9B+ljT7pk9TK5CV8z3Xgaj6Xfy8o+Dc/Rd8/UMu2nJuAaMUwxYNa
 37A87IauCHxrVSl6ic3ll4zDQfyNMxcoD2iv+uY0Nq/kL/NL6ZFSUg5KDPIaM89BYo
 /MOMOT3Ux7keRb5+R0zwTDcZpn8NIjVxk+vsSQBf3LYiR5Suh/ePlWM2AtvjaPnFnA
 jWyprrx6LeAAFWXktjJZ5zqneA6pTWQ5PVA6ZMzk57o/AwqD1oX5i5NiOHgBWiNLQB
 sUC7vmgPDzhGJLmfN4XsR7cshMwrcpyTKD3pGY8yP9F+s41WUanaNSOANQ+b6Iul0n
 xeLYyEiI2oWJw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGZS8qXSP9/Penoo2lW29N+mlp80g+Hs4XNBjXPk1AQ=;
 b=refZUwFCdSTd3IW7kaqjH3CHm65tOGbLjG30T+qfFFgbQC2twK7CClELx8+3Cj3EJCTdvSaO3Ne0iau5TDI3+LN4TlUXrRIKAQy3TnYa/C7vSz1LjW/Ty6/RyfzychliSQrfCK9084w8wYI6ujmuI77nHNtC5rmmN3zQMxt7q2I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=kfqb0b41; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=PlyWwb+W; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=refZUwFC
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com; spf=pass
 smtp.mailfrom=abrodkin@synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="refZUwFC";
 dkim-atps=neutral
Subject: Re: [Buildroot] [PATCH 1/2] package/glibc: add support for ARC700
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
Cc: Sergey Matyukevich <Sergey.Matyukevich@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> > Even though ARC700 glibc port is very close to ARCv2 port, it is formally
> > another ABI that requires appropriate maintenance. That includes running
> > extensive glibc test-suite and fixing discovered issues and regressions.
> > That effort was considered impractical due to ARCompact ISA reaching EOL.
> > Besides ARC700 processors are usually found on very resource constrained
> > devices that tend to use uClibc if they run Linux.
> >
> > On the other hand adding ARC700 glibc support still can be useful for
> > development and testing purposes. This commit adds two glibc patches
> > that enable ARC700 support.
> 
> Hmm, this commit only adds one patch.

Correct, because that's all what's needed for ARC700 to be supported by glibc
as good as ARC HS processors are. Seriously, there're just a couple of
instructions which need to be changed (like use "trap0" instead of "trap_s 0")
and dynamic loader name is different ("/lib/ld-linux-arc700.so.2"). All the
rest is some configuration/infrastructural nonsense.

> Also, what is the upstream status of this patch?

As it is said in the patch itself, we decided to not officially maintain ARC700 
in glibc due to very strict rules in the upstream glibc community for supported
architectures and ABI's. But given minimal differences compared to ARCv2
(read "ARC HS") port, IMHO it's practical to have ARC700 support "downstream"
with a bit more relaxed requirements on maintenance activities... which doesn't
mean I'd like to throw stuff over the wall and never do anything about it.

> In order to make sure we can easily update glibc, I'm not too fan to have
> patches that are not upstream.

That's understood, but for many releases that change was equally applicable to
newer glibc versions (as we touch code which is rarely being modified) and even
now I re-based or refreshed this patch from 2.34 to 2.36 automatically with
only changes of hunk offsets (for the record, even before refresh, the patch
got applied to the current glibc in Buildroot only showing patch warnings
related to offsets).

That said, if you're not comfortable with the current maintenance status of
glibc for ARC700, we may drop it and limit ARC700 to only uClibc, otherwise
let's keep that patch until it seriously get in the way on glibc upgrade etc.

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
