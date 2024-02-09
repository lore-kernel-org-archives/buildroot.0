Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF70C48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 15:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0557342684;
	Fri,  9 Feb 2024 15:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAmqsQNvn88d; Fri,  9 Feb 2024 15:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1BD3401B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1BD3401B2;
	Fri,  9 Feb 2024 15:29:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A587D1BF3BC
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 15:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91E58401B2
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 15:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0B528zipxg1 for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 15:29:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2606::600;
 helo=eur02-am0-obe.outbound.protection.outlook.com;
 envelope-from=roy.kollen.svendsen@akersolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11B3C400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11B3C400BA
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2606::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11B3C400BA
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 15:29:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6HkYoT1GoA1ma4ZAPSNva/AXS8IIxjdt7HuVycY+gi885iHFazakjlIQCtqtsooZ9YDxH6aqXcq9m1AGodIqB5FG+fTV67tiPbhcilpSwj5Ej8XjJOPIYQBUHEQh+og6eLQ01anP7bQsa3VKjvhfvBfB/pcg4672fl9ztOOCNCXz90A8WOU8SCWWS+uMUNLUhu+Ki7nq92hp3UJS7ksrzctAsRat2DVBykzSbQjQEX9BFww5FOl+CB0iNnl0pP6hTtlMmF72OqzW8OT7p5qt6VhXPDGVXP9yyxlo16/6EvTC3RHeOaRrlJBcgkAo6HrjRTFF4vwJp19i/HTOepQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NvTkLdfx+0p0yypyBIwWjGyqMUByDYPMhDj5+3wgu8=;
 b=dy4XQGps1/CiLycr4A5s6qHCVrtDbkOOqPhmYTRYYjrmrVuVMnpvAeb0QefVOcQU5GLf51rBhMpv/Umvpv4vfNMsneDIFVng8jhADeKxVlLws346gY/zS7IXF996pzWXEp4zrvfxzX40TAtsRWUWZX+EHQ12TLVIpAyqe3vKlqRZhvkO5VXnPe1nlm0zdj0T1Psr4XBYrLU5FqBc47uU9cymEI0R2CBZb44VdGarJh5GF91umcEF0IQuiol/62r3ZEBYhYElUwsZ/NNflNRCjJjwmoFXwMDf4gOzZV48kNt0VwTtepV9/XE8PkI9SmQ37DEMTJZjzZxs6tyukQp6tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=akersolutions.com; dmarc=pass action=none
 header.from=akersolutions.com; dkim=pass header.d=akersolutions.com; arc=none
