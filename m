Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B789FCDE002
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5967C60872;
	Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5r3Vb6i_gZ6; Wed, 24 Jun 2026 14:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EAFB60881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310014;
	bh=HfjC0SjYQ3ibMv0zjHTyXXrExZRYk3iE+DFYhZS0kN8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=HC4PrE3mk7cPinvVUwRNVjFMlhwAk0qf5xMImzVKn7gU11fv5wsK5IvINXTNvP44i
	 Qgbqy+n0e/I1Qulbd0KZ1IWloUc+QwTfhDd2sJc93tU5HpdD5vip/Y8i0x7KD4YIjH
	 +1NgZ4l4zurTcrAe/t8F42ymUNu4OrRoS0aYahkJY0QWKroJhEXG2/WehZ7FwMi/Rd
	 +/Re/vq0+nvpY0rka0USTFd97cK+Yep9KrbcleKVYybPl6gtDxkfaP1Nx30TxH8dsK
	 /cpj5WkvR6/C+pp+PbZOJ6f4B+K2KrEx4e2Io5bAY4zpCI6YgsYso7w7GCLogdijLL
	 FkwqLFaum7BVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EAFB60881;
	Wed, 24 Jun 2026 14:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6014367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6C3D607F0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdEQVdfkqWi2 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34CEA60829
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34CEA60829
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34CEA60829
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490b9318997so5779435e9.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310008; x=1782914808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k1VfvOGJWECHbJAxrOIWtyhFz95ARBNLSjXnFWFVXRo=;
 b=IcJkwQzEGQD3z/j3qfOqUH8J1LcsGcX1Hb0C8d9xaCzjqe2nCP5nKkCAcIw/P2QEAn
 WlGhQiWANtWBPBAamT0sDCI/lApj/vT3mT+n6AdyVCPOMdYp/Q8BgYJ/mQDgYeYIKZMR
 4u5CLCS+CImn6pQ36fgrRW5ZoJqAy5pAAug2SnUnSBZhqlhWIM698vS5QYPYEPA3rKtZ
 QC4030VA1+InGMqo6YHDC5+38fkr3ODoSY5ZZ8ovpT6uzqntWqnMpxaAqtFBp2+Ug+zu
 efzDgpIFZG/ubJEr0CbvZQHXViPF01tYW6aazrsraxVDDWVBEMp794eD514Ermk5+5nZ
 ja9A==
X-Gm-Message-State: AOJu0Ywd3FR+zz8wfhYk5sDU3OMWuEJX9pNAfqc/4KAjLlUCjtGsqE1o
 t2zUOPfbitnLxRux1+mEfG7EVWlcTiGqgTTkR97MqBUTW89MFiMMRvDECBCdMNyZvB4bteQvDDT
 8ue4P
X-Gm-Gg: AfdE7clNRumBmGDY8VpCrGNMpOuXcsD7R/U2uvb8UAPdIsR6aApxgTXVrPdPKpUdnwb
 hVjSbgWV+QmzRnChoPlyP1JsR956sxyxat8XyKmfpjxwS7Jo3snzWopeiMnMGrRcUXF1a/DTkNA
 1WstN7OYLOYOkUD6D10XH0FH0E6ij671E3MKuS8NwOcZZu8lbbf8+o9xx4zhtRzOwB/9TXCCKbt
 0s3HDn846h04FBXEl/Lr6aZjSpyQFFFOI+AhvoljrzyuERFzNTKyXDcmJcF3ycgEJPgUuRiCE1f
 ZrjwkmSV3KLVsuVfGqy0nVC/2NfbGlrP0+Q0+tU6m4Myg/6p25Ml2HQ4I7cFyJBF6EDcGT6d4Tr
 idZ+Kbnog0vGVx75TU4q0mYdZIlU9JrDd8ryv0uBTh3u0vSmvuwfvJMNB3U6GJh//hiI5I9otei
 CC+eYI
X-Received: by 2002:a05:600c:1d0f:b0:492:4a70:faaa with SMTP id
 5b1f17b1804b1-492608523b1mr46681805e9.11.1782310007994; 
 Wed, 24 Jun 2026 07:06:47 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:33 +0200
Message-ID: <20260624140645.185318-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310008; x=1782914808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1VfvOGJWECHbJAxrOIWtyhFz95ARBNLSjXnFWFVXRo=;
 b=DO4nrOv0D7Hs1iKrI0c/YDysDvej5cH/Ka4wmRkn+CfhMtQ0ctg0rK3hd4ZjQJERCQ
 cwk9AvxVk3Yau/GK+oK6h5z7/u+QGEvC5dRTzNGFPX+FoFFNN4udTma7uT3ZX+Y7tU62
 2J3as8ZVm4JbOdv0wbEinmJdw8VyvfPEoJ/ChrMXQiF7wRLueZuC6t9XgpTHABNaWR3f
 q0T4fENZrhN1Scb/dNwCUA8lSHWEsOM8shXcK3a6IyQfrqw52OPpT2KxabYcRkvRai3i
 JnzVSzEDxEWfRN37rJAx/6G1MpQbDzEULMQ71aZdaE1h2WavSvaI23irliGCFFCIBqUC
 1g6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DO4nrOv0
Subject: [Buildroot] [RFC PATCH 02/14] utils/checkpackagelib/lib_mk.py:
 check _STATUS value is supported
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

Check that `<pkg>_<vuln-id>_STATUS` variable values are using a status
value supported.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/checkpackagelib/lib_mk.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 5d48e8929c..6201d324fa 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -443,3 +443,25 @@ class CPEVariables(_CheckFunction):
             if field == "VALID":
                 self.valid = {"lineno": lineno, "text": text}
             self.non_defaults += 1
+
+
+class VulnerabilityStatus(_CheckFunction):
+    VALID_STATUSES = [
+        "fixed",
+        "not-affected-component-not-present",
+        "not-affected-vulnerable-code-not-present",
+        "not-affected-vulnerable-code-not-in-execute-path",
+        "not-affected-vulnerable-code-cannot-be-controlled-by-adversary",
+    ]
+    CVE_STATUS = re.compile(r"^[A-Z0-9_]+(CVE-\d{4}-\d+)_STATUS\s*=\s*(\S+)")
+
+    def check_line(self, lineno, text):
+        m = self.CVE_STATUS.match(text.rstrip())
+        if m is None:
+            return
+        status = m.group(2)
+        if status not in self.VALID_STATUSES:
+            return ["{}:{}: invalid _STATUS value '{}', expected one of: {} ({})".format(
+                self.filename, lineno, status,
+                ", ".join(self.VALID_STATUSES), self.url_to_manual),
+                text]
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
