Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFDBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 854E28478F;
	Thu, 10 Mar 2022 20:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JS7dHQot7DhT; Thu, 10 Mar 2022 20:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE19E84730;
	Thu, 10 Mar 2022 20:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC1421BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA4BA40998
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uu29u-HnfumF for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:21:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48E9240979
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646943687;
 bh=aEzc+3VYBdIamZOI5iVwbJRdrWZa6PJ9KbXAYUf4wOE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=eA8ugdgptdMk0hKoUiYgTRwwREBUGS/xtdeKNy0Ip12z85GpF1/803vvYhjg0GLMj
 dI6EUYYVitm7oywOMp9K522OY6a/1JNp7vop3QT79aXnT7qmUAR1ZeV8SS21Q3HGb+
 5BIWE+nvr2Qj2iyEhU+mJcAyCtexBYx+SvI0x7zA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.204]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MrQEn-1nyBHM16RT-00oUQN for <buildroot@buildroot.org>; Thu, 10 Mar 2022
 21:21:27 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 21:21:26 +0100
Message-Id: <20220310202126.8379-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:n8a3YhwxWZg9EscBTkHFS7l0+0Y9MGA9+txBpBR2+zKTBv/6140
 MoYoLx6rQo886AFPDFdsrcaNutn/OlelrI5AXDibdPxJyTLmvLmURit/bQKO5w6SWBbkhQ/
 LAGRNSM77A5tfD05vHW+DYamzf06TQA+ljLMPewLLJY6oqKA6AIZlrYwBjLAeP9L8p2IhGY
 WS+C38x3EhJvlZDsbvlEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ammJOrxrGKI=:vFh3o/HOtK0Jbx+kfbPS1X
 1Qxk0cRL313MN+3LXUf0x9NQX7KsjG0PzTxa4F/I0Z/8io5+oHEBmVv9tt0E8J7FEDr5DO4Wi
 Fnlw+Vdf2mcJB4KLrZOOZIWYNHFwv6K9uM6qGsPlRMHl6bdi3S0lQqQep1CjPYQ6kg2L7pGSA
 0HJP8MKsVHd7ZXbWKcV6ZRIeM/k1C0lUdjVqjt5qCmir9uaqeCwCGNTAD2p8H9nx1oJXKuhsT
 5nm3/h2ekLuTrDd/DLKUaCF8SZZkiAs/2NYl6nIpQ064YbZHctrh5ujk6wGMOcvN9PbR21vgS
 krUucDjm1mULu/G7Yk/AjxJJi58+flDoNImI1YjfFFejc8hB/WzR4u2IfxxC9iDBgopk82xg2
 Ajgayt/MQo1UZKiTlW/Do6JImDnRjHy6mmIYqxDufxfrBnntDwC5hB9+lhkWQiktxaVr9JDxC
 gUrR1gc819bkx6I5JGohUNFiDPy8ZVvEmyByEbyO2qu+24yrjOfuuFmQNW7CjFRHB6koXShJh
 5rswrzB0LtRlkyVqbePDoJ3jN00OG8BZZZyQ/TIrU9J6P+tp6ycYd2rb3/IMjDHqRaxQ4MAiq
 46YwCWcqdw0fCnP/7vLh8nalHaHHrQ7PGiB7EMXO3I0y+25rLqxfKiKmp/kt/bHSBdCGXVubC
 0iARavogqYiLIE2RC8EXiDJ1WAitiYNIr8vcJo4+kdBhYUDGMWXEdA9E/Y3F3qyL2UT28PSlq
 hFy7sca4xjHC/Bxjz9IERqBG/mWOhvK6GKX25nODNn5l8xOHSh1GjI05wX5VIz+eeDbg3m0h1
 f9+i33M8yJr6TJwegr5clvhIXlrWvoYT1DoQk/4kzpoIfyHCLHTH2DY6u21XN20T1g+pXtAm2
 r1kvvrNT+aRXvMco5e2dZDGCg8ArsapztQ8lVXCW2OYcKbROfYuhtpipLImK50z+nCBbDr9HQ
 gpHpWET+UA0Pgw1jZ37/yn7FX4xoLGf+oH8lDj4QdmMOEZQWtnZb9wgpdoFtFy6YznhWuxsGt
 E9+fuc6VdOsWcFXFc0uV3mpfhgKNxw8t480Dnn6I9gMXV6qAETbwxFC5ZAbjy3CReaMNlrUn0
 +Jse5/R8jTsSf0=
