Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7AEE8B36B
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4AD140B7E;
	Tue,  3 Feb 2026 21:54:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joQzjdwbKY7c; Tue,  3 Feb 2026 21:54:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF6840B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770155677;
	bh=p/vUbW7Sy7g3dBWjrqjkinyLLUKcaiX4dri492LB/U4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oP34Cgr267pPN5mzGd86NVvfn7nOTmqHg6yB/J+e7I04RfdUdiVBTmrTHmHQl8IZl
	 g84Ijo/gow2hc9TAnV3r7b7M1gVkXtrF2PFU9fb1n4p0Fd3as9vT/ND2z9+rA5/DDm
	 qgHY6qFqI2UD2fhrGyMaGs22xcpKTMuLyBHNK/Ec6m6M/BzI0qTQU1QUyCBBOSOki0
	 njCpNCIX+mtiS6E73sk75M5dqv0lih/IaPZyYrrUaMthhcaznAQ2v8UPd7TrkBimzL
	 IZnq8RaK33EWzXCOl4LbZEpXrJTFZyMU6N+WpiEEF3jy7vHnz81QH8oag4miicg3F3
	 iixf4AePLSwFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF6840B45;
	Tue,  3 Feb 2026 21:54:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62FFA13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5889240B45
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaROJKozMeAv for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:54:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EB8240A8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EB8240A8A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EB8240A8A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4A35F19F5A7;
 Tue,  3 Feb 2026 22:54:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Feb 2026 22:54:30 +0100
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Tue,  3 Feb 2026 22:54:28 +0100
Message-ID: <7afd223643ad94c36adc4ff486197aba5f073d0d.1770155657.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770155657.git.yann.morin.1998@free.fr>
References: <cover.1770155657.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770155672;
 bh=h8e7LlINHFhMfGMpHoTR0jH1/tiG/0HNGTdC5FxsUgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O2ksZDY+147UeojwlvtusypqvMR8bsVo//r3Fxzcns2+ganxUuu8isbdXBkjjQlEe
 gZ5EiIG69aIvbfC0gCz/XV5ZkG/6aiw/LV22yG68j1oZwkn/MoaVUluRKZ9mN/0VA+
 SkMWjGfHeau2trqJubZjLfeFtAGz6AYJ1GcT7ZkjMN6Ko63d+tn7QHQPo4gc3x9smP
 iEVtY5nqZznajYFtg4VO3COSQ2kadGzbZsLsVdnWaGsQUkeS7tTIHl9KnHC4pPPARh
 E8Xku6k3bah4NXO6ECP+oiWzbmcGhoQYdZPIPnzRklVfTB4/OkfnEadLVMTfzh28sX
 OfIafqihn6seQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O2ksZDY+
Subject: [Buildroot] [PATCH 1/3 v4] support/br2-external: remove leftover
 trap
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The trap was initially introduced in c5fa9308ea4e (core/br2-external:
properly report unexpected errors), in 2017, to catch all unexpected
errors, back when a single file was generated, and errors emitted to
stderr.

Since commit d027cd75d098 (core: generate all br2-external files in
one go), in 2019 the single output file 'ofile' is no longer created,
as multiple output files were then introduced, while messages for
*expected errors* were redirected to a Makefile variable assignment
emitted on stdout, at which point the script just exits (in error);
expected failures only occur in do_validate().

Unexpected errors can only occur on failure to create, or write to,
output files, either '.br2-external.mk' in do_validate() or do_mk(),
or any of the kconfig fragments in do_kconfig(). Cause for failure to
create those can only be a no-space-left-on-device condition, as they
are created in a directory that was just created by the script earlier
in main(), and thus has the necessary mode; failure to create that
directory is now caught explicitly.

A trap on ERR is not called when the shell exits explicitly with a call
to 'exit', thus, only failures to create or write to output file would
be caught. In that case, we are better off not trying to write to those
files anyway: failure to create the file would already be reported by
the shell on stderr, while disk-full would not allow to store the output
anyway...

In any case, the script exits in error, which is going to be caught by
the caller, which will terminate.

So, drop the trap altogether.

As a side effect, that squelches a shellcheck error.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Note: remaining shellcheck errors will be addressed separately in the
following patch.
---
 support/scripts/br2-external | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 8aea479d20..6d4fc1a791 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -30,10 +30,10 @@ main() {
         error "no output directory specified (-d)\n"
     fi
 
-    # Trap any unexpected error to generate a meaningful error message
-    trap "error 'unexpected error while generating ${ofile}\n'" ERR
+    if ! mkdir -p "${outputdir}"; then
+        error "Cannot create output directory '%s'\n" "${outputdir}"
+    fi
 
-    mkdir -p "${outputdir}"
     do_validate "${outputdir}" ${@//:/ }
     do_mk "${outputdir}"
     do_kconfig "${outputdir}"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
