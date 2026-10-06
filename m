Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB48CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9117860822;
	Tue,  6 Oct 2026 16:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjOvA_x1lnbb; Tue,  6 Oct 2026 16:30:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 787A560817
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304230;
	b=bJFzrfHzp9GiwkZF/qgVOfdjksGUNad54Nfds3sOUP2gUaC+/vqE7J239BiClQqmgQ55
	 Yqn+7abzib0FdZuew0bIkUXknkhOxojJsjWdoUtyCStp9FehaHVVbqi5W4ZiLXa+D8b5j
	 lcB1AtJ8s6d/CSB+ZPwiakdhJdSxUf56SDt52snTRwmwVOyUDEIj0+G1ypcgEEQ1+Vsa8
	 0/ZbYlFsz6DquBf20oTdY96Y0rR/k12FInL14GT/bWvzgaeM1L7LKbP/E2QoYbyCvBDNz
	 WWGozbsOlMfyNtD/03xl/+AjTer3+n+x2BYc8LSQxV2GXP3k5tDGH0xdUA3bDS9zReQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bTY5ZCPJxBE/AEidnbzCHhWj8VgxiEgKdmTmEHXQSks=;
	b=mYWrdUisYjEhP4uGvG5dKViDhFtfwRCcSKXm4v84DZIFympfPqEtrL2BVf2P793Y1Wqw
	 2TJgglGRpDLeEpmj36GxY7yIaL9aOHGKQjfpss/zBLQD3zmMGxfMtpXMUGvsdLwZFwxJZ
	 3Gpa9OZT8dt96shRyUhT4W9MOocDoJE5lViTsJanaaQ23L1muiIHvCHjygK07EG2oOmPj
	 VD4wTzHomI9XwrcPq06bKTxOqVqsdUBAe+ziCy3376DtAT646OL51PZ752O7vmeJ4rz/J
	 rFI5mfVnIGuBzeXnbEGFfnxxflF6GkV6YR/2rI4UA88dxmHZUO5y9cWxbI87RUfeR8w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304230;
	bh=bTY5ZCPJxBE/AEidnbzCHhWj8VgxiEgKdmTmEHXQSks=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PKZQXO6RhddFbItq6oAqLC4IuVuDgP4XXMMRXJnaAYr1s+vc8CYNU1a830HYFPdkQ
	 xQVoGC4NiIieOGyRXRNiznpzNzxwKnCvpd7XMqIk1SkZX97vAKVAQcmvbUyFQUMHjL
	 hdCos57RML2+0RL7cIfz6mYHLI+OxLwOTvLzTuQ0U2eu+6oEV8v9t3L8yZ3nku/Ezl
	 a7u9CO927CAmamUd084LjYkO3o9N/KvCEniO43Gf4kdBcDeYdM7zVK45O0MCIlWjdt
	 IIBgwbmM9mRM1hw6/hyM7W6aR3ZoXrCNMPK5dWQPT79RZrQAUQy9B5Yx3OQWWPYETB
	 O5sE3k5EKevIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 787A560817;
	Tue,  6 Oct 2026 16:30:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E0FC317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73AFF80D8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vN9a2sQ24n7 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:25:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5A2AE809B1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303947;
 b=TQtjO3f79Sld3VX7dKRGkU/qHQMfY+hj02TdLIqmaE2ru46lkL39pHgZk6HWzaKPZlnt
 /RI2Z0ZZjzY+NnVwAiAVGJ2TkKoigBEHn1o5NYjdbjl4u3hdrkLBUdodHWwVrux3Jtw91
 S6NtZZRUvoidHs6qIroKiQWiiWLyCEtokOROOfsBvueRbT+68cO461H57Iy0sDgoLZMpy
 U9oCfTpv77Y7u7znPOdC9iui9AFHDBMS8KEXzF6rR2oVtsParAvXJeFNdXW66pujwRV3L
 SbCtoHIYeDqDRPu5M2HetlGVFv6QjFDAk6SkPLYdHHrpA+SHeangtvWSnK326yfSW4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303947;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZC4nlpTNXR+GNc2CZehD4mAOmETwzu97D50GF2QHVOw=;
 b=h5IbjkicVC/lzgoR/huSntettEFIJkDnf06W+C4yqVAqrMrZ6ld8yApNR9znDZi4IThS
 nZ9v9YVCHTZ9+IPAtRmFBFjwU//BEL4vwhALdISo81TH4vlPg1heIn39/ozptiJkgon3F
 QnXbuCqTquvL17oJ+IlFiunzrUeiruyXaLYR3MiKq5tVIhNd1Q/E1Z/BeKSRWt5jdhG71
 m4BgQpD1QImt5S/RjA4wbEglLUzA1+r3fvyAO/XjFufrvkRrCmagrpKlF7wlKHiCcL4+q
 3khrp7mpnugOm+AmUJVcxtP07qLTrxpiM1VS656scn8HIkVtSP/QoMrMCQzsKgYBERA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=S4hRyNsC; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=S4hRyNsC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A2AE809B1
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303704;
 bh=ZC4nlpTNXR+GNc2CZehD4mAOmETwzu97D50GF2QHVOw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=S4hRyNsCmTlSCuR3Eri3S1vyRUSAKsNcMGMmofOXdis/8mqYCQAbY2ergBkkYPIOw
 qQqE7rklQl7c8GgXpbmHjVN29VtS9Zcrim3mWUr09abFH5XHnkrVAT4SNuDom60Evt
 AxA2U2OBA7tc8G6TualMs2fsqiQH4YZnX3ELoHXgxrfLXbaET9Lu2nvz0Iox+8nCCA
 ba+VvSPcDGE4+jwvukPKtczcDiYFNG+fs8tSYOS5ZcYkz1lZbzDLVVgk+OPp66Oa8B
 +3s/So/1xbrNj0FB7wjIE0kWMFS6M31u8x3wcXSAN60osM7/ZgfQXZ4PuYEYdbirh9
 9QWzU+B48kvzQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 OMBbopusPtlotoE3ucVHFjw6An9YBDcPBQAuph9nlJSubELwhLHY4omzyiBTcRqZ4594u3PC2RE
 zJ8tC9ktl85f5sh6VO+4xAGutxgIq/JrZ6yuRmKIQgAEufpxaF4/yh47Lc6/jQ19d7xxghydG4T
 T6P2ZyC0HZLPQ+QpA4gYpj3YbPO05mYVjjetOc7GbQTZyGVSt+T8FEFFXDLEp49O7IJD5zdaX0E
 CPU9qkIcU35IwjhfVl3IkgCdYzcV/73UVFtinrNuAkfLTCemXp73+VPbiRNtKD66LufLYRrA8VE
 YM0Bh/FsHCfSg1fqPrUm+If/+QLfcNgmM4StDKD1TK9PHnCUNEIQIrzr1i0q7XZVz/BOCrBp0rW
 /RDGSSdpWbb8ltPWuhC1Ys/qEjQWqcV/WNFbRAQlE760nwJnoZ3egWUkmz2J3Sf/loNsCM9t70V
 kGPtJ9/BaB45xK8nKPAoY7VqHCmr4j2W0CkFGXuHDdPXz5SRlLBVCSvFL3zPyF0vRogClP3bb6/
 uImYHBqx/umRbrhM6QqfAL7MRm3HmSzmUiNj7k6hKsbZTzUmwgcDO5GhCmxHd10hqeiHvtEbLXR
 Gd8BCec=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4672A4C521B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7us-000000000ir-0HkT
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:52 +0200
Message-ID: <20261006162106.3439373-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v8 71/84] package/kodi-audioencoder-*: mass
 version bump to Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash     | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk       | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash     | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk       | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk   | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash       | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index de326bc619..e88e0d5271 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e7f21f4c42ac2c627ed381436d430a83f18ebc07cb92e91b6c98c4ff9528cc5  kodi-audioencoder-flac-21.0.2-Omega.tar.gz
