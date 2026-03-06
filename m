Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDA5FCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D3754218C;
	Fri,  6 Mar 2026 19:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84lv1Z974Y5u; Fri,  6 Mar 2026 19:53:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3314341FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826826;
	bh=HBahqjfLk2io56uOjWLTQm9D3odLI8kOymlb3Rn59hQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h3f2pQQGSPPr6zPEPZxvjw/LY/SbmFBb/kLRbga5smvaeqpxs9TW+qNcI4p7eYJwJ
	 LIAtt8gHO8OZ383F+z9Z3HAwzb+p1aUhIZz0amWwznKjs/1byJSl2R1+wxdJ9Ho7IC
	 m7Rs1PLTaVQPqRIPIaPO90d6eyeZHqHMWCFD6bCLcbiVtLKLQ14uNTPIXMV/88wenM
	 DJzeh4AELw+VvfOr6JsdBGYUlm2YhlfeDiNQygU1ISAeLbOFdSJ9iO3c55TJo3Mksl
	 xHycEHrY59aYnhNrAMQfDpmb5Ahp8+NxgtdYMKYYNTWja857pUY9F5iQuruwYhZRrJ
	 sJTyFdS03ZwAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3314341FD0;
	Fri,  6 Mar 2026 19:53:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71BE3169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C766B41EB0
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObVpcUcmuwZt for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CFCB41EE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CFCB41EE7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CFCB41EE7
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso98474855e9.0
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826810; x=1773431610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sQfz6BEJ3NK78Ox84MDtgGHz1mE9e/6M+saDvekL1M0=;
 b=UJn06trOFUGnSW90E2b9jq8+gkyTHNKekaCSKJHbRQWECKVRMcHT1XLOUTaHZQ30Wc
 /C5eFQD3BgPZzFodUsQ4CSnc9AhWOFhTZPEZYcUPQClBr8m49GDJHMWFyU6/5ncekhB0
 wOWjjjZuO/NUauP4a21krzfWKPaGHKPZMDRgkooRTcJG27wNMB76sGdjRCE3JuS7mnFw
 WSSqC+CUTWLf74K1bByPHxrD0YdDlCBWuDDWNPHgD+3OmPQed5OhRC5kruOHSsVxEM3f
 3eRIPAuEYfiYU5VCmhfHpV4x8l8IV2kAO+nf5s0I/Nmb4AbRNdY6MW0Y1RhS1XO6SCMi
 qxgg==
X-Gm-Message-State: AOJu0YxsnrqnMXGCeMyEEeNqDbb+7dPHrvR1cDRurTIxdTevKl8fleU3
 6JmsNE+7vFA3pGX9Qhd7uO/4Q9/OecLXSKFeRGVmGCTkOJeYKWbZv671cOGmvimcTphRVarB6pM
 F2967
X-Gm-Gg: ATEYQzxOahrEYc/cQXU9O9LMMgP8SQ54S3WNcsLgHKCIt+HNgiRyDvMKI6VTOR74Yg0
 tXiQdtUtEfXwrZvoACMwrmk03IMxDMogakAuH8eVhMaDNmck08guAGJDrK/HLvGNAzcaXHK2GyJ
 BcKYD7vElvCZC6HJlU5RPyQnwyr1YH4nfReA4dOX+lLOzP+ZR9tPas8EsrYNfea2Si4VHw0YiT/
 FnUAvuEaE3rtSW8kjXLcDkRjeVWz4PijlMg3VbfjixBDImf/1KtIYN+9suYWRkvmee80JswinA+
 s1af/pb2/ohf2SAgPZcRXkn/Tb47sSwLPr+OpDEfzemedZWRziXBhO4zuHX05y4ly6niwEglV6s
 Me2pDMCU1MEi1ybfuf2s7vxKfjdiNTkTEXaB2AjDsUcltrGsIj7u9irB9dT5LDoQgmbESCpRch5
 c5VoFLZJXtgE2+bxI=
X-Received: by 2002:a05:600c:a4f:b0:47e:e981:78b4 with SMTP id
 5b1f17b1804b1-4852674e8damr56025705e9.12.1772826809566; 
 Fri, 06 Mar 2026 11:53:29 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48527648a19sm55236425e9.0.2026.03.06.11.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:29 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:28 +0100
Message-ID: <20260306195328.8642-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303110445.306426-1-thomas.perale@mind.be>
References: <20260303110445.306426-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826810; x=1773431610; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQfz6BEJ3NK78Ox84MDtgGHz1mE9e/6M+saDvekL1M0=;
 b=Ph79awRn/zSxmhNHirI9DzKg5XW/+ihTZTiHJmrGM4UVtmpYQ+zAzISmnohzUzU0dk
 mv2Zj7AASHJK+wUIiEBjP6DWlWOB24TXyEHjx9FYVnEHds87KMFXBRCpqjI7DqH6dtcf
 LH/Ph7kGn0zA0zlWJQhBLVVBRU2gSR2tr02c/7D+L5CDUSrodLmeJNvetHwczCbJ4PxT
 ub4DHkYdpJf1BYr3WPX7PzZhm9uetkjuQJWRgJPLqysoBO3WIUGD1Li1gU5ygc0qV5Xk
 zUDiISas0is+cpdToXqrMKIQzIoEoiRXQCDT9ar1ax4f53NhwSVQXwmqtuu+ozrWHjA+
 Vc5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ph79awRn
