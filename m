Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC45C0219E
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D0083A6E;
	Sat,  8 Feb 2025 14:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PU11MOYkoes5; Sat,  8 Feb 2025 14:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FD138402F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FD138402F;
	Sat,  8 Feb 2025 14:24:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1251F1B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81FE9607C0
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8uXACmwb2GZ for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FC23607CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC23607CA
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FC23607CA
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38dc73cc5acso1127732f8f.0
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024616; x=1739629416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YwODTof904YBx9qYG7YKszoElgCZkkpboFtspYHnDU=;
 b=qUPPMu8ih1fRKXBZoM3FO0efeqJOpmGPTPghUn6IX7OmIaY+LMJM1GtaTqQTJ8C5lo
 wxNG2vTtjPzbVTa/+3ejnLdwvbwuEVr3ViigGB72IpC7ps+Tl7rn5ll7WsZg+IXCnh5w
 o5OR7ajm1bbXOiBll0bcjAiox59RO/BAHAjczXuvVNtwicjXrAj/pmLLkEQodqFmUBzp
 cCUe7frPsQLjd3nsFJw2U4B2/AyL/6BNq0/IokXwu/uEWd4O2K/1vC13SgHVzdQ/mH/2
 Iy9AyKrkxi3e11umkTwrrATEgPg5x5CI0UsLflfEp4XGnTB78ArlbS4CRA5F3za+bg4X
 HN1w==
X-Gm-Message-State: AOJu0YyV/x6DkE26uSUfGYTYTfD/ttjW8wD131p4zplryOzPJ1ywF7S9
 ut7FpSl0q/zN9fly3N8zIOz/hww1KDvIa8YYbBqliTCDS+UCLlymZaUy8hEXagBZkPEamVs9/Y/
 b
X-Gm-Gg: ASbGnct/TMoqX1pgItFFgMe7UxLqZ3rKCA1zBCn6PgIIxQsoOMx6dG6HKZQQQn4Emot
 3g6HJ2i2aZMIyOZT8a9sudZYo0bIY6k0mSMm+zoV76dQgE5IWkoHMY3W+T1STwZc0gAH2HoiG5N
 nXiMDP0l+Okpo7BrPK+TOe3/yRSB32cl/+0ZzmJkal7gZi3vMW8zlk4g+YTwd9PLF8VIogYWtem
 7STxaS+3KjmHkAqXaCmBa9+3Bp0NX6i5D1tM+fxYJBfMRorGxgAY9TX2gYwlGJALZEc+G8bUvfe
 Q3/gng05SVpppPz4N+pnPSR5PdalRU/JlwDO3ucdz/mUexD+mwgseRexOrboviWdiRfH9Mfg0j2
 9OgdW0EGuSNMf
X-Google-Smtp-Source: AGHT+IEetqh+UGiSCC/Gj1dFNwSeOiXGqE0sJFQL4bgbMSvPSqfeqUwh6s1G6FEWM9FKq27Y8iUqVQ==
X-Received: by 2002:a5d:6da9:0:b0:38b:ee01:ae2 with SMTP id
 ffacd0b85a97d-38dbb233181mr8081286f8f.10.1739024614165; 
 Sat, 08 Feb 2025 06:23:34 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:33 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:23 +0100
Message-ID: <20250208142327.418271-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024616; x=1739629416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YwODTof904YBx9qYG7YKszoElgCZkkpboFtspYHnDU=;
 b=OOoDugwTBsNL1QnkCGnR1V3yqk8/+Bv3vIHaznJAM24SXi+/nqCy4nthilZgvsvyUC
 4VvmEkmk8ix1mzCYYbO4K86fC/cImqz4NN4RmK1oDDNhbWzjuKhRw5lYxfwMiSMocl/v
 hB2DM3AjaZ4EEO3wtFu11v+af3vdnofKKxF6I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=OOoDugwT
Subject: [Buildroot] [PATCH 07/11] support/download/{curl, cvs, git,
 svn}: fix shellcheck 0.9.0 errors
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As for SC1090 and SC2016 [1], disable SC1091 and SC2294 too since they
are now reported by shellcheck 0.9.0.

[1] bcee3ca6d66d30de4b0cd8186ce4c72020705df8

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/download/curl | 1 +
 support/download/cvs  | 1 +
 support/download/git  | 2 ++
 support/download/svn  | 2 ++
 4 files changed, 6 insertions(+)

diff --git a/support/download/curl b/support/download/curl
index bea4485a6c..2124fe7cad 100755
--- a/support/download/curl
+++ b/support/download/curl
@@ -39,6 +39,7 @@ _curl() {
 # Note: please keep command below aligned with what is printed above
 _plain_curl() {
     # shellcheck disable=SC2086  # We want splitting
+    # shellcheck disable=SC2294
     eval ${CURL} "${@}"
 }
 
diff --git a/support/download/cvs b/support/download/cvs
index a6840fea7b..a52e543e44 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -47,6 +47,7 @@ _cvs() {
 # Note: please keep command below aligned with what is printed above
 _plain_cvs() {
     # shellcheck disable=SC2086  # We really want word splitting in CVS
+    # shellcheck disable=SC2294
     eval timeout 10m ${CVS} "${@}"
 }
 
diff --git a/support/download/git b/support/download/git
index d49016e90c..8123bc3153 100755
--- a/support/download/git
+++ b/support/download/git
@@ -22,6 +22,7 @@ set -e
 #   GIT      : the git command to call
 
 # shellcheck disable=SC1090 # Only provides mk_tar_gz()
+# shellcheck disable=SC1091
 . "${0%/*}/helpers"
 
 # Save our path and options in case we need to call ourselves again
@@ -91,6 +92,7 @@ _git() {
 # Note: please keep command below aligned with what is printed above
 _plain_git() {
     # shellcheck disable=SC2086 # We want word-splitting for GIT
+    # shellcheck disable=SC2294
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
diff --git a/support/download/svn b/support/download/svn
index 1decb2310b..ff33f1fa39 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -22,6 +22,7 @@ set -e
 #   SVN      : the svn command to call
 
 # shellcheck disable=SC1090 # Only provides mk_tar_gz()
+# shellcheck disable=SC1091
 . "${0%/*}/helpers"
 
 quiet=
@@ -52,6 +53,7 @@ _svn() {
 # Note: please keep command below aligned with what is printed above
 _plain_svn() {
     # shellcheck disable=SC2086 # We want word-splitting for SVN
+    # shellcheck disable=SC2294
     eval ${SVN} "${@}"
 }
 
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
