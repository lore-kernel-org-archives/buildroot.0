Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E889AC79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 296B280FA2;
	Fri,  4 Sep 2026 16:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XguZFzxWDqpc; Fri,  4 Sep 2026 16:14:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E7CC580FA3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538488;
	b=kw6YbaWInyawxkC2i8OVdRp+Hgiy5ITFB6FZMwPYS+nxNXLaXWg4G7T58GGC3SsRgPmA
	 AupAV9xXsDdxERF+sLDObrsouC1+PoXbE3A/GjYDxJd6gnyIUrjqfmcHC7PtvdNce0hZ0
	 rQqt9PW+DDvpqQLau2aedK6Zxt75HFFaMr9mUMBlsPYAlU8UZqyh+FUqlVkOmT2C9Q/I8
	 P9BBpVUEzK4fOFpRXPUoc260ZvepmPfF1EHGsgw91IStnRmuENNokCui4GK9Z4ENf0bDf
	 waZmlvksjHeYDfRfRp2+s5K/k92bhH6oLENVC1qm2CVVh2HY9bU0Hg5cvtBoQ7+j9mA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:User-Agent:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=beu3vAXbC4xGyHyKC/BtAnIA3n5LnwuFd78LPxXAv6Y=;
	b=PqWPxhE/mGhucUznKXg2BrouLRkZ7wEEifYI+QpR2FRkJPHmll/xXIEJ05UtcCGOpss8
	 6dau9/LkbvHA9EO1DiRYZ9oA9Uceo/K7wRrMEo1oaVCBmgk+kbDZ17tgz4fH5EMkvrX3v
	 g8EjNpHdpc6Eknabjk89grvMc5G7qNKjTuzUnOOaWXv6o+/Sqpu5TGO30QDX3QberUD06
	 0w7sRrKo5DTnBO2liibM9TDNU9DxCOPqSNMkFN5RUaML+3iIfeZu3y612jPR4AINQ3tJe
	 3AeyfeVVptOw3ePKYuiK4SoM65gUhyVY+hn11iLMLBsQtdqStfYJgVEHc4peNrdhJqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538488;
	bh=beu3vAXbC4xGyHyKC/BtAnIA3n5LnwuFd78LPxXAv6Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B3j83Ej11D88gWz4Ndx/KV86cn8OXH0tTdMDer0lJX6tX1QE3KBvZpONfEqV4R6nE
	 ra4uVTGTFsXeJy27YGCsaa4oTiTugrLkIEIWda4RVb/uo9tS5zjLXWW2q6nZ6+R7KM
	 Mv5+5Gr9IYgmzO2MtofD3Cn0wzgYCDhn49ffwJXu5SarICSjqfZMPo66VWEyRrrOGB
	 eoKah0WTP5nKFNvw0v/wi2xthT6RDPZd+xwHwAivmydxkX9a5vyaGvjvh/juIyfSju
	 0+5C9grzf3Ex/Ngv4vk466jfhM+gI4UNwiOB5ZgqW+C8C+sDmcjKThhT/3CgOfTaVj
	 gZt6ZtMAdJUpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7CC580FA3;
	Fri,  4 Sep 2026 16:14:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD48B2FD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF5D0407C6
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87R7iH-x-cZh for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:14:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5289D407AD
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538485;
 b=Kro6CehxKQ8WGD+Duv/2pT4Mc20Hs6l5d5F8Wq3iCU5TWZ14jZy7hVhp5gb/ht0P5r7I
 rFUwQXdOVVxdt2V9By1PhNTlDfPlIaIzuLYqkooV3Glo0VXNJGDl8uz50HA6iR1YFODZU
 i24GYA7ur7xYzEreJYjQ/x+qGzCmqTPjgviHobHFBHjunfDkOoweS8zuIZGxwRgXtAkvC
 4qmq/klYlhWrme6gWLqMapt3bevNrTmj6gxGFJ4nzbcLeHayrzJ5G5QD9TVlEN+9fgvpg
 MHupS8YzcWsjpuEFiYV/gi+3C7qG1Ic3K05vVVOquet/+RFfdBsJzcn3jk83U8JgcqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538485;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Subject:Date:Message-ID:User-Agent:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=n7Jr4VtVzoFreU8FjMALO96exkcYsQZpkWJ1FWhgXdQ=;
 b=B2+dSeuBVOoBFydkpgOY2vLIoMiTA/Bb9fXarEKGQX3CT1McG9iDiTvA4SaSp0RJS3Dn
 i9VWtQTiNGdYFjqfjT4nl+qG0fRUtAd4x7ayf6o0MRIGeP3QhgmVSZAb7lmItL1Ousd/5
 2/ad3gQuDJqARS6xSMU0MpCG0LFIYLJ+asqkmpWSGytzsY1H8XGwsvZv7/dq9NQTgDqS6
 yMCtoaYWPBIJH0mfbHtxHatFbr4gNE2lIrAWjiDXPTHflb0Hxbg9BmkUUZFxRjVN1Q3/g
 vSEDiCEoEiGmbKG+d5bhLPh2Jq+HSxRqBtFerXWyaYIoLg6VAMpvZhBmEYfLT13pd6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=SIb7cjQs; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=SIb7cjQs
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5289D407AD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:14:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=SIb7cjQsAsRTrhkyYnRhimG/JIt1zR5YEonXticTIWMcQLAMb1YbCuGicqrzd1WfBYDwG5bT0qS+P9uH1kpJmccq8bi21LAL4XeKEhIiyTNT+YE/RNGYhkLqHPInpKo3smI92FY/rYmPkukLnfcB1qOc5qDLwbTXzWhXnafGWDwJtIpVQ5fK07+7yAPqoMPgEqpap6sY8/jED7mq0PliEY0CkQhLYYWOoQ9hnUkJfpsa/5gPacHkIMbS0s8CAm8Muoidke3caM/UkjYAdmPutXhVqWLDHTgBXBzhuWgFfdQm0tve1GnTXNL2LpiqjZ8SwI6r3h2WGCrec0qoRHs1PQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=EZR9sKGwM2bMGxKl7e/Hk7RMx4wmxh2ihBmPlp+icWY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -375560462
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 16:14:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1x2WYk-00000007aL1-2Wbt
 for buildroot@buildroot.org; Fri, 04 Sep 2026 18:14:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 04 Sep 2026 18:14:34 +0200
