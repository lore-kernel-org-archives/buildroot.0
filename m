From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 22:29:36 +0200
Subject: [Buildroot] [PATCH 1 of 2 v2] manual generation: check
	dependencies first
In-Reply-To: <f873d24e7a1146f10791.1379761613@argentina> (Thomas De
 Schampheleire's message of "Sat, 21 Sep 2013 13:06:53 +0200")
References: <patchbomb.1379761612@argentina>
 <f873d24e7a1146f10791.1379761613@argentina>
Message-ID: <87wqlqcfdb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 Thomas> To generate the manual, you need a few tools. If these are not present,
 Thomas> pretty cryptic error messages are given.
 Thomas> This patch adds a simple check for these dependencies, before attempting to
 Thomas> build the manual.

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Thomas> ---
 Thomas> v2:
 Thomas> - update manual with the list of tools (comment Ryan)
 Thomas> - add check for dblatex and python-argparse (comment Samuel)
 Thomas> - check minimal version of asciidoc, using suitable-host-package mechanism

 Thomas>  docs/manual/make-tips.txt                   |   3 +--
 Thomas>  docs/manual/manual.mk                       |  30 +++++++++++++++++++++++++++++-
 Thomas>  docs/manual/prerequisite.txt                |   5 ++++-
 Thomas>  support/dependencies/check-host-asciidoc.sh |  36 ++++++++++++++++++++++++++++++++++++
 Thomas>  4 files changed, 70 insertions(+), 4 deletions(-)

 Thomas> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
 Thomas> --- a/docs/manual/make-tips.txt
 Thomas> +++ b/docs/manual/make-tips.txt
 Thomas> @@ -66,9 +66,8 @@ To generate the manual:
 Thomas>  The manual outputs will be generated in 'output/docs/manual'.
 
 Thomas>  .Notes
 Thomas> -- +asciidoc+ is required to build the documentation (see:
 Thomas> +- A few tools are required to build the documentation (see:
 Thomas>    xref:requirement-optional[]).
 Thomas> -- There is a known issue that you can't build it under Debian Squeeze.
 
 Thomas>  .Reseting Buildroot for a new target:
 
 Thomas> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
 Thomas> --- a/docs/manual/manual.mk
 Thomas> +++ b/docs/manual/manual.mk
 Thomas> @@ -1,8 +1,32 @@
 Thomas> -manual-update-lists:
 Thomas> +manual-update-lists: manual-check-dependencies-lists
 Thomas>  	$(Q)$(call MESSAGE,"Updating the manual lists...")
 Thomas>  	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
 Thomas>  		$(TOPDIR)/support/scripts/gen-manual-lists.py
 
 Thomas> +manual-check-dependencies:
 Thomas> +	$(Q)if [ -z "$(call suitable-host-package,asciidoc,)" ]; then \
 Thomas> +		echo "You need a sufficiently recent asciidoc on your host" \
 Thomas> +			"to generate the manual"; \
 Thomas> +		exit 1; \
 Thomas> +	fi

This breaks 'make release' as it is a noconfig_target, so we don't
include dependencies.mk for the suitable-host-package.

You don't really need to use suitable-host-package, perhaps you could
directly call check-host-asciidoc.sh instead?

-- 
Bye, Peter Korsgaard
