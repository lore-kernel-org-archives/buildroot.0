Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7822CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB1568430E;
	Fri, 29 May 2026 08:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 439gAa-qGAaW; Fri, 29 May 2026 08:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B419A84309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043428;
	bh=lHGQmcZWpUMbyYpltPRiJnzLkOh4F12tRC70gQxxVKA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U2kNtawKRzWJ+wtgq4HZ+wT9z6Fb7kkNPGKSLpj9Vr7meCgUTYn7QzQo9vawNss+r
	 gc3jCl1bhLdYWeOxyhrNrn1VUlyM271/4UiglEgumsKKkiOxbOs4/PqxSBzCv2PzzE
	 bH1jATgd/0XeuU+GvxEnZ8XEybaHlK2vDtaowtOBHMOSVZVGfR82/oPzPkthoDXt59
	 WUo4fI4r54BiXMiOodcB7ECNePP81iVV/nOb/ofmmd5ESsnKYvtpCMNxW2Ayn0qt+0
	 T3meAhktMW4cSvdOuJL1zRDrunckWfCIZBuDPWNbvQrQecH/v94VW6vAMa3x/FWm3k
	 Le2VTZAhG8Tgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B419A84309;
	Fri, 29 May 2026 08:30:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ED32288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 503514230A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tP9IDtP4XwIs for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30BC94231C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30BC94231C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30BC94231C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:18 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so275035f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043416; x=1780648216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ELmhYdPt0NRkbNWYFdx6GRl2sa/I0ie44r22uPxoBMI=;
 b=kyy5rKAa3qu+Spl5sctEMgoGl6dXmdc2+9WO9roFN5no0Nm74NZDHfG68fC556jLzn
 YFAUuPzhGCGEkE4J1kcAy0LcxaBF1ul9LnBAF9U643hRP+VjXHz0EAz4isZZUQPGdG+c
 TC2M5TWoCx7pkbKv3TEW0vAM3khzjWJjf+hmkaecQUNPkZKLsAvaMwxvxtEJ0g/ipfc2
 BvWK6KAZeosyyl1nXLW2R/bKc0DSRbiH29kuvUVWG2MIWyMu/W2R9RhylsSZiPCXM+r0
 5lCQvSMpFpaMk8Lzx8pMZ2OXmSP3feNtsZiTYun2+66SvYurk470HokJZtYZjvH1GO33
 6NaA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/2oFBI8YzHNuxq8/iljAG/Ni4sT0VxR3UGD/0xYT2tOUWcbe5JvMrq0xT30jEGxZ2drXM8OBGQBDw=@buildroot.org
X-Gm-Message-State: AOJu0Yzw602ki7SOouf5n6E2O1xYvfeXxxQtCDRWPnsn05Pv725mLFvD
 Q+25u8YhSEUnyuI+5RudVmOg0oeGVyXJSIBkMA/EXdKxQW/rjYDQbjYdB4GJZj9ZHtE=
X-Gm-Gg: Acq92OGY+SQn5iTvZwhWST8Oi4Vo3Lt+kB6U9N2qkfJLPX3Qo4Q9PSbAOMkZyFZkr8S
 0+qfCb+qMRbRH6Z/8hPaxSmlkLK8o84/I8owMo4DoYYJpgHGdwxKE7gp0duqkmnAjBjz0QxBI1i
 WbYaq+C+6cl4JkftxM9FeMuj/1a+DuspuWSc6uP/A3rV4T5NDJwdoiXkt/3uzX7RqcVmQ6z9T4s
 4OrWYkENBEaDgOXfO/Dc1cEyD8JY9RRBaygxvLNp0iapud2fp1X60FPBMOVPPphIExbF4G3NlJC
 +01XWaOoNGmt059h6xa0JkBTX4DbMoDrP0M/xfgnqcslgtd3YL85fUAUvtSef5JWRnWCY1bXByG
 iUDE0Y9+KpnGyWQCHaIVHklqIz0glpVoSD+mNFbUUa5qBhqHTE+OzgB3Rwjf0IywMlKa2GsNID6
 aal9+5vSDpV2rLrrRS77H9RvxsjyiBQFcMahxk0gm/Uy35q9XFIiuNiL73pw==
