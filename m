Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80960FC590A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 08:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF154080A;
	Thu, 26 Feb 2026 08:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19lTV975EoAt; Thu, 26 Feb 2026 08:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADE5407FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772093220;
	bh=gQRfMWf555dFEm+6N3CE6DcGorOhpMITEXQHZLCw+Tg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IljBEVu1ZVsrFMwj0pf7YnkvlhrZngQro6oYF6foJwt04Bp721yGWmrrFckloMDVq
	 o2ry9YBNCmZfOokUMUBRRuix5faVxSuoQmNRNExNrdVxRyVYdxnqffQSWD9PM8zLcI
	 IHqxbYXCiCaBATmEJVjLqH5vDebBhfKeOYa+lJsbqE/xMkDz8NasZg5Qi5/xLswqj3
	 RlzAfXDNFAK03P27t7202ZTdOTwUjNSGDDc9TYnS4plULvLBGikYrkJPwuSESVTFOy
	 tPVBVUUJ8nXitOm7gnn0pSwawEU74G0TTTSwjYfgmU9RinJ4MRvlPJPUK2PwVMApgt
	 4fSo+dsUhGLQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ADE5407FC;
	Thu, 26 Feb 2026 08:07:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2783024E
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 08:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15B0D40448
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 08:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kE9ujGONbGMs for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 08:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 713B74007F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 713B74007F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 713B74007F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 08:06:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso6190625e9.0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 00:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772093214; x=1772698014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHobTWzOYTmYnh8hcJA8Nojple/xRlOU9WF7j8I8Yp4=;
 b=XIxAOZbhYevfYxnBlc2kLoU1ipl0fxFeciCJTpiXj2T2DS8xU67k2jn+s2ClFqbcI5
 aa4HfNV32mlO11UlZCEgVWYCzAt/uhpj1ib9fCTGiCv52ZUEvfwTqHVh5HpzexWp2owg
 El/m5ObK7teLnWdJT/zlESe4Zl94Bxkx4Rw/D2TTPO05iO0mU3BZv0iV5OPHYOeLOgW5
 UB9AtPJE7GMbu5IxeEY1NCbfEerdxtOI6wLcS67Bg8GtPm/icyFJM1TOrhucidozft87
 J9Ig5QnsoEiR4KR1k1izeWVimHRNPQpYujvp0wgk2Dos97mUawcYOqqLciVaibMcU98m
 3cuw==
X-Gm-Message-State: AOJu0YzZdk0OOKcKNNKvIttU2bAnJddb54TqbFWnceqIZfS4tapDRfn9
 WVJVNW+sSUQyHcdSA5HTRlWbDEmEo/nit0zQOiFsUwvG/MOPZi3ixWw6S+xtZZgntqWls2S094+
 5EXrZ
X-Gm-Gg: ATEYQzzEzLi3+ylK+deFIaddGLdLRFVbk5TjIXA8S/IdwM9Zg+Gvn+CAx62s2XDmebC
 BW+PlkvmNh2cO+sWoccM5Y4YEZRVjSQZHsIRBI4F9bOqQKzBGeV5Sqey/OYKb9vbL+vyJxnIBIa
 5wQ/w0auDQHdjZIvNjetcL7dSKyrUmuL8nP2sTvpbH/n3g+Hjks0Y4el9/09k3grNiX5yMx1H7J
 Ks8KlQdF9O6C2Pdsi50n+2JDvqF+fAyBonPKTGSIO73N9Wawh5eC/uv/9hYKxOMqehBubm56RnT
 Dd9FxOuBannJzbfWzllFk4FvRWoJB5p5m2ImWJZzs0lWj9UZQZKIZzhErDaRxucsC6WDVp3E7AL
 UOyqjXMfSGa8N1HLDFtXKxjm8uxSWOU1ryfZGf29yGHaYDAru7TVRJngJg4dyhe9CH9y+a+P6E/
 8/FqP/+6GFU9mebMQ=
X-Received: by 2002:a05:600c:8708:b0:483:a922:2e8d with SMTP id
 5b1f17b1804b1-483c216ab55mr46921435e9.4.1772093214300; 
 Thu, 26 Feb 2026 00:06:54 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c60bsm38776319f8f.27.2026.02.26.00.06.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:06:53 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 09:06:51 +0100
