Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A394C04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 09:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CACE40503;
	Sat, 22 Oct 2022 09:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CACE40503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzz-UhiEdVdc; Sat, 22 Oct 2022 09:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF14D40475;
	Sat, 22 Oct 2022 09:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF14D40475
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2FBF1BF39A
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 09:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A06A283E0E
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 09:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A06A283E0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iH2dBE_SxZ8n for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 09:22:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3230B83E08
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3230B83E08
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 09:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAxxQGcQY/5tAsog68vXQ67BkALX097ZJ0r4qVY7HaZBKhDLy9IrfNCi4sBxUeIOerkexDvOWIFO/I7IPso4Su6cESOlA6docaO24X3eZf+JXYyfrlRQ6lGSs6neMLD9ExhHgAchQORneF/W+dP74JCiGcV89sKu4gu+hHywGFhViB1ewSQmCBQAHSHk2crWsnF6TjYvwYJOLq8WwunE3Tk/RiI1JU4IYYcfbSMCzSdoMbE1t7iUfiADCiTj8v++ClY7CDtQXnK3EjVCpOAJIC56aLOd78yJREssNo9g0DLPROOmMByxPhAA3oH3CbQkwK6aeCRQ3XFpgaO/oPERnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JKTsibbLPKN/Nx9l1yJFoAfSxuc6U5A2OK1UkjnXyA=;
 b=Kchw57HNTcxrP2Fdbtl46u4r9d9qhnrB9XCH2g+LEC8L/mnmLOV2hkvMPIoxjgBGeRBlk+8s4jojxi7hhmYAU0/+0a9cr7lC/rhWXNJE7OC1Hs4x5+WWp3PVEUckznmUQxXEt5E2D6a0C/JbKQKH9+JXM3trg2QADfiBjBIGwAzJsq3+/aZ6nT16MX7XsDbmogNvS2aj8YdrTNCx6wlWy42qmyj3kg45gx0htRleJRjp555hJUDzwrx09UBUXIBsf1ydkSu5yW5iblkvWpjOfk3y1gOVU/G/j6mOllZ4c8N7sm/ELmi7fryK3S8LBRJjx/VhiCHubin99xqskcAKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB5007.namprd12.prod.outlook.com (2603:10b6:5:20d::18)
 by BN9PR12MB5306.namprd12.prod.outlook.com (2603:10b6:408:103::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Sat, 22 Oct
 2022 09:22:40 +0000
Received: from DM6PR12MB5007.namprd12.prod.outlook.com
 ([fe80::863b:7437:18d9:39f7]) by DM6PR12MB5007.namprd12.prod.outlook.com
 ([fe80::863b:7437:18d9:39f7%9]) with mapi id 15.20.5723.034; Sat, 22 Oct 2022
 09:22:39 +0000
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v1 1/1] package/bootgen: add bootgen host package
Thread-Index: AQHY5fBFjF3/rZnGs0aTgw7K/nN9ma4aIAlDgAACg0A=
Date: Sat, 22 Oct 2022 09:22:39 +0000
Message-ID: <DM6PR12MB5007802871CC6D33DFFAF1E6F02C9@DM6PR12MB5007.namprd12.prod.outlook.com>
References: <20221022082824.35440-1-neal.frager@amd.com>
 <87a65o443y.fsf@dell.be.48ers.dk>
