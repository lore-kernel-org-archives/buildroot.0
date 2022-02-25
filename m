Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FCDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 11:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FCDB83265;
	Fri, 25 Feb 2022 11:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vW72VeRXVLtX; Fri, 25 Feb 2022 11:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFFFA83145;
	Fri, 25 Feb 2022 11:34:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56A611BF34C
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 11:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52ED24089F
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 11:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecU8sQMFU47z for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 11:34:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 430A4404B6
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 11:34:06 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1950F200007;
 Fri, 25 Feb 2022 11:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645788844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=I3MssIAQTe32Ez8wPt2JO7quWgTM17rwJ4u/BDLnwRc=;
 b=pg/NtIjqcFiZ35fx+IZzEgBkDmk7ivAyXuO8tYfzo8ut6MlOd62KJPROk3Vr+tQgW+1bbX
 IBTqDe3DdLLZJn9xzct06msVuQu8Qmz8ZauC2Qt6F4qcymt6QKliH0QZUbYxmIE4UH+mBd
 t231oqRG8sO2NQfeaRLmuEPlwcBGLywMDqFQ2Dy/IUn3Vgtz3VyKMEIFXvy2PCLevfHZJA
 GFCaE+wWs5RbGCgzavgOJzZDi1lVRxR5fxPJI1zUCsC9GWHv7tD9K7BBz0Ov7F1hi1AAh7
 POmqAabX8zUs8BwHjCpza7yI9AgZYCqIHH67rd2O4VsgpWk3toBeeExg2KQKJw==
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 12:33:56 +0100
Message-Id: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] Add odb host variant and fix gcc-11 build
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
From: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Reply-To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Here is a short patch series that fix odb build issue with gcc-11
and add a host variant of the libodb package required by the host-odb
compiler. The host-libodb-boost variant is only required when boost
package is enabled.

Kamel Bouhara (1):
  package/libodb-boost: add host variant

Thomas Petazzoni (3):
  package/odb: backport more upstream commits to fix build with gcc 11.x
  package/odb: add dependency on host-libodb
  package/libodb: add host variant

 package/libodb-boost/libodb-boost.mk          |  5 +-
 package/libodb/libodb.mk                      |  2 +
 .../0012-Adjust-to-changes-in-GCC-11.patch    | 50 ++++++++++++++
 ...kup-ambiguity-causing-error-with-GCC.patch | 68 +++++++++++++++++++
 package/odb/odb.mk                            |  8 ++-
 5 files changed, 131 insertions(+), 2 deletions(-)
 create mode 100644 package/odb/0012-Adjust-to-changes-in-GCC-11.patch
 create mode 100644 package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch

--
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
