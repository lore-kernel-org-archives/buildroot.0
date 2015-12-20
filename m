From: Martin Bark <martin@barkynet.com>
Date: Sun, 20 Dec 2015 16:58:47 +0000
Subject: [Buildroot] [PATCH v2 4/5] package/nodejs: fix support for
	uClibc-ng
In-Reply-To: <20151218211530.GE27578@free.fr>
References: <1450394426-3349-1-git-send-email-martin@barkynet.com>
 <1450394426-3349-4-git-send-email-martin@barkynet.com>
 <20151218211530.GE27578@free.fr>
Message-ID: <CAFGQKxdoS=U5GR+_ig9QzJwnxOwJB75hQNSD=9AMOoTkryExpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On 18 December 2015 at 21:15, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, All,
>
> On 2015-12-17 23:20 +0000, Martin Bark spake thusly:
>> Fix segmentation fault in node.js when using uClibc-ng.
>>
>> This patch fixes bug #8296, see
>> https://bugs.busybox.net/show_bug.cgi?id=8296.
>>
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>>
>> ---
> [--SNIP--]
>> diff --git a/package/nodejs/5.3.0/0006-Fix-support-for-uClibc-ng.patch b/package/nodejs/5.3.0/0006-Fix-support-for-uClibc-ng.patch
>> new file mode 100644
>> index 0000000..918a36a
>> --- /dev/null
>> +++ b/package/nodejs/5.3.0/0006-Fix-support-for-uClibc-ng.patch
>> @@ -0,0 +1,32 @@
>> +From 1cc08f6ceacbb0e5ba1f4638ca3a97ac002d7792 Mon Sep 17 00:00:00 2001
>> +From: "Bark, Martin" <martin.bark@te.com>
>> +Date: Mon, 14 Dec 2015 13:26:10 +0000
>> +Subject: [PATCH 2/2] Fix support for uClibc-ng
>> +
>> +uClibc-ng is currently at v1.0.9.  The patch corrects the uClibc
>> +version test so that HAVE_IFADDRS_H is defined for uClibc versions
>> +after v0.9.32.
>> +
>> +Submitted upstream to libuv, see https://github.com/libuv/libuv/pull/653
>
> And that has since been accepted and applied:
>     https://github.com/libuv/libuv/commit/c8619721404c2a9f97adc34a8c3b5336317311bc

Good point, i'll update the comment in my next patch set

>
> Regards,
> Yann E. MORIN.
>
>> +Signed-off-by: Bark, Martin <martin.bark@te.com>
>> +---
>> + deps/uv/src/unix/linux-core.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/deps/uv/src/unix/linux-core.c b/deps/uv/src/unix/linux-core.c
>> +index e6e6828..6cbbb71 100644
>> +--- a/deps/uv/src/unix/linux-core.c
>> ++++ b/deps/uv/src/unix/linux-core.c
>> +@@ -39,7 +39,7 @@
>> + #define HAVE_IFADDRS_H 1
>> +
>> + #ifdef __UCLIBC__
>> +-# if __UCLIBC_MAJOR__ < 0 || __UCLIBC_MINOR__ < 9 || __UCLIBC_SUBLEVEL__ < 32
>> ++# if __UCLIBC_MAJOR__ < 0 && __UCLIBC_MINOR__ < 9 && __UCLIBC_SUBLEVEL__ < 32
>> + #  undef HAVE_IFADDRS_H
>> + # endif
>> + #endif
>> +--
>> +2.6.2
>> +
>> --
>> 2.5.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
