From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:47:05 +0200
Subject: [Buildroot] [PATCH 1/5 v2] package infra: add patch-dependencies
In-Reply-To: <a51d416e81f55374ba749baa81222bfe0c52782b.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
 <a51d416e81f55374ba749baa81222bfe0c52782b.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <20150404154705.4be3e45d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 14 Mar 2015 15:25:17 +0100, Yann E. MORIN wrote:

> -$(1)-show-depends:
> +$(1)-show-build-depends:
>  			@echo $$($(2)_FINAL_DEPENDENCIES)
> +$(1)-show-patch-depends:
> +			@echo $$($(2)_FINAL_PATCH_DEPENDENCIES)
> +$(1)-show-depends:
> +			@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))

I think this will break graph-depends. The python script will do "make
<foo>-show-depends" for each package. Now this will return things such
as "xenomai-patch", so the script will then try to do "make
xenomai-patch-show-depends" to recurse into the dependency tree, and
this will fail. <pkg>-show-depends should only return the name of
packages.

Also, I'm not sure about the usefulness of having separate
show-build-depends and show-patch-depends. It could have been useful if
show-depends would simply depend on them, but it doesn't work because
we want all dependencies space-separated on one line.

So, what about replacing this part with just:

$(1)-show-depends:
	@echo $$(sort $$($(2)_FINAL_DEPENDENCIES) $$(patsubst %-patch,%,$$($(2)_FINAL_PATCH_DEPENDENCIES)))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
