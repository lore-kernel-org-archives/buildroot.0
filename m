From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 18 Aug 2015 07:37:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/canfestival: fix musl
 compilation
In-Reply-To: <1439848293-26836-1-git-send-email-brendanheading@gmail.com>
References: <1439848293-26836-1-git-send-email-brendanheading@gmail.com>
Message-ID: <1439876243.1710.8.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mo, 2015-08-17 at 22:51 +0100, Brendan Heading wrote:
> Fixes: http://autobuild.buildroot.net/results/75a/75aa6e7e4f3dcd74e4b
> 65496060328ec7bd0e747/
> 
> ANSI signal handlers take an int parameter, not sigval_t.

This is true for uClibc, but for other libc timer_notify is asigned to
the `sigev_notify_function` function which has an `union sigval` as
argument [1].

Snipped from the source code of timers_unix.c:

#if defined(__UCLIBC__)
	[..]
	signal(SIGALRM, timer_notify);
#else
	[..]
	sigev.sigev_notify_function = timer_notify;
	[..]
#endif
}

[1] http://man7.org/linux/man-pages/man7/sigevent.7.html

Best regards
J?rg Krause
> 
