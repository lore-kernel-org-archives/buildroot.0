From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Aug 2014 22:49:08 +0200
Subject: [Buildroot] [PATCH v2] bcache-tools: Adding package.
In-Reply-To: <53DFA69A.5020709@tribudubois.net>
References: <1406839219-10929-1-git-send-email-jcd@tribudubois.net>
 <20140803185340.GI4052@free.fr> <53DFA69A.5020709@tribudubois.net>
Message-ID: <20140804204908.GE3875@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On 2014-08-04 17:28 +0200, Jean-Christophe DUBOIS spake thusly:
> Le 08/03/2014 08:53 PM, Yann E. MORIN a ?crit :
> >On 2014-07-31 22:40 +0200, Jean-Christophe DUBOIS spake thusly:
> >>diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
> >>new file mode 100644
> >>index 0000000..fbe4158
> >>--- /dev/null
> >>+++ b/package/bcache-tools/Config.in
> >>@@ -0,0 +1,11 @@
> >>+config BR2_PACKAGE_BCACHE_TOOLS
> >>+	bool "bcache tools"
> >>+	depends on BR2_PACKAGE_HAS_UDEV
> >>+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> >>+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> >Since you select sub-options of util-linux, you must also select the
> >package itself:
> >     select BR2_PACKAGE_UTIL_LINUX
> >
> >But you must also inherit its dependencies:
> >     depends on BR2_LARGEFILE # util-linux
> >     depends on BR2_USE_WCHAR # util-linux
> >
> >But you must also inherit from the sub-options' dependencies, too:
> >     depends on BR2_USE_MMU # util-linux (libblkid)

> Sorry I am new to buildroot, but wouldn't be expected that selecting LIBUUID
> and LIBBLKID would automatically select the LIBUUID and LIBBLKID
> dependencies and therefore it does not have to be explicitly selected by all
> packages depending on these features ?

No. That's a limitation of the kconfig language. 'select' does not
propagate the 'depends on'. See:
    http://buildroot.net/downloads/manual/manual.html#_literal_config_in_literal_file

    ---8<---
    Note. The current problem with the kconfig language is that these
    two dependency semantics are not internally linked. Therefore, it
    may be possible to select a package, whom one of its dependencies/
    requirement is not met.
    ---8<---

> If one day the util-linux dependency is changing, will it be expected to
> change the dependency of all package using linux-util?

Yes, but that would be the responsibility to the user bumping util-linux
to propagate the new dependencies or remove the old ones.

> >>+define BCACHE_TOOLS_FIX_PKGCONFIG
> >>+	$(SED) 's^`pkg-config^`$(PKG_CONFIG_HOST_BINARY)^' \
> >>+		$(BCACHE_TOOLS_DIR)/Makefile
> >>+endef
> >This should probably be a post-extract hook. See:
> >     http://buildroot.net/downloads/manual/manual.html#hooks

> I'll look into this. I copied this from the dnsmasq package.

Hmmm... Indeed. But that part was added 2.5 years ago, and we have
better infrastructure now. dnsmasq would be in need of a bit of love, it
looks like! ;-)

> >>+define BCACHE_TOOLS_BUILD_CMDS
> >>+	$(BCACHE_TOOLS_FIX_PKGCONFIG)
> >>+	$(BCACHE_TOOLS_MAKE_ENV) $(MAKE) -C $(@D)
> >This should probably be:
> >     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> >
> >TARGET_CONFIGURE_OPTS contains the CC= assignment.
> >
> >Thus, the BCACHE_TOOLS_MAKE_ENV no longer makes sense, so you can remove
> >it.
> OK, this is also coming from dnsmasq package.

OK, I saw you further replied on this matter. I'll read your other mail
and reply there.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
