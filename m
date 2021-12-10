Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A2AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B5742490;
	Fri, 10 Dec 2021 14:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bfgq6vPtiXKV; Fri, 10 Dec 2021 14:25:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E36421BA;
	Fri, 10 Dec 2021 14:25:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6E11BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29B38421BA
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwCopay7DGy6 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:25:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCE1942093
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639146331;
 bh=MzQZMwfxQ2A9WezLEL/WzZohb+3uPtPGrKPaXXpw3wY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Kl0SeIMhrwuqVL8mkDN4q70xIYtfZKXArijvfqMj8R1lKD3uVDFhjIFsTdaX4Oygp
 lD04EXdXRYacxknR4dx0kjPYHLLlKVMdtne0nf8kSoypq69nF0MywehH3ApuKx+AmD
 V6NTXaCo4ivPnZ4f4iriQ63J6iGFfjcFB7UkQhoY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.99]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2wGs-1mz0Dv3AWy-003QQU
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 15:25:31 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 15:25:31 +0100
Message-Id: <20211210142531.14746-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:TAQmSamEXsO7SKenbP4MbHyHiZoTrPBc56V+vapAXdNOanR+uLk
 uzM65numDd7GgMoXeSc6GLXAI5gkR434D6J9tCk6Pt41MZ7116rVB6ud3EmuMQ+Yecng7kG
 ZD+Rvk+hrHuMUHiB6U1YwB0a86WYAZTJI0t7/+PREnmKF1YK4c4mRaFsT2SFQabn7zpzMOk
 YOEvckoS1VIGdgh6mdKQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2MHHXvAyhVc=:4iWmfrgez2fJFcgDheYkf2
 /CIuDf2njc6be2kNEY5SWe+VuevO1vwK18TGUfddFSrfmk8Es4verCbkxLko8KqjVqECzijkt
 8QzKLjZA227TCV5M9WmaVQFlszGqTtC8C1YTH/deIcdPwIYIC1wgMhznshI7gVhpy6hfRkd2g
 aNbZ+njs+Qozj349Brhy1bS6yuNtab2qrKGJAHX24wTvAN+M50QGvi2peH9CfKkaI9NlTNycx
 M1FTgO8nJb5d7KGKP6Ks25LUowONAz7lCcdC9CIxzg9UnBCNW44RFUL15O6Z3UofUAuzRpNXY
 Z9vd9OX7j7rsRBR+TkKR/MnunSd7nqwK+kOhYJtDPgE0FME2ifHGcFhexKqToHRNeIJZe1NAx
 BxrQMpqna/xmIQF3i4GRdrO1ugoqvTsGHshHehgnEpNn0jmOh0RxKOtLCu8DDonFiDAIMaeIY
 KxSwluP8S3b6eV2AzAfiFvGz7gCDWrvWyfAXlLHr9R64oFhqShWTWlxY3vvOX+LdIZ65YmUmI
 s/UZ2bVafDHED/sKqJfZBlQemtGbaah6bbN1k515PwSNCwj3CgMag+7Bykvf97hsq3L6/xR2S
 LWZrLiqodGqI8rxO2NRNw2C7otvQ5+h7fnydeGkuLvCStbbmt8shKD5uRT1SPebPg4b9bVG3l
 UNroUmmM4iETat6toCgsVo0GBbb5JS8V++toKRoValEAMYMyGL3ExS4hLyObHgUEehKkmKjzt
 Rz/vvAaSt9pJ2NjBuxkSeoADjRy68AU4NTEt6UbLEcbOlbscbiW3CigOCCbIimma2St3S6zmh
 hN7iFENXKznvH5wfpcSpJp6MJHD/cgGPx59IDCAlmSdDpwiZ/5RQgxRky4303uPfhFi5MU0fv
 zuXkLWZWJjxFbQWzLFuOOH8dAcUAHD6cadaw/QP5PtEsa//7lrqn9VmdsaymyoBgBVGpYkQ9r
 16KyNt414YD12gC6uCNBMBNJzgn8P1EyIvSDy8xNp9N79j5kfccA2vu6odU4L80GqaHKNGnQK
 FMqlcVQQxFC542XhYTO/sTiyTdoE+h6/ADAnR7ZKvic2J3bjZGtx8OPD5PamfRPzTCCYt6UPi
 NfallbIMRN9PuQxQbs5PvRQbL5tdo05OIPk
Subject: [Buildroot] [PATCH v1] package/assimp: disable -Werror compile flag
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

