Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2546DCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A03F360887;
	Tue, 13 Oct 2026 21:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqAiu1Y2tp-m; Tue, 13 Oct 2026 21:20:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8476860885
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791926447;
	b=snV9w5DN2jRXuDitPqhkkMEZoCuoTjmqRo7K7gGZAxxIo8ydR0c6yuv/wMcIIwH2Ktfm
	 wTvbuihLLV958YIN9oGQ+r3uGbZPFxjCYPOAPkFf4B+S2VlmDSvacHQLDRCC0Bacn8tao
	 6KTgB91OKsWJHCxk6KOLqSHzSn22bU3MF0rr8vDos3pKNd45SUmcABWdeRnVi0VToS0kM
	 N/l7pkoXI22xOV781zFbeL7qdCwfWvD1kCgYe0D5Qq9Ukjw4Y56tzFUcPaqSPQi1T1fTl
	 VH7dbKiyBllHfjW2Fc6PaC7LY3Yy8zkeYQ6RiRxt98Dn/i5lWAHmOiENPNhkSS8M/Kg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791926447;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UvVRO3Gx0RCD7pu+tiKJR3l5+THQzpZ5sTZSoui7v+g=;
	b=dvX6C11mGhu2lILTaP4kLFnb7N6J54v37Jll5nlt4OGC3dsMkEhcIDUmZJRdJswLyOwO
	 PxBBmYWx1/mESNCHBjSBq8YNU0yGS5VYZiQHH3VWO+XkXIl14U++mtCCYjbN6Uu8DgfiG
	 7xfpimV+xPdNZzoa/pnPtcD3TpqfssHeliCRfl+h+KG5C5F5gAfPa3WaLRESY48f9Xsbv
	 Z46k4ljIBssAV63bFy7vymvRs1OTY/txR5suahJdd8BwsDK3gt2mtEKyOYOwKtf57yQPt
	 7cYu9XF5HProkB69l5PDf0NHuK9RwbOknMEKB23LgUu2RAXj1uRuIbh2Xwpkl9kQLyw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791926447;
	bh=UvVRO3Gx0RCD7pu+tiKJR3l5+THQzpZ5sTZSoui7v+g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DfN9UdUk+NqgwtqoxiKx1PmXfTV+s0D0eQYQy4DtihLJ5zZvm/kqPa9ZChqRlrxV6
	 bgumS5B/Zj7fdfCQEDp+1l8knUkV1bjE27Uxy1aLRgPRy/LiIThxvsSonaJF4tmqeQ
	 hli0r7nTRICE7EDKdTcjtMPMVXFS1ZK/K4CFtnNtPS1cAYe9djJC4xgg26RBuVLON9
	 R9DMBWdGubDSHATanqXNgR+dznj/0M83DyMyCMaAY6sZ8XvirbSCcNgQ48xAefZcj7
	 vTRKEC1InWQ/bUPDQMgFH8ixRlSSNhxEu13+Z7AZnGQD9yFZv+C7IZhb2qL3dlOTLd
	 JcFBnBojW4TZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8476860885;
	Tue, 13 Oct 2026 21:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DD602AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1408F80CA2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUOXHaNponOW for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:20:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2022E80870
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791926443;
 b=V6mtUGjsfgZUYUTsZJyg9nSG6ela5hoBEwHk5/NA5qh+xUfeT+XFC/2CF21z6hMQfICI
 dB+rLhUxSnJn5Qn1i2DiOBv8yfFLD/k8oE0zr+xoyWY53+2pjRH1X06W8VyowxKYKCYHw
 LZ35/d/XMetoe43uUOYvW3ox/vCj/pIrny5XmlMZBWu8ErxKINo4U2RxHAKiKwWVSgXW2
 XCgC4SfeMTsCx2LXdZb115VQYjTeU3/fIrJ4kG+MkwFx559DhnUS1jbFXJXzUGQASTUMA
 ua5Xmp2T367QLgkFVBDuw9NLdANEEaIKC648tFqntrjCsRUq7HTDDCrVOJ99FK4Gt0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791926443;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=80HMlNHODhWy0K4Cyri+SdABwjiGO6UZRVDCfoHscGA=;
 b=e6xIi/mMt71gSu6EeSJ/4+Kb8HThkJpJl+jEBZfuJ9oJaYB36Z/0FMuh7sEck7JkUA9N
 GaWrDTY+RZsX/qWd2AIocmKUaDIRPTEIHKMH/r4k6b7LmDMWr4d00WPPKCTa5xGnLDCah
 RR7V8w3r1bMatRA3KotdwcIM167zBoZxfRa6x2maJxqylnRgJ7PbUL8B8NGLXkjsUuu35
 SyOTv3+FrQ/vaiVqzBQif+IKZlQkVX0rW7+HUoRQZGQDCKce7vEyvNgjN3RYb0f7Vt3Vb
 zr3fjCMSSC0x9QiKtho698TAjDq7qx7MrWgmT8Z8SY1IfSpo095+fFz3v8gEUMX0zLA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nxMNAFcE; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=nxMNAFcE
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2022E80870
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:42 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-504ae5941faso1777363b6e.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791926441; x=1792531241; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=80HMlNHODhWy0K4Cyri+SdABwjiGO6UZRVDCfoHscGA=;
 b=nxMNAFcErNYHBheb/cTz9+yyZO1fdeBAPMn+cMITlxb1FNmsA6lOBShbYviTeCTkR0
 3vMZTcs1uXjAWGr0nfGddZ+6FTH777Y9PhAgRmEBxYKSSDOuoU/3BXHHrNk0CfWF/OGk
 gdNM9eMJtJJfYfM3zo8/VBY1CSZJv4bXpmTE8AtKpom/hI/swsxC2UYVFAYkiCIqstWk
 FANV6zxUEJOx5OKuOYtbX1zRynTcsTnrG3xzkUzLt1EQyd97qzk3cCeXE1rHEGiWTgu7
 JwfxGfwCGL2uToWsG32vXPA3+4iF9c+2UC4kx1os0ECSHVk+uJqVdZZiolLKzOKV6/BK
 6PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791926441; x=1792531241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=80HMlNHODhWy0K4Cyri+SdABwjiGO6UZRVDCfoHscGA=;
 b=VaY59kWcFracjUhQF6FtjpXybsy0NWH2B023eULCU1lyopVIROWAEX9o09uJTaGOey
 36ss/NuwnM5b6zaJ7SR0TjTtRF1A4KmbpwkI1R8/ztvMdaw4fbRMAEJm7OhdNwlfMBxU
 XV9GUIZjyRy8yW191q4BJa29y1IVbePN+gSvbN3i26tPh/Rx4BAi+A5bkEQHGMMEZ7yw
 ZWqngRzRaTuIEe5IvdMEvYAAMwP+bvPGsQNZqcV/PylvSihqyZwvGKx6chH8f35ktvt2
 v6JmNqqUReuFUduixde/6IU2PIOJWWbQJnrvJOi9/tCj9OXN6GhSHpJRuL4JLojwmK8l
 rXHg==
