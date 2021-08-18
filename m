Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A2CC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:26:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A76EF6102A
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 11:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A76EF6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 642D5600B5;
	Wed, 18 Aug 2021 11:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RBzSsMHZPd4; Wed, 18 Aug 2021 11:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A04260656;
	Wed, 18 Aug 2021 11:26:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58A181BF3CD
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5553960656
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 11:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XFQlR_J0fU0P for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 11:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F2AD600B5
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 11:26:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id bo19so2576646edb.9
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 04:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=uATwV0X5CsZMiH+rUZbXicM27nTo6VgmBKq233OfWVo=;
 b=e2YG1l275A8DqewHcx9DNkwwT54TKLY8NerTGvDiEFRWYgckAzzITJvRJB4lzmLgRM
 MC70jdlSZN32bKNu2aHnX27H4g2evjusfnmEJOqCGTjx4Shjd/E8rD+vcZZ6a5FwPK9P
 imHZuf4vtdpLXZcCkAfM00CyJOaOkUZLns0tv6TaTeyU6zz1q/CAh/km6wd81RPeg6KE
 4qLwOgQ0KzXHFAiuhwORMvgcrmGKpwnYImoxXRt9YH1u805ynpag1pxHiFSzizKo83Y+
 JQF1P2BwdkPhjdmX1HDcRcURak6lSEBrhmdZTCodawscCwSjR2JPfaHRAz7qVdfCFCbe
 g5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=uATwV0X5CsZMiH+rUZbXicM27nTo6VgmBKq233OfWVo=;
 b=i4LKED2ZU5Sdfgao/YFgdwTyGNlHaSjAMTNa/Vsa7dTdrs2csaMxtKhRoRjKoRMLSk
 3XDsr+tk+5wGbp+py+KOkzBTFT0pEJtwZB3a2CBVWCVeARfbzzixeryvSXi0uZiBkGLm
 HB0IW/NERNGoPF0s7oGib6InrkjeIePzTI6YwY+XBB1spIY4JDmghd26ZzaQIZF2flV5
 PDs99TSzaf6iIz6s4e5y0xX6rmDUcQzrMlvVjL3nR0ckXUVs9A0gfbZGuM3bWCRqnBTx
 csiwG89DqIQ3yS47lvMT/2iMprt3ToyUIHNR7d5uTk3zBHxlVNlQsITaEpmhbJczbYo/
 Mlow==
X-Gm-Message-State: AOAM533U9VM1JXpS+NkEPqktv8V+ynHDZauySxvgse+WiFJOukQEmnTT
 iJCImrigCP6YYv9U33oB8nvp3tQY2Gs=
X-Google-Smtp-Source: ABdhPJwLtZ8RAR3rSILW8yuOl47blPrzPkqFNMifjPfqkBv4pNR95w/46bqNwhZVhNb19A10bUg1WA==
X-Received: by 2002:a05:6402:2926:: with SMTP id
 ee38mr9538728edb.95.1629285960478; 
 Wed, 18 Aug 2021 04:26:00 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 m12sm1941679ejd.21.2021.08.18.04.25.58 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 04:25:59 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mGJhm-0002fj-3M
 for buildroot@buildroot.org; Wed, 18 Aug 2021 13:25:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Aug 2021 13:25:58 +0200
Message-ID: <87mtpf0zax.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.08-rc2 released
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGksCgpCdWlsZHJvb3QgMjAyMS4wOC1yYzIgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBh
dDoKCmh0dHA6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyMS4wOC1yYzIu
dGFyLmd6CgpvcgoKaHR0cDovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIx
LjA4LXJjMi50YXIuYnoyCgpPciBnZXQgaXQgZnJvbSBHaXQ6CgpnaXQ6Ly9naXQuYnVpbGRyb290
Lm5ldC9idWlsZHJvb3QKCkFub3RoZXIgMiB3ZWVrcywgYW5vdGhlciByZWxlYXNlIGNhbmRpZGF0
ZS4KClBsZWFzZSBnaXZlIGl0IGEgc3BpbiBhbmQgcmVwb3J0IGFueSBwcm9ibGVtcyB0byB0aGUg
bWFpbGluZyBsaXN0IG9yCmJ1ZyB0cmFja2VyLiBNYW55IHRoYW5rcyB0byB0aGUgcGVvcGxlIGNv
bnRyaWJ1dGluZyB0byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjEuMDgtcmMx
Li4KCiAgICA4OCAgRmFicmljZSBGb250YWluZQogICAgMTAgIFBldGVyIEtvcnNnYWFyZAogICAg
IDggIEFzYWYgS2FobG9uCiAgICAgNyAgR2l1bGlvIEJlbmV0dGkKICAgICA2ICBUaG9tYXMgUGV0
YXp6b25pCiAgICAgMyAgSmFtZXMgSGlsbGlhcmQKICAgICAzICBMdWRvdmljIERlc3JvY2hlcwog
ICAgIDIgIEJlcm5kIEt1aGxzCiAgICAgMiAgRnJhbmNvaXMgUGVycmFkCiAgICAgMiAgSm9lbCBT
dGFubGV5CiAgICAgMSAgQWRyaWFuIFBlcmV6IGRlIENhc3RybwogICAgIDEgIEFsZXhhbmRlciBF
Z29yZW5rb3YKICAgICAxICBBbGV4ZXkgTmV5bWFuCiAgICAgMSAgQXJub3V0IFZhbmRlY2FwcGVs
bGUgKEVzc2Vuc2l1bS9NaW5kKQogICAgIDEgIEJhcnRvc3ogQmlsYXMKICAgICAxICBCYXJ1Y2gg
U2lhY2gKICAgICAxICBDaHJpc3RpYW4gU3Rld2FydAogICAgIDEgIENsw6ltZW50IEzDqWdlcgog
ICAgIDEgIEVkZ2FyIEJvbmV0CiAgICAgMSAgRnJhbmsgSHVubGV0aAogICAgIDEgIEt5bGUgSGFy
ZGluZwogICAgIDEgIE1heGltIEtvY2hldGtvdgogICAgIDEgIE1pY2hhZWwgTm9zdGhvZmYKICAg
ICAxICBOb3JiZXJ0IExhbmdlCiAgICAgMSAgUXVlbnRpbiBTY2h1bHoKCkZvciBtb3JlIGRldGFp
bHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxlOgoKaHR0cDovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxk
cm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjEuMDgtcmMyCgotLSAKQnllLCBQZXRlciBLb3JzZ2Fh
cmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3li
b3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
