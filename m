Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB39C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 15:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A93417E5;
	Wed,  6 Apr 2022 15:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZMaMx_4Zsnx; Wed,  6 Apr 2022 15:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B91408AD;
	Wed,  6 Apr 2022 15:01:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 153DB1BF228
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 15:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0476140141
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 15:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=orolia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F635QY00vn38 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 15:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0596F40131
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 15:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPLrurFj+KTovqs3UCqsrYdr3cX6XJhDzSgq0ZVfXvKVa1K4ZREl+SwDCTwq9qtpU07uUXKzaNGAf1OazTK+6aCO3eVZwIVOH1h2LEs+R+JWl/Uvn5FiTeLJ3kq4y6//0AaJvEwMPrOjvuok7veG8CJo3mHbjbzo8tRXxsSsbjs4+DhoXQv023U40fX3i4I6czKlmEbUuA/EUjtjNWagxQF2RlOx9gdhY+NCnMX5GnKC3Oa2iXn0jaqpLCatdQzpPVlIIq14pvat+x23KOKsc4MKolX1XFsQkYjN83R0kliEXlslZpJRBSMPdJ+haH6tdt0QeSxcu+kBe5wDfN1H8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zh1AnmJN8aoaAivpdmOZKHMBhxmFZDnJ+3L9UVy86o=;
 b=lEWT5eB9rjk5gzj2rbqNQMQKSeh9o3Yb1eog7k4l/+2dYHbmYBc/ye/+aWmJRakLxI152bbm3ODgp5GmFlKj8mNvcF4zBEzDFPfX8Y9KXTBZZry0+z+9yFuEjFVOoEcM0Ti/2+pofd8uH/39ajVpMhSPGQrGi7ZrG+ZC3pQlKXwm+4ZCU6o259fejkdLn2Dvgve+uw+35YSB+Zf4uQZ/AULOZZ7Dh3s1CMVWx3Nn8PC4H9ceePN3biR/HsI6ZTca6D2yRb4aH5hlaEu8gbD5chuwHl2/db4k77XseNVh3G4J/kKzCV+EiEqo8GuB58Y8sX48+ogmv5R9dcRaOntkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orolia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zh1AnmJN8aoaAivpdmOZKHMBhxmFZDnJ+3L9UVy86o=;
 b=XB+El10sgUATFCLVWnd8F0V5+1ZjdvlMGDrTWVizJcDvoMwMgvJF3xP3AoIkmAsx+lR0blguu44ump0ItnNjYAMKakwe0FI9nZuNb0OGSZ5sC9JH1pVVE1rxLiE9b6GTUM9F5gp5yLQjvm0ibmbSWrmBahvU7ICHEsb5PPF+5Zs=
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a4::16)
 by AS8P251MB0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:347::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 15:01:47 +0000
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e]) by DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::bd71:8465:bc3:b72e%6]) with mapi id 15.20.5144.019; Wed, 6 Apr 2022
 15:01:47 +0000
From: Tim Hammer <Tim.Hammer@orolia.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/dhcp: build internal bind tool gen for host
 (not target)
