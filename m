Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A77C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 12:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84FB341514;
	Wed,  2 Nov 2022 12:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84FB341514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L68MhjqE1V30; Wed,  2 Nov 2022 12:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186364090B;
	Wed,  2 Nov 2022 12:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186364090B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 369B51BF292
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 12:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF57181433
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 12:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF57181433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJX-QTSSL5Kl for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 12:59:42 +0000 (UTC)
X-Greylist: delayed 00:15:52 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202DC81427
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on0103.outbound.protection.office365.us [23.103.209.103])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 202DC81427
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 12:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=V2u9O+dhVgVjn8ODe0JyBISCLobLAxJJ0rCPT4piuu85f6mSSJuoppFhka4pziU/Wot/0qYyy9Gie25Mxv6csGo7gasHxv19/AK6Ntn96SmqoM9wlLKIWfbB3+hLtRj1KP89ptsEfaIkhPMB++YZi0RiAl/DmR15P+8mjbAynalVXsKk1l8+66e2itaC+io6zL4lUy5CW18mk+8wVjpnIpL8s149ib2/7prY0EI1CyGxjf8coaXMhpcPn0zW92uCM90qCaR85PTKGSghm6T9SoQ2OpHtRvZwIjuG4VqokqkAqM5XlTEYVewDDNtWfEqYPV2prL0B9r41WLJ2Dnd4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bO8a6kNk91GytS0qOmjFjjbAX01rceUFI2myYov2JM=;
 b=WpYCb7aWfQ6rQMgcEXadCs+/bqj8dK7uNIfVXQDvjw4dGCTwQo0eRmyW2WDrsnsDLU1hnfaVcSJ1U1hpkbxXCcBVVJFaT8e7n0ZqVkaONOh/z2UcCLPOXTN0aPJjXhrJplJ5llLqI2rj9T2HdLI0zs2CARbchTdRhqS3ND8P70SOzaxPlZeSdQBtvmVtbku4si7HCdxsA4nsQRxgb2pednMr/cVE/dPf2bf6f9TUwNISdxjDWPPTOJ3Dr1nBKyjdd3ipYsq0fG+tSQYdOCvUGFv6VKCzJVTcKeZrkFlcdSSYjDEt+WW9O7JV746btze9LK/+7IjpOvLcsdXY0sPlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1725.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:175::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Wed, 2 Nov
 2022 12:43:47 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e07a:21e4:cdaf:4574]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e07a:21e4:cdaf:4574%3]) with mapi id 15.20.5746.034; Wed, 2 Nov 2022
 12:43:47 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [External] - Re: [Buildroot] [PATCH 2/2] package/busybox:
 redirect errors to /dev/null
Thread-Index: AQHY2qeNo7cqcAM0O06vgMVHYR7e/64q0OUAgADetYA=
Date: Wed, 2 Nov 2022 12:43:46 +0000
Message-ID: <PH1P110MB16031D3CD6A00A2173E88BAA9F399@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20221007235002.79221-1-vfazio@xes-inc.com>
 <20221007235002.79221-2-vfazio@xes-inc.com>
 <20221101234138.66423cf3@windsurf>
