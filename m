Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A281CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 08:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1596065A;
	Sun, 11 Oct 2026 08:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x75G3OtTYRUP; Sun, 11 Oct 2026 08:28:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 64A9E60644
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791707297;
	b=Yx0HFSH3XIt329yDO86bI24oH6IAk8PpJHUB0d0rRqviZbOSt3q3ApYkss6dgSaw1IJK
	 i+ZIC7DM6d2P1W7WiMxJtLmaRrgRz7GFPU35UsBACLBYEETyWzJ2YrjHFjTQOUlU0QTgh
	 2nV43OSE7i6pYKP5YyYx5gxTIH9ph7TqxUJ6BYu4clLj35nm/QUKgeUHsdTGp1sbvYtVr
	 IPJwjBxwb3tLaY+PTDHS1vF06uKQB+YdCQjG4wxJswbyDrGJDjqq8/BuQV+uU94lq2Z2i
	 Eb9oDTRUuz/iEt8vnAE3bULqnRxQM+1vuoGSNlxVBfnYUZ1nKCNdm+yFMWST71Qtm3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791707297;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:From:To:
	 Date:In-Reply-To:References:User-Agent:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=W1ZGqRZrhorX1I/uZkd/kDqhwhRXMgvVqTQzcjNnlHE=;
	b=QMZBT5rlwn2A2OhtR7t8NmyA5bim2kmYHcaUDzwMmgd5WHJljzi0Kj03mjaAZ47mX36R
	 mfnL8PUxU+rpQc6+wiumGWtv6FSYlAws/t/40Gh45jhs/2esG37FOkEkIcL4JsBO+YW+6
	 OGMKnu9diNjUhajYB6lyqJ7z5ky6juepPc+heqpwVHwSqYwn7yRV1vesWbvnuPAkTCmTa
	 vJXjw0Kj/QexzEpKuOTVECNhGTNpX2lKYsyOXBDSiW5ntO/KMIiyTftmkwEsEGiZ+VemE
	 FTUsw5O5biOHKil39rBCWOYvQFnpft3YlxkblK3WLjmYptisUz/RK4B4wnl3grN4o0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="X/MNWDE1";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791707297;
	bh=W1ZGqRZrhorX1I/uZkd/kDqhwhRXMgvVqTQzcjNnlHE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pxp5rf1d49q0rhMQN0RIHYNzQUGGjgJHLDk0HQxXgOLnk9hpWVAmEoCbhutZ2ZzbE
	 ZI9zNp3aEt2adICsFUGnFMYSRJAiCbDx6LCJzAIxAabizii+g5Pb9Nh7sNjL9BqXz0
	 Z2Jrf4SpHoHC5pZuZnOnaJCxE9/nuNqdGd51GBCs/5CzjhT5Nn6/TsbxJEegGomag5
	 ViR5B3RDqY+Hs5ELimthdpsvA5yHqyvewr3IMccK00UqJfx0pU7R9Pp6RMfN7m4/zw
	 sTdopUhVHoC+YGpDqTVmEqOdoxXCQgzjkWnuyO/EiUJL8m9QT6qF0Friq/9ydil2kd
	 vxJSYC9bX9Lmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A9E60644;
	Sun, 11 Oct 2026 08:28:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A2C01A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BE9960648
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwTMo8DAF7V4 for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 08:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4862860644
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791707295;
 b=lPaw9cDTdSiT57GY9RRj8hW63vKMNveizZeAzH6tz7jlJcGneBzUjq2EaIVKtlWEQHUL
 WSztrvCzw4qoL4GR+CFPXEHA4e+ApfNHd90frwUSAu4RYl40WDpjgQ7L5x3XKyx+XFP9J
 f2QX9f0zWNF8GLHAVKrsBk0C48y6UByIZNMwWwkLgAhuucdTkFgR/T1Oh3huY2TizgbVB
 /nuCxGnohJbHp0vW93oLNGmAhzogmmSFoA31x8Z+UOOf0FwpO4JbYVgJcOxNqQ54WCeo/
 uMnAJ8As9E3ha6G1lTEfOc6HfhfsnyY7bM0Q4/d+5xjqUF1O0MeQbXDwSWlXPyHBV4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791707295;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=WIal3EU6smXBzVfqxWhytaohpsEyDG2g+bj9hEEK16o=;
 b=gkOdm0lVZoHsxk5lH8mZb69/o6K6lv9M0TXDiW0KboN+bGBP/Ido+254NBsOoxbNAOMr
 AiUtiNuXfwb7EJzddX8bjDiOMXLa2fUejCiRO6zb2YX2GDNWzd6tTQFdh8C9/sLl7/oPa
 N6xuDaarl4AsIcePg3zZSCmwwretGG/dfWvEsVc+a1OwHuwp9ZyBkJy52DTj/9Sdvvk5s
 GGkSrbF+Tj5d3S24xvy+UZQAMwB30AF9z8rLOOcL5MQeh2fVMjD6qH3EdXG+Gb3+nYh9T
 zXZKa3bqwfwDxewj19qhLYTczi6T1StHAyq8yEKp1BSn+jnnWgKSUebtoPxY3/QEvng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="X/MNWDE1"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=X/MNWDE1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4862860644
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 08:28:14 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a19cba5c14so1627475e9.3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 01:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791707293; x=1792312093; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WIal3EU6smXBzVfqxWhytaohpsEyDG2g+bj9hEEK16o=;
 b=X/MNWDE1K3WodH+t2lR74IWkBj29fZK5B3wNV0FgoxTdCPTLti6t7ITpdC3m3wpbvz
 LdOdlFaRx1wiF1qc2xfQBZURWsUpZE+iZvpr6wX8TtdzX4RPNWZUg9WFRz/noEu9CsaA
 AjUGHGEhugeaUaKy3iv/meqCV4cVywu2SedPzl0ZvBM87TXfQit8lpMoom1LVTT0t7+X
 m0C4OeTYhRzunUdDdd2Rv38kSrG/1gU4HxL1Af6m5bNtIR4j0q4Ta+Akp00k86EddnNQ
 XXr9pQlCFNZ9isY51W6yCFTk3YNAgioa16kwAvdthL3qld23sTS9bpAzFzE9Rohea5uF
 8OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791707293; x=1792312093;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WIal3EU6smXBzVfqxWhytaohpsEyDG2g+bj9hEEK16o=;
 b=qu31CLaA04y1n9txgLnqJdXPEAY1hfMHE8dJLYkniy9So0GhuQVQl2XXaGQ4y1XzAk
 2OpM93NEZ1TZJJMlyJj7eBYkRJEVaVoJpHJsMMXU76WaPQLVHouvXBFOBnaRFbSrV3WT
 Kvq+u3WJECDmbf/s8ujBsnOKYlj6TH8ychyA2+SsHmLf4k/FkNnFE2oZQ4zBiHschM2a
 drjnla0xtsp4fdLrdWarGHSxLwOMwcBXqFgkn3mDwOfS4xSI8JWUViZi9QsD6cIQC5H/
 6q9bbFDPZsEIg9kH7JxsnQzudC8QzdJlxrYfbExVmt55gOd+QwQJeDgmJw69GEAgPzMW
 x2QQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfQk/sXw7iHD+o1d/r6aI+0rffg/8ejfuVcepdk1JWx8svAZgN7g0UU/D8c042eP8O/yDSWJQFmFM=@buildroot.org
