Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BE4CA5FF5
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 22:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E506A6069E;
	Mon,  5 Oct 2026 22:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxhKq4Xborxo; Mon,  5 Oct 2026 22:40:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7902B60761
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791240045;
	b=JKm1UL+thYjjADg3WY2sAnTP5vcCXEf99cRSn0iZyKqTOFpnRDCaGWTL45HF+ozhDmi0
	 Guj0TtkXWYj8HDS5lPegAmhn2U2wZB+qGSIgOvbnJqbj4lyW4Bd1EvRx7vlcvChiCGUG4
	 6yRDJt4M064GslpIqQVDx4+emprjrgMMB4FFo2f//FXYubyqj3CUz1RMbCC4F9/78M6WN
	 qXYcu7DSqeaGedPm7L6jNVXgujiaNv9hS6RH3fzWZ09+2drtW4hv3txjt0qRa9NpCw+P6
	 mh7OmmT5TTqCaG7Yxmwr1Dly960rVaJ+bXhmVopoo8YQCTXCF/BE7su/eVBQWNfbvww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791240045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qF/f+k9eNK/c5ERsdnKPEepEkt+ltHxIDaqOGwBK2w8=;
	b=tG4UF8RCIIOLfn3+ZNh4tUw+HL1jicpgQIsSaSsaTqZw3g20vSCV40JTRcQiR0Y1cTbN
	 0J5dbtGbtgspTh+fmjIDV89ctNEQGFiZkPaTtWCgLDFOPQdT+gzjb+iGA2PGrrc7ShVxw
	 x35meyzKLZDFr8icZ3dDTCLF5K3AG8XrR6kH+YU50wOfJpfd5kFULhNMtuSeRsY2nCCKO
	 O4caNE2TuZiSkp8ODW+15F+Hw7eyqf+92Hubf3gVcPuAYe9vs7vlN4sdNvXAtF9yNs944
	 JiTF8wzWmSQFVkLWLJmorn4oZjweacmC8h5PbHCH8WUV1w1YDXKqgL469t4odMyaKAg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791240045;
	bh=qF/f+k9eNK/c5ERsdnKPEepEkt+ltHxIDaqOGwBK2w8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rogB04AQ3v6Zeb7OyVHpzOm9A5qMQ7Gh6/ggdtypcmvTxne54ir3ThoA8ZZBio/i5
	 Mp3jw33SaVS1jEmk8EQhcLncy1/fiEEb20uZBI5VYfWF8GuO/vL48WrWn1WwWhGTQA
	 7USVCKnibvyc2yjgOmvfEJKBI6EGCP87Rdit+3YVR+aavcMvB3DCWXr5cdSIq3pztn
	 xHKOcq78YxOYRY8MvcxnEI5lfKSor+6LMiHuEANni9vYRDjDXgp9jCZtabB7EcP3yy
	 fVTRxbzbOiBsNLQMUcud2sxnT0x3pC0DIfTE9vxptOdM2rwiY82nv52wDHibBIBdXi
	 QaJBAsXg+wjTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7902B60761;
	Mon,  5 Oct 2026 22:40:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C588734E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C301B405AD
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7Vx0XsVZtv8 for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 22:38:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0672F4053C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791239908;
 b=ecA59kUM+y9idi3haDrf+VHt7koaBwPRnsuukLLqoQMvq3mdrZTLVyOKVx1BJH2E3u1v
 db59qZU8lOfhRXSc3tBkHvLSEOXVD1nKwCVGAWCIEfLLXi9DRC6wJQJJ/H64fcNq8HLLL
 aaMIqjJR6XXhPKqx16f2e2/BlsaLZtnBefjwmJKBczawu8qAcMbI5jSKvi/1emEHGpeho
 L3vJBOdyzhM39Qf7WCVsVeOXCkXndtRGAvOlMdDDe1PhYW+C4mUWJM2csK705PoibjgqK
 Rkhgv/QfyS3Nd9r8+L4OHSTX9Z1dwutJd0dIh5SarIEAsLR7B2rC2V4UDlk5bSBRIAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791239908;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=jmW4H2y3cBPXJYt9J7t9Un/4sEWu1nsRZZcrlXFZFGU=;
 b=IriLW6G7MEpT5kGig+FeG//c9gYayV5rwf0f0MkfDJK3xsXf9QjRG67lpiWDRv4C4Rqk
 tY/Hn0b8wgzZng5BtiAQ2xCI/9ChX4hGEfGLsa12gQIIVSah245bifRcoU8/fzZPMwthA
 A85dkp0m+yWCeqldeWIXbNOrPZS0yq6DNPgCC/EoCkQ8H8CSE5Kqi6TKD+uDrjd732hBp
 N/QpPYSPLa2gdOehW+QtcYmXjkWDVXWmRZtFcV6X7Da1sx3nc25Ze6lxiYqcr06fQVlvs
 VdrzMmNqD0efT8nCbROH6NcxXsF318ZGR7XlU3o08alKy2yDtcreVBH7SI08+YF5u8w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TlS9DpAv; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TlS9DpAv
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0672F4053C
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:27 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-82395ae2ea8so2262538a34.1
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 15:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791239906; x=1791844706; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jmW4H2y3cBPXJYt9J7t9Un/4sEWu1nsRZZcrlXFZFGU=;
 b=TlS9DpAvd7QqxMs+AIkuaubEGd5NJKA/p4JRIYBmGpWgWIsn3OjcVKCLYVTF5+V6VV
 AwcIJmfJeeqsNBgFSS6RKy7pcBEqPjIhp0w/TJngfti6l/hbdYQn+fMkhdDlSr08Em6B
 3NTT82CTyGgeSFQLv51TIyULvh+wPMMp7nMr9D8VB7HD0S/pfRMJaLFwxNMpFPebKxL9
 n1idfhQ8EHVlau60nYxPs0N5MWUYMdTUBTu3ISN1j20Wku50lsAMTnnCb6fGyFOkKVNI
 EXBve3JmSfxwVzLyPlxcnip7jqXhmgZGN4sGEOCqFjrqkbgG0hT6CaVFHc/VyqdOXwTa
 E9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791239906; x=1791844706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jmW4H2y3cBPXJYt9J7t9Un/4sEWu1nsRZZcrlXFZFGU=;
 b=jrgeBCFmO6Ikb8LHpkqHhuOJFxeKqOKD+r3IQDPy+fRG+wYJ7a48b60DgmgLSZQZc5
 inKWK0/+ueMbUGTgSgvULdxESjfwK1mhVTURKOKhTTTtppHYIFo2FxNwwddktjjtTwem
 v5we+vufoJ3p8sIE7regc4T2eDZZeL3nPI2gRIxHW1LcYA5Iv+eIMNjcHPfZDcglcXgy
 7W9rbmNL0KY/hsfU0Xjd+NursPDqZwzdUaEeIMQGeFwccUldqiODVj/9yPdH9GqVP5gr
 mZLihQPlkraxTXb+fBnx1qqjU0LFcqq5FNPVyuoWWiSLe6kcKA/MBJqeCxvd7rzGWNre
 OIZQ==
