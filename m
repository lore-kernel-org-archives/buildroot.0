Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02A8C001DF
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 08:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A8D26109D;
	Tue,  1 Aug 2023 08:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A8D26109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6Hb32dR0FKH; Tue,  1 Aug 2023 08:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D0BD60E2F;
	Tue,  1 Aug 2023 08:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D0BD60E2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E03721BF2F7
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 08:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9017C4028B
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 08:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9017C4028B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGdEO_SpsWeL for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 08:22:42 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 203D940164
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 08:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203D940164
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak9OaUslc33kFzO4wToC3uzSX+4WjBgrFD9ltWaIjC+ykfcnCJm3fHTGgFaYVKtfiE7KTuIakHkvFi4mfA95c047baI25W3SGBfD0d+lGVuIfJJGXmm0RXvqr470gOLPzMf3wLqU1heLDx9rMdl9soZF/3TVnnRTEkvbTrYBLH/uKxyzPHprgOajyiUNKyvCoIckRRTju/e572cCpzjWRqDtdEVXN4XCfzt7Ub+6/7mbiI1qlTWFQUsV56vxO2peRSzWVUws2+9p3wyFY4T4cvxu1xGho9/9UDChad90DZdEKuq4jgcjzO3uTFoLLOfx1VVfXWUbL62O5OE64H6O8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3/IW79rLlh3C2Kan+Ao0xMqcN6SXtRV0gOrMOHSNfY=;
 b=Feguvp2eWdW+YdSEaaEQ87Pbd9MwFJLfrS3FLMPH5kT9pXmvehv2SVFBOLcbiMGhnGnD66NOkSyf4XcVbwmoIUbiqpkzsO+IC18t4itvXXMTYLu2zw0fFHOd0WUK9fgn/ag/I1EeuwxksA2vSHMwXpcQapuUyoQ6pk9B6wHTshwOntAqRVbJ6cc6KveZ/DWVmfmtuN6uHrNz2vBiwJcqLeoXd3exl9gjtKoQOFHT8fxn+E4K9PIrCLV+MlZgIfPFrU1sNaDmi6MtyJDfnfZQTJd6NCTRQWig9EjPqGePBXpZw7JwZ3mx/vnxkg/rhm3+Ftkf4PPvqXO6gc3LLJWvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:22:35 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::c780:32e8:203:be20%2]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:22:34 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] board/zynqmp: merge post scripts
Thread-Index: AQHZvhqYDJVV3tLyt0SPpRgCh4Jwsq/VEFMAgAAVKnA=
Date: Tue, 1 Aug 2023 08:22:34 +0000
Message-ID: <CH2PR12MB50042F30E1EDA26D34C8EA82F00AA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230724103508.772579-1-neal.frager@amd.com>
 <20230801090326.7f95eb85@booty>
