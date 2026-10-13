Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280B2CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 18:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6DB605AC;
	Tue, 13 Oct 2026 18:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1wR3lqIfTGE; Tue, 13 Oct 2026 18:58:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA4886072E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791917923;
	b=TUHJYSO/nxgUxFTHomRP8E7aKvD7BXMblrlZN8SBUvJ9XNkaf/1UyNF6jyNau96JpmvW
	 F3sH2UfsLhw4lj5Eq/PKKGXARON3KUo+v+MjDlVgG91h95JF8tPB7U0Gok9IDvkpHd8Hr
	 t3cTekjza08zXfVCY4oQbrM4Y7DCQE0mEqBCG3laydFlWKdFpHlyNssiQTLvpMrzFoTc7
	 D5qPcQr0olrZq8amkllrYgTxt3Eq199KXiYhWCBqee+64lkpVbp5lfFpUBKYik2pD5cG9
	 hEhYa3MOX78/2e2GgA0Q23TT6WHkYzAi57NYsErVllFF9w3lIWdEuOiuxmZYKDrZN/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791917923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MwNO3qcJva6reshe1MRPkhpEhKAFZqU12aUXDqEeJ2A=;
	b=F5mdONPPQMPaYxBwYCmEm0DL2k9VWYQ6bLL9jbrXpv+3vhBJqNSbC6iicI7CtfM1Gbxo
	 ESSDCb8rowhkZ7uiz6eNtHGtIPTIFuAOV43TXlk2tDqF2hKYxJARv/p1wMtWGO5yZkhyg
	 xfxtzwuMiQNhs/3TP3rlhBALjyiO6gf9jmO35e6MPXsftiQ2wwBKJNf73qz80xT6Bhsbc
	 aEhzH3syyOjFMatbSV4aB4FBKo3t901huCtCr814IMi670EbPKzJdKLzyojt8TtwiQw8z
	 4kGWYG4kjeR2ck1J68ZPHf8/kaH3WMePdGE9Gh4xcbl0e/4FRmEXwDhJMufXuNv/UAw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791917923;
	bh=MwNO3qcJva6reshe1MRPkhpEhKAFZqU12aUXDqEeJ2A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Fm/8+fdExtp4scuhoBmmffp3ia8Le46R+UwepOy155es9gNOQIsTG7KxK0W3kZHO8
	 OkC0jwPpXXYu/ngBtHj9nQ1F5RCB5Jeek5HtUsekJ9tTEHdD8RkeQmMO9U+8nyAodq
	 axJFiaJN1qh3Mf0uXM/grV5l/5Tr1JA/BLzZriqxMo1S/PuQbV0AH+EubKYRt71wm7
	 XdQVU+sZSK0rXAbZkwScuGujz1mpj4ft3AdtJXEZY1zQgbP3+fYo/bld8fLqGVzv6x
	 T+VFU+f99wB1f+Jod+iIYbFsWUDY8SElmisW7T8FAhIFE16naT079iV3DhSn/h2hz9
	 5jxFA89n2iuMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA4886072E;
	Tue, 13 Oct 2026 18:58:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED252AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E86A540426
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcGwtC2sluUb for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 18:58:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D52CB4039C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791917920;
 b=WOKePVI8NKV/pApwvv003jOpWiQSgB/OIgqcwqxrZ4gkZWng8XgmtAO7C7n1rZlUybTH
 ZoebZsDRrmYWal/b6AEL4wtb1i/Hsoem4isytNdm0/sltMhO2cJSoSGyZ0Jp5WCGb/tlp
 FIc2fFq7nRlIEvi53YIeJQU2yNZT5PeYVTVXBiqngefQJrNYbKsYh9dYTCRd2wRpBr4a8
 0hflfS9f8pY4dsEzR/157F5MmZ7gJJVGIIbzmQpwkNz6+lmkXdFUwSx58CDgogkt9cAS0
 hvGC/2jDQl1n20S0krv7ayVRIzMBHohhHGgV24lEAHm9dJNRzacFm1Gmmw+zH+/ys9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791917920;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=atfsqdXGSxzMPW6x4mNom+mNwel+MEotlbHpwtRzOgA=;
 b=pwE7S1uwcmHgcIoMb2hvOhCjgy2/yrf3XU91ymIVDvlLE+QPwKAMvpAsUacAo6vDP5Gp
 cKImDTegzL048j+Dv7DAyWzLH7wf4y1r3YXgRF3cueb2/zl+oT7SAHxObF+Ll2uYGJsPC
 exUk2MGTyH6zcbbhkeXijFOSyCGk4gzyGfTRN8lBHWKcWUFl0G4YIOi5K40/mkgIRKYPr
 XqYg/ibdFGWlPSbaDx73UqHLuLqN9tzUm3L6zNLzEqvOAlkq/OhsYEoEhfWrmU27lgUwg
 ERipoE0lD8/NAC4F8/yLCooApdfXSgDDFmaS8N1ePQKQJn2JYPHJB/fcDSomxU9wLBA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KJPxNj53; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=KJPxNj53
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D52CB4039C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 18:58:39 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48c6955a7c3so884226f8f.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791917917; x=1792522717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=atfsqdXGSxzMPW6x4mNom+mNwel+MEotlbHpwtRzOgA=;
 b=KJPxNj534d3wcsl50dw85R2BeiJa+CxfXrp/uq/sDsBoNNR/wg2TpOqUSGOvI1V3Ch
 wNpCv0/EZNSpnzVPDc1GaCGeH62XFwfo5k+otJEiA4kFc994kXP7NXK8gQMByRPlEdp2
 UNKC83BCLUy/jOWJsotb9YMvLOdbyx4KAO57TJh6gBU/rDpK+vEoUT9/bLhrPisqdj2g
 xR7P5rgRCwDgzxRCUu5iekhdeZLMNeStY/AzIas4U1SfLno75BKrhMMlcPi2d7jsvdFW
 bZ4Cn6hXUBDy/C010RpzCbbmojaTN+sijBRyZvf9clVMZWHRSw/jYAruN7N56ZMdv14L
 rCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791917917; x=1792522717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=atfsqdXGSxzMPW6x4mNom+mNwel+MEotlbHpwtRzOgA=;
 b=HiWkO9D2Bkp18N9F54vC9jhwhRlsglylYCa2WnF69ma2g80bf3Dg0qoX/+ARdBHeha
 t0rZUR9zy9+C4oYE6uXa+rsULL1+nQBjwpPvcbRpkcHHalbBKh2zAHEq4SVY2wzPh3Vy
 YHPknBhGX+pzp64xE1RrmyF61W5Lz7jwcqJeCt4I0Ki/NU7c0ILPWAphldqeTnA74V0J
 8JMFXN6G4poeLOGkoOttccCLCGDjp/QH31n2kexmiVrKooc5oC3ERjM3E6VCaS87fewv
 GnKVRQzNpSRM2Twy2ML1C42KKaoQAvpPgrT+uvr9Apc52tOJ9rHfd3IXRsPB2qsJiRSZ
 8duw==
