Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E24C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 09:17:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A1760EC0
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 09:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3A1760EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A1883051;
	Tue, 10 Aug 2021 09:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ARpkscDVEAM; Tue, 10 Aug 2021 09:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 281338316A;
	Tue, 10 Aug 2021 09:17:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2AD31BF308
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 09:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91A364045F
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 09:17:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UGEdHm9HSF1e for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 09:17:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42F03403F5
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 09:17:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b11so9149040wrx.6
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=nrd4yJqTUrVxwByyPZkBUQdgqLjahd4eoIbGoT04VxA=;
 b=J5VcE5VVMKLdgIg+mtliEsm8aBU+bnWzW5EoZw1NvZ3fXXIXic5A8WYU+7EmMnmdh5
 tvAaCkunmf9m1Wp+mJPu8rjk/NHyHwMPu5sHgiuXCWMhmE/XBYO/lx4p3F5rx30zgpOP
 5XIoHHYwpotIDKHQUsEDZq5h5kHHQ1DfJ9waKZfAr0uT5EKa7idhWYOantM9IvyYb7v0
 +f9laFUokW/FS4wOS3G5KWZGZArq4UA+eArgjssM2w39veITk/V3+kLuezWRwHWTjIhM
 cHEc9Lc+Lm7l+nyD8wg5yFa/OQWibDFTs1woRskBXr+vtUWpYT1eSZmBOoeTnbz49463
 zXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=nrd4yJqTUrVxwByyPZkBUQdgqLjahd4eoIbGoT04VxA=;
 b=b3cmLKlZN9QSvZsfkGh3LBPPX2n95wwcxJrKmBbf18P+3o4/7fUQZPeoptuc4rOIxA
 rSi2xN1KOiu2bUV78PVjVEr1SPOCkQF+fZ9icJd98yj1CzAMBTUsuPnf0n0lOOl1HiTp
 Wp2ICKra465j/o2QVBlsrZj36k7A1huvc090eixU0YPhwxbxT88mKcCD4wsvVaLGPFfj
 Onbl/un/9+JZKem3KW0JtlgcLifF+hL6lsdxYRsS5eMP+y36NMWKdFIhFkKytrfQSyJJ
 N4gQPAaJxnj2gTt4MWPDHEEmjkbrQ/5tWB6YUXC0ROcbW/qgWDWVSK55Fv7FAka2xCo1
 W4tw==
X-Gm-Message-State: AOAM530jAPKCM7R9fdCB1OflYgJRASFTYjxe2xiBenHXwYqMsN5z7rto
 At6IAjw+hfPpseExNc8H1VEphg0UD/FoRQ==
X-Google-Smtp-Source: ABdhPJzQr/4bhVVrPPiDAmd6t7IE//bp7o9N8hjxZ+TSThgQs8GTIhuJP28zmcIdh1yrTxAb4dyeLg==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr16191995wrw.412.1628587042408; 
 Tue, 10 Aug 2021 02:17:22 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id r8sm11776544wrj.11.2021.08.10.02.17.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:17:21 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mDNsu-0004L8-9t
 for buildroot@buildroot.org; Tue, 10 Aug 2021 11:17:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 11:17:20 +0200
