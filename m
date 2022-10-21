Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C2C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 12:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B30F405AB;
	Fri, 21 Oct 2022 12:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B30F405AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orhPtygxunBZ; Fri, 21 Oct 2022 12:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 711B640518;
	Fri, 21 Oct 2022 12:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 711B640518
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEEFD1BF2B4
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 12:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA36740518
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 12:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA36740518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id abY0Qq4QPy0M for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 12:11:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4EDA400AC
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4EDA400AC
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 12:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+m82WUjNsniSOZIFLuKvpvWVc7hjaCZRtN6qTWBW64F3LBbA2KrsbSwvTRRsMwRMAkAeBFsnEzPYgyavMbw1judKrf0A6wPFjvLrgVBHFCbIlI/uJJSS/KdOjVoiU30HnTGpbg3Z9XqDF6Fq23Tgj975fjCDpuGrvcafdJ5B3djbMXmoHEaFNjDBurIBpqJAXBSeh/lMoH6Zk2keO8tE8ggiVvRztj7183EgYlOj7Vif3IbrTszlh6lpb9f6zLUDC6GW89sjTPUQn9B77D+4YL246qYe84tcLpE8SYDhv9d0tQco+/EcLbDB6FeUB8YW1eegMwcwsoS5QXO/RE1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FSMB+AumcAFOAEUaFhMsnTbxJIoGVTk7Px9inBkj7w=;
 b=P28FbIaEqGMuqzd4XXUNBXDRXwNeaK93ONO+zxoMObniXPnYMipgK6NgJZwBGXkhTcH14a/wgV8nhDlMqTZYIIeI2pCeOtGc+voo0ifniAbt6fqB6F2RyKiIlKpIpSyaNqDW7HHH7fvQ66dw/HA8mHBjdjzu7USGzMZXPP2BxW4cDXE9URodLOcbfKUOYXXlWWMVKE7jUXqGdnObWGTNOvE9DnVJby+H2uCo7fJeGcWvrd5kxWRjydCOJFlDvpeDJOx+fdHHW875wvsUejHbQzBd/e/3PTDpzlQaCC8xJXtMAbAfknxhKl/dnxxNzuaOSkTHinUT5Dff2JDzFweyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ptwdosimetry.com; dmarc=pass action=none
 header.from=ptwdosimetry.com; dkim=pass header.d=ptwdosimetry.com; arc=none
