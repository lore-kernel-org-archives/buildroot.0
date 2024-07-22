Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45356C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08C43400C6;
	Mon, 22 Jul 2024 12:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0J3DeR_HJoy; Mon, 22 Jul 2024 12:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD18B40114
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD18B40114;
	Mon, 22 Jul 2024 12:55:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB5441BF2AF
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D669680BC7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNAwoaIwYRSh for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 848AE80A72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 848AE80A72
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 848AE80A72
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:55:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD25FFF802;
 Mon, 22 Jul 2024 12:55:50 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:55:49 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240722145549.20a7efcd@windsurf>
In-Reply-To: <20231219172446.498409-6-adam.duskett@amarulasolutions.com>
References: <20231219172446.498409-1-adam.duskett@amarulasolutions.com>
 <20231219172446.498409-6-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721652950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vRiyVujuLu62umSFC37PlU31L7H3oZ3MgTrPVv90qY=;
 b=Hj+M8uhYkVdhszG5wnH04aGt6B/BliEBoRd+MDiIcGJtjpHFX0VjNpWRVxglihwKjqwnue
 zNaJj8FS6bUJYqXoWWUffdMwRNlU+CZXu2xr3kz9lPDysFk1Yep6f7oNClUXNF7g4re93w
 XW6ddwcSTrQFLzb8+68Fe6bWrnvMj7qcKZe4K3Gf852wPwY6vdLkTe+uQvwo8jvIHa9N/E
 pTmK+l/aJgVDx5nuEOmMNxUvWDyn3hQFsGdBoXb/7XtudvCEbZ6Yci2+s5jmxp2LKXoBeJ
 AUJSfZsGOYPXhxeUDsa14yphirjNdzcV2a0Kjvd4MmLeTiT2Fjj12GD26c+nHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hj+M8uhY
Subject: Re: [Buildroot] [PATCH v3 6/6] package/mender: bump version to 3.5.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Tue, 19 Dec 2023 10:24:46 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> The artifact_info file is no longer supported. Instead, mender now expects a
> bootstrap.mender artifact created by mender-artifact in either /data/ or
> /var/lib/mender. See the following for more information:
> https://northerntech.atlassian.net/browse/MEN-2585
> https://northerntech.atlassian.net/browse/MEN-2583

[...]

I don't think it's related to this version bump, but our Mender test
case in our CI is failing:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/7391793034

I am not 100% sure what the error exactly is. The end of the log looks
like this:

mdb.c: In function 'mdb_cursor_put':
mdb.c:6535:44: warning: this statement may fall through [-Wimplicit-fallthrough=]
 6535 |                                         if (SIZELEFT(fp) < offset) {
      |                                            ^
mdb.c:6540:33: note: here
 6540 |                                 case MDB_CURRENT:
      |                                 ^~~~
# github.com/mendersoftware/openssl
vendor/github.com/mendersoftware/openssl/engine.go:29:5: could not determine kind of name for C.ENGINE
vendor/github.com/mendersoftware/openssl/engine.go:36:6: could not determine kind of name for C.ENGINE_by_id
vendor/github.com/mendersoftware/openssl/engine.go:46:3: could not determine kind of name for C.ENGINE_finish
vendor/github.com/mendersoftware/openssl/engine.go:42:3: could not determine kind of name for C.ENGINE_free
vendor/github.com/mendersoftware/openssl/engine.go:41:5: could not determine kind of name for C.ENGINE_init
vendor/github.com/mendersoftware/openssl/engine.go:34:8: could not determine kind of name for C.free
make[1]: *** [package/pkg-generic.mk:289: /builds/buildroot.org/buildroot/test-output/TestMender/build/mender-3.4.0/.stamp_built] Error 1

The OpenSSL engine stuff makes me think perhaps this package needs to
select BR2_PACKAGE_LIBOPENSSL_ENGINES, but this isn't spotted directly
as an error.

Could you perhaps have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
