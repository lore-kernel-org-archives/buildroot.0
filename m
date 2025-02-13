Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4F6C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 13:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5EB261AEE;
	Thu, 13 Feb 2025 13:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bfusl4id5sq; Thu, 13 Feb 2025 13:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A5961AF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A5961AF5;
	Thu, 13 Feb 2025 13:22:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF051199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 13:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D947A40B89
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 13:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-SJQUefdx6T for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 13:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.153.141;
 helo=esa3.hgst.iphmx.com; envelope-from=prvs=132eb5c0e=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9371040B88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9371040B88
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9371040B88
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 13:22:01 +0000 (UTC)
X-CSE-ConnectionGUID: Ej2A2aGrRP2bhQ9KTHUQVA==
X-CSE-MsgGUID: 7wlVH2mHQIS2vJCExJCW8Q==
X-IronPort-AV: E=Sophos;i="6.13,282,1732550400"; d="scan'208";a="38354697"
Received: from mail-centralusazlp17010007.outbound.protection.outlook.com
 (HELO DM1PR04CU001.outbound.protection.outlook.com) ([40.93.13.7])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2025 21:21:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi+gOrCMiPIXok1f5HOYbUhRZGqhgA/BbS/MmNOlbQkRpj39rH0C+0JPmjJnDl/zgEEOPsgoLBgfltaTjxfm+MpBgwBuphvNiP/pbrXOwh/bQtALXfIkWZgQMUNUNEs2v7HzJe/kv3p0hRgZzOa/cUMLzL1LmmWqFWQEJCq3IBLqDEBMge9wANdlScIejFMseJZdhH5345n0KNPlvMd6A1SKasu4bpuMhR0cOzgFK3lJGYG2Wbw8UkTTz9MpAl15XvENAB/ubxynQBVV8N7raX+saxpVypUokg/E9n7RYrVBRQq9/3nMQLOjzlM3ij0A2KJBDr6OGe3kI5bghN86bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4vA5H2dKdrq8NfuetJPFshHNzmovbbRnf3velrzjbA=;
 b=jAjxCEB6VNk2hzYVunVxVtSzF89JjyG/Sr1R8EZVuovW1/VGMmV90yxKtQShAK+K5mzwBjBn50+oGYdQZEmyOto/H7RQGkIwYQlWTfu9eETkP651+LN1cm9tsrVWDMCu8IthgZtZfiKgdm2ua0s9AZmHxTMr6UEFdvPF7G1MAthw87ABelKqxfKxACSax+EFrFNZPzIsXqwrhpzSb0sVJwD7U3CaYFcTjVt6uFfoWEkV/yaLINTPfgOuZmqc/J/yV1i3bicCoJKHY/ohNq5KRdT3eQfnPxlcWrixBOiJLScCf/hzqw3w1+j59HN8wNJuVccNrSoNM59kATp1XQTfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by SA6PR04MB9352.namprd04.prod.outlook.com (2603:10b6:806:436::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 13:21:56 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%6]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 13:21:56 +0000
To: Sergey Matyukevich <geomatsi@gmail.com>
Thread-Topic: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
Thread-Index: AQHbebXByDphiZZjDkuvK0zh3v9qA7NA8gaAgAAci4CAA+a0gIAAS9CA
Date: Thu, 13 Feb 2025 13:21:56 +0000
Message-ID: <Z63x80LJFWR9ShPV@ryzen>
References: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
 <96b69abb843dc7292777c64f6787f134@free.fr>
 <a023971c7c8bfa4826a9a8721500c7ff@free.fr> <Z62yW6nlzZw2OlpB@curiosity>
