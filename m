Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF87EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B94861773;
	Fri, 13 Feb 2026 19:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzsDjs1xULhL; Fri, 13 Feb 2026 19:40:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24BD06177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011624;
	bh=5jAJKKJY3If55b1F2o7Xqsg1rTRCfAGl347g4jdcKCc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bKYjnuLMeUQbEJzFvB6SGveiCl+cxxQoFkflL+L7CbRG6M8s/6/kaOHZugH4ZmVBn
	 LXzpdPklm7jo/PYOqQBzdBjcslItEgRoL+mzQIBfZ9Rb/dLE/ekxJ4ZUjQyE6Hu8Mp
	 Wtv/36CbCeiXyDM52WxbkmC61Msw95vpfF6F0pwUxO842vsIFsCi5SrnOyUl5l/Ig8
	 hGfLxhezkBjZrR+R9LstQY9F+soFeth9FGhk4ZtkgnEsCAJH4zKacOhzHE65x/RtY0
	 KImTxE6yUUVLJSN1Vi1OqtGomKhUH8w9wRLc97D2U/vvTZuzY1fO5TnBaq7XSyXgQp
	 DlA/0+bwhccmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24BD06177A;
	Fri, 13 Feb 2026 19:40:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1203A69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7753A412F2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgZbJ3wHbVCS for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 736DF412A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 736DF412A6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 736DF412A6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43622089851so1085464f8f.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011468; x=1771616268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0ZHJYU2eD3Da8ynqWBIoLdReamMNh7R8C5f7gg3MDUc=;
 b=IqkrNuXTKk8ffhILpwTKPHux7Q3DhH82+A4bHc7KL2ptq7Wk1YKvzTH6YXPGJ0CAM+
 R8G9LxdQI1X9+7wHNot+Ss+4YJjENGHaUsZBtVBZi93e/BpSPVnKXvHfejnzp+LYA70y
 HM01bIA90Q1NaLnxRNUAbb5r49XNXzlJDqzxsNa9ss7ItKARIIEFqykSTdmdGF35MU6E
 Z0Mb89Kid+7bPVdt5flIKNstbn9QEUl4nODU0SnXdL8ujWmlr7/i4zggpSj81cFbgLXa
 49iet7vqkvxkSej/LW7WKJ0kU+/qNE6hvAlOstZgvpu0DNQwc/Y39HlBdeWwcs6uMgBL
 mKgw==
X-Gm-Message-State: AOJu0YyXOyg78UFJfDWnstv5dh0Jcdy+pAwtscWOoXLr3hLDnqvqXt2H
 2V31gysxwCQ/jW9WhBctbgGYi74uh0m+jthQcVVdRvI4yQmBW2nHpZuqYSFzyV9uvXZAClwJNtR
 ziYT9
X-Gm-Gg: AZuq6aL+bANs2SVksfgIvvic4hizRNIuxUQKgh9daAG/yQQRabT1cW02ctmauuwi5YZ
 gj6qrmC0GO9XR4x63M/kgiKGnP2cWEpS83s4LVAjNJ6/Pcrl7cl/C2WZJfYL1y95/OtxWH58/Yy
 rCvf8thaJp0W9ga0T/4I9bq+H1gIK82nsxUuCy+u3s2SLaLelsuKWIF2LdjztvucKnwhLSeUD/W
 GAE4xwoJRMKj3d0frpx8MOXFmaunThXzSROcIjoUPngRsoEssBcchtXCR+qS9PhBU65AUn1JUNR
 L8D+tk58sh0embD+JQcNjdzAb1z1xRjknYWbIWrDMf4KS34wwJdwlGcPyJSsyA82FYVhHoLF5vV
 /dM68+7Ho/w142Ngdtv0OMS7FAs28AYP3EQgSCH0L2e33DUD8VWJM45ZawluRLjIVJV568jqYgO
 r2pfKR/150EzNdirI=
X-Received: by 2002:a5d:5f55:0:b0:435:dbc4:3af0 with SMTP id
 ffacd0b85a97d-437978cdb95mr5643766f8f.14.1771011468347; 
 Fri, 13 Feb 2026 11:37:48 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a5f0sm7415206f8f.11.2026.02.13.11.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:48 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:47 +0100
Message-ID: <20260213193747.40675-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-5-thomas.perale@mind.be>
References: <20260120082405.46683-5-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011468; x=1771616268; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ZHJYU2eD3Da8ynqWBIoLdReamMNh7R8C5f7gg3MDUc=;
 b=TXDK8noSAUhgdoBcM/S6PR5I7zKlyYnmkMtWs1rzQqVfORocnGo0zy7YndllaQ/vp4
 vRebgbFvlFWRPt6arB8LfTZhAiiUWvRe0uczj1UmmdGWXsH6xxZUAeliPsJxu30sMEsI
 vNorUB6BIPuax3CL/qVpIxLtuOjU0mmILLuIipdYR/LsZYrUxPJTPaoEOEBYlm2n/WsW
 hbDkERTSrtSWokizmJb6GgWyq9CbLfuWX9qiIpoLr9MrdOYW1pSQ6PdgaDDiHAS22oZR
 fgwxtOBTh2gcGGGTqDLEUvzGqHVhzDcbz0uCukJoAsyO98qgrmp9D0NP27VmtSaW+IQA
 hLxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TXDK8noS
Subject: Re: [Buildroot] [PATCH 5/6] package/igmpproxy: add CPE
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
> The CPE `pali:igmpproxy` is a valid CPE for the package igmpproxy.
> 
> See the latest CVE: CVE-2025-50681 [1] that reference the upstream
> repository.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-50681
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/igmpproxy/igmpproxy.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/igmpproxy/igmpproxy.mk b/package/igmpproxy/igmpproxy.mk
> index 357c9087e0..f2c32939ff 100644
> --- a/package/igmpproxy/igmpproxy.mk
> +++ b/package/igmpproxy/igmpproxy.mk
> @@ -11,4 +11,6 @@ IGMPPROXY_AUTORECONF = YES
>  IGMPPROXY_LICENSE = GPL-2.0+, BSD-3-Clause (mrouted)
>  IGMPPROXY_LICENSE_FILES = COPYING GPL.txt Stanford.txt
>  
> +IGMPPROXY_CPE_ID_VENDOR = pali
> +
>  $(eval $(autotools-package))
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
