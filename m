From: Trent Piepho <tpiepho@impinj.com>
Date: Fri, 24 Aug 2018 18:18:29 +0000
Subject: [Buildroot] [git commit branch/2018.05.x] chrony: backport
 upstream patch to fix blocking on getrandom() at startup with recent
 kernels
In-Reply-To: <20180824072511.DD93D8E55C@busybox.osuosl.org>
References: <20180824072511.DD93D8E55C@busybox.osuosl.org>
Message-ID: <1535134708.2283.420.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2018-08-24 at 09:32 +0200, Peter Korsgaard wrote:
> 
> +From: Miroslav Lichvar <mlichvar@redhat.com>
> +Date: Thu, 17 May 2018 14:16:58 +0200
> +Subject: [PATCH] util: fall back to reading /dev/urandom when getrandom()
> + blocks
> +
> +With recent changes in the Linux kernel, the getrandom() system call may
> +block for a long time after boot on machines that don't have enough
> +entropy. It blocks the chronyd's initialization before it can detach
> +from the terminal and may cause a chronyd service to fail to start due
> +to a timeout.
> +
> +At least for now, enable the GRND_NONBLOCK flag to make the system call
> +non-blocking and let the code fall back to reading /dev/urandom (which
> +never blocks) if the system call failed with EAGAIN or any other error.
> +
> +This makes the start of chronyd non-deterministic with respect to files
> +that it needs to open and possibly also makes it slightly easier to
> +guess the transmit/receive timestamp in client requests until the
> +urandom source is fully initialized.

Why it's true the non-fully-initialized urandom is less secure, it's
not any different than the previous getrandom() behavior when it didn't
block but now will.

So this really restores the previous level of security, rather than
making things worse.  The kernel change to getrandom(), in this case,
has provided no net improvement in security and make user space more
complex with deal the behavior.
