Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCB9FC97EA
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 19:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 950BB80F33;
	Sun, 29 Mar 2026 19:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIMrM5yp6hm4; Sun, 29 Mar 2026 19:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1713E80F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774812627;
	bh=hVQaSUxwvuzvWDVWjGMrOBJ78x9f7dUs9fnfdy1kUhg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MfPt0gJkClgQGl3Ds84uRKDUY1em80wpWYdRw47E9mOVbWaZOFwPHNftEBkhK779s
	 V3wlbzxRFgSIWVaA17kitz9KCtSYtMHlfatbKiFqvIfNmKKw4rozDENdmFSuB7r36E
	 wBuEZ99FdDvFvlfvvgVAsxrplZZ3YAVIdRdLhp7KmzDYq23QHLEw6v20UU5OtZSPUU
	 TdEk+1ZwnQDWPGq2IEB7jElj25s2Q6JoSdUsf4xWNSmXICX7owgU3EIAwEg92XFUQx
	 vDJLdlUs+7Tx5XHOWS2nYHxYCJjB/w3Jgrz+hEb4YZJKYq41mQpl2oGAsIhELBBFDf
	 nRIIIQEDRc6CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1713E80F12;
	Sun, 29 Mar 2026 19:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A8291D3
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 19:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 107E34023F
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 19:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srG4CYBeM1Ia for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 19:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5372340068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5372340068
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5372340068
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 19:30:25 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-8cfc5941028so696743385a.1
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 12:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774812623; x=1775417423;
 h=mime-version:user-agent:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4eUbFmus8hx897B7SUVtl1zELn3uuAzJ6TvmzBkEYgw=;
 b=K6ke8KTACarCIquWrPcSQMrND6hE/Pru08amlH9L219Q97jOhM1VtuvJ+O/MGvL5IK
 DYELhyea6HK7jZSCvHznNn71HoNJYupIwVBIxlSwI0fPo/lNWTu+AlVWsuxOAmPJfPDo
 qeE2+ZGUL9i1GVJiNb81Q6zFg/H7KCifgm6OCPji0l6bm+YwWHTuxlthIqJtelvhz3y3
 NE5DrGwpnCZOZu6ynMSxzVe1YJ5SzKFK5wQUMPTYqKz68/6iWH0Dzs8PS073IrsDRqOx
 5qBl+B1eRTHKK22FR0x3EWzhC7NLDXmGXGPLzPS9PoTKg4/2wuRk+BXMRbpfG9TGmrXd
 d79w==
X-Gm-Message-State: AOJu0YxZLagoEAz5pmypHNID03qILSDCHJ/LoTFLNSESwjvHaeF/aZ99
 AfZmmSNcr8zWx6quGLJnYkyaKO4NfvT9tcyb0q920MvmYHVRqbnxrxN6WaVLwKq9
X-Gm-Gg: ATEYQzzguFvrebeiI5crKeN9mfboFbo81BGr8SCL/1JGvRNSBNNrpS0tWV600tdWYYy
 SG3T49gK7+tgDNmGy83Y26xDFhIvnAEu8GurCM4kv2jITCXIqt/qhKCYJAOdt9nk46tMHZsRjiS
 WL7RYEhDvxocDoSHrVV375JmkSDnnERDQ3eDVXSOCN10a/9NT6K8NAIAzCWrE3SS63NaXQSCX0G
 O/6n/EzhdRTJTk1WIkhYBAqFHie007pljiyXz9Y2zhbEggl1kVQs7mcsxC4UL2PE5f4p0EQCEpO
 3bZqIpreUpDBxzmIuVjoEQbhh6SwOnUlXkWFZfTLueTnwPhW3XO2RlweQV2dTAqwJeW4YbDM7jv
 jGfq/IMPgFRYkVi62gkuAWCAJhqU/OV8UOSImbCchbHYtQdjXQjAiblH/S+JgYvO3sfJQEA43Cb
 DAk2NnowXZcdRxphRVd5CEgo1fRqY=
X-Received: by 2002:a05:620a:1a22:b0:8cf:d62a:c81a with SMTP id
 af79cd13be357-8d01c5fc276mr1256375585a.31.1774812623203; 
 Sun, 29 Mar 2026 12:30:23 -0700 (PDT)
Received: from adicarlo.nyc ([2603:7000:4000:24ab:21e:4fff:feac:60a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8d027edb7ddsm430644385a.9.2026.03.29.12.30.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 12:30:21 -0700 (PDT)
Received: from sopa (localhost [127.0.0.1])
 by adicarlo.nyc (Postfix) with ESMTP id 0DD5AA9804F
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:30:20 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Mar 2026 15:30:19 -0400
Message-ID: <875x6efn78.fsf@adicarlo.nyc>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774812623; x=1775417423; darn=buildroot.org;
 h=mime-version:user-agent:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eUbFmus8hx897B7SUVtl1zELn3uuAzJ6TvmzBkEYgw=;
 b=D98vMrwcaE91JGNUJj5Cj5eRevIaABpEBV6DHktDI8M31XOiImWd6CtN7JlhLEOWvO
 oGFF5Z0lOYQ/1rB+K+vQbF0ik4Vimfq2SAcgT8+/zkbNM+aELVVF/YmfcxTJNkYjSgVX
 fiB3eGcxcArXl4soy/bPa07vACiK4lFy+ILY/PvU9MMboJHlXl+lq4ld/yZK3ENWzo2k
 wbvQmQBpspPUWyzi+29XYdTyS7hMSQfiHB92UTTtrctOYJCNonUCpQz25rnIdWhxS9y1
 HyHki2CGNoJH3QbrSgjBC1uERgrsdjH83Dj4xAskOGAKMVt/OwXFWcwVlLYEfqsDYH/i
 gh5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=D98vMrwc
Subject: [Buildroot] considering embarking on gstreamer1 upgrade (to 1.28.1)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Buildroot's set of gstreamer1 packages is getting rather long in the
tooth, to wit, 1.24.13.  Specifically I'm finding HEVC support is quite
spotty in this release, in particular, some pixel formats are missing
preventing, for instance, the Raspberry Pi 5 HEVC hardware decoder from
working.

The latest stable is 1.28.1, released 26 February 2026, so that's what
I'm targetting.

If someone else has already started this process or wishes to
contribute, please let me know.  I have a forked project in gitlab where
I can push the work I have so far if anyone is interested.

Alternatively, if anyone thinks I'm wasting my time, please also let me
know!

I'm pretty well setup to test Raspberry Pi 5 and AMD64 / VAAPI for
hardware video support and possible regressions.  I'm not sure if there
are other gotchas I should be aware of....

Anyhow, this is just a heads-up, no action needed by anyone yet. If I'm
successful I should have a patch series ready in a week or so.

-- 
...Adam Di Carlo...<a.p.dicarlo@gmail.com>............................
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
