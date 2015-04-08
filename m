From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 08 Apr 2015 22:22:00 +0200
Subject: [Buildroot] [PATCH 2/2] infra/pkg-kconfig: require an non-empty
 KCONFIG_FILE
In-Reply-To: <c5c81694cabca70c5651fe42a7de99247275659c.1428512591.git.yann.morin.1998@free.fr>
References: <cover.1428512591.git.yann.morin.1998@free.fr>
 <c5c81694cabca70c5651fe42a7de99247275659c.1428512591.git.yann.morin.1998@free.fr>
Message-ID: <55258DE8.9020207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 19:08, Yann E. MORIN wrote:
> Currently, we only check that the variable is defined, which is not
> enough since we really want it to be non-empty.

 Have you tested this? According to the make documentation, this is not true...

> 
> We however can't check it points to an existing file, because the
> package might well not be extracted yet, and we may use an internal
> defconfig. If that file does not eventually exist, there will be a
> failure down the road at build time when we try to copy it...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  package/pkg-kconfig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index fd9f19d..fe8d266 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -68,7 +68,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  ifeq ($$($$($(2)_KCONFIG_VAR)),y)
>  
>  # FOO_KCONFIG_FILE is required
> -ifndef $(2)_KCONFIG_FILE
> +ifeq ($$($(2)_KCONFIG_FILE),)

 These two are exactly the same, cfr. [1]:

>      The 'ifdef' form takes the _name_ of a variable as its argument,
>      not a reference to a variable.  The value of that variable has a
>      non-empty value, the TEXT-IF-TRUE is effective; otherwise, the
       ^^^^^^^^^^^^^^^
>      TEXT-IF-FALSE, if any, is effective.  Variables that have never
>      been defined have an empty value.  The text VARIABLE-NAME is
>      expanded, so it could be a variable or function that expands to the
       ^^^^^^^^
>      name of a variable.



 Regards,
 Arnout

[1] https://www.gnu.org/software/make/manual/html_node/Conditional-Syntax.html

>  $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
>  endif
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
