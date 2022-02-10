Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A603C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 08:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D313460AF4;
	Thu, 10 Feb 2022 08:25:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dn_fVSVbqtFS; Thu, 10 Feb 2022 08:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFA960E9C;
	Thu, 10 Feb 2022 08:25:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5A4C1BF38A
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 08:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFB2B40640
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 08:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAPgHWbu4HS4 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 08:25:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::600])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E44644052B
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 08:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9/NZl5jZiKAwNWl1AuCvrEI3I3+g0C3KhdbpgznUDmbVvmX8TfiS/axFsHJQfGqzscmRkg2l4VKH8GCBd/ELAXLjOIDgobQjAhpGJouNOmJGRt/aljsAuqsT76aSTm+2fa6ccXVJvclU9+mbEJxseubML9p/pP3AiS2pBkUPNogntUbJiY4i69xOMavFVsVVqnbCmNNA/8lNUFtPVyla/988ebkNEpd15FwXrTiyjVuAewS6+yLhsgagFTBp5HdIBXh8eTx/Wsjrf56nIcbVzP8Xf6QU/S310d8QmxUq6wqGbBEpOpA/9unM/pt30l78V0D6e08T7iBTaq/ccFKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vn983SG353O/IYFqsKkauVWyfJoK+ID10mK16RYyXmE=;
 b=YpFHHhd4BHRB6cBb+1tFsBANvso/D5nHjtWfcFgFEChiv+kPXpRzOJ2Xm+IcTsPQ5CcOWJOSZHwtQbYQ6TOmT1qOTMsu9hFoXepGrS87g80/sdYlrIydhE41SGJ0PayXuov2auOpuhjPvlcyS6a2y7AgJarmWTqdG5QE23UbUq4tePeBJRCqVCuRLOLR/L/HPtkaXXJA6B8raWN6iWySUgTaBpFf7K2Q1ZukoYbIvtjnufdTtsnaq3ZurDKg3vs+tiNN67J/rH836Svhi5mU3JncZE5S7r5cVXiNjYO2vayuxhX72wmr09n3Y7YP1KfW7RuPDLkf/bGkP9Z9rXiz9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn983SG353O/IYFqsKkauVWyfJoK+ID10mK16RYyXmE=;
 b=cU37Zf+ZxuFSx++G3WhX/9cHmn/CTjluhUxQ93T5lKmVVz/+cZwQqrENtQlOgRhcjgwqSUBmTw1zYqeZRpVmL4Xm0SGDn1Tcs4GTkmVxnwvpcLIwxspOrfacPuceDBJWKJhR78Aw1osyzSK97635Tc/Cq5Kj978qDCIZV1XuwC8=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BYAPR02MB4790.namprd02.prod.outlook.com (2603:10b6:a03:4e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 08:24:54 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::3d75:3dc2:7976:32e3%6]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 08:24:54 +0000
From: Neal Frager <nealf@xilinx.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Thread-Topic: [PATCH v3 1/2] configs/zynqmp_zcu106: bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYHd9VHIpyl+j9DE6dyYM9V88dZKyLsIoAgADCpLA=
Date: Thu, 10 Feb 2022 08:24:54 +0000
Message-ID: <SJ0PR02MB7758493F336639F00D599770D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220209180306.2629180-1-neal.frager@xilinx.com>
 <C2A6170C-3951-42C0-A6B0-FEFD74238480@benettiengineering.com>
