Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56341CDB481
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8CBB60A6F;
	Wed, 24 Jun 2026 14:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3hlORs8PaBw; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1F9F60AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310018;
	bh=8Emw8I4JD/6lXB8lwgcoKyRRYQfBwq5ZQPsJqVweNqs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=KiB89Qj1dg6j4jyXyDncVN3ox7P7PcpGgElfvrsSJCsSJzSBNpknRkKpA5Y0C0cUG
	 OSidgjSU07gjtsDElF/CaHdN9877iVtl1xgjTTtTESyBMP4i8czvhUftJ7OYvUc5RB
	 XH2U9A8Brg58W1a7X9WQxgDyPmCjWFif9DRX+h1XxVjxIQXnt+1UlOzQEnEG0yiRZ5
	 Ve6YKU3q5J1QKAwl5Jv/R74br2tB59s9L/dGyvjAjcWsQvhL056bvhVlLq5eurflnf
	 7aeWwKoja6IPc5iZwd6RS5X4aDEZoCuRiZHrj6CkARgGbPHdmtSa53EO1zQcnx2iKZ
	 elLa3WKUc6fsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1F9F60AB7;
	Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6D9F363
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C54E8401D0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQ5ZVotMn9CV for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97E4540120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97E4540120
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97E4540120
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so7435425e9.3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310009; x=1782914809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KKXiGLswGOpmjdSO93nxJI/YwE35I0BvcsVf754c+jg=;
 b=TNE229uG5F2Ak9GQNo+9MEi7Dh3SIIkyDfddy6YkSDyxhMUafxP1SAQghYwekPdn+k
 rVqO8hYsF3FVCSAEmbqM6LdI74QHQmCkJxV94O5+bSPrmT0kfYdKN/nwMW8Pnes3Khao
 4QzyixXfgESfWxLzHkU/ENlSyVbGKKwDNo3dbVurOJFTnih1R7fey56AXBQ5mOWyLfqD
 jPDgUce+B4QtLVZttgXpYiZtR+GhQkF8IIroiyAHKSgWSp+1UvQJzkXWYokNcuLEwQzm
 Luzh1bru7BRqwOdTngzdraTTeZnAow3QWj5fXMIsd3SaOQNCbekmVStFMAdlaYRgb3O3
 Q8zA==
X-Gm-Message-State: AOJu0YzwqwIZ1lImzOGbuSPMOS04u7EAP9IMqArpEV4JfIWEVKLHZpQv
 ZLJiRrpFeTQNDmxOZ0XaDuSr64PhXFk6/5YDAZkAvlTKM7OXg2O5SYvgadASSAPJ2rAf0K/PSxw
 Gzu9+
X-Gm-Gg: AfdE7cksXHxpr3XPC9GB1B92C51MXX6O/JLkVS5VPbjuomIY99AucbYUjWJZu/0YnC7
 ar1YeRaQAqYO7x3nam1be8BZAgpTkREu4hn+4PIUXNxIR2KUt6KqV2OzQDIOK1n4/CzxiVff7w0
 uPWUujNDYxugJsX8nZ8xFdepSUYOlv17RqPF62LCk9Ki6TdqIRYV6MHAotg0GgSnp4xzDG2rH/y
 HwZ3NL1WdAhLOdl5hAJfi0h/0XcuauUwqp+GQL8WOtzuyqPJiF6GnWFay2n/xvv5AnnTGDHD1Az
 CTDM0aD9WZEZRnwRZKYKGubEmoIbpBykKI00Zc2DkFF92elGPccqCCu0khRpLnMI239bVI6GQHs
 XC6f+q8zEonvcPzbr+PdzDIvWwuM2hanMCcMLdW4Gl1oO+q5r0OoPje2F4TNqR0vLdCB2HTOYdo
 pK9tj9
X-Received: by 2002:a05:600c:8b65:b0:492:40a1:1e16 with SMTP id
 5b1f17b1804b1-49260849696mr52081305e9.8.1782310009178; 
 Wed, 24 Jun 2026 07:06:49 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:35 +0200
Message-ID: <20260624140645.185318-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310009; x=1782914809; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKXiGLswGOpmjdSO93nxJI/YwE35I0BvcsVf754c+jg=;
 b=dtETU3mTt3/1n32vViBDFzaa+UHf85y/YjgcUhSxeTWtAqaDfbk9ZW4JH+h6s7etTx
 qJgBnCGzjmIgMSGgqQLBoXEMJoIdr9R+UnpNnvRemb/VDK3wBKu+v0dQwpWynDrWPZoq
 Twd6T8Qgg5GzuDipwmMmg7zp5lzK6gXXSeSRLCaQz5azEgS+hakADRi10poxNe3xA8bV
 x86WjviazvBzyjxjDEt21z72rfMinP5//zqcQwHwwMFOkT2c0xKsq1u4x2ofRkuQ2ZqL
 yV5Gw/ND635lJHqkvtxrn2q3UkPtodLT1IUxFMkcNJBCsOyEA3JnQjB7JkTXomsdl2lA
 WZvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dtETU3mT
