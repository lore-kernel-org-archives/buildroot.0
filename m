Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A651C433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19BCE61266
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19BCE61266
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB5A180F3A;
	Tue, 16 Nov 2021 16:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i52L6ogEAifi; Tue, 16 Nov 2021 16:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0DA380F36;
	Tue, 16 Nov 2021 16:32:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 990211BF2C6
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 16:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 880D280F36
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 16:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8CU4Iijw0pk for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 16:32:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E73D480D61
 for <buildroot@busybox.net>; Tue, 16 Nov 2021 16:32:47 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E5A741AF3;
 Tue, 16 Nov 2021 16:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1637080366; bh=8G0Mv664H/MC+gfZnoOhNX1JmwEj3oG6eDvX/Xd1fmc=;
 h=From:To:CC:Subject:Date:From;
 b=lWV+3gM21cHH2gusmBGdzkpoq0rIBdmAK9VGey5TyUPREs4/VqCPOnIqAO89JzTSa
 phP/l3yIuStT7GCjYm+PziBDrh28g5dGD4npYIObB1TAIHfegXvR8CysTkjWZORE61
 OivIMR4swdPKkCTVz37z0IWPrIP48dPW0gchjvmY18UnOzM0D92zMTPcVYzwf38TRx
 nx62Fdlf/cCIJUAzAKpgqM9VVnAN2O7AsTeRidk2HVRd/Py7/fzZ4FTjkLr8tFWfqY
 /gGNLlmBSX7fQiy2W7L52VdCtUt7wp291MUrEMNzj3bDya/+1kQ5Z/fvfkXch54kmV
 Xyq/adfgzoo+g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 74850A0068;
 Tue, 16 Nov 2021 16:32:45 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 06752406A7;
 Tue, 16 Nov 2021 16:32:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="o2TIRAyn";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amxeyyKCdlaz3S6ayUQ4nrqKm6SheVPk6mxtsDXPJ8KlFDX6Drv+SaKftD9agmhGKhg8sJicyBHztSs9cwguR7uWmHmJF3cTbfh8XYB5tL6W/aV9QIrfDyFUdxh4oBffs++p+lZznxZ9IigiTPfhv5WZRNhc+xl0PQxv8WIzkratdZwscVTEs34n0c1HZspGt7X1N+/tyh9xWp7NPBR1bEBcQr4YCwJovJ3bajwchWv3SRa7eW+0bUKp1NSpAl88cm9tS739tME5FEKZrH/9+lTXgjU10jgnGJ5PrKXmrcMm4/eWHWwjI1ZpNVLykOJY5FJ2Fle6MJ4GsQpQfg4ymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j53T1H878XyVjD5dJe4hUC/lImhmgnQRPkTv9SRxT8=;
 b=UVkPTwoRxa1IgslAPwyJmkIEab2JQgSRw3tcVy9AwPF9Vn+6x8JbumvONss7aL7nARQ0dBhDOXOsEZfckwkmmWt1LGXh3CHOfPkmpnNs5cNkDvNQryfNnnpOxv4RIvVXINAzro5GmKfaE9nxVhs705GsfuYXXaEjGPWwzCX7wHTuEPCmqdXCwjDPv13iOnkM+Yfp9DRny+boHUCHbF6Avy9XkCXqeCxrrZQcv0bGMEIPREDz4J8f+mUAx7of8peui2zBgIWjdaH0tFrO6R11heFBq5HTW8ej8R61MViehWFrCRnHlgCaONYx+xMbreozElmTvkZE/TcTqh3NVeyLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6j53T1H878XyVjD5dJe4hUC/lImhmgnQRPkTv9SRxT8=;
 b=o2TIRAynfo9Tlvn2MfxILl+TbAQKn6X3rWH/kIN4C4gtJR1Jc02pzDvd8d6KFZFVXXH+WN1coIqFniqVN9idUgbTKselRY286nR5BemiFliHsgQOPmrTyebcC0jJhHJLaoS7nkRnVPiXEMiqtrG0h4v+7nLb1LCbnQBEE1b4qOQ=
Received: from PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 by PH0PR12MB5418.namprd12.prod.outlook.com (2603:10b6:510:e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 16:31:26 +0000
Received: from PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::3457:3bd:3b51:ce0c]) by PH0PR12MB5401.namprd12.prod.outlook.com
 ([fe80::3457:3bd:3b51:ce0c%7]) with mapi id 15.20.4713.019; Tue, 16 Nov 2021
 16:31:26 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@busybox.net" <buildroot@busybox.net>
Thread-Topic: utils/genrandconfig discards all pre-defined BR2_PACKAGE_
 packages
