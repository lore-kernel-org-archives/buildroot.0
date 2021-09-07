Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F82C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:59:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80A1E6108D
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80A1E6108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246DD403C5;
	Tue,  7 Sep 2021 12:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukbc1prvMm8Q; Tue,  7 Sep 2021 12:59:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9455E40224;
	Tue,  7 Sep 2021 12:59:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 808921BF25F
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ED7D40224
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFKIW2my8R2k for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:59:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C15440211
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:59:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id h9so19529396ejs.4
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7Ht+luQP9owJXafEonxvaL2S4u4DAhyqqrBzllU1w84=;
 b=SZ4+Xlz9bQ9nAHf/VEpM2s0pwQCLcXpf8v0mqOMHhA1kZ3Uzdo4XS7UflT2ERVf2fT
 NN8IDcUsX5uecnlvyCAz+tscRe0dD0J6s0PL1pGRGrP3lWaoxUYGfYDoPPhNTkTv/VJk
 6gGs+RSTM7NLzGiAJqSaIxKfNe3PBTPGovj4UURra1GPnINSTHi7fxqu8uO8LeOdJHj3
 gb2DmBLKg4Z78rhfVz6VIqIAgQdDowoeBhwuTh4FrKjk1ntt9Tq2V6LYDW1QOsmLcEsg
 APGDjDAkF/jsBmWCys3vPLYx8sVXxzvoY16SKNKIZDxZGVgmVeHQdPIoY63hSDq9CSb2
 dEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7Ht+luQP9owJXafEonxvaL2S4u4DAhyqqrBzllU1w84=;
 b=dZkI/Mzw8YHQU78XrLSzMnZfvZO/z2RMz1P4A1xkTMMpk3YUv1syotDCP/OpC5LPJD
 SdXFQLWVMUgI6TNCdQbJ6qF33RZl7pxQ44oJd3KS1n2O69MuYEJaNTlHl3uxdjrIpR9j
 Nlgv/2z/ZihjFmaIRJZegn7h1c9Rjgih/Sc8WHhu+oConRlpHGl7TS1sDkWuGhILMZ+p
 mrtFaDdzU4jipdf9QzikOSEHNbKPcuabIGaDsPhdKtacpSSY1aN7sY6Xyo5i7Q5nF+Zb
 dzFfMRvWgpuSyr/tLjBpcmtTTlkBiXPCeflmS8O4kHV9ckpATfn+KE8r+f8hMzmKBBXC
 IfwQ==
X-Gm-Message-State: AOAM531SpB6YKbq7wPAcjXhZbRb4U0XHyHI6I0aoo2651rs6XAUgvu4I
 gGU8q6tGdzoSwwSL1Ixug0M=
X-Google-Smtp-Source: ABdhPJyosk+NxjWsW1nFOtOzOZBsQXvU+2uoX+IUid5oVjnnvMNwL0E+UtsB0ZvGWaSA2ldvyiTerg==
X-Received: by 2002:a17:907:924d:: with SMTP id
 kb13mr18345843ejb.151.1631019586967; 
 Tue, 07 Sep 2021 05:59:46 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 q12sm6539451edw.81.2021.09.07.05.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:59:46 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mNahV-0004Pd-Fj; Tue, 07 Sep 2021 14:59:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20210822194644.3260223-1-romain.naour@gmail.com>
Date: Tue, 07 Sep 2021 14:59:45 +0200
In-Reply-To: <20210822194644.3260223-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 22 Aug 2021 21:46:44 +0200")
Message-ID: <87y288ee2m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] support/testing: test_atf: bump the custom
 version to v2.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > This version bump is needed to pass the ATF test with
 > hardening option enabled (-fstack-protector-strong)

 > With the version v2.2, ATF fail due to undefined references:

 > ./build/juno/release/bl2u/arm_tzc400.o: In function `arm_tzc400_setup':
 > arm_tzc400.c:(.text.arm_tzc400_setup+0x10): undefined reference to `__stack_chk_guard'
 > arm_tzc400.c:(.text.arm_tzc400_setup+0x18): undefined reference to `__stack_chk_guard'
 > arm_tzc400.c:(.text.arm_tzc400_setup+0xb8): undefined reference to `__stack_chk_guard'
 > arm_tzc400.c:(.text.arm_tzc400_setup+0xcc): undefined reference to `__stack_chk_fail'

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
