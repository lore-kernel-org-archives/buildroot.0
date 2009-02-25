From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Feb 2009 17:22:27 +0000 (UTC)
Subject: [Buildroot] [Bug 127] New: python_fuse_clean fails when
 python_clean called beforehand
Message-ID: <bug-127-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=127

           Summary: python_fuse_clean fails when python_clean called
                    beforehand
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: minor
          Priority: P3
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: yann_baud at yahoo.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 1.0


- Buildroot packages python_fuse and python are selected in menuconfig.
- Buildroot builds successfully.
- from buildroot dir: make python-clean
- from buildroot dir: make python-fuse-clean

This command fails with:

baud at galway:~/sandbox/WatsonEFM/WatsonEFMPlugin/trunk/src/base/buildroot$ make
python-fuse-clean
cd
/home/baud/sandbox/WatsonEFM/WatsonEFMPlugin/trunk/src/base/buildroot/build_arm/python-fuse-2.5;
\
       
/home/baud/sandbox/WatsonEFM/WatsonEFMPlugin/trunk/src/base/buildroot/build_arm/Python-2.4.5/hostpython
setup.py clean
Could not find platform independent libraries <prefix>
Could not find platform dependent libraries <exec_prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
'import site' failed; use -v for traceback
Traceback (most recent call last):
  File "setup.py", line 7, in ?
    from distutils.core import setup, Extension
ImportError: No module named distutils.core
make: *** [python-fuse-clean] Error 1

REMARK: from buildroot dir: "make clean" fails for the same reason:
python_clean called before python_fuse_clean.

PROPOSED FIX: when python_fuse package configured, make python_clean dependent
on python_fuse_clean.

Patched python package makefile:
================================
baud at galway:~/sandbox/WatsonEFM/WatsonEFMPlugin/trunk/src/base/buildroot/package/python$
svn diff
Index: python.mk
===================================================================
--- python.mk   (revision 11664)
+++ python.mk   (working copy)
@@ -12,6 +12,7 @@
 PYTHON_BINARY:=python
 PYTHON_TARGET_BINARY:=usr/bin/python
 PYTHON_DEPS:=
+PYTHON_CLEAN_DEPS:=

PYTHON_SITE_PACKAGE_DIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/site-packages

 BR2_PYTHON_DISABLED_MODULES=dbm zipfile
@@ -56,6 +57,10 @@
 PYTHON_DEPS += openssl
 endif

+ifeq ($(BR2_PYTHON_FUSE),y)
+PYTHON_CLEAN_DEPS += python-fuse-clean
+endif
+
 ifneq ($(BR2_PACKAGE_PYTHON_NIS),y)
 BR2_PYTHON_DISABLED_MODULES += nis
 endif
@@ -168,7 +173,7 @@

 python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)

-python-clean:
+python-clean: $(PYTHON_CLEAN_DEPS)
        -$(MAKE) -C $(PYTHON_DIR) distclean
        rm -f $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
        -rm -rf $(TARGET_DIR)/usr/lib/python* $(TARGET_DIR)/usr/include/python*


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
