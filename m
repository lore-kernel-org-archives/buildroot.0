Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462FBC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08968419E1;
	Wed,  5 Jun 2024 17:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1towwWP1tSbJ; Wed,  5 Jun 2024 17:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D889B419E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D889B419E5;
	Wed,  5 Jun 2024 17:53:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31CDF1BF955
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65E3F845F3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgIRZgUXwYcH for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B209081EAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B209081EAF
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B209081EAF
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42133f8432aso764105e9.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610005; x=1718214805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=loyrOgi1NXT06ySMgUTcltiKp4XXFPTwT4711UuEzzY=;
 b=q2TMtxlUHl7RsVyJ+excQ/T6mL0DO/iYe4kNUCRI2uDvrtgDHhN6fHTQBXGaFLSmmQ
 BAgNRMHQQ8gIc4j8mnOrSGu65TpNY1Nuz2aRz6hTa30/9YJDaURGMGyEiYnO3uFI64fV
 s/wEpVmxxDuyUIFlM3o0BwZptAPJWOsgi/kNrMYmt++P6OotvDp+KOYELhfQBfiQ/W8x
 boF7ye/U1IDms5XPYr0hlm12qQWlFgjrxPW8O2VrEkxpAmcALRxqYgtGjqm8hBZKX5t0
 4H3f3plPTkH5ro1daZJSDktdhqW8ZzBUzlGRe71jeTE1rObXWHxSMTr8CRojpOtE6W82
 omGw==
X-Gm-Message-State: AOJu0Ywldpxi428nL+2T1hc4UnvkKVWEsBSGXEAY6sT9N+kfhzYQoXHk
 B9JQtR1Hxm/A3BxkAOY8vOxN5f0swVBDMvStlYw6b+TkWN6CbQL3o5WXnQ==
X-Google-Smtp-Source: AGHT+IFO7fe+DjyyGTgacxh1YP1EhcG/qliI9+TMvE3NPNr3FHbVnHKEZIwXg/2fSsf3hH+loqtFLQ==
X-Received: by 2002:a05:600c:a47:b0:421:28e6:990b with SMTP id
 5b1f17b1804b1-42156338a1emr26827645e9.25.1717610004746; 
 Wed, 05 Jun 2024 10:53:24 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:24 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:18 +0200
Message-ID: <87209d581666b712050ff8dde211a26bc005ed5b.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610005; x=1718214805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loyrOgi1NXT06ySMgUTcltiKp4XXFPTwT4711UuEzzY=;
 b=CBlQ/7GcYatPaiy88TQGKsRBYPl8Yg7pWB8w7yPZGeTwzbvWmLlO6QzFB9g5Jq3OZj
 EGsmbz/qAyRrk8Qux6E84iG6XHbDgpBjCj1wbzzv8pCQM7DigY514fCoW4I3KgUQ+rWj
 3Z/9y0hGytslUuntjIlqUaLrCA2JVThFb/IBAisKG2EAQObZahfEces99DJHYnttisvL
 fqxgAxm1MraWKIyNeUyVv6i6z0PLR9BzADW0jqpTJzMHx8jQa7ayD4+2JnByhz/Ul6XE
 uib0JVGRwzsK+Qfe9R4rgOSAWwDYz6DW6yYqGNnLJ9CnDCviFvCqKnIRZqVmBY9egWs2
 adow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CBlQ/7Gc
Subject: [Buildroot] [PATCH 06/10 v2] support/download/helpers: use
 appropriate TAR
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

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/helpers | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/download/helpers b/support/download/helpers
index 823e4d2f91..5ed9078287 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -59,7 +59,7 @@ mk_tar_gz() {
     LC_ALL=C sort <"${tmp}.list" >"${tmp}.sorted"
 
     # Create POSIX tarballs, since that's the format the most reproducible
-    tar cf - --transform="s#^\./#${base_dir}/#S" \
+    ${TAR} cf - --transform="s#^\./#${base_dir}/#S" \
              --numeric-owner --owner=0 --group=0 --mtime="${date}" \
              --format=posix --pax-option="${pax_options}" --mode='go=u,go-w' \
              -T "${tmp}.sorted" >"${tmp}.tar"
@@ -78,7 +78,7 @@ post_process_unpack() {
     local one_file
 
     mkdir "${dest}"
-    tar -C "${dest}" --strip-components=1 -xzf "${tarball}"
+    ${TAR} -C "${dest}" --strip-components=1 -xzf "${tarball}"
     one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |sed 's/\x0.*//')"
     touch -r "${one_file}" "${dest}.timestamp"
 }
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
