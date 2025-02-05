Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D8DC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F8FA40790;
	Wed,  5 Feb 2025 15:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9jzYH7B3FHu; Wed,  5 Feb 2025 15:29:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 488334134B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488334134B;
	Wed,  5 Feb 2025 15:29:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D99A12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A68540E87
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rY7xkiYWaIo for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60e;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF33C405C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF33C405C2
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF33C405C2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfGUa14Rcm5liEaXEKn5raOOISL3R4k9YDB4AOujsSaZvmyUYr771kT9awgfYSBMRMljXuJT+GE3Y46tjiErRpwAtnOP4jyQTX/2Wx8URZVzZpXNUXqqhDOuek1oorTsCdXqLriPUxEg3T6vVtlPanY/LPKJ0X9kVRZaYQ8Whwcx6LCr5U8EkuwJTER/fe1LxEi6e5EUq5P6+ICrHUP9lOIAW6JgEoOAHZWRXKWr8bBlvutMwOJVHc4jqO2PaG5bd9ruMvkV0WEmJRAeo/z7OiGLywdv38wwL54w0lCDiizKzuhD5EN6q1TktHPpgplAnTsR1hN/t2hLrtARJy+f+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpTVB50aDtAbJnJuqXJpEnnlufdwwLFLIywe2zBJQZY=;
 b=Liqg6CU23NXNvnI/5Qqb/NXXswvl6j14mT/FxEnntMP+1dImIKHwuZmspKiRny4lcXfZjA/JKClJr4UjroUBeKlC/wWJv3avVvVTBOlTn29bHM0xX9WGnRoa796TOrp1lzEC4vG1fm/ru3UJkj9fe0XisVcydVaXz5K35QRVYv3kmPRGpaLWiLQM8ZuJVRM+itUyxbKWRb3uaeWw05NUGwVMK7KV5v0I4bZWLPrazxh6mYwUJiagqiTFBWXlwEWZmIrPpeVrNusbeudJS6J65DwRbDYefHxqEhFJt7HDrfXOrXRI+g7e7ewLNQBsayT32m5NG0CXukj3YmauHHLdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by IA1PR12MB6356.namprd12.prod.outlook.com (2603:10b6:208:3e0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 15:29:34 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 15:29:34 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, "vjardin@free.fr"
 <vjardin@free.fr>
Thread-Topic: re: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
Thread-Index: Adt34ZiNhvJddnqwRLypTpgoUCF3FQ==
Date: Wed, 5 Feb 2025 15:29:34 +0000
Message-ID: <SA1PR12MB561540DCD3999E5BB8508D23F0F72@SA1PR12MB5615.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|IA1PR12MB6356:EE_
x-ms-office365-filtering-correlation-id: 272ee3a4-7db3-47fd-8508-08dd45f9e4d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001|15866825006; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lgzBJJ6FdB5JYUo+hgqKfZILS4OpWhTrm6nGlM/SA3XAlEI66+/KFEZcQ2mH?=
 =?us-ascii?Q?wKvAK1vfUvNjEcODDPOh17tM5g+5hsvvfQgB92lCTeq1K4jmAnL1ZpDqYWVN?=
 =?us-ascii?Q?9olrh+Q51lH+S5pOlY2/8XjshA7MF/hW+CAXDp07P2i/BGoGzzDaY/przrRo?=
 =?us-ascii?Q?YASrXr9m+KKDBlrZNsqMw7+4j7MjQXIgU6VVUBAQFYdOtA9OpmolCCAuR3kR?=
 =?us-ascii?Q?O0Cz8v3D5NNDmdH7YWipSnUp3f9HvFHxhcV17n2AfSd1/hiYZyTbWli4jEa+?=
 =?us-ascii?Q?rbwzgMXHd5lHXccohRaiKljT1y9sLZFrH2CFMSgGRpLhIqddO2kaLzPkSKJ4?=
 =?us-ascii?Q?dHmMu4xBr64mNgMRJwI+NE4PMtUg/e7UIWxlRkHbNw44H6chCcMHkh4Jzny/?=
 =?us-ascii?Q?JNtwhh4kOl49Z7XgQ9fH3GEw+gF4TtpTLUj02nCWr5G5wJb+AqWU5cswv11I?=
 =?us-ascii?Q?HQth2WxcjNcJuOgtq1nARrfLlqssMPqFgza9uibXnxEV7deIueoS5inEbyHS?=
 =?us-ascii?Q?wnVFdFMTRak2HzJ6LwAiIE80GFUbvXchHellnctHlx6b5+FNlvZARqcID6kE?=
 =?us-ascii?Q?nIJgdiIq05UKybP7J5iHgjdBuOA2h4tmBmoqvo1+f0+CtHP06/eEW9/0UCH4?=
 =?us-ascii?Q?jzP/ywZb3nVT0ldENp6BjZl2/5SeYDyglFm3n+bM0KwdcSnlkUF2R7JjxTSL?=
 =?us-ascii?Q?3dyhBUIsf9OUNKtLLghNg7+WSkx2JkcpOcKD8gXhOz4L98b/HmDDtezEot9f?=
 =?us-ascii?Q?gZnAhGZi9TpMqVD6sRhiOFehsodp8HqbTMhVejCY+TO41kBfsjfgF4omtdUM?=
 =?us-ascii?Q?ZBnqEDx/zqA6RyN/WLx1p5CxYGPzYwWTAXHDMQLCU7sT4mukeoTEAU7DTc6t?=
 =?us-ascii?Q?1M9D06lvNAu+VUXCwMtjfm4AqZWzCnVXy+ygLXJCYN0g47PKjyk8A034/Nei?=
 =?us-ascii?Q?NY9iSutyyc8ODhhFc7VZbSE+zaLseK8VpACl8R+rjKX06m8yDwwTB8e4ea5V?=
 =?us-ascii?Q?R9EBD58fgO2WqF8Ir9uGdyfkOo3SzFRbt6P8MxRdD3HTipSYx/riYFbMA0wl?=
 =?us-ascii?Q?aUouhmWERDU07WVO2a8QqJmtUfW5aEhQJPlh6/wBPW8QCEzNuW7uYK5uki+t?=
 =?us-ascii?Q?2RX/ud7hybh4oEqaBS0N+U3EEVNznMYuMIa+qqu3EqssG8mw6SRowgUArAym?=
 =?us-ascii?Q?FPAGAgkPcM9/xoavzOjlZXqa+nCJSwF57aP+gwuB2Bi5OqXExxU9CgZu+sQj?=
 =?us-ascii?Q?FZKHoAZVPlmIF19W5FMK1mkIOeObz78jdRwl5lDrqg98FM8CsHXvENKphjfi?=
 =?us-ascii?Q?izHLpN7W/eFL5rLLwOfQu/nBwHKTzOpmjz1eHguiEvQ0ZP4FaZb2exvxF22Z?=
 =?us-ascii?Q?T9vea8dUTTsz4OI3D86qnAdpjhSNk8tfLvsa9Zqqdg1J4Q04AeG+zpqCA3rJ?=
 =?us-ascii?Q?8pettj83r60W7DP8Zw9AdRMu78B6Glat00J+NB2lN7a5TMH2eWfSdv0da/s9?=
 =?us-ascii?Q?783mQ+tIk0vT5+VjLgQ4CrU1So3pZrQpGA99?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2byL0wqXV4O4C6lX1a1+M3f9r3Sinash+MP7SfsU91RMHFHcVDFEDjaLgGkK?=
 =?us-ascii?Q?0RMpsvDHzlbSEP0Qy5LF9jXDRpnaGEqZGy6Grvgd037K0W//4BsljLAeGCUf?=
 =?us-ascii?Q?VNxdcMsj7k6fZMi68pKZytiyo6wZT6VA3Cf+gJpqCeQSc8pVCkU3NflIGKOc?=
 =?us-ascii?Q?GIy7HrAUzICxbgty1fHne+XBgpEPrdRlAlGkslSvl2xYgL7nc1nCKLC4TDng?=
 =?us-ascii?Q?s5BoYjqFIX0RGyJWQOakJ2LiYlKwh1hoL2diAQPiDc+J1o9KfinANc0pv+LW?=
 =?us-ascii?Q?RAxvMdYQAvI1lDA6l00zh9CVoyYmsM2D2vWTFWW9NONp8OVDckOk9jyLB7R5?=
 =?us-ascii?Q?h64fsqVf15VDEsLGsFl6C+/3BckBqJSpSePZfjH+jOQWwl3ANhOJrArPNOGq?=
 =?us-ascii?Q?herv0tO06I5c5Vz2zFrUSJWl7NmmGuUJlhkARx5T/tI6r2U7XtDbxyFC4d0P?=
 =?us-ascii?Q?4pg+WNAqWFNPmfV0pgS4vTkYQoKiD3QpW3NcZj1MBsGds8Sbsu1FUx4uNL+Z?=
 =?us-ascii?Q?tFF8jleyuXDmkyjZsgWaYMhRyWw7D+bzykYTObiFkm7y1FKwM6Mr1Tk9xgFY?=
 =?us-ascii?Q?FlGeTdyi2l53QlCdXuXElyJfeoK2EBukpGac1ykN6gyXLrS31wy+wSNFNire?=
 =?us-ascii?Q?gNeE2V4VbL5f1UvOLrqKmps3b1+McbBIZAfgzRTFAqVaXJPzq1bFNUKhvoBL?=
 =?us-ascii?Q?8jI3ySZ3xg9KaB/E4PuT94N+C+LUP2I62eOAxuiH2tBSFDw73cYY6GfIDs0A?=
 =?us-ascii?Q?yp/6Xpd2OAeXNysPMqbOSrad3w4dYhEgGe/dONt4/t3dZSxvvs5rfxg2aTLb?=
 =?us-ascii?Q?E+lRp3eYSvBdEacIepyN9pQz9dJW5rcRpzka6fTDYizJabIwHlXJSOiVtXc/?=
 =?us-ascii?Q?ILH6KR4EsJLl72aVYsuVGAGEnaRdQpnfL1+DjAmMRS/lhQUaTGQT6ZKI9EXj?=
 =?us-ascii?Q?Z6z1hO7ckzKW8ON2R7/tIC8cb8Kstu90clKWLVDyUtHKCE9iXD8loVZoMeXA?=
 =?us-ascii?Q?Q1tfQ9TYR3TK0WqfUkKIxyjUmMdO9aa/yxBmvhQ4W//DwQ5rdyas0mSh7qR5?=
 =?us-ascii?Q?EIHsiO7IwyNV5s05kwFqnip8CfC0TTprgLt7+HL8/+KbZgjaDzGFINwoLnuZ?=
 =?us-ascii?Q?Rr9eZqC23D0OZIIcN4E7HvHoQuhJXLaE0fR0w7pzV6K4+79FErgvhpKlJNLF?=
 =?us-ascii?Q?WfxCF+QlgU6pDZ2HSHY1NldED61R4NksZSi4lRg3OO80tbw7a8mFLfbcRzzy?=
 =?us-ascii?Q?lAb88hdJV8BDWyudEp2O6CqH6U6ApleMatHspOPuDQCJ5Lh7KYluSpXwejSa?=
 =?us-ascii?Q?j18qjJdtMwNBZMdXlijj37UdbWFueLYRJGhnce2ajrEzf+7PGUaN57bFbiEo?=
 =?us-ascii?Q?nePlTNQcPtEFxDIDYn3AnhUgtrUFwC++M81rfUjl6FglvSd3fkoZMxuZOrT1?=
 =?us-ascii?Q?NhehxL4Wmmw/5vYKuzWOLYv1QKkSmkHw5m2/HbbIXoUbPunsDEGSWHNEgUJ2?=
 =?us-ascii?Q?heDgiBNMc9O9+LZzTCEUcpwYVsWmkprKxe8EIT2y4UCLZW9nkELDIzIZe1uv?=
 =?us-ascii?Q?yqGdy7Ky1lt7LsP8vJg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272ee3a4-7db3-47fd-8508-08dd45f9e4d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 15:29:34.4882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SfHn2Po2NcxB3CT4WX0DRyjuBfoleX22lnBaDExIo6M00/ZxKjvSTVnX82dwPU8s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6356
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpTVB50aDtAbJnJuqXJpEnnlufdwwLFLIywe2zBJQZY=;
 b=uMOm66+PTWCoTVJpL/yeVBNa87rKVdSdkR7CY1HEra6qgIdzzMlaJtNYmgRuWpPFHC1Xdod3zECE6d0pb+eg3onUFQPpB112Xc9nsI/NbHNaY9hUIyF0kR5tY5kZtrpFuMLesPnfpVvAoa/w6O8NR+vbzk5+P9pc4rR2pPtGYX4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uMOm66+P
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss-ato: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

> The libnss_ato module is a set of C library extensions which allows to
> map every nss request for unknown user to a single predefined user.

> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Thank you for the new package.

> ---
> DEVELOPERS                         |  1 +
> package/Config.in                  |  1 +
> package/libnss-ato/Config.in       | 11 +++++++++++
> package/libnss-ato/libnss-ato.hash |  4 ++++
> package/libnss-ato/libnss-ato.mk   | 26 ++++++++++++++++++++++++++
> 5 files changed, 43 insertions(+)
> create mode 100644 package/libnss-ato/Config.in
> create mode 100644 package/libnss-ato/libnss-ato.hash
> create mode 100644 package/libnss-ato/libnss-ato.mk

--- SNIP ---

> diff --git a/package/libnss-ato/libnss-ato.hash b/package/libnss-ato/libnss-ato.hash
> new file mode 100644
> index 0000000000..5e828f1be6
> --- /dev/null
> +++ b/package/libnss-ato/libnss-ato.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  3de3161d298c48e55d7416ad89130e13dd72263b93563f3fb79c899fa8450ce2  copyright
> +sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  lgpl-3.0.txt
> +sha256  87e17468eec71254e7848cb7c9dae5603ab376a719b05e2f5e69038ffed8beef  libnss-ato-4a29c8410cdac590a210dab2dec41d5f4b40d282.tar.gz

Do you think you could ask the repo owner to create a release tag with a nice
version number?  Using the commit sha is probably not the best for users who
need to create an SBOM.  What do you think?

> diff --git a/package/libnss-ato/libnss-ato.mk b/package/libnss-ato/libnss-ato.mk
> new file mode 100644
> index 0000000000..46b8a7963b
> --- /dev/null
> +++ b/package/libnss-ato/libnss-ato.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# libnss-ato
> +#
> +################################################################################
> +
> +LIBNSS_ATO_VERSION = 4a29c8410cdac590a210dab2dec41d5f4b40d282

Same comment as above.

> +LIBNSS_ATO_SITE = $(call github,donapieppo,libnss-ato,$(LIBNSS_ATO_VERSION))
> +LIBNSS_ATO_LICENSE = LGPL-3.0+
> +LIBNSS_ATO_LICENSE_FILES = copyright lgpl-3.0.txt
> +
> +# Skip the default build system (avoid patching Makefile for 1 .c)
> +define LIBNSS_ATO_BUILD_CMDS
> +	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
> +		-fPIC -Wall -shared -o $(@D)/libnss_ato.so.2 \
> +		-Wl,-soname,libnss_ato.so.2 \
> +		$(@D)/libnss_ato.c
> +endef

If you are going to contact the package owner about making a release tag, you
might as well send him a pull request to fix his Makefile, so you can use make
for building the package.

It is only a single c file after all...

> +
> +define LIBNSS_ATO_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so.2
> +	ln -sf libnss_ato.so.2 $(TARGET_DIR)/lib/libnss_ato.so
> +	$(INSTALL) -D -m 0644 $(@D)/libnss-ato.conf $(TARGET_DIR)/etc/libnss-ato.conf
> +endef
> +
> +$(eval $(generic-package))

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
