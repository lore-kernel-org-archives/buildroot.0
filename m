Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A358C4345F
	for <buildroot@archiver.kernel.org>; Fri,  3 May 2024 00:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EECD8228E;
	Fri,  3 May 2024 00:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XavSG6EEJ4qx; Fri,  3 May 2024 00:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87D2982275
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D2982275;
	Fri,  3 May 2024 00:04:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED4981BF284
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 00:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E643660767
 for <buildroot@lists.busybox.net>; Fri,  3 May 2024 00:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lQIyBmyc3Ty for <buildroot@lists.busybox.net>;
 Fri,  3 May 2024 00:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2c15::800;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=fran.millocs@live.com.ar; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2ED2606F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2ED2606F0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c15::800])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2ED2606F0
 for <buildroot@buildroot.org>; Fri,  3 May 2024 00:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0DOQip58VkYU5yVu32BWUAu0JaGCmEGZKkgMpqUua4M2sgyGlFdlZ+kwgJQjb9w+Rz7n8aKS3Mn0zN8wJ1Q5vJI5zHnbTr+TscP5WTfU1Gi0Y2h/Rz7gWuWREBkDhASo2fFxfsW3pKFrypcBEfqVi44olvP+9/05BUkNEKRT1tQq9D7XMOaKKD/BmzV19hh58jkm4wjVp7ECCQzVQ922tTd3KStbbjjDyOI5Iw1F0BU8BPsAV4mJnxQKu8tT/LYoi2LOjb2ekU3w94JUzCfG5NyjxXtOFCLNitiJTgVcI+gvxHex9E9G0+iN9oorDaQVDNnRYWSqq+sKC0LUT8lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6Qk4Jascmy6cefWy+TEV9ZDEokyWjrWtt/0FBHu8YE=;
 b=cHr48Ad4y4NvqRbiWWkynlbLxhOZMNi3yWNHjbwXWkBMZYpmf2fmbul75lTDMFhJXdCj3796uJMczueFSqzFOxh/5KWHPLE/YDHVOHCw/aiNmwA2uQs9E3nBYDildHKzUWzhN+F+VyKa5956pe8vP9os7Zfc78CBe4fgQogOKg23Ick6GboT1qc6O2QPx4/ZBDBypTZfPMZ0TXOXLkqwTXNZ++rwAqQu/D1YthGOoVS5OHk3OEH5dB3fMzRgDkSB76Vm+kwFnAl7taAOB6qgi72rjjEL/YpHSEA7bncvWaM+rfI9k1EBQCXHD79G5bo3n809jeJbqU5NV1B9jk35Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH0PR19MB5409.namprd19.prod.outlook.com (2603:10b6:510:f9::21)
 by DS7PR19MB5950.namprd19.prod.outlook.com (2603:10b6:8:7d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.34; Fri, 3 May 2024 00:04:24 +0000
Received: from PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::9dd3:943c:23b2:5029]) by PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::9dd3:943c:23b2:5029%6]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 00:04:24 +0000
From: franco ariel <fran.millocs@live.com.ar>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, "arnout@mind.be"
 <arnout@mind.be>
