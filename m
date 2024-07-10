Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292B7C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7CC96066A;
	Wed, 10 Jul 2024 21:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yh-pE4QcnmCp; Wed, 10 Jul 2024 21:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE1C26066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE1C26066B;
	Wed, 10 Jul 2024 21:06:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9F271BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A798F6066B
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mhq4vp_kiThq for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:06:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51A966066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51A966066A
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51A966066A
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:06:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 959F660002;
 Wed, 10 Jul 2024 21:06:17 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:06:16 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240710230616.1f2012ad@windsurf>
In-Reply-To: <20240623205821.3833321-1-james.hilliard1@gmail.com>
References: <20240623205821.3833321-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720645577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PlE0LZjlPWZIgmUGRYRcwTFcPrayjo8Y8EW0Vyz8RTE=;
 b=kTXw3aYNfbhXwAkvNJ8g7+m6ICA+5hNMHmUKbGDZv+2BpBDf6jf0t0LjnDG+fpEUKkFiUz
 +fmtPp0lG/PElyqz9E/1ZvvEkqM5Oz8LdfGYFnQcy7UYbC+45jhnU9BmpOoeYZ1t/LyDx9
 mogEvxVsSQvw+mQWAUMMp3BNpjf9pjQ6qICgB9JpZi0rrpf1PgDQAiikyzBQTHRth87TlZ
 JNziHkMbDSp/eF/J0ZZ6PHlUWLUx/UdMYwUIwjAjOpvgX5se1O2fnNqxx1G8gyWKf4eOtq
 shZc2fFYo3cXsQWOgFUbKlpqoFjacY6CxIU9/uRscqcPJgyVweLH9tRZgVkKCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kTXw3aYN
Subject: Re: [Buildroot] [PATCH 1/1] utils/update-rust: use pathlib with
 relative paths
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun, 23 Jun 2024 14:58:21 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This avoids the requirement of running update-rust from TOPDIR and
> is slightly cleaner.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied after fixing a few flake8 issues:

./utils/update-rust:5:1: F401 'sys' imported but unused
./utils/update-rust:86:18: F541 f-string is missing placeholders
./utils/update-rust:103:18: F541 f-string is missing placeholders

Some comments below.

> +    TOPDIR = pathlib.Path(__file__).parent.parent
> +    update_mk_file(TOPDIR / "package/rust/rust.mk", args.version)
> +    update_mk_file(TOPDIR / "package/rust-bin/rust-bin.mk", args.version)
> +    gen_hash_file_src(TOPDIR / "package/rust/rust.hash", args.version)
> +    gen_hash_file_bin(TOPDIR / "package/rust-bin/rust-bin.hash", args.version)

I really didn't know about pathlib.Path(), so very interesting. My
understanding is that TOPDIR / "package" / "rust-bin" / "rust-bin.hash"
would be more correct, but I find it annoying to read.

We have other Python scripts in Buildroot that also need to get the
TOPDIR, and they do it in different ways.

Two times os.path.dirname():

utils/check-package:        base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
utils/check-symbols:    base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

Or os.path.join() with the path to the root:

support/scripts/pkg-stats:brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
support/testing/infra/__init__.py:BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))

we're not very consistent :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
