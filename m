Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69EC4706C
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 09:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E79560B2B;
	Tue, 16 Jan 2024 09:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E79560B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vLL2KaXmAmC; Tue, 16 Jan 2024 09:32:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6015861044;
	Tue, 16 Jan 2024 09:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6015861044
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93E8A1BF2CB
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 09:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7512E40556
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 09:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7512E40556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SECMV4ANBTDe for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 09:32:25 +0000 (UTC)
Received: from mail2.eaton.com (mail2.eaton.com [192.104.67.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7AD2A40102
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 09:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AD2A40102
Received: from mail2.eaton.com (loutcimsva02.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B3D6F822B;
 Tue, 16 Jan 2024 04:32:23 -0500 (EST)
Received: from mail2.eaton.com (loutcimsva02.etn.com [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 691A9F8257;
 Tue, 16 Jan 2024 04:32:23 -0500 (EST)
Received: from USSTCSPGWY03.napa.ad.etn.com (USSTCSPGWY03.napa.ad.etn.com
 [151.110.126.247]) by mail2.eaton.com (Postfix) with ESMTPS;
 Tue, 16 Jan 2024 04:32:23 -0500 (EST)
Received: from USSTCSPGWY03.napa.ad.etn.com (151.110.126.247) by
 USSTCSPGWY03.napa.ad.etn.com (151.110.126.247) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 16 Jan 2024 04:32:22 -0500
Received: from USLTCSEXHET02.NAPA.AD.ETN.COM (151.110.240.152) by
 USSTCSPGWY03.napa.ad.etn.com (151.110.126.247) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 16 Jan 2024 04:32:22 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by hybridmail.eaton.com (151.110.240.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 16 Jan 2024 04:32:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZ/nIyJahsKy0aPf1RtS4X3kCgG3cYpl/8ht3YPeRiYH2jArPrDrEX5AeWYezflqongnZ9IIfE/URL97sh7YrndBPZsGfctmEKJqVUV5CAFCkaMNsGARVwGhV+nISRg7fzp7hvET0GSkvUkCrGf7unPQj4QlsUTxYNvw5zAN9JsEh/JYWg0w34x1Ge7j3gBYKUisVQTaXCjDVOTak4DyYE33hzljxu3W3i157OX1FZRLxyCxZfeGyTZh3vMzMAcoPCN0lLBSnwBsKsz0Z5YrpUtzRsQ4Bdgy2mEdZRPYxJWDuR7LO2YWdINmhKxrATbiK+vF2Uda50Pk28y72i02rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFPOmblt0bNrPh2zHZ7UtkSDd27nBFvUeJ9prSQqqyA=;
 b=SUNXef/2z3GJ3eKk59C+mWXvGfgaDbSRRYk7s5tG94iBXDPx6C02hEnWZkapWTZ8Zl52Lx94hDD0KlbJCAEtWq4LYc6vtX1RqeKLDyVaFD6hUzw2mKCppOIJ6+fhuGWObPK86qCByhDa4qq9uSi4qHlvX/tK+Ki6GFs9tPDTmdCFJk6d6mhRqguC9/9n1GVmw2lhSk7UYVW5VsI54axgkiMZPLnx9E7mJ7dnn0MjcroykzWEjlpBR72F06P0HZ5EKW561GLitKL1nSuHR36S892YC2+fbyWUUq8kfv4rvXEJiup2kzAQ3kRXTWYtp/VLuNNR3i3PdZZ8pHFI+aaySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eaton.com; dmarc=pass action=none header.from=eaton.com;
 dkim=pass header.d=eaton.com; arc=none
Received: from DM4PR17MB5969.namprd17.prod.outlook.com (2603:10b6:8:50::17) by
 PH0PR17MB5787.namprd17.prod.outlook.com (2603:10b6:510:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Tue, 16 Jan
 2024 09:32:19 +0000
Received: from DM4PR17MB5969.namprd17.prod.outlook.com
 ([fe80::32cf:fd43:3a95:46b7]) by DM4PR17MB5969.namprd17.prod.outlook.com
 ([fe80::32cf:fd43:3a95:46b7%7]) with mapi id 15.20.7181.026; Tue, 16 Jan 2024
 09:32:19 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for
 zImage with appended DTB
Thread-Index: AQHaSF7mNB4qKcDoVUiCnUnVg5Pu8A==
Date: Tue, 16 Jan 2024 09:32:19 +0000
Message-ID: <DM4PR17MB59690A1C4DF5CB3F7D5A07D9DF732@DM4PR17MB5969.namprd17.prod.outlook.com>
References: <20240111131932.11760-1-laurentbadel@eaton.com>
 <ZaAIkDXOQV9QUazR@landeda>
 <DM4PR17MB5969BAE4BC2BEC7D6417DC81DF6F2@DM4PR17MB5969.namprd17.prod.outlook.com>
 <ZaFm-9lGgWu9Ew8g@landeda>
In-Reply-To: <ZaFm-9lGgWu9Ew8g@landeda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_ActionId=677584ef-1c31-4036-9d7d-d4b6ff54b946;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_ContentBits=0;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Enabled=true;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Method=Standard;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_Name=Eaton
 Internal Only (IP2);
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_SetDate=2024-01-16T09:06:34Z;
 MSIP_Label_ff418558-72e5-4d8e-958f-cfe0e73e210d_SiteId=d6525c95-b906-431a-b926-e9b51ba43cc4;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR17MB5969:EE_|PH0PR17MB5787:EE_
x-ms-office365-filtering-correlation-id: 94977518-ec53-40f5-6d23-08dc16760961
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MwZhWjOOXIcFYdsHkF34g18Kpj379Y9BJfv/k2+2QJeFDHS93z3AcYr3IFl6cpH8N4G1fqDc6HALQR+hBsMrXsmTMe5OmRwexuKU3Ym00nbbk71/+BszkhgOnrIIvQEb0gHS5sbyIRRPqW9ayH2V+om/4bBJ8nNfXrZAqYTByBjvZpnNLbiK6gYEskAXSNUWCBhZMfuo4VjjGLE9fGI2/fVy8zR7jORtm8GTPlyWE8Q5ltirV40z7cDcd+t3DqAXMzWQoEAshymgbi1IHFM2k2JHQ49wE6E/FfZ9G1QqQbYZgj9VtjH0PkgPDwvJkKQMrTBXOeeAPP1Kl/SWA12D0w2EraOVtYrqu3HT7Lioqq/EExL7xmWdeB/SlgY2ei0x5JI8sNATD+jiZK0vC0U7Qp+LUHEw5P12N7zC9GSZZUNvE0KmeVemhtxdH2/7mPV0PmSND+zQMC43pVE9cM1i2rMW6YoELGrRTgnkoCPGAGKndmNDRxdDrWYj96FiQUjPEDgArVPqX2AcR1Vdvg27cPc8BaJQyMZRySVD24dqOYfPAAz9+yeyYICFudfNOumXfbx0YzdMgCdx9wD6B9cs67uCHDUA4RvWK0N3qdslrmT04I/BrLXsMrTHzT5RTINCLXygoa26RKNLZL2uBC5N8EvScqc4coJytTEYZcJp/vnvdS6g+/Xl+B5AcrQ3kza9lZvLtqh8YKkU2o09evQ6OQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR17MB5969.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(8936002)(8676002)(4326008)(5660300002)(6916009)(316002)(66446008)(66946007)(66556008)(66476007)(64756008)(30864003)(2906002)(26005)(71200400001)(86362001)(33656002)(52536014)(76116006)(82960400001)(478600001)(966005)(53546011)(6506007)(45080400002)(9686003)(7696005)(55236004)(55016003)(41300700001)(38100700002)(122000001)(38070700009)(83380400001)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O/tq9iZmFyTjFZ0gfb61w1S1rqqxTe42ja1GIxhbFXsHSJzRxEDeF7XPTknx?=
 =?us-ascii?Q?4pj9ZSVlPEpvMh7qJRIaMMMdKGIzpuuQScEyeIDjBWbiEWWtGq8D7Lu8l1nv?=
 =?us-ascii?Q?enmrQBHaL1S++jymYc7N8MN120zJg5KiAmn7F8WJpMDOLtnhQ3qshe1IvMIZ?=
 =?us-ascii?Q?+5xsU1GQDGYM70BbAmGmLegX97eHLFVeJ4bnwEdbmvtG+pUoq3p/u3+/zLgL?=
 =?us-ascii?Q?cnq/S4NqkcB62SJrt0S6jl+xH0xNCNSM50027tLBS33nUWUKMkp9q4/IgRBx?=
 =?us-ascii?Q?oNR/yODtpM+LXG7/O3g6U7yxq2LqTWsNwLy3K+yqNBk+K6OQrkK4EX9oGzaZ?=
 =?us-ascii?Q?t2XW60EpiW6fPWxNISE0MmHy7wQvxAzM0oSx2SSck0uxLlHUEggHSlpuG2Il?=
 =?us-ascii?Q?I3omcb2GCk9YeS1EkeidNdnrPQ6nYM6bTSSD6EVPB5MYfEH5EJzl8VI7EyZT?=
 =?us-ascii?Q?Cchy92faFM3aJRLMSANEUAZWJOnSWSst4bgFLIpYW1qVHGZTRVNlTmAROMnQ?=
 =?us-ascii?Q?iE+dQBR7NptkU/Kav6QKqETbe4lYfU5cWBuCFB5eLAMuVN75rWs1Yxp88vIR?=
 =?us-ascii?Q?fwtQcP2FlIq+aWFeGn+65lZspgFMsT7dz16YiWUB4ijzq/Hs8gxCbgCXCrdg?=
 =?us-ascii?Q?i0PfZKn7+Y9gWurhAd1Bn7L8Icf46VgqF811Kz4TxRHxDaqm75ximykZUhxC?=
 =?us-ascii?Q?jElYjTvV/+LtIsWI8YOV73H4tW6NrGF5k0kiHVjQTkBDVP+Ig9eGbSQlqCSM?=
 =?us-ascii?Q?GQTXWK8EiVIdtbdo5KHqoT9SjFpc/SXetrNFIQM38Hs0IOSCav+M4moRL9sI?=
 =?us-ascii?Q?02CQmtmZ3gxHhQj+4yg4PRpuRWo9HIsAxEfl5RfG8jQ0aUdZclr5mJHLmPzX?=
 =?us-ascii?Q?w95UdSiYUXs77fnQXM47s15JelLaEPRXs2Tsh8J1GIE3CMto00t1Wok6U2nF?=
 =?us-ascii?Q?IfbblHkYAulaEopmHBztMrOS5UuAZWB0rSfjV3QLyKrizdnc4lZ2qazhPFLS?=
 =?us-ascii?Q?cGIbcUpX00R8P3nf9EQsJMhmYNh/AXburXQ9mxEjLP3rJZibX4xLpWY4IfR1?=
 =?us-ascii?Q?VJ8qp/zi9SnI//Vp9CcQ+pM5JxRLa3FznVXL2fD4tAheRwFFctB3rqkylZ9N?=
 =?us-ascii?Q?ocUvYfAUMddQi1zu0bUUs8aUShjNm6BE3grwm5GqwbEy2B/BnSLmvbV4MyQ2?=
 =?us-ascii?Q?/JMKpdubFK8VkcHPPaTwSbkgSGvErkSiGjTHDGF7tYmoNaY/viL9t1XlxilW?=
 =?us-ascii?Q?hkuY6KKPNwOLvWId+AMQfiNrNjcF+BJS3pozVuqSQVPsFlDo8E1urH4pBo9+?=
 =?us-ascii?Q?2xPdvkK/8I1uUp47GHX7rTPF/Tw17ZIlw9n8v22mxSQ+nsU/jklFh49g4vSP?=
 =?us-ascii?Q?Z/2mN+C4xZuTy0racgxf70sTNnJ+61kXmK9unweELF/Cd7sh/9gbWT0d8TPy?=
 =?us-ascii?Q?9KUC/Ce9+C0PJ+u/MddASM4HC7Sz9eUl6KPFsXZTPrPgjV+CFIX/pIcVjwg7?=
 =?us-ascii?Q?w5EmD1AFoXBJxNwZMPptFfq3g5Jp1cUgcNssioj5vD/9ugYsFI/CJ3laoJzQ?=
 =?us-ascii?Q?GW7B01nHCjjJZPluZGwN5eMqY5pTwFl7YvJnz4t+?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: jph2MvsK1El7ptx8JSpMdxhdF48oCEejDvf1/hUjNH1DNhXMVU0T4J9qhaG4qPw3a+dLt2JuUqA0SkEF5TfBsg95XlcxHmdSboPSSAiO+enaoL1qEOyKngJxYtg2LpxgrANlb3Y7s+0Dnx3fc8ouzTYFrIYAQNTmz46l+RUPJ3+rN5F5MF3MNX1vDUE7Kw36UQQWhjQZJVh0tlUMKx4P6oqS5FEmVk+4l8IhU3adDAwHqW3XDaCS42YNFbpvto/qznkz8/LToVlD4Aqfxdh81iE90xtgwOa0+2lqKRk88J6HRnxZSvFMQGG9xw7Pk89zKXtPtmZ2N6i6fvyhovxUN5fMcMZO0N+AiyKO46gb0f+suc2VcfGkwzSt3ytZC3Bg/pPcbHwQO0bhlq86AVW/mQ9HJTCuF9rz9srtOVIx8cvBnXUixr+y46Kqpg6eTEOk3jwBgfT/a6mYyY8WU8Yd7KqMD8Ll18b+CZg9On+oJ5osRWXvDqMJaISeTLZKmJG+Hr3GRdMtSg0M5Fa2odNgM6tFItrKb49HRbwob1mHiVZxfUndwjD1IK640MCHGwRc1aIO62tcRCR1KZQYpULl0VU/hzU78+f7vNAQXXW3vBi9bKkKB8vQAj5VUHInLwB1WFdKtXQyyyB7Su9iW7VgYA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR17MB5969.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94977518-ec53-40f5-6d23-08dc16760961
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 09:32:19.8561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d6525c95-b906-431a-b926-e9b51ba43cc4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZMB51q2JH4vo7B7R7Q9jTgddlOmdyOJN+/yB6C6jF4kiXpoK6ERVi9wywLmxXWkP+aAF37ccuwbm13TR1+U7Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB5787
X-OriginatorOrg: eaton.com
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-on-prem-Exchange: True
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eaton.com; 
 s=eaton-s2020-01; t=1705397543;
 bh=sFPOmblt0bNrPh2zHZ7UtkSDd27nBFvUeJ9prSQqqyA=; h=From:To:Date;
 b=oYieF3qjVcND1geBYUu0Wmb+mlKxqX+PLMth7ddakB0MpGystP1F8vKtWqxAXYcDl
 t3tXHzO84c5dWzt8xfjFE9XhyRSswjTVNXMw1XywlB+RHKm3wfh+RPNfPWD+TT0FL+
 sYZMox51KLaaHxXmDLnaMnnUcSSJ8xiPknORvjQ1aGJWBlbeoJfXbVgbyiXv7vu2zS
 ImyIDmFqPbPQnyLY6m1oX3BwQroQ187yeOteW/K6E4Y/15LumYT5J2GgVkKtvmbfoO
 qjq5QLjqoOYEoLTCed9Vrw+lnh+fQfm6nEPymxTGhnTy+b86Zsore7ctywaSyIhJLH
 P5GywT9OnKQoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=eaton.com header.i=@eaton.com
 header.a=rsa-sha256 header.s=eaton-s2020-01 header.b=oYieF3qj
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eaton.com;
Subject: Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for
 zImage with appended DTB
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
From: "Badel, Laurent via buildroot" <buildroot@buildroot.org>
Reply-To: "Badel, Laurent" <LaurentBadel@eaton.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Thanks a lot for your comments again, I've found what I think is a
nice improvement over my last proposal, so I will submit a
new clean patch as I don't want to take any more of your time
unnecessarily.

> I've quickly tried a few tricks involving the use of $(space) and/or
> $(empty), but none did work...

My apologies, I didn't mean to have you expend effort on this.

> The next step depends on which of the above three scenarios you
> believe is the best.

To be honest, I am just having trouble imagining why one would want
to use multiple DTS in this case, but I might very well be missing
some use case. I do think however, that if there are multiple DTS
configured and they are appended to the zImage, then the user would
expect several SB files to be produced in the output.

I have to admit that my initial attempt was a bit sloppy in that
regard and I think that this new patch will address the issue much
better. I have actually had a small in-house patch to fix this
problem for at least 3 years now, and we only decided to submit a
patch recently while revisiting this part of the code (in retrospect,
I'm sorry that we did not report the issue immediately, that would
have been better).

The fact that no one seems to have complained about the issue during
this time, probably suggests that there is not too much demand for
this type of configuration and that drove my initial idea to go for
the simplest solution - but that's not nearly always the best choice.

Last but not least, thank you, and everyone, for your efforts
building/maintaining buildroot. It is a great project.

Best regards,

Laurent

-----Original Message-----
From: Yann E. MORIN <yann.morin.1998@free.fr>
Sent: Friday, January 12, 2024 5:21 PM
To: Badel, Laurent <LaurentBadel@eaton.com>
Cc: buildroot@buildroot.org
Subject: [EXTERNAL] Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add support for zImage with appended DTB

Laurent, All,

On 2024-01-12 08:30 +0000, Badel, Laurent spake thusly:
> Thank you very much for your time reviewing/commenting on the patch.
> I spent some time trying to find a way to support multiple DTSs for
> the sake of completeness, please see the patch below.

After a cursory look, it looks quite OK.

> I would have preferred to use a single loop for all cases but couldn't
> find a good way to iterate with an empty string, so this results in
> slight duplication of code unfortunately.

Err... I don't have a much better idea either... We could cheat with with some quoting tricks, like adding an item in the list that is just a pair of sngle quotes, which for the _SED macro would close and reopen the sed expression, and for the _ELF_TOSB would be interpreted just as an empty string. That's a dirt trick, though, and quite a bit fragile.

I.e. somethinglike (nopte also the use of patsubst instead of foreach):

    # '' is used to create an empty item:
    #  - closes and reopens the single-quoted string of the sed expression
    #  - opens and closes an empty string in the elftosb output filename
    MXS_BOOTLETS_DTS_NAMES = '' $(patsubst %,.%,$(LINUX_DTS_NAME))

I'm not sold on the above, because, yes, it's fragile...

I've quickly tried a few tricks involving the use of $(space) and/or $(empty), but none did work...

> I have tested building mxs-bootlets with the following setups:
> 1. zImage with appended DTB, two DTSs configured (one in-tree, the
>    other out-of-tree):
>     -> generates 2 SB files with extension .$(dtb_name).sb 2. zImage,
> no DTS:
>     -> generates a single SB file with the .sb extension.
> 3. zImage, two DTSs as in (1) but not appended:
>     -> generates a single SB file with the .sb extension

Cool, thanks for the effort in looking into, and in testing, that!

> I checked the output shell commands and they looked as expected, too.
> I also minded your comment regarding the naming of variables, thank
> you for pointing this out.
>
> If you think that is a better solution, I am happy to re-submit a
> clean patch.

Well, just looking at the code, it looks better, because we do not rely on the ordering of the DTS names to generate one mxs-bootlet, aa we get as many mxs-bootlets as there are configured DTS.

However, I have no idea if it makes sense to have as many bootlets as there are DTS names; you are better placed to know that. Sorry if my review seemed misled you into this change.

What my point in my review was, was two fold:

  - _if_ it does not make sense to have multiple DTS configured when
    using mxs-bootlets, then the situation must be caught and the user
    must be warned about that (hence my code snippet to detect the
    case);

  - otherwise, _if_ it is OK to have multiple DTS configured, and that
    it is OK to build a single mxs-bootlet in that case, then it is sad
    to rely on the ordering (but I did not provide any suggestion to fix
    that, sorry; maybe just a comment stating so in the help text for
    BR2_TARGET_MXS_BOOTLETS_LINUX would be enough);

.. and the third point that I did not initially adress:

  - otherwise, then we need to generate as many mxs-bootlets as there
    are DTS configured, but I did not suggest that; you are probably
    better placed to answer that question than I am! ;-) Your new patch
    does address that part quite nicely, if that makes sense to have.

The next step depends on which of the above three scenarios you believe is the best.

Thank you!

Regards,
Yann E. MORIN.

> Best regards,
>
> Laurent
>
> ---
>  boot/mxs-bootlets/mxs-bootlets.mk | 40
> +++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/boot/mxs-bootlets/mxs-bootlets.mk
> b/boot/mxs-bootlets/mxs-bootlets.mk
> index adc22767..0a1f7009 100644
> --- a/boot/mxs-bootlets/mxs-bootlets.mk
> +++ b/boot/mxs-bootlets/mxs-bootlets.mk
> @@ -41,17 +41,17 @@ MXS_BOOTLETS_LICENSE = GPL-2.0+  ifeq
> ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
>  MXS_BOOTLETS_DEPENDENCIES += barebox
>  MXS_BOOTLETS_BOOTDESC = barebox$(MXS_BOOTLETS_IVT_SUFFIX).bd
> -MXS_BOOTLETS_BOOTSTREAM =
> $(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX).sb
> +MXS_BOOTLETS_BOOTSTREAM_BASE =
> +$(MXS_BOOTLETS_BOARD)_barebox$(MXS_BOOTLETS_IVT_SUFFIX)
>
>  else ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
>  MXS_BOOTLETS_DEPENDENCIES += linux
>  MXS_BOOTLETS_BOOTDESC = linux$(MXS_BOOTLETS_IVT_SUFFIX).bd
> -MXS_BOOTLETS_BOOTSTREAM =
> $(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX).sb
> +MXS_BOOTLETS_BOOTSTREAM_BASE =
> +$(MXS_BOOTLETS_BOARD)_linux$(MXS_BOOTLETS_IVT_SUFFIX)
>
>  else ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
>  MXS_BOOTLETS_DEPENDENCIES += uboot
>  MXS_BOOTLETS_BOOTDESC = uboot$(MXS_BOOTLETS_IVT_SUFFIX).bd
> -MXS_BOOTLETS_BOOTSTREAM =
> $(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX).sb
> +MXS_BOOTLETS_BOOTSTREAM_BASE =
> +$(MXS_BOOTLETS_BOARD)_uboot$(MXS_BOOTLETS_IVT_SUFFIX)
>  endif
>
>  ifeq ($(BR2_TARGET_MXS_BOOTLETS_BAREBOX),y)
> @@ -65,11 +65,16 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
>         BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
>                 $(MAKE1) -C $(@D) linux_prep  endef
> +
>  define MXS_BOOTLETS_SED_LINUX
>         sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> -       sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> +       sed -i 's,[^
> + *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage$(1)";,'
> + $(@D)/$(MXS_BOOTLETS_BOOTDESC)
>  endef
> +
> +ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB), y) MXS_BOOTLETS_DTS_NAMES =
> +$(foreach dts_name,$(LINUX_DTS_NAME),.$(strip $(dts_name)))
>  endif
> +endif #BR2_TARGET_MXS_BOOTLETS_LINUX
>
>  ifeq ($(BR2_TARGET_MXS_BOOTLETS_UBOOT),y)
>  define MXS_BOOTLETS_SED_UBOOT
> @@ -83,7 +88,13 @@ endef
>
>  MXS_BOOTLETS_POST_EXTRACT_HOOKS +=
> MXS_BOOTLETS_INSTALL_BAREBOX_BOOTDESC
>
> -define MXS_BOOTLETS_BUILD_CMDS
> +define MXS_BOOTLETS_ELFTOSB_CMD
> +       $(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
> +       -z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
> +       -o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE)$(1).sb
> +endef
> +
> +define MXS_BOOTLETS_BUILD_CMDS
>         BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
>                 $(MAKE1) -C $(@D) power_prep
>         BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
> @@ -92,15 +103,24 @@ define MXS_BOOTLETS_BUILD_CMDS
>         sed -i 's,[^ *]power_prep.*;,\tpower_prep="$(@D)/power_prep/power_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
>         sed -i 's,[^ *]sdram_prep.*;,\tsdram_prep="$(@D)/boot_prep/boot_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
>         $(MXS_BOOTLETS_SED_BAREBOX)
> -       $(MXS_BOOTLETS_SED_LINUX)
>         $(MXS_BOOTLETS_SED_UBOOT)
> -       $(HOST_DIR)/bin/elftosb $(MXS_BOOTLETS_ELFTOSB_OPTIONS) \
> -               -z -c $(@D)/$(MXS_BOOTLETS_BOOTDESC) \
> -               -o $(@D)/$(MXS_BOOTLETS_BOOTSTREAM)
> +       $(if $(MXS_BOOTLETS_DTS_NAMES),
> +               $(foreach dts_name, $(MXS_BOOTLETS_DTS_NAMES),
> +                       $(call MXS_BOOTLETS_SED_LINUX,$(dts_name))
> +                       $(call MXS_BOOTLETS_ELFTOSB_CMD,$(dts_name))
> +               ),
> +               $(call MXS_BOOTLETS_SED_LINUX)
> +               $(call MXS_BOOTLETS_ELFTOSB_CMD)
> +       )
>  endef
>
>  define MXS_BOOTLETS_INSTALL_TARGET_CMDS
> -       cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM) $(BINARIES_DIR)/
> +       $(if $(MXS_BOOTLETS_DTS_NAMES),
> +               $(foreach dts_name, $(MXS_BOOTLETS_DTS_NAMES),
> +                       cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE)$(dts_name).sb $(BINARIES_DIR)/
> +               ),
> +               cp $(@D)/$(MXS_BOOTLETS_BOOTSTREAM_BASE).sb $(BINARIES_DIR)/
> +       )
>  endef
>
>  $(eval $(generic-package))
> --
> 2.17.1
>
> -----Original Message-----
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> Sent: Thursday, January 11, 2024 4:26 PM
> To: Badel, Laurent <LaurentBadel@eaton.com>
> Cc: buildroot@buildroot.org
> Subject: [EXTERNAL] Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: add
> support for zImage with appended DTB
>
> Laurent, All,
>
> On 2024-01-11 13:19 +0000, Laurent Badel via buildroot spake thusly:
> > When building a zImage with appended DTB, buildroot creates a copy
> > of the zImage named zImage.$(LINUX_DTS_NAME). mxs-bootlets.mk does
> > not take this into consideration and instead passes the original
> > zImage (without DTB appended) to elftosb to generate the SB file.
> > Thus, make sure that the correct zImage is used in this process.
> >
> > Note: this patch only supports a single DTS specified in the
> > configuration, because there is no obvious use case for multiple
> > DTS's with mxs-bootlets. If multiple DTS's are configured, only the
> > first one will be used.
>
> That's a bit unfortunate that we have to rely on the ordering.
>
> So, if using two or more DTS in cunjunction with mxs-bootlets does not make sense, should that be forbidden? I.e. would we need something like the following (code slightly elided for brevity):
>
>     ifeq ($(BR2_TARGET_MXS_BOOTLETS_LINUX),y)
>     ifeq ($(BR2_BOOT_MXS_BOOTLETS),y)
>     ifneq ($(words $(LINUX_DTS_NAME)),1)
>     $(error More than one DTS specified; mxs-bootlets can only use one)
>     endif
>     endif
>     define MXS_BOOTLETS_BUILD_LINUX_PREP
>         ...
>     endef
>     MXS_BOOTLETS_ZIMAGE_NAME = zImage$(....)
>     define MXS_BOOTLETS_SED_LINUX
>         ...
>     endif
>     endif
>
> (See below the name of the variable.)
>
> > Signed-off-by: Laurent Badel <laurentbadel@eaton.com>
> > ---
> >  boot/mxs-bootlets/mxs-bootlets.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/boot/mxs-bootlets/mxs-bootlets.mk
> > b/boot/mxs-bootlets/mxs-bootlets.mk
> > index adc22767..2003b23f 100644
> > --- a/boot/mxs-bootlets/mxs-bootlets.mk
> > +++ b/boot/mxs-bootlets/mxs-bootlets.mk
> > @@ -65,9 +65,10 @@ define MXS_BOOTLETS_BUILD_LINUX_PREP
> >       BOARD=$(MXS_BOOTLETS_BOARD) CROSS_COMPILE="$(TARGET_CROSS)" \
> >               $(MAKE1) -C $(@D) linux_prep  endef
> > +ZIMAGE_NAME=zImage$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),.$(notdir
> > +$(firstword $(LINUX_DTS_NAME))))
>
> The namespace is global, so the variable names have to be manually scopped with the name of the package they apply to, in this case:
>
>     MXS_BOOTLETS_ZIMAGE_NAME
>
> Regards,
> Yann E. MORIN.
>
> >  define MXS_BOOTLETS_SED_LINUX
> >       sed -i 's,[^ *]linux_prep.*;,\tlinux_prep="$(@D)/linux_prep/output-target/linux_prep";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> > -     sed -i 's,[^ *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/zImage";,' $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> > +     sed -i 's,[^
> > + *]zImage.*;,\tzImage="$(LINUX_DIR)/arch/arm/boot/$(ZIMAGE_NAME)";,'
> > + $(@D)/$(MXS_BOOTLETS_BOOTDESC)
> >  endef
> >  endif
> >
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://list/
> > s.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&data=05%7C02%7Claur
> > en
> > tbadel%40eaton.com%7C28583d4b11284523498408dc12b9a4b4%7Cd6525c95b906
> > 43
> > 1ab926e9b51ba43cc4%7C1%7C0%7C638405835765391645%7CUnknown%7CTWFpbGZs
> > b3
> > d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> > %7
> > C3000%7C%7C%7C&sdata=koINDlCH%2Bo4Tv20L6jeEvTllYPrpESfnGcFRL%2F%2BbK
> > u0
> > %3D&reserved=0
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> | conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
| conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