Message-ID: <87v94d7j6n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.05.1 released
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
MjEuMDUuMSBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoKaHR0cDovL2J1aWxkcm9v
dC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA1LjEudGFyLmd6CgpvcgoKaHR0cDovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDIxLjA1LjEudGFyLmJ6MgoKT3IgZ2V0
IGl0IGZyb20gR2l0OgoKZ2l0Oi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290CgpCdWlsZHJv
b3QgMjAyMS4wNS4xIGlzIGEgYnVnZml4IHJlbGVhc2UsIGZpeGluZyBhIG51bWJlciBvZiBpbXBv
cnRhbnQgLwpzZWN1cml0eSByZWxhdGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDIx
LjA1IHJlbGVhc2UuCgotIFRvb2xjaGFpbjogRGlzYWJsZSBQSUMvUElFIGZvciBNaWNyb2JsYXpl
IChsaWtlIGZvciBOSU9TIElJKSBhcyBpdCBpcwogIG5vdCBjdXJyZW50bHkgd29ya2luZy4KCi0g
YmludXRpbHM6IGZpeCBsaW5rZXIgYXNzZXJ0IGZhaWx1cmUgb24gT3BlblJpc2MsIG9yMWsgYnVp
bGQKICBpc3N1ZSB3aXRoIGdjYyA8IDUKCi0gZ2RiOiBFbmFibGUgZm9yIE5JT1MgSUkKCi0gU2Vj
dXJpdHkgZml4ZXMgZm9yIGF2YWhpLCBjb25ubWFuLCBkb3ZlY290LCBkb3ZlY290LXBpZ2Vvbmhv
bGUsIGV4aXYyLAogIGZhaWwyYmFuLCBmZXRjaG1haWwsIGdsaWJjLCBnbywgaW50ZWwtbWljcm9j
b2RlLCBsaWJjdXJsLCBsaWJnY3J5cHQsCiAgbGlia3JiNSwgbGlibW9kc2VjdXJpdHksIGxpYnRh
c24xLCBsaWJ4bWxycGMsIGxpbnV4cHRwLCBtYmVkdGxzLAogIG1vc3F1aXR0bywgbm9kZWpzLCBw
aHAsIHB1dHR5LCBweXRob24tZGphbmdvLCBweXRob24tdXJsbGliMywgcXBkZiwKICByZWRpcywg
cnN5bmMsIHJ1YnksIHNsaXJwLCBzcGljZSwgc3F1aWQsIHN1cmljYXRhLCB0aHJpZnQsIHRvciwK
ICB0cG0yLXRvb2xzLCB3aXJlc2hhcmssIHdvbGZzc2wKCi0gRml4ZXMgZm9yIGRvd25sb2FkL2Nv
bXBpbGF0aW9uL3J1bnRpbWUvbGljZW5zZSBpc3N1ZXMgaW4KICBhcm0tdHJ1c3RlZC1maXJtd2Fy
ZSwgYXVkaXQsIGJpbnV0aWxzLCBidXN5Ym94LCBjaHJvbnksIGNyeXB0c2V0dXAsCiAgZG9ja2Vy
LWNsaSwgZG9ja2VyLWVuZ2luZSwgZTJmc3Byb2dzLCBmZm1wZWcsIGZsYWMsIGZsdXhib3gsIGdh
d2ssCiAgZ2NjLCBnY3IsIGdkYiwgZ2RrLXBpeGJ1ZiwgZ2VzZnRwc2VydmVyLCBncHRmZGlzaywg
Z3Jhbml0ZSwgZ3J1YjIsCiAgZ3VpbGUsIGhkcGFybSwgaHRvcCwgaWJyY29tbW9uLCBpYnJkdG4s
IGlicmR0bi10b29scywgaWJyaWR0bmQsCiAgaXJxYmFsYW5jZSwga2VlcGFsaXZlZCwga2V4ZWMt
dG9vbHMsIGxpYmFzcywgbGliY29uZmlnLCBsaWJmdXNlMywKICBsaWJndGszLCBsaWJndWRldiwg
bGliaHRwLCBsaWJpbnB1dCwgbGlianNvbiwgbGlia3JiNSwgbGlibG9raSwKICBsaWJuZHAsIGxp
Ym5ldGZpbHRlci1sb2csIGxpYm5mbmV0bGluaywgbGlibmljZSwgbGlib2RiLCBsaWJvZGItYm9v
c3QsCiAgbGlib2RiLW15c3FsLCBsaWJvZGItcGdzcWwsIGxpYnBjYXAsIGxpYnFtaSwgbGlicXJ0
ci1nbGliLCBsaWJyZXNzbCwKICBsaWJyc3ZnLCBsaWJ1Y2ksIGx2bTIsIG1hcmlhZGIsIG1lc2Ez
ZCwgbW9ubywgbXBkLCBtcGcxMjMsIG1wdiwgbmJkLAogIG5ldHNubXAsIG5ldHRsZSwgbm1hcCwg
bnRwLCBvcGVubnRwZCwgb3BlbnBnbSwgb3BlbnN3YW4sIHBhbmdvLAogIHBlcmwtY3J5cHQtb3Bl
bnNzbC1yc2EsIHBpeG1hbiwgcG9sa2l0LCBwb3N0Z3Jlc3FsLCBwcm94eWNoYWlucy1uZywKICBw
eXRob24sIHB5dGhvbi1kYXRhcHJvcGVydHksIHB5dGhvbi1weXNmdHAsIHB5dGhvbjMsIHNhbWJh
NCwKICBzYW5lLWJhY2tlbmRzLCB0Y3BkdW1wLCB0ZnRwZCwgdWJvb3QsIHVib290LXRvb2xzLCB3
aXJlbGVzcy1yZWdkYiwKICB4YXBwX2ZvbnR0b3NmbnQsIHhsaWJfbGliWDExLCB4c2VydmVyX3hv
cmctc2VydmVyCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmlsZToKCmh0dHBz
Oi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3BsYWluL0NIQU5HRVM/aWQ9MjAyMS4wNS4x
CgpVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJlIHN0cm9uZ2x5IGVuY291cmFnZWQg
dG8gdXBncmFkZS4KCk1hbnkgdGhhbmtzIHRvIGFsbCB0aGUgcGVvcGxlIGNvbnRyaWJ1dGluZyB0
byB0aGlzIHJlbGVhc2U6CgpnaXQgc2hvcnRsb2cgLXNuIDIwMjEuMDUuLgogICAgOTUgIEZhYnJp
Y2UgRm9udGFpbmUKICAgIDE5ICBCZXJuZCBLdWhscwogICAgMTUgIFBldGVyIEtvcnNnYWFyZAog
ICAgMTAgIFRob21hcyBQZXRhenpvbmkKICAgICA3ICBGcmFuY29pcyBQZXJyYWQKICAgICA3ICBQ
ZXRlciBTZWlkZXJlcgogICAgIDYgIEdpdWxpbyBCZW5ldHRpCiAgICAgNSAgWWFubiBFLiBNT1JJ
TgogICAgIDQgIFJvbWFpbiBOYW91cgogICAgIDMgIEJhcnVjaCBTaWFjaAogICAgIDMgIENocmlz
dGlhbiBTdGV3YXJ0CiAgICAgMyAgSmFtZXMgSGlsbGlhcmQKICAgICAzICBNaWNoYWVsIE5vc3Ro
b2ZmCiAgICAgMyAgVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUKICAgICAzICBUaXRvdWFuIENocmlz
dG9waGUKICAgICAyICBBZGFtIER1c2tldHQKICAgICAyICBBcm5vdXQgVmFuZGVjYXBwZWxsZSAo
RXNzZW5zaXVtL01pbmQpCiAgICAgMiAgSm9obiBLZWVwaW5nCiAgICAgMSAgQWxleGV5IE5leW1h
bgogICAgIDEgIEFuZHJlYXMgSGlsc2UKICAgICAxICBBbmRyZWFzIE5hdW1hbm4KICAgICAxICBB
bmRyw6kgWndpbmcKICAgICAxICBBbmR5IFNoZXZjaGVua28KICAgICAxICBBc2FmIEthaGxvbgog
ICAgIDEgIEJydW5vIE1hcmllCiAgICAgMSAgQ2hyaXN0b3BoZSBQcmlvdXplYXUKICAgICAxICBE
YW5paWwgU3RhcwogICAgIDEgIERhcmlvIEJpbmFjY2hpCiAgICAgMSAgRXJpY28gTnVuZXMKICAg
ICAxICBHZW9mZiBMZXZhbmQKICAgICAxICBHd2VuaGFlbCBHb2F2ZWMtTWVyb3UKICAgICAxICBI
ZWlrbyBUaGllcnkKICAgICAxICBIZXJ2ZSBDb2RpbmEKICAgICAxICBIdWJlcnQgTGFjb3RlCiAg
ICAgMSAgSm9zw6kgUGVra2FyaW5lbgogICAgIDEgIErDtnJnIEtyYXVzZQogICAgIDEgIEtvcnkg
TWFpbmNlbnQKICAgICAxICBNYXhpbSBLb2NoZXRrb3YKICAgICAxICBNaWNoYWVsIEZpc2NoZXIK
ICAgICAxICBNaXJ6YSBLYXBldGFub3ZpYwogICAgIDEgIFBldHIgVm9yZWwKICAgICAxICBSYXBo
YcOrbCBNw6lsb3R0ZQogICAgIDEgIFNlcmdleSBNYXR5dWtldmljaAoKLS0gCkJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
