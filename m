Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5865FC5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 19:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE7A2607C5;
	Wed, 26 Aug 2026 19:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qU7iAIxRoCr; Wed, 26 Aug 2026 19:12:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787771525;
	bh=MsYmhXJQa1yoLTxBGAiRNMwH4qqtbDq4dituoIMp83o=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eca395yijJ1hquGoPFeqBYHWA37OlkVg9115KVhgOxQ3Dmvwvp3TIyJ3+sa5iFEij
	 1mItKgbqB8Z9xc3CWdKmzCzZCXwC2kMbVnS35vVZBoH3nXSq18Jbpxtv8+RGC24Xxr
	 vVWxN8MfiaJbbSxiKmmQHIPozFWAN+OPdE6vbT/X8cSyuXSR4qfldQsGiP2FQKXTax
	 UNgEzAhl9haQKNpWkBvWq5CwLPC+pmnyTZN2ez4lGe+/uicZ7ZNdjqC9VYKIK7IJUM
	 4kUgfLXr4FJwk354D+aWDEpavD73mSCJ1iRq3oQ71kES8usyqcqzRnU21ZtrxvdvPO
	 K2v1m9C737C6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F1460788;
	Wed, 26 Aug 2026 19:12:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFE2A230
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 19:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9695440869
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 19:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUxDnKS8FolF for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 19:12:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81DAE40866
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 19:12:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so1036399f8f.3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787771520; x=1788376320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rF6uZ4Rra6ha/olayQeW22cVYV0tz47k6VG+HDkeLpc=;
 b=SWPdFfYDcvv5iuOnI8mr6YsZBNqiYe/B7nLR8yEt6JbOQ8QHh3njc1OcN7ceipRKo1
 5E9pkf63bAbEkTcVMYkQV1NR0Ombv+ourwDcFxEd5UnaDSyIPGdS7x+vBL+s9wxAvoLe
 AsX8KBsWWxzt52foR1k+rc1lEVxbc1M4PxWrEiW4OH1Vrh/Nx8uvyPal/rtH2IVT8fz0
 KIKJ+1ODLfPJ+Zdlnjepi8s4nuo1L82l0xRhYlmR/d1rQtLYj2yJNe5+FlwNdLDiFQ24
 BQR3ZY3nClBdXUCAwawLj/5S/ALMpzjkH20KLDlo/gJasT3zdG3m5av/mR3efATzWUUP
 nffg==
X-Gm-Message-State: AFuF++kwfy9XMqV6S9K8dRQScy7E/zl/ADgkJ1ZbhmwXPgJ4m9AvufrB
 3ZYz5b/76YwczFG+GLoi4DmQD0xkF8N0TrFKBqBVdkpUBuhRWUav6KnxzFXBqNRKLNSkOGBY/d7
 a8ph2
X-Gm-Gg: AR+sD11siJF/FUbQ2MBnFAszAeUX+Q1UX6rlSLMZ1wNcB6if8wvQLoTriCqLdg1jaO3
 wIZtd/l5JtznPrlyYSrOCVJ8uwZ/xfN9hGtdj3XmaMtZW0apL5HhDlj6l3hcTCuMdMyIVRB0KKG
 uzGRf4dIQ4u+7jqdVwqpGqshv4trIE9CiIDxy4NXydp+N9ZUyFbk+DsWzXy947nzucjM7NlMOyH
 qe4q9o3Vm1OoGEt4SZPqO5j60V5jAHksWA1SUmTIrUXmx/WV63ndxMzQnd2smVOLklZOMk/7rbe
 VKX9SEJHHkrdZmdBg+eV+yv23Xor1du3Y1XpRLEzhko5+ROEZHCJeaLqGOlhESHbA51xYAvvnO1
 xEdQYb4yft0bYWmeFzgYm5Mx/5SBCnNZNukZOVuiHAyn1aOIAsUktdRCMYlbhzpYfAAGaC8hGbk
 4GKtt3xlRQmeWm0RtNuiFw5ABFDnebdDOSbSRgOv6QKeN3MTyarWpohg==
