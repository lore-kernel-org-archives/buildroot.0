Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8B1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 04:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CADDE40520;
	Thu, 24 Mar 2022 04:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8nqtKnUC3_J; Thu, 24 Mar 2022 04:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AF0A404EE;
	Thu, 24 Mar 2022 04:30:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB7481BF681
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 04:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D964960B77
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 04:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqAKIAQPhXnM for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 04:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97C34607F2
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 04:30:18 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d6ca46da48so3848800fac.12
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ibmpiUMpPzD5Bd4adlwKT0MYumsRFQINo0I9rSVBsDo=;
 b=ZipXBFrmzDZs8BsOVO2Eq39RmeJzSA8sXBQ1vukbU2/yzZarh0S0ANAGsRs2Rpwlqd
 sBfB8p4caUSbxfGvN47N1PQ3Pgr19qxmvqqMSJI/Otbcw9XReI/0rL73IxzkXtjMjo4E
 q4nkFPRcGTdj5HPQmyc9gr2n0Geckz3JxfeYxrM+dnIP3hBYgjOX0NzQWFuemGf1h9cT
 IlG9JU1xsU3gmg72JMZG0Wu7IfGHJY5MKf+aNZ01KH1AYiIWdfZHNERpr07FABaQv86J
 g10Dkh4hhEGQCeASCtLmkbH9p28p4VRDoAXEwbgAmz3B5zn5jKtFeYLgDtySbpkkYAXV
 eJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ibmpiUMpPzD5Bd4adlwKT0MYumsRFQINo0I9rSVBsDo=;
 b=gGZeWqmaY9yvakvnjm7xVKva/tLTxsppFhDBOPbuJI2TnBHjOUTRK4yMXeVOsJG1qV
 aOEjATS/XSB6iG7serfVbaalzz41/tRAYgLh2mRSIRTYzpUA9Ayb7FViFJrH8/MeeGge
 tljp3k+ExfRx404n+ekaQL36POlBXg24/PmCG8Uk+G+is1uH0ZjeTP683xwHdmwqdFOr
 CLEd7TfAE6KIDmt+xm9m3/rFw9D9PT5z0HAkDcwq2jlfnSyLaExegB9bdpurEtNjCnem
 qxpv8a+dceN/BOOllafMZP9G28fXACo1fMoZ+CuUkneeJUNAJWByZNrGHEwalu8mw9PW
 zq8Q==
X-Gm-Message-State: AOAM530UAYjTUfRtf62stRFbqMFptoOiuHeJCF7MRNMydTbV1vKwAcNs
 MC2YfCF8swZ3zPX8x/FmKmCUw5WRBGQfAE3TiQo=
X-Google-Smtp-Source: ABdhPJxzVYRmdl5ObPctFArCXNcXKkhvBEAercy7GsZh3qbQqrNua7ZUm24eiD7sU/RIVHKnxiVoI8Tc6wCugDFqYu4=
X-Received: by 2002:a05:6870:d0c4:b0:dd:c7f6:2d62 with SMTP id
 k4-20020a056870d0c400b000ddc7f62d62mr1609892oaa.99.1648096217456; Wed, 23 Mar
 2022 21:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220131015937.4113728-1-james.hilliard1@gmail.com>
 <20220131104553.715b97ce@windsurf>
 <731c2ec5-e693-f2d4-5f48-0eaf376c57d1@smile.fr>
 <CADvTj4q9ea12wJk3FfpRdwKVhvLDGrBa9HW89rA2tfPQhX+NRg@mail.gmail.com>
 <6b5d3b43-fe50-0dd2-2903-e404ee7792b9@mind.be>
In-Reply-To: <6b5d3b43-fe50-0dd2-2903-e404ee7792b9@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Mar 2022 22:30:06 -0600
Message-ID: <CADvTj4pocqCAVyLLj=XXSRhCHaoa6Uh9Q7of45Ksm3bN7Tj+qw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package:{clang, lld,
 llvm}: bump to version 11.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Romain Naour <romain.naour@smile.fr>,
 Matthew Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBGZWIgMTIsIDIwMjIgYXQgNTo1NSBBTSBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJu
