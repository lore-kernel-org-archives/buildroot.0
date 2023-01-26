Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F26C54EAA
	for <buildroot@archiver.kernel.org>; Thu, 26 Jan 2023 23:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04E9F408DF;
	Thu, 26 Jan 2023 23:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E9F408DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3iaD9aqRexn; Thu, 26 Jan 2023 23:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 301FF4175E;
	Thu, 26 Jan 2023 23:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 301FF4175E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8EBB21BF2F8
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 23:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62C8440A07
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 23:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62C8440A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWj3RiCHnVKQ for <buildroot@lists.busybox.net>;
 Thu, 26 Jan 2023 23:27:10 +0000 (UTC)
X-Greylist: delayed 00:14:26 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB49640194
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0137.outbound.protection.office365.us [23.103.209.137])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB49640194
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 23:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=cG3he925qZa6lcvq2YGbZ8UiPMvXsqEET3fwSzDUQS2Bk7E8HMKq+shsnyywXkj8ijxUJ8HVSHBGx2PpNOasNLutjE0dUjuRHJ0sayC1OOwDZhgwArRs90jzHXF64MVaFZ0ViyvZpUFFCeHTYegqPCYNYkrutI7sGiQYKsLTlyRAhg/ujJZA5hbvb24EjbMFrYPUQFFcvwKwDY1VbCg1cPcRQhgA8c5xV4ykUAa1x075nZU43sNDg/XMUxSBseViKYHMGltCfSlWlQhHckxVP8I+SuBTOILuo8C2gJVnVxcHUakzs79ZdBpXu7LlJ3QQuEmwAzCWlLhUNGc3qt0M2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMAv+tBPbrE6xKjJPvtHV2ptsI/RXe5Ga2I+ixSYmtY=;
 b=gzpNyNEWIga8lpcQuUBp9DsZz5/nhbpr/BtCDQz5664qeDuLaKSFMZ8zc+QBpnWTm5Df1hnrpUJ8TvLRoW5n4HcbR2+LiOlDDUM6pMZu5EH2/MK2FK7su2pQhm6/NewGWtGZ/45UA3D8GgTMrX+3Kgoq7ncqJJgYg0asFBEuNq8JzbBYwNyl+Zv+mhG6kVrGVHNAbCFWLVgB12Fa9kzZtKsLk/glyb3VdudYu9Jganmu0/UBlkdVjiw/sWtnx/KkXD4ouV7HKeLi+lzy8E3AT+K42eBmF7IT+BawM2O27gncNFrmY27ptI6Tit9XA4FO+O1Nj8YL7U5KbAUg7Qcisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1131.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.34; Thu, 26 Jan
 2023 23:12:29 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::772:4537:5767:b473]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::772:4537:5767:b473%7]) with mapi id 15.20.6002.034; Thu, 26 Jan 2023
 23:12:29 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Florian Fainelli <f.fainelli@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 1/1] package/ethtool: fix
 builds for older toolchains
Thread-Index: AQHZMbceVFw7DrBGF0qDE9AKayXQ166xRdiAgAANjOA=
Date: Thu, 26 Jan 2023 23:12:29 +0000
Message-ID: <PH1P110MB1603D54206C56ED78C53B2769FCF9@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20230126185049.3600233-1-vfazio@xes-inc.com>
 <7c025ff4-0e4f-111a-18c9-54441d322f93@gmail.com>
