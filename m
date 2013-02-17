From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Feb 2013 18:38:23 +0100
Subject: [Buildroot] [PATCH] xlib_libpthread-stubs: needs -pthread when
 linking statically
In-Reply-To: <1361109023-21403-1-git-send-email-arnout@mind.be>
References: <1361109023-21403-1-git-send-email-arnout@mind.be>
Message-ID: <20130217183823.4f196ea9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sun, 17 Feb 2013 14:50:22 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Fixes http://autobuild.buildroot.net/results/392512cb348123d76962df02e38675a80eae41b1
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> My gcc manual only documents the -pthread option for some architectures,
> but it seems to work for x86, sh and arm as well.

Thanks. However, I'd like to see if an upstream fix would not be more
appropriate for this. If you look at the build log, it shows:

checking for pthread_self... no
checking for pthread_mutex_init... no
checking for pthread_mutex_destroy... no
checking for pthread_mutex_lock... no
checking for pthread_mutex_unlock... no
checking for pthread_cond_init... no
checking for pthread_cond_destroy... no
checking for pthread_condattr_init... no
checking for pthread_condattr_destroy... no
checking for pthread_cond_wait... no
checking for pthread_cond_timedwait... no
checking for pthread_cond_signal... no
checking for pthread_cond_broadcast... no
checking for pthread_equal... no
checking for pthread_exit... no

It is really those tests that are wrong I'd say. They should have
detected that the C library provides the pthread functions.

The AC_CHECK_FUNCS test in configure.ac checks those functions, but
does not specify that those functions should be tested by linking
against -lpthread. Wouldn't an upstreamable configure.ac patch be more
appropriate here?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