In-Reply-To: <87a65o443y.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5007:EE_|BN9PR12MB5306:EE_
x-ms-office365-filtering-correlation-id: ba71ec74-80d8-4036-428b-08dab40ef74d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: awS7LNMziBPyLL6RrOJNE2baFtHTll0en3idTOIGAv1F9U1x7GMASGRSMGIt3v8aP0M+WjfycrHeDrLbGxEQu0NRnNtjkEZsLelBsBmpabYeqfnZ/PyQejZxDkNot6IgVcUJ4t3ktg0fJqPOhzWu8sjJbzAN+D9lqn5/W0ehlAVuyI0sj12B0nFeqtit+biwk64N+XIDKHxcJEokaU0LhSHttXEHl+hKI6WN5OLm8NulT2pWbT3Mv6fPwc94KqKFF0aMiLGlbrA/u15rltP1tRNMs8SaGkYvLdaI8h3ZMBH1WHcmL8StS5zlWvz8eCTkMIi9TjIzpFvmUeg2g0Vd6VlGezxSbHjl9t+TXkPTcppK8OOxronqrWfcmIansFPjIsBkNdCFByv42Vu3ezAWpAM7C19E76LPspU2hPv2/uGzs+Tr9Uoe4SR/CtsCqCBq11GFCeuGeEX9nNvuxk3yN35br8BKguBVqU90W220OdgC5kcNP1Yg4/75E9twjIcZ0vPNmuCPkM+VokAF46nzGIdlnTdvh+8QCIHZDFg3rVxG5T3dyXwLYzDFjatLQW2y0rTSCOpjjxAKitLPicQkw7tlYNww5dedJwAodPPR+wRtJLuLBDloxxsUc1VuVq/buEW4hNzCIQOa30RTtv8aRxhJm0Lv/FDHKKS6Fh+KuCRVc0rt84uA0VS2FMgDajUw4ran0NZYh1nHRkv0viAXW0iUbOjf8DuJPEBvbssw7zjO4IZH3+FbIxwNOvsvemrhrCLuOWUDgVVOV8vdt0boAxNwY0D/1ZM4jmbkOlBzMXAogJJyh8hO0q3AnvpsoRgFFp7v0dbfX/IothayGuXvHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199015)(66899015)(33656002)(52536014)(122000001)(66476007)(66446008)(41300700001)(66556008)(38100700002)(66946007)(5660300002)(83380400001)(38070700005)(64756008)(86362001)(6506007)(316002)(186003)(478600001)(7696005)(2906002)(76116006)(8676002)(4326008)(8936002)(6916009)(54906003)(966005)(71200400001)(9686003)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ciObaZXbNDfhtvK6O/DeQWRtKYY0VG9y/Za8qRFZaWGpfJRFEOK/Vgf984ZG?=
 =?us-ascii?Q?sanBrz9Wgv8BjeYbKPuTijlmDh0c+T6mMBhslSDp7CTh5wL+Ko1VW6gTYh1B?=
 =?us-ascii?Q?j7cW2BhDmZgvlW4djIjoas4btIVqifmGFu57kqLAChkxnNKox/hEDsxWxBGa?=
 =?us-ascii?Q?T4zyHnqKD2oh1xfN+iafF6xAOSPNIUTDibYsDoEWJZl8RVwnuZQVtLrghYsv?=
 =?us-ascii?Q?IHQpsXaMJgH+HKL0uSmJ/CQwNkexEoUxYCOQMIoJC6+kocsidT4O3Dr8ro74?=
 =?us-ascii?Q?KSb5HMNZGz4eQR291lRqAkPigYdOzOVddmcR24IKyfmzxF1dCLEKHz9mpdVi?=
 =?us-ascii?Q?RavCddZOdQFrVVzAIBLXyGWj6g2v8kYQxo+sJWJjq9mmm4fNSagA3hUWbxjk?=
 =?us-ascii?Q?4DQJnIo5tuwlIMaBjDj5ZfBl2ymNGNpctDqkCRepnw1Nyz0QbnM74PEn+PcY?=
 =?us-ascii?Q?L9J0fZPCyQMZMJTtKwZNBZaBevWEQcKwYZmaRmxW2geolm/4/RyHZnk9yzZu?=
 =?us-ascii?Q?mh+CDhFGEaVnfKKD/+6yxjH8rpWYAp2Thltz0v8AhqOaOecUOy7h6uxgYN2p?=
 =?us-ascii?Q?d6dK9pTS1EzwjqWEKTU2+nB5+/jJsj2QR0hIz1dSwrrK6bVuHha7cFb4ETzC?=
 =?us-ascii?Q?Y01XRHK7qhDtLJ6MxYNqHt6d6IEk12fC4swGn0zS/sE0/UT78u0Uwd+0Fel/?=
 =?us-ascii?Q?47Dds6GV3LwwNCTstPbdxBby6EN933xU2Z8MWHOiq1s/l2G0zyU9XR2yQnrA?=
 =?us-ascii?Q?Rxw3liqXAl8R/bes6Ip7Z/pGjxCyT2L3sx79nwrvZB2Fr5BFMTrDhRoabGVq?=
 =?us-ascii?Q?r3J+4oydClh+Xgo4uoQpX2TfE2YKnFNbHTZqtjvwMwz+nQwpJ7tq+O1tjIP3?=
 =?us-ascii?Q?jGjfxukrLkR69rs5mci3ws9B65gIDtSyQQyZP0Hm/2Kmulr6k8Rx5Qd/mdje?=
 =?us-ascii?Q?uMryjywzKz5tMUhCHZAmfN4HYsSBL5Ziwm7KKAcjUE2KOiwpMOhq/gw3Ugh7?=
 =?us-ascii?Q?x2zwRdJrsMAuE2fxcydniNg1G+NnE5uAXCXS4DBx49PugLicK8QpxqUWvp1h?=
 =?us-ascii?Q?oBWz2+yIzcgUlUaZu+nRxmoaXEpKp4h0ZStl4IA8CW33QhrgBpQYzbJNylw5?=
 =?us-ascii?Q?G2O8mWfQ9Gqk6XD8L8bwYhDzc1+tKbgpA6PCqSJ3L6oL6QdEpLHXD7vhQYM3?=
 =?us-ascii?Q?dmtxn5xCqTcXLOy9vJ512OeL825Q0idkZWVqql8Mq5l3cAJ1OmO0jtS1V4m8?=
 =?us-ascii?Q?O1m81JodFViyxhjg+EDpFRt8M8qIV1vLk4+N6dhsXJnAqtcd+8dkn4Ju6yvq?=
 =?us-ascii?Q?qFbyrf0RTgrGDTCijnncMaLJCySgGHCB4mR0xHof/GLtWZimHDFkBei4Tp9R?=
 =?us-ascii?Q?OsdPh2qZNsjsbAaL0ZOnWLIVGgbU7OOpg4ub+f63pifDUIKbzmAXbZKJQzzB?=
 =?us-ascii?Q?Nw/atowqDhHlGcXjdBHMRYtYwN9EelYDURmeRqkXsAUn2yhkQ6ol+VBwioFs?=
 =?us-ascii?Q?Cbb+rux/wPiNtXmeQlDBL4+5h9F/avz2uglHpFdYiuAOfolEQht8XCF+41Vd?=
 =?us-ascii?Q?vDW2Bn7KIJSCycSt4HRdtbdugZhO7R4uf5q55b8T6Gk0p29vHs96x2zCP0Ny?=
 =?us-ascii?Q?y9nlVyq4YhDvU0XYmEyNCc8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba71ec74-80d8-4036-428b-08dab40ef74d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2022 09:22:39.7299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XmVRMRcTDLRgiwk9bdzx0bpYvV8yyjvCTw9YMKHh0lSszicVMtiDd6tUsbQDxeIM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5306
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JKTsibbLPKN/Nx9l1yJFoAfSxuc6U5A2OK1UkjnXyA=;
 b=S0V/2j8oio5NaqonF70hyxax/kolkJCGBp5/lMU8oiMYMlW5EytqWeRO7wId3owu8cJVVlqiHh12/ugOz5IHyAt/tIffAcX70OMlprF8kVp1WPw4vaQdpfbmICgGT5GQNzJX6Aj1i3edhJRBZR0b42kSj5fT0adScBuRMfz+Dnw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S0V/2j8o
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: add bootgen host
 package
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
Cc: "O'Neal, Terry" <terry.oneal@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "Chaplin,
 Kris" <Kris.Chaplin@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

