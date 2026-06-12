Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2BFCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DC6411AC;
	Fri, 12 Jun 2026 11:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bo_4Jisn1oX; Fri, 12 Jun 2026 11:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 922FE411BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264214;
	bh=qx0hMxJZg2bh0uKXOriIOifaX/L6SsFVWRr0Ju8YOxc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gkNo6sdzHBiuK9cYQs57irYB5V2bot2Eyhn5qo6snE+d8B1HoAT7Izh/GDb5AjDfm
	 hvLm6xunwvYrIMOTT+XaTlSYhskNKinusM4mVBYV6P4HQAFDQISC1xo8FAG6MzNQb7
	 OFPwvnYeY13BUc/cebztTGelqY2LyzR8eN9Nqav734J8YfiWREoMwrTcbcaBQwdge+
	 1DuaLEMQ4NUDtYSzPs3Oj3Dx3RbxDy6lMRwTmUscDsuLDyhzdXRLa0+zMrEFecqZF5
	 Gwh5bsfbgHaab4yCMbPZE0jTzY+MuqRY9t/92qzeixJPucOl8/nD55qBWw3H2JnK4v
	 o0/cOj+UWdqFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 922FE411BC;
	Fri, 12 Jun 2026 11:36:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 309C512F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 214D1406A5
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xhtaDVA7WyQ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 738E94068E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 738E94068E
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 738E94068E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490b7866869so8430665e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264208; x=1781869008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZmOvQvPh4DTJG28ZBQc9P+LidEHGQL8Sv6tHeTG4fG4=;
 b=gJRWm2qMF0ZCf3cFrfFD2T1T1/gFY++M5eUREVG585q1EwfmYr0XwIbhtiVEz0fuSL
 HqKBQMfkl5cpBRBThB7oXA3xPUz9400JL/JIsyT5W3X5Bh96FEFHc8V4T4WwvQ8HLp5f
 8+RHQm3q8Y5ZCTQzuPXYjqYnfDQK3fNQLckltA8Bz5Hjea4UZh9dq/5CLICmz9VulR+t
 KpIJo8tuEc6/GA5BZ3TvRn7JOc6cgDh5z+4i43CtQzCJNYtEMwxM6OwPgDpIqEucTVct
 WDblpNLlih5BJA1HNPUdcolwiqmH02iMmQF39VNtsmT1qAWOikxa9xlzEjfCjvWTqVlt
 xhWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8S2voER49z9bUa3Y3D4ym5O8Vtp9vQ3QIsUw/6lI3trLnILk2C0LC8DcFlByYvxrs7sIyfu9HtZG4=@buildroot.org
X-Gm-Message-State: AOJu0YyWJFI+GdkKG+ZpFNn/Eb2xrzj4KtXi80bjgZ0uIzBzuGIByysN
 pc7qnujJbl+7+kIluEjFx007rNIPBPSdcOp0BgglZAAIn41RJ3OQAxNZAQN9PFEhAuw=
X-Gm-Gg: Acq92OGQ2rHvOGGP6p1CbU6xr9tKOdqbnreEG85gBqTL2gWz2u0B+UNegG65bHIK2G6
 iKfVcwXpTN/SubzGwoEXBpfpe2HjZaYuCinmyAzVrO/YOm4HKqqH97rrz7pu0jbQ6pIO5cpUC/b
 VsG6PA1NKjYR4Mvgh9kITAAqjSlWnChTY+ig3iGKQdSEn3W+N2m7OcBSpd9rig/c70OZgPqk8NW
 gbNODMnMEqWGbvJcUvW51JhQLb6TQFj8aTLFyoRQWlvqW7xzLppTotwxEH+2dCrg7AaUBaMfUYn
 uDuNijoa/cW/0adMqswizCSdTLbMGm5ov8EwAa++lNw38z1ISRrznbiIINbTaBWw9onPP5acqOU
 AUzKKoWLdDiErMz6YIvJOEa1kWOvzOEr4HtA7Z8RQMrjgsqrAuOkmSybyS1IClFEyrZcNZbZ/fa
 UIkuJQa7ZgfaRlACg=
X-Received: by 2002:a05:600c:314a:b0:490:33b3:4be0 with SMTP id
 5b1f17b1804b1-490ec504d2bmr30273785e9.20.1781264208321; 
 Fri, 12 Jun 2026 04:36:48 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea94f5b0sm40811875e9.1.2026.06.12.04.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:36:47 -0700 (PDT)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:36:47 +0200