Thread-Topic: [Buildroot] Error building flutter-engine
Thread-Index: AQHanMkOII7OUdRzzku27o3ql7kTvLGEn3+J
Date: Fri, 3 May 2024 00:04:24 +0000
Message-ID: <PH0PR19MB540974F4DA3A6E8913D6EC7DD0182@PH0PR19MB5409.namprd19.prod.outlook.com>
References: <PH0PR19MB5409054A4A7DF4561A75F2E9D0182@PH0PR19MB5409.namprd19.prod.outlook.com>
In-Reply-To: <PH0PR19MB5409054A4A7DF4561A75F2E9D0182@PH0PR19MB5409.namprd19.prod.outlook.com>
Accept-Language: es-AR, en-US
Content-Language: es-AR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [urW24VrYwHj7lnBjSMNpFv7zHWy0LUSBKtUGs2RGHJEseIcq5VlNKSNpWUPLb0TD]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR19MB5409:EE_|DS7PR19MB5950:EE_
x-ms-office365-filtering-correlation-id: 2c77c5fe-19b2-4070-8519-08dc6b049784
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199019|9400799015|102099023|3412199016|440099019; 
x-microsoft-antispam-message-info: I/mue2BQW4OHpQwWuQq5Ag3PtvyqJXol7EvUDNgruLd7lXVXVl1rNGzOtA/xKXNrKxIIbpqqg9J1JXZa1aMO0qblyD35DCFbFwu3LG3zuFpECM2kcuC3TPuIi4MQzamXe9YB3dEw+S5DDzHqfIejABIEnqfsM3mwSpcK4GDmoNyPejT8DMP3o7F9aKEuvZorFEgLHU2nDFRtfTjN4tNCYpdEaOeoZ4zY/qXRweSic0uLGYd4+8FQvHMzVLACEWMaIbIw7zkbMt+gaOS8sVdb6TMK+HF07hpeh2Ilscpy+ZDIkislle64ZaLNtYimYg20zo2Twvnn0qcuwscRpKVsLWWTj9dn1cRXz7LiUiqeYTy8+aT7qZYTAI9bjKncUWNEBiVCCiNIHMW4WeJbUcnYrCiv+8qAsiC7JicnYB+xxG3D6zXhBeYsj1mmPPtiS22egCVEr28RylWXq90XOWgsARa4Y8L9QzzbUL6MWiOh4cjqzEliNScBKo8jGhltowzqf0ntBp2xwQmhVhcIfndICrpQQWx4ZshHSEfLZaPIikANP7ULGaLB2PJV6lKSAGmGuU3Es6wn40+vjbCRV3h1Y3yWVAVHynIrADD/vI8BL0SBWOhuVtA8Ln90ju9IcxhWDJ9RefamXqfPZjuOdCbWRte9AMBgYN9LhBOofGZC19Y=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hKad9Hclj/UPHmA8Fd9+KA7TlyeruPYV6qxodbLeQlz2QWm2peRko18Ke84O?=
 =?us-ascii?Q?GP9jKlLOcqBNbT4OfeJa9FL3fsirT4Svfd7BncVV8oc4WaxoFAteZRcvEiNG?=
 =?us-ascii?Q?eTIYqoywZ5HuRHdShA5W0QyRMDBIW5N3blryQCu2qzn0tdbfeIT+W8zRfxDy?=
 =?us-ascii?Q?tMS1uw62z2F3YnnxdUeDty7mJIhh1F0mTWmGSCcm1fCmhEaZv3t6izCK2rSB?=
 =?us-ascii?Q?WPKV402qHc+ijdp62aYFB3o9JGQFahTwIL5eMr9ZnXCEAVAP9sowy+l80vqT?=
 =?us-ascii?Q?NMqz9ZBfKmnufIYUkgKTu9nMvZSeYi4DBsnVPSeEUKVq2ti/ZTWrVngFu4+P?=
 =?us-ascii?Q?591drTu3oLqKFX+kAeweJoQpdN1MK3HaMiUTNOlQitGVNOCpgbcjVkCHZl7B?=
 =?us-ascii?Q?sp1cCe5mOrbP1ylY0QC8DGXMluyQkXhmwkGOIzO2qFS5MhS9b8pJBldn0DGA?=
 =?us-ascii?Q?1+bMe+kPPiHp1tRHusQbrIBx+sXdEkLoNs/TT9i0jxjIcTxk/EfpvKdgw4BV?=
 =?us-ascii?Q?oTpKB3lMKiGs0+HlnzCG6aSOR6V95AFjmf2h3He7U56bNWyytNgp5a0MvLRK?=
 =?us-ascii?Q?lJ9QlgU1Boou/EsGOJ+cOHBBdllGAtrRaiR0njJ8InfWEDIpLtcpbMpDbGl4?=
 =?us-ascii?Q?EUdH8R9MK3us/H6okMDrlYZl97K2gsVFoIfeGfA0HHH79rcUwFCguGvK/Can?=
 =?us-ascii?Q?P33fR5IPB8V2wo59qVU7wNY6yZ95s7QsNEuiiX72snu0BwOmFu7ai3hXUNom?=
 =?us-ascii?Q?y4dP5styg62i65qfZg7iOG8pd3kA0Yx+5wnjhvwflsbiXxLukIPMVqa/vqFw?=
 =?us-ascii?Q?7L9DfNWsXg2T8jpqjPzTNVRlSMHLEcmSXlxCa9gzGxGcTMzNraht3wmKqKcM?=
 =?us-ascii?Q?2GjFdFAjyRy2HvxpX7s2MF/SZu5L4EFM4JfMNKoXAdy8wFha2jCP9s8a1xAc?=
 =?us-ascii?Q?8Rc2ELYiZpxTaIunr2SYPj7gGqk+UT2uSLeqPaltlxmEzSOlyKWNn/n8g5Mo?=
 =?us-ascii?Q?q4mobk34g3NAyv4iF3wwqtchUniXO3KWpIsCDMuCIUDA3bJOZyhY5ZaKGlfB?=
 =?us-ascii?Q?kVEkFUlGU4AA/9L1wJJfKRlabdoIdgr6yqaBMBy+V1GQAYZdMZyn1Q90gTaP?=
 =?us-ascii?Q?fgnJNcaS4Aw/EFhdyr4It291LqpqK7d5MORZ9PqB7NiQrvgiekm/IQw4PTfW?=
 =?us-ascii?Q?AzrHv+VcytRYeXUWNZXDFxXqY0ZAuKkYiFcPSvHej4W5Dm8L10h4jq26HhvH?=
 =?us-ascii?Q?2O6lIXVjWRUANKNdWNgkjMAn71Wl4CnVZXGIt5JyjuyIFaqdi+WCF0NCOSKC?=
 =?us-ascii?Q?RkI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e7757.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5409.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c77c5fe-19b2-4070-8519-08dc6b049784
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 00:04:24.5788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB5950
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LIVE.COM.AR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6Qk4Jascmy6cefWy+TEV9ZDEokyWjrWtt/0FBHu8YE=;
 b=d6nr6UVWEtpYog7xnuQ2pENrCrbBGjPJI2ud8gvXmv4Dlb3ISMIKBYs+Pdwmi8jS/MVc6unjwQbmYWotrQ9ITcHLZhsIgVsY+OOuK7BuF2oj4stLzqxbdp/muEK4wznYlr6sFNQorcgozzUXKGrL5tRHN4OHvpsJDVHSvcO76ESfzPDI2cY0Plpslw/3c16YREenM0iaVV/LpPgKwcIBb/WLjl0BY2D9mHn+Pg3xzCqoshqMmvBvmziRJBMstBsNDWxyxkByUXcdfrZhNGVBfSuU/qYkEVC6k86pkUTgBR44Tkx7uzsi4Qxq/VxSIlAVFdavbNjwfKpx2yjTc8sEkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com.ar
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=LIVE.COM.AR header.i=@LIVE.COM.AR header.a=rsa-sha256
 header.s=selector1 header.b=d6nr6UVW
