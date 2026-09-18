Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63F4C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7338E40C94;
	Fri, 18 Sep 2026 13:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4w1UrbkRexTH; Fri, 18 Sep 2026 13:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 152DE40CBC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736887;
	b=UMGTxjAmzyo3aNke42njNbRd4VjSC8BVU9n9soawKOSFxIZe6EdUKiokpkYp5Ml2cuCN
	 XO8fVhZUyXWGJFl+zuexDP+RtO+niILoOoiXGmfe8UyytaXHbufWY74ztKtxdClnlz7wW
	 Gs2bbR4c5kWaoj3oqX6xMMgEMM9K6qIx47wAZ9nLq+Buwdz7kK0JudcTXv/L4TMZqoGBA
	 GEEDXWeLKkjN3jJZTrUef3i89tIx12FZT+tSCDFiR//sgWbB7lnBnm2h2XZOkgwgGU7M3
	 0B4aos8EsvqUXQrTat+J+49bKTFVTbYv2V6pw57uSt/c/7XzX3dCNfeLSm9A3NpKhyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vidr3aVzjnUkpbvfNqhRDnlJY1EiAcvoHwS1q9gIwXE=;
	b=lC+OMk9UjOv7hPFc73vCHPFs7NvGfVTRVnN52VMGy4Z1FymCq6KXw/ubg0qaa5R8yTiI
	 vWMCjHMD2ViJJguf/ENoYGyHEr62+1Y7xgEfIx9Hb+j9NHMOeffztOa/vh4RWau89xAtz
	 VheF1+iOIs7/+8eFaFy34jA2X15JeFLqxVUIXd1QVwl5JrFtN357ChsdKPYQFODNOVphK
	 Rej8PbC98fIJh95Pk31drNPVLQviy+qclN/m/OlVetJ3E4MWMx6bKq9bA9FSvdK37cpEH
	 I0MN3lH02LOMcwXKqO0bM+9yd/tzxPEPoO7NjXG2NO+6wCw1a9Wt23UBpmkwitj7EIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736887;
	bh=vidr3aVzjnUkpbvfNqhRDnlJY1EiAcvoHwS1q9gIwXE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OjoPKF6CKaZChs++9IUWY9FkpRYmTQxXJGGCeVeIto4cX2u2XQhD/B74T6kk148ge
	 2FJ4K50/sham3hlB2Dzk8gCtv9Juea2cWtkzdAAuF6Gcwqvywv0MyihQzIieHhOsR8
	 hTbr5+X+5eR/2sMMUfrfWzFiBevyNify8CrhuMdZZYOcJMGqzRCBXUXBSILSH7YUQ9
	 /b76n/TtnhdfUBPrUTfrZctLFn61z7orfkz0S3D4mp9Kpnfr9JWMZVZ0bDOKQCM5M9
	 UuGsddVDKr+R608nK9ncZnXQ2mTbQpemCF1LUfzA8VQ+aWN28wZPB9I3NycE54a95s
	 M5y9jJeXO20IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152DE40CBC;
	Fri, 18 Sep 2026 13:08:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7DAA13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5865811AC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl6e5fctir76 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:07:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E3C968116B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736872;
 b=YQsqxoEwZaXGgiEgeA633w3ziGsTSe1A2/ZYpKH0g5N4hsGYR8N787gWfKLpnnV3NBET
 nCRQZWY6EAjBasksvz68E7KNoCLEwhl+yw+T7K60oI3p6uN8z1hAae61ZUhLpYceMHgt5
 Mwwm1N+kokRSNidddUSzkkz8hmSTYzILOndCElynVbVl5gTAhxNNyHj1GiaFIqiEGr1gy
 9+JMSb1e0k91eUWnuiz705w/bev3EeyKdrtKryR0d44fjDwAvLDAhAQfZ+TTFuAJ3o2d0
 Galzxb2b7gD1ogZv4SjnySE361+9G5JZYM+sQgRvOHJq3QYML5X3HVFun1g70ogWglQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736872;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=QZ6YkXWmTFv2XegbQpGGuVTSU84EQieG28IU9W+5r5Q=;
 b=habqlxMgMRYGyU7hWruNWR6SBooyPN0YwvBm/uc0cKIfhemOxtdRqiw6KMFrl+f7eYsg
 OZmRPEXqJXn00U2aUVHdQBsOIJUUuKbfsOG5ezDPhkp1L9dLf6CS77g+yekh56wd9ZjSp
 b8OUqmeExAUfDUzcwf4ZzXWEYMUFRpxLTWwYvj1VIj4BiWh1qhnWpdp+3vjOHqN5MC++g
 PhhVEd71j/vEXzXNm3KANsj4d/TeHKcExfhscgNYdMaQChCzwZdrwU9F+LN69P3K2IBwD
 5wmn9AthnA+PpHEQyZ4LSMUlwzqGV2bQirtkqYzu5CILY/PpjWr857YQa0s+lLZQMzg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=enyCqbn+; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3C968116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:51 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so4521795e9.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736869; x=1790341669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QZ6YkXWmTFv2XegbQpGGuVTSU84EQieG28IU9W+5r5Q=;
 b=lHPUx2NRTyLYyc/qfR07YMT6mkZ+U0U6A+bZlxFD81SIwWPBjTlqbRSTDyhnSe2f/s
 1zyGAFTgdgzxnSy3Q8eNuZIlXACp6SCNMELWu7R32NyGLCGcXRjAm9mdBtgCnvTvUcEN
 nM7KaTAVHZZL2fVu2a5vCH1sov1o85a2jTJRGAHXRDbqhzZNwt1AmWGNbkGXJ6kPCM4e
 mthdxFj7R6PXU2Ozk8cl7e5lQ4u48wszY2WJDN98qM8X9AebpoexwfA+ESAn9wgMnVAH
 voUtZXzWwznn4X8t0KoI6RWoP6TnNrBDjW9MDbwEmBKZsPIgU2Mkb4inq3AwEhxaB3vT
 SBQw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzKuvRidD0e7jYumbCBiSpS50ZUuhLaAiDGNAQK2qpZUe/QfpipD2VmjEnNEwHp8fIF41OGbNLAh6s=@buildroot.org
