Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78992C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 14:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA8B360595;
	Mon,  1 Jan 2024 14:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA8B360595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fINBf3tympP; Mon,  1 Jan 2024 14:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CFC860BAC;
	Mon,  1 Jan 2024 14:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CFC860BAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 118581BF35A
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 14:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD9A460BAC
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 14:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9A460BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6gkWEm5PoH1 for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 14:44:00 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB27060595
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 14:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB27060595
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 401Eb8Tw005532; Mon, 1 Jan 2024 06:43:54 -0800
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vajqfncva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jan 2024 06:43:53 -0800 (PST)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1050D40234;
 Mon,  1 Jan 2024 14:43:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 23562A00A9;
 Mon,  1 Jan 2024 14:43:49 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 142984044C;
 Mon,  1 Jan 2024 14:43:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8dJucVgTSjDU7CulMFqPCnDqx0syi+UBNtLtbDQZHAVepsjy9uXbrpB7xB2Cd0MN4QZL7wYeneBdHSunM/rs3W37g8G2R3DSzNEmhlEvK3Pkcamo/MgeS39SzB1/TaGeZsXnTV2KbaeOyamiZ5EOp5314bVU2Xm1EGt0/SrHug9hLzbyFwBLTASPpxUordzLhD/X4dA6ddABNmlgLICTypCUpH1XYJh7KepYCMXoKswEdrnEyhWus+PrxDTA9qSIOVn2I8ANfUxFaGeYFrYHZDVN81nupXlSestZS9CGv1/cbobkQxROEPBM31DhPhnjk573oSRZRYYOPDQR6NEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHrM7b7b9BXJmO7cX9qXyohElU5lSe83CWmrS0IsE40=;
 b=nZs+qBOVal+duahC7C+AV96wF/T3kIWBjwm6aWHmfHsiGJheeEHhCwKaGbqA3Yp9WWxwJ726RhOog7iPcNDQD5FoFIUkLFPjIX5VbCnV5XRAlaGzz1pHYszQxeiXK9+085MVfN+d+MxbjqzLfaryYzRX1T/qNsrDk6HIBAqemN9PRHDUk1qTWd22gop9t3lZOVrmwp+y4XMMW/776Gnow5A4oxELrZT6zZqFuKflYf0DgmhKzJH2vau67BQiIoEkwwdp3OxROzLNnS2bRvR2R15xGm7feIpYNvklJA91Jrh1+rl+th6qJBQKFpQ22bjrNLIMO/G6tLfvxllAeXL21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from DS7PR12MB9041.namprd12.prod.outlook.com (2603:10b6:8:ea::19) by
 CYYPR12MB8992.namprd12.prod.outlook.com (2603:10b6:930:bc::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Mon, 1 Jan 2024 14:43:44 +0000
Received: from DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10]) by DS7PR12MB9041.namprd12.prod.outlook.com
 ([fe80::ae52:c4c9:df7a:5a10%2]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 14:43:43 +0000
X-SNPS-Relay: synopsys.com
To: Waldemar Brodkorb <wbx@openadk.org>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
Thread-Topic: [arc-buildroot] [Buildroot] [PATCH 1/6] package/gcc: remove
 special arc version
Thread-Index: AQHaPCRU52T/datrvkKOXA7MaT/0y7DFCWBx
Date: Mon, 1 Jan 2024 14:43:43 +0000
Message-ID: <DS7PR12MB9041754BB696E49D8166F54FA162A@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-2-wbx@openadk.org> <ZZHI1pycJDszqP3I@landeda>
In-Reply-To: <ZZHI1pycJDszqP3I@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB9041:EE_|CYYPR12MB8992:EE_
x-ms-office365-filtering-correlation-id: 3d91638d-c43e-4ddb-687f-08dc0ad80d5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hhUx3a2RUEvWiW4pOa5L45eiyqyuOU7YMxAjQCtDzp6lG4YleafGeP6zdJ+blwtMxRkEjO/Nar0YnxGuISn/eGVwWrhM0Eh2N3pIxEU0MVMcGhPNG3QcjQaHCGLPXaO/qaA1ds5bFx6+mwjhsTt8k9kXVyNvWr3WfK7HhkjyL/0W62Pg7kDH1YFvhcNn8A3rqq2Cw0wL44qZXddXZuzCncfdkWcY3oLmU+lDReQFL7ruuQdVh4xR12fq7WE4/f047nQiqZepPM4A9n75noy7HJZ/imar5JV0Y6xohGCdRYcd+atpW6oH0iRypNqofaeXy2y7XpBngoU7tNJcKqQ7IBoNLYleZ5JwTas/qrNfNfutnhq2el9e/4A1Q2LrJFODtC++JLfNWHU1Xm8Qxt/nffdVvW4mwVZjp/uZ2pWMgBebqFfWgvyWRoiQaeYhoq2L7wXMbNHcOioW+X3C8oi0slC2A23Kg5QFmYZg7O97Y/LkUztALjiX83rTbj0Noo/RGOhdJYzSOrxd7Pipdup3Ct3Z0O1XZGD91+Mz407DS3ynaIWDTlAqeI3Xq9KtYMBZkP2Lwuutj1px4bsUw6vkFbPCCTepSFbCA+ROzTtYidWJ6Jp5iWsHJvnLRaMxHZ8j2l2fHuI+LjdMMTslg6X/FPnSz4nFJHRDiT50RKblZiVTMoURavSbqd/vH4VWLdUQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9041.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230273577357003)(230173577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(26005)(83380400001)(86362001)(38070700009)(38100700002)(33656002)(4326008)(52536014)(5660300002)(9686003)(71200400001)(6506007)(7696005)(76116006)(54906003)(8936002)(8676002)(110136005)(66946007)(91956017)(316002)(122000001)(66476007)(66446008)(64756008)(66556008)(4001150100001)(2906002)(41300700001)(966005)(478600001)(21314003)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ukZ7pNLEjQMQjTw0fC5+DAUxRZYMDStkF3YjyvGy559ZKrzg4eliNynQtA?=
 =?iso-8859-1?Q?jBloxJAMWSDxWA6f2/hurM9fFAlp38MSwcjqeBUi2tPjk/CWZHHi2SS9NE?=
 =?iso-8859-1?Q?feJRHCokxAliSGlNyORUqErjNTol0K/7kYecWcLzH9Hneiet+hJojDnkz6?=
 =?iso-8859-1?Q?KPtVtZI9gribXMi1IUmC31jt3fYvb9SYgsAat19MFiBIHjKzpffSAG2Qhr?=
 =?iso-8859-1?Q?tWUOn6zLDEPb4bQWXvk3qxp+zr4DeWlC+dlyyhVBeaIfeq6Fjz0bvpJXqH?=
 =?iso-8859-1?Q?UHoK2gA9Fn6fJcbw43QftKGEtAYs3dXBK+84Y+HBL2i7mGhDOVPLwWWLbm?=
 =?iso-8859-1?Q?cUUFhKmeDzfeAIDIXYTGttgRXLgNIgkuZ9U1W7jvrTVMZ5xdQisnfg9a+t?=
 =?iso-8859-1?Q?1U7ObASWGnMWj1Ij4GNg6VbASrwIX6t4sMlgRKOSajZVTZSoPkTfZNjrgr?=
 =?iso-8859-1?Q?+yMG+m67FAjjkrTy3ESTqZCuasBZ9YNn8KWskFccTxiwcSeMP4bxF1wChR?=
 =?iso-8859-1?Q?KJ6ub4aqzBCJn9CeorqhGQK2NEz+NBVBN8zXNb5dbUa4VBRgNZgBZBitQr?=
 =?iso-8859-1?Q?xnu47Y1FNbNHOXZSmmBODb14OmwzzMMHD+q1vxzXc6W3vsnRDA6jxb/sTW?=
 =?iso-8859-1?Q?Mx+qttxE9xg6k594qhyqmtpC5Egg1NelAVhzc7rbfhspPfgpZg75nRHScB?=
 =?iso-8859-1?Q?hUGe9cVKMG3FvKlwlc6yPkV2SYESiUN+ZHHA6b+BMB0Cll9G/rumdiP5Iz?=
 =?iso-8859-1?Q?qTJgI2GezG/bGe4RzHJMuqcvdXKUhI0Xa3BMJThwV4aLwiPsss/X6Y155v?=
 =?iso-8859-1?Q?xIOxfKHCZustxp9YXA8gq3u8DhxrK/FSngn04KSs9h2tjwTqYOHIu9B+Kc?=
 =?iso-8859-1?Q?weobOxEOSVFFc5hTqdWnGMcj/f+HUf8N7nFzYAQLP/sSjUNYTx6Y81/ccN?=
 =?iso-8859-1?Q?SbtmJ84Rza47Ymc4hARx5ADatGTaiyYVtHHevOzZIqyJ0af61v4iEY7gzc?=
 =?iso-8859-1?Q?n9ltrfQBmJoyveu0/BZxJow5Se4gez5+tyqYmjaKIGdqKxpJDrpwHYkV/z?=
 =?iso-8859-1?Q?QORCmde2peQ1Rys/x3GLvDquacLl98Y6CKAND8KYDNQIrOjunssO2UCrqj?=
 =?iso-8859-1?Q?kOXBu6iFkUXoorw8DxikLYUGWON840RbBQnilTlFwrtPQpcqecEEPCmOUt?=
 =?iso-8859-1?Q?oGvq/5AuCBJ/mPetVtvw/p6QgwkR1aEJbcb24QAxLBYAUzuWYy9MZK+IUs?=
 =?iso-8859-1?Q?wXuKVQXmSclyYbCFvqNriqPohD1g6zW0zNHmOsIE3uUn8Dq9gBH2xm98ym?=
 =?iso-8859-1?Q?ZebyS7tsVnpvixBJ2sJKy8hx+EgaWEr9j0AN+fl0XYO1bCFaNyv/LwzLt+?=
 =?iso-8859-1?Q?7danyCqhkk+UINZQ7E1xAuh1rdVe6WhGcOT124pu/ku6f/Y+aP1KiVeA6n?=
 =?iso-8859-1?Q?VuRRSLfetNijqTEF0uNEzFG/+7W1eafkytvk8Hco5fJG0RPHpp1ISfYxme?=
 =?iso-8859-1?Q?wUUZw6V40n1mIYTTjQ8MRuvZ6DvJQWtYNgVbR9x1NqzguEOEx5g89vVrgA?=
 =?iso-8859-1?Q?gsfnwrjUGcSSlHYim1GnpVjMdN0TlC0WYiq8DUwlRI0ZiPCyvbHc+4uccx?=
 =?iso-8859-1?Q?9cX9vnwnGFrKN4y1MxycoIdnXw3ULHxe2m?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: HJkbi0oft3Cryqym+Chpsyu6/EcrQohMRrsroWUDWoPzufLfGwqTHjznRsVs7mVV2CtoAD3PIU2okMqHtQcxRxoUWO9bQPnpMOaGHWn3b+RM4u3y9PaF/Uw+/meZboLhklh/wtwYpvDJQIXU2+o+Fpvc9Jvz5siNW1KZ51t3WYmvmWm0imiCaljuxrqm7jFwbCUELbYpRnaxxKnqSfB4ASrfekEoxmZNNfJm5XkF+yqLopuLhMcqwADy3JHbf1sSy4iCeh42bIQexIXjnYAFXdMZkMseYlfOLFTn0OYQbQF3WqiYtXv9hp5knf0PDv3Y5Yh3rEEOup1laBPAgoOYzLV4PwTCXagaY5pmhMmk7E9SFUDKNghfO++NEAC81yvlrJpByrG10vi+c3a3/YS+rWpZ/8s4DOR5DO6MROu8FtsRyMC8OfcdtBo7u8o+/GB6YlARLX9FSwvEZZMGrrBTOHiuUFbWnMpOviKQJ3K9JF0AXdgA9IIw5CKKHrxlIIEigfIfeTZN0Ub49V6UpwYOCz0u/45jI7uwPAHQ6OPzq3LZlm8S9BttcP3mKXbRKdQxh6K+Kap6Ycaf3r1XG3PInIt00VGx9lC16k4+Mvnk4Mc2skYUBxDDcqh9IZV6J6J7kiU91/TKYd8rCK1M1+6XXg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9041.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d91638d-c43e-4ddb-687f-08dc0ad80d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2024 14:43:43.2919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84BHoMrAmcASTQY8l1dbmI0cRf5cyBQ5ECSe3Oi1FlKu78xsJmuui2LxG38C8/0E4SuKT5Uhw4XuYcoULeYWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8992
X-Proofpoint-ORIG-GUID: H5lVtEiyFH_S6QDNHRWNd5ToJ-SnOFai
X-Proofpoint-GUID: H5lVtEiyFH_S6QDNHRWNd5ToJ-SnOFai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401010118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=PHrM7b7b9BXJmO7cX9qXyohElU5lSe83CWmrS0IsE40=; b=
 FGUeFIqbrtgfHGRRkTnH4C3arXVEyzkNiNPbNQpUBKpHv+Rsyojw2/G+omYFcHHM
 9ECTbEgV3UIYLY2f+MO77fgtPqg06vwU/tNlL65BpYkPxqkYA5Kb45Jrto3d/Onl
 vwqJxVTmHO7jNf72XD2BTJuGJVR3OEp+3cJZWL8vwfQ1nDlNvaES6Jl7mdS0RSbP
 ewIAWZqL6VtV8L37/M+x/vQYdur5ABzjbzv7c9u0omEsg9YC+jVFZ8bkAUTIOT4m
 0/VR86+TWpAie4ql6rJ3SjBHm60ipvDzWCh0cDi9wYZO8Rqa3s4PxQDVsJn4QHOb
 +Cp0h6R2NsqDiwdCVvSBAg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1704120232; bh=cyGKle3ZtcHDJcp41dXGcyKeb3A/wlii4OugPwIK0jQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=f+tv4UYw8DC6LqjcIAiztiihfRksdQzviou4sji/dg/5Wp6T5NpUBptpV8VimobjM
 kuF3+40/KoOzDVaJ1JOhNKs7mumi/gFNkVpQEEGKG4+EoFg07+adL5yDf5rit9jNna
 4mY4ijVPRN8+ujgWt2dad+f9TD4avz3ioD99mV3PDnTqdALIvWR8A1D88BFgy3V9qN
 s56Y+NMlilEUT+0Zjdhe/M2VYMXltQyULL6Wj41ZlfIswv/jmfZnSL6jWFrtqi8s1M
 NcYFdja5m96xBHa/a7RSOrxPc+f09+0RmyVis+PUG2JYsBdAu1mBHlR3f7upJUH3fB
 r7jM+FiYmybFA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHrM7b7b9BXJmO7cX9qXyohElU5lSe83CWmrS0IsE40=;
 b=wWSLr98n5Eh9yzqe71jmcSqCr87eeDDHAHSRckxvRnhtIihl174STm/0jDw7BmOBFRRXp49sIaZ1CSqUoE6Aj7hd5V2/U3XK9FL323pRR+rlIyqtxGUdAhNYF0lkwCBIeWyzHw2TBd+dWEpdm/7dGimTqSDpgXEkiidwcz6xgFM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=pfptdkimsnps header.b=FGUeFIqb; 
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=f+tv4UYw; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=wWSLr98n
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=wWSLr98n; 
 dkim-atps=neutral
Subject: Re: [Buildroot] [arc-buildroot] [PATCH 1/6] package/gcc: remove
 special arc version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear Waldemar, Yann, all,

Sorry for a bit late reply.

> On 2023-12-31 18:25 +0100, Waldemar Brodkorb spake thusly:
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>
> Thanks for working on this; we discussed that with Thomas the other day,
> and we concluded that indeed that would be a good idea to get rid of
> that special version now.
>
> However, your commit log is empty. It should instead explain the reasons
> why dropping that special version is now a good thing.
>
> It is very importaant that this information be recorded in the commit
> log, because we may (will!) need to refer to it in the future, when we
> then wonder why that was good idea.

Thanks for that clean-up series and indeed it makes a lot of sense for
ARCompact (AKA ARCv2) & ARCv2 processors - which are perfectly supported in
all the upstream projects.

Especially it's nice that you went that far and added confing and instuctions
on how to run the Linux kernel for ARC on QEMU - that's much appeciated.

But as we discussed some time age there's ARCv3 ISA which support is being
added in upsream components still and as of now not all the bits and pieces
got merged upstream, thus we and our user have to rely [sadly again] on our
GitHub forks, see [1], [2] and [3]

Funny enough uClibc as you know already has full support of ARCv3 starting from 
v1.0.43, see [4].

What's also nice, both 32-bit and 64-bit versions of ARCv3 are well supported in our QEMU
fork [5], so relevant configutations will be included as well.

So given that's a short new year break between work fires I may quickly send-out
patches which will either:
1. Bump ARC tools to the latest version 2023.09 (see [6]) which will also
   add support for ARCv3 (in fact we already have it in our fork, see [7])
2. Update ARC tools (GCC, Binutils/GDB & glibc) for ARCv3 only, while switching
   ARCompact & ARCv2 to upstream components.
3. Given ARC seems to be the only use of non-upstream components, remove
   ARC-specific tools/forks from buildroot and  only enable ARCv3 use via
   external toolchains.

And while (3) is the slimmest option (no need to add or rather maintain ARC-specific)
code in package/xxx Config.in.host, xxx.mk especially with uClibc it's a bit too
restrictive as users may want more flexibility of configuring uClibc to their needs.

-Alexey

[1] https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/tree/arc-2023.09
[2] https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/tree/arc-2023.09
[3] https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/tree/arc-2023.09
[4] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=de6be7bc60f190a0d746945a3a5a143bc93a1a65
[5] https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
[6] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2023.09-release
[7] https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot/tree/arc-2023.09
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
