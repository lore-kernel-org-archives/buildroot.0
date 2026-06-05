Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE172CD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 07:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F9B813D8;
	Fri,  5 Jun 2026 07:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXEzVotOd3da; Fri,  5 Jun 2026 07:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44A0D813C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780642814;
	bh=+kEJzkiKdaTedMDoN87erJCje3MwgcriBfHaxkO+Ho8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SRgdHPO+XHYtZEPy2D97fT8IAmNQn4PltmLPRvE+9ch1vx6C+EWU7Fx1kKnegB4ow
	 FPziXiUa6Kj3JQDjakFz92HmK6xw4OwbZljdeXP8cKF62hjkXAFWjXiAxBexkv4GqN
	 gfid4Dur1VcJFoj6UOQaCjGG97XTNUlP9+c683o++PHmEwqB2qKQ2fAnDAH15Yc7OD
	 iG1rMs9qD7zRWMwAga9Q+pAs6wejoaidzObFu0kFlYcJz+6FdqjuPTWZkfaNOK+Uns
	 4fKnK3zXhwNbXiA2j3mU8TrkIKFYdS0Lt+/vPcvzC3/VZT49JMzjdXXn9JJDuCZLWw
	 8Bst3vn3SPf8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44A0D813C9;
	Fri,  5 Jun 2026 07:00:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EAD026A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 07:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3537D813C9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 07:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k8CJyL1Grp7I for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 07:00:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85B03813B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B03813B5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85B03813B5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 07:00:11 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1871766380; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 07:00:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wVOXG-0000000GPfO-0AV4;
 Fri, 05 Jun 2026 09:00:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 09:00:02 +0200
Message-ID: <20260605070003.3911896-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KQuADEUarcZzK1wN3OHDO6lOEHULdwpUJvpbhwpPn2Zo64j9Vw4vhPGCm0SFtorKeDHbZFCq0g05xLlMc6rZQGhTkOA1Web5h5aoa997jjY4tjzZuNxXRytldulRIYBrBe6yQkjflf4+cB1ktYi7C9IWPnmsOg08CY95vu6N8oImaHVJC02htu59Hy3PT2RRmZsgW7Mc1XWvkO2oqkcum8uaYBcjebSgEtVTCqUmzm6Bd7A84K4VPENL0wDZW3eD63hOvJ793u80K8O7a5OLN89T9rw8gVV6lEObxusLyAFa2aBXC5vEJMuDGnVtSb2dkpO8AgUZK7opsWGyW8C1nQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=OAq1c9TwEyoQHWnUt3ZQH4iZUACFBUspVvS7j8JcW+s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=KQuADEUa
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libusb: security bump to version 1.0.30
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2026-23679: libusb before version 1.0.30 contains a NULL pointer
dereference vulnerability that allows attackers to crash applications by
supplying a malformed USB configuration descriptor where an interface claims
bNumEndpoints greater than zero but is followed by a class-specific
descriptor whose bLength exceeds the remaining buffer size, causing
parse_interface() to return early without allocating the endpoint array.
Attackers can exploit this flaw through libusb_get_active_config_descriptor
or libusb_get_config_descriptor by providing crafted descriptors via
virtualized USB passthrough, file-based descriptor parsing, or network
sources, causing any application iterating over endpoints to dereference a
NULL endpoint pointer and crash.

https://nvd.nist.gov/vuln/detail/CVE-2026-23679

CVE-2026-47104: libusb before version 1.0.30 contains a one-byte
out-of-bounds read vulnerability in parse_iad_array() in descriptor.c that
allows attackers to trigger a denial of service by supplying a malformed USB
descriptor whose bLength equals size minus one, causing the bounds check to
use the original buffer size instead of the remaining size.  Attackers in
virtualized environments with USB passthrough can supply crafted descriptors
through libusb_get_active_interface_association_descriptors or
libusb_get_interface_association_descriptors to read one byte past the end
of the malloc allocation, resulting in a denial of service.

https://nvd.nist.gov/vuln/detail/CVE-2026-47104

For more details, see the announcement:
https://sourceforge.net/p/libusb/mailman/message/59335553/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libusb/libusb.hash | 2 +-
 package/libusb/libusb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 4c76609930..7b4b92e6e9 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85  libusb-1.0.29.tar.bz2
+sha256  fea36f34f9156400209595e300840767ab1a385ede1dc7ee893015aea9c6dbaf  libusb-1.0.30.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 95ce8b17df..1352569f7b 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).29
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).30
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
