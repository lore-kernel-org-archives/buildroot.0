Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2824DE6ADF9
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E471B60B71;
	Mon, 22 Dec 2025 21:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykqBb4V_z04z; Mon, 22 Dec 2025 21:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E31F60E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766440620;
	bh=x575vZXkQrUsuS6l50cdpMj4/rDvllF2++AMLmADZHE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DE4PMqiwfn5YHQ7zJuCnVxLH/6QpoU02smxApjU67ldR2+NSS3x0Z5EPhjdxr86zC
	 Zr/JPg1P9UPGzy+OSCSGLx7OufLqh5DGPaF7Q9Sz377Ea53WGIjxb4xQ7Kyvy/Vv3b
	 0jhiP5yJSW7ABu+qKZx0TNeSb6y3spHinW9RYlColKUhbK9r4FkL6YV3iYHyqXeibl
	 z33IkN4IPTYh3YoVmThGmcyJhPTygtXQMVC5Rh3JlCt4gb9lZGQhIeQxeEoJuA+PnP
	 QZWuHdnJcWmTUF9BRhM9cmgNsJQdV75sCUEBRkyi6Q7e8t+h2GJ12NGlShPJrGl8PA
	 ix9kEHohcxuZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E31F60E50;
	Mon, 22 Dec 2025 21:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8AC8BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD01A822D4
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vMkXElCTkN9U for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:56:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDC57822CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDC57822CC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDC57822CC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:56:56 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so27739835e9.1
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 13:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766440615; x=1767045415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CKxNiRbn18c2yqmI2TeHyteiCT/70WnghPHI5QhqxQU=;
 b=aYkMoEtOP8H+VAnVtS1KqwE90c0QIPXLHCVC3ihMaIjamXSnDhhIvrsirXcdpIrS6I
 VXonBxOOEoEFXtPvHoW7t0Wly7H14Pc/8nuVe+19ntiJIACpbdWG1zCXCIM1LnlOVZFe
 MW+N267Z+6Et0fbYLzuMv2JJncK7BbvxLdU6VLbl66cay42YZoKlFkT6gGxjlFkFdvXV
 mara8tGPZ3G/YnNzjEmZfl6W2YKJiBRXJZxXdRwEjRmW3N9CdbRPNWl6KLPb8ZqG8nW3
 wycXoqxOQv3X2DpJW5nJfGn5dHFoqTjhRtSK8siaWj8MFEh3xuTKTfg0K/Yw8V7AxeeJ
 30hQ==
X-Gm-Message-State: AOJu0YxtaNHJ9xT0F+KJSIEIeTjEYo1oTMx9Kq315C5Ll7Gto6Duy+Vm
 DrNr9UcBAWe/qxs3FPQ5Mf7Y+OJkk4u+Lki6mYY4OM9N9GMvkN/PtWg0j0JUnA==
X-Gm-Gg: AY/fxX7oyYujFyFJ/SHy/pPZyDUrve1E2jh/bb+EviEfsaW127T83kaccPEjEsAu0Fw
 niLMaAJczg4ki2TaHDLh51SGhWl5fwWGdW97Pk9nxD6Zo/VFSwEjH8JtQgq/akJZa9BCadpXDmY
 jf4WL6PfMf5ZLC8XLOps8ASc+8ZFAev/CUPJrVxZCasjxz4VYdTATiOD49T6xi8IxSjlu42vdik
 UgT2kma8My69mVqjLzlEuZXZiLwLX2suNzckzgrQLD2X/LdDBMfOMHx0qgVuyBiwa2GB1DfW5Cm
 IwnQE3rrj5HexOdh2ulKMObn+KU/b92ehASCxIIM48DGPu3mQhdT4D/t5O7ijP/GFZ75/PPVnHy
 gUInUtn8kiPfcwLW5ahUjiFk+Y7LpuwNcJbYFfDfj42+58+71TfkCTzkcyHFruJMwmMb8DgTf+T
 tdb+E=
X-Google-Smtp-Source: AGHT+IHTWh5rreuF7ae5hGcGjQWIRkgdfIqsIgI2MJVoQLhK6bUSxRMjEm+SAgKku8vb7DGdOa4U7Q==
X-Received: by 2002:a05:600c:828d:b0:46e:2815:8568 with SMTP id
 5b1f17b1804b1-47d20502f98mr81621965e9.10.1766440614562; 
 Mon, 22 Dec 2025 13:56:54 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2fd5:723d:8ba0:877c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193522cdsm201207645e9.4.2025.12.22.13.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 13:56:54 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 22 Dec 2025 22:56:35 +0100
Message-ID: <20251222215636.975668-7-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222215636.975668-1-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766440615; x=1767045415; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKxNiRbn18c2yqmI2TeHyteiCT/70WnghPHI5QhqxQU=;
 b=Z/SbN+4RZmzVUSZfF5TqvlrFbSscM+c7qLF5OFAZmVfslTVrmCnZSAvD5/XoEvmSqQ
 s+C7ryLpSH/+aEUlj27s5SR1iCwK0tZQGL3dL/DDiBM9nej2ai/8N8NJyHnosfQioyL2
 gMtRNMzG4w8rkEe83xgCsETUdxtJl21QjkO/nE7AfeFoQZAcT+EmX6RjGmDvh7l/aHZ2
 1Wn9nrIW+aN5aLn2guRB4/qQTYyUFn+UQl9JTxTxkTaJjkHTdI2a7edhPj7wkTM3YTwZ
 GQdDoiQqmZnEFJ0JXoS9+WClGoV9WYVxxIAxdeIrKGkxSeMzTlGYO3CIc5clbfcLXh99
 RpKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z/SbN+4R
Subject: [Buildroot] [PATCH 6/7] package/grout: link against DPDK static
 libraries
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

DPDK always builds both shared and static libraries, regardless of the
default_library setting. That option only affects how applications are
linked, not what DPDK itself produces.

In Buildroot, Meson libraries are built as shared by default, and fully
static linking with glibc is not supported globally. However, linking
grout against the static DPDK libraries provides better performance.

A new Meson option has been added to force static linking against DPDK.
Use it in the Buildroot package.

Link: https://github.com/DPDK/grout/commit/ec9bf5a12
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/grout.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 39bdc7f824..a7b8e65c5c 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -11,6 +11,8 @@ GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
 
 # Avoid using buildroot commit hash
 GROUT_CONF_ENV = GROUT_VERSION=$(GROUT_VERSION)
+# Link grout statically against DPDK for better performance
+GROUT_CONF_OPTS = -Ddpdk_static=true
 
 GROUT_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