Received: from AM0PR09MB3411.eurprd09.prod.outlook.com (2603:10a6:208:173::20)
 by DU2PR09MB5264.eurprd09.prod.outlook.com (2603:10a6:10:239::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 12:10:58 +0000
Received: from AM0PR09MB3411.eurprd09.prod.outlook.com
 ([fe80::2859:1493:f19c:5a96]) by AM0PR09MB3411.eurprd09.prod.outlook.com
 ([fe80::2859:1493:f19c:5a96%4]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 12:10:58 +0000
From: Richter Simon <simon.richter@ptwdosimetry.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [PATCH 1/1] support/download/cargo-post-process: use cargo
 output for vendor config
Thread-Index: AQHY49YJ5F8awvRrhkmjPbvlsdgI0q4WMcMAgAFAii6AAEpYgIAAxto2
Date: Fri, 21 Oct 2022 12:10:58 +0000
Message-ID: <AM0PR09MB34116058D25F14D6FEE90F058B2D9@AM0PR09MB3411.eurprd09.prod.outlook.com>
References: <20221019161513.994988-1-simon.richter@ptwdosimetry.com>
 <20221019205236.GG3666@scaer>
 <AM0PR09MB3411C21E0EF14DF3040DCFD38B2A9@AM0PR09MB3411.eurprd09.prod.outlook.com>
 <20221020202557.GA2992523@scaer>
In-Reply-To: <20221020202557.GA2992523@scaer>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR09MB3411:EE_|DU2PR09MB5264:EE_
x-ms-office365-filtering-correlation-id: 0c3df742-c28f-45ab-3d67-08dab35d501f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qC01ZWYgANYWemwfk8SuR/Vtrh5hHmQj0+C4FzPIyAoLvHkXyfnGsDy/HuAMUl9ki9uOwHi1Ioeq5+OzBr/XiYKd9IS5mJOeFyw1gW+lnS3tfDBCfoLO/2+7dJh35vs8b0PjB15y+9JmOQBn/6DJFv2wISwZs9LRsHpz3KcZjXn7OOTKgP/JckrGx3vpDI4vyiC7f5aYUlLOKDGvhfFfLdL+hIXmXv/6vqMAA3EP1BePDdW4S0b73eWSCO4pTomh+AuVtf+iLephFFj5ORkvJYujSbdcH6Uf3r39gT48wo/siu/U3nQfKtMsZ4aNrVk6HuoVEv8+0PF2R6IOkqB4Y/Pjnrhw6OF+WglfZcaK+PhfU2I8lmE84LuM75HN+rxkdWnqodN+KVZ1KlmSrJrvHAl4j74X5XqRfpq8FnzYZT/eHWvK+1XojE5XcHuvXYNElG8taG+X2XLJOPaF4+sGjsCRuRjv7klrr/pmYVYB/giwpWobnBVrRm4o1VYGYcYCgnB30QbWQjsBbJeR6rS8GtL2CvVl8CcK/XCloeAJnEiLi6le47U6d9ARFWSoiC5HM70qNwi30lHVJN6ImbzwU0y7lS0hf+xnvGitdShBcJViPQ1Hos5+GeFsyqAdw+3tEJ8UXehyJwrHVxeBhzuux5QQ+YMccQtsygHg3uzgmN88Y29BEIsHyTUXpyP9W8uZZDPOEtWPIgoG+zVsTEE5Edai2EjdNuJbEe7fm1AiSBe96KO++6HYtGHMpX8QyoOUE0iQLKZcf+WE0UN/U22En0liAFDRLdD99hgcb8JVzgY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR09MB3411.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(451199015)(33656002)(186003)(38100700002)(71200400001)(2906002)(122000001)(38070700005)(478600001)(66556008)(86362001)(66476007)(8676002)(66946007)(66446008)(64756008)(4326008)(91956017)(52536014)(8936002)(55016003)(316002)(83380400001)(76116006)(7696005)(6916009)(6506007)(41300700001)(9686003)(5660300002)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?N9lRyLkAMW8ApPhTOMd0U8EYgWNAjp7Rr8G41la95jyWLgc9tIq2MSOWAe?=
 =?iso-8859-1?Q?jaVK9qeI3ewtQ6SxF18jTxYVPIQN8OrSx4b5Zp2kTAx2VrlJsPotHp2jyt?=
 =?iso-8859-1?Q?DyiROn5KN5iHNxLfJa7OeIQel08wn2aqhzfcP1bM+H7oZ5f6FcVVe3/Q6a?=
 =?iso-8859-1?Q?jdKvzoS5x3VCgGqJ5/HSlcx8CpnQJCFRo/ipaOd2I7WrkCqR5hn4XK+eBM?=
 =?iso-8859-1?Q?NrmBXG/8Xu9ZKTfR79JTJb9NqkcSheSfdiDV9Gy+0fuEwYs4s1YIH+4vrk?=
 =?iso-8859-1?Q?dt+hJFYdowY6Z9oBnTex23jpl0reX1kT+3ZAj3aaRGuoQHJtayOP2xWIGD?=
 =?iso-8859-1?Q?XbppSEyG+vzI1aCdIAtDZNXJPdiZ2fzfMS8WX/JNeh+eMMRtIUKI88+qAg?=
 =?iso-8859-1?Q?ciTS80NCEhrJ/bcJxb40v865dmwlOby1CfaqLSU/qr2nlOtp1Ec0L4D9nF?=
 =?iso-8859-1?Q?jfviHClFqqDjj891pqESZPMgAvi5dv+tpbePiY/idUvcV6DHW/NfRZbKwp?=
 =?iso-8859-1?Q?9KU1ewMhokPf7nSvelZ5bCjgRfv0KV9Ze/hJNZQyORGJE2xZBfT7c4kBMT?=
 =?iso-8859-1?Q?tgVAccACjV7gl6mIRfGPsqA6BUCusnJab2w38y3uNGHbQG3P+6juQuRway?=
 =?iso-8859-1?Q?NFz743yaxRtzAZ61lKMD8/gX3QpgZ4UStKnpfgsyOR4/zXx7Ii/KXUI0SN?=
 =?iso-8859-1?Q?kh63RoKx4k0w7DyWFZxlPWDZnkjQCGRz4cmSkpJN3+rF7uK47vN3xyWM6B?=
 =?iso-8859-1?Q?5QTNl8T7u7Hasy61rZQ12LWKkqXmWzVZx6R8plOrlYHwFMWE/CXSZx7UAx?=
 =?iso-8859-1?Q?iEY/j/XMr/8sPodTwwzduy/jVZVpYP234Q5PfNbHoUBSNYu0y3jZK99+2B?=
 =?iso-8859-1?Q?rZTTQIb5Z09RUY5ZxsynynkIS3zd+KcspbAcZvVyhQNK/X9i+Cl5WLNNP5?=
 =?iso-8859-1?Q?5KL6+YyaMvaybIdRmBYALJn7zB30FhxYUHNU9P+6j87QWciy+GJsoyFOVB?=
 =?iso-8859-1?Q?r7Cpfgb04uxb1tDQDKIdYAj750MC7rhagyAqTFzrbkyxKxntAIZDjOGZl6?=
 =?iso-8859-1?Q?wowIFUWRwBBwhgRhNKD19fAByz5hOdn+MoMG7ShGDR9SEdl46JPBCUaDPl?=
 =?iso-8859-1?Q?VU2NNG4uhCMOhJcZlGXjSfB/QotRRuAv+La8qsMhha5bSMo3Lj0tSoxCma?=
 =?iso-8859-1?Q?3yxSHmAuuwr+u7Y+q9aywF22ha9NFQY5hX3kk8fWBhIlF7DLvqvTUz5Mnf?=
 =?iso-8859-1?Q?etB2N1ujtXs2g0GhNlGqSmN86BTtSg7C5jtuIQlxS7uQrmDJxQcpTei3jt?=
 =?iso-8859-1?Q?7+WR0+u6Mlk9yNEV57KsXLunpqToqJ2ZJ4JW14uoYm5Za6UeMDb8IKjp7F?=
 =?iso-8859-1?Q?6p9xoOJ3OXLV6U17XqHyEjxN4p87d2KdmzPxrsugyy9jxHjkbMp/PinLB7?=
 =?iso-8859-1?Q?xoXxcIp/LmQVC4c4sJXiQAgKLUsQUhoJHSze0xuDi6bLWAPpPyaIgMUX7l?=
 =?iso-8859-1?Q?powfGsP2zl29FABo4n44vT8883vbnfsshlBXgBNPKZeXSLaJSG2kQJ1nBj?=
 =?iso-8859-1?Q?+X4Nwrqqd9l0aOiRspZ8iOtH2Bac8UYWeaLufih8p1xBPt0hTz4xg8Qdzs?=
 =?iso-8859-1?Q?UI7xH1hDxcbwjeKPNAMCyeHvB7+/z2iipqg1u5ew9/KXjj+rjGIee+IGdS?=
 =?iso-8859-1?Q?8cz0pCZ7uYK2WC4Cba8NY+15JQ5sHnyCPTDgeumGhbUPpPp/z4O2d1Lmyz?=
 =?iso-8859-1?Q?Rx8w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: ptwdosimetry.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR09MB3411.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3df742-c28f-45ab-3d67-08dab35d501f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 12:10:58.3276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f4f5a489-21cd-415a-a6df-b7670e99ad80
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4pyObUdJuwGgU4lhZ9qHtEh5pxlsTqQVcG1yB9ldwBs+P4YY7Tf52oXdafQsHIgwXRrA6V8c6gllb3gjcBYeMofMnpIYmZ0rjEuWe+3tuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR09MB5264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ptwfreiburg.onmicrosoft.com; s=selector2-ptwfreiburg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FSMB+AumcAFOAEUaFhMsnTbxJIoGVTk7Px9inBkj7w=;
 b=kKoOUy61rQ1S2w/aY9K8kf66579CTfxmavpsSGt0b//MIQu6371qAMcHELpDHkOCWQWNOnfeTuNzf9rikgJucGi6AfcrjKb5Jnc2Djt5VIMgC4i39iUAJjorlgNVdz+RWODMKCJguBRZs6qrkpUU0Sfpvm2COiWXbP9/VMYpEG4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ptwfreiburg.onmicrosoft.com
 header.i=@ptwfreiburg.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-ptwfreiburg-onmicrosoft-com header.b=kKoOUy61
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ptwdosimetry.com;
Subject: Re: [Buildroot] [PATCH 1/1] support/download/cargo-post-process:
 use cargo output for vendor config
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

Am 20.10.22 um 22:25 schrieb Yann E. MORIN:

> I see all the above use git repositories directly, so I suspect this is
> going to cause explicit git-clone + build (that's OK). However, I was
> also wondering if one could have a "registry" like crates.io, either
> internal to a company, or another public resource elsewhere, and how
> that would work...

It is possible to use an own registry, yes, but i did not use that yet.
However, i checked the code of cargo vendor and have seen that
alternative registries are handeled. That means that `cargo vendor`
should print the needed config and we would use it with this patch.

As i have understood it so far, a corresponding entry would look like this:

    [crates-io]
    replace-with = "vendored-sources"
    
    [my-own-registry]
    replace-with = "vendored-sources"
    
    [vendored-sources]
    directory = "vendor"

> Yes, I was wondering if there was a publicly visible package that we
> could cary in Buildroot, so that we know the feature would be regularly
> exercised. You pointed to conduit: it wouldbe good to have it packaged
> in Buildrooot.

I can try to do that. But that should be done in a different patch i think?

> Please, also note that this has the potential to generate different
> hashes, so please check existing cargo packages to see what breaks.

I did, and with my last suggestion (using cargo and tee) those packages 
broke. The problem is that `cargo vendor` outputs a preceding newline
that must be removed.
I came up with this:

    cargo vendor \
        --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
        --locked VENDOR \
    | tail --lines=+2 | tee .cargo/config

This removes the first (and empty) line. 

With this, all packages i checked were fine. These were:
 - bat
 - dust
 - hyperfine
 - ripgrep
 - tealdeer
 - python-rtoml
 - python-orjson
 - python-cryptography
 - host-python-maturin

I hope i've got all.

> Or we can wait for until something actually needs it, so that we do have
> an actual case to look at.
>
>>> Can we simply append to the file rather than overwrite it, i.e.:
>>> .... >> .cargo/config.toml
>>
>> Unfortunately it is not that simple because of two reasons:
>>
>> 1. cargo looks for a .cargo/config or (up from cargo 1.39) a 
>> .cargo/config.toml file for configuration. If both files exist, cargo uses 
>> .cargo/config and ignores the .cargo/config.toml file.
>>
>> 2. if configuration entries for vendoring already exist in a configuration, 
>> it is not allowed to add them again. Cargo will not build the project if a 
>> corresponding entry exists more than once.
>>
>> The first case would be quiet easy to address but the second one would
>> need some sort of merging.
>
> Yes, so that all calls for waiting until we do have an actual issue.
>
>> So, speaking for this patch, i would keep the current behavior "overwrite
>> every possibly existing config with the vendoring information".
>
> Yes, because that has so far not caused an issue (at least that we
> noticed), so this means it is not an actual problem.

Agreed.


If you agree so far, I would send the new version of the patch.


Regards,
Simon

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