Thread-Index: AQHX2wRkCQMwbFDNKkCAYmGru2ZZww==
Date: Tue, 16 Nov 2021 16:31:26 +0000
Message-ID: <PH0PR12MB54010CCFB1F1B2A7C1090802A1999@PH0PR12MB5401.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: b5c58f4a-e299-c1e3-5338-1f512a06fe0f
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2343b7c9-1f07-46b0-d451-08d9a91e893e
x-ms-traffictypediagnostic: PH0PR12MB5418:
x-microsoft-antispam-prvs: <PH0PR12MB5418E21DC0AF18450260323BA1999@PH0PR12MB5418.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +5tdSTDRppyeA4dtScDjhEmgOhKjSKy36QoRkzw/Umx5p8E2oSkIixkJL9PPz0jQu7YnykMfKPrhI16lD29ywVAqx414G5rrqH8adMrongKb2/uNZUR6CAreZz3lC/AYdgMZ9mMvfMtSsB+QGl8+Iuah2/E8oqCfRk6LVWh1atRsgey9+r8p1pGLB5cvrDbWD4iMByJ2RYWSCWDhP7QfZ5ziXEIOC0qk0cqYoXr8NnuJ/U7xl6o8JDlOHvgQpdtuMENQcpR5frxMH2aIqFTBSlbsPNX6tqWvYxxBohyg7M0fjVUbhuB1jl9t/PaKwsPvIRJ3G5w3oS2LXtuIey9/vYdBs61MP0Bq8nPrss1ddYN8JDghW7ckhZzrWHsAzBQCFtt26ZklDlyIzYGeQ6PJDTIIWXnBrxhZoKVHazlZBjMopdwE2e3wLaRuwgPK96Sr4+2oNVT9CQcILxdygeDWoZrDXEK72Ci9wnVZ7beInjmSQhAV0Reh3OgWmHOfvYju0/N1G+orfH+u/MiyaO6TdvlihI/r2T4rHX4PKvELLtA59Miik+pzcKo3q4dLxCcWWpckVNT/miunClS3rOBmPv+0OCQXVQB+6V++4xSZft8ZQ2FPKRXAD3ATI7xYod/1xfaApQwEvN0NffueBkdqrxjYmN76Q+uf4T+gKQW18M29C+G3ytUEyKgfvruoP8r5TSpxDgu+7X6YzdzyXuXMDh+nR1XE0HFBdA8N+L++GdA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(8676002)(5660300002)(122000001)(54906003)(71200400001)(52536014)(8936002)(4326008)(2906002)(316002)(6916009)(9686003)(6506007)(186003)(107886003)(86362001)(7696005)(508600001)(26005)(33656002)(55016002)(66446008)(66556008)(66946007)(91956017)(64756008)(66476007)(76116006)(83380400001)(38070700005)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LP+8RIUjyxFEOeZvj2tNZ/d2OHQM6ROj9HN9PDEM11DxIejzdD+KX51WCP?=
 =?iso-8859-1?Q?98B3+G/BU8VoJTHOGJbdWKq8sNigp83zihHnT3QnHVcG8egQiGOhaFdVs2?=
 =?iso-8859-1?Q?TcZI0Pynty/x4LhiU5xA7G7E6fD4SUlcct8K890MRB6MG7mnD0fcpxpYAJ?=
 =?iso-8859-1?Q?OG8xJamaw1TIgiDM8ISXvI9yg8PzHy1C/X3pjXJLg4zhL8O+WJJnc9MnM6?=
 =?iso-8859-1?Q?EzAKQmGlTEQ2mMEQVqocikQ2mRK2wzgYAxHh4ntSD+e+5fzVUBy2lJy7l2?=
 =?iso-8859-1?Q?idgcgwo8n1DklpdnXs36Slvkt0/w3Ec+sS3qM4/axDYlCB5SnPXxSyWZUX?=
 =?iso-8859-1?Q?QmqDOSW/9JjOBHX+ZrHg/ucLpnryE3jAi/PIq71c3P2a7S707A5o3TQm2D?=
 =?iso-8859-1?Q?EUQ10GMkIrLDFWsVAUGEejSGEy0lBnoZReo80b94XWgRrr6lsDeaxpbbRx?=
 =?iso-8859-1?Q?EHKCWGFikThzyddqhOtlno+jL38Wcaof2W8sxZpopJhvx38I9DFLhfXRBS?=
 =?iso-8859-1?Q?y4pBGfOKCRs1kGo33Fivq75DVTEDVfluYsSyIJFdUZmooo/sjh+aVJzVdo?=
 =?iso-8859-1?Q?kEkSY/rC6HhGDvNiuXN8i/apDsECcaMvF9pDFgHgUlYlZ80BdgpR65+/Kd?=
 =?iso-8859-1?Q?vuLMAsnWpq7sDwp7UD1o9o/xk+c71bUL9xY156Sa/PGvtpdnrPS9P+m/xM?=
 =?iso-8859-1?Q?IGOYVvjMflNqZxBDvowR6fMlVCnqVAoHc1UbPjpz38nd6gLePdYUUbhcx3?=
 =?iso-8859-1?Q?8rxI66fgQ5jAtAnjY4dumBnSCyP4eM4ENQo2iCFac77AE2W13N/gyi1LBe?=
 =?iso-8859-1?Q?qAd8wDes9IgK4Ye9HfyYKIfTu501GUo7rOGzYwTCk5A4Ko0ORhyTlMdwYo?=
 =?iso-8859-1?Q?y9OgFgffwkLy4kA/Zw5f/2EGdjvKN9VzX9+oNQsrF8iI2OrGMmmcFgUk9d?=
 =?iso-8859-1?Q?np/RvAlnuO+Pk9jEEuuHHFEYO/SV+MipxksMWhKAvbmStzq+BAZ35zJZp4?=
 =?iso-8859-1?Q?fexJWGCYuMxLWDC+pbpq91DgQMWOiVzjlB1+ogcA19WHRAiIF7P6+FAVzx?=
 =?iso-8859-1?Q?1qvweN79XRIjFGfKE87vF/YT4EV2ka0ZZfn1uaXNYzlqu6okg/mKO5hR/f?=
 =?iso-8859-1?Q?bT0jtfFkTL4xcE/NH7GvcnRuQcN02jPLjfOmU1WNtcIFKPGP0jXqG0iR9Q?=
 =?iso-8859-1?Q?ty00lXgRSinb9nLUrL9U6r/JnI/I38H7/f7FJ77NBiX4J8GZWZ0oO9E46l?=
 =?iso-8859-1?Q?NBkcnqPhBlLiT6G4hPpevo4wqXIaPrD4AvUU8Hqrtq3AGinb0S5RHD18K/?=
 =?iso-8859-1?Q?xvhqa/Kv2xr2q6Kx6mO6Ic/MxObzwg+KS9om+Nfamws7OyC+Kll2voi+u3?=
 =?iso-8859-1?Q?Xyu0esTVF1uHAtlA27ExerwW2LCCr0oVvgxpxucpOHumdfuXiZ6CL2wGg3?=
 =?iso-8859-1?Q?DoAkRr4sMDTpB1MO1NIGFsnzBrYLzJY1k4bxzmmslI/L9/4aydry+OOxGV?=
 =?iso-8859-1?Q?3LaFZQHJUanz/Un7BJfzwpwba3IR+aWoc4W2wJKdnF0iUw8litGi6ITUHu?=
 =?iso-8859-1?Q?PZHEnadUAPdJCPBqeFAPdv8G0E/ClxONS6SkAp+e6KLQOwLGX8etpVjCj1?=
 =?iso-8859-1?Q?N4pEV353Lfw+nOBzDo3B+ECINhTGaLZNzeqYIx5NNwcpiiFUeI2mRW2Q?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5401.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2343b7c9-1f07-46b0-d451-08d9a91e893e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 16:31:26.5249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXpw1unIaGtA0/BrayS1XHt0ZomlVArAdPQ8eOSq8en+HZdiGKX/gozr3UQKXwijNILhDWfM6qqpqdOkX7curQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
