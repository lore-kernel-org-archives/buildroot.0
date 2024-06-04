Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BBAC25B7E
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 08:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F71B607E9;
	Tue,  4 Jun 2024 08:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Stg3CKlGSIw; Tue,  4 Jun 2024 08:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C340607FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C340607FA;
	Tue,  4 Jun 2024 08:19:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2396A1BF23C
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 08:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B8B081A46
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 08:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBWwJCo4JW8s for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 08:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E02C38188B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E02C38188B
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E02C38188B
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 08:19:32 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 04 Jun 2024 10:19:30 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 3AEE3B5AC9
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 10:19:30 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id CC2B5B5ACC
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 10:19:19 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Tue, 4 Jun
 2024 10:19:19 +0200
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.168)
 by stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Tue, 4 Jun 2024 10:19:19 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dd7p7A6FUth9QrB2fx6oQFJFrtHlNoGqcOoiNsw/F/pICFnuKZCbdgTG8PpzPaCJxUnfDL7BWnHzML8LjIkKBFD1hEl8J8LOhRtQTL+/bT1lSJSiXxvr7E0pPVhR/eEaGTf2qx/Bvf894i/4C8jNDuAtPmtkVBgUg9Q4ymaEOXryPUGS6YUrg3qX6arNgGonTRktqWqTJu++2o80kG1fokVaO3YS7T//zBHRX+fsJ/5ZukIRzmPZUE1iUmCgqU8ShWrGws2RKGFpP9iHHcI4uR5vtv2KLeVXpkN2StxgqhL8ucE5xqM+LYvQbQHY6ZnFC2TVRCKEgUS+bT2pl/F4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2oS7NPfo/78Ni4A2lmCafdnW4YZLnbP0F7+UBpdduc=;
 b=bSbN4gRaN/mL2FcVm0b4IzxLP+XjKZXUlYtE6eMGdcLf6lZ8FOhZoyxMV4vn1jUtlq4yUL2EFENec+OkalHaDDk+Qx6QUX/ecf/dTp5sSUWfCDMhleYw1Iu78qm8lm3Db/d8PziBv7gt07Ayl/c7HfVhP0gVeb2rMDvkNxgfbVlRFn/NQx6Q0Qo4n0777ckqT7YKKax1oSIlaBhKwF2E0GEwp49zJ3EOUPdEivJsXQ9Q4mr6Mt2PT/1HFn6wt9GjW+VxH1YzLOdLbDujcbYQHR2UlnPdvi3Pt09vlPXPp8F74+JFeIgkwxeD94YmBGrqDRMMVKZcwBzD0lYx0M2iuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by DB9P250MB0476.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:33b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 08:19:10 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7611.025; Tue, 4 Jun 2024
 08:19:10 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v2] package/libzenoh-c: add GLIBC and aarch64, x86_64 and
 arm dependencies
