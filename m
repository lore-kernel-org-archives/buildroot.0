Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F10C44507
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090EB409C9;
	Fri, 10 Jul 2026 13:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2SLQ187XtpQ; Fri, 10 Jul 2026 13:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E972740910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690990;
	bh=PwHYTal0nVt/5aTsFro8eb6R7xUs6IB3cCmuwwglRaU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iqWaZVcURmeGBIoAql771x0L1nyND6wlmXtEmpkwpxcvNu/yLmUXsoyBHeXPv5Qyq
	 Ts2M69byAqz1L9w+Ef1OuDeesA29Iv7nByC24f9wf2WU6TkfhulLLtFcZ+jGReFTqW
	 LYJiHjHxLJmIZ0IyyVZcZZqbJiSmKWMv92Jon37hjuAgB94akGODqU/9MElLlpZ7Ib
	 d/xeluZMQT+i91P+ZzF0S97npXrFPQotTBT/a5YEQADuAffFKIB2dNwUi1vaar/GkP
	 TUj8MWe5FI+W19dJ+H5KvjdMrJjAxpGm24jwG3qrY9Oo0efM8X9wdryVhGcbaqPJ0o
	 oltJr04PV2OQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E972740910;
	Fri, 10 Jul 2026 13:43:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 679762FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E8DB40903
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE5fCjOpHycf for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6252D408FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6252D408FD
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 980B988689; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:53:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 61d5a09e9933e2ce2670df5b0f7ad0ec467c219f
X-Git-Newrev: f42704121d98a1d186ca248a5167220447bb3a13
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.980B988689@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/strongswan: fix
 build w/ wolfssl 5.9.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f42704121d98a1d186ca248a5167220447bb3a13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The 'mlkem.h' header is no longer present in wolfssl v5.9.2 [1] and the
content was merged in the 'wc_mlkem.h' header.

[1] https://github.com/wolfSSL/wolfssl/commit/7a2cf5b655541013ed8c93ecc9f598146abf2916

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 275faf6d61d04f1e01df12ef4ce0b0f2710a194f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-headers-included-later-might-refer-to-it.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/strongswan/0003-wolfssl-don-t-undef-PARSE-ERROR-as-headers-included-later-might-refer-to-it.patch b/package/strongswan/0003-wolfssl-don-t-undef-PARSE-ERROR-as-headers-included-later-might-refer-to-it.patch
new file mode 100644
index 0000000000..174887389b
--- /dev/null
+++ b/package/strongswan/0003-wolfssl-don-t-undef-PARSE-ERROR-as-headers-included-later-might-refer-to-it.patch
@@ -0,0 +1,25 @@
+From 60336ceecbd1cda73aa26dd44cfdaf2e31a046e1 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 4 Oct 2024 11:23:28 +0200
+Subject: [PATCH] wolfssl: Don't undef PARSE_ERROR as headers included later
+ might refer to it
+
+Upstream: https://github.com/strongswan/strongswan/commit/60336ceecbd1cda73aa26dd44cfdaf2e31a046e1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libstrongswan/plugins/wolfssl/wolfssl_common.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_common.h b/src/libstrongswan/plugins/wolfssl/wolfssl_common.h
+index 9c944e7119..ef6c3da7b2 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_common.h
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_common.h
+@@ -78,8 +78,6 @@ typedef union {
+ } wolfssl_ed_key;
+ #endif /* HAVE_ED25519 || HAVE_ED448 */
+
+-#undef PARSE_ERROR
+-
+ /* Eliminate macro conflicts */
+ #undef RNG
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