X-Gm-Message-State: AFq9FYJBkXV45p/DnRAjQgSf92gBUsicGooxxFqSZgad+DOBPZZkUwuR
 DYVHgwfRJQ3l5oPVGzvbRw0dk/h+TVjJEzKdJqB/6qql2I9MmosWRGk6DzPq3w==
X-Gm-Gg: AYBFou0oaTc2KYjtBFNhyFPJESWbqeAKyUiP0wSHMAXQgMN8lepApDhgwqJCcGIyVHM
 VtNo0bhmsRS2hv3qD67thFsOF5uxG8J7Ly3MVajtHkByQ3pUkfP+wFZ4SSLvDSAu945jkEVsxYI
 dHxpr4LbZom9oJY/2sWmqRDzQj6fVC3KRMrNjpZc35355bRdqTd5R5qwmx48bogKZ86MvLn03Nv
 vWW5BBWzOroNhoIgybAr9S258QWAmLOYhOREUutwHnSPBFhChYU/JsvNvuY42hEOptwLsQBjtnH
 fa9ClJ/tHh1f0rXDLlyb2GjSjMJNqK5/jwmJrD8SXY3lgOEw4aXMSUHjqMv4Xpwdo+4zDesw2uq
 FNOnc23e0K9cnKy1Ngl4ZuLqbxiA4Y0Z9Vm/izy+Q2k/Bk7ttAQwqc5ctyNbTg8Y5DuGa44HG//
 8uCpzDGrxq8u0sGaLRjGS/L4uLiXkdqPApNEhDfEvWTQP6eoa24sfHJO2hGkC4fnqY2ftzsiyFM
 zOsTLRwVX2UrAUlDVT6kR89xO2qWjInt2P53as3AEpteEwlOTWRog==
X-Received: by 2002:a05:600c:3b0a:b0:4a0:1e68:d28d with SMTP id
 5b1f17b1804b1-4a18e4a177cmr118312185e9.6.1791707292476; 
 Sun, 11 Oct 2026 01:28:12 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6beaesm119343625e9.0.2026.10.11.01.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 01:28:11 -0700 (PDT)
