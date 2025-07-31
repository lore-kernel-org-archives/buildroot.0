Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F700C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 19:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB2984580;
	Thu, 31 Jul 2025 19:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jsIOpi4amLO; Thu, 31 Jul 2025 19:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2903A84581
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2903A84581;
	Thu, 31 Jul 2025 19:12:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A77168
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 19:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 199B784579
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 19:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-BAEQIPO4Ru for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 19:12:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFE7F8457C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE7F8457C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFE7F8457C
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 19:12:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so5358875e9.3
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 12:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753989148; x=1754593948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JbRb6jGD/I1o4WWZhyAyqtpUZRuS9bnCRjAVHnRZySI=;
 b=nfMQcYSqhub2mUid8K7KsjYf/o43hlW9le1rjJCvgbC1XJsq0wgPLw1q3iyM/jRkPW
 xujbN6+VTNJmL0TH+27NfbRQFooohn6om0YMpVGYyPRwK7nEu2Ca+Sczhf7jl/8C+60I
 tTYvz/MFYt42Uy1RcKsCNPQ2I/y+Aj7Z9bPtGbWSuT62QkQf7zJWnMU+V4CkXWqqRa8Y
 uH3L/pNA14VYu3o2/ZzU5C+9iDHKxdaLlPNDbeItOezRFPKyB3WjTGdzsouB8uyzV4dP
 rdubt3JQmNGAcdtMBVuujU6bjShrVMDAbX2ywVi5MahpTde4u8iRpMbU9EvMM/xqGnlF
 Ztug==
X-Gm-Message-State: AOJu0Yz+uYBG4UK2wPC+XIucPpu5JdVittiYHkQVv9p30I4t1YPpdlkp
 Qq7qOFMWvZrkM1c+xSLBsdbQeNEoqxVIQJrZSytOIzuaJCLEfWxyihze/RCDtrJTFvW1cJFSAkj
 KL2jWFrg=
X-Gm-Gg: ASbGncutXfFmpOp5T2yqA8wpIEVo8WztpQ+8ku4NhLvWnAiJn8+1rZjfJVqWMqK6XY+
 7yoEmjil8D4df3ZtaDy6dmlHYAd7ObVVbd/o9sVG09Eu5vWspa41hoZvWWgKw2xCNoPee4MF+bu
 VBHrAmMWAfQXvmRm3tWObOMTt99f+Tq3N6aR30PzAsoSQdhxR5MbLPJY51RS/e4y2cuduknKQIs
 za1v5Qw6AzjTtr0lWHUUuR4zWaHFjijta6Gih1ZdGi6O9i9k72KAwpEtgqYqHM/uf3Q6WO9QDHp
 EbQIYcqAKfn2ge/3T1eSbB1J8L//t7COK70WCovpjwtQilyr4B+4AoC1Bt1osiov14zU+9zP+Nj
 RhtOUNLSpOzapQQ==
X-Google-Smtp-Source: AGHT+IGJ4eG94UqDIb/DByrwOeqFwYp4YOu24Am3VPIXLY3uuBiegtHwYO40rXEj5VtJ4QcCYgI1Bg==
X-Received: by 2002:a05:600c:138e:b0:456:1824:4808 with SMTP id
 5b1f17b1804b1-45892bdf9admr71145855e9.32.1753989147910; 
 Thu, 31 Jul 2025 12:12:27 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458a7dd8cdesm13765335e9.19.2025.07.31.12.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 12:12:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 31 Jul 2025 21:12:26 +0200
