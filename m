Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FE1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 07:29:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF7F860FF2
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 07:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF7F860FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E99B40324;
	Mon, 13 Sep 2021 07:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iP9lbSWkdSJx; Mon, 13 Sep 2021 07:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CAC40339;
	Mon, 13 Sep 2021 07:29:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17A9F1BF3A7
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 07:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05AA5400E8
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 07:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rDCbzgiTnqeD for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 07:29:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D092340025
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 07:29:51 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g8so12876681edt.7
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 00:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNDwDLC9ToYp4yvXmJ6A++OQXfg0w+qQlnyFUggmOMk=;
 b=kmhpUu33Htn53q47eVJBAo6fwX+rj/k0iJiK5aUsOkOCSljP++28E6MzWwI8xwnrUr
 HNEnIaK2iEMHaSgsg3RfGhxesSSaXHz+WRh3Ivjv6QmRTUOenZjlXq6g+rTFbPECI85T
 3XhOyLcZ12rvK6lm7LeKPPx98k+PSiAk3k2NtnwA2+5mrVSWIUCBKfrE9PBz378vyYHj
 QJQCLS2QKyL5V6wz5MTqpvx+yk7VJ92XdLsmHPngzXbGoIfhScIYW5RwWIM41U+chbNS
 1IUczgoPFusTUWi++J9oVL0HnbvdOOdqLH0vO/NvQ1h/W+WIul1qbB4hSAtzU+UpEjnb
 DK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNDwDLC9ToYp4yvXmJ6A++OQXfg0w+qQlnyFUggmOMk=;
 b=w6AW9FDLK1jyBWwvBrHijxD03p+p4IJV+FlBRgsUjDUOeqtmjoqwi7UyLwShPQmrWd
 5DQNGPQIyoa7PKuDgEpkQZrS22T2XTdbciGBAWQDDQ7n21pQxND35uF3m5aBS+mihMIi
 q1LMBYlKeaD+8IFilXaYwliSzMMzeeJb9MfGURr2uPSPmnaSLB8btX3VUvUUJgKWq4kR
 JvqJmTVl65e0sa/WCaV1vPPt20tQ209FqkKlo7zU2ycTsiKx+Vu6pJnp4JpHs+HlVOiT
 pft54dSVATM9H8KjCw1pfJ+fbcYkUuN5WueT8SmOkmCpxqspCe1bJs1ELOxk6Th5cDtj
 G6bw==
X-Gm-Message-State: AOAM533bNUjMtngEcclUvKnEC/6h4QxW6HdWx8ASkq+OGOe+ajkpJEAw
 I+DtvnwMrCgV7rzj4o4Im0LqphZiB+8qPm9O
X-Google-Smtp-Source: ABdhPJwoBbwcMjXgxIkiyOfExZuPivlcghxY0WDyknrF86CJQmwGZZKXakaVLnetD1i+UfZtVdXgIA==
X-Received: by 2002:a05:6402:17d5:: with SMTP id
 s21mr11777781edy.377.1631518190055; 
 Mon, 13 Sep 2021 00:29:50 -0700 (PDT)
Received: from localhost (ptr-5gw9txf6g5tndjqqqz.18120a2.ip6.access.telenet.be.
 [2a02:1810:510:3800:1b15:18e4:57d1:eb])
 by smtp.gmail.com with ESMTPSA id o7sm3400834edt.68.2021.09.13.00.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 00:29:49 -0700 (PDT)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 09:29:41 +0200
Message-Id: <20210913072942.30109-1-patrickdepinguin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] docs/manual/using-buildroot-debugger:
 suggest '-ix' iso '-x' when loading gdbinit
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

A gdbinit file passed via '-x' will be read _after_ parsing any
object/core file passed on the command-line. In cross-compilation context,
this is particularly a problem when loading a core file, because without the
'sysroot' specified in the gdbinit file, it will give a lot of warnings,
like:

    warning: .dynamic section for "/lib/libstdc++.so.6" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/librt.so.1" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libm.so.6" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libgcc_s.so.1" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libc.so.6" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/ld-linux.so.2" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libanl.so.1" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libdl.so.2" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libpthread.so.0" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/usr/lib/libz.so.1" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libnss_files.so.2" is not at the expected address (wrong library or version mismatch?)

    warning: Could not load shared library symbols for 17 libraries, e.g. [...]
    Use the "info sharedlibrary" command to see the complete listing.
    Do you need "set solib-search-path" or "set sysroot"?

In contrast, the '-ix' option will load the specified gdbinit file _before_
parsing object/core files. This will remove said warnings.

See also: https://sourceware.org/bugzilla/show_bug.cgi?id=28330

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 docs/manual/using-buildroot-debugger.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
index d5293beb53..9a8a7dfbaf 100644
--- a/docs/manual/using-buildroot-debugger.txt
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -35,7 +35,7 @@ Then, on the host, you should start the cross gdb using the following
 command line:
 
 ----------------------------
-<buildroot>/output/host/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
+<buildroot>/output/host/bin/<tuple>-gdb -ix <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
 ----------------------------
 
 Of course, +foo+ must be available in the current directory, built
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
