From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jul 2015 23:43:51 +0200
Subject: [Buildroot] [PATCH] package: Introduce
 $(2)_INFRA_EXTRA_DEPENDENCIES
In-Reply-To: <1436898465-11711-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436898465-11711-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <55A58297.9030806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/15 20:27, Maxime Hadjinlian wrote:
> Instead of repeating the filter-out function to remove the host-package
> that we don't want as dependencies in each infra, handle it it
> pkg-generic through a generic variable, which is specified by each
> infra.
> 
> The $(2)_INFRA_EXTRA_DEPENDENCIES contains the specific host package
> that we want to filter from the package's dependencies.

 I love it!

 However, it doesn't work AFAICS...

[snip]
> -# This must be repeated from inner-generic-package, otherwise we get an empty
> -# _DEPENDENCIES
> -ifeq ($(4),host)
> -$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
> -	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
> -endif
> -
>  # Add dependency against the provider
>  $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))

 Since we add to _DEPENDENCIES here, _DEPENDENCIES is not empty, and the ?= in
inner-generic-package does not trigger. That was the original reason why the
rule had to be repeated in each infra, not because we want to exclude additional
dependencies.

 So instead, what we need is a real $(2)_INFRA_EXTRA_DEPENDENCIES, which we can
safely append to because it will not be used by the package.mk file itself. Or
as mentioned on IRC, as an extra argument.

 Regards,
 Arnout

>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