Message-ID: <20250731191226.1599504-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753989148; x=1754593948; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JbRb6jGD/I1o4WWZhyAyqtpUZRuS9bnCRjAVHnRZySI=;
 b=c0cYQaVuy1mmGPPEQxtKvgh30Tw3BCm93A8LcHXyP7oeoeN1i02MFRZJKWgkD+CF6+
 jwOG78mZID1wXVEbTqoiUyMAP8XOUAPXywmhsvCJAplImneajJlaiGJNvNWSJJ7X3sg1
 zRaJM89tYAnXnvYgOH/430gsxKE61Nv3npYbHbAhaUjMme45CfKLGGHRmdFJ9LvtefS8
 +P01aWL960X2uoeiqnlzSCg8GjwmIfVGblIMeeHu+776zL138W68LUu4ktEXHBrqORFm
 uygap3xOoFL6kTZ35cn/y5ERiEb+RWWs09XsbAfmCI+XaF4YY1zALOlBmZaOl3iq45W/
 fm6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=c0cYQaVu
Subject: [Buildroot] [PATCH] package/libxml2: add patch for CVE-2025-6170
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

This fixes the following vulnerability:

- CVE-2025-6170

    A flaw was found in the interactive shell of the xmllint command-line
    tool, used for parsing XML files. When a user inputs an overly long
    command, the program does not check the input size properly, which can
    cause it to crash. This issue might allow attackers to run harmful
    code in rare configurations without modern protections.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-6170
  - https://gitlab.gnome.org/GNOME/libxml2/-/commit/c340e419505cf4bf1d9ed7019a87cc00ec200434

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...uffer-overflows-of-interactive-shell.patch | 103 ++++++++++++++++++
 package/libxml2/libxml2.mk                    |   3 +
 2 files changed, 106 insertions(+)
 create mode 100644 package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch

