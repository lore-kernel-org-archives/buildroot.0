Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB12C53219
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 16:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A108080E8B;
	Wed, 29 Jul 2026 16:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yczyH2grp-ZZ; Wed, 29 Jul 2026 16:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE2D380E2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785342481;
	bh=P9hHgT0An62DBDh0Q4ye7UbMfRrYEuw+AfvumwH2pXQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R1khhx0QKwvAkcFY8zTYBY9LZ8qHEM/tUSaQwNA0N22sJ2fQJ20uAlIeieuY7KerE
	 LQfr6ViSskhmEKfuSjRub1eqCYN5GDOV7oCCkhj29nhqOAMAk+M4BRrGN5guMt49+p
	 Qie8h0OsUyVt02JeMTsCViy1NDtsrGrKiIwjjhdwh2FlaqQ+kfvLV/DkhpcTZJzA8U
	 WZfW2/ANu0Ky4DWiDxh8wS9lC4k2O33j9fb5N8zsWRm1AnwQhmck1786OsGYwjxhfg
	 OzAUShdF57x5sa3QPUlOF2ei86TeJZBDxhk5s4XwQFdlGTyyKCEP4yQhmYYFPIm4BR
	 hTR8UPbvCEaoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE2D380E2B;
	Wed, 29 Jul 2026 16:28:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF8F2E5
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 16:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E4044014E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 16:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAE-vB6QFLKB for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 16:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.212.143.9;
 helo=cpanel10.indieserve.net; envelope-from=rpjday@crashcourse.ca;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C8754009F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C8754009F
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C8754009F
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 16:27:58 +0000 (UTC)
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com
 ([174.115.41.146]:36904 helo=sheena)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.4) (envelope-from <rpjday@crashcourse.ca>)
 id 1wp78N-0000000GP39-29C6 for buildroot@buildroot.org;
 Wed, 29 Jul 2026 12:27:56 -0400
Date: Wed, 29 Jul 2026 12:26:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: buildroot@buildroot.org
Message-ID: <e74945f5-b386-78e7-722b-38add0d4dda1@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aBth0H32gWIeGoW9DsX+byKaRXisQ0CafBRT2XmjMwM=; b=nJfOTOP2KH6NKTKu508uOJG/zT
 lpW+PcFEqbJsew11PnL5OU3DRtVKnjt/+GdNbsFVuKmXcCY+YmZdDCjRAz0+w9y8EibstLo+hiA5B
 qcml90rLPdTV4J+szLvnVoQ09POQvC7jvr5uBgsWvU32vq38EhmoakEy1uO273P8ny9lV3iBJo5/L
 xpcKkfc4jzekDsgI9dJ0zX48oQX4nNfnYAcKr92cYdPF/Fm8pu0RUhaNhPRcKqfZbXqvyviFWucd8
 UfsHRIF22qmpxTNXZLRRL0yaqtZIbKTXxpGWQe6xHmpKoawUUYcIvUITAQVt5/MXt0F1CdtzwtLSO
 NZYQVCbA==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=crashcourse.ca
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca
 header.a=rsa-sha256 header.s=default header.b=nJfOTOP2
Subject: [Buildroot] [PATCH] docs/manual: post-image.sh/post-build.sh should
 use '-', not '_'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Even though it's only documentation, the form of the names of the
post-image.sh and post-build.sh scripts should be consistent with the
names of those scripts used in the code base, using hyphen, not
underscore.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  I can see the chaos that is rootfs_overlay vs rootfs-overlay. Not
going near that.

diff --git a/docs/manual/customize-directory-structure.adoc b/docs/manual/customize-directory-structure.adoc
index b4b5d50e1a..aab225811b 100644
--- a/docs/manual/customize-directory-structure.adoc
+++ b/docs/manual/customize-directory-structure.adoc
@@ -23,8 +23,8 @@ to you.
 |           +-- linux.config
 |           +-- busybox.config
 |           +-- <other configuration files>
-|           +-- post_build.sh
-|           +-- post_image.sh
+|           +-- post-build.sh
+|           +-- post-image.sh
 |           +-- rootfs_overlay/
 |           |   +-- etc/
 |           |   +-- <some files>
@@ -84,7 +84,7 @@ layers 'common' and 'fooboard' is:
 +-- board/
     +-- <company>/
         +-- common/
-        |   +-- post_build.sh
+        |   +-- post-build.sh
         |   +-- rootfs_overlay/
         |   |   +-- ...
         |   +-- patches/
@@ -94,7 +94,7 @@ layers 'common' and 'fooboard' is:
             +-- linux.config
             +-- busybox.config
             +-- <other configuration files>
-            +-- post_build.sh
+            +-- post-build.sh
             +-- rootfs_overlay/
             |   +-- ...
             +-- patches/
diff --git a/docs/manual/customize-quick-guide.adoc b/docs/manual/customize-quick-guide.adoc
index 315027c590..360cbe9622 100644
--- a/docs/manual/customize-quick-guide.adoc
+++ b/docs/manual/customize-quick-guide.adoc
@@ -35,9 +35,9 @@ your project can be skipped.
    Set +BR2_ROOTFS_OVERLAY+
    to +board/<manufacturer>/<boardname>/rootfs-overlay+.
 . Create a post-build script
-   +board/<manufacturer>/<boardname>/post_build.sh+. Set
+   +board/<manufacturer>/<boardname>/post-build.sh+. Set
    +BR2_ROOTFS_POST_BUILD_SCRIPT+ to
-   +board/<manufacturer>/<boardname>/post_build.sh+
+   +board/<manufacturer>/<boardname>/post-build.sh+
 . If additional setuid permissions have to be set or device nodes have
    to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index 4d03d04617..b7fe5813f7 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -52,7 +52,7 @@ Using post-build scripts, you can remove or modify any file in your
   post-build cleanup scripts.
 +
 As shown in xref:customize-dir-structure[], the recommended path for
-  this script is +board/<company>/<boardname>/post_build.sh+.
+  this script is +board/<company>/<boardname>/post-build.sh+.
 +
 The post-build scripts are run with the main Buildroot tree as current
   working directory. The path to the target filesystem is passed as the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
