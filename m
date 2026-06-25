Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C40CDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 14:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37F460FD1;
	Thu, 25 Jun 2026 14:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNuWbqEFfjSm; Thu, 25 Jun 2026 14:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1F2261010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782396759;
	bh=pF8Zqhb8yIG4xtIqV7r9ODJi8EmXphCpH9We4dRqA10=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nOyAfq1SGFiWTMsNHRBd3a4g1ajCSz2QRoJFxhRd9iLFQJEQjm6phGBFAzlL0ULov
	 HNJPD+bbbgVNR3YFaVJ/sTqofPXiN9S0m5+M75nD1erxf0ERbj213sIcmIKMhVAkvk
	 UI8l8RYtp2V64LlEu9pw6Y5ZNof+d3O2GXezXK/EnfWANruRSjWPswKMcSaz/Ieo3n
	 hAol4mcWcjp5e68S+WA/SMHM0GY2GH4mDW20WChP7WF5Y1IemaGgtDxTJN2YsQkLLu
	 endC5b10695suPl8GOOXVhDvUEzJ+Qw3bxd/b/qtm08QDTyAlf0zdfhOKTuqbhIXQA
	 WZe0EGACVpUrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F2261010;
	Thu, 25 Jun 2026 14:12:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 777612C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 14:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 750EF6100F
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 14:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmZagfji53qK for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 14:12:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8ABBE60FD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ABBE60FD1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ABBE60FD1
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 14:12:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso14834745e9.3
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 07:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782396753; x=1783001553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6fmuax4yLnQcYXhKCgi8Hwm/FKorm88Ep8nAgkiGC4=;
 b=kIv/PH/pL00/CWGua66GfD88Scb2oVg8EuU5/HFbuiAndTkXxET/cLK9f6L3g2OfUz
 EsWWQXkkAXDEK2eTIWCPYdoIGWsbrq6W5PpMzb1rZMXdk7nd0swlNAEgfokxvynUJyji
 rktGDvRM16NsesIgrbq+ZIxlPJJwpN1IrevSgL0fmETVdghbjh4I3RA470vWasw8WG5a
 dFe1v1vB1tAr+MlSsc5xLhJ8v9ZNe4ZB2O8boI4PGsXxskBHjbANxOuVB0RkIJv2u/oB
 FY1P1V42oOBWAJAO4GewnOC5TZemKS7iw2OWIBYM/LfDQ6Q+0bgsMQ+wo8wXMExqxo1h
 C7+Q==
X-Gm-Message-State: AOJu0Yx5JyXMp+bvQ49qlSpxc6YsEpVRCxAGnOOGKhfASuatxt5HMAMn
 voSWaL4fPJwo3EDl0RsPkscv4u9+7wdgusFf19WkikZmBrQYeMMjGI9h+GIA2EKBij8PI9T5wJL
 mRXYq
X-Gm-Gg: AfdE7ckkLqBHn7cCb1MrKfScfVvzKQwqFWmhp40NWi+eNRXBIIoRN5Ec80SORWDc0yB
 //5Hgb0hwlOwKyyZdulD3A8DeGN+D30yFIiVTJpaitlPbcRWe8jlaqSAcasKIKXWwYMfj1WBJbE
 /G3hSIXTeZ1sVqUsI28CP8W980TsEWO4d5Lu5fX15iKb75s3DxDqjYd3PuftuViDeSD8ZteRyqZ
 xIsktbNWyN4dOyigS2saeWZR3nJSfKi51OQqHkikJeEqE+WSSq7YLeHllGSW1cidMLUVRbnrus5
 WFv8C3lAbiQ6l4GyHwiJlWXAqeLdJxq+T6YJaFwIfzMbaRJCRkAhIZgXCoF8tA5uml71IEiwokg
 oZQsuwXtQX9nhPKLszcPxfNYVuP4Cx6bp/3DTeOon/xtP4ALmsZ+FyK+YdZ+ikiMBXN8xeGkmWp
 quyU16P3KuRkwvJRM=
X-Received: by 2002:a05:600c:6748:b0:490:c024:2eba with SMTP id
 5b1f17b1804b1-4926688598fmr36809545e9.22.1782396752778; 
 Thu, 25 Jun 2026 07:12:32 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49264082426sm79611345e9.9.2026.06.25.07.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 07:12:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 25 Jun 2026 16:12:31 +0200
Message-ID: <20260625141231.108067-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782396753; x=1783001553; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o6fmuax4yLnQcYXhKCgi8Hwm/FKorm88Ep8nAgkiGC4=;
 b=R2705cVsE3k3qmIuj+RTCVAbNsO/hl4I/jigEPItDL3vBz64ClfGDRGyiiBuhhblFc
 8NKqRFb8N81gKsk2RFp0TlqREpTNJm6zQCo0QCKvYj44mQHb4vVL4eCSgT2lRzWbk2a8
 nybrgRcFb1Ze4TEhtj/5fpBRXOh+yEjo/+ts9luEpWT9r28VJfzZwOIO093ZJnk7IdFT
 oBfmJrYh7GldC5GzXpE2NcPxkWLTNirKoUsY6E6hYkgMCrGPGG5JBCDea3Jfile95NvS
 TLupLYN2byq9HTVIUxqZMjiUULqBiFiL8CVW8uhjUVwQfDSOD3ybrjXO5nrSuZF2vNlH
 HAlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=R2705cVs
