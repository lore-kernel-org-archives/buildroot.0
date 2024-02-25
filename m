Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A526AC54E49
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 22:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E31B60776;
	Sun, 25 Feb 2024 22:05:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C76lAe83jRmv; Sun, 25 Feb 2024 22:05:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7E6607FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA7E6607FF;
	Sun, 25 Feb 2024 22:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85A801BF3E9
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D71240385
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkrVVgtneTFM for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 22:05:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DD3240012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD3240012
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DD3240012
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 22:05:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33da6f289cfso1301692f8f.2
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 14:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708898738; x=1709503538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CVzmbM6AwscUSpHAdk+SQrdsurQpivELJ/ZoXv9IMFQ=;
 b=EFv8Vux3jD4jOGJNFa4PqAsoJYIWvK6PIlj6iPO7EXUTIlTC6+O15ow1hMtR1Th39c
 SnJ+H/s0HlbI/0DhyajyM0YPkgf0/GntZniBcHcbxG2Bgvbsb0OlfPC1jfHHQDkRX+zG
 jnXjZ1xMnWbLLTGiUXDF6wxkuD6pQF0eSp9w1pDbyPbM7BskNmgV7k5p2sCYLoUdNXIr
 to5yFF/bp/aSbosZe7spstg6y5F7f4N3ckFGTjHbkhjpDn9mtLcnP6yXQ+zSHIdZNBht
 qkaPUZzvW6+kGLldWYpZCcaqk2BVDKGtyr8M8UahNfU/Py8z9+Pzx8/uaJJ7wYL4gwus
 MqDA==
X-Gm-Message-State: AOJu0YxNngHkNXZj0YQGp4OJ8omA83+AuSP8kfFy5Ei6AWKOpgmkdzzp
 KnOMrocACXjoZCKFkgMF9KghIrMNDcLd0CKnVguDnG5ZDRr6mdp/Dm5tvqsj
X-Google-Smtp-Source: AGHT+IE+siCJnOWsKtoK9gnvR678gCG3lMbnzTDXOgcUPlDmtDbk6FuuZobymNUGuDKZdKKJPJ+p4g==
X-Received: by 2002:adf:f60f:0:b0:33d:c175:f95c with SMTP id
 t15-20020adff60f000000b0033dc175f95cmr2672222wrp.68.1708898737984; 
 Sun, 25 Feb 2024 14:05:37 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 d15-20020adfef8f000000b0033cf29a67c7sm6183556wro.7.2024.02.25.14.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 14:05:37 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 23:05:36 +0100
Message-ID: <002f11dfd177512376508c9b129721afde9f0011.1708898731.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <cover.1708898731.git.yann.morin.1998@free.fr>
References: <cover.1708898731.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708898738; x=1709503538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CVzmbM6AwscUSpHAdk+SQrdsurQpivELJ/ZoXv9IMFQ=;
 b=lj4qKvl9ted+i9dDpNX9NH5e6fymuwo1jZ9z4xZZTCET4003QrKTQYkYHbVi6cULKp
 NU3dJa1Ue1isZvyD5XOjNaF8P8tgoG7BZcktRzPq+c8x6WU67c6v8FJoGUppQFW/tC1J
 exUbMOjdCYB+/mQX+OJSiCLoIdd9ScbOLbCD2K5uFhC+pv5iWplUI8FzU0TtjhvVcd1V
 7SquBFzUxMGF4vbKHggS8Ka6+//nRszPd6Xbv1znLHyR9hzC9cbCCEnBHjQuOowbesUz
 1RlIGutRcU2Hp+R4tszURpeRkcEDaSswF0zrjL8CFbJixY10K5xbwcRbgifVnWeLxiXw
 vNEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lj4qKvl9
Subject: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: fkie json format
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

Commit 22b69455526f (support/scripts/cve.py: switch from NVD to FKIE for
the JSON files) missed the fact that the layout of the FKIE data files
are different from the NVD ones.

Most differences are relatively trivial fields renaming, and those are
easily spotted in this patch.

There is however one key difference in the layout of the configurations.
Where the NVD had "configurations" as an object with a "nodes" key, the
FKIE has a "configurations" as a list of objects with a single "nodes"
key; i.e. it is one-level deeper.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/cve.py | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index f12a8048cd..747ad881c9 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -128,7 +128,7 @@ class CVE:
             filename = CVE.download_nvd_year(nvd_dir, year)
             try:
                 uncompressed = subprocess.check_output(["xz", "-d", "-c", filename])
-                content = ijson.items(uncompressed, 'CVE_Items.item')
+                content = ijson.items(uncompressed, 'cve_items.item')
             except:  # noqa: E722
                 print("ERROR: cannot read %s. Please remove the file then rerun this script" % filename)
                 raise
@@ -155,11 +155,11 @@ class CVE:
             for parsed_node in self.parse_node(child):
                 yield parsed_node
 
-        for cpe in node.get('cpe_match', ()):
+        for cpe in node.get('cpeMatch', ()):
             if not cpe['vulnerable']:
                 return
-            product = cpe_product(cpe['cpe23Uri'])
-            version = cpe_version(cpe['cpe23Uri'])
+            product = cpe_product(cpe['criteria'])
+            version = cpe_version(cpe['criteria'])
             # ignore when product is '-', which means N/A
             if product == '-':
                 return
@@ -191,7 +191,7 @@ class CVE:
                     v_end = cpe['versionEndExcluding']
 
             yield {
-                'id': cpe['cpe23Uri'],
+                'id': cpe['criteria'],
                 'v_start': v_start,
                 'op_start': op_start,
                 'v_end': v_end,
@@ -199,14 +199,15 @@ class CVE:
             }
 
     def each_cpe(self):
-        for node in self.nvd_cve['configurations']['nodes']:
-            for cpe in self.parse_node(node):
-                yield cpe
+        for nodes in self.nvd_cve.get('configurations', []):
+            for node in nodes['nodes']:
+                for cpe in self.parse_node(node):
+                    yield cpe
 
     @property
     def identifier(self):
         """The CVE unique identifier"""
-        return self.nvd_cve['cve']['CVE_data_meta']['ID']
+        return self.nvd_cve['id']
 
     @property
     def affected_products(self):
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
