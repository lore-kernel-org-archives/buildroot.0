Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA65C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C21B60A59;
	Fri,  7 Aug 2026 11:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6LS9j6e6R_Y; Fri,  7 Aug 2026 11:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8013360A52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786103435;
	bh=AuojRxKWSEwKlTb0AX4SHk0R9vQTK9sj6gRbDa5nSGA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Av5vPtQStDq+gBZYwR9RK7oLUSWcJyyJ9JtU0PEnLedTqWKMkK8n46NlEB73tA+p3
	 HTH4n7zJ32IkA3up+ayAmv+cek3vZYOZQ8e0HcPSgTSzeBrISHAiptDjbWMp8kugw1
	 7SeVMM94cirEU8Ya3MuElE+f4XTSwaKMkY0PEb746ADR6i4rc22KwSBrpKBPHMkBI6
	 A0Vtw7G78qxYCtLg3m2u2HliPd6q7oDAQQllYPnbQvRwK2ltTM+e6y9QhYJ46aw835
	 2OtznSd5RX4XjTergyyQBfFycXfCT+hckQfeduxfmDUMhEAL+zT5NLjytZ0JDsTbFQ
	 LIwPUEARGsktg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8013360A52;
	Fri,  7 Aug 2026 11:50:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6A9FD3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C7E58116C
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3R4mRMSoKeSI for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:50:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AEC280ED8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AEC280ED8
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AEC280ED8
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:50:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47c6e9a694bso2044541f8f.1
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 04:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786103430; x=1786708230;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uV9SFkHEVgua+VbWTLDb9QfY8ys7k5R+EcOk6nHyHXA=;
 b=RwWKLlO+iIY2hMqQk536eFZ84aS0RcVNHN978ncjjNepDl6GNXoVYTeMGyr/JWAZ5B
 TLdVjtOlJzq9GnULLa7w5kmLQSMcQzvERXrk8O+XvmeqnOWKVHhfW2L8dA/NPduJFlcO
 asRO55wWMuIKad/XIadLvDK/x1ctREdRe4qKgcEZ3g7v3ugf0WutcIENkrdQkv7nLCnl
 f7iMgglIScEDUaf8k13r8jvjfCct3TOYpYNMj/hdp2DrJQVSLTl0Gc0LVRkqEpzX+eXc
 SiAPilZas+S4U7pnMFRoYB6X8oaPPle0f0e6tVYAwUvqSStU+uphOxi2uyFqkbTYOeeZ
 vMKg==
X-Forwarded-Encrypted: i=1;
 AHgh+RozfS0xy6BbaGXMQXRojLmeqTjlvX2rQLqvG1qfyF4IUvsfvUAWZdBBQ3HXLElVwmwDoF7FnM81js0=@buildroot.org
X-Gm-Message-State: AOJu0Yyy02R0TEk2EmhqfwRsS02IEF4F10q+tSNpLFWsck9EWYFf9uGR
 N84Dr9Rc02/b7C9RmIN/p3O3pEGrPmmeJ9bO8D+R9fzDa/Zq6o8LCzFXG1ckDtq3MD3hrKgenpj
 Jm0L8
X-Gm-Gg: AR+sD12qgTwbfOqLdm31VoKdQ7zYFSuter6ug+u6sEzfzfwMz/z2NPkGiz17LpfTnSh
 Q8ueUEYwhZVNFsjEDujH+ejd7vITEc+hRYGrv7zSlfK8pHCSBhTU2TMicFZRb4Lm+Iq3ahxBiVM
 0Iso1S/OMmtpCEl75JGWf4qN8QH/M3hz0qjkyA/zFFXks/6+kvsM8fsQe0ekMk9tnECArk15bGR
 utdkHyVB9mmVpy09q+uA5L8RnoBpkloNWWsS55jSQz2koURi6Mmhjp4lExFRw87EJtndi3A3mfR
 FrJid8GVEPDt4ecKBJz0kIE4gHCxPARQ5z1Fdnd1NFaXmNlu/f45mubA8DAERBDL63cd/0Ak7zY
 A9MRJeHwmR05XBX5GNptYmthvseEECHgmRHF9Ujzk9GQHW16GhTYFsxFSgljLNM2ArMuROM+Scx
 +tS4816Soit933+Qh8CprVhFNczpfDY6PZ4kSoNvZp3PcoUzNVlqw3sX52HiPed06RUumaawKq3
 iJ7BXPCUQq8Ff7YX+oqVhgiWgN5NNSH7LWAQh+a6KhlfxBw
X-Received: by 2002:a05:6000:18a3:b0:47f:81af:1a3b with SMTP id
 ffacd0b85a97d-47fec63b4dfmr31889867f8f.22.1786103430335; 
 Fri, 07 Aug 2026 04:50:30 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021ec565sm5234516f8f.22.2026.08.07.04.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 04:50:30 -0700 (PDT)
Message-ID: <c6c902d7-0c9a-4e69-9e22-e9c1da22650e@mind.be>
Date: Fri, 7 Aug 2026 13:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260730183524.1145030-1-bernd@kuhls.net>
 <20260730183524.1145030-2-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260730183524.1145030-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786103430; x=1786708230; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uV9SFkHEVgua+VbWTLDb9QfY8ys7k5R+EcOk6nHyHXA=;
 b=RQIUYBX3i2rajZFU5NfgVhFATetksBNCQ0KmGCUiQsj4FTCuL3vVQa4BE2xGOpleMx
 t7JjRUhJgBh6nVE2ddITrB6B4pGreb/l/gNcvn2QSG3o7JovUraB/dE0FmGlnhekiP/y
 QHInpZkhSr7zS/zkvpFNgMS2p9yuQ2kCVbxeZQS/4f/hTBUdtmowjxXUotO481caigmx
 dPehwUTEWxaJJgYI10Wbq/cmlJH9Yb5yv9SuAFa87dR+9IFIdOhcuyrAGTSB7iu2Qu1Y
 wJaOu/2P9qEbg/Z+rNimsxAVmNK6Q247nk0P7ujjP+/Q/5CZ5sJwioBDmgXsydvuOAVG
 N98w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RQIUYBX3
Subject: Re: [Buildroot] [PATCH 2/2] package/php: security bump version to
 8.5.9
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/07/26 20:35, Bernd Kuhls wrote:
> https://www.php.net/ChangeLog-8.php#8.5.9
> https://news-web.php.net/php.announce/500
> https://github.com/php/php-src/blob/php-8.5.9/NEWS
>
> Fixes CVE-2026-17544, CVE-2026-17543, CVE-2026-9672 & CVE-2026-7260.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x, thanks

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
