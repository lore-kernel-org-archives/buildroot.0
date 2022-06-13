Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E53C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 20:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0EA640A12;
	Mon, 13 Jun 2022 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnTfGtsvzJ57; Mon, 13 Jun 2022 20:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA3BB408EA;
	Mon, 13 Jun 2022 20:21:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECED31BF37C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC42E41685
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 20:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8gNjMn1QeTU for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 20:21:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7188541674
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 20:21:07 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id bg6so13372794ejb.0
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 13:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vdHR5u0Y/WUe354D3UsX3wwTe7/Q75pMc/+2sz4JvDA=;
 b=YxW7K98mqz/9VVV/eKMbku9zNWu4Ng9ZJBXRcnUVAxBGtbMlQe1hQ3azQennl5+cCz
 Cd4NwAk2oAO5igG9PAgA79IBzmB4ldr3p87Vp9MKtHh8HAmFNSWuwwWbmT/1GUizQVDt
 FKMXx2Xh0Yfmk0+Pp0sXPpKv+KxEe0cVp63oFMS9WX33nP/36AC2wYPV5Bd253MdLo1b
 R0ucnGmdraYu6HfCDqQ5uUF03Cra/mb8QMPFB96NGsgiAm2xxg0JlGzkaYpEJYT8euYd
 v/OMoyXnUt5V609JVApwXNNZkT9DYf10vkVCFWA3ZlCPsO7HZzMMlBaPWz09d0VE0R+f
 nOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=vdHR5u0Y/WUe354D3UsX3wwTe7/Q75pMc/+2sz4JvDA=;
 b=tYaVbmTiRwyDzXn4vn3clu6VG760Dn14BhIHyQC4TfKOXz62s1QX0v1GrD4lBUtkbA
 JyosAz+p7AohzbsexxxpO1LNcx8CSCFOxipZ4Ej1hfN0WbEehj2WNoswIGA8wL3ttr+f
 1wQrac2H+5X2jg1fukgTZsxMou3jm5dDow9gSE5/IaXekBeuGFTrxW/GyIetSRVwjPkH
 2udABmwrjGCO8zi5nHuB6GPh8cwYCBV9d4jJ9leEFw7NWTMqmjCzKs4EONXVaOBn/0jR
 1j3tQqtKMbGCSqNSZMhXchST6yiUFESTtXYZkSTDyG0T4yAL5LH1UEfSa7cbCEh3Xq57
 aI9A==
X-Gm-Message-State: AOAM532e4cKFIV/+jZQ/Y8bHuhlYcLxW47hhv9uH6Wnf/NE006tevUy1
 jwvHEl0mEHzbP/IXycuYOF6z+A==
X-Google-Smtp-Source: ABdhPJzdKM9yzZd3JOwPxf2pghfME69kZ5BD60dmvQ2Nm2Y2tv85QmPulCEh4qbHeMwwOfJwwJa+lA==
X-Received: by 2002:a17:906:c7c1:b0:711:d2e9:99d0 with SMTP id
 dc1-20020a170906c7c100b00711d2e999d0mr1272853ejb.639.1655151665495; 
 Mon, 13 Jun 2022 13:21:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 hy18-20020a1709068a7200b006f3ef214debsm4173644ejc.81.2022.06.13.13.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 13:21:04 -0700 (PDT)
Message-ID: <6592891c-1b2d-d1cb-f34b-3e96f23e74cb@mind.be>
Date: Mon, 13 Jun 2022 22:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <48ac54a1-f946-8f98-42e4-e39d2ab7130d@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <48ac54a1-f946-8f98-42e4-e39d2ab7130d@synopsys.com>
Subject: Re: [Buildroot] [PATCH] package/bpftool: add a patch to fix cross
 compilation
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/06/2022 15:33, Shahab Vahedi via buildroot wrote:
> If on the host machine the "co-re" is supported, bpftool will
> build a bootstrap version of itself as well. In that case, the
> cross compilation can fail. This commit adds a patch to remedy
> that. The fix that you see here is already upsteamed [1].
> 
> [1]
> https://lore.kernel.org/bpf/165477661272.11342.13015777410417612477.git-patchwork-notify@kernel.org/T/#t
> 
> Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
> ---
>   package/bpftool/0001-fix-bootsrap.patch | 32 +++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>   create mode 100644 package/bpftool/0001-fix-bootsrap.patch
> 
> diff --git a/package/bpftool/0001-fix-bootsrap.patch b/package/bpftool/0001-fix-bootsrap.patch
> new file mode 100644
> index 0000000000..03f4231cca
> --- /dev/null
> +++ b/package/bpftool/0001-fix-bootsrap.patch
> @@ -0,0 +1,32 @@
> +This is an adapted version of an upstreamed patch [1], else it won't be
> +possible to cross compile bpftool if "clang-bpf-co-re" feature is enabled.
> +
> +[1] bpftool: Fix bootstrapping during a cross compilation
> +https://lore.kernel.org/bpf/8d297f0c-cfd0-ef6f-3970-6dddb3d9a87a@synopsys.com/t/#u

  The patch file should be git-formatted and have your Signed-off-by. I simply 
took the patch from [1] (which has your signoff) and added the additional 
Makefile.include changes (of which I don't really understand BTW why they're 
relevant for Buildroot).


  Regards,
  Arnout

[1] 
https://github.com/libbpf/bpftool/commit/189f777ea4829bede0bf92f572c22fe1f2c37522


> +--- bpftool-v6.8.0/src/Makefile
> ++++ bpftool-v6.8.0/src/Makefile
> +@@ -51,7 +51,7 @@
> + $(LIBBPF_BOOTSTRAP): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_BOOTSTRAP_OUTPUT)
> + 	$(Q)$(MAKE) -C $(BPF_DIR) OBJDIR=$(patsubst %/,%,$(LIBBPF_BOOTSTRAP_OUTPUT)) \
> + 		PREFIX=$(LIBBPF_BOOTSTRAP_DESTDIR:/=) \
> +-		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) $@ install_headers
> ++		ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD) AR=$(HOSTAR) $@ install_headers
> +
> + $(LIBBPF_BOOTSTRAP_INTERNAL_HDRS): $(LIBBPF_BOOTSTRAP_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_BOOTSTRAP_HDRS_DIR)
> + 	$(call QUIET_INSTALL, $@)
> +--- bpftool-v6.8.0/src/Makefile.include
> ++++ bpftool-v6.8.0/src/Makefile.include
> +@@ -12,11 +12,13 @@
> + ifneq ($(LLVM),)
> +   $(if $(findstring default,$(origin CC)),$(eval CC := clang$(LLVM_VERSION)))
> +   $(if $(findstring default,$(origin LD)),$(eval LD := ld.lld$(LLVM_VERSION)))
> ++  HOSTAR ?= llvm-ar
> +   HOSTCC ?= clang
> +   HOSTLD ?= ld.lld
> + else
> +   $(if $(findstring default,$(origin CC)),$(eval CC = $(CROSS_COMPILE)$(CC)))
> +   $(if $(findstring default,$(origin LD)),$(eval LD = $(CROSS_COMPILE)$(LD)))
> ++  HOSTAR ?= ar
> +   HOSTCC ?= gcc
> +   HOSTLD ?= ld
> + endif
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
