From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 12 Aug 2015 14:43:45 -0400
Subject: [Buildroot] questions about supporting host package along side
	target package
Message-ID: <CALe+oY_Q1e_CuE4MamLCdAmzf38j7qdvk5bh5kfNj8WOcKBLRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In some recent work I have been doing, I require the 'rpm' package to
have a host package variant (so I can manipulate my initial target
setup during the post-build phase). I have performed some quick edits
to get rpm (and some dependent libraries) to build for my host system.
Everything appears to work fine in my setup, but I'd rather clean
things up and, of course, push the patches upstream. I've been looking
at other examples and constantly re-reading the manual, but I still
have some questions about providing support for host packages. If
anyone has a moment to spare, it would be appreciated.

---

The manual states the following:

   host-generic-package uses the HOST_LIBFOO_* variables. For some
variables, if the HOST_LIBFOO_ prefixed variable doesn?t exist, the
package infrastructure uses the corresponding variable prefixed by
LIBFOO_.

From a quick look at the manual, it implicitly indicates that
LIBFOO_CONF_OPTS is not a fallback value, so a respective
HOST_LIBFOO_CONF_OPTS entry is "required". I was wondering why, for
some cases, that some packages that build a host package do not define
the same configuration options for their target package?

For example, the current xz package
(http://git.buildroot.net/buildroot/tree/package/xz/xz.mk) has support
for a host and target package, but only explicitly configures thread
support for the target package. I assume, in this case, this was done
since it might not really matter for the host package; correct? Should
there exist lines defining "HOST_XZ_CONF_OPTS" anyways?

---

One of the dependent packages I would have to alter is the "neon"
package. To have this package support both a host and target package,
I'll be adding HOST_NEON_CONF_OPTS and HOST_NEON_DEPENDENCIES entries
to the make file. It seems if I want to match the same capabilities
found in the target package into the host, I'd be almost doubling the
size of the make file by adding respective HOST_* values. For example
(http://git.buildroot.net/buildroot/tree/package/neon/neon.mk):

   ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
   NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
   NEON_DEPENDENCIES += zlib
   else
   NEON_CONF_OPTS += --without-zlib
   endif

would be changed to:

   ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
   NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
   NEON_DEPENDENCIES += zlib
   HOST_NEON_CONF_OPTS += --with-zlib=$(HOST_DIR)
   HOST_NEON_DEPENDENCIES += host-zlib
   else
   NEON_CONF_OPTS += --without-zlib
   HOST_NEON_CONF_OPTS += --without-zlib
   endif

Is this the "correct" way to do this? Is there an alternative or an
example package that shows something better?
