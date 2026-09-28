Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCB6CA5FA6
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 08:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6732405D0;
	Mon, 28 Sep 2026 08:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mOvy6Ey6phM; Mon, 28 Sep 2026 08:43:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F21B440663
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790584993;
	b=Yhm552zJK6xISszpoqEwPlvGm1YIdh+bPPUTuIwUfkfV1VWFg9CQeVFseACpoNuPQNRJ
	 u+wqetKg1YCgbuj5TdWZ5mUoJNgp/j/x3ZOqjuP7ft+D1ABXIaQWmVfbmxbF/4aOH2DFP
	 j6qi7/9o4Wu/Iq+LK3PHw0nwhktjI545IUuG2bKC2wzJePSGUS763IzWZwWYL27R/aAwK
	 uciDJIIyuNTHFBVr6iugZfT7+PBtCspzvBJcd65RtOLeeOlxfy6KhO1svgNOPMg2JO0oH
	 AucyrN+QvAQORj6+IIP9SQj2ctfpGcI6XDC7LSKSRNTrEQnx7nPYDSIN/gBx5i6AkkA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790584993;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=OpKcQpxw9zg86gqM4J3N65ClxDM/0tszlf3dVFTFm1o=;
	b=i6QyuGZ8ltbAd3amwOJG5qZGcleN4+lHQsnHEt64T6cTd51MWweJDznF3AbdevDoh7RP
	 XGQxL2h/Lj/Uiabd6aKDiyyH+OxMINH/SGJZarCU0yrCW9jhiCT+KGH1iw78/10CZzV5K
	 dkRE3SRVAOa4zEHZxuz9Hljuo6NY2MEuFUbKu5FhFbZz4StNpZ5U66mpC80IlMdHczTuD
	 uHYEeTGfmmIrThmYbjrSz9EIraZN03bvYp4AeH++jzMUiOaerW+/euVmVE5sMlwu6gcZx
	 IVPEKjzdVpE9Iu2clNLfgQBxb/QxJ8r38AmlZIUKdXM0PJctD3dLIBwYkL2pLnnZrTw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790584993;
	bh=OpKcQpxw9zg86gqM4J3N65ClxDM/0tszlf3dVFTFm1o=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/9UuqyOKgL5Ep46YSJzkKjzoKvGQT/bwotftxnc4WwAVlF+MyoeRiWyvLIjH2PId
	 q/UtS962gsEDWDABAAAHxwJ1CrwcBTOVFqnADejG4HZPvpMNjCWquSenfBUDkuFCgc
	 c1m1POqxRyNCvZ2WU5MAKlkwl6Gkiw0LiztEIsDcFr2dV3C8fEiR3yJz9CtvS0QNuT
	 /5Se+dzce1ED4CJnwBTOhtXzkOLvWg0+KB7B8EqFKUxxqFchSqgHboNzraMksj2A6v
	 PAE3+K8dkxCqI2A7aFaWTy0+2cT6l3FZ9hzzoMeDwojcHlryxfa+Vt556rkPz+P6KF
	 cgwhtIL5U+MvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F21B440663;
	Mon, 28 Sep 2026 08:43:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B6BD335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D2F180C84
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLeKbyOsGJ1x for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 08:43:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 349B180C7B
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:34::22"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790584990;
 b=SRm34mw3mbih9fFlm6FLciQkNzODiknCtUSfOkFAJGK1GSMq14oFcq2I79/6cNzk44Lc
 /Z9HoipTmaCn07ftsEb8z9IR38IUunYDHKi1GRXYHBgcMSsWK954+EynWmBsfwfLidTGd
 gqZnTT5F5yMi46SR8M15EquSyyr1heRkY/sCfU/OKrxMsTnvlwbcTp7KLUZCUYi7Qgs3S
 SG+1bkLzFwWhvioqHgIj8OwyxGT9MvCdItkWFNcbJWjW8muae6LrFksW+bF+iiLy/0ze8
 WMIiqkagYDuyorEebtKUO+V26Zo9btxOh7Y7nHZM0Gz0nG7zUlPWtHUWcpLqQ1j7bSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790584990;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=8CzyqLJ9JBp70YPiVVOyy7CJJKdiBIJAhysl0ktM67k=;
 b=SI/AL5Osi6inrFCvOYQXM7LM+PfuHFGEXGdodJfqHaDtJCi3YubP6RTZYPShgJ9py5ih
 BBDR9jLI5h0l54e3Jje1KjZUd8m4pq/IY8jjuOp1bsyKG0qk8a4mVjB1zgEDrsuAay5zN
 tCjyMYVnS2Jbck3MY/cQEhhUFAOOgb6yJ4Pcp/vbs9Q2XrsXJacahi7luBFQj4IZjjxXm
 GAexiQD1pGTBuI3zZZRfFNS1N3GifbxmU1rv6IEG2xO9M4aNN8FEAPPpPMtbpvWpJW14Y
 J58vQEK9CKtCab58VOW2ZksMExUNtCL7ChC6lBH82T6OPgej8xlktpXQINx51SCQ0cQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KRnCK7az; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:34::22"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::22; helo=mail-ej2-x22.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KRnCK7az