Subject: Re: [Buildroot] Error building flutter-engine
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
Content-Type: multipart/mixed; boundary="===============8451581375787814618=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8451581375787814618==
Content-Language: es-AR
Content-Type: multipart/alternative;
	boundary="_000_PH0PR19MB540974F4DA3A6E8913D6EC7DD0182PH0PR19MB5409namp_"

--_000_PH0PR19MB540974F4DA3A6E8913D6EC7DD0182PH0PR19MB5409namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> Hi everyone!
>
> I'm trying to compile flutter-engine from the latest version of buildroot=
 but,
> I'm getting this error:
>
>  >>> flutter-engine 3.19.5 Building
> cd /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.=
5 &&
> PATH=3D/home/frank/buildroot-base/buildroot/output/host/share/depot_tools=
:"/home/frank/buildroot-base/buildroot/output/host/bin:/home/frank/buildroo=
t-base/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:=
/usr/bin:/sbin:/bin:/snap/bin" PUB_CACHE=3D/home/frank/buildroot-base/build=
root/dl/br-flutter-pub-cache HOME=3D/home/frank/buildroot-base/buildroot/ou=
tput/host/share/flutter/sdk /home/frank/buildroot-base/buildroot/output/hos=
t/bin/ninja -j 33 -C /home/frank/buildroot-base/buildroot/output/build/flut=
ter-engine-3.19.5/out/linux_release_arm64
> ninja: Entering directory
> `/home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/=
out/linux_release_arm64'
> ninja: warning: premature end of file; recovering

  This looks like something went wrong in the configuring step, and the nin=
ja
file is corrupted... Perhaps a file size limit that was exceeded, or out of=
 disk
space?

  Regards,
  Arnout

> ninja: warning: -jN forced on command line; ignoring GNU make jobserver.
> [2485/8965] CXX obj/third_party/icu/source/i18n/icui18n_hidden_visibility=
.nfsubs.o
>
> FAILED: obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.=
o
> /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/b=
uildtools/linux-x64/clang/bin/clang++ -MD -MF obj/third_party/icu/source/i1=
8n/icui18n_hidden_visibility.nfsubs.o.d --target=3Daarch64-unknown-linux-gn=
u --sysroot /home/frank/buildroot-base/buildroot/output/host/aarch64-buildr=
oot-linux-gnu/sysroot -DU_I18N_IMPLEMENTATION -DUSE_OPENSSL=3D1 -D_FILE_OFF=
SET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_LIBCPP_DISABLE_A=
VAILABILITY=3D1 -D_LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS -D_LIBCPP_ENABLE_T=
HREAD_SAFETY_ANNOTATIONS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=
=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=3D1 -DUCONFIG_USE_ML_=
PHRASE_BREAKING=3D1 -DUCONFIG_USE_WINDOWS_LCID_MAPPING_API=3D0 -DU_CHARSET_=
IS_UTF8=3D1 -DU_USING_ICU_NAMESPACE=3D0 -DU_ENABLE_DYLOAD=3D0 -DUSE_CHROMIU=
M_ICU=3D1 -DU_ENABLE_TRACING=3D1 -DU_ENABLE_RESOURCE_TRACING=3D0 -DU_STATIC=
_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=3DICU_UTIL_DATA_FILE -I../.. -Igen -I.=
./../third_party/libcxx/include -I../../third_party/lib
 cxxabi/include -I../../flutter/build/secondary/third_party/libcxx/config -=
I../../third_party/icu/source/common -I../../third_party/icu/source/i18n -f=
no-strict-aliasing -fstack-protector --param=3Dssp-buffer-size=3D4 -fPIC -p=
ipe -pthread --target=3Daarch64-linux-gnu -DBORINGSSL_CLANG_SUPPORTS_DOT_AR=
CH -fcolor-diagnostics -fvisibility=3Dhidden --sysroot=3D/home/frank/buildr=
oot-base/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot -Wstring=
-conversion -Wnewline-eof -O2 -fno-ident -fdata-sections -ffunction-section=
s -g0 -Wno-deprecated-non-prototype -Wno-newline-eof -Wno-typedef-redefinit=
ion -Wendif-labels -Werror -Wno-missing-field-initializers -Wno-unused-para=
meter -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-impli=
cit-int-float-conversion -Wno-deprecated-copy -Wno-psabi -Wno-deprecated-li=
teral-operator -Wno-unqualified-std-cast-call -Wno-non-c-typedef-for-linkag=
e -Wno-range-loop-construct -Wno-unused-function -Wno-parentheses -Wno-unus=
ed-function -Wno-unused-variable
 -Wno-ambiguous-reversed-operator -Wno-deprecated-declarations -fvisibility=
=3Dhidden -fvisibility-inlines-hidden -std=3Dc++17 -nostdinc++ -nostdinc++ =
-fvisibility=3Dhidden -fno-exceptions -Wno-newline-eof -c ../../third_party=
/icu/source/i18n/nfsubs.cpp -o obj/third_party/icu/source/i18n/icui18n_hidd=
en_visibility.nfsubs.o
> clang++: error: clang frontend command failed with exit code 139 (use -v =
to see
> invocation)
> Fuchsia clang version 18.0.0 (https://llvm.googlesource.com/llvm-project
> 725656bdd885483c39f482a01ea25d67acf39c46)
> Target: aarch64-unknown-linux-gnu
> Thread model: posix
> InstalledDir:
> /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/b=
uildtools/linux-x64/clang/bin
> clang++: note: diagnostic msg:
> ********************
>
> I'm stuck on this since I format my computer, I download everything what =
I need,
> and every time that it comes to flutter-engine, I get this error that I n=
ever seen.
>
>
> Thank you in advance,
> Franco.

Thank you, Arnout, for your answer. I've already checked the disk space and=
 RAM usage, and both were fine. After reviewing the code in flutter-engine.=
mk, I realized that the number of jobs set for the Ninja build was too high=
 (-j 33). I reduced it to -j 12, and although it's slower, it compiles perf=
ectly now. I have an i9 13900k, so I shouldn't have problems handling multi=
ple jobs. I'm certain there's an issue elsewhere, but for now, it's working=
.

Regards,
Franco.
________________________________
De: buildroot <buildroot-bounces@buildroot.org> en nombre de franco ariel <=
fran.millocs@live.com.ar>
Enviado: jueves, 2 de mayo de 2024 12:45
Para: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Asunto: [Buildroot] Error building flutter-engine

Hi everyone!

I'm trying to compile flutter-engine from the latest version of buildroot b=
ut, I'm getting this error:

>>> flutter-engine 3.19.5 Building
cd /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5 =
&& PATH=3D/home/frank/buildroot-base/buildroot/output/host/share/depot_tool=
s:"/home/frank/buildroot-base/buildroot/output/host/bin:/home/frank/buildro=
ot-base/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin=
:/usr/bin:/sbin:/bin:/snap/bin" PUB_CACHE=3D/home/frank/buildroot-base/buil=
droot/dl/br-flutter-pub-cache HOME=3D/home/frank/buildroot-base/buildroot/o=
utput/host/share/flutter/sdk /home/frank/buildroot-base/buildroot/output/ho=
st/bin/ninja -j 33 -C /home/frank/buildroot-base/buildroot/output/build/flu=
tter-engine-3.19.5/out/linux_release_arm64
ninja: Entering directory `/home/frank/buildroot-base/buildroot/output/buil=
d/flutter-engine-3.19.5/out/linux_release_arm64'
ninja: warning: premature end of file; recovering
ninja: warning: -jN forced on command line; ignoring GNU make jobserver.
[2485/8965] CXX obj/third_party/icu/source/i18n/icui18n_hidden_visibility.n=
fsubs.o

