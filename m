Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D4FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 09:38:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC602613A9
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 09:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC602613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gallagher.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8790183022;
	Wed, 29 Sep 2021 09:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7UD-9W8VSUs; Wed, 29 Sep 2021 09:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FA8F80EEF;
	Wed, 29 Sep 2021 09:37:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73CA11BF2AE
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 09:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 579F160669
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 09:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gallagher.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYFfnt-HuyCG for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 09:37:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from AUS01-SY4-obe.outbound.protection.outlook.com
 (mail-sy4aus01on2115.outbound.protection.outlook.com [40.107.107.115])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBD7060632
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 09:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfECbCUf3vDLL6YndLDPIj02tdxwxXyyngtRHyuCF3K9OjATq4T+EgQ5BWLDuGhgt0/PDiLCeYaTVouPb7A056B2qL5I1SdjpWj+M6dnFUDY6ZrYiXttdGf120xug08TS11cZgm9Z2YQpSuDtJq5ElRo+5BPYMbt8AofyGoW0NkCBz2xTZRKFiyzOWMhRI2E9RjCEuxW2ttxUF6Te+3jpJracRcs9oKgQyM3KbjvTlGzIsSAZ93VYPtG6cMOZSUrWQoX+mQuQidhNZ/YiXMRCGWj9x85VCZiajpMfiyVPf6jJ0VXvZQbUBnoqvP4HBu7Y57UW+mmwf74LoZUb1Lvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=yGttSwrrqDq0W/Tb4IveKsFaYbyEeyjtXCsjrz3Nb+c=;
 b=XNAbLfYvRapTUXTZnfRCv42ZpZA3N4NFFfdJX/5zbnYo6uu5s0acvM9bH/a+Zyk/Hg7ChZ5vLvIy5E+6noHWLgNOlt/TDoRuKvOwwxIuhhew5mnShhqDyhr0zaq3ZKwgUNtmEuA0x4s3/jqzx+1iMjU0xmSfK7zzgBAV9112ww+JOA98VpDKKlbEDilQC45w11tZxNPm99CNFMKzBnQTBWapJZ6t4b98m5HC/ufky15BqzCKs2xTiluFrjqguePV1egNsKAX0pxXFoflLwErYEDjQyWOETKpee5qfOBAG/39ZOseXX+X1v3ZE449VKDAqlwkduYciZS1Fur3OgB4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gallagher.com; dmarc=pass action=none
 header.from=gallagher.com; dkim=pass header.d=gallagher.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gallagher.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGttSwrrqDq0W/Tb4IveKsFaYbyEeyjtXCsjrz3Nb+c=;
 b=lNHyAYBcmrnM7tn3jw+vgbCXYxytynoj7tFUKsPd6Pmoa1O6D4PtUnT1mRSIR04Ki9mR0xh7O1NWJxgKMIt8G47nZA1K7Ex7kW1/M60SbYXPVv4bAMcZxZ3mcFXQBwV5aLQ85lL1h/rBZVogw4uQSXNLVOQYa++BH1QGB04ryco=
