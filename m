Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227AFCC6B12
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 18:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6A1C6078C;
	Tue, 13 Oct 2026 18:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXA9Tv9c3Hl0; Tue, 13 Oct 2026 18:46:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C4E6E606FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791917170;
	b=K0742vAHw6AzpBmSG4j16wUS5apFCVIqPXGwy49l9J9pUvIIZtk/V2BqkGf0jEudbNoo
	 kWEl+FdMMIhWkwbDk0NJvWExGrpJ/B6TtvdQ/adwE/h/FlMEtuT4MHBRMEZ5y8x2MSksP
	 g/cE/tUKcuE5DFimiMt3PNHz/y0RAKdGA8L4lme/f45XU/I2WFECcs3nzAscNJ3ojJZM8
	 TilQ3+3Cn84/50VPES/dYHTfsA19bMtyg4rZPgEe/rfTZsDFan1mOqlUcHi2PupgE8/ZK
	 CPxDGCKOfWPSt9POuE9HO4H2uwAsV2ihD39h30+i4bJF25wF2nCMt5IIPqL1hiIEvVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791917170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=O5SdpeNXICF4B8BPwJv5/b84dnOLtrgcBAQWWWiw8YY=;
	b=g0w77V9d0pC2o8zefW6knOVkwT80GeuywEm+88aDiQLWpRiayiW93qob96mR5sbmcJ94
	 YBt5RwyBAaj8oCcmr2EJ+mxQf3d9AI7Zj4xQcYXaFXs/b6kT3SdbjgvIPp88QaBwP4+2/
	 muFkFO6yT/d8EDE7UBSiqK5erVhrh/8kih77JlVvJRWlSUm0ygQom/amrC09g3B0Cwjy6
	 MJw3dPjRTN8h4xnaMziTX6T4AuNpVYQAAd/dVTrB9vghu3rnaBreEAEQ/fCFHXUs69tz0
	 8bLzv/XNYoEOt8ZbYesY5zuIWimW1Wk+at08NE0FXCsChH6FffvfbshUfzKd8F2jN3Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PyS3ex2M;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791917170;
	bh=O5SdpeNXICF4B8BPwJv5/b84dnOLtrgcBAQWWWiw8YY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G4lBdcfYdz5ePsacX7nlueGBlpIlJNGKrGpwQnIxjSd36kmQbC7Vx2iLX4nlnt85g
	 yD9O9ZMfqPNCjNZSYgfHThtDfNwX14qc9lhl6ViPv4Lm9FJEtaAEFtVIwMvw4KkrBp
	 FXqY62HlSLd7MwL+IRaR5CLBzaoqBcfaBsgMzPet4OnAe8X+cWGKl0FfObe9NkeuvG
	 MRTpGBta22Tin2Q+IN99ZpHRxzx51wQyV8krNYMEPKzn33onM/O+8q9Stcy9M+ne3R
	 3qQQ5iNwdHC7vP4WDunejt95Alus8oFbSFjmGNt++O1r/Qd++hUmfxb6tJQfmse5Cb
	 HE6HE7mHvgb5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4E6E606FA;
	Tue, 13 Oct 2026 18:46:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 361322AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BB07606FA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJ0e-RqY2M-F for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 18:46:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D1321605B5
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791917168;
 b=Mgf3pQdiV/DESqtiOa4eZVjzA1azBGfLJrxOixuswcFb8QYGE7ZcGjWvqUEtvtCMG0UE
 Eku1LDHSGWFecJy4RuqflxEMzucVNIoPnx4UmPm19rYRw2miF4oX5ZkKnvdNR74C6BXAh
 AiH+6cPh3odsloWTZdbAjzFEKVgI6VEKZ8TdKQaa76AOO+vE9LRBnV652mKAIOs7Lweeg
 kjYoOUfkKRLK9GNLwO42LKv8X3jr5HCSl6gAVoC3tLTY8dbs5IaV0JIHFZmMQO8Ls5AEc
 BbH2CYVmaREKxluYfwl/5L3TzoJr+9ZzRo/zqW5uyfm04gp9JcOnlbeRn9MnsR6eIig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791917168;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=G08b5bqHrEJxgOLjHDaHw2eyThxyA4l2lGBcKLEdjFE=;
 b=JVDvnrQeb0G9azlytL1kPDZK8qzgoK1y//csifUqbwpcTfGXPZxHVVcK1Zg4NxrRErki
 JysVes95s5ehEFfISsn7EUTUSTiJR5uJQ/9Div3coJZ7VPR6zehtPrItfxjzuPmzLRTLP
 /BUTFDxuu/I/nScpNkuaxS5iXWo+ltvMcwQBaD8VNBK/EID4BR2g8BywPNRICdZ3mLXOg
 H+tBf1DumyiP+2e4EANEtoRXISVu6CXYj9y5WMaXD2xKp61wHE++HW3BnZp8HXNl+oVY3
 +HEAFMysACYhPd6iMq5WVqnRThStE6MA+5ieTEEKJGtFR0/O4mzL+0UJ56MDiW2zO3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PyS3ex2M; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PyS3ex2M
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1321605B5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:46:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48c6f764f82so1131563f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791917165; x=1792521965; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G08b5bqHrEJxgOLjHDaHw2eyThxyA4l2lGBcKLEdjFE=;
 b=PyS3ex2MMU12kQrxVAN6hMsyHIHb0LpELtdLunshqTrh7jvPEHO7+ojd+Mr6aw/PLR
 wATqR6YnM8stD4LqtOsCmST4a6/+9DAwy8y+kpP0hf8GWj8tKC3nKKBYi8+mlR9ZFsLy
 zGQOuCGzJydlj1RYa6D4MMwGTNDcE8VxdG0Q6f1tPQbstr2c1xKXyJpNsbz7zKemI7S/
 tcEVVqbBw2ryZHKE/GskcKXFKNIVwWUqOOgUnbHjeap+qe4ari7SUcFo+28/gUIbpqoL
 VOGT0HlgGqibxkq3aLU2x8slu0EfWhk23/hc9CdIeV9ngrz2avp8BJl+hvCBnVb3wNyd
 nLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791917165; x=1792521965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G08b5bqHrEJxgOLjHDaHw2eyThxyA4l2lGBcKLEdjFE=;
 b=uzvc8N1YU4nAxAa6T6Rzmjyj6Npd/rKDhE2nPlgoB1JVO5EUgDpZAfjVZMcre+X8E3
 TyMQVlJn5Op9njKcTE9fMg+WanAHEfTy05+feqvZkFW704NXPLkz0Of/bxOwyNhbDeAb
 DH2lYx/Tab1jTydYeFUFT2EYE0Eu2klPMIGxDzhIqSdt484iPi+n+aKVK4X+kSwOKwDu
 Hkrpzt3PZ9TxuJY0mZuERo7tehfRAtnswmWTKgzmLTpWwTNVBag4iPA/jbLpYw/hQx0r
 dLqwL15ia5dZCbWto23l6m84atmXPPv77kQbNF7ikFzFnEqwdFVyAw+YGZnWI1ZLCp99
 bDKw==