FAILED: obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.o
/home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/bui=
ldtools/linux-x64/clang/bin/clang++ -MD -MF obj/third_party/icu/source/i18n=
/icui18n_hidden_visibility.nfsubs.o.d --target=3Daarch64-unknown-linux-gnu =
--sysroot /home/frank/buildroot-base/buildroot/output/host/aarch64-buildroo=
t-linux-gnu/sysroot -DU_I18N_IMPLEMENTATION -DUSE_OPENSSL=3D1 -D_FILE_OFFSE=
T_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_LIBCPP_DISABLE_AVA=
ILABILITY=3D1 -D_LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS -D_LIBCPP_ENABLE_THR=
EAD_SAFETY_ANNOTATIONS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=
=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=3D1 -DUCONFIG_USE_ML_=
PHRASE_BREAKING=3D1 -DUCONFIG_USE_WINDOWS_LCID_MAPPING_API=3D0 -DU_CHARSET_=
IS_UTF8=3D1 -DU_USING_ICU_NAMESPACE=3D0 -DU_ENABLE_DYLOAD=3D0 -DUSE_CHROMIU=
M_ICU=3D1 -DU_ENABLE_TRACING=3D1 -DU_ENABLE_RESOURCE_TRACING=3D0 -DU_STATIC=
_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=3DICU_UTIL_DATA_FILE -I../.. -Igen -I.=
./../third_party/libcxx/include -I../../third_party/libcxxabi/include -I../=
../flutter/build/secondary/third_party/libcxx/config -I../../third_party/ic=
u/source/common -I../../third_party/icu/source/i18n -fno-strict-aliasing -f=
stack-protector --param=3Dssp-buffer-size=3D4 -fPIC -pipe -pthread --target=
=3Daarch64-linux-gnu -DBORINGSSL_CLANG_SUPPORTS_DOT_ARCH -fcolor-diagnostic=
s -fvisibility=3Dhidden --sysroot=3D/home/frank/buildroot-base/buildroot/ou=
tput/host/aarch64-buildroot-linux-gnu/sysroot -Wstring-conversion -Wnewline=
-eof -O2 -fno-ident -fdata-sections -ffunction-sections -g0 -Wno-deprecated=
-non-prototype -Wno-newline-eof -Wno-typedef-redefinition -Wendif-labels -W=
error -Wno-missing-field-initializers -Wno-unused-parameter -Wno-unused-but=
-set-parameter -Wno-unused-but-set-variable -Wno-implicit-int-float-convers=
ion -Wno-deprecated-copy -Wno-psabi -Wno-deprecated-literal-operator -Wno-u=
nqualified-std-cast-call -Wno-non-c-typedef-for-linkage -Wno-range-loop-con=
struct -Wno-unused-function -Wno-parentheses -Wno-unused-function -Wno-unus=
ed-variable -Wno-ambiguous-reversed-operator -Wno-deprecated-declarations -=
fvisibility=3Dhidden -fvisibility-inlines-hidden -std=3Dc++17 -nostdinc++ -=
nostdinc++ -fvisibility=3Dhidden -fno-exceptions -Wno-newline-eof -c ../../=
third_party/icu/source/i18n/nfsubs.cpp -o obj/third_party/icu/source/i18n/i=
cui18n_hidden_visibility.nfsubs.o
clang++: error: clang frontend command failed with exit code 139 (use -v to=
 see invocation)
