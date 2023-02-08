Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0B8C636D4
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92C582029;
	Wed,  8 Feb 2023 16:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C92C582029
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxnPzmv7UGCC; Wed,  8 Feb 2023 16:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C06C582020;
	Wed,  8 Feb 2023 16:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C06C582020
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7DE51BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B060560D63
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B060560D63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3eLVyxcVifl for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:20:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE24060AE4
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE24060AE4
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:20:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso1889879wms.4
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jVKXnZ28fgN8NnAt4nuIDxx4bGcNrg+tf36iUVvUejg=;
 b=xMPw+sqN1Qt8sSmiLQynOCLczJXflzwlQVyCDoWas7ofBVK3MuQr2D2+BIGgXvpdU4
 cBDIvE1B3VKDtYsGEdTRSy4QyqwXOIRBJjpnHPEG35IM4FecdZ0wq4BJfznCEK9TZf54
 H8y2O4siaEJfUh/90TPVELeI9Q7nSXboV2TyNUW/SmAeIeblu7j6+nXIsCTHLBJGPgFQ
 F5PidcIa/NWW1wtPoP57bqWtVLPdSI2qKzJ9DkqIdNcBQauwbL6EmRNWKeZjE0sKNXFX
 LLZxLQeKNjEw+o2sAKQ75PFwn6b5voeuEQZohOypvJZyw5gBTFeXuvolhGFWjBExgmLt
 tmfQ==
X-Gm-Message-State: AO0yUKU9R7lcSIeAnslXl13hJRRPW79hq4dxmVrlZ2lbRb3Y423hvBJ1
 Zm7//C2VEKm6qEy6a/WGxKE4GoGADL5Z/g==
X-Google-Smtp-Source: AK7set9vaG1GBmSJ9d3EJoU/qf/aH788e5YBemUQwo/3IzdATcxaCuvH//CivtHGT+Cfsu6MNUB/MQ==
X-Received: by 2002:a05:600c:3411:b0:3dc:545f:e9ce with SMTP id
 y17-20020a05600c341100b003dc545fe9cemr7670836wmp.24.1675873218841; 
 Wed, 08 Feb 2023 08:20:18 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c169400b003dc54eef495sm2167672wmn.24.2023.02.08.08.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 08:20:18 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 17:20:16 +0100
Message-Id: <6ab1ebdce8bb87f50f68bf1c57ecf988345c2330.1675873210.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675873210.git.yann.morin.1998@free.fr>
References: <cover.1675873210.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVKXnZ28fgN8NnAt4nuIDxx4bGcNrg+tf36iUVvUejg=;
 b=Y0LyLqa5icgDAO3ptz7AogK76fSbwO5qp9fkjcPinQL0X7LPzak+aQEHaiuRFbvM3p
 Q8J5z+OVnhFSMu9YcyW2jZUmLQGJgy3fAeQTvGNjJUWpdwULyELcdag+NeFa4CYc78yt
 trO9kQUse5pqRJ0jK8R2ekgxaeV9opOboVlTV2EB6lo1+6fCMN9P5pfCbbAIgguYpD8/
 t0d5gYgf1xHkqTKlBChTwpz0/3lF+Mij6j39eqy0Q7fVcJrNluz0HR5XeIGMdzpNmZso
 B4TLi24CC5vjiZ1gx8kBvOLIugIuXonw1SPswRa+3IR/ywUUSTgOcxsswLFWFaBM82qe
 PmCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y0LyLqa5
Subject: [Buildroot] [PATCH 3/3] package/dmalloc: don't use SSP
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dmalloc directly calls into $(LD) to generate a shared library our of
the static one.

To detet what command it should run, ./configure tries various
incantations of ld with various command line options until one does not
fail. One of those is (basically):
    $(LD) --whole-archive -o contest.o.t contest.a

This makes ./configure conclude what the command to link a shared
library in the Makefile should be, and thus stores that in a variable:
    shlinkargs='$(LD) --whole-archive -o $@'

... which is then AC_SUBST()ed into Makefile.in with a rule like:

    $(SHLIB): $(LIBRARY)
        @shlinkargs@ $(LIRARY)

which once substiuted, gives:

    $(SHLIB): $(LIBRARY)
        $(LD) --whole-archive -o $@ $(LIRARY)

However, when SSP is enabled, the __stack_chk_fail_local and co symbols
are provided by additional libraries or object files, and that is the
responsibility of gcc to pass those when linking. But as dmalloc
directly calls ld, it misses those.

Changing dmalloc to use $(CC) is not trivial, however.

First, we can't pass LD=$(TARGET_CC), otherwise the whole package
explodes [0]: indeed --whole-archive is unknown to gcc, so it must be
passed as -Wl,--whole archive instead. So we'd need to add a new test
that uses $(CC), like so:
    $(CC) -Wl,--whole-archive -o contest.o.t contest.a

However, in that case, gcc does pass additional libs/objs (like, for
eample, the SSP ones) to the linker. But then those are also inc;luded
in the whole-archive section. This causes the linker to add all the
symbols form those libs/objs, even those not needed for SSP; on some
archs, like PPC, that may require floating point symbols (__muldiv3 et
al.) which are in another library, and thus the linked can't find them.

The proper solution wouild be to add -Wl,--no-whole-archive, but that
would have to be added _after_ the library we want to link, i.e.e we
should be able to evntually run:

    $(CC) -Wl,--whole-archive -o $@ $(LIRARY) -Wl,--no-whole-archive

That would require that we introduce a new variable that is added
_afgter_ the $(LIBRARY), e.g. @shlinkargs_post@ or so...

This is a bigger endeavour than we want to pursue...

Since dmalloc is a debugging utility, it is not supposed to go into
production builds, and during debugging, it would not be surprising that
it needs to poke around arrays to debug them.

So, we go the easier route: disable SSP altogether.

[0] with lots of nce colors, but that's not the point, is it?

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmalloc/dmalloc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 6b90f810b2..5bd6691725 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -14,6 +14,13 @@ DMALLOC_LICENSE_FILES = LICENSE.txt
 DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CFLAGS = $(TARGET_CFLAGS)
 
+# dmalloc uses $(LD) to link, and thus misses the object files or libs that
+# are needed to provide the __stack_chk_fail_local and co. symbols. Changing
+# to use $(CC) is really more complex that we'd like. Since dmalloc is
+# involved in debugging memory allocation, it is not expected to be a
+# production library, so we do not care that much that it has SSP.
+DMALLOC_CFLAGS += -fno-stack-protector
+
 ifeq ($(BR2_STATIC_LIBS),y)
 DMALLOC_CONF_OPTS += --disable-shlib
 else
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
