Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764C9C07545
	for <buildroot@archiver.kernel.org>; Tue, 24 Oct 2023 18:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2ED6F531;
	Tue, 24 Oct 2023 18:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2ED6F531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfFtxZTE7bTq; Tue, 24 Oct 2023 18:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52ED3612BC;
	Tue, 24 Oct 2023 18:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52ED3612BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C91B1BF377
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 18:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3322A844CA
 for <buildroot@lists.busybox.net>; Tue, 24 Oct 2023 18:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3322A844CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knhw8n45fKSW for <buildroot@lists.busybox.net>;
 Tue, 24 Oct 2023 18:52:45 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78B79844C6
 for <buildroot@buildroot.org>; Tue, 24 Oct 2023 18:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78B79844C6
Received: from pps.filterd (m0346904.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39OHx7fd014195; Tue, 24 Oct 2023 18:52:44 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3txbd162kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Oct 2023 18:52:44 +0000
Received: from xusxph009rp010.corp.ray.com ([128.13.125.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 39OIqh7m004139
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Oct 2023 18:52:43 GMT
Received: from UUSALE29.utcmail.com (uusale29.utcmail.com [10.220.63.19])
 by xusxph009rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 39OIqbeR021281
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Oct 2023 18:52:42 GMT
Received: from uusale2a.utcmail.com (10.220.63.20) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 24 Oct
 2023 14:52:41 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.179)
 by uusale2a.utcmail.com (10.220.63.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12 via Frontend Transport; Tue, 24 Oct 2023 14:52:41 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1500.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.51; Tue, 24 Oct
 2023 18:52:40 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c438:5a6f:395b:8f02]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c438:5a6f:395b:8f02%6]) with mapi id 15.20.6863.051; Tue, 24 Oct 2023
 18:52:40 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] package/wireless_tools: add option to
 build ifrename
Thread-Index: AQHaBqtDf1037J8s9kiRH5jW0oy6GQ==
Date: Tue, 24 Oct 2023 18:52:40 +0000
Message-ID: <BN0P110MB1673BF7B11B050E7D5278FE0EBDFA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20231019203338.6450-1-brandon.maier@collins.com>
 <20231022184739.GU2607@scaer>