Subject: [Buildroot] [PATCH 2025.02.x] package/swupdate: add upstream patch
 for CVE-2026-28525
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

- CVE-2026-28525:
    SWUpdate contains an integer underflow vulnerability in the multipart
    upload parser in mongoose_multipart.c that allows unauthenticated
    attackers to cause a denial of service by sending a crafted HTTP POST
    request to /upload with a malformed multipart boundary and controlled
    TCP stream timing. Attackers can trigger an integer underflow in the
    mg_http_multipart_continue_wait_for_chunk() function when the buffer
    length falls within a specific range, causing an out-of-bounds heap
    read past the allocated receive buffer to a local IPC socket.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-28525
  - https://github.com/sbabic/swupdate/commit/beee2dc0feef1cfe84f1aa6fc980e104b2e47a74

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
(cherry picked from commit 0c6595aaac7288335e8d8bcccc383a8a12f635f7)
---
 package/swupdate/0002-CVE-2026-28525.patch | 51 ++++++++++++++++++++++
 package/swupdate/swupdate.mk               |  3 ++
 2 files changed, 54 insertions(+)
 create mode 100644 package/swupdate/0002-CVE-2026-28525.patch

diff --git a/package/swupdate/0002-CVE-2026-28525.patch b/package/swupdate/0002-CVE-2026-28525.patch
new file mode 100644
index 0000000000..75f99a698f
--- /dev/null
+++ b/package/swupdate/0002-CVE-2026-28525.patch
@@ -0,0 +1,51 @@
+From beee2dc0feef1cfe84f1aa6fc980e104b2e47a74 Mon Sep 17 00:00:00 2001
+From: Stefano Babic <stefano.babic@swupdate.org>
+Date: Thu, 19 Mar 2026 10:50:13 +0100
+Subject: [PATCH] mongoose: Integer Underflow in Multipart Upload Parser
+
+The function mg_http_multipart_continue_wait_for_chunk() has
+a discrepancy between its guard condition and a subsequent
+subtraction in the else branch.  The guard at line 250 checks
+`(int) io->len < mp_stream->boundary.len + 6`, allowing execution
+to continue when io->len >= boundary.len + 6.
+However, when mg_strstr() finds the boundary string in the
+buffer (else branch at line 264), data_len is computed as
+`io->len - (mp_stream->boundary.len + 8)`. The +6 vs +8
+mismatch means that when io->len is in the range [boundary.len + 6,
+boundary.len + 7], the subtraction underflows the size_t
+variable to SIZE_MAX or SIZE_MAX - 1.
+
+This will fix CVE-2026-28525.
+
+Description of issue copied from vulnerability report - many thanks to
+Kazuma for his analyses.
+
+Signed-off-by: Stefano Babic <stefano.babic@swupdate.org>
+Reported by: Kazuma Matsumoto, a security researcher at GMO Cybersecurity by IERAE, Inc."
+Upstream: https://github.com/sbabic/swupdate/commit/beee2dc0feef1cfe84f1aa6fc980e104b2e47a74
+CVE: CVE-2026-28525
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ mongoose/mongoose_multipart.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mongoose/mongoose_multipart.c b/mongoose/mongoose_multipart.c
+index 12ea54348..7fdc18632 100644
+--- a/mongoose/mongoose_multipart.c
++++ b/mongoose/mongoose_multipart.c
+@@ -260,12 +260,12 @@ static int mg_http_multipart_continue_wait_for_chunk(struct mg_connection *c) {
+ 		}
+ 		return 0;
+ 	} else {
+-		size_t data_len = io->len - (mp_stream->boundary.len + 8);
++		size_t data_len = io->len - (mp_stream->boundary.len + 6);
+ 		size_t consumed = mg_http_multipart_call_handler(c, MG_EV_HTTP_PART_DATA,
+-														 (char *) io->buf, data_len);
++				 (char *) io->buf, data_len);
+ 		mg_iobuf_del(io, 0, consumed);
+ 		if (consumed == data_len) {
+-			mg_iobuf_del(io, 0, mp_stream->boundary.len + 8);
++			mg_iobuf_del(io, 0, mp_stream->boundary.len + 6);
+ 			mp_stream->state = MPS_FINALIZE;
+ 			return 1;
+ 		} else {
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 647a6f071b..ecf7864225 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -20,6 +20,9 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
 SWUPDATE_INSTALL_STAGING = YES
 SWUPDATE_DEPENDENCIES = json-c libubootenv
 
+# 0002-CVE-2026-28525.patch
+SWUPDATE_IGNORE_CVES += CVE-2026-28525
+
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
 # TARGET_CC is used for both.
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
