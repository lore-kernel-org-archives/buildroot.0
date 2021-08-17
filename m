Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA76CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 17:48:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EAA860FD7
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 17:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EAA860FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=thorlabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F25A460699;
	Tue, 17 Aug 2021 17:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XHLrLEy6CHJQ; Tue, 17 Aug 2021 17:48:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AAB8606C6;
	Tue, 17 Aug 2021 17:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7318E1BF2F3
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 17:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6862D80D3B
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 17:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=thorlabs.com header.b="La5EMsxn";
 dkim=pass (2048-bit key) header.d=thorlabsinc.onmicrosoft.com
 header.b="SjCzb2O+"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DseS1M8S-B8a for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 17:47:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.thorlabs.iphmx.com (esa1.thorlabs.iphmx.com
 [68.232.130.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D35D80D19
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=thorlabs.com; i=@thorlabs.com; q=dns/txt; s=thorlabs;
 t=1629222475; x=1660758475;
 h=from:to:subject:date:message-id:mime-version;
 bh=efmT4NAwMyc8Ofnhcg3hr2bE3VjAkUjuZiF83wGnnAE=;
 b=La5EMsxnUKM5o5XSotAQLulhIyR7N/rQDCbFYquy4pWuU23CXcoMVLrv
 Vf2EC2mILXKpZYp0bJH02LuDAvijU9hNPwoyufnDY9bxckBMV5ZIjAGFi
 2mg5K/e+2BjxzKeCgTK37h77B8HbPdno97+fNPa/3IrK0IAbD5Fg0B85F k=;
IronPort-SDR: ZHe0QzzbnW4cUSOVCfdWfcRojFtO6f/FMKeZ2/XiiuOyU3rcGmdq+jQihh/0xERgEfC68Q3ygH
 K6F/N3QVOpcby2+j8QTMMx26iaoPdLjG1M03HXXdY8BoNieUvpL4yTPTJE0fYLiuzWOznhnRCu
 egOg6AcuQ2JS/MF3Ls6bbYfVEMGAzWkAgUlY3Cj5iv9Nl2NH5kw+XZev69PlmYKuqJGf/1RviP
 60DAAsaxbqcffHB7c3ObuRAEKVrwoYLmzTjHH35r/rJNw7peVT9HI4pkv3FSrq97VhxgIq6q6F
 rxqcOhbgcMvh+kD3lbgvi8IV
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; d="scan'208,217";a="28119343"
Received: from unknown (HELO mail.thorlabs.com) ([69.172.143.205])
 by esa1.thorlabs.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Aug 2021 13:47:53 -0400
Received: from NWTMBX01.thorlabs.local (10.1.1.128) by NWTMBX01.thorlabs.local
 (10.1.1.128) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 17 Aug
 2021 13:47:52 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by NWTMBX01.thorlabs.local (10.1.1.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 17 Aug 2021 13:47:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjppaLzDRNIDuS20Bd+wPIwuku1C99EtUpzNAiv2hfzetZpWTmF0AEKDLK1BFO0FpgMdSKQz+xL8aYdoNQ1PC6RWkoDktvOqgJql7qfvh3REVknyN6RCA6sOcKf6ONAonJwLffyH+aJEzhgRd2IwUhsGWWupqG06QBubhChezMjycHLVboxPC3BdRUQBYvQ3wEF4RNB2pjTRQE2+/uaAHYdes1QXuEn8/0fvKl0yZblBfz6jNDN/T4+ApwT5sPuStI+/JyDUx+sCE+gKs9biJmWzF0DQIEsvA/hGH8i7ZxhSFYKE++dKUX5ul/YLtrjGvNxtBYXZ+qwG3qVz7A9hZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1SijLH46cnDfLE9snEUng+X0kMLv60F5dgvkoEGibA=;
 b=D287/FOlv3NXT5gQYYRlWIepJ/MEuUjy45fUizUdnEy5zhi+wYy/In7A+fkJvOlb5MZY9OXPuS5lGX36noB6T4tnqVXCS+TKAI/9Eo6ef7onjibUYNZX8oINVE/IaEGV5o8h1AiEF+4HdEbVNn7VqRhdMoK9Vj3GdOLn5vD62caaPivSO1Fp7DUlMyo69UYo1LLgYptrTlpKQUw3HNi0WH/WyNUI/Jy1H6G13l6TX1pY4g0vOodj51g2YyvaCwc0kBZxOM+perRmkyRRzhqu4g8eowVNouFt3DJ4o2wszYUm0Tv24EDb4dCVeWoYrYc05Y0TKNwHhQGG07aUg65XKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thorlabs.com; dmarc=pass action=none header.from=thorlabs.com;
 dkim=pass header.d=thorlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thorlabsinc.onmicrosoft.com; s=selector1-thorlabsinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1SijLH46cnDfLE9snEUng+X0kMLv60F5dgvkoEGibA=;
 b=SjCzb2O+LdWXhGnNKa9cxnjXq6p1bR45o7/cWdS8UGAGl6eNRJ0sYDsWSfsJZf2M6vHBxUNWGUaMeJUfKFerfZW16DM2Geaxo1iU6nwBhsc6Xt6iW6cDp2KN0waRQU0+V6yqqi9ccPTdKDHcG8ml8yoBCFus/lL57l+HRaalAtsyGqye6+IBVd/HWwc3u1eD73JCMoijZZ5SQOpYqKkrs0SK/W2nZTdXxcGRzprVgNPLOgsI4LQPXhtRQurMp0VAYyVHG4jdvvgbx/0WhKC5AMeDNH3/CEV/Bhyb0FdUQSaInIkWy6BDEHwrueSlk1iDJk7O3qPNnSajFZ0jYQCATg==
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com (2603:10b6:a03:2af::13)
 by SJ0PR08MB6831.namprd08.prod.outlook.com (2603:10b6:a03:2d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.22; Tue, 17 Aug
 2021 17:47:50 +0000
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::20af:6cb0:30b0:21a2]) by SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::20af:6cb0:30b0:21a2%6]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 17:47:49 +0000
From: Scott Bartolett <SBartolett@thorlabs.com>
To: "buildroot@busybox.net" <buildroot@busybox.net>
Thread-Topic: EGLFS Could Not Find DRM Device!
Thread-Index: AdeTjscJqPkSzUsVSa6jAVwDmlU2qA==
Date: Tue, 17 Aug 2021 17:47:49 +0000
Message-ID: <SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: busybox.net; dkim=none (message not signed)
 header.d=none;busybox.net; dmarc=none action=none header.from=thorlabs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1fd9308-4c93-44f0-aad1-08d961a72178
x-ms-traffictypediagnostic: SJ0PR08MB6831:
x-microsoft-antispam-prvs: <SJ0PR08MB68310BEE21FAD046206B7912B8FE9@SJ0PR08MB6831.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b80rLWyyRzkGsEzZTVoCujGh7UTbkIFhYKp7nerL5RBoUN1g7NmJ+NVGelY+DytvrkkeNv9xdwSvooe8lTylq0KOln9BVvxAbhNeenE7Ra94r4nnHwsn0nTnVXMYloNOFtRjiOJKHFQvGmCvREk2O8dnpM8Q4aJ2ijfUZtRFKZD0UqppNJ0YNmdlb5YOut7Pk1NybLq5UmygFx+iCA0WRkNhS4+YnGpqBpNvrFBXuRkcMmTLNTe4eP7tNhRAzBqW0WD0+WADcym2pFQdx0MRrXbC5xldA4E+pyYu+0k/GmcBupPliO8305OXmuAslUzc+gM+oXD88jwHf2v0OvmlFzYei8a/xDm2KV7WwdUtqcylRFzisr+hbGkl9leBZC/88SzDXRcrNV+ixpJjL/pbIjugyqV+FQ6X66vUrUhxSuQYcQAydnxCsTHUjLbi2CWZcMLDx0IqyXO3ZcBGM9eN+Pj8JUOiVZHaM/ou1rOgmwlepDL1vGRBtdCMh53YvT94vgxVSR2c5tOGVWmetnhiyaa7iFyt24zfD1xM0+dHslcs4SE2Sfu4dgfngqk2A1Wv+MlnJINLdmL3yWfQ/HHJ6YAtuPhC44xruIec2kgGoZol7fAGphzTUsTCsfC1M7T+HcuUUkVh4X5fkJNoEJMb8MJVn7KolIPCAETnq0pB9RghY0eG7tM1wPYNpmHAPARzrzwXMB9i+7YH9wk6hKMthA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR08MB6542.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39850400004)(66476007)(66446008)(2906002)(64756008)(38070700005)(4744005)(83380400001)(8676002)(52536014)(66556008)(478600001)(38100700002)(122000001)(6916009)(66946007)(6506007)(9686003)(71200400001)(55016002)(76116006)(33656002)(86362001)(26005)(186003)(5660300002)(7696005)(8936002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IaRszQNVJj8RKvRc4TucJG1HoieofpSplK1FmYpVBsmWH/AyJCm4sXDkRbsH?=
 =?us-ascii?Q?AwpWUszm1eh/bjVXOwSn5QFf8hZXseK25uc4FjRFv79US6CPzYxzjhHA8ejB?=
 =?us-ascii?Q?4H1xzy4FFPrEJRZFgO5i5IW2pUOsi12CgLnVAHO7U6vX0MnytUQQ58eQGaGI?=
 =?us-ascii?Q?9XYsgPh9CW3StPr+FY/djEUc+FoPj+ht97P1qG8tVTxA3Qpsps2FfAgnw1Yf?=
 =?us-ascii?Q?n7yBAviUXGMDDTyMiQKsxgmXDcd4Cg3xfXsYJpx8VFo5rcKRGcEyyOwFKugO?=
 =?us-ascii?Q?XAHFg4JKt55ECCpt8F9hjNvTsOlLCVgJM08shUp3nQlHzxyqPb6hRLyXpK2h?=
 =?us-ascii?Q?81qsEzwtAVGIkP+RZNdmLdGiDEtDsxB25Xda0RcDgvfPV+q5isTMHxcxgUlO?=
 =?us-ascii?Q?QBUtu2G+R2Qa/Tr9EwEpo4qeNxUidBELY3a4neScdrgC/71V6QW+uC2qmBNm?=
 =?us-ascii?Q?w7RiUSP0kW4lR3NbqWOCxs0OONB7iAX1AKhZFfwfmcUaSrtwpKGaVurIdqSY?=
 =?us-ascii?Q?hWZlKpdK76ePrAxRe03uwfXy+I3xqVyXmJ0uyPAuZFQMvPVJ3uBMvlU0b/CG?=
 =?us-ascii?Q?FpF8XXZm8+gtg22cjf8dmg4IVZI1h1cr+EXoEN5ZJowwEIJWOrcEXoExTGPt?=
 =?us-ascii?Q?IhMOcxHVtlfmmwUGF8rn1AQ4Zq0bPRKerNBE3J4dnKpMQRFRTc8Xa43imE9v?=
 =?us-ascii?Q?8KsGM68LrdoZRqQbyvJXDnj43qHYVj5/J9aFCmEwqJuAIzGR36GCBq2AFhOi?=
 =?us-ascii?Q?yrZd5VkBWC4RBnnG4b3Den1AxyYe37Qc8bCkeLiW41S+xJz8TSQSopD0cNBl?=
 =?us-ascii?Q?V1VMHRxhyRptBdeGNQMn2eF2bHjLbXeHOUK9/+rlji5kyh+LF75tGFuy1anw?=
 =?us-ascii?Q?M0ZOPFfRMhK8795wXG9IKHFA+4VR7G3LSsx0rW2ye/NIPERtXSuY2ttGlASd?=
 =?us-ascii?Q?SH6anDbzM0/oyHip36HevT3yCPHs27Ab7EMXlDkWiIVlW6CAEnhMz6UlHDuE?=
 =?us-ascii?Q?cMAJSb/n6he2E6OrtjCUYoahyRGHEVlv//sQISwlVK71CWawqCE3OmX+2OrS?=
 =?us-ascii?Q?jIKNbmwVQlyNAxdU+/T9IPiVjFXBz/5VGOu5kcZClfG+qh8BTWrcXJvK8HnK?=
 =?us-ascii?Q?T88i713eSv1oFjHnDp/Ko51+pqSOxFOemIkjfYMQMsWzq3j0JraAR4GqlP7I?=
 =?us-ascii?Q?q55enFDTP1FDFjpeEtWpKQKd7xc6VuCjoq0mXFlwWDtOZFX+pxIS/RPCbUzh?=
 =?us-ascii?Q?ApDkDwcein3a3bW8xObnF1JmQcjer6oiRVzT0QazdiExfwinV3LPCJU6OuCK?=
 =?us-ascii?Q?Nmdu/3SY56r9AGDLDRwHncqw?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6542.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fd9308-4c93-44f0-aad1-08d961a72178
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 17:47:49.6344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 41151004-4224-448a-a787-d4279c1f087d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjKOAz7kqys9Olsn1bCVZfZnRLcm+kUh4gRLPioFcg271ALp4xyAWO1hbD/Q+gIAsAgBoztUGwfcAhmWm/7knA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB6831
Subject: [Buildroot] EGLFS Could Not Find DRM Device!
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3768128566655916025=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3768128566655916025==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9SJ0PR08MB6542namp_"

--_000_SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9SJ0PR08MB6542namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to run a Qt5 application on a Raspberry Pi running buildroot.  T=
he application runs fine when I use the platform plugin linuxfb.  But when =
I try to use eglfs I'm getting the error that the DRM Device is not found. =
 I see this error message mentioned often when doing a search, but so far h=
ave not found any solution that works for me.  I've selected:
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
BR2_PACKAGE_MESA3D_OPENGL_ES
BR2_PACKAGE_QT5BASE_OPENGL_ES2
BR2_PACKAGE_QT5BASE_EGLFS

Does anyone have any suggestions?

Thanks,
Scott


--_000_SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9SJ0PR08MB6542namp_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m trying to run a Qt5 application on a Raspb=
erry Pi running buildroot.&nbsp; The application runs fine when I use the p=
latform plugin linuxfb.&nbsp; But when I try to use eglfs I&#8217;m getting=
 the error that the DRM Device is not found.&nbsp; I see this
 error message mentioned often when doing a search, but so far have not fou=
nd any solution that works for me.&nbsp; I&#8217;ve selected:<o:p></o:p></p=
>
<p class=3D"MsoNormal">BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D<o:p></o:p></p>
<p class=3D"MsoNormal">BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4<o:p></o:p></p>
<p class=3D"MsoNormal">BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO<o:p></o:p></=
p>
<p class=3D"MsoNormal">BR2_PACKAGE_MESA3D_OPENGL_ES<o:p></o:p></p>
<p class=3D"MsoNormal">BR2_PACKAGE_QT5BASE_OPENGL_ES2<o:p></o:p></p>
<p class=3D"MsoNormal">BR2_PACKAGE_QT5BASE_EGLFS<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does anyone have any suggestions?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Scott<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9SJ0PR08MB6542namp_--

--===============3768128566655916025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3768128566655916025==--
