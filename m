Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF0CE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 12:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AA6141ED0;
	Sun,  1 Oct 2023 12:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA6141ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1j2Y0NoGV1z; Sun,  1 Oct 2023 12:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 169BA41ED6;
	Sun,  1 Oct 2023 12:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 169BA41ED6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BB451BF32E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D30560D53
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D30560D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fzbm-zPmzhU for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 12:03:02 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6215260A6B
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 12:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6215260A6B
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4064867903cso54970015e9.2
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 05:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696161780; x=1696766580;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2MPryVI73QAucXSTiAz0iPwVsXo4sqZJ4fL3epXjLkA=;
 b=mWb1zeSSqO+fMyjJ9R5wi7uLk6JiXgOzdccT/kT2+eAjfdkyQj4p+8Bz4nFFHjAs+V
 BHPVpck+M4PccAPUzznIOaRbiX/8jlAx/w/YW1ukYzgD/r4dbGooeiY5HKEnvKnTXo6I
 OKnl+KFt2j9jTm/+Smx/NZZGZP+sPKMUKffOz5HTkytu6DMwaRfqKqK6TS2tKMxJ/5Rt
 o0ozU+v/6uNOQI+bjuDnF+Ee07oVsXEN84lSblUvgt6KR/4ehN3e25wQLCVnYAgVOVj9
 RX8mMDz8aQ0qNFce+IdIhiCVZpWPk0/vbrUk2a/q8tm+w+4sUe/ocU1vkKSkdb50wkjL
 7AoA==
X-Gm-Message-State: AOJu0YzRGdsbl6LIHiZAQaj2T3T52mJlDBnsYvtp/U/DdID25XADx3cT
 FsugK1S37mTLJt3TQC9wboapKqokI1kKH8+YIeE=
X-Google-Smtp-Source: AGHT+IEGAc8LtHN016nI3UuyzR7O2fnBXkikZY5s1/+w1vbNgNo+IzBODxZBO8ERb0c38pm+OQG3IQ==
X-Received: by 2002:a7b:cbc9:0:b0:401:d803:6243 with SMTP id
 n9-20020a7bcbc9000000b00401d8036243mr8063540wmi.32.1696161779563; 
 Sun, 01 Oct 2023 05:02:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a7bc4d1000000b003fe2a40d287sm5165857wmk.1.2023.10.01.05.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 05:02:59 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------v6aHxrD0EZxp6BcWcM08P7XE"
Message-ID: <3f01b947-21f8-d573-a8fe-b7ca6d044170@smile.fr>
Date: Sun, 1 Oct 2023 14:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr
To: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
References: <20221217051337.3778405-1-Mr.Bossman075@gmail.com>
 <20221217051337.3778405-5-Mr.Bossman075@gmail.com>
 <603887d9-3c48-b7de-3e5d-a472e6c08ed2@smile.fr>
 <ZRlajuI6BnIemOoO@waldemar-brodkorb.de>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZRlajuI6BnIemOoO@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696161780; x=1696766580;
 darn=buildroot.org; 
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MPryVI73QAucXSTiAz0iPwVsXo4sqZJ4fL3epXjLkA=;
 b=ZZ2M7aSeGHLVcSRxHT+lqws1gAU8dNevHgD2b+JVJ+9ykt3jE1FIGvCwzOzu+Yl4aU
 D+0soOpR0ibEiyrwg+9q+6wUyvBz9NISVuAnqz+J3mSftyEXA+H1LQoYxx8Ut3BFu/3L
 yRx9eGwNWCnRKFvUIWR1pP0T3VcQAx2M33zdFr0Yj6OBrE4pky2OU1wwkLuYJ4Rtc+dA
 HF2P5n9eXGDn0u/re9KRv3eEFRiTKLRCt9A96R44gwR5MHIoZoi1xIWB7jx/dtNxpdJg
 6UHi57prCgCzdrbBtCWmnVLvbjZ6vNVw63nTCYiAvixwa1cOp1isRMdwlVww6vqWcxRa
 Smtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZZ2M7aSe
