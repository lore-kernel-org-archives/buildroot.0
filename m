Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622C5C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 14:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086B9409D7;
	Mon, 19 May 2025 14:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1C5aSnBJtMd; Mon, 19 May 2025 14:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C5240C89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23C5240C89;
	Mon, 19 May 2025 14:21:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C866D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DDD94026A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id no-369aZYZcV for <buildroot@buildroot.org>;
 Mon, 19 May 2025 14:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE9CD400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE9CD400D3
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE9CD400D3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:20:58 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so341143f8f.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747664456; x=1748269256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8KkAuCn2ks5bxn41JePdbtkHuv4TsX5BbT8c5ODwedY=;
 b=EeqkmSvWWny7BQY6C4xa0ttQqC4TrSnUKY4dz9mrseU8ACvz/yvESq27iCn9lm/f46
 SJXsNVfLg5CaMwiN5n0mpgWDRdfdN7aC/A4o/J+ai9EtfP3DIpWsm6twxvEvn/m+JZmL
 ZTaSF8jHVfPC5599ysURSQs/AH9pLIoBRiYYPfWfQGYe9IcPViOnnKx7qbjBp91LZgIo
 Zz/q7m7XHOEDo2K/OcUhMsg6AZuEcr2+7U89mjxK0hx7pcy8jmFzvB3eQVUb6Zul/cOv
 2rC6kgtg8m2nsAyDejBAai4ry5M2SYAvLgnIZca9vBQqe5ZAksEVg+H96m4fGqMGHXnX
 1Q4Q==
X-Gm-Message-State: AOJu0YxZwfmqBGAgFApHlgk4X+uCeQxVEZja7Z8zNUpyY2DOuPShZ6f5
 +W6sjBw79USB3K/Pqm5zpvIALjLBsvLLq2kqawtqRW1yW9XfK7QqwK4wpy7l7jiPp7S2beRFHGw
 //g9dEqs=
X-Gm-Gg: ASbGnct9y0dAzis5PBi9hNdvORPfswdgXFLmtnR+ANDVyWNAS+68v/GIedlL++aBFuV
 OHc6fuYVnjOMfEZSlVdGkc2W3Zw3a/JkdYW/wsx3znmuBQqr0saCn8VY2jgHSYjDLXM/fkuucYw
 iKquDlXXZBCHEYz5ql8V+WXwPMgzYEeg5w7Nd/9mjaUJqWIVIV8gdotHCHo7vmHfvOElcRUJNSh
 vqtTkxH17JpmLRLebm/b8cBGlqPtCp1rV7Mkiy15GVz/lkerf/TyuzE/H6RsCNjlLr8xAHsA3EI
 nYU4VJQQaeZFBtUgat0TiyRcrXqAtlO6W5Fv9zH27Rr86gW0+kof3B45rQ1F3XWznSN9Mq3zrms
 vctpEkKk=
X-Google-Smtp-Source: AGHT+IHSNj1I2A9VjJylxuO+3WuwC0PNq28IN6PlJRuNFsEMPfQXyYeBukba/iKh7j0wt/GRVMxWBg==
X-Received: by 2002:a05:6000:144b:b0:3a3:697f:a71 with SMTP id
 ffacd0b85a97d-3a3697f0cd4mr6119086f8f.34.1747664456420; 
 Mon, 19 May 2025 07:20:56 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca62204sm12813375f8f.42.2025.05.19.07.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:20:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 16:20:45 +0200
Message-ID: <20250519142045.4025181-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747664456; x=1748269256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8KkAuCn2ks5bxn41JePdbtkHuv4TsX5BbT8c5ODwedY=;
 b=KKp+j4sZEFHcL7vJBXiy5vEo+enom+sxGEExABlVfLUxeKrdQzzssnmm4RxFJ1g19e
 G7bhxHxjd5bmLHplDCHvx1w9huckBSqx5RelOxp+SBPyGYga2gjwZf581r8hKkhvxZ2G
 CHOG9w093L0jp733llC1o2vl6VH+JhlJoEiVW/jda4XaSjxGm/Jr/anPSMxZAxQjHdQD
 gTv0XRsKhEovxdtJMo8Y0s16sFXSmSmjzLcO8Kv5nfSAc6Ipv2o2dFv57N0u3XlnfX5q
 hDkYDP99XJsCK87DG3dB7KSV6v+J4n3CNJH2CWwpLj4v6RGrhzLTbHPTsA1MEQrRqfxR
 nhmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KKp+j4sZ