X-Gm-Message-State: AFq9FYIoopP419ZKRQtJLtBz/1+4kR5fQ+8vdGGz/7mANo/yFPhk1aq7
 8+QfNSo/NRqCQ4LSmzLYTu/TRjgDDgLYYJEcXlfjKm91MZeuOJg5ZmjP4C7P0LrM
X-Gm-Gg: AYBFou38EzXINSODqLhjjHOxVZYVdTyJROYwIyXqz0ccrmDdGXt+zW/n3KSK67rtbrY
 pjjH+janKSx0qRptpd2IJBcJqh6unKMqGDLXS1mSS93pzR3lmhyapXZ2eA3uQVT36VBVSwvW+R1
 gzIJoIihxtzmIWgdvhI941FrDEg9R8ez/QriB+JEo93JI4VM9sJV6A5oZjRrTea7BPn+IEiK+BZ
 1FWQBTWygH1hwBIlft6J0ZzfbRv8jGRdSUVueylXS1mDWyvWK/IuP9CDgA82xMv3Jeq3vYrx4MT
 dfJS3idZLcto4AJB3A9s8y1xNr9qCcOFwq0/2Ac4W8mV8XY+rTY4nUzFq7KKvImzu7vwbv5qvq6
 Rl1ChhzGuE0WhkUfuUY3iAz/xttWMfefBjBv1taE36P6pPojw6I9dNbyfRLXpkwKgnK7GwK6RSw
 aa9BuWvSigX1f7p05QWnpGsuMts8hi2MAL5cEMOKRp0aDCTpAPnBli/DI9gylDWfLAQIctZTAQn
 lxtn2ImKQbtinbPWfEHH+kiMe3nqSP3kClcyTYB9AdGod+scZnNw/l7frZVj0c30sy3I8wLLdKt
 bLaziz1g84rZxjWfT5J7i9cSk3aWl0XinvNeFTRGdyq1p5ktsXR182KTwzpcNW9zbaSKEJ0jHal
 uAFVbg/ncNdJbItWTIXGo4unb9Y4atrA2ESgUIsybbEw=
