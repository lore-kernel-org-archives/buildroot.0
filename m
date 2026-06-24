Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D37CDE003
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFFBF60AD3;
	Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r06SyK7D5w4w; Wed, 24 Jun 2026 14:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 364FC607F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310013;
	bh=w1fjpvQTQUpU59UN0iY8wsvYOB0DAj7Vzs5J3INMPk4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=NhwGBaR7LHJXmvcQwEwSWtvJVNExVZxEuiDmOaTBi5JOOVsWq799aCd9cM5C7sx1A
	 sm3zJXI4kUqevrW6pe1O6lyjKgNZ4OSVdrpiwA5SSp+uLubGit1G7DFMahteRHMYRb
	 L/7CUAcNq8x6PC//KJ3dMtJuEIaN7HQYgbFo+ME53MClBE+iDTxSc+mJCtXQrFRYuJ
	 lKRKvfYuvT38cncxiKSq5CARCetJTKw+lyYqbqie3BbmGeVqvvi2omWd603RK74j2F
	 OpGOf642OiZlsU9AWWxVZY72o7NzxOoGOvc2g9lcPghJOvCKuSut5EJDESk+ShmabG
	 X8LSwgq61KD4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 364FC607F0;
	Wed, 24 Jun 2026 14:06:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A037363
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C20B40911
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqmxYM27IEeo for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CAA71408AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAA71408AF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CAA71408AF
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so15961475e9.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310008; x=1782914808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X+8uYXfEUZbj0uJzeMLgDZRNTNRk+xjm7XU9vg2cn8Y=;
 b=igj+p0PQd1t9ghnjLRL/sR044d5KGQTRHS7mD9aND4PCt+whmy5w+nNG0sPsu+XBcV
 RMztvnt+nZFmOXLAT6VJFy8T7IBeR5YhA6P+W9IX2JCaj2jGmVUyFJMdxER6Rxuk/waF
 7MZ+k/Ly6gFc0Jse1ZBwYAynG71Mhi04qvJLSXSe5vFOfLuaiV18gNBus+ZQiqYe6zYE
 IDXTis9OigVxxPFEPc8ILz44mSok5FSuVojwG3UTKe0h4Mb9DcQKs3OY3jIkndQIWaM7
 cziBv8NxyJp2sXuxQ4BPtp1QnRuOo/a38xY0mCGVE9DsmeA+sb7F8uV5FW4P7qaVDAVo
 L/FQ==
X-Gm-Message-State: AOJu0YzkbwdLqbhq9I7IktKKfgOuDKgNg7Z+5K/c+0hUKezrpaLQoCMI
 DzWdmbrBkxVAFHR6bvKQPfePFaGy06V7lEt6R0orGmLtbqaziB0ADhnU2rxHt3nYA5l2Nuc3Brq
 XENXi
X-Gm-Gg: AfdE7cmPo8qtq/Ua+1pxy7+i8En7Xcgt7VelFvVXcmuMo78mhZ5NGp66s467Tvrp49C
 q3xW6ar2Q2vHtX8wPy6loGd+RzETwl7ZpRkK1KFndREAYDs5EgnBo1oabMUkxmGJksGMPVC9pkD
 1V/+ccWBnVbWlAgmbtm6npECQdV38/QJBEUJTnjUJ3FuAei+OpYHDHv/OmxgNX60kJjtTIwlvga
 tHB1dccxMueBhUa5JYXvWfdi4m6jxY8dNfFgWmDIlfW0zRb+PFHytvGWGdEx4dPGgBEkqBT41Y8
 GNWjv/LgwVs8fssj6N4tnzw+F0my7q6tXZ7sWRLuIivQMsb6NnqFyo4TUHVHwbPYf8bwlRojXnX
 TinGikf6TG3yKGkCbEh3YCiUyTq0CSoJOPnjhZmsRPgmI8SCbPNbk6w6JYCqeC2JhE0qWpyQnlS
 qres9/bqYITo0X/6Y=
X-Received: by 2002:a05:600c:4747:b0:490:3cf0:8d81 with SMTP id
 5b1f17b1804b1-492632b20b7mr8970385e9.13.1782310007482; 
 Wed, 24 Jun 2026 07:06:47 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:32 +0200
Message-ID: <20260624140645.185318-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310008; x=1782914808; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+8uYXfEUZbj0uJzeMLgDZRNTNRk+xjm7XU9vg2cn8Y=;
 b=UWowOXZZWHv/LlNYzxl5LbOAPxBrHQ9U1Rb2Sdj1+AZ1W09+tKbdENzjYekRcOjgm2
 2RYwLiAChdkS2M7XWEIVIWgd2DExo+rqe2SDhDCyCt7kycp11LVCrG7lRIpSVnjmneL2
 oZk3jQzVv6+YjQiL80MGB2tbbTkSdBAAzY47dBO+HiIUZNTVx52U0RiWl9rWlbBWthbr
 YDziS1biuTnoHn6y2eWxFEbqGh5uLngVmISzImw9mxPDggZMBbjmRlZKPoV5tZQnBnlX
 KhnzhY9PZjiz+8Dboh49ZvHOjZCgVtZ4ltsEkkifoUOuw1bo5DFPM2ovFCJWdeipohRL
 QdWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UWowOXZZ