In-Reply-To: <C2A6170C-3951-42C0-A6B0-FEFD74238480@benettiengineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7e37211-ab99-4730-3a36-08d9ec6ed0eb
x-ms-traffictypediagnostic: BYAPR02MB4790:EE_
x-microsoft-antispam-prvs: <BYAPR02MB4790BCD66BEFA5C445774197D72F9@BYAPR02MB4790.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2/bU9/FyK/hWl3jVqRqE4V9XT7BGbC3olRXm1Pz6skjJLKkjTN85gL42PC9GqsNBajWniUQVzRc2oNGRxkxq4s+BqPffQHJ9sJ3FPYUuYRGFzDcX8CcXOOdO+9bbv9MzqGxaVYRZAVzAkope6gTppzAU15SWusP1L5cg0/UzoCbCA49FattV+D/luD6ZgPo9+0UgUy03t6nJgVGGctuKbxgzt/NYKpp1l9vrhXTLkLyOugze5/Vr/GbjH24kvEORdpCCCHw3txBuU9KE9vpdxABaPyZyFuq6I1FxcjDwx3hAkTYMipdWLmSOx0m5LTeCI2y5kcZoVeNkKIsNyXp4Hf8HAW2nIzmJHdrQKCwyGg4xTihNJ6Lyfzhn6xjcm7l+BSrhn2HJArh+k4447pws388BHo+A2KMMnuixVipFYw9lnRro0+rNdQlHGQzpOfvQ7u+MB+pwUlEgUXKJnmY0/v2DW3tp68QUEH7Rax1hWIVLspuGqklPIXuZ3fU+SVEE3cCox5RxT+Bk0owk9Vj4RrHMAFYTBeVOutWqXaULkN8H9LZ08QlsOkS1ArZF4vthpYr9IQIbBC6xF3EMrfdQook18EF/F/VR/o31Y6e2qB2SRqvyKOriQMBi8vT3rZr6oiVuS24ROrA9tq2FvhmgZfJthDT+7N7ZX9I0+UITaE1Cq9BtBHpaaouhOwJWrjPcz+b6hht3/FYS/B/k6tSonw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6506007)(2906002)(86362001)(7696005)(9686003)(508600001)(71200400001)(33656002)(4326008)(66446008)(5660300002)(558084003)(66476007)(52536014)(64756008)(8676002)(66556008)(76116006)(66946007)(316002)(55016003)(38070700005)(6916009)(122000001)(8936002)(186003)(26005)(54906003)(107886003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkwxNnBaaUplRGQ1VzNhWVpLb3A5T0xkbDFobVRyOEExZW9GdUpPaWFCNFdo?=
 =?utf-8?B?bVhKUlI1TC9SZjBmOXJxREorV25IWWZ0WFdMMXZYYkdqVU9idFhpNnd0eWVL?=
 =?utf-8?B?YXJsQjNLSkxpVE5IMWptdUJqdVE2NUd1Q3JZbTA2OWV4NlNUSyt0RThERzln?=
 =?utf-8?B?RHBHcTFQL2pHc1I0OUNDN3JXV0JQMDFuK0VrdEFRUTFjRkhMOE5QL3RnOFMv?=
 =?utf-8?B?MVlsQUZCRk5CY01STUFVeVFTZVZ1NUN3Y21pSzF0SlF5TEdUc2FpdklsQmV5?=
 =?utf-8?B?YjlyRHdVZU5rZytCTnl0b09jVlFMb00wYjZrdTdJY1N1QlViRElPS1h5VUdj?=
 =?utf-8?B?MHBxZU9VTnFUYnR4Z3I4dGxvazQrVEtSYlJCL0ZZQlNrU2ZXVWZTQmxIL0RE?=
 =?utf-8?B?TkNIZ0hLSVBJai9qU3p1VTBVdWQ1THBOdUtKZGdHYUlEUlJ3UGg1SER6eXVE?=
 =?utf-8?B?TndtWEhhRHBXRWlqQm9aVHY5bTZ0UjRJM0s4VlowSXhVb0hHVCs1ZzhqYmpp?=
 =?utf-8?B?YlJKMVZWSEpNd0Y5K0RnZGRucm9Zdi9yV2hVTGtDckRXRFZqaDJ5Q1VkbWJB?=
 =?utf-8?B?cTVldFhlY1RjV2FOOW16d05vK2hoY2c0T1FXbVExNy9lUk5DdXFkejVZUXpM?=
 =?utf-8?B?aHYvaTYzY0MvNTFQMnZEU3VUaGUvaDBOcjMyUG5XSHJYakJaSE1zWHA4eW1S?=
 =?utf-8?B?TytFb2RNdzZFNHFxdU52NkdEVS9HMndXZi9XbkFtUHovWnFkMlQyVEVrUERE?=
 =?utf-8?B?YXFsMTJSM0FGVm0wUjEvazI0MEU3WHl2VWsyZ2k5MHpQdTMwcWI0SzEvZEQ5?=
 =?utf-8?B?RXNJL3dKRmkwOFFjSW9IMlE2T1QvMVlGRU9GWVo1cW56NHFKaU1aNndMZTJn?=
 =?utf-8?B?akpBWGNjSFZjTDA4SUlkTk00RXYzU3Y5U25iSzM2Z1lqSUM1Q1NMOEpLMVF4?=
 =?utf-8?B?aVNZaFVjUE1nZjlrZ3A4dXZKdC9vQkdsMlNJT1pxR2dpTHZPaG93T1UxbHNi?=
 =?utf-8?B?aklmZDI2ckFsakdXVnNNUXl2Q3Jyd08wNzhnT01HdXpWVFlwbmJvcC9oUzl2?=
 =?utf-8?B?eDhCNGFJeXVJMEpDNEhXdkdCOVRyVGd2dCt2U0FXbFBtaDUwMGRvM1FFczBk?=
 =?utf-8?B?c0QvaVF4Y1FMOEJGRXVzcVVXdDBpamZ6bCtIUzBsTmF1OWFUNWVUYXNWSWtZ?=
 =?utf-8?B?NEZMd2hyY0xTWkhHcWtYTmo0OUpWR0k3YzFmNS83S2JrYXlQTlVDQUoreFFo?=
 =?utf-8?B?ZTkvWU9JUUtqY2RLbkU2ZFJtNFJEaG5mWVJ2UVJmamM3bENNY3RJV0FCbnZs?=
 =?utf-8?B?R3I1QUhmcWpZdGlvS3k0YjIwUUhVQnNoNmRoZVBtbWc1VWZRVzVESTVSSWdn?=
 =?utf-8?B?cmQ5Z0YyMU1oWnFoQXc2a2djakwxVzg1U0s2aFJvdDh3VXdFSllBWFNEM2NI?=
 =?utf-8?B?REljUVZGbnZIdmRlbENYc01JbktUcjRDMC9SblBYMit3VWsvWjFFcGJjS28x?=
 =?utf-8?B?elMrRXB1OUs3ZFFjTUc0aVR6aEhQUHN4a3hWQUNETVhQTVpjajBUdTcvUVBT?=
 =?utf-8?B?ZVZYRkYybCtPdXhiR2YvdFNMVU9mWU5WTXRRUXFyNzRQd0Q1dExCYWhsY044?=
 =?utf-8?B?QWRMOGppY0R1VmxyODQrZ0dGQ1MxR0Q5L3d6bzJKN3JPRzJwd2NMaWNWTzdp?=
 =?utf-8?B?TktPQ1FXUGc2aGh4VnJ5Q2F0UHFyRnBZZ2xsL0ZjTmVkb24rZGw1MjdRS09t?=
 =?utf-8?B?MzR6eFRKaUxkcWdrSXRyWGVoVlBmdGFnNk5hOEFhNUJsYlVHT3JuZU95bmJG?=
 =?utf-8?B?QzRRYVJza2pPZkNHUjBLU3hpV0M2Wng5WFR0ZzQ4L2NITVE4S1pSWEVkeXhT?=
 =?utf-8?B?Q3N2V2lXS2JNalBEcTJMV3hLZWI3amVxSEE1dHpjR216ZFVuNmRnMHBwU1Rk?=
 =?utf-8?B?ckM3WENoOGR0dksvOHdTd0IrVG13Nlk0YmdVOVkxVFN4V2dxYzNHNytpa0lM?=
 =?utf-8?B?aTNnb2p1WVExWDRhUksyejMxeW5TME14ZmVIdTJLNTZBUU5SNDBYVmhVVFVY?=
 =?utf-8?B?MWtjbzJmd0hNc1U4a040N1cvVEhNTGlsNno2bmZsb0piZjNaaWQrL3crM1Uv?=
 =?utf-8?B?N1R6RmlWUUd4Uk15YUtOUHQyV0RNRjM3NE8wSVhCYXRzMFdkM0JHZXFVUG04?=
 =?utf-8?B?Zmc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e37211-ab99-4730-3a36-08d9ec6ed0eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 08:24:54.4176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMCs2e0gSL1VuILoRHTdCQ2ial4oq0smNp2P2H3f1BByKnG0RTA/2tZEAlP/CJKbj4cLU5iRqEw8cqkWrY9Bmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4790
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> As other patch please send V4 and add my
> Reviewed-by and Tested-by

I have submitted v4 of the patch set including your feedback.  Please let me know if you find anything else.

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
