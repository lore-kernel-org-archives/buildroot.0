Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE91BC25B4E
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 19:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2984A82C99;
	Fri, 20 Jan 2023 19:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2984A82C99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXk_OUSS3rJu; Fri, 20 Jan 2023 19:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1122382C3B;
	Fri, 20 Jan 2023 19:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1122382C3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C1181BF976
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0736282C99
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0736282C99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lR5EQj8lHst for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 19:26:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64BE982CA3
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64BE982CA3
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 19:26:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id h12so1730579wrv.10
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 11:26:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cX16EeILc731WnIDpTcLpLdXmEWLnaNagR0tw3BJJ7c=;
 b=2+Rmunaak7J/gGHAzxjO6ktjvK4ALYmVSuDdu5xx3JmAMegXjnb5NzOfxiHWPsn6EZ
 9sdQm19w7U22XcqkP8dPBPc14oDxP67Q+Sb5DOP4+w1PeiZlghQjYSYjxJa77OegRqT6
 xUPST7Yj6nCq1uPIg5uwrdVIafUuf32txNQuin9Ke6W5qvGQksRBcuEroGeiSXei4Z00
 JUADFxv4QfXESwd1dCyM/cZs35SsLZJHXdFqWUu/xAM4p1KUou16CCbPrbNKntb6LNeW
 ZK3fUPGrN33/d4dnU7QQnEjHgHfVcGYinA4XqQTmq4yeXaIs1kAMwaBhhDYE4yhmV+cE
 VpeQ==
X-Gm-Message-State: AFqh2kp+mt96caf9CVyCCeLQJHPzHy/xQAnL98e9yt+7rDXj/xDJddqk
 Qym8lHTNyi/eg0b/e2VHxwffRiC9bMY=
X-Google-Smtp-Source: AMrXdXuTPcdcJMMwwW8eJn7o6UPfu0hc/FXhSQ5/buAxq7SPNSvGHSco8CR056vXXUC/efNFlhNMAA==
X-Received: by 2002:a5d:60c1:0:b0:298:879c:6d01 with SMTP id
 x1-20020a5d60c1000000b00298879c6d01mr19903812wrt.23.1674242801095; 
 Fri, 20 Jan 2023 11:26:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q23-20020adfb197000000b002be5bdbe40csm2327273wra.27.2023.01.20.11.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 11:26:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 20:26:36 +0100
Message-Id: <20230120192636.3593-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cX16EeILc731WnIDpTcLpLdXmEWLnaNagR0tw3BJJ7c=;
 b=Z/2EiXuJ1OqJt95sOlBkQ5ScKKGEVRQwJa+zkyeoWyzHts14W9Q2OcgtQIeJf24i3i
 qJ+J9PXl82TGnDA3Ac5KbG6bSpyU9z7ujQV1vpP/udZExIFQrXWkfDmmbs0LTocWMN3B
 DOavzapgrJd37ahxwRvp4LrVGNLRIhfT0L/b8jSQZAkXb0V18EbXVR4x0jzjTmdmIebE
 2nAlvOI28JuNOGoBK2lTpu/3CGUBNvD4SgT+QUnx5B0h5kDKj/oCHAv991k1IboHfGDS
 cDvc4aG0RtJDuQP/rMRLxwX7eNiO4Ea6SnulsPkLuTWKZk/NEXdB3tDwo9MElrqC9uRI
 GkrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z/2EiXuJ
Subject: [Buildroot] [PATCH 1/1] package/nginx: bump to version 1.22.1
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop eleventh patch (already in version)
- Update hash of LICENSE file (update in year)
- pcre2 is supported (and enabled by default) since
  https://github.com/nginx/nginx/commit/c6fec0b027569a4e0b1d8aaee7dea0f2e4d6052b

