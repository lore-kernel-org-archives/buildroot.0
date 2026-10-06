Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21BFCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 20:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A99C80ED4;
	Tue,  6 Oct 2026 20:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKkG08O4EYkS; Tue,  6 Oct 2026 20:03:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7FA2F80EC2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791316994;
	b=Qip5N3VxYpYzLul8EYO/uwdU5dlr28XIJoW/ffebL1sgroQSSDemdbO66wwKny7R2Glf
	 qRRPmVw3MhkTif9nLZG8YjloAYAcCXDRsWs4RJR5nMo8yYC8pbr6g15JIR4odrWf15AV0
	 m2SDtkHHNliODmhN/8UhHfza9YmqwT8kdeyz+y2mCzyPRR8l/nL4yZmfEF4bhrR70ZZQF
	 ljLsuVIKl9vDmp4FAWu4b1j2GVd6aAqv7TRkAHkdlibhqC09tqpU3R4rvcj62odfnGVgM
	 oJzkvfIQDAnuMUvUc8iSMFcgg6In03+z6ycvklUpzBnzK8LuWm5DfwhzYP9BPMrFRoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791316994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1HWf+LOWnGa75HdnbBw/4SsvNKkUOCXnff6yidxsze8=;
	b=ZXWeisEtPW4mVPa1G8C72zxDjbBdWQBTTlrjTXiJSBQtIsAAS3jNFVJaeDJ9z08TC3xD
	 SLoa2guUZZXQSMmJmL6GFYhfQAtxUa8sNQihTyGBWc/YEHekhGyv3tb3e4beGx8h3v2fL
	 fWYbbZXFd8D6rMrwnq8T/zUtfCqXlu5Fr2KPucVtu9zQ6RexHha4LnqImP+LvjBOf9/+w
	 tMlErszVWkx4S4zUDD359UdFa5td6dEladvxPGsCft/QKX1yeq72Myu5hAR0KrZM7lVgo
	 nNyEuF2jKx4gtcHZoqb3qeuU8PNcfDy7hiA1xJobixU66Msad1mXbUako6HgjxaDkqg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791316994;
	bh=1HWf+LOWnGa75HdnbBw/4SsvNKkUOCXnff6yidxsze8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ATflGE5EOxFAZP1c0MbyTGubz8sBOj3/wZnUfJHjyIJKRc4EzcKODg9B3DzI4V8UH
	 XgkzHtexP/rv/fcNLJ1Mu89x+A0tkz0BDYI+88NkdxklQkvk7Sf9RxnMear6XvtO3B
	 Cm9iDK5Oya17wRANMVk7pGCEI1H3l2O+c99QpFFDSHgCITBlB7kKB32CRIRs2T+WEb
	 yWOWkNsCw33RtPCIQ7nsxMDtY+AN2yPMzOIMOFBU/JHRJdVYqLSxgFV1a/Zt46YJWN
	 /d1mEAmsuP5OKpgriaSf8qZO/l0CmbslokHyHLxtcjoLqA2eSwEJq5YPnxY9ozK2gP
	 qe9Vk0he14aVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA2F80EC2;
	Tue,  6 Oct 2026 20:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D83122B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EDD36078E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BADGoug65qTR for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:59:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2DDBC606A7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791316780;
 b=Kl14k/a9ZLGxA9B/ciQ4iWhrWiLTaUeY0jshEB34L3B3dLXRMP2bxgIeeSbh2dBj6/Lt
 8YXJTzJ7vBSPch4OGyHDwuTVeFJw1hJiubsWzF7Ga91s4wr/ib2hVn0Wg4gZeazEK4hby
 oB7+/1e1+LGHAdSlZm1/q9B8Cbz0R3UrbLHOtakmuO5VdO+vgvkg/sEakZ8Qwq/idOMon
 +rKM21TUq0YPosc6pkXjtZd6wNFC9AVH6gPZvvDAE/AFOmAcCZ5EOVRytjRXCHtXtRmbR
 J61cnLtGTwL4obG1RHdU70Gi2yq+zTs0pNoTqBHWFYjAct3yStUNEcPWzDEKKdOS3XQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791316780;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=CuB87mvjc+2UjFbhrwr/8YTaP9wv9bahdl6K1fFMmWE=;
 b=J+Ry3ib+W8BDz/5CrtUdVHKwCtpui3scLubzHAcAq3lJjsqsxOcGZPIo3r1I5XF3KaI6
 tGjMzQnzbtRNgQuBSWJdjvZCW/ibCL6pa/X/WX+umA/5Jty2NoBk28jK7E+yWLUxJShm9
 40NHZQSKwoBq61+Tg4E3TxJw2GxucPIe50/yyM4mF2cEzGM4BXoIn32qNzShufRAUcsNZ
 SAHtuP4dUkaDP2j/6FcH4zFMorDqECrFwMUEx7xBjRHXvdr2hZAgq8VuMIMKnXxLy6EXS
 BINFtjFhp0UF+VXE/xP92EFikMQKYgcyx1ZXWxvehovWZCAprkn0J0rdcBxIkCUFONw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bXHVwYnz; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bXHVwYnz
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DDBC606A7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:59:39 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6c1983dfaffso2933352eaf.2
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791316778; x=1791921578; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CuB87mvjc+2UjFbhrwr/8YTaP9wv9bahdl6K1fFMmWE=;
 b=bXHVwYnznFFMt61TnGLYgOyTyj++8mT9GK+IDoyPBjk6ZYIB+ry+jyJyHCTT3lAhtU
 Q7NzvoF+eH+ySXk3TFek8wxt/RkmccfiSiVvI2vsBKh15z+zHW1Zaov2MrOjKO3nbLtb
 aZiJaxrAQjgboFHB7tMtVwXTDcFRg8rmLHyXbcQhAhmprMif3SXIvTiBJOpKRc7alymT
 seckhdQxHysdJNtP5s4zl9pVL/XmyMXmtm5lbOHSVMh9cXmoOv5Xkre81PAMVTOAUvK/
 5SpB2TjM2Dy3bOZMUaBPe3qxG3kbzPr2ULe0NOmJ9vaE8YYL6zMwajy1Y6AjrfoErpUt
 61jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791316778; x=1791921578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CuB87mvjc+2UjFbhrwr/8YTaP9wv9bahdl6K1fFMmWE=;
 b=F8SctMFtLBDTn6t0qurBiJdwzNKuExkEFz9wIZdPnAJOR3J8I58vrOxCxFZZ2vgDhM
 qzs7v4veeEXkb/BcOPddrRRFF0o3LB0iW/uZeBuoAJPVzK3DllwjCbQSIsqkoXT7qmaG
 IAjdBP1sDnfih7eNFVDnhfb/9114FDRBy6KY/837xCX14jFAvOq3d10/Zx2UxdZ0fkc5
 yxzZsq6dIRFECCH1i4WweQxen7DarH8QIuBaQ32k4pI5CDEm5i15SNmdCQY6x3sffo/S
 n3iInU/25N0w1b6zsts+MlxpzhycY+IOXMFkqWjoce1wtaODGJtmCzfDtFi1eEa0n3yX
 B3XQ==
