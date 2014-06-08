From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:22:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/trace-cmd: bump to version 2.3.2
In-Reply-To: <1402006038-8840-2-git-send-email-romain.naour@openwide.fr>
References: <1402006038-8840-1-git-send-email-romain.naour@openwide.fr>
 <1402006038-8840-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140608152243.48fd5c25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri,  6 Jun 2014 00:07:18 +0200, Romain Naour wrote:
> The first patch "use-pkg-config-instead-of-python-config" has been applied upstream.
> 
> The flag _GNU_SOURCE is now always defined in Makefile, so it can be removed from trace-cmd.mk
> 
> CPPFLAGS are appended to CFLAGS and are used to add extra flags, but the flag _LARGEFILE64_SOURCE
> in TARGET_CPPFLAGS is already defined in source files, which causes a build error.
> CPPFLAGS are cleared before passing them to the trace-cmd Makefile.

Please wrap your commit message properly.

>  # trace-cmd already defines _LARGEFILE64_SOURCE when necessary,
>  # redefining it on the command line causes build problems.
> -TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
> +TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS))
> +
> +# trace-cmd use CPPFLAGS to add some extra flags.
> +# But like for CFLAGS, $(TARGET_CPPFLAGS) contains _LARGEFILE64_SOURCE
> +# that causes build problems.
> +TRACE_CMD_CPPFLAGS = ""

And therefore why don't you use the same strategy as the one used for
CFLAGS, by filtering out the -D_LARGEFILE64_SOURCE ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
