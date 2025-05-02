Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC75C3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9D983CC4;
	Fri,  2 May 2025 10:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_wTf0ItIbxM; Fri,  2 May 2025 10:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5DC683979
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5DC683979;
	Fri,  2 May 2025 10:23:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B754229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2131760B70
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWuqVNS4gDJE for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25BA460B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25BA460B5C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25BA460B5C
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:22:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 266361C0FC1; Fri,  2 May 2025 12:22:56 +0200 (CEST)
Message-ID: <c8cf629b-0d50-4457-95f4-fd0e8329c157@rnout.be>
Date: Fri, 2 May 2025 12:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250413162533.1737077-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250413162533.1737077-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0O7AH6YBqfHpAcb2XwzH+1VDseO/PmkMCNoa+Ygc2cg=;
 b=TIn+UzBoUv7AEkcSeKBkAT67g17nHg2XkHzGG2mt8+2bVDxD751fRTWVhlRzMI8LsdR/NA
 GbnCuk903gdbjiyUxve+RWR6b4xkIKCtuNZuPWQQrbAHr67h3cFSyOpCj2WwCfGNMxmq2u
 PX/cCqddmLfRjFEv0Ol8pvqNmBlZ/D7jj0La3u/tLcWrFyfqnqs2DmMkrUxtejsvGs43Y6
 c1Jhhg00P6gJJvILFvWWlfte1OcdDW4+IjBKk5kASHvtUIKYfscRgR+9lmwwdnM5+oskim
 PtOd5bsUzJbki3pBg/O1O6qqYbEqoHmSACIpWmthSqxQjzVIcUukm0kzjZWOrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TIn+UzBo
Subject: Re: [Buildroot] [PATCH] package/sqlite: revert upstream change
 causing build issue
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/04/2025 18:25, Thomas Petazzoni via buildroot wrote:
> Upstream did a change in sqlite3.pc.in that does work with their
> default build system, but not with the autoconf-based amalgamation
> that we use. This issue has been reported and fixed upstream, but the
> fix is not yet in any new release.
> 
> For the time being, we just revert the upstream change. We don't do a
> direct revert ("git revert") as multiple upstream commits touched this
> very line, so we simply revert to what it was prior to the different
> changes, and to what the upstream fix ends up doing.
> 
> This issue is causing build issue for all packages that use sqlite's
> pkg-config file, in a static-linking configuration.
> 
> Fixes:
> 
>    https://autobuild.buildroot.org/results/1824a76eee4a877a2f19c1fd19a710ef9f059168/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...vert-upstream-commits-causing-build-.patch | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
> 
> diff --git a/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch b/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
> new file mode 100644
> index 0000000000..f35c8b8ddd
> --- /dev/null
> +++ b/package/sqlite/0001-sqlite3.pc.in-revert-upstream-commits-causing-build-.patch
> @@ -0,0 +1,48 @@
> +From f70123a40193c2056755117aa291582f42db5f35 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 13 Apr 2025 17:47:53 +0200
> +Subject: [PATCH] sqlite3.pc.in: revert upstream commits causing build issues
> +
> +This reverts upstream commit a2d88f6a03c9ebde3d037b0e297f47216c685381
> +and a number of following commits related to the same commit. The
> +sqlite build system is indeed upstream not based on autoconf, but the
> +project "generates" an "autoconf-based amalgamation":
> +
> +  https://www3.sqlite.org/src/dir?ci=tip&name=autoconf
> +
> +Unfortunately commit a2d88f6a03c9ebde3d037b0e297f47216c685381 broke
> +the build with the autoconf amalgamation because while @LIBS@ gets
> +replaced by the autoconf machinery, @LDFLAGS_*@ do not, causing build
> +failures such as:
> +
> +output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_MATH@: No such file or directory
> +output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_ZLIB@: No such file or directory
> +output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: cannot find @LDFLAGS_ICU@: No such file or directory
> +
> +This issue has been reported at
> +https://sqlite.org/forum/info/e40b9b424a, and upstream says that the
> +issue has been fixed in the amalgamation script by basically doing the
> +same as what this commit does:
> +
> +  https://sqlite.org/src/info/fe47154799bfe
> +
> +Upstream: https://sqlite.org/forum/info/e40b9b424a
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + sqlite3.pc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sqlite3.pc.in b/sqlite3.pc.in
> +index a9f941b1e4..3799671e61 100644
> +--- a/sqlite3.pc.in
> ++++ b/sqlite3.pc.in
> +@@ -9,5 +9,5 @@ Name: SQLite
> + Description: SQL database engine
> + Version: @PACKAGE_VERSION@
> + Libs: -L${libdir} -lsqlite3
> +-Libs.private: @LDFLAGS_MATH@ @LDFLAGS_ZLIB@ @LDFLAGS_ICU@
> ++Libs.private: @LIBS@
> + Cflags: -I${includedir}
> +--
> +2.49.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