QWRkIHBhdGNoIHRvIGRpc2FibGUgLVdlcnJvciBjb21waWxlIGZsYWcuCgpGaXhlczoKCiAgLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy80OWJlYjI2NGI4NDU0YjlhZjA5
MjI3ODA3NGM0MDg3MDEzNjkyMDUyLwoKICAuLi4vYnVpbGQvYXNzaW1wLTUuMS4zL2NvZGUvUG9z
dFByb2Nlc3NpbmcvVHJpYW5ndWxhdGVQcm9jZXNzLmNwcDoyODU6NTA6IGVycm9yOiBhcmd1bWVu
dCAxIHZhbHVlIOKAmDQyOTQ5NjcyOTTigJkgZXhjZWVkcyBtYXhpbXVtIG9iamVjdCBzaXplIDIx
NDc0ODM2NDcgWy1XZXJyb3I9YWxsb2Mtc2l6ZS1sYXJnZXItdGhhbj1dCiAgICAyODUgfCAgICAg
c3RkOjp1bmlxdWVfcHRyPGJvb2xbXT4gZG9uZShuZXcgYm9vbFttYXhfb3V0XSk7CiAgICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgogIFsu
Li5dCiAgLi4uL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vcG93ZXJwYy1idWlsZHJvb3QtbGludXgt
dWNsaWJjL2luY2x1ZGUvYysrLzkuMy4wL25ldzoxMjc6MjY6IG5vdGU6IGluIGEgY2FsbCB0byBh
bGxvY2F0aW9uIGZ1bmN0aW9uIOKAmHZvaWQqIG9wZXJhdG9yIG5ldyBbXShzdGQ6OnNpemVfdCni
gJkgZGVjbGFyZWQgaGVyZQogICAgMTI3IHwgX0dMSUJDWFhfTk9ESVNDQVJEIHZvaWQqIG9wZXJh
dG9yIG5ld1tdKHN0ZDo6c2l6ZV90KSBfR0xJQkNYWF9USFJPVyAoc3RkOjpiYWRfYWxsb2MpCiAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KClNpZ25lZC1vZmYtYnk6
IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KLS0tCiBwYWNrYWdlL2Fzc2ltcC8w
MDAxLWNvZGUtZGlzYWJsZS1XZXJyb3IucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvYXNzaW1wLzAwMDEtY29kZS1kaXNhYmxlLVdlcnJvci5wYXRjaAoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvYXNzaW1wLzAwMDEtY29kZS1kaXNhYmxlLVdlcnJvci5wYXRjaCBiL3BhY2thZ2UvYXNz
aW1wLzAwMDEtY29kZS1kaXNhYmxlLVdlcnJvci5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi4zMzg2N2U2MWMzCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9h
c3NpbXAvMDAwMS1jb2RlLWRpc2FibGUtV2Vycm9yLnBhdGNoCkBAIC0wLDAgKzEsMzkgQEAKK0Zy
b20gNTE0NmUxYzRkNTgxNzRlMzAyZGJkY2YyYTg1YzIwMjNiZTFjZmZjNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb206IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KK0Rh
dGU6IEZyaSwgMTAgRGVjIDIwMjEgMTU6MTU6MzAgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gY29k
ZTogZGlzYWJsZSAtV2Vycm9yCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisK
K0ZpeGVzOgorCisgIC4uLi9idWlsZC9hc3NpbXAtNS4xLjMvY29kZS9Qb3N0UHJvY2Vzc2luZy9U
cmlhbmd1bGF0ZVByb2Nlc3MuY3BwOjI4NTo1MDogZXJyb3I6IGFyZ3VtZW50IDEgdmFsdWUg4oCY
NDI5NDk2NzI5NOKAmSBleGNlZWRzIG1heGltdW0gb2JqZWN0IHNpemUgMjE0NzQ4MzY0NyBbLVdl
cnJvcj1hbGxvYy1zaXplLWxhcmdlci10aGFuPV0KKyAgICAyODUgfCAgICAgc3RkOjp1bmlxdWVf
cHRyPGJvb2xbXT4gZG9uZShuZXcgYm9vbFttYXhfb3V0XSk7CisgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KKyAgWy4uLl0KKyAgLi4u
L2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vcG93ZXJwYy1idWlsZHJvb3QtbGludXgtdWNsaWJjL2lu
Y2x1ZGUvYysrLzkuMy4wL25ldzoxMjc6MjY6IG5vdGU6IGluIGEgY2FsbCB0byBhbGxvY2F0aW9u
IGZ1bmN0aW9uIOKAmHZvaWQqIG9wZXJhdG9yIG5ldyBbXShzdGQ6OnNpemVfdCnigJkgZGVjbGFy
ZWQgaGVyZQorICAgIDEyNyB8IF9HTElCQ1hYX05PRElTQ0FSRCB2b2lkKiBvcGVyYXRvciBuZXdb
XShzdGQ6OnNpemVfdCkgX0dMSUJDWFhfVEhST1cgKHN0ZDo6YmFkX2FsbG9jKQorICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fgorCitTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CistLS0KKyBjb2RlL0NNYWtlTGlzdHMudHh0
IHwgMiAtLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEv
Y29kZS9DTWFrZUxpc3RzLnR4dCBiL2NvZGUvQ01ha2VMaXN0cy50eHQKK2luZGV4IGU0NWJmOGEy
YS4uZjcxYjY1ODNkIDEwMDY0NAorLS0tIGEvY29kZS9DTWFrZUxpc3RzLnR4dAorKysrIGIvY29k
ZS9DTWFrZUxpc3RzLnR4dAorQEAgLTExNjcsOCArMTE2Nyw2IEBAIFRBUkdFVF9VU0VfQ09NTU9O
X09VVFBVVF9ESVJFQ1RPUlkoYXNzaW1wKQorICMgZW5hYmxlIHdhcm5pbmdzIGFzIGVycm9ycyAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisgSUYgKE1TVkMpCisgICBU
QVJHRVRfQ09NUElMRV9PUFRJT05TKGFzc2ltcCBQUklWQVRFIC9XWCkKKy1FTFNFKCkKKy0gIFRB
UkdFVF9DT01QSUxFX09QVElPTlMoYXNzaW1wIFBSSVZBVEUgLVdlcnJvcikKKyBFTkRJRigpCisg
CisgIyBhZGRzIENfRkxBR1MgcmVxdWlyZWQgdG8gY29tcGlsZSB6aXAuYyBvbiBvbGQgR0NDIDQu
eCBjb21waWxlcgorLS0gCisyLjM0LjEKKwotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
