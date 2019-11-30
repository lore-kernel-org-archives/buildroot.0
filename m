From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2019 11:05:03 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/{pkg-generic, python,
 python3}: add mechanism to exclude .py files from removal
In-Reply-To: <20191129190707.710738-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 29 Nov 2019 20:07:05 +0100")
References: <20191129190707.710738-1-thomas.petazzoni@bootlin.com>
 <20191129190707.710738-2-thomas.petazzoni@bootlin.com>
Message-ID: <87d0d98ysw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When BR2_PACKAGE_PYTHON{,3}_PYC_ONLY=y, we force remove all .py files
 > from the system, as they have all been byte-compiled into their .pyc
 > variants.

 > However, it turns out that some packages (e.g: OpenCV) do some funky
 > things with a few .py files: they pass them through Python's
 > execfile() facility, which only works with .py files and not .pyc
 > files. It is used by OpenCV for example to read two small
 > configuration files.

 > In order to support such use cases, this commit introduces a very
 > simple mechanism by which packages can exclude some path patterns from
 > the .py removal: a per-package <pkg>_KEEP_PY_FILES variable that is
 > collected into a global PYTHON_KEEP_PY_FILES variable, then used by
 > the python/python3 target-finalize hooks.

 > This variable is intentionally not documented, this is really a hack
 > that we ideally would like to see go away, and we'd rather not see its
 > usage spread too much.

 > This is necessary to be able to fix bug #12171.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  package/pkg-generic.mk     | 1 +
 >  package/python/python.mk   | 4 +++-
 >  package/python3/python3.mk | 4 +++-
 >  3 files changed, 7 insertions(+), 2 deletions(-)

 > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
 > index 7d6fa08418..0f93f3c58b 100644
 > --- a/package/pkg-generic.mk
 > +++ b/package/pkg-generic.mk
 > @@ -1054,6 +1054,7 @@ PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 >  endif
 >  TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 >  ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
 > +PYTHON_KEEP_PY_FILES += $$($(2)_KEEP_PY_FILES)
 
 >  ifeq ($$($(2)_SITE_METHOD),svn)
 >  DL_TOOLS_DEPENDENCIES += svn
 > diff --git a/package/python/python.mk b/package/python/python.mk
 > index 8c2b195c91..dda9898f03 100644
 > --- a/package/python/python.mk
 > +++ b/package/python/python.mk
 > @@ -267,7 +267,9 @@ endif
 
 >  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 >  define PYTHON_REMOVE_PY_FILES
 > -	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
 > +	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' \
 > +		$(if $(PYTHON_KEEP_PY_FILES),-not \( $(call finddirclauses,$(TARGET_DIR),$(PYTHON_KEEP_PY_FILES)) \) ) \
 > +		-print0 | \
 >  		xargs -0 --no-run-if-empty rm -f
 >  endef
 >  PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
 > diff --git a/package/python3/python3.mk b/package/python3/python3.mk
 > index d6fda5c274..d9084d126b 100644
 > --- a/package/python3/python3.mk
 > +++ b/package/python3/python3.mk
 > @@ -285,7 +285,9 @@ endif
 
 >  ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 >  define PYTHON3_REMOVE_PY_FILES
 > -	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
 > +	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' \
 > +		$(if $(PYTHON_KEEP_PY_FILES),-not \( $(call finddirclauses,$(TARGET_DIR),$(PYTHON_KEEP_PY_FILES)) \) ) \

This unfortunately doesn't work as PYTHON_KEEP_PY_FILES will contain a
bunch of white space, so without the opencv python module you end up
with:

find /home/peko/source/buildroot/output-opencv/target/usr/lib/python3.8 -name '*.py' -not \(  \)  -print0 | xargs -0 --no-run-if-empty rm -f
find: invalid expression; empty parentheses are not allowed.

So I added a $(strip) around PYTHON_KEEP_PY_FILES and committed, thanks.

-- 
Bye, Peter Korsgaard
