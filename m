From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 12:05:16 +0100
Subject: [Buildroot] [PATCH 1/6] python: rework python symlinks
 installation
In-Reply-To: <1394057085-10399-2-git-send-email-s.martin49@gmail.com>
References: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
 <1394057085-10399-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140329110516.GB3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-05 23:04 +0100, Samuel Martin spake thusly:
> This change adds a patch to python disabling the installation of the
> python and python-config symlinks.
[--SNIP--]
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../python/python-011-remove-python-symlink.patch  | 29 ++++++++++++++++++++
>  package/python/python.mk                           | 32 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 package/python/python-011-remove-python-symlink.patch
> 
> diff --git a/package/python/python-011-remove-python-symlink.patch b/package/python/python-011-remove-python-symlink.patch
> new file mode 100644
> index 0000000..a9b1daa
> --- /dev/null
> +++ b/package/python/python-011-remove-python-symlink.patch
> @@ -0,0 +1,29 @@
> +Remove the python symlink install rules.
> +
> +The python symlink installation will be handled by Buildroot itself, because
> +Buildroot needs to control to what python interpreter (python2 or python3) the
> +python symlink points to.
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +
> +diff -purN a/Makefile.pre.in b/Makefile.pre.in
> +--- a/Makefile.pre.in	2014-03-02 17:56:56.529132499 +0100
> ++++ b/Makefile.pre.in	2014-03-02 19:24:02.346491849 +0100
> +@@ -857,17 +857,10 @@ $(DESTSHARED):
> + #  $(PYTHON) -> python2 -> python$(VERSION))
> + # Also create equivalent chains for other installed files
> + bininstall:	altbininstall
> +-	-if test -f $(DESTDIR)$(BINDIR)/$(PYTHON) -o -h $(DESTDIR)$(BINDIR)/$(PYTHON); \
> +-	then rm -f $(DESTDIR)$(BINDIR)/$(PYTHON); \
> +-	else true; \
> +-	fi
> +-	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2$(EXE) $(PYTHON))
> + 	-rm -f $(DESTDIR)$(BINDIR)/python2$(EXE)
> + 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)$(EXE) python2$(EXE))
> + 	-rm -f $(DESTDIR)$(BINDIR)/python2-config
> + 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-config python2-config)
> +-	-rm -f $(DESTDIR)$(BINDIR)/python-config
> +-	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2-config python-config)
> + 	-test -d $(DESTDIR)$(LIBPC) || $(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC)
> + 	-rm -f $(DESTDIR)$(LIBPC)/python2.pc
> + 	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python2.pc)

I guess this patch can't go upstream, of course.

But what about adding a configure flag --enable-install-symlinks to
decide whether to install or not to install the symlinks? Such a patch
is probably more involved, of course, but may have a chance of being
accepted upstream.

This comment should not bar this changeset to be applied.

> diff --git a/package/python/python.mk b/package/python/python.mk
> index 216448e..ec9a6d3 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -175,8 +175,40 @@ endef
>  
>  PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_ENSURE_LIBPYTHON_STRIPPED
>  
> +#
> +# Always install the python symlink in the target tree
> +#

I know there two other such comments, but the leading and following
empty comment lines are overkill, and most othe comments are not
following this syntax (which I find particularly ugly. Ditto for the
comments below.

> +define PYTHON_INSTALL_TARGET_PYTHON_SYMLINK
> +	ln -sf python2 $(TARGET_DIR)/usr/bin/python
> +endef
> +
> +PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_INSTALL_TARGET_PYTHON_SYMLINK
> +
> +#
> +# Always install the python-config symlink in the staging tree
> +#
> +define PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLINK
> +	ln -sf python2-config $(STAGING_DIR)/usr/bin/python-config
> +endef
> +
> +PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLINK
> +
>  PYTHON_AUTORECONF = YES
>  
> +#
> +# Some packages may have build scripts requiring python2.
> +# Only install the python symlink in the host tree if python(2) is enabled

Why 'python(2)' and not simply 'python2'? We know BR2_PACKAGE_PYTHON is
python2. I found this confusing.

> +# for the target.
> +#
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +define HOST_PYTHON_INSTALL_PYTHON_SYMLINK
> +	ln -sf python2 $(HOST_DIR)/usr/bin/python
> +	ln -sf python2-config $(HOST_DIR)/usr/bin/python-config
> +endef
> +
> +HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PYTHON_SYMLINK
> +endif
> +
>  # Provided to other packages
>  PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/
>  
> -- 
> 1.9.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