X-Gm-Message-State: AFq9FYJqMdQ1TzT2Tixur30kO3KraJ4ztgrIIWxz8mmUuCROZ7NqFg3g
 j4prtIZ140yycWa6m0QvXRqMTiP5dPVPkhIbCU6WRPRUz/c7WHvBt0Vo
X-Gm-Gg: AYBFou2Pmut9I7WiRP/XMcC+seIyMUCKNlAJ5SNTLG7kX4FbAmPPPzq/2UcRiJW8YyX
 ADJV8afXEW9S+4FSSfWtX1Rj8sOU2qFr00sMTd2qNgykCw07EkxeDmFeIo7ttjK55SjX9gTf53e
 sCulk9a693TG/Tgx26g3n/s163c6t5/yGqie6xnKMEM64QgPXlkw341rXrBFL3lviC6GesEsfIc
 Ri5gjZg7KBv58X5v8tmDFOxOeUXGfOEkriI2kYACM65vXYlwonYZK73ISriMQr25qfZWitqeCN6
 wjjs9o6MLOpPz42Ff60DwkKkfN9O8cKSxtwFZ/VsRjHbXsSzQeRgj/fC55UCz6oBaScLhZpLuBS
 VQeYsIBYax5WNyHcgfixp4QVTVdL4KmCz7jkFWvCrWStXhckt7F/0fkUU/IQ3h9SJfBnIcJt1/i
 XV/vqpO15o2rVLaTsc7uNYVcosuKJZrlThQ5DiRzvnkj76MYPic3+OZQhGA3jBJJgM6MeYh+lJF
 BahG0RbWmwd06g23FnZVJxI4KgOxo0msEvAuoanyI6Y1tsm
