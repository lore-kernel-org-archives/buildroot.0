Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F4EC624DA
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD42606F5;
	Wed,  2 Sep 2026 13:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USS08VElWzD3; Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355032;
	bh=BAUVjbPS68X2qAWeOLKTAqzAmH/sWxFwq0VwKg1/yLw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZcuCjbQxcg5MLYqFxQ7TWwfuKYYbUjZxp2E1+HOE9qdx4UrKfKJ9FK7TmwYcvsEMW
	 GWqeU7/Z66u1N2gkfNrVTIJThZrwRkpCDQP4MENFXn/qgEIGGC+7scVUAoju9dF2nd
	 C6cyBPmg0SdwguyDdsANV+n97mWXOZrktyrBeAPlabRX2Av+UXDXlqpm1PemGsZXEA
	 CcLlznbNOJ0/IUmfkkLaA5ix/EyF9CDhRp8gkK01aqRR4vaDm81ctUkz+aiWGtobWh
	 cArGjCY2CcE03/uUWE94kc8kQ32LoTWS7pdFtbw45vGWJ5DZwbyFRHmBx5B29eUjqt
	 +JNYsS7i4KVBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C38B060726;
	Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36552230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 283CF4006F
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLUvkUH0VvbS for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4FD64005A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso7878995e9.1
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355023; x=1788959823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ye/I7DjGQmXJryeLfju7UZxdQ4f+Kgs8W6BVEhPCwhM=;
 b=PDJizA7B4KMGHdo6z/aroaEb2qf56sNY2l+II10z12GtUPgup4cONfyks3tgPMTo1g
 dTkr5ftxx4GZC57fe/1bJQEtJUqbMoQaDEZTUfbMadyVQgKxseazT/L9oKYmalC+YF1C
 XlQg4XJfD3RnTz3t84nA02rGBSCnKQoycNxbINEVO7h+KvJ6iNRQrhQiv5gAbnMnqxMg
 bv1h68ZHMy8CqwpKlA9DD5HHdIiieiF+y+1e9RnKHKf1PurbJ3mJPNYIicYrNlZnAcdA
 0dbp/3mseC+JgoBhHx1s15+Z5sajIAboR6qpMHrssTTBVGuuaUXT9DIa/mTsYCeUtqvW
 aO1g==
X-Gm-Message-State: AFuF++kDJjvTegwXoTZUGOYVlkjHVcscgTenV4Dr6fr4hZ9ZjpeJqbVq
 diCog9zitVFdfcBTEEUWoIwTtqrsPe2l6lbUbqPWEEhg2zy3eeSWaN/MlVmGsvyS8eZk3TiW8R8
 AZt5hJMY=
X-Gm-Gg: AR+sD10J748s3nnIA0zR2Sx0d0TNK/aucgdwpNZtGChf7n206zvg20Jv2F9OIu95YS2
 ki9ZSJFgD26KuBWhGZDkl9aHFb2kJvPtXudpBu9yGX0z8AfLEwfWqQPBxQLjeAyBFW1jOSqlxkP
 h+zdYIolVDRU1drBHnrvivaeb6vtneYl0F8sjF0Rm9aN6mEpuoHx7SnoksOb1aQQLdxAKj+M2ce
 ghNPaYz+GGgfWa/bXPIFk2jCUKevDeiZgoHid73E4H+ekWP1lSbDbaX10Bq3omCWt6IJ1+aLbe2
 TVTEgxOQgJ6Ozfc2z3bSstzQDJ/FB1thl2WaHA34EsJUuzLS7AKxzGqmXg6pP0baxk78EFowD+q
 3VjhgWDD+DuK2RVQCx4aRT6/CzXCeXMMm21c7ARH61ifIn4tCCxAGNmt+M0PoSRVZ4mSandcqPz
 kJ3URNINtqm0anbPrsUWcr4xKX65iGeJ1UePz2SfVBHULDRqBtmK0c/UXbOf1GpwkxH+3ex+GZB
 1SVthnHiD5/Xqo=
X-Received: by 2002:a05:600c:1d89:b0:49c:ed8f:d094 with SMTP id
 5b1f17b1804b1-49ced8fd250mr23842895e9.10.1788355023237; 
 Wed, 02 Sep 2026 06:17:03 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:30 +0200
Message-ID: <20260902131640.379588-6-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 05/15] package/clamav: add
 patch for CVE-2026-20216
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...e-installshield-extraction-limits-55.patch | 126 ++++++++++++++++++
 package/clamav/clamav.mk                      |   3 +
 2 files changed, 129 insertions(+)
 create mode 100644 package/clamav/0004-libclamav-enforce-installshield-extraction-limits-55.patch

