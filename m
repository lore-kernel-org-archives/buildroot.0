Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6DAC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 887908130F;
	Tue,  2 Jul 2024 19:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvJxFPiFsBIu; Tue,  2 Jul 2024 19:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9785981323
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9785981323;
	Tue,  2 Jul 2024 19:30:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1CF1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBFDD81314
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfUHdiphdpLv for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:30:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23BB28130F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23BB28130F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23BB28130F
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:30:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4256aee6e4dso33409275e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719948644; x=1720553444;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8gXPppxTmmjZKXNXQ9jk+4Pln9UZm7UgbIj4GhrEnjA=;
 b=pHMvnGVMjBVP6xxgBMTq0iLAqv3IV+QUuIMNbZ+Iw7PdUKKDo0GKStI360fQZc/7IJ
 pW6ZBCm00lXlbWaqhNFOegX5c0CQrbnBFr6tNu7gRdb1ypEL2R6+dY2gX7sGjNRWFOff
 BTPq2P0/yZN+3WLqWV3Cn2FyxL22muZoXwLzTqRbFWCpCYCcfmR0C1IJuYhN+uEBFSqg
 ch3NOcyoI0MAOCH4ZilSxOWB+cB6lCguloWfy9w5Sgv6KETNdOv+NF9kkyCAGOwa/NMi
 VlD/93xG4/plugd5gqAMf9T3jacGLGJnH/mLHFdP/F7baGmFmg4BwpD1A2tCv7ERENTD
 mdlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0cQJKwU8aOvj7Nw4pIMo50oJ9fB7VlOxDJgcV75MVw85Bv7I9hkRWuZQnBzfTTOoLLNk5xw4qsLj6Z0SNtkQTolGbbCXXpQ==
X-Gm-Message-State: AOJu0YzgQIu9kAMaqqPD558CiwxBEZeESAEx5hoSsI4pHcAycKjZCMM6
 zmMrKNGm4g3jbxBXi2j/r917bvKh4oTjliLxqh8zAfdkjZqFUmssB2dTBhRydqDYmeGZKlImdo9
 l
X-Google-Smtp-Source: AGHT+IFJSFr/e4+G1ErFZirBWitnDLvRmCdGwGfjbf6iEsSg0szuaC+JJfnXZ1Zke37ZA8EnBTgpVA==
X-Received: by 2002:a05:600c:4205:b0:424:ac9c:71f9 with SMTP id
 5b1f17b1804b1-4257a0282eemr57765695e9.39.1719948644105; 
 Tue, 02 Jul 2024 12:30:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b097fd4sm208103325e9.29.2024.07.02.12.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 12:30:43 -0700 (PDT)
Message-ID: <0731d879-631d-49af-9c42-57ae774471ba@mind.be>
Date: Tue, 2 Jul 2024 21:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Yann Wettengel <niyawe@niyawe.de>, buildroot@buildroot.org
References: <20240702123615.1028278-2-niyawe@niyawe.de>
Content-Language: en-GB
In-Reply-To: <20240702123615.1028278-2-niyawe@niyawe.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719948644; x=1720553444; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8gXPppxTmmjZKXNXQ9jk+4Pln9UZm7UgbIj4GhrEnjA=;
 b=Ocn8wY81ttq464OK9p6Vxhc0Q8CZa0Vq3fFGI5NjSAPjmVVjRUoiBQIt1RODQ2DZ0D
 10i17WrJMMM5Wb/v6lZL37JsSU6LoUt8IiGERXVL65g4b6FGxZ+1C8KfyqMsZ1rYhacR
 42A7H4bWmxDVf0Fg/7Gg04quVc+yCcMsWQMPwE5/7NExoWALt9XPwm1t/GIkLlOg6tlQ
 9ztv02SkejXdV+Hfugd9wtZDwxhdSNyuwHUQolHSsL1lJ3I557bRjTnPxstxNAmprlgA
 OL9NiFN3EoSGL+wV5queQeEWSmXsMWBw0y5998RD2XNgvnjaQsxW12a1ERcRT1O/r0+R
 3QTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ocn8wY81
Subject: Re: [Buildroot] [PATCH 1/1] packages/openssh: install sshd-session
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 14:36, Niklas Yann Wettengel wrote:
> In OpenSSH 9.8 the server is split into two processes: sshd and
> sshd-session which results in the following error, when trying
> to start sshd:
> 
> Starting sshd: /usr/libexec/sshd-session does not exist or is not executable
> 
> This patch installs the sshd-session binary
> 

  I've added a Fixes: tag here to refer to the issue on gitlab and to the commit 
that broke openssh.

  Applied to master, thanks.

  Regards,
  Arnout

> Signed-off-by: Niklas Yann Wettengel <niyawe@niyawe.de>
> ---
>   package/openssh/openssh.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 6d846f64df..7065c3ae4f 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -117,6 +117,7 @@ endif
>   ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
>   define OPENSSH_INSTALL_SERVER_PROGRAMS
>   	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
> +	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
>   	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
>   endef
>   OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