Thread-Index: Adq2V7SeH3gwrZqnTSudxJNxU7QHNw==
Date: Tue, 4 Jun 2024 08:19:10 +0000
Message-ID: <AS1P250MB0608E0ED4F12B037E2A86AE8A9F82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|DB9P250MB0476:EE_
x-ms-office365-filtering-correlation-id: de973ddb-b150-4d40-33eb-08dc846f02fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?NTmi+TrJ4Q50na81hBG5++R8n2wHlMxyqN/loIA0BsIiM032ftpuscNPiDQh?=
 =?us-ascii?Q?Jzl7gDqdoQYdiUDbvyFrqR+STqbzl6LyReDKl4MVd1+IGXdwk1muMB6LROFr?=
 =?us-ascii?Q?lgIJPJMZb32IUVedazh0k1Q8A93ApjujVXYxKpPkqStQSJSOJvaEyL8tncnK?=
 =?us-ascii?Q?b754sDjRDy4uYE1UlZsACYNCkaLoyf5POdmr6ZIUsj5aFkOLOWLGLluh0hew?=
 =?us-ascii?Q?Io7FynxtNe0mNYiaqUAnx6UaPMFVN7KvUy/5jfVhT1ID1fDVvKSJrKnE4+sb?=
 =?us-ascii?Q?9nJMx3arvuyQooCy/ttYcfgPCYY39gtu4uTNooYZvUpIo42O/YjGl37RKheO?=
 =?us-ascii?Q?anUG4AxAX9bLf6//ob3zFu103bTCiF7mT0pqX7nWL7fW3EYMGzpV5HC/X7XW?=
 =?us-ascii?Q?kF/TmA8vgoWGqv82JN8n+owdNquKnXDXdrgpzINafYaCByZsqaf29fidrZEl?=
 =?us-ascii?Q?qyFfKZYmJvIRh7lFY1m/vNPvphJjGNHJAxwIcAS8dtavhzPmtdRhCU23FQQ7?=
 =?us-ascii?Q?tqnJ1p7AhmPTxg4Kl/XjaCqTMp+YGdQ35APQNB55Ojz6dtPEi2MabjiwQvbo?=
 =?us-ascii?Q?KFW/7+AfJ9uJE2BOLN2Y1shvRjDk3OFnaVn+Xym4+IZcQOGru2S69XrIH3hR?=
 =?us-ascii?Q?TR+gSR9i/ZdPRkm7vAele+n77TGn2rn17KgeePdPG1VO+s1ZEdH25kcpKXa4?=
 =?us-ascii?Q?SjB18snzDRc2mZpNb7Jw+9S5w9yqPiQhFGQNyn8xe2O9DvJKqvYoBQk+RH5J?=
 =?us-ascii?Q?J/crBR7hCft3QVPc+zqz0bGG0VCaldkOFI0+ly1vLLryMLVfLsLq+8d+JGUC?=
 =?us-ascii?Q?t7w0X9hg45uF/Kl6r2/AV2JWBAFZsdFC+RVJIen4xtHobuHIDjakSX/p1J3r?=
 =?us-ascii?Q?XEg5mCnC5ewMG5SFZczCfxEXzDPgVS4yYrND3PGCpMfg2MpDKB4q7MyXiihA?=
 =?us-ascii?Q?g1KN/MersH6h+1n+1zmvKQw7DtglILz6HchW79Zcs7UjOhsR4Yg8SW3WaHtU?=
 =?us-ascii?Q?te0dWmrPtM4MANjIh7Fs98MIShy5Eny6XqNmWFgjF8pzqWRAj0S6u+f2pE77?=
 =?us-ascii?Q?SnJFb/iY1519k76pK6iR45YAojEwhDSKX8k7GBQiZ4IkDaOVwqcb8dOxPvu3?=
 =?us-ascii?Q?VoRneVSHYKLbFpmZ553Ebt+7fAcgYVJ9w01uX1gTIkyDUazFOM8Cp6AQZxZt?=
 =?us-ascii?Q?ecg2DFbCKrsuKWCO5XisCjmXqC05UcAvRPjc2ww22dJRnDGrGmNGk5XNVKpJ?=
 =?us-ascii?Q?mHay36sK5RCZTqnxhPNcy0L+0ltfmiMUNRbbI079qA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uA+SRWugWR13ueufJbURjKCYJLcn91PsVFpQ+9tMvd5eiFjt7yXh1T/4JLf7?=
 =?us-ascii?Q?S9AgdBAcJmNR36DEthqxdACDybNbSNJaE2fS5CLcEEMOU+Pj4e2HT4x7jC8m?=
 =?us-ascii?Q?raCM0MgSrha6KKwvJr33iB/08mnFR7cdrvbu6uBAgp/xh+FzHIFpCMgnIfXi?=
 =?us-ascii?Q?1UqdZunruLoCrjEuIj9JUQdYqV4d7B7SBO8QickeLOyL0caxI0RMWNLGmwS1?=
 =?us-ascii?Q?w+XYxzN+cpTBrz57D9AEntANmz0SCihSA57E/aFIEKPIxgWZ0R6jiLsIruwF?=
 =?us-ascii?Q?ALyF2iSSS9GfclNuDIHa5nfOV6eizs2pynj/3lQIMeAAcAAl4R/6ZGG9yGCt?=
 =?us-ascii?Q?ezI31wiWP3sg7OY0KmyalPeE37jej1SkppoPJWEUKqny3XJJH/aPUShpDwcR?=
 =?us-ascii?Q?hdOkLDjLM6COX8hojWjJjLezyVy5421h/YlMfv+vIlTHnYNLRXMQI4VTTvlx?=
 =?us-ascii?Q?GwKsvuoYppFKUQO81DpzkzfHEkC8KPRS1N3jUMnWzXl9hQsyNxnD2VX2oml1?=
 =?us-ascii?Q?e4tk0SatuJpHlpPAdIwTHyAk9P4JlMIYf+HIE01R2c0xPxfijc4gc0o667GG?=
 =?us-ascii?Q?exCNwhFEoob7mas+yr5bCnJTV8vASJVNdHTbMqLVD06gbPC0O4UqHpjaZh6r?=
 =?us-ascii?Q?e0N6BFqAiei7EY3HSj3wZnTCfBV+2GtJYrB5jJvLAnK+YTu2yHPLvKIeOKqY?=
 =?us-ascii?Q?x3g3RQAwuOTBZp9vJrG75D+k1bMsR7iJE/4bciIHeYpwAz0lTIjGv8WYNndG?=
 =?us-ascii?Q?5P2cjwKNt/X9unhkDlNVRQpXPddx9+Q2BWZY3MKOD+4KDnX4z2C1ebo/HPaV?=
 =?us-ascii?Q?ukKDATfScincX62ALoiC15sgrVw1H3Us3F/ts4L/D/y5ix7FI7hV02rbQK+Z?=
 =?us-ascii?Q?2/PbArMto7bJuWigh5k6JSnVWiUT2bnarOs18g+PyKqdye8weaT4o92rbEo8?=
 =?us-ascii?Q?n9wjGR424RXk6Hq1ILSrl3kXF43REPl6d15O8hYGc6WUFatixspBRp0vfCOa?=
 =?us-ascii?Q?wJU2eaLoJvBDf8RS68boh8EGEDbU+QVDjiQZmsQ66Vpg4G3Nr+DlYpkb/8kl?=
 =?us-ascii?Q?We7e0iFbxYvpJsc4cVwOmhEFh1wbDR0O+6MbNfhJrTD3sRWVGR9uIP8lnXrZ?=
 =?us-ascii?Q?mV8DzmywUPXj07I4KPxZNQAruYdPEUbolWFmQf2fAiQEytkQCYZzX9en4ipm?=
 =?us-ascii?Q?B+lw9h/JzDPbmtVu+IJKqlKPT8nf3VyBriDCW9nTi9L8et1aMbkzYkjtkF57?=
 =?us-ascii?Q?sMC6Zrn2VWRmbGCvbzxpm8zF05CXh9Ta3sDw8TK7kFNMS6ySblzDzCobUpMY?=
 =?us-ascii?Q?Yj40IPdTLYNLlMjqvOsmSArFUPnKC8svMzdZh0vsVCw5hWBbeCAYDTRLiIKA?=
 =?us-ascii?Q?XuNS+T1Awf95wh9BWCFCrN0qnW8KMuuSi8SuLwT3wK63A6VjCkUNMZDBtJ4s?=
 =?us-ascii?Q?GhptJFz9LbZ1fl8DDV+AbCM4i45L68OSatcvFU/KqSNvcvv4ClUzSma9Kywt?=
 =?us-ascii?Q?tl8YTSznnoYJz5I5SgQwbZVx9RIk/m2xh1PBz5P+V/4ZnJ8mGyfsgK/XQ3AG?=
 =?us-ascii?Q?KJEviATFS4xRVhvAhHZJAjcZOL1fwlcspbX74SjsSsETQRBhwatSfTVaYuJN?=
 =?us-ascii?Q?pw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: El/U4gP2k2kIBBG4fJsChaD0fY+wxOq1N2v5GU7fSg2FFLigmlVp81l753CGvQMwSRzu7RTBe+nmf1eLOmoD1T/yRs9h8OPKJRiLqAZ0iCClu2as6Pxk1npo89fEG7IJsOYFdRCBeSkUXOIym0qg53KcbvywKmhI6p3EDQFaGEFAtnRLOV4SpE4kC2gtOBO8EQX8LQ2u5Hp679wSu7HMXF7wxw01omLltD4uEy3loqiU2MS8QH8Wag4cpBGJGc3/C6uJQOq6lOmF3UAog8laSGPaBUT8HHqGtBV0wdnmYCm8Kzknc1DrsZCSMqrbi/rGxv7oO8pA2I2uAmil3jJNFtwuJHqwxKFgGFgUfRre6K39c46UmVz9rZp/H+PIMactpE3pvghY+gfOKT1QfMqg1PMmflotjiD614+GM5Hy6ncnYDzJ/xEmX2Ikgpg1SkFDmHKbMnYq68NTlTbTcxQ8TeYJ4wIo26tcKVODJOrYC8VGIELZNw+q1R5coPN1yKQkbmsQi0lAX5K4Q3rhUPZIEHhjGvKQxhOJmCrw8BYeWnRFOBzex/cugaYDHX6tLmaOPSGaQ91/ksspKiBl9NSKGQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de973ddb-b150-4d40-33eb-08dc846f02fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 08:19:10.6169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xO+dak7+OsZEmY1CWMbcMteIfF5JhxAS/y7TaHfCwekT9cvl/3jE7Bgr0jKbzKTqRICu+p7AcTCOaVkKP8poNIyh2m+6a5t5YS6UaiTZKxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P250MB0476
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneOriginalCC: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2oS7NPfo/78Ni4A2lmCafdnW4YZLnbP0F7+UBpdduc=;
 b=lmF30wdsqXeJjr23LTSoHHzTHg/YE6dRWu2mUZ0Hx+vQUhoytBoYSxoRyXqsWY8CfEBJgSCHAIZd4jC7/KT1PONe2KwNmnDBqfeSV20Mxgr0U4CT2cn4QQDE6biHVfuVHp43bDDP28pFKf0j0lVA/bwmVYVsK2CiKq1IsUuFrOM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=lmF30wds
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: [Buildroot] [PATCH v2] package/libzenoh-c: add GLIBC and aarch64,
 x86_64 and arm dependencies
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
Cc: Michel Alex <Alex.Michel@wiedemann-group.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The manual of zenoh-c says that:

