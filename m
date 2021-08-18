Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57C7C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 13:08:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8599C61038
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 13:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8599C61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=thorlabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C3E6403D9;
	Wed, 18 Aug 2021 13:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2m1OGQMIPta; Wed, 18 Aug 2021 13:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2A4403FC;
	Wed, 18 Aug 2021 13:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD24D1BF287
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 13:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA68D80D83
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 13:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=thorlabs.com header.b="AlqdcR46";
 dkim=pass (2048-bit key) header.d=thorlabsinc.onmicrosoft.com
 header.b="Uoa2xkTD"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICKdPgVogH3G for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 13:08:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.thorlabs.iphmx.com (esa1.thorlabs.iphmx.com
 [68.232.130.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFB5280CCD
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 13:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=thorlabs.com; i=@thorlabs.com; q=dns/txt; s=thorlabs;
 t=1629292114; x=1660828114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GdiCK6ACLG0rgUGRVDG/Ao0tzyrpOUgBrHwtqs77XFA=;
 b=AlqdcR46/U1DTykf1KTmpbbx5q+ACJ+cOUAPyvchlVB5ahqTcdUrC4ii
 QsuRm+11e/1JiyzlYLskZROYthClacx9VbBoY3Pb097OkpXPjqACOfUT6
 Buoleooy9MUuWxX1Iz7V3me6BQ53BBo3Mir7dFVoqQmbnSbRzaC+xJhPJ U=;
IronPort-SDR: Lm+N1BExJ6YzIjinECs6+QtLJtCBClF1IsnBRgDYCdpZXeaKnYu8dGQk7HslZL2pKwTrsmAXHN
 y8ulQ9o3tnyASspczjovh0ld9lMgLlLsckfG9qOmgJacT9SrIraMkFy3cYH6cwmAm6tsyNJS/W
 qhH/RVEwYTBg8GrSO/KdzK5ja0SJqW5nhZT78YiyAdl7zNckT6Y7fnkjzyIANk4LmBDAIv4+Ig
 d2J+2FFjO4cpnwRnjM1cOCtnXk9MP8D404uzYvBrGFm1mEzb+YZDQWj3V54+5zfcXZ82SBwaKW
 Rm00uXUA5UAMcnGm+C/GFN6w
X-IronPort-AV: E=Sophos;i="5.84,330,1620705600"; d="scan'208";a="28124163"
Received: from unknown (HELO mail.thorlabs.com) ([69.172.143.205])
 by esa1.thorlabs.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Aug 2021 09:08:33 -0400
Received: from NWTMBX02.thorlabs.local (10.1.1.127) by NWTMBX01.thorlabs.local
 (10.1.1.128) with Microsoft SMTP Server (version=TLS1_1,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.1.2176.2; Wed, 18 Aug 2021
 09:08:31 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by NWTMBX02.thorlabs.local (10.1.1.127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2
 via Frontend Transport; Wed, 18 Aug 2021 09:08:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D40B9fCcEz1NaSWS5V+SdHSxuTi6QU9A5nny7a3EGY/yPuWydkiktxM0r274fNmfSyOhrZCpdY8z5BuPHPOR9gT5hqrODqMiKw73LiJzTaI/6kxayiy3Jsq2y7ArxJzqTG/C4uBDsTe3/MxBq80N1+P3Ke+TqczpVtkH3zbLhI3dWjLzA/TT3YyQCG5M86vDjkLB0xqfLqo2y4Bbg2tTcaGf5a10nAxS9KyCPwukCBtfNN4IipuiBthdU3Pgzdhgqmys9yBzPOZ/7o3RExI+2Cnoryh69Uag/TA7Z27NADE86DkVvr5pyNwYgMU+wQab6/PIkB5LR/lJfH1KIt0DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSIxp8LMl6BXOLGwLc4yHr3m/LgnEYTwDUdautD5kBo=;
 b=Fbt/zIwrzGx3JTJHM930DQJDdPY1PULza5+yA+BWVzgs35rmNznbVHwO76/XYyGYhoH2TbxVs44IhQZn8rkPHxsLko+NIh7IkyhyLuSGUeO7qpzKJQcywkbUcN9F5lw/2GHmGIngCWyhCTLYDhKSyxHdCUFWIeI8MEz7LSO4idf7AO0HxYpRF9s+Dc/7hwm8Y4do9R0l+mDXLHi+knBd+hpf4wqhayVVS8y4oUgTFLkPsGtiau/9Ww0TNdY7Rw1GcsMFN4gyB4Jdri1uwIuT6pQaQ2SyraC5XVeb8ai/Cfu8ErPlejQPoOEt5/FsAPSEaMyZ4i3ggfFq8DzfEN97UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thorlabs.com; dmarc=pass action=none header.from=thorlabs.com;
 dkim=pass header.d=thorlabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thorlabsinc.onmicrosoft.com; s=selector1-thorlabsinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSIxp8LMl6BXOLGwLc4yHr3m/LgnEYTwDUdautD5kBo=;
 b=Uoa2xkTD+9GfgrlMJXIp4N0NhTzGF+aesKc6f8fOVPDU42w/VU4dnwYmA/lRzi4SF4Plfv6DiTzsL7Nicwj5BwbANURHdP1WR42g7sQos2ejBSanIoDIpi7gjAuwF6ModZgZld1+sq1rO+Yf/YHLKYCzcNXACt2nOsy3A05L41SpPKfEWh66YCE2WCu47uA2nFPUpqgnjbkDHeZwGG8VKZpJ+DyLwMwfD4o8kAHvOdQWhKHRud2pE90V3pM/yyjiO0DIoPY2AnUmAav9xntY115U50jCJpvhjXp+d8k9VJIyBOvU+8MbA6DvVjN3El9hOsXdE3sNHvDJQp9AmrxfZw==
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com (2603:10b6:a03:2af::13)
 by BYAPR08MB5767.namprd08.prod.outlook.com (2603:10b6:a03:11c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 18 Aug
 2021 13:08:28 +0000
Received: from SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::20af:6cb0:30b0:21a2]) by SJ0PR08MB6542.namprd08.prod.outlook.com
 ([fe80::20af:6cb0:30b0:21a2%8]) with mapi id 15.20.4436.019; Wed, 18 Aug 2021
 13:08:28 +0000
From: Scott Bartolett <SBartolett@thorlabs.com>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] EGLFS Could Not Find DRM Device!
Thread-Index: AdeTjscJqPkSzUsVSa6jAVwDmlU2qAABFkgAACePlVA=
Date: Wed, 18 Aug 2021 13:08:28 +0000
Message-ID: <SJ0PR08MB6542F7DD403856DB9A0CDA0CB8FF9@SJ0PR08MB6542.namprd08.prod.outlook.com>
References: <SJ0PR08MB6542DE17A6C96CC4B1B9A6A5B8FE9@SJ0PR08MB6542.namprd08.prod.outlook.com>
 <20210817201014.235cf403@gmx.net>
In-Reply-To: <20210817201014.235cf403@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.net; dkim=none (message not signed)
 header.d=none;gmx.net; dmarc=none action=none header.from=thorlabs.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bb14f8e-0cf7-420d-0e05-08d962494554
x-ms-traffictypediagnostic: BYAPR08MB5767:
x-microsoft-antispam-prvs: <BYAPR08MB57679E8A606A6D9CF963973DB8FF9@BYAPR08MB5767.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KjuO9iVIS4bh0ed7cNaPoepnoweOgQhe0AnUYMNTEvSJhxpi9kBD9yATIbWJTfIUHfA7Dq5W/z6e5bz6g3ucxj8WEEr62CvzYVOrCRRkUs1hl1xUJS2Xbgq7RHRsrE9CoS7Wv2D+C0MxYaAzVyNU7+o/yP0KKozQ+eXDeDr1SzVRhvl+fjv/ygEsG3/CScRctXu8B3WvfafagDtizMHzPj+SD0gfO+690tlD9Oiii7o+87X1OvSDZPgsjpR1aG5Wx8jsYs/+ad8NaPVpZdpZVv/MAglJScuOBOP66qvaz4JMZaUqXVPPkuA767yPBXEqFTQWfqox7Iw8GzAQH/aZ3r/SJhBcrbgCNYSRJLt+pQvoa1QUVe8vhys0RgJzB6EbKtDWY59OZOwDstA7IwyuZrPK6L0sExpy7TnmyBpIQERiq1d9kRUrnFl1eBP0bGAaUukTYtAsttzzzi/wAy8hbhbTB4SvUAond4sbnzXxQYyEfgCtPdbvoyVnG9L7U7FPJfsOrZE7H2ajNywjEzfQfPMdwAnC+x/gCYy16TgXv/OwbLjI2T/PBs6P9HqGM6EIRWwuofJKgmC1oV0xu/26Chl/XDfZTKDZeFWHEN81obX+t9d/Sy70b46x6vPxw+lcSx2zVZl1nu7gdLfhlD5ZPWJ2yA0GGxoRSuH4YNgaBDloDf2+rBe7aAwoMlkQiI544vT7dIXBsYQJLzkrhAnMZ/ne6g5FoG91vqyypO873NqLZpuNBDDIhrqRXTAGo8h/QAz9eMePU2MvtM6qx0GdGJyvyj63XSsflDUOdpI/IEE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR08MB6542.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(346002)(376002)(136003)(38100700002)(122000001)(4326008)(8936002)(8676002)(83380400001)(53546011)(66476007)(186003)(55016002)(52536014)(966005)(2906002)(7696005)(9686003)(6916009)(38070700005)(45080400002)(478600001)(64756008)(5660300002)(71200400001)(316002)(33656002)(66556008)(6506007)(86362001)(76116006)(66446008)(26005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/T6Dy2t4QJrfOSMh3H8Jq3d2ZvW0CpyrAm3ht9WFezWLB86P4OpD1fY5uqPl?=
 =?us-ascii?Q?6RmtD98fI5VU8mDC+FI51fAr4CTJXJ+VJo1HBUVtBPs1SQvDyxC3FCCX3FbV?=
 =?us-ascii?Q?vV2+fo7/3DtV8wF/X7AkapSfmtT5i3fJk9wriNpa+xDXCra59ShsglBexk2O?=
 =?us-ascii?Q?81CIEXHGH2OvTUQdzN5Hid08Qxf9RCEa5O5go0jqc2KGjuJ+lQNiusi5+Jk/?=
 =?us-ascii?Q?tCi0dpoZ6aQ6jngugRp3xZEM7ROw7BnrWDYReYHiyPXxzgPdJabvZR6V5O4r?=
 =?us-ascii?Q?mL0fgRG+qM9L36UGnhFEQv27XfJeOz5TKIWeHTnIBmjbqsZ9Q++wB7UcYAaM?=
 =?us-ascii?Q?0MUeono44qsgGdV0lh2VCn61egH6veJaNt3zZtrzxzRhh8skUuxaZzeUCbAY?=
 =?us-ascii?Q?5O0QZxDLqW8dQDXoq80dg+jQR09nT25ZGO4WG4fSNPmTxybg/sXE9eOZ6hcW?=
 =?us-ascii?Q?abMWICWTZB/QSxXD4e5TK8po5dnUypbsf5zRBV9dbTVzk6hXXBf2Ih4ClJiW?=
 =?us-ascii?Q?V7pk2bQPaQB1AlATojkPaFZBuY5t2J2ctbM/+wxDROspXV9J+J1MRtqG0+mm?=
 =?us-ascii?Q?E08pb0iEwZBqB+5SSJrn1DpzxpRLvGTuJ8xlK9g/6ArlCTBKwzNjWXvgF22q?=
 =?us-ascii?Q?XRdZve6HV3hyXYI+YumC9m5CDcqPPu4VzG4T6xa4KNEl4K6lbuzWn4vRHiqV?=
 =?us-ascii?Q?jmjmB4cy70Uq43WGw7E+H2t9r3SCEltvw0fjnuslX5EneQDViz5/3SMjfmX3?=
 =?us-ascii?Q?m1Xydq9VVknQXfMu0/dp2IespDcuWxN7gPqznZ734/PmzIJ80jxcTb0DPeaS?=
 =?us-ascii?Q?Cqv3+MapuK86s9ZO6mU6c08Aoq8hNHxuWEW+7jF6K1rpl+KTtzqn2EJD0pvW?=
 =?us-ascii?Q?JfylxrfBMVPc2sJVY02iev3H5SV9Pe3GAEmyZM4FYCCZ1xIM/wodT9cWOLZN?=
 =?us-ascii?Q?yLspX+CFNhVRHspGbvjnXy+pV86n0aMAeBxeIalwLZf7OgPf7maKX32szTI9?=
 =?us-ascii?Q?Viwx6xx5rIoyQ9B2zOzQ5pTdU2Q2OrQQ6nBNZwSG2r7jKLpz+tbpGBg+4FMv?=
 =?us-ascii?Q?NPN6HmaU0WogVYC9fFoRVDbKYpdg7YAETIO6X56z6plHQcK4SWmV1FoRspdl?=
 =?us-ascii?Q?mh5+bWZj2t2fdQxVPHqzNaUgy5OIKZKMrLsVdV3UZBwiegQLEQny1mZ0IUIy?=
 =?us-ascii?Q?MLqwHPaebbCQEwLQjl3i+LG8bFysp8NaBMON6cBKuGiGXAU4TDaf1RvQbtkN?=
 =?us-ascii?Q?bh40sQxGnZqzQED+gBAun/L6CBgh6BlcLr3CInxC2qU415MrvfPN0OF2jKs+?=
 =?us-ascii?Q?ZW+XdxvezFh+c6b4k/CH6GRE?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6542.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb14f8e-0cf7-420d-0e05-08d962494554
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 13:08:28.3274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 41151004-4224-448a-a787-d4279c1f087d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DNm7iDpQuLgHDU49JnfUX60afZGMg1qs2wK1c97mnBdy38T/DIcOYyID9CA8k7vgRD67xzgOPFB5c15JtOce1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5767
Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!
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
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Peter,

On a raspbian install I find the file vc4-kms-v3d.dtbo.  However on the buildroot install, I do not find any files that match vc4-kms-v3d*.   I've searched for and enabled additional items in the buildroot config that might be related, but nothing has helped yet.

Thanks,
Scott


-----Original Message-----
From: Peter Seiderer [mailto:ps.report@gmx.net] 
Sent: Tuesday, August 17, 2021 2:10 PM
To: Scott Bartolett <SBartolett@thorlabs.com>
Cc: buildroot@busybox.net
Subject: Re: [Buildroot] EGLFS Could Not Find DRM Device!

Hello Scott,

On Tue, 17 Aug 2021 17:47:49 +0000, Scott Bartolett <SBartolett@thorlabs.com> wrote:

> Hi all,
>
> I'm trying to run a Qt5 application on a Raspberry Pi running buildroot.  The application runs fine when I use the platform plugin linuxfb.  But when I try to use eglfs I'm getting the error that the DRM Device is not found.  I see this error message mentioned often when doing a search, but so far have not found any solution that works for me.  I've selected:
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
> BR2_PACKAGE_MESA3D_OPENGL_ES
> BR2_PACKAGE_QT5BASE_OPENGL_ES2
> BR2_PACKAGE_QT5BASE_EGLFS
>
> Does anyone have any suggestions?

Edit the config.txt file on the first/boot partition on the SD card and add (for RPi4):

	dtoverlay=vc4-kms-v3d-pi4

or (for Rpi3,...):

	dtoverlay=vc4-kms-v3d

See [1] for details...

Regards,
Peter

[1] https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fraspberrypi%2Ffirmware%2Fblob%2Fmaster%2Fboot%2Foverlays%2FREADME&amp;data=04%7C01%7CSBartolett%40thorlabs.com%7C919da371d81c4cb2c6b308d961aa4771%7C411510044224448aa787d4279c1f087d%7C0%7C0%7C637648206254285944%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QZiffVLIgJEx40pM6%2BtT7y9teGDYDYaqrl8T%2Fz861rM%3D&amp;reserved=0

>
> Thanks,
> Scott
>

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
