Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73688F9D0F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C11742C07;
	Tue, 14 Apr 2026 19:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJHkrAvv6mxR; Tue, 14 Apr 2026 19:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 221AE42BA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776196542;
	bh=EvfWU2p7LUqQxbu7IgAG0PtYQ6We1ofED9BpU1GJnII=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bHk+ripNRyvgzVmjw3zHiaD/au+Kqz3K0CgP/BNObON2zCUoBA/9m0EGcIVVlzASP
	 35AoQ/sWdpFy1ZK52edqgYd8hpX0k9xHGTCANbvV7CrYZJB52wOLcdYp3kAA1EcKvQ
	 7gfJvnEPESpBr/KXYeGm1fLr3ZH9vm4mdc8WRnk4PiOKRN8nmZNkFSROLrPScrNQNv
	 Fgt1IJZnrx7muqE0fMfgnUENPk8sABJ0BY7BSFAoTGZN7V8jtO5j6Y8pxZHciUSytE
	 ElSC43j1YI/aeSA3tZFoOZHOhMlgN/1Csr03crZynEFiakBpUGmRQX7LXX4zEocC/5
	 ua4F7nT/i11dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221AE42BA5;
	Tue, 14 Apr 2026 19:55:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E528375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FE3560613
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhZP3aGZ9faA for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:55:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 128E0600CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 128E0600CA
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 128E0600CA
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:55:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso63603275e9.0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 12:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776196537; x=1776801337;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=phw3Z3MydtDPud4QuIDwPkl5aH5FLAiqYCJruSPTzyI=;
 b=QCA7veIrr7hT/XofLV8UQ/2lbGdUFHFNkymEeSaK5PrKeP2gaD7LnDLaQ+axyVECz4
 IFerFr3nfFTJJJt8tvWo1pL8yAmDhXJ3Md9SvTypFex6XYpcG9QpU5HNV+0/PnStCPxt
 d9aMv1Y6LBCNawag7Cb0odMuYcbkYxEfQbnzDiFFVrkRtudyadsMeNj9vUkg2DrkIwkV
 6O2Dq/xmpNaHTM0obLWeiOIh4mXhSX/ypGmD89l7qV64t9w8k7cfj7wlwl0zttliV2t1
 d6gOU3SejefEAYWt17ltEdQzd9fPEj+fxP33poJ7Ox+s7pTRrl/Nzf1Bqge9X4uy6bQo
 pjww==
X-Gm-Message-State: AOJu0YxCMJf94sKXVIuYvCNdLq6CFIwFqSoKwf6b9+ruMr+i/wwfBpNN
 osmGDk03zva/5nVZizwAIAMm1Vg+fIw6uh9iTR9HIGXC4TwwRXDQ7Ze9aIr7xL2TQ13clplFQmO
 qNeHF
X-Gm-Gg: AeBDietp/f/2g1v3G33coJ9VN3lzyc5RpjNXBIv9oCunllUss02po7t76jTT6w/ukXX
 S7Wf935w1JLVpAFtm9ANq7GwBGwCAEdbsZmR6nhDGx+MEJR+IXNJNA+QPbMHdQiE/GPaRKh+4Nn
 5yAEP3VW+MHw2KhvcUqZulWCdI7lfR4HW/bLz3KYDppTVV6OGl/pdqs8eh4OQ7zhI+OWg430T0L
 Es4m/IanQQNDBBWTB+3MXbon+pMj29u+AvajT3MyPQZETobNOlunWyp1HBtA5TM1hXrdhsZWtoy
 kwKTFDy4bYRmLelSb/hTyGPLKfIOjaW1xar5jwDr2dlOWcJ+M8Bk6ysrH9R3OGj5Lxv+gBokpBx
 4BhPgP1TXYgtUQcgA1xl9lUR/wRWWosfXjDZmL00TC6Lv5wXvJS+JPZgY3QSIF+E9gGn2KCQvOF
 FtL6du/YygQkiPI/Zrq1UUWj6Rbg8=
X-Received: by 2002:a05:600c:c0dc:b0:486:fe83:861c with SMTP id
 5b1f17b1804b1-488d686837bmr167235865e9.7.1776196537106; 
 Tue, 14 Apr 2026 12:55:37 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede25a12sm64781395e9.9.2026.04.14.12.55.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 12:55:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:55:36 +0200
Message-ID: <20260414195536.19279-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776196537; x=1776801337; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=phw3Z3MydtDPud4QuIDwPkl5aH5FLAiqYCJruSPTzyI=;
 b=g5IPWf1EtWsDur9VI+jQtDEfo3gIE9P0/YglcHjv6cbdG4PpICDaszG3YEGEbPxAAc
 pivfNiFoOEfs8L5YcU8p5k+TKg6yt45Vyiu11PGTLtNZaBZHretWk7n8yWaCiOY8hP0e
 N5AsrVek731/Q+m3dypHULO4SAB9T8tKeKqI01VhZNoN8PjMm60hG3c+JNV1hzFMTHSo
 Zfrp4J144Pp237TKHC4VPuT4kjMnlDUakd282uIyvaBClCyYp+eP9TOKVYsnhXdcOHSW
 31wjvdyoDCE0hXAj02o8vxiTBOVv9O4INzGZguUlUXVsN0byuLmaPTC139fdO+xEf5Am
 Yfvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g5IPWf1E
Subject: [Buildroot] [PATCH 1/1] docs/website: add Calian as a bronze sponsor
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

Calian provides a diverse set of mission-critical solutions to solve
complex challenges for customers in defence, space, health and other
critical infrastructure industries.

We thanks them for contributing to the LTS maintenance as a bronze
sponsor.

[1] https://www.calian.com/
[2] https://www.linkedin.com/company/calian/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/images/calian-logo.png | Bin 0 -> 2135 bytes
 docs/website/sponsors.html          |  15 +++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 docs/website/images/calian-logo.png

diff --git a/docs/website/images/calian-logo.png b/docs/website/images/calian-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..762e0b13dc02e2b3f28e0b819a98f8a9263eb0d5
GIT binary patch
literal 2135
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
a<AkMG#1poy@Md6OVDNPHb6Mw<&;$U9r|pFR

literal 0
HcmV?d00001

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index cf7cba9806..8353b149e6 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -74,6 +74,21 @@
     <div class="panel-body">
       <h3>Bronze Sponsors</h3>
       <div class="sponsors-container">
+        <div class="sponsor-entry">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="sponsor-title">
+                <a href="https://calian.com/">
+                  <img class="img-responsive center-block" style="height: 100%;" src="images/calian-logo.png"/>
+                </a>
+              </div>
+              <div class="sponsor-body">
+                <a href="https://calian.com/">Calian</a>
+              </div>
+            </div>
+          </div>
+        </div>
+
         <div class="sponsor-entry">
           <div class="panel panel-default panel-lts-sponsor">
             <div class="panel-body">
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