zenoh-c only have support for following targets:
aarch64-unknown-linux-gnu, x86_64-unknown-linux-gnu, arm-unknown-linux-gnueabi

This patch provides a blind option BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS,
which is default y for above architectures. Additionally adds a dependency on
GLIBC because one of the autobuilders had a problem with MUSL. Moved also the
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS from package's dependency
list to the BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS option.

Fixes:
http://autobuild.buildroot.net/results/680f25769526e5eef43d254a10a525b165846c75
http://autobuild.buildroot.net/results/31ed69cb2ffe8e9bc13a27c3fda16c27e9855b56
http://autobuild.buildroot.net/results/fdc74b8a42388b51cc4197c38b552559b97cbb8c
http://autobuild.buildroot.net/results/6e7ad53d44b417f6aa62acd8b2396720f5a14e82
http://autobuild.buildroot.net/results/c85927b1dd25a84981adc5cc537eb07d02da40bc
http://autobuild.buildroot.net/results/5389ac0174791b3d899fda7769b4f0f2dfeb805b
http://autobuild.buildroot.net/results/285bd8f5aa338dbaf9ac0e5f78593b10bd54cbb5

---
Changes v1 -> v2 (suggested by Yann E. MORIN):
  - dependency of the C library moved from _ARCH_SUPPORTS symbol to the
    package's dependency list
  - show comment if architecture is supported but the C library is not

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
---
 package/libzenoh-c/Config.in | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
index d22807c047..c0028bec6f 100644
--- a/package/libzenoh-c/Config.in
+++ b/package/libzenoh-c/Config.in
@@ -1,9 +1,21 @@
+config BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+
 config BR2_PACKAGE_LIBZENOH_C
 	bool "libzenoh-c"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  This package provides a C binding based on the main
 	  Zenoh implementation written in Rust.
 
 	  https://github.com/eclipse-zenoh/zenoh-c
+
+comment "libzenoh-c needs a glibc toolchain"
+	depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
