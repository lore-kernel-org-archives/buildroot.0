Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C6ACF6493
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 11:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 912F04045C;
	Sat, 28 Sep 2024 11:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrwkSDpRaBXR; Sat, 28 Sep 2024 11:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C5840458
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13C5840458;
	Sat, 28 Sep 2024 11:10:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 348721BF3A0
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 11:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 205D7605E8
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 11:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdBMXnJ7n5UA for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 11:10:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7864605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7864605D7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7864605D7
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 11:09:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CDFCE2003DE;
 Sat, 28 Sep 2024 13:09:54 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42220])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Sep 2024 13:09:54 +0200
MIME-Version: 1.0
Date: Sat, 28 Sep 2024 13:09:54 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20240918151836.909590-1-thomas.perale@mind.be>
References: <20240918151836.909590-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.9
Message-ID: <6b193b80476bb6bacc48b40df8ff7017@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727521797;
 bh=GEaPQDEC3pHJmUTZ5okHpLUaZYwL9W6kBB3TZREt/3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rly4NfBSp3c1mpBSX3d0gqKleq9B58ZBVyoA3XRwEogF7vslnFLAAt6pnof03SC+6
 JzyoUAxi/t+e/0qOlekrwYDRJ7YvJ1BbQ1X5wG4lva71KurhNZMf2Lx2rkhXbl0goJ
 T/JfJXOS90XgF94LKQrKEBFsnmioXFK5mWWtNo876CCnUafywfthb+jLYUlyqqniPm
 pHS8E97NdfwnW11u3BDCfZx1q+wvzsPdHAIb+BryULaFPdbaqSK73cAiNLzDm0aRqc
 iaQAcSHlG5aIHNo1Z7+oWB6XegcEvqRiErppHUOXkB5q46xVgcZhPG+SYPICmAfXCt
 U9OVvz77W+ooQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rly4NfBS
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuradio: fix v3.10.11.0 bump
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, All,

Thanks for the patch.

On 18/09/2024 17:18, Thomas Perale via buildroot wrote:
> With GNURadio bump to v3.10.11.0, this patch is now part of that 
> release.
> See 
> https://github.com/gnuradio/gnuradio/commit/ead459813367e7fd679dad067d1b020010d49b4f

While this patch is valid, the commit log description is not
completely accurate. I suggest to add in the commit log something
like:

"""
package/gnuradio: fix build by removing unneeded package patch

The gnuradio package patch 0001 was introduced in commit 81e6541ef
"package/gnuradio: fix build with fmt >= 11.x" [1] while Buildroot was
in a release client stabilization branch. It was first in included in
the 2024.08-rc2 tag. This is why the gnuradio version was _not_ bumped
at that time.

At the same time, the gnuradio package was also broken in the "next"
branch for the same reason. It was fixed by bumping the gnuradio
version (which is already including the patch) in commit 101e7b69d
"package/gnuradio: bump version to 3.10.11.0" [2].

Both commits [1] and [2] are individually working. The gnuradio
package fails to build since the merge commit 3daa03752 "Merge branch
'next'" [3]. This is this merge commit which should have removed this
package patch.

This commit fixes this issue by remove the package patch.

Fixes:
- 
http://autobuild.buildroot.org/results/dfda705bb1b3b975bde3d84c6b25a9b41c545c84
- 
http://autobuild.buildroot.org/results/7c32bd40b5e1420535734480bf5a4d4365b8896f
- https://gitlab.com/buildroot.org/buildroot/-/jobs/7888800399

[1] 
https://gitlab.com/buildroot.org/buildroot/-/commit/81e6541efe054df635947d0c143818f8cf7cb048
[2] 
https://gitlab.com/buildroot.org/buildroot/-/commit/101e7b69da88148fa8333af05444e47bae631833
[3] 
https://gitlab.com/buildroot.org/buildroot/-/commit/3daa037528c38b91caf616cb47992da7730f4343
"""

> Fixes:
>   - 
> http://autobuild.buildroot.org/results/dfd/dfda705bb1b3b975bde3d84c6b25a9b41c545c84/
>   - 
> http://autobuild.buildroot.org/results/7c3/7c32bd40b5e1420535734480bf5a4d4365b8896f/
> 

Reviewed-by: Julien Olivain <ju.o@free.fr>

> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  ...o_signature-include-spdlog-ranges.h-.patch | 38 -------------------
>  1 file changed, 38 deletions(-)
>  delete mode 100644 
> package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
> 
> diff --git 
> a/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch 
> b/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
> deleted file mode 100644
> index 6a08b8edee..0000000000
> --- 
> a/package/gnuradio/0001-blocks-runtime-io_signature-include-spdlog-ranges.h-.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 03c9a40883e610e54b8fc3c3ce1842d68d7ce2e4 Mon Sep 17 00:00:00 2001
> -From: Kefu Chai <tchaikov@gmail.com>
> -Date: Mon, 15 Jul 2024 09:27:16 +0800
> -Subject: [PATCH] blocks,runtime: io_signature: include 
> spdlog/*/ranges.h for
> - using fmt::join()
> -
> -fmt::join() was moved into fmt/ranges.h since fmt 11, so let's
> -include the corresponding header in spdlog for using it.
> -
> -Signed-off-by: Kefu Chai <tchaikov@gmail.com>
> -(cherry picked from commit 19b070051c1c2b5fb6f2da8fb6422b27418c3dfa)
> -Signed-off-by: Jeff Long <willcode4@gmail.com>
> -Upstream: 
> https://github.com/gnuradio/gnuradio/commit/ead459813367e7fd679dad067d1b020010d49b4f
> -[Julien: backported commit ead45981 from v3.10.11.0]
> -Signed-off-by: Julien Olivain <ju.o@free.fr>
> ----
> - gr-blocks/lib/message_debug_impl.cc | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/gr-blocks/lib/message_debug_impl.cc 
> b/gr-blocks/lib/message_debug_impl.cc
> -index 1e81aec0d..415d2be97 100644
> ---- a/gr-blocks/lib/message_debug_impl.cc
> -+++ b/gr-blocks/lib/message_debug_impl.cc
> -@@ -14,6 +14,11 @@
> - #include <pmt/pmt.h>
> - #include <spdlog/common.h>
> - #include <spdlog/fmt/fmt.h>
> -+#if __has_include(<spdlog/fmt/ranges.h>)
> -+#include <spdlog/fmt/ranges.h>
> -+#elif __has_include(<spdlog/fmt/bundled/ranges.h>)
> -+#include <spdlog/fmt/bundled/ranges.h>
> -+#endif
> - #include <functional>
> - #include <utility>
> - #include <vector>
> ---
> -2.46.0
> -
> --
> 2.46.0
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
