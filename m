Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29F0CA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7768480F26;
	Thu,  7 Aug 2025 18:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCvI0MYD8LSx; Thu,  7 Aug 2025 18:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13E5B80F5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E5B80F5B;
	Thu,  7 Aug 2025 18:25:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54C7710A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 354FE6063E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 952_GRw2w-hd for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07CB160604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07CB160604
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07CB160604
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso9149205e9.0
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591088; x=1755195888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=85b8LZdyEfsgLvaws83q4KOBTSmPOJrP+KvOZhVSMrk=;
 b=uysr69eoXW6a3nC17Rl+fHxW4EBu/qhdRBHbNAKu5G2DPjrdg2PMtjeShoKWVvhPQi
 3f4Qs1WU8BaDgSoRqRpg/QObkrnvxnB0fkhfTQXdjaC3WXlLv/issDytGq8dgPZofBhf
 a6y9UYjjT2MoQuv/5MN94niBEuCU0JvELgxInSaT6Hq4XPx1Oligh7N56PfPUYav/OgC
 ypLJqVLqhKiOOBxa1tg6d/Xj+lZ+AbedNRzaaStcLNUxqntmlMpijIPZEN3EaAocm9Lc
 23IzkFwHfcW+dGImTy28UzXRc2DXH5ycnDoINGFeXl9/nrF4JCfsGEOaqD1lPBrOUE7D
 dT3Q==
X-Gm-Message-State: AOJu0YxEv8m1NjZPJIuHBI0bIUqs8vrRHLjkOtn1jaPPrFf7v94CvqVr
 Herym/8Rcuvv7iBPxgiufHpczbQnH1UGqfVof2Xjbo2r+3SbyzP5bZxLBZu9pgxoEJvDldWeigh
 MPpg6
X-Gm-Gg: ASbGncsfZJo6TC9IObOZV4w8BLrnPSOFAbHaGbjPeCb4Tzt2evbwo9zTyI/LH5emQFY
 raFSBQ8zWNhNfRw0BEMn7EIlOuXQf3XJkVTrcyaKpiVzpA9TVNK9qMUwEvAh+lu5ikTinDddboU
 eDfS/0c0JYY/znxo4q3a5BE9BxhLEOnKmJeiIuGLUrTg9U+ST2Z8rRA5fef3LOuLphE0NunP9H0
 3CyO414xp2h5RWprASix0M3WcAsbA6+q0LDx0ceHMcC/7Pqs4aHhPA1asex5Fl+KeC8QxY+OLRP
 mSPtg7K9VN1HoyHXS0lptXL3VPyBkdUKD9z+pnSCX6ECxKHIwi7rB4bCOAFamH7/IWoZQ0jdpuw
 Iilf/q/ajizL2RGl5RXj1khuC
X-Google-Smtp-Source: AGHT+IGvYfhrlxGr77hgx5BJbrojz2KbkSmfou9bWBvpSdwkUEJcGc1vF0fH6dYRElTP2HCyeoM4PA==
X-Received: by 2002:a5d:5d86:0:b0:3b7:942c:5450 with SMTP id
 ffacd0b85a97d-3b90092cc3amr201059f8f.9.1754591088049; 
 Thu, 07 Aug 2025 11:24:48 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c453aeasm28630501f8f.40.2025.08.07.11.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:47 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:47 +0200
Message-ID: <20250807182447.726375-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731191226.1599504-1-thomas.perale@mind.be>
References: <20250731191226.1599504-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591088; x=1755195888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=85b8LZdyEfsgLvaws83q4KOBTSmPOJrP+KvOZhVSMrk=;
 b=aVjbJKDGlH0aradi6RZY1dOO+0qXre6Xn86NVrmQLygyAIHxBZaK7n6B6NMUXikOTw
 RIf1UifEOBqn6ovGjqZxjflPNqA3msIGbZcy5aFL6XoejcoGAbe75IkEbCoyZhn17kiS
 +A197zzIlQZKVocVN6CQ/LAeFWupjCg67+gmv4VbZTefvQH5jieMi0VOFs1zw/XjGXOb
 DeiVYv/QOTj5QVJImTUh5sMvi8TQrggKP/kDWCN+CaybOrMkjl+Sk5QUJCAvyYhXE1Bq
 E36SaDNLYjt8W43gUlnYlGIztcTat3MKC1w1VUHwX8d7uZ74R74NEAqMeNPxQTYf5aeh
 k73g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aVjbJKDG
