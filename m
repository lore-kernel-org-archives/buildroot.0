Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682DDC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:47:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85AFA613D5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 13:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85AFA613D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 372FE83D3C;
	Tue,  5 Oct 2021 13:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzjasaCZ6X3Z; Tue,  5 Oct 2021 13:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79ABC83D43;
	Tue,  5 Oct 2021 13:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9CC81BF2A5
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C623383D43
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 13:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rSc8C6q2ZE9 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 13:47:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::60a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B0B383D3C
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 13:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdzolABfT3OKBVD6Pq8zP8IaFIx9RxGhWlf8+/md+uuqXs6K9TlFAO/WCfYbNebTg+f5Srg/FAXvM9IFRX+rhZpn0WuvUXu/gQ/ACL2U/BUGRhhtac0s8kfWjFImC92IDMlqKcLPGE8ZS/CDS/rkUmdu0KfamtTvu0s9QOCoWJFQ04FXD3hZlrkSoAdFx4mgl02IWgxtSVG3+u5p4h79JCBmT+jVa7qwPJrcwbEExpDMnoraHpwloaNFVXBK8m6tiJM11G4H5AE/xTQ0e+GcjpaHA76QoFbeldxNoQoo45Fjfm2Pz1mKYtiwpYLbDKVkHi1yiFRqKg8su/qgyf2XVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQW4h11IOgmlQUoNwf/13vHQ8flK289D3F+vxYDbIv4=;
 b=i6maeKbLm70Yry3MD60QEr1W7W6wI6MQTKgzmAqsnGjWjbXiYkuJGDV0tvevRp6iI4J0kOJqrQjMT/Ww9M3ZJo9HFnZNWldrX/Hg7hUN0/b4zR/akzMPPdZJ3Cb1T8pD/alojOhP54HvRF0l1xMv0FhSiET/2OUsspoZWiuIS6N5cmmuyFH+trkHewBdzCL0/FBoxZDkoOJmo/eQtIzvw+DuF0HrD2DpD6CRdOSv96KQeZLFUxD6hUiFpehcYi3+OK/wO0Vi/XPa3gJWVSovJlim7CuJ33QxLWOKEOQWfjwpfFwaAQO1kTUpxM/PAxjm4Y5Jxz5QAy97fRNmf4TxOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQW4h11IOgmlQUoNwf/13vHQ8flK289D3F+vxYDbIv4=;
 b=miT54Syk4btpEwNeYidvuC7cwn/UxvMuH/IvBnrmZn3R62EgLUfPS1po2wldZgzQY7v9yMw/3TNWK2rsxght99qKjy85v5Q+Bnd6fQF7WnT/oPgvnY7k7+xPEAXRXGOxCKVDBfqN7azhT7EUR9UM31NLEeTvU8fuwOHCFQZCdMo=
