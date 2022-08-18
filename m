Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D60C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 19:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C41C60655;
	Thu, 18 Aug 2022 19:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C41C60655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZVaHTbgAif9; Thu, 18 Aug 2022 19:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36B1960A6B;
	Thu, 18 Aug 2022 19:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36B1960A6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC8681BF4DD
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 19:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F42416F6
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 19:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3F42416F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uiQ76-Fpf4oa for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 19:02:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BB7D415D7
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BB7D415D7
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 19:02:04 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id h78so1769897iof.13
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 12:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:organization:date:to:from:subject
 :message-id:x-gm-message-state:from:to:cc;
 bh=xFLN5Y7+8E+TjsEORkZBhflsohO+qK4WpdDoFXdktvQ=;
 b=t62RMgQ0YjoNIkOYKkopXAMJshSHiA2z8Q7vV6v2drPpf98+nIfom6BECVZihEXDAi
 wOeuqGzl2j+GA+ljB184uL4kuBVEMbKRCsTFNqOGSb4lcyCY9XmNSyI1vNGxc1vvRXaf
 OwU9eFdQc6lh9TKS1qFrfI3m31CVwHeiVRMZN9NZnYWMX6sbusu3rnCnqNgAzxSxo3Ar
 iVKWDiW08t5k+kUtRuLs4vXimBSNO+VR2/mQXoRfObnyE01YJTQ86S1Sqy4iRK5LBD5V
 sULLk03WVaLN+yS/x9EY4xwaZcvY/IqgUmCcXSw4WEGMjp+qMPrpixD27tLiV3FvBofX
 89vQ==
X-Gm-Message-State: ACgBeo0L5Ff6gv/Vpg8DQpzKdmnNLJ3gNgyMewcnT6VZnuYspRQs02qm
 TrDqlJK6tj1SYLgrOwtOQYXXyYXh+1RuPBw=
X-Google-Smtp-Source: AA6agR6+846GdzKFLoOTogfESxYnFX7FRVCbGjsoTEp/dFYgyR8K9f/kXEdooHo0a3yt7ZGgtyvJjw==
X-Received: by 2002:a05:6638:258c:b0:346:c185:1146 with SMTP id
 s12-20020a056638258c00b00346c1851146mr2006309jat.68.1660849322148; 
 Thu, 18 Aug 2022 12:02:02 -0700 (PDT)
Received: from bixby.lan ([76.130.90.80]) by smtp.gmail.com with ESMTPSA id
 q9-20020a02b049000000b003434aec82a3sm886087jah.151.2022.08.18.12.02.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 12:02:01 -0700 (PDT)
Message-ID: <a616e2b3d0edf64b98a2114dad8086fcdd1088f4.camel@egauge.net>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 13:02:00 -0600
Organization: eGauge Systems LLC
Content-Type: multipart/mixed; boundary="=-wF51+q0NtE+eGgtTlQP/"
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egauge.net; s=google;
 h=mime-version:user-agent:organization:date:to:from:subject
 :message-id:from:to:cc;
 bh=xFLN5Y7+8E+TjsEORkZBhflsohO+qK4WpdDoFXdktvQ=;
 b=DORqdwkt7h5SVoEN22+BHbYtoC0BTDzPSOdgenxvKHmMWzgx+W1qvaIrTDDANoeR7A
 F9XorK+nG1FwfJacgtjQeGDDNX1t/togViUxi20gsKcISxNeAitF/LctkbIPXmz58S8+
 7ebW+/jOwVgYf+HrbDEvDpj9yK0wuk0kEpcjpcxKL437bXJJ8Ty6PQ7pw6Gew9nlVomL
 2/4M9zrZGEpar3u6+U/BrI2iBC8tASJrqB/X+L0/9ijywzYclk8dA93d1xt2/Rs+fdNx
 dGJrDovKP95YYULm3Cro3/5kG2iYaCOJQU53dtsmAFgoB5ek4AqIzn5gBevVBNS56x9a
 IQ/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=egauge.net header.i=@egauge.net
 header.a=rsa-sha256 header.s=google header.b=DORqdwkt