b3V0QG1pbmQuYmU+IHdyb3RlOgo+Cj4KPgo+IE9uIDAyLzAyLzIwMjIgMjA6MzksIEphbWVzIEhp
bGxpYXJkIHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gMzEsIDIwMjIgYXQgNDozNiBBTSBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4gPj4KPiA+PiBIZWxsbyBKYW1l
cywgVGhvbWFzLCBBbGwsCj4gPj4KPiA+PiBMZSAzMS8wMS8yMDIyIMOgIDEwOjQ1LCBUaG9tYXMg
UGV0YXp6b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXQgOgo+ID4+PiBPbiBTdW4sIDMwIEphbiAy
MDIyIDE4OjU5OjM3IC0wNzAwCj4gPj4+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFA
Z21haWwuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4+IFRoaXMgYXBwZWFycyB0byBiZSB0aGUgbGF0
ZXN0IHZlcnNpb24gdGhhdCBoYXMgYSB3b3JraW5nIGxsZCBidWlsZC4KPiA+Pj4+Cj4gPj4+PiBW
ZXJzaW9uIDEyLjAuMCBhbmQgbmV3ZXIgaGF2ZSBicm9rZW4gbGxkIHN0YW5kLWFsb25lIGJ1aWxk
czoKPiA+Pj4+IGh0dHBzOi8vYnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDkyMjgKPiA+
Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbT4KPiA+Pj4KPiA+Pj4gSXMgdGhpcyByZWFsbHkgZW5vdWdoPyBJIHJlbWVtYmVy
IHNlZWluZyBwYXRjaGVzIGEgbG9uZyB0aW1lIGFnbyBkb2luZwo+ID4+PiBidW1wcyBvbiBMTFZN
L0NsYW5nIGFuZCB0aGF0IHdhcyBtdWNoIG1vcmUgaW52b2x2ZWQsIHdoaWNoIEkgdGhpbmsKPiA+
Pj4gZXhwbGFpbnMgd2h5IHdlJ3JlIHN0aWxsIGF0IHZlcnNpb24gOS54Lgo+ID4+Pgo+ID4+PiBS
b21haW4sIGFueSBjb21tZW50cyBvbiB0aGlzPwo+ID4+Cj4gPj4gQWRkaW5nIE1hdHQgaW4gQ2M6
Cj4gPj4KPiA+PiBJSVJDLCB0aGVyZSBpcyBhbiBpc3N1ZSB3aXRoIGxpYmNsYyBwYWNrYWdlIHdo
aWNoIGlzIHBhcnQgb2YgdGhlIGxsdm0gcHJvamVjdC4KPiA+Pgo+ID4+IER1ZSB0byB0aGUgZ2Fw
IGJldHdlZW4gdGhlIHR3byB2ZXJzaW9uLCBhbGwgQ01ha2Ugb3B0aW9ucyBtdXN0IGJlIHJldmll
d2VkIChsb25nCj4gPj4gYW5kIGJvcmluZyB0YXNrIEkgYWdyZWUpLgo+ID4KPiA+IE9oLCBJIGd1
ZXNzIHRoZXJlIHdhcyBhbHJlYWR5IGEgc2VyaWVzIGhlcmUgd2l0aCBtb3JlIGNoYW5nZXM6Cj4g
PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nl
cmllcz0yMzM0MzEmc3VibWl0dGVyPSZzdGF0ZT0qJnE9JmFyY2hpdmU9Ym90aCZkZWxlZ2F0ZT0K
Pgo+ICAgR2l2ZW4gdGhlIGRpc2N1c3Npb24gaW4gYm90aCB0aGVzZSB0aHJlYWRzLCBJJ3ZlIG1h
cmtlZCB0aGUgcGF0Y2ggYXMgQ2hhbmdlcwo+IFJlcXVlc3RlZC4KCkkgdGhpbmsgSSBtYW5hZ2Vk
IHRvIGZpeCB0aGUgYmxvY2tlcnMgd2l0aCBsaWJjbGMgaW4gTWF0dCdzIHNlcmllcwp3aGljaCBJ
J3ZlIHNlbnQgYXMgYSB2MTI6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvbGlzdC8/c2VyaWVzPTI5MTU4NSZzdWJtaXR0ZXI9JnN0YXRlPSomcT0mYXJjaGl2
ZT1ib3RoJmRlbGVnYXRlPQoKPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