Authentication-Results: buildroot.org; dkim=none (message not signed)
 header.d=none;buildroot.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB6098.eurprd04.prod.outlook.com
 (2603:10a6:208:141::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Tue, 5 Oct
 2021 13:47:23 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 13:47:23 +0000
Date: Tue, 5 Oct 2021 15:47:20 +0200
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: buildroot@buildroot.org
Message-ID: <20211005134720.ruvwbrlw5jrzithi@fedora>
References: <20210927091813.3730562-1-quentin.schulz@theobroma-systems.com>
Content-Disposition: inline
In-Reply-To: <20210927091813.3730562-1-quentin.schulz@theobroma-systems.com>
X-ClientProxiedBy: AM5PR0201CA0010.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::20) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM5PR0201CA0010.eurprd02.prod.outlook.com (2603:10a6:203:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Tue, 5 Oct 2021 13:47:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c77fb75-a509-431c-3400-08d98806a86f
X-MS-TrafficTypeDiagnostic: AM0PR04MB6098:
X-Microsoft-Antispam-PRVS: <AM0PR04MB6098950994967522CC61C02DC2AF9@AM0PR04MB6098.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EhlCiDJLScslwQeEbK93NbH1A89opVX1n54eCa8ugghjh7V6BYiz5QnBGBFC7IXjc05+7UvKnJ0B/DergyMwjjRjY9TZrLzBTSS5PsTnIi3vnQdE83i9LsCv6xTZ2fN8VjpQK1hYHz3QGaMORpIR3yKZL0GVY1K1qqBa3VHpUY3U5SFMLBH0XoQEQKZuJcoxhJnV21QmT4NCL8wajoNi2nX/CnCX39rr8AX9KFROd2iyLhwVOylRhxKhTZ20vwKDv8zZMuIFkXeYtAZ/lOz2XH3BjNhfQrL9B/Mybw1lYgZWSdzOXsg+s69Dww3blpwT+3XFllSoFHoZWN4mLz4nV/xmOOMMGMrnj/6PrsC8VbEpClnAMEDrUlAxJ1nfiiElrowl/F1pP5ztpeYnZuSfB9l93QD0+LaSVRhg6srqPrt+FVaCMWLFuzQKHYUVZLzlD85baSvH6/6Eqiz4DjKNOujK9tN/AzJ+jdBdMfzJNSF3sKQuCHeRYgYHBKZ7EXvPGL+a4HgnAvuOSV70gnDVzqnbyUeCZB9DIQhLovoWP8l9GyptjrCd6EF1hlAkTVOow1pBOepxNs3lgG3GJkCovwG77xvLbrYeEbFJ4bg61jmDO3uPY9jhli1KTndoEpcBvhlbjrUJGprK3yBFNX9TqrVY6TZYoFFeI87htU+dmbsG4jE1Kd61w1YiXVcbqvvfodlrxQvA3Epy0lGdjpHchg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3348.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(55016002)(8936002)(83380400001)(4326008)(6496006)(508600001)(9686003)(956004)(5660300002)(9576002)(86362001)(33716001)(38100700002)(66946007)(316002)(2906002)(6916009)(54906003)(26005)(52116002)(186003)(44832011)(38350700002)(66476007)(66556008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ioG7/4jEwuHihB41+Xl82t09pfCeuEQLCvpHoN4fWZQi/8j4A3t41HNbrwht?=
 =?us-ascii?Q?XOp5LbN+IhjrGzngXpre5TlXeN2CGbeRliGR3U2gABwwvJeH2slP07XV/dZV?=
 =?us-ascii?Q?Nzo5+jk5cVruKZFPJH7W/jJK4a+wO7NU+vWcdh+Vh4RvkHCn67cWfABp6GAI?=
 =?us-ascii?Q?bneRxL6BWJJ/bxq/m45RhR3Qc3xqyhaer80EQUHuwAVUvUPo0xIHoT4aQQ/3?=
 =?us-ascii?Q?vkQRupSzi0p/E+QvMsrztZneGb0v+du/swZT6Qvr0aVJR162v6M/8oJCDYx8?=
 =?us-ascii?Q?vRe/g2yorpPGhKBspXerjBIMHJ/49mSb/ZSZhZdtl3FRY8CS/PlLyLGXZDPx?=
 =?us-ascii?Q?OMSh5fgTPApF273ZSeFF0xzNmJijKX7BigztKzrWL3TjdiS99/jdvhDR6ZOH?=
 =?us-ascii?Q?PyFeAo3k32H07Nhr9W06Z0vg3m+R0hZRzABCu/89kEuf1ubavTNd7OAqBhE1?=
 =?us-ascii?Q?9Zw5H7ZbAZK6Cn8uvOatTKCR3O1HfUlbnlmJAtc02bdFB3I/3K19VoqCztXd?=
 =?us-ascii?Q?HM9Z3nE6nCYJbYgCUd1yGhjbXGjvC/MvZiIci1ULETeaJcHsFSja0AGi5t3W?=
 =?us-ascii?Q?Rppso6Atr0VudixS0J00wTvDWlKQAFbL3C9RZEBDX3sm4BnQGDFmVpYR1NiP?=
 =?us-ascii?Q?nokNX9sc/nDoJ/169l9PB+B1Q58WVfXZOFXy08k6OXYduNp7P+fPUtj0nN6x?=
 =?us-ascii?Q?jS7krln6n3bnfsKh4ss/uNKIcPj88OjslZt/ySskR9Pa+KGAISdX+BVuE8eB?=
 =?us-ascii?Q?096RHPw9dOUeBMv3wYRHWCTrOGROxIbivUwu5PtLCBLsQJpQoZoLO0xc5Tki?=
 =?us-ascii?Q?QYdxzRpJ5Fe7IRmk1XoQ66fh6sAF87BxqQiOhZwtVlOamiXmdWQFeJcu2fGu?=
 =?us-ascii?Q?9TO8ZhfzaFG3f8E+4xj/w/hn3wRnZOZV3y8rcBGmN9tz7ZNA+4MnnboBhIwz?=
 =?us-ascii?Q?VGXlLrVd75eRhxRpUIJ6z0ZW9eeCxOvQ7ZTXQHbHeTOYTu7geJphc7I+r8PA?=
 =?us-ascii?Q?p/Ixw4GJuiU9+Mjuep3dX8tm21Wy5I+0WFDGemp0idOexRSpCsc5Mt2RksO2?=
 =?us-ascii?Q?n4/SlvEh/onj8c0dqxEG2HE32AEB79wxFpfdxJY/n8jXaTbTZ1X0CTfVnnJ/?=
 =?us-ascii?Q?qk8MHX6jE1/mBp8H69dNPgjrRrn7ZQjSDO6UPwII790F3jwlwuD9xws/ndV5?=
 =?us-ascii?Q?1qG2SkCtJVx7mNFkQeZULfVaa0piaRFJhGNZBWO1W9+IeRKBOq/U292Pc0k5?=
 =?us-ascii?Q?RZBTmRhq4Vtg7kMlXH3p7DhCBSMRUXYXOfiCtfC9B2nBM2Oc7QYOl7+3/sw9?=
 =?us-ascii?Q?AeihE5L0OMKOAyq5tj6SurHX?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c77fb75-a509-431c-3400-08d98806a86f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 13:47:22.8776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OU7lKhLKVm2s09VVW40bwzjVgNCIXpsPerpfnNbjPudDBY/ydOpuNm/5v5gZEd9VbHglC9scagecvDgx1jgQ4P3rQUw7fOxab7djuBC0BDCIVkuSbMSi4Z2RXmwfCbFZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6098
Subject: Re: [Buildroot] [PATCH 2021.02.x] boot/arm-trusted-firmware: point
 LICENSE_FILES to correct file
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

I'm seeing some activity on maintenance branches lately so just gently
pinging and adding Peter in Cc.

@Peter, I see also that 2021.05.x is still maintained, I'll work on a
patch for that one too. Do I need to send a backport request for
2021.08.x branch too?

Cheers,
Quentin

On Mon, Sep 27, 2021 at 11:18:13AM +0200, Quentin Schulz wrote:
> Since v2.2 release (commits 8cc36aec912 "doc: De-duplicate readme and
> license files" and 9f1622b018ab "doc: Move content out of readme and
> create new index page "), the license.rst file at the root of the git
> repo is only telling to look at docs/license.rst file.
> 
> Let's point the ARM_TRUSTED_FIRMWARE_LICENSE_FILES to the correct file
> and modify the .hash file accordingly.
> 
> The comment has also been wrong since we bumped from version 1.4 to 2.2
> in commit  a757d173f179  (boot/arm-trusted-firmware: bump to version
> 2.2). Drop referencing an explicit version, so that is is never wrong
> again.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> index 970613f38d..9bd17a3cf8 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  4bfda9fdbe5022f2e88ad3344165f7d38a8ae4a0e2d91d44d9a1603425cc642d  arm-trusted-firmware-v2.4.tar.gz
> -sha256  487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
> +sha256  13676fa9170d3e6da3f7562d2d47b8b71090b1b45013fbd329ef847841f3a0b1  docs/license.rst
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index d6979a12cc..cccdb3c522 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -18,10 +18,10 @@ else
>  # Handle stable official ATF versions
>  ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
>  # The licensing of custom or from-git versions is unknown.
> -# This is valid only for the official v1.4.
> +# This is valid only for the latest (i.e. known) version.
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
>  ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
> -ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
> +ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
>  endif
>  endif
>  
> -- 
> 2.31.1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