Message-ID: <878q5hf0yd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2026.08 released
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgMjAyNi4wOCBpcyByZWxlYXNlZCAtIEdvIGRvd25sb2FkIGl0IGF0OgoK
aHR0cHM6Ly9idWlsZHJvb3QubmV0L2Rvd25sb2Fkcy9idWlsZHJvb3QtMjAyNi4wOC50YXIuZ3oK
Cm9yCgpodHRwczovL2J1aWxkcm9vdC5uZXQvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI2LjA4LnRh
ci54egoKT3IgZ2V0IGl0IGZyb20gR2l0OgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290LmdpdCAoMjAyNi4wOCB0YWcpCgpQbGVhc2UgZ2l2ZSBpdCBhIHNwaW4gYW5k
IHJlcG9ydCBhbnkgcHJvYmxlbXMgdG8gdGhlIG1haWxpbmcgbGlzdCBvcgpidWcgdHJhY2tlci4K
CkEgbGl0dGxlIGxlc3MgYWN0aXZpdHkgdGhpcyBjeWNsZSwgYnV0IHN0aWxsIGNsb3NlIHRvIDEw
MDAgY2hhbmdlcyBmcm9tCjEwMCB1bmlxdWUgY29udHJpYnV0b3JzLiBJJ20gb25jZSBhZ2FpbiB2
ZXJ5IGhhcHB5IHRvIHNlZSBzbyBtYW55ICJuZXciCnBlb3BsZSBuZXh0IHRvIHRoZSAib2xkdGlt
ZXJzIi4KCk9mIG5vdGV3b3J0aHkgbmV3IGZlYXR1cmVzL2NoYW5nZXMgd2UgaGF2ZToKCi0gQXJj
aGl0ZWN0dXJlOiBTdXBwb3J0IGZvciBNNjhLIG5vbW11IGFiZCBJQk0gUG93ZXIgMTAvMTEgdmFy
aWFudHMKCi0gVG9vbGNoYWluOiBTdXBwb3J0IGZvciBMaW51eCA3LjEueCBoZWFkZXJzLCBCaW51
dGlscyAyLjQ2LjEsIEdDQwogIDE2LjIuMCwgbm93IGRlZmF1bHRzIHRvIEdDQyAxNS4gR2xpYmMg
Mi40NCBhbmQgdUNsaWJjLW5nIDEuMC41OS4KCi0gTWlzYzogSW5mcmFzdHJ1Y3R1cmUgZm9yIHBh
Y2thZ2VzIHdyaXR0ZW4gaW4gdGhlIGhhcmUgcHJvZ3JhbW1pbmcKICBsYW5ndWFnZS4gVmlydHVh
bCBwYWNrYWdlIGZvciBsaWJ1ZGV2LgoKLSBOZXcgZGVmY29uZmlnczogUUVNVSBQUEM2NExFIFBv
d2VybnYxMCAvIFBvd2VybnYxMQoKLSBSZW1vdmVkIGRlZmNvbmZpZ3M6IEFjbWVzeXN0ZW1zIGFy
aWEvYXJpZXR0YSBnMjUsIEF2bmV0IFM2TFg5CiAgTWljcm9ib2FyZCwgVGVjaG5vbG9naWMgVFMt
NDkwMCAvIFRTLTU1MDAKCi0gTmV3IHBhY2thZ2VzOiBhZ2VjLCBjcHAtYXJncGFyc2UsIGRyb2dv
biwgZHR1aSwgaGFyZSwgaGFyZWMsCiAgaGFyZS1kYnVzLCBoYXJlLWV2LCBoYXJlLXhtbCwgbGli
Y3BwY29ubm1hbiwgbGlibGMzLCBsaWJ1ZGV2LAogIGxpYnVkZXYtemVybywgcGVybC1jZ2ksIHBl
cmwtY2dpLXNlc3Npb24sIHBlcmwtbG9nLW1lc3NhZ2UsCiAgcGVybC1sb2ctbWVzc2FnZS1zaW1w
bGUsIHBlcmwtc3dpdGNoLCBweXRob24tbGlieWFuZywgcHl0aG9uLXN5c3YtaXBjLAogIHFiZSwg
cWVtdS14ZW4sIHF0NmdycGMsIHF0NnBvc2l0aW9uaW5nLCBzY2RvYywgc2RsMywgc2RsM19nZngs
CiAgc2RsM19pbWFnZSwgc2RsM190dGYsIHNpZ3N1bS1jLCB2aXJnbHJlbmRlcmVyLCB3Z2V0MgoK
LSBSZW1vdmVkIHBhY2thZ2VzOiBhcmdwYXJzZSwgdHM0OTAwLWZwZ2EKCkFuZCB0aGUgdXN1YWwg
cGFja2FnZSB2ZXJzaW9uIHVwZGF0ZXMgYW5kIGJ1ZyBmaXhlcy4gU2VlIHRoZSBDSEFOR0VTCmZp
bGUgZm9yIGRldGFpbHM6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS9ibG9iLzIwMjYuMDgvQ0hBTkdFUwoKTWFueSB0aGFua3MgdG8gdGhlIHBlb3BsZSBjb250
cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgoKZ2l0IHNob3J0bG9nIC1zIC1uIDIwMjYuMDUuLgoK
ICAgMzE1CUJlcm5kIEt1aGxzCiAgICA0OAlQZXRlciBLb3JzZ2FhcmQKICAgIDQzCVRob21hcyBQ
ZXRhenpvbmkKICAgIDM3CUZpb25hIEtsdXRlCiAgICAzMglKdWxpZW4gT2xpdmFpbgogICAgMzEJ
RGFyaW8gQmluYWNjaGkKICAgIDMxCVJvbWFpbiBOYW91cgogICAgMjYJVGhvbWFzIFBlcmFsZQog
ICAgMjMJR2l1bGlvIEJlbmV0dGkKICAgIDIzCVlhbm4gRS4gTU9SSU4KICAgIDIxCVdhbGRlbWFy
IEJyb2Rrb3JiCiAgICAxOQlOZWFsIEZyYWdlcgogICAgMTgJRmlvbmEgS2x1dGUgKE90aGVybW8g
R21iSCkKICAgIDE4CUZyYW5jb2lzIFBlcnJhZAogICAgMTQJQW5kcmVhcyBNb2hyCiAgICAxMwlB
cm5vdXQgVmFuZGVjYXBwZWxsZQogICAgMTEJSm9zZXBoIEtvZ3V0CiAgICAxMAlBa2hpbGVzaCBO
ZW1hCiAgICAxMAlTw6liYXN0aWVuIFN6eW1hbnNraQogICAgIDkJTWljaGFlbCBOb3N0aG9mZgog
ICAgIDkJU2h1YmhhbSBDaGFrcmFib3J0eQogICAgIDgJSm9hY2hpbSBXaWJlcmcKICAgICA4CVN0
ZWZhbiBNw7xsbGVyCiAgICAgOAlUaXRvdWFuIENocmlzdG9waGUKICAgICA3CUphbWVzIEhpbGxp
YXJkCiAgICAgNglKb2huIEVybmJlcmcKICAgICA2CVRob21hcyBEZXZvb2dkdAogICAgIDUJQWxl
eGlzIExvdGhvcsOpCiAgICAgNQlBbHNleSBDb2xlbWFuIE1pbGxlcgogICAgIDUJRGVpdmlkYXMg
UHVwbGF1c2thcwogICAgIDUJTWFudWVsIERpZW5lcgogICAgIDUJTWF4aW0gS29jaGV0a292CiAg
ICAgNQlNYXhpbWUgTGVyb3kKICAgICA1CVZpbmNlbnQgU3RlaGzDqQogICAgIDQJQWRhbSBEdXNr
ZXR0CiAgICAgNAlBbGV4YW5kZXIgU2hpcm9rb3YKICAgICA0CUZsb3JpYW4gTGFyeXNjaAogICAg
IDQJTWF0dGlhIE5hcmR1Y2NpCiAgICAgNAlNaWNoYWVsIEZpc2NoZXIKICAgICA0CU5pY29sYXMg
Q2F2YWxsYXJpCiAgICAgNAlRdWVudGluIFNjaHVsegogICAgIDQJWWVnb3IgWWVmcmVtb3YKICAg
ICAzCUFuZHJlYXMgWmllZ2xlcgogICAgIDMJSmFuIEhhdnJhbgogICAgIDMJUm9iZXJ0IFAuIEou
IERheQogICAgIDMJWHVrYWkgV2FuZwogICAgIDIJQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJv
b3QKICAgICAyCUJhcnVjaCBTaWFjaAogICAgIDIJQ2hyaXN0b3BoZXIgT2JiYXJkCiAgICAgMglF
ZGdhciBCb25ldAogICAgIDIJRnJhbmNpc3playBTdGFjaHVyYQogICAgIDIJSm9lbCBTdGFubGV5
CiAgICAgMglKb24gSGVucmlrIEJqw7hybnN0YWQKICAgICAyCUpvc8OpIEx1aXMgU2FsdmFkb3Ig
UnVmbwogICAgIDIJTWFyY2luIE5pZXN0cm9qCiAgICAgMglNYXR0aWFzIFdhbHN0csO2bQogICAg
IDIJUGV0ciBWb3JlbAogICAgIDIJUGhpbGlwcGUgTU9OVENITwogICAgIDIJU2NvdHQgRmFuCiAg
ICAgMglWaW5jZW50IEphcmRpbgogICAgIDEJQWRhbSBGb3JkCiAgICAgMQlBZHJpYW4gUGVyZXog
ZGUgQ2FzdHJvCiAgICAgMQlBbGVzc2FuZHJvIFJ1YmluaQogICAgIDEJQWxleGFuZGVyIEVnb3Jl
bmtvdgogICAgIDEJQW5kcmVhIFJpY2NoaQogICAgIDEJQW5nZWxvIENvbXBhZ251Y2NpCiAgICAg
MQlCZW5qYW1pbiBEZUNhbXAKICAgICAxCUJlcm5hcmQgR2F1dGllcgogICAgIDEJQ2hlbiBQZWkK
ICAgICAxCUNocmlzdGlhbiBTdGV3YXJ0CiAgICAgMQlEYW5pZWwgQ3Jvd2UKICAgICAxCURhbmll
bCBIb3VjawogICAgIDEJRGFuaWVsIFBhbG1lcgogICAgIDEJRG93YW4gR3VsbGllbnQKICAgICAx
CURvd2FuIEd1bGxpZW50IHZpYSBidWlsZHJvb3QKICAgICAxCUZlbmd3ZWkgVGFuCiAgICAgMQlG
aW9uYSBLbHV0ZSAob3RoZXJtbyBHbWJIKQogICAgIDEJRmxhdml1IE5pc3RvcgogICAgIDEJRnJh
bmsgVmFuYmV2ZXIKICAgICAxCUZyZWQgTGVmcmFuYwogICAgIDEJSmFjayBSdWJhY2hhCiAgICAg
MQlKYWNrIFdlYXJkZW4KICAgICAxCUphbiDEjGVybcOhawogICAgIDEJSmFya2tvIFNha2tpbmVu
CiAgICAgMQlKZWFuLU1pY2hlbCBIYXV0Ym9pcwogICAgIDEJSmltbXkgRHVyYW5kIFdlc29sb3dz
a2kKICAgICAxCUtvbnN0YW50aW4gTWVueWFldgogICAgIDEJTGF1cmVudCBQaW5jaGFydAogICAg
IDEJTHVjYSBDZXJlc29saQogICAgIDEJTWF0dGhldyBXZWJlcgogICAgIDEJTWljaGVsZSBDb21p
Z25hbm8KICAgICAxCU5lYWwgRnJhZ2VyIHZpYSBidWlsZHJvb3QKICAgICAxCVBlZHJvIEFndWls
YXIKICAgICAxCVJhcGhhw6tsIEdhbGxhaXMtUG91CiAgICAgMQlSb3kgS29sbGVuIFN2ZW5kc2Vu
CiAgICAgMQlTZWJhc3RpYW4gTWljaGVsCiAgICAgMQlTZXJnZXkgQm9icmVub2sKICAgICAxCVRo
b21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9vdAogICAgIDEJVGl0b3VhbiBDaHJpc3RvcGhlIHZpYSBi
dWlsZHJvb3QKICAgICAxCVZpYWNoZXNsYXYgQm9jaGFyb3YKCkFuZCBhIHNwZWNpYWwgdGhhbmtz
IHRvIG91ciBwYXRjaCByZXZpZXdlcnMgKHdlIG5lZWQgbW9yZSEpOgoKZ2l0IGxvZyAtLW5vLW1l
cmdlcyAtLWdyZXAgJyhSZXZpZXdlZHxBY2tlZCktYnk6JyAtRSAtaSBcCiAgLS1mb3JtYXQ9IiUo
dHJhaWxlcnM6dmFsdWVvbmx5PXRydWUsa2V5PVJldmlld2VkLWJ5LGtleT1BY2tlZC1ieSklLUMo
KSIgXAogIDIwMjYuMDUuLiB8IHNvcnQgfCB1bmlxIC1jIHwgc29ydCAtbnIKCiAgICAgIDUgUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CiAgICAgIDQgVmluY2VudCBKYXJkaW4g
PHZqYXJkaW5AZnJlZS5mcj4KICAgICAgMyBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRl
PgogICAgICAyIFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
CiAgICAgIDIgUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+CiAgICAgIDIgTGF1cmVu
dGl1IE1paGFsY2VhIDxsYXVyZW50aXUubWloYWxjZWFAbnhwLmNvbT4KICAgICAgMSBUSUFOIFl1
YW5oYW8gPHRpYW55dWFuaGFvM0AxNjMuY29tPgogICAgICAxIFRob21hcyBQZXJhbGUgPHRob21h
cy5wZXJhbGVAbWluZC5iZT4KICAgICAgMSBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPgogICAgICAxIE5lYWwgRnJhZ2VyIDxuZWFsLmZyYWdlckBhbWQuY29tPgogICAg
ICAxIE1heGltIEtvY2hldGtvdiA8Zmlkb19tYXhAaW5ib3gucnU+CiAgICAgIDEgS2llcmFuIEJp
bmdoYW0gPGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb20+CiAgICAgIDEgSm9hY2hpbSBX
aWJlcmcgPHRyb2dsb2JpdEBnbWFpbC5jb20+CiAgICAgIDEgQXJub3V0IFZhbmVjYXBwZWxsZSA8
YXJub3V0QHJub3V0LmJlPgogICAgICAxIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAcm5v
dXQuYmU+CiAgICAgIDEgQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
PgogICAgICAxIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKVGhl
IG5leHQgcmVsZWFzZSB3aWxsIGJlIDIwMjYuMTEuIEV4cGVjdCB0aGUgZmlyc3QgcmVsZWFzZSBj
YW5kaWRhdGUgYXQKdGhlIGJlZ2lubmluZyBvZiBOb3ZlbWJlciBhbmQgdGhlIGZpbmFsIHJlbGVh
c2UgYXQgdGhlIGVuZCBvZiB0aGUgbW9udGguCgpUaGlzIHJlbGVhc2Ugd2lsbCBiZSBzdXBwb3J0
ZWQgd2l0aCBzZWN1cml0eSBhbmQgb3RoZXIgaW1wb3J0YW50IGZpeGVzCnVudGlsIDIwMjYuMTEu
MSBpcyBvdXQuIEZvciBsb25nZXIgc3VwcG9ydCBjb25zaWRlciB0aGUgMjAyNS4wMi54IExUUwpz
ZXJpZXMgaW5zdGVhZCAoc3VwcG9ydGVkIHVudGlsIE1hcmNoIDIwMjgpIC0gQW5kIGNvbnNpZGVy
IGJlY29taW5nIGEKc3BvbnNvcjoKCmh0dHBzOi8vYnVpbGRyb290Lm9yZy9zcG9uc29ycy5odG1s
CgpUaGVyZSBpcyBhIEJ1aWxkcm9vdCBEZXZlbG9wZXJzIE1lZXRpbmcgb3JnYW5pemVkIGluIFBy
YWd1ZSBhZnRlciB0aGUKRW1iZWRkZWQgTGludXggQ29uZmVyZW5jZSBFdXJvcGUuIEluIGNhc2Ug
eW91IGFyZSBpbnRlcmVzdGVkIGluCmF0dGVuZGluZywgaGF2ZSBhIGxvb2sgYXQgdGhlIHdpa2kg
cGFnZSBhdDoKCmh0dHBzOi8vZWxpbnV4Lm9yZy9CdWlsZHJvb3Q6RGV2ZWxvcGVyRGF5c0VMQ0Uy
MDI2CgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