diff --git a/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch b/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch
new file mode 100644
index 0000000000..7d1314c5f9
--- /dev/null
+++ b/package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch
@@ -0,0 +1,103 @@
+From: Michael Mann <mmann78@netscape.net>
+Date: Fri, 20 Jun 2025 23:05:00 -0400
+Subject: Fix potential buffer overflows of interactive shell
+
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/5e9ec5c107d3f5b5179c3dbc19df43df041cd55b
+Upstream: https://sources.debian.org/src/libxml2/2.12.7+dfsg+really2.9.14-2.1/debian/patches/CVE-2025-6170.patch/
+CVE: CVE-2025-6170
+[thomas: Originally backported for v2.9.14 re-applied on v2.13.8]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ debugXML.c                       | 15 ++++++++++-----
+ result/scripts/long_command      |  8 ++++++++
+ test/scripts/long_command.script |  6 ++++++
+ test/scripts/long_command.xml    |  1 +
+ 4 files changed, 25 insertions(+), 5 deletions(-)
+ create mode 100644 result/scripts/long_command
+ create mode 100644 test/scripts/long_command.script
+ create mode 100644 test/scripts/long_command.xml
+
+diff --git a/debugXML.c b/debugXML.c
+index ed56b0f8..452b9573 100644
+--- a/debugXML.c
++++ b/debugXML.c
+@@ -1033,6 +1033,10 @@ xmlCtxtDumpOneNode(xmlDebugCtxtPtr ctxt, xmlNodePtr node)
+     xmlCtxtGenericNodeCheck(ctxt, node);
+ }
+ 
++#define MAX_PROMPT_SIZE     500
++#define MAX_ARG_SIZE        400
++#define MAX_COMMAND_SIZE    100
++
+ /**
+  * xmlCtxtDumpNode:
+  * @output:  the FILE * for the output
+@@ -2795,10 +2799,10 @@ void
+ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
+          FILE * output)
+ {
+-    char prompt[500] = "/ > ";
++    char prompt[MAX_PROMPT_SIZE] = "/ > ";
+     char *cmdline = NULL, *cur;
+-    char command[100];
+-    char arg[400];
++    char command[MAX_COMMAND_SIZE];
++    char arg[MAX_ARG_SIZE];
+     int i;
+     xmlShellCtxtPtr ctxt;
+     xmlXPathObjectPtr list;
+@@ -2856,7 +2860,8 @@ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
+             cur++;
+         i = 0;
+         while ((*cur != ' ') && (*cur != '\t') &&
+-               (*cur != '\n') && (*cur != '\r')) {
++               (*cur != '\n') && (*cur != '\r') &&
++               (i < (MAX_COMMAND_SIZE - 1))) {
+             if (*cur == 0)
+                 break;
+             command[i++] = *cur++;
+@@ -2871,7 +2876,7 @@ xmlShell(xmlDocPtr doc, const char *filename, xmlShellReadlineFunc input,
+         while ((*cur == ' ') || (*cur == '\t'))
+             cur++;
+         i = 0;
+-        while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
++        while ((*cur != '\n') && (*cur != '\r') && (*cur != 0) && (i < (MAX_ARG_SIZE-1))) {
+             if (*cur == 0)
+                 break;
+             arg[i++] = *cur++;
+diff --git a/result/scripts/long_command b/result/scripts/long_command
+new file mode 100644
+index 00000000..e6f00708
+--- /dev/null
++++ b/result/scripts/long_command
+@@ -0,0 +1,8 @@
++/ > b > b > Object is a Node Set :
++Set contains 1 nodes:
++1  ELEMENT a:c
++b > Unknown command This_is_a_really_long_command_string_designed_to_test_the_limits_of_the_memory_that_stores_the_comm
++b > b > Unknown command ess_currents_of_time_and_existence
++b > <?xml version="1.0"?>
++<a xmlns:a="bar"><b xmlns:a="foo">Navigating_the_labyrinthine_corridors_of_human_cognition_one_often_encounters_the_perplexing_paradox_that_the_more_we_delve_into_the_intricate_dance_of_neural_pathways_and_synaptic_firings_the_further_we_seem_to_stray_from_a_truly_holistic_understanding_of_consciousness_a_phenomenon_that_remains_as_elusive_as_a_moonbeam_caught_in_a_spiderweb_yet_undeniably_shapes_every_fleeting_thought_every_prof</b></a>
++b > 
+\ No newline at end of file
+diff --git a/test/scripts/long_command.script b/test/scripts/long_command.script
+new file mode 100644
+index 00000000..00f6df09
+--- /dev/null
++++ b/test/scripts/long_command.script
+@@ -0,0 +1,6 @@
++cd a/b
++set <a:c/>
++xpath //*[namespace-uri()="foo"]
++This_is_a_really_long_command_string_designed_to_test_the_limits_of_the_memory_that_stores_the_command_please_dont_crash foo
++set Navigating_the_labyrinthine_corridors_of_human_cognition_one_often_encounters_the_perplexing_paradox_that_the_more_we_delve_into_the_intricate_dance_of_neural_pathways_and_synaptic_firings_the_further_we_seem_to_stray_from_a_truly_holistic_understanding_of_consciousness_a_phenomenon_that_remains_as_elusive_as_a_moonbeam_caught_in_a_spiderweb_yet_undeniably_shapes_every_fleeting_thought_every_profound_emotion_and_every_grand_aspiration_that_propels_our_species_ever_onward_through_the_relentless_currents_of_time_and_existence
++save -
+diff --git a/test/scripts/long_command.xml b/test/scripts/long_command.xml
+new file mode 100644
+index 00000000..1ba44016
+--- /dev/null
++++ b/test/scripts/long_command.xml
+@@ -0,0 +1 @@
++<a xmlns:a="bar"><b xmlns:a="foo"/></a>
+-- 
+2.50.1
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 0149ba1f0a..36cdd5a63d 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -24,6 +24,9 @@ LIBXML2_IGNORE_CVES += CVE-2025-49794 CVE-2025-49796
 #0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
 LIBXML2_IGNORE_CVES += CVE-2025-49795
 
+# 0004-fix-potential-buffer-overflows-of-interactive-shell.patch
+LIBXML2_IGNORE_CVES += CVE-2025-6170
+
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
