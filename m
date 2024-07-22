Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E447EC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D13B4053D;
	Mon, 22 Jul 2024 12:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsfgG9Njskkq; Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C52F4063E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C52F4063E;
	Mon, 22 Jul 2024 12:10:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7461BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2933240243
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMSOJg4g_gFb for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:10:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E1CA401D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1CA401D1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E1CA401D1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:10:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6E36E0004;
 Mon, 22 Jul 2024 12:10:24 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:10:24 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722141024.3be863b1@windsurf>
In-Reply-To: <20240722082154.721778-1-fontaine.fabrice@gmail.com>
References: <20240722082154.721778-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJGNcXG4cp/BiNnOywHAnKEdPj5IGhAW9SpjIK82/f0=;
 b=bdgXDORgZLO9W0Lle9iLoauhb4QAICqyAcDjJdAhiIPGiS8QUFjK0cbgyTvmwEF/DapQqq
 OVRNRARuwsU7ic7RGN7i/jrp991iEJAwjGkSExeddWlAixOex1Pav20N5LHcK4XHMXfLHY
 KgnnA4lIA3biDBjnoVETQmWeoQPauOby1RlaTeo4lMMfY2uNTzYjqpUX6/ieZjBiprAc9p
 8tCG81MIF6I9wCwlEEn3lA+JdIHazgrwZiniG2djWW0FZ63j/rvQP8KmuUyFbpQhahdWqJ
 srdSEGQeP2HJviinNYbhe9877qGBTx6eMq+80LFry3qlbqnXvi6bXeGDcOP6+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bdgXDORg
Subject: Re: [Buildroot] [PATCH 1/1] package/gtkiostream: disable octave
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 10:21:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable octave support which was added in commit
> fab48302865e5c0c98d91b696bc90e75e38189bb but untested as octave is not
> installed to staging and raises the following build failure:
> 
> sparc64-linux-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/octave-3.8.1'
> 
> Fixing those issues is useless, as gtkiostream is not compatible with
> latest octave version as it raises a bunch of errors:
> 
> Octave.C: In member function 'void Octave::startOctave(const std::vector<std::__cxx11::basic_string<char> >&)':
> Octave.C:85:5: error: 'octave_main' was not declared in this scope; did you mean 'octave_map'?
>    85 |     octave_main((int)argsIn.size(), (char**)&argsIn[0], embedded);
>       |     ^~~~~~~~~~~
>       |     octave_map
> Octave.C: In member function 'int Octave::setGlobalVariable(const std::string&, Matrix&)':
> Octave.C:283:50: error: use of deleted function 'octave::symbol_table::symbol_table()'
>   283 |             octave_value ov=octave::symbol_table().global_varval(string(baseName));
>       |                                                  ^
> In file included from /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/octave-config.h:99,
>                  from /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/parse.h:29,
>                  from Octave.C:18:
> /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
>    63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
>       |                                       ^~~~~~~~~~~~
> /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
>   354 |   X () = delete;                                \
>       |   ^
> Octave.C:284:34: error: use of deleted function 'octave::symbol_table::symbol_table()'
>   284 |             octave::symbol_table().global_assign (string(baseName), setGlobalSubVariable(varNames, m, 0, ov));
>       |                                  ^
> /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
>    63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
>       |                                       ^~~~~~~~~~~~
> /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
>   354 |   X () = delete;                                \
>       |   ^
> Octave.C:286:34: error: use of deleted function 'octave::symbol_table::symbol_table()'
>   286 |             octave::symbol_table().global_assign (string(baseName), m);
>       |                                  ^
> /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/symtab.h:63:39: note: declared here
>    63 |   OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE (symbol_table)
>       |                                       ^~~~~~~~~~~~
> /home/fabrice/buildroot/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/octave-9.2.0/octave/oct-conf-post-public.h:354:3: note: in definition of macro 'OCTAVE_DISABLE_CONSTRUCT_COPY_MOVE'
>   354 |   X () = delete;                                \
>       |   ^
> Octave.C: In member function 'octave_map Octave::setGlobalSubVariable(const std::vector<std::__cxx11::basic_string<char> >&, const Matrix&, int, octave_value&)':
> Octave.C:302:38: error: 'class string_vector' has no member named 'lookup'
>   302 |             whichIdx=base.map_keys().lookup(varNames[index+1]); // map_keys returns a string_vector
>       |                                      ^~~~~~
> 
> Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb
>  - http://autobuild.buildroot.org/results/9cfc420a4e41503635792472176583a8f81bb2a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gtkiostream/gtkiostream.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
