Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00025C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:14:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95DCB60F6F
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95DCB60F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC6D40221;
	Sun, 24 Oct 2021 18:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2b90j_VA0Sg; Sun, 24 Oct 2021 18:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBCC240211;
	Sun, 24 Oct 2021 18:14:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4BA1BF420
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8587080DC8
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_ahKwPXRP8t for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 18:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5359D80EE2
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 18:13:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id l13so12317358edi.8
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 11:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AuHDJ6YcfqvEO3cES4w32eCa/mr/o2E5k5WYdMEsImA=;
 b=UZ+tEPn5VFPcioyxqTn3Kcoq8UWTLQMnrXTpCWspzg3/Ht506ryBC2FNb+7hJuIChG
 ZK6BwYhh2WPxkV6EgzEueUbiigRp1h3SzAM7bSzqV7WVNl5atntrFUZJlh7SuwdDlE2y
 w9lyMRofc3R5MYijdBrGAA1Ph9WBcQTtu7818w5K2BRtDpzFHoD1cTInQNL0EuH1ibS1
 dnSEnjXZ/L51sozhZbBitLLCg+8zBg+ylIFIZUP6GCJlOyePQOl8RatRgOLNCSTRAjgb
 hC+g7sKxg7y7ZWzFlsnNsZ0oGrW15mHgOC+S79ss1ClougGEpSQdaGDn8jwdoxNpM7Po
 09FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AuHDJ6YcfqvEO3cES4w32eCa/mr/o2E5k5WYdMEsImA=;
 b=3oH3go3LbV1GzFaD+ZslRnxBaSG27R+aD5/qTNbw9HgtEI62+PjQ72cbQcbbPIzgmM
 CuIrSZ/MzXzP8pkhuiwzoISsgNtYl75RATXyBg9UyXpFVlguRm/k0ArT2419UgZtRvcs
 yJqmTbua4ZzSZawQTgycQBsrnc5GUfgbaAGcH3WusLHnJ31FR6LMlGvSuSLGqxr6I+DE
 AfZ5mnB4RmnOW2J0S43CHyS/5NUezMbjB92NQcwMwE+9tFSWY+1RKDBwFAhK0NGIHYHr
 s+Jtb8asePsW1XpHTjfKcgh14iA+Cg/ASFOpdlSJ5NGMioF28rviiwxYNhKy8VATj5In
 CdjQ==
X-Gm-Message-State: AOAM533ef3cZxD8Wyl7Jq/hGMWn5ysxspuWm2bfRbnWdywK/8HUSqEcf
 kvrbfI+pO/wqsq7E1ZZBdnPXcTjjQ7Hy8YPH
X-Google-Smtp-Source: ABdhPJz1It4eE5jU3QUjeNn6j3u1XyvBgYnpl0aJebnGD26uwruGsx9x8hrWFdjly12LdwFyEUn/Wg==
X-Received: by 2002:a17:907:1dc8:: with SMTP id
 og8mr16938752ejc.133.1635099228516; 
 Sun, 24 Oct 2021 11:13:48 -0700 (PDT)
Received: from localhost.localdomain (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id v15sm7555367edi.89.2021.10.24.11.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 11:13:48 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 20:12:20 +0200
Message-Id: <20211024181221.2608908-5-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024181221.2608908-1-raphael.melotte@mind.be>
References: <20211024181221.2608908-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/python-boto3: bump to 1.19.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpbGUgYXQgaXQsIHJlbW92ZSB0aGUgbWQ1IGhhc2ggYXMgdGhlcmUgaXMgYWxyZWFkeSBhIHNo
YTI1NiBoYXNoLgoKU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVs
b3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5oYXNo
IHwgNSArKy0tLQogcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLm1rICAgfCA0ICsr
LS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5oYXNoIGIvcGFja2Fn
ZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLmhhc2gKaW5kZXggZTRkOTI0ZTc4Ni4uMzU4ZmFi
ZDM5YiAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLmhhc2gK
KysrIGIvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8zLmhhc2gKQEAgLTEsNSArMSw0
IEBACi0jIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2JvdG8zL2pzb24K
LW1kNSAgMGYzN2IwNTRiOWMxNGZlMDVhODE5NGY4NWIxMjI5MTggIGJvdG8zLTEuMTguNDgudGFy
Lmd6Ci1zaGEyNTYgIDdiNDViMjI0NDQyYzQ3OWRlNGJjNmU2ZTljYjA1NTdiNjQyZmM3YTc3ZWRj
ODcwMmUzOTNjY2FhMmUwYWExMjggIGJvdG8zLTEuMTguNDgudGFyLmd6CisjIHNoYTI1NiBmcm9t
IGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9ib3RvMy9qc29uCitzaGEyNTYgIDExYTYwMzUwNjAyMzBl
OTIzMjdkNGYxMGZlZjZiYzQ0MTg4YjJjZDY4NTA0MDEyYmMyNWVkNjJhYzMxZDY3MGIgIGJvdG8z
LTEuMTkuMi50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCiBzaGEy
NTYgIDBkNTQyZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1MTI4N2Ux
MWI5MzhlOTQ1OTQgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5
dGhvbi1ib3RvMy5tayBiL3BhY2thZ2UvcHl0aG9uLWJvdG8zL3B5dGhvbi1ib3RvMy5tawppbmRl
eCBkMWUwMWRlODU1Li44ZTEwYWE0ODJkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1ib3Rv
My9weXRob24tYm90bzMubWsKKysrIGIvcGFja2FnZS9weXRob24tYm90bzMvcHl0aG9uLWJvdG8z
Lm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9O
X0JPVE8zX1ZFUlNJT04gPSAxLjE4LjQ4CitQWVRIT05fQk9UTzNfVkVSU0lPTiA9IDEuMTkuMgog
UFlUSE9OX0JPVE8zX1NPVVJDRSA9IGJvdG8zLSQoUFlUSE9OX0JPVE8zX1ZFUlNJT04pLnRhci5n
egotUFlUSE9OX0JPVE8zX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvZDQvMWUvN2Q2YmYxYjkyMTk5MTIxZWM1YzAyMDg2ODQwMmI5MGJhMWE0ZmVmNjk0MWFh
ZmFmZjk3MGE2NjRkODNhCitQWVRIT05fQk9UTzNfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9u
aG9zdGVkLm9yZy9wYWNrYWdlcy9lYy80NS9kMTJmOWMwOWI1YzRkYWQ4YmNiMDk4ZGZhZTVlOWUx
MjUzZWQ2NDA4ZWZiYmQ5YTNlNjBiZmY1NWI4MjQKIFBZVEhPTl9CT1RPM19TRVRVUF9UWVBFID0g
c2V0dXB0b29scwogUFlUSE9OX0JPVE8zX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCiBQWVRIT05fQk9U
TzNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuMzMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
