Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF0AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:22:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC7E60D07
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDC7E60D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA07C60B0E;
	Thu,  5 Aug 2021 19:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JyB4ogcE7-C2; Thu,  5 Aug 2021 19:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C223D60AFE;
	Thu,  5 Aug 2021 19:22:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F86B1C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8BA440478
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kuCwSUNINrsD for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A3A340578
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D32018B8B7; Thu,  5 Aug 2021 19:21:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:06:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38f9f5bb303acdaedb96c9ecaa5324a9674073c5
X-Git-Newrev: 96865f02d4d770da40d33ebc6421e15721bf3f94
X-Patchwork-Hint: ignore
Message-Id: <20210805192129.D32018B8B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qpdf: fix CVE-2021-36978
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=96865f02d4d770da40d33ebc6421e15721bf3f94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

QPDF 9.x through 9.1.1 and 10.x through 10.0.4 has a heap-based buffer
overflow in Pl_ASCII85Decoder::write (called from Pl_AES_PDF::flush and
Pl_AES_PDF::finish) when a certain downstream write fails.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ines-to-be-safe-if-downstream-write-fails.patch | 86 ++++++++++++++++++++++
 package/qpdf/qpdf.mk                               |  3 +
 2 files changed, 89 insertions(+)

diff --git a/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch b/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
new file mode 100644
index 0000000000..70017350f2
--- /dev/null
+++ b/package/qpdf/0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
@@ -0,0 +1,86 @@
+From dc92574c10f3e2516ec6445b88c5d584f40df4e5 Mon Sep 17 00:00:00 2001
+From: Jay Berkenbilt <ejb@ql.org>
+Date: Mon, 4 Jan 2021 11:55:28 -0500
+Subject: [PATCH] Fix some pipelines to be safe if downstream write fails (fuzz
+ issue 28262)
+
+[Retrieved (and updated to remove updates on ChangeLog and fuzz) from:
+https://github.com/qpdf/qpdf/commit/dc92574c10f3e2516ec6445b88c5d584f40df4e5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog                     |   6 ++++++
+ fuzz/qpdf_extra/28262.fuzz    | Bin 0 -> 40395 bytes
+ libqpdf/Pl_AES_PDF.cc         |   2 +-
+ libqpdf/Pl_ASCII85Decoder.cc  |   7 +++++--
+ libqpdf/Pl_ASCIIHexDecoder.cc |   6 ++++--
+ libqpdf/Pl_Count.cc           |   2 +-
+ 6 files changed, 17 insertions(+), 6 deletions(-)
+ create mode 100644 fuzz/qpdf_extra/28262.fuzz
+
+diff --git a/libqpdf/Pl_AES_PDF.cc b/libqpdf/Pl_AES_PDF.cc
+index 18cf3a4d..2865f804 100644
+--- a/libqpdf/Pl_AES_PDF.cc
++++ b/libqpdf/Pl_AES_PDF.cc
+@@ -238,6 +238,6 @@ Pl_AES_PDF::flush(bool strip_padding)
+ 	    }
+ 	}
+     }
+-    getNext()->write(this->outbuf, bytes);
+     this->offset = 0;
++    getNext()->write(this->outbuf, bytes);
+ }
+diff --git a/libqpdf/Pl_ASCII85Decoder.cc b/libqpdf/Pl_ASCII85Decoder.cc
+index b8df3e87..9d9f6704 100644
+--- a/libqpdf/Pl_ASCII85Decoder.cc
++++ b/libqpdf/Pl_ASCII85Decoder.cc
+@@ -119,10 +119,13 @@ Pl_ASCII85Decoder::flush()
+ 
+     QTC::TC("libtests", "Pl_ASCII85Decoder partial flush",
+ 	    (this->pos == 5) ? 0 : 1);
+-    getNext()->write(outbuf, this->pos - 1);
+-
++    // Reset before calling getNext()->write in case that throws an
++    // exception.
++    auto t = this->pos - 1;
+     this->pos = 0;
+     memset(this->inbuf, 117, 5);
++
++    getNext()->write(outbuf, t);
+ }
+ 
+ void
+diff --git a/libqpdf/Pl_ASCIIHexDecoder.cc b/libqpdf/Pl_ASCIIHexDecoder.cc
+index f20a9769..7845268e 100644
+--- a/libqpdf/Pl_ASCIIHexDecoder.cc
++++ b/libqpdf/Pl_ASCIIHexDecoder.cc
+@@ -97,12 +97,14 @@ Pl_ASCIIHexDecoder::flush()
+ 
+     QTC::TC("libtests", "Pl_ASCIIHexDecoder partial flush",
+ 	    (this->pos == 2) ? 0 : 1);
+-    getNext()->write(&ch, 1);
+-
++    // Reset before calling getNext()->write in case that throws an
++    // exception.
+     this->pos = 0;
+     this->inbuf[0] = '0';
+     this->inbuf[1] = '0';
+     this->inbuf[2] = '\0';
++
++    getNext()->write(&ch, 1);
+ }
+ 
+ void
+diff --git a/libqpdf/Pl_Count.cc b/libqpdf/Pl_Count.cc
+index 8077092a..c35619b8 100644
+--- a/libqpdf/Pl_Count.cc
++++ b/libqpdf/Pl_Count.cc
+@@ -27,8 +27,8 @@ Pl_Count::write(unsigned char* buf, size_t len)
+     if (len)
+     {
+ 	this->m->count += QIntC::to_offset(len);
+-	getNext()->write(buf, len);
+ 	this->m->last_char = buf[len - 1];
++	getNext()->write(buf, len);
+     }
+ }
+ 
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index ec3d3f89a3..c96bf6bf2e 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -14,6 +14,9 @@ QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
 QPDF_CONF_OPTS = --with-random=/dev/urandom
 
+# 0002-Fix-some-pipelines-to-be-safe-if-downstream-write-fails.patch
+QPDF_IGNORE_CVES += CVE-2021-36978
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 QPDF_CONF_OPTS += --enable-crypto-gnutls
 QPDF_DEPENDENCIES += gnutls
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
