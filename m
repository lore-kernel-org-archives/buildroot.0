Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44313C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 04:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B4C6067F;
	Mon, 27 May 2024 04:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXuE0JZcog0Y; Mon, 27 May 2024 04:12:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D031606DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D031606DF;
	Mon, 27 May 2024 04:12:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6F81BF33F
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 04:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8781C40163
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 04:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0p_NgytOgJN for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 04:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2408::600;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0374C400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0374C400C7
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0374C400C7
 for <buildroot@buildroot.org>; Mon, 27 May 2024 04:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK7z6+xsONu/hcpyWJ1B0rN+izcOnSHLsxfKT7FCMFhEOA86OQV9KvoGKvL4VnH8BUmGQUTbIlEX3O3JtxXurkh96JNZnLbx6wkFz8mUW9LGY0LV3NuuYOHGVC+hCWuuWQszEvJ9Eiw/56I2jjeqlR2COsXyiM1ekxHpJOKU2UVBHgv6zZbbNI46XGqyO8ZxkIfKB8VPDSc4/pqwlDXzcadu2TrsF4CkUGkAcphnARJm1okgrrfO6ji91pk/bd24Rrr+xWg/UPrg+DPmOSfKSfdym+3vjC/ag2Ppbb55+8+tYgyqaZpGBNa046Xr5kvjTZX02NwscnzhFk4s+p3jqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSIpR5XH+r44UAAX6R4yqSY9jgZGFgKdy0I4MxF/iEg=;
 b=SJqgXPbDlgyufmGeU/6iciQQPj+C+1YGDtNDB0g+gpeMFtW7GKnhCsp0xVsq8MlOC4tNLX+lMGpUI/d2H1dEpEUhysVj2MJC/xHLW00Yjrd8DU4iNmmx3Zm1EhFSfu9/dZoXPiyRj5c4kLFjT581wSBZwp2N6JBismTPsclJTKEQU8GVl68zBWUj6AIpErKdyK9f8+Dtx1Hv3FIOWj9EadWpxyKYc5hFHoft0SlJ0tjWIpKKQTVvI6XJFVr7sAnThhqhzi9Ni0+Ah82nBNW7gDB55mvQ6gNFh+bEvvu8Xne3fzCNf0Mxd+WYJiVxE5AFyhwfJ4aGvu+xTssFIBE0GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.29; Mon, 27 May 2024 04:12:16 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 04:12:15 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] configs/zynq_*: add hashes
