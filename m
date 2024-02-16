Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F4C4829E
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 01:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DE5C404F8;
	Fri, 16 Feb 2024 01:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mbau5NTErWra; Fri, 16 Feb 2024 01:19:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9809400EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9809400EB;
	Fri, 16 Feb 2024 01:19:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E95AA1BF2C0
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 01:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEFF8605BB
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 01:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Xgxq_cpeQgC for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 01:19:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B175E605AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B175E605AF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B175E605AF
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 01:19:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so14751725e9.0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708046370; x=1708651170;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5zUUfYDXnvh7oT/k/jENNqw62WqeRjJborxSNukx0HQ=;
 b=GHCFvvd32JUQCxNkAUnG6ZsSNka7PEd26VSsRn/PjcS5YYqn3f/nnQlzCsBJsYps4H
 esccANR5mXCFktPLtpJd0+4M+DmTNObetTXh5sHl9Mhixz5icKY8yCMSkZ9Doawagxcz
 fOsb7ww2yzIlZJVwB8oyym4JSSqtkL8zcL0nBU5UthonIMCofUemB8Uy5kQLisdkfS+V
 XpAEBzIJobzLMrDyQSDg67Z7oH2zsL+B4AtwpC8qhS9LipFs0yLZFWz/J7AVnJGBF42S
 4gv8qZtRPymAj8s2Y39TCsZ1qSN7jmGw26zpFIK/mw+iDWiJAbB9kJuQZp2FRjzhRgK5
 vECQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ0xNdYToNAZ7bbtVOaaYQTwpe0nvloGU+xFD0qEJGk1a+7HcXy/EIxK/f5qrNpSSVlUGB0LmIRygmIJEFVTCk5lnv5Gv5zg==
X-Gm-Message-State: AOJu0Yy1jyr3m07ii8kTIA82iYHYVGIoBQUwcuEGoJ+qZm0o6w5ZIThX
 CF0JSXSqcYseL+xRAaVKQnPKcvqw3GJX+mc7sUMIyXqabXQ3jbxg
X-Google-Smtp-Source: AGHT+IH/y2uDANbie4XXTP4dDow5haKfV6dXA9ViLd7j+Gij3cZNiiZDsSBN6+ASnCRkH+lbQM0psw==
X-Received: by 2002:a05:600c:4f91:b0:412:17ac:3df1 with SMTP id
 n17-20020a05600c4f9100b0041217ac3df1mr3011901wmq.14.1708046370467; 
 Thu, 15 Feb 2024 17:19:30 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 jl22-20020a05600c6a9600b0041069adbd87sm722053wmb.21.2024.02.15.17.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 17:19:30 -0800 (PST)
