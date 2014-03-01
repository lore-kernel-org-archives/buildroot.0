From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 12:54:10 +0100
Subject: [Buildroot] [PATCH] Makefile: ensure system is built even if no
 filesystem image is selected
In-Reply-To: <1393617927-1661-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393617927-1661-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140301125410.0a8fc7ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Fri, 28 Feb 2014 21:05:27 +0100, Thomas Petazzoni wrote:
> The parallel build patch series has significantly reworked how some of
> the core dependencies are expressed. We now have the following
> dependencies:
> 
>  all: world
>  world: target-post-image
>  target-post-image: $(TARGETS_ROOTFS)
> 
> with TARGETS_ROOTFS containing the list of root filesystem image
> targets, each having the following dependencies:
> 
>  $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
> 
> The bottom line is that the "target-finalize" target, which in turns
> ensures that all packages are built, is only triggered if at least one
> filesystem image is enabled.
> 
> As we want to support builds with no filesystem image selected, this
> is not acceptable. As a fix, we change the target-post-image target
> to:
> 
>  target-post-image: $(TARGETS_ROOTFS) target-finalize
> 
> This way, target-finalize will be triggered even if TARGETS_ROOTFS is
> empty. This is still correct for parallel build, as the individual
> root filesystem image targets still depend on target-finalize.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