Subject: Re: [Buildroot] [PATCH v2 4/4]
 configs/qemu_riscv32_nommu_virt_defconfig: New defconfig
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
Cc: Mark Corbin <mark@dibsco.co.uk>, Jesse Taube <mr.bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Charles Lohr <lohr85@gmail.com>,
 Yimin Gu <ustcymgu@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------v6aHxrD0EZxp6BcWcM08P7XE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Waldemar,

Le 01/10/2023 à 13:39, Waldemar Brodkorb a écrit :
> Hi Romain,
> 
> Romain Naour wrote,
> 
>> Hello,
>>
>> Le 17/12/2022 à 06:13, Jesse Taube a écrit :
>>> Add RISC-V 32-bit nommu defconfig for QEMU virt machine with MMU
>>> disabled.
>>>
>>> Unlike qemu_riscv32_virt, qemu_riscv32_nommu_virt does not use OpenSBI,
>>> since the kernel is running in machine mode (M-mode).
>>>
>>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>>> Cc: Yimin Gu <ustcymgu@gmail.com>
>>
>> I rebased the elf2flt patch for risc32 [1] on top of elf2flt 2023.09 release,
>> then I enabled the risc32 uclibc-ng support [2] without patching it since we use
>> the latest release (v1.0.44) containing this commit [3].
>>
>> But the system doesn't boot due to a reloc issue:
>>
>> binfmt_flat: reloc outside program 0xfff7b6dc (0 - 0x9cec0/0x8a180), killing sh!
>> Starting init: /bin/sh exists but couldn't execute it (error -8)
>>
>> This issue may be related to the toolchain used to build this defconfig (gcc
>> 12.3.0 and binutils 2.40) that is newer than the toolchain used at the time this
>> series was tested.
> 
> Can you share your elf2flt patch, please. 

Sure, It the initial patch from Jesse Taube but without the relocation part that
was part of riscv64 commit:

https://github.com/uclinux-dev/elf2flt/commit/c5c8043c4d79a1cdd9bd359a542e6fdf3b04d5a1

I hope this can help.

Best regards,
Romain


> 
> best regards
>  Waldemar

--------------v6aHxrD0EZxp6BcWcM08P7XE
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Added-RISC-V-32-bit-support.patch"
Content-Disposition: attachment;
 filename="0001-Added-RISC-V-32-bit-support.patch"
Content-Transfer-Encoding: base64