X-Gm-Message-State: AFuF++mkkjbEhqd5AY9Ng0eZQCW8I765Mlpgh6vz+n5CDckJl4btzpjs
 hHLS00ZLF9ttyWpm1WS6Z+VDZ+QcTvBDJYgh6hsMfWS4elHxYiD1MyrmfvzSng==
X-Gm-Gg: AYBFou2r6o5OLs9n+6pzanUwxR45WGW7utC4Js4grCRYWgtyvopNJWA7zBVbGIHd0af
 eUi8ph3QhjdWYbMjFNojDspserLjdY0pvdcr/F9rqJpjpJRItl5hyJSK9AbQ6QVL0HKAJZmuZ1y
 LWGF64/xnduF79Ao8O8HNPuOfY5zwsdVf7tChXZWprTM7k9M33Ql65nLSyNIARHJOitEBTp62wq
 FHGIQQuku28bpaTrolabsIFf5bSUyn0seNtYWf1HTqCyMDZd2eoQdAMUFP8g4qCdYn6WRR1dTZH
 VNE6SSkp8S+bWo/P7NjRHkKmen5fkRZBMTVy9P8L9CJKqUTF2Ox+6zSBAvwPYRee4Y7PXu2rq7R
 ztE7Y86HTalMR7h2Cui6CAGKKWuNy2FayBoMbBUvo4O/VDEGsNgwO8rIZVbIvNc2BOjxVuiCR2T
 XEJak7J0SKd7xdTUnXnYPmQknMYvlWvCK1Qtc9V9jIOtGmeZTNtzWVTvyosz2QKMRQ+yTUQ9p2N
 s8f5SYT0UcdDFP4OtgaQEcp1uZgS2S5+gMikuUeUxBsqkT9vGLgJFQmHGlNbJ4WNiPqM7snB7OJ
 0b6Itm0emTnrEkQYdesKJh/l1IdG55DLjHKYYGDv2xDEA23UN/Phyey+IuJIQaA4cEUuZ8XROik
 gYKaKxk4USpRwsmX7iYHbemVBaLwXVkJiz5XbYpK/oQ==