In-Reply-To: <20231022184739.GU2607@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_|BN0P110MB1500:EE_
x-ms-office365-filtering-correlation-id: 726a8e56-6f80-41d6-8e98-08dbd4c265db
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fVxKJKuhWy8IAYBnJlL9lLZ2w6gEaVbQ9NPfdAB5biQZ+9aMe56yIVjenYYkaCltGKLEad6rIJXnpI2vaSzLkR1LdwXDwL156NbIvWgEb5x+AD4z+giricCcNaKryI8Uf43akA1ICDbO5Pl/I8Mam45CGUPBVMCe70XKRLlT3YeX+bxv8t4caVhUMTO9MXhz/3RD59sXpjorL/FFAnz7j7mwlOsW4Un+DLl2ox0iFbAYMsvfjR8geHu4Avi7N2eOWGyvp6eA8jIH+4KiAR51eLsFujR08qU61GpeOUfU0+0WyEbTUkfMBksNP/VREkF7HNN1oY7X8T14VrtelTWRr3zOvbcLvASEH9J2U72lqbbHSV7ujwCTMmy6uEK+/RiIK5iml/n/aATP6gvQEEmF2L6Jet8Ak93+H9a1Lzjx1NpvO855+ZD+zgolNjl92O8oo3kgOCva/daVlTTKHZwxQ35UcG+9csApNeakRsqbHkF5c4q6AB2FTObx8lFxDDHiT1klgKcxGrHc9KtPP/b5IIylx76PjyO5QsiYuuk+QufjZL2rv2w+Rw/f4VVNu1YKiN6KOPwN0Fdf3fEwoyWTf7EXfy0Y1l9Z1pPSdl187CmNRf8nzmCowYGDFDcwXvjf0rMzZb2C4h5OfINo3RssY0CxGG6RwVMaAHz174YBTiusmkpvlcvW4/WEPa5deZlC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(186009)(1800799009)(451199024)(33656002)(82960400001)(38100700002)(26005)(83380400001)(107886003)(86362001)(122000001)(38070700009)(9686003)(6506007)(7696005)(55016003)(71200400001)(2906002)(76116006)(52536014)(5660300002)(64756008)(54906003)(6916009)(66446008)(66556008)(66476007)(66946007)(4326008)(8936002)(8676002)(498600001)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: rpBnV5F+2g957cHu/WsIsBkZ1wAWsPWztLwNUFfJ4RNPdnqtCT+DUSJ++UYUcuZB5Rolf+cSbwtB/5u+PTl9oRY9oKQye8S2Mzfue69x3cronODX3YUoERtsUrLZFRE7LvQEpHwqemxS4cuUl3bK3yh3dNROiACWXuPafu7LJeF/abL7CnviBrFQ+M/WPRe1lQz/bQVXSe1PPCoZxYhUu5q54YQUclrQE+i+Xylb/xUs7yDiHvjycuj8Vq9RnCmb4tyBzUtGNoxlk1q1B2WiZQFuVg3gOFv7vq/pwVqVQqur9VZ48yOHQmzrtpoJvImnAWXWCjAsZ2fQDY1LxGJm9BwXwaFB5aIL+jtftUF2F9tubnlZYwWtI7mb+eETG8AJMnR0vJH30DhpNowZJXBIb0Iw5dcBIQYyFzAHET6/fMs=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=iubLRI6FXH4Hy+3rC1NTGDRqRBBiN5+JwR314u/fzuaQHmCsPTED/l1pl3eOqTxG2O9nTEUAHB0tuBNV47ezUZRlRq15tl9NT/rdxa6PYEIfsZFIv9yr/GidW+PrQt6N37FJGYwFkfQbLcrXbcmbmF2PhRrS+MYdD6KNhfoomNspkgvsjNMGQzb3AuXXNz7V7OwwwKSe3iZU5PrgBFeCKBnJa/Ztkhe0x0dRDlSmaEH+ShMVXsxmcrYWIlp951P2SlkzaJo3R5Iwxm7D8q5ey7UVSui5WxyY08lRd4ye/W3syJpweK1ukGiczeT8vxM18g4JFWPBmEcPcLmF0X2A9A==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36xeDWfieoVNkxSIors1gUB9l86OkEJY9N440QEMUqw=;
 b=Z71LT1OpJrnIVoL0s3M3M23vYZFFCCJgsVXJ3dxLTlNhY9IgzAerQRmtmLOia1N8rc1OTbn54Z6dTv+mtwQyhTtI3XQCrpfxEzElG+0r877f+cDVV4k+phkBy8Fpotu4P6DwS1xOo17PCoRbO+a9g6iCDIFWjot3oNghVLHH32gLZ7nNswmvYGhanqGguPZJCz08kpY6WuFyEC/HuSR1llREOS/f5Q6uLBaJhOggFwRcE+6mGBHrVfj+J4zOsnpJ1NYlXbHPKbUXdiFBLWTMrtJTR4yJzsizCPSTB0n86eSTkXnojJ+/AW3RDYnEWaMOlUgeI/0NAZZ0nsm+ufwoNQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: EIPeACtTyDBJm16aZu67ADbx59yFNLBVMJVC3iBDyRc0i2ked0xPjxqp0xjmCwAGA6eAUeuPkRJBgkScZhUZe415i1KVG8fDaCaPaagsSHzEsuM+MjOsTkcki3rNAVm9hdfkXJvpDJsvzdQslREwudn7+f/3E6AY7rtLwcX/lLTV4OMdOa8NX0SuUQHXtS0FQVlUK75l96wZhX1F6ZT0+QZmE10K/cd5zOJ0s3UCOJ+u8HYyqH828UhnbpOGV+rxXpgcg0d3uHdOnDDC0gCDSn6S0SuxTm3GLUZa+ON4rsyI0jMs/mzaXhq2qTiGqphco5lw8a6/jhCpFfjiURnLrMWJVbQrZpWmyhHSOdq0R04DOARzjkm8WzW4jrkA9St01xTJxEWDpbvGH/3GAnClUmJTMA3b6J7bgry7K3xN/bGjsKMUB63Z0RnLnPPY4Hg0QhEd7WJ9IYTWIJlgA7YexhQub6+8zKKKUoP5XJpSd+CM5YVkdWr37Wl8OcaPtaT97Y576+TAXRYAydB8XdKf28p4BoAL1T4SEyeGCxbbb1yTnBWkxe1pfnQ6//WLxRPIVN0UO2dLidx+dmEivuH8TqWAMq3N5uawPKz3RU4cnv5I4yDaIxb7flLC88xKIRFLxQP0Zxwr7Jir4idAjXb8Ttr/QaUq9BzgNAHuGkRhZp7MVoDTmN1dzW4RgYQ6+3zKwyEjFNMtr3DAhu1GKjAkpeIsaqtyAOC/JqIRzGNFZ83H0+j/eBKy0hEzCGx5sVxaUqazlCaIma1aS9fPNfo7EZyDdgro0Jc9tIkXjpssF3cD7IpbH0+gCoVMJ6hM/qzL
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: 726a8e56-6f80-41d6-8e98-08dbd4c265db
x-ms-exchange-crosstenant-originalarrivaltime: 24 Oct 2023 18:52:40.0245 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1500
x-originatororg: Collins.com
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_18,2023-10-24_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_18,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240161
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240161
X-Proofpoint-ORIG-GUID: 23-N95aOxRdg1b8b6WGBrtGBt0IVGNAN
X-Proofpoint-GUID: 23-N95aOxRdg1b8b6WGBrtGBt0IVGNAN
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310240162
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=Qd0rrXZB0lOw8T9TqW8+kxcTf/ZNpd93Kg0SwNV9oDc=;
 b=QB7/F1G/k9PP9Jz+qXWJXOP09OgfKi0aPro0l4AGZ2NWUjeDiISvPq9dAmz5vO1vBqHb
 D4y3VsFXvqLyDtzSTqjAWZUmOLmW2IXTWUM4xW5ZNnvkKCyqparBuYRpAq+4aCoHPJXx
 hBLxVELFTLIFgl0D91TcLxPI0e5V/Nw0MVtideFcYkIa23eGFNZHlvikQBRtuoyyIkHk
 X0KiNr2MhX+gl6vDF08wIGdCq0W+Yz44/sl1fWsRBuB8ohPO/bqlDvREcNHGGtx1jEKJ
 F2q1iDE31/Xcin+4Etl7GQz8SEgxhPwDT/xyH7KZE3zBX4MbKU6qWW7M+ztYTltBqIcu AA== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36xeDWfieoVNkxSIors1gUB9l86OkEJY9N440QEMUqw=;
 b=PyqRDh5ETwKgZWeRfjtzFweQ0/3Z+QrkqhMpoKyxPdbwfizcNowBxgUmM9LM9ai04ZIDCNkAIOflC/pG598WvEoUfZqXTLRrcUb2o0HBAUZbVIZ1FWvUFJsFpSfrETOBg5fIy88DHyzeT2f71uP3SW/Br0PaMtEf6ilkxpjwzbk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=QB7/F1G/; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=rtxusers.onmicrosoft.us header.i=@rtxusers.onmicrosoft.us
 header.a=rsa-sha256 header.s=selector1-rtxusers-onmicrosoft-us
 header.b=PyqRDh5E
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless_tools: add option to
 build ifrename
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
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Buchmeyer,
 Neal J                            Collins" <Neal.Buchmeyer@collins.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Sunday, October 22, 2023 1:48 PM
>
> Those are two semantically disjoint changes, so they should be two
> patches, preferably in this order:
>  1. one to allow only building the library (and make iwconfig optional)
>  2. one to add ifrename

Agreed, sent a v2 series with the changes split apart

> So, if none of ifrename, iwconfig, or the library is enabled, then there
> is nothjing to build (or to install, below). In this case, it does not
> make sense to enable the package altogether.
>
> I think we must ensure that at least one of those are enabled, and
> iwconfig looks like the obvious candidate. So (elided for the sake of
> example):
>
>     config BR2_PACKAGE_WIRELESS_TOOLS
>         bool "wireless tools"
>         select BR2_PACKAGE_WIRELESS_TOOLS_IWCONFIG if \
>             !BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME && \
>             !BR2_PACKAGE_WIRELESS_TOOLS_LIB
>
> Of course, in the first patch, only BR2_PACKAGE_WIRELESS_TOOLS_LIB would
> be needed in the condition, with BR2_PACKAGE_WIRELESS_TOOLS_IFRENAME
> added in patch 2.

Agreed, it makes sense to require one of the tools to be built. Didn't know about this KConfig trick. Fixed as suggested in v2.

Thanks,
Brandon Maier


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