In-Reply-To: <Z62yW6nlzZw2OlpB@curiosity>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|SA6PR04MB9352:EE_
x-ms-office365-filtering-correlation-id: c0b46377-ce09-44c5-f840-08dd4c3163b1
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DYPo3A30uw6GdZyhs51Vj8WTxOSTot8AWPN845OCFp7djscPk6foFD26S6PI?=
 =?us-ascii?Q?F3IzVMvgcTtI6PqP6q/bg2tdhNpyrSF1T99oA8nz3RRi1NopM4UYfZofwLeb?=
 =?us-ascii?Q?H60h5R2OsWZzfSSfTGG1vie1Ck2nDarhJCvREyxkKF2JXf8rkF1pAU6QN3Ig?=
 =?us-ascii?Q?842mg1ntUSFd03XvOSSGdnWMKbHLcj8g4SogxHv4X+6sqTVJOfvbcJxKVdp/?=
 =?us-ascii?Q?eNA41Q+hUr4SIc/vqQqpIAqcBWAwVMBYll03toDq0akluKY77aizgdQdQYFN?=
 =?us-ascii?Q?JiCBgYHDvjnfHDZmxtXMeFb1yvfYLFEKDNblZSnOWIsyq/tnAtfc3SJXDubQ?=
 =?us-ascii?Q?jpxfpf78d8v0uDny+ZAxvYLux3vEUuB8kV4E8u1s7cce16/J7OhVhuPTOoCC?=
 =?us-ascii?Q?wHj+NkM+bH1LT8kjRh7ekxStamqAkSgeph5XxdlDQxhTvjHThhjJM50A6MyS?=
 =?us-ascii?Q?9ATdP75gnGPTzLYTxnclKcSUot6A5fGu6CEkXuK6o6bai7oxDgaifR5njl31?=
 =?us-ascii?Q?jJPHUfoDWmoTQlOXd5hWBljn8p5jd8IpYiqrQOGBaBlaT7O+f1YuW+2ZE5pg?=
 =?us-ascii?Q?LXqUMnjyOu7nZZxhfcVmkq/bUW4JmSoOph0kZ3kuS2Dn/2OisXHZX0rqZxQT?=
 =?us-ascii?Q?3zqFSvDGVMfMNnaLQhs25hTZxgo0nNll9eazcY1zKaqgVFTnauG5XLY3H3C2?=
 =?us-ascii?Q?Rm03xjAz7CP9zknEbPQgzSsdsup/v2OM1sB4bmXs7x3e6h6WWsblKN74w6Fs?=
 =?us-ascii?Q?7obsDKaz/J6DYLnKS5Nx1+5+XFVW4I5gqgut9qPfynWtuzWEgQB8kzWYdAzG?=
 =?us-ascii?Q?479MMHOe+OFqPihpjSBd0/BO6T2BN/nw8Brjzu+GO4Uqwe61Vy3ZXzuCpHMt?=
 =?us-ascii?Q?VzcXf/rXCIaRNpbMoviKK98jzK49uzr55u8zRbxlgZHtHmSP8Vq4xiFFkFtG?=
 =?us-ascii?Q?qJkD3AdIbBFCtEdClR/zCoj4czxzTD7DmBMssY1hyCnC7PVwQrxISevaE5Lt?=
 =?us-ascii?Q?xx150Gpprjn7Sw2ACOu/xgfx4Aw3osXeMuU4r+BAkpynV1Rbb6pHvhQ1p3nv?=
 =?us-ascii?Q?WkfPFgJQG35XcDow3vDj2Gpp2TV4dfkSN+E4yG/oCWIYbPr88FnOq19MJyTF?=
 =?us-ascii?Q?FByK93yBnjOYA1HZNJZJnynf9EYLHLPYugNfj1T03EF6PyxhkDXgeLFC/rLz?=
 =?us-ascii?Q?IhG0KJJFTj+Ij5vwsuLb+ROtzJ6BX7q18pbDopY/Vp1wG7Z8m39QHHoG2Vpg?=
 =?us-ascii?Q?cuyHRMcYdZbnwT+baFXpovrdHHGdUbKKH4FHv77vAPWv/f2TrflM20I0wE4Q?=
 =?us-ascii?Q?pN7qtU5hEMRZxt0bhbRNJMgHWWZpAXnvdr11ElH/iSuNDXIZn4CbAmWiqZI4?=
 =?us-ascii?Q?yM8GQAQikaMkTq+TY4kne1z6dHHKo7VoDh/lINNgZBYqMq3dDQunVC1Dq6fr?=
 =?us-ascii?Q?zjaNZw/N0ig=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DhNjQLWz1zbamTeGSdUoMweJmvQGiwGevc9k3mx0fDW+nd+WPMQ5KGQLPI3y?=
 =?us-ascii?Q?jnMakLE3LXrQVAwtkxhRs1kJs8zpe8DITOzrOaiIKK9aV6EmI44ojVaMqqBm?=
 =?us-ascii?Q?E2nYKTizSzbiKAR23JTJe8apPic9oR1E4xNpHNflp2Qt7hMjOKxqenakUPyz?=
 =?us-ascii?Q?9q/ukSZc7yfL9mSBhj/m3pcS0/dQCSTh0MjW7gW+qRP/8sdfa/syNJ7YdTVh?=
 =?us-ascii?Q?uRBDAy1n9hhYzQ/ttwzPhT5G3jjagIqWGS9G9KaYagg6bo3I8tqH8GeXaBX2?=
 =?us-ascii?Q?9Hu+JZ/TgTinrBdzSQsJGtPIcmtXIINTMQDFt49pR8sP0b71BIvNlHdB46BS?=
 =?us-ascii?Q?3izmmWNRH0V0I6r+kAZggCD6cdtosaP6cpvR2B/+e+ASOFZnb5yeNoonJYIY?=
 =?us-ascii?Q?4nY7pJEPq6Y8Wc898ix5H9O5HU5P55Q+OkgCGNDsF73nR9j3Y/2Etf8IQzU/?=
 =?us-ascii?Q?XpGMuo8LHpPCi2vSU6RT1YWbS89LoECQStVkXLAOgxbw3JaGTIxHg84AUdBD?=
 =?us-ascii?Q?ltFK6BiE+JV7eK+hCHS4Q2yxZ1/bxZ/pRdy/QZgyMMq2IZgdK1fZ0jjqKZB6?=
 =?us-ascii?Q?0a67jbFNzFJsQsUroszfZdOO+kSguch3Bi0RzvF8FvF0DldqTqv2dmbfWJC5?=
 =?us-ascii?Q?AOMsqORVbKJj3zOmNqogObbZAw2teTBC+5SGAD6qVXuXXnF+SNNu5AxfAUVs?=
 =?us-ascii?Q?wKvvLdDBH6vGWsJWREtbnnVeMvgW1m0639zOB5zZiASI3ylBvoZ3xDoGF2U/?=
 =?us-ascii?Q?a+Adf2DiPncMEiPTZNLpyK7Ua10/e6g3X/JqeRQb2SZGyxl0VR6VApXmCVMD?=
 =?us-ascii?Q?hBlEahpWlmG9CdImedy6UYgWij0qmIF+/zsXiMNqTL9H+/oyo2w/WAoObvxE?=
 =?us-ascii?Q?G82w9uKsM9XWR6pd8/cvPbWZunW0wMfmFrR8e+iuD3vkn0lfhMnJIgelHftN?=
 =?us-ascii?Q?DlQH0ONi3vooChHxSnM9vh5ysC3K3WZp2QlMkIHEwcktjGIsTt7BPATZimiw?=
 =?us-ascii?Q?T5r7/ceskqYY5vCBoHXndoxOD7Pd/Jhg5D8BZ0ZCrpKTwkdHcRNWF5S+7tMQ?=
 =?us-ascii?Q?tex2hRtOG3feRAUzew6zRpJjkw++nOy4xjHv3GQE5cVptx2YLIHSf2AJQ+tb?=
 =?us-ascii?Q?ETpQouxQEKe8qGI4k7//0wYYNlED9sFNBzYiedUez9BiVo1+Rm62VCET8e+j?=
 =?us-ascii?Q?JMRATvefBYp2cdvn1aatUnWTK7YBOnHH4DaVA4jPwe8Fdhlze3V1WS7KGfo7?=
 =?us-ascii?Q?D94mnzoZa1gVsqhFNiaK9ihr+7RcYTE63YAfK2Xy8GGta6BHLJqDcqBEdIOP?=
 =?us-ascii?Q?oWQ+VbdnabR3mIS+gTQC0RxBrrbeElMItpTTf6C+KRdAxBsovwrE0MdyvvQb?=
 =?us-ascii?Q?11WrQa3JtDsirgdpL4x3YnAPaSj+GA18dx32dQkbbG/fZMpJ2brVNaYiSv2Q?=
 =?us-ascii?Q?nSAViQHwIk3qiPdQyjYNItR8O57pcH/didslzUsjsyRM13nnQqyOtuENSSZw?=
 =?us-ascii?Q?UfjSUBOsf6iKe4u4Tc9Uwb9dURfCORiM+ESjXhx8b+/p6XwMZ2hVMXZeaDy4?=
 =?us-ascii?Q?BK5pvOXJi/UKl8eDt3HP73q7Ai0+NEiSGA/ubEbdmt/EovgIRzoBWrSHNZJ+?=
 =?us-ascii?Q?lA=3D=3D?=
