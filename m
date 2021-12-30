Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7A6C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14C6F4038E;
	Thu, 30 Dec 2021 20:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yz6X4GAv38Y; Thu, 30 Dec 2021 20:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8F5E4036E;
	Thu, 30 Dec 2021 20:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAC7F1BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7B1E4025D
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=xes-inc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8HSy0j2H6VB for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:53:07 +0000 (UTC)
X-Greylist: delayed 02:59:51 by SQLgrey-1.8.0
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0096.outbound.protection.office365.us [23.103.208.96])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B8E840180
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=jpZFzVKjefJ5GPffrV/EvptZE2VOTpXjUO3lN2taUfbmVSQcwFqOqhd5hk1lcbAMQD3NBujq4OwazogPoB//f6maF5Vg8g2HR7ibBoxNbYbuF8ThUPbCQqy+7SauRobRO1OlweyI/MfaElnIJuOkQM8tiwPWEsAuHYL8YRN+y4f99m3AM7vmUxVpZxKBPpERovCv9YnLSMBrJJsorEFVTXGH6OIxiAbZ+/ldgjnAYfX1puEQeUV7Cy3nFFSXoFihT60teAoRhE6PSiJnIgKBJ+MLQsXnfEvznufG657mQxVYtnJJykQP4+ZhsSYrjTINao9YhWOsabxHNwyauAsMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAKJGeZbiW5F6Q4EYYkSax1mMjPtl9JAISAx6QzEstg=;
 b=UWRxnBK5kPJNuxCPc4s8AU3O7QE4aIshxAM2X2OMoaxwkyz6WixlY+8hRQRGrre1obza0A1YzCmSAWcJLhJX2xkERZwdUwKRU2fwK1vHpq/G9hK8LAnP6unk8nCDfJh1izBJzY95YK0CsTTLjQFUdtmlFGcVEJLjbuNtUcMLYXaG9wKUbzBViEMOoCYRa88cb6BbwUT6vgM4hJk0t3UsgftacuAA/iqyjioS9Lng1W/sksa0tAApEVmCheIRGTQzAxCFebaMZqaSiyJUAFDsYoWROmCe25QLEs87UxPZ/1FGqOcCqZ49ES5sFCwt/I6W9kyT5cZ92kYKLHqjO+b3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAKJGeZbiW5F6Q4EYYkSax1mMjPtl9JAISAx6QzEstg=;
 b=hlPRv9AVrpOwwmXiqjpIQE1G56VGUcvtdUWbS03J/Eu7+ve97Zi9a0arlWPmx9Re4WGBhvTBfB9C2NSIWozGm7Ot0IKvoRkPPn/7BPUEjYQYYq23EVJ6NVgWZj0QcEVKCS9ZAq7iOb4taLvQYM320FC+FhJ7Z20KtH8e/0MYROMTa2up7LVwKD1nzIgdNOJSD8x/MRU+mZMKRSBYHGGVuPOMkQjqTjXR4+KdPNNGmrgC9gp9RRZuMJ84PgCVu2mfBj5AhNElTMKz+1sRTnDyPEeuAHHwW27GtHerXdB2A6c4Ap+rHmhcwQjzlxbf7lMP8aAoJ8P2feJV0PYUMiHrcA==
Received: from BN0P110MB1723.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16f::22)
 by BN0P110MB1014.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 30 Dec
 2021 17:20:32 +0000
Received: from BN0P110MB1723.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e00c:f4a6:6ac9:af4e]) by BN0P110MB1723.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e00c:f4a6:6ac9:af4e%5]) with mapi id 15.20.4823.024; Thu, 30 Dec 2021
 17:20:32 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 1/1] package/nvidia-driver:
 bump version to 390.144
Thread-Index: AQHX0Yb5aPOyTeTh606dnKTPYUaHUaxLk2GAgAAEEKA=
Date: Thu, 30 Dec 2021 17:20:31 +0000
Message-ID: <BN0P110MB17231DB4C540B23E46DA1DB39F459@BN0P110MB1723.NAMP110.PROD.OUTLOOK.COM>
References: <20211104141910.1840914-1-vfazio@xes-inc.com>
 <20211230173513.21e06b0e@windsurf>
