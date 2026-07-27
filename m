Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF106C53209
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 19:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 564F180E9C;
	Mon, 27 Jul 2026 19:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQW2aKbr-dqf; Mon, 27 Jul 2026 19:26:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 824FD80E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785180397;
	bh=jblpU1zzmxfurxZrKHABImCiy1wQN8X5l3vtla4uov8=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HBkab3jxkA2XSbfqb8SaumziTTrgeFxN9hlFB4gkWBw4naA0rD+Fz4iXdk4pGc7Vi
	 8mrJ+OsrNgAEcvO2++AfgzbOdWAjW6QbyddVgvSdKEOsGwbfG1xz7EWayhys3nBkcO
	 cvAOaCim3fd7pp1VqLK4cewKajjkYhTh1I1tEhjsEEcvjriGcOYtazjozW9A5fbKxs
	 t26YeKNAUxaJJnt+oS1tfeo9WXBGeh22sPAlL2QJCOPInY+M1CvQN8wAJQKLmp3NB6
	 SljBHz5VUUncfb6YugxFMUrCFnimAvBiOeNwqhEgPvDmw8nDA/DHMVVeOchdFXKTLE
	 C1cgC7ufAG1SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824FD80E85;
	Mon, 27 Jul 2026 19:26:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9165F24D
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8381160670
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8zSQnWircFF for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 19:26:35 +0000 (UTC)
X-Greylist: delayed 916 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Jul 2026 19:26:34 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 910FC6061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 910FC6061F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.212.143.9;
 helo=cpanel10.indieserve.net; envelope-from=rpjday@crashcourse.ca;
 receiver=<UNKNOWN> 
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 910FC6061F
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 19:26:34 +0000 (UTC)
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com
 ([174.115.41.146]:36778 helo=sheena)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.4) (envelope-from <rpjday@crashcourse.ca>)
 id 1woQjM-0000000B1N0-0y5w for buildroot@buildroot.org;
 Mon, 27 Jul 2026 15:11:17 -0400
Date: Mon, 27 Jul 2026 15:10:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: buildroot@buildroot.org
Message-ID: <4c1871d0-8cf8-e749-7d65-232c16460a3d@crashcourse.ca>
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
 bh=lmdA7XAZkv3xUXebwcKBXrNR84Zramkp6+903m6lHO8=; b=PJDFvOekvETmISG6s86UZVsnU2
 xhEg8xFo0lWwT3pgplpMxNfS3okO6NrlBfQ11k3KV+0QyuZgTC9Y7u1c43Oh5wGF1X9Y6X5ww537x
 qOxZ8Wt+8mXXDV6uYL+bjF8UuM0jYPXtbEKn/lRwIhm+z19rTxw2nyUeUWk3kPy9gfdqei0AZRCac
 HE10magJVu+kp6y/sBSCgLHzNlMEr6Nf52EM+NtAw4JPMuAIFiDndlWd+Yk/neBgagWpBGa99uXwU
 TP2gDMelsr82nnb5ivIWBYcUde4XEnW0m3uSpu2/XpupUxWNOwfIJ7IUGNm+K31YSqsSJjqyJJQXV
 GEvQUmlA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=crashcourse.ca
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca
 header.a=rsa-sha256 header.s=default header.b=PJDFvOek
Subject: [Buildroot] [PATCH] docs/manual: update intro, make gender-neutral
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


Besides just updating a little terminology, remove the awkward
reference to "his" when referring to developers.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  just testing if this first patch passes examination.

diff --git a/docs/manual/introduction.adoc b/docs/manual/introduction.adoc
index 476aa81edc..1a8cc6d13e 100644
--- a/docs/manual/introduction.adoc
+++ b/docs/manual/introduction.adoc
@@ -16,11 +16,11 @@ filesystem with Buildroot).

 Buildroot is useful mainly for people working with embedded systems.
 Embedded systems often use processors that are not the regular x86
-processors everyone is used to having in his PC. They can be PowerPC
-processors, MIPS processors, ARM processors, etc.
+processors developers are used to having in their PCs, including
+ARM (both 32- and 64-bit), MIPS, PowerPC, RISC-V and more.

 Buildroot supports numerous processors and their variants; it also
-comes with default configurations for several boards available
+comes with default configurations for hundreds of boards available
 off-the-shelf. Besides this, a number of third-party projects are based on,
 or develop their BSP footnote:[BSP: Board Support Package] or
 SDK footnote:[SDK: Software Development Kit] on top of Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