Fuchsia clang version 18.0.0 (https://llvm.googlesource.com/llvm-project 72=
5656bdd885483c39f482a01ea25d67acf39c46)
Target: aarch64-unknown-linux-gnu
Thread model: posix
InstalledDir: /home/frank/buildroot-base/buildroot/output/build/flutter-eng=
ine-3.19.5/buildtools/linux-x64/clang/bin
clang++: note: diagnostic msg:
********************

I'm stuck on this since I format my computer, I download everything what I =
need, and every time that it comes to flutter-engine, I get this error that=
 I never seen.


Thank you in advance,
Franco.








--_000_PH0PR19MB540974F4DA3A6E8913D6EC7DD0182PH0PR19MB5409namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<pre style=3D"background-color: rgb(0, 0, 0);"><div style=3D"text-align: le=
ft; text-indent: 0px; white-space: pre-wrap; font-size: 9.75pt; color: rgb(=
0, 153, 255);"><span style=3D"background-color: rgb(0, 0, 0);"> </span></di=
v><div style=3D"text-align: left; text-indent: 0px; white-space: pre-wrap; =
font-size: 13px; color: rgb(0, 153, 255);"><span style=3D"background-color:=
 rgb(0, 0, 0);"><br></span></div><div style=3D"text-align: left; text-inden=
