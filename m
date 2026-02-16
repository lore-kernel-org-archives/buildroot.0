Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA91E63F3F
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 476DC60B50;
	Mon, 16 Feb 2026 09:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLDR2_lECJcl; Mon, 16 Feb 2026 09:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123C760AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771234540;
	bh=WidIrcyIG5gBEXgH3PS2vcWojw9qeS2cPmushdHx9ho=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WgZdnGEEQThV4P2lQAVEpEmdmj92qFCT/UUPjkZNLJVpOxRdOWtG7FX4ueZ6c/FF/
	 sIv+clvDSetjm5/qd6LgHEVuDz7VMuDFNrmag/HVaM88wigHhBY6rUQnyuryabbcN1
	 hK17npoCyeYLx1gncZIbtRP4l6H1/u/EksryfbOsM2Ii54fS6+jCwCQ3Pyygq+HCw7
	 PU0zmlyiZ7zRd5jsf9qsDGDP1ErYgQwXsKKnM0jhL8ntdSh1NcaDNsvW51W5GONTxE
	 krqsNHGzT6VT5CXVZgt4zLNlSgLqexgfM8/BjFZQT/xdmvCaaCAPricG0sK2tXmM9j
	 6aiwJQe5QViJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 123C760AAA;
	Mon, 16 Feb 2026 09:35:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7034270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94E6940368
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4q9MnVB-3IVR for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:35:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=81.169.146.216;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32652402D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32652402D7
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32652402D7
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:35:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771234174; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=T1iaoB9SXsScrTi0cAGBc9LlfO/YFZ184aY0VYe3yrS9JXybheYeUBwqbfGyEF2SRL
 74YxCvFDyTGtmA6HkqakRyDzcVl1FckxHL4jpaS9Dzo9yTAKjl9KrZgRNP55D3l2mKOl
 5fgoEoCY62ml0S78prmHxO9z7D0j2ZTN964MhNgFh4M9TjUVChgehQ+SGWyMr8s+cYr2
 N3noEDxxi2NyCIRWroBZgCMtt5MXOat/2a168ic2gnEpK4tq9E9m2BJIUTyh7rtDQEmr
 QSobhJg2lZTy2Hhf7igsbdvVfcOxwoioBZXe0dIa+LVKEWp6VbDJGJaH1JKzx/7R1pNO
 7E+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771234174;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:From:Cc:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=uf4qssLhDOFbV5gsrRUwExoy8J9FdUPusAt3429KPcE=;
 b=VcufGAxdI706x0UK8I942UmEI1G8k3P8Dcp/0VkV2nWy035EMLFUvQzJWixL6BmP6x
 Am2Daqu8otibIifnh9hEx6Dac6h0DmBAXT+1SKN8Ra4JL5wXPRG5MN2/MHKNt1dJqKM9
 DrRQary675gHWpS3s1OZojcYr+VLXa9PAlcD3C+i7m0MdjcX1SS6rsAtdsJY/oh6eFRC
 6Zmymu3Z8naDOh5mU3xbyvNJwA+b9yj9K9YOtRKp4ZLcDmXqrG/DVUV1AeQV+VAqeLzD
 RENhm9eQGv+jguxQ/4tOXbg9zCI1EIGjEdRQ/JdZEeUk+/tQuqx5Jg4N3c8MEwbcNWu/
 CUvQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk1Z5IDmIqDY7x03Os9cBzfU52YYD2ZPsb9igWpNm1E2iaIrdv8="
Received: from [IPV6:2a01:cb15:80df:da00:dff4:a1a9:ca0c:d68c]
 by smtp.strato.de (RZmta 55.0.1 AUTH) with ESMTPSA id J939aa21G9TYIug
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 16 Feb 2026 10:29:34 +0100 (CET)
Message-ID: <85c4070c-551a-4586-80b1-0f43b454ec69@outer-limits.org>
Date: Mon, 16 Feb 2026 10:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: bernd@kuhls.net
References: <20260122161116.885373-1-julian@outer-limits.org>
Content-Language: en-US
Cc: buildroot@buildroot.org, julian@outer-limits.org
In-Reply-To: <20260122161116.885373-1-julian@outer-limits.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1771234174; 
 s=strato-dkim-0002; d=outer-limits.org;
 h=In-Reply-To:From:Cc:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=uf4qssLhDOFbV5gsrRUwExoy8J9FdUPusAt3429KPcE=;
 b=Ru6ZxyZt9TyJeLm73sG9G34D6m8mY6A9Ssjc0CU05DNuTpbTkpS3DhPIOPWoQUbtjV
 Ygcwyg1iEhSykO+CjO6ggT6ePt97h7xnScqGXuCDYJvWw3IkQrufvq4y6QuJcAs5Atrq
 jq1NWoiCoWNvGIoY2Qo5Oa//gRUCL2ss9Irh71bkr0WwMseOoo6KmBMZJIpYRTqsb0R/
 GmnKXYz9vj8JuIE7T4g6wDuv85QcwJ4celpGS7yw2w2Qvm2X7pY7fO9fsFEU/7vT3EUt
 Dnd7w+4up9VfefFGL1kYM0b0gZq7lJ2fTqVpxuwqUJcxbGftLU+CGhNUduE00HgIxmrn
 zx6Q==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1771234174; 
 s=strato-dkim-0003; d=outer-limits.org;
 h=In-Reply-To:From:Cc:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=uf4qssLhDOFbV5gsrRUwExoy8J9FdUPusAt3429KPcE=;
 b=tx2p92RZHtYjar0BwU0CLRCaSlKGdUEUnLL1vomjL3ksssaj/L4A9O59XW4rp/94BY
 MezMavv/XWnW4NH7ItBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=outer-limits.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=outer-limits.org
 header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002
 header.b=Ru6ZxyZt; 
 dkim=pass header.d=outer-limits.org header.i=@outer-limits.org
 header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=tx2p92RZ
Subject: Re: [Buildroot] [PATCH] package/php: Add parth to ca-cert
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
From: Julian Vetter via buildroot <buildroot@buildroot.org>
Reply-To: Julian Vetter <julian@outer-limits.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 1/22/26 5:11 PM, Julian Vetter via buildroot wrote:
> If BR2_PACKAGE_CA_CERTIFICATES is present, add the ca-certificates.crt
> to the php.ini, to not get SSL errors when using PHP.
> 
> Signed-off-by: Julian Vetter <julian@outer-limits.org>
> ---
>   package/php/php.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 2c91ef7b63..3c79ae4589 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -362,6 +362,14 @@ endef
>   
>   PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
>   
> +ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
> +define PHP_CERTIFICATES_FIXUP
> +$(SED) 's%;openssl.cafile=%openssl.cafile=/etc/ssl/certs/ca-certificates.crt%' \
> +		$(TARGET_DIR)/etc/php.ini
> +endef
> +PHP_POST_INSTALL_TARGET_HOOKS += PHP_CERTIFICATES_FIXUP
> +endif
> +
>   PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(PHP_CXXFLAGS)"
>   
>   HOST_PHP_CONF_OPTS = \

Hello,
I might have forgotten to add you Bernd. I think I have just sent it to 
the mailinglist.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
