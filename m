Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D392EE77180
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 23:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CAC60879;
	Tue, 10 Dec 2024 23:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X22PE4m6BQfv; Tue, 10 Dec 2024 23:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BDB2608C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BDB2608C6;
	Tue, 10 Dec 2024 23:00:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76887ED2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51601405D8
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfPPLCJaLSPP for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 23:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9A1F40696
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A1F40696
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9A1F40696
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 23:00:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E7F7478032A;
 Wed, 11 Dec 2024 00:00:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43468])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Dec 2024 00:00:07 +0100
MIME-Version: 1.0
Date: Wed, 11 Dec 2024 00:00:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20241210154240.1380886-1-fido_max@inbox.ru>
References: <20241210154240.1380886-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.9
Message-ID: <6cf7bbe8cdab290b3e8581d40357ecc3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733871609;
 bh=s/AZpf6HWZYDl/vkZnNYwNxWdlu8eCFDQs1wq6GdwGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WWMsmiDr+wg2QfXzrz+n6VpvItQaAgVhzaC8fo3KTkXPXR/n7Ih+hUE6MnFlUZ8Ml
 hpciAFctR+i1w+Xxr9A6mYy8bmI+bBEXHmXEyyd3ED3nMK+mJ0cFff9JkegFuGUQ91
 3jwpIrt1CPsQF8S7auLK8Nm1f3Lvg3y00kaigJGPkan4J0CN8/Yo/qjQr5gcgXcD9n
 Obg11GTwA0uVT8wy/vKvXLI4yp3UR5etiDA8wyLmkkASo4gDVH9BDKxXLa0KF57n++
 Dt/5hDGztgtKKlw+ONjfQs7+u9VQ54HDtR8ubglTfJYOlAxc2CITSovTkm/0U40Fhn
 qdCaYsD3Ts/jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WWMsmiDr
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: add patch to
 disable docs build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxim,

Thanks for the patch!

On 10/12/2024 16:42, Maxim Kochetkov via buildroot wrote:
> docbook package is needed for building docs. Build fails without it
> if xmllint is found on host:
> 
> I/O error : Attempt to load network entity: 
> http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd
> ../doc/src/sgml/postgres.sgml:22: warning: failed to load external 
> entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
> ]>
>   ^
> ../doc/src/sgml/postgres.sgml:24: element book: validity error : No 
> declaration for attribute id of element book
> <book id="postgres">
>                    ^
> 
> So disable docs build.

It seems postgresql is not always failing. In some situations,
it can build. See for example:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8580182027

I also see that the PostgreSQL meson build system provides option
to build the docs. See:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=blob;f=meson_options.txt;h=246cecf382712d94157856d6d5403f6d0fc13148;hb=6304632eaa2107bb1763d29e213ff166ff6104c0#l88

Did you try to always disable docs by setting those options to false
in _CONF_OPTS?

For example, setting:

     POSTGRESQL_CONF_OPTS = \
         -Ddocs=false \
         -Ddocs_pdf=false \
         -Drpath=false

See:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/postgresql/postgresql.mk#L17


> Fixes: 
> https://autobuild.buildroot.org/results/711c101d9a4807fcb59cff2b7c89454f96cc3e2d/
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  ...ld-drop-docs-build-from-world-target.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 
> package/postgresql/0001-meson.build-drop-docs-build-from-world-target.patch
> 
> diff --git 
> a/package/postgresql/0001-meson.build-drop-docs-build-from-world-target.patch 
> b/package/postgresql/0001-meson.build-drop-docs-build-from-world-target.patch
> new file mode 100644
> index 0000000000..92ddbf7da6
> --- /dev/null
> +++ 
> b/package/postgresql/0001-meson.build-drop-docs-build-from-world-target.patch
> @@ -0,0 +1,34 @@
> +From 304889951e5fd2b40864770ef2432c83b68c0c1a Mon Sep 17 00:00:00 2001
> +From: Maxim Kochetkov <fido_max@inbox.ru>
> +Date: Tue, 10 Dec 2024 13:55:09 +0300
> +Subject: [PATCH 1/1] meson.build: drop docs build from "world" target
> +
> +"world" target is used to compile all the PG extensions and
> +plugins. There is no way to disable documentation builds for
> +"world" target. However documentation needs a lot of extra
> +xml/sgml/docbook tools, schemas etc...
> +So let's just drop docs tarets.
> +
> +Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> +---
> + meson.build | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 005dc9f353..2504a3c8f5 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -3588,8 +3588,8 @@ alias_target('pl', pl_targets)
> + alias_target('contrib', contrib_targets)
> + alias_target('testprep', testprep_targets)
> +
> +-alias_target('world', all_built, docs)
> +-alias_target('install-world', install_quiet, installdocs)
> ++alias_target('world', all_built)
> ++alias_target('install-world', install_quiet)
> +
> + run_target('help',
> +   command: [
> +--
> +2.45.2
> +
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
