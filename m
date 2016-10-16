From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 19:48:34 +0200
Subject: [Buildroot] [PATCH v11 4/4] core: only remove O from
	MAKEOVERRIDES
In-Reply-To: <20161016115423.17881-5-s.martin49@gmail.com>
References: <20161016115423.17881-1-s.martin49@gmail.com>
 <20161016115423.17881-5-s.martin49@gmail.com>
Message-ID: <2e3bb5cb-3101-ab44-da26-37ac0226a3d4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-10-16 13:54, Samuel Martin wrote:
> For no apparent reason, MAKEOVERRIDES is not treated the same way
> depending on whether O is set or not on the command line:
> * when O is set on the command line (i.e. out-of-tree build): all
>   variables were stripped away from MAKEOVERRIDES;
> * when O is not set on the command line (i.e. in-Buildroot-source-tree
>   build): all variables are kept and forwarded to the sub-make call.
> 
> This change cleans things up by only removing the relevant variables
> from MAKEOVERRIDES when appropriate (i.e. removing O from MAKEOVERRIDES
> when O is set on the command line) keeping all other variables as-is in the
> sub-make call; O is set on the sub-make call anyway.

 I'm not sure about this one. Clearing MAKEOVERRIDES makes sure that whatever we
set on the commandline of Buildroot's make will not get passed down to
sub-makes. I don't see anything for which it would be useful to pass it down to
sub-makes as commandline overrides.

 Note that whatever we specify on the command line will be passed down in two
ways (unless it's overridden by the Makefile, like is done for O): it is passed
in the environment, and it is passed in MAKEFLAGS in the environment. So even if
we clear MAKEOVERRIDES, things still get passed down but just in the environment.

 So, I don't see a good reason to apply this patch.

 Regards,
 Arnout

> 
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v9->v10:
> - new patch
> ---
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index dcf8552..dc0a6d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -38,8 +38,9 @@ else
>  # Other packages might also support Linux-style out of tree builds
>  # with the O=<dir> syntax (E.G. BusyBox does). As make automatically
>  # forwards command line variable definitions those packages get very
> -# confused. Fix this by telling make to not do so.
> -MAKEOVERRIDES :=
> +# confused. Fix this by telling make to not do so, only for O=..., but
> +# keep all others (such as BR2_EXTERNAL, BR2_DL_DIR, etc).
> +MAKEOVERRIDES := $(filter-out O=%,$(MAKEOVERRIDES))
>  # Strangely enough O is still passed to submakes with MAKEOVERRIDES
>  # (with make 3.81 atleast), the only thing that changes is the output
>  # of the origin function (command line -> environment).
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
