Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34013C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 22:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D550F60861;
	Mon, 19 Aug 2024 22:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lu146KJttxw; Mon, 19 Aug 2024 22:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE1506083E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1506083E;
	Mon, 19 Aug 2024 22:16:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF4AA1BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99D29401C5
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKjjx-EP3Fk3 for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 22:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08259401A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08259401A0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08259401A0
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 22:16:52 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 08E802C83186;
 Tue, 20 Aug 2024 00:16:49 +0200 (CEST)
Message-ID: <1a14c38e-2d3e-4a63-8f03-9bd6cc1861ff@bubu1.eu>
Date: Tue, 20 Aug 2024 00:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <44f9f8a3-9ebf-4cad-acd8-1b6331581c72@gmx.de>
Content-Language: en-US
In-Reply-To: <44f9f8a3-9ebf-4cad-acd8-1b6331581c72@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724105810; bh=L809tQLQ9Vm2lDqYuI7G5ThxeMBkTkWy1mrVq+0bvNQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=tKsl0I01VY4ICGQHGzU0Z5Xnxk58EUOK5ggPUWXG1ZjCExDfJKMNHk7A86DMi0hgS
 D5XdH/+v1t9aOd4uGSH7v7gQNvy9e7W6bWF/oZfTJEz65MpWZmPOSp1bsmOWj7/vt2
 xkvRqpB1vyzUdUzZHdhYwxkWcrUfsSfUFnvSrJfv8Du7V4JMZQM87LWf50FDNcv/lb
 ex4lgjpM4Ycw82GpnEKiEXRpzyA2uoXk8/z/K4Oi+q51g/hkQ/lauQa5fPG7zKvaG+
 OMkXZB0Nmnbll1+8QUMK1Tdq4KTuKCrfvo641JSjavrbFmtrfwWxDcsYXPaM2R/DyW
 P5O1WmfqjuQiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=tKsl0I01
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

I looked into this a few weeks back as well (but am unlikely to find 
time to continue working on this in the near future).

The conclusion we came to on IRC was, that introducing a 
libglib2-initial package similar to gcc-initial  would be the best/only 
option. (Which gets added as a dependency to gobject-introspection which 
then gets used to build the final libglib2.)
I didn't actually get to trying this out, so no guarantees :).

Best,
Marcus

On 19.08.24 19:52, Fiona Klute via buildroot wrote:
> Hi everyone,
> 
> I'm currently trying to upgrade GLib & GObject-introspection to their
> current versions (1.80.4 and 1.80.1), not least because those work with
> musl without patching. The difficulty is that GLib now needs a sort of
> bootstrap process:
> 
> * Build GLib with -Dintrospection=disabled
> * Build GObject-introspection
> * Build GLib with -Dintrospection=enabled
> 
> Description in the GLib NEWS file:
> https://gitlab.gnome.org/GNOME/glib/-/ 
> blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438
> 
> What would be the preferred way to implement this in Buildroot? Is there
> a built-in way to rebuild a package with different config after building
> another package for such situations? Or should I include that bootstrap
> build of GObject-introspection in libglib2.mk (like Alpine does)? In the
> latter case the GLib package would share the source archive with
> GObject-introspection and I remember reading on the ML that there's
> support for that, would be great if someone could point me at it if
> relevant.
> 
> Also, when I prepare patches, should I just drop the glibc requirement
> for GObject-introspection, or add musl? I have no idea if it works with
> uClibc. Likewise, are the checks for (ancient) GCC versions still relevant?
> 
> Best regards,
> Fiona
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