X-Received: by 2002:a05:6808:238b:b0:4b9:e65b:8c30 with SMTP id
 5614622812f47-50c5417759cmr12407851b6e.30.1791926441424; 
 Tue, 13 Oct 2026 14:20:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1815fd26sm16116776b6e.10.2026.10.13.14.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:20:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:20:36 -0600
Message-ID: <20261013212037.2419515-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013212037.2419515-1-james.hilliard1@gmail.com>
References: <20261013212037.2419515-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/python-rtslib-fb: bump to version
 2.2.4
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to hatchling with hatch-vcs and use the PyPI source distribution,
which includes the version metadata needed by hatch-vcs.

Restore the compatibility symlink omitted from the PyPI archive so the
wheel continues to provide the rtslib_fb module.

Replace the six runtime dependency with pyudev and propagate its
libudev requirement to targetcli-fb.

Update the license hash for the removal of a trailing blank line:
https://github.com/open-iscsi/rtslib-fb/commit/c44657500a66a5f95b3a43d1c5b8dd114674c5c6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rtslib-fb/Config.in             |  6 +++++-
 package/python-rtslib-fb/python-rtslib-fb.hash |  8 +++++---
 package/python-rtslib-fb/python-rtslib-fb.mk   | 16 +++++++++++-----
 package/targetcli-fb/Config.in                 |  4 ++++
 4 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
index f4083340e6..ef7bb170ed 100644
--- a/package/python-rtslib-fb/Config.in
+++ b/package/python-rtslib-fb/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_PYTHON_RTSLIB_FB
 	bool "python-rtslib-fb"
-	select BR2_PACKAGE_PYTHON_SIX
+	depends on BR2_PACKAGE_HAS_LIBUDEV # python-pyudev
+	select BR2_PACKAGE_PYTHON_PYUDEV # runtime
 	help
 	  rtslib-fb is an object-based Python library for configuring
 	  the LIO generic SCSI target, present in 3.x Linux kernel
 	  versions.
 
 	  https://github.com/open-iscsi/rtslib-fb
+
+comment "python-rtslib-fb needs libudev"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index 39c390edb2..1cfbb3fc36 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  ac15c113d09209c7b0d14d94a12ed88205a7c2feadd1096f573049fd737f7e74  python-rtslib-fb-2.1.76.tar.gz
-sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
+# md5, sha256 from https://pypi.org/pypi/rtslib-fb/json
+md5  1ff112fb9df8ededcf5655f6e1174652  rtslib_fb-2.2.4.tar.gz
+sha256  0084daa651a72b1cacd0eaaf162725df69b991f501cffe87e0f67e99224a7267  rtslib_fb-2.2.4.tar.gz
+# Locally computed sha256 checksums
+sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 6396d26a3f..707c091cef 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -6,12 +6,18 @@
 
 # When upgrading the version, be sure to also upgrade
 # python-configshell-fb and targetcli-fb at the same time.
-PYTHON_RTSLIB_FB_VERSION = 2.1.76
-# Do not switch site to PyPI: it does not contain the latest version.
-PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,v$(PYTHON_RTSLIB_FB_VERSION))
+PYTHON_RTSLIB_FB_VERSION = 2.2.4
+PYTHON_RTSLIB_FB_SOURCE = rtslib_fb-$(PYTHON_RTSLIB_FB_VERSION).tar.gz
+PYTHON_RTSLIB_FB_SITE = https://files.pythonhosted.org/packages/79/32/030eaf69d4f19cac2345a6fab1f18118355f7c9c83d6d84f758b00bbd3d9
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
 PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
-PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
-PYTHON_RTSLIB_FB_DEPENDENCIES = python-six
+PYTHON_RTSLIB_FB_SETUP_TYPE = hatch
+PYTHON_RTSLIB_FB_DEPENDENCIES = host-python-hatch-vcs
+
+# The PyPI archive omits the compatibility symlink included in Git.
+define PYTHON_RTSLIB_FB_RESTORE_COMPAT_SYMLINK
+	ln -s rtslib $(@D)/rtslib_fb
+endef
+PYTHON_RTSLIB_FB_POST_EXTRACT_HOOKS += PYTHON_RTSLIB_FB_RESTORE_COMPAT_SYMLINK
 
 $(eval $(python-package))
diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index eb7528fbea..4455a6ce31 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_TARGETCLI_FB
 	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
+	depends on BR2_PACKAGE_HAS_LIBUDEV # python-rtslib-fb -> python-pyudev
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	select BR2_PACKAGE_PYTHON_SIX
@@ -24,3 +25,6 @@ config BR2_PACKAGE_TARGETCLI_FB
 	  versions.
 
 	  https://github.com/open-iscsi/targetcli-fb
+
+comment "targetcli-fb needs libudev"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
