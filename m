From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 15:07:30 +0200
Subject: [Buildroot] [PATCH 2/7] pkg-infra: assign BR_NO_CHECK_HASH_FOR
 so it is recursively-expanded
In-Reply-To: <e8cce5d9bbb1b75dbf02c0f9ee44ee23a0314d38.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <e8cce5d9bbb1b75dbf02c0f9ee44ee23a0314d38.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <55437A92.3060007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/15 00:39, Yann E. MORIN wrote:
> Currently, assigning to BR_NO_CHECK_HASH_FOR in conditionals, but
> referencing vairaible assigned to later, fails. Here's a failing
              variable

> test-case, which is the reduced test-case of how we handle
> BR_NO_CHECK_HASH_FOR for now:
> 
>     export FOO
> 
>     ifeq ($(BAR_V),)
>     BAR_V=1
>     else
>     FOO += $(BAR_S)
>     endif

 I think the test case is too complicated - in fact the conditional construct
has nothing to do with it. The culprit is appending to it, which means we never
explicitly set it to recursively expanded. Exported variables that are not
defined explicitly for some reason default to be immediately expanded rather
than recursively.

export FOO
FOO += $(BAR)
$(warning FOO='$(FOO)' BAR='$(BAR)')
BAR = BAR
$(warning FOO='$(FOO)' BAR='$(BAR)')
default:

Will give

/tmp/Makefile:3: FOO=' ' BAR=''
/tmp/Makefile:5: FOO=' ' BAR='BAR'

while explicitly setting FOO to be recursively expanded:

export FOO =

will give

/tmp/Makefile:3: FOO=' ' BAR=''
/tmp/Makefile:5: FOO=' BAR' BAR='BAR'


> 
>     BAR_S = bar-$(BAR_V).tar
> 
>     all:
>         @echo "BAR_S=\"$(BAR_S)\""
>         @$(SHELL) -c 'echo "FOO=\"$${FOO}\""'
> 
> Run it with:
> 
>     $ make
>     BAR_S="bar-1.tar"
>     FOO=""
>     $ make BAR_V=2
>     BAR_S="bar-2.tar"
>     FOO=" "
> 
> Now, change the firstline to read:
> 
>     export FOO =
> 
> And we now get:
> 
>     $ make
>     BAR_S="bar-1.tar"
>     FOO=""
>     $ make BAR_V=2
>     BAR_S="bar-2.tar"
>     FOO=" bar-2.tar"
> 
> This new behaviour will be needed later for Xenomai, which handles the
> version string in an unusual way.
> 
> (Note how there's a leading space in both cases? In Buildroot, we do not
> care that extra space, it is simply ignored).

 The leading space is there because += always inserts a space, even if the
variable was empty before.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-download.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index a38062e..f0651db 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -56,7 +56,9 @@ domainseparator = $(if $(1),$(1),/)
>  github = https://github.com/$(1)/$(2)/archive/$(3)
>  
>  # Expressly do not check hashes for those files
> -export BR_NO_CHECK_HASH_FOR
> +# It needs to be assigned so as to be a recursively-expanded variable, and
> +# so that it can be assigned inside conditionals.

# Exported variables default to immediately expanded, but we need it to be
# recursively-epxanded, so explicitly define it.


 With all that,

  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


> +export BR_NO_CHECK_HASH_FOR =
>  
>  ################################################################################
>  # The DOWNLOAD_* helpers are in charge of getting a working copy
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
