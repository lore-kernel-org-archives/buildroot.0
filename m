From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 May 2018 00:58:36 +0200
Subject: [Buildroot] [PATCH 4/7] core/package: postpone evaluation of
 dependency conditions
In-Reply-To: <f274c0996622abccd5c65255b936010f37a22d66.1524301847.git.yann.morin.1998@free.fr>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
 <f274c0996622abccd5c65255b936010f37a22d66.1524301847.git.yann.morin.1998@free.fr>
Message-ID: <1677c229-612d-2f3e-1975-214e1980c76b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-04-18 11:10, Yann E. MORIN wrote:
> In the pkg-inner macro, all variables, but he positional arguments,
> must be $$-prefixed, so that they are expanded only when the macro
> is evaluated in each package, not when the macro is parsed.
> 
> It is to be noted, though, that the current code, even though incorrect
> by the above rules, seemed to work. However, the upcoming addition of
> download dependencies, mimicking that code, would not work unless it
> was $$-prefixed.
> 
> So, for consistency sake, and for correctness sake, let's always use
> the $$-prefix in the inner macro.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> ---
> Arnout: you the make expert, any idea why on Earth the single-expansion
> was working in thefirst place?

[You put me in Cc of too many patches, so I don't notice when you *really* want
my response :-]

 In most cases, single-$ will work as well. In this particular case, after first
expansion you will get:

ifeq (,)
FOO_EXTRACT_DEPENDENCIES += host-tar
endif

which in the $(eval ...) will get evaluated to nothing.

 After this patch, after first expansion you get

ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,foo),)
FOO_EXTRACT_DEPENDENCIES += host-tar
endif

which the $(eval ...) still evaluates to nothing.


 The cases where $$ is really needed are fairly rare. The most obvious ones are
when you have an ifeq() using a variable that is defined in the same
inner-generic-package expansion. Less obvious but important for consistency is
to keep the "late binding" property. With single-$, the variable is expanded
immediately, so if it is still updated later in the makefiles, the new values
won't be used anymore. This would e.g. break $(1)-show-rdepends.


 Because it is very hard to remember when exactly you should use $$, we
introduced the rule: use $$ *everywhere*, except for $(1), $(2) etc. Thomas's
patches that fixed the dependencies broke that rule.

 Unfortunately, this patch still doesn't fix it...


> ---
>  package/pkg-generic.mk | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1c9dd1d734..12e3981752 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -560,26 +560,26 @@ ifneq ($(1),host-skeleton)
>  $(2)_DEPENDENCIES += host-skeleton
>  endif
>  
> -ifeq ($(filter host-tar host-skeleton host-fakedate,$(1)),)
> +ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
>  $(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
                                ^^ This should also be $$

and the same below.

 Regards,
 Arnout

>  endif
>  
> -ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
> +ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
>  $(2)_EXTRACT_DEPENDENCIES += $(BR2_XZCAT_HOST_DEPENDENCY)
>  endif
>  
> -ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
> +ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
>  $(2)_EXTRACT_DEPENDENCIES += $(BR2_LZIP_HOST_DEPENDENCY)
>  endif
>  
> -ifeq ($(BR2_CCACHE),y)
> -ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
> +ifeq ($$(BR2_CCACHE),y)
> +ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
>  $(2)_DEPENDENCIES += host-ccache
>  endif
>  endif
>  
> -ifeq ($(BR2_REPRODUCIBLE),y)
> -ifeq ($(filter host-skeleton host-fakedate,$(1)),)
> +ifeq ($$(BR2_REPRODUCIBLE),y)
> +ifeq ($$(filter host-skeleton host-fakedate,$(1)),)
>  $(2)_DEPENDENCIES += host-fakedate
>  endif
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