In-Reply-To: <20221101234138.66423cf3@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1725:EE_
x-ms-office365-filtering-correlation-id: 64a6b2c5-fd8c-4de1-4959-08dabccfe27c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xxwWI6CFDcxOaN6Bz7nKGi+LZckw98cAkJerabPEP8WKG75iEyaYNKOzAg6zd9w9zM+fZv/N0emMGg76T1WRwT6SdOv5+COX1yeI5U4nQOfcgsVIiZ4MCTEXhXm7ZrGgnI5X9sbTT5+BHYkevw5fzbIETgKwECP4J5gCSz/hTWW6SewfCq+GuiYwtFrAYTm1lyVZWswmFylWaeR2vC5ljwBgGVbL60tDqOA/7vYNmCIhrNZ0X+JPjTF25ZM5VEg3jBrJf1s2+jqOJO3rKAqM5jatUzY0ssswWz+jJiPKqWF5APIwiXLGc8JjqjVXpar8TsVH0pOduy+Lmbbvyjibr8SbnWiy8HdrMkMOLo1aOwiIS6FecG0HhEVRDsubCQvdBkOMr9L8qVF0DqztZKp55pWVHPfDuEkOy9WVsZ+JElr1145YXpydC2XIxyOVwDZdbgVNxtTRRD3Xr20To1+/T6JYfz5q7/+OvWWKm/VqoQhPhbPw6H6/+ng+Ln1nV1w8yxS8IukyQ1iXavAfsiMQut79cGByL/Z0MmFEy5GOIjHql0nd/XzT3fwCn5u+8ktVphit8P1eDnXtaQYrxVMi7a8E5XneRe85AtJ5RxyKWYqyMys8rjohbyjMTO8GcYJhH6H1tVG3zvlPu2J3WwvhS9IjKcy/uCUJbFemG6eZcF61sFQlohu1DqeGHufbv53cVPwtyoeepx6NjUscUh/tfL/Jz3kM4UIvD0unnjzPB4MMLy/p364RTdQP6RvExCehNDNMRklLtoQsvyPcGAmncg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39830400003)(366004)(396003)(136003)(451199015)(54906003)(186003)(41300700001)(8676002)(2906002)(83380400001)(6916009)(55016003)(33656002)(4326008)(6506007)(26005)(9686003)(53546011)(7696005)(66446008)(66556008)(64756008)(66476007)(71200400001)(66946007)(966005)(508600001)(76116006)(8936002)(38070700005)(52536014)(41320700001)(86362001)(122000001)(38100700002)(5660300002)(10126625003)(41080700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: pRigWXurskVmof1KkWP8UncG5vre7seVjD4O/KwPLKTJhLGST66APHFjrKJpJuvJD5kao6/Qnm9wOgHDBouQMH10y8GXbjeJYhlGA66SolKmb8Nbj2ObyR7GjGMa7KIZy6N0MhD5/wGyh0v+29ASsgGpLFRKJfkBx+lo9i5/LNFuLRyS3CyvqWU2bZVtdpyN9nxr69sYddxpu5UQEHPGogYeEcWvjZuV+P45MUCTs9VF4LQXkwDLhbkAmorIaFVHC5lL7SL4X6n8OGbQ+CrtAruGvoDue9Cg0m60oQAsO0hvqNL74ehatIX7Sn7OQCFNKfJnCw90wKK/1am4YByEaFp9FOmPq+uIJBoF+eE0TYRqLu1Fu20/C8SgHCl7GSPDL3kzmPkyXvPTyWOTCwAsEgGlvT7KzgMFjWjmvcthUrs=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a6b2c5-fd8c-4de1-4959-08dabccfe27c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 12:43:46.9906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1725
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bO8a6kNk91GytS0qOmjFjjbAX01rceUFI2myYov2JM=;
 b=ohmKoNtiQH+c8f7EdYulK/vnIv8Jpj1EGlrH4MUjroSYVwGYIbpbsvKPBxibnpmvPTyA6rgaTVWx0XQvFDOcSatveyYme01MRUISBF2HOTJCkJclS34KfTPWXAx7QhxcwJCaqEwUIIkvxRCz1asL0c4U0TVOsYvKS/0mBXV8GBjhqg6m6Wb7Zh2XGEh5w/XHCGyuYLHj0Rzp9uH9mh6+TZyXpRUVAh5kVxTtqZpqZ7pjxcWJTbJHAaX9sR0DMY4huPGM2S2O7cPK2V5PGPasNkff+9v3QgtkzJBE16gS2x9pq1ZlAwvrnCZo617+RWgXiGKL4RGL9i5yMBlwzuv38g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=ohmKoNti
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - Re: [PATCH 2/2] package/busybox:
 redirect errors to /dev/null
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hey Tom,


> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, November 1, 2022 5:42 PM
> To: Vincent Fazio <vfazio@xes-inc.com>
> Cc: buildroot@buildroot.org
> Subject: [External] - Re: [Buildroot] [PATCH 2/2] package/busybox: redirect
> errors to /dev/null
> 
> Hello Vincent,
> 
> On Fri,  7 Oct 2022 18:50:02 -0500
> Vincent Fazio <vfazio@xes-inc.com> wrote:
> 
> > When busybox.mk gets read, pkg-conf gets executed to determine the
> > location of relevant libraries.
> >
> > When Busybox is built with per-package directories enabled, a number of
> > errors related to executing pkg-conf occur because directories have not
> > been synced to provide pkg-confg at the point when it executes.
> 
> I don't get this. If pkg-config is executed before the per-package
> directories are created... then how can pkg-config find libtirpc?
> 

pkg-config gets executed multiple times because the commands that get built up to generate the config file looks like so:

(yes "" | PATH="/mnt/development/buildroot/output/per-package/busybox/host/bin:/mnt/development/buildroot/output/per-package/busybox/host/sbin:/home/vfazio/.pyenv/plugins/pyenv-virtualenv/shims:/home/vfazio/.pyenv/shims:/home/vfazio/.pyenv/bin:/home/vfazio/.local/bin:/home/vfazio/.asdf/shims:/home/vfazio/.asdf/bin:/home/vfazio/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/vfazio/.xes-python-apps/bin" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 "`/mnt/development/buildroot/output/per-package/busybox/host/bin/pkg-config --cflags libtirpc`"" CFLAGS_busybox="`/mnt/development/buildroot/output/per-package/busybox/host/bin/pkg-config --libs libtirpc`"" /usr/bin/remake -j7 -C /mnt/development/buildroot/output/build/busybox-1.35.0 HOSTCC="/usr/bin/gcc" AR="/mnt/development/buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc-ar" NM="/mnt/development/buildr
 oot/output/per-package/busybox/host/bin/x86_64-linux-gcc-nm" RANLIB="/mnt/development/buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc-ranlib" CC="/mnt/development/buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc" ARCH=x86_64 PREFIX="/mnt/development/buildroot/output/per-package/busybox/target" EXTRA_LDFLAGS="" CROSS_COMPILE="/mnt/development/buildroot/output/per-package/busybox/host/bin/x86_64-linux-" CONFIG_PREFIX="/mnt/development/buildroot/output/per-package/busybox/target" SKIP_STRIP=y oldconfig)

so they get executed prior to the directories being synced.

It works subsequently after sync because those paths are always reevaluated at runtime.

> I just did a build of the following configuration:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> BR2_PACKAGE_LIBTIRPC=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> and I couldn't see the errors (but perhaps I missed them). Could you
> provide an example configuration, the details of the error, and a
> rationale as to why not finding libtirpc is not a problem when we in
> fact expect to find it?

My configure and build log:

https://pastebin.com/w8WAGE53

for the pkg-config issues you should see:

/bin/bash: /mnt/development/buildroot/output/per-package/busybox/host/bin/pkg-config: No such file or directory
/bin/bash: /mnt/development/buildroot/output/per-package/busybox/host/bin/pkg-config: No such file or directory
/bin/bash: /mnt/development/buildroot/output/per-package/busybox/host/bin/pkg-config: No such file or directory
/bin/bash: /mnt/development/buildroot/output/per-package/busybox/host/bin/pkg-config: No such file or directory

You'll also see other errors such as:

/mnt/development/buildroot/output/build/busybox-1.35.0/scripts/gcc-version.sh: line 11: /mnt/development/buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: No such file or directory
make[2]: /mnt/development/buildroot/output/per-package/busybox/host/bin/x86_64-linux-gcc: Command not found

but those are covered by the previous patch

> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

- Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
