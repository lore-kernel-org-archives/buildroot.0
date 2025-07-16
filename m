Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C15BC83F1B
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F11344069A;
	Wed, 16 Jul 2025 18:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tUqpTqgjAuU; Wed, 16 Jul 2025 18:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0217140796
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0217140796;
	Wed, 16 Jul 2025 18:17:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70A2D11AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DAC64005F
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8d5zh6iG-AJg for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A396C40CC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A396C40CC2
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A396C40CC2
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:17:07 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b] (unknown
 [IPv6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 45006BFA69;
 Wed, 16 Jul 2025 20:17:05 +0200 (CEST)
Message-ID: <8c5d92c3-172b-405e-8711-1b561c7ae7b1@grenoble.cnrs.fr>
Date: Wed, 16 Jul 2025 20:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot development <buildroot@buildroot.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
References: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
Content-Language: en-US, fr
In-Reply-To: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1752689825;
 bh=8X0t5mLy+PlfhpfUT11Eh26tIkO4i8G8Has7hHCFG40=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RM2tRhYrM5A4jko20QCNU1XYu3S3JpQjj2TdwJoAlgRp2MWdmIoyQczY8qAbSKAnn
 GeQ+Bi8k7JrhtDwruiHElDBxDvcSBNKYmjSBxVmB9jll8DpMI9gqE2RmMDQRi9miuZ
 fsa0ZU3FeiOzBypfEiHFmSrLgtihVuAt5wf1yddF/nxP7kjiQCTb87vRJrFVoPftRa
 L4rDAkzeykwSI7fJejlRCA4P50tYyM3Hq5rc/BGK4uzNRZM4LDoDaNGIpJa+FFQN1v
 AwE9mwXHET8golt097IXs0Q10JMju0aMsOn+J3BVl2GaRFj+PhcZpxOL0cT1u5NH1+
 JErIGz/ryhQDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=RM2tRhYr
Subject: [Buildroot] [PATCH v2 1/4] support/kconfig/patches: make all
 patches quilt-friendly
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to support/kconfig/README.buildroot, the patches in
support/kconfig/patches/ are meant to be applied by quilt. However, two
of those patches are in git format, which makes quilt error out with:

    Applying patch patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
    can't find file to patch at input line 32
    [...]
    No file to patch.  Skipping patch.

Fix the format to make quilt happy.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 ...config-lxdialog-fix-check-with-GCC14.patch | 11 +++----
 ...onfig-mn-conf-handle-backspace-H-key.patch | 31 +++++++++----------
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch b/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
index 41081bb45d..edcc857190 100644
--- a/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
+++ b/support/kconfig/patches/22-kconfig-lxdialog-fix-check-with-GCC14.patch
@@ -25,10 +25,10 @@ Tested-by: Petr Vorel <petr.vorel@gmail.com>
  kconfig/lxdialog/check-lxdialog.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/kconfig/lxdialog/check-lxdialog.sh b/kconfig/lxdialog/check-lxdialog.sh
-index 16cd9a3186..27d6c30a57 100755
---- a/kconfig/lxdialog/check-lxdialog.sh
-+++ b/kconfig/lxdialog/check-lxdialog.sh
+Index: kconfig.new/lxdialog/check-lxdialog.sh
+===================================================================
+--- kconfig.orig/lxdialog/check-lxdialog.sh
++++ kconfig/lxdialog/check-lxdialog.sh
 @@ -48,7 +48,7 @@ trap "rm -f $tmp" 0 1 2 3 15
  check() {
          $cc -x c - -o $tmp 2>/dev/null <<'EOF'
@@ -38,6 +38,3 @@ index 16cd9a3186..27d6c30a57 100755
  EOF
  	if [ $? != 0 ]; then
  	    echo " *** Unable to find the ncurses libraries or the"       1>&2
--- 
-2.44.0
-
diff --git a/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch b/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
index 6e32115f70..f72f9f339b 100644
--- a/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
+++ b/support/kconfig/patches/23-kconfig-mn-conf-handle-backspace-H-key.patch
@@ -16,11 +16,11 @@ Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
  kconfig/nconf.gui.c         | 3 ++-
  3 files changed, 5 insertions(+), 3 deletions(-)
 
-diff --git a/kconfig/lxdialog/inputbox.c b/kconfig/lxdialog/inputbox.c
-index 611945611bf8..1dcfb288ee63 100644
---- a/kconfig/lxdialog/inputbox.c
-+++ b/kconfig/lxdialog/inputbox.c
-@@ -113,7 +113,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
+Index: kconfig/lxdialog/inputbox.c
+===================================================================
+--- kconfig.orig/lxdialog/inputbox.c
++++ kconfig/lxdialog/inputbox.c
+@@ -126,7 +126,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
  			case KEY_DOWN:
  				break;
  			case KEY_BACKSPACE:
@@ -30,10 +30,10 @@ index 611945611bf8..1dcfb288ee63 100644
  				if (pos) {
  					wattrset(dialog, dlg.inputbox.atr);
  					if (input_x == 0) {
-diff --git a/kconfig/nconf.c b/kconfig/nconf.c
-index a4670f4e825a..ac92c0ded6c5 100644
---- a/kconfig/nconf.c
-+++ b/kconfig/nconf.c
+Index: kconfig/nconf.c
+===================================================================
+--- kconfig.orig/nconf.c
++++ kconfig/nconf.c
 @@ -1048,7 +1048,7 @@ static int do_match(int key, struct match_state *state, int *ans)
  		state->match_direction = FIND_NEXT_MATCH_UP;
  		*ans = get_mext_match(state->pattern,
@@ -43,11 +43,11 @@ index a4670f4e825a..ac92c0ded6c5 100644
  		state->pattern[strlen(state->pattern)-1] = '\0';
  		adj_match_dir(&state->match_direction);
  	} else
-diff --git a/kconfig/nconf.gui.c b/kconfig/nconf.gui.c
-index 7be620a1fcdb..77f525a8617c 100644
---- a/kconfig/nconf.gui.c
-+++ b/kconfig/nconf.gui.c
-@@ -439,7 +439,8 @@ int dialog_inputbox(WINDOW *main_window,
+Index: kconfig/nconf.gui.c
+===================================================================
+--- kconfig.orig/nconf.gui.c
++++ kconfig/nconf.gui.c
+@@ -440,7 +440,8 @@ int dialog_inputbox(WINDOW *main_window,
  		case KEY_F(F_EXIT):
  		case KEY_F(F_BACK):
  			break;
@@ -57,6 +57,3 @@ index 7be620a1fcdb..77f525a8617c 100644
  		case KEY_BACKSPACE:
  			if (cursor_position > 0) {
  				memmove(&result[cursor_position-1],
--- 
-2.48.1
-
-- 
2.43.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
