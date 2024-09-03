Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8DFCD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8049C60017;
	Tue,  3 Sep 2024 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmA0ueaxYThY; Tue,  3 Sep 2024 21:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E015605FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E015605FD;
	Tue,  3 Sep 2024 21:33:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 549771BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FDEA401F5
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 561_krJHwGSW for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C142D401E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C142D401E2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C142D401E2
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:33:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6922A60004;
 Tue,  3 Sep 2024 21:33:28 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:33:27 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240903233327.34edabc6@windsurf>
In-Reply-To: <Zs8fPOrOGtdUOvA9@waldemar-brodkorb.de>
References: <Zs8fPOrOGtdUOvA9@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725399208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVi3D0cDbTpX8/MpqXWOG7BuvpLdyOd/H7BQ57Lqm+c=;
 b=TQLXPwVDAZjdQhbGsECBX+7ny0pQ/ZYSbRO22uLwMyo6LGQwUNhxrvJcwcB4xQ+gvRAtA1
 /3vOr3ew2xUW+fQf1LSp1lYs8eAYBGpW0yRadexCWfIf6Gj96F1le5tghMsrn5SJ8oZVkF
 9kh+nayugAKw5SUfELOt0KRO5s2i+jfNCFDTxAcLo/IL3DhKQnB2I1XkiXUXDWDozQIXV3
 3exqiWTrI1t45i1nAuAI/nEpVmf94mUDWUvlvzvavkdDnpCytEpfmzyILlPMMnbAgvHqEv
 RPMcKHnWD4dI/rgj8waVvuABud22YEgOerCddIZRnIWZTLVON3777tyew7/6bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TQLXPwVD
Subject: Re: [Buildroot] [PATCH] package/fbdump: fix gcc 14.x issue
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

On Wed, 28 Aug 2024 14:59:40 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Following error is seen with gcc 14.x:
> /home/autobuild/autobuild/instance-0/output-1/host/bin/armeb-buildroot-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -O2 -fomit-frame-pointer -s -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -c `test -f 'main.c' || echo './'`main.c
> main.c: In function 'main':
> main.c:82:49: error: passing argument 4 of 'Options_parse' from incompatible pointer type [-Wincompatible-pointer-types]
>    82 |   if( Options_parse( opt_template, &opts, argc, argv ) != 0 )
>       |                                                 ^~~~
>       |                                                 |
>       |                                                 char **
> In file included from main.c:17:
> options.h:32:83: note: expected 'const char **' but argument is of type 'char **'
>    32 | int Options_parse( const OptionTemplate *tmplt, void *opts, int argc, const char *argv[] );
>       |                                                                       ~~~~~~~~~~~~^~~~~~
> make[3]: *** [Makefile:240: main.o] Error 1
> make[3]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/fbdump-0.4.2/src'
> make[2]: *** [Makefile:201: all-recursive] Error 1
> make[2]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/fbdump-0.4.2'
> make[1]: *** [Makefile:156: all] Error 2
> make[1]: Leaving directory '/home/autobuild/autobuild/instance-0/output-1/build/fbdump-0.4.2'
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/3a0/3a0abff75023e257f3d6048688485a380b72fbb3
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/fbdump/0001-fix-gcc14-compile-issue.patch | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 package/fbdump/0001-fix-gcc14-compile-issue.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