Subject: [Buildroot] utils/genrandconfig discards all pre-defined
 BR2_PACKAGE_ packages
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: ARC Buildroot mailing list <arc-buildroot@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

While playing with Buildroot autobuilder "nodes" I noticed one strange
behavior: if I add "BR2_PACKAGE_xxx=yyy" in my architecture's config fragment
(I mean those in "support/config-fragments/autobuild") most likely it won't
appear in the resulting ".config". Well, unless it gets configured back by the
random configuration selector. Which to me looks a bit incorrect.

First, why was I doing that: I wanted to fix a headers version with
"BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_x_y=y". And to me it was
not a package, but a property of the toolchain, so could be kinda legitimate
use of the fragment (though you may argue for sure).

Then there's another observation to make that case a bit stronger if you will ;)
We do append "support/config-fragments/minimal.config" to any given fragment
with rationale of "disabling Buildroot options that are turned on by default,
in order to arrive at minimal build time". And some of its entries are BR2_PACKAGE_xx:
 - # BR2_PACKAGE_BUSYBOX is not set
 - BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y

And those 2 will disappear in the end as well, while I guess we'd like them to be applied.

From what I may see it happens because of this part in the root Makefile:
---------------------------->8------------------------
randpackageconfig ... : $(BUILD_DIR)/buildroot-config/conf outputmakefile
	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 "utils/genrandconfig" 
---------------------------->8------------------------
and "make randpackageconfig" is being called from "utils/genrandconfig".

The first thing I though of was removal of that filtering together with
the first ".config" expansion in the "utils/genrandconfig" with "make olddefconfig"
like that assuming that "olddefconfig" is being called in "randpackageconfig"
target anyway:
---------------------------->8------------------------
diff --git a/Makefile b/Makefile
index f9cf0f4cb3..1ac33d9da3 100644
--- a/Makefile
+++ b/Makefile
@@ -1004,7 +1004,7 @@ randconfig allyesconfig alldefconfig allnoconfig: $(BUILD_DIR)/buildroot-config/
        @$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null

 randpackageconfig allyespackageconfig allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
-       @grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
+       @cat $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
        @$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
                KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
                $< --$(subst package,,$@) $(CONFIG_CONFIG_IN)
diff --git a/utils/genrandconfig b/utils/genrandconfig
index 622cfd4891..5234a0726f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -392,9 +392,6 @@ def gen_config(args):
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)

-    subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
-                           "olddefconfig"])
-
     if not is_toolchain_usable(configfile, toolchainconfig):
         return 2
---------------------------->8------------------------

But I'm not sure if that approach is correct in solving observed problem.

Any thoughts on this one?

-Alexey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