diff --git a/package/clamav/0004-libclamav-enforce-installshield-extraction-limits-55.patch b/package/clamav/0004-libclamav-enforce-installshield-extraction-limits-55.patch
new file mode 100644
index 0000000000..517974f97b
--- /dev/null
+++ b/package/clamav/0004-libclamav-enforce-installshield-extraction-limits-55.patch
@@ -0,0 +1,126 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 16 Jun 2026 23:51:14 -0400
+Subject: Libclamav: enforce InstallShield extraction limits (#55)
+
+A multi-chunk InstallShield payload could bypass the intended file
+size limits because the extractor checked zlib's per-stream total_out
+instead of the cumulative bytes written across all chunks. The
+extraction path also collapsed timeout and maxfiles limit hits to
+CL_BREAK, and the header parser trusted declared sizes that can be
+forged to skip scanning a small payload entirely.
+
+Fix this by enforcing maxfilesize and maxscansize against the
+cumulative output written while inflating and by propagating hard-stop
+limit errors out of is_extract_cab(). Keep the parser preflight, but
+only use cli_checklimits() for non-size checks before extraction so
+size decisions are based on actual inflated output instead of
+attacker-controlled metadata.
+
+Thanks to Mizu for reporting this issue.
+
+CLAM-2956
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/52f38b9e14c379615b244874802ad57bf37483c4
+CVE: CVE-2026-20216
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/ishield.c | 60 +++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 50 insertions(+), 10 deletions(-)
+
+diff --git a/libclamav/ishield.c b/libclamav/ishield.c
+index 53035c6398..50fb5813d0 100644
+--- a/libclamav/ishield.c
++++ b/libclamav/ishield.c
+@@ -658,10 +658,15 @@ static cl_error_t is_parse_hdr(cli_ctx *ctx, struct IS_CABSTUFF *c)
+                         if (file_size) {
+                             unsigned int j;
+                             cl_error_t cabret = CL_SUCCESS;
++                            cl_error_t limitret;
+ 
+-                            if (ctx->engine->maxfilesize && file_csize > ctx->engine->maxfilesize) {
+-                                cli_dbgmsg("is_parse_hdr: skipping file due to size limits (%lu vs %lu)\n", (unsigned long int)file_csize, (unsigned long int)ctx->engine->maxfilesize);
+-                                break;
++                            limitret = cli_checklimits("InstallShield", ctx, 0, 0, 0);
++                            if (limitret != CL_SUCCESS) {
++                                if (file_name != emptyname)
++                                    fmap_unneed_ptr(map, (void *)file_name, strlen(file_name) + 1);
++                                if (dir_name != emptyname)
++                                    fmap_unneed_ptr(map, (void *)dir_name, strlen(dir_name) + 1);
++                                return limitret;
+                             }
+ 
+                             for (j = 0; j < c->cabcnt && c->cabs[j].cabno != cabno; j++) {
+@@ -737,6 +742,7 @@ static void md5str(uint8_t *sum)
+ static cl_error_t is_extract_cab(cli_ctx *ctx, uint64_t off, uint64_t size, uint64_t csize)
+ {
+     cl_error_t ret = CL_SUCCESS;
++    cl_error_t abortret = CL_SUCCESS;
+     const uint8_t *inbuf;
+     uint8_t *outbuf;
+     char *tempfile;
+@@ -801,17 +807,51 @@ static cl_error_t is_extract_cab(cli_ctx *ctx, uint64_t off, uint64_t size, uint
+             zret        = inflate(&z, 0);
+             if (zret == Z_OK || zret == Z_STREAM_END || zret == Z_BUF_ERROR) {
+                 unsigned int umpd = IS_CABBUFSZ - z.avail_out;
+-                if (cli_writen(ofd, outbuf, umpd) != umpd)
++                uint64_t writelen = umpd;
++                cl_error_t limitret;
++
++                if (outsz > UINT64_MAX - writelen) {
++                    cli_dbgmsg("ishield_extract_cab: output size overflow guard hit\n");
+                     break;
+-                outsz += umpd;
+-                if (zret == Z_STREAM_END || z.avail_out == IS_CABBUFSZ /* FIXMEISHIELD: is the latter ok? */) {
++                }
++
++                limitret = cli_checklimits("InstallShield", ctx, outsz + writelen, 0, 0);
++                if (limitret == CL_ETIMEOUT || limitret == CL_EMAXFILES) {
++                    abortret = limitret;
++                    break;
++                }
++                if (limitret == CL_EMAXSIZE) {
++                    uint64_t allowed = writelen;
++
++                    if (ctx->engine->maxfilesize) {
++                        uint64_t remaining = (outsz < ctx->engine->maxfilesize) ? (ctx->engine->maxfilesize - outsz) : 0;
++                        if (allowed > remaining)
++                            allowed = remaining;
++                    }
++
++                    if (ctx->engine->maxscansize) {
++                        uint64_t remaining_scan = (ctx->scansize < ctx->engine->maxscansize) ? (ctx->engine->maxscansize - ctx->scansize) : 0;
++                        uint64_t remaining      = (outsz < remaining_scan) ? (remaining_scan - outsz) : 0;
++                        if (allowed > remaining)
++                            allowed = remaining;
++                    }
++
++                    cli_dbgmsg("ishield_extract_cab: trimming output file due to size limits (" STDu64 " vs " STDu64 ")\n",
++                               outsz + writelen,
++                               outsz + allowed);
++                    writelen = allowed;
++                }
++
++                if (writelen && cli_writen(ofd, outbuf, writelen) != writelen)
++                    break;
++                outsz += writelen;
++
++                if (writelen != umpd) {
+                     success = 1;
+                     break;
+                 }
+-                if (ctx->engine->maxfilesize && z.total_out > ctx->engine->maxfilesize) {
+-                    cli_dbgmsg("ishield_extract_cab: trimming output file due to size limits (%lu vs %lu)\n", z.total_out, (unsigned long int)ctx->engine->maxfilesize);
++                if (zret == Z_STREAM_END || z.avail_out == IS_CABBUFSZ /* FIXMEISHIELD: is the latter ok? */) {
+                     success = 1;
+-                    outsz   = size;
+                     break;
+                 }
+                 continue;
+@@ -837,5 +877,5 @@ static cl_error_t is_extract_cab(cli_ctx *ctx, uint64_t off, uint64_t size, uint
+     if (!ctx->engine->keeptmp)
+         if (cli_unlink(tempfile)) ret = CL_EUNLINK;
+     free(tempfile);
+-    return success ? ret : CL_BREAK;
++    return success ? ret : ((abortret != CL_SUCCESS) ? abortret : CL_BREAK);
+ }
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index bdb94e7436..4eb1840c84 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -33,6 +33,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20217
 # 0003-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20213
 
+# 0004-libclamav-enforce-installshield-extraction-limits-55.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20216
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