In-Reply-To: <20230801090326.7f95eb85@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH3PR12MB7548:EE_
x-ms-office365-filtering-correlation-id: 12d5110b-848b-4fe5-6a25-08db92687562
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 72/AMM6RlAMMbcNOdJnC/zWNmBT/VGuFgwqpoJZ2VZVVfjEW/Z8bdxDG4ig87dZtJYFyXx+47V+8x+95Mui5io/X+woYRZAzw5nk/K/MOODZXlv0b+xYDr0SGz+dIVYh3x97lJjgAdzs7cYAZDbHTtH3fBESK9Whuw/5J6v+lcxSVqhW9Joz797zsQkkGTj2A5Wnyy9DT8MwSw5bBtKdAUYO8V+k4dE+qSuHHogoe3QNJazotCajLe3BKUmdNKj6Bh8npVO+JWjO2+sNzse9WOyf12zGwXlGVUV6IeAkFb1c8WhLded1vwWvrOk9NzURF2XvXC33euOw/EcrYRe8SZF6/I8CyGLO5eKPxkg40qHZtCcxhnZET+wcX7GqDfIoWrQhefGHJhw5wjijYfblrh7JkV2IPE2wyH+F30qqZ5a6+CJU+bfRgf13tCfnL7xuwCXn+2m5dF82cHckERikYJ7lLbjRL0yyzf5+h8ZHaa/Rh1gJJCPQiJ5og/CNRw859RSumF/qADRw4AkzWmSxHQX5dM3tdD6VYW6u0kp6Ojrc9TNgfxQUyeKEs6j0W7ATxcWg/tUMDaVSeLSdFF2Jvj2lVCruz8ODm1Mr4QlrOH3CWNH0L1GCuxZwyejRXcXu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199021)(5660300002)(52536014)(8936002)(8676002)(6506007)(83380400001)(316002)(478600001)(186003)(41300700001)(76116006)(66446008)(66476007)(66946007)(6916009)(54906003)(66556008)(64756008)(4326008)(7696005)(86362001)(71200400001)(9686003)(38070700005)(55016003)(2906002)(33656002)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?trU54vN2mm2LDzJYMzS4my/rJ51ESWTrXd73Xp1us7+MgcMletkZeZVIQYhJ?=
 =?us-ascii?Q?bjLkkrej+N/Knt5nU4f6FRK0J4r+s6sLWsn1yw0GwH5CKv/uRy2E8jrG6SDo?=
 =?us-ascii?Q?+FlTCbno3PZfi2ytGi+u8F+njWuWZCyONp73QDQ1KSv2LEYd5VexacV6IOSg?=
 =?us-ascii?Q?zVYpTbqUlY+LPG5XZp2YSA6QJStgYWS/oRpaVdniNRgF24oNikYv4XEOruFm?=
 =?us-ascii?Q?5yEPh01Jw+nkzs6i1PyV9s4x5qfbnKH+en2iD2gZz/xo1nUaGVqhgRP4DDY0?=
 =?us-ascii?Q?H5wbq3fWXZSTxwmKlHzK6pYr0Gc3plDMcgZvxIBdCowUzv2urWf8Juo9XrMM?=
 =?us-ascii?Q?IOC1V9Jn/LZHaJlruHwY1EH1B0uXaqbxPkmhROmvjz7XWim8MKvKsV3EuRHL?=
 =?us-ascii?Q?wKPcHSZXoeycn1o8G0QQ3yqDqB5VpOwlreqwwc/X0KX+CEYnISlVCeCXegRo?=
 =?us-ascii?Q?1fDM0Bxj9grrYn840ZUFbEoOt1QiNsEAFGeZweExBMTmskhcLEyVQaSjmOQU?=
 =?us-ascii?Q?VSOMOTuJTACGyDr/o6hZFGP41IEVfzDc1URUfoUKAWbLZ+WZgxMhihDLGmcW?=
 =?us-ascii?Q?L+vlKe44Grhg/v4QzJsYYysdotZmE2TSxuUPniwQFnDl03WFjWlPcxJzfXEw?=
 =?us-ascii?Q?dRxPFi3ts/RjMRX3S8pKpdQakojHv2pPnTNjdNjTRis+LrWxxZ3RydvVK0kH?=
 =?us-ascii?Q?dObiVxrxfONbiU88hWa+MdRtdWaiqiBLIymQeDvDET/pBiDOmFYxpMcv+TDu?=
 =?us-ascii?Q?nG/J8ghiTmLy4rLwlEQlHn376EpqE+6sef9H+4i+hZWolrmLzU1nHtIuBfPI?=
 =?us-ascii?Q?zfH2V3Nw8iN++kUrkbkG3crsBHWmEpef5bynsSXPROJICe/xP63WdxzdESXl?=
 =?us-ascii?Q?fSfPE+xtAU2BLYQamrAgCG14s7HMjiNNBMCk4F0BGfhVFKD0FmX+FPzjlzqa?=
 =?us-ascii?Q?TqrnvnywRbgLdjo/Tej3PFrwLkTJfZNk6BLOZsCPFGGM9bGEq+STSf7SQ5Gp?=
 =?us-ascii?Q?EY98tjZRNiIPkCTto04G64vLDWaVp8Sx5QAqFQRnsYBHhS20WweeGKLw0CrE?=
 =?us-ascii?Q?23e8IG56YwP495Hx9Dj2bYiXI9fVLkWj3V9X5wpEB+4Z8EMnx1/OzHGjj4tP?=
 =?us-ascii?Q?kHUMPl6svuEmTHRZ/37aOdu/5AnY9ss4OKaYx3unp7SxFQvuqARvdX8zBXxY?=
 =?us-ascii?Q?8hECm5c/WfYbxLPwKsVD0CyG5uGtCYN1YgPUoKDliq03k/HE6ibI0yBoJtqw?=
 =?us-ascii?Q?cbH5LxlZe3etbvGE0cMemaq+bIn5JcOATfGkRdqi19VequpHOndvAHq1SlvO?=
 =?us-ascii?Q?4v45/iJ2onHXhJZ0osCm7Jv5jYNIcUTt0rxEK4UwCNSiFOgKfXxbH/TNpCCF?=
 =?us-ascii?Q?82olghQADVVj0f13So/OjZsu2MY/80+4isri2Zh4vn4V96/QBkwKlcOIftSE?=
 =?us-ascii?Q?pSjHviwxUKe+GlSAQemyqHuVfTSuFJgL+B2uNcgkRG5lwGscRJZ/oZMsSPTH?=
 =?us-ascii?Q?x0hRhbNkhlbUII+zy1qc4nFl4sY1Kg8Q2drDfufcO2fQ9Nq7rYNDvOpEjA?=
 =?us-ascii?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d5110b-848b-4fe5-6a25-08db92687562
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 08:22:34.6178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtFhsFJeHs1eD491t2khg2WNGCoH/Sg9+yMQrq73jWyr+jpegLcyfUHou4/gDaoj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7548
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3/IW79rLlh3C2Kan+Ao0xMqcN6SXtRV0gOrMOHSNfY=;
 b=zwURQ8p37NpaV+7vL5IN6KYvGsQX5n8TqYRP6U8ALKfw4PGZwKPDSz+HvN923fzr/k7NPK0RLcWpT4neACRnjcf4e8mcsK64v8nglrbuGjrj/WRPZrlkEjSsTmuh+QLPlreiNLPuITDXEsX5mpVTfz0UcR4Rjm/U8I3dGwxvXDc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zwURQ8p3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: merge post scripts
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch merges the zynqmp post scripts as only one script is needed.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynqmp/post-build.sh          | 15 ---------------
>  board/zynqmp/post-image.sh          | 13 +++++++++++++
>  configs/zynqmp_kria_kv260_defconfig |  2 +-
>  configs/zynqmp_zcu102_defconfig     |  1 -
>  configs/zynqmp_zcu106_defconfig     |  1 -
>  5 files changed, 14 insertions(+), 18 deletions(-)  delete mode 
> 100755 board/zynqmp/post-build.sh
> 
> diff --git a/board/zynqmp/post-build.sh b/board/zynqmp/post-build.sh 
> deleted file mode 100755 index 747991e3f1..0000000000
> --- a/board/zynqmp/post-build.sh
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -#!/bin/sh
> -
> -# genimage will need to find the extlinux.conf -# in the binaries 
> directory
> -
> -CONSOLE="$2"
> -ROOT="$3"
> -
> -mkdir -p "${BINARIES_DIR}"
> -cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> -	label linux
> -	  kernel /Image
> -	  devicetree /system.dtb
> -	  append console="${CONSOLE}" root="/dev/${ROOT}" rw rootwait
> -	__HEADER_EOF
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh 
> index f44b66342d..4da8a64940 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -12,4 +12,17 @@ FIRST_DT=$(sed -nr \
>  
>  BOARD_DIR="$(dirname "$0")"
>  
> +# genimage will need to find the extlinux.conf in the binaries 
> +directory
> +
> +CONSOLE="$2"
> +ROOT="$3"
> +
> +mkdir -p "${BINARIES_DIR}"
> +cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
> +	label linux
> +	  kernel /Image
> +	  devicetree /system.dtb
> +	  append console="${CONSOLE}" root="/dev/${ROOT}" rw rootwait
> +	__HEADER_EOF

> Why is this change needed?

> The extlinux.conf file generation is in always in post-build in the whole Buildroot tree, thus moving it to post-image only for some boards seems confusing.

Thanks for pointing this out.  I was not aware of this.  

I was simply looking for ways to simplify the AMD/Xilinx board files by reducing to the bare minimum number of files needed.

I agree that we should keep the extlinux.conf file generation in the post-build to keep consistency with other boards.  I will close out these merge patches.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
