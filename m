Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87308CF34C3
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5586460787;
	Thu,  3 Oct 2024 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIVC2OvehSVi; Thu,  3 Oct 2024 20:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A43E607E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A43E607E1;
	Thu,  3 Oct 2024 20:31:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39E131BF41D
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 345CF40403
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 20:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOcsIt5i8cfX for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 20:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=9995b4c5d=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1D407403D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D407403D5
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D407403D5
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 20:31:51 +0000 (UTC)
X-CSE-ConnectionGUID: 9sNMA8YNTm2xbFutaewvrQ==
X-CSE-MsgGUID: PfWXiUvGSHqUs/A85qIjuw==
X-IronPort-AV: E=Sophos;i="6.11,175,1725292800"; d="scan'208";a="28261886"
Received: from mail-northcentralusazlp17010006.outbound.protection.outlook.com
 (HELO CH1PR05CU001.outbound.protection.outlook.com) ([40.93.20.6])
 by ob1.hgst.iphmx.com with ESMTP; 04 Oct 2024 04:31:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQPXSdcXwE+8y2lkm9k2MiQm5N2LaVJyE1f1GEXZVGKK+522RIAq8DIH+hYrbg1flseJDFI7Ds/caHheB0wCx/CqVVwXrPBM9wcdk7jfO5Bsu+u5S9PHH8hAyuD1qEYchHSlncLrFfVIytD22X+LToDqFTjZiP79qOtDVhTttMG9/o5WPaZY9LHoPuXfOP+lwJochchLhe8CQX+jGP+4hpRqeDmU5SkZi7rpVWRQXr6CSD9DtoxTaEm9BlsdF38wm9WkqmDF7LlKVLev1NuyLqwdFWMOiDQIKMWcAunSflRTW1lNSEXcvsy+eLsjsK1PYLcVLCZ5fKjxF4USz3XDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+TPmRqRSfzgbXzcalemzgpHTBbPHDb4M48BSTO9ToY=;
 b=dVNyulmfDqko6UOfhwcY0i7C6Ng63L5hpsb1lOFkiep4eYigI+GjSsGIgLPN+e2bdhOf614Hl+K2e0vzLPMRrtUSvq1/MRAXBqz5I8NjfxOPac6aQ3QoYEfKs8NswiDxtaD2Mv78XgtolgvTTlMg3y1ipf9tQY766p9qIWr1B9PXSkBRSiIehGw3CmLqeB7KGd70vfz7yXYjHrUUgYZ7oXZaY2TetYGVXFf2dzuDrehjXuwgDnMJVQ6H4OcTWBXUBrnwjRXBfoSimrl2u0H4zbKWE0EXNSuhZNTMTvMvaDmjbfJFos0Dij5kDzWZHgof7AxUgB0kxhO4YhiqCraUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SJ0PR04MB8307.namprd04.prod.outlook.com (2603:10b6:a03:3f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:31:47 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 20:31:47 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 4/4] configs/rock5b: enable uboot-env on the SD card
Thread-Index: AQHbFdNFYDzZQXggA0GQ6hyVA3muug==
Date: Thu, 3 Oct 2024 20:31:47 +0000
Message-ID: <Zv7_M2Oj4JqLy0l1@ryzen.lan>
References: <20241003140054.250140-1-niklas.cassel@wdc.com>
 <20241003140054.250140-5-niklas.cassel@wdc.com>
