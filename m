Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D78EC4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 08:26:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85A10601FE
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 08:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85A10601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BFA48322A;
	Wed, 11 Aug 2021 08:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mb_a4ufN-4CB; Wed, 11 Aug 2021 08:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9A0829AF;
	Wed, 11 Aug 2021 08:26:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB6E81BF4E2
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 08:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E826260716
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 08:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJHMPpYXD0TV for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 08:26:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C7966067A
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 08:26:17 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y7so2519197eda.5
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=VhiCy5R0e+wZU1eSjxhhPjk1x6gLSP+B6TYKVx3DA7o=;
 b=Vza/E5teaXIEOWLK7kkzBo95FHfXvs1aV1pJ1i7idEY/thLZ0ftYb9JWPSd+rtQVhm
 v5YJen4VFV1vU1X9a2O7VRbi1jvxYUZwsYhv3Ar8m7ZDlElXpzuc7c1NHwbLhiTPHngF
 AWIXes39awpnXHUDEOC9X+48IMX+r9a6d/KmMIcBEAF0V3L9YpDkuQCcsryNW3Yroxt3
 k5tikF+61M4hbELKjC+OIXLkdM3j0t3z677DI39r78qn9xhJApE5yr5ZBihY5bo3slDk
 saLzAqODhJn+iq5Szgl6l3+KEUDw+9POTNYR1NelNt4X4sVniU+Ftbf5XTjFydEwyJvQ
 zchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=VhiCy5R0e+wZU1eSjxhhPjk1x6gLSP+B6TYKVx3DA7o=;
 b=V6ptGRv6pVQ+VmaEHJtZM6hcbeT8Q8WSR+Wu/7fkM23Ipx16RsL3iD/qRmt46exQRr
 3hR2mLkieceHFZigR8vBo66apgZiuVIuo6DzampLPdYeZQZSdMkq9JxEPfZfF8gQ10D6
 ktp614hvgcylP684GwiLvtrgFXQpXBn90MIZ1xJIggfVAHNf7cFDabJfqRi4IiWH16Ar
 /uTm5OQaxjGIeOlm0N9yoW67UpJrqKlZWLRx3Pmeh5V5HVZ6PzYNgfD/S8ZKuweN9kkS
 ADeZWC+/D9rmCZ605WkRW1BT+yUhQrDSNVFEQksj9SdPKkajsvZM0IaBl/lXh3TL9kI9
 ItSA==
X-Gm-Message-State: AOAM530xKM+QvEDeezoZTZaBX+/fXHu/5veRCeFyNFuK+V/ntAPbqQcn
 oABesQcsRjE4ilcOD2BFKZNTdfpoqph/dg==
X-Google-Smtp-Source: ABdhPJx5YKXVx5IIokaU3O0+DtlJtPotTzmbGXOcBulEDTtqsd7MJGq6JrqabYKTLafYpV0x0M6jMg==
X-Received: by 2002:a05:6402:12c4:: with SMTP id
 k4mr9940749edx.240.1628670375588; 
 Wed, 11 Aug 2021 01:26:15 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id lw22sm7835088ejb.74.2021.08.11.01.26.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 01:26:14 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mDjYy-0008MC-Nc
 for buildroot@buildroot.org; Wed, 11 Aug 2021 10:26:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 10:26:12 +0200
