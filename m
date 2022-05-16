Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F157C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 15:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D6D41843;
	Mon, 16 May 2022 15:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHrIl6hUM_rH; Mon, 16 May 2022 15:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C402417F7;
	Mon, 16 May 2022 15:11:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE541BF344
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CDB880BBD
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 15:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gCT8AB3Rw0h for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 15:11:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::615])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91A8080BBC
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:11:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0QgvCqE3RCC7lWTjqh2t956Q8zGeRv8LIITxCbyh4LFFcSerj0f/ErIYQK5P0vtXcqV+pejl+jl4c5CPUyIymwuYzUrbnV1mRwpemhdjbdm1cj0F8++MVdfZkTtCr1Gv2ThWNpJBKJyLrX3NVulvAWqIVVSJNGR9VhqLMBOK0KOfv6noH/HeAJvAHPQIlcZTYi0HLbBhIWAWVYEUN7OSPcrN23lMB726hdHNVj64R9W5OJ0+NiEDfBoqWf4gInbHoaPcnVNE17en3yk7aJ2vHgd0ZRaBk4gWnbC7qNqIJyJfRbv/L1UhXwZs9XFr4NSBTbl/+evidiQjcbEi8efhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZOslc+sLe+T5d46tP7pnYs2ok8jAA3mOgMSeZO/2v0=;
 b=giHrgaMjv2SOX4TuW1XiOHtBuRRb7V0qXjZKTv0GWqE4dkzqG4aZ8+INL2/o8N6bRLXzpgNjTTCKUZr7XCcR/e9ltTdJCS+NXoSeb6kNtgP/82APwUJv1V2QdhtyWKJnMvvoet8uig6H5X1cUlgmE/g41+5dDPCUnU4ajBDRBtThvN+1xwQr5nitA01MHAmzC2A2RaO+AESmeL3QN2oQIpt1UAXXT7yKl+6NrhQUzR+x36b6TElQkpa2qJV6OhRvUwes62xajjKLlS/rWQPhw0DfCXxfng1LJ/PBXC0Z3V/dO2jAtz49Ss92+8GZMzMyIgcET3fpCTwaKvBpVkmiWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZOslc+sLe+T5d46tP7pnYs2ok8jAA3mOgMSeZO/2v0=;
 b=Xp/+yp38K0Rg7RmU9dnZZTYG6p5kQJDeZXnxGeOUXmFXPjzD2+wx0gkOdCshyMP1qZwU+A6LA87ICW5E+Jf6nWe1eks9yBj011UGNrwvo4DuL9Zc71yL99vUP1cSZ3x2rZSvPNsBrqEBADOGEDbGNYNZiAssIpKgjyjK3qQOGk8=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by CH2PR02MB6556.namprd02.prod.outlook.com (2603:10b6:610:62::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 15:11:37 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 15:11:37 +0000
From: Neal Frager <nealf@xilinx.com>
To: Michal Simek <michals@xilinx.com>, Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/3] board/zynqmp/kria/readme.txt: improve
 documentation for qspi programming
Thread-Index: AQHYZplDNh2ZfmHyzUO7eUGTKjLFXa0hhlCAgAAavzA=
Date: Mon, 16 May 2022 15:11:37 +0000
Message-ID: <SJ0PR02MB7758148B86D552D26D8A5A10D7CF9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220513071444.2966858-1-neal.frager@amd.com>
 <d4b65d3b-b825-1c0f-e2fc-1ce4d6e5b0de@xilinx.com>
