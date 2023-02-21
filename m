Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEADC636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 21:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB0481F48;
	Tue, 21 Feb 2023 21:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB0481F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uDz65xuLOK9; Tue, 21 Feb 2023 21:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2D081F26;
	Tue, 21 Feb 2023 21:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E2D081F26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB89B1BF39F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B49DC40160
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 21:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B49DC40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9adZlDoPWXPx for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 21:36:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D1534011F
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::70f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D1534011F
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 21:36:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDQDqkGQk952cR5dQgJjWxcXI6hEC5lhYhqlheWxTJQRysDsFG0isoGLrCKEy7nnFoz3GynbjPfTe/PUJHjjQH9FSNtqWO1lyV+jEMNz3RFPSW5xMNEdRC2/pLUzffWiSJS6B8JDk97pwJX7Bo+UrkUALl2835MCL74HNF46H5HBTCjBmiBdX3nSUC4x/gwzfKetZmA+RvqAbe0QIbDgR4eO5syivcBIVRgt83S1glDB4n64wHT9sQ0i1JI8WyroU8wIsABhlM9ZmqO4eWdwHriIeKv2GnvrITs86MpEv42gbKeOWFsijoBeZu2LApPMu8ooPIT9sxhT6Y34U0gjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sCcJLSKnoAu7OlEARDB9CF+vD+KMGB4Ucutai5o3Iw=;
 b=B3AGiv/lbJ155/KFMLLRPScasY5WU1O79anl6T10M643vck1APBJVpLgm49jp4mXYBBKOFVR3VZigductQjyPLlItwjwUIyocU07D8b1wEUBxMtP+A/tne92KU9g5W/XwSASYSyoEvEbu5xa9p+jwOXJJprjptUItLFD/7F7nG4LvsuMrPwIH+H+hSaYq8FYAan76GQo5qAEcnqipx3NCXTKXsHF7lGe8vUGQuDMTYaz5H+D0kVrN3sd/8wV7FyUrcsNhRzc5ildbvn6srdif5PHKZMLslqHnjIdMXLnaL38qxjLqCirzd/XuYL3t93j13XhGm17mPTTSZcsKIuivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by PH0PR10MB5793.namprd10.prod.outlook.com
 (2603:10b6:510:fa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.17; Tue, 21 Feb
 2023 21:36:09 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::1897:6663:87ba:c8fa]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::1897:6663:87ba:c8fa%4]) with mapi id 15.20.6111.010; Tue, 21 Feb 2023
 21:36:08 +0000
