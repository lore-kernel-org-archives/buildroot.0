From: Daniel Nelson <daniel@sigpwr.com>
Date: Sun, 27 Jan 2013 17:38:56 -0800
Subject: [Buildroot] [PATCHv2] python3: Fix pyc-only related runtime
	exceptions
In-Reply-To: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
References: <1359313382-2257-1-git-send-email-daniel@sigpwr.com>
Message-ID: <1359337136-14157-1-git-send-email-daniel@sigpwr.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python3 changes the pyc lookup strategy, ignoring the
__pycache__ directory if the .py file is missing. Change
install location to enable use of .pyc without their parent .py

See http://www.python.org/dev/peps/pep-3147

Signed-off-by: Daniel Nelson <daniel@sigpwr.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)
---
 .../python3/python3-3.3-012-old-stdlib-cache.patch | 53 ++++++++++++++++++++++
 package/python3/python3.mk                         |  4 ++
 2 files changed, 57 insertions(+)
 create mode 100644 package/python3/python3-3.3-012-old-stdlib-cache.patch

diff --git a/package/python3/python3-3.3-012-old-stdlib-cache.patch b/package/python3/python3-3.3-012-old-stdlib-cache.patch
new file mode 100644
index 0000000..23171d5
--- /dev/null
+++ b/package/python3/python3-3.3-012-old-stdlib-cache.patch
@@ -0,0 +1,53 @@
+--- python3-3.3.0/configure.ac	2013-01-27 16:35:52.429067797 -0800
++++ python3-3.3.0/configure.ac	2013-01-27 16:43:43.528601443 -0800
+@@ -1827,6 +1827,23 @@
+     LIBTOOL_CRUFT=$LIBTOOL_CRUFT' -compatibility_version $(VERSION) -current_version $(VERSION)';;
+ esac
+ 
++STDLIB_CACHE_FLAGS=
++AC_MSG_CHECKING(for --enable-old-stdlib-cache)
++AC_ARG_ENABLE(old-stdlib-cache,
++    AS_HELP_STRING([--enable-old-stdlib-cache], [enable pre-pep3147 stdlib cache]),
++[
++    if test "$enableval" = "yes"
++    then
++        STDLIB_CACHE_FLAGS="-b"
++    else
++        STDLIB_CACHE_FLAGS="" 
++    fi
++],
++[
++    STDLIB_CACHE_FLAGS="" 
++])
++AC_SUBST(STDLIB_CACHE_FLAGS)
++
+ AC_MSG_CHECKING(for --enable-framework)
+ if test "$enable_framework"
+ then
+--- python3-3.3.0/Makefile.pre.in	2013-01-27 16:35:52.422067642 -0800
++++ python3-3.3.0/Makefile.pre.in	2013-01-27 16:37:03.710650439 -0800
+@@ -143,6 +143,9 @@
+ # Options to enable prebinding (for fast startup prior to Mac OS X 10.3)
+ OTHER_LIBTOOL_OPT=@OTHER_LIBTOOL_OPT@
+ 
++# Option to enable old-style precompiled stdlib
++STDLIB_CACHE_FLAGS=@STDLIB_CACHE_FLAGS@
++
+ # Environment to run shared python without installed libraries
+ RUNSHARED=       @RUNSHARED@
+ 
+@@ -1079,12 +1082,12 @@
+ 	fi
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
++		-d $(LIBDEST) -f $(STDLIB_CACHE_FLAGS) \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
++		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e7c0983..7551a7b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -70,6 +70,10 @@ else
 PYTHON3_CONF_OPT += --with-expat=none
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
+PYTHON3_CONF_OPT += --enable-old-stdlib-cache
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
 endif
-- 
1.8.1
