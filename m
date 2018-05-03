From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 May 2018 23:16:38 +0200
Subject: [Buildroot] [RFC PATCH 1/1] core: add option to disable RPATH
 sanitation in target tree
In-Reply-To: <20180503191531.15549-1-ciro.santilli@gmail.com>
References: <20180503191531.15549-1-ciro.santilli@gmail.com>
Message-ID: <7eb9b866-3ba4-2cbb-e4e0-8e2540469ec8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-05-18 21:15, Ciro Santilli wrote:
> Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
> ---
> As explained on the Config, the rationale is to speed up BR2_EXTERNAL
> package development build iteration.

 I don't see what this has to do with package development. Anyway, when you're
developing package foo, wouldn't you run 'make foo' rather than just 'make' (and
thus never even hit that code path)?

> This would make users targetting virtual machines happy.

 Huh? Or you mean building in virtual machines?

> 
> It may be argued that embedded images are not supposed to be small,
> but a counter argument is that there are already in-tree packages
> that benefit considerably from this, e.g. ltp-testsuite, which drops
> the build iteration from 18s to 5s on my machine, which is a huge
> life improvement.
> 
> Additionaly, this will also make it easier for us to find and report
> the offending packages mentioned at 5f4ca518094f7690536074246ab765f36a213783
> and push for a correct upstream fix, are we tracking that somewhere?

 No, it falls in the category "not worth the time to try to fix upstream",
especially since we're talking about things like SELinux which consists of
dozens of packages that all do it wrong.

> Removing the rpath fix actually makes those packages not work is that it?

 Usually not, the rpaths are mostly useless. They are typically added because
the executable is linked with a library that may not yet be installed.


> I'm not sure if this should be an actual config, thus the RFC.
> Without the config, it is also possible to use it just as:

 TBH, I don't think it's worth the bother either way. Just skip the entire
finalize/rootfs creation step if you're not interested.

 Regards,
 Arnout

> 
>     make BR2_SANITIZE_RPATH=n
> 
>  Config.in | 7 +++++++
>  Makefile  | 2 ++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 6b5b2b043c..6b39bd9f8b 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -678,6 +678,13 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
>  	  and external toolchain backends (through the toolchain
>  	  wrapper).
>  
> +config BR2_SANITIZE_RPATH
> +	bool "sanitize rpath"
> +	default y
> +	help
> +	  You may want to disable this while developing a package with
> +	  BR2_EXTERNAL to make build iterations faster.
> +
>  config BR2_REPRODUCIBLE
>  	bool "Make the build reproducible (experimental)"
>  	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
> diff --git a/Makefile b/Makefile
> index 54f940659c..a9c1b82b3f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -743,8 +743,10 @@ endif
>  	) >  $(TARGET_DIR)/usr/lib/os-release
>  	ln -sf ../usr/lib/os-release $(TARGET_DIR)/etc
>  
> +ifeq ($(BR2_SANITIZE_RPATH),y)
>  	@$(call MESSAGE,"Sanitizing RPATH in target tree")
>  	$(TOPDIR)/support/scripts/fix-rpath target
> +endif
>  
>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>  		$(call MESSAGE,"Copying overlay $(d)"); \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