Subject: [Buildroot] [PATCH] package/bootstrap: apply security patch for
 CVE-2024-6531
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVE:
- CVE-2024-6531: A vulnerability has been identified in Bootstrap
                 that exposes users to Cross-Site Scripting (XSS) attacks.
                 The issue is present in the carousel component,
                 where the data-slide and data-slide-to attributes
                 can be exploited through the href attribute of an <a>
                 tag due to inadequate sanitization.
                 This vulnerability could potentially enable attackers to
                 execute arbitrary JavaScript within the victim's browser.

No "official" patch has been released upstream, as Bootstrap 4 is EOL
since 2023-01-01, and security updates are shipped only with commercial
support. So we use Debian's unofficial patch instead.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/bootstrap/0001-CVE-2024-6531.patch | 49 ++++++++++++++++++++++
 package/bootstrap/bootstrap.mk             |  3 ++
 2 files changed, 52 insertions(+)
 create mode 100644 package/bootstrap/0001-CVE-2024-6531.patch

diff --git a/package/bootstrap/0001-CVE-2024-6531.patch b/package/bootstrap/0001-CVE-2024-6531.patch
new file mode 100644
index 0000000000..1e172d444d
--- /dev/null
+++ b/package/bootstrap/0001-CVE-2024-6531.patch
@@ -0,0 +1,49 @@
+From: Bastien_Roucaries <rouca@debian.org>
+Date: Sun, 13 Apr 2025 12:33:22 +0200
+Subject: CVE-2024-6531
+
+An anchor element (<a>), when used for carousel navigation with a data-slide attribute,
+can contain an href attribute value that is not subject to proper content sanitization.
+Improper extraction of the intended target carousel's #id from the href attribute
+can lead to use cases where the click event's preventDefault()
+is not applied and the href is evaluated and executed.
+As a result, restrictions are not applied to the data that is evaluated, which
+can lead to potential XSS vulnerabilities.
+
+return false in case of error that will avoid the XSS attack, and avoid further
+treatment by the handler.
+
+bug: https://www.herodevs.com/vulnerability-directory/cve-2024-6531
+bug-debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1084059
+bug-debian-security: https://security-tracker.debian.org/tracker/CVE-2024-6531
+
+Upstream: https://salsa.debian.org/js-team/twitter-bootstrap4/-/blob/1925007041cf88bde02af23c9507ad9e7426e362/debian/patches/0003-CVE-2024-6531.patch
+
+CVE: CVE-2024-6531
+
+[Titouan: stripped away UTF-8 characters from the patch body and author name]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ js/src/carousel.js | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/js/src/carousel.js b/js/src/carousel.js
+index 18732d0..9447da6 100644
+--- a/js/src/carousel.js
++++ b/js/src/carousel.js
+@@ -543,13 +543,13 @@ class Carousel {
+     const selector = Util.getSelectorFromElement(this)
+ 
+     if (!selector) {
+-      return
++      return false
+     }
+ 
+     const target = $(selector)[0]
+ 
+     if (!target || !$(target).hasClass(CLASS_NAME_CAROUSEL)) {
+-      return
++      return false
+     }
+ 
+     const config = {
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index eba1244ad3..e8cf3bda5a 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -11,6 +11,9 @@ BOOTSTRAP_LICENSE = MIT
 BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
 BOOTSTRAP_CPE_ID_VENDOR = getbootstrap
 
+# 0001-CVE-2024-6531.patch
+BOOTSTRAP_IGNORE_CVES += CVE-2024-6531
+
 define BOOTSTRAP_EXTRACT_CMDS
 	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
 	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