Subject: [Buildroot] add support for generating multiple UBI images
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
From: David Mosberger-Tang via buildroot <buildroot@buildroot.org>
Reply-To: David Mosberger-Tang <davidm@egauge.net>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--=-wF51+q0NtE+eGgtTlQP/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We have a need to be able to support multiple NAND devices with distinct fl=
ash
parameters.  For example, one device uses an erase block size of 128KiB whi=
le
another uses 256KiB.  Depending on supply-chain availability, we may get bo=
ards
with one device or the other.  Because of this, we'd like the ability to cr=
eate
multiple UBI images with a single "make" command so that we can be sure all
images are always up-to-date.

To accomplish this, I modified the build environment as per attached patch.=
  The
patch is relative to version 2017.02.5 and I see that, in the meantime, ubi=
fs.mk
and ubi.mk have been split into separate directories.  Thus, the attached p=
atch
won't apply directly.  However, I thought I'd share it as a basis for discu=
ssion
in case anyone else has similar needs.  I'm sure there are better ways of
accomplishing the same, but the patch works for our purposes and, if this i=
s of
interest to others, I'd be happy on rework it for the latest buildroot vers=
ion
and incorporate other feedback.

With the patch applied, the NAND flash parameters can be specified with a s=
ingle
config option BR2_TARGET_ROOTFS_UBIFS_PARAMS.  It expects a blank-separated=
 list
of triplets which specify the Logical Erase Block size, the minimum I/O siz=
e,
and the Physical Erase Block size in bytes (as hex strings).  For example, =
with:

 BR2_TARGET_ROOTFS_UBIFS_PARAMS=3D"0x1f000-0x800-0x20000 0x3e000-0x1000-0x4=
0000"

You'd get two images:

 rootfs.ubi-eb128k-pg2k and rootfs.ubi-eb256k-pg4

with:

 Logical Erase Block size: 0x1f000 and 0x3e000, respectively
 Minimum I/O size: 0x800 and 0x1000, respectively
 Physical Erase Block size: 0x20000 and 0x40000, respectively

(The patch assumes the subpage size is constant across the images.)

Best regards,

  --david


--=-wF51+q0NtE+eGgtTlQP/
Content-Disposition: attachment; filename="ubifs-multi-image-creation.diff"
Content-Type: text/x-patch; name="ubifs-multi-image-creation.diff"; charset="UTF-8"
Content-Transfer-Encoding: base64

