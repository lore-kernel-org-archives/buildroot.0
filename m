Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259A2CD37B2
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB8364173E;
	Sun, 10 May 2026 19:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfBbwRTkX5s7; Sun, 10 May 2026 19:38:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27B634174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441924;
	bh=xnM9X0xlo0H5BrTsxa25HcAjoQoPPz7dROIPDkVHtG4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sloXfC0MlHBgtDB5mQmCBL5pa3RKNGDhLV+6Whc27JxdqQKym84WtivOTUtSrEF1M
	 luJEOeF7wwjEUQHf3oh8ZAHTQPreb48Vu40DS9IpeIv0wlcccjy/pkWDGzHSQ8ZTtS
	 FHmFgGOpYc5ownFk6/t3szQiE2jqXv7hzNFC2UuJu3pmoMn0cEP95kCC6UgR+lEeHD
	 SJWmOlOdX5Pdu6kzIoKACXtoRF/nOZSQquGKQjbzivAFmlGyoilnL5KrahuxM8YxOq
	 cv2NOw1NCUKSRt1Figt9+4JSaiIULe1rXEYQw8ouHXWsdEU+YRNSVRGwBex6cxWBPs
	 fryv8lfYW/eaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27B634174B;
	Sun, 10 May 2026 19:38:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71734173
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D75C4174B
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1P_CO_gP_dM for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:42 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56CCC4173E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56CCC4173E
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56CCC4173E
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-59e5aa4ca41so3470986e87.2
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441920; x=1779046720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gZtRAI6YqMJ9gMw2NMdUlhzdNdQKy9NzGv7kLQfbAUA=;
 b=WdnMThqlSnQEAhjbpfai+yWeXpwIe7oFu9A0cuUTCdp+b3pLVFJegDXhOTRG3dqKXI
 IFv5x2uhmHQPhX4680UVeWkehWmOSuxS2hXPeNtyea2Xzpp3B3ce/GYDQkBtNholf+2L
 fYPseXDpu1ArVxHzGh3o4H9ZVSsgV9/xxT4tm7Ux8JJHdRrbxthy5Wh9p8+9EmKhS+QL
 BFCtFbyZiDNEBU4b9slT/C0n5TpaPHTHKYlyR3Q0q4Tado5deJCQ2/1Go5TkqTEsiPnB
 0XjDKIfDci5imZGmU06cr711aN+tgievSk/tIkZiKySGBZvXiruerAPDi0n6w7VTVtiU
 1wkg==
X-Gm-Message-State: AOJu0YxvEKuzIOe/hBZVyew4ghO2uFQjzZVaJD+QsCOzHoHPR8KAs+u5
 5j1YNdtCXzb7CSHIuGLrICGu1bb4XP9kJOPptVQU2kE3ZSmI+iRstmxSZgN80j1sW8Kom3kSp6u
 ou2OgzeAyGQ==
X-Gm-Gg: Acq92OH2TVs7JH96bLDg2EwvQAIGFTGoKT+5ffa08A/aY4td7h0V0nvQCuB62qLhXCU
 Cm5xx5fQ+mV4C8C7couJM6Kpb90Y9jNrx+nnYjveXlX237oJ/BkQsReHT0aZDXk0WXkTWMFx/iH
 5mXqOXxgz+0qgpxLmswPWwOldhuKFC3LK1M7CzPsL2SL9+SmiQ1a0+vC4Szmh0IX7nQgR69+s09
 cgZ3H61UxsAYFqR6eQ0qLwe4NiuRWG3dmBXw85b2erUBYxe684/H9M3lrUtq5NvPj3g+p/NrSZV
 CiJ9IXc+Q9ZHlj4Ih4GtECKmnlOpYEEPO2mQ3RES7a9kVC0FJhT/K5P0MbKY7e9YmKjK3XGWgxh
 M2MJczp/929J7guv5XCTtJve8pfXYyFrn5aeI5QY4LTsS3K7x3ykcKO4e/9Rf0hg+cIz/vrG347
 7Q78GIFTLVDWKNHZ3d8gongAc/g2XIYATLeXRkZyp7pfpGJY+zVis=
