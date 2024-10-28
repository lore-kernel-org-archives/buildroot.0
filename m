Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E3BD5B144
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 550F381858;
	Mon, 28 Oct 2024 20:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFsPiTFL91B7; Mon, 28 Oct 2024 20:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 413A68188B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413A68188B;
	Mon, 28 Oct 2024 20:24:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FB13112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DC53408F2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VD0qk4TOcRxl for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5430408C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5430408C9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5430408C9
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:24:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7700960003;
 Mon, 28 Oct 2024 20:24:33 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:24:32 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241028212432.133b6431@windsurf>
In-Reply-To: <20241028192828.12093-1-ju.o@free.fr>
References: <20241028192828.12093-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730147074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WOj0Rz2s53yxXd70KfUrtiJ681UIkvGSkhkFcdTc6g=;
 b=FvthzotzLymaa8rb9SIFpp2Oyp9ZGqc3h6Vn6wR8Dsgv3C8oOwuI6+JE7a+xYjtYRd7899
 jngy2RHD80TRr0wyI/uwbm+0sv8MwSyu/bR+6rwgcloyFW/lIIUJ/li1yedOlKfMA0hTy5
 AtPbMvqUb7/SkubrDRtcjj1SnsKv4JF7HSnJU2ASO65NwzyIli/vXdxmVPvRyZ9x+w29Pz
 h20kaxsTcy7CDeLi89FstVvd78Nrtll1/C3Yj336I5G+pnxYxohUdPq9T6UMhOU4rqz5E5
 h9aMhegeI8yncl0bzUIZeOjoekZGGT+lyfNn+rjZ12WmSo+0W0wzRzoxc7mkmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fvthzotz
Subject: Re: [Buildroot] [PATCH 1/1] package/oath-toolkit: libpskc needs
 host-libxml2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Oct 2024 20:28:28 +0100
Julien Olivain <ju.o@free.fr> wrote:

> When compiling oath-toolkit with PSKC support, with:
> BR2_PACKAGE_OATH_TOOLKIT=y
> BR2_PACKAGE_OATH_TOOLKIT_PSKC=y
> 
> Build is failing on hosts without libxml2, with output:
> 
>     make[5]: Entering directory '/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas'
>     create -noout \
> 	    --add "system" "urn:ietf:params:xml:ns:keyprov:pskc" \
> 		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/pskc-schema.xsd" \
> 	    --add "system" "http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd" \
> 		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/xmldsig-core-schema.xsd" \
> 	    --add "system" "http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd" \
> 		    "/buildroot/instance-0/output-1/build/oath-toolkit-2.6.12/libpskc/schemas/xenc-schema.xsd" \
> 	    tmp
>     /bin/sh: line 1: create: command not found
>     make[5]: [Makefile:1267: catalog-pskc.xml] Error 127 (ignored)
> 
> The build needs the "xmlcatalog" command, provided the host-libxml2
> package. The previous error log does not show the "xmlcatalog" because
> it is not found by autoconf, then substituted by an empty string (we
> only see its arguments).
> 
> This commit fixes the issue by adding this missing dependency.
> 
> Fixes:
> https://autobuild.buildroot.org/results/d22b8d9ba1f8a948125b4f9713720d070e208799/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/oath-toolkit/oath-toolkit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
