Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A12CC624DA
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3D4240A5C;
	Wed,  2 Sep 2026 13:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilKy9tjMbFDs; Wed,  2 Sep 2026 13:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355039;
	bh=/ttQtJ1UYzNr3HhBHewAORZtSZYciR/jPfv2Urwcw20=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ONtoQ5yng18fJXWPU+PgCEs2ujwVybAclxr6UFnH27jOq/f1v0p2EIYIGFW3toL0N
	 sPI+St0OZAL0KipUYzXpb8pELkI/ET1XELMYD3YL8l/N6mlON/40teVXotSGUTSswk
	 qJDGuCYHieXZf1qc9EqCxVpe9z99gyALXoYfsgEbvRIQpErRZ2d1HyL3lXLjk/atIn
	 rnouZfQzmRAq9YPhNabUD7j1RjFpf41x6NpqbrYVERiK+htCA8W/4JkuaLEte8580h
	 l45OTNJG87QxgIZ+gF3ylEO7f+Zoz38o0OhNtosWlZZ9/ztEzervGzUmFp3SvNVBi4
	 3cqvoc5/nnoZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 143E640A5A;
	Wed,  2 Sep 2026 13:17:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E01F230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3051F8084C
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfkOut84kkRs for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1591E8075A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so9479655e9.2
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355028; x=1788959828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GxpyF5OklRYTaDgZbG1Rl3imnZxZtTGCFSICdNL8KFk=;
 b=KvaOgT0G2RJr08F/vKw8sbsg69ocGoiEr3EBTRSkbOynSH/ZLln2oJXzD0KTKJhFMA
 O10pGGlzz6ieqbxCJ2t1iSeBh6PxRrf99YFkOAaMcArFhAKbLfDpFkdMsieX1Jqcnig6
 oMZHRrTkUt45DL0yZdiUNxsdwr+8iWn6zxVRehpBjMYcfSeU7ZMeVhfNyxEECew6GOGg
 v/fvNhTv0iLMBjUiVcRnRt2/EijpFN1nrx/qlSICUW5DNRoXfl9GT79j6xxYM01zxIlm
 2pFaaWVjyexrStWxZOUDPDRRGXJUZ8XMb+/jwW2fCDLYCc0ZtKk4cAsWoEZ7EXEyEbFY
 W/Dw==
X-Gm-Message-State: AFuF++kudVVbmG6q4Xvn1lFyndK/WFFh3m9dDxvpX3MM5PC3KWepH0xu
 Dlw6n1SG9xQ90TxbceTUfKSGycypm/j4etLzhkq5Ht2MUlbanh/hcNVxrugDeOV/lV4pxqlt13C
 xv6fuhrY=
X-Gm-Gg: AR+sD11DkzoMg4p1tjfSCR7bTkCk+T1rGPGnAraA0s24zYdo3q/tim6OoigcXU0d6zf
 bd9vQUIQgZWmUV1Ctm5mjOCd0emy/IfJnhgtMNnZsAKLcgOvhyRnWRRjucvYRQDHEopcoGniBVG
 CyMOhdBDhKS5Y4CWpv4EDQM7diBR6snNlFVdyU5BhARyb2tMCcLdDauzEmojbWQll4emJUzQ/o+
 h7a9+wb2YG62JgAjUt3KddAJUJ2KNKhGykTleK4KTFz3TFHwPXVcDgS3X3xSO0JmJGq+L9EOqbv
 FBCGXkupsX4DQrj4w2D//4Eq20gp6n18+/e4lR+A1ujz50zOdoTSLfKerTePjQ7XycLzx2scHoh
 Q3D3kEyx6g9MeWcifxJGI4CvkrKshkpYbJugxi3/mAQsK6rPfo4lV+pcuj+kvbzxWyZRszH4gHP
 ZsK1jw38Uhwu8K0kPiWjG09YYddqdxtqx8DhUqcKa4qFRN8lYxIXJszRp9NabwdiDgVoJzexVpz
 kRk
X-Received: by 2002:a05:600c:83c4:b0:499:8ff5:8ecc with SMTP id
 5b1f17b1804b1-49ce58268afmr87792805e9.15.1788355027498; 
 Wed, 02 Sep 2026 06:17:07 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:36 +0200
Message-ID: <20260902131640.379588-12-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 11/15] package/clamav: add
 patch for CVE-2026-20345
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
 ...-partition-name-conversion-index-103.patch | 37 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 40 insertions(+)
 create mode 100644 package/clamav/0010-libclamav-fix-gpt-partition-name-conversion-index-103.patch

diff --git a/package/clamav/0010-libclamav-fix-gpt-partition-name-conversion-index-103.patch b/package/clamav/0010-libclamav-fix-gpt-partition-name-conversion-index-103.patch
new file mode 100644
index 0000000000..e5cbceb9ab
--- /dev/null
+++ b/package/clamav/0010-libclamav-fix-gpt-partition-name-conversion-index-103.patch
@@ -0,0 +1,37 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 28 Jul 2026 09:02:34 -0400
+Subject: Libclamav: fix GPT partition name conversion index (#103)
+
+The GPT partition parser converted the UTF-16 partition name with the outer
+partition loop index instead of the inner name loop index. A GPT with enough
+partition entries could read and write past the end of the stack-allocated
+partition entry while scanning disk images.
+
+Use the name loop index so each UTF-16 code unit is converted in bounds.
+
+Credit: Atuin - Automated Vulnerability Discovery Engine, Tianchu Chen of
+Tencent Xuanwu Lab.
+
+CLAM-2999
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/434617ed00218dacdf3274dca5279f052c3f1d46
+CVE: CVE-2026-20345
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/gpt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libclamav/gpt.c b/libclamav/gpt.c
+index c92cf6bc97..9cc05d42f8 100644
+--- a/libclamav/gpt.c
++++ b/libclamav/gpt.c
+@@ -303,7 +303,7 @@ static cl_error_t gpt_scan_partitions(cli_ctx *ctx, struct gpt_header hdr, size_
+         gpe.lastLBA    = le64_to_host(gpe.lastLBA);
+         gpe.attributes = le64_to_host(gpe.attributes);
+         for (j = 0; j < 36; ++j) {
+-            gpe.name[i] = le16_to_host(gpe.name[i]);
++            gpe.name[j] = le16_to_host(gpe.name[j]);
+         }
+ 
+         /* check that partition is not empty and within a valid location */
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 2f1ba8fb92..787b2955c2 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -48,6 +48,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20215
 # 0008-fix-32-bit-dmg-mish-size-checks-65.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20244
 
+# 0010-libclamav-fix-gpt-partition-name-conversion-index-103.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20345
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
