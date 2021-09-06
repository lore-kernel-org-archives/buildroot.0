Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89E4C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:57:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E4561056
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 12:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53E4561056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1080440455;
	Mon,  6 Sep 2021 12:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOTvmuPuGAsh; Mon,  6 Sep 2021 12:57:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2853A40227;
	Mon,  6 Sep 2021 12:57:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0701E1BF2A0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAFFF81BF4
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 12:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=nxp1.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7kbuXlq3wmw for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 12:57:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::60c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F43381BD9
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 12:57:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5ygVLslIv7wjjYvah9mNbKcPFiurrDKUcCOmcgws2C0c8f54d84aJDe6pX1S3VAVWlE6V8huPvZIK32sJIRuzRBytJVCw1Jd8wG209bq+7SkqWDBTUm/wvJYBK6LuUdWeWlzUxG4SGXRpfQXdvFUNYwgduRGf4Aua5zUvS1pHxAckJrFrlyXVdCJVzNfEGImDOR0ymQTxKcSTYQDiReQqH8u/IoWatz6qXOenZCB6qz10OeiM1Ihl9gsAm5EJ5HvcOJEn8OGCsQs6Ga2qy5kvlw3KyeZ/YsOyjlfByt1BvaIkTU3hg05aO9ED7iphvyU69EDfpzG2WK/xLksqwz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tGnq7aq4RT5Nm742Qi92GggkwYSIo/aGDmWb/MsoHnU=;
 b=AkC5goaJIsuL4mcOaoiGw0to67C3dWRwWKkoxw5Y8GonoWb+devfctV7b6pfs6JuobQO4ozbbltmF+OODiyNsWTELL9MYqx1T/BRScSrxL3tqcD9R8ML74Fan746JUhuzK501TYy7HjNOq8tBRgKqJt9F+JFyc8NWUAFq+4Fw7PbwWMjTLW7TncUHMRPqk/OJlLV/tb1WugTydx7C9lzQj3G1+seUIebA2i3Y4TzKtEOnyDToprCJ5hmbfdd7YR7xnf8jZSn279uJqBsRfYsC0y4s6UFaxIphkdKKFDDBBiDIu1mHTs2oOw2EKX+UbltoeGupBAUviNXkEJGlawORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGnq7aq4RT5Nm742Qi92GggkwYSIo/aGDmWb/MsoHnU=;
 b=NNuw2wkLbTDzzLU2qDFCetphXpopt8rZMiCjSOW2KacSfgsTqpGp6JnuaTvVBhL9g4ylDbFMOI7aVX1jtRGNhVD6yH/hTupkrqNy9DhMJdxxb5aBZzjx/6P4wS7Ux2Wj1UyV0Zu1zNKDgErBy+RZAAxo/ILmFRA8ur0zY8rlIOk=
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com (2603:10a6:102:20e::19)
 by PAXPR04MB8800.eurprd04.prod.outlook.com (2603:10a6:102:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 12:57:50 +0000
Received: from PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::f573:dab3:ac44:45ac]) by PAXPR04MB8863.eurprd04.prod.outlook.com
 ([fe80::f573:dab3:ac44:45ac%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 12:57:50 +0000
From: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH 3/3] boot/uboot: copy IMX firmware files to uboot package
 dir
Thread-Index: AQHXowOQdGcQMvB+i0atJKfre3rlV6uW8lxDgAACk4CAAAJ4nQ==
Date: Mon, 6 Sep 2021 12:57:50 +0000
Message-ID: <PAXPR04MB8863B5F17E3C34C5E9E36160A7D29@PAXPR04MB8863.eurprd04.prod.outlook.com>
References: <20210906094214.6142-1-heiko.thiery@gmail.com>
 <20210906094214.6142-4-heiko.thiery@gmail.com>
 <PAXPR04MB8863813E1952003264B49565A7D29@PAXPR04MB8863.eurprd04.prod.outlook.com>
 <CAOMZO5DOMp_JG3TFqv81C_zz1AKXm_6=dwRmwFGQuHC9rgpivw@mail.gmail.com>
In-Reply-To: <CAOMZO5DOMp_JG3TFqv81C_zz1AKXm_6=dwRmwFGQuHC9rgpivw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7378831d-0b96-46d8-496d-08d97135eee8
x-ms-traffictypediagnostic: PAXPR04MB8800:
x-microsoft-antispam-prvs: <PAXPR04MB88005F58E46396BBBE80DCE9A7D29@PAXPR04MB8800.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FG4DFOdV+t2C4xSlUmQlidtEwVB62scerMbxFEDpHQzWC57q1vqdy4x7lhrXkcTgpKJ/g1Qefy0RKo6fjYO5ybnJb4QktrAgVxCWA4leW7mhIR3xvAV+B/2HJS5OBbIYAInXTv6plyjRnSsvXbHBwdQTk6YCqC8USrFJpd9aG6pir2vB6iDnYPDvtjeYo7y9gn1aY1T+94R7Am2FzCu7frncbclietQEJb9dd6ZNj3O92P3rNsqY/ytfov1e8JbARW684a9mCmZUs/zCRe0o6BkgM+3+HrdoD3losw5BtViIqI78p5B+XuF0MqZfr0eoKDCVKz/n7XXX/qNiQAj1Jl9oGRlkNzCbMI6EXn0HAQNgov7eSGjoUIWSahM0p6SksILCUxFzLCsdPJXRo7HsOZYyhaKYSlSbI4ZxHEz/7wF46Ea4TIUsCL6/Mwmpc2evastr2/R6mDdjXTl5LkVyby5LYsjMwV/kC+V4RmpiYDWZbKwWEJGnr0ts73UOTgdduPwvbWWlelZIYAmSqkHhI+deSFoKUr1gBnGeB7mepPMB17Q8hQ6R01yLQcuqlIU3nAPFXA118nL9zUwae2bQOCj0DdHuBwHlUEooXsZEB5FlfYbJ+HQdwZtw/mwIvGPWtuGKR6+qrL+PzrjRRuQaEJb8jpc0QhiW1gxNcNuELlr2N2xWWTsDR9pF1JRZBGgU5eZp2DmKBwpjtQBksE8Jvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8863.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(2906002)(5660300002)(4744005)(76116006)(38070700005)(4326008)(26005)(54906003)(66556008)(66476007)(6916009)(66446008)(64756008)(52536014)(7696005)(33656002)(55016002)(478600001)(66946007)(9686003)(71200400001)(316002)(186003)(122000001)(8936002)(38100700002)(6506007)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UilKFgJ/D449APuyk58jQsJuITnniGEWL7dt4r6GCZvpgxMyXC2h1/bv2V?=
 =?iso-8859-1?Q?3JBqIKtkpgzUbgG5mUItP3zkvAK+npA+hX1uKG2mHCUE6hb1XEHN4atq6m?=
 =?iso-8859-1?Q?rGs6WnfKmpScEtC/F1sGGoPKBhDKbVZOwKG0ssH1oc6GY2ZCycduAoVyAT?=
 =?iso-8859-1?Q?+0jwpgvK397a/jSQk0EhgLNZDGKn/T1Pz5CpSlLjHUo8d10ffIDLccqOfa?=
 =?iso-8859-1?Q?sZhs9LyAAXbT1Lgo2zy4GWdxWMXYSj0S8dytpGvUUYTxHAPhPFUDOUFxrC?=
 =?iso-8859-1?Q?+OZRLir+gZ9ZYilQDEn4Y7t/io64heOIyCBNG0k4uhRcdEtmftfd9SjUtW?=
 =?iso-8859-1?Q?eDGu1NzMjuqqkbLLdgkp99v+slPbR0/YMyK2HSdzqzkmsbs+18gE+J716M?=
 =?iso-8859-1?Q?VpAoFWxCOABGyjlyGnHSthtRu4vBcP3izwPyNkdPdfxMFThNamO0CY6/BO?=
 =?iso-8859-1?Q?T09BWjddbOKHFuMegwB7M5Wjqw/prwORiymy7aktv8sWsAYjdnQ10GhkS5?=
 =?iso-8859-1?Q?Dpp2Uts4/XK5Tfp6MySTZrBkoQyPrra/LqLRDilqID3wwjRaa87I8NkjE1?=
 =?iso-8859-1?Q?/mZBGFo3JmNzuCdpcLRIUA2gBvLTTbCnLRSaeJkMsxhbNFAXVoAIzmBfIG?=
 =?iso-8859-1?Q?m0905bSkKFy9BRkGRR9vs8VrfiM0kEpVtSTlpjzukKswFH5U8n5WtOS9jj?=
 =?iso-8859-1?Q?W31QKplL5b6zV42NAApsiQqOP3NPMEJr54A0rv4JoZYljahEOTzceTikMe?=
 =?iso-8859-1?Q?nvXiNH/CXJWCAnsIyJ45v5qJIDxJI9aW6MrhMPNekJUS7AJ7U617+8TPY8?=
 =?iso-8859-1?Q?gfTEAn/enCrwO3mxK+3Tv0cO66rjWH8UD5CFLTO6yO3QbzXhRbRO1/DrJm?=
 =?iso-8859-1?Q?7UR+aXVYqy5yMjo7Gl8Hv1xUUQnegLnQIwCsbVn31/6a7dTFWFJsAJb1i+?=
 =?iso-8859-1?Q?JE93Uo9QJzmsId+vPC+4XDMNr9qhw+PdQxxSh6QHwYUv+28tXOKzsKj9Ja?=
 =?iso-8859-1?Q?xR/TLwxYRWAWF5+jiWzxh30vr8ERl3uwaZaFI3Ji/fHdwg+8rNh1rsWp3l?=
 =?iso-8859-1?Q?JgHwM6ZrGBJZGPlg5YNwbS0mTYsQL8inQbfVft6KNoh1N0e6ma2/IHrz0Z?=
 =?iso-8859-1?Q?B2xliH12uKnqeEk7WIq41TWDfPjFpBYnDu06jlGmsW/dMWeNn5OjLGvIi1?=
 =?iso-8859-1?Q?oYhU69WFAAhc8SHSe+/OqmlU4/1KfD9RJiZOc0cM7FujWXo4jPLWoUr8HW?=
 =?iso-8859-1?Q?r/ikO0gSmSnTRenEtImk6h8+qB2UJSNVyDoi/2YRAnO/+MsKaGDIcdt0M9?=
 =?iso-8859-1?Q?2ndVgF6TPt9w1iHj0HSsSAYFA6D5zsT4AVVW1irjULM3qaM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8863.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7378831d-0b96-46d8-496d-08d97135eee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 12:57:50.3847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KyzEKzQmvWPlyU+d3hfkmSvWcF/KcAl6jzbim2YsS/pQQpyEbVd3/areMfHurtKswRqf6CWQRSPD+XoQ936RjLJU/tboOvyuAjBbQtW/niRFv4Oqs0a+EaGqoB3XTfz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8800
Subject: Re: [Buildroot] [PATCH 3/3] boot/uboot: copy IMX firmware files to
 uboot package dir
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>, Xavier Roumegue <xroumegue@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>


>Hi Stephane,

Hi Fabio, 

>
>On Mon, Sep 6, 2021 at 9:45 AM Stephane Viau (OSS)
><stephane.viau@oss.nxp.com> wrote:
>
>> >+         encapsulate NXP specific firmware (DDR, HDMI) inside U-Boot.
>>
>> Are other firmware binaries also concerned (I did not check the U-Boot code) ;
>> such as VPU, SDMA, ... ?
>
>U-Boot does not need the VPU and SDMA firmwares, as they are only used
>by the kernel.

Indeed ; thanks!

BR,
Stephane.

>
>Regards,
>
>Fabio Estevam
>
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
