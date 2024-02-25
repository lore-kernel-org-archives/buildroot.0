Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69C6C54E49
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 22:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 772F9607FF;
	Sun, 25 Feb 2024 22:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8u-Hmx6WWskM; Sun, 25 Feb 2024 22:05:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0616D60767
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0616D60767;
	Sun, 25 Feb 2024 22:05:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA4F71BF3E9
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C806840026
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wy-NwzTAYSqc for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 22:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94FE14001F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94FE14001F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94FE14001F
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 22:05:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412a588c8b4so1013705e9.0
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 14:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708898738; x=1709503538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UuWOJuOWaIzxm4LcQyCnUJGaCrzuu5djbDLajzkGPmM=;
 b=L8eD7BnSCkZ0E6377B8p9EErff+ah48HG4nFX0UCnZrV5qpZpE6isBudoouv57qrc3
 8rL7NNFBDZ1JQFgBMYGm0SbJaklQB8g4kqYE1jNPfeOPj07wXiXp3GQeOoqN6K9QqGvp
 uotvm+4ZBGs81YeJeNArfMZ6F7wh2d5AEzbhTL6jOwPmvZ3zKtU2/muZchyDrtYtvsDT
 vhwtJRhEj7UBBZjeYj9u8ZWclMEKuYLJ17vBh2IIJqu1aQAHEieDQUgwMg5+B9MU6rDY
 wJwfW5POa15UJGWuvlNHf+iZihr0MYiw2dsU0fGYCxA2gwvG+ukrwsLwiRYt87rDKeCP
 gA2g==
X-Gm-Message-State: AOJu0YylkNOztQOK4m7iKXmpzXvIaDWS9ToerPNypmVVl1pdf2b543ls
 DvTVbAH3ADqRbRjXM5GNPCuK9ZD1nzfHt/w/PP9vAj4Ks0vY06kvKh4ONkgl
X-Google-Smtp-Source: AGHT+IGwzs+OU4HpGfwxGqz9yBA+3wMm9B+4rGOLbZB6P5xYusnU2mVSz9XTI0o61g2wHiSXyoEpPw==
X-Received: by 2002:adf:f88f:0:b0:33d:2226:a26b with SMTP id
 u15-20020adff88f000000b0033d2226a26bmr3993976wrp.24.1708898738278; 
 Sun, 25 Feb 2024 14:05:38 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 d15-20020adfef8f000000b0033cf29a67c7sm6183556wro.7.2024.02.25.14.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 14:05:38 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 23:05:37 +0100
Message-ID: <23692da67b6987d5ea453d0d254628b6c2eb5582.1708898731.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <cover.1708898731.git.yann.morin.1998@free.fr>
References: <cover.1708898731.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708898738; x=1709503538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuWOJuOWaIzxm4LcQyCnUJGaCrzuu5djbDLajzkGPmM=;
 b=Jw3pBiKZHiNDHQN39RO0HGsJPPvBI7X7O6LFTJx08RWZNyDjtyP/8w7g5eTurmESMj
 dSazUW6kKLEBKwOINVvVLA45tqpRW/Ya/lmqp5y1IT5jji1GgFnJH5U3buTK9DnJnild
 wkynjkVwuIHLidOr4nw63A171Yek1QSaE8V8hoaYp7ZhWBdLyZc70SRUB82r3xBzFB5X
 3xCkbFfbsDV1fcfLYAQo4uZMIQv1R0eELO8QJQAPV8hMmO0oGJdhDIHHbrP/F+BW9527
 d6o+IWQ6Pi3dG75AZeaEZQcAkYsBwYvQmvjdJCWwvHNe9p3jZ3+Fl8FAFMMv9FNyr4FX
 XdLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jw3pBiKZ
Subject: [Buildroot] [PATCH 3/3] support/scripts/pkg-stats: sort CVEs in
 HTML output
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While the old NVD JSON feed provided data files where the CVEs were
sorted by ID, the new feed from FKIE does not have sorted CVEs.

Add a method to sort a list of CVE IDs (i.e. CVE ID strings, not CVE
objects!), and use that when emiting the HTML output.

The JSON output need not be sorted, because it is supposed to be used
for post-processing, and we do not care about the ordering there; a
consumer interested in sorting should sort on their side.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/cve.py    | 7 +++++++
 support/scripts/pkg-stats | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index 747ad881c9..1a3c307e12 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -117,6 +117,13 @@ class CVE:
         open(path_metaf, "w").write(page_meta.text)
         return path_jsonf_xz
 
+    @staticmethod
+    def sort_id(cve_ids):
+        def cve_key(cve_id):
+            year, id_ = cve_id.split('-')[1:]
+            return (int(year), int(id_))
+        return sorted(cve_ids, key=cve_key)
+
     @classmethod
     def read_nvd_dir(cls, nvd_dir):
         """
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 00d1eef09a..7eefd92a22 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1051,9 +1051,9 @@ def dump_html_pkg(f, pkg):
         f.write(f' <div onclick="expandField(\'{data_field_id}\')" \
         class="see-more centered cve_ignored">see all ({cve_total}) &#9662;</div>\n')
     if pkg.is_status_error("cve"):
-        for cve in pkg.cves:
+        for cve in cvecheck.CVE.sort_id(pkg.cves):
             f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve}</a><br/>\n')
-        for cve in pkg.unsure_cves:
+        for cve in cvecheck.CVE.sort_id(pkg.unsure_cves):
             f.write(f'   <a href="https://security-tracker.debian.org/tracker/{cve}">{cve} <i>(unsure)</i></a><br/>\n')
     elif pkg.is_status_na("cve"):
         f.write(f"""    {pkg.status['cve'][1]}""")
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
