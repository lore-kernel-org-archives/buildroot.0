Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5BEC4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 10:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 375FC608D2;
	Tue, 16 Apr 2024 10:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AuVvI9F5f1F; Tue, 16 Apr 2024 10:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25D960876
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25D960876;
	Tue, 16 Apr 2024 10:11:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB9BA1BF279
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 10:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C833040B60
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 10:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2B3gZUg0Ouc for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 10:11:15 +0000 (UTC)
X-Greylist: delayed 434 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 16 Apr 2024 10:11:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 640B34015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 640B34015F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 640B34015F
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 10:11:11 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 16 Apr 2024 12:03:53 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id BDC5AB5ABD;
 Tue, 16 Apr 2024 12:03:52 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 6B5A9B5AC0;
 Tue, 16 Apr 2024 12:03:41 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Tue, 16 Apr
 2024 12:03:41 +0200
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (104.47.2.51) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Tue, 16 Apr 2024 12:03:41 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNeijPH1iqzYoNmWPNxP59skYFwKFP6USbPxlQHuTUg/p3PMQPMyH5KPLjDL0KFESNVUBQniA7lm1ouW7Of6+cr9jwNK9NvvhuC7hY6kuXvaJ7m/1BhUVUnYd2k3vl8KWGuWkLW5rcCWj/sWoFptNwiI1hFr+N226tEp/+Lxdx0Zom/SR2dGyNBthKPWh4XCiee3MIB74poiKImx0ucu+AzQJ/QKOHyAgS+GXuyP11skgG2lhmz8VVAC+T6tQWFWKYCaFs1WHmLmCzjvIRHokSi5tEtNUutW51VUOCGr5rjqfqWPFs1GPN+6YY9nYYe2HCS+P5VhAJrnAl/v8Jaq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPHLT0p7rhC97BPZ1QX5kACetf2Rf3/ypFe/ZyU6UeQ=;
 b=h+Nv7LBE9Oo0QtlSLRuogTcUSNHUR0IOwN29AkhtVkBWMAAKb8U/ZvZiLJ6lT0+J88ekd79RJeRn79zKbPlQMZNFlyqU62a0Rn6LV1FzEXxxbLWbeFXQCwiLDPEn/emvaHDP0g1198vLivfGCJ4sZp6ZdQqia23dt2EubdpaQCPrA0stWe5yHA77uAavYy7jvzfEifmcWBaojjOMcclUK4woEWfm55rKDlq+Kv3hlgMhK/x+P9qWA/0Mr+5b6uBYXptLXNx1iFzngh6NAla3rhZ4p6+E55ZKPTdehQkaj4hMp30e3stw7gIfQVZysIu6nAqrW+uSla8BtBj1VztVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS8P250MB0202.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:379::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 10:03:37 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::ce26:2173:ee88:2920]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::ce26:2173:ee88:2920%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 10:03:37 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH v4] package/libzenoh-c: new package
Thread-Index: AQHaj+VZbU5CkcwuaUi1mGB5tLE3MA==
Date: Tue, 16 Apr 2024 10:03:36 +0000
Message-ID: <AS1P250MB06089DCE16FC224D2C58FC49A9082@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB06088E27875FEBCE10F3B5F9A9D5A@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <20231101184652.412eb9cb@windsurf>
 <AS1P250MB06086CD15C0B581F84F7F00BA9AAA@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <AS1P250MB06080D04D548B5D4D947C44AA95E2@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <ZeIVP2WxwT2BIS0z@landeda>
 <AS1P250MB060844767C03EEECD6ED1812A9212@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