t: 0px; white-space: pre-wrap; font-size: 13px; color: rgb(0, 153, 255);"><=
span style=3D"background-color: rgb(0, 0, 0);"><br></span></div><div style=
=3D"text-align: left; text-indent: 0px; white-space: pre-wrap; font-size: 1=
3px;"><span style=3D"color: rgb(0, 153, 255); background-color: rgb(0, 0, 0=
);">&gt; Hi everyone!=0A=
&gt; =0A=
&gt; I'm trying to compile flutter-engine from the latest version of buildr=
oot but, =0A=
&gt; I'm getting this error:=0A=
&gt; =0A=
&gt; &nbsp;&gt;&gt;&gt; flutter-engine 3.19.5 Building=0A=
&gt; cd /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.=
19.5 &amp;&amp; =0A=
&gt; PATH=3D/home/frank/buildroot-base/buildroot/output/host/share/depot_to=
ols:&quot;/home/frank/buildroot-base/buildroot/output/host/bin:/home/frank/=
buildroot-base/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/u=
sr/sbin:/usr/bin:/sbin:/bin:/snap/bin&quot; PUB_CACHE=3D/home/frank/buildro=
ot-base/buildroot/dl/br-flutter-pub-cache HOME=3D/home/frank/buildroot-base=
/buildroot/output/host/share/flutter/sdk /home/frank/buildroot-base/buildro=
ot/output/host/bin/ninja -j 33 -C /home/frank/buildroot-base/buildroot/outp=
ut/build/flutter-engine-3.19.5/out/linux_release_arm64=0A=
&gt; ninja: Entering directory =0A=
&gt; `/home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19=
.5/out/linux_release_arm64'=0A=
&gt; ninja: warning: premature end of file; recovering=0A=
</span><span style=3D"color: rgb(204, 204, 204);">=0A=
 &nbsp;This looks like something went wrong in the configuring step, and th=
e ninja =0A=
file is corrupted... Perhaps a file size limit that was exceeded, or out of=
 disk =0A=
space?=0A=
=0A=
 &nbsp;Regards,=0A=
 &nbsp;Arnout=0A=
=0A=
</span><span style=3D"color: rgb(0, 153, 255); background-color: rgb(0, 0, =
0);">&gt; ninja: warning: -jN forced on command line; ignoring GNU make job=
server.=0A=
&gt; [2485/8965] CXX obj/third_party/icu/source/i18n/icui18n_hidden_visibil=
ity.nfsubs.o=0A=
&gt; =0A=
&gt; FAILED: obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsu=
bs.o=0A=
&gt; /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.=
5/buildtools/linux-x64/clang/bin/clang++ -MD -MF obj/third_party/icu/source=
/i18n/icui18n_hidden_visibility.nfsubs.o.d --target=3Daarch64-unknown-linux=
-gnu --sysroot /home/frank/buildroot-base/buildroot/output/host/aarch64-bui=
ldroot-linux-gnu/sysroot -DU_I18N_IMPLEMENTATION -DUSE_OPENSSL=3D1 -D_FILE_=
OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_LIBCPP_DISABL=
E_AVAILABILITY=3D1 -D_LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS -D_LIBCPP_ENABL=
E_THREAD_SAFETY_ANNOTATIONS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENAB=
LED=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=3D1 -DUCONFIG_USE_=
ML_PHRASE_BREAKING=3D1 -DUCONFIG_USE_WINDOWS_LCID_MAPPING_API=3D0 -DU_CHARS=
ET_IS_UTF8=3D1 -DU_USING_ICU_NAMESPACE=3D0 -DU_ENABLE_DYLOAD=3D0 -DUSE_CHRO=
MIUM_ICU=3D1 -DU_ENABLE_TRACING=3D1 -DU_ENABLE_RESOURCE_TRACING=3D0 -DU_STA=
TIC_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=3DICU_UTIL_DATA_FILE -I../.. -Igen =
-I../../third_party/libcxx/include -I../../third_party/lib=0A=
</span><span style=3D"color: rgb(204, 204, 204);"> cxxabi/include -I../../f=
lutter/build/secondary/third_party/libcxx/config -I../../third_party/icu/so=
urce/common -I../../third_party/icu/source/i18n -fno-strict-aliasing -fstac=
k-protector --param=3Dssp-buffer-size=3D4 -fPIC -pipe -pthread --target=3Da=
arch64-linux-gnu -DBORINGSSL_CLANG_SUPPORTS_DOT_ARCH -fcolor-diagnostics -f=
visibility=3Dhidden --sysroot=3D/home/frank/buildroot-base/buildroot/output=
/host/aarch64-buildroot-linux-gnu/sysroot -Wstring-conversion -Wnewline-eof=
 -O2 -fno-ident -fdata-sections -ffunction-sections -g0 -Wno-deprecated-non=
-prototype -Wno-newline-eof -Wno-typedef-redefinition -Wendif-labels -Werro=
r -Wno-missing-field-initializers -Wno-unused-parameter -Wno-unused-but-set=
-parameter -Wno-unused-but-set-variable -Wno-implicit-int-float-conversion =
-Wno-deprecated-copy -Wno-psabi -Wno-deprecated-literal-operator -Wno-unqua=
lified-std-cast-call -Wno-non-c-typedef-for-linkage -Wno-range-loop-constru=
ct -Wno-unused-function -Wno-parentheses -Wno-unused-function -Wno-unused-v=
ariable =0A=
 -Wno-ambiguous-reversed-operator -Wno-deprecated-declarations -fvisibility=
=3Dhidden -fvisibility-inlines-hidden -std=3Dc++17 -nostdinc++ -nostdinc++ =
-fvisibility=3Dhidden -fno-exceptions -Wno-newline-eof -c ../../third_party=
/icu/source/i18n/nfsubs.cpp -o obj/third_party/icu/source/i18n/icui18n_hidd=
en_visibility.nfsubs.o=0A=
</span><span style=3D"color: rgb(0, 153, 255); background-color: rgb(0, 0, =
0);">&gt; clang++: error: clang frontend command failed with exit code 139 =
(use -v to see =0A=
&gt; invocation)=0A=
&gt; Fuchsia clang version 18.0.0 (</span><span style=3D"color: rgb(102, 15=
3, 255); background-color: rgb(0, 0, 0);"><a href=3D"https://llvm.googlesou=
rce.com/llvm-project" id=3D"OWAc22c07bb-e7d5-d668-5310-e57a9570a26f" class=
=3D"OWAAutoLink" style=3D"color: rgb(102, 153, 255); text-decoration: none;=
 background-color: rgb(0, 0, 0);">https://llvm.googlesource.com/llvm-projec=
t</a></span><span style=3D"color: rgb(0, 153, 255); background-color: rgb(0=
, 0, 0);"> =0A=
&gt; 725656bdd885483c39f482a01ea25d67acf39c46)=0A=
&gt; Target: aarch64-unknown-linux-gnu=0A=
&gt; Thread model: posix=0A=
&gt; InstalledDir: =0A=
&gt; /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.=
5/buildtools/linux-x64/clang/bin=0A=
&gt; clang++: note: diagnostic msg:=0A=
&gt; ********************=0A=
&gt; =0A=
&gt; I'm stuck on this since I format my computer, I download everything wh=
at I need, =0A=
&gt; and every time that it comes to flutter-engine, I get this error that =
I never seen.=0A=
&gt; =0A=
&gt; =0A=
&gt; Thank you in advance,=0A=
&gt; Franco.</span></div></pre>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"color: rgb(0, 0, 0);"><span style=3D=
"font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &quot;Se=
goe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif,=
 &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Se=
goe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quo=
t;; font-size: 16px; background-color: rgb(255, 255, 255);">Thank
 you, Arnout, for your answer. I've already checked the disk space and RAM =
usage, and both were fine. After reviewing the code in
</span><span style=3D"font-family: &quot;S&ouml;hne Mono&quot;, Monaco, &qu=
ot;Andale Mono&quot;, &quot;Ubuntu Mono&quot;, monospace; font-size: 14px; =
background-color: rgb(255, 255, 255); font-weight: 600;"><code style=3D"fon=
t-family: &quot;S&ouml;hne Mono&quot;, Monaco, &quot;Andale Mono&quot;, &qu=
ot;Ubuntu Mono&quot;, monospace;">flutter-engine.mk</code></span><span styl=
e=3D"font-family: S&ouml;hne, ui-sans-serif, system-ui, -apple-system, &quo=
t;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-se=
rif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quo=
t;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji=
&quot;; font-size: 16px; background-color: rgb(255, 255, 255);">,
 I realized that the number of jobs set for the Ninja build was too high (-=
j 33). I reduced it to -j 12, and although it's slower, it compiles perfect=
ly now. I have an i9 13900k, so I shouldn't have problems handling multiple=
 jobs. I'm certain there's an issue
 elsewhere, but for now, it's working.</span></div>
<div class=3D"elementToProof" style=3D"font-family: S&ouml;hne, ui-sans-ser=
if, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantare=
ll, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &=
quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Sy=
mbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; color: rgb(0, 0,=
 0);">
<span style=3D"background-color: rgb(255, 255, 255);"><br>
</span></div>
<div class=3D"elementToProof" style=3D"font-family: S&ouml;hne, ui-sans-ser=
if, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantare=
ll, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &=
quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Sy=
mbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; color: rgb(0, 0,=
 0);">
<span style=3D"background-color: rgb(255, 255, 255);">Regards,</span></div>
<div class=3D"elementToProof" style=3D"font-family: S&ouml;hne, ui-sans-ser=
if, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantare=
ll, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &=
quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Sy=
mbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; color: rgb(0, 0,=
 0);">
<span style=3D"background-color: rgb(255, 255, 255);">Franco.</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>De:</b> buildroot &lt;buildroot=
-bounces@buildroot.org&gt; en nombre de franco ariel &lt;fran.millocs@live.=
com.ar&gt;<br>
<b>Enviado:</b> jueves, 2 de mayo de 2024 12:45<br>
<b>Para:</b> Thomas Petazzoni via buildroot &lt;buildroot@buildroot.org&gt;=
<br>
<b>Asunto:</b> [Buildroot] Error building flutter-engine</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
Hi everyone!</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
I'm trying to compile flutter-engine from the latest version of buildroot b=
ut, I'm getting this error:&nbsp;</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
&gt;&gt;&gt; flutter-engine 3.19.5 Building</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
cd /home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5 =
&amp;&amp; PATH=3D/home/frank/buildroot-base/buildroot/output/host/share/de=
pot_tools:&quot;/home/frank/buildroot-base/buildroot/output/host/bin:/home/=
frank/buildroot-base/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/=
bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin&quot;
 PUB_CACHE=3D/home/frank/buildroot-base/buildroot/dl/br-flutter-pub-cache H=
OME=3D/home/frank/buildroot-base/buildroot/output/host/share/flutter/sdk /h=
ome/frank/buildroot-base/buildroot/output/host/bin/ninja -j 33 -C /home/fra=
nk/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/out/linux_re=
lease_arm64</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
ninja: Entering directory `/home/frank/buildroot-base/buildroot/output/buil=
d/flutter-engine-3.19.5/out/linux_release_arm64'</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
ninja: warning: premature end of file; recovering</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
ninja: warning: -jN forced on command line; ignoring GNU make jobserver.</d=
iv>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
[2485/8965] CXX obj/third_party/icu/source/i18n/icui18n_hidden_visibility.n=
fsubs.o</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
FAILED: obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.o<=
/div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
/home/frank/buildroot-base/buildroot/output/build/flutter-engine-3.19.5/bui=
ldtools/linux-x64/clang/bin/clang++ -MD -MF obj/third_party/icu/source/i18n=
/icui18n_hidden_visibility.nfsubs.o.d --target=3Daarch64-unknown-linux-gnu =
--sysroot /home/frank/buildroot-base/buildroot/output/host/aarch64-buildroo=
t-linux-gnu/sysroot
 -DU_I18N_IMPLEMENTATION -DUSE_OPENSSL=3D1 -D_FILE_OFFSET_BITS=3D64 -D_LARG=