Subject: [Buildroot] [PATCH v1] package/openssh: fix '-fzero-call-used-regs'
 option support detection
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

LSBhZGQgdXBzdHJlYW0gcGF0Y2ggKFsxXSkgdG8gZml4ICctZnplcm8tY2FsbC11c2VkLXJlZ3Mn
IGdjYyBjb21waWxlciBvcHRpb24KICBzdXBwb3J0IGRldGVjdGlvbgoKLSBhZGQgYXV0b3JlY29u
ZiBhcyB0aGUgcGF0Y2ggdG91Y2hlcyBtNC9vcGVuc3NoLm00CgpGaXhlczoKCiAgLSBodHRwczov
L2J1Z3MuYnVzeWJveC5uZXQvc2hvd19idWcuY2dpP2lkPTE0NjUxCgogIGJpdG1hcC5jOiBJbiBm
dW5jdGlvbiDigJhyZXNlcnZl4oCZOgogIGJpdG1hcC5jOjk4OjE6IHNvcnJ5LCB1bmltcGxlbWVu
dGVkOiDigJgtZnplcm8tY2FsbC11c2VkLXJlZ3PigJkgbm90IHN1cHBvcnRlZCBvbiB0aGlzIHRh
cmdldAogICAgIDk4IHwgfQogICAgICAgIHwgXgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
c3NoL29wZW5zc2gtcG9ydGFibGUvY29tbWl0L2YxMDc0NjcxNzk0MjhhMGUzZWE5ZTRhYTk3Mzhh
YzEyZmYwMjgyMmQucGF0Y2gKClNpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBv
cnRAZ214Lm5ldD4KLS0tCiAuLi5uLW9mLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzLWFsbC1zdXBwb3Iu
cGF0Y2ggfCAzOCArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5t
ayAgICAgICAgICAgICAgICAgICAgfCAgNCArKwogMiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuc3NoLzAwMDEtSW1wcm92ZS1k
ZXRlY3Rpb24tb2YtZnplcm8tY2FsbC11c2VkLXJlZ3MtYWxsLXN1cHBvci5wYXRjaAoKZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvb3BlbnNzaC8wMDAxLUltcHJvdmUtZGV0ZWN0aW9uLW9mLWZ6ZXJvLWNh
bGwtdXNlZC1yZWdzLWFsbC1zdXBwb3IucGF0Y2ggYi9wYWNrYWdlL29wZW5zc2gvMDAwMS1JbXBy
b3ZlLWRldGVjdGlvbi1vZi1memVyby1jYWxsLXVzZWQtcmVncy1hbGwtc3VwcG9yLnBhdGNoCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmNlNWM1NTM5ZmYKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL29wZW5zc2gvMDAwMS1JbXByb3ZlLWRldGVjdGlvbi1vZi1memVy
by1jYWxsLXVzZWQtcmVncy1hbGwtc3VwcG9yLnBhdGNoCkBAIC0wLDAgKzEsMzggQEAKK0Zyb20g
YjVmZWU1ZmU5OGY3MDhjMWRjNjFhMTU2NGRiMzVlYWNhZGJmZThiMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb206IENvbGluIFdhdHNvbiA8Y2p3YXRzb25AZGViaWFuLm9yZz4KK0RhdGU6
IFRodSwgMjQgRmViIDIwMjIgMTY6MDQ6MTggKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gSW1wcm92
ZSBkZXRlY3Rpb24gb2YgLWZ6ZXJvLWNhbGwtdXNlZC1yZWdzPWFsbCBzdXBwb3J0CisKK0dDQyBk
b2Vzbid0IHRlbGwgdXMgd2hldGhlciB0aGlzIG9wdGlvbiBpcyBzdXBwb3J0ZWQgdW5sZXNzIGl0
IHJ1bnMgaW50bwordGhlIHNpdHVhdGlvbiB3aGVyZSBpdCB3b3VsZCBuZWVkIHRvIGVtaXQgY29y
cmVzcG9uZGluZyBjb2RlLgorCitbVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3No
L29wZW5zc2gtcG9ydGFibGUvY29tbWl0L2YxMDc0NjcxNzk0MjhhMGUzZWE5ZTRhYTk3MzhhYzEy
ZmYwMjgyMmQucGF0Y2hdCitTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0
QGdteC5uZXQ+CistLS0KKyBtNC9vcGVuc3NoLm00IHwgMyArKysKKyAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9tNC9vcGVuc3NoLm00IGIvbTQvb3BlbnNz
aC5tNAoraW5kZXggNGY5YzM3OS4uOGMzM2M3MCAxMDA2NDQKKy0tLSBhL200L29wZW5zc2gubTQK
KysrKyBiL200L29wZW5zc2gubTQKK0BAIC0xNCw2ICsxNCw4IEBAIEFDX0RFRlVOKFtPU1NIX0NI
RUNLX0NGTEFHX0NPTVBJTEVdLCBbeworIAlBQ19DT01QSUxFX0lGRUxTRShbQUNfTEFOR19TT1VS
Q0UoW1sKKyAjaW5jbHVkZSA8c3RkbGliLmg+CisgI2luY2x1ZGUgPHN0ZGlvLmg+CisrLyogVHJp
dmlhbCBmdW5jdGlvbiB0byBoZWxwIHRlc3QgZm9yIC1memVyby1jYWxsLXVzZWQtcmVncyAqLwor
K3ZvaWQgZihpbnQgbikge30KKyBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpIHsKKyAJ
KHZvaWQpYXJndjsKKyAJLyogU29tZSBtYXRoIHRvIGNhdGNoIC1mdHJhcHYgcHJvYmxlbXMgaW4g
dGhlIHRvb2xjaGFpbiAqLworQEAgLTIxLDYgKzIzLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KSB7CisgCWZsb2F0IGwgPSBpICogMi4xOworIAlkb3VibGUgbSA9IGwgLyAwLjU7
CisgCWxvbmcgbG9uZyBpbnQgbiA9IGFyZ2MgKiAxMjM0NUxMLCBvID0gMTIzNDVMTCAqIChsb25n
IGxvbmcgaW50KWFyZ2M7CisrCWYoMCk7CisgCXByaW50ZigiJWQgJWQgJWQgJWYgJWYgJWxsZCAl
bGxkXG4iLCBpLCBqLCBrLCBsLCBtLCBuLCBvKTsKKyAJLyoKKyAJICogVGVzdCBmYWxsdGhyb3Vn
aCBiZWhhdmlvdXIuICBjbGFuZyAxMCdzIC1XaW1wbGljaXQtZmFsbHRocm91Z2ggZG9lcworLS0g
CisyLjM1LjEKKwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc3NoL29wZW5zc2gubWsgYi9wYWNr
YWdlL29wZW5zc2gvb3BlbnNzaC5tawppbmRleCAwZTBkNTllNmFiLi44NGFkZDk1NjNkIDEwMDY0
NAotLS0gYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5taworKysgYi9wYWNrYWdlL29wZW5zc2gv
b3BlbnNzaC5tawpAQCAtMTIsNiArMTIsMTAgQEAgT1BFTlNTSF9DUEVfSURfVVBEQVRFID0gJChP
UEVOU1NIX1ZFUlNJT05fTUlOT1IpCiBPUEVOU1NIX1NJVEUgPSBodHRwOi8vZnRwLm9wZW5ic2Qu
b3JnL3B1Yi9PcGVuQlNEL09wZW5TU0gvcG9ydGFibGUKIE9QRU5TU0hfTElDRU5TRSA9IEJTRC0z
LUNsYXVzZSwgQlNELTItQ2xhdXNlLCBQdWJsaWMgRG9tYWluCiBPUEVOU1NIX0xJQ0VOU0VfRklM
RVMgPSBMSUNFTkNFCisKKyMgcGF0Y2ggdG91Y2hpbmcgbTQvb3BlbnNzaC5tNAorT1BFTlNTSF9B
VVRPUkVDT05GID0gWUVTCisKIE9QRU5TU0hfQ09ORl9FTlYgPSBcCiAJTEQ9IiQoVEFSR0VUX0ND
KSIgXAogCUxERkxBR1M9IiQoVEFSR0VUX0NGTEFHUykiIFwKLS0gCjIuMzUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
