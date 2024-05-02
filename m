Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF7EC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 19:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC4D341BA5;
	Thu,  2 May 2024 19:45:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJSqVRP9IFAO; Thu,  2 May 2024 19:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FA21405AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FA21405AE;
	Thu,  2 May 2024 19:45:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1F161BF429
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 19:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD50F40955
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 19:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_otst2c0QPx for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 19:45:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2804::801;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=fran.millocs@live.com.ar; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FC0D40948
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FC0D40948
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2804::801])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FC0D40948
 for <buildroot@buildroot.org>; Thu,  2 May 2024 19:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDOCElgjDIF4RbEucXeC6F2Ntn0Z9lJNEyw+fUEr43py+EhlPk6iGaRy37Z+tsZMAMuEgqSHO6zINuwYXOjGGRMSAoXK3vA7Dl+xBNXjAkz1mIcjpDW0rFzZx9AawJ7BsEqDPe882e7pPKpRyIwDkYG40okTG82rEWHhusLB9Lj6APUOHYXwW2W9BofD5FE0wZayKJTa+jBm0CIi8wozxQA9nuylkZxNGF/0KW/Ax86Yao2w4NrW2SU/iF1/pRHE0su/Q1jaabw+yuZg8FbhSt97wT5x+grwGULee8AelQlfw2Il5Qgi0smReQZvQun6weczQGPc+4mGdbcoMmYLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OtlVmY8gpnge7gtzRf5fr+hY7Y1ZHhCAKdLcq2yqng=;
 b=TmrB1Mb0LJzJm35RRZBriHdqkGiJ7OkzZDR+pob3qOkEvM11cIj91kQoCiWuCmPA9J7WC6yhCUhWMzXsAdsWLCQRRehMxyoIib6RjUkM0p3F0zm/Qyfwp+OROPmjzj7tWBMYi0USCvbazCWS5LiAsM0Zn0ftgcj8HDiur0mQxTyjycS5o9obaZ19A4jrLfvMZctRWfdHPOaxwqtaRu487y1v5vwB0oI2c4VsZKwzlz/4gYx6vojB/nnY4bwHiFyB7w7gNjowHriFxX46xebKyghLXMA3FhlJUBfaWUzwG0WdsD58Xfxaitlz9nYvMrNNocV94c4aDYJk6/mi45UPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH0PR19MB5409.namprd19.prod.outlook.com (2603:10b6:510:f9::21)
 by BL1PR19MB6012.namprd19.prod.outlook.com (2603:10b6:208:39f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 19:45:20 +0000
Received: from PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::9dd3:943c:23b2:5029]) by PH0PR19MB5409.namprd19.prod.outlook.com
 ([fe80::9dd3:943c:23b2:5029%6]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 19:45:20 +0000
From: franco ariel <fran.millocs@live.com.ar>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Thread-Topic: Error building flutter-engine 
Thread-Index: AQHanMkOII7OUdRzzku27o3ql7kTvA==
Date: Thu, 2 May 2024 19:45:19 +0000
Message-ID: <PH0PR19MB5409054A4A7DF4561A75F2E9D0182@PH0PR19MB5409.namprd19.prod.outlook.com>
Accept-Language: es-AR, en-US
Content-Language: es-AR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [WxY07omg8HzLrIlMzXT1Gpu87k9gOBheZBlTNHJCEAmBlA9pLF4r79qY9Th1Qekp]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR19MB5409:EE_|BL1PR19MB6012:EE_
x-ms-office365-filtering-correlation-id: 17672fb0-5a4c-431a-9cb8-08dc6ae06631
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199019|102099023|440099019|3412199016; 
x-microsoft-antispam-message-info: OYzF14vubewfD3oa3e5afwtdNHmxDZfsOhqQwBSXEtkUYBQeQbCV3B16rpL1Ixc9tYokLWe7BRfu0TcyNZD6FyYXD23woDKphQgrsXmb9/630t+2XFQDMmr8D+5JwHOJneHyY6W5tpjgnlRFB8LnT1DC3YV2Ip6qv9QLFce7stVjdKWJRYvqtC1bzHl/V8G+ttscVsaokDKD92hA3JZuzDb2sxj0hINFwRyfOEbvBKt4jzTyZnHmDTxsuHuWsbEgHao1E7vw+91RlPJS82CpSjd/VOiGUxT9BE9gvtB6IE7bv+6+dT3fod3WRrPzFe/sxy/lPPeaWk1+/fcYqH0Ilp66T5Q+4Qh+Bz5TYELCa0IgA+/SkY84/ehpQJejxRyl7LQM7lOKO83qoi2OZfPNta23BoFegW/PJth/JVMrQOtpLy93NR6ldmC0ce/vQVAn+nJASxZvDtm2UEQJO0mY48MI7Nur3yGrVqVTNLDl7Bhgc43OBbOPJ/czcjYYBUqZl1RowcRfnV7VatkwUx0z2qPkfYeP/xD/422ZYgkb/DLe11VQMW+M4o24KoM3V6vIP6tAum36mr8nyNkBwpIAfLNKn5RJDHzlBs/Eo0PYMww=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?N9QpdcONJcGvj2AsjahjRWsKEI0PVgUhoWjhbqeGM3ZivFsL2MOFPOrB5Z?=
 =?iso-8859-1?Q?Go+VD6iafq2E91Pg4RXVYNfahcuwpO6VcRMUHzJH18uSLloyXKXODGJvLp?=
 =?iso-8859-1?Q?96OG1dbXEQlOuB6ODXtI2erhVrvMIR8zqb5piShorWwwwzZCr12XghyNRD?=
 =?iso-8859-1?Q?oCvRfCsMJQ9LISNb+6tBcJXruIc83B7EYZUlSwvDghix4hxKOQqUYl1usu?=
 =?iso-8859-1?Q?xyGKSpzu+/ELfFIrOxnOSFXAjtYqdiR2rSLHHpCbC2me+JxnAmd67ayMKh?=
 =?iso-8859-1?Q?6JsEYXDpNYbDXwlRVNC/sub1SMdBv1Gye0ZQSETDC6u1NowqcTKSFWu1mz?=
 =?iso-8859-1?Q?scdKeZjejeOw3UN6fK/j7c5Uh6C7WuDf/yEzX85cFPpzp+aaK+2FDvWnwv?=
 =?iso-8859-1?Q?19IfBljb23yrCjXQvhtK/lB4udrA+BhR4p0EQfL4tAC/9Azluw3E+F2g7v?=
 =?iso-8859-1?Q?xAwLfBl+0MWV6VbjUN3cR4dd3iuj+H/wmXh5kSLdYoxGPpZNcjK+O47Scf?=
 =?iso-8859-1?Q?lV1e3Ln0tQQZ0jSyqhDm3OPdcwy725aEMDvuj0d1ZjvzB4ivohWXalVVRm?=
 =?iso-8859-1?Q?Wgj0W5nKFzX1c6inohWho948CCk3A+w/h4jlTvcuerZaNPX+h3dcX1zpdd?=
 =?iso-8859-1?Q?Y+/EUqx7BBeKpQ6WX4MrrRF724xMEJePsxSqimuXyzlvo4YnVYhBbLolFt?=
 =?iso-8859-1?Q?4fMA8fkksTKqSbWHsCGz7BoMbPBA0z4wjzJ2/pKnBDzdMN2vLlRH1C4MGI?=
 =?iso-8859-1?Q?X60aE36z0Jz5zMcuzPDLJbIcRchpHGXRQqoyFLlHM48Hhe7EKS3Ro23L/B?=
 =?iso-8859-1?Q?M47Cv8qu0otHNw7jZjjNLwCYNfK7qK/t8FpK81+8TT6nh/vhDvM6up3fbE?=
 =?iso-8859-1?Q?m9Bkg9BKJR6e22lLhOoLUK5SiZo3nmyAd+C6An0qqYuRgx9Oa/vsWWutIH?=
 =?iso-8859-1?Q?zc43/TDjYuK8VU2edKDEumfa1XY2zqfygMKPk218BflP+RPdfCIctrTgTn?=
 =?iso-8859-1?Q?FHAFzNV7BR43k9Hyp7K9l+Nil3blWa4vOuOlssc10plt/y/x9e/BTNxL8T?=
 =?iso-8859-1?Q?G6uDjUFbsFQsZZdIYZAj4Ez9gbozksN1VHETPT/3/g1YUfmLWtRJCyimle?=
 =?iso-8859-1?Q?Ua8rBGGn2j9gcGdoPc8H28O6iCD7YW66zZaF3029EmUrJ+Iow0kVULMJ7m?=
 =?iso-8859-1?Q?e9blwOOmtZuypkYBn5805ZCZjhw1e0xOOLwagCnYbuZslEsE6uFO8jO+QM?=
 =?iso-8859-1?Q?gDloV7p0uwFc5qxkCkkxzxDiQN8s4+8mDDVNx1Vzfnp4fnBrCBRgzAOQPK?=
 =?iso-8859-1?Q?9ho7r+2Slfuini1hyetPckrGw8GOSihgTmX+SzbpZE4zFfU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e7757.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR19MB5409.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 17672fb0-5a4c-431a-9cb8-08dc6ae06631
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 19:45:19.8923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB6012
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LIVE.COM.AR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OtlVmY8gpnge7gtzRf5fr+hY7Y1ZHhCAKdLcq2yqng=;
 b=JMHizWsQkvt29vcgseGCiIc3JsCbzb8xf6/i+gtuZj5xqzVKOuOK97i35eMW+WPuq7n6G82kGYrBb/2YLnBeSbgINR3YnZprn+yAYZeCopEP/nLE5uk7Up0vR+kSoROgsMpx/hG90iuzW/ImkZOlg/PYV/o11arSeihQKVt1j/wFBHw2M2AYQ/z7epa0gGn7lUsWesURVD9lQmNc7XCra0kTvI+uCV7eB+q/49DTYb6r4Zzz4dQiElIMZb2H0iXUwdj0BISSM0NPe6ys7kfU360iJKkKwO5WSRPlJtJCY7uMdgSyH5XWFlHu0AgiqQ4qlPfoY0nbQQSu7bfmV6rgSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com.ar
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=LIVE.COM.AR header.i=@LIVE.COM.AR header.a=rsa-sha256
 header.s=selector1 header.b=JMHizWsQ
Subject: [Buildroot] Error building flutter-engine
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
Content-Type: multipart/mixed; boundary="===============5594565377397057498=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5594565377397057498==
Content-Language: es-AR
Content-Type: multipart/alternative;
	boundary="_000_PH0PR19MB5409054A4A7DF4561A75F2E9D0182PH0PR19MB5409namp_"

--_000_PH0PR19MB5409054A4A7DF4561A75F2E9D0182PH0PR19MB5409namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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








--_000_PH0PR19MB5409054A4A7DF4561A75F2E9D0182PH0PR19MB5409namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Hi everyone!</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
I'm trying to compile flutter-engine from the latest version of buildroot b=
ut, I'm getting this error:&nbsp;</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;&gt; flutter-engine 3.19.5 Building</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
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
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
ninja: Entering directory `/home/frank/buildroot-base/buildroot/output/buil=
d/flutter-engine-3.19.5/out/linux_release_arm64'</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
ninja: warning: premature end of file; recovering</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
ninja: warning: -jN forced on command line; ignoring GNU make jobserver.</d=
iv>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
[2485/8965] CXX obj/third_party/icu/source/i18n/icui18n_hidden_visibility.n=
fsubs.o</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
FAILED: obj/third_party/icu/source/i18n/icui18n_hidden_visibility.nfsubs.o<=
/div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
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
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
clang++: error: clang frontend command failed with exit code 139 (use -v to=
 see invocation)</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Fuchsia clang version 18.0.0 (https://llvm.googlesource.com/llvm-project 72=
5656bdd885483c39f482a01ea25d67acf39c46)</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Target: aarch64-unknown-linux-gnu</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Thread model: posix</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
InstalledDir: /home/frank/buildroot-base/buildroot/output/build/flutter-eng=
ine-3.19.5/buildtools/linux-x64/clang/bin</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
clang++: note: diagnostic msg:</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
********************</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
I'm stuck on this since I format my computer, I download everything what I =
need, and every time that it comes to flutter-engine, I get this error that=
 I never seen.</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Thank you in advance,</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
Franco.</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-family: Arial, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt;"><span style=3D"font-family: Ar=
ial, Helvetica, sans-serif; color: rgb(0, 0, 0);"><br>
</span><span style=3D"font-family: Calibri, Helvetica, sans-serif; color: r=
gb(0, 0, 0);"><br>
</span></div>
</body>
</html>

--_000_PH0PR19MB5409054A4A7DF4561A75F2E9D0182PH0PR19MB5409namp_--

--===============5594565377397057498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5594565377397057498==--
