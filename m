Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35966C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 03:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB88D60BE4;
	Tue,  5 Apr 2022 03:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlQgd7EcuMUl; Tue,  5 Apr 2022 03:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A42E60C25;
	Tue,  5 Apr 2022 03:54:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07B181BF33D
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 03:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 048ED60BD2
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 03:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7BSh_jhDZ8C for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 03:54:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::607])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEAFC60B6B
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 03:54:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adqzv9YH0sJid4YFKJ2mN2aqPNcU0I38ESvdTe3QkIIGldjpxgpdomwN6aDOCwIDLBPF4/YebYSl6EkDN2Yscpwd0dwb7iv4q1tn9RPNO9l1aj93WOSnyZGmsUCdtGtUuYXT4xorpriIt/ocThGSnJUzxHILQaUxJJEPj0PQl97oXgT/gmE9pVm5hErEo21ves8p2UHp5YEzOvPZNcEbydJZzxfTHq0GZZ4HZE7w/oO0Iasa1OZt6ah6SDxec3nL13mf7ANZbAuwGMHoDPmET7arQ6b7Im5/55kJ3EPtUJazSVBJ2n2fBKxk1/oq2EroL//P/MkZVYVMydd/53a8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9OEPcQVFq3Pk3Ed+HwxyvrZwbF0LkdVtLNZQGA8jp4=;
 b=UPYz8d6EbA86Mivm5EZzcUWxPp58p1VEV2JFwjUwydpOJ6PKfQM54MLH0CPV8E9LtS2ORjmsAtW2Y5o03QrtaHqlyguaNLE5Qxnv3nvXFAam0MK5w58lt9dtdr/us1TKfTUaUh/tJnp/hcZDH7hwAPqKseDXVLLI1jmG10Rzsg/sc08gZroi9aBNUTv3zaDXBvvQkc1X8Ja8wCcTLm+n6sQjL2sOi+/g/gCRWcYTcm9yjds/gMvPvf5ZUk42qOIBuZ/ta7y2EldU8tQ9BxJEFmb1vfAJ7o0gJn/Pt0XgXmCkrKRXWvsMRPbMkFwT7FSrJvoecOcZHheJuG+4Mxgryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9OEPcQVFq3Pk3Ed+HwxyvrZwbF0LkdVtLNZQGA8jp4=;
 b=OFiqRwrZRlq1WGOq2pIlAetvUVPCJxFJDeMs3zBHi+zQtZZXyR858H+f3hc+Btp0xNgqG1jCLjU8KFOyVynTDX/tD6RwMg9dnu7IcdrzfO20QZ+st/ds3pHKRcxlUfeaoM2aER6IJKuY4JQFgkP72BNKan4UMtfUy1h6U6+FdYc=
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a4::16)
 by AS8P251MB0984.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:549::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Tue, 5 Apr
 2022 03:54:39 +0000
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e]) by DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e%6]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 03:54:39 +0000
From: Tim Hammer <Tim.Hammer@orolia.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
Thread-Index: AdhIoKZ1pOhe1zlcQlO6ma6IIh6kfg==
Date: Tue, 5 Apr 2022 03:54:39 +0000
Message-ID: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12c12200-4e33-42f8-0e64-08da16b80263
x-ms-traffictypediagnostic: AS8P251MB0984:EE_
x-microsoft-antispam-prvs: <AS8P251MB0984C084C4541489DB7DCBC1E3E49@AS8P251MB0984.EURP251.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BFffxi+KrrVviNT6Azmw7qJaLK6irMtRrQhMJ4XPhUG9eFCCI7tY2+uaX7GIN9RQFjVwA/XUq1QkNBuVG+1Bpy8HBqZCVumzWS8enWeJSGqG4XYSO1qb18xHY8cJrUtuph/qGTxf+UqeQK7py2Avdb9cFnJdC4U9Xt1yIRJL01q4zmkYtCgfe0d1I+CPi5eIYKKc3ELB51CC+mwqpceYTsDErnQ4wiwvnMovGdp8AgFeo3ZOQzyYtqj+YwRJW0tK8GtRTFeu7ZWFPt0uNKnGgbweIzdrggglYyvyqqr5ENM3mki2j4G0ZcnMppwaWNZNgB1D5z2rhuJvMqFT7a93pKEHiLc9SdFjVDTddvkZJS0BEfX7oY7PZD0QxEQlee5V4Y856TTGMkKI0mfQr2CjO1R9CNLQ4aCTpk69qRjhbi6ZUvZa/BVDPGRC+l7yPTVYUm65r3FbkLre2zI4ObHqTTj7/Cc5eH2LICu8wtBIK8yNMsz6MvyiXMOe5eDPhPApHmMzpRsEGgvbQBGhRNnqI3VVPCr1VfE2MLnIZtc8ekMwlcJRepcH00EYqs3XT9+z6vXJ0/gAsKspaTB7bsI/vBft4WzfqaoxODxOLzlrj6ygDujA487U/BpW+o9UjmWD1HXsInaZky3d3gKur/DZ/DusrtndXQjbW1P9ggSONKhaUq2r3II1aZMLJfVelaMNgapaa57Nu1YNvw+Bmzxjg7lFsOBHreufSrACgzzXPijTsJci4TtpdDwP7L+aug671d+6f2J05xBNzfODayw+/0pTyshEQmsQAHL0tjsKbyA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P251MB0779.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7696005)(5660300002)(38100700002)(122000001)(2906002)(8936002)(71200400001)(966005)(6506007)(55016003)(508600001)(38070700005)(186003)(9686003)(83380400001)(52536014)(316002)(33656002)(66946007)(66476007)(66556008)(64756008)(66446008)(86362001)(110136005)(8676002)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BrMKkErCJlmAJqzF+reJEWXiMba6jJBH1TVgWc8R8LNmY5P3br1pIRKAkvDm?=
 =?us-ascii?Q?/Tl7bm/JsI+rWoJ/f6fEL5qVx4LqtX5qNOgYiZ/EoEUARhn73fiBh7/o6QkM?=
 =?us-ascii?Q?TuLF5YTH0OvfLvT7Kqa4MNAvFnbhqwLFWPEopfFij0roqYBE9lpDcWrSiUaj?=
 =?us-ascii?Q?CqudVY22tPJtNJci0KKfIbadf41Ro1rdOrG7wfvk0qCalSSV9NHepkBNAsjd?=
 =?us-ascii?Q?aDJX0PRCR2P861/lc/1xamgU7QdNs8COj6uGqpZ0YrHANFSDjRQz0muTJpG9?=
 =?us-ascii?Q?Su3sRvBWmjcGDK2SHb3lqj/3OQjia5EgPBFricLyqOivklPrasbBdZuqHnqF?=
 =?us-ascii?Q?87N79vz6PQxVoPNOfM5fCOhBaqtpEBdc9Wzp8vU1y+v7pj8+lHCM5qdOSJya?=
 =?us-ascii?Q?aJmWl3NDjkv7W3//nCSTq1afcQWazQ2P24xEjWc3PeXLdhhh5optk5pIsOih?=
 =?us-ascii?Q?OUQxCUlsEVtmQ8D9Bq+4da+tCoEwgPckesQ2GSgQulXfgZT2mgn6rperVq+i?=
 =?us-ascii?Q?ubLcPTdyYQpE3MzsvXblA7ylbiS1zowc0V9KQEQ7IfnKJGj+DFWkg9fTRuj/?=
 =?us-ascii?Q?VUNte+9c8GSTUmM8yNRLVweupQlv3EjNhSgAX5eS5nsM7Ho3qIWjQT4xt7wv?=
 =?us-ascii?Q?Pt/F/mWk+opFwoaDj3N3V2ZlCAQU0oQB2iCYlPIfXNDuoe/SoCflAxVvEeiW?=
 =?us-ascii?Q?8MgunKp3b6pipT8ecWUgsHviasPqmPmkIwyXg3ZHEJPsjvlfHkNFy/EnIKCL?=
 =?us-ascii?Q?1ipSvfIVx9VsJVw+NDGXX8lZ0K4+mxiL92V8NKWTfLXeUgIJeDhOxyajGLfm?=
 =?us-ascii?Q?bSk6bt+g8y9Mr7VKuuK/iXMQCjcqDObnP5uaBa+t7utTWWZRdMoQxy+IbZzg?=
 =?us-ascii?Q?wCn8BeGxfpKAb4fJhAlhrYTFo2dmqFPFqypePYAgcUcLoJ4Ugd7QktVHp/FW?=
 =?us-ascii?Q?qwZSo8AWJo9wU1pVEb44ibRt2CDtvhhAq1b/pbwKJG1bAZ4wKJkiobodjoW6?=
 =?us-ascii?Q?Oe6kODeOJinMAmIsChniSkwvJy/KglfihK02N9yxzBH2R+jJ4xGtj8UNngc2?=
 =?us-ascii?Q?Pv5ySSwXh2S/cvaGVdi6JDF6Y8Uu4x5Ulu9p+nJ3Gm6v6j1NLq/AOfRVw3hW?=
 =?us-ascii?Q?rXpLLb1QJwIcTY0xQAs8Ox7XNpkMvI4Z/zjI+44Xm0NRrh10HBRDN9y3TulJ?=
 =?us-ascii?Q?BFlMlOzlZmQ3JfRBTR+6TV6g5CYz1ZdY5/bnHsliDKqIAntLxjs9dxOK5g2r?=
 =?us-ascii?Q?3yPrElwdIXZSrrTRIEqVFLGgKXHvjSSGsc4JOX05aFmSW14a/Oi/QsrS3Poq?=
 =?us-ascii?Q?coX380rxSWNmi4M5fc3EoChAJiiXyfZb9At3i6ZAWivwzU0t6l6lw/yyqhEv?=
 =?us-ascii?Q?Xez2kkFqaGsUulNUJJWTtveVI/Wqu3yVlOZoJG418Eeco/Pc9DylVrLabOwl?=
 =?us-ascii?Q?sYa6z0uhrXi/7hBDVJrpq0lucWGfXM5aCxq9HGzotWibqzHyliXZi+Y3222P?=
 =?us-ascii?Q?xu58q8axBN1SdvFylk6MdsEdWMt3J7fEVWLqvuM9RlanpfaQ2XnbF3l7avgE?=
 =?us-ascii?Q?DfC40SkyIVPn2cu35deoJpUJaLeAbcpOMAAGMuT9XPyq9CNgc1Gr0zrEBsX2?=
 =?us-ascii?Q?yXFnI9TpGSQZ/VSFhWyuMMAgJvdBAfkZ54V73c6Qvw0o4KaT+nQE1WZchuzr?=
 =?us-ascii?Q?FgxyOrZbgQ1iiiHWX42paoxHxdbTFreRyiVUw7qpHiA882JRHImAk3TU1RG1?=
 =?us-ascii?Q?jX4EQxt8VNK4RJTNk4P5bmsreJ3cE59k4wBGbOgD7u/RH73i/d+5X4H0rA5q?=
