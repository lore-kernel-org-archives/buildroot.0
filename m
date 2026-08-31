Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9652DC61DD3
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 19:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A91D60699;
	Mon, 31 Aug 2026 19:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjq5ln31a5FO; Mon, 31 Aug 2026 19:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788205767;
	bh=MsKdkDml7fAOSfbKcw1QBP8oL7krzCUWEM+hHvkQDNE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=X9lwkBbgK5/Ks15pcSTQT3eydxjwWtYy/M6PplZcJVJ9RF3ZLJxbc7K8Tv11Zo14O
	 0uirRdi9IIeBVbzt/9a0vzxs6PuzBXtzZzdxwh1Cjea3naI33r02DNeZ7dg2cxJ8JR
	 WmJokaXwMtjz/B8JSRNS9XK+QM4ZO65xrQ1fcIWJqOzduroMec0+tkES61qOgKbW0y
	 jIj/Y9IuOLOO98gjYKSJlz0Dc6M0arKWZNwS1kMnmk7X9iFy9Fjsv6S1T4L8xbKZ11
	 wPK6JKqRfI1S8QysEX9UP61Nostp13pDLmirUBfkJc1V0qf3kUCPkHWsNa+4GizSZR
	 YcHaOUqF6q4kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C3E6066B;
	Mon, 31 Aug 2026 19:49:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 326F12FC
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C06F400C1
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNkZORUC6gzp for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 19:49:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8308400AB
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 19:49:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 34C356012F;
 Mon, 31 Aug 2026 21:49:19 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad.86@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 31 Aug 2026 21:49:10 +0200
Message-ID: <20260831194910.260600-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/perl: apply perl-cross patch only
 on target perl
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] (package/perl: fix build issue with musl)
introduced a patch that is meant to be applied on top of perl-cross,
which is extracted on top of perl only in the target variant.

Since the patch was introduced as a normal package patch, the Buildroot
infra is trying to always apply it, even for the host package variant.
Since perl-cross is not extracted for the host variant, some patched
files are missing. In that case, the host-perl is failing with error:

    >>> host-perl 5.42.3 Patching
    Applying 0001-configure-keep-_GNU_SOURCE-in-build-flags.patch using patch:
    can't find file to patch at input line 46

This commit fixes the issue by moving the package patch in a dedicated
"perl-cross" subdirectory, to make sure it will no longer be applied by
the infra. We apply the patch only for the target package variant using
a _POST_PATCH_HOOKS hook.

Fixes:
- [1]
- https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948610 (TestPerlXMLLibXML)
- ...and few other tests requiring host-perl

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d950fff290b1318fd72c7f09fedbd1b87b96155f

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-configure-keep-_GNU_SOURCE-in-build-flags.patch | 0
 package/perl/perl.mk                                     | 9 +++++++++
 2 files changed, 9 insertions(+)
 rename package/perl/{ => perl-cross}/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch (100%)

diff --git a/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch b/package/perl/perl-cross/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
similarity index 100%
rename from package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
rename to package/perl/perl-cross/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 912445ccc8..43820cfcc3 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -32,6 +32,15 @@ define PERL_CROSS_EXTRACT
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
+# We need to patch perl-cross, but perl-cross is extracted over the
+# target perl sources only (and not the host variant). So we apply the
+# patch only for the target case using a post patch hook.
+define PERL_CROSS_PATCH
+	$(APPLY_PATCHES) $(@D) $(PERL_PKGDIR)/perl-cross \
+		0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
+endef
+PERL_POST_PATCH_HOOKS += PERL_CROSS_PATCH
+
 # Even though perl is not an autotools-package, it uses config.sub and
 # config.guess. Up-to-date versions of these files may be needed to build perl
 # on newer host architectures, so we borrow the hook which updates them from the
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
