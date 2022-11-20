Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC6FC433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 08:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9969D81EBE;
	Sun, 20 Nov 2022 08:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9969D81EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TW7hxsHyc0mN; Sun, 20 Nov 2022 08:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CAF81ED1;
	Sun, 20 Nov 2022 08:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64CAF81ED1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0BDC1BF488
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 08:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA3D840941
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 08:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA3D840941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GCvdOo9lf4j for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 08:46:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2CCD408D5
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 08:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2CCD408D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CB7C83DF5; Sun, 20 Nov 2022 08:46:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 09:46:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8b5feee87be5157e93665011b3c350f6996dfcc
X-Git-Newrev: 8fa2ff28574cb5ba889cb4fc48240dd4291401a6
X-Patchwork-Hint: ignore
Message-Id: <20221120084626.9CB7C83DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: add upstream security fix
 for CVE-2022-4174{1, 2}
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8fa2ff28574cb5ba889cb4fc48240dd4291401a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2022-41741: Memory corruption in the ngx_http_mp4_module
- CVE-2022-41742: Memory disclosure in the ngx_http_mp4_module

https://mailman.nginx.org/archives/list/nginx-announce@nginx.org/message/RBRRON6PYBJJM2XIAPQBFBVLR4Q6IHRA/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../nginx/0011-Mp4-disabled-duplicate-atoms.patch  | 315 +++++++++++++++++++++
 package/nginx/nginx.mk                             |   3 +
 2 files changed, 318 insertions(+)

diff --git a/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch b/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch
new file mode 100644
index 0000000000..7baa810b56
--- /dev/null
+++ b/package/nginx/0011-Mp4-disabled-duplicate-atoms.patch
@@ -0,0 +1,315 @@
+From 6b022a5556af22b6e18532e547a6ae46b0d8c6ea Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Wed, 19 Oct 2022 10:53:17 +0300
+Subject: [PATCH] Mp4: disabled duplicate atoms.
+
+Most atoms should not appear more than once in a container.  Previously,
+this was not enforced by the module, which could result in worker process
+crash, memory corruption and disclosure.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/http/modules/ngx_http_mp4_module.c | 147 +++++++++++++++++++++++++
+ 1 file changed, 147 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index 9c3f627f..4eff01e9 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -1121,6 +1121,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+         return NGX_ERROR;
+     }
+ 
++    if (mp4->ftyp_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 ftyp atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     ftyp_atom = ngx_palloc(mp4->request->pool, atom_size);
+@@ -1179,6 +1185,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+         return NGX_DECLINED;
+     }
+ 
++    if (mp4->moov_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 moov atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     conf = ngx_http_get_module_loc_conf(mp4->request, ngx_http_mp4_module);
+ 
+     if (atom_data_size > mp4->buffer_size) {
+@@ -1246,6 +1258,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mdat atom");
+ 
++    if (mp4->mdat_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdat atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     data = &mp4->mdat_data_buf;
+     data->file = &mp4->file;
+     data->in_file = 1;
+@@ -1372,6 +1390,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mvhd atom");
+ 
++    if (mp4->mvhd_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mvhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom_header = ngx_mp4_atom_header(mp4);
+     mvhd_atom = (ngx_mp4_mvhd_atom_t *) atom_header;
+     mvhd64_atom = (ngx_mp4_mvhd64_atom_t *) atom_header;
+@@ -1637,6 +1661,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_TKHD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 tkhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->tkhd_size = atom_size;
+     trak->movie_duration = duration;
+ 
+@@ -1676,6 +1707,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_MDIA_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdia atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->mdia_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1799,6 +1836,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_MDHD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->mdhd_size = atom_size;
+     trak->timescale = timescale;
+     trak->duration = duration;
+@@ -1862,6 +1906,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_HDLR_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 hdlr atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->hdlr_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1890,6 +1940,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_MINF_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 minf atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->minf_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1933,6 +1989,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->vmhd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1964,6 +2029,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->smhd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1995,6 +2069,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_DINF_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 dinf atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->dinf_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -2023,6 +2103,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_STBL_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stbl atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->stbl_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -2144,6 +2230,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_STSD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->stsd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -2212,6 +2304,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(ngx_mp4_stts_entry_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STTS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stts atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->time_to_sample_entries = entries;
+ 
+     atom = &trak->stts_atom_buf;
+@@ -2480,6 +2579,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "sync sample entries:%uD", entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stss atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sync_samples_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_http_mp4_stss_atom_t);
+@@ -2678,6 +2784,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "composition offset entries:%uD", entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_CTTS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 ctts atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->composition_offset_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_mp4_ctts_atom_t);
+@@ -2881,6 +2994,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(ngx_mp4_stsc_entry_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSC_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsc atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sample_to_chunk_entries = entries;
+ 
+     atom = &trak->stsc_atom_buf;
+@@ -3213,6 +3333,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "sample uniform size:%uD, entries:%uD", size, entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSZ_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsz atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sample_sizes_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_mp4_stsz_atom_t);
+@@ -3396,6 +3523,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(uint32_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stco/co64 atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->chunks = entries;
+ 
+     atom = &trak->stco_atom_buf;
+@@ -3602,6 +3739,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(uint64_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stco/co64 atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->chunks = entries;
+ 
+     atom = &trak->co64_atom_buf;
+-- 
+2.30.2
+
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index ba01c7e016..62ea379ffc 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -19,6 +19,9 @@ NGINX_CONF_OPTS = \
 	--with-cpp="$(TARGET_CC)" \
 	--with-ld-opt="$(TARGET_LDFLAGS)"
 
+# 0011-Mp4-disabled-duplicate-atoms.patch
+NGINX_IGNORE_CVES += CVE-2022-41741 CVE-2022-41742
+
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
 # See system/skeleton/etc/passwd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
