Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DAAC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9786581370;
	Wed, 22 May 2024 07:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDyw6AKh76qM; Wed, 22 May 2024 07:03:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A17181359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A17181359;
	Wed, 22 May 2024 07:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D84561C585B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2B5160851
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Evr76bCRugM5 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71FFE60872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71FFE60872
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71FFE60872
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:17 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-572a93890d1so10728461a12.3
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361395; x=1716966195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jKiNYT/2fEi0ORe09gfjLGCr9wdhiNnONIilSaVRxfM=;
 b=i6v/vaapzgjmmQgE4cJqJ5pyJ97PVNXXrkeVKDCry3qm2xPZ0MiLwWjgBUdPALG6Xg
 xwIFNRbJqo3SC8h8uX/ueXMh8DJO+mcLRXvZTsxcmr0J8LTnrZDYzeIh7oFEsI6tiknq
 Ehp8euwj9pRoL9Dw1n86Roe3w4cd9u6sEQ/YUhWl6/ULEQCBywnu7/dD0BZRSzVXGzQQ
 SqsLTiLpq3WL/1DIF9Y1VLTizTfZdV+MKyZnp/vEMkyxd2e+bkAzI/mG107ysQm+0PQx
 e7njdcaAKZo4d80CbQuSjkwH++FZvD4r3u81MkArGc5NrnopktuLCDh1ezUl2B8mS8bb
 /ylw==
X-Gm-Message-State: AOJu0YxDanbAEjr9/BgPBvYNTzhgnNnh/sXSBP77OvvKKfkvRAD0zPzu
 f3Z9ZlD8PusVlPbXYLiDNUd6rviorfrS2AQ/xlLD1EyqaG5yKqGjuAOPhVnXhurNgaWPE59RjHr
 uu6E=
X-Google-Smtp-Source: AGHT+IEbHGJqtN3dtH+ChTx2+db7OvxrCxV4IvNQwa4n1oLoNK2UT6d209b+Y8IZ38sUZCFOPE9a4A==
X-Received: by 2002:a50:8acb:0:b0:56e:23e3:bdc2 with SMTP id
 4fb4d7f45d1cf-578329fd42cmr995312a12.13.1716361394972; 
 Wed, 22 May 2024 00:03:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:37 +0200
Message-ID: <20240522070238.3282121-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361395; x=1716966195;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jKiNYT/2fEi0ORe09gfjLGCr9wdhiNnONIilSaVRxfM=;
 b=CnXOM2EzjBaGBfmkf5CSKz+ZSxiHRONVxRUEFjl0QTlCDH1NH5u1XlgP9gGWNVe0DO
 BcOhy9GChzmvsnlLjpZb0vEVtmFpfcU67mU7Dxestzw+mzslTZ/+tQV0pmuLSIElF9n3
 sY1fClR2/UFcO2/QiLHFs5CfGcDc+HEBEU7q4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=CnXOM2Ez
Subject: [Buildroot] [PATCH v2 18/18] support/scripts/apply-patches.sh: set
 the maximum fuzz factor to 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch was created as a fix to a problem that occurred during the
compilation of QEMU:

>>> qemu 8.1.1 Patching

Applying 0001-tests-fp-disable-fp-bench-build-by-default.patch using patch:
patching file tests/fp/meson.build
Hunk #1 succeeded at 138 with fuzz 2 (offset -502 lines).

Applying 0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch using patch:
patching file softmmu/qemu-seccomp.c

Applying 0004-tracing-install-trace-events-file-only-if-necessary.patch using patch:
patching file trace/meson.build

With the bump to version 8.1.1, the patch that disabled the compilation
of the fp-bench test does not report any errors, even though the patch
itself is no longer applicable. The only noticeable message is:

"Hunk #1 succeeded at 138 with fuzz 2 (offset -502 lines)."

As reported by the patch man page:

"With context diffs, and to a lesser extent with normal diffs, patch can
detect when the line numbers mentioned in the patch are incorrect, and
attempts to find the correct place to apply each hunk of the patch.
As a first guess, it takes the line number mentioned for the hunk, plus
or minus any offset used in applying the previous hunk. If that is not
the correct place, patch scans both forwards and backwards for a set of
lines matching the context given in the hunk. First patch looks for a
place where all lines of the context match. If no such place is found,
and it's a context diff, and the maximum fuzz factor is set to 1 or more,
then another scan takes place ignoring the first and last line of
context. If that fails, and the maximum fuzz factor is set to 2 or more,
the first two and last two lines of context are ignored, and another
scan is made. The default maximum fuzz factor is 2.

If the hunk is installed at a different line from the line number
specified in the diff, you are told the offset. A single large offset
may indicate that a hunk was installed in the wrong place. You are also
told if a fuzz factor was used to make the match, in which case you
should also be slightly suspicious."

By setting the maximum fuzz factor to 0, we avoid that patches which
cannot be applied are incorrectly reported as valid, with positive
side-effects on version bumps.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
 - Use fuzz factor 0 instead of 1.
 - Add patches from 1 to 17 to adapt package patches to be applicable
   with a fuzz factor of 0, ensuring that this patch does not cause
   regressions.

 support/scripts/apply-patches.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 6da83f6826e9..36afe489f2ef 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -114,7 +114,7 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | patch -F0 -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
