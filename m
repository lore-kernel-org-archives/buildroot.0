Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F4FC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3FA0427D6;
	Fri,  7 Jun 2024 17:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzj3L3LYh2Qj; Fri,  7 Jun 2024 17:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2838042893
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2838042893;
	Fri,  7 Jun 2024 17:06:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFF591BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2292D84C8F
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXOSNp2cWYEu for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A88E84C2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A88E84C2F
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A88E84C2F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:08 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52b938587a4so2752283e87.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779966; x=1718384766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pADwqX2LnLnefKM1q89+/Fko7gnrTiXVxteue7Rwkmw=;
 b=Lm2pIh3aq+MVWaVDwLalLszvzhJyUMRO38xNXHRqbW4l4NYXx+IgSuof+Ba3ozVsLz
 kEYqXQSuxPcQcSYJ2Q31+8nnnVjItj5ZVpfFtdKzb468U0MKcsO+V4oje/0GpSgJfHsC
 QoqC7scHe6SZIW1bSGherQAfZI7drWCRBf8CDwirZIPZIF89vOnG/4KQ9wEImfepdcFv
 Xzxo2VN69wdhc33y8CMP2z1yMtato/4qHI6D33Zx5ASxjGVe0cXhTR8SvOjE+XNXNTA8
 B2JQxMg97oc7ZDphd/Hfv19XLowhAEEj08ZCv1atlTICcaveyTJPOdC+9YcmFlccEdE1
 +92w==
X-Gm-Message-State: AOJu0YxzJi3uq0DCyYOI8cRWGv5jWit7/2zLR5yeHEYd+PMOFQ3fEbqB
 o0KWMHKzdwAaJ0GSUySVHA7nPKQJBn4nLrugkL0Iqk2ApNEiVHIG1l6x2A==
X-Google-Smtp-Source: AGHT+IEgbAbJVxpN1rndqmjPU2Exu2WbMXg86U5yC1ITjq79fjl/44zucVaecqnbJ5LlMz+ZKF/w6Q==
X-Received: by 2002:ac2:5e23:0:b0:51c:3e9e:98ee with SMTP id
 2adb3069b0e04-52bb9f7acdbmr1698028e87.23.1717779965728; 
 Fri, 07 Jun 2024 10:06:05 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:05 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:49 +0200
Message-ID: <f369144af86b59489418db16357be5d931abc5d3.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779966; x=1718384766; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pADwqX2LnLnefKM1q89+/Fko7gnrTiXVxteue7Rwkmw=;
 b=ZVIzIEigQOJETdOGdnJt3ki7WNDPqYKtj3lmrhJBFwgDF1JAuHk91Vlv7PFBzSpUQp
 GLDGhbbDtw78D/SXl9psNgguMGWu5fCfDsGt6K18t+BPvMQ7MA89oFkH00qJ3mjwJD3W
 +ilHL4mF18/pGs1Bkb1dh4pfWde3glJUI5pE8+f/v+19iltPniaSyRR3m+PRHuLFzOOC
 aojnypaYxF/fz1Y3/s1RYNDdcrAdYEbG7Jh7CoZesyxfEqY51Ku0ZTfImxFc0cpT1CLv
 B3n+B9mPh4U5T1+pJubvBU9VM0n3DM5fs/QAbJ16u4d/VFABZL4GodAQjBL1VidHGZgW
 hi/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZVIzIEig
Subject: [Buildroot] [PATCH 08/20 v2] support/download: pass post-process
 options to post-process helper
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we have no explicit, dedicated way to pass information to the
download post-process scripts, even though we do already need to pass
the path to the manifest when it is not the default, which we do with an
environment variable.

We'll soon need to be able to pass additional information to
post-process scripts, like instructing cargo to not use a lock file when
the package is not locked.

Extend the dl-wrapper with a new option with an argument, where the
argument will be passed as-is to the post-process script.

We explicitly do not document this new variable, as it is expected to
only be used in our package infrastructures (although there is currently
exactly one package that will directly need it, and we hope to drop that
in the future).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk      | 1 +
 support/download/dl-wrapper | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8f1e6dc8e5..edeaa1348d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -186,6 +186,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 		$(call DOWNLOAD, \
 			$($(PKG)_MAIN_DOWNLOAD), \
 			$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)) \
+			$(patsubst %,-P '%',$($(PKG)_DOWNLOAD_POST_PROCESS_OPTS)) \
 		) \
 	)
 	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 713ce668ac..91e3fc092f 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -25,10 +25,10 @@ export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 main() {
     local OPT OPTARG
     local backend output large_file recurse quiet rc
-    local -a uris hfiles backend_opts
+    local -a uris hfiles backend_opts post_process_opts
 
     # Parse our options; anything after '--' is for the backend
-    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:" OPT; do
+    while getopts ":c:d:D:o:n:N:H:lrf:u:qp:P:" OPT; do
         case "${OPT}" in
         c)  cset="${OPTARG}";;
         d)  dl_dir="${OPTARG}";;
@@ -42,6 +42,7 @@ main() {
         f)  filename="${OPTARG}";;
         u)  uris+=( "${OPTARG}" );;
         p)  post_process="${OPTARG}";;
+        P)  post_process_opts+=( "${OPTARG}" );;
         q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
@@ -151,7 +152,8 @@ main() {
         if [ -n "${post_process}" ] ; then
             if ! "${OLDPWD}/support/download/${post_process}-post-process" \
                     -o "${tmpf}" \
-                    -n "${raw_base_name}"
+                    -n "${raw_base_name}" \
+                    "${post_process_opts[@]}"
             then
                 # cd back to keep path coherence
                 cd "${OLDPWD}"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