Message-ID: <20260612113647.250726-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251006164955.1887486-1-dario.binacchi@amarulasolutions.com>
References: <20251006164955.1887486-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264208; x=1781869008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmOvQvPh4DTJG28ZBQc9P+LidEHGQL8Sv6tHeTG4fG4=;
 b=bnWb/GaRMhIUY5n7M1Vt7aab8jRpP2HvtzMDsRG8nhZMSRHQJbE93I2Nw1KjwlVJFq
 Lx3vhyDUI7wMaEUA3EXe+tQwAOVAbApJLomFj4Xwggyhl3L685EDEq4xOUVVn8DUbigH
 HxOEqNcWCrEWLpeC9E8MB0AKa6PJ40aTKROBCu6Ookkw7iaEqpuw2egaMi5TUwlfPXjf
 k9lw2WJ/3lVUiSsvyal6JFb7qB1agT4FdMmL5qnd6N7IjNwTGk7xMPl1LtzXvdk1lt8A
 HazAoyK8qCFX7cYGJGsyBhyNGIdzhtVEB80f45i0ejbmxT6Gsr+7TaUzcXDnTfkamUEo
 oeHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bnWb/GaR
Subject: Re: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Removes the patches since they are all integrated upstream.
> 
> Release notes:
> https://lists.gnu.org/archive/html/freeipmi-announce/2025-01/msg00000.html
> https://lists.gnu.org/archive/html/freeipmi-announce/2025-09/msg00000.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x. Thanks