Y29tbWl0IDAzZDA3ZDA3ZTllNjg2ZmUzODhkYTM2MmQ4ZTE0ZGIzNjk0NzRhYzQKQXV0aG9yOiBE
YXZpZCBNb3NiZXJnZXItVGFuZyA8ZGF2aWRtQGVnYXVnZS5uZXQ+CkRhdGU6ICAgVGh1IEF1ZyAx
OCAxMDo1MTo1MCAyMDIyIC0wNjAwCgogICAgZnM6IHViaWZzOiBzdXBwb3J0IGdlbmVyYXRpbmcg
bXVsdGlwbGUgVUJJIGltYWdlcwogICAgCiAgICBUaGlzIGlzIG5lZWRlZCBpbiBvcmRlciB0byBi
ZSBhYmxlIHRvIGhhbmRsZSBOQU5EIGZsYXNoIGNoaXBzIHdpdGgKICAgIGRpZmZlcmVudCBwYXJh
bWV0ZXJzLgoKZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL0NvbmZpZy5pbiBiL2ZzL3ViaWZzL0NvbmZp
Zy5pbgppbmRleCBmZjYwNGM1YzM4Li4yM2EzZjYxOTc3IDEwMDY0NAotLS0gYS9mcy91Ymlmcy9D
b25maWcuaW4KKysrIGIvZnMvdWJpZnMvQ29uZmlnLmluCkBAIC01LDE5ICs1LDE2IEBAIGNvbmZp
ZyBCUjJfVEFSR0VUX1JPT1RGU19VQklGUwogCiBpZiBCUjJfVEFSR0VUX1JPT1RGU19VQklGUwog
Ci1jb25maWcgQlIyX1RBUkdFVF9ST09URlNfVUJJRlNfTEVCU0laRQotCWhleCAibG9naWNhbCBl
cmFzZWJsb2NrIHNpemUiCi0JZGVmYXVsdCAweDFmODAwCi0JaGVscAotCSAgTG9naWNhbCBlcmFz
ZWJsb2NrIChMRUIpIHNpemUuIFRoZSB2YWx1ZSBwcm92aWRlZCBoZXJlIGlzCi0JICBwYXNzZWQg
dG8gdGhlIC1lLy0tbGViLXNpemUgb3B0aW9uIG9mIG1rZnMudWJpZnMuCi0KLWNvbmZpZyBCUjJf
VEFSR0VUX1JPT1RGU19VQklGU19NSU5JT1NJWkUKLQloZXggIm1pbmltdW0gSS9PIHVuaXQgc2l6
ZSIKLQlkZWZhdWx0IDB4ODAwCi0JaGVscAotCSAgTWluaW11bSBJL08gdW5pdCBzaXplLiBUaGUg
dmFsdWUgcHJvdmlkZWQgaGVyZSBpcyBwYXNzZWQKLQkgIHRvIHRoZSAtbS8tLW1pbi1pby1zaXpl
IG9wdGlvbiBvZiBta2ZzLnViaWZzL3ViaW5pemUuCitjb25maWcgQlIyX1RBUkdFVF9ST09URlNf
VUJJRlNfUEFSQU1TCisgICAgICAgc3RyaW5nICJMaXN0IG9mIFVCSUZTIHBhcmFtZXRlcnMgZm9y
IHdoaWNoIGltYWdlcyBzaG91bGQgYmUgZ2VuZXJhdGVkLiIKKyAgICAgICBkZWZhdWx0ICIweDFm
MDAwLTB4ODAwLTB4MjAwMDAiCisgICAgICAgaGVscAorCSAgVGhpcyBsaXN0IGNvbnRhaW5zIG9u
ZSBvciBtb3JlIFVCSUZTIHBhcmFtZXRlciBzZXRzIGZvciB3aGljaCB0bworCSAgZ2VuZXJhdGUg
aW1hZ2VzIGZvci4gIEVhY2ggcGFyYW1ldGVyIHNldCBjb25zaXN0cyBvZiB0aHJlZQorCSAgaGV4
IHN0cmluZ3Mgc2VwYXJhdGVkIGJ5IGRhc2hlcy4gIFRoZSBmaXJzdCBoZXggc3RyaW5nIHNwZWNp
ZmllcworCSAgdGhlIGxvZ2ljYWwgZXJhc2VibG9jayAoTEVCKSBzaXplIGluIGJ5dGVzLiAgVGhl
IHNlY29uZCB0aGUKKwkgIG1pbmltdW0gSS9PIHNpemUgaW4gYnl0ZXMgKGFsc28ga25vd24gYXMg
cGFnZSBzaXplIG9yIHdyaXRlIHNpemUpLgorCSAgVGhlIHRoaXJkIHRoZSBwaHlzaWNhbCBlcmFz
ZWJsb2NrIChQRUIpIHNpemUgaW4gYnl0ZXMuCiAKIGNvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19V
QklGU19NQVhMRUJDTlQKIAlpbnQgIm1heGltdW0gbG9naWNhbCBlcmFzZWJsb2NrIGNvdW50IgpA
QCAtMTAyLDE0ICs5OSw2IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19VQkkKIAogaWYgQlIy
X1RBUkdFVF9ST09URlNfVUJJCiAKLWNvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19VQklfUEVCU0la
RQotCWhleCAicGh5c2ljYWwgZXJhc2VibG9jayBzaXplIgotCWRlZmF1bHQgMHgyMDAwMAotCWhl
bHAKLQkgIFRlbGxzIHViaW5pemUgdGhlIHBoeXNpY2FsIGVyYXNlYmxvY2sgKFBFQikgc2l6ZSBv
ZiB0aGUKLQkgIGZsYXNoIGNoaXAgdGhlIHViaSBpbWFnZSBpcyBjcmVhdGVkIGZvci4gVGhlIHZh
bHVlIHByb3ZpZGVkCi0JICBoZXJlIGlzIHBhc3NlZCB0byB0aGUgLXAvLS1wZWItc2l6ZSBvcHRp
b24gb2YgdWJpbml6ZS4KLQogY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX1VCSV9TVUJTSVpFCiAJ
aW50ICJzdWItcGFnZSBzaXplIgogCWRlZmF1bHQgNTEyCmRpZmYgLS1naXQgYS9mcy91Ymlmcy91
YmktY29tbW9uLm1rIGIvZnMvdWJpZnMvdWJpLWNvbW1vbi5tawpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi44MjQyMzJiMDQwCi0tLSAvZGV2L251bGwKKysrIGIvZnMvdWJp
ZnMvdWJpLWNvbW1vbi5tawpAQCAtMCwwICsxLDIxIEBACisjCisjIEludm9rZSB0aGlzIG1hY3Jv
IHdpdGggJChjYWxsIFJPT1RGU19ET19VQklfUEFSQU1TIENNRCBQQVJBTVMpIHRvCisjIHNwbGl0
IHRoZSBVQklGUyBwYXJhbWV0ZXJzIFBBUkFNUyBhbmQgcGFzcyB0aGVtIHRvIG1hY3JvIENNRC4K
KyMgUEFSQU1TIG11c3QgYmUgb2YgdGhlIGZvcm0gIkxFQi1NSU5JTy1QRUIiIHdoZXJlIExFQiBp
cyB0aGUgbG9naWNhbAorIyBlcmFzZS1ibG9jayBzaXplIGluIGJ5dGVzLCBNSU5JTyBpcyB0aGUg
cGFnZSBzaXplIGluIGJ5dGVzLCBhbmQgUEVCCisjIGlzIHRoZSBwaHlzaWNhbCBlcmFzZS1ibG9j
ayBzaXplIGluIGJ5dGVzIChhbGwgdGhyZWUgbXVzdCBiZQorIyBzcGVjaWZpZWQgYXMgaGV4IHN0
cmluZ3MpLgorIworIyBDTUQgaXMgY2FsbGVkIHdpdGggcGFyYW1ldGVycyBMRUIsIE1JTklPLCBQ
RUIsIGFuZCBUQUcuICBUaGUgZmlyc3QKKyMgdGhyZWUgYXJlIGlkZW50aWNhbCB0byB0aGUgcmVz
cGVjdGl2ZSBwYXJhbWV0ZXJzIHBhc3NlZCBpbiBQQVJBTVMuCisjIFRBRyBpcyBhIGZpbGVuYW1l
IHRhZyBvZiB0aGUgZm9ybSAiZWIke2xlYn1rLXBnJHttaW5pb31rIiB3aGVyZQorIyAke2xlYn0g
aXMgTEVCIGFuZCAke21pbmlvfSBpcyBNSU5JTyBleHByZXNzZWQgaW4gS2lCIChhcyBhIGRlY2lt
YWwKKyMgbnVtYmVyKS4KKyMKK2V4cG9ydCBST09URlNfRE9fVUJJX1BBUkFNUyA9CQkJCQkJICBc
CisJcGFyYW1zPSIkKHN1YnN0IC0sICwkMikiOwkJCQkJICBcCisJbGViPSQkKGVjaG8gJCRwYXJh
bXMgfCBjdXQgLWYxIC1kJyAnKTsJCQkJICBcCisJbWluaW89JCQoZWNobyAkJHBhcmFtcyB8IGN1
dCAtZjIgLWQnICcpOwkJCSAgXAorCXBlYj0kJChlY2hvICQkcGFyYW1zIHwgY3V0IC1mMyAtZCcg
Jyk7CQkJCSAgXAorCXRhZz0kJChwcmludGYgImViJWRrLXBnJWRrIiAkJCgoJCRwZWIvMTAyNCkp
ICQkKCgkJG1pbmlvLzEwMjQpKSk7IFwKKwkkKGNhbGwgJDEsJCRsZWIsJCRtaW5pbywkJHBlYiwk
JHRhZykKZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3ViaS5tayBiL2ZzL3ViaWZzL3ViaS5tawppbmRl
eCBlNDg4Y2I1ZjhhLi5iZTIxMDdjMmE2IDEwMDY0NAotLS0gYS9mcy91Ymlmcy91YmkubWsKKysr
IGIvZnMvdWJpZnMvdWJpLm1rCkBAIC00LDggKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotVUJJX1VCSU5JWkVfT1BUUyA6PSAtbSAkKEJSMl9UQVJHRVRfUk9PVEZTX1VCSUZT
X01JTklPU0laRSkKLVVCSV9VQklOSVpFX09QVFMgKz0gLXAgJChCUjJfVEFSR0VUX1JPT1RGU19V
QklfUEVCU0laRSkKK1VCSV9VQklOSVpFX09QVFMgOj0KIGlmbmVxICgkKEJSMl9UQVJHRVRfUk9P
VEZTX1VCSV9TVUJTSVpFKSwwKQogVUJJX1VCSU5JWkVfT1BUUyArPSAtcyAkKEJSMl9UQVJHRVRf
Uk9PVEZTX1VCSV9TVUJTSVpFKQogZW5kaWYKQEAgLTIwLDEzICsxOSwyMCBAQCBlbHNlCiBVQklO
SVpFX0NPTkZJR19GSUxFX1BBVEggPSBmcy91Ymlmcy91YmluaXplLmNmZwogZW5kaWYKIAoraW5j
bHVkZSAkKGRpciAkKGxhc3R3b3JkICQoTUFLRUZJTEVfTElTVCkpKS91YmktY29tbW9uLm1rCisK
ICMgZG9uJ3QgdXNlIHNlZCAtaSBhcyBpdCBtaXNiZWhhdmVzIG9uIHN5c3RlbXMgd2l0aCBTRUxp
bnV4IGVuYWJsZWQgd2hlbiB0aGlzIGlzCiAjIGV4ZWN1dGVkIHRocm91Z2ggZmFrZXJvb3QgKHNl
ZSAjOTM4NikKK21rdWJpID0JCQkJCQkJCQlcCisJc2VkICJzO0JSMl9ST09URlNfVUJJRlNfUEFU
SDskQGZzLSQ0OyIJCQkJXAorCQkkKFVCSU5JWkVfQ09ORklHX0ZJTEVfUEFUSCkgPiAkKEJVSUxE
X0RJUikvdWJpbml6ZS5jZmc7CVwKKwkkKEhPU1RfRElSKS91c3Ivc2Jpbi91YmluaXplIC1vICRA
LSQ0ICQoVUJJX1VCSU5JWkVfT1BUUykJXAorCQktbSAkMiAtcCAkMyAkKEJVSUxEX0RJUikvdWJp
bml6ZS5jZmc7CQkJXAorCXJtICQoQlVJTERfRElSKS91YmluaXplLmNmZzsKKwogZGVmaW5lIFJP
T1RGU19VQklfQ01ECi0Jc2VkICdzO0JSMl9ST09URlNfVUJJRlNfUEFUSDskQGZzOycgXAotCQkk
KFVCSU5JWkVfQ09ORklHX0ZJTEVfUEFUSCkgPiAkKEJVSUxEX0RJUikvdWJpbml6ZS5jZmcKLQkk
KEhPU1RfRElSKS91c3Ivc2Jpbi91YmluaXplIC1vICRAICQoVUJJX1VCSU5JWkVfT1BUUykgJChC
VUlMRF9ESVIpL3ViaW5pemUuY2ZnCi0Jcm0gJChCVUlMRF9ESVIpL3ViaW5pemUuY2ZnCisJJChm
b3JlYWNoIHAsJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfUk9PVEZTX1VCSUZTX1BBUkFNUykp
LFwKKwkJJChjYWxsIFJPT1RGU19ET19VQklfUEFSQU1TLG1rdWJpLCRwKSkKIGVuZGVmCiAKICQo
ZXZhbCAkKGNhbGwgUk9PVEZTX1RBUkdFVCx1YmkpKQpkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvdWJp
ZnMubWsgYi9mcy91Ymlmcy91Ymlmcy5tawppbmRleCBmMWU0MTI2ZTg2Li5hNjc3OWY0OWU4IDEw
MDY0NAotLS0gYS9mcy91Ymlmcy91Ymlmcy5taworKysgYi9mcy91Ymlmcy91Ymlmcy5tawpAQCAt
NCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVVCSUZTX09QVFMgOj0g
LWUgJChCUjJfVEFSR0VUX1JPT1RGU19VQklGU19MRUJTSVpFKSAtYyAkKEJSMl9UQVJHRVRfUk9P
VEZTX1VCSUZTX01BWExFQkNOVCkgLW0gJChCUjJfVEFSR0VUX1JPT1RGU19VQklGU19NSU5JT1NJ
WkUpCitVQklGU19PUFRTIDo9IC1jICQoQlIyX1RBUkdFVF9ST09URlNfVUJJRlNfTUFYTEVCQ05U
KQogCiBpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX1VCSUZTX1JUX1pMSUIpLHkpCiBVQklGU19P
UFRTICs9IC14IHpsaWIKQEAgLTIwLDggKzIwLDE0IEBAIFVCSUZTX09QVFMgKz0gJChjYWxsIHFz
dHJpcCwkKEJSMl9UQVJHRVRfUk9PVEZTX1VCSUZTX09QVFMpKQogCiBST09URlNfVUJJRlNfREVQ
RU5ERU5DSUVTID0gaG9zdC1tdGQKIAoraW5jbHVkZSAkKGRpciAkKGxhc3R3b3JkICQoTUFLRUZJ
TEVfTElTVCkpKS91YmktY29tbW9uLm1rCisKK21rdWJpZnMgPSAkKEhPU1RfRElSKS91c3Ivc2Jp
bi9ta2ZzLnViaWZzIC1kICQoVEFSR0VUX0RJUikJXAorCQktZSAkMSAtbSAkMiAkKFVCSUZTX09Q
VFMpIC1vICRALSQ0OworCiBkZWZpbmUgUk9PVEZTX1VCSUZTX0NNRAotCSQoSE9TVF9ESVIpL3Vz
ci9zYmluL21rZnMudWJpZnMgLWQgJChUQVJHRVRfRElSKSAkKFVCSUZTX09QVFMpIC1vICRACisJ
JChmb3JlYWNoIHAsJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfUk9PVEZTX1VCSUZTX1BBUkFN
UykpLFwKKwkJJChjYWxsIFJPT1RGU19ET19VQklfUEFSQU1TLG1rdWJpZnMsJHApKQogZW5kZWYK
IAogJChldmFsICQoY2FsbCBST09URlNfVEFSR0VULHViaWZzKSkK


--=-wF51+q0NtE+eGgtTlQP/
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--=-wF51+q0NtE+eGgtTlQP/--
