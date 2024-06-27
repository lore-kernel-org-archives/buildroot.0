Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1784FC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 22:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D8941737;
	Thu, 27 Jun 2024 22:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7eBoj8P2pCRb; Thu, 27 Jun 2024 22:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C9114171C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C9114171C;
	Thu, 27 Jun 2024 22:02:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 827521BF97A
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E8BB400BB
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pizq7sxjsjMl for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 22:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8C2E8400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C2E8400B9
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C2E8400B9
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 22:02:27 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sMxCC-008KoX-2T; Fri, 28 Jun 2024 00:02:24 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 7bbba12c;
 Thu, 27 Jun 2024 22:02:23 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 01:02:17 +0300
Message-ID: <20240627220223.6687-1-aperez@igalia.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8TgPeok50ICgHutt4Ner/ixjTepC6EmwFIEv4EEopvg=; b=Wb0tJC3Z8D1GKI0qjJ9SvNmHO+
 bl/dh+Gcxi90NOhHkxDMyBjzhyGdDE5tkz4tHGuty3zKTrV/+D8ghxO33w7rpt1FtznN2ENnrkLDe
 Nnj1y8sh1JOtjoh5MEy914JYJ9WpT8b0/1uEavEJl++cBvMdVD3KL0wnukWIhUFS4GrjLPgZX7iBj
 IqsgVX2+L9kOxVU6SxguPcygA07SMppFugcRNcsfm0OVyuBA8pBGUpoZpunSgvX1MgzNSDBSloYGP
 KWg5XKn8F1ymo5PWsr2X8fcfAplXuxrau7vOtLgdFtkg5/BUsUu5NrC2kIRiWbVfggtMbQ8r9n8eD
 4XDjbVbQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Wb0tJC3Z
Subject: [Buildroot] [PATCH 0/2] Update Sysprof to the latest release
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

As discussed in the IRC channel, here's an update for the sysprof package,
bringing it to a current version. Unfortunately, the patch set to add the
GTK4 package to Buildroot [1] has not yet been merged, so I had to remove
the option to build the GUI for now.

Nevertheless, my main motivation for working on this is being able to take
captures with sysprof-cli of wpewebkit/webkitgtk, where we are currently
adding support to produce tracing markers for sysprof. The captured data
can be analyzed offline in a different machine using the Sysprof GUI, so
personally I do not find important being able to run the GUI tool on the
target hardware.

There are further improvements that could be done, like making a new
sysprof-capture package which only builds the collection support library,
and then have other packages (libsoup3, wpewebkit, etc.) depend on it,
instead of making them rely on bundled copies. This would also allow
having the tracing support in libdex enabled without causing a cyclic
dependency. But I digress -- this would be material for follow-up patches,
for now let's keep it simple.

Cheers,
-Adrian

---
[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=401486

Adrian Perez de Castro (2):
  package/libdex: new package
  package/sysprof: update to version 46.0

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/libdex/Config.in                      | 17 +++++++++
 package/libdex/libdex.hash                    |  5 +++
 package/libdex/libdex.mk                      | 31 ++++++++++++++++
 .../sysprof/0001-define-NT_GNU_BUILD_ID.patch | 22 -----------
 package/sysprof/Config.in                     | 37 ++++++++-----------
 package/sysprof/sysprof.hash                  |  8 ++--
 package/sysprof/sysprof.mk                    | 26 +++++++++----
 9 files changed, 95 insertions(+), 53 deletions(-)
 create mode 100644 package/libdex/Config.in
 create mode 100644 package/libdex/libdex.hash
 create mode 100644 package/libdex/libdex.mk
 delete mode 100644 package/sysprof/0001-define-NT_GNU_BUILD_ID.patch

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
