From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 16:38:45 +0100
Subject: [Buildroot] [PATCH] infra/ccache: avoid color diagnostics with
 GCC older than v4.9
In-Reply-To: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170211163845.71459758@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Arnout, Yann and Gustavo in Cc.

On Fri, 10 Feb 2017 11:34:08 -0200, Carlos Santos wrote:
> When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
> this flag requires GCC v4.9 or later. Older versions fail, complaining
> about the unrecognized command line option.
> 
> The problem is not detectable in the autobuilders because they redirect
> the output to files/pipes and ccache adds the offending flag only when
> stderr is a terminal.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

This looks good to me in principle, so if Arnout, Yann and Gustavo
don't complain, I'm going to soon apply this to master.

Another option would be to adjust this in ccache itself at compile time
(i.e when ccache gets built) rather than having to pass this additional
GCC_COLORS variable in the environment when building things. This way
we would be absolutely sure -fdiagnostics-color will never be passed.
Hence why I'd like the feedback from other developers.

A few nits below (but I can fix while applying).

> +# When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
> +# this flag requires GCC v4.9 or later. Older versions fail, complaining
> +# about unrecognized command line option.
> +ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)

I think we tend to use:

ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),)

instead.

> +	TARGET_MAKE_ENV += GCC_COLORS=""

And we don't indent such lines.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
