Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54CFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6778140103;
	Sat,  8 Jan 2022 14:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4_qJ6pvVl8Yc; Sat,  8 Jan 2022 14:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F7AA40106;
	Sat,  8 Jan 2022 14:10:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8BA01BF2FA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD8CC81761
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYPu9T5FLe1b for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:09:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEF5C8175E
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 14:09:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso4521956wme.1
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 06:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=6mhCyi2wgThfcrxv3Ml0PLyvZhK7yCKyXCRthdhGkZU=;
 b=oR/hYfqabGXWMxdQVCeq2krGrdKJSX+o8SIj2KrDPY5GUvABdLyQyK8nr4QOz2q37E
 tNydbyMLo8dBKjDXx7y5YC1P82m8LmzOa/+LRNKiSIOxr1FvCsZrQZ4XaL42C9pCXJUt
 R6aWDb4ivpBiqG6vfzY35mHK045EhGamgN+Lytk61rEiYWPIHM02K2gSFy+A9hPFbRAl
 r4mzS5lD8q1g+JF3or9QfrSvhIt+qI9O/Jgz4l2qqinbv6DDpHm8e9cO0NI6h7/Effca
 dHWJvt/n/iMtDzBDY6Jw0BLzKnvNLIQJaUCp3fecDb6aKLz6AZ4O26gyuRwPGzk64Qhx
 9N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=6mhCyi2wgThfcrxv3Ml0PLyvZhK7yCKyXCRthdhGkZU=;
 b=pY15oaPsacnA9SPHZGCCJF86KxtYlXEbKSjwadvePB2wGOwcF7TVJ53lyruDccvR8i
 5uOOcE5Id7Ux9O9L+phFAdTyPhznGzVNoDs2WiQ8njC/c9byfYuh1MauIkWa8z7vPNNf
 c/6Mjsagb2RfECl9JX/KpBxiqNWigTqzzscC/MncJmUoKYbkpQ7Ri7QCg50A6aFsx5gS
 qDSM+ix1H7TR//q4DqXFcCzEDoMPWpJ87cjd//Bn/zppqT23L84LkmIgeiLusLF1xWkD
 oJ4M+ZIRZqPZ9yso7SjyE05qv9yuoomqZBDcVxdoHia0I1kARuL8RAFl8phcIeHs828j
 ypUg==
X-Gm-Message-State: AOAM530R+3oK/ddqrmDBO8/xqsCGNDLGmyN9EF6ClvVl1b8/2Sn0ElLs
 pIXDxAf7TBLJ7fDXBAjzp7oXuw==
X-Google-Smtp-Source: ABdhPJzIv9QUVPfWZGFeIqevymTtx+dJKuzEs/wtTso0hnw6FCpkcwkjSjf6jptt7UqJohsJVPfJOA==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr14710124wmh.133.1641650997820; 
 Sat, 08 Jan 2022 06:09:57 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id b14sm1805912wri.112.2022.01.08.06.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 06:09:57 -0800 (PST)
Message-ID: <8bfdc46b-bfbe-2470-0068-ca3a5d72fd89@smile.fr>
Date: Sat, 8 Jan 2022 15:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>, buildroot@busybox.net
References: <20210316143822.3421019-1-masahiroy@kernel.org>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20210316143822.3421019-1-masahiroy@kernel.org>
Subject: Re: [Buildroot] [PATCH 1/2] qemu_arm_versatile: switch to in-kernel
 defconfig + fragment
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFzYWhpcm8sIEFsbAoKTGUgMTYvMDMvMjAyMSDDoCAxNTozOCwgTWFzYWhpcm8gWWFt
YWRhIGEgw6ljcml0wqA6Cj4gVGhpcyBwbGF0Zm9ybSBoYXMgaXRzIG93biBrZXJuZWwgZGVmY29u
ZmlnIGluIEJ1aWxkcm9vdCwgYnV0IHdlIGNhbm5vdAo+IGdldCBxdWljayBpZGVhIGFib3V0IGhv
dyBtdWNoIGl0IGRpdmVyZ2VkIGZyb20gdGhlIGluLWtlcm5lbCBkZWZjb25maWcuCj4gCj4gTGV0
J3MgdXNlIHRoZSB1cHN0cmVhbSBhcmNoL2FybS9jb25maWcvdmVyc2F0aWxlX2RlZmNvbmZpZyBh
cyBhIGJhc2UsCj4gYW5kIG1haW50YWluIHRoZSBkaWZmIGFzIGEgbWVyZ2UtY29uZmlnIGZyYWdt
ZW50LiBUaGUgc2FtZSAuY29uZmlnIGlzCj4gc3RpbGwgZ2VuZXJhdGVkIGJhc2VkIG9uIHRoZSA1
LjEwLjcga2VybmVsLgo+IAo+IFRoZSBkaWZmIGlzIHF1aXRlIGJpZywgYnV0IHRoaXMgaXMgYSBn
b29kIHN0YXJ0LXBvaW50IGZvciBjbGVhbnVwcy4KPiBGb2xsb3ctdXAgd29ya3MgY2FuIGRyb3Ag
ZGlmZiBsaW5lcyB1bmxlc3Mgd2UgZmluZCBhIGdvb2QgcmVhc29uIGZvcgo+IGRpdmVyZ2VuY2Uu
CgpXZSB1c2UgYSBjdXN0b20ga2VybmVsIGRlZmNvbmZpZyBmb3IgdGhpcyBkZWZjb25maWcgc2lu
Y2UgaXQgd2FzIGFkZGVkIHRvCkJ1aWxkcm9vdCBbMV0uCgpJIGd1ZXNzIHRoZSBhaW0gb2YgaGF2
aW5nIGEgY3VzdG9tIGtlcm5lbCBkZWZjb25maWcgaXMgdG8gcmVkdWNlIHRoZSBidWlsZCB0aW1l
LgoKVGhpcyBkZWZjb25maWcgaXMgdXNlZCBmb3IgYm9vdCB0ZXN0aW5nIG9uIFFlbXUsIEknbSBu
b3Qgc3VyZSBpZiBpdCByZWFsbHkgdXNlZApmb3Igb3RoZXIgdXNlIGNhc2UuCgpIYXZlIHlvdSB0
ZXN0ZWQgd2l0aG91dCBhbnkgYWRkaXRpb25hbCBmcmFnbWVudD8KClsxXQpodHRwczovL2dpdC5i
dWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPWQzNzg5Y2UzYjcwYWFhYTVlMTgwZDA0
MWIyYWQyODJiMzZkOTI5ZWQKCkJlc3QgcmVnYXJkcywKUm9tYWluCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