Message-ID: <87pmuk75gb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.4 released
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

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cDovL2J1aWxkcm9vdC5vcmcpLgoKQnVpbGRyb290IDIw
MjEuMDIuNCBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjQudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjAyLjQudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wMi40IGlzIGEgYnVnZml4IHJlbGVhc2Ugb24gdGhlIGN1cnJlbnQgbG9uZyB0ZXJt
CnJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBvcnRhbnQgLyBzZWN1cml0eSByZWxhdGVk
IGlzc3VlcwpkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIxLjAyLjMgcmVsZWFzZS4gTm90aWNlIHRo
YXQgbm8gcmVsZWFzZSB3YXMgbWFkZQppbiBKdWx5LCBzbyB0aGlzIHJlbGVhc2UgaXMgYmlnZ2Vy
IHRoYW4gbm9ybWFsLgoKLSBUb29sY2hhaW46IERpc2FibGUgUElDL1BJRSBmb3IgTWljcm9ibGF6
ZSAobGlrZSBmb3IgTklPUyBJSSkgYXMgaXQgaXMKICBub3QgY3VycmVudGx5IHdvcmtpbmcuCgot
IGJpbnV0aWxzOiBmaXggbGlua2VyIGFzc2VydCBmYWlsdXJlIG9uIE9wZW5SaXNjLCBvcjFrIGJ1
aWxkCiAgaXNzdWUgd2l0aCBnY2MgPCA1CgotIGdkYjogRW5hYmxlIGZvciBOSU9TIElJCgotIFNl
Y3VyaXR5IGZpeGVzIGZvciBhdmFoaSwgZG92ZWNvdCwgZG92ZWNvdC1waWdlb25ob2xlLCBleGl2
MiwKICBmYWlsMmJhbiwgZmV0Y2htYWlsLCBnbGliYywgZ28sIGludGVsLW1pY3JvY29kZSwgbGli
Y3VybCwgbGliZ2NyeXB0LAogIGxpYmtyYjUsIGxpYm1vZHNlY3VyaXR5LCBsaWJ0YXNuMSwgbGli
eG1scnBjLCBsaW51eHB0cCwgbWJlZHRscywKICBtb3NxdWl0dG8sIG5vZGVqcywgcGhwLCBwdXR0
eSwgcHl0aG9uLWRqYW5nbywgcHl0aG9uLXVybGxpYjMsIHFwZGYsCiAgcmVkaXMsIHJ1YnksIHNs
aXJwLCBzcGljZSwgc3VyaWNhdGEsIHRocmlmdCwgdG9yLCB0cG0yLXRvb2xzLAogIHdpcmVzaGFy
aywgd29sZnNzbAoKLSBGaXhlcyBmb3IgZG93bmxvYWQvY29tcGlsYXRpb24vcnVudGltZS9saWNl
bnNlIGlzc3VlcyBpbiBhcGFjaGUsCiAgYXJtLXRydXN0ZWQtZmlybXdhcmUsIGF1ZGl0LCBhdmFo
aSwgYmluZCwgYmludXRpbHMsIGJpcmQsIGJvaW5jLAogIGJ1c3lib3gsIGJsdWV6NV91dGlscywg
Y2hyb255LCBjbGFtYXYsIGNyeXB0c2V0dXAsIGN3aWlkLCBkbnNtYXNxLAogIGRvY2tlci1jbGks
IGRvY2tlci1lbmdpbmUsIGUyZnNwcm9ncywgZmxhYywgZmx1eGJveCwgZ2F3aywgZ2NjLCBnY3Is
CiAgZ2RiLCBnZGstcGl4YnVmLCBnZXNmdHBzZXJ2ZXIsIGdwdGZkaXNrLCBncmFuaXRlLCBncnVi
MiwgZ3VpbGUsCiAgaGRwYXJtLCBpYnJjb21tb24sIGlicmR0biwgaWJyZHRuLXRvb2xzLCBpYnJk
dG5kLCBpcnFiYWxhbmNlLAogIGtlZXBhbGl2ZWQsIGxpYmFzcywgbGliY29uZmlnLCBsaWJmdXNl
MywgbGliZ3RrMywgbGliZ3VkZXYsIGxpYmh0cCwKICBsaWJqc29uLCBsaWJsb2tpLCBsaWJuZHAs
IGxpYm5ldGZpbHRlci1sb2csIGxpYm5mbmV0ZmlsdGVyLCBsaWJuaWNlLAogIGxpYm9kYiwgbGli
b2RiLWJvb3N0LCBsaWJvZGItbXlzcWwsIGxpYm9kYi1wZ3NxbCwgbGlicGNhcCwgbGlicW1pLAog
IGxpYnJlc3NsLCBsaWJyc3ZnLCBsaWJ1Y2ksIGxpbnV4LWZpcm13YXJlLCBsdm0yLCBtYXJpYWRi
LCBtb25vLCBtcGQsCiAgbXBnMTIzLCBtcHYsIG5iZCwgbmVhcmQsIG5ldHNubXAsIG5ldHRsZSwg
bmdpbngtbW9kc2VjdXJpdHksIG5tYXAsCiAgbnRwLCBvcGVubnRwZCwgb3BlbnBnbSwgb3BlbnN3
YW4sIHBhbmdvLCBwaXhtYW4sCiAgcGVybC1jcnlwdC1vcGVuc3NsLXJzYSwgcG9sa2l0LCBwb3N0
Z3Jlc3FsLCBwcm94eWNoYWlucy1uZywgcHl0aG9uLAogIHB5dGhvbi1kYXRhcHJvcGVydHksIHB5
dGhvbi1weXNmdHAsIHB5dGhvbjMsIHNhbWJhNCwgdGNwZHVtcCwgdGZ0cGQsCiAgdG9yLCB2bGMs
IHVib290LCB1Ym9vdC10b29scywgdWNsaWJjLCB1dGlsLWxpbnV4LCB3aXJlbGVzcy1yZWdkYiwK
ICB4YXBwX2ZvbnR0b3NmbnQsIHhsaWJfbGliWDExLCB4bGliX2xpYnhzaG1mZW5jZSwgeHNlcnZl
cl94b3JnLXNlcnZlcgoKRm9yIG1vcmUgZGV0YWlscywgc2VlIHRoZSBDSEFOR0VTIGZpbGU6Cgpo
dHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9wbGFpbi9DSEFOR0VTP2lkPTIwMjEu
MDIuNAoKVXNlcnMgb2YgdGhlIGFmZmVjdGVkIHBhY2thZ2VzIGFyZSBzdHJvbmdseSBlbmNvdXJh
Z2VkIHRvIHVwZ3JhZGUuCgpNYW55IHRoYW5rcyB0byBhbGwgdGhlIHBlb3BsZSBjb250cmlidXRp
bmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zbiAyMDIxLjAyLjMuLgoKICAgIDkz
ICBGYWJyaWNlIEZvbnRhaW5lCiAgICAxOCAgQmVybmQgS3VobHMKICAgIDEzICBQZXRlciBLb3Jz
Z2FhcmQKICAgIDEwICBUaG9tYXMgUGV0YXp6b25pCiAgICAgOCAgR2l1bGlvIEJlbmV0dGkKICAg
ICA3ICBGcmFuY29pcyBQZXJyYWQKICAgICA2ICBQZXRlciBTZWlkZXJlcgogICAgIDUgIFlhbm4g
RS4gTU9SSU4KICAgICA0ICBSb21haW4gTmFvdXIKICAgICAzICBCYXJ1Y2ggU2lhY2gKICAgICAz
ICBKYW1lcyBIaWxsaWFyZAogICAgIDMgIE1pY2hhZWwgTm9zdGhvZmYKICAgICAzICBUaG9tYXMg
RGUgU2NoYW1waGVsZWlyZQogICAgIDMgIFRpdG91YW4gQ2hyaXN0b3BoZQogICAgIDIgIEFkYW0g
RHVza2V0dAogICAgIDIgIEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkKICAg
ICAyICBDaHJpc3RpYW4gU3Rld2FydAogICAgIDEgIEFsZXhhbmRlciBEYWhsCiAgICAgMSAgQWxl
eGV5IE5leW1hbgogICAgIDEgIEFuZHJlYXMgSGlsc2UKICAgICAxICBBbmRyZWFzIE5hdW1hbm4K
ICAgICAxICBBbmRyw6kgWndpbmcKICAgICAxICBBbmR5IFNoZXZjaGVua28KICAgICAxICBBc2Fm
IEthaGxvbgogICAgIDEgIEJydW5vIE1hcmllCiAgICAgMSAgQ2hyaXN0b3BoZSBQcmlvdXplYXUK
ICAgICAxICBEYW5paWwgU3RhcwogICAgIDEgIERhcmlvIEJpbmFjY2hpCiAgICAgMSAgRXJpY28g
TnVuZXMKICAgICAxICBHZW9mZiBMZXZhbmQKICAgICAxICBHd2VuaGFlbCBHb2F2ZWMtTWVyb3UK
ICAgICAxICBIZWlrbyBUaGllcnkKICAgICAxICBIZXJ2ZSBDb2RpbmEKICAgICAxICBIdWJlcnQg
TGFjb3RlCiAgICAgMSAgSm9obiBLZWVwaW5nCiAgICAgMSAgSm9zw6kgUGVra2FyaW5lbgogICAg
IDEgIErDtnJnIEtyYXVzZQogICAgIDEgIEtvcnkgTWFpbmNlbnQKICAgICAxICBNYXhpbSBLb2No
ZXRrb3YKICAgICAxICBNaWNoYWVsIEZpc2NoZXIKICAgICAxICBNaXJ6YSBLYXBldGFub3ZpYwog
ICAgIDEgIFBldHIgVm9yZWwKICAgICAxICBSYXBoYcOrbCBNw6lsb3R0ZQogICAgIDEgIFNlcmdl
eSBNYXR5dWtldmljaAoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
