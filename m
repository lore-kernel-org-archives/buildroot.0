Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3816EC83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57A760B6B;
	Fri,  4 Jul 2025 06:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILi8Fpd90sWH; Fri,  4 Jul 2025 06:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 034F160B13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 034F160B13;
	Fri,  4 Jul 2025 06:46:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F61A1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F41DA82A53
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFMEzNJY7j_w for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0F3183300
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F3183300
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0F3183300
 for <buildroot@busybox.net>; Fri,  4 Jul 2025 06:46:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a510432236so383360f8f.0
 for <buildroot@busybox.net>; Thu, 03 Jul 2025 23:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611586; x=1752216386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMGC4s3WojLDP1lSrYyTzG65Z2ywl5X98Rr/0v1YooA=;
 b=cFx2sjFXD/xkCY8tYJpEyoaDGTU+TqyC+7GeCfd+u31kXbYVOc6px70TiiHrzNFvap
 7HFjmyKHslHMCuQDTmDnrVF1jfblU/vsjlq6DAub8CI0tWOFkroRVtCOS2mQi8VVYRuF
 U9rK5Z7m+YSR78U2XNknm3BaDMQOM0F8oXRuq7OxEthILDk/zi7C+VZXSiB775mys8+8
 3msunVVFa+ZqyVOP96VYrmFDuvZhlORKsovHGWq+105IeWwZCcjY72+XL6nQ6cJkP+X+
 dqMfd+SBTU2e2BsgqcGg6H07NnCzQNRRXw9wUBo9hO8puzBl5pKrL8youLuc2yfQ+Htz
 GSHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4cuOKcAc74GSs15CpWIh8STStaabNjQ+xZhFvJu4ellBJjDMieLiaFVVcvFkF7KtTmn6zVf5+I3Y=@busybox.net
X-Gm-Message-State: AOJu0YwqfKydrnIO4Sd7Apx2WjnN3UtXrqzFINpkyeo2WWyBLau0VaJ2
 ioav9rJoBwaKcEDlr0iHFpz6fSAsh/sNUzo9tJLfqase6deyz0VzfD7gzBpp9Fl1/zk=
X-Gm-Gg: ASbGncssecjQRsfZyu2VxvS6VniGYTVJTHSo+TTX9UBsHUvbhKWYh3Atbx3TeMYjOwm
 bLtbcIUGl357VFxCfn5W/leJVfpWTDoT/yWrDZaAJOY8IixmxgMMOUhmie1H4C1POColN4zcBu3
 iS+VPx//vmujTIAKIMmtpDSKEa41vuF0v+knkDQpfw0SHWixbh8ojd3glNdnpZ3Oxshw6VXdTyL
 /Nxu9HIvgk4/tvPwx4V7lA3DoX9aYF23tD+OhTXOBNy/H/otRwwO3TS0iSkIvY+T7anzCqp2OyU
 eOZWf0cUTSO3j/Dg8y8ckSDxswtSrruhePxFTNvovdow8WEwfB1d9pUDueVtupIcddtZGx1t7tI
 nvCxJOhck+Q07g8hdjyG3
X-Google-Smtp-Source: AGHT+IFaHk7Phcd5MxUf+OJPN6cBrAx/DbxxwuqbTWFFOqDodTjvlgi6WuvSC2MhfkeI6wagUbtmZw==
X-Received: by 2002:a05:6000:2912:b0:3a5:2e9c:edb with SMTP id
 ffacd0b85a97d-3b497038f72mr590645f8f.47.1751611586281; 
 Thu, 03 Jul 2025 23:46:26 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b472767a20sm1606491f8f.86.2025.07.03.23.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:25 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Fri,  4 Jul 2025 08:46:24 +0200