Message-ID: <8006a4ffe97e560506b5e7dfa8634f18dceaae6b.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Date: Sun, 11 Oct 2026 10:28:11 +0200
In-Reply-To: <20260602114732.1957638-1-roykollensvendsen@gmail.com>
References: <20260602114732.1957638-1-roykollensvendsen@gmail.com>
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/readline: link host shared library
 against ncurses
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

SGkgUm95LAoKdGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcyEKSSd2ZSBqdXN0IHN0dWJsZWQg
dXBvbiB0aGUgc2FtZSBpc3N1ZSwgaG93ZXZlci4uLgoKT24gVHVlLCAyMDI2LTA2LTAyIGF0IDEz
OjQ3ICswMjAwLCBSb3kgS29sbGVuIFN2ZW5kc2VuIHdyb3RlOgo+IHJlYWRsaW5lIGJ1aWxkcyBp
dHMgc2hhcmVkIGxpYnJhcnkgd2l0aG91dCBsaW5raW5nIHRoZSBjdXJzZXMvdGVybWNhcAo+IGxp
YnJhcnksIHNvIHRlcm1jYXAgc3ltYm9scyAoVVAsIEJDLCBQQykgYXJlIGxlZnQgdW5kZWZpbmVk
Lgo+IAo+IGhvc3QtZ2RiIHB1bGxzIGluIGhvc3QtcmVhZGxpbmUsIGluc3RhbGxpbmcgdGhpcyBs
aWJyZWFkbGluZS5zbyBpbnRvIHRoZQo+IGhvc3QgZGlyZWN0b3J5LiBidWlsZHJvb3QgcnVucyBp
dHMgZmFrZXJvb3QgZmluYWxpemF0aW9uIHNjcmlwdCB3aXRoCj4gL2Jpbi9zaCwgYW5kIGZha2Vy
b290IHB1dHMgJChIT1NUX0RJUikvbGliIGluIExEX0xJQlJBUllfUEFUSDsgc28gd2hlbgo+IC9i
aW4vc2ggaXMgbGlua2VkIGFnYWluc3QgcmVhZGxpbmUgKGUuZy4gYmFzaCkgaXQgbG9hZHMgdGhp
cyBob3N0Cj4gbGlicmVhZGxpbmUuc28gcmF0aGVyIHRoYW4gdGhlIHN5c3RlbSBvbmUsIGFuZCBi
ZWNhdXNlIFVQIGlzIGEgZGF0YQo+IHN5bWJvbCB0aGUgbG9hZGVyIGFib3J0cyBiZWZvcmUgL2Jp
bi9zaCBjYW4gc3RhcnQ6Cj4gCj4gwqAgL2Jpbi9zaDogc3ltYm9sIGxvb2t1cCBlcnJvcjogbGli
cmVhZGxpbmUuc28uODogdW5kZWZpbmVkIHN5bWJvbDogVVAKPiAKPiBUaGlzIG9ubHkgaGFwcGVu
cyB3aGVuIHRoZSBob3N0J3MgL2Jpbi9zaCBsaW5rcyByZWFkbGluZSBhbmQgaG9zdC1nZGIgaXMK
PiBlbmFibGVkOyBvdGhlcndpc2UgdGhlIGhvc3QgbGlicmVhZGxpbmUuc28gaXMgbmV2ZXIgbG9h
ZGVkLCB3aGljaCBpcyB3aHkKPiBpdCBpcyBub3Qgc2VlbiBvbiBldmVyeSBidWlsZCBob3N0Lgo+
IAo+IFBhc3MgU0hMSUJfTElCUyBzbyByZWFkbGluZSdzIG93biBidWlsZCBsaW5rcyB0aGUgaG9z
dCBzaGFyZWQgbGlicmFyeQo+IGFnYWluc3QgdGhlIGxpYm5jdXJzZXN3IHRoYXQgaG9zdC1uY3Vy
c2VzIGFscmVhZHkgcHJvdmlkZXMgKGl0IGNhcnJpZXMKPiB0aGUgdGVybWNhcCBzeW1ib2xzKSwg
bWFraW5nIHRoZSBob3N0IGxpYnJlYWRsaW5lLnNvIHNlbGYtY29udGFpbmVkLgo+IE9ubHkgdGhl
IGhvc3QgbGlicmFyeSBpcyBjaGFuZ2VkOiB0aGUgdGFyZ2V0IGxpYnJhcnkgaXMgbmV2ZXIgbG9h
ZGVkCj4gZHVyaW5nIHRoZSBidWlsZCwgc28gaXQgY2Fubm90IGJyZWFrIGltYWdlIGdlbmVyYXRp
b24uCj4gCj4gRml4ZXM6IGQ5OGUxNWEzNjM5ZCAoInBhY2thZ2UvZ2RiOiByZWFsbHkgZml4IGJ1
aWxkIHdpdGggR0NDIDE1LnggYnkgdXNpbmcgZXh0ZXJuYWwgcmVhZGxpbmUiKQoKT25lIGNhbiBh
cmd1ZSB0aGF0IHRoZSBwcm9ibGVtIHdhcyBpbnRyb2R1Y2VkIGV2ZW4gZWFybGllciBieSBjb21t
aXQKYmFhODEzNjJlZiAoInBhY2thZ2UvcmVhZGxpbmU6IFVzZSBjb25maWd1cmUgb3B0aW9ucyB0
byBsaW5rIHdpdGggbmN1cnNlcyIpLApidXQgd2Fzbid0IHRyaWdnZXJlZCB1bnRpbCBkOThlMTVh
MzYzOWQuLi4KCj4gU2lnbmVkLW9mZi1ieTogUm95IEtvbGxlbiBTdmVuZHNlbiA8cm95a29sbGVu
c3ZlbmRzZW5AZ21haWwuY29tPgo+IC0tLQo+IMKgcGFja2FnZS9yZWFkbGluZS9yZWFkbGluZS5t
ayB8IDkgKysrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcmVhZGxpbmUvcmVhZGxpbmUubWsgYi9wYWNrYWdlL3JlYWRs
aW5lL3JlYWRsaW5lLm1rCj4gaW5kZXggZjY5Y2JlNDVlMi4uOTlkMzcxMWU3YiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3JlYWRsaW5lL3JlYWRsaW5lLm1rCj4gKysrIGIvcGFja2FnZS9yZWFkbGlu
ZS9yZWFkbGluZS5tawo+IEBAIC0zMCw1ICszMCwxNCBAQCBkZWZpbmUgUkVBRExJTkVfSU5TVEFM
TF9JTlBVVFJDCj4gwqBlbmRlZgo+IMKgUkVBRExJTkVfUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09L
UyArPSBSRUFETElORV9JTlNUQUxMX0lOUFVUUkMKPiDCoAo+ICsjIHJlYWRsaW5lIGRvZXMgbm90
IGxpbmsgaXRzIHNoYXJlZCBsaWJyYXJ5IGFnYWluc3QgdGhlIGN1cnNlcy90ZXJtY2FwCj4gKyMg
bGlicmFyeSwgbGVhdmluZyB0ZXJtY2FwIHN5bWJvbHMgKFVQLCBCQywgUEMpIHVuZGVmaW5lZC4g
ZmFrZXJvb3QgcnVucwo+ICsjIGl0cyBmaW5hbGl6YXRpb24gc2NyaXB0IHdpdGggJChIT1NUX0RJ
UikvbGliIGluIExEX0xJQlJBUllfUEFUSCwgc28gYQo+ICsjIHJlYWRsaW5lLWxpbmtlZCAvYmlu
L3NoIGxvYWRzIHRoaXMgaG9zdCBsaWJyZWFkbGluZS5zbyBkdXJpbmcgcm9vdAo+ICsjIGZpbGVz
eXN0ZW0gZ2VuZXJhdGlvbiBhbmQgYWJvcnRzIG9uIHRoZSB1bmRlZmluZWQgc3ltYm9scy4gTGlu
ayBpdAo+ICsjIGFnYWluc3QgdGhlIGxpYm5jdXJzZXN3IHRoYXQgaG9zdC1uY3Vyc2VzIHByb3Zp
ZGVzIChpdCBjYXJyaWVzIHRob3NlCj4gKyMgc3ltYm9scykgdmlhIHJlYWRsaW5lJ3MgU0hMSUJf
TElCUy4KPiArSE9TVF9SRUFETElORV9NQUtFX09QVFMgKz0gU0hMSUJfTElCUz0iLUwkKEhPU1Rf
RElSKS9saWIgLWxuY3Vyc2VzdyIKClRoaXMgYXNzdW1lcyB0aGF0IGhvc3QtbmN1cnNlcyBhbHdh
eXMgYnVpbGRzIHRoZSB3aWRlIHZhcmlhbnQuLi4gU2hvdWxkIHdlCmp1c3QgbWltaWMgY29tbWl0
IGJhYTgxMzYyZWYgaW5zdGVhZD8gU29tZXRoaW5nIGxpa2UKCkhPU1RfUkVBRExJTkVfQ09ORl9F
TlYgPSAkKFJFQURMSU5FX0NPTkZfRU5WKQpIT1NUX1JFQURMSU5FX0NPTkZfT1BUUyA9ICQoUkVB
RExJTkVfQ09ORl9PUFRTKQoKPwoKPiArCj4gwqAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkp
Cj4gwqAkKGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkKCi0tIApBbGV4YW5kZXIgU3Zl
cmRsaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