Message-ID: <6f7f293b44ddef1809b59ff0d17ec00c816dd7ba.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Fri, 16 Feb 2024 02:19:31 +0100
In-Reply-To: <20240213172817.2872849-19-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-19-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=mQINBGWpGj8BEACy09IxfduHTzAdqKkf3SmGIHIEquHWHIXqgVIoZo/ufP8mIpsWYwFKP9gsCvVvNNugtK8YPN92lbHol35nfZiXLIp16ASRQXYFtBjXj4GAVjUPjaTkQbcedIgD2nEZ/HQSiohfnUSS0YmxI0UUJmZFulwQZil6OmPVbbQoda8/In5h/wNRo6y5vJreRhsjqcP5LckLRov3t+jabUzn0/1twHNO0SnI508dXenEhQcBX7Wns+JfwRqO8jxBK1P3DntW+n0OJ8DkjSMJjm0zk9JtY28WK332Vpq8smZxNDNCfs1YtRMzfEEZKRvxsSMzTxri/cw7VXJa7m138LlyPBkXizjAKqad/Mrthx4ambsWuRXyjklYOBYqMEAdlZNLPQnhnIICFwkJ/lnLE8Ek6Dh0NYl1HpsOyvu1ii7VPEXHLMGTKFmFmWtrmCUrHIBrAvStMJ2jIRhEyCGDpf6f5dfKNOb3GWRtX36326TDOa2eXWqaTQEPKWRSUwhC3f3j/C/o/vj6bDHQ8ZsNcKYxwtSoh+elHT5xtHOMvPBP6gavgZRDnH6wBSHWnXYxyOmZPKr2NuhMwhEyhpvkEq5zW6Z/hp5POzZ74GNkIKB5/FpETobgoV/XB2HMnlIUAJE2RYRYwvbgIkKTJxFD4FIIP2DVt/7cT/8ry5Nhe2fouscuDQARAQABtDFBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+iQJUBBMBCAA+FiEEYDtVWuq7d7K0J3aR+5lQra83LKgFAmWpGj8CGwMFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ+5lQra83LKjUHA/+KlP0no2WRK1co+2yi0Jz2kbSY61ZoX+Rq
 bLqkCoo1UxsU/MddscgjKOfggNASZ1l//jUkx39smTBONmxcauTtY4bB4Q9X8Djk+XO1
 M9iwGb7feCbnIuRHyvI3qygC+k3XgLIJScui3/yEL0aikd5U4F6nkKyQiPQk7ihKWKyBQXQ+tXS06mUH4p0O5BYvxijW32Z9esVB15OB8vUcx2bsdjogEuNc0uwOGMHsVIsW4qupoHRHPc1865uAqzv9vW3a2/GOG6IpBFjmXqg7Wy9zwVjSJFMvVxu2xs3RCdpS99aMrfA2na1vjC5A7gNFnr+/N2vtMBP0d0ESfd/54zSglu3FW0TIOIz7qkrWQKwiennfUun/mAvCynCrKpCpUMkEgeQw1rHCWpSfnJ6TPG0UfQGNUFyzzmBheQRSEksaepfCtqwCxtjF19JZ6yapLi/lQt7YBjwxIPkZRHJNelPkK/bs6yeRJul90+X6UAJstWh4mC7HzVvmopJoCxbInS4+L6qlefdjqhB6NYw9Q5GsRmTKalaqJoW1/kXopeGExCY4r1FP5ZoLHFs0xNbycpD2tp/GnI8GlYCIzQED3TNab7IkWP2otXnWAnF8CrqhglBbYnp8oCkgBPatYftO4dWFP3YLVWE0EtoWLLrmiWzHkbWc8YKpWAiFX8OhUJLKtC5Ag0EZakaPwEQAOGrFhtJCvAvfyTMNLl1gs52B3foxtRUzk1uaqSvl0NlePGzXlE1hNiO1eUHdfqB00ZfXxJkUrQEjhyr0Em5sQk3JtZ8/cEvaHYQ+SmHYjWqEoiDsKFtTHNMwq/fVLVyWvAc5OLjuehhjqm3Pg+BFWNs6atdc5HpmUAHZ0oKDHL/WWetkMfdl4t7zTFGWR/dBCaQVmP2Gi1ZE8DY6MswYQeeCfwVeQsIMcripdW7fuzWr34EYrszYMlR1WpFPO6sXpNRsfmrqKoriOmgWKWvugvDHcEy3ArYvmND1qXRADY7m6D5cfZVlyUSu3DwyzBK6e2Nq7RgZ0uN8
 tnbnyRNUS+yn7RPSJNG6dyrREgG/wx7d8fKszk3Xu9ByCCoqcwzpNF0o4lNW3IYlZZPJ7
 LtS/E5mMEHXrvnA4esKSmZO3vSksJ7R0L3DOChbRCqYnK5uBRlFixwHYnG8bp8SAJP+vgE5qrYED0rUquapGZfyezE8Zv9hTBPCUF8ee86Jahiy2h1YRpzPDCCk5vE0Kv9VkndL/X048NfjInCN6U3lvgjTS/vKwxXpLCzs3HFxc2RlxrCY+Rn+e/sXsE81c92hhm+zQrfcDQ3tT3scIgK8UVJ2W70BFlE/K6gldaBoHPKXuhSmH/55t6NLxxmUbwzitYYVEcGYylpoPO7LxFmO59ZABEBAAGJAjwEGAEIACYWIQRgO1Va6rt3srQndpH7mVCtrzcsqAUCZakaPwIbDAUJA8JnAAAKCRD7mVCtrzcsqG9YD/917AOp+yx7tJwKeylRtfhd3aVjJPnZMpk+OKSDp1/D8vuugl+szUZm+h1d3flYdtM+g66gkkHinqLLkEybUR1D2aYpJ9DucoSmCeNycnUn+p2h+bAbhb2aFSwOtH+chcBMwXJqiLRaE9Tdn2YdS6OEG+n2a6AXOBmtwoAUdnXgh1zIAkIoLeekLKZK4O/CrgHAhrQ8Kee+ymxbKuX93DexyNJA8dLJu4Q1E3s4nkxenETfiLtKShQCyx9QiAhbj72wf30y8eo5F/ufw7+/09warSPz0eWtkp0pbhFdalICIdsyfU85hteQra+k/9HsxnIAF9yC5XieRQB/Xk7Q+uINZ8gmx1Lkq7DEB52xYiE2Rcn636dGGf8IqszkQ96QKVWFEdsEfuWvnaZ6DAaiQATA90M+B2xlqgshRg+AXF35sS7E0PIYFxrkVI8uo7bpxrWCoZavsxLI3zFsmjebwCndr8AA2WFlhQBOu2ztEgWLJpqBNH8+fgxLEt+L+oRHFeU60XlowtDT/oGlbcbR/cNnZ8OLwr0esN4LuZWNW8uNB
 EZGRCtvlFXNm8HOqHhx3APBl3vHvsvJTIH9agXHgKmy6lviHFf0qyJsyVpoGonK1tjRTeh
 c1oMKY+O7/JqOhEp/NwI+HI3THVgagrBPOjbiUA3q/0FW1puGsOF69gZlFA==
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708046370; x=1708651170; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zUUfYDXnvh7oT/k/jENNqw62WqeRjJborxSNukx0HQ=;
 b=QfdgaTypeyESKUaDqw7CjHuOjfsH2ZTdwwSoSapZ43/b59PodEDjtvRBNZSofRQHre
 KreyvN++Jf3STj2Tr8uJ7fMGjhJYLkyRAfMuPLN0UUCopNVZaJ/nX5FjVIyHNo44eIui
 2E4VdXpsm+AM1iARj9b2VW5vyqd/uKqUvp+tPk37cIMLoHd2s/ZtwLTMEQdbwRlEeU6o
 pa+dut3apDcJBvvlZpuin3zoPPlch6CyCgSeGpWs+LO7th6urJL7ZbeIHnbAY+zOkYBk
 Ik8mTP6/6phGlfgmbLFYYp1n/rhxryQUThJWRe8nJq9kOd3V5Z/jOw5MkNOmVt/XB41n
 NeWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QfdgaTyp