+sha256  f944778346057068d21b3b3b0f92c996c076fa512a82bf54e552ee929d382aa0  kodi-audioencoder-flac-22.0.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 5fccb82313..5e9ee8406c 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_FLAC_VERSION = 22.0.5-Piers
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 6c9439ec5d..fc55bd3b5c 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cf593053e7413f6790352ab3c2fcf227763a23c8e7a90381b46afdde3d92df7f  kodi-audioencoder-lame-21.0.2-Omega.tar.gz
+sha256  7edb92db2cc6af11d79f7f0111a60345c25aff422da719a1afef1e9e9f6fc401  kodi-audioencoder-lame-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index a1fa2c51dd..e44bc62647 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_LAME_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 91f51421c2..7ff0f9c324 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5acd05c5e90459c1f07abe60c1df40f72ebcb3519287f104968c7cad17aca07d  kodi-audioencoder-vorbis-21.0.2-Omega.tar.gz
+sha256  7409360a8b540303cd3f9e6b21a52e21dfcfe2f516f8a92a94b4035a90c5efb6  kodi-audioencoder-vorbis-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 85a320c55c..a976a51ec4 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_VORBIS_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index 34370b536b..fff9f8773e 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2bbc3e15706e02bbd3e6be3c232522e2091509a6fdf88d8af5db4cd6bf7b3476  kodi-audioencoder-wav-21.0.2-Omega.tar.gz
+sha256  8ca6b38660815593adb8c276347a51cbb91138d42de7f05bb2abda37624e3638  kodi-audioencoder-wav-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 76f092302b..ccc9ada4c8 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 21.0.2-Omega
+KODI_AUDIOENCODER_WAV_VERSION = 22.0.3-Piers
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
