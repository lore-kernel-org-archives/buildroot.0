From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:40:24 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 10/10] manual: adding
 packages luarocks
In-Reply-To: <1384520859-3189-10-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-10-git-send-email-francois.perrad@gadz.org>
Message-ID: <20131222184024.012d3bdf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 15 Nov 2013 14:07:39 +0100, Francois Perrad wrote:

> +Infrastructure for LuaRocks-based packages
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +[[luarocks-package-tutorial]]
> +
> ++luarocks-package+ tutorial
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +First, let's see how to write a +.mk+ file for a LuaRocks-based package,
> +with an example :
> +
> +------------------------
> +01: ################################################################################
> +02: #
> +03: # luafoo
> +04: #
> +05: ################################################################################
> +06:
> +07: LUAFOO_VERSION = 1.0.2-1
> +08: LUAFOO_DEPENDENCIES = foo

Maybe add LUAFOO_LICENSE and LUAFOO_LICENSE_FILES here.

> +10: LUAFOO_BUILD_OPT += FOO_INCDIR=$(STAGING_DIR)/usr/include
> +11: LUAFOO_BUILD_OPT += FOO_LIBDIR=$(STAGING_DIR)/usr/lib
> +12:
> +13: $(eval $(luarocks-package))
> +------------------------
> +
> +On line 7, we declare the version of the package (the same as in the rockspec,
> +which is the concatenation of the upstream version and the rockspec revision).

Maybe indicate that the upstream version and the rockspec version are
separated by a '-' sign ?

> +On line 8, we declare our dependencies, so that they are built
> +before the build process of our package starts.

Maybe mention that dependencies are only needed for packages that link
against native libraries?

> +On line 10-11, we tell Buildroot to pass custom options to LuaRocks when it is
> +building the package.

Ditto here?

> +
> +Finally, on line 13, we invoke the +luarocks-package+
> +macro that generates all the Makefile rules that actually allows the
> +package to be built.
> +
> +[[luarocks-package-reference]]
> +
> ++luarocks-package+ reference
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +LuaRocks is a deployment and management system for Lua modules.
> +
> +LuaRocks supports various +build.type+ : +builtin+, +make+, +cmake+.
> +This infrastructure supports only the +builtin+ mode,
> +the +make+ & +cmake+ modes could be directly handled by generic & cmake infrastructure.

LuaRocks is a deployment and management system for Lua modules, and
supports various +build.type+: +builtin+, +make+ and +cmake+. In the
contetx of Buildroot, the +luarocks-package+ infrastructure only
supports the +builtin+ mode. LuaRocks packages that use the +make+ or
+cmake+ build mechanisms should instead be packaged using the
+generic-package+ and +cmake-package+ infrastructures in Buildroot,
respectively.

> +The main macro of the LuaRocks package infrastructure is
> ++luarocks-package+. It is similar to the +generic-package+ macro.
> +The +host-luarocks-package+ macro is not available,
> +only the +luarocks-package+ macro is available.
> +
> +Just like the generic infrastructure, the LuaRocks infrastructure works
> +by defining a number of variables before calling the +luarocks-package+
> +macro.

The main macro of the LuaRocks package infrastructure is
+luarocks-package+: like +generic-package+ it works by defining a
number of variables providing meta informations about the package, and
then calling +luarocks-package+. It is worth mentioning that building
LuaRocks packages for the host is not supported, so the macro
+host-luarocks-package+ is not implemented.

> +First, all the package metadata information variables that exist in
> +the generic infrastructure also exist in the LuaRocks infrastructure:
> ++LUAFOO_VERSION+, +LUAFOO_SOURCE+, +LUAFOO_SITE+,
> ++LUAFOO_DEPENDENCIES+.

LUAFOO_LICENSE, LUAFOO_LICENSE_FILES

> +Two of them are populate by the LuaRocks infrastructure (for the

populated

> ++download+ step) :
> +
> +* +LUAFOO_SITE+ with the +BR2_LUAROCKS_MIRROR+ value
> +
> +* +LUAFOO_SOURCE+ with +foo-$(FOO_VERSION).src.rock+

If they are populated by the LuaRocks infrastructure, then there is no
point to mention them here.

> +A few additional variables, specific to the LuaRocks infrastructure, are
> +also defined. They could be overridden in specific cases.
> +
> +* +LUAFOO_ROCKSPEC+ with +foo-$(FOO_VERSION).rockspec+

What does "with" means? I guess it means it is the default value, but
it should be explained.

> +
> +* +LUAFOO_SUBDIR+ with +foo-$(FOO_VERSION_WITHOUT_ROCKSPEC_REVISION)+

Ditto.

> +
> +* +LUAFOO_BUILD_OPT+ contains the build options for the +luarocks build+ call.
> +  The default is empty.

What is it useful for.

> +With the LuaRocks infrastructure, only 2 steps use +luarocks+ :
> +extract and install-target. +luarocks+ handles building and install
> +in the same step.
> +
> +The step +patch+ is handled by the generic infrastructure.
> +The step +configure+ and +build+ stay empty.

These last two paragraphs are not needed I believe: they give internal
details of how the infrastructure works, which are transparent to the
user of the infrastructure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