Received: from mail-ej2-x22.google.com (mail-ej2-x22.google.com
 [IPv6:2a00:1450:4864:34::22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 349B180C7B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 08:43:09 +0000 (UTC)
Received: by mail-ej2-x22.google.com with SMTP id
 a640c23a62f3a-c2a4fbc5586so413277666b.2
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 01:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790584988; cv=none;
 d=google.com; s=arc-20260327;
 b=Wlvqex6I37dE96jfrAQAc8UMUxo3xBFOvKbxmIhsvoZlbeSQLt859SDvFFeelmFcOb
 i5L9OXAPuktxasFjWmgpntm1uLvcZU8PXu6FchG/BYBmuIsWH6BN3W7VDlav6L+5zSLx
 2eauB3IpZPUyLrxhYzUwE80h7tl8aY60t/U8xhmCUhnZM4+6S1rdyzfjjR+IebTofrCF
 yEEtKu9U4IAsFmQnnZHItBH8wvnlM3imtkSnDZJd+woX9aODso4gkN0zcZPN5pvx+C32
 6qKu4nCufibQ2OrGGuN9NeEWx1/BLY7Vu/g9wF0gYIUNk6kWkmIvvIf3GAPkWZKAjTAm
 a21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8CzyqLJ9JBp70YPiVVOyy7CJJKdiBIJAhysl0ktM67k=;
 fh=+ra/dLRre3nVSEqUCPXXAlLASsmx1E6ufjT9yqSYp88=;
 b=CiPJq75ntIpNBUkaaWJtQ+DcCVqSsQASN0VEgjIoxmwkQ+sETTL609yjBBMAlott1r
 sZD2SCKIxpZH2up8i5wSkNZ2fiR7bPaonWhfuWV1qf0dv8R46uC33B8run0WgAHi6Pvr
 L5WS14Y7id2IYCettlB7ue0d+2rD+EpKx5NlIRweQIsyPFioGpPEiDcZtpYsG3bcGMYi
 B53mKD9r96QiWbaMk0C4kuYkZ2EKf75k+8Q2A+rOBxD4WQllE4SlMZGNJodBg2ghmfwV
 KZKoXC19NRw6fr/aZ5gqUaH5zzOBL9NteQ3EWfqOs4SseVB1wEYKdv0wSeRhvBi4pcju
 iCXw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790584988; x=1791189788; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8CzyqLJ9JBp70YPiVVOyy7CJJKdiBIJAhysl0ktM67k=;
 b=KRnCK7azDVy0J66cD9bPV4Hw3PYpaQcdn8cBdWW+Q1ccqKpK0UlPRSHYSrHz5IfQX6
 VhoOUYnaPFozZHHr+A4VYQLifG/nUwu014+IVZi850F55Wtk2CI1qhMRAzkc3DQr4Y27
 wYL+k3wyFBZPPDK0Q07h1h/LsmbpI6UjGlrj7XveBrnLDJ3rJTa0tN/4vxpYSTv1kHAb
 Rmt2xOtFothMZ4QszOY4NwKX8NOpcKmhiNCAV+eYgeUnSIrrH+lPDsnc+dDrXLQ+KkXC
 el/gpH/6xt63QALul6KKMYDw/OnV/mivH2nsFyjIweAe+vpZmhNkrQuc2hkpKS68fN9G
 CLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790584988; x=1791189788;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8CzyqLJ9JBp70YPiVVOyy7CJJKdiBIJAhysl0ktM67k=;
 b=LSXePe7GCKQhuV7gS/XVvqnhKIsutY4C03LA5tXZSI/IzoItZi9b5w9U3TyYvOaUsE
 Lv3RsEAwybcjo5GL1s+6qkxenZVYHiDRS1W/3sjEEFh60gg9yfPycOs0X5kJdy93KNAQ
 MtilUnfVR5boRXyTAQOK8oCMN4BAmFGDNpIWqiNMr8ZCZ8OABSGRdDz0xRqIUB4m8uFv
 n0tauqCz2CKv9N6EsLfW1IWweD0Fh6nKGUYgXvBAUn37o51bXOU80ljT+Z9O4LTWKzTr
 fAUNQj8AEg5EOX+ik1nZf5Q+lfIPgYdxjAiRurSrAZqhkvTeVuVFlVQMIsfKKhvjnEt9
 gIYg==
X-Gm-Message-State: AFuF++lCXxQvVxLkwx9qxVlPrfAmhTqT9kPjq7axl1ET3E2KFWSpSMlo
 /E0h/641jRP/oWPRgY2A+6GsbNM0A3s/4wI6joHwG2JwgmoospI0L9e4nGxicKByqJOhvnC1gK/
 Tex0FdiYQHrDQ+6mE+CZIN0XAJQEcduQwog==
X-Gm-Gg: AYBFou3u616xK/OxBXn8ALdvao0c2x2dAjSMiLcfK614hmBjeKOGRYBVjq2/l79dtEt
 VlUSzKTwySvjtU83rm9ogLQesQ5Nr/0fAfaFdcmmbZmbwNd8VdBOwcIXcjLva8p8PBV0eO65dae
 43mG+GMscE0fAFGLsnN/sgvqZBxJ4ARPFHdwe4nZ1REOHcsbGE9nwDeKHkY1gMJ2h2kqEZfM1D+
 LxSiip2i5q4VUzS7SxM4t7kyZ1syEb9gwlQn1/h3TWymZ6nuKYZTgtiqCUx6pHVwGZqiyqAhavd
 fc3lGVlnEPbul8pMSaKNFb9QmnLMedktd3zVvQbqXTMR+OMpmzb62+5/
X-Received: by 2002:a17:907:7b8d:b0:c2d:c800:d797 with SMTP id
 a640c23a62f3a-c2dc800ea64mr347756766b.6.1790584987560; Mon, 28 Sep 2026
 01:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260914082138.2802-1-fred.lefranc.evs@gmail.com>
 <20260914082138.2802-2-fred.lefranc.evs@gmail.com>
In-Reply-To: <20260914082138.2802-2-fred.lefranc.evs@gmail.com>
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Mon, 28 Sep 2026 10:42:54 +0200
X-Gm-Features: AclHuK8_XmYSlGzyFyj7wDJQeQ0g_7KL-bOite5tbcN9fq9KM7Xb3vPDJ4VcymM
Message-ID: <CAGkXw1VimYThS5q8qAJXTWPoMNPsRJfZFPDei4cKkjzoUaiegw@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: don't require gbm
 for eglfs
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

SGVsbG8sCgpEbyB5b3Ugd2FudCBhbnkgdXBkYXRlIG9uIHRoYXQgb25lPwoKQmVzdCByZWdhcmRz
LApGcmVkCgpPbiBNb24sIFNlcCAxNCwgMjAyNiBhdCAxMDoyMeKAr0FNIEZyZWQgTGVmcmFuYwo8
ZnJlZC5sZWZyYW5jLmV2c0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRnJlZCBMZWZyYW5j
IDxmcmVkLmxlZnJhbmMrZXZzQGdtYWlsLmNvbT4KPgo+IEJSMl9QQUNLQUdFX1FUNkJBU0VfRUdM
RlMgY3VycmVudGx5IGhhcyBhIGhhcmQgImRlcGVuZHMgb24KPiBCUjJfUEFDS0FHRV9IQVNfTElC
R0JNIiwgYW5kIHF0NmJhc2UubWsgdW5jb25kaXRpb25hbGx5IGFkZHMgbGliZ2JtCj4gYW5kIGxp
YmRybSB0byBRVDZCQVNFX0RFUEVOREVOQ0lFUyB3aGVuZXZlciBlZ2xmcyBpcyBlbmFibGVkLiBU
aGlzIGlzCj4gaW5jb3JyZWN0OiBHQk0gaXMgb25seSBuZWVkZWQgYnkgdGhlIGVnbGZzX2ttcyBi
YWNrZW5kLiBPdGhlciBlZ2xmcwo+IGRldmljZSBpbnRlZ3JhdGlvbnMsIHN1Y2ggYXMgdGhlIFZp
dmFudGUgZnJhbWVidWZmZXIgYmFja2VuZAo+IChlZ2xmc192aXYpIHVzZWQgb24gMzItYml0IGku
TVg2LCBwcm92aWRlIEVHTCBhbmQgT3BlbkdMIEVTIHdpdGhvdXQKPiBHQk0gb3IgRFJNLgo+Cj4g
QXMgYSByZXN1bHQsIGVnbGZzIGNhbm5vdCBiZSBlbmFibGVkIG9uIGkuTVg2IChpbXgtZ3B1LXZp
diBvbmx5Cj4gcHJvdmlkZXMgbGliZ2JtIG9uIHRoZSBhYXJjaDY0L2kuTVg4IGJsb2JzKSwgYW5k
IGZvcmNpbmcgaXQgdGhyb3VnaAo+IHRyaWdnZXJzIHRoZSBkZXBlbmRlbmN5LWNoYWluIGNvbnNp
c3RlbmN5IGNoZWNrOgo+Cj4gICBwYWNrYWdlICdxdDZiYXNlJyBoYXMgYWRkZWQgJ2xpYmdibScg
dG8gaXRzIF9ERVBFTkRFTkNJRVMgdmFyaWFibGUKPiAgIHdpdGhvdXQgc2VsZWN0aW5nIGl0IG9y
IGRlcGVuZGluZyBvbiBpdCBmcm9tIENvbmZpZy5pbi4KPgo+IE1ha2UgR0JNIG9wdGlvbmFsIGZv
ciBlZ2xmczoKPgo+ICAtIEluIENvbmZpZy5pbiwgZHJvcCB0aGUgaGFyZCBkZXBlbmRlbmN5IG9u
IEJSMl9QQUNLQUdFX0hBU19MSUJHQk0KPiAgICBhbmQga2VlcCBvbmx5IHRoZSBsaWJlZ2wgcmVx
dWlyZW1lbnQsIHdoaWNoIGV2ZXJ5IGVnbGZzIGJhY2tlbmQKPiAgICBuZWVkcy4KPgo+ICAtIElu
IHF0NmJhc2UubWssIG9ubHkgcGFzcyAtREZFQVRVUkVfZ2JtPU9OLy1ERkVBVFVSRV9rbXM9T04g
YW5kIGFkZAo+ICAgIGxpYmdibS9saWJkcm0gdG8gdGhlIGRlcGVuZGVuY2llcyB3aGVuIGEgZ2Jt
IHByb3ZpZGVyIGlzIGFjdHVhbGx5Cj4gICAgcHJlc2VudCAoQlIyX1BBQ0tBR0VfSEFTX0xJQkdC
TSkuIE90aGVyd2lzZSBwYXNzCj4gICAgLURGRUFUVVJFX2dibT1PRkYvLURGRUFUVVJFX2ttcz1P
RkYgc28gdGhhdCB0aGUgZWdsZnNfa21zIGJhY2tlbmQKPiAgICBpcyBzaW1wbHkgbm90IGJ1aWx0
LCB3aGlsZSBlZ2xmc192aXYgKGFuZCBvdGhlciB2ZW5kb3IgYmFja2VuZHMpCj4gICAgc3RpbGwg
YXJlLgo+Cj4gVGhpcyBrZWVwcyBlZ2xmc19rbXMgd29ya2luZyB1bmNoYW5nZWQgb24gcGxhdGZv
cm1zIHRoYXQgZG8gcHJvdmlkZQo+IEdCTSAoaS5NWDgsIFJhc3BiZXJyeSBQaSA0LCAuLi4pIHdo
aWxlIGFsbG93aW5nIGVnbGZzIHRvIGJlIGVuYWJsZWQgb24KPiBHQk0tbGVzcyBwbGF0Zm9ybXMg
c3VjaCBhcyBpLk1YNiB3aXRoIHRoZSBWaXZhbnRlIGZyYW1lYnVmZmVyIG91dHB1dC4KPgo+IFNp
Z25lZC1vZmYtYnk6IEZyZWQgTGVmcmFuYyA8ZnJlZC5sZWZyYW5jK2V2c0BnbWFpbC5jb20+Cj4g
LS0tCj4gIHBhY2thZ2UvcXQ2L3F0NmJhc2UvQ29uZmlnLmluICB8ICAyICstCj4gIHBhY2thZ2Uv
cXQ2L3F0NmJhc2UvcXQ2YmFzZS5tayB8IDEyICsrKysrKysrKystLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9xdDYvcXQ2YmFzZS9Db25maWcuaW4gYi9wYWNrYWdlL3F0Ni9xdDZiYXNlL0NvbmZpZy5p
bgo+IGluZGV4IGU2YmI5OWRlMjguLmMzM2UwNzhiMTUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9x
dDYvcXQ2YmFzZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3F0Ni9xdDZiYXNlL0NvbmZpZy5p
bgo+IEBAIC03NCw3ICs3NCw3IEBAIGNvbW1lbnQgIlgub3JnIFhDQiBiYWNrZW5kIGF2YWlsYWJs
ZSBpZiBYLm9yZyBpcyBlbmFibGVkIgo+ICBjb25maWcgQlIyX1BBQ0tBR0VfUVQ2QkFTRV9FR0xG
Uwo+ICAgICAgICAgYm9vbCAiZWdsZnMgc3VwcG9ydCIKPiAgICAgICAgIGRlcGVuZHMgb24gQlIy
X1BBQ0tBR0VfSEFTX0xJQkVHTAo+IC0gICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNf
TElCR0JNCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hBU19MSUJHQk0gfHwgQlIy
X1BBQ0tBR0VfSU1YX0dQVV9WSVZfT1VUUFVUX0ZCCj4gICAgICAgICBkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX1FUNl9HTF9TVVBQT1JUUwo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1FUNkJB
U0VfT1BFTkdMCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDYvcXQ2YmFzZS9xdDZiYXNlLm1r
IGIvcGFja2FnZS9xdDYvcXQ2YmFzZS9xdDZiYXNlLm1rCj4gaW5kZXggMDE2NjFiN2YwMS4uNWU2
Y2Y2NmYzMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3F0Ni9xdDZiYXNlL3F0NmJhc2UubWsKPiAr
KysgYi9wYWNrYWdlL3F0Ni9xdDZiYXNlL3F0NmJhc2UubWsKPiBAQCAtMzA1LDggKzMwNSwxNiBA
QCBRVDZCQVNFX0NPTkZfT1BUUyArPSAtREZFQVRVUkVfdHNsaWI9T0ZGCj4gIGVuZGlmCj4KPiAg
aWZlcSAoJChCUjJfUEFDS0FHRV9RVDZCQVNFX0VHTEZTKSx5KQo+IC1RVDZCQVNFX0NPTkZfT1BU
UyArPSAtREZFQVRVUkVfZWdsPU9OIC1ERkVBVFVSRV9lZ2xmcz1PTgo+IC1RVDZCQVNFX0RFUEVO
REVOQ0lFUyArPSBsaWJlZ2wgbGliZ2JtCj4gK1FUNkJBU0VfQ09ORl9PUFRTICAgKz0gLURJTlBV
VF9vcGVuZ2w9ZXMyIC1ERkVBVFVSRV9lZ2w9T04gLURGRUFUVVJFX2VnbGZzPU9OCj4gK1FUNkJB
U0VfREVQRU5ERU5DSUVTICs9IGxpYmVnbAo+ICsKPiArIyBPbmx5IHB1bGwgaW4gR0JNL0tNUy9E
Uk0gd2hlbiBhIGdibSBwcm92aWRlciBhY3R1YWxseSBleGlzdHMgKGkuTVg4LCBSUGksIGV0Yy4p
Cj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfSEFTX0xJQkdCTSkseSkKPiArUVQ2QkFTRV9DT05GX09Q
VFMgICAgKz0gLURGRUFUVVJFX2dibT1PTiAtREZFQVRVUkVfa21zPU9OCj4gK1FUNkJBU0VfREVQ
RU5ERU5DSUVTICs9IGxpYmdibSBsaWJkcm0KPiArZWxzZQo+ICtRVDZCQVNFX0NPTkZfT1BUUyAg
ICArPSAtREZFQVRVUkVfZ2JtPU9GRiAtREZFQVRVUkVfa21zPU9GRgo+ICtlbmRpZgo+ICBlbHNl
Cj4gIFFUNkJBU0VfQ09ORl9PUFRTICs9IC1ERkVBVFVSRV9lZ2xmcz1PRkYKPiAgZW5kaWYKPiAt
LQo+IDIuMzQuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
