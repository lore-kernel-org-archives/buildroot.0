Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164D3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 19:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BAF74051A;
	Mon,  9 May 2022 19:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLpL1nnCU9_y; Mon,  9 May 2022 19:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8827640114;
	Mon,  9 May 2022 19:01:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2631BF283
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 19:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01C48402EA
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 19:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s33QGSC18Tea for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 19:01:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::60b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09929402B8
 for <buildroot@buildroot.org>; Mon,  9 May 2022 19:01:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHyRq0cRkEqv2cCNEer2u9E0WJEO5wihCbu/8aqdz9ef71rjrbQG5P0i3ueD/zk2QZ0tRa73C3A8llvLbtUP18rUXC3KAfwqDrFxKb5MT0eYzE60EmUXkA/KmnQQQsv0Y5gmRFns+5V1dMoQE19A7aFkYK+b0gHOgjla1zSD8mqrq0UwC0/HQlXDf3AK3Z8oJCWL+I8K7kiRaUNC5Opq5oGJAklJKvB/Vgy+kjBd3jckGX0/mP40R6t2+cXUm5+spSndCLGN0+GQ5mP3cFojxa1lBrA3+wh14wW7dIufwzqHAprkj/HF9J+stk9Q+6zkRuMgsnLyWIZm3QCOR8CG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGRAL7cxdoGFyK22vQUFd9FIGjxgLRdd8ae8490nJQw=;
 b=cFO3nbX0yEqvKcrvneB4l7D0FZsHYwpqH0lo3gzaMK11JrAJ4Am3s4/L8k70lT4lG7hX1JLwX5/BmvF1I6Xl80juen9lNQOmFNhjSqwV4IK9rV3dcqJGmx9Vb+/5k5SStJbhKGlpD41SiVQgdl/1l5WyWC+dNfiaIDtYz8ISMXYwmZDnoz988l8vNJo48bagDyjDtym/b1ek2J+lU8qnijB4KiRP++uMvNQMVULHkn/d4Bnbh6DpGwV3lr6HSX/6z+lXRrgnbYbFIJRdXZxaBLlQXDRjNz4XOliPqYAVY22tizWCm8/smlGGEzYjP9awKD2GJ4Oyj0gQBzhf/a3cMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGRAL7cxdoGFyK22vQUFd9FIGjxgLRdd8ae8490nJQw=;
 b=bb4cWKBrrqWkYlmFIWLCWVLLpFkGFfJGZdudi8mPPmH5sYSJbQnbhhBKUW+CcaJEoGcFOMUXPWn94/XNRLxGfTmKyW2oZTdhm4sF5R8iXImnmNg2wUWZDez+i4Ha9LjGIaXp5lkqONsGIG6eRU6d87aPwX3XYg/q6lHnirGLNVI=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BY5PR02MB6642.namprd02.prod.outlook.com (2603:10b6:a03:20c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 19:01:10 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 19:01:10 +0000
From: Neal Frager <nealf@xilinx.com>
To: Wesley Revens <wesley@sonifex.co.uk>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADXACABF8KsIAAFGeAgAAdwwCAAAFaIIAAGo8AgAABPJCAAAWyAIAAKG0wgAANy4CAAAB54IAABngAgABDMbA=
Date: Mon, 9 May 2022 19:01:09 +0000
Message-ID: <SJ0PR02MB7758E384FFAF82E99CDEA261D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
 <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
 <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <f4f5acff-c577-b7cd-c708-4415c2a08b4c@sonifex.co.uk>
 <SJ0PR02MB7758243996DD3EB0BE94D176D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <7a83f95f-b3c1-9aeb-447d-9c7361158485@sonifex.co.uk>
 <SJ0PR02MB77588AD2DD701582C5F45A92D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dfd44be7-0dbc-0a05-4e90-ed04501e4043@sonifex.co.uk>
 <SJ0PR02MB7758B99F6AD8F668FE7F318AD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <73ea7940-e778-cdf9-9364-66773632efbd@sonifex.co.uk>
In-Reply-To: <73ea7940-e778-cdf9-9364-66773632efbd@sonifex.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f34df62f-9404-48f4-e9d0-08da31ee4797
x-ms-traffictypediagnostic: BY5PR02MB6642:EE_
x-microsoft-antispam-prvs: <BY5PR02MB6642C0F6B05F52C9C39298EED7C69@BY5PR02MB6642.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e2OCzC16zYZYwwy6bWjbJQ/qf5R8qvoySzXfQbjFO8/lqm/oXcOeRzDBDS0l+erlKnagQczKJv4aUfTM780+QJWedhMfPM9GaQFKHMdehTHoAXnNZroAX7c3925JurX2c5G2cBnCvAICw0zPpcSuEXv8BMjRUwL8RuHvLHis9hjX4cixz4JF4OWuq9PMnXI5yy0gfOsuw4COAgSxZ9XJNYDBFU4sT0iSchoyOuZCSvEm25K/bkk/IdWZnGVob8TbCAp5+umrYrL1LRqjrzvxst7Svo03WV224WgAi2fmqkrCucy5GWie6eKUiiEnsHukzVhNB6nwI8n0/4F+0DNx7/g6i06fkewXvfRJAU7UxaoeFUSibxzmeFeXm0/qk7IUU9JtA91WxPGofyH+2jJxR409aLiD9F+NXnzGs9BDbDiGFjluwvRkY7fLCozqHi8v1mNNhQSQD/wK/qtQlvINUp366kq0LhU0/1Q7h6T8Y1tSPLLiPHm52fn8WUUT7zOCsTf65K0suySz0aUEYt8Zkkrlk/3W2wqGMosl/aV4wdq4Xl8bEPbYH9dXhF+wkaPjQhcP2dWGmtHh83KL2tRl3RxPwbBg6UHQuIz7mvHvG2/jYyEoR7r/MLDhtLdGq24bHstBIVUXCtkh5oWm1gRnzxUclWbaxSw7+jNjqjEgVRjgXtxkHn0qnVx/RzJG19Oo97IUmlt417kSBFUoig147w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(26005)(71200400001)(66476007)(66556008)(9686003)(38070700005)(53546011)(76116006)(8676002)(64756008)(66946007)(86362001)(4326008)(8936002)(66446008)(33656002)(52536014)(5660300002)(7696005)(508600001)(2906002)(6506007)(110136005)(55016003)(122000001)(54906003)(316002)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2dKMTJSNXdzdFQwV3ZuUVB1OWgxZE51TUExVzRuSlJGb3NGN0Zxem9CM3lm?=
 =?utf-8?B?ekRNeTAvUG42YVBuK0h6eG5FSEI1bXVKQW9JbVIrRFhnaE45S2NqblhCNFBn?=
 =?utf-8?B?TURscjJoaWhyYjFZMWIrc2FER0pDN2svZ29KSGo5T0RuZzV1d0xodWxLNG11?=
 =?utf-8?B?WnovMm96bE5NNlEzWks0WHphNTFIbUk4SnhIV01vMlI1NWdtVldZV1lUK281?=
 =?utf-8?B?Zk1mZjZVYitRMlgxaUpkVGNnYUtmcXZKcERNWGNYb0FyN1lzM1Q4RFgzRFhz?=
 =?utf-8?B?aXlmcmdKUnk1RlRSRlMrYXRtVm1jNjhJdlNSN3VuU0pmREN2Q1JDSlR2VEpR?=
 =?utf-8?B?NlorRFI1UFM5SDQveDFseFRnM3VUVFFqcG1ZNVRNUHQ5TW5qd1R5N0pQSlVP?=
 =?utf-8?B?djAwVHE0dVlPK0dIWkcrTUtVeDNNQWN4MnQrdjBlQTFaRTFYZWZ5bzNGYjFO?=
 =?utf-8?B?SW5DUlBBNHo0NnhuSWRxWWo0M3gzdHJJSDFPMTVKcjJLeXNUaDhsR0pZdUY5?=
 =?utf-8?B?MXNxSlhXYURBeWdhZklpOFBOb3JYWUpUanFrcE9iY0hjT1ZJR28xQmNrQ0xE?=
 =?utf-8?B?L1UvTHdPa2svZDNkeW9sSjhqSmpSUXJpOHUxYVp6M0ZKR0JqeDlVLzNSL2xD?=
 =?utf-8?B?QkVxUGNaRzcrVUI0RmlPU0EyQm1wemNMeXRoS05tS29vRTdlRllwZUhqODJW?=
 =?utf-8?B?VkdPRnJ0c1cxOUVrRXhSNnUvYTY0Y0RSelBkUWIyTXlUczd6WDgyaGlPYjRq?=
 =?utf-8?B?VXF2czVxTG9Na0FlRkR2anZJS29KNXpXSFNuOUpoNFViaVpWNzdTenkxdEdz?=
 =?utf-8?B?V0xWbnFONC9wbUxTNWhzTnhmV0hOS1RiSVBqQzVjMyswbGZOZTNoRWNQOU9z?=
 =?utf-8?B?ZWNKS2FsWHQ1ZHo5bVZVZ1VsVGN3Z1pwWndhWWt6Mk1uSk1ZRFIwckM3TmNu?=
 =?utf-8?B?ZWVsRU04aXdKVytKL2VycHFCRkdXY280RU9lOUxhcnl4ckczSjl5U2lnQWIx?=
 =?utf-8?B?SmpqNDVCOUQycTRhQ2IwOWU4S1U0VVRqbG5uS3dLRHlxWktsTXZXemJjNnhP?=
 =?utf-8?B?THRhSEFiazlCT3FYVjhONzFZbnlhZGhCRjRIOUVyMUR5enMySGVwMW14ZVhj?=
 =?utf-8?B?SHlaT3hqblJUd2FCbXkyZFVEM0lwMFZKclVVajIreTZ5NTR5SExtZGw4eDFP?=
 =?utf-8?B?LzNsN2RjWTVJak1JSXRZbkpPbFZvOFZuLzgwblhVUG96RGd5b1JTQnNPVGw3?=
 =?utf-8?B?dk9XM3pZdzdCSnFFRGo5M1Z2Sk51Sk9ka3k4VVpab2pxTVlxUkhFVjYvWTFt?=
 =?utf-8?B?eEx4dmxmT1k0UGFCVjFaYXVKWXZFcVE3ZWJuODVBNkc4Ty9nY3JqTVdZWU94?=
 =?utf-8?B?OHNGZTJwejNVNmV6WWp2czFuTE1acUJURXZFRXgrYm1WZnh0OG9HeG1PWHRo?=
 =?utf-8?B?c214d2hLQk9jMlkzUzJtcDBNS3pMajljSTRseUYrYXo3R0dkWDdTUllRWDBi?=
 =?utf-8?B?K29tMVdjNVYvNDVodkVsdS9KV2RrRkgrdmJ4enZDS0lJQ2p0ZitOdnA4UUpV?=
 =?utf-8?B?eWhPSVI0bDNjZ0VTeE1RY2Z1eFFLc2QwaVR5MmJWQzBWM3JONlVvM1VLcHJn?=
 =?utf-8?B?R0oyWTl4eHpjeGpZMlZCanduOVVCaEpaazcrVmhRWEZxOVRGRFgzWjFDQjdB?=
 =?utf-8?B?RTgxY2R5KzliU0V5YXV5VTlHNlpKNmR3cjVzSGs0YWM2cEY0LzhGczJaKzIv?=
 =?utf-8?B?M2N2UU91TVBlbzhYUEUvUTVNK3MrZWEyemZVcFZiRVdQWDJHQWYya3J1c1Vs?=
 =?utf-8?B?RWJUZUtsenFBNlB0ciszVXdQYzg5VmhwQzhCVmtDNDhqMVIrSkJEbUlKTVg5?=
 =?utf-8?B?OEkrdE9zSzNDOTJhTmNpS2V4c0R4TUxzRXdFa2ZVdmxUMkwzZVRxQXVvOWZS?=
 =?utf-8?B?R1BhdU5iY1IwUm5WNE9HM05UTDFIWWpYWmZrYW1IYjVtMEYyVEtCeUhrQkdO?=
 =?utf-8?B?eVdWaTV6NG5rQmZuSkE3WmxFTndPNm1lRzE5K3ZtQVRNOE1MWXZTQkFGalBU?=
 =?utf-8?B?YzJxZlFWL0ZFYVZadUg0OGlNT3p6bXJ4TTlWUGdLa2pXbVMyY2txdk0zMTJO?=
 =?utf-8?B?YlJBL3FGTE1Zc1pOTUtnakgxL3o0Ly9SSW9jUWhOb0c4eVJBai84NlNmb3oy?=
 =?utf-8?B?Z0ZTb29OTjZWL2hXSVAyUW9Ldm5Ud05GekhUZHI2cXNRRFVxOEdLUFpQS3J5?=
 =?utf-8?B?eG5qRW1XbnVWSy9sanlMQVlaNXN6dXc5MEh6WjZJUXRHZ29qUWw2YnZWbkZ4?=
 =?utf-8?B?RmdrM01vaEdHQ0ZPUlFpSXpKck5Bby9Ic2dnNGx1U3RuS3BrUkNOQT09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34df62f-9404-48f4-e9d0-08da31ee4797
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 19:01:09.8993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cf0k2qTL202y8vSTObhb+X+Htk27NY70smycyvHUnllZ0LGgBJGDdFbljvQ3bbZTb5wZcEfT0BE/Ka5jYo5KaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6642
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Wesley,

On 09/05/2022 15:41, Neal Frager wrote:
> Hi Wesley,
>
>> No change with the updated psu_init_gpl.c.
>> When using the pmufw from the 2022.1 BSP is there a different pm_cfg_obj.c also required?
>> I am still using the original in buildroot/board/zynqmp/kria/kv260
> I am currently stuck in the same place as you with the exact same boot log.
> Glad I'm not the only one!
>
> I generated the buildroot/board/zynqmp/kria/kv260/pm_cfg_obj.c with Vitis 2022.1, so this file should not be the issue.
>
> Also, for completeness, only the zynqmp_console needed to be correctly defined for the atf as the zynqmp uses uart1.
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ZYNQMP_CONSOLE=cadence1"
>
> The PRELOADED_BL33_BASE parameter was already correct by default when using the zynqmp platform.
> If I leave out the PRELOADED_BL33_BASE setting, my ATF does not run and I get stuck at the end of U-Boot SPL with "Trying to boot from SPI"

Not sure why.  When we have a working version, I would suggest testing a clean build.

>
> Once we get this working properly, I will patch buildroot, so other users will have a working solution.
>
> Thank you for your patience and let me know if you make any progress on your side.
> No problem, It will be good to get it all working
> Best regards,
> Neal Frager
> AMD
>

I am getting farther along by doing the following:

fdtoverlay -o dtb/zynqmp-smk-k26-xcl2g-ed-rev1-sck-kv-g-rev1.dtb -i arch/arm/dts/zynqmp-smk-k26-revA.dtb arch/arm/dts/zynqmp-sck-kv-g-revB.dtbo

modification of u-boot.its:
		fdt_1 {
			description = "Multi DTB fit image";
-			data = /incbin/("fit-dtb.blob");
+			data = /incbin/("dtb/zynqmp-smk-k26-xcl2g-ed-rev1-sck-kv-g-rev1.dtb");
			type = "flat_dt";
			arch = "arm64";
			compression = "none";
			load = <0x0 0x100000>;
			hash {
				algo = "md5";
			};
		};

./tools/mkimage -E -f u-boot.its -B 0x8  u-boot.itb

Using this u-boot.itb at qspi address 0xF80000, I am able to detect the sd card and boot the Linux kernel.

Could you give it a try on your end?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