In-Reply-To: <20211230173513.21e06b0e@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ede895d7-4d6e-4836-72c4-08d9cbb8af08
x-ms-traffictypediagnostic: BN0P110MB1014:
x-microsoft-antispam-prvs: <BN0P110MB10147DE0520EDCBCF438065A9F459@BN0P110MB1014.NAMP110.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BaS7LiZIX13gzA4Ot9FB8zqb3VlhjDquJF9c+iMNvSQHwJqz16h2dCC3wP3fbeBa27L7SJcLBsDAf+QgfmKRz3mqkoEHcwkVi5R1QFpy05t4HS3TIi8A88cSH1BgokL6QItmKX5Ml5YTusIlHgDF/Vj8EsktVd1j5SPB6TdQyPuiIQijHEvSgftR+1AvevlyHXDWfpvOzYt90U0+0n00IS4l5x99aMR/pZMCm8kyeoAoTP3Qv2CgTA8b9Qdz9T4noeFpGVuFxOMXw4YCJKMcZn0OGE45gLDVTSH7gAM051fAkJiayCYL2gyOm/1jcplFt+GuAUcKxBn/MMG0jiumVdOrikcGxnhU1hyAcGH6ItdOp/Yza81ffz2Fv8rPDk2/7rcpVN/yETQeFhFv0MmDMW8TwwG06xf/RumDcRDZi/KaNoyDlVEP+BJY7wE8UvUGXJfluQIegKHGQIkHhv7s+lLFduop6uE7XuWnxjntddafStigPMk5jWsNjDNfKAeiCYfqcJ1BmFdCJzOrUoJev7n8ooMxinRR7RJ6g+sGN4U+OyHRrDqRzCWQ+MdjClDNBkcHJPpK7EiavGPKuhZNNadDqtGV0rVQ4L4vaQZNZgNDimFfl5p5IGI2QHTZ/L0BGx4Yfxn2+sr1hkWHbi7ljmtd1TxtyD++ExOmysoG38+ZGpuaUqAcFrw6QtmRLqfRVOQ/bPdvoVqfbJvfxIgas9KA/QdFgPMFs9nOSItzrPbRJgtamTMbia+StADWkJ5NnRl4Stu55YIFvO4FGWasKMLWsvtcB/mySZJItjW5w/illVzFhBAPBojvHTf8Z8ec
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1723.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(33656002)(52536014)(6506007)(83380400001)(5660300002)(2906002)(8936002)(45080400002)(66946007)(26005)(66556008)(53546011)(508600001)(66476007)(186003)(76116006)(7696005)(66446008)(8676002)(38070700005)(4326008)(54906003)(64756008)(71200400001)(38100700002)(6916009)(55016003)(86362001)(966005)(122000001)(9686003)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m7BlNlJOt+TDsNIgZAvyX/D4i0/Oy7GINbPp/RKtCDsfq/CngtoM7Prd5pwK?=
 =?us-ascii?Q?yIJ+OKxIZ4GmiTXYmBEgphApoCzDuR7p3OCscqc7d0bO79t6kXywzfivtZtp?=
 =?us-ascii?Q?DHBQZfyZV1CfIYFBj4bWZBBRgdq57jMY0WaJd8+eG1MPZuOrkbAcPCPm+jKE?=
 =?us-ascii?Q?BVpYHL0HSHdJNri9VykB8nZGMPgjXQQCjP700ith199dlZgcu1pjqx7z6hkI?=
 =?us-ascii?Q?E5dbZb7HSaAy8bSj+wlVlbBYVid1VTElgswoHh3RNtObFbCH6qONfs7lc6H+?=
 =?us-ascii?Q?2wnXLTPchJHSF3K3B8khjLD7wkEvGum1aTPB3IzpPCZuTJimwf9KF08GRG4K?=
 =?us-ascii?Q?BYtyk1YzrTkmnE+FN86Bu0LJCMACNPv3A2BD3vdmjWNhanPnhQR03MsARydq?=
 =?us-ascii?Q?Js7wsXuh4trKtPcQCV3oJuuDOb7XKhBc/NCZ29aE67PvXYdnNykFgtFPoB3+?=
 =?us-ascii?Q?7bLJXa37PsUYe2qZ7ZEd+vMuXIST+LGxyDSHAv+HZC9+gI6kxn4ie3EUMF/r?=
 =?us-ascii?Q?gwSEaBCHqZ2X7elJSuigImmP/ygXmctBOdPNO2mkX17gOQaCzZlyGwlBY6ka?=
 =?us-ascii?Q?gNIl11W3Ns+ceARs3yu7gQr1qVtrn70489KB0PC9kW4TSSnw+euPlqKy2+DG?=
 =?us-ascii?Q?RpKDqf4MFvosEe59GuWsur88j49fgZGc280iBMxuSXcRQuLALXCjeEe+capp?=
 =?us-ascii?Q?pZOoLVWV3KkQiW9WbBYwui5M/9Av6yPrSohFsMtPogg7cYv9vkNTcEAC2WCF?=
 =?us-ascii?Q?hc6AHDsgOV8t5g3jI66yiZSGM8FswsFbmRHfBlymoJpncd/tz+todCpl8GZG?=
 =?us-ascii?Q?/xUV7CVAzTI9Utfh92TsOgfxl4e3zy5NRVUnNOkSsYeZ4MUCAtAbaBPDmWAC?=
 =?us-ascii?Q?bWLjo6wdXYUepqaN8jtxBcN07VBVjwo90eadGGZMd0jVltewVBr6juOmzLFH?=
 =?us-ascii?Q?+n0cRJfcw0LtsQ06o24Axui5W2gnp/drvNoeD0j4V62ulqz38sbyAuBs7Xo9?=
 =?us-ascii?Q?mwmuYtgl8vOqnRf66NdUYixILw9+YXVZh8GMbqaWvUqyZCwYY/KnVKIhNzA9?=
 =?us-ascii?Q?SQBI/Eq+J0Y0Ky1a6RI3ummcT7Azc0C6fT0wP13dS3lJVGdn0ooMvOOjcGx2?=
 =?us-ascii?Q?vWONED0Bd+dV93O1yQ68e64Wvg48afWV0hCgQBJujFcglVRVklX5xzwOHAdn?=
 =?us-ascii?Q?T9SLrzyaUDvN3P653+gUWj8VcPmJ/V284sgD+WAPc/tpIxn7YL1mlVvfTJA?=
 =?us-ascii?Q?=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1723.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ede895d7-4d6e-4836-72c4-08d9cbb8af08
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2021 17:20:32.0105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1014
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] package/nvidia-driver:
 bump version to 390.144
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas,


> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Thomas
> Petazzoni
> Sent: Thursday, December 30, 2021 10:35 AM
> To: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Yann E . MORIN <yann.morin.1998@free.fr>; buildroot@buildroot.org
> Subject: [External] - Re: [Buildroot] [PATCH 1/1] package/nvidia-driver: bump
> version to 390.144
> 
> Hello Vincent,
> 
> On Thu,  4 Nov 2021 09:19:10 -0500
> Vincent Fazio <vfazio@xes-inc.com> wrote:
> 
> > Adds support for Linux kernel 5.11.
> >
> > Define IGNORE_CC_MISMATCH for kernel module builds to avoid an issue
> > where NVIDIA's `cc_version_check` in kernel/conftest.sh may falsely
> > detect a mismatch and fail due to matching on the pkgversion substring
> > of the GCC version string in the kernel's include/generated/compile.h.
> >
> > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> > ---
> >  package/nvidia-driver/nvidia-driver.hash | 4 ++--
> >  package/nvidia-driver/nvidia-driver.mk   | 3 ++-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-
> driver/nvidia-driver.hash
> > index 7f2248d0f9..9e6deb0061 100644
> > --- a/package/nvidia-driver/nvidia-driver.hash
> > +++ b/package/nvidia-driver/nvidia-driver.hash
> > @@ -1,4 +1,4 @@
> >  # Locally computed
> > -sha256
> 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275
> NVIDIA-Linux-x86-390.132.run
> > -sha256
> b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d
> NVIDIA-Linux-x86_64-390.132-no-compat32.run
> > +sha256
> 8bb6e8de89e8f8325466af29cf0fa235c988d19137f7fe3eb6bfae1d5e305e74
> NVIDIA-Linux-x86-390.144.run
> > +sha256
> d9b36e51253592d7aeecb9758ebccf30348ab364c88f95aa5ba33c767470949c
> NVIDIA-Linux-x86_64-390.144-no-compat32.run
> >  sha256
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526
> LICENSE
> 
> Sorry for the slow feedback, but could you check those hashes? Indeed,
> I don't get the same here:
> 
> ERROR: NVIDIA-Linux-x86-390.144.run has wrong sha256 hash:
> ERROR: expected:
> 8bb6e8de89e8f8325466af29cf0fa235c988d19137f7fe3eb6bfae1d5e305e74
> ERROR: got     :
> fa586d11fcf103f81eda7d859a2a8ccdeb7371f4742fe942cb4a9b0aeb6bbb30
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> However, *before* doing a test, please keep aside your existing
> NVIDIA-Linux-x86-390.144.run and
> NVIDIA-Linux-x86_64-390.144-no-compat32.run from your download folder,
> and verify their hashes. We indeed want to see if you got the hashes
> wrong in the .hash file, or if really NVidia changed the files they are
> serving.
> 

