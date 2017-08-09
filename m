From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:19:39 +0200
Subject: [Buildroot] [PATCH v2] pkg-cmake.mk: set pkg-config env. vars.
 in the host configure environment
In-Reply-To: <20170805181853.10785-1-s.martin49@gmail.com>
References: <20170805181853.10785-1-s.martin49@gmail.com>
Message-ID: <a23d5696-9e3b-c772-6519-3c5d15b0cf34@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-08-17 20:18, Samuel Martin wrote:
> This change is fixing the bug reported in [1].
> 
> Cmake may run pkg-config to find the dependencies when configuring a
> package. Because of the value of PATH, and it will use the Buildroot's
> pkg-config wrapper, which, by default, is configured (via some
> environment variables) to find the target dependencies.
> 
> When configuring a host package using cmake, to prevent cmake from
> wrongly solving dependencies from the target tree (when the
> *-config.cmake files are using pkg-config) instead of looking for them
> in the Buildroot's host tree or in the host system itself, we need to
> set the environment variables altering the pkg-config behavior in the
> cmake configure environment.
> 
> So, this change is fixing the cmake host-packages configuration step,
> by properly setting the pkg-config environment variables to their values
> for finding host dependencies.
[snip]
> Reported-by: "Sigalas, Antonios (Nokia - GR/Athens)" <antonios.sigalas@nokia.com>
> Cc: "Sigalas, Antonios (Nokia - GR/Athens)" <antonios.sigalas@nokia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Thank you for this extensive commit message!

 Applied to master, thanks.

 However...

> 
> ---
> 
> Note:
>   I think this fix is required on the master and cannot wait for the
>   next release cycle.
> 
> changes v1->v2
> - elaborate even more the commit log
> - add bug ref to the commit log (ThomasP)
> ---
>  package/pkg-cmake.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 914bda7482..db78d897d8 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -109,6 +109,11 @@ define $(2)_CONFIGURE_CMDS
>  	cd $$($$(PKG)_BUILDDIR) && \
>  	rm -f CMakeCache.txt && \
>  	PATH=$$(BR_PATH) \
> +	PKG_CONFIG="$$(PKG_CONFIG_HOST_BINARY)" \
> +	PKG_CONFIG_SYSROOT_DIR="/" \
> +	PKG_CONFIG_LIBDIR="$$(HOST_DIR)/lib/pkgconfig:$$(HOST_DIR)/share/pkgconfig" \
> +	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> +	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \

 This is exactly the same as HOST_MAKE_ENV so could be refactored - but then it
has to go to a new variable, perhaps. Or perhaps the variable should be renamed
(because it really applies to any configure and build system, not just make) -
but it's used in quite a few places so not so convenient.

 Also, other build systems may suffer from the same problem, e.g. python, though
probably those usually don't use pkg-config.


 Finally, I think that what we're doing here is just plain silly. We create a
wrapper script that sets some environment variables, but then we override those
environment variables again half the time... A fundamentally better approach IMO
is to create a HOST_DIR/cross-bin directory that contains the "cross" tools,
like the pkg-config wrapper but also the foo-config scripts from STAGING_DIR and
possibly some other stuff. And then for target builds we put that in front of
PATH. But that, obviously, is a much bigger change.

 Regards,
 Arnout

>  	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
>  		-DCMAKE_INSTALL_SO_NO_EXE=0 \
>  		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
