Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B28C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 13:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C5C56110E;
	Thu,  2 Feb 2023 13:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C5C56110E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaphX4l3DREE; Thu,  2 Feb 2023 13:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 446F461008;
	Thu,  2 Feb 2023 13:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446F461008
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 346FA1BF30A
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E13981FD3
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 13:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E13981FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82ZceoyYLnXg for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 13:40:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 477EB81E9F
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::616])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 477EB81E9F
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 13:40:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLotX+WUxusuDKjcbbhG0t0V1JfZ97PfL55opMUlG/4sz4dl6lHh1p7V7Pgfh/l40j5mCSjGUQUwV6tbFyJ0OvoltOqPqvIvAj5MbrQa+x7MJpUXOeD1mI1tVio5N6zKTmJpB3jBTr4j1d6CVMFc2ZWfkcW6RvlN0iTR7qm/K+l+BOcXpl0Hkz0Cr9K99W2nvbPIfNyipVpLa+ztFzX9BKEYJCTLN2X1V+zOIjbUIMgXC36shcjCuV185ui3yZdcdrAOBjYPM09fLI/I2hfKeqDO+QSSWMTGh/kkxuhLfJY72hxcCi+vbZZQ2XNJqbAwQwfHMl+NzJ93DF2BDYqtFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oFzWyzP2SgEi6S9kjSc9HTsWgKGTkMJpInk060puMA=;
 b=MDHbDP3t1GRiv+IX60Uu+ifVu8tQd3K2izjqACXF6gpcO4FBmulBnP5NbvEqkmmuY504woi8GOG6toNEFztMHv4atk81gZEhPzdcRjJLeyQzpcivEp9+vD/narwWdKZELv+nAD4kdjZTJaeoM7vPwhaGdhTWSkwkrKn7L9M4jZvUtx6Fywh3pxB6+QNYrwjY/3C2HnvYUgK9PUhGqtewd3KoPDReXLCR3JG1Wg+sLxOGg5nygt+Go2UE3JPeBJsfPXBUMEoxLyLn+QfY0cprphAFwe0G/0VAaYmILoRutdd8/gt/HJZ1rd+CnDMz4E7QZxlI3wU7Q3c50jDHmsYCww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB7346.namprd12.prod.outlook.com (2603:10b6:806:299::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 13:40:17 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::6b2:a11:b5b7:1e59%8]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 13:40:17 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Graeme Smecher
 <gsmecher@threespeedlogic.com>
Thread-Topic: [PATCH 1/1] board/zynqmp/post-image.sh: Don't insist on a
 xilinx/ prefix for .dts files.
Thread-Index: AQHZNnfH2Jk4O08rv0WOMvhC5gQey666og+AgAAGwICAAKjpAIAAWL2Q
Date: Thu, 2 Feb 2023 13:40:17 +0000
Message-ID: <CH2PR12MB5004CC938831AB27A34B0A50F0D69@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230201195956.1758827-1-gsmecher@threespeedlogic.com>
 <20230201225237.0fb5dacb@booty>
 <a8bf6373-ac4c-1872-3943-8fa9c6594ca5@threespeedlogic.com>
 <20230202092120.319d6b00@booty>