My archived downloads show the hashes I had included in the hash file

vfazio@vfazio2 /mnt/development $ find . -name "NVIDIA*144*.run" -exec sha256sum '{}' +;
d9b36e51253592d7aeecb9758ebccf30348ab364c88f95aa5ba33c767470949c  ./buildroot/dl/nvidia-driver/NVIDIA-Linux-x86_64-390.144-no-compat32.run

vfazio@vfazio2 /mnt/development $ find ~/Downloads/ -name "NVIDIA*144*.run" -exec sha256sum '{}' +;
8bb6e8de89e8f8325466af29cf0fa235c988d19137f7fe3eb6bfae1d5e305e74  /home/vfazio/Downloads/NVIDIA-Linux-x86_64-390.144.run

I just manually fetched the packages from https://download.nvidia.com/XFree86/Linux-x86_64/390.144/ on my windows box to rule anything out on my linux box:

PS C:\Users\vfazio> Get-FileHash -InputStream ($wc.OpenRead("https://download.nvidia.com/XFree86/Linux-x86_64/390.144/NVIDIA-Linux-x86_64-390.144-no-compat32.run"))

Algorithm       Hash                                                                   Path
---------       ----                                                                   ----
SHA256          D9B36E51253592D7AEECB9758EBCCF30348AB364C88F95AA5BA33C767470949C


PS C:\Users\vfazio> Get-FileHash -InputStream ($wc.OpenRead("https://download.nvidia.com/XFree86/Linux-x86_64/390.144/NVIDIA-Linux-x86_64-390.144.run"))

Algorithm       Hash                                                                   Path
---------       ----                                                                   ----
SHA256          8BB6E8DE89E8F8325466AF29CF0FA235C988D19137F7FE3EB6BFAE1D5E305E74

Not sure why there's a mismatch. 

The patch probably needs to be bumped to 390.147 anyway as that was recently released.

> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://usg02.safelinks.protection.office365.us/?url=https%3A%2F%2Fbootli
> n.com%2F&amp;data=04%7C01%7C%7C8be2745115fc42b413c108d9cbb2667f
> %7C2925f1cdbdc34a76bb386159e20a17f1%7C0%7C0%7C637764789367091265
> %7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=s4W%2FW5QJMgD
> ULUdTjEsMaFKJICBjitfTGEXHOL5ZeKs%3D&amp;reserved=0
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