EFILE_SOURCE -D_LARGEFILE64_SOURCE -D_LIBCPP_DISABLE_AVAILABILITY=3D1 -D_LI=
BCPP_DISABLE_VISIBILITY_ANNOTATIONS -D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATI=
ONS -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0
 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=3D1 -DUCONFIG_USE_ML_PHRA=
SE_BREAKING=3D1 -DUCONFIG_USE_WINDOWS_LCID_MAPPING_API=3D0 -DU_CHARSET_IS_U=
TF8=3D1 -DU_USING_ICU_NAMESPACE=3D0 -DU_ENABLE_DYLOAD=3D0 -DUSE_CHROMIUM_IC=
U=3D1 -DU_ENABLE_TRACING=3D1 -DU_ENABLE_RESOURCE_TRACING=3D0
 -DU_STATIC_IMPLEMENTATION -DICU_UTIL_DATA_IMPL=3DICU_UTIL_DATA_FILE -I../.=
. -Igen -I../../third_party/libcxx/include -I../../third_party/libcxxabi/in=
clude -I../../flutter/build/secondary/third_party/libcxx/config -I../../thi=
rd_party/icu/source/common -I../../third_party/icu/source/i18n
 -fno-strict-aliasing -fstack-protector --param=3Dssp-buffer-size=3D4 -fPIC=
 -pipe -pthread --target=3Daarch64-linux-gnu -DBORINGSSL_CLANG_SUPPORTS_DOT=
