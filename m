Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D18CDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2082D608A4;
	Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeUe0P7EcG2W; Wed, 24 Jun 2026 14:06:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AF3360A6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310016;
	bh=RFlDAK9tvjGhlJO8YHaVBReOZ57uVKy31FjkcLCWwyc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Au+JtUEyLFw89eNV1WyAOOMXRe+qIpQwKRvzPExWDlsAHPCS2VxBZ+SMn0w4nVvkF
	 OjSlkhHBe8208reg/p0zJmpu9EZgEA8Svqehy/QW7imtPf8pzMe32vl5TZsDB/NWjs
	 oHU4gAQ35bWcel6u0o6v+6lyt43k0x9l7XGK9HIpFX0YxUVDXZmt1kKHLa+yDw4xh3
	 mkSPCWLe83YeF0zAMXMqKT+uFg3xVGhWAXfcmunF8yIHdylaJ3BbJIm+XBJI5/JHjO
	 WLIfC0laPae6sw+PuytZQa2pgZCiOF8sjvmgMAZ5iQtTDOkw6eOLIB8+ehbCVymu5j
	 lmiIJ0DxlBRPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF3360A6F;
	Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D73C367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8213440911
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWHxn7wMg8jf for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC320408EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC320408EE
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC320408EE
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4924f8db066so6400015e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310009; x=1782914809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SAE1SwmZ3iXs9R9apFD/2QZdm9wpkAX5GcCX9PEB3gE=;
 b=Vq7Nhe+wro+wv615myE/5ot2eMIZbC1NoTDxD9VkGXPFkxqo6FN3yYzdG9MWFWh6Lr
 FaEq2eFZ1Qi162y2LaCzeqNSQv4g3WhihgKvogcu8TzdHqZIqAHLCpAYC2kOW0+0bwV1
 oycaf6kFZE1nFFP7HtBGxn9fPfwXjgSS4wb78YOkrdQG6ykQEeZ+kd14sexgAQ9yeqgM
 MQtZKz/3Qt4RgLIx3jb8z9ParESTSGmD5CIrub8DP3LaHDB6JJfVO2zFsxdBYCtemtrc
 EgNPWqWrRmebmT1of1sz086awS8x91SEuXLzu0zchIFiFaBAIN1VeQcUVE/odokPQJqR
 OEyg==
X-Gm-Message-State: AOJu0Yz1YpK4+qlIrHdVT0MJ4ELHw3pofXo1h+jJuor4Ju9C+jP1EvmW
 fMgzd42xUbfBzSGHm4L4Dl5Py9j2Cho+L0rBG4rh0+yAdvJ8xCuau8ADt73sdnILw19fdONbz7f
 IeByy
X-Gm-Gg: AfdE7cl49J2QOsWSB7MoKj9q3odsxT8I6BRFAoZksDdPA68HNUCwLLUBqX/6rnX0wbt
 HLEFapfhe+wnGL59k3lXtGgGi8YNuPQk3JA7xLbm+8bU16n8tts0UQKqGn0vKJ2oyP6GswXnJPT
 f4OiNQExKV5PtKT0SG6BttqBrL7xjYsM7WBvZEN52VGvc4PswycrAcGYv5LlYaE8rwXJjRuczEF
 qDZrfx4uXDff3XxQo81bU6gq/Yn7LYffyHr7wzPUbun/vJL0xWCaqaqibfR0OR8jcDerZmA/7KO
 FsTAest+U+QRL1jMmoIA08B5gh8eDu27Ycvi7eVaSAI4wnDNLoAIu1rU0YXXwAml/Bq+Z386t7g
 6eyjuKYVYsLN6su4/Na7VLBobI4K04AbldJ3FiRTW4H2xyjq6NvbJGfJRFZx6ZiEb89xnQtZWkm
 xb2Li+LpEUYW5I85M=
X-Received: by 2002:a05:600c:4f91:b0:492:611e:ead6 with SMTP id
 5b1f17b1804b1-492611eead9mr46999935e9.21.1782310008650; 
 Wed, 24 Jun 2026 07:06:48 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:34 +0200
Message-ID: <20260624140645.185318-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310009; x=1782914809; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SAE1SwmZ3iXs9R9apFD/2QZdm9wpkAX5GcCX9PEB3gE=;
 b=MNhOzlMVYvnvHZLG9Eywoj1342BwdbreHrCPtLD0ikkN2DRGyiz2aNeJkpX70hfqJl
 /DCnYsbcf5qO1a6CdtiMXuoid1vqFKxduVR/olD6adYOB3QwZrR+qLXNmDUuKt1cjq5C
 XrXHPJbfErOxhF3U9XIMkCDDukh9cEG5nkOCcKqYbuutp8b4NmBFJylZ5DbF5ajotEl7
 tadDPiRI/b6dLWjZ5zE/2ovEimfDwzYJibpnKHLij4YnA1jZi02tt1R8RtkfFGoGG/2T
 UKgw6WnwinZfQkrrhsJlUZpUzMLl6IoBqcCf6gltTIYgoFhxznMBhFs7UZHSKXRaknRW
 VnMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MNhOzlMV
Subject: [Buildroot] [RFC PATCH 03/14] package/pkg-utils: show-info expose
 vuln details
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For each `_IGNORE_CVES` entries the status and details are exported if
present.

- `<pkg>_<vuln-id>_STATUS`
- `<pkg>_<vuln-id>_DETAIL`

For a hypotetical 'CVE-2025-1234' that affects the package 'foo' with
the following declaration:

```
FOO_CVE-2025-1234_STATUS = fixed
FOO_CVE-2025-1234_DETAIL = some details
```

Will result in the following show info output.

```json
{
    "foo": {
        ...
        "cves_status": {
            "CVE-2025-1234": {
                "status": "fixed",
                "detail": "some details"
            }
        }
    }
}
```

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-utils.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 17b0aa1760..c6e509e9d1 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -154,6 +154,25 @@ define _json-info-pkg
 				) \
 			)
 		]
+		$(comma) "cves_status": {
+			$(foreach cve,$(sort $($(1)_IGNORE_CVES)), \
+				$(call _json-info-pkg-cve,$(1),$(cve)) \
+			) \
+		}
+	)
+endef
+
+# json-info-pkg-cve -- Create a JSON Object entry of a vulnerability id if the
+#  STATUS & DETAIL variable for that given package name & vulnerability
+#  id combination exists.
+# $(1): upper-case package name
+# $(2): vulnerability id
+define _json-info-pkg-cve
+	$(if $($(1)_$(2)_STATUS),
+		$(call mk-json-str,$(2)): {
+			"status": $(call mk-json-str,$($(1)_$(2)_STATUS))$(comma)
+			"detail": $(call mk-json-str,$($(1)_$(2)_DETAIL))
+		}$(comma)
 	)
 endef
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