X-Gm-Message-State: AFq9FYKuz81jBweigWawKO+4KO30KDABSqVkj/jHcbgilOmYHVq57XsH
 VTLWVIAmpIuW7+9DpC1DW/iJeT/fCG3wso+LHKdS8Tx4TIEAM9HNpoq8
X-Gm-Gg: AYBFou2rW8vM7tROAMt/DG40kdrwOIWUgOlywrnOzVU1UKoh3umGbNBEmAmiCH/DPqw
 mZ5uStSosF04mluYcemj3QsznOsKHD61/dSBRwXFMujU7VZ4r4Ev91Nx0MV7VWu99xc+9syRQUc
 B3GKtq22WS/8VgL7HZ6YWpQd/tz2kZf7Gicm9hoZyqfomm9h+6/uJeH7HqaMnQdLxlzF1CpACFR
 /N5metR+cCQZboKGs9iM2s19aSaUVDHP1DGdkMdeLjjwH1SjhgxPgxNGkoTkN2NoF3V2xO9jOzj
 F0s1TkdvbqCSCOyPi5EncNms2+IYrmlZIbLmv5zA6sCvxTiI31GZWRqQrHf01DQvgGMHi6BG6Qb
 PI2521T2/s8bjUq7kU7qhHOe2H/QYPQIGvEusQviNXuTXGUUYWiGbr3TtnW6t+Uja+0qTgTLzut
 o0k8AipOdiTrbE/ZubZmmLs9JPCjDfLqpW25UR2oEeZrIj+1487frrmK/I6i1F6ufYKIKELxa33
 /2iWXP2xGicMe2aquMVFo3MfeBTHU82IbmogZPZYwXbj5dE
