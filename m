Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B1BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB17860F70
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB17860F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FD9340597;
	Sat, 13 Nov 2021 13:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3JIbfW6xugX; Sat, 13 Nov 2021 13:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9A344055E;
	Sat, 13 Nov 2021 13:30:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA561BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C9FF404FE
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HsAWLEBEihAm for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89F56404EB
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o29so10001510wms.2
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g3b5USvEeKwmYVxQ8dsZrypaXaYY1R38Fgx3+poaS1g=;
 b=dIJW72Ot9CMWlemmJ52305528zYzRuzvY4XuVCLbzf38DiOOFRXvDqppD4AF+jUt82
 lMtVNAD8VpxZ88I7ptFW6JbhqPqGep2XQb8gMGUe/SWQ+h4etyCBMoW6fJNFPsbRe3gI
 KJioysh1WhEweuF3vmwKNzfNVtteQKvxRZE+eZGb1ryHMUchVUXjmySmpbkT/8ShO0tZ
 QmQA5smgV8T9/DprTmra1/Ll4NVVq8Cuq2ZBc6pFwoiAhelrd/w4XwxDCEuZL0a6VgqI
 CNKa6FUQaXqsnYbHotIw3q367P/UZl710RpCzCz4o8BuG3sN+IzDlK3VeOEouseLF0+U
 0Usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g3b5USvEeKwmYVxQ8dsZrypaXaYY1R38Fgx3+poaS1g=;
 b=7sBQ0/H0xdXZj3QrjQvFk+jmRvEDxw7IbpqkKSZiOYgshLveBt7a/gg9I8cWSgvw0I
 kiKucfmiZylYaMVxKWZfUsQOUhJ3MaM60IM+/wRexdUDjwlieIbQxaN79vKQJlpmFUQU
 aHdczW7txEuBoPVIg36KTvyOtaKC0WG9cprONii86QjG1CBzpSY9C9jLsCIKEZDeGuqO
 ahNYcnaVAwXgD5MpID5jHwCuKS3XwHl1w1lL8dXobyfozsJZAoDavk/aPqh4Q/w6TJCW
 M516ZZYBj5fhDggINzUSaAKL3DMZ7DHv8NNX1CQZfuLFS7ZzAGedTK+4U0z8Ob/GjNFv
 7HFA==
X-Gm-Message-State: AOAM533LqpBW0vDsIyguE1hCkUlIGx/874U4O3MhbtbheV8UiKleXhVt
 sjMdv3VGqVJBO8qn1NCf/2MegO1WIB0NVQ==
X-Google-Smtp-Source: ABdhPJyt2RFsoJhp9WSpGgEZTutj2Tk3faJ4XdccltlCjAqREyIInIztUV+3sy+NhT7mhrZUw1fm3Q==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr41609211wmc.152.1636810115833; 
 Sat, 13 Nov 2021 05:28:35 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:35 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:22 +0100
Message-Id: <1ca8d1fd844e7e9ba59daa8270badda9fa93842c.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 11/16 v2] package/pkg-utils: introduce helper to
 properly json-escape a string
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

In quite a few places, we need to generate string that are proper JSON
values or keys.

However, JSON is very strict on what constitute a string, and most JSON
parsers (like jq or python3's json module) are very picky when parsing a
string; any deviation from the spec is immediately sanctioned by a hard
error (jq aborts, python3's json module raise an exception).

Introduce a macro that properly prepares a Makefile value into a valid
JSON string:

  - backslash '\' must be escaped;

  - double-quotes need to be escaped of course, as they are the string
    delimiter in JSON;

  - anything in the range [0x00..0x1F] must be escaped; in practice, we
    only ever need to escape \n, \t, and ESC (we could add more in the
    future if need be);

  - finally, we also escape the space, \x20, so that we can call
    $(strip) on a JSON blurb (like we do for example do build a
    comma-separated list, or when we sanitise the JSON) without losing
    multiple spaces where they make sense.

It would have been nice if we had been able to split the macro on
multiple lines, but spaces creep in from everywhere in that case, and
getting rid of them is getting quite nasty... We could introduce
intermediate macros, but meh...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 94e806963b..15e3e14e1b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -176,6 +176,17 @@ clean-json = $(strip \
 	))))) \
 )
 
+# mk-json-str -- escape and double-quote a string to make it a valid json string
+#  - escape \
+#  - escape "
+#  - escape \n
+#  - escape \t
+#  - escape ESC
+#  - escape SPACE (so that we can $(strip) a JSON blurb without squashing multiple spaces)
+# This unfortunately has to be on a single line...
+mk-json-str = "$(subst $(space),\u0020,$(subst $(escape),\u001b,$(subst $(tab),\t,$(subst $(sep),\n,$(subst ",\",$(subst \,\\,$(1)))))))"
+# )))))" # Syntax colouring
+
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 # rsync the contents of per-package directories
 # $1: space-separated list of packages to rsync from
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
