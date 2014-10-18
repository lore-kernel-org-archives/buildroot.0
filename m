From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 15:24:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-autotools.mk: add host-m4
	dependency
In-Reply-To: <1413570319-55465-1-git-send-email-kaszak@gmail.com>
References: <1413570319-55465-1-git-send-email-kaszak@gmail.com>
Message-ID: <20141018152443.5103c180@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Fri, 17 Oct 2014 20:25:19 +0200, Karoly Kasza wrote:
> host-autoconf depends on host-m4, which is not reflected in
> package/pkg-autotools.mk. This obstructs "make source" from running
> host-m4-source, making offline builds fail while trying to download
> it before building host-autoconf.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/pkg-autotools.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The host-autoconf package already has a dependency on host-m4. See
package/autoconf/autoconf.mk:

HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool

Maybe the problem you're seeing is that we're not expanding completely
the host dependencies:

# host-* dependencies have to be handled specially, as those aren't
# visible in Kconfig and hence not added to a variable like TARGETS.
# instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
# variable for each enabled target.
# Notice: this only works for newstyle gentargets/autotargets packages
TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
                $(addsuffix _DEPENDENCIES,\
                        $(call UPPERCASE,$(TARGETS) $(TARGETS_ROOTFS))),\
                $($(dep)))))
# Host packages can in turn have their own dependencies. Likewise find
# all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
# host package found above. Ideally this should be done recursively until
# no more packages are found, but that's hard to do in make, so limit to
# 1 level for now.
HOST_DEPS = $(sort $(foreach dep,\
                $(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
                $($(dep))))
HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))

I once drafted a solution for this, but never gotten around to
finishing it and submitting the patch. Something I (or someone) need to
work on at some point.

But in the mean time, the patch you're proposing is not correct, as
it's only work-arounding the problem, and fixes it only for on specific
use case.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