Received: from SYBPR01MB4811.ausprd01.prod.outlook.com (2603:10c6:10:5c::19)
 by SYAPR01MB2927.ausprd01.prod.outlook.com (2603:10c6:1:e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14; Wed, 29 Sep 2021 09:37:27 +0000
Received: from SYBPR01MB4811.ausprd01.prod.outlook.com
 ([fe80::e5f2:7efe:c878:446b]) by SYBPR01MB4811.ausprd01.prod.outlook.com
 ([fe80::e5f2:7efe:c878:446b%5]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 09:37:27 +0000
From: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
To: Chris Packham <judge.packham@gmail.com>
Thread-Topic: [PATCH 1/1] package/syslog-ng: compile with -fPIC when
 BR2_PIC_PIE is set
Thread-Index: AQHXtLYK5OuC/SM3V0a5o+H9SnajO6u6qLgAgAAYoAA=
Date: Wed, 29 Sep 2021 09:37:27 +0000
Message-ID: <SYBPR01MB4811771A2D47E9FC4959FB0FE5A99@SYBPR01MB4811.ausprd01.prod.outlook.com>
References: <20210928221304.1010-1-ankur.tyagi@gallagher.com>
 <CAFOYHZCBki4UOdQndzu5QQASo_AsTr-hA-AcZR_bYnEMxc9Pxw@mail.gmail.com>
In-Reply-To: <CAFOYHZCBki4UOdQndzu5QQASo_AsTr-hA-AcZR_bYnEMxc9Pxw@mail.gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=gallagher.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd50f2ce-96ed-458f-8a22-08d9832cc019
x-ms-traffictypediagnostic: SYAPR01MB2927:
x-microsoft-antispam-prvs: <SYAPR01MB29271DF1F2FD747FA19585C6E5A99@SYAPR01MB2927.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:235;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lyKVhFElguSE711hqDfsYUWw/NsDb+vP++zkkzIYllHUPYPQ0muLy5crGonjpFvFzloaDCOmD8ElK8IKpyCjB7TWeWujTopQ29WE1VOzQeLWFMR/jSLJp3Ll1lCCQCxaifaCnD9E3apIf3ylY7iAWN3SmruStwQtG9e/VIteFdXmbKifaZ+i+A9FtKKCC7hdjk/Zm1iRLlXYeiP65GtYU8lsals3PtD4++tyq59CWXrHVXf49lOXPKfUwbkn0n565ULJG7FAWA1NdHELsDvg3rfroRGEP0A5kDSajOUrfWwIpJ+l/VZhxvRMkTBnKfahTZ407dz/7o30Vk5kaXzSypWl4RUEWBGUTGR0kpPCtpYfKe2aHiwhJFtxQ+hCSawEqJVCNL6TGqrflQ6McTLLbd39gxRs6ljf25apKvwvpNTcBjyZhFiL/N+/skLggL91s+bN5bRAnf9a10KCaUAd5gAiL7zIm4ykftBvmKFNJEtJgaEpdCKzfl1Tg1jq+GJ4/pvj7qEoGr1vX3kK9uVkClZBFGuTepT5z8tB2NmJ/qVBuG+cKsh7OlFvjXICaVcPqs6nrmLOrnJ+vwwJMFXb1y3Q6mn4ZyGVhe/6f+ZQo/YBakpNpvBGvch5wlTywtDogC8a6wzGzjodjmZ+4oq7JJTrIwJVHwNCD5MWw9x4mlYipKRMC96f4h8M66YmlRMBFsBwzOUcgZAou1UZxA23gA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SYBPR01MB4811.ausprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(508600001)(38100700002)(122000001)(86362001)(2906002)(55016002)(8676002)(52536014)(33656002)(71200400001)(5660300002)(64756008)(53546011)(4326008)(7696005)(26005)(316002)(38070700005)(6916009)(186003)(83380400001)(30864003)(66946007)(6506007)(76116006)(66446008)(8936002)(66476007)(66556008)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXh6MDk0cml5enpZMjdjTHBveU40RHFTdlJqUkZMaVVPU0MrcXNSdG5xY094?=
 =?utf-8?B?RytaUkkvYXlLWklVbVJCbWRGU3c1UkFQMFZ4Ymt0WEZJc2tzc1B6c2NrMzJh?=
 =?utf-8?B?WUg5aVkvSnFMWmdhUDRwbUd6dythODh4MnBWeDc1V3RuaWJRK2xJMm9JTTND?=
 =?utf-8?B?N1FYMlBSRGlvOFppTi8vbDlGSy9Ba0RWc2xieDE1anVIdnIxN3cvR0J4TWRr?=
 =?utf-8?B?Z1E2bUluZHhMTjUyOE95Tk5jYkV4VTNuSjM1UDBtSlQ0L3Z3S1lCRUQzejNE?=
 =?utf-8?B?ZXI1cTgrczBBejRhK1k3TE9ndXBYWHZuUFphSjR4WVJ4aklPZXI4Ym1ZNVc5?=
 =?utf-8?B?aTRjQy8yM3hRKzE4NzIyQjh6ekVjT2s1aW1zc0Z2SWZ6Tnc0V3N4OENLVC9n?=
 =?utf-8?B?akpKaDRlQ3FmcmI4cURMV1pGMjZackdrN2R5blJaYXBuaUhzRkZQTFh2RldN?=
 =?utf-8?B?aGJmcUlCVndkZ3dlRCt6RzdVRFFxbVlyRTFoQlcrQ3pUMUFscy9PdjFpbi92?=
 =?utf-8?B?NGdIQXJmdFc5LzdOT2RrQ3hHNm9sODk3MkkySW45eXRXOGZ4ZGxYNGRHbno1?=
 =?utf-8?B?aXRuNU13cE84a1U1T1Z6N0J4T0UvdEI0YVZsOGk3cjdZM0J4cWViamplY2dk?=
 =?utf-8?B?R2psczNpS1ZxcUlvNHlKUnAxUFE3Z2dhbTdPSmxKMVY3Tml4NFRhS2pGZmdy?=
 =?utf-8?B?eVJMSTJ1TUdpM0M2ejZ0MVkvK3pja0VuRytLZ0J1aTJ3RlhnS1UzQVdwZnMx?=
 =?utf-8?B?VXNZcWxxcE9QVkdiU2x6T1ZxRGsxUkZjUzh5TElQVG1QNk0yK2hFQytSTS93?=
 =?utf-8?B?b1ZLZXdCMFJpcndDRS92aTcwdTVab29ieForeVp1YkV5YXg4VVpnTUFCUThN?=
 =?utf-8?B?S1pMb2Y1dDRMb2RyL1NQRlVqazlXT2xUd0tuVXBvejcyZWQxRzlETVNBc1NV?=
 =?utf-8?B?OThiOERhMU5LWUh0L0VkVGZ5RWM4cnZpaVFQaERMdDlkM0ZlV0FYcXhtT0NP?=
 =?utf-8?B?M3UzbDZGeFNYeTkvWDBiaEx6UHptVlgySGJBOHdYdExLZU5vNVNVMDVFbk53?=
 =?utf-8?B?TXdFejR6YmdGbjNoQVlKTFoxMHJGem1zQThibnBBMG9Cc0lucEtsanpGbXI1?=
 =?utf-8?B?Zllma0RVdlUva1FXQmJGVStXRWd0ZmtRU1R3Zi9nYzRsbWM0NjhPZHNjUWhU?=
 =?utf-8?B?MFdodGRseVl4V21QM1ZVR3p4bzZMMFpuNzZzRjJpQ3B3SXYySGZNblB3RFZP?=
 =?utf-8?B?YStzZkhaOGZwZVhtTE5tTU5md3hhWjB0VmdjU2s4a2lDcW5ROGFJVzUzMVF6?=
 =?utf-8?B?eG9GSEhLeVE4QU5GUnN2TGoyQkRPWWx0ekhVVWpFYWxsZVVuK3hSdzdDWnpY?=
 =?utf-8?B?UTFpK0g3ZE9zRUJLVFNNQ3BreGhXRXlBQ1lFcDZjUWxmUlZXcjl3NmdNelpt?=
 =?utf-8?B?WFFWYUQ1YTc0ZzYxclR2aFZ2SGVRM2RmRDIxVGRHQXBHdnhRUitrUDNOVnFR?=
 =?utf-8?B?TXVxam9jWHRYZk45Y1NJSm5BVFRPQnp5MzB2T2NsVDRrMnRsMHZBUk5yd25J?=
 =?utf-8?B?bXZWQ0RTR3dNU0dmejBQRW9WOGlnL1dXdlBtd0lnQVpaaHlsL3NaQ2lZRW0w?=
 =?utf-8?B?RWNEdm5KQXZmcVpzUGpsejFRbUF1S2NWbWEzUzhTdG9wQmdFMWFJT0xsZW1D?=
 =?utf-8?B?UzN4bUFvOXd5QWFOSC91ZkxEcjkvVys1TnNjRjNMTm5xdE91b0VuS28wUUhO?=
 =?utf-8?Q?gKlrP/63qgo+mChca63b0OTLpvCpCOV/MjA5tCq?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB4811.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd50f2ce-96ed-458f-8a22-08d9832cc019
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 09:37:27.3485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBHqmJxpoYJmiv/Qg6CXTtjYpniL9hAt4uF9dK04v89eXM+nq4OxaFbGDvvy6xA6o5DEDYiX6f32/pR5pGYhv5B5qfNyB3bdDs8AEFW88iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYAPR01MB2927
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: compile with -fPIC
 when BR2_PIC_PIE is set
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Chris Packham <judge.packham@gmail.com>
> Sent: Wednesday, 29 September 2021 9:08 PM
> To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Cc: buildroot <buildroot@buildroot.org>
> Subject: Re: [PATCH 1/1] package/syslog-ng: compile with -fPIC when BR2_PIC_PIE is set
>
> On Wed, Sep 29, 2021 at 11:13 AM Ankur Tyagi <ankur.tyagi@gallagher.com> wrote:
> >
> > Otherwise build fails with following error:
> > Toolchain wrapper executing: '/tools/aarch64-linux-gnu/bin//aarch64-linux-gnu-gcc' '--sysroot'
> '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot' '-mabi=lp64' '-fstack-protector-strong' '-fstack-clash-
> protection' '-Wl,-z,noexecstack' '-Wl,-z,noexecheap' '-mcpu=cortex-a35' '-fPIE' '-Wl,-z,now' '-Wl,-z,relro' '-shared'
> 'lib/.libs/lib_libsyslog_ng_la-afinter.o' 'lib/.libs/lib_libsyslog_ng_la-alarms.o' 'lib/.libs/lib_libsyslog_ng_la-apphook.o'
> 'lib/.libs/lib_libsyslog_ng_la-block-ref-parser.o' 'lib/.libs/lib_libsyslog_ng_la-cache.o' 'lib/.libs/lib_libsyslog_ng_la-cfg.o'
> 'lib/.libs/lib_libsyslog_ng_la-cfg-args.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-block.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-block-generator.o'
> 'lib/.libs/lib_libsyslog_ng_la-cfg-lexer.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-lexer-subst.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-parser.o'
> 'lib/.libs/lib_libsyslog_ng_la-cfg-path.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-tree.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-walker.o'
> 'lib/.libs/lib_libsyslog_ng_la-children.o' 'lib/.libs/lib_libsyslog_ng_la-dnscache.o' 'lib/.libs/lib_libsyslog_ng_la-driver.o'
> 'lib/.libs/lib_libsyslog_ng_la-dynamic-window.o' 'lib/.libs/lib_libsyslog_ng_la-dynamic-window-pool.o' 'lib/.libs/lib_libsyslog_ng_la-
> fdhelpers.o' 'lib/.libs/lib_libsyslog_ng_la-file-perms.o' 'lib/.libs/lib_libsyslog_ng_la-find-crlf.o' 'lib/.libs/lib_libsyslog_ng_la-globals.o'
> 'lib/.libs/lib_libsyslog_ng_la-gprocess.o' 'lib/.libs/lib_libsyslog_ng_la-gsockaddr.o' 'lib/.libs/lib_libsyslog_ng_la-gsocket.o'
> 'lib/.libs/lib_libsyslog_ng_la-hostname.o' 'lib/.libs/lib_libsyslog_ng_la-host-resolve.o' 'lib/.libs/lib_libsyslog_ng_la-logmatcher.o'
> 'lib/.libs/lib_libsyslog_ng_la-logmpx.o' 'lib/.libs/lib_libsyslog_ng_la-logpipe.o' 'lib/.libs/lib_libsyslog_ng_la-logqueue.o'
> 'lib/.libs/lib_libsyslog_ng_la-logqueue-fifo.o' 'lib/.libs/lib_libsyslog_ng_la-logreader.o' 'lib/.libs/lib_libsyslog_ng_la-logsource.o'
> 'lib/.libs/lib_libsyslog_ng_la-logwriter.o' 'lib/.libs/lib_libsyslog_ng_la-mainloop.o' 'lib/.libs/lib_libsyslog_ng_la-signal-handler.o'
> 'lib/.libs/lib_libsyslog_ng_la-mainloop-call.o' 'lib/.libs/lib_libsyslog_ng_la-mainloop-worker.o' 'lib/.libs/lib_libsyslog_ng_la-mainloop-io-
> worker.o' 'lib/.libs/lib_libsyslog_ng_la-mainloop-control.o' 'lib/.libs/lib_libsyslog_ng_la-module-config.o' 'lib/.libs/lib_libsyslog_ng_la-
> memtrace.o' 'lib/.libs/lib_libsyslog_ng_la-messages.o' 'lib/.libs/lib_libsyslog_ng_la-ml-batched-timer.o' 'lib/.libs/lib_libsyslog_ng_la-msg-
> format.o' 'lib/.libs/lib_libsyslog_ng_la-msg-stats.o' 'lib/.libs/lib_libsyslog_ng_la-parse-number.o' 'lib/.libs/lib_libsyslog_ng_la-pathutils.o'
> 'lib/.libs/lib_libsyslog_ng_la-persist-state.o' 'lib/.libs/lib_libsyslog_ng_la-plugin.o' 'lib/.libs/lib_libsyslog_ng_la-poll-events.o'
> 'lib/.libs/lib_libsyslog_ng_la-poll-fd-events.o' 'lib/.libs/lib_libsyslog_ng_la-pragma-parser.o' 'lib/.libs/lib_libsyslog_ng_la-persistable-state-
> presenter.o' 'lib/.libs/lib_libsyslog_ng_la-rcptid.o' 'lib/.libs/lib_libsyslog_ng_la-reloc.o' 'lib/.libs/lib_libsyslog_ng_la-run-id.o'
> 'lib/.libs/lib_libsyslog_ng_la-scratch-buffers.o' 'lib/.libs/lib_libsyslog_ng_la-serialize.o' 'lib/.libs/lib_libsyslog_ng_la-service-management.o'
> 'lib/.libs/lib_libsyslog_ng_la-str-format.o' 'lib/.libs/lib_libsyslog_ng_la-str-utils.o' 'lib/.libs/lib_libsyslog_ng_la-syslog-names.o'
> 'lib/.libs/lib_libsyslog_ng_la-string-list.o' 'lib/.libs/lib_libsyslog_ng_la-type-hinting.o' 'lib/.libs/lib_libsyslog_ng_la-ringbuffer.o'
> 'lib/.libs/lib_libsyslog_ng_la-crypto.o' 'lib/.libs/lib_libsyslog_ng_la-tlscontext.o' 'lib/.libs/lib_libsyslog_ng_la-uuid.o'
> 'lib/.libs/lib_libsyslog_ng_la-userdb.o' 'lib/.libs/lib_libsyslog_ng_la-utf8utils.o' 'lib/transport/.libs/lib_libsyslog_ng_la-transport-tls.o'
> 'lib/.libs/lib_libsyslog_ng_la-host-id.o' 'lib/.libs/lib_libsyslog_ng_la-resolved-configurable-paths.o' 'lib/.libs/lib_libsyslog_ng_la-window-
> size-counter.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-lex.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-grammar.o' 'lib/.libs/lib_libsyslog_ng_la-cfg-
> grammar-internal.o' 'lib/.libs/lib_libsyslog_ng_la-block-ref-grammar.o' 'lib/.libs/lib_libsyslog_ng_la-pragma-grammar.o' 'lib/ack-
> tracker/.libs/lib_libsyslog_ng_la-ack_tracker_factory.o' 'lib/ack-tracker/.libs/lib_libsyslog_ng_la-batched_ack_tracker.o' 'lib/ack-
> tracker/.libs/lib_libsyslog_ng_la-batched_ack_tracker_factory.o' 'lib/ack-tracker/.libs/lib_libsyslog_ng_la-instant_ack_tracker.o' 'lib/ack-
> tracker/.libs/lib_libsyslog_ng_la-instant_ack_tracker_bookmarkless.o' 'lib/ack-tracker/.libs/lib_libsyslog_ng_la-consecutive_ack_tracker.o'
> 'lib/ack-tracker/.libs/lib_libsyslog_ng_la-consecutive_ack_tracker_factory.o' 'lib/ack-tracker/.libs/lib_libsyslog_ng_la-
> consecutive_ack_record_container_static.o' 'lib/ack-tracker/.libs/lib_libsyslog_ng_la-consecutive_ack_record_container_dynamic.o'
> 'lib/ack-tracker/.libs/lib_libsyslog_ng_la-instant_ack_tracker_factory.o' 'lib/ack-tracker/.libs/lib_libsyslog_ng_la-
> instant_ack_tracker_bookmarkless_factory.o' 'lib/scanner/csv-scanner/.libs/lib_libsyslog_ng_la-csv-scanner.o' 'lib/scanner/kv-
> scanner/.libs/lib_libsyslog_ng_la-kv-scanner.o' 'lib/scanner/list-scanner/.libs/lib_libsyslog_ng_la-list-scanner.o' 'lib/scanner/xml-
> scanner/.libs/lib_libsyslog_ng_la-xml-scanner.o' 'lib/transport/.libs/lib_libsyslog_ng_la-logtransport.o'
> 'lib/transport/.libs/lib_libsyslog_ng_la-transport-aux-data.o' 'lib/transport/.libs/lib_libsyslog_ng_la-transport-file.o'
> 'lib/transport/.libs/lib_libsyslog_ng_la-transport-pipe.o' 'lib/transport/.libs/lib_libsyslog_ng_la-transport-socket.o'
> 'lib/transport/.libs/lib_libsyslog_ng_la-transport-udp-socket.o' 'lib/transport/.libs/lib_libsyslog_ng_la-transport-factory-id.o'
> 'lib/transport/.libs/lib_libsyslog_ng_la-transport-factory-registry.o' 'lib/transport/.libs/lib_libsyslog_ng_la-multitransport.o'
> 'lib/transport/.libs/lib_libsyslog_ng_la-transport-factory-tls.o' 'lib/transport/.libs/lib_libsyslog_ng_la-transport-factory-socket.o'
> 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-client.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-server.o'
> 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-buffered-server.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-dgram-server.o'
> 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-framed-client.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-framed-server.o'
> 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-text-client.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-text-server.o'
> 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-proxied-text-server.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-indented-multiline-
> server.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-regexp-multiline-server.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-
> multiline-server.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-record-server.o' 'lib/logproto/.libs/lib_libsyslog_ng_la-logproto-
> builtins.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-expr.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-op.o' 'lib/filter/.libs/lib_libsyslog_ng_la-
> filter-cmp.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-in-list.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-tags.o'
> 'lib/filter/.libs/lib_libsyslog_ng_la-filter-netmask.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-netmask6.o' 'lib/filter/.libs/lib_libsyslog_ng_la-
> filter-call.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-re.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-pri.o' 'lib/filter/.libs/lib_libsyslog_ng_la-
> filter-pipe.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-expr-parser.o' 'lib/filter/.libs/lib_libsyslog_ng_la-filter-expr-grammar.o'
> 'lib/parser/.libs/lib_libsyslog_ng_la-parser-expr.o' 'lib/parser/.libs/lib_libsyslog_ng_la-parser-expr-parser.o'
> 'lib/parser/.libs/lib_libsyslog_ng_la-parser-expr-grammar.o' 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-expr.o'
> 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set-tag.o' 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set.o'
> 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-unset.o' 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-subst.o'
> 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-expr-parser.o' 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-expr-grammar.o'
> 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-groupset.o' 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set-pri.o'
> 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set-severity.o' 'lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set-facility.o'
> 'lib/template/.libs/lib_libsyslog_ng_la-templates.o' 'lib/template/.libs/lib_libsyslog_ng_la-macros.o' 'lib/template/.libs/lib_libsyslog_ng_la-
> eval.o' 'lib/template/.libs/lib_libsyslog_ng_la-simple-function.o' 'lib/template/.libs/lib_libsyslog_ng_la-repr.o'
> 'lib/template/.libs/lib_libsyslog_ng_la-compiler.o' 'lib/template/.libs/lib_libsyslog_ng_la-user-function.o'
> 'lib/template/.libs/lib_libsyslog_ng_la-escaping.o' 'lib/value-pairs/.libs/lib_libsyslog_ng_la-value-pairs.o' 'lib/value-
> pairs/.libs/lib_libsyslog_ng_la-transforms.o' 'lib/value-pairs/.libs/lib_libsyslog_ng_la-cmdline.o' 'lib/value-pairs/.libs/lib_libsyslog_ng_la-
> evttag.o' 'lib/stats/.libs/lib_libsyslog_ng_la-stats.o' 'lib/stats/.libs/lib_libsyslog_ng_la-stats-control.o' 'lib/stats/.libs/lib_libsyslog_ng_la-
> stats-cluster.o' 'lib/stats/.libs/lib_libsyslog_ng_la-stats-csv.o' 'lib/stats/.libs/lib_libsyslog_ng_la-stats-log.o'
> 'lib/stats/.libs/lib_libsyslog_ng_la-stats-registry.o' 'lib/stats/.libs/lib_libsyslog_ng_la-stats-query.o' 'lib/stats/.libs/lib_libsyslog_ng_la-stats-
> query-commands.o' 'lib/stats/.libs/lib_libsyslog_ng_la-stats-cluster-logpipe.o' 'lib/stats/.libs/lib_libsyslog_ng_la-stats-cluster-single.o'
> 'lib/control/.libs/lib_libsyslog_ng_la-control.o' 'lib/control/.libs/lib_libsyslog_ng_la-control-commands.o'
> 'lib/control/.libs/lib_libsyslog_ng_la-control-main.o' 'lib/control/.libs/lib_libsyslog_ng_la-control-server.o'
> 'lib/control/.libs/lib_libsyslog_ng_la-control-server-unix.o' 'lib/debugger/.libs/lib_libsyslog_ng_la-debugger.o'
> 'lib/debugger/.libs/lib_libsyslog_ng_la-tracer.o' 'lib/debugger/.libs/lib_libsyslog_ng_la-debugger-main.o'
> 'lib/compat/.libs/lib_libsyslog_ng_la-getutent.o' 'lib/compat/.libs/lib_libsyslog_ng_la-inet_aton.o' 'lib/compat/.libs/lib_libsyslog_ng_la-
> memrchr.o' 'lib/compat/.libs/lib_libsyslog_ng_la-pio.o' 'lib/compat/.libs/lib_libsyslog_ng_la-glib.o' 'lib/compat/.libs/lib_libsyslog_ng_la-
> strcasestr.o' 'lib/compat/.libs/lib_libsyslog_ng_la-strtok_r.o' 'lib/compat/.libs/lib_libsyslog_ng_la-strnlen.o'
> 'lib/compat/.libs/lib_libsyslog_ng_la-time.o' 'lib/compat/.libs/lib_libsyslog_ng_la-openssl_support.o' 'lib/compat/.libs/lib_libsyslog_ng_la-
> getent-sun.o' 'lib/compat/.libs/lib_libsyslog_ng_la-getent-openbsd.o' 'lib/compat/.libs/lib_libsyslog_ng_la-getent-generic.o'
> 'lib/logmsg/.libs/lib_libsyslog_ng_la-gsockaddr-serialize.o' 'lib/logmsg/.libs/lib_libsyslog_ng_la-logmsg.o'
> 'lib/logmsg/.libs/lib_libsyslog_ng_la-logmsg-serialize.o' 'lib/logmsg/.libs/lib_libsyslog_ng_la-logmsg-serialize-fixup.o'
> 'lib/logmsg/.libs/lib_libsyslog_ng_la-nvhandle-descriptors.o' 'lib/logmsg/.libs/lib_libsyslog_ng_la-nvtable.o'
> 'lib/logmsg/.libs/lib_libsyslog_ng_la-nvtable-serialize.o' 'lib/logmsg/.libs/lib_libsyslog_ng_la-nvtable-serialize-legacy.o'
> 'lib/logmsg/.libs/lib_libsyslog_ng_la-tags-serialize.o' 'lib/logmsg/.libs/lib_libsyslog_ng_la-timestamp-serialize.o'
> 'lib/logmsg/.libs/lib_libsyslog_ng_la-tags.o' 'lib/str-repr/.libs/lib_libsyslog_ng_la-decode.o' 'lib/str-repr/.libs/lib_libsyslog_ng_la-encode.o'
> 'lib/timeutils/.libs/lib_libsyslog_ng_la-scan-timestamp.o' 'lib/timeutils/.libs/lib_libsyslog_ng_la-cache.o'
> 'lib/timeutils/.libs/lib_libsyslog_ng_la-conv.o' 'lib/timeutils/.libs/lib_libsyslog_ng_la-format.o' 'lib/timeutils/.libs/lib_libsyslog_ng_la-misc.o'
> 'lib/timeutils/.libs/lib_libsyslog_ng_la-names.o' 'lib/timeutils/.libs/lib_libsyslog_ng_la-timeutils.o' 'lib/timeutils/.libs/lib_libsyslog_ng_la-
> unixtime.o' 'lib/timeutils/.libs/lib_libsyslog_ng_la-zonecache.o' 'lib/timeutils/.libs/lib_libsyslog_ng_la-zonedb.o'
> 'lib/timeutils/.libs/lib_libsyslog_ng_la-zoneinfo.o' 'lib/timeutils/.libs/lib_libsyslog_ng_la-wallclocktime.o'
> 'lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrsourcedrv.o' 'lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrfetcherdrv.o'
> 'lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o' 'lib/signal-slot-connector/.libs/lib_libsyslog_ng_la-signal-slot-connector.o' '-Wl,-
> rpath' '-Wl,/home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/eventlog/src/.libs' '-Wl,-rpath' '-
> Wl,/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib' '-Wl,-rpath' '-
> Wl,/home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/secret-storage/.libs' '-Wl,-rpath' '-
> Wl,/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib' '-lrt' '-
> L/home/user/work/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib' './lib/eventlog/src/.libs/libevtlog.so'
> '/home/user/work/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libpcre.so' '-ldl' '-L./lib/ivykis/src'
> '/home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/ivykis/src/.libs/libivykis.a' './lib/secret-storage/.libs/libsecret-storage.so' '-
> lgmodule-2.0' '-lgthread-2.0' '-lglib-2.0' '-lssl' '-lcrypto' '-O2' '-g' '-pthread' '-Os' '-g2' '-Wl,--export-dynamic' '-pthread' '-Wl,--whole-archive'
> '-Wl,--no-whole-archive' '-pthread' '-Wl,-soname' '-Wl,libsyslog-ng-3.33.so.0' '-o' 'lib/.libs/libsyslog-ng-3.33.so.0.0.0'
> >
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-afinter.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `afinter_message_posted' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-afinter.o: in function `afinter_register_posted_hook':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/afinter.c:576:(.text+0x120): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> apphook.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `nondumpable_allocator_msg_fatal' which may bind externally can
> not be used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-apphook.o: in function `app_startup':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/apphook.c:185:(.text+0x34c): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> apphook.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `nondumpable_allocator_msg_debug' which may bind externally
> can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/apphook.c:185:(.text+0x354): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-cfg-
> block.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `cfg_block_free_instance' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-cfg-block.o: in function `cfg_block_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/cfg-block.c:210:(.text+0x4c8): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-cfg-
> block.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `cfg_block_generate' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/cfg-block.c:211:(.text+0x4d4): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-cfg-
> block-generator.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `cfg_block_generator_format_name_method' which may
> bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-cfg-block-generator.o: in function `cfg_block_generator_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/cfg-block-generator.c:57:(.text+0x144): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-cfg-
> block-generator.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `cfg_block_generator_free_instance' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/cfg-block-generator.c:58:(.text+0x150): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-cfg-
> lexer.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `cfg_token_block_free' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-cfg-lexer.o: in function `cfg_lexer_free':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/cfg-lexer.c:1172:(.text+0x16cc): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-cfg-
> tree.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_expr_node_unref' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-cfg-tree.o: in function `cfg_tree_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/cfg-tree.c:1472:(.text+0x18c4): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-cfg-
> tree.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_expr_node_unref' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-cfg-tree.o: in function `cfg_tree_free_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/cfg-tree.c:1485:(.text+0x1958): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-cfg-
> walker.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `arc_free' which may bind externally can not be used when making a
> shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-cfg-walker.o: in function `cfg_walker_get_graph':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/cfg-walker.c:86:(.text+0x160): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> dnscache.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `dns_cache_free' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-dnscache.o: in function `dns_caching_global_deinit':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/dnscache.c:487:(.text+0x974): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-driver.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_driver_plugin_free_method' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-driver.o: in function `log_driver_plugin_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/driver.c:45:(.text+0x964): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-driver.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_src_driver_init_method' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-driver.o: in function `log_src_driver_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/driver.c:230:(.text+0xab8): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-driver.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_src_driver_deinit_method' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/driver.c:231:(.text+0xac4): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-driver.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_src_driver_queue_method' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/driver.c:232:(.text+0xad0): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-driver.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_dest_driver_init_method' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-driver.o: in function `log_dest_driver_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/driver.c:388:(.text+0xb30): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-driver.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_dest_driver_deinit_method' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/driver.c:389:(.text+0xb3c): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-driver.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_dest_driver_queue_method' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/driver.c:390:(.text+0xb48): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> logpipe.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_pipe_free_method' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-logpipe.o: in function `log_pipe_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logpipe.c:76:(.text+0x20c): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> logqueue.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_queue_free_method' which may bind externally can not be
> used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-logqueue.o: in function `log_queue_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logqueue.c:257:(.text+0x6b0): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> logqueue-fifo.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_queue_fifo_is_empty_racy' which may bind externally
> can not be used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-logqueue-fifo.o: in function `log_queue_fifo_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logqueue-fifo.c:665:(.text+0xd04): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> logreader.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_reader_close_proto_deferred' which may bind externally can
> not be used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-logreader.o: in function `log_reader_close_proto':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logreader.c:263:(.text+0xc58): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> logsource.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_source_free' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-logsource.o: in function `log_source_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logsource.c:728:(.text+0x188c): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> logsource.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_source_init' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logsource.c:729:(.text+0x1898): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> logsource.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_source_deinit' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logsource.c:730:(.text+0x18a4): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> mainloop.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `main_loop_exit' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-mainloop.o: in function `main_loop_initialize_state':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/mainloop.c:194:(.text+0x348): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> mainloop-worker.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `main_loop_worker_job_complete' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-mainloop-worker.o: in function `_worker_thread_func':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/mainloop-worker.c:343:(.text+0x2fc): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> mainloop-control.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `secret_storage_status_accumulator' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-mainloop-control.o: in function `process_credentials_status':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/mainloop-control.c:209:(.text+0x3dc): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> messages.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `msg_log_func' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-messages.o: in function `msg_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/messages.c:288:(.text+0x5ac): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-plugin.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `plugin_candidate_free' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-plugin.o: in function `_free_candidate_plugins':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/plugin.c:436:(.text+0x908): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-plugin.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `plugin_candidate_free' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/plugin.c:436:(.text+0xd9c): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-reloc.o:
> relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `path_resolver_resolve' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-reloc.o: in function `path_resolver_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/reloc.c:151:(.text+0x1d8): dangerous relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-scratch-
> buffers.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `scratch_buffers_register_stats' which may bind externally can not
> be used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-scratch-buffers.o: in function `scratch_buffers_global_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/scratch-buffers.c:325:(.text+0x644): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> tlscontext.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tls_session_verify_callback' which may bind externally can not be
> used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-tlscontext.o: in function `tls_context_setup_verify_mode':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/tlscontext.c:444:(.text+0xc54): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/.libs/lib_libsyslog_ng_la-
> tlscontext.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tls_session_info_callback' which may bind externally can not be
> used when making a shared object; recompile with -fPIC
> > lib/.libs/lib_libsyslog_ng_la-tlscontext.o: in function `tls_session_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/tlscontext.c:349:(.text+0x10dc): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/scanner/xml-
> scanner/.libs/lib_libsyslog_ng_la-xml-scanner.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_xml_scanner_end_element'
> which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/scanner/xml-scanner/.libs/lib_libsyslog_ng_la-xml-scanner.o: in function `xml_scanner_parse':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/scanner/xml-scanner/xml-scanner.c:340:(.text+0x584): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/scanner/xml-
> scanner/.libs/lib_libsyslog_ng_la-xml-scanner.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `xml_scanner_start_element_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/scanner/xml-scanner/.libs/lib_libsyslog_ng_la-xml-scanner.o: in function `xml_scanner_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/scanner/xml-scanner/xml-scanner.c:365:(.text+0x674): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/scanner/xml-
> scanner/.libs/lib_libsyslog_ng_la-xml-scanner.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `xml_scanner_end_element_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/scanner/xml-scanner/xml-scanner.c:366:(.text+0x680): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/scanner/xml-
> scanner/.libs/lib_libsyslog_ng_la-xml-scanner.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `xml_scanner_text_method'
> which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/scanner/xml-scanner/xml-scanner.c:367:(.text+0x68c): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/scanner/xml-
> scanner/.libs/lib_libsyslog_ng_la-xml-scanner.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `xml_scanner_push_text_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/scanner/xml-scanner/xml-scanner.c:368:(.text+0x698): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/transport/.libs/lib_libsyslog_ng_la-logtransport.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_transport_free_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/transport/.libs/lib_libsyslog_ng_la-logtransport.o: in function `log_transport_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/transport/logtransport.c:46:(.text+0x6c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/transport/.libs/lib_libsyslog_ng_la-transport-file.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_transport_file_read_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/transport/.libs/lib_libsyslog_ng_la-transport-file.o: in function `log_transport_file_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/transport/transport-file.c:87:(.text+0x15c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/transport/.libs/lib_libsyslog_ng_la-transport-file.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_transport_file_write_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/transport/transport-file.c:88:(.text+0x168): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/transport/.libs/lib_libsyslog_ng_la-transport-file.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_transport_file_writev_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/transport/transport-file.c:89:(.text+0x174): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/transport/.libs/lib_libsyslog_ng_la-transport-pipe.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_transport_pipe_write_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/transport/.libs/lib_libsyslog_ng_la-transport-pipe.o: in function `log_transport_pipe_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/transport/transport-pipe.c:78:(.text+0x84): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/transport/.libs/lib_libsyslog_ng_la-transport-socket.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_transport_stream_socket_free_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/transport/.libs/lib_libsyslog_ng_la-transport-socket.o: in function `log_transport_stream_socket_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/transport/transport-socket.c:215:(.text+0x478): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-client.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_client_validate_options_method' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > lib/logproto/.libs/lib_libsyslog_ng_la-logproto-client.o: in function `log_proto_client_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-client.c:55:(.text+0x3c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-client.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_client_free_method' which may bind externally
> can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-client.c:56:(.text+0x4c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_server_validate_options_method' which may
> bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/logproto/.libs/lib_libsyslog_ng_la-logproto-server.o: in function `log_proto_server_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-server.c:141:(.text+0x15c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_server_free_method' which may bind externally
> can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-server.c:142:(.text+0x16c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-buffered-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_buffered_server_prepare' which may
> bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/logproto/.libs/lib_libsyslog_ng_la-logproto-buffered-server.o: in function `log_proto_buffered_server_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-buffered-server.c:951:(.text+0x167c): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-buffered-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_buffered_server_fetch' which may
> bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-buffered-server.c:952:(.text+0x168c): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-buffered-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_buffered_server_free_method' which
> may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-buffered-server.c:953:(.text+0x1698): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-buffered-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_buffered_server_restart_with_state'
> which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-buffered-server.c:955:(.text+0x16a4): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-buffered-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_proto_buffered_server_validate_options_method' which may bind externally can not be used when making a shared object; recompile
> with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-buffered-server.c:956:(.text+0x16b0): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-text-client.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_text_client_free' which may bind externally
> can not be used when making a shared object; recompile with -fPIC
> > lib/logproto/.libs/lib_libsyslog_ng_la-logproto-text-client.o: in function `log_proto_text_client_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-text-client.c:204:(.text+0x3c4): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-text-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_proto_text_server_free' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > lib/logproto/.libs/lib_libsyslog_ng_la-logproto-text-server.o: in function `log_proto_text_server_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-text-server.c:436:(.text+0x5c0): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-regexp-multiline-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_proto_prefix_garbage_multiline_get_offset_of_garbage' which may bind externally can not be used when making a shared object;
> recompile with -fPIC
> > lib/logproto/.libs/lib_libsyslog_ng_la-logproto-regexp-multiline-server.o: in function `log_proto_prefix_garbage_multiline_server_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-regexp-multiline-server.c:247:(.text+0x424): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logproto/.libs/lib_libsyslog_ng_la-
> logproto-regexp-multiline-server.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_proto_prefix_suffix_multiline_get_offset_of_garbage' which may bind externally can not be used when making a shared object;
> recompile with -fPIC
> > lib/logproto/.libs/lib_libsyslog_ng_la-logproto-regexp-multiline-server.o: in function `log_proto_prefix_suffix_multiline_server_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logproto/logproto-regexp-multiline-server.c:260:(.text+0x4a0): dangerous
> relocation: unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/parser/.libs/lib_libsyslog_ng_la-
> parser-expr.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_parser_init_method' which may bind externally can not be
> used when making a shared object; recompile with -fPIC
> > lib/parser/.libs/lib_libsyslog_ng_la-parser-expr.o: in function `log_parser_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/parser/parser-expr.c:151:(.text+0x6b4): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/parser/.libs/lib_libsyslog_ng_la-
> parser-expr.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_parser_free_method' which may bind externally can not be
> used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/parser/parser-expr.c:153:(.text+0x6cc): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-expr.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_free_method' which may bind externally can not
> be used when making a shared object; recompile with -fPIC
> > lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-expr.o: in function `log_rewrite_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-expr.c:93:(.text+0x46c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-expr.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_init_method' which may bind externally can not
> be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-expr.c:95:(.text+0x484): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-set.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_set_init_method' which may bind externally can
> not be used when making a shared object; recompile with -fPIC
> > lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set.o: in function `log_rewrite_set_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-set.c:110:(.text+0x180): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-subst.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_subst_free' which may bind externally can not be
> used when making a shared object; recompile with -fPIC
> > lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-subst.o: in function `log_rewrite_subst_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-subst.c:145:(.text+0x4b8): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-subst.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_subst_process' which may bind externally can not
> be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-subst.c:147:(.text+0x4d0): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-groupset.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_groupset_free' which may bind externally can
> not be used when making a shared object; recompile with -fPIC
> > lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-groupset.o: in function `log_rewrite_groupset_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-groupset.c:135:(.text+0x24c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-set-pri.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_set_pri_free' which may bind externally can not
> be used when making a shared object; recompile with -fPIC
> > lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set-pri.o: in function `log_rewrite_set_pri_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-set-pri.c:110:(.text+0x1f4): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-set-severity.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_set_severity_free' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set-severity.o: in function `log_rewrite_set_severity_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-set-severity.c:140:(.text+0x228): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/rewrite/.libs/lib_libsyslog_ng_la-
> rewrite-set-facility.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_rewrite_set_facility_free' which may bind externally
> can not be used when making a shared object; recompile with -fPIC
> > lib/rewrite/.libs/lib_libsyslog_ng_la-rewrite-set-facility.o: in function `log_rewrite_set_facility_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/rewrite/rewrite-set-facility.c:139:(.text+0x21c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/stats/.libs/lib_libsyslog_ng_la-
> stats-cluster.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_types_equal' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/stats/.libs/lib_libsyslog_ng_la-stats-cluster.o: in function `stats_register_type':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/stats/stats-cluster.c:63:(.text+0x28): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/control/.libs/lib_libsyslog_ng_la-
> control-server-unix.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `control_connection_unix_free' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > lib/control/.libs/lib_libsyslog_ng_la-control-server-unix.o: in function `control_connection_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/control/control-server-unix.c:114:(.text+0x164): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/control/.libs/lib_libsyslog_ng_la-
> control-server-unix.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `control_connection_unix_read' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/control/control-server-unix.c:115:(.text+0x170): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/control/.libs/lib_libsyslog_ng_la-
> control-server-unix.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `control_connection_unix_write' which may bind
> externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/control/control-server-unix.c:116:(.text+0x17c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/control/.libs/lib_libsyslog_ng_la-
> control-server-unix.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `control_server_unix_free' which may bind externally
> can not be used when making a shared object; recompile with -fPIC
> > lib/control/.libs/lib_libsyslog_ng_la-control-server-unix.o: in function `control_server_new':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/control/control-server-unix.c:225:(.text+0x430): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logmsg/.libs/lib_libsyslog_ng_la-
> logmsg.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_msg_append_tags_callback' which may bind externally can not
> be used when making a shared object; recompile with -fPIC
> > lib/logmsg/.libs/lib_libsyslog_ng_la-logmsg.o: in function `log_msg_print_tags':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logmsg/logmsg.c:1087:(.text+0x1da4): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/logmsg/.libs/lib_libsyslog_ng_la-
> tags.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `log_tags_reinit_stats' which may bind externally can not be used when
> making a shared object; recompile with -fPIC
> > lib/logmsg/.libs/lib_libsyslog_ng_la-tags.o: in function `log_tags_global_init':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logmsg/tags.c:204:(.text+0x4ac): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld: lib/timeutils/.libs/lib_libsyslog_ng_la-
> cache.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `invalidate_cached_time' which may bind externally can not be used
> when making a shared object; recompile with -fPIC
> > lib/timeutils/.libs/lib_libsyslog_ng_la-cache.o: in function `cached_g_current_time':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/timeutils/cache.c:230:(.text+0x220): dangerous relocation: unsupported
> relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrsourcedrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_source_driver_init_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrsourcedrv.o: in function `log_threaded_source_driver_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrsource/logthrsourcedrv.c:374:(.text+0x724): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrsourcedrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_source_driver_deinit_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrsource/logthrsourcedrv.c:375:(.text+0x730): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrsourcedrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_source_driver_free_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrsource/logthrsourcedrv.c:376:(.text+0x73c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrsourcedrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_source_driver_start_worker' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrsource/logthrsourcedrv.c:377:(.text+0x748): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrfetcherdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_fetcher_driver_init_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrfetcherdrv.o: in function `log_threaded_fetcher_driver_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrsource/logthrfetcherdrv.c:365:(.text+0x728): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrfetcherdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_fetcher_driver_deinit_method' which may bind externally can not be used when making a shared object; recompile with -
> fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrsource/logthrfetcherdrv.c:366:(.text+0x734): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrsource/.libs/lib_libsyslog_ng_la-logthrfetcherdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_fetcher_driver_free_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrsource/logthrfetcherdrv.c:367:(.text+0x740): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_dest_worker_init_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: in function `log_threaded_dest_worker_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrdest/logthrdestdrv.c:814:(.text+0x1630): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_dest_worker_deinit_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrdest/logthrdestdrv.c:815:(.text+0x163c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_dest_worker_free_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrdest/logthrdestdrv.c:816:(.text+0x1648): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_dest_driver_init_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: in function `log_threaded_dest_driver_init_instance':
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrdest/logthrdestdrv.c:1147:(.text+0x1950): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_dest_driver_deinit_method' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrdest/logthrdestdrv.c:1148:(.text+0x195c): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_dest_driver_free' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrdest/logthrdestdrv.c:1150:(.text+0x1974): dangerous relocation:
> unsupported relocation
> > /tools/aarch64-linux-gnu/bin/../lib/gcc/aarch64-linux-gnu/8.3.0/../../../../aarch64-linux-gnu/bin/ld:
> lib/logthrdest/.libs/lib_libsyslog_ng_la-logthrdestdrv.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol
> `log_threaded_dest_driver_start_workers' which may bind externally can not be used when making a shared object; recompile with -fPIC
> > /home/user/work/buildroot/output/build/syslog-ng-3.33.1/lib/logthrdest/logthrdestdrv.c:1151:(.text+0x1980): dangerous relocation:
> unsupported relocation
> > collect2: error: ld returned 1 exit status
> > Makefile:10601: recipe for target 'lib/libsyslog-ng.la' failed
> > make[4]: *** [lib/libsyslog-ng.la] Error 1
>
> I think we can selectively quote part of the error. We don't need the
> whole thing.

Ok, will do that

> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> > ---
> >  package/syslog-ng/syslog-ng.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
> > index 765e886b12..bc153472bd 100644
> > --- a/package/syslog-ng/syslog-ng.mk
> > +++ b/package/syslog-ng/syslog-ng.mk
> > @@ -106,6 +106,12 @@ else
> >  SYSLOG_NG_CONF_OPTS += --disable-afsnmp
> >  endif
> >
> > +ifeq ($(BR2_PIC_PIE),y)
> > +SYSLOG_NG_CFLAGS += -fPIC
> > +SYSLOG_NG_CXXFLAGS += -fPIC
> > +SYSLOG_NG_CONF_OPTS += CFLAGS="$(SYSLOG_NG_CFLAGS)" CXXFLAGS="$(SYSLOG_NG_CXXFLAGS)"
> > +endif
> > +
>
> I don't think -fPIC will do any harm on non PIE systems looking at
> other examples I think the following would be better
>
> SYSLOG_NG_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"

Thanks, I'll send a v2

> >  define SYSLOG_NG_INSTALL_INIT_SYSV
> >         $(INSTALL) -m 0755 -D package/syslog-ng/S01syslog-ng \
> >                 $(TARGET_DIR)/etc/init.d/S01syslog-ng
> > --
> > 2.25.1
> >
> > ###########################################################################
> > This email is confidential and may contain information subject to legal
> > privilege.  If you are not the intended recipient please advise us of our
> > error by return e-mail then delete this email and any attached files.
> > You may not copy, disclose or use the contents in any way.
> >
> > The views expressed in this email may not be those of Gallagher Group
> > Ltd or subsidiary companies thereof.
> > ###########################################################################
________________________________
 This email is confidential and may contain information subject to legal privilege. If you are not the intended recipient please advise us of our error by return e-mail then delete this email and any attached files. You may not copy, disclose or use the contents in any way. The views expressed in this email may not be those of Gallagher Group Ltd or subsidiary companies thereof.
________________________________
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