Thread-Index: AdhJrbRozWEI9erQT42w0I9BpK8kyAAGWCmQ
Date: Wed, 6 Apr 2022 15:01:47 +0000
Message-ID: <DU0P251MB07794151FEBECFAE2B40D41CE3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
References: <DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51bc030b-6457-48c5-c0e0-08da17de5f4e
x-ms-traffictypediagnostic: AS8P251MB0018:EE_
x-microsoft-antispam-prvs: <AS8P251MB00183AE69D093FC74EF6CCC4E3E79@AS8P251MB0018.EURP251.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NB59n8T00Vqasp5XJ0N1yIt1JL8r/y5EMIW4uvxEkSU9G0cTSQHR87Uf56aYdfXH6F6jJBsHakVZdtTp0WxQLHgvBUhq8XBllc0y94napic5OQR+AVGPM+2oa1F0yXaXdy/QKCZFvc2VW+oWOBR+cKPJE59jLR3l8BrT6ihzxvp8BXCxHG77rKQ/Dx4CfqSRc3BzjpOSqFNwNqz4/SDVrwAUrO96xami0blM+JuzuuF9cMTE2IjHFMmJ4/cGP8mmjCrmi7kFJDXy02W+i6w4vsI3uPiWkNARademldyXITyqITrlU/S/khbXOarSEv53N6Lhr9Jz6srVpuoBtIEEGAFLQ7JRUf6YaU3zYAugQhlWHALCbJb/zhik4349qDMYtYdl8+XfC3SnvpFMPFwAB5lwpwx2UDr7MVKWAGc0JJnBBlJ1bQxm99RhzQMglH8hhzgOB3ZOHTAnKQlBfF0YYZ4X9ojM+0WEcQZtD8FC0yKNoBDlMiVyIXJZARrB18XDcfCfJG/cIyLiY1dMAgrsjsmF3B/0vZGXTeMM3EdFjrOVP5/KpnZQWDZolexPiX3KdHyX5WGx3kwRL14dj/kuDLeEYypIwSAqzPNGcdFzuZBxO9r//0eDdEi7kGj5+iFzh1LZsRMO4X+BzTICj2eO/eX5huHBXdVPFqQWoin9VOE4ubQkRt9Z6mv0PULiHMpNGdSXQyCn9Fcx8NcZ04B2cdp6I8h0H3e1PbcyxWWeV8+2CRDMBfbY8wNDsMm0e7JCOK/HHf07sIe7eKzXzvxKqfOfIeOl7o9gPy4XlOSp7+Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P251MB0779.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(64756008)(66446008)(66476007)(66556008)(6916009)(66946007)(76116006)(8936002)(2940100002)(71200400001)(52536014)(55016003)(966005)(33656002)(86362001)(316002)(2906002)(38070700005)(508600001)(83380400001)(122000001)(5660300002)(38100700002)(186003)(9686003)(6506007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGxsZHZFSU1waUV2VW42NmNGOVlWU2RFbm5QVWRDMDQ5M2tGYTArVXZjWFNo?=
 =?utf-8?B?dlJ3QnIzZStJYXhBY3B6N08vbHRzYWRtRHhLK3BsYlhycEUyaE9wemZuSWQy?=
 =?utf-8?B?WFNQVEV2dGhvNjRCeW9UWG5McUd5MGRRWWRHaXRNWi9JMHd3NW9peEI3OGkr?=
 =?utf-8?B?R0RjYVQyMUJZMGlsUVIzMEMzYlVWbjJTYXpnQkZVdll6ck1QZmlYaE5iT1F4?=
 =?utf-8?B?bmsrY0lPR1JCZDd4Y2JER2pweWgvU29KUWQ1eWRoY2gweE1lV2tvSFNnY3JF?=
 =?utf-8?B?SmEyb1ErbEdxVk1idlNxb20wRGY2OFdlak1ZdkdOTFBGMnV4UU45cVRmZkZx?=
 =?utf-8?B?ODRLU2xTemw3OVd6cERUNS82VVJMc0FqRThFSGlyVklnTFZRcUthT2w2OXpL?=
 =?utf-8?B?R3ljRW1OR3hJdmlrY3FHVmRzbG1BMUlTMjBwQlNLVFAxVWlKRDhjMEY5TmhD?=
 =?utf-8?B?MFhCMHkzK1dYUjNlK3N5UFJHdVp0WnlKelo4S1RZNlU1b0ZUZEJrREthYVgr?=
 =?utf-8?B?UDI1S2ZaVVpOeVlobWcrdm13L2pwejdxV2NhY2dxelpQSmZMOXVoc2Q0N2di?=
 =?utf-8?B?YkliODBKUGtkTm5VdjdRdzFmd2F0ZHAvYmdQRDNwanJrYzVySWdtakh6QlhP?=
 =?utf-8?B?RkNjazlZNG5jWUZtRktISGxPWnQ4MHQrK0FOUEtmRDdTdXd1aVJVQkxheFlr?=
 =?utf-8?B?R2ZSaFk1am9ZRlZwaDFNcTd1UGdDRFdMa0hFUVdrMkp6UVlPbmQzNEMrd3lN?=
 =?utf-8?B?cU4yOVZHSGNOS2lqaWc0WnoxUE5OSFJEL3BDNEFiQ0wxZGZOcEZSSFZQWXpW?=
 =?utf-8?B?NkRhdHV3bTdBZUJaVHVvODZLdkkzOU9Bc3V3ZElPZFA0TzJQV3NUOVd1U1h6?=
 =?utf-8?B?NkJ5VUFGZlZJb2JrdXlyWTRkVUJQYTZ6YkpRN0xkTitxdkJkQURtd3BYc1FS?=
 =?utf-8?B?aDd1dzQ5RjU5MmVHUGZqVHY0ekVZTnFkTUwxc1hSc2VpMGVaRzBPY0YxSWds?=
 =?utf-8?B?MER0SGp4ZkZQOTAxTlo2S2wvQnNoWDIxOWZVRzd3YkdaWnhTREtrSVNmMTVp?=
 =?utf-8?B?cHVsNjNGUnkvaWNIdmRzaC9sTXc5dzg0VXBaMWtHRHBtM1dmb3BhQ2U5UHRK?=
 =?utf-8?B?VkJaSGVZcmI0eWZuU0R4Mmh2OExxUHEweEN6R2d5RUUvL0RCNzJHalYrb3ow?=
 =?utf-8?B?dWRnQldmRDdnSFg5TWVnZmpLZUZidDJ5Q00zWWxwbC9PZ0JXWnp5eEZTZUo0?=
 =?utf-8?B?Q2hrT09UMXlXWXlUWFhvbUs2S0VUVEFkYzJCRUpTU3JMUHo4SkM5TEJrMnlR?=
 =?utf-8?B?RlJXRTl1TGZiZ0o1V1QvRDJtcUZGQUNsQVl1SzRTQmpTUGRrMXFseHBlNkRM?=
 =?utf-8?B?K2kvRTAwSzdHQWhrcG5KdmY4RmVTUzJwS2NibGdpaEZ6UFhwUFZJZ2hxc3pa?=
 =?utf-8?B?UW1TRDdGTHFkdThQWWFWd0lwRjdSenNWQnpDNEhmWGFyVE5BcUdlcXV0MlpY?=
 =?utf-8?B?M3JkMGQyYU1ZZFl0MDdVd3BERlhUenBCU1ZjYS83RVZrcG1JWXB2TTJNMy9r?=
 =?utf-8?B?WGhkVmVSb0NsLy9yRWQzQmNjOTVKSEw2V3ZkYWN1cW5Cd0xqSG5JcWFodDI5?=
 =?utf-8?B?YUVDWS9BTStVditIWjhGQlYrWU9JMDlXOWxCMC9BNWN1dzJhV0dJb0M0T3hL?=
 =?utf-8?B?TVJXTEJKK0tHSHg5OVh4WnF4VFFwUS8xODMxMGc2L2VKRDl4YUxCbG1CVW9n?=
 =?utf-8?B?VUkxVVFQQmxGTmtyZW82ZEtyam9JYjVrNWVQNG9VRmpySURrZnVaR3l2MzV1?=
 =?utf-8?B?bDVpVnJ4d1FEOHkyMm0xaDllQXQxNE40dUp6NzhGdVRhb0EwZldwSW5KL1Y4?=
 =?utf-8?B?WU9DUGZVYi9GNFZ6SXo3Z3JyN29YME9hOWY0VHYxUnJ0L043VzFMczVsVVp2?=
 =?utf-8?B?WGZ3R3dKNlJsNmIxd3ZISmZIUExDVTVXcDdtMm40cXZZdGl3b0dvLzY0M2N0?=
 =?utf-8?B?VTFnUjQ1akVRbmdzdFNtMmg2YStSSm1qamdFdkxrYWRCUlQxTXFCTGsyM2lj?=
 =?utf-8?B?VG9CTklwc0tyLzFMN1pCWk5IcmM2VFF3cjY2SG1GTHdxSk41K0UxaytIY3Zq?=
 =?utf-8?B?bm9pMjRuNWZqd3B1ZnkreTMzdGxNV2RtSjZEeUNaQVd4c3R3c0RCSEtvS3Fw?=
 =?utf-8?B?SkdtN0VGR2NXbkhOMC9kZXdHRWJ6OHpqWEVhRVJkcERLb0NiNDQ4bEJ4V0s2?=
 =?utf-8?B?M0RZczZQVkNuK28raEdXTng2Z0FnR1RnM3FtNll1TzEzS3puQXVpWG4wVFgv?=
 =?utf-8?B?YXM1RzFJbW1wd1hwUzFSVUFFeCtkeXRWOTVjU0htRTNqcFhma25HUkpIWjBy?=
 =?utf-8?Q?Xs+v9JBSoA5iNpc9OmCGfgzvGSMHolWChVR8ea3OYMYRm?=