In-Reply-To: <AS1P250MB060844767C03EEECD6ED1812A9212@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS8P250MB0202:EE_
x-ms-office365-filtering-correlation-id: fc82c6df-4661-4816-22f4-08dc5dfc7bd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sAdXJOIGszQvHiRIr5b0oTjbDSkSgH0936tvdDUcwiOX1klYhLIJQ4x7SM5X9eVLv2M7nhqH7/1g7xMwMnW57Ag3idapnsSOZUhKoJuF9IWNRuDtz+aqQ46SLS11907wj6nXVaonRwxp9hclubXDnGo6vY5rIdvdTT15XjHp7hjIbHNZhZCsCfC1NsGSqwx6V4AKYn2198rqMk2YjVF6ZlqHLiw80xarD32jLa9Prnp7es/kCEx+Zgy67bdFwbPVt6PRsNYCmILtZfCinwu7WfsNOwFaDLrSSfoWa4Zd5zvTbORpEh/0qc0wgOx8ZhSbJjMJpkE0WJhwfG0Q+a1/LUk9LXUlHJnTvnixZ7Ep/3GsAvWX19KJSBbbFcgtBbSBhmVk7Ujx7OXGPx62H3Bj9F168hwv+wjz3+7CodtHfiS83wroN+wnbHWMZCKgcOKMQRklQyU5YtRtO8/rW0Vfn5ANN+hOFa1wulrir27WWU0RAVp3wFnAPh+/zMNwPvgua3s9WN2QHnKD/ekbCO2PSzQE8eTs1dPGRzhvD0ecywprx8Y0z4Kj/Oa59lZdRDsMjeYhWdVJvJDR9C3b5Y/iuIr5kP14UhMPHR6hBIGFAPIjHUdv1+gI8AnbNylstsbKGBvvCJGvzz7FEz/OcanyjdSPWJX8pgad2x15/Lx5GOgjd0CYoBxpq2i9zeRekATk6P8K8dDkeZeAFNVbXx2XyEVZtYLgWZ8/3nMnfcR92BzvT0kp3UuZmeQx7LpTUpUh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009)(41080700001); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LzZhR2ZISnVGWXFqUGFVUTdXdzYwSW93MnJtMThRaE5rQVlQV25lcStObGhh?=
 =?utf-8?B?UGpkY3l5YWhaSlpxYXhTMUVKNTJMczFrVUp5OHYrT2l2ZEFNOCtlNDBpaGRj?=
 =?utf-8?B?SC8yQmlJWUNGRUpTdFJZdVViVzVESS82VkhEbmU4b1BtTUZWK1dUVFIwZ0tj?=
 =?utf-8?B?L2FJYlQzL2d6RzBBUWc3YWZlczQ3anZlZU4xN045ZjZ0dTZtTjVINmp6Q3BT?=
 =?utf-8?B?bGJBamgzUE00V3grd0RicUxvZmRQcEdKdXNZMWZPYmVSWDZvQWZkREpmUysx?=
 =?utf-8?B?WVo1aTl5a3NGeWx1WjZwOC9aV2x2SkdrNzJlaXlxQ0hGdmMyWkhKRVJTa1Jj?=
 =?utf-8?B?UkRhd2t3VVd0V3lMZGdWMEJnR3BNRDJpYTFFbVNzaFpKV21Xd2pmOU5oeGRL?=
 =?utf-8?B?TDVQdC9FRkVRL3M4dHRuODlTRU1RYkovV3RNSzJJUENkNnNTU3FvNzByWUpI?=
 =?utf-8?B?ZlRIZXVtT1dWZ0M5UTdnMUk2NXB1S2xNMUFSV0RDdWl2Vkx6amh6NXhoN2tX?=
 =?utf-8?B?QnJUUHgzbVRUdEVhQWFXdE9BNytlTDEzMG5OaUpOMUtDN3RITnkwWkczL1ZF?=
 =?utf-8?B?dWZ3b3FPdktaWkdnNTh2WHhYcTZHbEZmdnQ5aEdlOFl0SWFlNnRFQm54cnVW?=
 =?utf-8?B?aGFrOW5DendjUXpmaWl2YVFPVGZjU1RTS2ZYYzZvcEZoVzNPY2hFVnVOdVdq?=
 =?utf-8?B?SVRHSVdocFNXNWsyUXd2eElvT3FnNlV5WTZZNEdyYzhsUzd0NDMrdkxsaEky?=
 =?utf-8?B?NXdBSTF3eXNqa0x3WHltTVlXME9IaHJScHdnVjJnZ3pReWx4RmQ2d0dCTkh1?=
 =?utf-8?B?WDB6TkRDY01IYTFOUFhpT2dNSmgyTHBycUpPOWxQNUNYSE9VOVpONGNkenlp?=
 =?utf-8?B?ZUM3dmRrU2p4M2VSNHovTXZrUW55dzZPLzhQcWxqNXM1SUpJcG5FbmVDaWRk?=
 =?utf-8?B?M2VFZGdOMDc3N0RoSGxuZU02Nm55YnQxdjh1NmF1aHdWUGpZRWJSY1NCZ0JH?=
 =?utf-8?B?dDNtam1XRnFSMnlaSDJIVzJDa3FocDhuZUhDNkxTNXBxdEp5clJveUQyZERv?=
 =?utf-8?B?ZU1yUDcvQTErZW5PMGticFowRE5wQ3VRbjdvRmU1UlFkZStBS0dtamtBTDl3?=
 =?utf-8?B?ZTkyRkNOVzRsSWdKclRBbWtNcDhkS0VZNG9kNjNobjFPRWc5YVE3dW4wamc3?=
 =?utf-8?B?OXlWZVVQSG1FbUhMbmJZSnVkQmZkbU1TZTMwVmZXN1lHMlpoRTBtMm91a29a?=
 =?utf-8?B?T3ZkTld0Zk0rZ3VrcmkyS1pVdSttR2hmcjNEbFpJeTRLTTNiOUlFVUFKT0Iz?=
 =?utf-8?B?Ykh6SklEK0pGQTVxdyszL0V6SXBpMGZBd0U1T0M3UDZEQ2lFcXZEVFpyeWNs?=
 =?utf-8?B?UVgxV0grR0orL3dTN3Q4eHFVNnNlSlBRNEJyTktXcDlBK0JIV3d3cUVpa21i?=
 =?utf-8?B?MEFSekZwWENvSE14dDh3MW9ZUDNxeVFIaXZNc052NDc4cU9HMHFEZUhHNThX?=
 =?utf-8?B?ZlBxVmRUNjVuZXhWL1VBUXAvNSs2Qnp5RS9oZzRFRzlTM0Ivc25lY2dRekd1?=
 =?utf-8?B?R1NwWGxVUG9qS09vOUxVVkE0b1I4SFlPTjNOdDA3UktQM3hxNFUxMXFTRHYw?=
 =?utf-8?B?SUlwV05xa1UyL2ZYMFZibDJSYzV2K2U2bkJ0SXQvTEVJNEV5MllxWnoyd1N0?=
 =?utf-8?B?bWFmSFBqbXJGTGkxUFFzdDZDaTlSOStLMW1xSUNpeFhtTWNBWjc4QjIwbTZ2?=
 =?utf-8?B?TVhuVXArM0svOXpycXZYcUhkREVBMHJlc05ndDJNbUN1QWh0UVBySlhsWkpZ?=
 =?utf-8?B?QjRMSlE1eFBMWUZwUHc4My9aK3ZYWUNabjBXKzlZbkhiV0dXVU9xQzArbGhr?=
 =?utf-8?B?VmhiV2xOZERmQTVYWlhXZ0hYYmludUVqV2NhZ2pPcTBPQ01GcjV0WjZ5d1Rz?=
 =?utf-8?B?dDhxczVOc0lIMUJqOGNHNjFYRUdjMlpWZXlBckRFQllPUkU2ZHA5SDk3RC9L?=
 =?utf-8?B?SXBUSG9hbDJxZkpldjNNTmQxTnR5RCt5UlpuZDFuRlpaVnBia0RHOTZtR3U2?=
 =?utf-8?B?RDRrNENxaGFzSmN2RmVqOFNVSHpwTW1yU3lCakFyeHlheWtuMjRIWjdBaTZj?=
 =?utf-8?B?N2JkZ0JiVWZRUzlYMXJVRm5rRXZENzRpNUt1WkVHaGdrLzVlM1lSUEl2NzJn?=
 =?utf-8?B?OGc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JscZ744+d46paF6Xeo8g7ibK3yRm+eO3ADmv6aFCCWK2X7GOt06aDdTRGLuYaRgl/xcDMrXZslr4AOX0uCuEABYKbI/nWkH8+Ug1tLOnGp9do682q+oOkG2Wjcr3WXJz4R4Nx7Ir71BEwd7Lj69KkHYkym2l0hVee79oQEoTiVdz1EPMfXUiYSgZKoYzqv2SfmLQ1nFIDVw6KjnQwlmTHKPJCGzhMdSVUqX5t4qvy9erqM8oENpy1aOQD035cvMqJ/Mxupuc1nbOYcYkDDgPmdwekGq5tNOJSERu5bJc70i1W+YAHnJBT3vnVfAyHrmujV6G6y9Er6BxkMsX1+p8r+32dIa+XQIyZBr4MfZoNSqBbOW7RHE35pq0hLNLwq3IYMGTJ7KAStFGy+dwef9KiqrQZt8a97PepRrB932yaXy+kiDkJ5tm8szw3iB9/vE7p56hGUoHSQd5X3dJpmmHlZTkJZizQbsAZwUlFYYF4BYz7wDwcKWhDIHvcDj0H60YLU0vtok3C+BcnoaioEK0ZS07cS4/3mcgRiP7us4r8JUguN2YgFxqy0IlvI+ouUIUfAIC+X+loaUY9KthEneezQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fc82c6df-4661-4816-22f4-08dc5dfc7bd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 10:03:37.0328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X5QAxsWbPkjqXqXbr3OSjAX93u9IlFDUueap1dovfXBhVgGOO5B8W8QTJJqCal/zTvjdoAygWFHSr059DZ7T7xCHkN1B1AooIdEBy5kUKlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0202
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-TBoneOriginalCC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPHLT0p7rhC97BPZ1QX5kACetf2Rf3/ypFe/ZyU6UeQ=;
 b=KHW7cNk9g8bbvXsE/Oc8Ba+rXQ2zqhiVox0QZ7rIbDDcDzGKGPL2IqH1hqoW+FQPvXWPvVk+EQbspKEsv27tb+w5QTEXE/cZ3T6IMRST76MKjrbSAqqZV6KmnfsZCe5jGa61R21S3B9GBzK3kT0gzoFX0cd6JpuFeQ/pqAObvK4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=KHW7cNk9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: Re: [Buildroot] [PATCH v4] package/libzenoh-c: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I'm not sure if you received my last email with new version of my patch as attachment. Below you can find it as plain text. Sorry for that, but I have to use outlook as email client and not allowed to use git send mail. Please let me know if any further changes are necessary.