X-Gm-Message-State: AFuF++n824HzvwFUOHuc3ZMVrB9GBFey60kc0JBA1eZ6wtuSTDjv7pBF
 sL4axJEONfHBiWVJfG4NsslfiQpSsk06voV9BJGC5iN+M6UQiNJtHCcuQG7WCpfSkf4=
X-Gm-Gg: AYBFou1Ps+cb0e14P7MVEZJs816Lt9dAU6CaOyzqZxxj4xwZXC5RALrZywcXkPbJw1p
 TEP+Bv+RrKtnvsL60YtksrjufX/UfmOBOX9TBF13FVsGXWb8GNOHjH/Lk7KpOXSHvoWUERCPpq8
 yF3ooOBstOCBaez3yYrnLK8IDDVO38VLlpoDM+NJ/mGkhd+Coo+HwFAR0FjF2GYm2jfoRhhfb9c
 7xxpo8YUK46tZFi4cwPp1ubc3/Dk+pYvD62Dgccjs+cLdqQSbPS5oum3HqrT1bm3DoSu2u1hnOJ
 IVdq37n5b8y/bz0t8qr7ffAguTumtuudgJYXYslDXPzB+t4dgUufVZBhRfYM4PGUxYrjDlaMm1J
 MDjU0EbjbfZ5QpW2t95EnYPYBBqt5Y8fbgH2KCscOTGRDN90UlhAezlNQghGeIAOYKIcPhMkc6r
 TR5vDiuluZS7mWtuJjefW7lRrgQr38cysJ9/7OT5U3ejypXG2PnlrrdIvuzaSZHR3a
X-Received: by 2002:a05:600c:5250:b0:49f:bd0d:59f5 with SMTP id
 5b1f17b1804b1-49fc5746338mr32330915e9.18.1789736869369; 
 Fri, 18 Sep 2026 06:07:49 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd32c5e1sm209597805e9.5.2026.09.18.06.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:07:48 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:07:48 +0200