x-ms-exchange-antispam-messagedata-1: xx1mvyufji6jJQ==
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c12200-4e33-42f8-0e64-08da16b80263
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 03:54:39.4936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+BibEmLnGUXojeDCJ/9CKUoZFOEgPnzDPcvJALT4q7zc1fyhcpI1GfHxdcD+PwEpPSrV4kmGicEQN9HgOGeag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P251MB0984
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Apr 03, 2022 at 12:03:18PM +0200, Fabrice Fontaine wrote:
> Use internal bind as dhcp doesn't build since bump of bind to version
> 9.16.26 in commit 8adeaec8afacbc680edebae91524f6144926ac92 and upstream
> doesn't plan to fix it any time soon:
> https://gitlab.isc.org/isc-projects/dhcp/-/issues/233#note_276883
> 
> In file included from ../includes/dhcpd.h:91,
>                  from ctrace.c:29:
> ../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No such file or directory
>    51 | #include <isc/boolean.h>
>       |          ^~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d18b006dce7b46631ce8f4c72fb97eb861993939
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dhcp/Config.in |  1 -
>  package/dhcp/dhcp.mk   | 19 ++++++++++++++++---
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
> index 515040c612..e0706efafb 100644
> --- a/package/dhcp/Config.in
> +++ b/package/dhcp/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_DHCP
>  	# fork()
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> -	select BR2_PACKAGE_BIND
>  	help
>  	  DHCP relay agent from the ISC DHCP distribution.
>  
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 18765a3639..f1e3c22f1c 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -9,8 +9,10 @@ DHCP_SITE = https://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
>  DHCP_INSTALL_STAGING = YES
>  DHCP_LICENSE = MPL-2.0
>  DHCP_LICENSE_FILES = LICENSE
> -DHCP_DEPENDENCIES = bind host-gawk
> +DHCP_DEPENDENCIES = host-gawk
>  DHCP_CPE_ID_VENDOR = isc
> +# internal bind does not support parallel builds.
> +DHCP_MAKE = $(MAKE1)
>  
>  # use libtool-enabled configure.ac
>  define DHCP_LIBTOOL_AUTORECONF
> @@ -21,11 +23,12 @@ DHCP_CONF_ENV = \
>  	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
>  		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
>  	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> +DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
>  

