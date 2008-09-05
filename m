From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 4 Sep 2008 18:04:55 -0700
Subject: [Buildroot] [buildroot 0002724]: freetype-2.3.5 configure fails
Message-ID: <8a177860306d6810498fcf83a0bac4b2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=2724 
====================================================================== 
Reported By:                seek
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2724
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             04-02-2008 06:54 PDT
Last Modified:              09-04-2008 18:04 PDT
====================================================================== 
Summary:                    freetype-2.3.5 configure fails
Description: 
Building of freetype-2.3.5 stops with this error:

checking for x86_64-pc-linux-gnu-gcc... x86_64-pc-linux-gnu
checking for x86_64-pc-linux-gnu-gcc... (cached) x86_64-pc-linux-gnu
checking for x86_64-pc-linux-gnu-gcc... (cached) x86_64-pc-linux-gnu
checking for suffix of native executables... ./configure: line 3392:
x86_64-pc-linux-gnu: command not found
configure: error: native C compiler is not working
make[1]: *** [setup] Fehler 1

freetype-2.2.1 works as expected.



====================================================================== 

---------------------------------------------------------------------- 
 antialize - 08-17-08 01:54  
---------------------------------------------------------------------- 
The bug is still there:

cd builds/unix; ./configure  "--target=i686-linux" "--host=i686-linux"
"--build=x86_64-pc-linux-gnu" "--prefix=/usr" "--exec-prefix=/usr"
"--bindir=/usr/bin" "--sbindir=/usr/sbin" "--libdir=/usr/lib"
"--libexecdir=/usr/lib" "--sysconfdir=/etc" "--datadir=/usr/share"
"--localstatedir=/var" "--includedir=/usr/include" "--mandir=/usr/man"
"--infodir=/usr/info" " "
configure: WARNING: you should use --build, --host, --target
configure: WARNING: invalid host type:
...
checking for suffix of native executables... ./configure: line 3392:
x86_64-pc-linux-gnu: command not found
configure: error: native C compiler is not working

 

---------------------------------------------------------------------- 
 antialize - 08-07-08 11:47  
---------------------------------------------------------------------- 
The bug is on line 43 in build/configure.raw
It saies
AC_CHECK_PROG(CC_BUILD, ${build}-gcc, ${build-gcc})
It should be
AC_CHECK_PROG(CC_BUILD, ${build}-gcc, ${build}-gcc)

It seems this bug has already been fixed upstream, can we get a vertion
bump? 

---------------------------------------------------------------------- 
 hmoffatt - 09-03-08 21:27  
---------------------------------------------------------------------- 
Can you modify your package/freetype/Config.in to change 2.3.5 to 2.3.7,
run "make menuconfig" and save, then try a build and tell us if it works? 

---------------------------------------------------------------------- 
 antialize - 09-04-08 10:32  
---------------------------------------------------------------------- 
Something changed at some point and i am able to build 2.3.5 from plain
svn.

Using the following patch i can bulid both 2.3.5 and 2.3.7

Index: package/freetype/freetype.mk
===================================================================
--- package/freetype/freetype.mk        (revision 23182)
+++ package/freetype/freetype.mk        (working copy)
@@ -16,7 +16,7 @@

 $(FREETYPE_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
        $(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
-       toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/
\*.patch
+       echo freetype-$(FREETYPE_VERSION)\*.patch | grep -q '*' ||
toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/
        $(CONFIG_UPDATE) $(FREETYPE_DIR)
        $(CONFIG_UPDATE) $(FREETYPE_DIR)/builds/unix
        touch $@
Index: package/freetype/Config.in
===================================================================
--- package/freetype/Config.in  (revision 23182)
+++ package/freetype/Config.in  (working copy)
@@ -19,9 +19,13 @@
        config BR2_FREETYPE_VERSION_2_3_5
                bool "Freetype 2.3.5"

+       config BR2_FREETYPE_VERSION_2_3_7
+               bool "Freetype 2.3.7"
+
 endchoice

 config BR2_FREETYPE_VERSION
        string
        default "2.2.1"         if BR2_FREETYPE_VERSION_2_2_1
        default "2.3.5"         if BR2_FREETYPE_VERSION_2_3_5
+       default "2.3.7"         if BR2_FREETYPE_VERSION_2_3_7 

---------------------------------------------------------------------- 
 hmoffatt - 09-04-08 17:59  
---------------------------------------------------------------------- 
Is there any need to support both 2.3.5 and 2.3.7, or should the newer
version replace the older one?

The change to the patch command is wrong I'm sorry.

- toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/ \*.patch
+ echo freetype-$(FREETYPE_VERSION)\*.patch | grep -q '*' ||
toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/

This will apply ALL patches, if there are any that match the version (not
just that version's patches). Instead the last argument should simply be
modified:

- toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/ \*.patch
+ toolchain/patch-kernel.sh $(FREETYPE_DIR) package/freetype/
freetype-$(FREETYPE_VERSION)-\*.patch 

---------------------------------------------------------------------- 
 hmoffatt - 09-04-08 18:04  
---------------------------------------------------------------------- 
Rev r23325 replaces 2.3.5 with 2.3.7. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-02-08 06:54  seek           New Issue                                    
04-02-08 06:54  seek           Status                   new => assigned     
04-02-08 06:54  seek           Assigned To               => buildroot       
08-07-08 09:43  antialize      Note Added: 0010314                          
08-07-08 09:45  antialize      Note Edited: 0010314                         
08-07-08 10:25  antialize      Issue Monitored: antialize                    
08-07-08 11:47  antialize      Note Added: 0010324                          
08-17-08 01:54  antialize      Note Edited: 0010314                         
09-03-08 21:27  hmoffatt       Note Added: 0010984                          
09-04-08 10:32  antialize      Note Added: 0011014                          
09-04-08 17:59  hmoffatt       Note Added: 0011084                          
09-04-08 18:04  hmoffatt       Status                   assigned => closed  
09-04-08 18:04  hmoffatt       Note Added: 0011094                          
======================================================================