Here is the patch:

This package provides a C binding based on the main
Zenoh implementation written in Rust.
Because this lib does not provide any binaries or examples,
and the cargo infra does not provide any possibility to
disable the --bins option in cargo install step, we
have to override the INSTALL_STAGING_CMDS and the
INSTALL_TARGET_CMDS macros to prevent failing of the
buildroot installation step.

https://github.com/eclipse-zenoh/zenoh-c

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>

---
Changes v3 -> v4:
  - wrapped long lines to 80 characters
  - use BR2_ENABLE_DEBUG variable instead of "release" path component
  - use RUSTC_TARGET_NAME variable instead of "*" path component
  - shared macro installs only the common set of files
  - INSTALL_TARGET_CMDS installs only the lib
  - INSTALL_STAGING_CMDS installs both the lib and include files

Changes v2 -> v3:
  - bump package to 0.10.1-rc
  - set INSTALL_STAGING

Changes v1 -> v2:
  - renamed zenoh-c to libzenoh-c
  - added myself to DEVELOPERS
  - fixed LICENSE
  - install shared libraries to staging and to target
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/libzenoh-c/Config.in       |  9 ++++++++
 package/libzenoh-c/libzenoh-c.hash |  3 +++
 package/libzenoh-c/libzenoh-c.mk   | 35 ++++++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/libzenoh-c/Config.in
 create mode 100644 package/libzenoh-c/libzenoh-c.hash
 create mode 100644 package/libzenoh-c/libzenoh-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac277423a1..08c3d9a5a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -75,6 +75,7 @@ N:      Alessandro Partesotti <a.partesotti@gmail.com>
 F:      package/oatpp/
 
 N:	Alex Michel <alex.michel@wiedemann-group.com>