In-Reply-To: <20241003140054.250140-5-niklas.cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SJ0PR04MB8307:EE_
x-ms-office365-filtering-correlation-id: aee1c03e-cb0e-47ed-4f33-08dce3ea6794
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?W+e1qEMRs0H40oKfT+7qWeTzvQMNZCSu8gJ3MXLq3g2Ef6ZmObGb1oc8JSml?=
 =?us-ascii?Q?nj0RHAKq/6zwuWVhtl8BQn80dl8NuYXVm2txWS8SBeLCe3cH2UJmnU1o0jtB?=
 =?us-ascii?Q?XI2vB3DJhx5XGsKnetxnKK2iNe0uE1IE1C5oTWcyuHSmLF7xpD5LcUwPemIN?=
 =?us-ascii?Q?7gm7848BhoF0QY774bmsLFAjJG/WpNGFhd7tg9aKkadvFjGPksLA5aBjs3ny?=
 =?us-ascii?Q?mg/fa0Bp+SO0FRMb7JcsZE+sdQ1B2dt2yIlYwW2rBqKmfvmjyEDqofoIT0O6?=
 =?us-ascii?Q?1C3BzD4EaijQdnVUyh7Jc4pyb4crUf3sd6mlXENgEr7Z1ggrgMPUJ+cEjpg1?=
 =?us-ascii?Q?y7v0IUx3gw581irutsm9kcEiRDjK+1rnbU0eAibh46dCX/BecaGweEZKx4dm?=
 =?us-ascii?Q?sL2tO64CDNAZrJQmnZ2NRv/oQmfBZfczhDAa9ls7hpyrFefrfoCTMIZ4Lhxz?=
 =?us-ascii?Q?T2e6m4i+Ns1Uy8Da5pjhz3K45NY1y7D6PJdCAaMpxpPs1/snYdyZHxWCpUDI?=
 =?us-ascii?Q?L25sgqp3teOSisuhJ62nqpooeAeheUgi6XZllyz3SrCMuVyq1PcF1XmWohxn?=
 =?us-ascii?Q?RG5kTlA3V7FQD2EVXnK2OpnLiWU2hNBDGD6ogrq2ePrOOd4TZdzFYVISHSCh?=
 =?us-ascii?Q?pNV7dQm90TIVoPxadYjh8w7VyITaHCcOZ7Ip7mvo+fnlJIbTPhxREZcoco6L?=
 =?us-ascii?Q?1hC/xu7IkaspoH+g2eNJOwvVFgvBCBjDhLkwYL5RiyHUSKifQExIMAtkRpS9?=
 =?us-ascii?Q?z6tr+g6nJBximD1mX0vhdzxNh0K5TNf5tIzRyxPbBF6dnxaoD/Nm37Lq//lO?=
 =?us-ascii?Q?ZyBd3ky/z6PZT3C69vHBeTd1iaZfzCK8p+kDQgSc/xXkRhRmpi8VghQLQRDG?=
 =?us-ascii?Q?Zrxbjb20Ra/46t8nAMlzT48IR1mz0QUae3Q5+DZZTrQMAqwJEMonTdx+TiFP?=
 =?us-ascii?Q?4TQbgrAI+VUFrLxdqYpXQOvmN9rA8u/9hwZh5aSC2dJjBJzHe4SkT5SkzBeH?=
 =?us-ascii?Q?WmG/GpWnYIz9Dqemo34CS6oIMPmT4NW+7TXKS63RkXfPft9XMb2qi6FV7zlb?=
 =?us-ascii?Q?8iFlJGGjHx87grLZaXn5v3s7TAw979EPpBiMxvtzrcfs1FPMj2BzQ3podegC?=
 =?us-ascii?Q?gpbTiZlEqNIrsapXNk7mKNrlJPrh3Iq+4O5MrcO1FCs+hEJr6d0yfbTqWbkh?=
 =?us-ascii?Q?rkvUorCnL/Sbaf40qkL9OidILNVtFtO4tGXisT0necGzIBGdxNSgvTVpBM+d?=
 =?us-ascii?Q?QRMz4UEiY1oGwtcbN4D/pJNch/ry/wU+brIq5Dx5ItKZSaQi28CGjrCzQkCX?=
 =?us-ascii?Q?GRI40hlha247ked+yBxI4YwAp4ZLuoU6+2PKLEjSHsrf8Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TOZaz65e0/qA+oD0j2J1ATVoXjiuNqddaIOASl1jJ0DgViE2MMytYTiW9+AB?=
 =?us-ascii?Q?qwxDenGMgB6jmv/k3IMH7je1eI1cxDVBrfHYVqgueyCGTndKKigcDlCv3e0r?=
 =?us-ascii?Q?wCNc1jOjzLSr9XWCu5mK8s7swVcaYAMHVUDGDoHamX1eV+lJOpNQEHxz+NKF?=
 =?us-ascii?Q?uwpK1VBpvAyGSQ7C4kAJm9qGWIZn5K4nnrHSEuSKb492vXgrZEcL9yYgQpXy?=
 =?us-ascii?Q?xX0JmBWGik9n7MxJK9KK4isl/pvRebHLIATu56hJ82v4LdMNDIV1/zy5JDfK?=
 =?us-ascii?Q?+JKNgmV0WrM+pbiDmq+X3Nq/ypHGQkB+o3xC55e0QKF3H6KRFyreEPFr2qtX?=
 =?us-ascii?Q?cn+VsCL08yORImg32Ode8DHp3os2Pxi1FBgx2oI2BxnzBN5lEnb9cyBxfxZx?=
 =?us-ascii?Q?PTf6SI28xuDTwmqT/4azqnguKtWNxVn67dDpI4AC8hHF6YwT65CEeGarFwb8?=
 =?us-ascii?Q?3Vmq+PWgAc31yNRFYLRHcJQqSV6B+FREBeOlmmkAtUdBlHbwCWqbnog8XQpE?=
 =?us-ascii?Q?HKmT/TBTYPn+wM9tCnz9L6QS9JK3OuOdnKkXNLIEyk4oRZxet9CeTTZ3yl1f?=
 =?us-ascii?Q?+cj/D7/ot6NTgJplwwV8C+wvWgQAq5ReadRqWZjabjgA9AgirtwF4B4ziOYT?=
 =?us-ascii?Q?favw9pFwLOrrHA56O44VGlWuDKYR5212qjmB3gVWoeWp5rOsdee8MxXQcgFr?=
 =?us-ascii?Q?NPqkwp/bUiXNAs7aT3YQqfz1VZ1TerKXwZmwAO+FvbPj/JA6R4ZNBq+Rg8za?=
 =?us-ascii?Q?o0To8wI7bQ8jV9aoJ2hDuHZ8QUm/3j6F/Gs2Ygl9hgbYrNH0Exi9rdevPq9Z?=
 =?us-ascii?Q?ehTLJpbKexGRZK7UT+81wH1mi6LTI0F8z+8ISi0Ea73pmrG0juaIVFDgIDzq?=
 =?us-ascii?Q?4oqslMdWKAoyfJQbsgnFcv8zYhs/w3cli64KXAm5jcYmzCBBaynMQC+iO6AH?=
 =?us-ascii?Q?u9adctXk/toyOVzsyfRIJtq9bxUnKS5WJpg+juEJdjvZDJoGnZcXn/ihyvYL?=
 =?us-ascii?Q?KVtuqq0xEIhaLqsdd3fTwHs7rtDlEUsHJttFSF9kdRRQ+PVWMvXHR/J99TlP?=
 =?us-ascii?Q?gJgvCLnmhazrvbiRY7C/T8/we5a6eXVyh1qNv/GiT5I4frdo1630mITLR8zf?=
 =?us-ascii?Q?8mFbcrjYK/mjEUSrp41xswustfvpgFU7PAaoMYPowqZVLT4ybsg1avEEeTqi?=
 =?us-ascii?Q?BJkxpAcdDDz2PaoZ67TyRgrlPDNOioLAgRRpoUf8Lkk4cBkuxtmxZdy5yTtA?=
 =?us-ascii?Q?nMXA5iCo1RsjqF/+E6fason+f1qnWjEj/1dV96LUnhSYKC0HdkzCmloxPYpn?=
 =?us-ascii?Q?VvQaMtGVb4H4uypTpCTaQkeAQtG83uOxJ3WE2Wi0hPAVPD49WoOBY2UH+R7G?=
 =?us-ascii?Q?5ptjygNyWEqxq3DX19ERnILib6lDBkhG1PShp4JSBdUzJhuD6z4QsTO2Vl6r?=
 =?us-ascii?Q?hvWfBQQ5Ux0QVIBheV53x9X6R7HE050kSqjjosemo062uuA6QxPoMa+pw89o?=
 =?us-ascii?Q?uulQB1lu/CzxWPOVSmnkmosA9c3+Q9JJC+yJ68vsSz3BD6zXALMlsM+irZxP?=
 =?us-ascii?Q?zNB0PDws1XQSwKyjomHzq/KXvR1Vp2e+7jWrMHKXTdLGKfoX164JuMeyDdkO?=
 =?us-ascii?Q?MQ=3D=3D?=
