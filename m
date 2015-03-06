From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 Mar 2015 10:22:48 +0000
Subject: [Buildroot] [PATCH] espeak: add support for static builds
Message-ID: <1425637368-63956-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently espeak fails to build statically because its Makefile builds a
shared binary and a shared library (among other things) by default. This
is the error message:

---------------------------------------------------
/br/output/host/usr/bin/mipsel-linux-g++ -static -shared
-Wl,-soname,libespeak.so.1 -o libespeak.so \
	x_speak_lib.o x_compiledict.o x_dictionary.o x_intonation.o
x_readclause.o x_setlengths.o x_numbers.o x_synth_mbrola.o x_synthdata.o
x_synthesize.o x_translate.o x_mbrowrap.o x_tr_languages.o x_voices.o
x_wavegen.o x_phonemelist.o x_espeak_command.o x_event.o x_fifo.o
x_wave.o x_debug.o x_klatt.o x_sonic.o -lstdc++  -lpthread
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/4.8.3/../../../../mipsel-buildroot-linux-uclibc/bin/ld:
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/4.8.3/crtbeginT.o:
relocation R_MIPS_HI16 against `a local symbol' can not be used when
making a shared object; recompile with -fPIC
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/4.8.3/crtbeginT.o:
could not read symbols: Bad value
collect2: error: ld returned 1 exit status
make[1]: *** [libespeak.so] Error 1
---------------------------------------------------

espeak builds four things: a static binary (speak), a static library
(libespeak.a), a shared binary (espeak) and a shared library
(libespeak.so.1.1.48). The static binary is the same as the shared
binary plus the shared library, so we can rewrite the logic of espeak.mk
and install the static binary when BR2_STATIC_LIBS is set, and the
shared binary and shared library otherwise, which is the default
behavior of the Makefile.

Related:

  http://sourceforge.net/p/espeak/mailman/message/33512484/

Fixes:

  http://autobuild.buildroot.net/results/15b/15b33c97ce7268db96d2e04b8fffd64c19c41d66/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/espeak/espeak.mk |   23 +++++++++++++++++++++--
 1 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index bb9a247..57b2229 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -33,11 +33,30 @@ endef
 
 define ESPEAK_BUILD_CMDS
 	$(MAKE) -C $(@D)/src  $(TARGET_CONFIGURE_OPTS) \
-		AUDIO="$(ESPEAK_AUDIO_BACKEND)" all
+		AUDIO="$(ESPEAK_AUDIO_BACKEND)" \
+		$(if $(BR2_STATIC_LIBS),speak,all)
 endef
 
+ifeq ($(BR2_STATIC_LIBS),y)
 define ESPEAK_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
+	# Install speak executable
+	$(INSTALL) -D -m 755 $(@D)/src/speak $(TARGET_DIR)/usr/bin
+	# Install data files
+	mkdir -p $(TARGET_DIR)/usr/share/espeak-data
+	cp -prf $(@D)/espeak-data/* $(TARGET_DIR)/usr/share/espeak-data
 endef
+else
+define ESPEAK_INSTALL_TARGET_CMDS
+	# Install espeak executable
+	$(INSTALL) -D -m 755 $(@D)/src/espeak $(TARGET_DIR)/usr/bin
+	# Install shared library
+	$(INSTALL) -D -m 755 $(@D)/src/libespeak.so.1.$(ESPEAK_VERSION_MAJOR) $(TARGET_DIR)/usr/lib
+	ln -sf libespeak.so.1.$(ESPEAK_VERSION_MAJOR) $(TARGET_DIR)/usr/lib/libespeak.so.1
+	ln -sf libespeak.so.1 $(TARGET_DIR)/usr/lib/libespeak.so
+	# Install data files
+	mkdir -p $(TARGET_DIR)/usr/share/espeak-data
+	cp -prf $(@D)/espeak-data/* $(TARGET_DIR)/usr/share/espeak-data
+endef
+endif
 
 $(eval $(generic-package))
-- 
1.7.1
