Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5C7CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E61A40759;
	Sat, 10 Oct 2026 16:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojrXSUhcwdSO; Sat, 10 Oct 2026 16:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1C4554075C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791649230;
	b=RjCdZRicpN3R8arvhRvQg/6elLYHFG98a5xbUP5Lu0XWtNCLI8tFLLxIDi3LkayqSTxT
	 SNE9HSCiGYrN4U55O4HVQtjfnCfT64Na/X4Rb3LQGUNVA/Ha4zD6zi4waoYcB/g7oJRlA
	 YWo/4f64VNUEQN6YybRrs+iD0Z/hn0d5zfA+oNPSiIh2cdiCLx6j8Y0rD5JlBU1kdN5NC
	 PWI+2sGe2GXmY1jeBwHbXY3YpoobIgbwt4Z3nsh6P5rqDkiQ64Z2+ykTH04HuVJQwU4Wn
	 6vIxnkj+/2But5Bwd3c9Hyp50HE9oKfWfGi40+1CJou9BUa5Fr1zKFmS2h5g3vk7kvw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791649230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ow0vgEaC/MTlsaaH0+wzVU0gLVyx8Rq5YbjgHScUBzo=;
	b=LutxXGN+ELLQji42i4zs4mrO5kiNdqKtaAJoFAKHiPQ0yXkXQLk+OQVJyshY1eixnRpY
	 xrvoJamhFkSpSDakaXzyNMQO9ZQ5/8lt8Euz1ROUKvs9pZLy3/7VyTxqjLdB3Ged6ZaFI
	 T9Ffl7WxJaUteQpPsK5A7ok0neBcNeDY+A4YDRkH/lJSWYztEb31gK4+V3PRTHXDLPsOC
	 3mrF7Eg4gwQ6ygYAuLruOCSWn2oOvVY59miVphl7rkNjcjhSTASr5fuzTRHK5p9VmdvsZ
	 roCrVjVJMhNvzK1AmMnb8iN1OQ4S5k/RtqR8BVriV5/2rcAj/8jEpi2OmvFMD7B90Ig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791649230;
	bh=Ow0vgEaC/MTlsaaH0+wzVU0gLVyx8Rq5YbjgHScUBzo=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vw35I/uiijnrnPUtLupPY37+PNXRK5fkGHu2PcSMFelLn/IjlStwXoRmE9H+mdcNn
	 QcISnTe0Z9PI3Xv6KPSPpoeDviUVnrvbuSoBa/iyfNaqlZX/O5Pev1QvXe+TpHl/vc
	 fV4jrNWueHMdQ+/uP7AD3S0H7X/QInogAXDe1KrF0a3VXQQHnrE4m5yNdjmaiXjBjE
	 mZhu8SqNT/zICpSZIdymhQvRodfoelCupxuTRmogTztU/ZMbWFhXtcByBAPQPr3MHx
	 gK3PeDRTCQYBKE5s3qSVwaK2Lurs8Gshq8w1Adf8O3dHlG1DiM+IW2mZFPJ/vY5qa7
	 zSHYVzee2OrSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C4554075C;
	Sat, 10 Oct 2026 16:20:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F640105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C6CE60638
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HD7sBEFr9-8 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:20:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 652E060632
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791649228;
 b=aMSFCi1PWJnhw0GY+qTJRl+SHZD+kiAF93MI11inU13VazTck77U41gT8BwpeHIuz8AN
 CNk38sVrFu7ZSCquB5fW3wsxJXndSoz0PxlcNAMq8C3D8u0RIkjvNfuywV1u/zJMVMn43
 DWeAh7brF5mvkrbTRpDZMCZfocvUBbnTLRKtVc1iq2EM1SwCLJtbMsMT6SV6zvF4hszxh
 wBtNEuAIjxhKF0HGB7NWcDPgEH++t88n8Qr1/qyEtDCQSbmNZ6KLYBnAyQnT7fPZ117QO
 9Rr1JbZudd/98ZOcOZUD1NbqNWJh12/mWuEYvFXEW6EVAPoooOPeE1GjlnKfCgo209Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791649228;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=dU5AXLPe4AP9ni9Cur+i8FZy9n90/9ug5MkW5ZhGgMg=;
 b=ZddFgmcZEr4RUaOX/gOPXook9di6JeyHRtHn8oO+VTGB0Na/rnApkaXsn2yAJIXQZmNH
 78Wocg5250vCa24vKrhpYgzVEi3j+6tVknmNiRrhD/At9Cxg4eF0Hw363n9RQjukpW5qH
 oCWQh3ZJiBrHXD7jbCzEBYTDil8v3d4PMB/zFeW+2+w+UWSAla2fNEPY/3wrqhsPJWWn+
 0CTOOPplcHrLMCe2FkO7dnZXBV2b/A1lpPI8l5nDzp8EMOLBhwO0JzYcPMSnj/qUu00YP
 d9zfGE0iKuBtloOgmD9Yj8wWIl5c+6Cvp0GibTqvnOlScAo3vgsrjjtfhyLDzETMoiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b="IcSy/Ujg"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=IcSy/Ujg
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 652E060632
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:20:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=IcSy/UjgIa5jBb3YmB5Oykj4lCDFoB+rOgtpv4QhhheVU5n++P2wnXGP20WuGdHpojEizGIFUFfLgA6LrOqszF7glMzjp5Z5zQJoXr40zAjdD8wc8cBAIqW4S/77cqKLqpaeeYHcnLBMJbOoN9zE6PRQOg7akblk+W344soI4RNvhQMKOXNSb4JwWs24ysTfp3hBFeTjQ+nuG3Haa0gWas52AujWwhMqpQczjDRRQ0j6vH7Z1ood+/IBV31P+nplTYkOsZMtrApam26AtlcDVwTPnoUpIvGNSYdt1dk9KEqRn0ZzEf465xlXdR3F8sc8lI+74bMGzco6pfKY+U1PIQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=+LYrT8zMahvsFuxSub9QC4/aZVBpDh2d51pu+pOlNqI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1777414184; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 16:20:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFZo4-00000001usI-2KyW;
 Sat, 10 Oct 2026 18:20:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261006162106.3439373-68-bernd@kuhls.net> (Bernd Kuhls's
 message of "Tue, 6 Oct 2026 18:20:48 +0200")
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-68-bernd@kuhls.net>
Date: Sat, 10 Oct 2026 18:20:20 +0200
Message-ID: <87jynpfry3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 67/84] package/libplatform: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > The last package depending on libplatform, libcec, removed its
 > dependency:
 > https://github.com/Pulse-Eight/libcec/commit/332bca975a71d8e876b66dc6a7fca938b49b1831

 > The maintainer of both libcec and libplatform has put libplatform into
 > maintenance mode: "Don't use this library in new projects."

 > https://github.com/Pulse-Eight/platform/commit/97332651ddfb3df9240dfd4227ac35484f8c4341

 > so we can safely remove the package from buildroot.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 >  Config.in.legacy                     |  7 +++++++
 >  DEVELOPERS                           |  1 -
 >  package/Config.in                    |  1 -
 >  package/libplatform/Config.in        |  7 -------
 >  package/libplatform/libplatform.hash |  3 ---
 >  package/libplatform/libplatform.mk   | 13 -------------
 >  6 files changed, 7 insertions(+), 25 deletions(-)
 >  delete mode 100644 package/libplatform/Config.in
 >  delete mode 100644 package/libplatform/libplatform.hash
 >  delete mode 100644 package/libplatform/libplatform.mk

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 16d530e273..552cc1a890 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -286,6 +286,13 @@ config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
 
 >  comment "Legacy options removed in 2026.08"
 
 > +config BR2_PACKAGE_LIBPLATFORM

Moved under the 2026.11 heading and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