X-Gm-Message-State: AFuF++mNXQbNknMlMLSUZ6Ylptt4LqQdBr3D385PR0k+JK+aB2DPk2w1
 iPRLPgdUqC0GJa3xuoN4nVPJNsGqX0BK2zYb+LUCphz0jKCS9/BkHbFcdFDtOg==
X-Gm-Gg: AYBFou0I6XII5ZBc8EBFagt5XxdneUNGtb3gTzdUWad7fROaHQ99c6nZcPycHz+wFFf
 DgVXaXvgT/oizWBcQeYryhDHAwFCEYGa8Osi0GcdBxtgeOXCuBmWgN5p8y4He+Y0/V4VOmqRuTo
 fDSCFQOqJNbc364o/QXuGVZKqVZeLfRmPpZbdjMGEQjY8aAQPjRCvfmILpKgbY92fzTsE2QW0Gy
 qw8eKAdeymEe8BVvMW6pEUfIMaV+Usfxt0rYLoCqkgHSTj+8v/fdn0JnjNXA7XiTtC81FdUK6yG
 0gUcM7kQaikIAtPBupUT2J4ZX2OlAYJS2wTRJGCLX03T9n9aNiGEnY4lgEJvKCJGFMU0N6DUSom
 mtH3jJO66imCJ+XAs/iD28RD3MerLNWY8419W7LEeVNhs1EoS/lVXN7RrQwBpHdhgooul/+rtK4
 p/+5Ni9zJsnnvCNhw0inG/9XC7DdpdDwSRxb7qsDeIdR114yXZv79Tma4SdtWiPAMhV7hWCIAsN
 weupqOu3/8BKvAcPdNgMbRKGESYn+vczl0aKDHcQJeRl0bwEaTQ8Unf5/d0ndM6YplpTs766bYn
 30XWmVRDcP31OSbTYbHZ5Rt+vFi40ojIqLuPgVStRo5MfDNDR7li/3xIeShZnh3zW3DgqJsEayx
 PmCbLNP/01B7iDlSb+tVthxVAQ4qGgcQzG9YaqST3Xg==
X-Received: by 2002:a05:6820:1388:b0:6c1:f38e:7053 with SMTP id
 006d021491bc7-6e7a44db26bmr263989eaf.3.1791316778560; 
 Tue, 06 Oct 2026 12:59:38 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6e79341b8f3sm420220eaf.5.2026.10.06.12.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 12:59:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  6 Oct 2026 13:59:33 -0600
Message-ID: <20261006195933.2225477-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rust: use cargo environment during
 installation
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

Pass HOST_PKG_CARGO_ENV to x.py dist, as is already done for x.py build.
This ensures Cargo uses Buildroot's configured CARGO_HOME instead of
falling back to the user's default cache, and keeps the host RUSTFLAGS
consistent between the build and installation steps.

Fixes:
 - https://autobuild.buildroot.net/results/02b/02b2fc6ba7329852d7bf6ae4935c120c4de47b3e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/rust/rust.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index ca68de589c..7546ad39fe 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -79,7 +79,8 @@ endef
 endif
 
 define HOST_RUST_INSTALL_CMDS
-	cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py dist
+	cd $(@D); $(HOST_MAKE_ENV) $(HOST_PKG_CARGO_ENV) \
+		$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) x.py dist
 	$(HOST_RUST_INSTALL_RUSTC)
 	$(HOST_RUST_INSTALL_LIBSTD_TARGET)
 endef
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