In-Reply-To: <7c025ff4-0e4f-111a-18c9-54441d322f93@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1131:EE_
x-ms-office365-filtering-correlation-id: 535ebba4-e94b-433e-8f60-08dafff2cbcf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bv47y1n40a5pBp8WsRUnXdG088/acIH+1xkA3D7vdCQuCVmqlWBNXnwy65fgscIsL6O93Kjp4Cbr8zyt5Cl0PERBXlrpilucoLTHQE/yiQLWxnzOr2WpynDVXKy//S/nh/YSKW5h/RAGefdWFvuh2JVxwzG+y0mpf75xBOiE22i5NXydMf8nxi9oLaPjRgYr11WwTDYTNb/wifk4+MwWmd2WceW4dZwmo77JBA7+vdvJ328s+kSrct4Vqb0SWkTU/1QMZpWk8UnE2BhL8NVJegxhxTIGRsUmr3wx+3WjhcOV8XEU1lKnaHI+DI0C83zo3jwgdzTXzrEba9rUeZP3hzvQ1RfmgBaLhUGQ5TO9yR5Yq9RpWMJociBXwN/sFRBEfhvuqj90zfjg6YQAz2ENobz2D1AInnjXj0EbS3wwozII+cl1cITuFTMV6NWIyB9IXNfdXAbwFh8Adop4ZNpFO0g6PdocEiKCma+CdCz0yXYYAqsnlEZ4SmIZP3wZvc8VLUxI4JRwr8Qm6DBQNW5Ll6I6+hbTE9JtvMQNrdeN6I4m4nFvXfaziSqbO5H9SLIVxV8vqKORBrXp6bReCj4blhSP4x3zZfG/Y7bdWbX8qud3ZoGPCu1wrYPejJNB2xZ+Ltmqtsx+C5NuOjfba4C3SCiq0HP8DlfSByBt7gBlYTuwjfn+eikJX5pZEj/2ipbQvBpBUvl9KmfDHyrzRM3Hm2E3JsYg7FOyAhS7XW0IDGc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(39830400003)(396003)(451199018)(64756008)(38100700002)(122000001)(41320700001)(41300700001)(8676002)(76116006)(66476007)(66556008)(5660300002)(86362001)(8936002)(4326008)(66946007)(38070700005)(52536014)(55016003)(2906002)(6506007)(53546011)(110136005)(66446008)(33656002)(9686003)(26005)(186003)(966005)(508600001)(7696005)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NStwMTZZL0hpRzJST2MzN3VNN0JORkwyc2ZtVURCRzM3L0J5UFF6WFg4VEpu?=
 =?utf-8?B?anR3blY5RDlLZmtwQXNEa2VmajZFQmNyampmUEs2aXRyRElaaUx6NGVLR1Zh?=
 =?utf-8?B?cDRZa3RueG1vTzNBWi9yOFIzZlZYam1vaGNlNjlPODhSR2VsSE10MFQ1L2NG?=
 =?utf-8?B?a0NVRjFjOGNCclFkVmYzM1ZSZEVWUHQ2TFZUWVJpZjJjcEVmL2pxUDBnWXFY?=
 =?utf-8?B?NkpRT0pqMHVFVVozSnpEN3lPVTF5WnpxQVBHN3FIYW5yM2xIUWxjUkpRbnA3?=
 =?utf-8?B?czJGZzNTR0xMWDMxSURzb0dLeDdiYVlCYVpFN21tY0NTakJObnFhcFV1MG1p?=
 =?utf-8?B?eTBsOEdmVGhZOG8weUFHM1JTbHZEMnRkZ3VaWHlCaWNjc2R5ZmpkTUk4Szg2?=
 =?utf-8?B?clplMHFlaUE4RHE5aVlzallvdUhNU0wzY2RUV1dwVTBhUStXRkx6ZGtaWkJI?=
 =?utf-8?B?VFNuZVBnVjQwUW9lWjZ3T2tBRVN3YkNENlp5c3hUdEY5dVJrSVFmVVFpdWow?=
 =?utf-8?B?R1hKRUlsazNPU1FZNS9SUlIxbnY3Qld5RHM3bm1wQzAzeU5MclRDWDUwRTBR?=
 =?utf-8?B?ZkRtZStqcy8xVk54MHBYZTVlSG1kVHFzaDh3N1dGTEtTUFJxaDRxbE1VeHZO?=
 =?utf-8?B?UmN1eFZQdVV6bTBCc2YzdWh6Yng2aDArcEJNOGhJdVdCUTVSdkxUS3pqVzd4?=
 =?utf-8?B?MHhMUHJBV0w5c0dPaUUxQ0lvS1BuRHM2emZLWDNGb1dYV3BaU21VcTZ6WWNQ?=
 =?utf-8?B?N01QaXpHVXZLQkNMb2xhRk9IdXVIaUVpamVvTTBxMklWUWZ6dndtTkZ0d2tm?=
 =?utf-8?B?YUM5NklWTDE0RlJUclpHQmZ6Mi96VVc2NWJCQ250b0FJZ0cyN0RNRnBwdmUr?=
 =?utf-8?B?WVlJdWg3YmYveHFVUEQwMm5aZjhDS2lqZWd5RUlXeGhtalZSRWIwS09mU0xL?=
 =?utf-8?B?Z0RldTI3UUtaZlkvU1FqQ1hNR01TS0tsK1FGR3FoQkpVRm1kZXVBZnZZOUJ5?=
 =?utf-8?B?b3d4aGI5R0cySUN1NEV0c3FVL1lTMlBUamVQRnVwclM5YWZEK1pMWkFFbGh4?=
 =?utf-8?B?cXZhVGhTczVtc2creVVPUTllRVN3Z21hN2hqWFk5VDQwaUI1V0V3QnMxelFz?=
 =?utf-8?B?YWE3bm8zU1k3Q3F3VnhFbUNQVEdpeHlVczFaNC9YVGlFQlNIdkdub251VUNZ?=
 =?utf-8?B?RzBuNmUxRWI0RndjRU9POUdkb2ErdVZhWXJYYVo3MlprQ1FjS3VRRHRPdTN4?=
 =?utf-8?B?c3ZBTVlwa1dMc3dVcU5NUXljZUR3OFBIaDYyZTl0Q2RVelNyeTYwdkFJMHlw?=
 =?utf-8?B?RXRzR2QwS08wMEtERGF2MWcvRjFnMGNKQmdoK0RSMVdUR0c5Nmh4cFZLN29x?=
 =?utf-8?B?ZHJuWG5qUXlIOFhCVUZlM0tuYWF4SFB6N3FQaXlvQkJOR1JuSkpLMHJrOVJQ?=
 =?utf-8?B?aDAzL0NlZDhTMjJka29RTjdjbThBMklFREJnR3RrTlkwTy9BZ1o4ejM5OGls?=
 =?utf-8?B?cXF2bjFvOWpqV0RyRDJSUU9oVm1jV1l3QUxHVm5vdTVQaFNQclppdVp2Y2xX?=
 =?utf-8?B?VEU3MTRkWktUQXlYYzhiNE4wSG5MZEV5YjdMNjV4QmliSnhKUDBxME1hRk5D?=
 =?utf-8?B?c1J5dHo2RGlLOUlVREN2Q2E5VGxNcDNENEJxSi8rbE4zZjFGZHBGanZMaG9R?=
 =?utf-8?B?WE4wZ0pWcm4rZTArNXZUajVSRUpTVEprTDJBQlhKb0lxd0JKR0E5SmZxWWw3?=
 =?utf-8?B?akJoUW94elNkVjJxS2lOM3prMWhQdExtUnJPSUFlYU04TWs5MUgyNlN5eE1G?=
 =?utf-8?B?R2JQaFBCZ2Z4dG55K1BlTWlEMUxpNndXRTZuWXR6aExwVHV4NnJzOWxCTWNN?=
 =?utf-8?B?NXFwT0xqcDhua29PdkZxYXhhRFlkUkh2TWFnbUxvZEtCYnoyTHBveVgzRVgz?=
 =?utf-8?B?L1VFaFAxSURIWXVRWmVEeCtuRG1SOVFlNkNKcUk3akFqaVk4MGIySWk5WVBY?=
 =?utf-8?Q?xYuC/lB2T1xjDjOzAWIkiLoyrjOf1M=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 535ebba4-e94b-433e-8f60-08dafff2cbcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 23:12:29.2580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1131
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMAv+tBPbrE6xKjJPvtHV2ptsI/RXe5Ga2I+ixSYmtY=;
 b=jSyyVVZRzfLuY2a2lzy6utQrS/klPPxhSQ7NmgMVraA81P+4q2C4vTDTaBaqNIAVf9LrpMf5jvkU1yf+/0P6OljL4OLC5ZCjqJeVWW3iNPPcj1i9C0k1OWPLlaoDS/2EuoKF1TaYpSzmUY5hVpbVDUPfkim2L6Tzoyz6Hi3kPf7aC/Sv6vaN3uIY2VDV016/KeptKb1CrX88fNg4oWUN1MfaBwWfg51Z+s47x9pOW5FCrhddEUfhdh/IPfemXAF9F+T1Hle4Qd2OM05MTOn+/VEY/ilnECh4hYkgMuQzXrI8hiHfY2UwEHiLvLGmG8RdWlMtD+EYjnWOguy3jfT9/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=jSyyVVZR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH 1/1] package/ethtool: fix
 builds for older toolchains
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian

> -----Original Message-----
> From: Florian Fainelli <f.fainelli@gmail.com>
> Sent: Thursday, January 26, 2023 4:22 PM
> To: Vincent Fazio <vfazio@xes-inc.com>; buildroot@buildroot.org
> Cc: Matt Weber <matthew.weber@collins.com>
> Subject: [External] - Re: [Buildroot] [PATCH 1/1] package/ethtool: fix builds
> for older toolchains
> 
> Hi,
> 
> On 1/26/2023 10:50 AM, Vincent Fazio wrote:
> > Upstream commit 1fa60003a8b8 made a change to headers that broke
> > compiles with toolchains using kernel headers prior to 4.11.
> >
> > Apply the patch slated to address the issue.
> >
> > Fixes:
> >   -
> > http://autobuild.buildroot.net/results/e69886deb6ff466db96043388b5dac7
> > 271a5ec58
> >
> > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> 
> Why not also take patch #3 so we fix build issues with musl C libraries?
> Thanks for doing this.

I can do this, but I was trying to keep the fixes as atomic as possible. I haven't seen any autobuild failures for musl yet.

Have you heard back from Michal about applying to upstream? I was debating holding off on this patch with the assumption that 6.2 may be released soon.

> --
> Florian
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