_ARCH -fcolor-diagnostics -fvisibility=3Dhidden --sysroot=3D/home/frank/bui=
ldroot-base/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot
 -Wstring-conversion -Wnewline-eof -O2 -fno-ident -fdata-sections -ffunctio=
n-sections -g0 -Wno-deprecated-non-prototype -Wno-newline-eof -Wno-typedef-=
redefinition -Wendif-labels -Werror -Wno-missing-field-initializers -Wno-un=
used-parameter -Wno-unused-but-set-parameter
 -Wno-unused-but-set-variable -Wno-implicit-int-float-conversion -Wno-depre=
cated-copy -Wno-psabi -Wno-deprecated-literal-operator -Wno-unqualified-std=
-cast-call -Wno-non-c-typedef-for-linkage -Wno-range-loop-construct -Wno-un=
used-function -Wno-parentheses -Wno-unused-function
 -Wno-unused-variable -Wno-ambiguous-reversed-operator -Wno-deprecated-decl=
arations -fvisibility=3Dhidden -fvisibility-inlines-hidden -std=3Dc++17 -no=
stdinc++ -nostdinc++ -fvisibility=3Dhidden -fno-exceptions -Wno-newline-eof=
 -c ../../third_party/icu/source/i18n/nfsubs.cpp
 -o obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.o</div=
>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
clang++: error: clang frontend command failed with exit code 139 (use -v to=
 see invocation)</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
Fuchsia clang version 18.0.0 (https://llvm.googlesource.com/llvm-project 72=
5656bdd885483c39f482a01ea25d67acf39c46)</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
Target: aarch64-unknown-linux-gnu</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
Thread model: posix</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
InstalledDir: /home/frank/buildroot-base/buildroot/output/build/flutter-eng=
ine-3.19.5/buildtools/linux-x64/clang/bin</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
clang++: note: diagnostic msg:</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
********************</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
I'm stuck on this since I format my computer, I download everything what I =
need, and every time that it comes to flutter-engine, I get this error that=
 I never seen.</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
Thank you in advance,</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
Franco.</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-family:Arial,Helvetica,sans-serif; font-size=
:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt"><span style=3D"font-family:Arial,=
Helvetica,sans-serif; color:rgb(0,0,0)"><br>
</span><span style=3D"font-family:Calibri,Helvetica,sans-serif; color:rgb(0=
,0,0)"><br>
</span></div>
</div>
</body>
</html>

--_000_PH0PR19MB540974F4DA3A6E8913D6EC7DD0182PH0PR19MB5409namp_--

--===============8451581375787814618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8451581375787814618==--
