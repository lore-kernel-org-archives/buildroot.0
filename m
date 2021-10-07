Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1729BC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6323061212
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6323061212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26896400F7;
	Thu,  7 Oct 2021 21:00:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74nkFvfeDQi5; Thu,  7 Oct 2021 21:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30C33400FC;
	Thu,  7 Oct 2021 21:00:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 071AE1BF2F8
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA256400FC
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjTHmsmUj9BQ for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 21:00:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1BAD400F7
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 21:00:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t2so22976441wrb.8
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 14:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QwdJkmDgYwLVJc46tnYUlf3gdK7Gb9iC+xPTiOWtoc=;
 b=cyE4GPtWwQFW84tQBCMxV4xC+c0C1Q+RK3ii6ORFiBnXtjldw19jLtoExBjDaRQBjD
 /ifuWggJ3xIwg4iS7wDPmPB+hqem81OWLufvSoP4W257uq4/V6SypIMFydk5eNGtg63s
 MDrdHqMsZJmG410/ZS53WSO8Mzl1AzvC3AtNfnCr0f95V3n3r+NoaAbwtffI4K79cZz0
 pwViF2M/URVfp1B+xziupD0CrgB/tiUkcItOMgy5qysrpw8evrv3Urymp1BSH6zBoJcI
 gyDzQPUv8spdSIEZesVaiXDZKyTCMXzzqdnRclBxm/FBGeCyRsG+OP7uKGVUhN3uDcKA
 OJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QwdJkmDgYwLVJc46tnYUlf3gdK7Gb9iC+xPTiOWtoc=;
 b=bmVXVCJ1vd0QOleK9V8/0metxkXFB8pTooKzBNvcQ+PRKGMZq+uAkCxS22qHV6swo9
 yFfRa5N1jtiLZE7krzxg+1Y27365CamcN3yhJUT8xZWMkNSLFKMJOmE/MYUuScf7pUE7
 mkrGegNkfhlwQRlFHjpoMVB70HS7uqxfoaR3ju2mr1i7TXE0YFFzxmTkH8UeLBeDKHp1
 N4d3kX2h47FB6q7jS+Pf4ZvjRN7kIau987VX01TEb62QBOpQkD7uQYODB3o/U7dkvYR4
 HdGgVCOPkbDpAzNC2nYpfPfcXTpcHJrfLICYuxOExkcL5yseo1pfy4apH5GRXLwoz2lz
 cz/Q==
X-Gm-Message-State: AOAM5336ehDj2tre7/HA581Wucl/wLfh6iydkrRstOXsSc0VT6oj2I7T
 vdNB5cXTRXXTxcG8vegTPszWUCMFmGg=
X-Google-Smtp-Source: ABdhPJwq7lWAxk9xutH0uXhXkpbmwsPd8mIiytsPfyAjRWdenQdqW+B3YoPMPP0BLp34JqjdT5rVLA==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr8197871wrp.172.1633640452756; 
 Thu, 07 Oct 2021 14:00:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id s14sm399569wro.76.2021.10.07.14.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 14:00:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 22:59:53 +0200
Message-Id: <20211007205953.3744949-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to version
 8.8p1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-41617: sshd in OpenSSH 6.2 through 8.x before 8.8, when
certain non-default configurations are used, allows privilege escalation
because supplemental groups are not initialized as expected. Helper
programs for AuthorizedKeysCommand and AuthorizedPrincipalsCommand may
run with privileges associated with group memberships of the sshd
process, if the configuration specifies running the command as a
different user.

https://www.openssh.com/txt/release-8.8
https://www.openssh.com/txt/release-8.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 0dcd725de5..aab3dba09c 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.6 (base64 encoded)
-sha256  c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae  openssh-8.6p1.tar.gz
+# From https://www.openssh.com/txt/release-8.8 (base64 encoded)
+sha256  4590890ea9bb9ace4f71ae331785a3a5823232435161960ed5fc86588f331fe9  openssh-8.8p1.tar.gz
 # Locally calculated
 sha256  432abf7480fb31473a6706627212913fc70032e3fb71b90fecb28ae26a2d741d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 61b2c97cf4..75c4a0128b 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 8.6
+OPENSSH_VERSION_MAJOR = 8.8
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
