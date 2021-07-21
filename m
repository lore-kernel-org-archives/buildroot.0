Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE31C6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A07161208
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A07161208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=thorlabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EA21608AE;
	Wed, 21 Jul 2021 21:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QlcIP_MukY3; Wed, 21 Jul 2021 21:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5348C607F9;
	Wed, 21 Jul 2021 21:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A27B1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05A9882A87
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=thorlabs.com header.b="e5xgf6Y2";
 dkim=pass (2048-bit key) header.d=thorlabsinc.onmicrosoft.com
 header.b="qjGSI0Vn"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ux4S_3V9DgUg for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:21:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.thorlabs.iphmx.com (esa1.thorlabs.iphmx.com
 [68.232.130.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 292FA82A2D
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=thorlabs.com; i=@thorlabs.com; q=dns/txt; s=thorlabs;
 t=1626902513; x=1658438513;
 h=from:to:subject:date:message-id:mime-version;
 bh=kthR6T+oTHEpfk2+OcyQxZ7CiPEC64eT2Aqit5PB2pE=;
 b=e5xgf6Y27vJqjzXc9CyMr4qqNTaw2g6egBvu60kx55obWGMwKLnnqxFt
 +XL/T7hvWD01IWrlvKvJrH1RiFNuvin65oN0XGWHmYx/j3UyEph0p2tui
 jw0l3W0un1rbe9hFKCeIFco/XdoDvClaiSz5tWyY/+jcWL12LQIQq44rz Y=;
IronPort-SDR: iNdy+iDYEtKstUj741OZau9FkujLW7fWaOv/6yqB8y/Tb4tP9v2lU0DNwAuNZUTSbnHb5YCRtS
 SwgoZ/3uaYZ/b/AoTJP2qoxHFWUeyONMslvFRuHuqoWGUM0/kbRhEcGIHdTnSTSwe5B6eT0JQH
 Hmna4XEZtLWIhMvtzAbSv6d9zBB/1OjW0NDsMDDi41Fs34AyET5kTN743XRB5CALQrvqy/fJhB
 Tu40XhkqfnkOo+KmgZ7N1vXDVjWfww44WKcwsXSbOassJWaRgvDRQEziEP3ANsTyCK5XcwAfK+
 utMvUQqGOvCdgwkhtmSISWVz
X-IronPort-AV: E=Sophos;i="5.84,258,1620705600"; d="scan'208,217";a="27996321"
Received: from unknown (HELO mail.thorlabs.com) ([69.172.143.205])
 by esa1.thorlabs.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jul 2021 17:21:51 -0400
Received: from NWTMBX01.thorlabs.local (10.1.1.128) by NWTMBX01.thorlabs.local
 (10.1.1.128) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 21 Jul
 2021 17:21:50 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by NWTMBX01.thorlabs.local (10.1.1.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 21 Jul 2021 17:21:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4xZkrbHVDmaUzjE5Tsw6WpX0fj/C+TOxGIRVbBYNZbm1xCh+PgBXtKmmVm3AcspZLwErmNcYCpv1frwXc843RfNL+cNS11ag1/lh34HeR+3E4HwROkndMT+BLFEHFskyrkdtj6PTt+dCnmle6OUIuxh9d3icPbQD8mgo11hhaUlVPNaZJqZ/ckWV63dS9I6HFMo3codv8JIIot3wbpiiKkyXQntU8kCK66xa2fRGSmQWRQCaFzpEzf0N7scl0GYq4QomwKWRvjVn7jXQ/JzuH6ZFTZYP1nfd7kTcPtSnC1PFAKt7Ovtt0cICHToKOWQHxh3y1XRC7wjZBJ0d3lEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MfzZ9NkFyJ/VE0IL0jwL1rzOq4snrdOa5S5oR/MrKw=;
 b=lRnCeVj/z+xS6BsE3DIlOtCci6sr9g0U02iM0nI9SfXwf15msbbGCdyYg89WEhjdEebMBVsR41+B6mG+4IUjPMLJSpRFicVz38nHLFUaiqXIj7KoYf1nhfelWwWa4XjQa1CtBV8XShFME02fobakD0Rkh4zKSvJb/iehOUGPQDVi3m9NXH6ywu9THd+4mQ/EqN0oxechETYPFqVQ2+oRDSUiNt3DO79yJ0Fd8lI2oAAfy/LlQODpJJPKVMQDEcZXmHxkht06gsymFmT9aQ2zZUShnyy2UIsZU1yOIZfYI0dD6f5ij4daBZPLgMJs1Vuq1G2ImRd6MxBJEpZw+h5nyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thorlabs.com; dmarc=pass action=none header.from=thorlabs.com;
 dkim=pass header.d=thorlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thorlabsinc.onmicrosoft.com; s=selector1-thorlabsinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MfzZ9NkFyJ/VE0IL0jwL1rzOq4snrdOa5S5oR/MrKw=;
 b=qjGSI0VnSfa6YsFPconQKkBV1Y1sv66HTMgIKafhn9oAITl3QmvCeguKKh7K1tb2N5uxReV+6JOQQ2Axj7z7XzyyLRHz9/7MU1TXNiaj548EAstwDiCllz8maGGPUOc4WeVB1GOiMos/D3VeBjMsRrCkJ92tmHlyzHYMLSIZ/zWY6L8TwdnPl9da7w6vwcB+wbAhfAMFVUPGFxf98hwZDbh0XnoOaTITmfqL+sSMpJYNQvCMiEE5X3jYA3Cckdm7Px/aOMLBp4ac4m/0UKG6x4fL7MWozgqWaoMN3uxFQ4RQDcZ/KJNtrmm/PdwvZdJK3pCjmLwFPPwA6jSa+Fz8qw==
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com (2603:10b6:a03:2af::13)
 by BYAPR08MB5223.namprd08.prod.outlook.com (2603:10b6:a03:61::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 21:21:47 +0000
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::1108:4d3:7420:23b]) by SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::1108:4d3:7420:23b%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 21:21:47 +0000
From: Scott Bartolett <SBartolett@thorlabs.com>
To: "buildroot@busybox.net" <buildroot@busybox.net>
Thread-Topic: BR2_PACKAGE_QT5BASE_MYSQL error
Thread-Index: Add+dDTk7NCz9tEpSDmJ4aAQ3kyQew==
Date: Wed, 21 Jul 2021 21:21:47 +0000
Message-ID: <SJ0PR08MB6542F0679D01DEF2541E4B61B8E39@SJ0PR08MB6542.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: busybox.net; dkim=none (message not signed)
 header.d=none;busybox.net; dmarc=none action=none header.from=thorlabs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e758e01-02a8-4451-4da6-08d94c8d8c34
x-ms-traffictypediagnostic: BYAPR08MB5223:
x-microsoft-antispam-prvs: <BYAPR08MB52235783455ED26D060E5064B8E39@BYAPR08MB5223.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /TsTDlPmhUYwZ1uwlMbG2GB1xCLXvaIGxfDE1QO6etIN9z10PWLM0GPMwTCZEADOxVVcrkSqus57wGz6c4p1ynTZwLT+fiflgMf1EEVphfgqolK6SHwWP0ff47bN2RT3iDaJdB0D4OG7UKK8puzT7ryCWpCPhoSfhMv4c0VVzbwBRwWsLwOAN12bSqYt/v0NDaNpp2K+SAZMUE9CnCSu6oEGN9eARvP5VSpso2SbO6RjJ5ihJU7woXNsB6uBgb61hkw8DeP6K0+UHsRuQJgy1g4aANtqBb0Chq9LgdxPv9RpZ2u0Wa26ZZGIPqdpJSzAe9s9zGjdbrn0a5sqkvbgAkxFJj/qB2N//4JiO9SkmxQLsbOoNvMmB+dJuls4YvHBSYitifhoy4CAJUDBu9ugv1XOqpiH/lbJJO0H5BVozBmxZ+VKXIus4+4ApAyhoWzJ4XdqHxacJIhBYwmZ06X6MqhCyg9cL5vZGhOyeshM4Y1uE06NX6Cr9v1MDte9WrqnwYhspNjwpXp6S/t84rebTZjHYqvjXx6eLi6ZcWydThLSBSMZ+fuDof7DWJGh1uNU3MoD60SDHJUJMq9iyn1jn7bvmHpwVnIDGaNBkEfNICWUrGzdq0sd5MwyW57U7vKOtatAs25MstVthEceEdSO1vNhkLS1KJDPj2irCwESymtOTweCyOCrdie/TocJZGwQB71hkSVQX6v/RntoMHvBbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR08MB6542.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(136003)(39850400004)(346002)(316002)(52536014)(8936002)(66446008)(38100700002)(71200400001)(76116006)(66946007)(7696005)(86362001)(9686003)(122000001)(478600001)(6506007)(5660300002)(66556008)(55016002)(64756008)(66476007)(33656002)(26005)(8676002)(6916009)(186003)(2906002)(4744005)(7116003)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dY0v2alBBnNURfODJpdyu5Qvdttc9BK8xJwWFNHtp6wyOAmxL8vfQqoe0Uiv?=
 =?us-ascii?Q?LSocicnfTJdtYBMC2WjGJ0X08pNF5jQHr+uJRC6IvB9L0oJtQJP/ny4q/hPD?=
 =?us-ascii?Q?cR+YRxHHjttJYT1Y3uYBwLvzfWVBAFU6HNuFtjRFTR1VPbCJvaiPFnvwU/qv?=
 =?us-ascii?Q?bTBbrNHuAztjWYMjEYBOAOmgaCC6oIqnITr8JMG060F6koJyTv58wbYEpmQZ?=
 =?us-ascii?Q?EAxQ78MSXhs41vqy56DUuNgQO5GKD3ByJbt8S+zYK2/Bz//fUQ0j5EgKYVmD?=
 =?us-ascii?Q?M4q0PG2JpUZtaoZLv+wMD6ZXYJbUnsZ2oMMqdhhS2RKBgu7VXxzgNGVtWDIP?=
 =?us-ascii?Q?c10XONg2J7pRWtobPk0C7VldW3v3RUU9ndnp3V/NUmBKhNvroU7Y/LBvuh2b?=
 =?us-ascii?Q?bSGxElpd2N/en9yn5D6iWflNmsZfZuV3BDlFHwDt4WgB2/nsPZlNIeAaRvom?=
 =?us-ascii?Q?WTn9QkMmPR6zYs3yQ9+pbCowDcfWeSj+y4RwDzWUEllCY1QSIQoCy5L2Seai?=
 =?us-ascii?Q?DPYmSJKBVi6YTeGJ6QRJV2HMr6J71r/s6BSDsH226BEOdFVp97FerTd5F2XH?=
 =?us-ascii?Q?vh7VPkTdUgwRxdQ+G0BBRfNmqJPGHE0aiZyTlm8QnS7IWpR37UMXJk7gnXum?=
 =?us-ascii?Q?CE6B9T+sRBtRwI4zjygLxRohj0Zd0Wlcf8biekrTghzoGRKz0geSc7GTrmFB?=
 =?us-ascii?Q?W5CTnkMn+bcU9+I7p6UxrddB6JhwNw2sgnbNMTZUwbt/kCY5qy5hBThCY8/D?=
 =?us-ascii?Q?OoMNtLNoPifR9MyBJFo9CCn2ODzAy9cU982Rm+3do8LdeLtl331MyMcAa1Zo?=
 =?us-ascii?Q?bWHuHc6sNqP8Lr5koBRqBaalDpWtuQIUt/2FXS23Tsp6lYeTKUt2Pvlw5SMz?=
 =?us-ascii?Q?Ug2W97AuIxWUzmSVr9Vp8a8vsk48JrHlmVKm+UOSiTwDyaFn5iZHAi3ADO2T?=
 =?us-ascii?Q?47N1gjSai7hHLy67lMY6nAlMe2AcoPe3J1szrQLqJxRIaQrE4p9osM7X8Wd2?=
 =?us-ascii?Q?ofqgIKhjbj6B0VZovVO3NEV/9WgfkaiOxzji6wZHvEldZW6nTQINZBqrZ1Fs?=
 =?us-ascii?Q?fgekYPtrqI68wr2tPy9lDin+FzTnwqQZCWsheh4wd4Dy8L4qXk99KioqUw6p?=
 =?us-ascii?Q?s1p84dmZqPrZbk6NsdE2Ql+Xysjf6i6ZZSXKNcf3aZf/8JjWPqfEOxywiQmC?=
 =?us-ascii?Q?4qEIxwP13QASBoDTt/dSm4ezFj+Zxn51jcKZydSEPRiSLUkbcMTXscFyttE/?=
 =?us-ascii?Q?XsiOUvY0eGXi1Ey0nw+K6gWXwSjMlcCHQLgwrRiPNQqwGTq+XBFYLZ+Kygqe?=
 =?us-ascii?Q?/cq3uRRVvGlHDROKDo4bDXZ/?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6542.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e758e01-02a8-4451-4da6-08d94c8d8c34
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 21:21:47.5515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 41151004-4224-448a-a787-d4279c1f087d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWP88e+UUEdXsA2423L5XY12beAXBD7nj8XoJ4Teeo49monWBzNyH4KFhN7R6zCTRT6tZBp5/nxspC74Q8sM9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5223
Subject: [Buildroot] BR2_PACKAGE_QT5BASE_MYSQL error
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
Content-Type: multipart/mixed; boundary="===============4581988389816498137=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4581988389816498137==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR08MB6542F0679D01DEF2541E4B61B8E39SJ0PR08MB6542namp_"

--_000_SJ0PR08MB6542F0679D01DEF2541E4B61B8E39SJ0PR08MB6542namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm getting the following error when I enable the Qt5 MySQL Plugin - BR2_PA=
CKAGE_QT5BASE_MYSQL.

ERROR: Feature 'sql-mysql' was enabled, but the pre-condition 'libs.mysql' =
failed.
make[1]: *** [package/pkg-generic.mk:240: /home/vytran/buildroot-2021.05/ou=
tput/build/qt5base-5.15.2/.stamp_configured] Error 3
make: *** [Makefile:84: _all] Error 2


I have the following:

BR2_PACKAGE_MYSQL =3D y
BR2_PACKAGE_HAS_MYSQL =3D y
BR2_PACKAGE_PROVIDES_MYSQL =3D mariadb
BR2_PACKAGE_QT5BASE_MYSQL =3D y

When I disable BR2_PACKAGE_QT5BASE_MYSQL, it builds ok and MySQL works fine=
.  But my Qt application cannot find and drivers.  I assume I need the Qt5 =
MySQL Plugin for that.

I'm using Buildroot 2021.05.
Regards,
Scott

--_000_SJ0PR08MB6542F0679D01DEF2541E4B61B8E39SJ0PR08MB6542namp_
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
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
<p class=3D"MsoNormal">I&#8217;m getting the following error when I enable =
the Qt5 MySQL Plugin &#8211; BR2_PACKAGE_QT5BASE_MYSQL.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:Consolas;color:black">ERROR: Feature 'sql-mysql' was enabled, but the =
pre-condition 'libs.mysql' failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:Consolas;color:black">make[1]: *** [package/pkg-generic.mk:240: /home/=
vytran/buildroot-2021.05/output/build/qt5base-5.15.2/.stamp_configured] Err=
or 3<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:Consolas;color:black">make: *** [Makefile:84: _all] Error 2<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-fa=
mily:Consolas;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have the following:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BR2_PACKAGE_MYSQL =3D y<o:p></o:p></p>
<p class=3D"MsoNormal">BR2_PACKAGE_HAS_MYSQL =3D y<o:p></o:p></p>
<p class=3D"MsoNormal">BR2_PACKAGE_PROVIDES_MYSQL =3D mariadb<o:p></o:p></p=
>
<p class=3D"MsoNormal">BR2_PACKAGE_QT5BASE_MYSQL =3D y<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When I disable BR2_PACKAGE_QT5BASE_MYSQL, it builds =
ok and MySQL works fine.&nbsp; But my Qt application cannot find and driver=
s.&nbsp; I assume I need the Qt5 MySQL Plugin for that.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m using Buildroot 2021.05.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Scott<o:p></o:p></p>
</div>
</body>
</html>

--_000_SJ0PR08MB6542F0679D01DEF2541E4B61B8E39SJ0PR08MB6542namp_--

--===============4581988389816498137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4581988389816498137==--
