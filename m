From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Nov 2016 23:15:23 +0100
Subject: [Buildroot] [PATCH 1/6] core: export a variable with the host's
 bitness
In-Reply-To: <103fbc9d355da745c4a5a8ba34c7dbae2ea4c07a.1478553802.git.yann.morin.1998@free.fr>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
 <103fbc9d355da745c4a5a8ba34c7dbae2ea4c07a.1478553802.git.yann.morin.1998@free.fr>
Message-ID: <f245bad7-abf5-2b14-e512-87ef48a3fe42@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-16 22:23, Yann E. MORIN wrote:
> Some host packages (e.g. host-pseudo) wants to know the host bitness,
> and they can fail to detect it in some corner cases (as reported by a
> few users on IRC).
> 
> Export a variable with the bitness of the host, so that those packages
  ^^^^^^ You're not actually exporting it - fortunately.

> can be made to behave.

 I'm a bit hesitant to introduce a global infra variable like this (which makes
top-level Makefile longer - not the direction we want to go to) with just one
consumer, and where we hope the package can be fixed to not need this hack
anymore...

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 4ea64b3..78f72bc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -340,6 +340,12 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
>  	    -e 's/macppc/powerpc/' \
>  	    -e 's/sh.*/sh/' )
>  
> +ifeq ($(filter %64,$(HOSTARCH)),)
> +HOSTARCH_BITS := 32

 There is no need to use := here, just use =

> +else
> +HOSTARCH_BITS := 64

 And here of course.

 Regards,
 Arnout

> +endif
> +
>  HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
>  	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p')
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
