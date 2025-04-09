Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC96C369A2
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EB3E6090A;
	Wed,  9 Apr 2025 20:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evEdHQwLgiWT; Wed,  9 Apr 2025 20:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B09E61ACB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B09E61ACB;
	Wed,  9 Apr 2025 20:04:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C365220
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2440B6178C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wus5CYYhSjzz for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E4EB612C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E4EB612C7
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E4EB612C7
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso5213197f8f.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229037; x=1744833837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f9P9EB0lHe0J1DoDjI3HJtdEVgtP0+uu0wwRKlCtl3M=;
 b=LBjyiIjC8WYIdjt50qOid092X4N01xrq37a49mJb5z7Bi17ix2NGl9g36eQkENwEY6
 Ebc3EsIZZw/rPGvnaIjN52KuD303ZU29uypXaN2HPmpjVxSO6Pc5dC3NGiR54pvgchqM
 njb300pojw68E4FTU0YoxNMLQaW30uUNn2tyJsi1e4U8Y/uXAzpncobIhe7bwuQMda64
 zCFoKpAZce6ogKeIIeUF4XWJ1QJi8WgmbW41TG4z12PeQkQi6n86vkHiekH36ny4e1EH
 A817B9Sckb4uIbHoNOBzvmTCO8hcELZXumv/EgzeDRPmscxHOy5UHXTNynKB+apm3LPE
 AZcg==
X-Gm-Message-State: AOJu0YxQDaeDAvpLlo4zOPbUMD77VJ37eog/5f343FMod7MO2ug6oL75
 XQgPK0dYDDossvQQd9QVIRfpFTbHtCZz2czeo260hxmAFYWi6Ikp13vhSA==
X-Gm-Gg: ASbGncuK/9Qmu4Wd6gNah5pRg6ENRWRr80g/gaElvvihtFGvPfr85cjX9SsF7mqxbR1
 NPlrjpH5j9ze0KDMwum8hTPYVoea/7KnNIMbY8Y7mr6D7/EgarX3D6xP8BgIWAhvZcKmC6qe6H7
 gUlMrL82+S3S0vE8L4gf9fqPLDJXXYVHPXqNfX/9jU3DfHOjWi1gHhaO0DmiME00jIbusGF9Y+U
 bVxeGrvbm1Phe9K3kHzmO9yppfYtfrH0R5fZHy4dWuAv0k7GKbWyphcY1hgXnUcll84qtetY2I5
 HS/EVRHv1jkFkK7BeYfN/nol6xN6nY83173d0i6EuDPR4ExB/Sp7f/15WmIv3Q==
X-Google-Smtp-Source: AGHT+IHQSpB8y1HaedgHEmcad785PyEv/jH+n/JtHnUsaPGtDR/KMGbk5zsjp6S0bYiNbY9rfkAPzg==
X-Received: by 2002:a05:6000:1a8e:b0:38f:2ffc:1e99 with SMTP id
 ffacd0b85a97d-39d8f4f9ddamr47489f8f.49.1744229037267; 
 Wed, 09 Apr 2025 13:03:57 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:43 +0200
Message-ID: <574e9d889ce1afba12af992365310070f3e2cffe.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229037; x=1744833837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f9P9EB0lHe0J1DoDjI3HJtdEVgtP0+uu0wwRKlCtl3M=;
 b=aAu02kL57BAWhLKXoniqfScBPPN03UmvBDfRATHvwb4GMe8QagQoa7E5aWHPd0SYRf
 QeH+5vQqz8P/OTg4u2tPkZqwA7/b2HIu2zgk407R3jcl9zRnT9uWEL5PuRXEYJmQHLM/
 3/SMsG6Clk7+N99sThrC0Pr3pAeasw615P1ahEl4pZX+ACwbYb11sg0570tja1w3k7hW
 1kn+w3mIRdqFPnYl8g/julu53UZjR60I5UHhLjxW1c6iBB6sWYnwDQusYkiKiTIOCrGn
 MtEg84eqSkpQEBVayftOnhC6+k4HKo8Sku8Cmqd8VUtJgxqS8uEDwKrCcSdoALNFAQJI
 Qo6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aAu02kL5
Subject: [Buildroot] [PATCH 28/29 v2] support/download/git: use FOO_DL_OPTS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The manual states that FOO_DL_OPTS are valid for all the different
download backends, but that is not the case: at least the git backend
does not use them (it does not fail, it just ignores them).

Accept FOO_DL_OPTS in the git backend, and pass them to 'git fetch'.
There is no way that we can pass such options to submodules or lfs,
though.

Update the manual accordingly.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-generic.adoc | 4 +++-
 support/download/git                     | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index f0b0508f53..7e2e066c16 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -270,7 +270,9 @@ not and can not work as people would expect it should:
   server-side checking for user logins and passwords, or to use a proxy.
   All download methods valid for +LIBFOO_SITE_METHOD+ are supported;
   valid options depend on the download method (consult the man page
-  for the respective download utilities).
+  for the respective download utilities). For git, +FOO_DL_OPTS+ will
+  only be passed to `git fetch` and no other git command (esp. not to
+  `git lfs fetch` or `git submodule update`).
 
 * +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
   files that Buildroot should download. If an entry contains +://+
diff --git a/support/download/git b/support/download/git
index 8123bc3153..fdc00607cc 100755
--- a/support/download/git
+++ b/support/download/git
@@ -133,8 +133,8 @@ fi
 _git remote set-url origin "'${uri}'"
 
 printf "Fetching all references\n"
-_git fetch origin
-_git fetch origin -t -f
+_git fetch "${@}" origin
+_git fetch "${@}" origin -t -f
 
 # Try to get the special refs exposed by some forges (pull-requests for
 # github, changes for gerrit...). There is no easy way to know whether
@@ -143,7 +143,7 @@ _git fetch origin -t -f
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
+if ! _git fetch "${@}" origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
