Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F7FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 13:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C352740BCE;
	Tue,  4 Oct 2022 13:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C352740BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZ6oU0amDPew; Tue,  4 Oct 2022 13:31:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC5A940BAD;
	Tue,  4 Oct 2022 13:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC5A940BAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F2101BF841
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47CB660AD2
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47CB660AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Mn8O1fEIHaO for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 13:31:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C145160ABA
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C145160ABA
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 13:31:11 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ofi0p-007mYY-Pw; Tue, 04 Oct 2022 15:31:07 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 11d6683e;
 Tue, 4 Oct 2022 13:30:57 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 16:30:52 +0300
Message-Id: <20221004133057.2003750-1-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920230029.1680134-1-aperez@igalia.com>
References: <20220920230029.1680134-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=itSmZQwVa2YPAPI1soSyiMvo710G05yEHTvFyolPTsM=; b=ITYmIQXy6VhsnUG/9nfAxZRgzX
 Ja4yMkbU7pPnBh25T/NR1HrwkvKwnaFSu7xhnUMOpgtaWRpOVLHsoJ/nhPvwixFMjRt3ca/r5zjWd
 +d60gvaV7CwjIsrJhHfglpoGc2k7ODfkOUQqMy/06Oc+qV45aVWKLLb5XN0Pe0WcyS7zm69dX1e0N
 0F8oM6OUSSGluqkY6bNA8H0VrFw/Akv9f2+ey0T39bS3LAyY5i21nMbgN3lISiOUb1y/PajK8io8S
 /IrkbYT6opKmpzXGf7UyU3G0WJRRcqJqMXf9zUot+pQ8KG/uMLhiokolmxPfy7fDCFKhXkaUW8JEt
 FE7sWPkA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=ITYmIQXy
Subject: [Buildroot] [PATCH 0/5] Update WPE WebKit to 2.36.8, and then 2.38.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series bump wpewebkit to the 2.36.8 release first, which includes
security updates. Then the set of packages needed to run WPE (libwpe,
wpebackend-fdo, cog) are updated to the recommended versions for the
2.38.x series, as documented at:

  https://wpewebkit.org/release/schedule/#compatible-components

The separate patch with the 2.36.8 update is intended to be cherry
picked into stable branches, as it does not need newer tools (compiler,
C++ standard library, CMake, etc.)

=)

Adrian Perez de Castro (5):
  package/wpewebkit: security bump to version 2.36.8
  package/libwpe: bump to version 1.14.0
  package/wpebackend-fdo: bump to version 1.14.0
  package/wpewebkit: bump to version 2.38.0
  package/cog: bump to version 0.16.0

 package/cog/cog.hash                          |   8 +-
 package/cog/cog.mk                            |  37 +-
 package/libwpe/libwpe.hash                    |   8 +-
 package/libwpe/libwpe.mk                      |   2 +-
 package/wpebackend-fdo/wpebackend-fdo.hash    |   8 +-
 package/wpebackend-fdo/wpebackend-fdo.mk      |   2 +-
 ...cpp-fails-to-build-NEON-fast-path-se.patch | 328 ++++++++++++++++++
 package/wpewebkit/wpewebkit.hash              |   8 +-
 package/wpewebkit/wpewebkit.mk                |   8 +-
 9 files changed, 371 insertions(+), 38 deletions(-)
 create mode 100644 package/wpewebkit/0001-FELightningNEON.cpp-fails-to-build-NEON-fast-path-se.patch

---
Changes v1 -> v2:
  - Added a first patch with a 2.36.8 update (suggested by Thomas
    Petazzoni).
  - Added a 2.36.x version of the ARM NEON build fix (suggested by
    Michael Nostoff).
  - Added one additional patch updating cog to 0.16.0, which has been
    released in the interim.

-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
