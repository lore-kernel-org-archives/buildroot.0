Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15C5C98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9505D40B22;
	Thu, 24 Sep 2026 18:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOqWk4NafpZQ; Thu, 24 Sep 2026 18:57:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8C4F240B1D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276228;
	b=D7JR02E5dmCxfgBKGhTXbaDbk/Z8qRsDqwwf+RvmZ5TOtD7CVTRuiCJJ/XRbom3lD4ln
	 a1/txNDxZbfLYwULkQ6CuFgpYwfiHOHQIm+TLneAS8ImShGjj/SHVLm1ib00JzFwPXxUO
	 iZUZFZ0oWoPfbnp8cP9uE4G2sJ7mXqIcO0NpjqDNtitln7d94jV4lTqakzy6igiDY2POs
	 PlWm6j0mGo0CBk6GTp1/TM+WAp9/GBeIGWnnc6F1PUXjgX9YpvgbSk48eecG6gdukiQmO
	 w453Y0i7on4qN58HIGJQ9uIKdFkfl+sEAP+BpOyCk4Mjjwo5IGzTEvF704YKdl7BA1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276228;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ici+gbDDmIf0nmiSkObIehqrVWW4juvott9idE6GSh0=;
	b=KHRY2e6nFAwcspkj0Bh522mH/jvLR2sgPPgiy/qEk65LMwmDuRDN2HrZoMKIELsMSNjx
	 SofgpW1y1cvsJM4HODUxsMBh+TBmILVYkorPdyOuu1aAHwTG+FyUv83/4jQIRdoTVmHE+
	 CRbb+jad+jCYKEBIBhUWNKKECJpnvbhfB07+Vugc3qtFCRYjzH4I5DPE3At+EV2gY5aYz
	 yjvEw9LmV6r43ngz7/l2UdUcFulyKX/TyqS5bkT+8vT39F2ctxJwulYdsrl7c8ysUikiG
	 b7/EoPnC+BL2nHfS1zAd8ktlW0uwnULAkTWRe/aaep87XECOC5l9C7cQE5SSgh0mXeg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276228;
	bh=ici+gbDDmIf0nmiSkObIehqrVWW4juvott9idE6GSh0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lDw5GvazW9f6c1ZVmgnegfk6IyJAtDqewlSjhVz3NIfkdYGqflOKugxR7YlKbAouE
	 kdsA5mTMHcXhSdT3Xw3UCoHeA4nWO7PmDoAS0z48cWeseyak1QSRNryu534GWQKOGa
	 t8r90K8cd1LDhVfmYquEpBYTwC2QOc+72ZZLnkk8end4sZ4JbJWnkoGFk3qy+6CuUN
	 /6/eFffimnwm1OFzJcKYK6WNbCGXFAbPAIql3XBEh2twIgH2HFQC5BJ70w2L2Wm9zW
	 QGh2yC43kEcfL/8zIbowH7u9oDDpqEYxYzbr8B1VWMHoXV/qnAeNAaGcg72YOr8A1e
	 0TPtHo3SXfk0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C4F240B1D;
	Thu, 24 Sep 2026 18:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37128328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10EC840AD8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7Sho-0JjiSc for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8B37E40ABF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=OwmmFeRiNZuKw2GaW6P4CwXHv42EMHaI7o1cWQGAW/gZ4w+V7FI+89jtCRXKosCcDShM
 5muPF3YFD/q3Q/jMNy75c9oSizPzngKC/63X2B5n5fE5mq9fNj3y7JAeE2xcwYaWMYyeX
 aiPlbvv3O+E2K8CTj/Rg0uvUkSFb2P/z0ScV08N0msHBankXJB80yde8jP0TLVWHZGsSF
 ULrliPkwyGTKGMDQrVXxVgHm/WEUzadm8uU3aeIwvsqe60gT4BDw7I51JmXQ7VMS0k1cs
 5SG4JFg7wW1K5BEX2t7iTTT6Rn0RwU5dulf8a4UE1c5jHb+ECiPHTuZXItzdp4LmuYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v0/hZTC5dvfCeSNTRs12hX/DAWEwUk2PH7sIEFWQpIg=;
 b=ajhsoHWsfGkqVQMmPTr81FmrJ/I+yvf0ng0rv19nCB9y33M11+S4RF1+x+hbXKKs+fiP
 OfNG0o+urfS20bxeEFLH+rvBbwyi4iIhXAiaTKDgB+PVQp5qxxLeC54w6Fa7eaZXeoVBU
 Z3yJGS34ohsoMZEK0KcBe8padyUO911M/Uuw3qqhXH3VUGUzyXAg5RFla4C87MIxeu5Oc
 dRYORxa+HFq6m4MewjcSECppjST3ksoL9cn3irPJihBzxROVjf9YXyAgbMiqn60rlFXv9
 H7a9FVW9Cn+VSwVTbHzFTAgJGX1AnLDtISY21AkDL2K+mIfBzp+295gW0GemxMLSn2A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B37E40ABF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F09498385; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:49:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 20974a249c710ca795e9438a35f218b385aca106
X-Git-Newrev: 11ebe0ad2e55f07093d2514bf4bc5cc9dc596377
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.2F09498385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gerbera:
 propagate icu's dependency on !BR2_BINFMT_FLAT
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7084211469452040567=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7084211469452040567==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11ebe0ad2e55f07093d2514bf4bc5cc9dc596377
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

gerbera selects BR2_PACKAGE_ICU, which depends on !BR2_BINFMT_FLAT,
but this dependency was not propagated to gerbera. In practice this is
not an issue because gerbera depends on BR2_USE_MMU, and only noMMU
platforms can use BR2_BINFMT_FLAT. But for the sake of completeness,
let's propagate this dependency.

Note: in the Config.in comment, we handle it like an architecture
dependency, like is done in package/icu/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6b716763e9618c287d325bd3b42afb61a1a50769)
[raphael: resolve conflicts in Config.in]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gerbera/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 46a163ec78..059f3b26a7 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_GERBERA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR # fmt
+	depends on !BR2_BINFMT_FLAT # icu
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBNPUPNP
@@ -28,6 +29,7 @@ config BR2_PACKAGE_GERBERA
 
 comment "gerbera needs a toolchain w/ C++, dynamic library, threads, wchar, gcc >= 8"
 	depends on BR2_USE_MMU
+	depends on !BR2_BINFMT_FLAT
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \

--===============7084211469452040567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7084211469452040567==--