Thread-Index: AQHar60IXcgKulkKek6riPCT+rcphrGqeERg
Date: Mon, 27 May 2024 04:12:15 +0000
Message-ID: <CH2PR12MB5004DD9EB0582397B03C01C0F0F02@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240526204042.14587-1-brandon.maier@collins.com>
In-Reply-To: <20240526204042.14587-1-brandon.maier@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB5892:EE_
x-ms-office365-filtering-correlation-id: cde4d4b9-19c0-46f7-2ecc-08dc7e03312b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?1H58fCFUbD5qvuOBcOah470hPvqJu9lTc4lWiJU/OyY7nAVcNJ2A0kywmEdE?=
 =?us-ascii?Q?dF03X8U8Yi4GBv/R/j/a58tB+W0N31+dPHYtGq3SzGdnVfXp167yHxPkictj?=
 =?us-ascii?Q?xTvLBaRiiWaAS5IUMEGnQy6ak7fRRjGGcd1aBnSeLlE5gBgeCZEKM7r86iav?=
 =?us-ascii?Q?j4pi5cboTxzDwMn+0dogS0yjoTYrjDiBw4oaJfcGa+7VA6roMmbPJkLnXijY?=
 =?us-ascii?Q?u8Cf1mz78fk1FQpBARLnyKG/Z1w+ZaUp1ng3hWJSTGXtoJHVxAt2Hn+VEpC1?=
 =?us-ascii?Q?ph3n5TwmLaRkgAl1vldwv2CNTCPS/5bRH7Mq6BDLgXmiwI5NyxToYlF/fl5x?=
 =?us-ascii?Q?KPbvJa6vypBUi/qY0LkN7X2xgBG5WxVtJs3V+EjGbyqAOYVAyXCCMTmVmj7N?=
 =?us-ascii?Q?4lqBZ+T/H2DnlIBNHZZGcpvoDjPKlFCubCfbfgqfUdl1kTn9MfuEhd4PnSsx?=
 =?us-ascii?Q?V72qhcbvCrBc/lzFhpHykXqkqDaw2uGlfIXwydj7E15FdFp7Oy4o1yDx7OiL?=
 =?us-ascii?Q?Hm5V+85sw010EO/IkzexVYYtTla7/N00RvykCuRPSN3HkTFGpsZMyEiMJEaA?=
 =?us-ascii?Q?o4A4ChXpVrJbw2wRWAOvFCB66wsO9FZLNFayVlB/ye5Gvxfkw6C4mbGQuhEp?=
 =?us-ascii?Q?T44UxG49XGMP4bbALPTTWDethIupZXTnLfLM+iiIvug0OYQRuKf5GFSMzDLM?=
 =?us-ascii?Q?tExNb9QTPML9Z7yd7JKDBk6GMsgWdK4q3qWr7hRK86dMTSN43lKCBkXGuYTW?=
 =?us-ascii?Q?Y+VFXtpNXSok99cdqkUhEHH0yEus6DcVX0+OhnuruV0MfQDmtxFcsxpJlEpl?=
 =?us-ascii?Q?e/h0vJskxJxbxTceckKB/QMoq0Lo1+XZZ873SXPFfLluVf1PJVeh7nGNsWOB?=
 =?us-ascii?Q?EvujM1dUVB+e1tM1Mb/CLtvgOWoU9aiV6K4V0ARGuBUjhE+ROHPweLs9Hb8k?=
 =?us-ascii?Q?SuoD9ETNz/6ws3g+dtLwMOeNGaetiRwlYzV0WgJVEgT1BnLC/mDaKeYqmxor?=
 =?us-ascii?Q?xUEn7D0GkY8vE21RX7Z2JYOKXW7c4tGhLL8DBdg6zXZYJpzp/tjaDLgSwByT?=
 =?us-ascii?Q?1BpXNUc1YEhvTIiY2U547PkNmVfIUBfo8NM/+MhjlcIOtP46LwbOxeh1PJSm?=
 =?us-ascii?Q?HGRcnJV97n6ChmpSMHd0KCd4677QsNsc+p+rEODuUKx2/XLzNAWh0NgJwoLL?=
 =?us-ascii?Q?cghRu3cqVXrTaONCFM+3rLHkiKrW1cREam34WIghXQGFT7TmJAuM8q9JkfW+?=
 =?us-ascii?Q?QEnPxZ71IpL+UYu77AxyK5GMGrOUvanxFogvmz20cZjU2/JDM5IOxzZSeMWz?=
 =?us-ascii?Q?s0Nsz+fVsBGFiCUEs7hQ4mewpLWVJvYvyC53iyInufYfhQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M/l+RuVzQbrt07A8Gm7wRfVbRBYa69FMuKkmDXvnQ3YarVprIWmWVqEcWglx?=
 =?us-ascii?Q?vvxQZ9EEvmABf0gEl8ECNNMZlYmnohjeviwVBm8rx6L1wJAnTqlSQsDNx9c6?=
 =?us-ascii?Q?JKnV08aLde5nwhDrZJaQdDG6aEBGok+WXxZnU5v8zC3FaUwbGkmyFTofky01?=
 =?us-ascii?Q?VxGTWyMwPYayvFccR3xxnTHrbVfQzzfe8/MZXJRSUTARl8skNaWTrytFV8bm?=
 =?us-ascii?Q?KxEW/vPRXsuHhIaCi+bmCR/zwLth1DRiumsU5GXcWDjzFSkrqfMMPzmkX+0s?=
 =?us-ascii?Q?8bWFZJHn701u5aXNKgPpiv+L1tLXyyRGp0ymn2Gejr1MgXU5eS9/nOT5XtFj?=
 =?us-ascii?Q?WfjU88yn7Z/hcro4QuiLKraw6AU4DM8PC6h5R5NbrZKjc9BMjdwUzhgu4chx?=
 =?us-ascii?Q?zYoCLExp0HMCAtbyJ04xF+IPZ5FIdZnGcRFxxbxQVkz1tnrOhqQ5Wr6jBoT3?=
 =?us-ascii?Q?wX7upqIR3u9pVbX5x0yMhiRxY0q2da4L8wmz2dRMYiwmXlOB3h5rKf0lCIxo?=
 =?us-ascii?Q?gXAGcY6+3gUwOq1cfThXAm/vr/cVoYyzj1hLqO2hzpvdBd1cLrHSzSy+ZNmy?=
 =?us-ascii?Q?xSOcJeuiTLs+6j73VtVPEYB8WdkkRwNuKKexGjBiVeEJrXjDLsYVKPWUcD5Z?=
 =?us-ascii?Q?boLEbCLkKmeVq4c1xUYraLtYYwynHnuK0c3pYdgyX4fJSISkzY4HUEy1LVro?=
 =?us-ascii?Q?IimCRcXdFju/li2O13AY/fvboRJNXPGYz16N3gLwd2Fcmalj9gtPYkIFH9qN?=
 =?us-ascii?Q?12X0jkYtMLJrsblrj+x7f6pcUsaWh0bwm4Cs7WfdZOc8THKO0CO3yPvnux2o?=
 =?us-ascii?Q?IkOK3xep8TRILYVyPUQ8JU4tcAZ4wYJnMnyKn5xG2BS8TRkfn7RIgQfPOLBs?=
 =?us-ascii?Q?z+YtDxXHBl7AjsvHxhhnt2XYPvkFGopbWJ1qlo/PDe4e9oKlIC+0Qo3GU6pM?=
 =?us-ascii?Q?BGzh+dh6VJo7DG/it3mTmXH+1/fBY+nXi3EWuNTadiX3lLjCPWMgOzLesHgN?=
 =?us-ascii?Q?AklxwPpNmY2k+5fLWe6nlbxX5uWo72ELtq4d0al3UKgNdIX/ciuiqIrOU1uZ?=
 =?us-ascii?Q?VnbJZJrlSF6fXbl2ZbBIWWFrXR4JVuzHlc1GXaQY3njsOqmNt+4YEojVsiJl?=
 =?us-ascii?Q?j3nuEGkp3TkXutu/it+8YI8He742jDlvFRNjRjSlCr1wD1h8AKE/mCjXld9H?=
 =?us-ascii?Q?mqUWnBwvQlJ8K1cDVoyx0zOVQjMpSOl5uvDE5gctAXyaC1WkAjJOT2MjO52+?=
 =?us-ascii?Q?zJCJoGBTWO+tnqoU0965oe46LY77dxfb8PHWkU3hYwrcFJnS6wksCeU2tAVn?=
 =?us-ascii?Q?PkVZergk7rY2lhG0usvJXT1q/wwv/HbutKGEUsorJZDAsfTD93bLf2HnI41V?=
 =?us-ascii?Q?FcrbOksPzwtEmHrfyMnp3UwiZWlbdijJvtR9bCdRWcI+119df5VmisTyIq0N?=
 =?us-ascii?Q?8ARG8vONiP45TCicfNM0IAoVg450PrRGvsagiW5Rtvc5m+OTc2zuU2odTJl8?=
 =?us-ascii?Q?mq7/D+k9n8ZhEvvsDa4yipFfVdfAkvKr4I+zEMiqUlsDtL9MoCDVuFXwQ0f4?=
 =?us-ascii?Q?x98qM9UusYnbqoJrX5BMA0BIeVL2Ztc5xoxUVMxnIuwx8MTonPjHNuR3nlLM?=
 =?us-ascii?Q?u34/avwG0feKuh7KMQwZGKY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde4d4b9-19c0-46f7-2ecc-08dc7e03312b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 04:12:15.4285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/DYzjCLsBDKsEZHftksgEKMsceudvMQB+y8Ve/KrNqtgVIIv1Vvw7pwtwJTm0lX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSIpR5XH+r44UAAX6R4yqSY9jgZGFgKdy0I4MxF/iEg=;
 b=L4RxPAiJrRRRADJ9o+7L1wjUhoFv0iDV2fX27PxmXRvHmhr0piYmYfDtvOSDTHOdPoUb2AkOFAsymGyV2yF58D6viUdhk24CRjySi8Dz2zQCEOdNH+4O/eeGZWebzODs3FjWxzUHP3Z1AyI81v6nMNIhIAaoAqzPx9531nXfLUM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=L4RxPAiJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] configs/zynq_*: add hashes
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Reviewed-by: Neal Frager <neal.frager@amd.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
