Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6DAC71135
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 11:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF2D842DB;
	Fri, 13 Jun 2025 11:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5reCRTIObAD; Fri, 13 Jun 2025 11:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04343842D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04343842D7;
	Fri, 13 Jun 2025 11:06:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23DDC1E0
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3FF0842C0
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_TtDo4NQxOI for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 11:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33173842C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33173842C2
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33173842C2
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 11:06:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso1250651f8f.3
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 04:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749812763; x=1750417563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQPHa9kLrrZP1/3AaulCvFEdzgzyoGI1/vsejt3t7IA=;
 b=FQwpaGFsiE4HzItOlgi79a1hP7Jf1b4IgYnsepPqqDrISGFfEuj6RJQ1/EwqtRH9ll
 hEqaKLEUFqdqJ561RUwgzt4rYjVPVaWX79910YWxZjthrqRIS89qH7ph8gRMglv+mMnG
 DckbBkeaQB/vsEFkPKgKy/ikZf0SbdfibXL2p/n+mEX6GegenMRKpIE7j+K8oHCeCarz
 k9qantnWfv4lu1a9QPXKOTNPOh9uKZENO4n5DqficRBs54A4MAcsi5lR/wCC3BAgC7+N
 qF2piy9cEFAxD//DKaPOc+kvxRuLY18NorVS0AqOuwsNFjEj08zwxOmfxPJSuqzg0Bdf
 UZVQ==
X-Gm-Message-State: AOJu0YwEepMpH6lsvGJvUhXHVOyj6oFe4v480CUqo3YaOX9aJeO0OsUG
 oS2wPnrXQMeAYO1+YvSWswh1h1GtI+3grene5yjyz8RVSKdsL8zWgNyg4EWhpJN5uWFbxwtBPmz
 sFhwD
X-Gm-Gg: ASbGnctEV92uIL26WaTd5Qkix4CxOytARhWXEaMLVQyHLmy5ZpScrdIc0pCe+5rP217
 QTTAvoMXYEWyutOynoAbCMiwQontrAkr9HiUE8VUT0lhphp++0s8k23Kpa8vA5NfulRZommM/C/
 HMZIgP6ae+A5tWG7z3dWhrhFKW+bI2zkpFpXSCdMnhW5aTulYDheZ1lfJqdnaGebvhg8nrIP8PQ
 uDVylpisn3D0dCZgrahRVnfTyu34iJj4GrQIq3AN5TGGQU9/eEJkC7mys7Fjg+cc5hmHjuXz3Hr
 opv9GDApOPE8qVO4G0sTJX8CbkFfdD8+//JWRoOHYux4ArcHpbPmyobVkNRneYb6nA4g0loi4R4
 =
X-Google-Smtp-Source: AGHT+IHXIXN3oOcTQONGnSKpzaC68uxlOQlCvn9REDr663DNWSuXtFUx7YJ2cfmknGBbrl1hKdB5Nw==
X-Received: by 2002:a05:6000:2908:b0:3a4:f7e7:416b with SMTP id
 ffacd0b85a97d-3a56867267cmr2371769f8f.16.1749812762892; 
 Fri, 13 Jun 2025 04:06:02 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:e0a4:5913:a608:fb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7f8f9sm2060459f8f.42.2025.06.13.04.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 04:06:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 13 Jun 2025 13:05:54 +0200
Message-ID: <20250613110559.2665663-2-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749812763; x=1750417563; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQPHa9kLrrZP1/3AaulCvFEdzgzyoGI1/vsejt3t7IA=;
 b=O0adcQ2u3GPDtgDJSLrOqL/Eel/NKK2pjp/TlISHA4ov9xf13QXRwyHzwuBgbqXA9/
 diH7EWsxLFBkUghm833X3i6N0lSnWVjcJaezOdv3tmbvi6SxakcDvixuwuvkUzXRoj6l
 r9k5FhNnTCb0Sk1JHEVNWZj9T2dnrmGV3bI9E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=O0adcQ2u
Subject: [Buildroot] [PATCH 2/7] utils/generate-cyclonedx: exclude skeleton
 packages
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Skeleton packages are not associated with CPE identifiers and therefore
cannot be tracked for vulnerabilities. This change excludes them from
the generated SBOM to improve accuracy and reduce false positives in
security scanning tools.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 utils/generate-cyclonedx | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 08c591e86b..2c234e1a45 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -293,7 +293,8 @@ def main():
     # Remove rootfs, host (if not included) and virtual packages (if not included)
     # from the cli arguments
     filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
-                               if ("rootfs" not in v["type"]) and 
+                               if ("rootfs" not in v["type"]) and
+                                  (not k.startswith("skeleton-")) and
                                   (args.virtual or v["virtual"] is False) and
                                   (not args.no_host_packages or "host" not in v["type"])}
     cyclonedx_dict = {
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