Subject: [Buildroot] [RFC PATCH 01/14] docs/manual: add vulnerability status
 and justification
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

In Buildroot, we can put the ignore CVEs entries in different
categories:

- Vulnerability fixed by a patch.
- Vulnerability ignored because the internal tooling detect it as a
  false positive
- Vulnerability ignored because the database is wrong or not up-to-date.
- Vulnerability ignored because it doesn't apply to Buildroot
  (platform/hardware specific, ...).
- Vulnerability ignored because Buildroot is using an upstream fixed
  version (based on a hash for instance) while the CPE metadata
  reference the latest known version.

Since the introduction of `_IGNORE_CVES` the justification for the
vulnerability were added as a comment on top of the ignored
vulnerability. With the introduction of the rule for the `CVE:` trailer
it's now possible to distinguish the vulnerabilities that are patched
from the one that are not-applicable for another unknown reason.

This commit add documentation to introduce two new variables:

- `<pkg>_<vuln-id>_STATUS`
- `<pkg>_<vuln-id>_DETAIL`

This allows to have machine readable variables that are exposed and
contains the reasons why a vulnerability is set as ignored instead of
storing this knowledge in a comment on top of the `_IGNORE_CVES` entry.

The `<pkg>_<vuln-id>_STATUS` syntax is based on OpenVex statuses syntax
[1][2]. This varialbe only needs to be used if a patch on the Buildroot
tree isn't present.

The `<pkg>_<vuln-id>_DETAIL` is a free text field that allows to add
more information to justify the status.

[1] https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-labels
[2] https://github.com/openvex/ospec/blob/main/OPENVEX-SPEC.md#status-justifications

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/adding-packages-generic.adoc | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/docs/manual/adding-packages-generic.adoc b/docs/manual/adding-packages-generic.adoc
index e7547460fd..47b28adf4b 100644
--- a/docs/manual/adding-packages-generic.adoc
+++ b/docs/manual/adding-packages-generic.adoc
@@ -520,6 +520,41 @@ LIBFOO_IGNORE_CVES += CVE-2020-12345
 LIBFOO_IGNORE_CVES += CVE-2020-54321
 ----
 
+* +LIBFOO_<VULN-ID>_STATUS+ informs about the impact of the vulnerability
+  +<VULN-ID>+. This variable needs to be set only if the referenced +<VULN-ID>+
+  is not fixed by a patch present in the Buildroot tree. It support different
+  labels based on
+  https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-labels[OpenVex
+  statuses] and
+  https://github.com/openvex/spec/blob/main/OPENVEX-SPEC.md#status-justifications[justification]:
+  ** +fixed+: referenced by the package Makefile already includes the fix but
+     no new version has been issued by the upstream project. This typically
+     happens when the version is using an +hash+ and the CPE reference the
+     latest known version.
+  ** +not-affected-component-not-present+: the vulnerability is incorrect and
+     should reference another package. Or the package is not part of the final
+     image.
+  ** +not-affected-vulnerable-code-not-present+: the code affected by the
+     vulnerability is not included in the final image. Could be a not supported
+     architecture, flags that are disabled by the package configuration,
+     busybox commands not built, dependencies not supported, ...
+  ** +not-affected-vulnerable-code-not-in-execute-path+: the vulnerable code is
+     present in the generated image but cannot be reached because of the
+     system's runtime configuration.
+  ** +not-affected-vulnerable-code-cannot-be-controlled-by-adversary+: the
+     vulnerable code may be executed, but an attacker cannot control the inputs
+     required to trigger the vulnerability.
+* +LIBFOO_<VULN-ID>_DETAIL+ is an optional free text entry that add
+  additional information on the reason a +STATUS+ has been set for a
+  +<VULN-ID>+.
++
+----
+LIBFOO_IGNORE_CVES += CVE-2020-54321
+
+LIBFOO_CVE-2020-54321_STATUS = not-affected-vulnerable-code-not-present
+LIBFOO_CVE-2020-54321_DETAIL = Only when built with libbaz, which Buildroot doesn't support
+----
+
 * [[cpe-id]] +LIBFOO_CPE_ID_*+ variables is a set of variables that allows the
   package to define its https://nvd.nist.gov/products/cpe[CPE
   identifier]. The available variables are:
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
