Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A130FC61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59F8B80BB8;
	Wed, 26 Aug 2026 12:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BxXUVn1ZN85j; Wed, 26 Aug 2026 12:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747824;
	bh=4ayx/Qo4+99cM/XQC6imak/Qub6U2gh4UmCP7FXjxWM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Eym8v1yDTLp5hH+/zkCIlvSw7TKo3/E/NBSyXKde9T58tvUYiSJlt7XzpLN10GQo5
	 tVOH57q/c706kY38v7SYisCn9pQAwyHm2h1d8bwf1tZFm3cShO81X6YxOdLM1P07EO
	 laowWWqHDBsBzkVBROLH1bExxH+OMBeOQCwZVUsDD18KrbGEKpobizf7JBqBczoWCP
	 7hBvOAxcDfjBgrC0JkXpp3q4rdYjwM/o6oumETp9RAkFBBwqofdtcfp4NrncEkJMsR
	 P7zkxs5XAvamSc1urX4EMV0caEG2tMZE+6gTl/6hFnr192VaHXm42onOhmDz1XGc8Y
	 9NzVcnJmycjlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4211180BCD;
	Wed, 26 Aug 2026 12:37:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08734396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2E434055E
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcVnZphENRdx for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 995D040550
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-69fc9f25118so968745a12.2
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747813; x=1788352613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LpU/hevGFeN0nwxAbpPWAr7LSB5aMOY4La6VV4nZwTE=;
 b=drnHfmA/kLPuX76bmUP7scouMpgsNTFJYTkpAaAhoKmEf7bzzv9057e8ce8bXMZ7jL
 iRvw6gYtD0FbvX+LHQTl6y9Dfl/K0GWRnptrgh9qF6K0mD+Ram+ywCSme5sRJsYwv932
 OzQlqXDM9fP0hcWDrzTci1pvlzPh8tkAIEtbceLNOsF3bB9B1TLi/v8seorEXN3cqzwo
 bOPSOkPyl4wCUfbEqz1Yo/J9wzNxyRdihNbx2LDhIwyWtuJbA7INd92fkptVnHOsM+vo
 93QD0sAkHnbMG6DYcou/S/nxwTepoHshVTpH0iKfQAdeVwIo8FgY5xdqaT3pZwkjzDOk
 164g==
X-Gm-Message-State: AFuF++kTJnRFB+MFSgrNZ6Uiom1ItASPQsMR3e70m/w/43kjzeXBcceQ
 vdwCx8ky9o/FMRDomWRWZNoXxAirOAnq7w2cgneQQRQViR8FMslWtWYexFVhazT8N0VnKPVtsPy
 +LPTtvb4=
X-Gm-Gg: AR+sD13Y4AoXXZ/DmUuFCNuosOPxBo/lPEg7WoAaMvaMPOcKFiDYk2NjZcmuUGFnwBn
 rSN1JnlohcCsoRZaqxbYl5pTH6Shs15i2rqDPQLCyuboud+3VYqoNmFvxYih4JDndS9XtspX1xC
 Nv7EeIbgkubzlPnG6BxD+ndRsJotGRRim5yFnC9GITUPF1a7Sw5cilRNrXjlOz8dqQ5vIiAfbMy
 3ELJi+Dja2Q5ydZss4XghOffDScnIwH5GJ371Hnftk34oN5Qeku0GViTvv8khN1R3eJhEWHxMbu
 Pjs7/Jg+a53yp+hlr1tW4peozbBHSOLM/Z3srDO0j/s57/LvJNR0hNU0at8qhGNhP5MZhmxinDE
 TOgWKFR1oS09XiX5/V1pJg4ggEBPMBfXwPTkziFjZ4jC5SmCsyEpJQPsMu+sDlBzkqEwrIx7MuC
 yIUac551SgU7Z5yaISa2DdnK5SMAQ5SY3hKVQSA4NaCERrZ3J7BakC/EMJVpsB+e7Mx1JekmBYj
 53HV8nmy3kXpHw=
X-Received: by 2002:a05:6402:505b:b0:6a3:f4fe:9d5f with SMTP id
 4fb4d7f45d1cf-6a5df629346mr8588883a12.11.1787747813005; 
 Wed, 26 Aug 2026 05:36:53 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:27 +0200
Message-ID: <20260826123637.410258-7-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 06/16] package/clamav: add patch
 for CVE-2026-20216
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
 create mode 100644 package/clamav/0005-libclamav-enforce-installshield-extraction-limits-55.patch

diff --git a/package/clamav/0005-libclamav-enforce-installshield-extraction-limits-55.patch b/package/clamav/0005-libclamav-enforce-installshield-extraction-limits-55.patch
new file mode 100644
index 0000000000..517974f97b
--- /dev/null
+++ b/package/clamav/0005-libclamav-enforce-installshield-extraction-limits-55.patch
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
index d3f912fd1c..67042efeb8 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -36,6 +36,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20217
 # 0004-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20213
 
+# 0005-libclamav-enforce-installshield-extraction-limits-55.patch
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