http://nginx.org/en/CHANGES-1.22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0011-Mp4-disabled-duplicate-atoms.patch   | 315 ------------------
 package/nginx/Config.in                       |   2 +-
 package/nginx/nginx.hash                      |   4 +-
 package/nginx/nginx.mk                        |  11 +-
 4 files changed, 7 insertions(+), 325 deletions(-)
 delete mode 100644 package/nginx/0011-Mp4-disabled-duplicate-atoms.patch

diff --git a/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch b/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch
deleted file mode 100644
index 7baa810b56..0000000000
--- a/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch
+++ /dev/null
@@ -1,315 +0,0 @@
-From 6b022a5556af22b6e18532e547a6ae46b0d8c6ea Mon Sep 17 00:00:00 2001
-From: Roman Arutyunyan <arut@nginx.com>
-Date: Wed, 19 Oct 2022 10:53:17 +0300
-Subject: [PATCH] Mp4: disabled duplicate atoms.
-
-Most atoms should not appear more than once in a container.  Previously,
-this was not enforced by the module, which could result in worker process
-crash, memory corruption and disclosure.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/http/modules/ngx_http_mp4_module.c | 147 +++++++++++++++++++++++++
- 1 file changed, 147 insertions(+)
-
-diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
-index 9c3f627f..4eff01e9 100644
---- a/src/http/modules/ngx_http_mp4_module.c
-+++ b/src/http/modules/ngx_http_mp4_module.c
-@@ -1121,6 +1121,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-         return NGX_ERROR;
-     }
- 
-+    if (mp4->ftyp_atom.buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 ftyp atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
- 
-     ftyp_atom = ngx_palloc(mp4->request->pool, atom_size);
-@@ -1179,6 +1185,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-         return NGX_DECLINED;
-     }
- 
-+    if (mp4->moov_atom.buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 moov atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     conf = ngx_http_get_module_loc_conf(mp4->request, ngx_http_mp4_module);
- 
-     if (atom_data_size > mp4->buffer_size) {
-@@ -1246,6 +1258,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mdat atom");
- 
-+    if (mp4->mdat_atom.buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 mdat atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     data = &mp4->mdat_data_buf;
-     data->file = &mp4->file;
-     data->in_file = 1;
-@@ -1372,6 +1390,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mvhd atom");
- 
-+    if (mp4->mvhd_atom.buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 mvhd atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom_header = ngx_mp4_atom_header(mp4);
-     mvhd_atom = (ngx_mp4_mvhd_atom_t *) atom_header;
-     mvhd64_atom = (ngx_mp4_mvhd64_atom_t *) atom_header;
-@@ -1637,6 +1661,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_TKHD_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 tkhd atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->tkhd_size = atom_size;
-     trak->movie_duration = duration;
- 
-@@ -1676,6 +1707,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_MDIA_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 mdia atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->mdia_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1799,6 +1836,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_MDHD_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 mdhd atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->mdhd_size = atom_size;
-     trak->timescale = timescale;
-     trak->duration = duration;
-@@ -1862,6 +1906,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_HDLR_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 hdlr atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->hdlr_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1890,6 +1940,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_MINF_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 minf atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->minf_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1933,6 +1989,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
-+        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
-+    {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
-+                      mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->vmhd_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1964,6 +2029,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
-+        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
-+    {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
-+                      mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->smhd_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -1995,6 +2069,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_DINF_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 dinf atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->dinf_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -2023,6 +2103,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_STBL_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stbl atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->stbl_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -2144,6 +2230,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
- 
-     trak = ngx_mp4_last_trak(mp4);
- 
-+    if (trak->out[NGX_HTTP_MP4_STSD_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stsd atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     atom = &trak->stsd_atom_buf;
-     atom->temporary = 1;
-     atom->pos = atom_header;
-@@ -2212,6 +2304,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_end = atom_table + entries * sizeof(ngx_mp4_stts_entry_t);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STTS_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stts atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->time_to_sample_entries = entries;
- 
-     atom = &trak->stts_atom_buf;
-@@ -2480,6 +2579,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-                    "sync sample entries:%uD", entries);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STSS_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stss atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->sync_samples_entries = entries;
- 
-     atom_table = atom_header + sizeof(ngx_http_mp4_stss_atom_t);
-@@ -2678,6 +2784,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-                    "composition offset entries:%uD", entries);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_CTTS_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 ctts atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->composition_offset_entries = entries;
- 
-     atom_table = atom_header + sizeof(ngx_mp4_ctts_atom_t);
-@@ -2881,6 +2994,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_end = atom_table + entries * sizeof(ngx_mp4_stsc_entry_t);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STSC_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stsc atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->sample_to_chunk_entries = entries;
- 
-     atom = &trak->stsc_atom_buf;
-@@ -3213,6 +3333,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-                    "sample uniform size:%uD, entries:%uD", size, entries);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STSZ_ATOM].buf) {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stsz atom in \"%s\"", mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->sample_sizes_entries = entries;
- 
-     atom_table = atom_header + sizeof(ngx_mp4_stsz_atom_t);
-@@ -3396,6 +3523,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_end = atom_table + entries * sizeof(uint32_t);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
-+        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
-+    {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stco/co64 atom in \"%s\"",
-+                      mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->chunks = entries;
- 
-     atom = &trak->stco_atom_buf;
-@@ -3602,6 +3739,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
-     atom_end = atom_table + entries * sizeof(uint64_t);
- 
-     trak = ngx_mp4_last_trak(mp4);
-+
-+    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
-+        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
-+    {
-+        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
-+                      "duplicate mp4 stco/co64 atom in \"%s\"",
-+                      mp4->file.name.data);
-+        return NGX_ERROR;
-+    }
-+
-     trak->chunks = entries;
- 
-     atom = &trak->co64_atom_buf;
--- 
-2.30.2
-
diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 90a0822298..406a1c861a 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -214,7 +214,7 @@ config BR2_PACKAGE_NGINX_HTTP_REFERER_MODULE
 config BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE
 	bool "ngx_http_rewrite_module"
 	default y
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Enable ngx_http_rewrite_module
 
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 06d3392a2e..06454c5e32 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  e462e11533d5c30baa05df7652160ff5979591d291736cfa5edb9fd2edb48c49  nginx-1.20.1.tar.gz
+sha256  9ebb333a9e82b952acd3e2b4aeb1d4ff6406f72491bab6cd9fe69f0dea737f31  nginx-1.22.1.tar.gz
 # License files, locally calculated
-sha256  b57270c1f73eb6624b38b2d0a1affcec56b21fab39efbf8c837428f05cef1d73  LICENSE
+sha256  ececed0b0e7243a4766cbc62b26df4bd3513b41de3a07425da1679c836d06320  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 62ea379ffc..10cc95d90e 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.20.1
+NGINX_VERSION = 1.22.1
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
@@ -19,9 +19,6 @@ NGINX_CONF_OPTS = \
 	--with-cpp="$(TARGET_CC)" \
 	--with-ld-opt="$(TARGET_LDFLAGS)"
 
-# 0011-Mp4-disabled-duplicate-atoms.patch
-NGINX_IGNORE_CVES += CVE-2022-41741 CVE-2022-41742
-
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
 # See system/skeleton/etc/passwd
@@ -83,8 +80,8 @@ else
 NGINX_CONF_ENV += ngx_force_have_libatomic=no
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-NGINX_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+NGINX_DEPENDENCIES += pcre2
 NGINX_CONF_OPTS += --with-pcre
 else
 NGINX_CONF_OPTS += --without-pcre
@@ -167,7 +164,7 @@ NGINX_CONF_OPTS += --without-http_gzip_module
 endif
 
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE),y)
-NGINX_DEPENDENCIES += pcre
+NGINX_DEPENDENCIES += pcre2
 else
 NGINX_CONF_OPTS += --without-http_rewrite_module
 endif
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
