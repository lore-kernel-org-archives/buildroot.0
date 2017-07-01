From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 15:07:23 +0200
Subject: [Buildroot] [Patch v6 1/7] pkg-virtual: fix host dependencies
 handling
In-Reply-To: <20170625205614.6723-2-eric.le.bihan.dev@free.fr>
References: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
 <20170625205614.6723-2-eric.le.bihan.dev@free.fr>
Message-ID: <d0995c42-f7d2-faec-31b9-9ae1184e915c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-06-17 22:56, Eric Le Bihan wrote:
> If $(BR2_PACKAGE_HAS_HOST_FOO) is defined, then the pkg-virtual
> infrastructure will check if $(BR2_PACKAGE_PROVIDES_HOST_FOO) is not
> empty.
> 
> But later, $(BR2_PACKAGE_HOST_FOO_DEPENDENCIES) will be set from
> $(BR2_PACKAGE_PROVIDES_FOO), ignoring $(BR2_PACKAGE_PROVIDES_HOST_FOO).
> 
> So fix this discrepancy by setting $(BR2_PACKAGE_HOST_FOO_DEPENDENCIES)
> from $(BR2_PACKAGE_PROVIDES_FOO) only if $(BR2_PACKAGE_PROVIDES_HOST_FOO)
> is empty.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/pkg-virtual.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
> index 2e83e07..b8878ad 100644
> --- a/package/pkg-virtual.mk
> +++ b/package/pkg-virtual.mk
> @@ -49,7 +49,11 @@ $(2)_IS_VIRTUAL = YES
>  ifeq ($(4),target)
>  $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
>  else
> +ifeq ($$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2))),)

 This is a bit difficult to grok, so perhaps add

# Inherit from target package BR2_PACKAGE_PROVIDES_FOO
>  $(2)_DEPENDENCIES += host-$$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(3)))
> +else
# BR2_PACKAGE_PROVIDES_HOST_FOO is explicitly defined


 Regards,
 Arnout

> +$(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
> +endif
>  endif
>  
>  # Call the generic package infrastructure to generate the necessary
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