Subject: Re: [Buildroot] [PATCH] package/libxml2: add patch for CVE-2025-6170
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
> This fixes the following vulnerability:
> 
> - CVE-2025-6170
> 
>     A flaw was found in the interactive shell of the xmllint command-line
>     tool, used for parsing XML files. When a user inputs an overly long
>     command, the program does not check the input size properly, which can
>     cause it to crash. This issue might allow attackers to run harmful
>     code in rare configurations without modern protections.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-6170
>   - https://gitlab.gnome.org/GNOME/libxml2/-/commit/c340e419505cf4bf1d9ed7019a87cc00ec200434
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...uffer-overflows-of-interactive-shell.patch | 103 ++++++++++++++++++
>  package/libxml2/libxml2.mk                    |   3 +
>  2 files changed, 106 insertions(+)
>  create mode 100644 package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch
> 
> diff --git a/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch b/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch
> new file mode 100644
> index 0000000000..7d1314c5f9
> --- /dev/null
> +++ b/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch
> @@ -0,0 +1,103 @@
> +From: Michael Mann <mmann78@netscape.net>
> +Date: Fri, 20 Jun 2025 23:05:00 -0400
> +Subject: Fix potential buffer overflows of interactive shell
> +
> +Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/5e9ec5c107d3f5b5179c3dbc19df43df041cd55b
> +Upstream: https://sources.debian.org/src/libxml2/2.12.7+dfsg+really2.9.14-2.1/debian/patches/CVE-2025-6170.patch/
> +CVE: CVE-2025-6170
> +[thomas: Originally backported for v2.9.14 re-applied on v2.13.8]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + debugXML.c                       | 15 ++++++++++-----
> + result/scripts/long_command      |  8 ++++++++
> + test/scripts/long_command.script |  6 ++++++
> + test/scripts/long_command.xml    |  1 +
> + 4 files changed, 25 insertions(+), 5 deletions(-)
> + create mode 100644 result/scripts/long_command
> + create mode 100644 test/scripts/long_command.script
> + create mode 100644 test/scripts/long_command.xml
> +
> +diff --git a/debugXML.c b/debugXML.c
> +index ed56b0f8..452b9573 100644
> +--- a/debugXML.c
> ++++ b/debugXML.c
> +@@ -1033,6 +1033,10 @@ xmlCtxtDumpOneNode(xmlDebugCtxtPtr ctxt, xmlNodePtr node)
> +     xmlCtxtGenericNodeCheck(ctxt, node);
> + }
> + 
> ++#define MAX_PROMPT_SIZE     500
> ++#define MAX_ARG_SIZE        400
> ++#define MAX_COMMAND_SIZE    100
> ++
> + /**
> +  * xmlCtxtDumpNode:
> +  * @output:  the FILE * for the output
> +@@ -2795,10 +2799,10 @@ void
> + xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
> +          FILE * output)
> + {
> +-    char prompt[500] = "/ > ";
> ++    char prompt[MAX_PROMPT_SIZE] = "/ > ";
> +     char *cmdline = NULL, *cur;
> +-    char command[100];
> +-    char arg[400];
> ++    char command[MAX_COMMAND_SIZE];
> ++    char arg[MAX_ARG_SIZE];
> +     int i;
> +     xmlShellCtxtPtr ctxt;
> +     xmlXPathObjectPtr list;
> +@@ -2856,7 +2860,8 @@ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
> +             cur++;
> +         i = 0;
> +         while ((*cur != ' ') && (*cur != '\t') &&
> +-               (*cur != '\n') && (*cur != '\r')) {
> ++               (*cur != '\n') && (*cur != '\r') &&
> ++               (i < (MAX_COMMAND_SIZE - 1))) {
> +             if (*cur == 0)
> +                 break;
> +             command[i++] = *cur++;
> +@@ -2871,7 +2876,7 @@ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
> +         while ((*cur == ' ') || (*cur == '\t'))
> +             cur++;
> +         i = 0;
> +-        while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
> ++        while ((*cur != '\n') && (*cur != '\r') && (*cur != 0) && (i < (MAX_ARG_SIZE-1))) {
> +             if (*cur == 0)
> +                 break;
> +             arg[i++] = *cur++;
> +diff --git a/result/scripts/long_command b/result/scripts/long_command
> +new file mode 100644
> +index 00000000..e6f00708
> +--- /dev/null
> ++++ b/result/scripts/long_command
> +@@ -0,0 +1,8 @@
> ++/ > b > b > Object is a Node Set :
> ++Set contains 1 nodes:
> ++1  ELEMENT a:c
> ++b > Unknown command This_is_a_really_long_command_string_designed_to_test_the_limits_of_the_memory_that_stores_the_comm
> ++b > b > Unknown command ess_currents_of_time_and_existence
> ++b > <?xml version="1.0"?>
> ++<a xmlns:a="bar"><b xmlns:a="foo">Navigating_the_labyrinthine_corridors_of_human_cognition_one_often_encounters_the_perplexing_paradox_that_the_more_we_delve_into_the_intricate_dance_of_neural_pathways_and_synaptic_firings_the_further_we_seem_to_stray_from_a_truly_holistic_understanding_of_consciousness_a_phenomenon_that_remains_as_elusive_as_a_moonbeam_caught_in_a_spiderweb_yet_undeniably_shapes_every_fleeting_thought_every_prof</b></a>
> ++b > 
> +\ No newline at end of file
> +diff --git a/test/scripts/long_command.script b/test/scripts/long_command.script
> +new file mode 100644
> +index 00000000..00f6df09
> +--- /dev/null
> ++++ b/test/scripts/long_command.script
> +@@ -0,0 +1,6 @@
> ++cd a/b
> ++set <a:c/>
> ++xpath //*[namespace-uri()="foo"]
> ++This_is_a_really_long_command_string_designed_to_test_the_limits_of_the_memory_that_stores_the_command_please_dont_crash foo
> ++set Navigating_the_labyrinthine_corridors_of_human_cognition_one_often_encounters_the_perplexing_paradox_that_the_more_we_delve_into_the_intricate_dance_of_neural_pathways_and_synaptic_firings_the_further_we_seem_to_stray_from_a_truly_holistic_understanding_of_consciousness_a_phenomenon_that_remains_as_elusive_as_a_moonbeam_caught_in_a_spiderweb_yet_undeniably_shapes_every_fleeting_thought_every_profound_emotion_and_every_grand_aspiration_that_propels_our_species_ever_onward_through_the_relentless_currents_of_time_and_existence
> ++save -
> +diff --git a/test/scripts/long_command.xml b/test/scripts/long_command.xml
> +new file mode 100644
> +index 00000000..1ba44016
> +--- /dev/null
> ++++ b/test/scripts/long_command.xml
> +@@ -0,0 +1 @@
> ++<a xmlns:a="bar"><b xmlns:a="foo"/></a>
> +-- 
> +2.50.1
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 0149ba1f0a..36cdd5a63d 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -24,6 +24,9 @@ LIBXML2_IGNORE_CVES += CVE-2025-49794 CVE-2025-49796
>  #0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
>  LIBXML2_IGNORE_CVES += CVE-2025-49795
>  
> +# 0004-fix-potential-buffer-overflows-of-interactive-shell.patch
> +LIBXML2_IGNORE_CVES += CVE-2025-6170
> +
>  # relocation truncated to fit: R_68K_GOT16O
>  ifeq ($(BR2_m68k_cf),y)
>  LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