Subject: Re: [Buildroot] [PATCH] package/vim: security bump to v9.1.2148
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
> For changes, see:
> 
>   - https://github.com/vim/vim/compare/v9.1.2017...v9.1.2148
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-25749:
>     Vim is an open source, command line text editor. Prior to version
>     9.1.2132, a heap buffer overflow vulnerability exists in Vim's tag
>     file resolution logic when processing the 'helpfile' option. The
>     vulnerability is located in the get_tagfname() function in src/tag.c.
>     When processing help file tags, Vim copies the user-controlled
>     'helpfile' option value into a fixed-size heap buffer of MAXPATHL + 1
>     bytes (typically 4097 bytes) using an unsafe STRCPY() operation
>     without any bounds checking. This issue has been patched in version
>     9.1.2132.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-25749
>   - https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a26fa9
> 
> - CVE-2026-26269:
>     Vim is an open source, command line text editor. Prior to 9.1.2148, a
>     stack buffer overflow vulnerability exists in Vim's NetBeans
>     integration when processing the specialKeys command, affecting Vim
>     builds that enable and use the NetBeans feature. The Stack buffer
>     overflow exists in special_keys() (in src/netbeans.c). The while
>     (*tok) loop writes two bytes per iteration into a 64-byte stack buffer
>     (keybuf) with no bounds check. A malicious NetBeans server can
>     overflow keybuf with a single specialKeys command. The issue has been
>     fixed as of Vim patch v9.1.2148.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-26269
>   - https://github.com/vim/vim/commit/c5f312aad8e4179e437f81ad39a860cd0ef11970
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...src-Makefile-create-links-with-ln-sf.patch | 78 -------------------
>  package/vim/vim.hash                          |  2 +-
>  package/vim/vim.mk                            |  2 +-
>  3 files changed, 2 insertions(+), 80 deletions(-)
>  delete mode 100644 package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
> 
> diff --git a/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch b/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
> deleted file mode 100644
> index 54d423aacf..0000000000
> --- a/package/vim/0001-src-Makefile-create-links-with-ln-sf.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From 5686ef63f81fcac2ca6ec6e7160829b295ad4e79 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Sun, 28 Dec 2025 15:01:38 +0100
> -Subject: [PATCH] src/Makefile: create links with ln -sf
> -
> -Running "make installlinks" twice towards the same destination
> -directory will fail, as symlink will already exist. This is not really
> -expected as "make install" is normally expected to work again and
> -again towards the same destination directory.
> -
> -Fix this by using ln -sf.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Upstream: https://github.com/vim/vim/commit/6df5360691266b5eca49380e94f3e21fa48e5e0b
> ----
> - src/Makefile | 24 ++++++++++++------------
> - 1 file changed, 12 insertions(+), 12 deletions(-)
> -
> -diff --git a/src/Makefile b/src/Makefile
> -index 6fb1eb95e..39f798260 100644
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -2746,40 +2746,40 @@ installvimdiff: $(DEST_BIN)/$(VIMDIFFTARGET)
> - installgvimdiff: $(DEST_BIN)/$(GVIMDIFFTARGET)
> - 
> - $(DEST_BIN)/$(EXTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EXTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EXTARGET)
> - 
> - $(DEST_BIN)/$(VIEWTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIEWTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIEWTARGET)
> - 
> - $(DEST_BIN)/$(GVIMTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMTARGET)
> - 
> - $(DEST_BIN)/$(GVIEWTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIEWTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIEWTARGET)
> - 
> - $(DEST_BIN)/$(RVIMTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIMTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIMTARGET)
> - 
> - $(DEST_BIN)/$(RVIEWTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RVIEWTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RVIEWTARGET)
> - 
> - $(DEST_BIN)/$(RGVIMTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIMTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIMTARGET)
> - 
> - $(DEST_BIN)/$(RGVIEWTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(RGVIEWTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(RGVIEWTARGET)
> - 
> - $(DEST_BIN)/$(VIMDIFFTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(VIMDIFFTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(VIMDIFFTARGET)
> - 
> - $(DEST_BIN)/$(GVIMDIFFTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(GVIMDIFFTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(GVIMDIFFTARGET)
> - 
> - $(DEST_BIN)/$(EVIMTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIMTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIMTARGET)
> - 
> - $(DEST_BIN)/$(EVIEWTARGET): $(DEST_BIN)
> --	cd $(DEST_BIN); ln -s $(VIMTARGET) $(EVIEWTARGET)
> -+	cd $(DEST_BIN); ln -sf $(VIMTARGET) $(EVIEWTARGET)
> - 
> - # Create links for the manual pages with various names to vim.	This is only
> - # done when the links (or manpages with the same name) don't exist yet.
> --- 
> -2.52.0
> -
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index f7c883b929..ecc41be702 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  be1d60091d27bbdbc090e0bb19798baeea378aa29645fd47dc4c222dc14efcaf  vim-9.1.2017.tar.gz
> +sha256  f9ec31df8f1a78e130dd06c395e6626c2a8a8ec2705d8e7b7667bd3ecd499c6b  vim-9.1.2148.tar.gz
>  sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
>  sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index fa7d47d67d..9201587a8a 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VIM_VERSION = 9.1.2017
> +VIM_VERSION = 9.1.2148
>  VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>  VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>  VIM_SUBDIR = src
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
