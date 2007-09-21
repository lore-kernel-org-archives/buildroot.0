From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Sep 2007 09:44:06 +0200
Subject: [Buildroot] local mirror management (bug #572)
In-Reply-To: <46F2E86C.7050705@mips.com>
References: <20070917075500.052F2A4692@busybox.net>
	<1190025802.8052.4.camel@elrond.sweden.atmel.com>
	<20070917092735.GA18888@aon.at>
	<1190031404.8052.9.camel@elrond.sweden.atmel.com>
	<20070917111024.GB22104@aon.at>
	<1190040978.8052.20.camel@elrond.sweden.atmel.com>
	<20070917134117.GC24993@aon.at>
	<1190098489.4064.7.camel@elrond.sweden.atmel.com>
	<20070919082107.GC11856@aon.at> <46F2E86C.7050705@mips.com>
Message-ID: <20070921074406.GB24467@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 10:38:52PM +0100, Elizabeth Oldham wrote:
> Bernhard Fischer wrote:
>
>> "local mirror" patch in mantis (or the ML archives). See 1).
>> With the patch mentioned above, you (i.e. the user) is free to setup and
>> use any mirror she likes, be it the
>> http://buildroot.uclibc.org/downloads/buildroot-sources/
>> or another, potentially local directory (i.e. nothing you can talk to
>> via http or ftp).
>> 1) http://bugs.busybox.net/view.php?id=572
>
> I'll bite, this is exactly what I need... I tweaked the patch in that bug 
> and attach my version for comment. I dont know what clean up you had in 
> mind but I'm happy to make further attempts.
>
> Beth

>Index: Config.in
>===================================================================
>--- Config.in	(revision 19922)
>+++ Config.in	(working copy)
>@@ -672,6 +672,39 @@
> 	string "Wget command"
> 	default "wget --passive-ftp -nd"
> 
>+config BR2_LOCAL_MIRROR
>+	bool "Use a local mirror"
>+      	default n

Please use just one leading tab. The help-text is usually like this:
<tab>help
<tab><space><space>description that fits in about 70 columns
Same for the majority below.
>+
>+config BR2_LOCAL_MIRROR_STRICT
>+	bool "Only download from mirror"
>+	default n
>+
>+config BR2_LOCAL_MIRROR_SITE
>+	string "Local mirror site:"
>+       	default "http://localhost/"
>+       	depends on BR2_LOCAL_MIRROR
>+
>+config BR2_LOCAL_MIRROR_LOCALHOSTS
>+      	string "Local hosts"
>+      	default ""
>+      	depends on BR2_LOCAL_MIRROR
>+      	help
>+          Do not change URL of specified hosts. Useful if you maintain
>+          your own packages.
>+
>+config BR2_LOCAL_MIRROR_GEN
>+      	bool "Update mirror build directory"
>+      	depends on !BR2_LOCAL_MIRROR_STRICT
>+      	help
>+          Update your mirror build directory with the packages that 
>+	  cannot be fetched from the mirror.
>+
>+config BR2_LOCAL_MIRROR_GENDIR
>+	string "mirror build directory"
>+      	depends on BR2_LOCAL_MIRROR_GEN
>+      	default "$(BASE_DIR)/mirror"
>+
> config BR2_SVN_CO
> 	string "Subversion (svn) command to download source tree"
> 	default "svn co"
>Index: package/Makefile.in
>===================================================================
>--- package/Makefile.in	(revision 19922)
>+++ package/Makefile.in	(working copy)
>@@ -62,6 +62,17 @@
> endif
> #########################################################################
> 
>+ifeq ($(BR2_LOCAL_MIRROR),y)
>+WGET:=MIRROR_WGET="$(strip $(subst ",, $(BR2_WGET)))" \
>+       MIRROR_SITE="$(strip $(subst ",, $(BR2_LOCAL_MIRROR_SITE)))" \
>+       MIRROR_LOCALHOSTS="$(strip $(subst ",, $(BR2_LOCAL_MIRROR_LOCALHOSTS)))" \
>+       MIRROR_STRICT="$(strip $(subst ",, $(BR2_LOCAL_MIRROR_STRICT)))" \
>+       MIRROR_GEN="$(strip $(subst ",, $(BR2_LOCAL_MIRROR_GEN)))" \
>+       MIRROR_GENDIR="$(strip $(subst ",, $(BR2_LOCAL_MIRROR_GENDIR)))" \
>+       $(BASE_DIR)/misc/mirror.sh

This will break vim's syntax highlighting, unfortunately. It needs
#"))
here. Fire up vim and :syntax on
>+else
>+WGET:=$(strip $(subst ",, $(BR2_WGET)))
#"))
>+endif
> 
> ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
>Index: misc/mirror.sh

Please move that somewhere to toolchain/.

>===================================================================
>--- misc/mirror.sh	(revision 0)
>+++ misc/mirror.sh	(revision 0)
>@@ -0,0 +1,61 @@
>+#!/bin/bash

bash is not acceptable. It has to run on a POSIX shell if it can't be
done in make (which is clearly to be preferred).

>+
>+IFS=" "
>+
>+OPTIONS=""
>+USE_LOCAL=0
>+
>+for i in "$@"
>+do
>+  echo $i | grep '://' > /dev/null;
>+
>+  if [ "$?" = 0 ]
>+  then
>+    EXT_URL=$i
>+    HOST=`echo $i |sed 's+^.*://++' |sed 's+/.*++'`

You'll have to pass SED=$(XSED) down to that script (which shouldn't
exist in the first place, if possible) since
a) The host may not have sed installed
b) The host sed may be buggy
c) if one of a) b), we built a proper version for our own use.
>+    
>+    for j in $MIRROR_LOCAL_HOSTS
>+    do
>+      if [ "$j" = "$HOST" ]

Several test(1) impls will get this wrong if one of them is empty.
Prefix that with a char, like [ "x$j" = "x$HOST" ]

>+      then
>+        USE_LOCAL=1;
>+      fi

These four lines try to say
	[ "x$j" = "x$HOST" ] && USE_LOCAL=1

>+    done
>+    
>+    if [ "$USE_LOCAL" -eq 1 ]

You shall not compare a string to an int

>+    then
>+      URL=$i
>+    else
>+      URL="$MIRROR_SITE/`basename $i`"
>+    fi
>+  else
>+    OPTIONS="$OPTIONS $i"
>+  fi
>+done;
>+
>+$MIRROR_WGET $OPTIONS $URL
>+URL_RES=$?
>+
>+if [ "$URL_RES" = 0 ]

nah. If you're comparing an int, you're supposed to use the integer
comparison funcs.

>+then
>+  exit 0
>+fi
>+
>+# first download failed
>+if [ "$USE_LOCAL" = 1 ]

ditto.

>+then
>+  exit 1
>+fi
>+
>+if [ "$MIRROR_STRICT" = "y" ]

may barf with some test(1) impls if the var is empty. See prefixing
above

>+then
>+  exit 1;
>+fi
>+  
>+$MIRROR_WGET $OPTIONS $EXT_URL
>+
>+if [ "$?" = 0 -a "$MIRROR_GEN" = "y" ]

See last two comments.

>+then
>+  mkdir -p $MIRROR_GENDIR
>+  $MIRROR_WGET $OPTIONS -P $MIRROR_GENDIR/ $EXT_URL
>+fi