In-Reply-To: <20230202092120.319d6b00@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB7346:EE_
x-ms-office365-filtering-correlation-id: d18e2c9e-7c71-4f95-9c98-08db0523054a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QzU4uUsQKuEEk/Gyu0tnIGutKbdeWE+BzTcLyIqJSCgDqjEwKDH7OfOLJWCydhzvoOoFJrF3lKrMVV03HW4t+M/PiQcAFi5GiaR4T9O2jheRKaJfJU9qhuv/qO7I3g1eDeVfA7JaLVwGVGehh/CODrpKF1LbBlNvV0FjF7vQ8AHOaYiNAhmk3oOcKCjO2HrXbHsSl3Hvh1a6cdK5GqWGeeDK8yGCuqoTEFsZlWtY/D7WwKLx6OQddnBeqvY3rMJIQbAze20kiH5pmuI2zcm9ymYwjCVPCuyLtCbQir5J5mrodZKI1PLUo5uK2k3Nx/SyRih1zGYm2Q30layei6ZJ+VK6C/7UjhgWBRhGA9cPZsYX8m5JZHWXMV6k51SFOEi8UN8T3uNmX9zvzQoR47oSD8odXy9SpdVbjtOrzbzeqyFH51MAVWpMSeKhCKXJnVVLbbdb/jm37uU/HsEP0s4qVCeC28evJlSUmlCug4H4+YOhuiBVPkSTxSZm6UPNH4AEr0yQt95FzcD9aklt3m/CEy3+eBoBtpqiRJNPbY9hSwzw3bd3rx0+J7H08WKJBGqe+ru6pJ9BJzRd2kXLbaxIxi3Do3512nHOeURZU8mg6bXQC3h2x6WaD0oqdf5CYD6vl28eBok5cST+70uFZVhE3XOmmu7kKOwZcn27781mkMsTfS1HLVzsmiXnHl9I23rZEnR1ig4Ab8gC0DEXpsO6L7P6naunjQPSi1XgrDRoR1g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199018)(83380400001)(71200400001)(316002)(110136005)(33656002)(2906002)(38100700002)(122000001)(6506007)(64756008)(66476007)(8676002)(76116006)(53546011)(66946007)(66446008)(66556008)(478600001)(186003)(7696005)(9686003)(41300700001)(52536014)(86362001)(55016003)(8936002)(38070700005)(4326008)(5660300002)(142923001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nIWRsvhq5hRnJ47uim8xG6MiQNDqoLKtnKn9dkWeN0euPSA8w614tbUHpggI?=
 =?us-ascii?Q?KDX09n47U3fG7C+zU8dinNPIEYPG7NS5vpx/R76NKEdbxlZvD0n+CeAOWWxd?=
 =?us-ascii?Q?cNP1NWKZHoufgxeSJyTVhg6cSRJ8EGq3KhtbfxHYuZAhMjSOgFoEz40RwZLi?=
 =?us-ascii?Q?YGlS0hdzHWzT+194BZyNP7slh5tn+ics/Px9LK0xt1Q6ka0Jd1PAZwSkVvr8?=
 =?us-ascii?Q?JjhpmXSO7CmowHWAXXeO+fej+spQ+hAeuN4dBAkwTps8QYlQjqFph0LXEIa7?=
 =?us-ascii?Q?THsuNrO68aADTjYHrX65B0EuJlJj5Cwk+8cXfFbXXu0swphqdtkyHQnJC2Pj?=
 =?us-ascii?Q?kxAehSp+E1F7n1kMtvJ5u3a84DNyFRjjoBbM3evMtLf2FMY+8mO1+8svt3ZN?=
 =?us-ascii?Q?bhSAvgDeuigy2Mt0OmKSC1FD9WfzkiArVYCSzIUrkoNV3ISnRBvJV0T8mN9t?=
 =?us-ascii?Q?Pf/CFYF6vArvuc0BFw9EuNVGcAWTZJbJ3I1ar0JDX6yCA3dzvDpBp1OMYznF?=
 =?us-ascii?Q?KRzoK88/Ch2tKoptGu7nuumJNc9E5f8yOewnyY3JCoPKUM7l4tAtsO+c+EqU?=
 =?us-ascii?Q?ojri6/Z0snfBA7DrLm3pPh3dt55OldQ5I/2vpjh0k+ce6SGlOSi5uHNsJr4V?=
 =?us-ascii?Q?qjTlTTjXy8AIKsffFZrYusB4R/CQ4I9mBxlpDZhVXiMofkcq8fR6GYp8wHVw?=
 =?us-ascii?Q?DhieZnYV+ISoxBawEUdsVNSAO6BdaEaM83Bs8sjA7cgIQ74Z4dObSEt9u2VJ?=
 =?us-ascii?Q?3+ABw3u2dBHwNgwJIMgqP808smk65vcz3uqJcxB6xt6PazOWZbXiEhvXbQ7N?=
 =?us-ascii?Q?NTvQedLvmpADI0uKEYelzpbSUyOIiZ/tRect+aAsRDBPRZXMwy1c+No0vr4D?=
 =?us-ascii?Q?kOg4g6kCPNc4vgpdDi5y7KWdt/qiGb02lgT8O0onOzrgRHTjzOOeABY/v8SL?=
 =?us-ascii?Q?0fE+z3zYg48ieKzZaZAhy89e/c+VXZljAbud+bsRTn8kzz4W59W18y/6ROUx?=
 =?us-ascii?Q?cgGd7bwWXplCUFVFi/YN81yFJES0nV3O8oAJeG6scSvtODAacHYdcE7zl0sf?=
 =?us-ascii?Q?fjTKLn5ReyhE3nNAB6JmXTNuC+dtE9/tMni4mGdfDfj4/eYHj+dYS5XLIm6f?=
 =?us-ascii?Q?i47cg0QiUYaCgJWgUwlACWu9tIbRm4uHPZ+7WYP3Tr345yevjnKxJPzLDBIk?=
 =?us-ascii?Q?kkzvfBnI/s/Mt6UrruavAoRYlbsxhp7NFmIRJS8LPpTqeOv4DZUnQhIHK6Rl?=
 =?us-ascii?Q?VXW4yl7b+K9H6siTFQkbbfBOSk4VFx6jmhAcOJnAM0qedDjHs/pKZIKh8iqC?=
 =?us-ascii?Q?Be9hKdyPez5np2awfmNW43xLGu2lY/42vg/9C/9x0n+fgaBHVw4/P/uojRJn?=
 =?us-ascii?Q?oTDC26/FAD2X2D2n22aEJJxOPKI+uatk8dBWjRkLv+N5KkJhk1thk0I/Rf2O?=
 =?us-ascii?Q?g0eqEezvn6sX7adnIe7NbglcnzC2DJiTQnm95UFUQujTwXlGrwPeKKauPq00?=
 =?us-ascii?Q?CW7bOotT2qZN8O0BZoqgwdWvritp9weXVBy7Umd0v5DezWHa2HOhQbkQnnV4?=
 =?us-ascii?Q?iZF6JNHM+hwjudrZfqMA788aFbw1UbqOMBQWy4Dv0fVTvNpkHTwbwqyj/6sL?=
 =?us-ascii?Q?93LTQl5aEgpCaAJS4YM7VKA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18e2c9e-7c71-4f95-9c98-08db0523054a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 13:40:17.3202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25uBKf1b9DKcNunv6y2GIZX925ebhOyL4AAW3/JNR6b9lX4nTnqEwRj3xPNlE+/n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7346
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oFzWyzP2SgEi6S9kjSc9HTsWgKGTkMJpInk060puMA=;
 b=SnUst9eG7rdjac4YQDn6Lfq/eW9iygn20VrS5vrcmqNCzgADscoMioPC6SyotWzm0FYJBPg5ZW1a1GVL6y+I+iBENZH+TjG48DTA9eC6pPS2F7GymuHCcMVBluLTpGyd7OkIEuu8F/wQKAAchcXdq0Yn0OLGBsxEs6imMPdj0vs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SnUst9eG
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] board/zynqmp/post-image.sh: Don't
 insist on a xilinx/ prefix for .dts files.
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Graeme,

