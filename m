From: Naumann Andreas <ANaumann@ultratronik.de>
Date: Thu, 13 Jun 2013 10:03:48 +0200
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
 <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
Message-ID: <EE4E4767751A8B40949306E403F4DDD802EEB1D7@sv03ultra002.ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm happily jumping on integrating the egl stuff in buildroot (and qt), thanks for you start Spenser. 
As for Charles concerns, I too see the kernel build being triggered by ti-gfx, but that's natural since the modules depend on it. I have no problems with that. However, since I'm using a 3.1 kernel, the newclkapi patch broke the ti-gfx build for me. I just removed it, but maybe this can be solved better.

To go further with the qt support, I have added staging headers and libs, see patch below. I can now build qt5 with the gui module (which needs the eglfs support). However, when preparing an out of tree qt-project with buildroots qmake, the subsequent make step says it's got nothing to do. Looking into it, the SOURCES from the .pro file did not get picked up, but I have no idea why. Maybe this is another post though.

Here's my patch:


Betreff: [PATCH] ti-gfx: Install headers and libs to staging.

This enables the qt5 packages to successfully build with OpenGL / EGL support.

---
 package/ti-gfx/ti-gfx.mk | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index 154c792..1446fe5 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -30,6 +30,12 @@ TI_GFX_OMAPES = 8.x
 TI_GFX_PLATFORM = ti335x
 endif
 
+ifeq ($(BR2_PACKAGE_TI_GFX_DEBUG),y)
+TI_GFX_RELDBG = rel
+else
+TI_GFX_RELDBG = dbg
+endif
+
 define TI_GFX_EXTRACT_CMDS 
 	$(RM) -rf $(TI_GFX_DIR)
 	chmod +x $(DL_DIR)/$(TI_GFX_SOURCE)
@@ -50,13 +56,20 @@ TI_GFX_MAKE_CMD = cd $(TI_GFX_SRCDIR)/GFX_Linux_KM && \
 			SUPPORT_XORG=0 \
 			KERNELDIR=$(LINUX_DIR)
 
+TI_GFX_BIN_PATH = gfx_$(TI_GFX_RELDBG)_es$(TI_GFX_OMAPES)
+
 define TI_GFX_BUILD_CMDS
 	( $(TI_GFX_MAKE_CMD) clean && \
 	  $(TI_GFX_MAKE_CMD) all )
 endef
 
+SUB_FOLDER = EGL EWS GLES2 KHR
 define TI_GFX_INSTALL_STAGING_CMDS
-	
+	for folder in $(SUB_FOLDER); do \
+		$(INSTALL) -d $(STAGING_DIR)/usr/include/$$folder ; \
+		$(INSTALL) -D -m 0644 $(@D)/include/OGLES2/$$folder/*.h $(STAGING_DIR)/usr/include/$$folder ; \
+	done
+	$(INSTALL) -D -m 0644 $(@D)/$(TI_GFX_BIN_PATH)/*.so $(STAGING_DIR)/usr/lib
 endef
 
 define TI_GFX_INSTALL_TARGET_CMDS
-- 
1.8.2.3




------------------------------------------------------------------------------
Dipl.-Ing. (FH)
Andreas Naumann
Embedded Software
T +49 8105 77839-363
F +49 8105 77839-850
ANaumann at ultratronik.de
www.ultratronik.de
Dornierstra?e 9
82205 Gilching
ULTRATRONIK
L?SUNGEN F?R IHREN ERFOLG - SOLUTIONS FOR YOUR SUCCESS

------------------------------------------------------------------------------ 
Gesch?ftsf?hrer: Dipl.-Ing. Wolfgang Sorg, Dipl.-Kfm. Alexander Sorg
Sitz der Gesellschaft: Gilching
Registergericht M?nchen HRB 49567 (Ultratronik Vertriebs GmbH)
Registergericht M?nchen HRB 55584 (Ultratronik GmbH)

------------------------------------------------------------------------------ 



________________________________________

Von: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Im Auftrag von Spenser Gilliland
Gesendet: Mittwoch, 12. Juni 2013 19:33
An: Charles Krinke
Cc: buildroot
Betreff: Re: [Buildroot] [RFC] ti-gfx: add new package

Charles,

> I believe including a kernel compile with this patch is a problem for
> several reasons.
There is no kernel compile in this patch.   Only the sgx kernel modules are built.  The make KERNELDIR=path/to/sgx/dir modules only builds the modules in the current directory.
> The first is that the TI defconfig for AM3517_evm never made it into
> the Linux kernel along with all the supporting changes, so the build
> fails.
You can use any kernel you would like and are not bound to mainline kernels.  If the ti kernel has the needed patches, you may use it.  The only requirement is that the kernel is specified in the kernel configuration section.
> The second is that folks are using various versions of Graphics_SDK
> from 4_05_xx through 4_09_xx. These same folks generally build the
> Graphics_SDK once externally to buildroot to avoid carrying a 135MB
> file in the dl/ directory. This doesnt make sense for buildroot for
> two kernel .ko modules where 135MByte is larger then any other
> package.
It has to be downloaded anyways and as long as you don't distclean often; it will only be downloaded once.  It may make sense to provide an option to select which version of the gfx sdk but there's no need if they maintain backwards compatibility. 
> Perhaps you can consider making Graphics_SDK an external reference in
> your patch to make things go more smoothly?
IMHO. This would complicate the process.   The method presented would allow people with no ti-gfx experience to quickly get up and running.
Thanks,
Spenser