Content-ID: <52695C8D118715449E1090621C707D29@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +NVmlyjNjsLmixzVJXlngyUmebihfEOyEGKEZlWe8LqrvWGx+ReyrkeqdFfpN5ckEqetvJnpC2oBxFSVi8ntFRL6bgsaWScMr9U70+tQ9bxIwEQdRS5IYd92AsUxOzOzBYMpa0yUBdA2K9l1kQ6t5m01rH+HEXH5gagcl0RbrTFciw4sbRj2Dp3a6nMZIMMRzQyLmtB6MqpTD9vdPILkeMgr+8Iv3h8d2lnkYSQYVO19VbamZQINJsr3SgFzOx9VYv9hwfKixrznSAaBxWH1jafMEOTckVrDBpgeh79809WldAHYIqLnYu3FPo3k/f7syzpXPPMSw9v5/cBgm5utWlpL6AvrNIqOkbB+07yg76IfseSQRx5ekYXqFLpzTqYuxbmJuKjo7GLcJLphstW0aabACL/8kjwCpkG9TT9QAZEEwTT+inZj/FOjEJnI+G6ONPg8GrNokpExnz3QFASteAyh9jZmk/YFMbmgm6UD9mKyr3Y2xCc7n6+eRGb1l4O/8RxlDSdBJUlB/OA2AeZlIwMCWSKzjIg4Qv5ga2JYuWF/xAvKvZxjIxhXRPxDyXMYUyXH9ozV4X+zxEg1MS7T82I4fu7PgCMO9ZDcStBE7oOCL/ocGZGjEpBiZ8fh+8pS
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b46377-ce09-44c5-f840-08dd4c3163b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 13:21:56.5944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ue37V5v5w2BwyPtyZBHFNSSIFxm1Cr3At5RA66Syh9bijx0ysB/kBMDIUFGTUwj7bAaUc2zXxFlcuQeBfFES1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR04MB9352
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739452922; x=1770988922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=S4vA5H2dKdrq8NfuetJPFshHNzmovbbRnf3velrzjbA=;
 b=gtvVE9yjIAT1YkYYG7fLjcz+xn1cE/Ld1oPSM2Jh5rzRUJtdEIhq+S1L
 rBid4I6fdqnF47lwHcPx6OX0OJZDV+4/GnPWl+tkyBW8Nlbl7TMZD/qXX
 ubxqDmCOMJ8+mEWuq9fmYxRiKhPyszu4mS9PFHQs2v8QfwRNQ1pP8FFWS
 YzmiFwTtxPN8PUdNNiNUq/nK0CB5eUdBUZzlt8lpFXyTrxd6pM/dU444e
 RugsFyHyBefmjXFgxp5rUmV7jREYgVY4AEYHg8GUL6KBdf/EveatnOUPF
 f7jyc8BxKrSWcVGd0iGRPcssPrlnLnRkQ6cKpTRyIlKUyrt9VHVZ54W1c
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4vA5H2dKdrq8NfuetJPFshHNzmovbbRnf3velrzjbA=;
 b=BO185sj/6ZBA2RiHoKABKUUtjnNt0PvM3oeW5Z/yhxGJEkVhOxDICMgmah/e6oGzWPLm7fshUCRtG5koF3FW+weeCpqT3XkTUrOEXARSiCC3Jv7+8+NtcUdZal0IUGj3i0gkSurUMNb8SopAnrGSqYzb/Q1LMciJtft1t6YZgqo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=gtvVE9yj; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=BO185sj/
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Julien Olivain <ju.o@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "linux-amarula@amarulasolutions.com" <linux-amarula@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Thu, Feb 13, 2025 at 11:50:35AM +0300, Sergey Matyukevich wrote:
> Hi Julien and all,
> 
> On Mon, Feb 10, 2025 at 10:16:05PM +0100, Julien Olivain wrote:
> > Hi Dario, All,
> > 
> > On 10/02/2025 20:33, Julien Olivain wrote:
> > > Maybe we could introduce a new u-boot Kconfig option string such as:
> > > BR2_TARGET_UBOOT_SCP_FIRMWARE and properly set the u-boot SCP
> > > variable to this value (and set it to /dev/null if empty).
> > 
> > After quickly testing, it seems u-boot and binman can take
> > an empty string without failing. So there is no need to
> > set it to /dev/null if empty. So if a new Kconfig is added
> > with an empty default value, just adding
> > "SCP=$(BR2_TARGET_UBOOT_SCP_FIRMWARE)" in UBOOT_MAKE_OPTS
> > should be fine.
> 
> Am I correct assuming that there will be no generic fix and
> the recommended solution is to add the following line to all
> the impacted configs:
> - BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"

I think that Dario is working on a patch:
https://lore.kernel.org/buildroot/87frkjyma6.fsf@dell.be.48ers.dk/T/#m7f5f85f0cdb2468c78512d34ade8703595921047

However, Peter had some comments, so maybe Dario will send a v2?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