x-ms-exchange-antispam-messagedata-1: q84Pji3Gjng9Kg==
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bc030b-6457-48c5-c0e0-08da17de5f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 15:01:47.4896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wx2MyVysvkRROrAdwq20LeVvUGl0+IP8yhVmFXYa1uQ42EIF6xFQ6ThZ/mvigrAPoqa4JgAJ3qUxLRnukZxy7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P251MB0018
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: build internal bind tool
 gen for host (not target)
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

On Wed, Apr 06, 2022 at 02:52:25PM +0000, Tim Hammer wrote:
> Building gen tool of the internal (bundled) bind needs to be for host, not target
> Switch to use internal build in commit 0c8dd6ebd656e06cf99a63eb93343715f4853503
> overlooked this.
> 

Much gratitude to Fabrice Fontaine for all the help (and patience) getting me and this patch
to this point.

After this is processed and merged to master, can we get both Fabrice's initial patch
(commit 0c8dd6ebd656e06cf99a63eb93343715f4853503) and this one merged to 2022.02.x?

Thanks!
.Tim
Tim D. Hammer
tim.hammer@orolia.com

> Building dns library in /home/autobuild/autobuild/instance-13/output-1/build/dhcp-4.4.2-P1/bind/bind-9.11.14/lib/dns
> /bin/sh: line 1: ./gen: cannot execute binary file: Exec format error
>
> Fixes:
>  - http://autobuild.buildroot.org/results/da6fd904d1a6bae73b6ff89dd008de1f459bb7d7/
> ---
>  package/dhcp/dhcp.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index f1e3c22f1c..2faea48c46 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -23,7 +23,11 @@ DHCP_CONF_ENV = \
>       CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
>               -D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
>       CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> -DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
> +
> +DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(HOSTCC)'
> +DHCP_BIND_EXTRA_CONFIG += BUILD_CFLAGS='$(HOST_CFLAGS)'
> +DHCP_BIND_EXTRA_CONFIG += BUILD_CPPFLAGS='$(HOST_CPPFLAGS)'
> +DHCP_BIND_EXTRA_CONFIG += BUILD_LDFLAGS='$(HOST_LDFLAGS)'
>
>  DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
>
> --
> 2.25.1
>
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
