Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F19AC87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40E960F77;
	Sun,  3 Aug 2025 14:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JftQ6OqWtmwI; Sun,  3 Aug 2025 14:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B746100B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B746100B;
	Sun,  3 Aug 2025 14:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 295C11A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B2D280BBF
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8o30Ma3GPiQ3 for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E2A80BA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23E2A80BA0
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EDDF86DAA; Sun,  3 Aug 2025 14:50:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Aug 2025 16:46:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a28756bdee00e27561e8faba9e0ae5dcb24b9891
X-Git-Newrev: c68a14d73a03392268a8c4b42ecd8fa257d25f77
X-Patchwork-Hint: ignore
Message-Id: <20250803145030.1EDDF86DAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: add patch for
 CVE-2025-6170
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c68a14d73a03392268a8c4b42ecd8fa257d25f77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ial-buffer-overflows-of-interactive-shell.patch | 103 +++++++++++++++++++++
 package/libxml2/libxml2.mk                         |   3 +
 2 files changed, 106 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
