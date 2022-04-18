Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF3DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 18:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA4AF4136B;
	Mon, 18 Apr 2022 18:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qfj4ENFT-yQr; Mon, 18 Apr 2022 18:18:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776AC409E7;
	Mon, 18 Apr 2022 18:18:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6BE91BF2F5
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 18:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFB0A409E7
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 18:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXPSUMxVaUpL for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 18:18:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BFD640875
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 18:18:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy37F281DmQYnmmRzRg+o/ozgWqegPHEp9YZFBo0xIwYBkgHgtBdqvvuQWa1zMcW+ix+rkd0mWskfh6QKEQonqDXXBbFBVSKo76rXmAZMwiKZgupmGpf5PKNEZ5g6TiqCJFqoscrUBQQZQzPtgvRMBxlECdGK9DaWKB57FPRq0kfM9gGwjUS0anvYgyS8LF55euiaGDOmQLWa9XPbdAG5/a9qJI3L20zGirAR7hIcMR1T3lQtfAKOjA7hXUFCocDqn6cfzhOeEAeIkHG5+Qk5Rjf/lfDdSUR0vA19urAQ8AL+lB4qCAMmRbY2gZEOFZwmT2S3UT4QylmaG3dlC5rVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyDJIgMrDdgPhpWPtmKupKxWUEjp8hV1lExhVSUMHvQ=;
 b=kStoQnQ97SDk9vm6JBU2Ux5Enfc1Ued82ZfKWaWEYq9OrTwqCnMUkw2cKZq6jks/aQb1ilHEwTR92w3owDUnLMXT3SITw6jO+vg2bhYe7a/Q8ImJo9dNoysSeEHrhJuxXaO93cjtvObj4iRwgLE6+k2AXoC3FmXK5l9+KrUGy3YtPJ5vYCVIWcnmEacOK0swgxYtagk8DhOGNPSUHzuLUFzG/AFBu1bRCqgpaZSeAzpJdfgM+gNVUHRYCKpYYEXW62CXTR/ILUAjci3WhYcym7BkxmwoOFr5nMRlSGKc/rSuec//677N4l4D/IAXI6NEYCjQ/x2Mf7NWIy7mtgHf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyDJIgMrDdgPhpWPtmKupKxWUEjp8hV1lExhVSUMHvQ=;
 b=jOA2APdr0eWAUMV1nRTPLOP15quV6GDmj2aFqI6nGLwe9ctUCLuJI3eMu0WsjohZwQb9qKRceaudgq6vb1V55eOL4S795V0tymYR33FyspdjNXxsC54i7b+Gc0GI8QqNEkk20SrEZU8ao7jt9jB+lYM2qGcdvyEJUam6aqrkttw=
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a4::16)
 by PAXP251MB0162.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:205::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 18:18:31 +0000
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::a13a:fa57:d970:19f5]) by DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::a13a:fa57:d970:19f5%4]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 18:18:30 +0000
From: Tim Hammer <Tim.Hammer@orolia.com>
To: Norbert Lange <nolange79@gmail.com>
Thread-Topic: [Buildroot] [PATCH] system/skeleton: provide run/lock directory
Thread-Index: AdhTUJtBoKQVdmm+SNalGZXXcuGEkw==
Date: Mon, 18 Apr 2022 18:18:30 +0000
Message-ID: <DU0P251MB077954C75D3B4FCF733466E5E3F39@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c83e747-9c65-461b-e5e9-08da2167d79e
x-ms-traffictypediagnostic: PAXP251MB0162:EE_
x-microsoft-antispam-prvs: <PAXP251MB0162875AB37A29E9176D5F0AE3F39@PAXP251MB0162.EURP251.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kiBuvu5+rF51fcFHIxfA8qGw2GoZZGeWZC/3Ool05pxzqbSuy3jiHRA4CXg6VxgSdbTgcr7ksCAeNtPJ4EPMX4gSHqx6P6aLEs6Z43vxhwJVr/+C7OJZiKpnStQuFu4WYMJmgH1/9IM2GoG5Q4FRY6qcw6lhyhJRQpmyxvs9VVqDvwOK86ZGVl8GbOyj8P+xMCcfgaDy5FbH1kwmDxHATHO2mUUbnIsJpxPL70U5w0aCRgET8EAGL+8v8ktigI1+VZWf4CDpB8OZNDewA/f6bWaw2za+0a0ODDd9TWBEko0by1wVhgXL2G/BAfPvVuQVdM39KkQXT6U77r0l4u8EDKzeXvPkpCjIHiU0sagL3RUnqvoqx8MhCywmf5q/ytjbf26ADR9TbSadT8j3zz40pyQVEW5vRseg2829dm1YTB4gklqkGwqtZ+LlRusjxHjIphz5Snm+F9w3nV9Ur3HAzxeXeooGZ9vUSszvT3NgtooKyI4bUgXeqAvAn+ucdS7D7qiitnm0nlrwJTvH5gmRjEXK3jG+UrdoBCtiQjv+iceofiw6/xkbuEgN8CVD3/N1d1XJSyzSmIdguau9Wf0n8kFKEla9tueb1+iCUoS0ES0IQ3sBDvwJpIn1fNu8O+rGiI8OUPfiNAYHsNhHqTLxHEPBQU55JNdxg1rLYVZzRkYdDYtN0ozqrNIMkZadG2Iay1bw/toQFL4vJeg/aptFsGZ8D8YHj7xs958aF94B3GvM/CvJLtHEMTazP24jq0HHRt63L+SVHQqUXqSkHzUftLV+zsCkZeC3kbO7aKm42Ts=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P251MB0779.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(9686003)(186003)(4326008)(38100700002)(8936002)(55016003)(52536014)(71200400001)(2906002)(508600001)(5660300002)(54906003)(33656002)(66946007)(6916009)(966005)(66556008)(76116006)(86362001)(66446008)(64756008)(66476007)(8676002)(83380400001)(6506007)(122000001)(316002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YoZsisRq2RCZNn07T8Ftjm2WSZhTU4gOH+4DAh5K1/4SMO95GXVP5mgbG9da?=
 =?us-ascii?Q?Njb31LmcHy8yftktdXVYDhDS8qECsJ+yLbiWbL3CJsZnufulqFZkE2+QyJqU?=
 =?us-ascii?Q?+I99y9A6ASvp8jh2CoLHIdhqUULJPfLWrtRPOFrDomMGEPDR+E6fBdXgHFHp?=
 =?us-ascii?Q?fsijslP7eGQf3kwz1mc0V4QrBYySPFXzQ4c6f3sqYC30Vr6NfYMAwN/511E6?=
 =?us-ascii?Q?1VVyWXHQ81sbDtvkhKpOR3Webo9VV2ebX4VOoOp9RqBCajtA0Dpj4T4QvDUG?=
 =?us-ascii?Q?7NzfXcdgw9/RW5OEzhGiJS9R4uhBnlLducmDrrgfAMMPnuiJGoOFL7ez5QPF?=
 =?us-ascii?Q?IFKRVhMhO6fVYxyJTpP3f/oVzMeEePQpnpryCDJgaZRorqMQKU+v/+AImQYF?=
 =?us-ascii?Q?XB9Yk1OWiVI8o6yD7S0l7tMAxfvn5Kn81Gi5aYT4It1Zsz8DFi8cp7kLe9G0?=
 =?us-ascii?Q?yvSV3zNDnngm2NSh2OMyBqAX/DcnrSrtSKtdUiE4nN9S/aBGjAeAHN/oDmu/?=
 =?us-ascii?Q?ODuF17OX3wedZeVI83FGNyHaZ5gnemtNP6hYFfzZstSYQzcc5HPbEvT1fPD0?=
 =?us-ascii?Q?QydWfz8OXe+JIyFtmvbT/53ZliZDpJch0xbVWv4NC3bvU/vMNZoWf4+o6eJD?=
 =?us-ascii?Q?aoAcrl8kQwhBZ+Jq1dQOnLdFWKolmkjZFDD2/M2MFrImINfr8jlFEOlHmpPX?=
 =?us-ascii?Q?pnBnfdvz+q9hiFHzhNGzclMecs/CWdPoAH9qjEIMRGA+9uS3Zo/oTUIGZJaO?=
 =?us-ascii?Q?ZB9zicWNV6v2u7UTtl+djO51gDUgeQYJQ57dE/+EMQkPDNC34ls0G+HLGM/Y?=
 =?us-ascii?Q?VEKO68vEyilaPrjl35C5aI5ZHM/Uk07rDR8LZuQuYx3quU9W5cCtsHGkYjJ2?=
 =?us-ascii?Q?Vbo5K3nFRUeeHTkR4ovwWryh2MFexVtuOkI1ECKl9WTWJ5FyX5XkmY9e/vsg?=
 =?us-ascii?Q?xfWToy6tNEAb7+X+7/lGbz1vwUeOkMbA2RQ+vCfE65/NeyAUUQA9AT2SyA8d?=
 =?us-ascii?Q?9a2MLtdMdRKKhRG+hF63CivppW5ciDg9/gQr0M6Tm1eoAQLEPKikO9Ux2ieO?=
 =?us-ascii?Q?PwHFoKSxpclSaUYRHrTl0on0siysi6JZopoCVB3OHvYY/o/AqKM5kyw3P96v?=
 =?us-ascii?Q?n468OgWUkkkq2mSW9a2Ua5V6lXolrUr0YxvZFyK/DQ5qGW28ZIqXJXErqmyq?=
 =?us-ascii?Q?2C8xjIcePuNfqNarSmm+eELRPDUYTu46rnsnWi/ZEddo17I7Eafiny7urcch?=
 =?us-ascii?Q?QlM5BqKNvhcQRNVrON23zTBCDxzzWTt0v8OxRdsKTHc3wgbsjm+e9xX/L1EQ?=
 =?us-ascii?Q?V6GG+SPcPDujhp4qMQC+p8G8/+a1j+6gKknKAbmQ5GWIoFR2w/bZHiBfT6jl?=
 =?us-ascii?Q?lb/XRkmD3XjaGr99xXUub+NBGyapr5xclXrXaky/fYk9At1EK6VgfqzRip4W?=
 =?us-ascii?Q?BU/89q6bsjZ8FO9jWoQKH1uMVY0ZRq1wdZNS2jcGuTUqMettGldLKajFbmtq?=
 =?us-ascii?Q?yM7EPNYxmcEByMpDCUgOHojodrv8DSu6X6HE4+ose/AKV9jbI5fOUVgIxzT1?=
 =?us-ascii?Q?oatqBS742Z4APjhfxqwpR4ixvnSZmo1VSdP4TJ4tKLnyHtC47S47eNRlPESo?=
 =?us-ascii?Q?vzny52RswBH/Arcgxi3GYsBGB/n7vMHOQDL62MNUCGfXlb5s7Om7guD8H3bw?=
 =?us-ascii?Q?qHZdRXzd6IFB1AUybacah0f2I3Zo95VQhin8YqGuBxjVvy1IgUkKNkmcAiLl?=
 =?us-ascii?Q?wluKRAaIM1zdOQjQYtX1qMVOxU+sgLf6YIuSC9xXpJzhB0r7qoIXSdp7jnJ6?=
x-ms-exchange-antispam-messagedata-1: nS2jAjA6Dek4/w==
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c83e747-9c65-461b-e5e9-08da2167d79e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 18:18:30.7178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q9uF8goZJn5QryPW3DJMIBQT0GZC1O7/C47K9cG97BHVWJ+wCixttCmQDP0UMPwy6iMCEk5zUmK+RjK8ThLafQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0162
Subject: Re: [Buildroot] [PATCH] system/skeleton: provide run/lock directory
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 12, 2022 at 11:10:20AM +0100, Norbert Lange wrote:
> We changed the skeletons in bf01e51f3c, so that var/lock
> points to run/lock. This resulted in build failures as
> some packages want to work with these paths.
>
> -   Create run/lock, the run directory will be purged
>     later anyway (since 5e78e7e97d).

Yes, run/lock is removed later (see
https://lore.kernel.org/buildroot/20200605224858.12870-2-nolange79@gmail.com/
and
https://lore.kernel.org/buildroot/20220319190531.975B183CB8@busybox.osuosl.org/).

However, the soft link in var/ is not. It ends up in the rootfs for the target
and can cause problems later.

Is there a reason the link created by skeleton was not cleaned up?

I will be honest, I do not understand the full process and why the items created by
the skeleton package are not just left in place...

.Tim
Tim D. Hammer
tim.hammer@orolia.com


> -   for init == systemd, create the var/lock symlink early
>     to prevent packages creating this path as directory.
>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
>  system/skeleton/run/{ => lock}/.empty                  | 0
>  2 files changed, 2 insertions(+)
>  rename system/skeleton/run/{ => lock}/.empty (100%)
>
> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-sys>> index 1e212cc2f7..795a171809 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -62,6 +62,8 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
>       mkdir -p $(TARGET_DIR)/srv
>       mkdir -p $(TARGET_DIR)/var
>       ln -s ../run $(TARGET_DIR)/var/run
> +     # prevent install scripts to create var/lock as directory
> +     ln -s ../run/lock $(TARGET_DIR)/var/lock
>       install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
>       $(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
>  endef
> diff --git a/system/skeleton/run/.empty b/system/skeleton/run/lock/.empty
> similarity index 100%
> rename from system/skeleton/run/.empty
> rename to system/skeleton/run/lock/.empty
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
