Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77CEE8B36C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD215608FD;
	Tue,  3 Feb 2026 21:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuhjHItnwQdt; Tue,  3 Feb 2026 21:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A4C260901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770155684;
	bh=qbovZw4p5OKXiPCXoO5WWVX0jRKwjStg4fXqiiFE7Qs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nBIL3Ytz7uPyK17zqVGpNME1sneA9W3ueVzSOOgjCyiuMYyPMy3ly1Lt1oJ5KbOTq
	 qUwKe1r2T+pBjlQCPsdK8mVzP1B+3vznQQNtkV+GgIVUEMykoR9Df9X5EpAZYTEZUk
	 8j5ZzETjh+yzhte+QdmsbtbDrkK3utI4xhkGjzl9w6sL6wqJqI1MxdeGOMLirxqdyw
	 0A5bcT9fPtVO9bKbzNxB7f91hdxdQAbyvrAs9nAciHzluGBqmz8rfrHOJiKFuSMvz+
	 7iCYFCVoLtftIxvIsMvCIG3s37/5ivBtXDdbXZ5rPCf+wzM8lxTFFmXrMAMDb7Z2Bk
	 34kDHI3ripWyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A4C260901;
	Tue,  3 Feb 2026 21:54:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 851EF13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64E1E40471
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9UvMZAzI97x for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B18440185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B18440185
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B18440185
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:54:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1F70F19F5A7;
 Tue,  3 Feb 2026 22:54:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Feb 2026 22:54:34 +0100
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>,
 Brandon Maier <Brandon.Maier@collins.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Tue,  3 Feb 2026 22:54:30 +0100
Message-ID: <3bf503a96d4ef1a70f0f95b6c6872129143d5fa1.1770155657.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770155657.git.yann.morin.1998@free.fr>
References: <cover.1770155657.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770155680;
 bh=AGO2N5qOoJHBQiQjpSMgwmVh/yiiyAJTfxfGFDl75oE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tE1EE/McShDzGkSQaud8buYdJpPTbQX4V/cMnW3VJEpgn3AHn3v18ooUQiGpDH/s5
 D+1Yv/iqbOczPqq4XMRVbfspQU72bdnoNjgqU8Fw4qMKBx0qLXVEhEftOvCshS3nYR
 pDv6xbwFKKuuNcpC4QSQZtxkB0pWPhwk/FhpLB5PlxBSX/doTxT7yHGjlKvlhyb7vG
 /Uo3jyW1TGVpb5fZSCWG7+FPTPgEYcZTBYJT9pdt6/m3uboTBb7XV+2NfcbLgKbMIZ
 LFIFbGbdCYs6jO6KbkHXSVFgt0f9qdpLApYYFjzVoqRUwHxtpQJUrJv4IjXoO9DJsX
 8rrTDmwtEkRuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tE1EE/Mc
Subject: [Buildroot] [PATCH 3/3 v4] docs/manual: use space-separated list
 for BR2_EXTERNAL
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

Specifying a list of br2-external trees is poorly documented, and the
only example uses a colon to separate the br2-external paths.

Adding the support for colon-separated list is the biggest mistake that
was made when introducing support for multiple br2-external [0]. Indeed,
both space and colon can be used to separate entries in the list, and it
is also possible to mix the two. However, internally, the list is stored
as a space-separated list, and all the code will split on spaces.

Besides, all other lists in Buildroot are a space-separated:
    BR2_ROOTFS_DEVICE_TABLE
    BR2_ROOTFS_STATIC_DEVICE_TABLE
    BR2_TARGET_TZ_ZONELIST
    BR2_ROOTFS_USERS_TABLES
    BR2_ROOTFS_OVERLAY
    BR2_ROOTFS_PRE_BUILD_SCRIPT
    BR2_ROOTFS_POST_BUILD_SCRIPT
    BR2_ROOTFS_POST_FAKEROOT_SCRIPT
    BR2_ROOTFS_POST_IMAGE_SCRIPT
    ...

So, using colons is odd.

The fact that BR2_EXTERNAL is pqssed on the command line rather than
being a Kconfig item is not a reason enough to justify that it be
colon-separated.

Change the documentation to only mention using a space-separated list.

Of course, for backward compatibility, we keep the code as-is to accept
a colon-separated list, but we just do not advertise it.

Note that keeping the split on colons means that colons are not accepted
in pathnames of br2-external trees; in practice, this is not a new
restriction, or one that could lift as usign colons in Makefiles are
problematic anyway.

[0] in 20cd49738781 core: add support for multiple br2-external trees

Reported-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reported-by: Brandon Maier <Brandon.Maier@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Note: support/scripts/br2-external has shellcheck issues; this commit
does not try to address those on purpose, as it only adds a comment.

---
Changes v3 -> v4:
  - add an extract of all other list variables from [1]
  - sumarise and include Arnout's comments from [2]
  - fix typo

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240904205354.504964-1-yann.morin.1998@free.fr/#3375145
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20240904205354.504964-1-yann.morin.1998@free.fr/#3375416

Changes v2 -> v3:
  - add comment in support/scripts/br2-external  (Fiona)

Changes v1 -> v2:
  - fix typoes
---
 docs/manual/customize-outside-br.adoc | 5 +++--
 support/scripts/br2-external          | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 78065489d4..8a76f3a998 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -58,10 +58,11 @@ We can switch to another br2-external tree at any time:
 buildroot/ $ make BR2_EXTERNAL=/where/we/have/bar xconfig
 ----
 
-We can also use multiple br2-external trees:
+We can also use multiple br2-external trees, by specifying a space-separated
+list of paths to use:
 
 ----
-buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
+buildroot/ $ make BR2_EXTERNAL="/path/to/foo /where/we/have/bar" menuconfig
 ----
 
 Or disable the usage of any br2-external tree:
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 474feaded7..641f8e18ae 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -34,6 +34,9 @@ main() {
         error "Cannot create output directory '%s'\n" "${outputdir}"
     fi
 
+    # Historically, BR2_EXTERNAL could also be colon-separated, so for
+    # backward compatibility, keep splitting on colons (in addition to
+    # spaces).
     # shellcheck disable=SC2068  # We do want to split on spaces
     do_validate "${outputdir}" ${@//:/ }
     do_mk "${outputdir}"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