Message-ID: <20250704064624.4063513-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250612102655.1268053-1-francois.perrad@gadz.org>
References: <20250612102655.1268053-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611586; x=1752216386; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMGC4s3WojLDP1lSrYyTzG65Z2ywl5X98Rr/0v1YooA=;
 b=Xtq0N4Ci55xHQY8wq2X310+tOTyECHlBRe3DgxjWqg66xqEKIBWEOLt6YKyCuAzcSp
 jkDbr+b7Q3x4tTDuu4g4fVvzdxmsPZ04rcSyyDtMbwDTNGaQ189ofybG1GLDLQRt9BQb
 BD3ekkEfGFXnlMElN5pkimT5cPg4R7jGi0JY+hpqn2RKZqtdK3EaLAwSu+Kah3ck+TEz
 yFYlc1HuVxOUvFt+3Yi3gFfvlULEDj3643z/DuPq8UaOHUiqcmovjwDZMbPjt0Qi66Jn
 IhMBfIcchG7juCE8BhVgNf6hA6oe3IAvN7kxGByGt4Cjmlsw/THaC7Y7smDg+P+QGUZu
 qGag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xtq0N4Ci
Subject: Re: [Buildroot] [PATCH] package/lua: bump to version 5.4.8
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
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x. Thanks

> ---
>  package/lua/5.4.7/lua.hash                                  | 5 -----
>  package/lua/{5.4.7 => 5.4.8}/0001-root-path.patch           | 0
>  package/lua/{5.4.7 => 5.4.8}/0002-shared-libs-for-lua.patch | 0
>  package/lua/{5.4.7 => 5.4.8}/0003-linenoise.patch           | 0
>  package/lua/5.4.8/lua.hash                                  | 5 +++++
>  package/lua/lua.mk                                          | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>  delete mode 100644 package/lua/5.4.7/lua.hash
>  rename package/lua/{5.4.7 => 5.4.8}/0001-root-path.patch (100%)
>  rename package/lua/{5.4.7 => 5.4.8}/0002-shared-libs-for-lua.patch (100%)
>  rename package/lua/{5.4.7 => 5.4.8}/0003-linenoise.patch (100%)
>  create mode 100644 package/lua/5.4.8/lua.hash
> 
> diff --git a/package/lua/5.4.7/lua.hash b/package/lua/5.4.7/lua.hash
> deleted file mode 100644
> index d67fdcf6c..000000000
> --- a/package/lua/5.4.7/lua.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# Hashes from: https://www.lua.org/ftp/
> -sha256  9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30  lua-5.4.7.tar.gz
> -
> -# Locally computed
> -sha256  33a975a766520bc54de2d71e45442e504effa0519e331e31ee3fc46eca4f98bd  doc/readme.html
> diff --git a/package/lua/5.4.7/0001-root-path.patch b/package/lua/5.4.8/0001-root-path.patch
> similarity index 100%
> rename from package/lua/5.4.7/0001-root-path.patch
> rename to package/lua/5.4.8/0001-root-path.patch
> diff --git a/package/lua/5.4.7/0002-shared-libs-for-lua.patch b/package/lua/5.4.8/0002-shared-libs-for-lua.patch
> similarity index 100%
> rename from package/lua/5.4.7/0002-shared-libs-for-lua.patch
> rename to package/lua/5.4.8/0002-shared-libs-for-lua.patch
> diff --git a/package/lua/5.4.7/0003-linenoise.patch b/package/lua/5.4.8/0003-linenoise.patch
> similarity index 100%
> rename from package/lua/5.4.7/0003-linenoise.patch
> rename to package/lua/5.4.8/0003-linenoise.patch
> diff --git a/package/lua/5.4.8/lua.hash b/package/lua/5.4.8/lua.hash
> new file mode 100644
> index 000000000..849451152
> --- /dev/null
> +++ b/package/lua/5.4.8/lua.hash
> @@ -0,0 +1,5 @@
> +# Hashes from: https://www.lua.org/ftp/
> +sha256  4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae  lua-5.4.8.tar.gz
> +
> +# Locally computed
> +sha256  3773a4900f3539c56aea9d6cd48d71c8751d495c4abc28472706bb9553d1493c  doc/readme.html
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 15772dbdf..455b7e58b 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  ifeq ($(BR2_PACKAGE_LUA_5_4),y)
> -LUA_VERSION = 5.4.7
> +LUA_VERSION = 5.4.8
>  else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
>  LUA_VERSION = 5.3.6
>  else
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
