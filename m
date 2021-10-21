Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BD9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 08:56:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B418660EFE
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 08:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B418660EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 640AF407BA;
	Thu, 21 Oct 2021 08:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BpP3uPxffxPp; Thu, 21 Oct 2021 08:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8CEC40500;
	Thu, 21 Oct 2021 08:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5E41BF40E
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 08:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 198B280C18
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 08:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLK7KG0I5ine for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 08:56:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4996B80C1A
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 08:56:05 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x192so3250286lff.12
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y7OlSSB8F3xpCkKFKsCSjT7nGe7mrMaGVAOy7yes2ho=;
 b=pbqfFlUUNzk6LSxFNl7Ty9oxNJqnHsB3yMDCC5xS/+0tZEwxH5cApcD51KmkJ2iPAJ
 u8V8kyznfik23EAGIziSU9L2r2d+srB8HlkXr/DWzb9Wg7kGVN9spKzk0bTUulfQpEE6
 2J3FAqyGe1XkGs4xNPrkdd1fMeWik864icK7ehj/zdYnPwLXAyrr/UXzG2VnaMH5gxt7
 04SbPzkDZck2/1RTvXnWB2f+auk2D5Cz7H0bc5dsRvdy1EavLfCKjXPwz0UOmWoXQ9Kl
 /4mYLeZxgBnWt74bCXpqIe1oQaSdYp1l9l5tT+FGuTdT19l2XnQE5Hz0bH39IC5bp0SD
 FA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y7OlSSB8F3xpCkKFKsCSjT7nGe7mrMaGVAOy7yes2ho=;
 b=KEcv/shy36pjmYFeJD1TfGkFKDxJ9nKDwm3Nic4A4d+CG4HvAdpa4vf3tvn413BDw0
 iSl3bLPjp9O6S+F6i8wOLdgn0xFj5khjA6wmYNs4XzlNWkSICmxq2YfBQWX88L4ikdSB
 95KRI5x5BHxQivHHc8lcr+AKB9yIMPvKuqobqf+Ela60wdOjnGxhw+CD+qpokJ0vBx7Z
 m+GNxa0u5OdFMc4HJ+PCJz/sje+N9AAwUSYW/LCGYXXGTsjCpQMtgV2yV6sq46QVq0lA
 3Bz6+PB/DG+/jWlj6S2Bfpe88YR0Xc71SY0u1reCEjK3yL4RqReURYbdjtcIrez5t6TI
 79xg==
X-Gm-Message-State: AOAM533QQ218bry0LYlrU3261HBYcxSJ3nd2Nrryosy1Sveg13eid/3r
 HQ4jW1yWbXO5fa3UPtwb8O0BQcH44lo=
X-Google-Smtp-Source: ABdhPJwlPgr8MJw8ALoP50xHIMe+4nDezOYn+ic+faxf1hBxTY17tqbg42zy3TbohGwl2oOY/nYdBQ==
X-Received: by 2002:a05:6512:e96:: with SMTP id
 bi22mr4317774lfb.156.1634806563252; 
 Thu, 21 Oct 2021 01:56:03 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id d19sm403271lfa.271.2021.10.21.01.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 01:56:02 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Oct 2021 10:55:40 +0200