Subject: [Buildroot] [RFC PATCH 04/14] utils/generate-cyclonedx: support
 vulnerability details
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

Translate the OpenVex notation used to describe the vulnerabilities that
aren't patched in Buildroot into the CycloneDX format.

- fixed -> resolved
- not-affected-component-not-present -> false_positive
- not-affected-vulnerable-code-not-present -> not_affected &
  code_not_present
- not-affected-vulnerable-code-not-in-execute-path -> not_affected &
  code_not_reachable
- not-affected-vulnerable-code-cannot-be-controlled-by-adversary -> not_affected &
  protected_by_mitigating_control

See https://cyclonedx.org/docs/1.7/json/#vulnerabilities_items_analysis
for more information

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 83 +++++++++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index df12ee84c0..c1aa1f980d 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -403,6 +403,43 @@ def cyclonedx_dependency(ref, depends):
         "dependsOn": sorted(depends),
     }
 
+def openvex_to_cyclonedx_analysis(state) -> dict:
+    """Convert an OpenVex vulnerability state into a CycloneDX analysis.
+
+    Supported:
+      - fixed
+      - not-affected-component-not-present
+      - not-affected-vulnerable-code-not-present
+      - not-affected-vulnerable-code-not-in-execute-path
+      - not-affected-vulnerable-code-cannot-be-controlled-by-adversary
+
+    Args:
+        state (str): OpenVex status string.
+
+    Returns:
+        dict: CycloneDX analysis dict with 'state' and optional 'justification'.
+    """
+    MAPPING = {
+        "fixed": {
+            "state": "resolved",
+        },
+        "not-affected-component-not-present": {
+            "state": "false_positive",
+        },
+        "not-affected-vulnerable-code-not-present": {
+            "state": "not_affected",
+            "justification": "code_not_present",
+        },
+        "not-affected-vulnerable-code-not-in-execute-path": {
+            "state": "not_affected",
+            "justification": "code_not_reachable",
+        },
+        "not-affected-vulnerable-code-cannot-be-controlled-by-adversary": {
+            "state": "not_affected",
+            "justification": "protected_by_mitigating_control",
+        },
+    }
+    return MAPPING.get(state, {"state": "in_triage"})
 
 def cyclonedx_vulnerabilities(show_info_dict):
     """Create a JSON list of vulnerabilities ignored by buildroot and associate
@@ -421,20 +458,38 @@ def cyclonedx_vulnerabilities(show_info_dict):
         for cve in comp.get('ignore_cves', []):
             cves.setdefault(cve, []).append(name)
 
-    return [{
-        "id": cve,
-        "source": {
-            "name": "NVD",
-            "url": "https://nvd.nist.gov/vuln/detail/" + cve
-        },
-        "analysis": {
-            "state": "resolved_with_pedigree" if cve in VULN_WITH_PEDIGREE else "in_triage",
-            "detail": f"The CVE '{cve}' has been marked as ignored by Buildroot"
-        },
-        "affects": [
-            {"ref": bomref} for bomref in components
-        ]
-    } for cve, components in cves.items()]
+    ret = []
+    for cve, components in cves.items():
+        # retrieve first occurance of the "cves_status" for this CVE.
+        cve_status = next(
+            (status for comp_name in components
+             if (status := show_info_dict.get(comp_name, {}).get("cves_status", {}).get(cve, {}))),
+            {}
+        )
+
+        if cve in VULN_WITH_PEDIGREE:
+            state = {"state": "resolved_with_pedigree"}
+        else:
+            state = openvex_to_cyclonedx_analysis(cve_status.get("status"))
+
+        detail = cve_status.get("detail", f"The CVE '{cve}' has been marked as ignored by Buildroot")
+
+        ret.append({
+            "id": cve,
+            "source": {
+                "name": "NVD",
+                "url": "https://nvd.nist.gov/vuln/detail/" + cve
+            },
+            "analysis": {
+                **state,
+                "detail": detail
+            },
+            "affects": [
+                {"ref": bomref} for bomref in components
+            ]
+        })
+
+    return ret
 
 
 def br2_virtual_is_provided_by(ref, show_info_dict) -> list:
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
