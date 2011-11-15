From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2011 23:22:18 +0000
Subject: [Buildroot] [PATCH 2 of 5 RFC] dependencies: add function
	suitable-host-package
In-Reply-To: <59ff6675857a8c1c280b.1320911667@devws108>
References: <patchbomb.1320911665@devws108>
 <59ff6675857a8c1c280b.1320911667@devws108>
Message-ID: <201111152322.18743.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 10 November 2011 19:31:54 Thomas De Schampheleire wrote:
> Sometimes, buildroot needs a certain host tool to do its job, e.g. tar. In
> many cases, we expect this tool to be present on the host system, but this is
> not always the case. Or maybe, the version on the host system is not
> suitable, and we need a more recent one.
> 
> In some of these cases, instead of bailing out, buildroot could build the
> package first (but only if the existing system package is not suitable).
> 
> To aid in detecting if a host package is suitable or not, this patch adds a
> function suitable-host-package. When called with parameter foo, it will
> execute check-host-foo.sh, or if absent, make function check-host-foo. These
> should return either the path to the suitable host package, or the empty
> string if no suitable package can be found.
> The rules to determine whether something is suitable or not is left to the
> check-host-foo(.sh) function and depends on foo.
> 
> An example usage of suitable-host-package is:
> DEPENDENCIES_HOST_PREREQ += $(if $(call suitable-host-package,foo),,host-foo)
> 
> To avoid cluttering the existing dependencies.mk file, it includes any
> check-host-foo.mk file. These files can be used to hold the appropriate
> functions or definitions.

While you're at it, perhaps move the toolchain/dependencies directory to 
support/dependencies?  And also it can be included from the top-level
Makefile instead of the toolchain makefiles.  Not that this is in any way
related to this patch :-)

> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[ I just realized that I agree with Thomas DS's conclusion that we should 
use Reviewed-by, not Acked-by... So my previous Acks should be Reviews.]

> 
> ---
>  toolchain/dependencies/dependencies.mk |  10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
> --- a/toolchain/dependencies/dependencies.mk
> +++ b/toolchain/dependencies/dependencies.mk
> @@ -6,6 +6,16 @@
>  ######################################################################
>  
>  DEPENDENCIES_HOST_PREREQ:=
> +
> +# suitable-host-pkg: calls check-host-$(1).sh shell script if it exists,
> +# otherwise calls check-host-$(1) make function. This script/function
> +# should return the path to the suitable host tool, or nothing if no
> +# suitable tool was found.
> +define suitable-host-package
> +$(if $(wildcard toolchain/dependencies/check-host-$(1).sh),$(shell toolchain/dependencies/check-host-$(1).sh),$(call check-host-$(1)))

 I would remove the possibility of having check-host-xxx as a function
unless there is a use case for it.  It's fairly easy to add later, and this
function becomes much more readable without it:
+$(shell toolchain/dependencies/check-host-$(1).sh)

> +endef
> +include toolchain/dependencies/check-host-*.mk
> +
>  ifeq ($(BR2_STRIP_sstrip),y)
>  DEPENDENCIES_HOST_PREREQ+=host-sstrip
>  endif
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111115/738a076b/attachment-0001.html>