Subject: Re: [Buildroot] [PATCH 18/21] configs/ti_j721e_sk_defconfig: new
 defconfig
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2JvYXJkL3RpL2o3MjFlLXNrL3Bvc3Qt
YnVpbGQuc2gKPiBAQCAtMCwwICsxLDE2IEBACj4gKyMhL2Jpbi9zaAo+ICtCT0FSRF9ESVI9IiQo
ZGlybmFtZSAkMCkiCgpVbnVzZWQgdmFyaWFibGU/Cgo+ICsKPiArIyB1LWJvb3QgaXMgbG9va2lu
ZyBhdCAvYm9vdC9kdGIvdGkgZm9yIGRldmljZXRyZWUgaW4gdGhlIHJvb3Rmcwo+ICsjIHBhcnRp
dGlvbiB3aGlsZSBCdWlsZHJvb3QgaW5zdGFsbCB0aGUga2VybmVsIGFuZCBpdHMgZGV2aWNldHJl
ZQo+ICsjIGluIC9ib290IChCUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUIGVuYWJsZWQp
Lgo+ICsjIEVuYWJsaW5nIEJSMl9MSU5VWF9LRVJORUxfRFRCX0tFRVBfRElSTkFNRSBhbGxvd3Mg
dG8ga2VlcCB0aGUKPiArIyAidGkiIHN1YmRpcmVjdG9yeSBidXQgImR0cyIgaXMgc3RpbGwgbWlz
c2luZy4KPiArIyBNYWtlIHN1cmUgL2Jvb3QvZHRiL3RpIGV4aXN0IGJ5IGNyZWF0aW5nIGEgc3lt
bGluayBpbgo+ICsjICR7VEFSR0VUX0RJUn0vYm9vdAo+ICsjIGh0dHBzOi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcvbWV0YS10aS90cmVlL21ldGEtdGktYnNwL3JlY2lwZXMta2VybmVsL2xpbnV4L3Rp
LWtlcm5lbC5pbmM/aD0wOS4wMi4wMC4wMDQjbjEzCj4gKyMgaHR0cHM6Ly9zb3VyY2UuZGVueC5k
ZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wMS9pbmNsdWRlL2Vudi90aS9tbWMuZW52P3Jl
Zl90eXBlPXRhZ3MjTDE4Cj4gK2lmIFsgLUwgJHtUQVJHRVRfRElSfS9ib290L2R0YiBdOyB0aGVu
Cj4gK8KgwqDCoCBybSAke1RBUkdFVF9ESVJ9L2Jvb3QvZHRiCj4gK8KgwqDCoCBsbiAtc2YgLiAk
e1RBUkdFVF9ESVJ9L2Jvb3QvZHRiCj4gK2ZpCgpUaGUgYWJvdmUgb25seSByZS1jcmVhdGVzIGEg
bGluayBpZiB0aGVyZSB3YXMgYWxyZWFkeSBhIGxpbmssIGJ1dCBkb2Vzbid0CmlmIGl0J3MgYSBj
bGVhbiBidWlsZC4gU2hvdWxkICJsbiAtc2YgLiAke1RBUkdFVF9ESVJ9L2Jvb3QvZHRiIiBiZSBv
dXRzaWRlCnRoZSAiaWYiPwoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
