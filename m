From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 07:59:37 +0200
Subject: [Buildroot] [PATCH 1 of 6 v2] Config.in.legacy: update
	description
In-Reply-To: <2942a6d3dd9f0f3fd864.1374650578@BEANTN0L019720>
References: <patchbomb.1374650577@BEANTN0L019720>
 <2942a6d3dd9f0f3fd864.1374650578@BEANTN0L019720>
Message-ID: <520879C9.8000000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/07/13 09:22, Thomas De Schampheleire wrote:
> The existing comments in Config.in.legacy are not entirely in-line with
> current practice. The comments implies that BR2_LEGACY should not be set when
> the conversion from old-to-new symbol can be done automatically using the
> appropriate 'select' statements. However, none of the existing legacy options
> does it this way. Moreover, I think it's intentional that the user is notified
> of the change, so that the removal of the legacy options in later buildroot
> versions no longer poses a problem.
>
> Additionally, I have added an example of how to handle the renaming of a string
> config option. Because a string option cannot 'select' something else, a wrapper
> symbol is needed of type bool.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Note, however, that when you change a string option, it is quite 
difficult to propagate the old value to the new symbol automatically 
(you'd have to add a default to the new option). So renaming string 
options should be avoided.

  Regards,
  Arnout

>
> ---
> (v2): new patch in this series
>
>   Config.in.legacy |  22 +++++++++++++++++-----
>   1 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -3,11 +3,10 @@
>   #
>   # When an existing Config.in symbol is removed, it should be added again in this
>   # file, and take appropriate action to approximate backward compatibility. If
> -# there is an equivalent (set of) new symbols, these can just be select'ed by
> -# the old symbol. This makes sure that running 'make oldconfig' will make things
> -# "just work" when upgrading to a new buildroot version. If the change is too
> -# fundamental and cannot be fixed by a simple select, then the old symbol should
> -# select BR2_LEGACY.  If that symbol is set, the build will issue an error.
> +# there is an equivalent (set of) new symbols, these should be select'ed by
> +# the old symbol. This will make the transition for the user more convenient.
> +# The old symbol should select BR2_LEGACY, so that the user is informed at
> +# build-time about selected legacy options.
>   #
>   # When adding legacy symbols to this file, add them to the front. The oldest
>   # symbols will be removed again after about two years.
> @@ -15,6 +14,19 @@
>   # The symbol should be copied as-is from the place where it was previously
>   # defined, but the help text should be removed or replaced with something that
>   # explains how to fix it.
> +# If the old symbol is of type string, and the symbol has been renamed, you
> +# should add it as a bool with another name (BR2_<foo>_WRAP), that defaults
> +# to y if the old string is not set at its default value. For example:
> +#     config BR2_FOO_STRING
> +#             string "Some foo string"
> +# would become:
> +#     config BR2_FOO_STRING_WRAP
> +#             bool "Foo string option has been renamed."
> +#             default y if BR2_FOO_STRING != ""
> +#             depends on BR2_LEGACY
> +#             help
> +#               <suitable help text>
> +#
>
>   config BR2_LEGACY
>   	bool
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
