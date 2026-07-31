Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B435DC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75FEE812BD;
	Fri, 31 Jul 2026 12:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LS2aEPv_S_pj; Fri, 31 Jul 2026 12:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97B03812BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499515;
	bh=y/y54UH5IQlVbtOVB02h0HbOoFgevu70pIBYlL73Rlg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ms0Y21BaDFputepgyCXaT+R7waKV8DUxaXsxpLGzS+isEWwKYbmuiiPqZtLLOh526
	 knBm641Y81zUF2tNvphCZGsbD3+D56dbb4DmLVsgIL3mILe5MJYPeXvFo8Q6UfF17e
	 h6cFBftGYKelOl2feSn4plRmlTlJmo1DNX2FuKtA/7bVVBKKhjWMtwO7dYDoPG2WGm
	 B40WIza0reS0YzPV0qZhwaGif9azAujNveJIyHqk0WbUUmhiOqIDFoxMWqOgD2PF3K
	 zRiC06w9iktl8Tpvt/NbgNqAc6Nv62lKH5lMp3zzvR3JSjcgRFVBlfeFRJ/7bsFJ/K
	 kVoW8B1hm981Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B03812BF;
	Fri, 31 Jul 2026 12:05:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D161727C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B729240467
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCreqHFQZRK0 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C52240463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C52240463
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C52240463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47f752b3423so792207f8f.3
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499509; x=1786104309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AlQLi8gcstaWV0E+8wMvhAIuNup2gD0SxGVCBMOvEJg=;
 b=JJxHhjHCBjPD5srhHeaqxJr7r2I4Q4n9h1jWTuMbrGBCxzN3RLrhW1z7wUJwz19w+5
 BPAeP7RGWWCM5uMWIRBPFe7SgfNIV/47Yi0RAtZBMH+Fd+80BWmKXB4Ss9FOncXjoE4d
 YV7lUgBLQKOZHeAVVb7F3z4VGgo6MysEIBI0fue5pU0HJxKIObxo39KQtrhk0JpFmR8r
 986kX15jOEvvHaKrylh17a9GR4KyzlRqETHrXEdSnvJXyE9+ZCcvQxxX4NK4fKA4SX5p
 mkJbkhsO/M0wzZXN9P05WzM0tCUrzJ4uoNK+wc2jtlP0wnN/L1laknobmDQtuzlUAzwc
 ez4w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq/9Xtk4JC0pyM6hb93I4cPEJyeArkRzURUGICTiUzY2tK1qOHrXLb2g9CUeYTiB4lGgziarORGiqs=@buildroot.org
X-Gm-Message-State: AOJu0YyDgSPdGovklmNdJzjh50D6nomePXvwbeQQFJDa08WeMsruscOt
 Tex/j6be4tqjCiWLnSo+77q8F0aigfOyPCEHvCNPd1w+8Mb286aznW9N/pR1BfWav84=
X-Gm-Gg: AR+sD10j5qoBMHItiqpeK6F2UEiiW5BZTPTPXmYePP89J1rI831Qf0ds2ZuGs9J2ApV
 r8HL7QiVd3Bn/80nPN/cf6EM5Mn3JsoE1qiW+OWORwToAQVgJn4hMINWGT1WTSCtzaVSezBRNxF
 U0TFll49yQPdYtKDI91tmrtn354Hoxgs3iUZSs7dEWJETGYwKezjWxfUWOatCaIazkwt5gYoXAv
 69HtOFTa9izoGLWfj1WQPR4Qvaq3XNPNY1hyWnIKeA9/fdMjtmfA8U3uIU+0Q6kD5attqefpYrX
 q+gPoSUIDaOUU6yJkkWqfV3AgT/oc5FAXX6E0dzRGmtSCgNp+ZQMdTdTA5qwxDt/u8h8LgMDneq
 8epB3aQYcddk1BKNUJscb4O5DkfdhM41GnkYSvqJ6120ZSeEDGkuF0+0EyYnGp+n8wk8Sh+emmp
 kthTouwgRERZr3xd2tqIS+rV2uNKlssm9dyRkPcbRAhhCvLxJ8oZuy4ReprheHGj+abJjVLK0LG
 Ooz9B81QjJJTp4xoSS5Npybqw==
X-Received: by 2002:a05:6000:290a:b0:47f:924a:6542 with SMTP id
 ffacd0b85a97d-47fd2b6fac4mr4186826f8f.55.1785499507889; 
 Fri, 31 Jul 2026 05:05:07 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd45a0c8bsm3953686f8f.34.2026.07.31.05.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:07 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:05 +0200
Message-ID: <20260731120505.3288-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718085806.1047751-1-bernd@kuhls.net>
References: <20260718085806.1047751-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499509; x=1786104309; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AlQLi8gcstaWV0E+8wMvhAIuNup2gD0SxGVCBMOvEJg=;
 b=goXvmS0ar/jZDA+gUezIoldihc6J2R/4BMDXOr2NwU0g8BnSiUizV03dcbT+NYPYEr
 v/hkCp7x5JsqmZXXiZa60Jwlx+ECOuULiQRCvC/d36SZ6BfC3YRHjyXCNXFfS9ygBk1Q
 CxEiLHteCZr68LwOBHGQWmhDYS31EUChOHtqylqCUS0iTmI1Tw+kqG+UEQqkLih94y90
 Hqi9MrIhyzzORlvFHOXuJIyKLW5lZMxsajR+X5kdB2Xtrr1HpOLyHPmE/xY6r/tiEup3
 Ch95GYMZbxyraPda30Za34iW6dXD6V6GssWCa5SWfjP1PHbvm0hTID0XogLkMuj4jUz8
 TRFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=goXvmS0a
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: fix build for
 powerpc64le
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
> Fixes:
> https://autobuild.buildroot.net/results/40a/40a26d9831667233944e6aabf2388f02a8cf30ac/
> https://gitlab.com/buildroot.org/buildroot/-/work_items/79
> 
> packet.c: In function 'ssh_packet_log_type':
> packet.c:1219:1: sorry, unimplemented: argument 'used' is not supported
>  for '-fzero-call-used-regs' on this target
> 
> Upstream bug report: https://bugzilla.mindrot.org/show_bug.cgi?id=3673
> 
> Upstream commit
> https://github.com/openssh/openssh-portable/commit/29cf521486bf97ab9de5b9b356f812107e0671bc
> which was first released with version 10.1 and was added to buildroot
> with commit b52b3fd59dc6c86ef51b6cad5b76017f90c83beb introduced cache
> variables to disable zero-call-used-regs when needed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/3f6778e8438e1e6c172fdc60f1185aab8afb7443
> 
>  package/openssh/openssh.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 2f3088defe..5575ba4f97 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -36,6 +36,10 @@ define OPENSSH_PERMISSIONS
>  	/var/empty d 755 root root - - - - -
>  endef
>  
> +ifeq ($(BR2_powerpc64le),y)
> +OPENSSH_CONF_ENV += ossh_cv_cflag__fzero_call_used_regs_used=no
> +endif
> +
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_110934),y)
>  OPENSSH_CONF_OPTS += --without-hardening
>  endif
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
