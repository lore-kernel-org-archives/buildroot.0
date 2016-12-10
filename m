From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 15:37:06 +0100
Subject: [Buildroot] [PATCH 2/3] nanopb: Init at
 69e9c1fc8162956feffa32e07a97c53bdb92f5ef
In-Reply-To: <20161209011313.9549-3-wak@google.com>
References: <20161209011313.9549-1-wak@google.com>
 <20161209011313.9549-3-wak@google.com>
Message-ID: <20161210153706.4708003f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration. However, there's a big problem with your
patch: it seems to be corrupt, and therefore cannot be applied. That's
weird because you've used git send-email, which normally always get
things right, but not here:

thomas at skate:~/projets/buildroot (master)$ git pwam 704279
Applying patch #704279 using 'git am -s -3'
Description: [2/3] nanopb: Init at 69e9c1fc8162956feffa32e07a97c53bdb92f5ef
Applying: nanopb: Init at 69e9c1fc8162956feffa32e07a97c53bdb92f5ef
fatal: corrupt patch at line 73
error: could not build fake ancestor
Patch failed at 0001 nanopb: Init at 69e9c1fc8162956feffa32e07a97c53bdb92f5ef
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.

And indeed, looking at your patch below, some lines have been wrapped.

On Thu,  8 Dec 2016 17:13:12 -0800, William A. Kennington III wrote:
> We chose not to use a stable version so that our version of nanopb
> is compatible with pblog. In the future a stable version should be used.

The commit title should be just:

	nanopb: new package

> 
> Change-Id: I3f80c809efbe7c237de9b9de901d048247b4c6c1
> Google-Bug-Id: 33072942

Those two lines should be removed.

> Signed-off-by: William A. Kennington III <wak@google.com>

> +# Locally calculated
> +sha256 e6dbaf58574c54e67b6bdfdee71f62d52d261e77a5f8e3961b7a6a0abbf06a86  
> nanopb-69e9c1fc8162956feffa32e07a97c53bdb92f5ef.tar.gz

Here the line is wrapped while it should not.

> diff --git a/package/nanopb/nanopb.mk b/package/nanopb/nanopb.mk
> new file mode 100644
> index 0000000..a162b82
> --- /dev/null
> +++ b/package/nanopb/nanopb.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# nanopb
> +#
> +################################################################################
> +
> +NANOPB_VERSION = 69e9c1fc8162956feffa32e07a97c53bdb92f5ef
> +NANOPB_SITE = $(call github,nanopb,nanopb,$(NANOPB_VERSION))
> +NANOPB_LICENSE = BSD-3c
> +NANOPB_LICENSE_FILES = LICENSE.txt
> +# no configure script

This comment is not needed.

> +# Need to use host protoc during cross compilation.

How is this comment related to the below dependencies? Your comment
mentions a host tools, but you don't depend on any host package. I know
'protobuf' depends on 'host-protobuf', which will bring you the host
protoc, but that's not very clear from your comment.

> +NANOPB_DEPENDENCIES = protobuf python-protobuf
> +
> +define HOST_NANOPB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C  
> $(@D)/generator/proto

Line has been wrapped.

> +endef
> +
> +define NANOPB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C  
> $(@D)/generator/proto

Line has been wrapped.

> +endef
> +
> +# We don't actually need to install anything as you include the library  
> files
> +# directly.

This looks really really weird, I'll review PATCH 3/3 to try to
understand, but this approach doesn't seem very good. Also, this
paragraph has also been badly rewrapped when your patch was sent.

> +$(eval $(host-generic-package))
> +$(eval $(generic-package))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
