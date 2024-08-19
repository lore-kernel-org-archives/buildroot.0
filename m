Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F6DC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D423080F1A;
	Mon, 19 Aug 2024 20:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8oDa6--klK0; Mon, 19 Aug 2024 20:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E51080CAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E51080CAF;
	Mon, 19 Aug 2024 20:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 387F31BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FADF408AD
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE_IKaQBvv0n for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:31:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C38C84098B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C38C84098B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C38C84098B
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:30:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7647E13F88E;
 Mon, 19 Aug 2024 22:30:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Aug 2024 22:30:46 +0200
Date: Mon, 19 Aug 2024 22:30:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZsOrdr_Wyujsgqh7@landeda>
References: <44f9f8a3-9ebf-4cad-acd8-1b6331581c72@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44f9f8a3-9ebf-4cad-acd8-1b6331581c72@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724099450;
 bh=tJdYOrEyR/3hNcBCOnFeMhUFw2Hje85PZYD0xdg/SlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLT4jXLmAQQ4FBEETluTa6UDoWV44VvfJX2Sp8xUzraEoezY4T22EuXCWtrqSOiDL
 /ulkaK/BqMQroG53x6rrQ17RSZBYsMpibd8SgVZNFVxZGSvv9uq49KfJJStra4PiXX
 bOcJXmikEvnDKGwNfaDKS+bBcN1wRwj+o8eDhISCZW8fL8hJKEJpR/pDFxSJieR2Jg
 wj5NTyecltOU21anqjs+bHdosUXxi4/9xYnolHWpijW2ys2qkYMhVouEu0mHtgDlYX
 fnQRUK2SxbDLneapo484FYOYj/cUsxsxhlm5bG5o6U8y3Q4QA3pHGp5xG14WMHTApF
 jcAxVj3kyWgGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cLT4jXLm
Subject: Re: [Buildroot] GLib/GObject-introspection bootstrap
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 iMarcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

+Marcus

On 2024-08-19 19:52 +0200, Fiona Klute via buildroot spake thusly:
> I'm currently trying to upgrade GLib & GObject-introspection to their
> current versions (1.80.4 and 1.80.1), not least because those work with
> musl without patching.

Not a small task you started there...

There was was some previous talks about that on IRC, but I haven't seen
anything materialising so far... Marcus, are you still looking into
that?

So, for the records, here's my suggestion below...

> The difficulty is that GLib now needs a sort of
> bootstrap process:
> 
> * Build GLib with -Dintrospection=disabled
> * Build GObject-introspection
> * Build GLib with -Dintrospection=enabled
> 
> Description in the GLib NEWS file:
> https://gitlab.gnome.org/GNOME/glib/-/blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438
> 
> What would be the preferred way to implement this in Buildroot? Is there
> a built-in way to rebuild a package with different config after building
> another package for such situations? Or should I include that bootstrap
> build of GObject-introspection in libglib2.mk (like Alpine does)? In the
> latter case the GLib package would share the source archive with
> GObject-introspection and I remember reading on the ML that there's
> support for that, would be great if someone could point me at it if
> relevant.

So, the way to go would be to introduce a new package,
libglib2-bootstrap, where the no-introspection libglib2 is built.

Then GObject-introspectionGObject-GObject-introspection depends on
libglib2-bootstrap.

To share download, you'd tell libglib2-bootstrap to share its download
with libglib2:
    LIBGLIB2_BOOTSTRAP_DL_SUBDIR = libglib2

Note that there is also the case for host-libglib2: do we need an
introspection-aware host-libglib2, or can we do without it? If the
former, then we'll need libglib2-bootstrap to also be a host package.

> Also, when I prepare patches, should I just drop the glibc requirement
> for GObject-introspection, or add musl? I have no idea if it works with
> uClibc.

Just add musl.

> Likewise, are the checks for (ancient) GCC versions still relevant?

Not sure what you meant here: libglib2 has no dependency on a gcc
version. gobject-introspection does, however, and I doubt they would no
longer be releveant; they may even be more stringent. Ypou'd have to
check what libglib2 anf goi state they require.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