X-Received: by 2002:a05:6000:2f89:b0:47f:d011:f644 with SMTP id
 ffacd0b85a97d-482e26963f8mr10477705f8f.4.1787771520486; 
 Wed, 26 Aug 2026 12:12:00 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e279eb11sm3662230f8f.8.2026.08.26.12.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 12:12:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Wed, 26 Aug 2026 21:11:59 +0200
Message-ID: <20260826191159.711051-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rsyslog: upstream patch CVE-2026-19654
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

- CVE-2026-19654:
    A unauthenticated remote peer may lead rsyslogd to crash due to a flaw
    in the optional imptcp module. A crafted input sequence during
    oversize-frame recovery can cause an invalid internal message length
    and terminate rsyslogd. No confidentiality or integrity impact,
    privilege escalation, or code execution has been identified. imtcp and
    the default imptcp framing modes are not affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-19654
  - https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...rd-regex-framing-match-at-line-start.patch | 47 +++++++++++++++++++
 package/rsyslog/rsyslog.mk                    |  3 ++
 2 files changed, 50 insertions(+)
 create mode 100644 package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch

diff --git a/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch b/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch
new file mode 100644
index 0000000000..5eff609fdf
--- /dev/null
+++ b/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch
@@ -0,0 +1,47 @@
+From 07b3c40a5a78c79ed9109251f842ca7e955dd586 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Mon, 20 Jul 2026 17:19:28 +0200
+Subject: [PATCH] imptcp: guard regex framing match at line start
+
+Why
+A regex match at the beginning of the receive buffer can form a
+negative message length after oversize-frame recovery.
+
+Impact
+Regex-framed imptcp listeners reject that invalid transition instead
+of submitting a negative message length.
+
+Before/After
+Before: a match with a zero line offset submitted an invalid length.
+After: only a match following an existing line can submit a frame.
+
+Technical Overview
+Mirror the line-offset guard used by the shared imtcp parser.
+Leave existing regex framing and oversize recovery behavior unchanged.
+
+Security advisory:
+https://github.com/rsyslog/rsyslog/security/advisories/GHSA-cj5r-wh2m-7w29
+
+Reported-by: Raphael Eikenberg (@eikendev)
+With the help of AI-Agents: Codex
+---
+CVE: CVE-2026-19654
+Upstream: https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586
+Signed-off-by: Thomas Perale <thomas.perale@mind.be
+---
+ plugins/imptcp/imptcp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/imptcp/imptcp.c b/plugins/imptcp/imptcp.c
+index 838e1648fc..90a7d6f7ed 100644
+--- a/plugins/imptcp/imptcp.c
++++ b/plugins/imptcp/imptcp.c
+@@ -1009,7 +1009,7 @@ static rsRetVal ATTR_NONNULL() processDataRcvd_regexFraming(ptcpsess_t *const __
+         pThis->iCurrLine = pThis->iMsg;
+     } else {
+         const int isMatch = !regexec(&inst->start_preg, (char *)pThis->pMsg + pThis->iCurrLine, 0, NULL, 0);
+-        if (isMatch) {
++        if (pThis->iCurrLine > 0 && isMatch) {
+             DBGPRINTF("regex match (%d), framing line: %s\n", pThis->iCurrLine, pThis->pMsg);
+             strcpy((char *)pThis->pMsg_save, (char *)pThis->pMsg + pThis->iCurrLine);
+             pThis->iMsg = pThis->iCurrLine - 1;
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index dedecdc572..bcc66167af 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -12,6 +12,9 @@ RSYSLOG_CPE_ID_VENDOR = rsyslog
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 
+# 0001-imptcp-guard-regex-framing-match-at-line-start.patch
+RSYSLOG_IGNORE_CVES += CVE-2026-19654
+
 ifeq ($(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),y)
 RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