X-Received: by 2002:adf:f782:0:b0:48c:71b8:c633 with SMTP id
 ffacd0b85a97d-48dbad34569mr20608284f8f.43.1791917917271; 
 Tue, 13 Oct 2026 11:58:37 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.72.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaa9f9sm6982078f8f.19.2026.10.13.11.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 11:58:36 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Oct 2026 21:58:33 +0300
Message-ID: <20261013185833.7831-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <874iesh7c2.fsf@dell.be.48ers.dk>
References: <874iesh7c2.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 RESEND 3/3] support/testing: add snappy
 test
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 11, 2026 at 1:14 PM, Peter Korsgaard wrote:
>> Add a simple test case that imports the module and does a simple compress
>> decompress routine.
>
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>>  DEVELOPERS                                    |  2 ++
>>  .../tests/package/sample_python_snappy.py     |  7 ++++
>>  .../tests/package/test_python_snappy.py       | 34 +++++++++++++++++++
>>  3 files changed, 43 insertions(+)
>>  create mode 100644 support/testing/tests/package/sample_python_snappy.py
>>  create mode 100644 support/testing/tests/package/test_python_snappy.py
>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index dbe05b7806..153b2f4af5 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1140,6 +1140,8 @@ F:=09package/python-cramjam/
>>  F:=09package/python-rich/
>>  F:=09package/python-smmap2/
>>  F:=09package/python-snappy/
>> +F:=09support/testing/tests/package/sample_python_snappy.py
>> +F:=09support/testing/tests/package/test_python_snappy.py
>=20
>>  N:=09Fl=C3=A1vio Tapaj=C3=B3s <flavio.tapajos@newtesc.com.br>
>>  F:=09configs/asus_tinker-s_rk3288_defconfig
>> diff --git a/support/testing/tests/package/sample_python_snappy.py b/sup=
>port/testing/tests/package/sample_python_snappy.py
>> new file mode 100644
>> index 0000000000..ff2c07c05a
>> --- /dev/null
>> +++ b/support/testing/tests/package/sample_python_snappy.py
>> @@ -0,0 +1,7 @@
>> +import snappy
>> +
>> +payload =3D b"Buildroot python-snappy runtime test\n"
>> +compressed =3D snappy.compress(payload)
>> +decompressed =3D snappy.uncompress(compressed)
>> +
>> +assert decompressed =3D=3D payload
>> diff --git a/support/testing/tests/package/test_python_snappy.py b/suppo=
>rt/testing/tests/package/test_python_snappy.py
>> new file mode 100644
>> index 0000000000..8c0092bd23
>> --- /dev/null
>> +++ b/support/testing/tests/package/test_python_snappy.py
>> @@ -0,0 +1,34 @@
>> +import os
>> +
>> +from tests.package.test_python import TestPythonPackageBase
>> +
>> +
>> +class TestPythonPy3Snappy(TestPythonPackageBase):
>> +    __test__ =3D True
>> +    config =3D """
>> +        BR2_aarch64=3Dy
>> +        BR2_TOOLCHAIN_EXTERNAL=3Dy
>> +        BR2_TARGET_GENERIC_GETTY_PORT=3D"ttyAMA0"
>> +        BR2_LINUX_KERNEL=3Dy
>> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
>> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.6.135"
>> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
>> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/aarch64-virt/=
>linux.config"
>> +        BR2_PACKAGE_PYTHON3=3Dy
>> +        BR2_PACKAGE_PYTHON_SNAPPY=3Dy
>> +        BR2_TARGET_ROOTFS_CPIO=3Dy
>> +        # BR2_TARGET_ROOTFS_TAR is not set
>> +        """
>
>Ideally we should fix the issue that you run into with our default armv5
>kernel or at least document why we need this. As an alternative the
>standard armv7 kernel could also be used, similar to E.G. test_bat.py
>

Bump to 2.14.0 solved the issue, so the test runs OK also on default armv5 now.

>
>> +    interpreter =3D "python3"
>

It will be removed in v5.

>The default is fine here, so no need to override.
>
>> +    sample_scripts =3D ["tests/package/sample_python_snappy.py"]
>> +    timeout =3D 20
>
>Why?

It will be removed in v5.

Thanks a lot,
Flaviu.

>--=20
>Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
