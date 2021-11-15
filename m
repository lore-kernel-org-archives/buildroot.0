Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77149C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 13:47:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F2AB60ED5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 13:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F2AB60ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=theobroma-systems.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 721BA80D0B;
	Mon, 15 Nov 2021 13:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jH2Cx86yKPP6; Mon, 15 Nov 2021 13:47:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A948D80CBD;
	Mon, 15 Nov 2021 13:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C80C1BF301
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 13:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 576D4605D1
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 13:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=fail (1024-bit key) reason="fail (body has been altered)"
 header.d=cherrycloud.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7HQetBf_zUr for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 13:47:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::60b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A880C605B1
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 13:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp4AEU8QNA6/4Z3ezB+PUtcTzKKfbmSjLFUQyc3jVMCKnsOfPfga/SKywLCmVEFhXxD7azqvZjW2pWYPy1zsBmTxcKRNrGjnUQtN7h/6ZRWXgu+Nvi/vBqQEACESqx5wVfETSEa5JLReBJml5vB7Y2JAFXi+Hz66LU4mbQSK481Ds3IWhjrnVxyhOW3Zw/vehkfgCZH3V+XUN9qUoMdzJU6kJAOnB6pArMRDHIb1y7kgclbSPGlWkN1xtI+9OkAELaRIhxAlYEm68JWbxPwZdjODs1bFi6llbhhPmhljq5Dow+rA5q+LLwTPx4roL2YxYL5z4gbsEOUkNwUCFeT21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af0qvD++WqQ0ZUhqT5D0MDI5xuXTEVXbJ11ybABboRw=;
 b=cVr0J8/3dPHKx3q80evXrqWV/clExVeQvP9/I7s2Ay3FSf9BxlWIvrEc79swm0e0Mf1BfGrxC01SfbLEJyfVz/Qml7Axbh1HyAK+w2Ll0gp8cvCJY/gOZ1mPXftUG2htNoS3k+9/AYCVR5SLVhM2u9XmCeAy7Mi3ISrd+OCofmOc9BHOXVDRy/5aQsBI6n8/dKn6+6hSiPR6iR62FZIvwGxoHnuI4k8WGhdD/YaVav5/LuctGEWQBzzSodcN6OUEAyb6ogtlm0ZrnVHlMvKwP50m7liN0Q+CcdqgDEHGSd9OfKUhndEWrUTWJ/6EhzHWOdZkzl8ImDtZpS2k+Lduxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af0qvD++WqQ0ZUhqT5D0MDI5xuXTEVXbJ11ybABboRw=;
 b=DsZvWNYTGs+JpUb2JRdXe4DwfmMuzlaNiveennSvc9lsEIfnSPGosFeeDXriH0lUezW3fYISbgngw24nz6IFIUyvEWS24j5MFYGHgqDpq7MX77gVZ6CEe1JOUC0UtUvuNWVtL1JeaNY8KlqHr3WRuafN2KVAVf768djH9AGM7dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB4436.eurprd04.prod.outlook.com
 (2603:10a6:208:72::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Mon, 15 Nov
 2021 13:47:06 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 13:47:05 +0000
Date: Mon, 15 Nov 2021 14:47:03 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211115134703.tou5jvgya5h5tiwe@fedora>
References: <20211115133000.72041-1-kory.maincent@bootlin.com>
 <20211115133000.72041-2-kory.maincent@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20211115133000.72041-2-kory.maincent@bootlin.com>
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17 via Frontend
 Transport; Mon, 15 Nov 2021 13:47:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d1640af-09d8-4f2f-1575-08d9a83e693d
X-MS-TrafficTypeDiagnostic: AM0PR04MB4436:
X-Microsoft-Antispam-PRVS: <AM0PR04MB44361D0CF50024BF5256C0F3C2989@AM0PR04MB4436.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RF1myxiiQHUYiMqIHlsCysFbyW+KwGmzgLSgwibDc3VI1c8GEJwZJ13mLAY76b1/pcbtky5lT2lu1HOEkA+D/wzNoQi7iLHeQWpvnWGMAab9aLoQN1GyxXmyZ9vNYFhuT9OR1MSLSinGrCeQNY3qLJ5leSyjsqv7vGzQhCOj6NJp8xesGPbopt+rXUyd0441sGBBUxgxCJwxuRVd5awNCuDJ+3pyMegQ6EhB5O+YlF7Ilo4AMbI8WjXcm1sJX9x1/tRl+IgUnaSgQIk9ChRnosIqxXP92Avt6fIntUOUvbTVxvYPduBJQHMA8+FY9MOMs8bIg28Xd+Gtl2edR/ALFDnO92uyBfAz2qfVJeDYwyG7e9SpkLiStgYZAkQOVtYZYrZY5qSujir4Z+yEKGNqGf0bg91TwmEr5kdrSW9Mb6oQvQbSMiN8+2lAACRjXJgvRZsLhwrqpDtUCdLMZ5wgEwxjWhtPQmsD+wH3WHMG9Rjw4LKzGA44HXAWSEe266xPKOiaQa9tjsKZKo4MSfzWjCrXaRWc3pvzsUBiZDCa7Rp/DtUGImFHE6BMjnvNSIKnILxrrpxMXslxYJ3bLPtPvHeEvAtLlCOCJAstmoq8h3PtrhoaJKGPFmTHCP7hsOc3WwISnwTtNnHYdLdpKgeon8AJ1QJ2AKGqLfSO05UvIv4V9l1m4uHnitu+qZ+sRzJ4ZUPOWqhhlaa9/dMmUS7UrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3348.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(66946007)(956004)(9686003)(52116002)(44832011)(9576002)(4326008)(8936002)(6496006)(66556008)(316002)(55016002)(66476007)(2906002)(26005)(33716001)(5660300002)(508600001)(86362001)(38100700002)(38350700002)(6916009)(186003)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9knoU4uhJRgq47vkBJbhEqAFhDLpqxd8lCvLwJ+2y5D5Sx3nOsLhaRXpYa?=
 =?iso-8859-1?Q?T/IVhlGERuyjeg8zvYm0lwmwPx1za2iN3qdQg+pqUzXLFJ2RPHaY/B4i8V?=
 =?iso-8859-1?Q?ZphdoFVvL7mw8Q51J4Xk+7qYT63aEBrfVNl5MHLQQoOl8zI1f7AM1n5DJG?=
 =?iso-8859-1?Q?SGNx6G/8WWgf8VkPIPGAYjbEAE/az1zcHbAwAx2FHyWPHrhIp372qzFgNi?=
 =?iso-8859-1?Q?P9Hdx8f4kiIqNtOPJ1gv3IdDsG+cPcDUo+qhcRUoPLKJAhBD+2RL/npKvZ?=
 =?iso-8859-1?Q?uAchJEdYEi90uuhdWBehOwyX4uhuZ3NRQP2o2DZh+DHFmlt2JdaIERg8rB?=
 =?iso-8859-1?Q?4UmLjYjfilbZtm11P6eX+s19Gpv88PJTMFKqn4NATN3FYXd5ZQuMJRWkuI?=
 =?iso-8859-1?Q?Te/xKtKTgBl0Eik2xMg2E72I4gHZibu0sWUnammjKMWCxKmK/7rAUzOt/p?=
 =?iso-8859-1?Q?zJtj068IporMQrqkuwXogmczl0ROKOqb4TrTNJXoVNL6/CpfiVThdY2a10?=
 =?iso-8859-1?Q?c+JmnFkUwLJ9XbcNqlJkpZbj7VExSCgSBpLL8gyU/LRyN+zvjPet0qTiRd?=
 =?iso-8859-1?Q?E6B0qFH+W3qL0QoZY2jHdbSeywCJOqbGxPmqGiiOB39tjtUyWJYLQTqOx5?=
 =?iso-8859-1?Q?1YAVr9kJrkCMYbDeN2rZJjk286NEpPBz//yAPLHtyDlQ7eDLHeW1/5DOKR?=
 =?iso-8859-1?Q?e4s4E1ZSqGQwoqOKWQc0iTubxyRqN4bzl8rY3g1F47MEA3ZcXGhCZaLmok?=
 =?iso-8859-1?Q?SMj4KvhUfgqoNXo+kD/TBVoDmsEh/kQpd+pY0c/hTH2W5dJU2ktYL6O2VX?=
 =?iso-8859-1?Q?rO0gIiMM27qMo8tbkJatBzr2culPX5nbg0Gm+HoINnHgZZ21Wz+CWeD61U?=
 =?iso-8859-1?Q?te7ptR78A2zEODX4fP8QXi/LxX73970tiJHg0bI1BF2LQfm6fzF6deDXD1?=
 =?iso-8859-1?Q?NOtQ8U9rYcZ36yonkmL1tLlxtO7keLg6CZQDOAYDh2iNtg0hNZSi6GxfMX?=
 =?iso-8859-1?Q?sflMzon9BFHvYpcHJtIS965LXeq5WDzRHV5tLuyMbpGMLSIzlKtP/Pna4r?=
 =?iso-8859-1?Q?HVO1gyRMZlvUF/fS/OZU8i+9mqj+z6AAs/l7HlARdXhkcDgVDi9wFijgyW?=
 =?iso-8859-1?Q?jf/Y0lp1r91JxVs+u+raJeFKr6BQvq+gLKHSRbtk9oSX2ifMuvkLIrc12N?=
 =?iso-8859-1?Q?pPhfV7nCL1MgGSUDzEg8FcebubDgTdRBXw0eH7nIzHy19EBj9nxhY+gxhl?=
 =?iso-8859-1?Q?LRIW/fmE7zjFlHMnv6PknxAvUP599JUvy6UPlvQhNPzmQnLrFR9+eZXVPJ?=
 =?iso-8859-1?Q?cHqcItqq1c2yPsOy/KYxTqWwtA9xPSYp8mEgMmsbFnL8S+msTi842mhKUk?=
 =?iso-8859-1?Q?Y1j0V22o9bGiHwff6AXEZTwpmxH/vfWoZsXWmi/HueTalQIgTayAcHyOTg?=
 =?iso-8859-1?Q?UCoDIguhfTG6FhgDzLqoBTyXw5/6v1SNT1O51LXOKUcYmx6xbQyYYjZGn2?=
 =?iso-8859-1?Q?HggDNFhtmkzHjCbiXGZwTMpNREqXvkTcmtSxdIj6CN3cWi4Wf597iglH3T?=
 =?iso-8859-1?Q?DnZRa/belAe9oT5XdV4qq28fu0MEoUO6yS3tFjIlJt9E4ALNduCNCMN+12?=
 =?iso-8859-1?Q?vTRfEt8k5dt6EzH1JYnOryVOO4nJx0gqUVOJGS/GUnqgeWJZkPH8U1QX2d?=
 =?iso-8859-1?Q?Jph8iXJwsMLQQ+iDMULX/KVr7iM8nblikDnlcGL+1bEEmpODwUmHIRRIYb?=
 =?iso-8859-1?Q?sBAbd6eej4BE5X/zGgVA9wxLJqRR9Q0xx9nWlAWhwOrNq+qjei23ZgqNTr?=
 =?iso-8859-1?Q?rC31tJi/og=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1640af-09d8-4f2f-1575-08d9a83e693d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 13:47:05.7684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Bb2VjB/UcNILeA6kbHD3CbNE+mD5dEoAGSHMhy8ZKVfAEy5lHKV7CcEqmFJRSPUSm7VGeAEsARWuIx3U7Szt+wGJnO3s85kfcou5qI2mkcIDNrembgdCQpEgjcRnoPb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4436
Subject: Re: [Buildroot] [PATCH 2/2] package/psplash: add support to missing
 configure options
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
Cc: phil.eichinger@gmail.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi K=F6ry,

On Mon, Nov 15, 2021 at 02:30:00PM +0100, Kory Maincent wrote:
> Add support to three configure options:
> --disable-startup-msg: Disable text banner output on startup
> --disable-progress-bar: Disable progress bar
> --enable-img-fullscreen: Enable the logo image in fullscreen mode
> =

> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/psplash/.Config.in.swp | Bin 0 -> 12288 bytes
>  package/psplash/Config.in      |  15 +++++++++++++++
>  package/psplash/psplash.mk     |  12 ++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/psplash/.Config.in.swp
> =

> diff --git a/package/psplash/.Config.in.swp b/package/psplash/.Config.in.=
swp
> new file mode 100644
> index 0000000000000000000000000000000000000000..e484556922e96c824ecda0725=
e674bc8223d8d00
> GIT binary patch
> literal 12288
> zcmeHNO>Y}T7@lwd0<<8wfso$15&=3DZ*e6$dy0?7?d8j%kZ$G`z(jdy45Np@#eJF{`z
> z14tlo;{yDMN_?G=3DKwLQS4>%!}18_hH^(T~PcGp%KHR+jZ96j01?mO?t^L{8%-v0bM
> z8(XwoUtst=3D#n^AJea>%w_r}a4Uz}$LIvcyk_xtp78Ha^}vn4-t3L9yr_eEe$BOEKO
> zdi+poB?Hqav}9V_M#_T&J`j!6q%k+c#;R749Mq*cTfKkl8So68#z1bPOUvij(&ECr
> z6S-KsK+ingJx$s__Y8OjJOiEq&wyvZGvFEU40r|}Kn83&!#+Y>4^^=3D(SJ#;n*Xl=3Dq
> z@eFtdJOiEq&wyvZGvFEU40r}S1D*lTfM?);$N&!+yZtC*|IEU9{QrOQ_y1o{GWIL*
> z6YxE719%;{bDpuEfiD592(b5n=3DYVH{Tjv<N348*43>*O+U=3DdgV?mWTR@4zkK7vO8)
> zD<B6f@B#2Xa22=3D+JP-W)IAh-e-vFNi`#=3Da>29|(X;P1y6`vdq9_yPC~NP&IeDzE}v
> z29|(_0T=3D6^E?)of40r}S1D*lTfM>un@Srj<8<t-p6)H5O6<xTtyV&b?TD^ByuQzvD
> zpp!%>OSNj{l9Uh-<YcvugCUoSMhzO_E~_yHB{IUVUPNz7!~3xyI~0^~g{93xjgE>Z
> z*z_D^!WioFtj=3DbKB2L+C9~!9^RtJxZ)Zm6&^d#q7ySe&SbG_ATciNlH&h_5*POrVY
> zv%cHvbb8m|@m<!%k%bMVL`FKdX>MJJ#`4VO=3D_!V*x0Jv?xP3p{oxSGnUbo%b>Z}*0
> zTWT8jgff{x4}qyDk7E;LLMTdfC{8$#8*x(NOyg_a&COnCb+^^pE-Y^fOVW}^QadIY
> z(OBm+;>exVbRa}pGGA`aQYa#x$2j18gCj&;nCFy=3D%xJ}9c|(MhszE709I3(rE|sUJ
> zjvJdv$V`i)&~~QN8(YX7V{q>txh%pMTAQvk8UtzTV;xvsZ3WkLHfRKRT70YHZn_0r
> z93!gezBJ0D6;yk>yRlbufxS$7B1@#=3Dcv{J<-1`V}NRiek%IYAh7>mZ^Ni9&VdP}^o
> z525W?8K0tZQkrySzS7x2nvNfI>A5oRh!4<cD`hH>lv1JVzZ_f8++rD;M$!%^F_du@
> zsY|sn65Up(ZEeNMM1oLi2-<b)+Q!<BtH6d$QiPZ}D;?JcMNxzqAGtijt-y6<VP<Yp
> zzL(SsbFKgc&*Cv|3htzWmZbCw0Ze2~9t@|&GL7<>aN%z=3DHX7apaUP<|q;qgCh$X_G
> zBNs4NA>~%a5`_#iWZYa)gVL~ph#LlZRy10Fj0QI{Aft0INSH)wAWUJWd{Go7Y(S}X
> z^T6FeD2%~Orfm^Joi?nYLuqmzQ>^uYBPhyvBKmn0iOjvnAw!WEp?BQ06e^I=3D@Zx@M
> zEXA@Pyz~m0JWX|GjXRxSHi9pa^hM~x+>|Om!r4O!jwh0ibxsSf_S2LQ=3D+Yu?+~Ibo
> wSa2`7!C=3DS?R^J5;GM)}m4Ds=3D9q-vxTX)Q-->0vR??;hvXkgd{nR;RN60O4Ltxc~qF
> =

> literal 0
> HcmV?d00001
> =


Greetings fellow vim user :) I assume you didn't want this in your patch
:)

Cheers,
Quentin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