X-Received: by 2002:a05:6000:38e:b0:48d:db77:d119 with SMTP id
 ffacd0b85a97d-48ddb77d2ebmr12191823f8f.2.1791917164877; 
 Tue, 13 Oct 2026 11:46:04 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.72.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de2e2ef2fsm5143180f8f.59.2026.10.13.11.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 11:46:04 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Oct 2026 21:45:58 +0300
Message-ID: <20261013184558.7397-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87cxtgh7kp.fsf@dell.be.48ers.dk>
References: <87cxtgh7kp.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 1/3] package/python-cramjam: new
 package
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 11, 2026 at 1:09 PM, Peter Korsgaard wrote:
>Hi,
>
> >> +++ b/package/python-cramjam/Config.in
> >> @@ -0,0 +1,9 @@
> >> +config BR2_PACKAGE_PYTHON_CRAMJAM
> >> +	bool "python-cramjam"
> >> +	depends on !BR2_ARM_CPU_ARMV5
> 
>> Why? Perhaps you mean BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS?
>
>I saw that you were explicitly not testing with our default armv5
>kernel, so I gave it a try and the code indeed seems to be buggy:
>
>Reading symbols from python3...
>(gdb) run -c 'import cramjam'
>Starting program: /usr/bin/python3 -c 'import cramjam'
>[Thread debugging using libthread_db enabled]
>Using host libthread_db library "/lib/libthread_db.so.1".
>random: python3: uninitialized urandom read (24 bytes read)
>
>Program received signal SIGSEGV, Segmentation fault.
>0xb68e42dc in strcmp () from /lib/libc.so.6
>(gdb) bt
>#0  0xb68e42dc in strcmp () from /lib/libc.so.6
>#1  0xb6ca6584 in _PyImport_ResolveNameWithPackageContext (name=0x0)
>    at Python/import.c:846
>#2  0xb6b7385c in _PyModule_CreateInitialized (module=0xb6701808,
>    module_api_version=<optimized out>) at Objects/moduleobject.c:233
>#3  0xb6348018 in ?? ()
>   from /usr/lib/python3.14/site-packages/cramjam/cramjam.cpython-314-arm-linux-gnueabi.so
>Backtrace stopped: previous frame identical to this frame (corrupt stack?)
>(gdb) random: crng init done
>info registers
>r0             0x0                 0
>r1             0xb670b3d4          3060839380
>r2             0x0                 0
>r3             0x0                 0
>r4             0x0                 0
>r5             0xb670b3cc          3060839372
>r6             0xb6848508          3062138120
>r7             0x8                 8
>r8             0xb6701808          3060799496
>r9             0xbebaa064          3199901796
>r10            0xb6f0d538          3069236536
>r11            0xb6767f48          3061219144
>r12            0xb6ec4a40          3068938816
>sp             0xbeba9e50          0xbeba9e50
>lr             0xb6ca6584          3066717572
>pc             0xb68e42dc          0xb68e42dc <strcmp+84>
>cpsr           0x60000010          1610612752
>
>So presumably something is not initialized to cause this null pointer
>exception. The fact that PyImport_ResolveNameWithPackageContext gets
>called with a null pointer is already odd.
>
>Care to report it upstream? I see that there is in the mean time a 2.13
>release.

I saw a related issue reported with a similar topic that it can't be tested
on 32-bit architectures. This is way I specified depends on !BR2_ARM_CPU_ARMV5,
since at that time I found no other solution. I have tested today and version
2.14.0 (released today) does not have this issue any more, so it runs on armv5.
James Hilliard just send a bump for 2.14.0, so for v5 I will not include this.
Here is the link to the bump:
https://lore.kernel.org/all/20261013164254.1476592-6-james.hilliard1@gmail.com/

Thanks for support,
Flaviu

>
>-- 
>Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