X-Received: by 2002:a05:6512:3c93:b0:5a8:88f8:9eeb with SMTP id
 2adb3069b0e04-5a8b6ca29d0mr1879340e87.11.1778441920003; 
 Sun, 10 May 2026 12:38:40 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5a8a951cfb4sm2095571e87.20.2026.05.10.12.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:39 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: john.ernberg@actia.se, John Ernberg <j@j-ernberg.se>,
 Karoly Kasza <kaszak@gmail.com>
Date: Sun, 10 May 2026 21:38:23 +0200
Message-ID: <20260510193826.2846038-6-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193826.2846038-1-j@j-ernberg.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441920; x=1779046720;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZtRAI6YqMJ9gMw2NMdUlhzdNdQKy9NzGv7kLQfbAUA=;
 b=Ar7QHE37Vu0LM3QGkk1MvQo1akLsFO+92ynX9TDfhqPYOhS3U7M/CvPHcNBPIf1RbR
 lyDHQ/ApO2Pqi1BXOWhTDTzq7l26MZRAWzSiyE3GTGEpKtBTdpV429kXepZqDDhQJThi
 XLSGWqD7MHZL9eYCx/QwSthtOaCz1XNHiK/nzom57b4nK9lS6WNwCSrhsJ3gGdwRT1di
 cGSP9qUs252bEHGvwINIDJtAgdiniA1dr9blMh/mmEtFN8Q/6j2gk5+kDot2Axj+aI1R
 TNUFFSniJFhfSWjUw7E/NUSyzWpCkz5WNZdLvPAUpb9ZsJ2nbPMchOvQAWKWZasNmFg3
 uqOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=Ar7QHE37
Subject: [Buildroot] [RESEND PATCH 5/8] package/openvmtools: Add patch to
 fix build failure with newer glib versions
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

Later versions of glib defines g_free as a macro, causing build
failures. Add patch from upstream pull request to fix the issue.

Cc: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---

RESEND:
 - Forgot to subscribe this e-mail to the list

 ...GLib-g_free-macro-redefinition-error.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch

diff --git a/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch b/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch
new file mode 100644
index 0000000000..226fd5a15f
--- /dev/null
+++ b/package/openvmtools/0015-glib_stubs-avoid-GLib-g_free-macro-redefinition-error.patch
@@ -0,0 +1,34 @@
+From bfd12cf73d81919843383598e4a9e64c6e5fd97a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Nov 2025 00:29:10 -0800
+Subject: [PATCH] glib_stubs: avoid GLib g_free macro redefinition error
+
+glib 2.78+ defines g_free as an object-size checking macro.
+open-vm-tools overrides g_free(), leading to preprocessor expansion
+inside the function signature and breaking the build.
+
+Undefine the macro before defining the stub.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/vmware/open-vm-tools/pull/779
+Signed-off-by: John Ernberg <j@j-ernberg.se>
+---
+ open-vm-tools/lib/rpcChannel/glib_stubs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/rpcChannel/glib_stubs.c b/lib/rpcChannel/glib_stubs.c
+index c32deb073..cb89c6a87 100644
+--- a/lib/rpcChannel/glib_stubs.c
++++ b/lib/rpcChannel/glib_stubs.c
+@@ -35,6 +35,9 @@
+ 
+ void *g_malloc0(size_t s) { return Util_SafeCalloc(1, s); }
+ void *g_malloc0_n(size_t n, size_t s) { return Util_SafeCalloc(n, s); }
++/* GLib defines g_free as a macro, so undefine it before providing
++ * our own stub implementation. */
++#undef g_free
+ void g_free(void *p) { free(p); }
+ 
+ void g_mutex_init(GMutex *mutex) { }
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