X-Received: by 2002:a5d:46c4:0:b0:45e:de5c:f64f with SMTP id
 ffacd0b85a97d-45ef1458969mr2183185f8f.34.1780043415497; 
 Fri, 29 May 2026 01:30:15 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cd87sm1723520f8f.24.2026.05.29.01.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:14 +0200
Message-ID: <20260529083014.59213-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512164319.3691172-1-bernd@kuhls.net>
References: <20260512164319.3691172-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043416; x=1780648216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ELmhYdPt0NRkbNWYFdx6GRl2sa/I0ie44r22uPxoBMI=;
 b=LkV+GE5CKv88+5FZgOXiB86JK5tC9X7WFiIVntRKY6LDl7CWjXzrYu7AYRntuwe4uI
 cZyOdqRRIDGXMJ/WD0TcdkOr6pvP4SMcaW/AsoIxbm0BXgXnSMG7QqBZHOcajvULMrVi
 kSYPb7H2+0TFvr2/Hh7OsAG4fhPi7eKsuQ8xW2HqDWCy0HDDo0KJ9NLAJya1CGrHOtAP
 53pHTZk62m1mECnRr+pm94xQjlSI//C/0KnpD515LnJgUyGNgCNtRGrw0fwmQcZrDZg3
 BXPoZMqdXFpbdlxZ7pb2r2iOZBthbi7n+ok8aKtXOaMPr5g45YlxBNpRk+d2Sxoc6m76
 voMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LkV+GE5C
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 version to 3.0.15
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
> https://github.com/owasp-modsecurity/ModSecurity/blob/v3.0.15/CHANGES
> 
> Fixes CVE-2026-42268 & CVE-2026-30923.
> 
> Rebased patch 0001 due to upstream commit
> https://github.com/owasp-modsecurity/ModSecurity/commit/f38b5b7296d87e7b1744ef6b5f3dca11fe7cf886
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch   | 6 ++++--
>  package/libmodsecurity/libmodsecurity.hash                  | 4 ++--
>  package/libmodsecurity/libmodsecurity.mk                    | 2 +-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
> index 9e0b672c8d..43d1cc73f6 100644
> --- a/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
> +++ b/package/libmodsecurity/0001-modsecurity.pc.in-add-lstdc.patch
> @@ -14,6 +14,8 @@ Fixes:
>  
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
> +[Bernd: rebased for 3.0.15]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   modsecurity.pc.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -26,8 +28,8 @@ index 96cdf5ca..7c895ddc 100644
>   Version: @MSC_VERSION_WITH_PATCHLEVEL@
>   Cflags: -I@includedir@
>   Libs: -L@libdir@ -lmodsecurity
> --Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
> -+Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
> +-Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @PCRE2_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
> ++Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @PCRE2_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
>  -- 
>  2.39.2
>  
> diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
> index 821459f6b9..aab9d14d67 100644
> --- a/package/libmodsecurity/libmodsecurity.hash
> +++ b/package/libmodsecurity/libmodsecurity.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.14/modsecurity-v3.0.14.tar.gz.sha256
> -sha256  f7599057b35e67ab61764265daddf9ab03c35cee1e55527547afb073ce8f04e8  modsecurity-v3.0.14.tar.gz
> +# From https://github.com/owasp-modsecurity/ModSecurity/releases/download/v3.0.15/modsecurity-v3.0.15.tar.gz.sha256
> +sha256  c276c838df6b61d96aa52075aee17d426af52755e16d09edca9f9d718696fda7  modsecurity-v3.0.15.tar.gz
>  # Locally calculated
>  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
> index a90fa1d614..c06d890979 100644
> --- a/package/libmodsecurity/libmodsecurity.mk
> +++ b/package/libmodsecurity/libmodsecurity.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBMODSECURITY_VERSION = 3.0.14
> +LIBMODSECURITY_VERSION = 3.0.15
>  LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
>  LIBMODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
>  LIBMODSECURITY_INSTALL_STAGING = YES
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
