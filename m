Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3790BCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0306860A35;
	Sat, 10 Oct 2026 09:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDjZEXjuBlux; Sat, 10 Oct 2026 09:22:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 245A260AC3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624170;
	b=Q73A6b/zan7S8aDemiup+ai/ppw/HdurrooTKZ43+/uU4MLXGTiVAWEDNRZLf3XX5d1p
	 zm9RUIUcaZwVizXlgFQxOUJmhdDHLII97fx7UW3uLdp6qG3o9vQTxzvnYjI0xKvjge7Nz
	 A4kZMI5CBqeE9TSjQ0pdtz0QR8k+B1+lcnmsK0CXOGLDOajuhsyCSe4aqNFjWkZs9XIOs
	 3alEnyrkE9A5jILhsJ9QzyprGD109HFUbq0SOqr3DRrCEbSVb2yVrkIUYv5sv/uVVQzfG
	 KnHQEQWTE+rnJwAOwo39Tr/vvcvMQf1MO53bdJNfg3N+N5qG0Rr+SjUFJXADPZt45Aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=la1sWgwZ9SKJmG2D9QxuotawCoVNzqvYQoLp0UQRRZc=;
	b=eYXx2puHnlrRYbUYGpI42RP6BYoEjOfB2nd9shX0ee6Qc2vEmuRRsJJcpGrPJmOiz5lr
	 nn/gmDOSybXZnqZBNmKIFfgf9u+ir7XkL1SJ2imE8MA3yDTuLt2OTGKbLRAM5nAsVZ4Y+
	 zZEnyLDmksmGoHEZBa+86GUXnx6ma+jiXfSCCdl9rDTLV17DL1Iiic2u00zaD/8F7OEyK
	 sI1/KaqEz+t8t8NCTAOMiiz6Yqe9ajNh3U2clS9MOakDyzJIGj+mlQ4u04yXYvv0vusHV
	 e9Sq3D/qWTSaDMfSohjtjVlJesJoFezEkqBRZndFSu8AQxBL9XNsse4QoXRsZBnjeuA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624170;
	bh=la1sWgwZ9SKJmG2D9QxuotawCoVNzqvYQoLp0UQRRZc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hWyt+mFuxpUcsgi2s8tS4SZW39ooBApCx42k+C+dcYdFopDpK8qbD00khCPNYrLnD
	 fig/YXMfb/8kiRbJpizE/EdSUL5kyUzAmKRKkEwJrF0mslVBLEF2p0WnTNY2oAHfXw
	 2RKr5ITc3V6MZ9bQ6P2uY81whNDLhsoZfH1KjbpjabeI2+HFX8VJDHQxkjRkmlWZQd
	 Ks+e4F0VRPolp4idqUATWlPrIvdTeMmUo3pywnLjtmGvR3hDbkfc46pzlfBEdQH3Sr
	 za9fZufz7fHgbcRb9yNak0CbbSlH9B28aPh9QlTmAyL2E5a5MLrOphqjMbQk49IXlH
	 3qo5hHxDcMMbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 245A260AC3;
	Sat, 10 Oct 2026 09:22:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74BA8DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 569FD8115F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4Ju0la-WJUq for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 236FB81008
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624163;
 b=td9czVrMN0cLBY3MSx2YSEVqIefo5ICcHMRdrUbUmHnLc6p7Njc5aWebN1DuKxqCKVXE
 x+fxn6FfT0RdPdisfXKyKXxyRBS30IdDP3/stWo0ESSJnkKpq1xLIXopzm/nt3K0kDfuB
 J8lLzUJSQxdP27apT9xE64GsmBW4Y4CTgjFV30bhy8YEc2tJHLRcIqD99NaATYc4UKUW8
 pX2kYw0XtIxaYaJYOYLAonHmq/8u+WM0t+OmpVrHJ8iojHRR6tOuTP44bhhGX1RnO2m7q
 24iJwwBZz+2ONJqbb2SAvo68t+qhV0WGfcWIrJUiv8ss3Bo0bqJ38PuuPPvtjNKdaRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624163;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=YWt2xOVcaTPFr9fqqEcK925bpA93UI8LabGDP0flM1s=;
 b=bhceCQPbygZxVa5k4tiTeDeOpH+Eg+I/m+7gl4j9kBMs03Johk2bCyRGlQLJDUH4Qfto
 fO+UVFCJlxXcz1BdFINZ/VgHUlyMN25ak9UVNJTJx8YFeoPIr09hHdYo2vgazNGBbLlIS
 cBoy4E/YGh8tvjQyX+xDk6U2bpSI2ERsrT2FP4uIVH0BBqt9UKfAIMTXADpTfaIy3RUDW
 qfDIonYREOH1FIsJZMTXo2eBGnDVVYk6si4iryJwuLCWhvHwdw32E4CB1lYiFc3PgFq9n
 XfgqjwPpXiXzVWS7PUG0Yc5/AOKZUoCm8uEDgjdix9llhSUR7XmulBJf1oU3XYiiRPw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="bl9/Hjmc"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 236FB81008
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49fbb2acc90so1065845e9.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624161; x=1792228961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YWt2xOVcaTPFr9fqqEcK925bpA93UI8LabGDP0flM1s=;
 b=b965Dtx3D7DHcQYy816rIjp1eEzNvmirJD6HogpMMrnrJ4jfKftDeHC5PyDSK2FU1A
 vwKN8fMXEc3Gajng+ePlR9JNwKhpi5O+z2gTzt595aRB7S9uqPVNYLlS9kU8oeCbn1ob
 b1XfL8IbXqLj4C0Cgeidl6x3PvALWgmUtJ1ZJ6LwlL2agDA8dksI+M4HtMIBhU4vDZwr
 MfBfOykvNPYd7KrBhW+d6FQtn2MLn42TOl7s9p8GwV1dlEcgKjegMOhTmeu0SDVC87LI
 SLMT+224p62sTxaVbW41Fm7LPnGh7arR5uRDQIexjzZNP7mt54ywpffQYoDzab7hRQt3
 +quw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxWtApJNtEJrAg/UeIAVsOpY9qSLQpmWOX2mZIAGW+GsHyC8FGzcV5DcAf7flwDhPo+tlHRg+oVcaE=@buildroot.org