Message-ID: <20260918130748.161033-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915092814.17714-1-titouan.christophe@mind.be>
References: <20260915092814.17714-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/znc: add patch for
 CVE-2026-82373
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
> This fixes the following vulnerability:
> 
> CVE-2026-82373: Use-after-free when unloading modules, triggered by
> unprivileged users
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...01-fix-crash-while-unloading-modules.patch | 497 ++++++++++++++++++
>  package/znc/znc.mk                            |   3 +
>  2 files changed, 500 insertions(+)
>  create mode 100644 package/znc/0001-fix-crash-while-unloading-modules.patch
> 
> diff --git a/package/znc/0001-fix-crash-while-unloading-modules.patch b/package/znc/0001-fix-crash-while-unloading-modules.patch
> new file mode 100644
> index 0000000000..9d8ea6b0cf
> --- /dev/null
> +++ b/package/znc/0001-fix-crash-while-unloading-modules.patch
> @@ -0,0 +1,497 @@
> +From: Alexey Sokolov <alexey+znc@asokolov.org>
> +Date: Sat, 5 Sep 2026 23:09:25 +0100
> +Subject: Fix crash while unloading modules
> +
> +The bug allowed unprivileged users to trigger use-after-free while
> +unloading modules
> +
> +Note that the fix requires a slight API change for OnEmbeddedWebRequest:
> +now the callers (webadmin is the only known caller of it) call it via
> +DoEmbeddedWebRequest() instead. The modules which implement this hook
> +need no changes.
> +
> +CVE-2026-82373
> +
> +Found by Claude from Anthropic, reported by Ada Logics.
> +
> +---
> +Upstream: https://github.com/znc/znc/commit/4b88c64c6e8df29c73568ae1c8b35d797bfa509a
> +CVE: CVE-2026-82373
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + include/znc/Modules.h          |  71 ++++++++++++++++++++-
> + include/znc/main.h             |  30 ++-------
> + modules/modperl/functions.in   |   2 +-
> + modules/modpython/functions.in |   2 +-
> + modules/webadmin.cpp           |  12 ++--
> + src/Client.cpp                 |  29 +++------
> + src/Modules.cpp                | 112 +++++++++++++++------------------
> + 7 files changed, 145 insertions(+), 113 deletions(-)
> +
> +diff --git a/include/znc/Modules.h b/include/znc/Modules.h
> +index ec8b36f883..d842390675 100644
> +--- a/include/znc/Modules.h
> ++++ b/include/znc/Modules.h
> +@@ -465,6 +465,9 @@ class CModule {
> +     void SetNetwork(CIRCNetwork* pNetwork);
> +     void SetClient(CClient* pClient);
> + 
> ++    /** True if the module can be safely unloaded. */
> ++    bool IsCallStackEmpty() const;
> ++
> +     /** This function throws CModule::UNLOAD which causes this module to be unloaded.
> +      */
> +     void Unload() { throw UNLOAD; }
> +@@ -535,9 +538,11 @@ class CModule {
> +      *  @return The List.
> +      */
> +     virtual VWebSubPages& GetSubPages() { return m_vSubPages; }
> ++  private:
> +     /** Using this hook, module can embed web stuff directly to different places.
> +-     *  This method is called whenever embededded modules I/O happens.
> ++     *  This method is called whenever embedded modules I/O happens.
> +      *  Name of used .tmpl file (if any) is up to caller.
> ++     *  Callers call it via `DoEmbeddedWebRequest()`.
> +      *  @param WebSock Socket for web connection, don't do bad things with it.
> +      *  @param sPageName Describes the place where web stuff is embedded to.
> +      *  @param Tmpl Template. Depending on context, you can do various stuff with it.
> +@@ -547,6 +552,9 @@ class CModule {
> +     virtual bool OnEmbeddedWebRequest(CWebSock& WebSock,
> +                                       const CString& sPageName,
> +                                       CTemplate& Tmpl);
> ++  public:
> ++    bool DoEmbeddedWebRequest(CWebSock& WebSock, const CString& sPageName,
> ++                              CTemplate& Tmpl);
> + 
> +     /** Called just before znc.conf is rehashed */
> +     virtual void OnPreRehash();
> +@@ -1528,6 +1536,9 @@ class CModule {
> +         m_mssRegistry;  //!< way to save name/value pairs. Note there is no encryption involved in this
> +     VWebSubPages m_vSubPages;
> +     std::map<CString, CModCommand> m_mCommands;
> ++    int m_iCallStackDepth = 0;
> ++
> ++    friend struct CModCallProtector;
> + };
> + 
> + class CModules : public std::vector<CModule*>, private CCoreTranslationMixin {
> +@@ -1766,4 +1777,62 @@ class CModules : public std::vector<CModule*>, private CCoreTranslationMixin {
> +     CClient* m_pClient;
> + };
> + 
> ++struct CModCallProtector {
> ++    explicit CModCallProtector(CModule& pMod) : m_pMod(&pMod) {
> ++        pMod.m_iCallStackDepth++;
> ++    }
> ++    ~CModCallProtector() { m_pMod->m_iCallStackDepth--; }
> ++
> ++    CModule* m_pMod;
> ++};
> ++
> ++#ifndef SWIG
> ++template <typename T, T* (CModule::*Getter)() const, void (CModule::*Setter)(T*)>
> ++struct CTemporaryModField {
> ++    CTemporaryModField(CModule& pMod, T* pValue) {
> ++        m_pMod = &pMod;
> ++        m_pOldT = (pMod.*Getter)();
> ++        if (pValue) {
> ++            (pMod.*Setter)(pValue);
> ++        }
> ++    }
> ++
> ++    ~CTemporaryModField() { (m_pMod->*Setter)(m_pOldT); }
> ++
> ++    CModule* m_pMod;
> ++    T* m_pOldT;
> ++};
> ++
> ++using CTemporaryModClient =
> ++    CTemporaryModField<CClient, &CModule::GetClient, &CModule::SetClient>;
> ++using CTemporaryModNetwork =
> ++    CTemporaryModField<CIRCNetwork, &CModule::GetNetwork, &CModule::SetNetwork>;
> ++using CTemporaryModUser =
> ++    CTemporaryModField<CUser, &CModule::GetUser, &CModule::SetUser>;
> ++
> ++// Same as above, but for plural CModules
> ++template <typename T, T* (CModules::*Getter)() const, void (CModules::*Setter)(T*)>
> ++struct CTemporaryModsField {
> ++    CTemporaryModsField(CModules& pMods, T* pValue) {
> ++        m_pMods = &pMods;
> ++        m_pOldT = (pMods.*Getter)();
> ++        if (pValue) {
> ++            (pMods.*Setter)(pValue);
> ++        }
> ++    }
> ++
> ++    ~CTemporaryModsField() { (m_pMods->*Setter)(m_pOldT); }
> ++
> ++    CModules* m_pMods;
> ++    T* m_pOldT;
> ++};
> ++
> ++using CTemporaryModsClient =
> ++    CTemporaryModsField<CClient, &CModules::GetClient, &CModules::SetClient>;
> ++using CTemporaryModsNetwork =
> ++    CTemporaryModsField<CIRCNetwork, &CModules::GetNetwork, &CModules::SetNetwork>;
> ++using CTemporaryModsUser =
> ++    CTemporaryModsField<CUser, &CModules::GetUser, &CModules::SetUser>;
> ++#endif
> ++
> + #endif  // !ZNC_MODULES_H
> +diff --git a/include/znc/main.h b/include/znc/main.h
> +index 7d22fd43d4..28924d2c02 100644
> +--- a/include/znc/main.h
> ++++ b/include/znc/main.h
> +@@ -56,21 +56,12 @@ extern bool ZNC_NO_NEED_TO_DO_ANYTHING_ON_MODULE_CALL_EXITER;
> + #define _GLOBALMODULECALL(macFUNC, macUSER, macNETWORK, macCLIENT, macEXITER) \
> +     do {                                                                      \
> +         CModules& GMods = CZNC::Get().GetModules();                           \
> +-        CUser* pOldGUser = GMods.GetUser();                                   \
> +-        CIRCNetwork* pOldGNetwork = GMods.GetNetwork();                       \
> +-        CClient* pOldGClient = GMods.GetClient();                             \
> +-        GMods.SetUser(macUSER);                                               \
> +-        GMods.SetNetwork(macNETWORK);                                         \
> +-        GMods.SetClient(macCLIENT);                                           \
> ++        CTemporaryModsUser TempUser(GMods, macUSER);                          \
> ++        CTemporaryModsNetwork TempNetwork(GMods, macNETWORK);                 \
> ++        CTemporaryModsClient TempClient(GMods, macCLIENT);                    \
> +         if (GMods.macFUNC) {                                                  \
> +-            GMods.SetUser(pOldGUser);                                         \
> +-            GMods.SetNetwork(pOldGNetwork);                                   \
> +-            GMods.SetClient(pOldGClient);                                     \
> +             *macEXITER = true;                                                \
> +         }                                                                     \
> +-        GMods.SetUser(pOldGUser);                                             \
> +-        GMods.SetNetwork(pOldGNetwork);                                       \
> +-        GMods.SetClient(pOldGClient);                                         \
> +     } while (false)
> + 
> + #define _USERMODULECALL(macFUNC, macUSER, macNETWORK, macCLIENT, macEXITER) \
> +@@ -84,17 +75,11 @@ extern bool ZNC_NO_NEED_TO_DO_ANYTHING_ON_MODULE_CALL_EXITER;
> +         }                                                                   \
> +         if (macUSER != nullptr) {                                           \
> +             CModules& UMods = macUSER->GetModules();                        \
> +-            CIRCNetwork* pOldUNetwork = UMods.GetNetwork();                 \
> +-            CClient* pOldUClient = UMods.GetClient();                       \
> +-            UMods.SetNetwork(macNETWORK);                                   \
> +-            UMods.SetClient(macCLIENT);                                     \
> ++            CTemporaryModsNetwork TempNetwork(UMods, macNETWORK);           \
> ++            CTemporaryModsClient TempClient(UMods, macCLIENT);              \
> +             if (UMods.macFUNC) {                                            \
> +-                UMods.SetNetwork(pOldUNetwork);                             \
> +-                UMods.SetClient(pOldUClient);                               \
> +                 *macEXITER = true;                                          \
> +             }                                                               \
> +-            UMods.SetNetwork(pOldUNetwork);                                 \
> +-            UMods.SetClient(pOldUClient);                                   \
> +         }                                                                   \
> +     } while (false)
> + 
> +@@ -109,13 +94,10 @@ extern bool ZNC_NO_NEED_TO_DO_ANYTHING_ON_MODULE_CALL_EXITER;
> +         }                                                                     \
> +         if (macNETWORK != nullptr) {                                          \
> +             CModules& NMods = macNETWORK->GetModules();                       \
> +-            CClient* pOldNClient = NMods.GetClient();                         \
> +-            NMods.SetClient(macCLIENT);                                       \
> ++            CTemporaryModsClient TempClient(NMods, macCLIENT);                \
> +             if (NMods.macFUNC) {                                              \
> +-                NMods.SetClient(pOldNClient);                                 \
> +                 *macEXITER = true;                                            \
> +             }                                                                 \
> +-            NMods.SetClient(pOldNClient);                                     \
> +         }                                                                     \
> +     } while (false)
> + 
> +diff --git a/modules/modperl/functions.in b/modules/modperl/functions.in
> +index a44c818a62..bfa671191c 100644
> +--- a/modules/modperl/functions.in
> ++++ b/modules/modperl/functions.in
> +@@ -66,7 +66,7 @@ void OnServerCapResult(const CString& sCap, bool bSuccess)
> + void OnClientAttached()
> + void OnClientDetached()
> + EModRet OnTimerAutoJoin(CChan& Channel)
> +-bool OnEmbeddedWebRequest(CWebSock& WebSock, const CString& sPageName, CTemplate& Tmpl)
> ++bool OnEmbeddedWebRequest(CWebSock& WebSock, const CString& sPageName, CTemplate& Tmpl)=false
> + EModRet OnAddNetwork(CIRCNetwork& Network, CString& sErrorRet)
> + EModRet OnDeleteNetwork(CIRCNetwork& Network)
> + EModRet OnSendToClient(CString& sLine, CClient& Client)
> +diff --git a/modules/modpython/functions.in b/modules/modpython/functions.in
> +index 76ed437a2c..d2914f9dad 100644
> +--- a/modules/modpython/functions.in
> ++++ b/modules/modpython/functions.in
> +@@ -66,7 +66,7 @@ void OnServerCapResult(const CString& sCap, bool bSuccess)
> + void OnClientAttached()
> + void OnClientDetached()
> + EModRet OnTimerAutoJoin(CChan& Channel)
> +-bool OnEmbeddedWebRequest(CWebSock& WebSock, const CString& sPageName, CTemplate& Tmpl)
> ++bool OnEmbeddedWebRequest(CWebSock& WebSock, const CString& sPageName, CTemplate& Tmpl)=false
> + EModRet OnAddNetwork(CIRCNetwork& Network, CString& sErrorRet)
> + EModRet OnDeleteNetwork(CIRCNetwork& Network)
> + EModRet OnSendToClient(CString& sLine, CClient& Client)
> +diff --git a/modules/webadmin.cpp b/modules/webadmin.cpp
> +index 0b72413813..ac77517c11 100644
> +--- a/modules/webadmin.cpp
> ++++ b/modules/webadmin.cpp
> +@@ -742,7 +742,7 @@ class CWebAdminMod : public CModule {
> +                 CTemplate& mod = Tmpl.AddRow("EmbeddedModuleLoop");
> +                 mod.insert(Tmpl.begin(), Tmpl.end());
> +                 mod["WebadminAction"] = "display";
> +-                if ((*i)->OnEmbeddedWebRequest(WebSock, "webadmin/channel",
> ++                if ((*i)->DoEmbeddedWebRequest(WebSock, "webadmin/channel",
> +                                                mod)) {
> +                     mod["Embed"] = WebSock.FindTmpl(*i, "WebadminChan.tmpl");
> +                     mod["ModName"] = (*i)->GetModName();
> +@@ -816,7 +816,7 @@ class CWebAdminMod : public CModule {
> +         TmplMod["ChanName"] = pChan->GetName();
> +         TmplMod["WebadminAction"] = "change";
> +         FOR_EACH_MODULE(it, pNetwork) {
> +-            (*it)->OnEmbeddedWebRequest(WebSock, "webadmin/channel", TmplMod);
> ++            (*it)->DoEmbeddedWebRequest(WebSock, "webadmin/channel", TmplMod);
> +         }
> + 
> +         if (!CZNC::Get().WriteConfig()) {
> +@@ -1027,7 +1027,7 @@ class CWebAdminMod : public CModule {
> +                 CTemplate& mod = Tmpl.AddRow("EmbeddedModuleLoop");
> +                 mod.insert(Tmpl.begin(), Tmpl.end());
> +                 mod["WebadminAction"] = "display";
> +-                if ((*i)->OnEmbeddedWebRequest(WebSock, "webadmin/network",
> ++                if ((*i)->DoEmbeddedWebRequest(WebSock, "webadmin/network",
> +                                                mod)) {
> +                     mod["Embed"] = WebSock.FindTmpl(*i, "WebadminNetwork.tmpl");
> +                     mod["ModName"] = (*i)->GetModName();
> +@@ -1246,7 +1246,7 @@ class CWebAdminMod : public CModule {
> +         TmplMod["Name"] = pNetwork->GetName();
> +         TmplMod["WebadminAction"] = "change";
> +         FOR_EACH_MODULE(it, make_pair(pUser, pNetwork)) {
> +-            (*it)->OnEmbeddedWebRequest(WebSock, "webadmin/network", TmplMod);
> ++            (*it)->DoEmbeddedWebRequest(WebSock, "webadmin/network", TmplMod);
> +         }
> + 
> +         if (!CZNC::Get().WriteConfig()) {
> +@@ -1670,7 +1670,7 @@ class CWebAdminMod : public CModule {
> +                 CTemplate& mod = Tmpl.AddRow("EmbeddedModuleLoop");
> +                 mod.insert(Tmpl.begin(), Tmpl.end());
> +                 mod["WebadminAction"] = "display";
> +-                if ((*i)->OnEmbeddedWebRequest(WebSock, "webadmin/user", mod)) {
> ++                if ((*i)->DoEmbeddedWebRequest(WebSock, "webadmin/user", mod)) {
> +                     mod["Embed"] = WebSock.FindTmpl(*i, "WebadminUser.tmpl");
> +                     mod["ModName"] = (*i)->GetModName();
> +                 }
> +@@ -1731,7 +1731,7 @@ class CWebAdminMod : public CModule {
> +         TmplMod["Username"] = sUsername;
> +         TmplMod["WebadminAction"] = "change";
> +         FOR_EACH_MODULE(it, pUser) {
> +-            (*it)->OnEmbeddedWebRequest(WebSock, "webadmin/user", TmplMod);
> ++            (*it)->DoEmbeddedWebRequest(WebSock, "webadmin/user", TmplMod);
> +         }
> + 
> +         if (!CZNC::Get().WriteConfig()) {
> +diff --git a/src/Client.cpp b/src/Client.cpp
> +index 0f60f9a11c..db1ec7a62e 100644
> +--- a/src/Client.cpp
> ++++ b/src/Client.cpp
> +@@ -21,8 +21,8 @@
> + #include <znc/IRCNetwork.h>
> + #include <znc/Query.h>
> + 
> +-using std::set;
> + using std::map;
> ++using std::set;
> + using std::vector;
> + 
> + #define CALLMOD(MOD, CLIENT, USER, NETWORK, FUNC)                             \
> +@@ -30,10 +30,9 @@ using std::vector;
> +         CModule* pModule = nullptr;                                           \
> +         if (NETWORK && (pModule = (NETWORK)->GetModules().FindModule(MOD))) { \
> +             try {                                                             \
> +-                CClient* pOldClient = pModule->GetClient();                   \
> +-                pModule->SetClient(CLIENT);                                   \
> ++                CModCallProtector Inside(*pModule);                           \
> ++                CTemporaryModClient TempClient(*pModule, CLIENT);             \
> +                 pModule->FUNC;                                                \
> +-                pModule->SetClient(pOldClient);                               \
> +             } catch (const CModule::EModException& e) {                       \
> +                 if (e == CModule::UNLOAD) {                                   \
> +                     (NETWORK)->GetModules().UnloadModule(MOD);                \
> +@@ -41,13 +40,10 @@ using std::vector;
> +             }                                                                 \
> +         } else if ((pModule = (USER)->GetModules().FindModule(MOD))) {        \
> +             try {                                                             \
> +-                CClient* pOldClient = pModule->GetClient();                   \
> +-                CIRCNetwork* pOldNetwork = pModule->GetNetwork();             \
> +-                pModule->SetClient(CLIENT);                                   \
> +-                pModule->SetNetwork(NETWORK);                                 \
> ++                CModCallProtector Inside(*pModule);                           \
> ++                CTemporaryModClient TempClient(*pModule, CLIENT);             \
> ++                CTemporaryModNetwork TempNetwork(*pModule, NETWORK);          \
> +                 pModule->FUNC;                                                \
> +-                pModule->SetClient(pOldClient);                               \
> +-                pModule->SetNetwork(pOldNetwork);                             \
> +             } catch (const CModule::EModException& e) {                       \
> +                 if (e == CModule::UNLOAD) {                                   \
> +                     (USER)->GetModules().UnloadModule(MOD);                   \
> +@@ -55,16 +51,11 @@ using std::vector;
> +             }                                                                 \
> +         } else if ((pModule = CZNC::Get().GetModules().FindModule(MOD))) {    \
> +             try {                                                             \
> +-                CClient* pOldClient = pModule->GetClient();                   \
> +-                CIRCNetwork* pOldNetwork = pModule->GetNetwork();             \
> +-                CUser* pOldUser = pModule->GetUser();                         \
> +-                pModule->SetClient(CLIENT);                                   \
> +-                pModule->SetNetwork(NETWORK);                                 \
> +-                pModule->SetUser(USER);                                       \
> ++                CModCallProtector Inside(*pModule);                           \
> ++                CTemporaryModClient TempClient(*pModule, CLIENT);             \
> ++                CTemporaryModNetwork TempNetwork(*pModule, NETWORK);          \
> ++                CTemporaryModUser TempUser(*pModule, USER);                   \
> +                 pModule->FUNC;                                                \
> +-                pModule->SetClient(pOldClient);                               \
> +-                pModule->SetNetwork(pOldNetwork);                             \
> +-                pModule->SetUser(pOldUser);                                   \
> +             } catch (const CModule::EModException& e) {                       \
> +                 if (e == CModule::UNLOAD) {                                   \
> +                     CZNC::Get().GetModules().UnloadModule(MOD);               \
> +diff --git a/src/Modules.cpp b/src/Modules.cpp
> +index d553cbb794..2c4c056fa1 100644
> +--- a/src/Modules.cpp
> ++++ b/src/Modules.cpp
> +@@ -36,67 +36,45 @@ bool ZNC_NO_NEED_TO_DO_ANYTHING_ON_MODULE_CALL_EXITER;
> + #warning "your crap box doesn't define RTLD_LOCAL !?"
> + #endif
> + 
> +-#define MODUNLOADCHK(func)                              \
> +-    for (CModule * pMod : *this) {                      \
> +-        try {                                           \
> +-            CClient* pOldClient = pMod->GetClient();    \
> +-            pMod->SetClient(m_pClient);                 \
> +-            CUser* pOldUser = nullptr;                  \
> +-            if (m_pUser) {                              \
> +-                pOldUser = pMod->GetUser();             \
> +-                pMod->SetUser(m_pUser);                 \
> +-            }                                           \
> +-            CIRCNetwork* pNetwork = nullptr;            \
> +-            if (m_pNetwork) {                           \
> +-                pNetwork = pMod->GetNetwork();          \
> +-                pMod->SetNetwork(m_pNetwork);           \
> +-            }                                           \
> +-            pMod->func;                                 \
> +-            if (m_pUser) pMod->SetUser(pOldUser);       \
> +-            if (m_pNetwork) pMod->SetNetwork(pNetwork); \
> +-            pMod->SetClient(pOldClient);                \
> +-        } catch (const CModule::EModException& e) {     \
> +-            if (e == CModule::UNLOAD) {                 \
> +-                UnloadModule(pMod->GetModName());       \
> +-            }                                           \
> +-        }                                               \
> +-    }
> +-
> +-#define MODHALTCHK(func)                                \
> +-    bool bHaltCore = false;                             \
> +-    for (CModule * pMod : *this) {                      \
> +-        try {                                           \
> +-            CModule::EModRet e = CModule::CONTINUE;     \
> +-            CClient* pOldClient = pMod->GetClient();    \
> +-            pMod->SetClient(m_pClient);                 \
> +-            CUser* pOldUser = nullptr;                  \
> +-            if (m_pUser) {                              \
> +-                pOldUser = pMod->GetUser();             \
> +-                pMod->SetUser(m_pUser);                 \
> +-            }                                           \
> +-            CIRCNetwork* pNetwork = nullptr;            \
> +-            if (m_pNetwork) {                           \
> +-                pNetwork = pMod->GetNetwork();          \
> +-                pMod->SetNetwork(m_pNetwork);           \
> +-            }                                           \
> +-            e = pMod->func;                             \
> +-            if (m_pUser) pMod->SetUser(pOldUser);       \
> +-            if (m_pNetwork) pMod->SetNetwork(pNetwork); \
> +-            pMod->SetClient(pOldClient);                \
> +-            if (e == CModule::HALTMODS) {               \
> +-                break;                                  \
> +-            } else if (e == CModule::HALTCORE) {        \
> +-                bHaltCore = true;                       \
> +-            } else if (e == CModule::HALT) {            \
> +-                bHaltCore = true;                       \
> +-                break;                                  \
> +-            }                                           \
> +-        } catch (const CModule::EModException& e) {     \
> +-            if (e == CModule::UNLOAD) {                 \
> +-                UnloadModule(pMod->GetModName());       \
> +-            }                                           \
> +-        }                                               \
> +-    }                                                   \
> ++#define MODUNLOADCHK(func)                                       \
> ++    for (CModule* pMod : *this) {                                \
> ++        try {                                                    \
> ++            CModCallProtector inside(*pMod);                     \
> ++            CTemporaryModClient TempClient(*pMod, m_pClient);    \
> ++            CTemporaryModUser TempUser(*pMod, m_pUser);          \
> ++            CTemporaryModNetwork TempNetwork(*pMod, m_pNetwork); \
> ++            pMod->func;                                          \
> ++        } catch (const CModule::EModException& e) {              \
> ++            if (e == CModule::UNLOAD) {                          \
> ++                UnloadModule(pMod->GetModName());                \
> ++            }                                                    \
> ++        }                                                        \
> ++    }
> ++
> ++#define MODHALTCHK(func)                                         \
> ++    bool bHaltCore = false;                                      \
> ++    for (CModule* pMod : *this) {                                \
> ++        try {                                                    \
> ++            CModCallProtector inside(*pMod);                     \
> ++            CModule::EModRet e = CModule::CONTINUE;              \
> ++            CTemporaryModClient TempClient(*pMod, m_pClient);    \
> ++            CTemporaryModUser TempUser(*pMod, m_pUser);          \
> ++            CTemporaryModNetwork TempNetwork(*pMod, m_pNetwork); \
> ++            e = pMod->func;                                      \
> ++            if (e == CModule::HALTMODS) {                        \
> ++                break;                                           \
> ++            } else if (e == CModule::HALTCORE) {                 \
> ++                bHaltCore = true;                                \
> ++            } else if (e == CModule::HALT) {                     \
> ++                bHaltCore = true;                                \
> ++                break;                                           \
> ++            }                                                    \
> ++        } catch (const CModule::EModException& e) {              \
> ++            if (e == CModule::UNLOAD) {                          \
> ++                UnloadModule(pMod->GetModName());                \
> ++            }                                                    \
> ++        }                                                        \
> ++    }                                                            \
> +     return bHaltCore;
> + 
> + /////////////////// Timer ///////////////////
> +@@ -205,6 +183,8 @@ void CModule::SetUser(CUser* pUser) { m_pUser = pUser; }
> + void CModule::SetNetwork(CIRCNetwork* pNetwork) { m_pNetwork = pNetwork; }
> + void CModule::SetClient(CClient* pClient) { m_pClient = pClient; }
> + 
> ++bool CModule::IsCallStackEmpty() const { return m_iCallStackDepth == 0; }
> ++
> + CString CModule::ExpandString(const CString& sStr) const {
> +     CString sRet;
> +     return ExpandString(sStr, sRet);
> +@@ -622,6 +602,11 @@ bool CModule::OnEmbeddedWebRequest(CWebSock& WebSock, const CString& sPageName,
> +                                    CTemplate& Tmpl) {
> +     return false;
> + }
> ++bool CModule::DoEmbeddedWebRequest(CWebSock& WebSock, const CString& sPageName,
> ++                                   CTemplate& Tmpl) {
> ++    CModCallProtector inside(*this);
> ++    return OnEmbeddedWebRequest(WebSock, sPageName, Tmpl);
> ++}
> + // !Webmods
> + 
> + bool CModule::OnLoad(const CString& sArgs, CString& sMessage) {
> +@@ -1953,6 +1938,11 @@ bool CModules::UnloadModule(const CString& sModule, CString& sRetMsg) {
> +         return false;
> +     }
> + 
> ++    if (!pModule->IsCallStackEmpty()) {
> ++        sRetMsg = t_f("Module [{1}] is being called, cannot unload.")(sMod);
> ++        return false;
> ++    }
> ++
> +     bool bSuccess;
> +     bool bHandled = false;
> +     _GLOBALMODULECALL(OnModuleUnloading(pModule, bSuccess, sRetMsg),
> diff --git a/package/znc/znc.mk b/package/znc/znc.mk
> index ec6287e6de..6767ad8cd3 100644
> --- a/package/znc/znc.mk
> +++ b/package/znc/znc.mk
> @@ -12,6 +12,9 @@ ZNC_CPE_ID_VENDOR = znc
>  ZNC_DEPENDENCIES = host-pkgconf
>  ZNC_CONF_OPTS = -DWANT_CYRUS=OFF -DWANT_I18N=OFF -DWANT_PERL=OFF
>  
> +# 0001-fix-crash-while-unloading-modules.patch
> +ZNC_IGNORE_CVES += CVE-2026-82373
> +
>  ifeq ($(BR2_PACKAGE_ICU),y)
>  ZNC_DEPENDENCIES += icu
>  ZNC_CONF_OPTS += -DWANT_ICU=ON
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