In-Reply-To: <d4b65d3b-b825-1c0f-e2fc-1ce4d6e5b0de@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 785a6627-2257-4e5f-d9c5-08da374e5f8c
x-ms-traffictypediagnostic: CH2PR02MB6556:EE_
x-microsoft-antispam-prvs: <CH2PR02MB6556F424B0BAAA285C2E5EFCD7CF9@CH2PR02MB6556.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sh6VlAGBsJnVRCW+BhDnEn7ROC185hFvsgcq5FuNDLkZvhpY6jI/2BfEvrrHeFO+/fTob4pWhXElCF/gN2vSIqiLZTOKG5ODm8QM/0w5uV0AxMPfIsrCuPREIERXqzb2dpuZfcSu3X04i5d7eYaPnduMMEIFR4SpOp+3cpL60amFxfD7wkfNtgimRqUirVbk8NCGOd7CrYr/Zc4xuUoxdEIbGQ8d5O0r0trCySQBe3xTypLjk0PoR9Kz2XppyKD8Hg+95WlHhYF8/JZFXdflZylfDdJ9n1DGd+n3++A8mS41sDBRDk1vrFWCCGQnSRBMWQyQsDtxSXzAZ0SFgqQ+MM1m3+WY8vsuNz01xiAik7ly3PTR6dGpXQBTwVTF9xQSvbilhP8Wt6jFua3w+9JJe8cR4gscAlJZ0yO3vO0tZs+enFWHJj9Aw/PAEap6SaE/Z+2/17Hi6fD3U56h78sunBZ46C4oCkLr98sJX8a8Hq5cZgj/l2fqwdk+Xw8+IavA/SqVZr8h6KY8EzN0bvyVum7T/zQf/9CU2ThtNegDWJ99BmbCBAkJ6dl7euCFXBInqm35VfMoWDqfOTfroGK2ItD+8gtHRvv77fAIJUT4Q34gL1f2y/hwPj0MS3lwAAbrqF/3OINWCF/Uld5SPSf54ejS9HdhZcwO9c9fJG4NfVZ5QZLWETuO4CV9YJJZbFY9zUkFSxA6wb+UbaUc0+Sdig==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(64756008)(66446008)(8676002)(66476007)(66556008)(66946007)(76116006)(508600001)(8936002)(4744005)(4326008)(5660300002)(186003)(71200400001)(86362001)(26005)(55016003)(6506007)(33656002)(7696005)(122000001)(38100700002)(38070700005)(2906002)(54906003)(83380400001)(9686003)(110136005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGtkVmM0cm9MTVVBTk14d2VzOUp1elhPZ1ZMQ1FxWVpTdmZCemVhaHYwWDJQ?=
 =?utf-8?B?WGpJRGx3eTFLbFpZWlM5TmN6N2E4a2w3cXhhMWI3TWllNEpOMjRBMGkxYzVF?=
 =?utf-8?B?YmhxcTBDS3drOFViTHFUTy80VmlBbGtXOVFjeUVRUUhZMi9tRlpSK0NuNjVM?=
 =?utf-8?B?Rm5zbzlNY3hTeitZL2dJakZNMStQOXlnUzRXK0UvckZoNmF4YVBFT3RGOGJM?=
 =?utf-8?B?cFZOd3Q0bEJDMmY4N0JSK3FKdDNFUnNjM0prSEhSc0xJRUhickRuSWNnWG1C?=
 =?utf-8?B?ZlpJcTk3UHd4cldlODQyblhZbHVjc0RzdnBBRDNpTllTZzRJN0l0UGlYbGQ0?=
 =?utf-8?B?S1VHUXNzb0NrbjQxKzhWeGxLa1lnV1JpRjYwZkVIUmx0aGdhMjRlWnBBTlUv?=
 =?utf-8?B?UEZrRFRkRzVKRzdNREQ0RjF6Y24vOE01VFRkUGZVMFNsNjVLM01sTDhGcWpL?=
 =?utf-8?B?Z2dXdEFQUTIxZ08rMitIU2puVjhHWk5wWllpd1FlYU9Ka3RQd1hKRzIvMzFM?=
 =?utf-8?B?MStHN1lEelYveFRjVTh5YzRtM3hBMXMzZTV2SGhBQW5RWWRuR2NRdWdXUExP?=
 =?utf-8?B?a3ZiZFFDbDFCcmNkSmFsdlRkV1A1YllCZGJrQzNWRlBzSDZwMVVzbXFKRWhx?=
 =?utf-8?B?eGFVdlZqREM1MmRZYnozUXoxdXQrVUV0QmtBeTZpTytmdmd5UU9pMHJYdXcr?=
 =?utf-8?B?RWt0RHlEWVZmL1hNSHhuNzdqeFRBdExVRVg4VTlrZWtGZ0VBQWcrc0RmR3Nx?=
 =?utf-8?B?RWdwZDlXdFE3VmdQajV4SnJNV0xNcXoyamYvZk1DSVJQR2Y5TW11dG0zejlI?=
 =?utf-8?B?eHBtVWJqeFFoLzRzNkg2RzJUa245U3ZITk41ckEraEhjcmU3NjJGOXFmM29V?=
 =?utf-8?B?U3FXQ1lzb2ZnL09sTUVudk9zTVNWWDAxTmI1Wk5LLytlNFZPaEZOWWlJQ3N2?=
 =?utf-8?B?UkcrRTVlQkQ1SU5LOWE4REs4VC9WZWdwRVM0UjI1cm1NM1h4dHgwRStWd05z?=
 =?utf-8?B?Wlk1U3lQRUtXeE40T1pTRkFHUkdXenBxbjJENkZuT0U3L0phbWlZbFZwbnNY?=
 =?utf-8?B?QVU1TlNaRWpVcFVwclZsRFVuRjE5WHpyVE51b1QxbEhDdnJnV2JKL3RXWFNB?=
 =?utf-8?B?M3dqMGdSRGR5SzdWbG1reFZqWDVySG8zcUhsLysvZjJnMVFlVk04K1RQZ1VN?=
 =?utf-8?B?NzZjb0JOVmVtNXdBWWtCT0dsajVrY1MwdEV2VTFBU25MMGZaeVJtZVdpVmM2?=
 =?utf-8?B?NHl6cFJGUGo4QWVHVENQMlFGdGJwNU0vZ1ZlWGMxZkt3SlU4c1JBWGNjZjBZ?=
 =?utf-8?B?NEx3NkdNNndDcXQ1eG82SjJjeXZFR0ZqTWlWa2ZwU0RnV1ZENFVIbWxhQlVJ?=
 =?utf-8?B?T0VUQUNPS0NOWW5rcG81bG1EQ1I5b3JNOTk1U1lsdnZpenB4ZU4xMU5XU09i?=
 =?utf-8?B?RDdBZHM2cUNoVkU0eEgzVUIwQWVGS0NCZ1NNQm02dEVZRGV1VmlGS002K2E2?=
 =?utf-8?B?TXhaR21wdGwvRnZKQ2tsV0hBVGVKVUsxRTN5ZEQvL3lEcEZEMDdtYzR6a053?=
 =?utf-8?B?MGtZSTlsRGxYWndaK1RXNWlnYTNNS2hKUStJeFRudnFnNDRsL1BFeVhvTnZo?=
 =?utf-8?B?bDFueTQ1QXA3cU5WRmQvKzJma1h4Rnd2b0RxbTNRTzlzMzhjK3g3VlUrY3dJ?=
 =?utf-8?B?UmV4anFNcnJKczB3Si9scVZ6N2dqVXV4aWlZc0ZraE9oODRpUG11dXVBN2wx?=
 =?utf-8?B?bXRDS1pweW5EVVZ1MHN5ejJtN2ZRa3hEdUtVTy92ZEowNktoQ05BMzl3Wldv?=
 =?utf-8?B?SGNsSDZhZ3JLQWIzSnZMQ2pkaXB6TkdqakdsTWlUN0tMdEpDU0hCdk5lbzhF?=
 =?utf-8?B?NmUrVUxBeG4zcmlDakw4aDVZbFRsbVdyN2d3dndRRG1ZZW5RZDN1bXhaSFE5?=
 =?utf-8?B?dmpIZ05tbmo4dUlxSzh0RXE0ZitaZ1l4VHVIUWJtMWZJT2Y1REdrNk9seWE4?=
 =?utf-8?B?Z0VlYWI3WFV5a1JnbjNoeTJXenZIdGp5aDEydHUzUkVqcHJiTFNybXc1L3Fr?=
 =?utf-8?B?emRkN2RuY2V5RFhQVU10OVlOVFlsd0Q2RUtrWFNicC9aWjdicGd0Q08zbXVy?=
 =?utf-8?B?SHQ2NmJRUFFVeExYRmNRVkROUGRYZDgreUFnTkI3UjNZU3psSUUxbUNNcmQz?=
 =?utf-8?B?Z3VjUDBLQnFQcURidnM5bEVEalNxeXJPRUFWZS9mclBLY1R2eFMxcG9nUjJO?=
 =?utf-8?B?NTVSM3JWdWtCQjJWZ2w0NTd4RlJVQXcrWkVwakhKNk9yWWcwVkE0YUNpdUlW?=
 =?utf-8?B?dEkraE1vU3RlSmptK0hpQVVwQkZKSXVXMXpQbGE0M0JKckNMYUt4UT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785a6627-2257-4e5f-d9c5-08da374e5f8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 15:11:37.5764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mug9KfKlPJQylnFTvX0GGwrDrcTYheM9T4wE06jhwf8oNu8WS7axVp25N9yzyZ02uSh8Rc0gPHAXbRAcKAKgpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6556
Subject: Re: [Buildroot] [PATCH v1 1/3] board/zynqmp/kria/readme.txt:
 improve documentation for qspi programming
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
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

> This patch improves the documentation for kria k26 som qspi programming.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>   board/zynqmp/kria/readme.txt | 28 ++++++++++++++++++++++------
>   1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/board/zynqmp/kria/readme.txt 
> b/board/zynqmp/kria/readme.txt index a3a4b5e65a..d64427a52c 100644
> --- a/board/zynqmp/kria/readme.txt
> +++ b/board/zynqmp/kria/readme.txt
> @@ -56,23 +56,39 @@ Where 'sdX' is the device node of the SD.
> 
>   Eject the SD card, insert it in the board, and power it up.
> 
> -How to write the boot.bn to QSPI boot flash 
> -===========================================
> +How to write the boot.bn and u-boot.itb to QSPI boot flash

> boot.bin.

Good catch.  Thank you!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