X-Gm-Message-State: AFq9FYJmZV26iIGF0f/92MeUg9rP2l7mD3kFRs+XfUH9uBCWmhZ8ukHJ
 cdmAe/wo3uVlVLGXFTWzfEY2kBZRdVTrdp/e5FmLmV6lR9W2b882uvIZDtes25NAnlCPLtkTeFx
 UN7iz4PA=
X-Gm-Gg: AYBFou0OvGLKP9ptWwZdys0PzqpANZkXPvEIayYi7NaDdncQ/ej6z3kM0G/2hWgXr2a
 BJifqxADuK9xCsCL+Da4DCiX7hO8suBuk9CYOMJxDEa2Y6DJiak5qLsh7Tupum4dLSlxNHbZ7p0
 mJ7BHTYQryqFlGlACBvYBMxy2nRp5M7+MM68qnk6gNN7zJP1IJPUI1nDLU+Om5I0iFR9ZxYsq9F
 Y3gD2hzCVAwJfyTAUMwE6dtvo77Xqzst89PqTXJZI0uoDexxJkmgfjJm0iaRJrHXnwwsTkvW/o0
 NBthfUlBKlbfr9YtwJrNkvxhj/vufWe4bsEKnfukrctX0VWKEfkninOJ0I7EDOhM1cmZeWQu7Ws
 G8wN63DegNbkaRyZ+L7ANCG72LBFH9Kth5UaQgeooYCX4Yg5sYpHj+6Ls6Wt+C3Z650yk6j7ypj
 ePz/wh78gdDFAJKmPpQ9qShuKylk4C45Jzgh1Fsh6+lusv36/pEzVncOqzznoEVpYMcjs9ySLlc
 JtrNhOLsJrr/43lpMRtIPy2w0aKLGjB9CQIsRf+BHl10t7ftEZl8szH
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id
 5b1f17b1804b1-4a18e4b6241mr96931225e9.16.1791624160832; 
 Sat, 10 Oct 2026 02:22:40 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c198134sm119198585e9.15.2026.10.10.02.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:40 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:39 +0200
Message-ID: <20261010092239.138739-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005100731.201684-1-titouan.christophe@mind.be>
References: <20261005100731.201684-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python3: security
 bump to v3.12.15
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
> See the release notes:
> https://www.python.org/downloads/release/python-31215/
> 
> This fixes a handful of vulnerabilities:
> - CVE-2026-19445 gh-156293 Use-after-free of a server-side SSLContext
>   when sni_callback switches contexts
> 
> - CVE-2026-19553 gh-156793 SSLContext.wrap_bio() missing validation of
>   server_hostname parameter
> 
> - CVE-2026-82049 gh-157190 tarfile extraction filters allow file modification
>   and content disclosure via hard link to symlink
> 
> - CVE-2026-15310 gh-156002 Memory exhaustion in zipfile in
>   bzip2/LZMA/Zstandard decompression
> 
> - CVE-2026-19672 gh-155999 tarfile extraction filter bypass allows creation
>   of directories outside the destination
> 
> - CVE-2026-15806 gh-155694 urllib.request.HTTPPasswordMgr credentials for
>   one URL scheme sent over another scheme
> 
> - CVE-2026-17084 gh-155292 StringPrep algorithm considered Unicode codepoint
>   attributes outside Unicode 3.2.0
> 
> - gh-158446 Reject float format precision near INT_MAX
> 
> - gh-157953 Update bundled Expat to 2.8.5
> 
> - CVE-2026-87910 gh-157265 tarfile hardlink fallback ignores custom
>   extraction filter rejection via None
> 
> (alternative to commit 6e0a068475062968db52c102ec2b7185f8a90d1b)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.08.x. Thanks

> ---
>  package/python3/python3.hash | 4 ++--
>  package/python3/python3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index cf4b6b8667..7949607fb7 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,3 +1,3 @@
> -# From https://www.python.org/downloads/release/python-31214/
> -sha256  5c8462af5790baf43a321a1559dbe0db06d1be4300fb85fb53c40060668e548a  Python-3.12.14.tar.xz
> +# From https://www.python.org/downloads/release/python-31215/
> +sha256  c2c4321961fab0fb999d66e0cecf521c2ab3994c7992873ea99e306c1094fd5a  Python-3.12.15.tar.xz
>  sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 6266c8220a..a842dab2a9 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PYTHON3_VERSION_MAJOR = 3.12
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).14
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).15
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>  PYTHON3_LICENSE = Python-2.0, others
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
