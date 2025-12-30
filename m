Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD0FE94123
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC702403E5;
	Tue, 30 Dec 2025 08:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9yu8coUpNx4; Tue, 30 Dec 2025 08:19:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20730403EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082767;
	bh=17wCRteFvjqmUpbFx3UjCKIMUlpmzEKbgsmPWjxtZEw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=PqHwqNkQuWRBpsmbdQfoA/T4arnXUtIeaeZ25V8EwbgLW7LYslbiLqydsmp3ueEV2
	 A/beJooiyMGC3OpjzTSxpt6CMMJ9CL92bOx1iFzmpi+AdagunZbZIZcv4KpWomDz6k
	 PaItrDn2kr51GTfJ0bVR1ovT+RAKoanupQISA3Vg3mvv3txDAoI5ovpuiC5xlksHIh
	 IS+xm/ICCyhauyJPT4QeD8uVIaHC4cvUmeC3mwVvknPHfgkp8rMwXbtdVKcNS4nhaM
	 5Ep3ywaoDuX8ZakmkkFsxR8uFDn86RB18JpUcjnK4poMo4526tFTmdQSKq1zrkJd/0
	 laji15Y3K4pIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20730403EB;
	Tue, 30 Dec 2025 08:19:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42435372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 343E24030B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APKETOlfRLid for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 66223402E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66223402E8
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66223402E8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:23 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43260a5a096so4773352f8f.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082761; x=1767687561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uPPTxbG7u+YJwLA8UsOhXmfuhV2Y+KMPkwXzyO/VbNA=;
 b=W8UVMjH7TiD6cDLlvCl17dqxaa7ee4Rh3bWElkg+UUPqsNASve6XXNxQQek8pfsAA7
 W2Eq3DTE3VqV6CUXHEsh5Um+KD9Yu2omYo+TLa+j0a7X4ZPyBdySsAinb4F0sjgfJsEy
 ESzWzFtbBYKENCEBkXc1UIxhpmJmshtor/aNOd/hkPRvR/yaArfUO8twtV9plU3ZegES
 Da8Mb4DoXxJopzpu6gPr7n8L4lvffGlcZiADs8Af4hZ6xVMjm8lbKQef193b4Abs5NkZ
 Hg7twoNJy79FLi/3N8T/V2GS6gMtP8I67oQ5joScCzxG0d5Yuth5XKY6cz06f/gm/q5o
 p5/Q==
X-Gm-Message-State: AOJu0Yw7A0wGuMer2TRh8fbFBfFDaueQ6XjXJKPS0BC17Ie4kQubg6Hj
 ft9fqhA8+JZpVxaHT3Ue4N6XYwKrxjShP0Vpan/0YpcnxuNaXuerX1BeBvb2G8+oJYOWnQ9StY9
 4wDUvhbo=
X-Gm-Gg: AY/fxX41EKL1Qd2/PShhS1ftKzIqPi3GuuxzC1s6uYhGJCYr+FqcRFrPrnLmcdHceB7
 3joLcT7vKyVwFAmgboG7vhbJgrA+yaARJtBxehncly80NdgIAl8qeJHG9ivSgpXWHxr2UIwxLc9
 KLn7vMUfQtA+6hBCzfaiNyA9nTbwGrcbeh2uHE9PznUqam8i2p0BtqfXRC14N8ihFcFRmkRJezA
 B3oYlogfX2JRH0XcZAaFYbBrQvxRDi8Wnj0CI2SHSQEL9qZ0CLWR6AFcSAKj7jf4cf7FTq6+0Z8
 9Sd+AM8ATR7+lu5PVdb1LfEEjIjLw1D/+BAC8l72Pfdr0+wN2HH2dSmTAIu1VDoqsLm/UEbRbUd
 BqFnCx5ekGjcsyNhDAEatymPVAyiM3bzrMr1u6kIwj2e4gJnpPtofZSxw5Wup0EaPRsWp3anKIt
 rlq5E=
X-Google-Smtp-Source: AGHT+IHOpKokMwBhrB6c6ywYaMIz+pJgKeB6/L7IrhAcK+Eppt+oVHewhMeN09irSdYoJCYr3J9DCw==
X-Received: by 2002:adf:e74d:0:b0:432:84ef:715b with SMTP id
 ffacd0b85a97d-43284ef74a2mr10933030f8f.0.1767082760974; 
 Tue, 30 Dec 2025 00:19:20 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:20 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:04 +0100
Message-ID: <20251230081917.18676-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082761; x=1767687561; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uPPTxbG7u+YJwLA8UsOhXmfuhV2Y+KMPkwXzyO/VbNA=;
 b=fI+7r3V+e5OGIcxiqboBDQ6TIt39oRJ5iRtMJISkKRKFyKSlXDYREF7FjLSacfeqho
 B03RwohVslTlv2PAtt5JtGJJsC7yrpwXTn2uKMwrtCE1Hjwd1NLEupzJ3/0WDm6zrXM0
 8AgCUpH6KTRPpkFkem+taNuhb/rY0esDVisf92kqFqWBRvhQ43Madfk8s8YVjnEdiMsE
 dd74gMxaYiAZeqywhvAdPgfQKjmMzVMYOzPnHkswbG7/52ibJkI7t8FWq74Mnc4FA4o/
 F9xndsjP/TNLTZHV35HakL0DEvQIxhzeHawcGBQ3fP3PgcKcdvmaa/Rtnkku8Cx6aEbY
 SLjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fI+7r3V+
Subject: [Buildroot] [PATCH v2 02/15] package/shellinabox: add CVE trailer
 in patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                           | 1 -
 ...02-CVE-2018-16789-fix-for-broken-multipart-form-data.patch | 4 +++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4df0438291..94916ecc0f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -948,7 +948,6 @@ package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
 package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
-package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch lib_patch.Upstream
 package/skeleton-init-systemd/fakeroot_tmpfiles.sh Shellcheck
 package/slang/0001-slsh-libs.patch lib_patch.Upstream
 package/smcroute/S41smcroute NotExecutable lib_sysv.Indent lib_sysv.Variables
diff --git a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
index 4b15f419e3..5067833056 100644
--- a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
+++ b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
@@ -4,7 +4,9 @@ Date: Fri, 26 Oct 2018 11:51:15 +0200
 Subject: [PATCH] fix for broken multipart/form-data
 
 Malformed multipart/form-data payload results in infinite loop and thus denial of service
-[Upstream status: https://github.com/shellinabox/shellinabox/pull/446]
+
+CVE: CVE-2018-16789
+Upstream: https://github.com/shellinabox/shellinabox/pull/446
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  libhttp/url.c | 3 +++
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