Message-ID: <20260226080651.19171-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772093214; x=1772698014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KHobTWzOYTmYnh8hcJA8Nojple/xRlOU9WF7j8I8Yp4=;
 b=cpOs0lArcs+RU/mpJ8t8b+tRDyirMBt5UggSFaFK80IsKMzPQwg5QoNsCfGpRSamxO
 1XYJNFZ3mGloKzsoxmXcVUZJAumJFPsLAX/fNhlqHZKcHF6m1ExNLRvh9Rg/r+uTobIy
 xNvTXFmECHqAPJeqSPQG6rRWqcKGiWZbUDzXF66e4KjwbzYnmqGtTzhNMXdFm9XpH8Dx
 SwwM5KfiNvkKk2NQ2bYNOnV55EYIUYFN+wJn34jNY91L3Df0fSS6LBcN+rOsmDclSc8U
 e5L5yM96eeyGjmbpKM4+tMnjuKd+DixVqhZMCIW2e6vCxTJtMfDXydkL4eRNpx3z0rLG
 H4Wg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cpOs0lAr
Subject: [Buildroot] [PATCH] package/igmpproxy: add patch for CVE-2025-50681
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

Fixes the following vulnerability:

- CVE-2025-50681:
    igmpproxy 0.4 before commit 2b30c36 allows remote attackers to cause a
    denial of service (application crash) via a crafted IGMPv3 membership
    report packet with a malicious source address. Due to insufficient
    validation in the `recv_igmp()` function in src/igmpproxy.c, an
    invalid group record type can trigger a NULL pointer dereference when
    logging the address using `inet_fmtsrc()`. This vulnerability can be
    exploited by sending malformed multicast traffic to a host running
    igmpproxy, leading to a crash. igmpproxy is used in various embedded
    networking environments and consumer-grade IoT devices (such as home
    routers and media gateways) to handle multicast traffic for IPTV and
    other streaming services. Affected devices that rely on unpatched
    versions of igmpproxy may be vulnerable to remote denial-of-service
    attacks across a LAN .

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-50681
  - https://github.com/younix/igmpproxy/commit/2b30c36e6ab5b21defb76ec6458ab7687984484c

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../igmpproxy/0001-Fix-Buffer-Overflow.patch  | 25 +++++++++++++++++++
 package/igmpproxy/igmpproxy.mk                |  3 +++
 2 files changed, 28 insertions(+)
 create mode 100644 package/igmpproxy/0001-Fix-Buffer-Overflow.patch

diff --git a/package/igmpproxy/0001-Fix-Buffer-Overflow.patch b/package/igmpproxy/0001-Fix-Buffer-Overflow.patch
new file mode 100644
index 0000000000..b9f03386a8
--- /dev/null
+++ b/package/igmpproxy/0001-Fix-Buffer-Overflow.patch
@@ -0,0 +1,25 @@
+From 2b30c36e6ab5b21defb76ec6458ab7687984484c Mon Sep 17 00:00:00 2001
+From: Jan Klemkow <j.klemkow@wemelug.de>
+Date: Thu, 17 Apr 2025 19:02:16 +0200
+Subject: [PATCH] Fix Buffer Overflow #97
+
+CVE: CVE-2025-50681
+Upstream: https://github.com/younix/igmpproxy/commit/2b30c36e6ab5b21defb76ec6458ab7687984484c
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/igmp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/igmp.c b/src/igmp.c
+index a80c4e58..838694ce 100644
+--- a/src/igmp.c
++++ b/src/igmp.c
+@@ -94,7 +94,7 @@ static const char *igmpPacketKind(unsigned int type, unsigned int code) {
+     case IGMP_V2_LEAVE_GROUP:        return "Leave message     ";
+ 
+     default:
+-        sprintf(unknown, "unk: 0x%02x/0x%02x    ", type, code);
++        snprintf(unknown, sizeof unknown, "unk: 0x%02x/0x%02x    ", type, code);
+         return unknown;
+     }
+ }
diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
index f2c32939ff..d7d7691c8f 100644
--- a/package/igmpproxy/igmpproxy.mk
+++ b/package/igmpproxy/igmpproxy.mk
@@ -13,4 +13,7 @@ IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
 
 IGMPPROXY_CPE_ID_VENDOR = pali
 
+# 0001-Fix-Buffer-Overflow.patch
+IGMPPROXY_IGNORE_CVES += CVE-2025-50681
+
 $(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
