Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BAFC35FE4
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 10:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1DFF400EF;
	Sun, 15 Sep 2024 10:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3t1oYHAX_wr; Sun, 15 Sep 2024 10:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E612401A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E612401A4;
	Sun, 15 Sep 2024 10:04:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 899CF1BF681
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 772B74057B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThxBWJk-_Atr for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 10:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB95340574
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB95340574
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB95340574
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 10:04:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5D91C0003;
 Sun, 15 Sep 2024 10:04:47 +0000 (UTC)
Date: Sun, 15 Sep 2024 12:04:45 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Message-ID: <20240915120445.0d5154d0@windsurf>
In-Reply-To: <20240915093048.810466-1-thomas.perale@mind.be>
References: <20240915093048.810466-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726394688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sbHRTz9UnOkmHM3SUV8ve04mIHjH5Nm76uyobyRMECE=;
 b=GEQuiqg5KlzJatZvlrasbKAq0Jhx+pExu7UC4ii/hWD1mwQQsSRtN3/ehhRscZaBh8wg/U
 S2ZxOEj7Cg4w+8xHiTcpBFIYSifSTP7MF9Sew77dUN7nm/zrIOd7TuidMkU4fm0CA+TGE7
 uqSTClOfgMa8eeI0K28hCga+Ox02q9eRy/sM7dCKqaLZGWBRv7ZV0LhNddKNFVxTMf3z4n
 vErqaCgbS4dAFLRJdvkPaKvNngKKNfryzh449JyRVt6GKtrirGm7LJM3kW6RuXrWi44FGB
 hGTN49wA+Z8Tv+IQFbr/WfVLQNIBYD5VIi7ylh/z3GZo3cRZMK3vz3dnwdiO6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GEQuiqg5
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh: fix build failure
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
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Sep 2024 11:30:48 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> When compiling libssh without a C++ cross-compiler the build will fail.
> 
> This patch remove the CMake C++ dependency to build libssh. That dependency
> is only used for the code coverage tool and is not required to build the
> library.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/927/92794da6346b856ad74f14f87cc51415871cb5d2/
>   - http://autobuild.buildroot.org/results/89d/89dcd4982e4061732de635f9e7669db1f257330c/
>   - http://autobuild.buildroot.org/results/b3f/b3feff5c21defb53c65a3d5d06b13230cfed3317/
>   - http://autobuild.buildroot.org/results/bc8/bc8338d2c61eaa7c98c99140de5c491b7528c4f3/
>   - ...
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  ...enable-CXX-when-running-the-coverage.patch | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch

Thanks a lot, but once applied your patch doesn't apply to the libssh
code base:

>>> libssh 0.11.1 Patching

Applying 0001-cmake-Only-enable-CXX-when-running-the-coverage.patch using patch: 
patching file CMakeLists.txt
Hunk #1 FAILED at 9.
1 out of 2 hunks FAILED -- saving rejects to file CMakeLists.txt.rej
patching file cmake/Modules/AddCMockaTest.cmake
make: *** [package/pkg-generic.mk:247: /home/thomas/projets/buildroot/output/build/libssh-0.11.1/.stamp_patched] Error 1

Maybe you did your patch against libssh master, and forgot to rebase it
on top of 0.11.1 before adding it in Buildroot?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
