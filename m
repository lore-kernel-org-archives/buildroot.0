Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C456C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A4AF411D5;
	Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaK79xEHvovE; Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76D1E411C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485768;
	bh=aGy0wkYko8kP+NO743SNfOYJydig7AA6+WXUK7Ntwmo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hfMriPRJYsupDY65nCd74nPPoRTAR07qI9cZ7L4oMqG8PLZ3yR6NfqbzvUVt/wqC6
	 NLddG2z5a1FepDZrXTMK5f6yHlpkPP8it2/10I2Lso/VAl6DLuRUqAeqyqp4tndAZ6
	 9qdL+eantgXKUyxdXAIZnGfIHswEV5iEJ5nqJjIoSnHZc41ek2nh3loI8xOPINhgxt
	 UXKkh5SM1Pm8nw3NyCnafzhA46fGlxIXmcv93aARM0vBwpIszb8Jfzei9sSccojrop
	 0UNs1l2hOW/Y0PvWymhUZXr9UswY9aZ0i/HyOm3B5WZ2NiAScvJyUp5AB/pUP0gj3Z
	 xxXEejEONQzOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D1E411C7;
	Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CC3B3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82C6F6100B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Q8dn8fMglFX for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5735A60F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5735A60F34
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5735A60F34
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so15915415e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485760; x=1783090560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=csqVueBLHmpCb7fhTIh79tFD0N82pPj6Ob0HQBexWRk=;
 b=cxKVz/lD/dxnRnsNoVLspRmzmicitoi2USKP/F7qxyK14FYx8i4EwvVKt8iJQACgiS
 JXL/hJN18zQoSnxcLwGl7DP97up1PX3ZMOZ2RMv793vau3WmOCU/9WQCpdqY4NC07CXp
 SiXTMOVN6PY/hTY7RZ5MSZBshirWy0FwKbq6Kh9B5wiROQxjIS55YRSZIq5KQm6/PK1G
 rZnhUgoEf/4LpHowZg2HgvAiTbX2a4KA1qiclb1Cls6K13l2KSkvFb18oDWDNPeGC8sS
 1uMNFORBhKG1NUF3CKkeTNG3vWzmwghA1DjvPCwisrX5/3FchswVk0bkg7tx3UnwCzK4
 qw6w==
X-Forwarded-Encrypted: i=1;
 AFNElJ80KZurZNiLWD9yL0j8SU7QV7IX4muzeJfc2QMLILvS58bMX1tJ6GLPH0ibwrQ5j0ElyvoKtqLDEvk=@buildroot.org
X-Gm-Message-State: AOJu0Yx+m/LIJfLtZc0tMwem6wtx4Z8onPyhd+BGnSy2qPHbQpmCq+nY
 0aSHYLTf/zeb7wakk5eCws4mximn71TkHn4x57Jlibz9d5oisLlLwHH8te9RJlvzmAH/h5UQ1zX
 DNF09
X-Gm-Gg: AfdE7cmz7ZCOmFqzWGIqiYhul7pe0j73LlDL0v/HNl+XhBeEWDsxXO8ZTfNu0WO5lMG
 WO7O4FKwOUtEHzAUfrP+A4rjEeg9rXKMT4Sx8zewRFSveK9I5cuCgVMvAsuzN3TGINqQZUKdskj
 LvSTu0QyrFtYAID8ndgk6OQefnhBiV4zUYrNrrcWTf3y/PSyIYZSPLztceYNN/vjoaXixP8FqMC
 MLB//47R9EmFMTVljugOHc7Mit8NrJNV8LhZXINpYDfdH+UuniOfafc/2A3IAwnbV7CavEA1FOG
 WRAzCYuic37pFOC+B7Ar/WQFlwXF8bMumdXxpd0RMJeUmEs6S8LAVlBUGqmt65Ddzjr76w2ChUq
 MXTTEi2skxaMdlX1MXedrpM0E/xtk4e2BikJdNKAzVK9oY325aoxbcnpEV+cNFI6dWAF+y4/y7Y
 R4S1xE
X-Received: by 2002:a05:600c:638e:b0:490:7df7:9190 with SMTP id
 5b1f17b1804b1-492663ea3d3mr84949245e9.8.1782485760236; 
 Fri, 26 Jun 2026 07:56:00 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c9f240c3dsm24277293f8f.35.2026.06.26.07.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:59 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:59 +0200
Message-ID: <20260626145559.343476-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606182032.3803327-5-fiona.klute@gmx.de>
References: <20260606182032.3803327-5-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485760; x=1783090560; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csqVueBLHmpCb7fhTIh79tFD0N82pPj6Ob0HQBexWRk=;
 b=XIHJEJdemBTUm1A/FhoAjNsRY9uW71eHo8/WKlu8+xDXAcYnLBA7An+UFUWKttkPac
 a7SN1fjnHT5LWjcV8rUdczJ8HP1AkPRD/s801dIQ84cyxsRlc//gN34pzPjGFYsBejEo
 /A9zvEcPPO6NPUDG0YFl97qefCsqoBKESTwdlq7nolmIDh8lbr/eMn6AGFtkERrFg00Z
 XvJ1FeSPtFcUTnQQ+BcDhSgcKXzzUcPqd8U3rYqa+XF3Ll15+6ZW8c2yr9KosBxaW4BJ
 eSMh0dkZM6HWbjOYVaSeLwIJuUqxqekHn1ci9Mcj09B5bqB7tGgxcSw5Wn38i9fslqfz
 hjJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XIHJEJde
Subject: Re: [Buildroot] [PATCH 4/4] package/openrc/sysv-rcs: fix shellcheck
 0.10 warnings
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
> * Explicitly set shell type. Shellcheck doesn't know OpenRC, but the
>   script as such is POSIX shell.
> * Override warnings not applicable in context.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/openrc/sysv-rcs | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/openrc/sysv-rcs b/package/openrc/sysv-rcs
> index 1564cbe603..1b24cc3e1a 100755
> --- a/package/openrc/sysv-rcs
> +++ b/package/openrc/sysv-rcs
> @@ -1,5 +1,7 @@
>  #!/sbin/openrc-run
> +# shellcheck shell=sh
>  
> +# shellcheck disable=SC2034 # definition for OpenRC
>  description="start or stop sysv rc[S,K] scripts"
>  
>  depend() {
> @@ -17,6 +19,8 @@ start() {
>  }
>  
>  stop() {
> +    # we need to reverse the order here, sort -r would be no less fragile
> +    # shellcheck disable=SC2045
>      for i in $(ls -r /etc/init.d/S??*); do
>          # Ignore dangling symlinks (if any).
>          [ -e "$i" ] || continue
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
