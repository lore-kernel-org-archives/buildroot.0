From: Stefan Nickl <stefan.nickl@gmail.com>
Date: Tue, 1 Nov 2016 22:24:53 +0100
Subject: [Buildroot] [PATCH v2] pppd: Provide error() implementation in
	pppoe-discovery
In-Reply-To: <20161028152419.6ffba279@free-electrons.com>
References: <1477248598-6052-1-git-send-email-Stefan.Nickl@gmail.com>
 <20161028152419.6ffba279@free-electrons.com>
Message-ID: <CAFOMc=TC79VoZmWRzCsBZp3bBCnB+OaWGZ0vi3BXAaHpQODpnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Oct 28, 2016 at 3:24 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> What do you mean by doppelganger?


If you do "man 3 error" on a desktop Linux box, you'll get this function,
which is provided by glibc and uclibc, but not by musl:

void error(int status, int errnum, const char *format, ...)

If you look at ppp/pppd/utils.c, you'll find a function with this
prototype, looking like the one in my patch:

void error(char *fmt, ...)

The libc version is actually defined as a weak symbol:

# nm -D /lib/libc.so.6 |grep -w error
000f5990 W error

When rp-pppoe.so is built from pppd/plugins/rp-pppoe/common.c (among
others), CHECK_ROOM expands into an error() call that matches the second
signature, as is custom within ppp. When the plugin is dynamically loaded
into pppd, that call to error() uses the function from utils.c, overriding
the weak symbol in the libc.

But for the standalone pppoe-discovery, there is no error() in the program,
and the linker just silently uses the unrelated/wrong weak symbol from libc
instead.

It does not really matter because at most it makes the utility terminate
cleanly instead of crashing if it detects some internal error, which may
never even happen. I only minded because Arnout asked about it; it does
matter for musl, but there it only solves one out of several issues.


> This really doesn't seem like the right approach, for several reasons:
>
>  - There is already a function with the same name provided in the C
>    library, which means static linking scenarios will no longer work,
>    as you'll have clashing symbols.
>

As mentioned, the very idea is to provide a correct alternative so the
weak/wrong error() from libc is not used.


>  - The rest of the pppoe-discovery code is using perror(), which is
>    provided by the C library. So I believe the better fix is to change
>    the CHECK_ROOM() macro to use the perror() function instead.
>

Translation units that go into the rp-pppoe.so plugin also use this macro,
and in this context, "void error(char *fmt, ...)" is certainly the correct
choice. Also, perror(3) is for translating errno, which is not applicable
for CHECK_ROOM. But there is also a lot of fprintf(stderr...) going on
in pppoe-discovery.c.

-- 
Stefan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161101/5f16bd4e/attachment.html>