Date: Tue, 21 Feb 2023 13:36:04 -0800
From: Colin Foster <colin.foster@in-advantage.com>
To: buildroot@buildroot.org
Message-ID: <Y/U5RKqr1BPinl03@colin-ia-desktop>
References: <20230208185516.858096-1-colin.foster@in-advantage.com>
Content-Disposition: inline
In-Reply-To: <20230208185516.858096-1-colin.foster@in-advantage.com>
X-ClientProxiedBy: MW4PR04CA0170.namprd04.prod.outlook.com
 (2603:10b6:303:85::25) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|PH0PR10MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d50d97f-235b-46fd-d156-08db1453a4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5il1+EJbFnuLEiHwqWzl0cu4Q7rKw9yjJlL5bVfzXX4GkLoDnSp+GKiz3ExW+gPOzYAkMNa5a8H1YRtJbJIayA5H6ZmjTXJVWr+MTuMcnCIr0Hio1Z5GUFMdS9LrnkcGqAGRzDABMRj4xyBKIrgPqxYy3VpDtKzhO+LbVYUquuw/9uLs77bfGh3v9hsJncxICvAIRZUhK2xKH15PMEhj1CNbT7fNZo8yvNxwNun2nzDdGxT3iIYedmc/+WploJYv6VbiniTKLwEFBP7AsSFVZpUsxBW9vcMsBEGhBJinx9JLzPrHoqbd98OQdwksC+U0snyCvz5iLz3USdGWWF5iTiL6KJAGl8qVIegRaHYLsZ/fuwnrosOvaXnP3jfvsuRYhv/SxCWjcSlrEdLub9GdZlku/nuLqowp+ktPGIcsiq+Zhg56xKqjZcV0JGuHu+W3LWpCExOi7GkVkWDq7n4npmDQ2TyTAC0ySSnOBLzO93ujwt6wWknEJIhUn1KHbGhU1/vdu38+7zx3AIEU+hfgtyMvJjUHw9vpJeOLCKFxbfThXUx0MFwMWzi58iaPcScGGUvwtP/Dpw3fFa1+TtvDfsDtR2ix5IPg6GfNdq7bMT7lZAsC5lCnNIv6pQ3SwSnXd3H9xBhWLTEWE2kPeSOuJilg1hgONueRZWRavv/XfmJaRNQYbg5PhljMOf2kYLtnyEEjN9p2BYHUILUga0BMRfrraBCh04Orv1D2xPbeS2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2351.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(366004)(396003)(346002)(376002)(136003)(39830400003)(451199018)(15650500001)(2906002)(44832011)(5660300002)(8936002)(41300700001)(66946007)(83380400001)(66556008)(66476007)(4326008)(6916009)(9686003)(6506007)(316002)(6486002)(966005)(26005)(6512007)(6666004)(478600001)(186003)(8676002)(38100700002)(86362001)(33716001)(41080700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?toIg6GLaNldhfc30QdRYq9PEsi/t3wns0vKSLV8CWNfPsywWbexSwc+DYWnD?=
 =?us-ascii?Q?td/KAuTaqu0uqG5ze1ksIEZgP0oyVIEhD3XNegX2VcnIUhxcyRurQELKy9Jo?=
 =?us-ascii?Q?R5p31A1GYNu4eSOU0z7s+vTr99KRZB0jscQdqvZhqhiagHAc/w0mqCrVoqmc?=
 =?us-ascii?Q?uAFxKmMChDGvWoPvthmHxImZTiEQx3iH0EHGjAQr2JGORhcfnS5qF96MimF5?=
 =?us-ascii?Q?GHjTc/WCqhuXZHFx5Lyo2+/QbqepMH0/naQwyKVS1nDrQiSGbxM4W4VoP443?=
 =?us-ascii?Q?X+7RuMFgO+GtP8Z/2m8M5YF091ghA63xHRBbsS4dBLIca+Q79T1N87IuX9B4?=
 =?us-ascii?Q?HVS6XAe17gH+dAA/eYslQ9BxDpiQZ9FDyzaF+QlpiNidIGUVqr0LoDgFWjSl?=
 =?us-ascii?Q?kn0kgftotwdd+X0YEHFfs9efCbTgAVun1AcJfeqtFIkbkMOYnFmni6C6Lbca?=
 =?us-ascii?Q?Ge0tvpQWaT81ve5NZE3drCc/THbsXjQLQd/61Qn8iTMAARYo7f+r+eHxY2oo?=
 =?us-ascii?Q?D4vTvFpwceKe4RTLcySHEpDbHegbDeH2KiX2tvUHYM3i1OVe7QrjiFQF3Nxo?=
 =?us-ascii?Q?6xylvMaIKNWvCsy6ARbB6ndgG5KGtfJbg95ciSRW8DD1EWzmOFhw2rZ3zhdg?=
 =?us-ascii?Q?6PDb5WRSCFL+0wW81gwiIl+Ka8eIrCXbNx9gHXHL8Y6vsLK6MsLJlLZOCYNK?=
 =?us-ascii?Q?yfb7X+8WJKuXaFnNUeriG/LxeGIdCTRlwvLkCaRgFUHy2CHbGXlh875P/SPy?=
 =?us-ascii?Q?wwnLApK6XFxYP6tIfQiTQo66xdZpqnPhFDIo9lAK9hNmUPh47adTElnGM4hQ?=
 =?us-ascii?Q?JlWO8G4HZFniEvz48/geADGDjyggOhk8G9vBGk6yMSiC09Qyn0K4Xzp3ZMfZ?=
 =?us-ascii?Q?Z29RFyRwB0ky+9btFii3iHkieeEVFGs8PR1Qvh8WhFPKL3ZDG/ur2klA4IXn?=
 =?us-ascii?Q?yf7IkHwGglL3EJFvi7CM+M/165+ddCu54oxDxVgm+efeC9+mFrVf7QOCu0YO?=
 =?us-ascii?Q?PHYfhwlM4uTzo3ZfgaWNSZqgL/d0WhAekcR0oDfs74eLdLCsyAHsi1tNzjMH?=
 =?us-ascii?Q?xSXZSWTubFojobSATt+ih0hVUejj0uaaCqmM5glE4WowiLgZFuv+uVYRwgg1?=
 =?us-ascii?Q?cstcmiR26sUhA1CRgf9l9N4EPXShMsvG9qZ0CCLH51u1bt3Vg+r/EC6ivkax?=
 =?us-ascii?Q?c+ZGnVsa1tSZ2dQD+MqwUVGnHwHR7SJqLRccrgFSLI6qI5W+op223O2srlh9?=
 =?us-ascii?Q?x289zL2OwBC8KaLjZXvcOTdE7HFH9uswh88vlKTw3q/CPFD3IUcivjwUSy9D?=
 =?us-ascii?Q?qx9x23Ztv3tSCtIFKDGdkemGP166qREESM1xi7sLzQUjHi6PpQX6W8LkkBDv?=
 =?us-ascii?Q?9vXv4gl9poKNO1Drkw6tpy/Hbh3i+KPqvTSK1CiVhUf6TeacSVaD2YPoaE9X?=
 =?us-ascii?Q?Y08dSLtRsOb/6EooElh+5XjcVPxsHdmtjkDMvV94lcSfa3lFSnt9UN2AyBaD?=
 =?us-ascii?Q?gJjCEheQR6tT9qwe9uzmxR31fAEd/QZl0QKojyzQ5ps0TaddO1bncpSHquOP?=
 =?us-ascii?Q?ZJCr/6SKJs1vaCgjqWcw1pDy2XavitT+iZMXOSz4np3wvcvMhhhAdN+j8GKo?=
 =?us-ascii?Q?8N63VclUTiexTXy8j5DMGTc=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d50d97f-235b-46fd-d156-08db1453a4c3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 21:36:08.4225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOuMDhNmEK4GXK1REvurulX4OL5sYIgmGV8fvHYzhQFw+/lmMbQjSLpjJB9QzhfxJ/FCDCLXkRnuUoq65Rsc/ukd3nTYhg9nrdzZiDM540k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5793
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sCcJLSKnoAu7OlEARDB9CF+vD+KMGB4Ucutai5o3Iw=;
 b=aRy3iiByYJXFvZyrhFvqAE+flZIkz6pcNdj1qvrre6p7AsZRtM5xbfucMguVj0q0KmyCe+7bK37BBnTxQNc8cQEmJcOFs7aD7ISKCvMZoQkh8oRUYFqVe/A3RngJsBFwuX7pczPGAMs7fmDKJQ3cQq4TtezGvyLGf2Atc+1WgM8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com
 header.i=@inadvantage.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-inadvantage-onmicrosoft-com header.b=aRy3iiBy
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Subject: Re: [Buildroot] [PATCH] package/rauc-hawkbit-updater: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 08, 2023 at 10:55:16AM -0800, Colin Foster wrote:
> Add useful tool for bridging RAUC with the Hawkbit API.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

I'm just sending this follow up to see if it fell through the cracks.
I can re-send otherwise.

I think Eric's email bounced, so hopefully that isn't the issue.

> ---
>  package/Config.in                                 |  1 +
>  package/rauc-hawkbit-updater/Config.in            | 14 ++++++++++++++
>  .../rauc-hawkbit-updater.hash                     |  3 +++
>  .../rauc-hawkbit-updater/rauc-hawkbit-updater.mk  | 15 +++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/rauc-hawkbit-updater/Config.in
>  create mode 100644 package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
>  create mode 100644 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 511e691ed3..84e5efa856 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2677,6 +2677,7 @@ menu "System tools"
>  	source "package/quota/Config.in"
>  	source "package/quotatool/Config.in"
>  	source "package/rauc/Config.in"
> +	source "package/rauc-hawkbit-updater/Config.in"
>  	source "package/rsyslog/Config.in"
>  	source "package/runc/Config.in"
>  	source "package/s390-tools/Config.in"
> diff --git a/package/rauc-hawkbit-updater/Config.in b/package/rauc-hawkbit-updater/Config.in
> new file mode 100644
> index 0000000000..bd7b8d7cf5
> --- /dev/null
> +++ b/package/rauc-hawkbit-updater/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_RAUC_HAWKBIT_UPDATER
> +    bool "rauc-hawkbit-updater"
> +    depends on BR2_PACKAGE_RAUC
> +    depends on BR2_PACKAGE_JSON_GLIB
> +    help
> +      rauc-hawkbit-updater is a link between Pengutronix
> +      RAUC and the Eclipse Hawkbit API. Hawkbit can
> +      communicate to remote update servers, and use the
> +      d-bus interface to trigger updates from RAUC.
> +
> +      http://rauc.io/
> +
> +comment "rauc-hawkbit-updater needs rauc and json-glib"
> +	depends on !BR2_PACKAGE_RAUC || !BR2_PACKAGE_JSON_GLIB
> diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
> new file mode 100644
> index 0000000000..c65ead3784
> --- /dev/null
> +++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  42318e96a464e6c716edb45c48bd3ec3b874462973db902fbe099a395e4acb4b  rauc-hawkbit-updater-1.3.tar.xz
> +sha256  041234c81fd6fe6c531ea1a886b9e740b9ee06759d1a910a14edbd06f4aa62c7  LICENSE
> diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
> new file mode 100644
> index 0000000000..5a74181361
> --- /dev/null
> +++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
> @@ -0,0 +1,15 @@
> +###############################################################################
> +#
> +# rauc-hawkbit-updater
> +#
> +###############################################################################
> +
> +RAUC_HAWKBIT_UPDATER_VERSION = 1.3
> +RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/releases/download/v$(RAUC_HAWKBIT_UPDATER_VERSION)
> +RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
> +RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
> +RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
> +RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR = pengutronix
> +RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib
> +
> +$(eval $(meson-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
