From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 15:23:07 +0100
Subject: [Buildroot] [PATCH 02/16 v5] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <909a98f9ebb10986a85570d767ab030597a73ef5.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <909a98f9ebb10986a85570d767ab030597a73ef5.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <20160319152307.765e1bad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 11 Mar 2016 18:49:15 +0100, Yann E. MORIN wrote:

> +################################################################################
> +# hardlink-copy -- hardlink source and destination if possible, otherwise
> +# do a simple copy
> +#
> +# argument 1 is the source *file*
> +# argument 2 is the destination *directory*
> +# argument 3 is the basename of the destination file (optional, defaults to
> +#            the basename of the source file.
> +#
> +# examples:
> +#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir)
> +#   $(call hardlink-copy,/path/to/source/file,/path/to/destination/dir,new-name)
> +#
> +# Notes:
> +#  - this is NOT an atomic operation,
> +#  - this is only a wrapper to a shell script, so that it can be used with
> +#    shell-level variables, like in a for loop.
> +################################################################################
> +define hardlink-copy
> +	support/scripts/hardlink-copy "$(strip $(1))" "$(strip $(2))" "$(strip $(3))"
> +endef

While in certain cases, I agree that a shell wrapper is nice and
useful, here I really don't see the point of a shell wrapper. You can
simply do (untested):

define hardlink-or-copy-inner
	rm -f $(2)
	ln -f $(1) $(2) 2>/dev/null || cp -f $(1) $(2)
endef

define hardlink-or-copy
	$(call hardlink-or-copy-inner,$(1),$(if $(3),$(2)/$(3),$(2)/$(basename $(1))))
endef

Note that I think the name of the macro should be hardlink-or-copy and
not hardlink-copy. The name hardlink-copy seems to indicate that you
are copying a hardlink, which is not what is happening.
hardlink-or-copy is IMO clearer on the fact that the macro does a hardlink
or a copy.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
