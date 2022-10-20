Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F29C4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 18:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F379B8436C;
	Thu, 20 Oct 2022 18:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F379B8436C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iEXEpqM5WCwE; Thu, 20 Oct 2022 18:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0100984360;
	Thu, 20 Oct 2022 18:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0100984360
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03D621BF2A5
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 18:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CED6484360
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 18:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CED6484360
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5j4n9mKZkOoS for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 18:16:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBF808431F
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140084.outbound.protection.outlook.com [40.107.14.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBF808431F
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 18:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SB+w2g2y9iAB4QdcunzReFc/s6zRkhr9VRwhXKXk1/Dds82vJHqkzptKmwZkDJ4Q7eMKRZED1YsrtTYFjZY8sYnaePyEghL3k/DHG3WEJUVTQDLqFHjElxntkjLVDauswit+i6AptwpkhtCeOSIS71r1eOKRwlsGcMZSgAiJtW15mm8WuajprEqgYWEER1usBIIsGO60drjQ00i/2HTVU8s3yRIActBE2Yj5nmqPVelSQd6FtEx41MwHVStFh+Lde36ZNaONegI8AHNhuvIL3AAxv23cNPqvYVo1tEs1c//n2L+DsJUYJypZUVD4jL7HFkzWNqgjarswUjcFUitZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ja1N9tSi6u7hKxgJwl/YT5l4MrXV9Azf4Yj53irNkM=;
 b=BkCFCQqvca52yASUTcBDJg7rmqN0V3UXfjOz/MwfmPiXMG3PLGDo6jT6ByCEcbpluY+S23ZfHFwq/wjWlHtjF/XIvpSsuA2hKQsyH9Q6nlWJVbk6K6gnDbagR6UaS7eeetrtd2c/AU96fomqtdAUtD4ouyu8ybh6keyVHnggQ25+xsNKJpbhkRDnioDxVlO8puxtsNMnfGknAJgi9IZ+jiOMPK8cU4paui5ksK/dSD8fENu6thSiGWZ+mFoLUCI3TZUfjAxDVA7BTxubnGtTu5RjjoJumcAxC020dT5QcI6WbjvCJSlF/vaFH9cW97TvCBwN9yQXv982xW3QjMzBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ptwdosimetry.com; dmarc=pass action=none
 header.from=ptwdosimetry.com; dkim=pass header.d=ptwdosimetry.com; arc=none
Received: from AM0PR09MB3411.eurprd09.prod.outlook.com (2603:10a6:208:173::20)
 by AS8PR09MB6292.eurprd09.prod.outlook.com (2603:10a6:20b:57f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 20 Oct
 2022 18:16:39 +0000
Received: from AM0PR09MB3411.eurprd09.prod.outlook.com
 ([fe80::2859:1493:f19c:5a96]) by AM0PR09MB3411.eurprd09.prod.outlook.com
 ([fe80::2859:1493:f19c:5a96%4]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 18:16:38 +0000
From: Richter Simon <simon.richter@ptwdosimetry.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [PATCH 1/1] support/download/cargo-post-process: use cargo
 output for vendor config
Thread-Index: AQHY49YJ5F8awvRrhkmjPbvlsdgI0q4WMcMAgAFAii4=
Date: Thu, 20 Oct 2022 18:16:38 +0000
Message-ID: <AM0PR09MB3411C21E0EF14DF3040DCFD38B2A9@AM0PR09MB3411.eurprd09.prod.outlook.com>
References: <20221019161513.994988-1-simon.richter@ptwdosimetry.com>
 <20221019205236.GG3666@scaer>
In-Reply-To: <20221019205236.GG3666@scaer>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR09MB3411:EE_|AS8PR09MB6292:EE_
x-ms-office365-filtering-correlation-id: cf12c52b-2ede-447f-8702-08dab2c73b4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LvCZ2/LR752jgrhsL7/vHe6V7MfEfXU3QnLhCrYV2u78mlGWBCzP7idVwhjuPFoSQC6St5BapwwX7tdhR+F8QFDyE6x+VusbpMSZgK6P/oPaJJbHZLV8+rImmUkpY8bV8cVFUQjx2l+kunfHezvH7NRLIEbwHUXzb/mhRP5V1IXLkwUNdwSEd5SQQYjs1iOO8/HoBXE+WkwxXuYdpkM1FPYRr8xjtOQWxAglzErKufTBhG5XOu4NzAYDMcNjI+SdoFjlYPqKv1NWBalkzsXKKzKzIMstBEHLEzMDktZRrWbzBwrs/EA2YR/2rI2DMfeNrMdLCwBG03bIOsA9yc1lKsR0gDQhWyoK6+IdxFX7B6XaDnuovWanNuHS3wy6rEJ3gnatSPcSF/Zto54AeFUxkyW2Yqm4WQ6RArofVVZSLpZPrm6nxMY9dGC4oYFw5enPkY1RAF3dKEA2mHXe/XG3kf2aAbGHCf+295I3vyK+fcI5UNXrj6oaVMK/DXQSAFc+oxdu5NcNN6VN9wf+oTMuBQ6AmbDQ6SmSpSqfZatIFf3RKn1oZtvOE8EzSWHYVGvBnyJfAjadxAUpGoauiY9J1A6ZWyMDAt8HY1/wbDWV+KKpIC2d2l+7WRj73Qsnj6Ebf4dwO1ViVEEJOPVIyd5JQKuW4u4nXduWh4vHlyo8wZvbpuzfcRyJ7J1MRxQ0H27+iD7NVNxm48nxMNe55xKjJIP2pus0atHxDw1ppvOtTZLyW2Aau9tHRmEaJExmFL0UOLtFdAM691AtpFKzALPdx3jvfbYmFSgKLh8exorogwhzqxyjSRHSLu2pCua2GSfnSzVtrJ/DvyAL3XCZYa34rw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR09MB3411.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(39850400004)(376002)(451199015)(52536014)(8936002)(41300700001)(5660300002)(2906002)(66946007)(4326008)(76116006)(8676002)(71200400001)(66446008)(91956017)(64756008)(66556008)(7696005)(316002)(33656002)(6916009)(478600001)(6506007)(83380400001)(86362001)(66476007)(186003)(9686003)(122000001)(55016003)(38100700002)(38070700005)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tQjemZi7CMQccNw3eh+MYxHva1VfaKmEpCanBrNdI31TLQOJCvqsDD/Z2a?=
 =?iso-8859-1?Q?kZFBzfyB264jvjFlhVrjNmIy7KRq7ysseWzfzvzNRnM8fBpCdtnVHFZ6df?=
 =?iso-8859-1?Q?+wlZNSt818IuXg4+xdwSfFTs9hEA+nJFQjWI/CXy5RYfVeUMDBKCyVPdbI?=
 =?iso-8859-1?Q?Ege5H26In0wzRoXMzgX4br+v7Q2DMXyYaX/3iG27BJC2qskTeiWgCOxNeA?=
 =?iso-8859-1?Q?wENFPMous17RBsx8KVJKmlZJbIBx0y5v9QFBY4g18NfpAnQY+z2Ornx4uh?=
 =?iso-8859-1?Q?SOXIC0xEiyC+vdFZw1LwNbdolKzkYsUX11dYnjOk4AzJ5nbtnijR0xnPZW?=
 =?iso-8859-1?Q?GaDeiw2GMfQeeuMaQZ6VtjWe2/WbTBNsRuKhIyCx6k/kGcSdcU6hdprTJV?=
 =?iso-8859-1?Q?RtpvPgLcplGorx+A4RgYqTC18gqLCfVhZsJet98UOOxbueIIE5+AMmo+aD?=
 =?iso-8859-1?Q?CbPx4utauiDzw80XxuK3mnaSADu3kmYmbEhOBnSFAK1cKN2Grz3JzP/3jc?=
 =?iso-8859-1?Q?ynqBLnKSBxsX2+6pGLgB9JEFqCWZWVZo7NDmsiDJlB3atnss8Y9a7hQCAi?=
 =?iso-8859-1?Q?EXIqRwgjcA93BQPIEVBFMjVsc9OuhZWH1eL9dTTtIkGr32P5B5/m8Z8Rtx?=
 =?iso-8859-1?Q?R2wdcBWkfrExUue5Z3SvAx5h3Uv1O6BIUMDe3gajDaHuYvWvdyl/mF+k8R?=
 =?iso-8859-1?Q?S75c7pRljwnzuJgFnLfYtwJeeXvLoe0XMzGBF+RXlsZE6Rm4eI8Mi2sxSk?=
 =?iso-8859-1?Q?Ar+ygxE3TXE56ljkJ1hS9OQGkOeIJbssiuyrZ6DExbOkuGwtr9xv5at+yh?=
 =?iso-8859-1?Q?lx7OJopp7lX13E5KpCd5fN6+2KpP/1UlHhuchcXav27ai8pUyMltc8JQm2?=
 =?iso-8859-1?Q?iaszNIyF/m58GLODVGarC7T3c15Y9NqRJ6NMZ3pFUZruKUS+WJb64UInuP?=
 =?iso-8859-1?Q?MILBObckM0eXaVhCcSfDVV2BKqrAOt9U9NDsGw7cJ1/YAa5tUWTNmC4QIS?=
 =?iso-8859-1?Q?LdJ4eBRqZfTfkatU/xySzb4YZXdKFIrReJ7CDleBjeE7l+Ww8uOwfuD0dy?=
 =?iso-8859-1?Q?9mUsiFJekViICN+nZi25IrxKbHqlm2B220PWZucP5PvYjOHphgMyGm93mE?=
 =?iso-8859-1?Q?jna/qKEv8ZjYflNAvy2erCoCQnFV5qHvYDSTcK09MPbnXyUVblbnA0p3n8?=
 =?iso-8859-1?Q?Rbqa6g0f99iu0dkrLyOvpu5Rb2eph5C7qYAxXJCkDZ8oPNKSpe5GqEOAEI?=
 =?iso-8859-1?Q?vGtztmaDOoD28OoSH+y+FweDLZCkue+wqIjsxazDW2z2WE6l+VrjsAkfUB?=
 =?iso-8859-1?Q?Tw3RTDKw/0LEjB0Lr0bQDr6li6xx9POyWxjSpHU0ld2q+Il8TarEXl/BSD?=
 =?iso-8859-1?Q?a8Y0UWgVjHbSubsh+mDO1wlqV77pLEkkU3foi2L5soS/xhJWwlGxRLFsf8?=
 =?iso-8859-1?Q?e1yhnTHYlpEsDqlblqY9ZsD/XkkXnPD+M56aLSIPE2d+EV6Ll3lETVUVix?=
 =?iso-8859-1?Q?CQ0/xE/sbxc0esD0o9f6Uas764yI7TWSf4mIFoj483gAlZ0tJuRv1fdFLw?=
 =?iso-8859-1?Q?yUfaFkF1ZN2KoeUvf+C73UgKABTnaUzPtAJHWHfUlKcSlLuVeiOPAccYkU?=
 =?iso-8859-1?Q?AIJw6Mt3WpTMOmWhCpqhPzX2/rFQ0wtGPoaPho0n1U6QgdxiXsg9e/ot5I?=
 =?iso-8859-1?Q?qo0bDr11w+iGx0WoskfczA0kbFLXqzyV2PwlOVQPgj4uxKbwxvK1ZFnMeN?=
 =?iso-8859-1?Q?zg4Q=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: ptwdosimetry.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR09MB3411.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf12c52b-2ede-447f-8702-08dab2c73b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 18:16:38.9050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f4f5a489-21cd-415a-a6df-b7670e99ad80
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pa0G7tFEEaAkXItEswjaQ5kIqIw/1OW449Xm7676I3xpUXWTLvn7mwK0dqOCcqNECOQBLiMxn7kzXU9VfiU35ZeTt4Gu6ycOfkDSKnrwywU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB6292
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ptwfreiburg.onmicrosoft.com; s=selector2-ptwfreiburg-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ja1N9tSi6u7hKxgJwl/YT5l4MrXV9Azf4Yj53irNkM=;
 b=rmd2yMvswE8ECLHE6LchC2/nB7HiQbYURaUbPhlPB19+dr9nyxU/oDtb6vBxjwsxDSLYkGycX05t+Xpl/LCINPb6Hq0/v1X7NqXJ+aKwmwgDuxHpku1YcFZPHzqC3DBZq27BJxU9tMtCOpQ0ZRkSaZypHSfAWoI9iWuY5yGSIx0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=ptwfreiburg.onmicrosoft.com
 header.i=@ptwfreiburg.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-ptwfreiburg-onmicrosoft-com header.b=rmd2yMvs
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

Am 19.10.22 um 22:52 schrieb Yann E. MORIN:
> Could you provide a bit more details on how this works? 

Sure.
Currently the script generates a config file containing:
    [source.crates-io]
    replace-with = "vendored-sources"

    [source.vendored-sources]
    directory = "VENDOR"

This works for most projects since they do not use dependencies
from other sources besides crates.io.

But if a project needs dependencies from other sources, say github,
there needs to be an extra entry for each non-crates.io dependency.

As an example, here is the needed vendor config for conduit - a 
matrix homeserver.
(https://gitlab.com/famedly/conduit
rev cb2b5beea8a3fb27ed514ee9e46b5729aa272179)

    [source.crates-io]
    replace-with = "vendored-sources"
    
    [source."https://github.com/ruma/ruma"]
    git = "https://github.com/ruma/ruma"
    rev = "fba6f70c2df8294f96567f56464a46e3d237a8e9"
    replace-with = "vendored-sources"
    
    [source."https://github.com/timokoesters/heed.git"]
    git = "https://github.com/timokoesters/heed.git"
    rev = "f6f825da7fb2c758867e05ad973ef800a6fe1d5d"
    replace-with = "vendored-sources"
    
    [source."https://github.com/timokoesters/reqwest"]
    git = "https://github.com/timokoesters/reqwest"
    rev = "57b7cf4feb921573dfafad7d34b9ac6e44ead0bd"
    replace-with = "vendored-sources"
    
    [source.vendored-sources]
    directory = "vendor"

For the current script this means one has to create a patch for
the generated .cargo/config to contain the missing lines. That is not
nice for two reasons:

1. the corresponding package must contain a patch that
patches a file that is not part of the original sources of the package.

2. every time one or more dependencies are updated, the patch has to be changed.

> Also, can we have a package that uses non-crates.io dependencies, so
> that we have a test-case to ensure we have no regression?

I'm not sure if i understood that correctly. Do you mean bringing a
package into buildroot or if we already have a package that can be used
for a test?

If the second, no, i did not find any package that has non-crates.io
dependencies.

> This means that vendoring step is then entirely silent, and there is no
> progress report.
>
> Since the download during the vendoring can be quite big, that means a
> long pause without any feedback to the user that something is going on.
>
> Also, if there is a download issue, there is no way to find what
> happened.

That's correct, did not think about that.

> Can we keep the vendoring to stdout as it currently is, and re-run it
> right after, just to generate the config.toml file? I.e. something like:
>
> cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR
> cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR 2>&1 \
> |sed -ne '1,/To use vendored sources, add/!p' > .cargo/config

While digging around i found the following solution:
    cargo vendor \
        --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
        --locked VENDOR \
    | tee .cargo/config

Cargo seems to print all progress output to stderr but not the needed
output for the config. This goes to stdout. So we only have to tee stdout 
to the .cargo/config file. I will update the patch accordingly.

> Finally, unrelated to your change: if the package already has a
> .cargo/config.toml, then we irremediably override it. Is there something
> in that file that would otherwise be required to do the build?

Yes, i noticed that too. Overwriting a possibly existing project specific
configuration is not good.
I think this also should be changed (in a different patch, as mentioned).

> Can we simply append to the file rather than overwrite it, i.e.:
> .... >> .cargo/config.toml

Unfortunately it is not that simple because of two reasons:

1. cargo looks for a .cargo/config or (up from cargo 1.39) a 
.cargo/config.toml file for configuration. If both files exist, cargo uses 
.cargo/config and ignores the .cargo/config.toml file.

2. if configuration entries for vendoring already exist in a configuration, 
it is not allowed to add them again. Cargo will not build the project if a 
corresponding entry exists more than once.

The first case would be quiet easy to address but the second one would
need some sort of merging.

> Note that if we want to change that, this should be a different patch,
> of course.

Absolutely.


So, speaking for this patch, i would keep the current behavior "overwrite
every possibly existing config with the vendoring information".

Regards,
Simon
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