RnJvbSBhZTc0YTlmOWIyMjgyZWM5MGQwZWIxYjczNThjMmUwZWQ0NzRhNGVmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBZaW1pbiBHdSA8dXN0Y3ltZ3VAZ21haWwuY29tPgpE
YXRlOiBXZWQsIDE0IERlYyAyMDIyIDA2OjQ5OjQ2IC0wNTAwClN1YmplY3Q6IFtQQVRDSF0g
QWRkZWQgUklTQy1WIDMyLWJpdCBzdXBwb3J0CgpBbGxvdyBlbGYyZmx0IHRvIHdvcmsgd2l0
aCBSSVNDLVYgMzItYml0IHRhcmdldHMuIFdpdGggdGhlc2UgY2hhbmdlcywgdGhlCnVjbGli
YyB0b29sY2hhaW4gYW5kIGJ1c3lib3ggY2FuIHdvcmsgZmluZSBmb3IgcnYzMiBubyBNTVUg
c3lzdGVtcyB3aXRoCm5vIG5vdGljYWJsZSBwcm9ibGVtLgpTaWduZWQtb2ZmLWJ5OiBKZXNz
ZSBUYXViZSA8TXIuQm9zc21hbjA3NUBnbWFpbC5jb20+CltBZGQgbW9yZSBFTEYgcmVsY28g
dHlwZXMgYW5kIGVkaXQgY29tbWl0IG1lc3NhZ2VdClNpZ25lZC1vZmYtYnk6IFlpbWluIEd1
IDx1c3RjeW1ndUBnbWFpbC5jb20+CltSb21haW46IHJlYmFzZSBvbiAyMDIzLjA5XQpTaWdu
ZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KLS0tCiBl
bGYyZmx0LmMgICAgfCA0ICsrKy0KIGxkLWVsZjJmbHQuYyB8IDIgKy0KIDIgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Vs
ZjJmbHQuYyBiL2VsZjJmbHQuYwppbmRleCBmMzdjZmEyLi5kNDZjMzI4IDEwMDY0NAotLS0g
YS9lbGYyZmx0LmMKKysrIGIvZWxmMmZsdC5jCkBAIC04MSw3ICs4MSw3IEBAIGNvbnN0IGNo
YXIgKmVsZjJmbHRfcHJvZ25hbWU7CiAjaW5jbHVkZSA8ZWxmL3Y4NTAuaD4KICNlbGlmIGRl
ZmluZWQoVEFSR0VUX3h0ZW5zYSkKICNpbmNsdWRlIDxlbGYveHRlbnNhLmg+Ci0jZWxpZiBk
ZWZpbmVkKFRBUkdFVF9yaXNjdjY0KQorI2VsaWYgZGVmaW5lZChUQVJHRVRfcmlzY3Y2NCkg
fHwgZGVmaW5lZChUQVJHRVRfcmlzY3YzMikKICNpbmNsdWRlIDxlbGYvcmlzY3YuaD4KICNl
bmRpZgogCkBAIC0xMjcsNiArMTI3LDggQEAgY29uc3QgY2hhciAqZWxmMmZsdF9wcm9nbmFt
ZTsKICNkZWZpbmUgQVJDSAkieHRlbnNhIgogI2VsaWYgZGVmaW5lZChUQVJHRVRfcmlzY3Y2
NCkKICNkZWZpbmUgQVJDSAkicmlzY3Y2NCIKKyNlbGlmIGRlZmluZWQoVEFSR0VUX3Jpc2N2
MzIpCisjZGVmaW5lIEFSQ0gJInJpc2N2MzIiCiAjZWxzZQogI2Vycm9yICJEb24ndCBrbm93
IGhvdyB0byBzdXBwb3J0IHlvdXIgQ1BVIGFyY2hpdGVjdHVyZT8/IgogI2VuZGlmCmRpZmYg
LS1naXQgYS9sZC1lbGYyZmx0LmMgYi9sZC1lbGYyZmx0LmMKaW5kZXggNzVlZTFiYi4uNjhi
MmE0YSAxMDA2NDQKLS0tIGEvbGQtZWxmMmZsdC5jCisrKyBiL2xkLWVsZjJmbHQuYwpAQCAt
MzI3LDcgKzMyNyw3IEBAIHN0YXRpYyBpbnQgZG9fZmluYWxfbGluayh2b2lkKQogCS8qIHJp
c2N2IGFkZHMgYSBnbG9iYWwgcG9pbnRlciBzeW1ib2wgdG8gdGhlIGxpbmtlciBmaWxlIHdp
dGggdGhlCiAJICAgIlJJU0NWX0dQOiIgcHJlZml4LiBSZW1vdmUgdGhlIHByZWZpeCBmb3Ig
cmlzY3Y2NCBhcmNoaXRlY3R1cmUgYW5kCiAJICAgdGhlIGVudGlyZSBsaW5lIGZvciBvdGhl
ciBhcmNoaXRlY3R1cmVzLiAqLwotCWlmIChzdHJlcShUQVJHRVRfQ1BVLCAicmlzY3Y2NCIp
KQorCWlmIChzdHJlcShUQVJHRVRfQ1BVLCAicmlzY3Y2NCIpIHx8IHN0cmVxKFRBUkdFVF9D
UFUsICJyaXNjdjMyIikpCiAJCWFwcGVuZF9zZWQoJnNlZCwgIl5SSVNDVl9HUDoiLCAiIik7
CiAJZWxzZQogCQlhcHBlbmRfc2VkKCZzZWQsICJeUklTQ1ZfR1A6IiwgTlVMTCk7Ci0tIAoy
LjQxLjAKCg==

--------------v6aHxrD0EZxp6BcWcM08P7XE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------v6aHxrD0EZxp6BcWcM08P7XE--