X-Received: by 2002:a05:6820:1788:b0:6cd:3fbd:1d63 with SMTP id
 006d021491bc7-6e09f236cf6mr7763718eaf.77.1791239906439; 
 Mon, 05 Oct 2026 15:38:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-828201c6f0dsm720704a34.12.2026.10.05.15.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 15:38:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 16:38:08 -0600
Message-ID: <20261005223811.2094796-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005223811.2094796-1-james.hilliard1@gmail.com>
References: <20261005223811.2094796-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/pkg-meson: share cross-file
 generation
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Xukai Wang <kingxukai@zohomail.com>, Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Extract the cross-file generation and compiler flag defaults for use
by the meson-python backend. Keep package-specific binaries,
properties and flags in the common implementation.

Default Fortran flags to TARGET_FCFLAGS, as for the C and C++ flags.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/manual/adding-packages-meson.adoc |  4 ++++
 package/pkg-meson.mk                   | 25 +++++++++++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-meson.adoc b/docs/manual/adding-packages-meson.adoc
index 01891e03cc..c870045441 100644
--- a/docs/manual/adding-packages-meson.adoc
+++ b/docs/manual/adding-packages-meson.adoc
@@ -108,6 +108,10 @@ will therefore only use a few of them.
   +cross-compile.conf+ file +c_link_args+ and +cpp_link_args+ properties. By
   default, the value of +TARGET_LDFLAGS+.
 
+* +FOO_FCFLAGS+, to specify compiler arguments added to the package specific
+  +cross-compile.conf+ file +fortran_args+ property. By default, the value of
+  +TARGET_FCFLAGS+.
+
 * +FOO_MESON_EXTRA_BINARIES+, to specify a space-separated list of programs
   to add to the `[binaries]` section of the meson `cross-compilation.conf`
   configuration file. The format is `program-name='/path/to/program'`, with
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 5f7eed9edf..f1fb69c240 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -113,6 +113,13 @@ PKG_MESON_HOST_OPTS = \
 	--wrap-mode=nodownload \
 	-Dstrip=true
 
+define PKG_MESON_SET_TARGET_FLAGS
+$(1)_CFLAGS ?= $$(TARGET_CFLAGS)
+$(1)_LDFLAGS ?= $$(TARGET_LDFLAGS)
+$(1)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
+$(1)_FCFLAGS ?= $$(TARGET_FCFLAGS)
+endef
+
 # Generates sed patterns for patching the cross-compilation.conf template,
 # since Flags might contain commas the arguments are passed indirectly by
 # variable name (stripped to deal with whitespaces).
@@ -138,6 +145,14 @@ define PKG_MESON_CROSSCONFIG_SED
         $(TOPDIR)/support/misc/cross-compilation.conf.in
 endef
 
+define PKG_MESON_GENERATE_CROSS_FILE
+	mkdir -p $($(PKG)_SRCDIR)/buildroot-build
+	sed -e "/^\[binaries\]$$/s:$$:$(foreach x,$($(PKG)_MESON_EXTRA_BINARIES),\n$(x)):" \
+	    -e "/^\[properties\]$$/s:$$:$(foreach x,$($(PKG)_MESON_EXTRA_PROPERTIES),\n$(x)):" \
+	    $(call PKG_MESON_CROSSCONFIG_SED,$(PKG)_CFLAGS,$(PKG)_CXXFLAGS,$(PKG)_LDFLAGS,$(PKG)_FCFLAGS) \
+	    > $($(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf
+endef
+
 ################################################################################
 # inner-meson-package -- defines how the configuration, compilation and
 # installation of a Meson package should be done, implements a few hooks to
@@ -162,20 +177,14 @@ define inner-meson-package
 ifndef $(2)_CONFIGURE_CMDS
 ifeq ($(4),target)
 
-$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
-$(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
-$(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
+$(call PKG_MESON_SET_TARGET_FLAGS,$(2))
 
 # Configure package for target
 #
 #
 define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
-	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
-	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
-	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
-	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS,$(2)_FCFLAGS) \
-	    > $$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf
+	$$(PKG_MESON_GENERATE_CROSS_FILE)
 	PATH=$$(BR_PATH) \
 	CC_FOR_BUILD="$$(HOSTCC)" \
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
