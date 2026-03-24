Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D54F532EA
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 07:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F91407CC;
	Tue, 24 Mar 2026 07:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMloWG0V_-Rm; Tue, 24 Mar 2026 07:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C725407CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774337842;
	bh=XcK2q/WMMU8JQGmh9LltUadbsL3bBpCytVwT0vLwYTM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=I7VcYhSgWJlJLLX6rsdvtIgxqKuJ+A+Y46m2w6HI0V78LRnvsrBrxtQ3iSyDXCQhk
	 qeXMDTh1wdwDepPBbEOXBaxlrPwrU3OKvu1WE5DSfdvDhgo0jHBmbGqBp23oH5lYek
	 Y4eLTjusD8UtMc9WDych92bhpr5u0wS4pVkHW91N+UiABh6+Plh23vkTLOpw/5TEwj
	 p7uDvhiiwy2waD9aJFvgZ397YCBUgqEWzy5l1IBnIelC3VsihKusnFq6kt0OXNcXqi
	 FL6H3aU8I/wMeeRTe0OnllXnhYEJgpw60Ore86zYlyUj7DB7Ar18sIQEH7nUzvd9kk
	 Yy6/7Z47n8Z9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C725407CF;
	Tue, 24 Mar 2026 07:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72BDB1D3
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60F61404ED
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H_VGLqwV0_G for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 07:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A8BD40072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A8BD40072
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A8BD40072
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 07:37:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439d8dc4ae4so4357048f8f.2
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 00:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774337836; x=1774942636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P/i1uJTQB18ZoOFlMf6Uby0Q5AwGlnO30i+mmGMOjvI=;
 b=PBeK/JR2rpPNmWczb+F03kC9DD6dFnNM1OrXgEtM/Opt4DJPUt0JlIfDjC2FvmZRav
 iRLOydKEVchoQR0RYJyqTeRCzxlEsRJfy8WZefj9hFuv3iGgvx1ga3eEgVOhIXFICNVx
 xsghBluyrcAQqNJY4Bl+86fCGqXmSNTPXFPLh3k41T2LB2Xb5jUJod2yhQvB0oG/2N1Q
 bzIfa3xUq9lyFKxgMrmah51nObWKRg9GEYLnQIRT8hDcCgknTWqihVy4HbSlmHd8CCid
 eFP3T2XudITtt016WKXemzTD6rXxpvnHhcMaZiVA6VZaH23XIg4oKQtxZ6Max+A9Uxek
 3umA==
X-Gm-Message-State: AOJu0YyHFcXJQw/hXu+GD9EogpBFmttlaFg5zxa3Z6mpCifMjqMWEyQ6
 ZEZWbtvnwl4H34C0GFu+9CmAPWtsfbAJ5G2iYy0ZhSu1wbXhfYRpFuR3oDJSjxhBZI8WwhJX57o
 sxLxm
X-Gm-Gg: ATEYQzw4ZzGvNafCzdDncPbzkLeM01W1Uk5HyA7oef3BkWotBzNgBZ/OBf2kZDThK3k
 +aq/DFdeQKHfNe38kRzrE8MTFwlFj7W//v2lL8hRCPE+efpuRWPvh0HqqTnhPJoL4ultmvlQG/6
 8ysd/Y4VnlWaSIwiOk8bZq35fgamv92CoLLfpVkhFyrKmOj77qfpzgwVHvlCd1FkOOGS3JLl3b9
 47aLDSAMD8vyUYjvgLVG+wTZ5KvyxmUVzmM/uPa2UG6HpiUTy0Urr81lLoqXhZPipTPbfNHlfxf
 wrE/2D6u8G/nEYQg01YwHXgXw2ODhCAcCyhQywyy+jIuescBi49+wQ8zyAppwMEaii1U5kSBQ0a
 Dlj5e3FJbXFgWfsYmRgtwOTQbSZ8roYoyc1zeh1eDZ6dtfybYG9mdgqWFtvsjxviw4zNKB8PHEm
 fHk852rQPbHbiMwiNAgl3R6zOYyTYUL3nozE76xKLB+7NJdDIYCvqmzGg=
X-Received: by 2002:a05:6000:400e:b0:43b:498f:dceb with SMTP id
 ffacd0b85a97d-43b642328a1mr24265303f8f.9.1774337836119; 
 Tue, 24 Mar 2026 00:37:16 -0700 (PDT)
Received: from dragon (ptr-94-109-29-81.dyn.orange.be. [94.109.29.81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644bdaf8sm41100137f8f.13.2026.03.24.00.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 00:37:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 08:37:06 +0100
Message-ID: <20260324073706.654995-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324073706.654995-1-titouan.christophe@mind.be>
References: <20260324073706.654995-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774337836; x=1774942636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/i1uJTQB18ZoOFlMf6Uby0Q5AwGlnO30i+mmGMOjvI=;
 b=EuskDtl9cr++7+qLn4FY/NcDNh10MdGMRyk40kWbv/2UhVs4D8OyiPG+UOls/q6AaM
 IIYzmnPMudbNjL420MdNo4Pz+FDod4ofKxUzwH9ctLvVtIus5R8e8n3wUtiTdMyBJBi3
 vIbAwY62L4VnpUknZM3jgX6J6NAVmbaHhRrXlLcYrzBkKoqQaIIXexf/dQpE2q9IFK6Y
 VPvPuPA51ickWIJjG222257QLGXFfgdYDlfWGrQq4SZNiJTu5HGZgEXQeYqw8JJrwE0r
 SzLsjktfqtQrUdmVRRLzF0NHNuqvwmZOMIM/oXcvOu6qB5t4iLQU4p10c5kyT07y8Y1X
 cD3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EuskDtl9
Subject: [Buildroot] [PATCH RFC 2/2] SECURITY.md: add new file
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an in-tree description of Buildroot's security policy

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 SECURITY.md | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 SECURITY.md

diff --git a/SECURITY.md b/SECURITY.md
new file mode 100644
index 0000000000..6b955638df
--- /dev/null
+++ b/SECURITY.md
@@ -0,0 +1,16 @@
+# Security Policy
+
+## Reporting a Vulnerability
+
+To report a security vulnerability found in the Buildroot build system itself,
+please send an email to [security@buildroot.org](mailto:security@buildroot.org).
+
+## Vulnerabilities in packages
+
+Buildroot is a build system that cross-compiles packages from third-party
+sources. The Buildroot developers are not responsible for security
+vulnerabilities in these packages. Such vulnerabilities should be reported
+directly to the upstream project that maintains the affected package.
+
+When vulnerabilities are fixed upstream, send a patch to update the affected
+packages in Buildroot.
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