Content-ID: <71F8BD2A5BEACB4082AF606ECA39753D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mThrPjd4K0VtMH65JLBpaENJS33Gk60M9/vgtGL3UDxf0jeYSTLBnPXb+Q3BF/G6wWYS6lZZzHmF4hT8vgpL6uC7RuZWghfp7zoETshBVqvxQnrqyhbfwoH7X6abLMpyCDQHxzh4husHAVecZayHhhhbvDOIzj1AnvNxagwIvp948iU8qhvqjVT0+BZq1JdGTQHayZq1QjiuUBIWay74sdDfDea4+1iVNxrMbrOCqWJxi+cBzXDXvdTcoHxDB0kltaP1PGcO533UBy/41lGcz+HrdLfM4GalL7o8ExZ0sToA++fyGYflOEyEsDlXrA+Noi7iaxKdzKKMO/J0iXRUm0CFL0Re1h+J9V2SpKhB2NdUPpm3Ba8TurGoOIqj2UW9AxPZbyOT/HgP3KbcbBpTHOPNGjWMI3s8EJSk6U+2A1t25+oGJnzdUUraQh3b68C+RO/1I3mBealNzt6TNo/PIb0kEvTwmIUF+S//ZBfBxGsukI5EWOoVz6zRLQX+3GqhuWDL8jzvobP4DGP5OEeFG/c3kSPLIF8Yo+0axa/x09dqF5sKZM2RVN9iq1tKiM/0XhQVC0Hqo0JDFS9DsHJ0QnEdx2oyf7PXNxBU8EIIMLcHSmCLwF/971matoqW0roe
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee1c03e-cb0e-47ed-4f33-08dce3ea6794
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 20:31:47.8857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q58/OHwcYzxwdp5HGuvt4TLigQDC35B9VmkKgWwTronsDloUsrfGRKY+f/hrph5eCbji7gqhSXaqEDKmngj+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8307
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1727987512; x=1759523512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=1SJw3Es2MKNNNea1QrhvtZpd7CdJsc5UKNksBbvwX48=;
 b=SCaZ+IXgpy/GHRlpS8s4Ffl+JYtdD5p+BtydxKLheZ1dFVDynCJl2Oa7
 jlLYFaIwVj463EEQrnZHgZFzHebw3BWxwTCr9b3K862DnWvrz8jAxGiMc
 sMU6IH82X4X6rlbe+jeOqmy9oh3Q60Iwcd5FCnA2t2GOVAZoziCIpidjP
 ZePIAOxkmJq7907GRDtK/5IKnfDsJm4gbgzpnL2eIJ3Iuec+MwQvY4ZV4
 QgK5upOao4Xzk4deX3NiFFeOhLJY0xDrPgu05bRQvGmPtDE1YLF1PoFVd
 ViDUC/6QBq4Vk9jjA64OPyWwUkee2GosuQoSIuCBbSIEk0L3fmxRvJYT2
 w==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+TPmRqRSfzgbXzcalemzgpHTBbPHDb4M48BSTO9ToY=;
 b=KEKHz/4JLnnMdEyS6ivMPX2p0TKXDMlVI9WMwAapJTqIZua0U0HoXcMhpS8ANHAxdoQU6zqB9srEUf/beE+ppZ41gQ+rENZbJ409s/Q7tg0w2zWCjcFWxAMXGGAN8RcbMLQJJ7AfoVX1UVikYQ7OL8dxMmg4LdcaTFpXFkmj+zQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=SCaZ+IXg; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=KEKHz/4J
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 4/4] configs/rock5b: enable uboot-env on the
 SD card
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 03, 2024 at 04:00:54PM +0200, Niklas Cassel wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> Having the uboot environment defined on the SD card allows the user to
> use the uboot setenv and saveenv commands to make persistent changes
> (e.g. to change the boot order, or to set a server IP for PXE boot).
> 
> Unfortunately, genimage does not allow you to use
> in-partition-table = "false", without also specifying an image file.
> Thus, instead specify size and offset to partitions in genimage.cfg
> so that they cannot overwrite the uboot env.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  board/radxa/rock5b/genimage.cfg    | 2 ++
>  board/radxa/rock5b/u-boot.fragment | 5 +++++
>  configs/rock5b_defconfig           | 1 +
>  3 files changed, 8 insertions(+)
>  create mode 100644 board/radxa/rock5b/u-boot.fragment
> 
> diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
> index 8c56251135..43cf661551 100644
> --- a/board/radxa/rock5b/genimage.cfg
> +++ b/board/radxa/rock5b/genimage.cfg
> @@ -9,9 +9,11 @@ image sdcard.img {
>  		in-partition-table = "false"
>  		image = "u-boot-rockchip.bin"
>  		offset = 32K
> +		size = 16352K # define size so that we cannot overwrite uboot env
>  	}
>  
>  	partition rootfs {
> +		offset = 16448K # 16MB (uboot env offset) + 64KB (uboot env size)
>  		partition-type-uuid = root-arm64
>  		image = "rootfs.ext2"
>  	}

Please do not merge this patch, will send a v2 that is cleaner.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