> ---
>  ...ipmi-sel-string-supermicro-common.h-.patch | 36 ------------
>  ...sensors-fix-header-guard-definitions.patch | 57 -------------------
>  ...003-ipmi-sensors-add-missing-include.patch | 28 ---------
>  package/freeipmi/freeipmi.hash                |  2 +-
>  package/freeipmi/freeipmi.mk                  |  2 +-
>  5 files changed, 2 insertions(+), 123 deletions(-)
>  delete mode 100644 package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
>  delete mode 100644 package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
>  delete mode 100644 package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
> 
> diff --git a/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch b/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
> deleted file mode 100644
> index 848539e7c31c..000000000000
> --- a/package/freeipmi/0001-libfreeipmi-sel-ipmi-sel-string-supermicro-common.h-.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 9239a686e4bfd862145f4654017112a0f8cbbb0d Mon Sep 17 00:00:00 2001
> -From: Albert Chu <chu11@llnl.gov>
> -Date: Fri, 22 Mar 2024 21:07:28 -0700
> -Subject: [PATCH] libfreeipmi/sel/ipmi-sel-string-supermicro-common.h: Add
> - missing function prototype.
> -
> -Signed-off-by: Albert Chu <chu11@llnl.gov>
> -[Waldemar: removed Changelog patching]
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -Upstream: http://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=9239a686e4bfd862145f4654017112a0f8cbbb0d
> ----
> - libfreeipmi/sel/ipmi-sel-string-supermicro-common.h | 10 ++++++++++
> - 1 files changed, 15 insertions(+)
> -
> -diff --git a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
> -index 5785f2b64..be5e41d7d 100644
> ---- a/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
> -+++ b/libfreeipmi/sel/ipmi-sel-string-supermicro-common.h
> -@@ -39,4 +39,14 @@ int sel_string_output_supermicro_overheat_event_data1_class_oem (ipmi_sel_ctx_t
> -                                                                  unsigned int *wlen,
> -                                                                  struct ipmi_sel_system_event_record_data *system_event_record_data);
> - 
> -+int sel_string_output_supermicro_dimm_event_data2_event_data3 (ipmi_sel_ctx_t ctx,
> -+                                                               struct ipmi_sel_entry *sel_entry,
> -+                                                               uint8_t sel_record_type,
> -+                                                               char *buf,
> -+                                                               unsigned int buflen,
> -+                                                               unsigned int flags,
> -+                                                               unsigned int *wlen,
> -+                                                               struct ipmi_sel_system_event_record_data *system_event_record_data,
> -+                                                               int *oem_rv);
> -+
> - #endif /* IPMI_SEL_STRING_SUPERMICRO_COMMON_H */
> --- 
> -2.30.2
> -
> diff --git a/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch b/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
> deleted file mode 100644
> index b04b3058358b..000000000000
> --- a/package/freeipmi/0002-ipmi-sensors-fix-header-guard-definitions.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From c3d1a3f5c550940577076ce2c4595b470ae963c3 Mon Sep 17 00:00:00 2001
> -From: Albert Chu <chu11@llnl.gov>
> -Date: Sun, 24 Mar 2024 13:11:55 -0700
> -Subject: [PATCH] ipmi-sensors: fix header guard definitions
> -
> -Signed-off-by: Albert Chu <chu11@llnl.gov>
> -[Waldemar: removed Changelog patching]
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -Upstream: https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=c3d1a3f5c550940577076ce2c4595b470ae963c3
> ----
> - ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h | 2 +-
> - ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h | 2 +-
> - ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h | 2 +-
> - 3 files changed, 10 insertions(+), 3 deletions(-)
> -
> -diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h b/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
> -index 0b11e61ce..4ae808cda 100644
> ---- a/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
> -+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s2600jf.h
> -@@ -17,7 +17,7 @@
> -  */
> - 
> - #ifndef IPMI_SENSORS_OEM_INTEL_S2600JF_H
> --#define IPMI_SENSORS_OEM_INTEL_H
> -+#define IPMI_SENSORS_OEM_INTEL_S2600JF_H
> - 
> - #include "ipmi-sensors.h"
> - 
> -diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h b/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
> -index 0607b125d..5c6410b7b 100644
> ---- a/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
> -+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s2600wp.h
> -@@ -17,7 +17,7 @@
> -  */
> - 
> - #ifndef IPMI_SENSORS_OEM_INTEL_S2600WP_H
> --#define IPMI_SENSORS_OEM_INTEL_H
> -+#define IPMI_SENSORS_OEM_INTEL_S2600WP_H
> - 
> - #include "ipmi-sensors.h"
> - 
> -diff --git a/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h b/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
> -index f4f3dc85b..204295bd8 100644
> ---- a/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
> -+++ b/ipmi-sensors/ipmi-sensors-oem-intel-s5500wb.h
> -@@ -17,7 +17,7 @@
> -  */
> - 
> - #ifndef IPMI_SENSORS_OEM_INTEL_S5500WB_H
> --#define IPMI_SENSORS_OEM_INTEL_H
> -+#define IPMI_SENSORS_OEM_INTEL_S5500WB_H
> - 
> - #include "ipmi-sensors.h"
> - 
> --- 
> -2.39.2
> -
> diff --git a/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch b/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
> deleted file mode 100644
> index 8bc44165a02d..000000000000
> --- a/package/freeipmi/0003-ipmi-sensors-add-missing-include.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 6ac6f816dbfc83d8cd4f4f163b0f8ff1062d883e Mon Sep 17 00:00:00 2001
> -From: Albert Chu <chu11@llnl.gov>
> -Date: Mon, 25 Mar 2024 13:57:45 -0700
> -Subject: [PATCH] ipmi-sensors: add missing include
> -
> -Signed-off-by: Albert Chu <chu11@llnl.gov>
> -[Waldemar: removed Changelog patching]
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -Upstream: https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?h=freeipmi-1-6-0-stable&id=6ac6f816dbfc83d8cd4f4f163b0f8ff1062d883e
> ----
> - ipmi-sensors/ipmi-sensors-oem-intel.c | 1 +
> - 1 files changed, 1 insertions(+)
> -
> -diff --git a/ipmi-sensors/ipmi-sensors-oem-intel.c b/ipmi-sensors/ipmi-sensors-oem-intel.c
> -index 5e0f3733a..3fc022e3d 100644
> ---- a/ipmi-sensors/ipmi-sensors-oem-intel.c
> -+++ b/ipmi-sensors/ipmi-sensors-oem-intel.c
> -@@ -34,6 +34,7 @@
> - #include "ipmi-sensors-oem-intel.h"
> - #include "ipmi-sensors-oem-intel-s5500wb.h"
> - #include "ipmi-sensors-oem-intel-s2600jf.h"
> -+#include "ipmi-sensors-oem-intel-s2600wp.h"
> - #include "ipmi-sensors-oem-intel-quanta-qssc-s4r.h"
> - #include "ipmi-sensors-oem-intel-node-manager.h"
> - 
> --- 
> -2.39.2
> -
> diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
> index 2f81d90c1d37..9d06be8cf939 100644
> --- a/package/freeipmi/freeipmi.hash
> +++ b/package/freeipmi/freeipmi.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  1a3dac5c76b7ccc4d4f86aa12b8ef9b212baef7489bf05e899b89abb7e14edb5  freeipmi-1.6.14.tar.gz
> +sha256  5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d  freeipmi-1.6.16.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
> diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
> index fbbfd536e465..0581b931b09d 100644
> --- a/package/freeipmi/freeipmi.mk
> +++ b/package/freeipmi/freeipmi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREEIPMI_VERSION = 1.6.14
> +FREEIPMI_VERSION = 1.6.16
>  FREEIPMI_SITE = $(BR2_GNU_MIRROR)/freeipmi
>  FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
>  FREEIPMI_LICENSE_FILES = \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
