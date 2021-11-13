Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60475C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:31:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C3556103A
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C3556103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB1CD40219;
	Sat, 13 Nov 2021 13:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cc2MKiAvW1I4; Sat, 13 Nov 2021 13:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D515940245;
	Sat, 13 Nov 2021 13:31:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51E821BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E33840204
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYuOhnva_bix for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B57A40017
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d27so20646957wrb.6
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TenbM1jUc8YnzMptAljRjlIwvhpMMQ36P2a2ybOaN4=;
 b=X7cIjTnP1x4ziR3o2D+AGO4PO/KxvX6N8Jkv5so5phfCzXOxZ7WBrYOM0PTkchK7Qr
 //7lyIMAplVtonUSIRcoeEQyzHnGr4Ve31YFIxW9HytWzcyVJbGXCE8ZEJniwXWdiQbr
 zci6sOjl0cReGjHZBZudnrWyXoOHi+atd0WrU+t3fkA1eUvd5/TSBYtlVLMhxlua4SN4
 cwl6pN1yqPZqbY9mp0kdgbf0576o6g+rHdM8te6COCBjr71fpPn6CDR/lmh08XQ0+jfv
 vwjkNdIZPCdePTXLvU5uVv5rSo1mOZMkr2Jku/fltd9X7xRdafc6XoJPBXH9/Cc+/+35
 WgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4TenbM1jUc8YnzMptAljRjlIwvhpMMQ36P2a2ybOaN4=;
 b=iwd2WE45Ql3cHr65wegd9Z3wPK3ywKhHT2XH9knikqC+sw1hmJALchk8XSV8qVElWJ
 cXAFlMxq6BG6auTxw+TbIBTmg8MLmnD6jwCvBx8AE3ZjecDHeCOst9h5FRr+uVTN0yhb
 hkK/hJhogmpFLjXKX13/+0XnU3/HEOEON4aKgNNBlzR+8dZJS7C0Q1SjP/bd/SVz4aSl
 TWBT7w9sBD0CTp/hIAsxzN7YdrLnKeyZpZubhmdbtvoQdTWP4J2GM6kFrcO4efLJv6wl
 eLh+MtyptRwFGYhH6ZUIkYmDmT2+DzSP3TwmH2gQ5MNXnarIuw++SyN1qtOzSAyxwaxN
 oapA==
X-Gm-Message-State: AOAM531g9Zz81743Sq1IXoRPLDI6x6dVLVhhwNfIy8MFo33Y7D1J9jST
 pTJ+UMVnbCcgAo0RqsaDt1mk+dx5XmBj/A==
X-Google-Smtp-Source: ABdhPJxQs0+i/4fEX5X1hHZ38fz4Dcw5KCmoOjHq1Nja2lRqeiUwnZ4QExXOUK/vLx9ZBVFoObpjJQ==
X-Received: by 2002:a5d:6244:: with SMTP id m4mr28170038wrv.186.1636810119456; 
 Sat, 13 Nov 2021 05:28:39 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:39 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:27 +0100
Message-Id: <dac8f92abae72426b9b1c19f1a3ee5e173d101e3.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 16/16 v2] Makefile: introduce show-vars,
 a json-formatted equivalent to printvars
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current printvars output suffers from a serious design flaw:
variables are not delimited, which makes it impossible to reliably
retrieve the value of variables; only variables that are known to
not contain a \n can be relatively safely extracted.

However, in some cases, it is important to be able to retrieve the
multi-line value of a variable, notably the CMDS or the hooks. One
such use-case (to follow in an unscheduled future) would be to hash
the variables that make up a package "configuration", and cache or
extract the files for that package to speed up the build.

Modeled after printvars and show-info, we introduce show-vars (what a
lack of imagination here) that outputs a json dictionary which keys are
the variable names, and for each variable, provides the raw and expanded
values.

Unlike printvars, we do not provide a way to get either the raw or
expanded value; both are systematically printed; a user will get just
the one is needs. Additionally, strings in JSON are quoted, so there is
no need to provide a way to quote variables; that would not make sense.

Note: for printvars, we require that the user provides an explicit
pattern to filter variables on. This is historical (see fd5bd12379dc,
Makefile: printvars: don't print anything when VARS is not set). The
underlying reasoning was that printvars is too "raw", and variables are
not well delimited, so printvars was mostly used to extract a few values
here and there, from scripts, or to quickly inspect a specific package's
variables during debugging.

But show-vars, although technically plain-text, being JSON, is not very
human-readable, and is mostly aimed at tools that will parse it with a
real JSON parser, and which will want to have a complete view of a lot
of variables at once. As such, and contrary to printvars, it makes sense
to report on all variables by default, unless the user explicitly
requested a subset.

As a final note: a lot of our variables only make sense in the context
of an actual make target. For example, a variable of package foo, that
contains $(@D)/bar, would expand to .../build/FOO-VERSION/bar. This is
because our CMDS and hooks are expanded as the recipe of a stamp file
that lies in the package build directory.

But for show-info, this falls flat on its face: it is not the stamp file
of a package, so there is no package directory, and show-info itself has
not directory part, so $(@D) expands to '.' (dot).

Additionally, some variables may contain calls to $(shell) (e.g. to call
pkg-config), and this also does not work with show-info.

These two issues make it impossible to emit the correct expanded value
of variables. To be noted: printvars has the exact same limitations for
the exact same reasons.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6f6bb72de3..0a24f7c5be 100644
--- a/Makefile
+++ b/Makefile
@@ -141,7 +141,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig update-defconfig printvars
+	savedefconfig update-defconfig printvars show-vars
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -1058,6 +1058,7 @@ endif
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
 # only the variables matching the make pattern passed in VARS are
 # displayed.
+# show-vars does the same, but as a JSON dictionnary.
 .PHONY: printvars
 printvars:
 	@:
@@ -1070,6 +1071,22 @@ printvars:
 			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
 # ')))) # Syntax colouring...
 
+.PHONY: show-vars
+show-vars: VARS?=%
+show-vars:
+	@:
+	$(info $(call clean-json, { \
+			$(foreach V, \
+				$(sort $(filter $(VARS),$(.VARIABLES))), \
+				$(if $(filter-out environment% default automatic, $(origin $V)), \
+					"$V": { \
+						"expanded": $(call mk-json-str,$($V))$(comma) \
+						"raw": $(call mk-json-str,$(value $V)) \
+					}$(comma) \
+				) \
+			) \
+	} ))
+
 .PHONY: clean
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
@@ -1162,6 +1179,8 @@ help:
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
 	@echo '  missing-cpe            - generate XML snippets for missing CPE identifiers'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
+	@echo '  show-vars              - dump all internal variables as a JSON blurb; use VARS=...'
+	@echo '                             to limit the list to variables names matching that pattern'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