+F:	package/libzenoh-c/
 F:	package/libzenoh-pico/
 F:	package/network-manager-openvpn/
 
diff --git a/package/Config.in b/package/Config.in
index cd687a682b..af1ee30585 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1996,6 +1996,7 @@ menu "Networking"
 	source "package/libwebsock/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
+	source "package/libzenoh-c/Config.in"
 	source "package/libzenoh-pico/Config.in"
 	source "package/lksctp-tools/Config.in"
 	source "package/mbuffer/Config.in"
diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
new file mode 100644
index 0000000000..d22807c047
--- /dev/null
+++ b/package/libzenoh-c/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBZENOH_C
+	bool "libzenoh-c"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  This package provides a C binding based on the main
+	  Zenoh implementation written in Rust.
+
+	  https://github.com/eclipse-zenoh/zenoh-c
diff --git a/package/libzenoh-c/libzenoh-c.hash b/package/libzenoh-c/libzenoh-c.hash
new file mode 100644
index 0000000000..8c93a7a091
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3ede587dd08ccd6b0b7f0b44faeefa466eb5e18826db0b1cd93c51ffc59377ec  libzenoh-c-0.10.1-rc.tar.gz
+sha256  01a44774f7b1a453595c7c6d7f7308284ba6a1059dc49e14dad6647e1d44a338  LICENSE
diff --git a/package/libzenoh-c/libzenoh-c.mk b/package/libzenoh-c/libzenoh-c.mk
new file mode 100644
index 0000000000..0ad81f3e41
--- /dev/null
+++ b/package/libzenoh-c/libzenoh-c.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libzenoh-c
+#
+################################################################################
+
+LIBZENOH_C_VERSION = 0.10.1-rc
+LIBZENOH_C_SITE = $(call github,eclipse-zenoh,zenoh-c,$(LIBZENOH_C_VERSION))
+LIBZENOH_C_LICENSE = Apache-2.0 or EPL-2.0
+LIBZENOH_C_LICENSE_FILES = LICENSE
+LIBZENOH_C_INSTALL_STAGING = YES
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+LIBZENOH_C_LIB_LOCATION = $(@D)/target/$(RUSTC_TARGET_NAME)/debug
+else
+LIBZENOH_C_LIB_LOCATION = $(@D)/target/$(RUSTC_TARGET_NAME)/release
+endif
+
+define LIBZENOH_C_INSTALL_FILES
+	$(INSTALL) -D -m 644 \
+		$(LIBZENOH_C_LIB_LOCATION)/libzenohc.so \
+		$(1)/usr/lib/libzenohc.so
+endef
+
+define LIBZENOH_C_INSTALL_TARGET_CMDS
+	$(call LIBZENOH_C_INSTALL_FILES,$(TARGET_DIR))
+endef
+
+define LIBZENOH_C_INSTALL_STAGING_CMDS
+	$(call LIBZENOH_C_INSTALL_FILES,$(STAGING_DIR))
+	mkdir -p $(STAGING_DIR)/usr/include/
+	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/
+endef
+
+$(eval $(cargo-package))
-- 
2.34.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
