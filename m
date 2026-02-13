Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E085EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F7FB849F9;
	Fri, 13 Feb 2026 19:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XH2Wsud6-dJF; Fri, 13 Feb 2026 19:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5003684A07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011685;
	bh=m9K+05FbTRW7+57BtzbLdca+Zo1KPLLuJwE17flMk2Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NSNFf/7yvpyXc+zm9YDV72tmGXTzDfEmCow/5o95zNhCX8ky+g7ZwNZFM9IWP70da
	 fNRbXgqoDUPq9S3w7BRqIUxfrbyDtmzS6ggXHepK2Eelcxk19RCDHJxoOl/EtkCoTf
	 2UhCQUujEglVM672hf2R5INyDUFi9Nl8oA0y47wZ1NtYjF9YBtV6n4yT49fNkVLyhZ
	 qenb1BGNG8Fl8GZkjn4Emvo9laj9zdyUpVnlHxGCxlrMEZGwl3yWtvLgY+II0yJ44R
	 ac9R2UV26/i5fxOUqbQtSLh0FELvcOaLuv74pglhZPuEvgap99vlAIfa+vKN/WbDKs
	 qlWHFMWhUip3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5003684A07;
	Fri, 13 Feb 2026 19:41:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB99EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66F0040272
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEsnSDszOGoa for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37ED94026C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37ED94026C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37ED94026C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:41:18 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4837907f535so2742155e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011676; x=1771616476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P+orvKSW2j+/WEr0lmT20mxMvAA7cRAaUoYqPXLSZ4k=;
 b=eLdlWdtu3IvpAdpp2n1EZ0M8nDwGEi12N+3NErtQxmoxO1r5ozDopk5iFuFR2jTU8n
 j837A0MEuAFXnXvRynjZLd0MK/tvRZA4W1i/fnlm1ctEf61mLMC4WdzyRDOwpVdCD+1v
 DUX6Mne9kt4uaE5OIU8wIimr5eIDSJJk6dOtMt4MwXISL4ASpx/Q3OOi6Sc4MJe3Ro+p
 BcP06TQLFJfWx925djAlirPq73LJBC5VmAWugyEvjpApJzjXxn7GltVX7LNRbxNQiXQN
 5u1Ynba2+zp/FE3BLPOBvFf4+1DX368L79ECayj3WzlNhImgnLgjbABF9Or4rOcnM4Yo
 Mz4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc4SzDjX3cnKY3vUwUZb4yMlG/xbdo7doMAx3dLjGZMIi2SpI+dgoA9eNKgWGY9+3wUytpdiZOUVs=@buildroot.org
X-Gm-Message-State: AOJu0Ywcob1FWROnP2kmPpnjay8DiFLWMbrDikB0GpHpSlKSmL4tAK+F
 SGta3K3aGLQk4IFt8nSMwzgZqv1ncKNCwI3OBJ6IkSjoJx53SnO6BNQTwX6z0GnEbb0=
X-Gm-Gg: AZuq6aI3RCYirUKQuUiuQFg0s8Klyg+tc7YhYbjvJF31fgRgo//0n8RoboX3olUfQvS
 qfFWAslcIvPrXaEPVf9FJlNGTW/6uToP67ElDve4lZCXmdJzmYBdwZhvVrrOWb1ZIM9p+QgIM6F
 KW9ThkrwWYPnAyT11unlzlKHZEcR9zuraIfq0I+gfekYdmyJhZsp76cXj4S/2MNN7fBMT3uMheb
 0BnUzSwmjyjFxVyceuvis/HXYfzQgFniEgnqfHXnzMSNpC4bvML1WfvWaOsntconCtBYi0dgSii
 eI+wyJ9Zu9+cIEHmf0UNnQOIdxc0HGxORzzRTdLUhlu91ertBczIpr+0PRxgep0Wv2DVNTRkUpH
 OoVxczp6BfYVDbzx1FKUe6L7Q70Ph6qm1YBAGzO8z+vKFull32Now0fDCcHXZa4eWJZngPTt+2o
 OnWJJKP5Tk7gMsdX4=
X-Received: by 2002:a05:600c:c4a5:b0:47e:e71a:e13a with SMTP id
 5b1f17b1804b1-48379bedc20mr4760115e9.32.1771011676288; 
 Fri, 13 Feb 2026 11:41:16 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483709fdd39sm41690125e9.0.2026.02.13.11.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:41:16 -0800 (PST)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:41:15 +0100
Message-ID: <20260213194115.48876-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aYNnP1uFAqo1fta0@waldemar-brodkorb.de>
References: <aYNnP1uFAqo1fta0@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011676; x=1771616476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+orvKSW2j+/WEr0lmT20mxMvAA7cRAaUoYqPXLSZ4k=;
 b=Jne9Xp6fzrZpWdvkXPzRAyGtCYoj+DSjAKnVYVwaZbI6DtSwIlm6BkKAQ/H8E8nOFl
 APBxmxRynromy2Xz0CQ+7BBVw3olLOHbeOjGYKBUwRAHfOzGRxbN+Faepy8blHuAx1yE
 T7Fhllx8Z6T/QOTyeYpgDKvTp7y9Kctwsc5j+pby3GkZEKdPLSaCw5kbRlmilXpGOYJu
 nLF6gQcQI2OX2sGhkBbJQEgnT3NsdpE6xOUd2K8YqZK0ZKAe/nZkzsQV56UOs9Px7J8n
 Rge1Uq0vfR4kU6N84tXOKf/WYUNomPWM6CsA/7HCqNbfZ7waW7i8SRxsarWwW8c0xcbJ
 +b5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Jne9Xp6f
Subject: Re: [Buildroot] [PATCH v3 2/2] package/strongswan: add Linux kernel
 options
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
> See here for options required by Strongswan to work properly:
> https://docs.strongswan.org/docs/latest/install/kernelModules.html
> 
> We only enable a subset, which is the bare minimum to start
> charon IKEv2 daemon. For advanced users this might be not enough.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/strongswan/strongswan.mk | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 63ebd275e3..1e9e96367f 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -114,4 +114,16 @@ STRONGSWAN_CONF_OPTS += \
>  	--disable-connmark \
>  	--disable-forecast
>  
> +# bare minimum to start charon
> +define STRONGSWAN_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NETLINK)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_AH)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_ESP)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_USER)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_INTERFACE)
> +endef
> +
>  $(eval $(autotools-package))
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
