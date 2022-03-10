Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBB2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 09:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B92238436B;
	Thu, 10 Mar 2022 09:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-5WkiuHjAT8; Thu, 10 Mar 2022 09:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67308434D;
	Thu, 10 Mar 2022 09:56:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3FF21BF3B9
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 09:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2D87416CE
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 09:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xlDX4MDcnOi6 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 09:56:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01E5F416CD
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 09:56:07 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B3ADC000E;
 Thu, 10 Mar 2022 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646906165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TrWqA7bsHQEhuadbp8KcThEmdJk1jDKhqKi3bUsab6E=;
 b=BGeHTqh4PgNMWmrsMEzjkhmC1wNIWiYH/oz4+6lCVOa7nPTEcYFi/E7xc+yL2Uoz74YV/U
 GOxF5WZDxalS5uZ4T6LDUdfJqt7PcCeyEgE1rcDXgmbuBGf/CdRlSts16CSbOqgiSqSfMZ
 qAcaOnxONpvgFWQKQR7r5sFyKVcj7xaVKwoND9Mlc/QaN9ZloFZRw3lftyGcA9bJScKWEJ
 q9vIYuQCRfusUoAdfWAjACtMb3Zhm5G0zydCRBuFwI8dvY7Yex3WWKfST5ydh8dsDc4ZvE
 JauwdTJe9HmRRpAb3nTdjsP3Bws62jyLuYXWP7d2Kn0KkE77A3gqTQSavIpDdQ==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 10:55:58 +0100
Message-Id: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/4] Add odb host variant and fix gcc-11 build
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

Changes v1 -> v2:
	- Fix patch order issue.
	- Add a more extensive commit description for the libodb-boost.
	- Use HOST_*_DEPENDENCIES when appropriate.
	- Use BR2_PACKAGE_LIBODB_BOOST in odb.mk to check for optional
	  dependencies.

Kamel Bouhara (1):
  package/libodb-boost: add host variant

Thomas Petazzoni (3):
  package/odb: backport more upstream commits to fix build with gcc 11.x
  package/libodb: add host variant
  package/odb: add dependency on host-libodb

 package/libodb-boost/libodb-boost.mk          |  2 +
 package/libodb/libodb.mk                      |  2 +
 .../0012-Adjust-to-changes-in-GCC-11.patch    | 50 ++++++++++++++
 ...kup-ambiguity-causing-error-with-GCC.patch | 68 +++++++++++++++++++
 package/odb/odb.mk                            |  8 ++-
 5 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 package/odb/0012-Adjust-to-changes-in-GCC-11.patch
 create mode 100644 package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
