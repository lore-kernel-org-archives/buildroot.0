From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 11:08:00 +0100
Subject: [Buildroot] [PATCH] infra/ccache: avoid color diagnostics with
 GCC older than v4.9
In-Reply-To: <20170211163845.71459758@free-electrons.com>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <20170211163845.71459758@free-electrons.com>
Message-ID: <20170212100800.GC4533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Carlos, All,

On 2017-02-11 16:38 +0100, Thomas Petazzoni spake thusly:
> Hello,
> 
> Adding Arnout, Yann and Gustavo in Cc.
> 
> On Fri, 10 Feb 2017 11:34:08 -0200, Carlos Santos wrote:
> > When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
> > this flag requires GCC v4.9 or later. Older versions fail, complaining
> > about the unrecognized command line option.
> > 
> > The problem is not detectable in the autobuilders because they redirect
> > the output to files/pipes and ccache adds the offending flag only when
> > stderr is a terminal.
> > 
> > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> 
> This looks good to me in principle, so if Arnout, Yann and Gustavo
> don't complain, I'm going to soon apply this to master.
> 
> Another option would be to adjust this in ccache itself at compile time
> (i.e when ccache gets built) rather than having to pass this additional
> GCC_COLORS variable in the environment when building things. This way
> we would be absolutely sure -fdiagnostics-color will never be passed.
> Hence why I'd like the feedback from other developers.

But there is no config option to disable that in ccache. The behaviour
is hard-coded; we would need a patch to disable that.

> A few nits below (but I can fix while applying).
> 
> > +# When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to GCC but
> > +# this flag requires GCC v4.9 or later. Older versions fail, complaining
> > +# about unrecognized command line option.
> > +ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
> 
> I think we tend to use:
> 
> ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),)
> 
> instead.
> 
> > +	TARGET_MAKE_ENV += GCC_COLORS=""
> 
> And we don't indent such lines.

And we might need that for the host as well, no?

    ifeq ($(BR2_HOST_GCC_AT_LEAST_4_9),)
    HOST_MAKE_ENV += GCC_COLORS=""
    endif

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
