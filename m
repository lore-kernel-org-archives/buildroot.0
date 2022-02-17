Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A05C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E6E425C1;
	Thu, 17 Feb 2022 20:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TT7ISHgiV4AY; Thu, 17 Feb 2022 20:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD8141C43;
	Thu, 17 Feb 2022 20:04:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 823361BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DDFF41C3E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lr_2fkEMB0nM for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:04:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E97D40257
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645128287;
 bh=e12WdmLQYt+RUNkkBs5pUcWOFPSlLEqIX/3pDCuEqFw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=bRl95o3MJjjy4K4RzXBzxPU9Xn1MdwgvFzBQGr6CwSlI+KVaZK8doFODYJshtsH47
 ZtsDBUnTOR2n5ZiVwB+DbcOiFMh+zQ9kZUoVaajU1CDSs7UflsJoUi6+9QI74Trz8m
 RxfT+2GRreW28LeOoiABTHcdji9u575ADlEtKCvc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXUN-1nb5Ld3Fjz-00JbBf; Thu, 17
 Feb 2022 21:04:46 +0100
Date: Thu, 17 Feb 2022 21:04:43 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220217210443.6994b57c@gmx.net>
In-Reply-To: <20220217134637.3728619-1-fontaine.fabrice@gmail.com>
References: <20220217134637.3728619-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:OSgvk56Ri+OL1UDpXiSvo/WNrhMAWT233Q1Nczi7HbN1Rj03wke
 BZbchjb0qM0uMQXEENIGvmoTqV8I9AIvukyQqqnQKRG4lDQziYCBojd+S+R95Gmrg0KsdjY
 hxMZNudd69XC5FaxIrVHwclagmGnCvTzLoTYUZ0K39sm8P5USC3UwCogV5I+6cAQTV3iHKK
 3l4t7Zn2HdKkn9cFXhaOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SGO8gm3QMd0=:A+4b+8VoQf53OLTn7tc58z
 tiMPoP8vlifBfYLlZhZltraKlGu4FRZpqhSiPDXJ+1q6cSI/5UcywVxCxnNU84/suezr/tDeb
 WvpaSm8dxxEyfoXqRj/2WZa3mROu/Bttm6vfLL4jhKU1oXsDDIn/pA4h/AEKVHUc3hDEXe3vf
 QvKu0ZjBqjRTX/7P4A/uVxNfrd8JaxLFUuWi3UVTi9eoR9uDahwoVedlM9K0bcNLBh1FBpB91
 olFzLWavQKbbgH0W5ctmuyM7toqZ48sdmDMTV1dJ3ibBCL4x+QS2qeFxuCSfPtt0jZDjTPsYf
 BSuPa4JkJjiO5PUDC+AhaYgBeOlTr7lK7Z9TIkK1uky8rtPeYZjbSYxPQ2nQvCJbqCFaut7fL
 3WANfYW2uulrUlJ3VYc6iHcNeT1tAXcib8QvXQhcJ9l9Wbdw+7XHYsqkORkKYrhMxlkye8/4x
 lyRBCUQ/mU7ne/mWHHnIGy2z1th6njNuDjphzGZntsOdZNnTfmQLWErUuXnkV0gJT0mXcMsuH
 lLG/8s6x7VhJeMTN5az5qUUfgWKo/VYtk6yJJrXH9Rba6EkB26XRFiczs0PX6yFXfBqWJ5YXK
 UiUu/VphJhPXAb/0uf2nMftV15IRczmXw/kM8j8+SGpaAsJO69CSK/R0Oj8IzmvKhD/l03Hu6
 zZHcnqbgcGWTWwISegGKy0mHJ08mm67BDrWFf+U5YPzKHJqAiE37J7d/+isexhi8J7ADHhToZ
 yngfBtqEdw1uJDhV9PuVdE81F0WIDBRPXBHIggWrUq2YcljJAqs1jKdxa8pCkMFXlr/UbmOgQ
 uPGoEqAyvuXLTEcGVOVY+ZOOxHWqVYSsf/AIlFl0fWSBYBNv7Bf9ewYFKwzdoBwiDG5kxlsXW
 1Uy4UW5huOfbNOC3NUBuKWxTljY+qfhq7nNjPEmFi8DMcT6eT/NyN63Zyv3xaN9bOcr5s6GnQ
 HXP6gvhBARTQhXnrf5SCiMQCPGTXQk3h9e8qExP0JVZTtYMM2MXUvHmKlWTQsHvqTEEQJlUZc
 TVQ4z1gsdlsRqdBfc7UGMcYpXs2EftkmDc2C3zAuvwzCwv3dXXyejqzpzbgu+7rjv9a21062O
 gV1BxiFeHoP61c=
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: put back riscv32
 patch
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Thu, 17 Feb 2022 14:46:37 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e wrongly removed riscv32
> patch resulting in the following build failure:
>
> In file included from thread/qmutex_linux.cpp:45,
>                  from thread/qmutex.cpp:806:
> thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
> thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
>   116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
>       |                              ^~~~~~~~~~
>       |                              _q_futex
>
> Fixes:
>  - http://autobuild.buildroot.org/results/ff90bc7680acf1487ed58e5e25cf1a5f13dfaedb
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

> ---
>  .../qt5base/0007-Fix-build-on-riscv32.patch   | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
>
> diff --git a/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch b/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
> new file mode 100644
> index 0000000000..5561acb9ae
> --- /dev/null
> +++ b/package/qt5/qt5base/0007-Fix-build-on-riscv32.patch
> @@ -0,0 +1,46 @@
> +From 035dc537bee26e3b63a211b2835d8560439e161f Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 27 Aug 2021 16:28:32 +0200
> +Subject: Fix build on riscv32
> +
> +riscv32 fails to build because __NR_futex is not defined on this
> +architecture:
> +
> +In file included from thread/qmutex_linux.cpp:45,
> +                 from thread/qmutex.cpp:804:
> +thread/qfutex_p.h: In function 'int QtLinuxFutex::_q_futex(int*, int, int, quintptr, int*, int)':
> +thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
> +  116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
> +      |                              ^~~~~~~~~~
> +      |                              _q_futex
> +
> +Pick-to: 6.1 6.2
> +Fixes: QTBUG-96067
> +Change-Id: Ib6a9bcc496f37e69ac39362cb0a021fccaf311f5
> +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> +[Retrieved from:
> +https://code.qt.io/cgit/qt/qtbase.git/commit/?id=035dc537bee26e3b63a211b2835d8560439e161f]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/corelib/thread/qfutex_p.h | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/corelib/thread/qfutex_p.h b/src/corelib/thread/qfutex_p.h
> +index 40482b6fc1..037207a5c0 100644
> +--- a/src/corelib/thread/qfutex_p.h
> ++++ b/src/corelib/thread/qfutex_p.h
> +@@ -103,6 +103,11 @@ QT_END_NAMESPACE
> + // if not defined in linux/futex.h
> + #  define FUTEX_PRIVATE_FLAG        128         // added in v2.6.22
> +
> ++// RISC-V does not supply __NR_futex
> ++#  ifndef __NR_futex
> ++#    define __NR_futex __NR_futex_time64
> ++#  endif
> ++
> + QT_BEGIN_NAMESPACE
> + namespace QtLinuxFutex {
> +     constexpr inline bool futexAvailable() { return true; }
> +--
> +cgit v1.2.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