The only place BUILD_CC is used in the bundled bind-9.11 is to build lib/dns/gen, which needs to run on the host.
So this should be the host compiler, not the target.
I do not know the best/correct way to indicate this. To get past the issue I changed it to '/usr/bin/gcc'...

.Tim
Tim D. Hammer
tim.hammer@orolia.com

>  DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
>  
>  DHCP_CONF_OPTS = \
> -	--with-libbind=$(STAGING_DIR)/usr \
> +	--with-bind-extra-config="$(DHCP_BIND_EXTRA_CONFIG)" \
>  	--with-randomdev=/dev/random \
>  	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
>  	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
> @@ -38,8 +41,18 @@ DHCP_CONF_OPTS = \
>  	--with-relay-pid-file=/var/run/dhcrelay.pid \
>  	--with-relay6-pid-file=/var/run/dhcrelay6.pid
>  
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +DHCP_BIND_EXTRA_CONFIG += --with-zlib
> +DHCP_DEPENDENCIES += zlib
> +else
> +DHCP_BIND_EXTRA_CONFIG += --without-zlib
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +DHCP_CONF_ENV += LIBS=-latomic
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
> -DHCP_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/bind9-config --libs bind9`"
>  DHCP_CONF_OPTS += --disable-libtool
>  else
>  DHCP_POST_EXTRACT_HOOKS += DHCP_LIBTOOL_AUTORECONF
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
