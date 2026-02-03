Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B761EE8782F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E30B83D1E;
	Tue,  3 Feb 2026 13:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o4YqbadOhdw; Tue,  3 Feb 2026 13:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 466EA83D2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126775;
	bh=DAxl997HFMWtVVqTH1XeFk4XrtzWYGdgA6iM/bl+kfg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=roBPrO43YOsEiu1NYYTlA5itX4H78OpDtHi1+Gk5dhi8QHoT64I75L46MnGcGCV4r
	 Lgrz4TkhXQtKzY/S7lbN4Nu0UjXQbiJJlpB8bXj9RdiIlG4t/E7ZHf3rRn0paURUB5
	 oySMPIL8mMbJFu9eiZGtseXfe4MnfDQLsgcPaL8Up9sQ4D7je1sc1ZkLloIcMgKpB2
	 MsAbmH3BXJKMDgr/fWuOBH4dXdyOeMlDQKRedfQK3bJWtSeINOVvwNwZvXZfNMdJuv
	 shq1+qqxyO8kKWEObC5diSvMY5a5+TYvg6WH/h15rwTIJAmu+lcKruiZyjvdfXW720
	 YZtUJa8huDeOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 466EA83D2E;
	Tue,  3 Feb 2026 13:52:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CFD0F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A91960830
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6kXiP2RDRHN for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:52:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B110606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B110606F1
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B110606F1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:52:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-4359a302794so3883814f8f.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 05:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770126764; x=1770731564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DoSKGMMIZGR2cYr6nkqiCdgrHMRi+WPh2mRESdjQto8=;
 b=F+Y+UuEDbJ90TMV/SGuKTQlsytilwAjFFQ9+zKeowhc97EY+YLAUX/+tLtVkPc1Djg
 tUfGsP0781MHVSbIZC4xwBk0bU0FOosLOMprT9YMl+YqhCrLyfiqyFq580TUORQ+ry3q
 cEnqerPDUHCn53J+UAl8QbFWcyf5ZzdP1PSM436bJY+LOGvKytI5dMztY8HvCdvZPbzW
 KWNDG/bTExe/kcfnh08VNfjIG54mugA7AAI7KKArIHzm0Zm4G0bhuzPcfOAA4WoXXpEF
 9bTw3Amx+Yt9TxsJqOPNb14JwSYRJrFl06k5/L/4nTQjbCXGG0+HTQigBVFRXlfcKRn+
 mq+w==
X-Gm-Message-State: AOJu0YxAZmQedb01S1R984R2nCwW1ibnGpL98aAkK/8fvZg/Lvosff63
 ShaDF5Xyexmd81a3/YuYNWrTWZMPZTi4pg7IU9IZM6MyaWBHXegOF9538TUab2eFUIbL56Hkpu0
 nTy+J11E=
X-Gm-Gg: AZuq6aJbZCd4uA/AHNpXpyFhHh8bOutid0TJYKQHgtvkJPuP0U3PnGCkUqQTpNuZk2p
 rue14pbaJWdltKuzjHFI3Jf2wdgO5ZYR1qRHCfBJJ8iiRYsrfxYkXiJJyX+GjMddsuc5bDWdDoW
 nHd8AtLjeEftXvy9nGqGKoTftw48mjHKDIOQO0JrVjZp71ykNB/hxAig51s7lKzPPBTKhaLwFIN
 7ySA8I4KfosLZsgnYZ1XVy+4B0q6nIPojqeBw6oRT6mocfToUupE2MwM+/angYOn42Pi6m8kFOL
 tGrHcENIX86T+l84jfanAWGS5IsYqe+Tt4qVGCoMv4P37JG4pKjZUnA+k8n70rFOQe9QL61Di2f
 Wem8icCfqf2XbgtLKK/OEefADa0TlUJ0iGLpt8cnYNVw7O6MGBR1eyg+/jQC6qEJezbir0SIbK1
 eDz/VXt7OkrhpF1sjMNQ5gGdhLIz0wcWUyU+XUTVjIYvE=
X-Received: by 2002:a05:6000:258a:b0:436:1517:aec7 with SMTP id
 ffacd0b85a97d-4361517aed8mr2528841f8f.17.1770126763924; 
 Tue, 03 Feb 2026 05:52:43 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e4757sm54227388f8f.5.2026.02.03.05.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 05:52:42 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
	titouan.christophe@mind.be
Date: Tue,  3 Feb 2026 14:52:35 +0100
Message-ID: <20260203135235.184869-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135235.184869-1-thomas.perale@mind.be>
References: <20260203135235.184869-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770126764; x=1770731564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DoSKGMMIZGR2cYr6nkqiCdgrHMRi+WPh2mRESdjQto8=;
 b=XYEdqg4FPa+UvKXlKoRfPlZ/kYpFX03e7xN5t+eCNi7DGp/zgmI7VMdXL+p+wZ+3Xi
 QHv+qt0FYn21HvqFQhjupXXfGX5cdz/zpCT5Krv015WgFz27q55qEzXIpUdUtdEAIzrt
 xFSgGVle8P61nFAva95NC4lCkMr8zTuctuJOQGhyVgR24xDXbLhQ8ZbUuKyn5djqgCsy
 ldRYRquyG96NFIuw+Hp3Wukz217OqIGhwvGcb2I5fNZG8QusdCzDUHvh8lfYYpli/G7L
 0kb6C/ISRpYQ3LaDTGf0DqY6BshhydPYfEdF9PPZtC23o1WEyEVqlMqhoxUXH3nKl9jx
 lLhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XYEdqg4F
Subject: [Buildroot] [PATCH v2 5/5] utils/generate-cyclonedx: mark host
 packages as external
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mark Buildroot's host packages as 'external' with the 'isExternal'
property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
property like the following [3].

> An external component is one that is not part of an assembly, but is
> expected to be provided by the environment, regardless of the
> component's .scope. This setting can be useful for distinguishing which
> components are bundled with the product and which can be relied upon to
> be present in the deployment environment.

This fits the usage of 'host' packages : a package provided by the
environment and not bundled with the target.

[1] https://github.com/CycloneDX/specification/releases/tag/1.7
[2] https://cyclonedx.org/docs/1.7/json/#components_items_isExternal
[3] https://github.com/CycloneDX/specification/issues/321

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 66eae08c01..25bf5506d2 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -372,6 +372,9 @@ class CycloneDX:
         return {
             "bom-ref": name,
             "type": "library",
+            **({
+                "isExternal": True
+            } if self.options.cyclonedx_version == "1.7" and comp["type"] == "host" else {}),
             **({
                 "name": comp["name"],
             } if "name" in comp else {}),
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
