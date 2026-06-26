Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B91C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6579D6112A;
	Fri, 26 Jun 2026 14:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ic9yZ9Owcgm; Fri, 26 Jun 2026 14:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 669846112F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485795;
	bh=Weh86EFL56GLmkBN/+S7/Q+YGxit2/nyF0C0HWi2/dw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pYlG0rHN7BxtFJnQSREN+l08QB8i0WqKRdGmPO0Z7N31AeOp+yZ8xNgM9MKDBwUaY
	 KrzF+Ulr2tYty4/onkqWaFqKf6iEIf4xXOyrRtf5ep/tdoKmZYS+i9RtBWIQ86rwBJ
	 PQfqU6cvQKJyurqtQf/hrDpzcz8SqP/c/VKFns29/6P4UIBGnT1CRhPA6IYPDXh6/Y
	 TxCWLOB5+VCr44m9gJdCGvL4FU7b7PC8v32A4IzvRG0O4efSU43xJUxXMmosuF4cy8
	 D/DNHFVaa/cmgcQlmF5pAY+zvAH8xmvuxYh8+oFzxAHUEeLSRsxM0QST7T/SiE/gR+
	 N/u/XtXkOEuOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 669846112F;
	Fri, 26 Jun 2026 14:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6D5231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6565E610B8
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G7xubZC4ujap for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4ABC2610BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ABC2610BE
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ABC2610BE
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-46cbf263113so1088944f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485777; x=1783090577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vVTIKl40gLkm+hoOb5otJ9CPTm05y5ZZFirRyLaPZeA=;
 b=qDrReRALMyq4NIYhbXgerHtPsB2J+ShQbyCj5QezeYiOEAOgq3Ll2VqnbY1qQQQbmf
 r3946eSzYDFroW4kV5zWzNRx0FMBtpPCzCL8eoCwacPEdL/F+lmtqRsPTx/ILI98e+tY
 y8to+lcZUaAByG3bDyBYzox9NdV02cU1zU4+L9Cw4rsFZqvR1xQT3RpfpGsGWbRK2hYG
 XwRIYbhOOZrkp17wYhyU4mwouRfwreCORmQllg8hL9O8sQRCQQhcOp03vfs/xfclXRpK
 L5YfMGvlSb+lMtvuhrwIQibFXNFV07VkD1nGCARfn3awj2LsoazW3sgcBYfjcVoQmjja
 65Lg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpy/BObvJ21syXB1Ts9V8QeYkOmDSzUpor8ddJeWI0cW2z4/baDBPI6lrs5X5UpHOLcXaiDZlgjfkI=@buildroot.org
X-Gm-Message-State: AOJu0YwZ0jcowhOazg9U6YQUx0pLs9V0Eol3uMS/eDcerQ54g7/RkIpa
 M4/TQu3KptZBjAxhw0dtY9LGvoiVm1s4m8Lbgdo3SmQ+Lnhbfsfz8JqWlDFV13othi4=
X-Gm-Gg: AfdE7cnehwiihT4d2z9zxuMPiqp9jHGlllal3zW/pslZ1mB5swBlbMkkYWTGFhHHC0V
 KKqKPjDCt3Uu/zos1jaeq1ovKE79YqYqiwkWiZDWDkaPNrhFgn9uJPyYSboul8vC8FD+lgL+HQI
 NicUo4pheIraSxu2Mq3HEV6eVLHwVYwtF4QuNJZTGLUbUomWInhGWHixhtc5NsZ90g6ETp24X2J
 NrjxEzbvT8cQbLx8hQSJ6tu2jtQG4K/4I8h4jl3I/+Ij8Q15mqsD77vu1m5Kw54Hmf/BODVJuY1
 0vzDb5uz6IKKzON8gmcx2yePaH+/+3f4qJlAQIuDmOZVJkKl+Qvcz27SxpFGVZnDwUAEkY/WSnS
 hZzWDxRKr1nDRCSpf6xMpiOwNCvgav2AaAOEHGwhxeHalDoR0yld89gTC7HXu9mDo4iB4B2wQ/J
 a1+g2W
X-Received: by 2002:a05:6000:29db:b0:46d:d5da:f0a8 with SMTP id
 ffacd0b85a97d-46dd5daf20amr7699118f8f.47.1782485777289; 
 Fri, 26 Jun 2026 07:56:17 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9371sm27033551f8f.21.2026.06.26.07.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:17 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:16 +0200
Message-ID: <20260626145616.344531-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-16-peter@korsgaard.com>
References: <20260618124835.2935850-16-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485777; x=1783090577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVTIKl40gLkm+hoOb5otJ9CPTm05y5ZZFirRyLaPZeA=;
 b=R5gbIWuHVcUlmusDZyP4aIk6mmdFON50tHnCiKlVwxEy3xk4P+Ibcg9IxOLGKW8Jz6
 FXJPqVmkEt733xJgsB8tzleB1Dh1Zb+D34a6F7L05/I6I1BKorBDmPHThRjvat4iAISL
 7ZidMihu01C8opgqIJAi0F7+nKlUr8zVByiVWbyN57D0Fl61ZtZF8IeVFPIXol7muksC
 H2f1vD5u9cd0XsUM8J/YX6abdfMZg6NYNv6TtzvzWkTmaE6WWb34X3Zh1EX7zTofqT3s
 QI7wgLuFSCbF4mAtIaCeqOrcJ9BPTy7NULv8o0yNcUTFY1krQnwNdWuXyzWLaOb7qzuM
 Et4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R5gbIWuH
Subject: Re: [Buildroot] [PATCH 16/29] support/testing: test_libgpgme.py:
 use assertRunNotOk()
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
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_libgpgme.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_libgpgme.py b/support/testing/tests/package/test_libgpgme.py
> index b497891249..5d0ee34aa6 100644
> --- a/support/testing/tests/package/test_libgpgme.py
> +++ b/support/testing/tests/package/test_libgpgme.py
> @@ -31,8 +31,7 @@ class TestLibGpgme(infra.basetest.BRTest):
>          # We did not create a gpg key yet. We should not be able to
>          # list our key.
>          gpgme_listkey = f"echo LISTKEYS | gpgme-tool | grep '{gpg_userid}'"
> -        _, exit_code = self.emulator.run(gpgme_listkey)
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(gpgme_listkey)
>  
>          # We now create our gpg key.
>          cmd = "gpg --batch --passphrase ''"
> @@ -66,8 +65,7 @@ class TestLibGpgme(infra.basetest.BRTest):
>  
>          # The output encrypted file is also expected to be different
>          # from the input plain text file.
> -        _, exit_code = self.emulator.run(f"cmp {plain_file} {enc_file}")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk(f"cmp {plain_file} {enc_file}")
>  
>          # We now decrypt the encrypted file using gpgme-tool commands.
>          gpgme_dec_cmds = [
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