Message-Id: <20211021085540.18764-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/broadcom: add support for bcm47xx
 platform devices
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKQnJvYWRjb20ncyBiY200
N3h4IGlzIGEgZmFtaWx5IG9mIE1JUFMgU29DcyBnb2luZyBiYWNrIHRvIHRoZSAyMDAyIGFuZApp
bmNsdWRpbmcgZS5nLiBMaW5rc3lzIFdSVDU0RyB3aXRoIGl0cyBCQ000NzAyLiBJdCBldm9sdmVk
IHRocm91Z2ggeWVhcnMKYW5kIGl0cyBsYXRlc3QgbW9kZWwgQkNNNDcwNiBpcyBzdGlsbCBpbiB1
c2Ugbm93YWRheXMuCgpQcmV0dHkgbXVjaCBhbGwgU29DcyBjb250YWluIGFsbCBmb2xsb3dpbmcg
Y29tcG9uZW50czoKMS4gQ1BVCjIuIFBDSWUgY29udHJvbGxlcihzKQozLiBFdGhlcm5ldCBpbnRl
cmZhY2UocykKNC4gVVNCIGNvbnRyb2xsZXJzCjUuIFNlcmlhbCBmbGFzaCBjb250cm9sbGVyCjYu
IEdQSU8gY29udHJvbGxlciAoZm9yIExFRHMgYW5kIGJ1dHRvbnMpCjcuIFdhdGNoZG9nCgpVcHN0
cmVhbSBrZXJuZWwgaW5jbHVkZXMgYSBwcmV0dHkgbXVjaCBjb21wbGV0ZSBzdXBwb3J0IGZvciBi
Y200N3h4IGJ1dAppdCBpc24ndCBEVFMgYmFzZWQuIEJvYXJkIGRldGVjdGlvbiBpcyBoYW5kbGVk
IG9uIHJ1bnRpbWUgc28gdGhlcmUgaXMKb25lIGtlcm5lbCBpbWFnZSB0byBzZXJ2ZSBhbGwuCgpC
b290bG9hZGVyIHVzZWQgaW4gdGhvc2UgZGV2aWNlcyBpcyBDRkUuIEl0IGFsbG93cyBib290aW5n
IGtlcm5lbCBvdmVyCnRmdHAgYW5kIGZsYXNoaW5nIGZpcm13YXJlcyB1c2luZyBUUlggZm9ybWF0
LiBJdCBpc24ndCBwcm9wZXJseSBvcGVuCnNvdXJjZWQgKGV4Y2VwdCBzb21lIGVhcmx5IHZlcnNp
b25zKSBhbmQgaW4gcHJhY3RpY2UgaXQncyBpcnJlcGxhY2VhYmxlLgoKVGhpcyBjb21taXQgYWRk
cyBzdXBwb3J0IGZvciBidWlsZGluZyBhIGJvb3RhYmxlIGtlcm5lbCBiYXNlZCBvbiA1LjQKc3Rh
YmxlIHJlbGVhc2U6ClN0YXJ0aW5nIHByb2dyYW0gYXQgMHg4MDAwMTAwMApMaW51eCB2ZXJzaW9u
IDUuNC4xNTUgKHJtaWxlY2tpQGxvY2FsaG9zdC5sb2NhbGRvbWFpbikgKGdjYyB2ZXJzaW9uIDEw
LjMuMCAoQnVpbGRyb290IDIwMjEuMDgtOTMwLWdjMGM5MjU2MDVkKSkgIzUgVGh1IE9jdCAyMSAx
MDoxNjoyMCBDRVNUIDIwMjEKCkxpbnV4IDUuMTAgZG9lc24ndCBzdGFydCBib290aW5nIGR1ZSB0
byBzb21lIHJlZ3Jlc3Npb24gdGhhdCByZW1haW5zIHRvCmJlIGRlYnVnZ2VkLiBBZGRpbmcgc3Vw
cG9ydCBmb3IgYnVpbGRpbmcgZnVsbCBpbWFnZXMgKGluY2x1ZGluZyByb290ZnMpCmlzIGFsc28g
cGxhbm5lZCBmb3IgdGhlIGZ1dHVyZS4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KLS0tCiBib2FyZC9icm9hZGNvbS9iY200N3h4L2xpbnV4LmNvbmZp
ZyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGNvbmZpZ3MvYnJvYWRjb21fYmNt
NDd4eF9kZWZjb25maWcgIHwgIDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2Jyb2FkY29tL2JjbTQ3eHgvbGludXgu
Y29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9icm9hZGNvbV9iY200N3h4X2RlZmNv
bmZpZwoKZGlmZiAtLWdpdCBhL2JvYXJkL2Jyb2FkY29tL2JjbTQ3eHgvbGludXguY29uZmlnIGIv
Ym9hcmQvYnJvYWRjb20vYmNtNDd4eC9saW51eC5jb25maWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uMzA5NzY3NTlkOQotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL2Jy
b2FkY29tL2JjbTQ3eHgvbGludXguY29uZmlnCkBAIC0wLDAgKzEsMjggQEAKK0NPTkZJR19FTUJF
RERFRD15CitDT05GSUdfQkNNNDdYWD15CitDT05GSUdfQ1BVX01JUFMzMl9SMj15CisjIENPTkZJ
R19NSVBTX0ZQX1NVUFBPUlQgaXMgbm90IHNldAorQ09ORklHX0hJR0hNRU09eQorIyBDT05GSUdf
U1VTUEVORCBpcyBub3Qgc2V0CitDT05GSUdfUENJPXkKK0NPTkZJR19NVEQ9eQorQ09ORklHX01U
RF9CQ000N1hYX1BBUlRTPXkKK0NPTkZJR19NVERfUEFSU0VSX1RSWD15CitDT05GSUdfTVREX0JD
TTQ3WFhTRkxBU0g9eQorQ09ORklHX1NFUklBTF84MjUwPXkKK0NPTkZJR19TRVJJQUxfODI1MF9D
T05TT0xFPXkKK0NPTkZJR19XQVRDSERPRz15CitDT05GSUdfQkNNNDdYWF9XRFQ9eQorQ09ORklH
X0JDTUFfRFJJVkVSX0dNQUNfQ01OPXkKK0NPTkZJR19VU0I9eQorQ09ORklHX1VTQl9IQ0RfQkNN
QT15CitDT05GSUdfVVNCX0hDRF9TU0I9eQorQ09ORklHX05FV19MRURTPXkKK0NPTkZJR19MRURT
X0NMQVNTPXkKK0NPTkZJR19MRURTX0dQSU89eQorQ09ORklHX0xFRFNfVFJJR0dFUlM9eQorQ09O
RklHX0xFRFNfVFJJR0dFUl9USU1FUj15CitDT05GSUdfTEVEU19UUklHR0VSX0hFQVJUQkVBVD15
CitDT05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT049eQorQ09ORklHX0NNRExJTkVfQk9PTD15
CitDT05GSUdfQ01ETElORT0iY29uc29sZT10dHlTMCwxMTUyMDAiCmRpZmYgLS1naXQgYS9jb25m
aWdzL2Jyb2FkY29tX2JjbTQ3eHhfZGVmY29uZmlnIGIvY29uZmlncy9icm9hZGNvbV9iY200N3h4
X2RlZmNvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43YjRhYTE2
NDI5Ci0tLSAvZGV2L251bGwKKysrIGIvY29uZmlncy9icm9hZGNvbV9iY200N3h4X2RlZmNvbmZp
ZwpAQCAtMCwwICsxLDggQEAKK0JSMl9taXBzZWw9eQorQlIyX0tFUk5FTF9IRUFERVJTXzVfND15
CitCUjJfTElOVVhfS0VSTkVMPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQor
QlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS40LjE1NSIKK0JSMl9MSU5V
WF9LRVJORUxfVVNFX0NVU1RPTV9DT05GSUc9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09O
RklHX0ZJTEU9ImJvYXJkL2Jyb2FkY29tL2JjbTQ3eHgvbGludXguY29uZmlnIgorQlIyX0xJTlVY
X0tFUk5FTF9WTUxJTlVYPXkKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
