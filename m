Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7293DCD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47D944180F;
	Thu, 18 Jun 2026 12:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XF7kHp7T2gK3; Thu, 18 Jun 2026 12:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6357A41813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787164;
	bh=KGdO8ViObMkbXeHXHXutd7Ax8bGIVJ0j6istI7U7CfQ=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ivUhkFS2Cvs+mt9zOAJkCy1+fyv3pwaaNmDYQYUkbtzwNB5kzk7f5O27S544ox3HD
	 e4UF5qQ361bNQf27IDGjXp6J+6msf4z0sMY5AiDl8gR4gB1GWOsUvJxp+D2aGC0tcG
	 PG+U1xTnpB3t7Ab7OgQ0OGEzqSk81l9gezCQL91w7Z6CDJTLx3eQMBVZqQlQZbIQn8
	 cRanrkfGfBK/W8odzb3kfvthYI5IAAFZ0u2kREmbRYF5J4wFy6qXy3UwWoVwWGgYCq
	 jdoj5D3GGJ6iSOzfCoE5bysbIgpPOLdgIZrabgCXQ82eO+s2iP0Zdwkq58y6F21qmQ
	 90mQjZ+XiYLTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6357A41813;
	Thu, 18 Jun 2026 12:52:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55EBF131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C9438417C
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_mhYQhC-CDo for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:52:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 317DF83C51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 317DF83C51
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 317DF83C51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:52:42 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A045831E0AFD; Thu, 18 Jun 2026 14:52:39 +0200 (CEST)
Date: Thu, 18 Jun 2026 14:52:39 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Perale <thomas.perale@mind.be>
Message-ID: <ajPqFz0Cv0yjCB1b@waldemar-brodkorb.de>
References: <ajOOhpts_SyBkW3C@waldemar-brodkorb.de>
 <20260618124934.134574-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260618124934.134574-1-thomas.perale@mind.be>
X-Operating-System: Linux 6.12.90+deb13.1-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1781787159; bh=YTNA2jroQ9EUBET4gcyl1CEpnPvbASvGhzKAbm/HisI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fWDTh1JjV1UICOi9PP7+qmv7sypzXQQLNr23fx1gJ+tkraUKjPfWnrQt6E8YcnOr5
 sWP/rGcZfOLdJYe+lfY31OdQyPh8vaIlNPuTU8RfZiVGv2MD9vL8GT0bAjndRbeg6b
 c92UDiWkFR4YAGqYd4Z/dQabjOto4o4WVW7sloTe5HzJMU8znQpSHY2ozYm/n8phzc
 8cYDmEysNtO0GYkmfGOp0XTN+Vo5Zkzjjim+n7Y60NLD/DtZUSz7ce1icOeCItMehF
 yRpR01XoYTFBdJ0W0vYmm3qmrsBhbGe9dHHJYvx7bXhfgHWBtqu3pxT0hYnRVpmms7
 Ui+qTsT/B602A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/openssl: security bump to
 3.5.7
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

oh, there was already a patch, I missed it.
Thanks for applying the openssl update.

best regards
 Waldemar

Thomas Perale wrote,

> Hi Waldemar,
> 
> Will apply https://lore.kernel.org/r/<20260612-openssl-3-5-7-v1-1-093c128bb691@cherry.de>
> with your comment.
> 
> Thanks for sending the update.
> PERALE Thomas
> 
> In reply of:
> > See here for changes:
> > https://github.com/openssl/openssl/releases/tag/openssl-3.5.7
> > 
> > This release incorporates the following bug fixes and mitigations:
> > 
> >     Fixed heap use-after-free in PKCS7_verify().
> >     (CVE-2026-45447)
> > 
> >     Fixed CMS AuthEnvelopedData processing may accept forged messages.
> >     (CVE-2026-34182)
> > 
> >     Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler.
> >     (CVE-2026-34183)
> > 
> >     Fixed NULL pointer dereference in QUIC server initial packet handling.
> >     (CVE-2026-42764)
> > 
> >     Fixed AES-OCB IV ignored on EVP_Cipher() path.
> >     (CVE-2026-45445)
> > 
> >     Fixed possible heap buffer overflow in ASN.1 multibyte string conversion.
> >     (CVE-2026-7383)
> > 
> >     Fixed out-of-bounds read in CMS password-based decryption.
> >     (CVE-2026-9076)
> > 
> >     Fixed heap buffer over-read in ASN.1 content parsing.
> >     (CVE-2026-34180)
> > 
> >     Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys.
> >     (CVE-2026-34181)
> > 
> >     Fixed possible NULL dereference in password-dased CMS decryption.
> >     (CVE-2026-42766)
> > 
> >     Fixed NULL pointer dereference in CRMF EncryptedValue decryption.
> >     (CVE-2026-42767)
> > 
> >     Fixed multi-RecipientInfo Bleichenbacher Oracle in CMS_decrypt()
> >     and PKCS7_decrypt().
> >     (CVE-2026-42768)
> > 
> >     Fixed trust anchor substitution via cert/issuer typo in CMP
> >     rootCaKeyUpdate.
> >     (CVE-2026-42769)
> > 
> >     Fixed FFC-DH peer validation uses attacker-supplied q.
> >     (CVE-2026-42770)
> > 
> >     Fixed incorrect tag processing for empty messages in AES-GCM-SIV
> >     and AES-SIV modes.
> >     (CVE-2026-45446)
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> > ---
> >  package/libopenssl/libopenssl.hash | 4 ++--
> >  package/libopenssl/libopenssl.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> > index 781701532d..8a7186d669 100644
> > --- a/package/libopenssl/libopenssl.hash
> > +++ b/package/libopenssl/libopenssl.hash
> > @@ -1,5 +1,5 @@
> > -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
> > -sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
> > +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.7/openssl-3.5.7.tar.gz.sha256
> > +sha256  a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8  openssl-3.5.7.tar.gz
> >  
> >  # License files
> >  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> > diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> > index 837c3f0346..a9e18f96ac 100644
> > --- a/package/libopenssl/libopenssl.mk
> > +++ b/package/libopenssl/libopenssl.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -LIBOPENSSL_VERSION = 3.5.6
> > +LIBOPENSSL_VERSION = 3.5.7
> >  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
> >  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
> >  LIBOPENSSL_LICENSE = Apache-2.0
> > -- 
> > 2.47.3
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
