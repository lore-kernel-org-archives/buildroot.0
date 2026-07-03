Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003F7C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C995481FD1;
	Fri,  3 Jul 2026 14:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7z1CXyRZGZ2e; Fri,  3 Jul 2026 14:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7EB181FE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089142;
	bh=krxFUnERiog766svuyYufIuSo4rsLrq+PzOVreL/D+o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nu1GYtgzz8zS3T+m8eP3KlKXuHSkKCIisR78VPRK9mstr6Bgj4T9yTLCsdlvIs4Iw
	 CssaVV/ChB/2yBqmsRlMEZk3ocisyFcImJCpRSOG3OOceGF60t7NAPVwZRoMV6qImW
	 Rp2Qx8/EgRJbL9+sQ39O4Hv+2ypqan20Yy2V4D+N+o4E0rC5QoLB7yC4xj+c2TW1hD
	 ollOZrZ576hNDKPmPXG2/ytB+OOnSEqIxnLFKHSktF9egm2T5cx1wi/GPZjB6+xGFj
	 jEj1VOGmn5USoaVpRxQEWHDbgCAnqxr0h6/TKGMnB2GLBp3A1hZe/VcLdoi/FbAOT/
	 iuJjQosUkWNvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EB181FE6;
	Fri,  3 Jul 2026 14:32:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C325363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2219B81FE6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3Dk01HqYclc for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C5F081FD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C5F081FD1
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C5F081FD1
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493c59f740cso4372505e9.3
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089137; x=1783693937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=euGfrktGWHyk/6cxHigp8qTmPaj5FaRbgI0izUwepRo=;
 b=dteie6me5LtoK0E3Mb8SOi22RGkjwgUuPVlA3xMskQgThVyKMyMOOzp6nkN3WuZRrJ
 BBQT83aVbzpoh2LUL9tdYN+AjI73xJFd7pkcX7tWBK2zbncJg5zdxKFYugVZe0ZxG56O
 AA9ll3zjI4U+COKl7/6VVuitqi8opHx8tCUCRvcaggq15TlEKjBoL63kPI831fX1osqc
 tkUiWb+uPTiKzD5mavz6RLKJJmXWBbEfyynoqoEGqN+GW79+mBPgicw4SQRNriBkg+hL
 2Jj75VLUCALEm72Sr2JFACgK0nwg4JLpHa6mnlQIp+8KBVLghEdW69Qqx+VkH8cowIgo
 icAg==
X-Gm-Message-State: AOJu0YwgooGNfGCK+23krEnjELX2QopaXTx4c1cwqcSkeX/VeBNVJ+Vm
 NmwPvtF1GFr1QUoRG429a5nNyHAFhivVNXHgMjoxbzHVmG7J7Iyty+M1dtS07HaeOy8=
X-Gm-Gg: AfdE7ck7bO/H5Lq0L4AuRxBkasa4XwyFktJKeNxyqnxiLA5rgyPa2rfSH1xS/0+pnjm
 PlNZSM/J9VEjujCEdnuDNgUJUGYjlKr0W9q7GvMCVYSRkKJ+X5Ge5Sc9q6giK8jEpSwBxop8ZSX
 70E4tWMbdznJ3cwFnn8/c1EhEDMvJRwZkc/51kCMceQYkFLNZdOhYJjLJZvhGioxZC4tY1/yYMk
 nqjN6YxC41jxF8Kz24KH1SdIRastdEZiD3/q28xwJE1jfZNd7tkZrcwylwmL0PUgFHFK9IiNBcE
 f3++w5xJF9xb8VAHu4jTmRmnOVE31MoCMOXqUw81zCcJYzrBpbwIriuMVJ5ozE9Wul/rnOYwnkJ
 cXRPdeOtQgftxFlEhax0mbAUzS2vYMIblth4W1NvukbAQlZUD+rict6O2xpvioLWMl/QgoP4vim
 Mdu3Fx
X-Received: by 2002:a05:600c:4789:b0:492:4e09:9fc1 with SMTP id
 5b1f17b1804b1-493d0f0f8c2mr913955e9.15.1783089136719; 
 Fri, 03 Jul 2026 07:32:16 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db3dbb01sm18637990f8f.1.2026.07.03.07.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:16 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:15 +0200
Message-ID: <20260703143215.274487-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260625141231.108067-1-thomas.perale@mind.be>
References: <20260625141231.108067-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089137; x=1783693937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euGfrktGWHyk/6cxHigp8qTmPaj5FaRbgI0izUwepRo=;
 b=VT2YjtkIYc5ZMVmUM/tvp3ifjFOUTB/I3Cm4VjTEXDtlQF/vnAZ9K+v02nRTUSoNXn
 ROy0QX+0KWRFdi5rZzzuExe1Y8iN6QaZZmT09vxxSFDs0k/nViYlybZOhQlXyi9NwjbW
 53znzqeDPX3fSIi+XCWSSI2Ub1aDQbWQHQgKQExe6E2dlSz9xxW3Zv/RU8RrjEk7DBVS
 tQxhenOO9ayt17RWC09x1Vb743VKpUUJnK7EJ6FNff6F/vH0lh+VcbxPNN6XK7mB8aNG
 J2chvFyWgaE/VbHs++lZWsUwcCrMwViZwkGo6TX/H8AsVt3zG3K55duBFuKVBTcQQVt/
 y9SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VT2YjtkI
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/swupdate: add upstream
 patch for CVE-2026-28525
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