> Hi Luca,
> 
> On 2023-02-01 13:52, Luca Ceresoli wrote:
> > Hi Graeme,
> > 
> > On Wed,  1 Feb 2023 11:59:56 -0800
> > Graeme Smecher <gsmecher@threespeedlogic.com> wrote:
> >   
> >> If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from 
> >> buildroot into the linux tree, these .dts files are copied to 
> >> arch/arm64/boot. Unfortunately, the post-image.sh script expects to 
> >> find them in arch/arm64/boot/xilinx.
> >>
> >> This patch does not require the xilinx/ prefix to be present when 
> >> symlinking the device-tree to system.dtb where u-boot expects to 
> >> find it.
> >>
> >> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> >> ---
> >>   board/zynqmp/post-image.sh | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/board/zynqmp/post-image.sh 
> >> b/board/zynqmp/post-image.sh index ed6dbe188c..c5de2db820 100755
> >> --- a/board/zynqmp/post-image.sh
> >> +++ b/board/zynqmp/post-image.sh
> >> @@ -5,7 +5,7 @@
> >>   # devicetree listed in the config.
> >>   
> >>   FIRST_DT=$(sed -nr \
> >> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> >> +               -e 
> >> + 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.
> >> + ]*).*"$|\2|p' \
> > 
> > I think the following simpler change would also work. Can you check 
> > that please?
> > 
> > -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> > +               -e 
> > + 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\2|
> > + p' \
> 
> Assuming you intended \1, not \2 here - this suggestion breaks behaviour for a couple of defconfigs in the tree. If I run the ZCU106 defconfig through this regexp, I get:
> 
> 	$ cat configs/zynqmp_zcu106_defconfig | sed -nr -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\1|p'
> 	xilinx/zynqmp-zcu106-revA
> 
> ...this creates a dangling symlink in output/images (system.dtb -> xilinx/zynqmp-zcu106-revA.dtb).

> Right.

> The right behaviour is to strip any prefixes that exist, without requiring any. Something like:
> 
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               -e 
> + 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(.*/)?([-_/[:alnum:]\\.]*).*"$
> + |\2|p' \
> 
> This is less Xilinx-specific, although it seems a tad greedy.

> Yes, better keeping the xilinx prefix as this is a xilinx-specific script anyway.

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thank you for your patch.

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