Received: from PAXPR06MB8505.eurprd06.prod.outlook.com (2603:10a6:102:2b9::19)
 by PR3PR06MB7084.eurprd06.prod.outlook.com (2603:10a6:102:91::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Fri, 9 Feb
 2024 15:29:44 +0000
Received: from PAXPR06MB8505.eurprd06.prod.outlook.com
 ([fe80::526b:5fd8:6925:d387]) by PAXPR06MB8505.eurprd06.prod.outlook.com
 ([fe80::526b:5fd8:6925:d387%4]) with mapi id 15.20.7270.025; Fri, 9 Feb 2024
 15:29:44 +0000
From: "Svendsen, Roy Kollen" <Roy.Kollen.Svendsen@akersolutions.com>
To: Peter Seiderer <ps.report@gmx.net>, Roy Kollen Svendsen
 <roykollensvendsen@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/qt53d: bump to latest kde
 submodule version
Thread-Index: AQHaW2Oi2dOt8nsx8EaMgswdG8p9T7ECG/EAgAAAvpU=
Date: Fri, 9 Feb 2024 15:29:44 +0000
Message-ID: <PAXPR06MB85053C9FA18B8A4A8DB40608BB4B2@PAXPR06MB8505.eurprd06.prod.outlook.com>
References: <20240209104705.1825396-1-sebastian.weyer@smile.fr>
 <20240209142326.2570138-2-roy.kollen.svendsen@akersolutions.com>
 <20240209160504.1d6f7ae5@gmx.net>
In-Reply-To: <20240209160504.1d6f7ae5@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB8505:EE_|PR3PR06MB7084:EE_
x-ms-office365-filtering-correlation-id: b34585da-ed60-40ac-4bee-08dc2983f146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZtcpCYgYp5I9quIoCh4NApBUzqz1xpwAQQ+vsiR6YoJ4w8SuoKauojLJuUrKI9Vbi4rgCfyeTiRTh7k6VaJUgepCMYGvnDo3m4EMdK9/ORRz+B9E2MAEptA6NFFtbJXS5EPX+tlAAoUbdKug2dxlG9HepdE/Et9X+0UqDe7kHt0H3gsFN/HCacVsKVA0u3ju9drYlKys7ZxsrfFOFRTvdlcTGq5Lfm9nCpzJZRnQbvu018TOAIPiKBLveYFLgv7tY2haZk8kVJfVvAeF6GG0atMAtlZfNkSMfacy57+GMHxi/+Hrq8S2mge7rnlsfHfkf8l+bV/2Co+G7p2sbn0oa2/olajEKjvRV7VHwQLkBf/pUeIyaP5sGC4y9GmmMtEqIQs0/oT4yWPiZ/uZHw6oU1DONeNaoFvWDossWUdXbejXX6gFx4b0Yhml2wkZi28mZvJKgZRmRHBN4IWV4cw92H0gLQZUEfbikm1uZ9vIUiD0fNPv8mgmb8o4qojYxpFyd8qiQR9EUGq1AWbR9tsYURfu0y6UguZo00qofF62S9Wo2yVVcGnmwnoAzzpo117e6VL4L60ITfJutG8z3w8L3ee92YYiuYuxFXHWcF3RRYw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR06MB8505.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39860400002)(230273577357003)(230473577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(478600001)(1015004)(966005)(66476007)(54906003)(66446008)(66556008)(64756008)(76116006)(66946007)(91956017)(110136005)(316002)(38070700009)(33656002)(122000001)(83380400001)(82960400001)(86362001)(166002)(26005)(7696005)(6506007)(53546011)(71200400001)(45080400002)(38100700002)(9686003)(4326008)(2906002)(8676002)(8936002)(55016003)(41300700001)(5660300002)(19627405001)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1xY/SNuuEwzqEgdGSr306Fzkids4LiRWquVASU1j9HH/FiSqsG2Q8Zed1A?=
 =?iso-8859-1?Q?EGuXuZUMHIztGAlu93lBht6/LTniBex3td1upsV1r8IeQO1YX/BubJpde4?=
 =?iso-8859-1?Q?Se0k9iFbfSUNI4vPAwEKrBzJTa5LvABsTWx1T1X/bNJ0+S9bFWQZfvAnMB?=
 =?iso-8859-1?Q?jVNS8G/VAzCq2l3LwjvcfTN8QgOSITwMMPZP7eGBReZFiNtKc3T6a7qKOn?=
 =?iso-8859-1?Q?D6YkFD2hnXum7vjeXmogMWYvdFQFbPSa5bVm5F3Dk5PkZ2u29WsngcuRVH?=
 =?iso-8859-1?Q?7oVcXouqsjYKFHspR6ZzOCr5JNc8ItBHJXXy1OiEOUE/ylyoWliFtTmnjQ?=
 =?iso-8859-1?Q?m/ptOXE75NG7nJAKJbQD1QpT8JlkgbT7r3Wl33C6q1lRW9zOh1/ZilX78v?=
 =?iso-8859-1?Q?9tqFe5B8HmucUBxaFJ5cw4LSB9+3tWurrE4+bXFDvyx9MelOCV84Gxwf2E?=
 =?iso-8859-1?Q?Gts/9NFyKvnOvVRg620WHFphjhUUzeQ3wYbp3CG3+qoI1n/Zes78AxJEb8?=
 =?iso-8859-1?Q?H9YKXoMk6rncvEFlDpOAWwSP0r4yODcEimsXk+6sdMSQExRNd8+kJ7JErV?=
 =?iso-8859-1?Q?DKa1T8tcdS3HCslS4DXChn8cBKgaHOTsdZhh5wUM7fSvUFg398+KQEUfW1?=
 =?iso-8859-1?Q?ayWt3fN+sWym+w5vIThNCY1lNy/VyELCjA7G8rK5ZgBrLO4G1YYKKEaS/L?=
 =?iso-8859-1?Q?1Gbjvhw+vgRKH1rVjETp6/dGMHfD62A/gslOT+6X/sCk+oRkkQUg06e6L+?=
 =?iso-8859-1?Q?gXrSK9V3nch/2rVoFwX2OypZKY5n/sGUleGFLCw9hcIuE0rbwVIzm/agIt?=
 =?iso-8859-1?Q?mNEKLIZAXfJnh56QCYlQkCs39+qAMKP/utA/1tdiuB9T0uBArhlD9UAPE3?=
 =?iso-8859-1?Q?4+akztv+BLZLUbLmYzcksnESj377QsBBJHSh3KRbYL67arSVdEmOTmMP2q?=
 =?iso-8859-1?Q?pqBXegCxhLGGQ51Xvr8eH7UMObg9/tY3YB5OL6CQjTIVKG7Oj1BNbaulnw?=
 =?iso-8859-1?Q?B2VfAMvQxIBoo2eiZPSvsHWKpM+j74iZMgtmyt0kdcGWzpIXQLLwHlgZI0?=
 =?iso-8859-1?Q?Jr61a20UmpumXwh9ElgvrsLUDwui1KC0oZHMa/0Sb5fegsvgfwyaGrumqx?=
 =?iso-8859-1?Q?QXs8xrGtNrFRBAHDOwNcYA/fitdcmPEGoQayd2z11KLBkErnyDp6t3eJ+3?=
 =?iso-8859-1?Q?2Es03Fre671DgPntfWzzgL+hALUwj//8Bn1R+VyH1pafCRI0R0QE9BhA4c?=
 =?iso-8859-1?Q?e/C7ADFp/8O/XF6JmTBKjyq72B80yAt7f2svPehaSwM4IsjN/wDCswryFw?=
 =?iso-8859-1?Q?uBMuDsn91RtdGJWCQP8nRBST5hbEpIeIeHqle4uUWDwqTEcep0HRrrRa+O?=
 =?iso-8859-1?Q?IuFMXD/O+anZwOJiDIpnTGy3ab4ILea19IAKZoytnMmBNzWB3UDlPfL1Js?=
 =?iso-8859-1?Q?zbSDacbj15SRZLu26+brU1xPtX48RW2Fzc1Ad9X8oB45PLd0H5ROmnrUIh?=
 =?iso-8859-1?Q?H7eq11elheoN3+NmAO2Ga08rrXjb5K5VnyWsi9aBrSGVa2gQ7CNx5dMSlw?=
 =?iso-8859-1?Q?3+t0kKFZ5uo1A2Mx/gQKSgLfBDJC2wJQB0y/jy02mPBfx4p+etf4BfzpmD?=
 =?iso-8859-1?Q?8h9tI0oU4xiA40yrPvGK9qho1VHrbymsKYY3ieNpEVlniSzZHw5DPTMGJn?=
 =?iso-8859-1?Q?jHCQAXYqsMbs3i7dw2g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: akersolutions.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8505.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34585da-ed60-40ac-4bee-08dc2983f146
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 15:29:44.4983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 26b749f6-8c72-44e3-bbde-ae3de07b4206
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLWGvD0hUibExPryhVeAD3a5voYAsSd7ytUb1tyKwqqYeUryLzsDhOyWu1hxH9eE4sS2/nb5nAyUA2X2WNQDJcf0o71zeVWoIH/22TyICoFwHuQsyrM8eauKPMeUMn19
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7084
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=akersolutions.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NvTkLdfx+0p0yypyBIwWjGyqMUByDYPMhDj5+3wgu8=;
 b=USiJoUcZgK84X1BHe+m1NJuvu0En+CHG82m61bRJqzK04/PYv3k3tmibVpe9gGQ3YJpprxk+Ms2OAAzf5K1qcD5m9FecHmVYKOO547D50eE/MwLd8fZK2COi4A6W/iOKCZKUJ7iYEyxVinyuMIzrJgG88BxuZN1N1XERr3+tUq08JR1p2cyXdWKf87esZIFKsY+muOqcDbioFcNUrkMTWuiRwT1MIqGR9x7imLAU6+mBRZ+WjCSL7yYN/FCa0cwZTLLrfWBYG9E/1zom9ALot/gS+qViUPQ6k+Vw/9b0ABjtmX7lRifDmdiWGGL1soXL2Tort+OCyc0IX0jC+WE6+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=akersolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=akersolutions.com header.i=@akersolutions.com
 header.a=rsa-sha256 header.s=selector1 header.b=USiJoUcZ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=akersolutions.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/qt53d: bump to latest kde
 submodule version
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 "sebastian.weyer@smile.fr" <sebastian.weyer@smile.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8993235026279716079=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8993235026279716079==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PAXPR06MB85053C9FA18B8A4A8DB40608BB4B2PAXPR06MB8505eurp_"

--_000_PAXPR06MB85053C9FA18B8A4A8DB40608BB4B2PAXPR06MB8505eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

What do you recommand doing?

These are the options avilable for assimp in qt53d:

Qt3D options:

  -assimp .............. Select used assimp library [system/qt/no]
...

Last time i tried 'system' and 'no' failed.

If this is the case I should either make assimp configurable or hardcode it=
 to qt.

Regards,
Roy

________________________________
From: Peter Seiderer <ps.report@gmx.net>
Sent: Friday, February 9, 2024 4:05 PM
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Svendsen, Roy Kollen=
 <Roy.Kollen.Svendsen@akersolutions.com>; sebastian.weyer@smile.fr <sebasti=
an.weyer@smile.fr>; Giulio Benetti <giulio.benetti@benettiengineering.com>;=
 Julien Corjon <corjon.j@ecagroup.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt53d: bump to latest kde subm=
odule version

[You don't often get email from ps.report@gmx.net. Learn why this is import=
ant at https://aka.ms/LearnAboutSenderIdentification ]

CAUTION: This email originated from outside of Aker Solutions. Exercise cau=
tion when responding, opening attachments and clicking links.


On Fri,  9 Feb 2024 15:23:26 +0100, Roy Kollen Svendsen <roykollensvendsen@=
gmail.com> wrote:

> The build failed because assimp was missing.

There is already an assimp dependency in package/qt5/qt53d/qt53d.mk (see [1=
]):

14:  ifeq ($(BR2_PACKAGE_ASSIMP),y)
15:  QT53D_DEPENDENCIES +=3D assimp
16:  endif

Regards,
Peter

[1] https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
lab.com%2Fbuildroot.org%2Fbuildroot%2F-%2Fblame%2Fmaster%2Fpackage%2Fqt5%2F=
qt53d%2Fqt53d.mk%3Fref_type%3Dheads%23L14&data=3D05%7C02%7Croy.kollen.svend=
sen%40akersolutions.com%7Cc9ad43b7795d4a21fbb008dc298082d7%7C26b749f68c7244=
e3bbdeae3de07b4206%7C0%7C0%7C638430879122415164%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7=
C&sdata=3DVDhBLxcvmZSPA96XrMcW9EDA%2B0%2BCM6DxSj2F7AKIWto%3D&reserved=3D0<h=
ttps://gitlab.com/buildroot.org/buildroot/-/blame/master/package/qt5/qt53d/=
qt53d.mk?ref_type=3Dheads#L14>


>
> Use git instead of downloading the tar-ball so that
> we also fetch the associated assimp src submodule.
>
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com=
>
> ---
>  package/qt5/qt53d/qt53d.hash | 2 +-
>  package/qt5/qt53d/qt53d.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
> index 0f63aab72a..81de91558e 100644
> --- a/package/qt5/qt53d/qt53d.hash
> +++ b/package/qt5/qt53d/qt53d.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4adc7fd7173=
  qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2
> +sha256  bab48eab35184144fc8789d2958a983a60bfc8dfa242cb65966a3d129fddaea7=
  qt53d-e1b1a0d2970fd384bd52c734a72536d8452ad070-br1.tar.gz
>
>  # Hashes for license files:
>  sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253=
  LICENSE.GPL
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index 4b748a4972..8fcfb72fec 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -4,9 +4,10 @@
>  #
>  ########################################################################=
########
>
> -QT53D_VERSION =3D 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016
> -QT53D_SITE =3D $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
> -QT53D_SOURCE =3D qt3d-$(QT53D_VERSION).tar.bz2
> +QT53D_VERSION =3D e1b1a0d2970fd384bd52c734a72536d8452ad070
> +QT53D_SITE =3D $(QT5_SITE)/qt3d
> +QT53D_SITE_METHOD =3D git
> +QT53D_GIT_SUBMODULES =3D YES
>  QT53D_DEPENDENCIES =3D qt5declarative
>  QT53D_INSTALL_STAGING =3D YES
>  QT53D_SYNC_QT_HEADERS =3D YES

This e-mail and any attachment are confidential and may be privileged or ot=
herwise protected from disclosure. It is solely intended for the person(s) =
named above. If you are not the intended recipient, any reading, use, discl=
osure, copying or distribution of all or parts of this e-mail or associated=
 attachments is strictly prohibited. If you are not an intended recipient, =
please notify the sender immediately by replying to this message or by tele=
phone and delete this e-mail and any attachments permanently from your syst=
em.

--_000_PAXPR06MB85053C9FA18B8A4A8DB40608BB4B2PAXPR06MB8505eurp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Peter,</div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">What do you recommand doing?</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">These are the options avilable for assimp in qt5=
3d:</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">Qt3D options:</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">&nbsp; -assimp .............. Select used assimp=
 library [system/qt/no]</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">...</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">Last time i tried 'system' and 'no' failed.</spa=
n></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">If this is the case I should either make assimp =
configurable or hardcode it to qt.</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">Regards,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
1pt; color: rgb(0, 0, 0);">Roy</span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Peter =
Seiderer &lt;ps.report@gmx.net&gt;<br>
<b>Sent:</b>&nbsp;Friday, February 9, 2024 4:05 PM<br>
<b>To:</b>&nbsp;Roy Kollen Svendsen &lt;roykollensvendsen@gmail.com&gt;<br>
<b>Cc:</b>&nbsp;buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;; Sv=
endsen, Roy Kollen &lt;Roy.Kollen.Svendsen@akersolutions.com&gt;; sebastian=
.weyer@smile.fr &lt;sebastian.weyer@smile.fr&gt;; Giulio Benetti &lt;giulio=
.benetti@benettiengineering.com&gt;; Julien Corjon &lt;corjon.j@ecagroup.co=
m&gt;<br>
<b>Subject:</b>&nbsp;Re: [Buildroot] [PATCH 1/1] package/qt53d: bump to lat=
est kde submodule version</span>
<div>&nbsp;</div>
</div>
<div><span style=3D"font-size: 11pt;">[You don't often get email from ps.re=
port@gmx.net. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" id=3D"OWAebac15a3=
-31c5-916f-97a5-f4456526ffa7" class=3D"OWAAutoLink" data-auth=3D"NotApplica=
ble" data-loopstyle=3D"linkonly">
https://aka.ms/LearnAboutSenderIdentification</a>&nbsp;]<br>
<br>
CAUTION: This email originated from outside of Aker Solutions. Exercise cau=
tion when responding, opening attachments and clicking links.<br>
<br>
<br>
On Fri,&nbsp; 9 Feb 2024 15:23:26 +0100, Roy Kollen Svendsen &lt;roykollens=
vendsen@gmail.com&gt; wrote:<br>
<br>
&gt; The build failed because assimp was missing.<br>
<br>
There is already an assimp dependency in package/qt5/qt53d/qt53d.mk (see [1=
]):<br>
<br>
14:&nbsp; ifeq ($(BR2_PACKAGE_ASSIMP),y)<br>
15:&nbsp; QT53D_DEPENDENCIES +=3D assimp<br>
16:&nbsp; endif<br>
<br>
Regards,<br>
Peter<br>
<br>
[1] <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/blame/master/pa=
ckage/qt5/qt53d/qt53d.mk?ref_type=3Dheads#L14" id=3D"OWA29cfbbf6-513a-087a-=
71f6-0013157f0171" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-l=
oopstyle=3D"linkonly">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
com%2Fbuildroot.org%2Fbuildroot%2F-%2Fblame%2Fmaster%2Fpackage%2Fqt5%2Fqt53=
d%2Fqt53d.mk%3Fref_type%3Dheads%23L14&amp;data=3D05%7C02%7Croy.kollen.svend=
sen%40akersolutions.com%7Cc9ad43b7795d4a21fbb008dc298082d7%7C26b749f68c7244=
e3bbdeae3de07b4206%7C0%7C0%7C638430879122415164%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7=
C&amp;sdata=3DVDhBLxcvmZSPA96XrMcW9EDA%2B0%2BCM6DxSj2F7AKIWto%3D&amp;reserv=
ed=3D0</a><br>
<br>
<br>
&gt;<br>
&gt; Use git instead of downloading the tar-ball so that<br>
&gt; we also fetch the associated assimp src submodule.<br>
&gt;<br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;roy.kollen.svendsen@akersolutio=
ns.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; package/qt5/qt53d/qt53d.hash | 2 +-<br>
&gt;&nbsp; package/qt5/qt53d/qt53d.mk&nbsp;&nbsp; | 7 ++++---<br>
&gt;&nbsp; 2 files changed, 5 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.ha=
sh<br>
&gt; index 0f63aab72a..81de91558e 100644<br>
&gt; --- a/package/qt5/qt53d/qt53d.hash<br>
&gt; +++ b/package/qt5/qt53d/qt53d.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;&nbsp; # Locally calculated<br>
&gt; -sha256&nbsp; 44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4ad=
c7fd7173&nbsp; qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2<br>
&gt; +sha256&nbsp; bab48eab35184144fc8789d2958a983a60bfc8dfa242cb65966a3d12=
9fddaea7&nbsp; qt53d-e1b1a0d2970fd384bd52c734a72536d8452ad070-br1.tar.gz<br=
>
&gt;<br>
&gt;&nbsp; # Hashes for license files:<br>
&gt;&nbsp; sha256&nbsp; edfe70e99be2a7c109d860b19204609e582720b211c50caedac=
729da372a1253&nbsp; LICENSE.GPL<br>
&gt; diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk<b=
r>
&gt; index 4b748a4972..8fcfb72fec 100644<br>
&gt; --- a/package/qt5/qt53d/qt53d.mk<br>
&gt; +++ b/package/qt5/qt53d/qt53d.mk<br>
&gt; @@ -4,9 +4,10 @@<br>
&gt;&nbsp; #<br>
&gt;&nbsp; ################################################################=
################<br>
&gt;<br>
&gt; -QT53D_VERSION =3D 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016<br>
&gt; -QT53D_SITE =3D $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)<br>
&gt; -QT53D_SOURCE =3D qt3d-$(QT53D_VERSION).tar.bz2<br>
&gt; +QT53D_VERSION =3D e1b1a0d2970fd384bd52c734a72536d8452ad070<br>
&gt; +QT53D_SITE =3D $(QT5_SITE)/qt3d<br>
&gt; +QT53D_SITE_METHOD =3D git<br>
&gt; +QT53D_GIT_SUBMODULES =3D YES<br>
&gt;&nbsp; QT53D_DEPENDENCIES =3D qt5declarative<br>
&gt;&nbsp; QT53D_INSTALL_STAGING =3D YES<br>
&gt;&nbsp; QT53D_SYNC_QT_HEADERS =3D YES<br>
<br>
</span></div>
This e-mail and any attachment are confidential and may be privileged or ot=
herwise protected from disclosure. It is solely intended for the person(s) =
named above. If you are not the intended recipient, any reading, use, discl=
osure, copying or distribution of
 all or parts of this e-mail or associated attachments is strictly prohibit=
ed. If you are not an intended recipient, please notify the sender immediat=
ely by replying to this message or by telephone and delete this e-mail and =
any attachments permanently from
 your system.
</body>
</html>

--_000_PAXPR06MB85053C9FA18B8A4A8DB40608BB4B2PAXPR06MB8505eurp_--

--===============8993235026279716079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8993235026279716079==--