Thank you for the quick feedback.

 > This patch adds Xilinx bootgen as a host package to buildroot.
 > bootgen is a required utility for generating a boot.bin for  > Xilinx versal products.

 > In addition, for developers who wish to use secure boot with  > Xilinx SoC products such as zynq and zynqmp, bootgen has a  > more complete offering in secure boot features than the u-boot  > mkimage utility.

 > https://github.com/Xilinx/bootgen

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

 > +################################################################################
 > +#
 > +# bootgen
 > +#
 > +################################################################################
 > +
 > +BOOTGEN_VERSION = xilinx_v2022.2
 > +BOOTGEN_SITE = $(call github,Xilinx,bootgen,$(BOOTGEN_VERSION))
 > +HOST_BOOTGEN_DEPENDENCIES = host-openssl  > +BOOTGEN_LICENSE = Apache-2.0  > +BOOTGEN_LICENSE_FILES = LICENSE  > +  > +BOOTGEN_EXTRA_CFLAGS = "LIBS=$(HOST_DIR)/lib/libssl.a $(HOST_DIR)/lib/libcrypto.a -ldl -lpthread"
 > +BOOTGEN_EXTRA_CFLAGS += "INCLUDE_USER=-I$(HOST_DIR)/include/openssl"

> I have a package for bootgen as well at $WORK, where I instead use host-pkgcon which is a bit nicer than these hard coded values, E.G.:

What do you mean by $WORK?

> HOST_BOOTGEN_DEPENDENCIES = host-openssl host-pkgconf

> define HOST_BOOTGEN_BUILD_CMDS
>        $(MAKE) $(HOST_CONFIGURE_OPTS) \
>                LIBS="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`" \
>                INCLUDE_USER="`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags libssl libcrypto`" \
>                -C $(@D)
> endef

Ok.  I will update this for v2.

> Bootgen also use modern C++ features, so we need to pass -std=c++0x to fix building on older host machines, E.G.:

> CXXFLAGS="$(HOST_CXXFLAGS) -std=c++0x"

Ok.  I will update this for v2.

> I also had issues with linking with the embedded copy of flex if the build host has the flex development package installed unless I add the following patch, which unfortunately is still not merged:

> https://github.com/Xilinx/bootgen/pull/20

Thank you for sharing.  I will push this internally to see if we can get this prioritized.

> Please also add a bootgen.hash file with the hash of the tarball and LICENSE file.

Would you mind giving me instructions for generating the bootgen.hash, so I do not need to search for it?

Thank you for your help!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