In reply of:
> - CVE-2026-28525:
>     SWUpdate contains an integer underflow vulnerability in the multipart
>     upload parser in mongoose_multipart.c that allows unauthenticated
>     attackers to cause a denial of service by sending a crafted HTTP POST
>     request to /upload with a malformed multipart boundary and controlled
>     TCP stream timing. Attackers can trigger an integer underflow in the
>     mg_http_multipart_continue_wait_for_chunk() function when the buffer
>     length falls within a specific range, causing an out-of-bounds heap
>     read past the allocated receive buffer to a local IPC socket.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-28525
>   - https://github.com/sbabic/swupdate/commit/beee2dc0feef1cfe84f1aa6fc980e104b2e47a74
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> (cherry picked from commit 0c6595aaac7288335e8d8bcccc383a8a12f635f7)

Applied to 2025.02.x. Thanks

> ---
>  package/swupdate/0002-CVE-2026-28525.patch | 51 ++++++++++++++++++++++
>  package/swupdate/swupdate.mk               |  3 ++
>  2 files changed, 54 insertions(+)
>  create mode 100644 package/swupdate/0002-CVE-2026-28525.patch
> 
> diff --git a/package/swupdate/0002-CVE-2026-28525.patch b/package/swupdate/0002-CVE-2026-28525.patch
> new file mode 100644
> index 0000000000..75f99a698f
> --- /dev/null
> +++ b/package/swupdate/0002-CVE-2026-28525.patch
> @@ -0,0 +1,51 @@
> +From beee2dc0feef1cfe84f1aa6fc980e104b2e47a74 Mon Sep 17 00:00:00 2001
> +From: Stefano Babic <stefano.babic@swupdate.org>
> +Date: Thu, 19 Mar 2026 10:50:13 +0100
> +Subject: [PATCH] mongoose: Integer Underflow in Multipart Upload Parser
> +
> +The function mg_http_multipart_continue_wait_for_chunk() has
> +a discrepancy between its guard condition and a subsequent
> +subtraction in the else branch.  The guard at line 250 checks
> +`(int) io->len < mp_stream->boundary.len + 6`, allowing execution
> +to continue when io->len >= boundary.len + 6.
> +However, when mg_strstr() finds the boundary string in the
> +buffer (else branch at line 264), data_len is computed as
> +`io->len - (mp_stream->boundary.len + 8)`. The +6 vs +8
> +mismatch means that when io->len is in the range [boundary.len + 6,
> +boundary.len + 7], the subtraction underflows the size_t
> +variable to SIZE_MAX or SIZE_MAX - 1.
> +
> +This will fix CVE-2026-28525.
> +
> +Description of issue copied from vulnerability report - many thanks to
> +Kazuma for his analyses.
> +
> +Signed-off-by: Stefano Babic <stefano.babic@swupdate.org>
> +Reported by: Kazuma Matsumoto, a security researcher at GMO Cybersecurity by IERAE, Inc."
> +Upstream: https://github.com/sbabic/swupdate/commit/beee2dc0feef1cfe84f1aa6fc980e104b2e47a74
> +CVE: CVE-2026-28525
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + mongoose/mongoose_multipart.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/mongoose/mongoose_multipart.c b/mongoose/mongoose_multipart.c
> +index 12ea54348..7fdc18632 100644
> +--- a/mongoose/mongoose_multipart.c
> ++++ b/mongoose/mongoose_multipart.c
> +@@ -260,12 +260,12 @@ static int mg_http_multipart_continue_wait_for_chunk(struct mg_connection *c) {
> + 		}
> + 		return 0;
> + 	} else {
> +-		size_t data_len = io->len - (mp_stream->boundary.len + 8);
> ++		size_t data_len = io->len - (mp_stream->boundary.len + 6);
> + 		size_t consumed = mg_http_multipart_call_handler(c, MG_EV_HTTP_PART_DATA,
> +-														 (char *) io->buf, data_len);
> ++				 (char *) io->buf, data_len);
> + 		mg_iobuf_del(io, 0, consumed);
> + 		if (consumed == data_len) {
> +-			mg_iobuf_del(io, 0, mp_stream->boundary.len + 8);
> ++			mg_iobuf_del(io, 0, mp_stream->boundary.len + 6);
> + 			mp_stream->state = MPS_FINALIZE;
> + 			return 1;
> + 		} else {
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 647a6f071b..ecf7864225 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -20,6 +20,9 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
>  SWUPDATE_INSTALL_STAGING = YES
>  SWUPDATE_DEPENDENCIES = json-c libubootenv
>  
> +# 0002-CVE-2026-28525.patch
> +SWUPDATE_IGNORE_CVES += CVE-2026-28525
> +
>  # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
>  # available in all external toolchains, and use CC for linking. Ensure
>  # TARGET_CC is used for both.
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
