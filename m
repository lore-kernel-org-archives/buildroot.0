From: Martin Banky <martin.banky@gmail.com>
Date: Thu, 30 Sep 2010 23:32:32 -0700
Subject: [Buildroot] [PATCH 2/3] pppd: convert to gentargets
In-Reply-To: <1285914753-22744-1-git-send-email-Martin.Banky@gmail.com>
References: <1285914753-22744-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285914753-22744-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/pppd/pppd-2.4.5-define-aligned_u64.patch |   13 +
 package/pppd/pppd-2.4.5-makefile-flags.patch     |  403 ++++++++++++++++++++++
 package/pppd/pppd-2.4.5-man-dir.patch            |   31 ++
 package/pppd/pppd-2.4.5-pppol2tp.patch           |   34 ++
 package/pppd/pppd.mk                             |  107 ++++---
 5 files changed, 540 insertions(+), 48 deletions(-)
 create mode 100644 package/pppd/pppd-2.4.5-define-aligned_u64.patch
 create mode 100644 package/pppd/pppd-2.4.5-makefile-flags.patch
 create mode 100644 package/pppd/pppd-2.4.5-man-dir.patch
 create mode 100644 package/pppd/pppd-2.4.5-pppol2tp.patch

diff --git a/package/pppd/pppd-2.4.5-define-aligned_u64.patch b/package/pppd/pppd-2.4.5-define-aligned_u64.patch
new file mode 100644
index 0000000..7eb0ad1
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-define-aligned_u64.patch
@@ -0,0 +1,13 @@
+Define aligned_u64, because it is not defined in the linux headers.
+--- a/pppd/sys-linux.c	2010-09-26 23:23:05.000000000 -0700
++++ b/pppd/sys-linux.c	2010-09-26 23:24:51.000000000 -0700
+@@ -118,6 +118,10 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ 
++#ifndef aligned_u64
++#define aligned_u64 unsigned long long __attribute__((aligned(8)))
++#endif
++ 
+ #include <linux/ppp_defs.h>
+ #include <linux/if_ppp.h>
diff --git a/package/pppd/pppd-2.4.5-makefile-flags.patch b/package/pppd/pppd-2.4.5-makefile-flags.patch
new file mode 100644
index 0000000..9fb457d
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-makefile-flags.patch
@@ -0,0 +1,403 @@
+Preserve the settings that we need, because buildroot clobbers
+the cflag settings in the various makefiles in pppd.
+--- a/chat/Makefile.linux	2009-11-16 15:26:07.000000000 -0700
++++ b/chat/Makefile.linux	2010-09-30 17:53:31.000000000 -0700
+@@ -21,7 +21,7 @@ chat:	chat.o
+ 	$(CC) -o chat chat.o
+ 
+ chat.o:	chat.c
+-	$(CC) -c $(CFLAGS) -o chat.o chat.c
++	$(CC) -c $(CDEFS) $(CFLAGS) -o chat.o chat.c
+ 
+ install: chat
+ 	mkdir -p $(BINDIR) $(MANDIR)
+
+--- a/pppd/Makefile.linux	2010-09-30 17:46:46.000000000 -0700
++++ b/pppd/Makefile.linux	2010-09-30 17:53:28.000000000 -0700
+@@ -77,26 +77,24 @@ MAXOCTETS=y
+ 
+ INCLUDE_DIRS= -I../include
+ 
+-COMPILE_FLAGS= -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP
+-
+-CFLAGS= $(COPTS) $(COMPILE_FLAGS) $(INCLUDE_DIRS) '-DDESTDIR="@DESTDIR@"'
++COMPILE_FLAGS= -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -I../include '-DDESTDIR="@DESTDIR@"'
+ 
+ ifdef CHAPMS
+-CFLAGS   += -DCHAPMS=1
++COMPILE_FLAGS   += -DCHAPMS=1
+ NEEDDES=y
+ PPPDOBJS += md4.o chap_ms.o
+ HEADERS	+= md4.h chap_ms.h
+ ifdef MSLANMAN
+-CFLAGS   += -DMSLANMAN=1
++COMPILE_FLAGS   += -DMSLANMAN=1
+ endif
+ ifdef MPPE
+-CFLAGS   += -DMPPE=1
++COMPILE_FLAGS   += -DMPPE=1
+ endif
+ endif
+ 
+ # EAP SRP-SHA1
+ ifdef USE_SRP
+-CFLAGS	+= -DUSE_SRP -DOPENSSL -I/usr/local/ssl/include
++COMPILE_FLAGS	+= -DUSE_SRP -DOPENSSL -I/usr/local/ssl/include
+ LIBS	+= -lsrp -L/usr/local/ssl/lib -lcrypto
+ TARGETS	+= srp-entry
+ EXTRAINSTALL = $(INSTALL) -s -c -m 555 srp-entry $(BINDIR)/srp-entry
+@@ -113,12 +111,12 @@ PPPDOBJS += sha1.o
+ endif
+ 
+ ifdef HAS_SHADOW
+-CFLAGS   += -DHAS_SHADOW
++COMPILE_FLAGS   += -DHAS_SHADOW
+ #LIBS     += -lshadow $(LIBS)
+ endif
+ 
+ ifneq ($(wildcard /usr/include/crypt.h),)
+-CFLAGS  += -DHAVE_CRYPT_H=1
++COMPILE_FLAGS  += -DHAVE_CRYPT_H=1
+ LIBS	+= -lcrypt
+ endif
+ 
+@@ -126,7 +124,7 @@ ifdef NEEDDES
+ ifndef USE_CRYPT
+ LIBS     += -ldes $(LIBS)
+ else
+-CFLAGS   += -DUSE_CRYPT=1
++COMPILE_FLAGS   += -DUSE_CRYPT=1
+ endif
+ PPPDOBJS += pppcrypt.o
+ HEADERS += pppcrypt.h
+@@ -134,7 +132,7 @@ endif
+ 
+ # For "Pluggable Authentication Modules", see ftp.redhat.com:/pub/pam/.
+ ifdef USE_PAM
+-CFLAGS   += -DUSE_PAM
++COMPILE_FLAGS   += -DUSE_PAM
+ LIBS     += -lpam -ldl
+ endif
+ 
+@@ -143,14 +141,14 @@ ifdef HAVE_MULTILINK
+ 	# Multilink implies the use of TDB
+ 	USE_TDB=y
+ 
+-	CFLAGS += -DHAVE_MULTILINK
++	COMPILE_FLAGS += -DHAVE_MULTILINK
+ 	PPPDSRCS += multilink.c
+ 	PPPDOBJS += multilink.o
+ endif
+ 
+ # TDB
+ ifdef USE_TDB
+-	CFLAGS += -DUSE_TDB=1
++	COMPILE_FLAGS += -DUSE_TDB=1
+ 	PPPDSRCS += tdb.c spinlock.c
+ 	PPPDOBJS += tdb.o spinlock.o
+ 	HEADERS += tdb.h spinlock.h
+@@ -159,11 +157,11 @@ endif
+ # Lock library binary for Linux is included in 'linux' subdirectory.
+ ifdef LOCKLIB
+ LIBS     += -llock
+-CFLAGS   += -DLOCKLIB=1
++COMPILE_FLAGS   += -DLOCKLIB=1
+ endif
+ 
+ ifdef PLUGIN
+-CFLAGS	+= -DPLUGIN
++COMPILE_FLAGS	+= -DPLUGIN
+ LDFLAGS	+= -Wl,-E
+ LIBS	+= -ldl
+ endif
+@@ -171,7 +169,7 @@ endif
+ ifdef FILTER
+ ifneq ($(wildcard /usr/include/pcap-bpf.h),)
+ LIBS    += -lpcap
+-CFLAGS  += -DPPP_FILTER
++COMPILE_FLAGS  += -DPPP_FILTER
+ endif
+ endif
+ 
+@@ -179,24 +177,27 @@ ifdef HAVE_INET6
+      PPPDSRCS += ipv6cp.c eui64.c
+      HEADERS  += ipv6cp.h eui64.h
+      PPPDOBJS += ipv6cp.o eui64.o
+-     CFLAGS   += -DINET6=1
++     COMPILE_FLAGS   += -DINET6=1
+ endif
+ 
+ ifdef CBCP
+      PPPDSRCS += cbcp.c
+      PPPDOBJS += cbcp.o
+-     CFLAGS += -DCBCP_SUPPORT
++     COMPILE_FLAGS += -DCBCP_SUPPORT
+      HEADERS += cbcp.h
+ endif
+ 
+ ifdef MAXOCTETS
+-     CFLAGS += -DMAXOCTETS
++     COMPILE_FLAGS += -DMAXOCTETS
+ endif
+ 
+ INSTALL= install
+ 
+ all: $(TARGETS)
+ 
++%.o: %.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o $@ -shared $<
++
+ install: pppd
+ 	mkdir -p $(BINDIR) $(MANDIR)
+ 	$(EXTRAINSTALL)
+@@ -206,10 +207,10 @@ install: pppd
+ 	$(INSTALL) -c -m 444 pppd.8 $(MANDIR)
+ 
+ pppd: $(PPPDOBJS)
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o pppd $(PPPDOBJS) $(LIBS)
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) $(LDFLAGS) -o pppd $(PPPDOBJS) $(LIBS)
+ 
+ srp-entry:	srp-entry.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ srp-entry.c $(LIBS)
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) $(LDFLAGS) -o $@ srp-entry.c $(LIBS)
+ 
+ install-devel:
+ 	mkdir -p $(INCDIR)/pppd
+@@ -219,4 +220,4 @@ clean:
+ 	rm -f $(PPPDOBJS) $(EXTRACLEAN) $(TARGETS) *~ #* core
+ 
+ depend:
+-	$(CPP) -M $(CFLAGS) $(PPPDSRCS) >.depend
++	$(CPP) -M $(COMPILE_FLAGS) $(CFLAGS) $(PPPDSRCS) >.depend
+
+--- a/pppd/plugins/Makefile.linux	2009-11-16 15:26:07.000000000 -0700
++++ b/pppd/plugins/Makefile.linux	2010-09-30 17:59:16.000000000 -0700
+@@ -1,7 +1,7 @@
+ #CC	= gcc
+ COPTS	= -O2 -g
+-CFLAGS	= $(COPTS) -I.. -I../../include -fPIC
+-LDFLAGS	= -shared
++COMPILE_FLAGS	= -I.. -I../../include -fPIC
++LINK_FLAGS	= -shared
+ INSTALL	= install
+ 
+ DESTDIR = $(INSTROOT)@DESTDIR@
+@@ -23,7 +23,7 @@ all:	$(PLUGINS)
+ 	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d all; done
+ 
+ %.so: %.c
+-	$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $^
++	$(CC) -o $@ $(LINK_FLAGS) $(COMPILE_FLAGS) $(CFLAGS) $^
+ 
+ VERSION = $(shell awk -F '"' '/VERSION/ { print $$2; }' ../patchlevel.h)
+ 
+@@ -37,5 +37,5 @@ clean:
+ 	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d clean; done
+ 
+ depend:
+-	$(CPP) -M $(CFLAGS) *.c >.depend
++	$(CPP) -M $(COMPILE_FLAGS) $(CFLAGS) *.c >.depend
+ 	for d in $(SUBDIRS); do $(MAKE) $(MFLAGS) -C $$d depend; done
+
+--- a/pppd/plugins/pppoatm/Makefile.linux	2009-11-16 15:26:07.000000000 -0700
++++ b/pppd/plugins/pppoatm/Makefile.linux	2010-09-30 17:59:16.000000000 -0700
+@@ -1,6 +1,6 @@
+ #CC	= gcc
+ COPTS	= -O2 -g
+-CFLAGS	= $(COPTS) -I../.. -I../../../include -fPIC
++COMPILE_FLAGS	= -I../.. -I../../../include -fPIC
+ LDFLAGS	= -shared
+ INSTALL	= install
+ 
+@@ -24,7 +24,7 @@ PLUGIN_OBJS := pppoatm.o
+ ifdef HAVE_LIBATM
+ LIBS := -latm
+ else
+-CFLAGS += -I.
++COMPILE_FLAGS += -I.
+ PLUGIN_OBJS += text2qos.o text2atm.o misc.o ans.o
+ LIBS := -lresolv
+ endif
+@@ -33,7 +33,7 @@ endif
+ all: $(PLUGIN)
+ 
+ $(PLUGIN): $(PLUGIN_OBJS)
+-	$(CC) $(CFLAGS) -o $@ -shared $^ $(LIBS)
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -o $@ -shared $^ $(LIBS)
+ 
+ install: all
+ 	$(INSTALL) -d -m 755 $(LIBDIR)
+@@ -43,4 +43,4 @@ clean:
+ 	rm -f *.o *.so
+ 
+ %.o: %.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o $@ -shared $<
+
+--- a/pppd/plugins/pppol2tp/Makefile.linux	2009-11-16 15:26:07.000000000 -0700
++++ b/pppd/plugins/pppol2tp/Makefile.linux	2010-09-30 17:59:16.000000000 -0700
+@@ -1,6 +1,6 @@
+ #CC	= gcc
+ COPTS	= -O2 -g
+-CFLAGS	= $(COPTS) -I. -I../.. -I../../../include -fPIC
++COMPILE_FLAGS	= -I. -I../.. -I../../../include -fPIC
+ LDFLAGS	= -shared
+ INSTALL	= install
+ 
+@@ -16,7 +16,7 @@ PLUGINS := pppol2tp.so openl2tp.so
+ all: $(PLUGINS)
+ 
+ %.so: %.o
+-	$(CC) $(CFLAGS) -o $@ -shared $^ $(LIBS)
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -o $@ -shared $^ $(LIBS)
+ 
+ install: all
+ 	$(INSTALL) -d -m 755 $(LIBDIR)
+@@ -26,4 +26,4 @@ clean:
+ 	rm -f *.o *.so
+ 
+ %.o: %.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o $@ $<
+
+--- a/pppd/plugins/radius/Makefile.linux	2009-11-16 15:26:07.000000000 -0700
++++ b/pppd/plugins/radius/Makefile.linux	2010-09-30 18:29:31.000000000 -0700
+@@ -12,7 +12,7 @@ VERSION = $(shell awk -F '"' '/VERSION/
+ INSTALL	= install
+ 
+ PLUGIN=radius.so radattr.so radrealms.so
+-CFLAGS=-I. -I../.. -I../../../include -O2 -fPIC -DRC_LOG_FACILITY=LOG_DAEMON
++COMPILE_FLAGS = -I. -I../.. -I../../../include -O2 -fPIC -DRC_LOG_FACILITY=LOG_DAEMON
+ 
+ # Uncomment the next line to include support for Microsoft's
+ # MS-CHAP authentication protocol.
+@@ -23,17 +23,20 @@ MPPE=y
+ MAXOCTETS=y
+ 
+ ifdef CHAPMS
+-CFLAGS += -DCHAPMS=1
++COMPILE_FLAGS += -DCHAPMS=1
+ ifdef MPPE
+-CFLAGS += -DMPPE=1
++COMPILE_FLAGS += -DMPPE=1
+ endif
+ endif
+ ifdef MAXOCTETS
+-CFLAGS += -DMAXOCTETS=1
++COMPILE_FLAGS += -DMAXOCTETS=1
+ endif
+ 
+ all: $(PLUGIN)
+ 
++%.o: %.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o $@ -shared $<
++
+ install: all
+ 	$(INSTALL) -d -m 755 $(LIBDIR)
+ 	$(INSTALL) -s -c -m 755 radius.so $(LIBDIR)
+@@ -43,13 +46,13 @@ install: all
+ 	$(INSTALL) -c -m 444 pppd-radattr.8 $(MANDIR)
+ 
+ radius.so: radius.o libradiusclient.a
+-	$(CC) -o radius.so -shared radius.o libradiusclient.a
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -o radius.so -shared radius.o libradiusclient.a
+ 
+ radattr.so: radattr.o
+-	$(CC) -o radattr.so -shared radattr.o
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -o radattr.so -shared radattr.o
+ 
+ radrealms.so: radrealms.o
+-	$(CC) -o radrealms.so -shared radrealms.o
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -o radrealms.so -shared radrealms.o
+ 
+ CLIENTOBJS = avpair.o buildreq.o config.o dict.o ip_util.o \
+ 	clientid.o sendserver.o lock.o util.o md5.o
+
+--- a/pppd/plugins/rp-pppoe/Makefile.linux	2009-11-16 15:26:07.000000000 -0700
++++ b/pppd/plugins/rp-pppoe/Makefile.linux	2010-09-30 17:59:16.000000000 -0700
+@@ -26,20 +26,20 @@ INSTALL	= install
+ RP_VERSION=3.8p
+ 
+ COPTS=-O2 -g
+-CFLAGS=$(COPTS) -I../../../include '-DRP_VERSION="$(RP_VERSION)"'
++COMPILE_FLAGS= -I../../../include '-DRP_VERSION="$(RP_VERSION)"'
+ all: rp-pppoe.so pppoe-discovery
+ 
+ pppoe-discovery: pppoe-discovery.o debug.o
+-	$(CC) -o pppoe-discovery pppoe-discovery.o debug.o
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -o pppoe-discovery pppoe-discovery.o debug.o
+ 
+ pppoe-discovery.o: pppoe-discovery.c
+-	$(CC) $(CFLAGS) -c -o pppoe-discovery.o pppoe-discovery.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o pppoe-discovery.o pppoe-discovery.c
+ 
+ debug.o: debug.c
+-	$(CC) $(CFLAGS) -c -o debug.o debug.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o debug.o debug.c
+ 
+ rp-pppoe.so: plugin.o discovery.o if.o common.o
+-	$(CC) -o rp-pppoe.so -shared plugin.o discovery.o if.o common.o
++	$(CC) $(COMPILE_FLAGS) -o rp-pppoe.so -shared plugin.o discovery.o if.o common.o
+ 
+ install: all
+ 	$(INSTALL) -d -m 755 $(LIBDIR)
+@@ -51,14 +51,14 @@ clean:
+ 	rm -f *.o *.so pppoe-discovery
+ 
+ plugin.o: plugin.c
+-	$(CC) $(CFLAGS) -I../../.. -c -o plugin.o -fPIC plugin.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -I../../.. -c -o plugin.o -fPIC plugin.c
+ 
+ discovery.o: discovery.c
+-	$(CC) $(CFLAGS) -I../../.. -c -o discovery.o -fPIC discovery.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -I../../.. -c -o discovery.o -fPIC discovery.c
+ 
+ if.o: if.c
+-	$(CC) $(CFLAGS) -I../../.. -c -o if.o -fPIC if.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -I../../.. -c -o if.o -fPIC if.c
+ 
+ common.o: common.c
+-	$(CC) $(CFLAGS) -I../../.. -c -o common.o -fPIC common.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -I../../.. -c -o common.o -fPIC common.c
+ 
+
+--- a/pppdump/Makefile.linux	2009-11-16 15:26:07.000000000 -0700
++++ b/pppdump/Makefile.linux	2010-09-30 17:59:16.000000000 -0700
+@@ -2,15 +2,18 @@ DESTDIR = $(INSTROOT)@DESTDIR@
+ BINDIR = $(DESTDIR)/sbin
+ MANDIR = $(DESTDIR)/share/man/man8
+ 
+-CFLAGS= -O -I../include/net
++COMPILE_FLAGS= -I../include/net
+ OBJS = pppdump.o bsd-comp.o deflate.o zlib.o
+ 
+ INSTALL= install
+ 
+ all:	pppdump
+ 
++%.o: %.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o $@ -shared $<
++
+ pppdump: $(OBJS)
+-	$(CC) -o pppdump $(OBJS)
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -o pppdump $(OBJS)
+ 
+ clean:
+ 	rm -f pppdump $(OBJS) *~
+
+--- a/pppstats/Makefile.linux	2009-11-16 15:26:07.000000000 -0700
++++ b/pppstats/Makefile.linux	2010-09-30 17:59:16.000000000 -0700
+@@ -26,11 +26,11 @@ install: pppstats
+ 	$(INSTALL) -c -m 444 pppstats.8 $(MANDIR)
+ 
+ pppstats: $(PPPSTATSRCS)
+-	$(CC) $(CFLAGS) -o pppstats pppstats.c $(LIBS)
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -o pppstats pppstats.c $(LIBS)
+ 
+ clean:
+ 	rm -f pppstats *~ #* core
+ 
+ depend:
+-	cpp -M $(CFLAGS) $(PPPSTATSRCS) >.depend
++	cpp -M $(COMPILE_FLAGS) $(CFLAGS) $(PPPSTATSRCS) >.depend
+ #	makedepend $(CFLAGS) $(PPPSTATSRCS)
diff --git a/package/pppd/pppd-2.4.5-man-dir.patch b/package/pppd/pppd-2.4.5-man-dir.patch
new file mode 100644
index 0000000..c9434f6
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-man-dir.patch
@@ -0,0 +1,31 @@
+Change the MANDIR variable in the top makefile
+to match the rest of the makefiles
+--- a/linux/Makefile.top	2009-11-16 15:26:07.000000000 -0700
++++ b/linux/Makefile.top	2010-09-30 19:57:19.000000000 -0700
+@@ -3,7 +3,7 @@
+ DESTDIR = $(INSTROOT)@DESTDIR@
+ BINDIR = $(DESTDIR)/sbin
+ INCDIR = $(DESTDIR)/include
+-MANDIR = $(DESTDIR)/share/man
++MANDIR = $(DESTDIR)/share/man/man8
+ ETCDIR = $(INSTROOT)@SYSCONF@/ppp
+ 
+ # uid 0 = root
+@@ -16,7 +16,7 @@ all:
+ 	cd pppstats; $(MAKE) $(MFLAGS) all
+ 	cd pppdump; $(MAKE) $(MFLAGS) all
+ 
+-install: $(BINDIR) $(MANDIR)/man8 install-progs install-devel
++install: $(BINDIR) $(MANDIR) install-progs install-devel
+ 
+ install-progs:
+ 	cd chat; $(MAKE) $(MFLAGS) install
+@@ -40,7 +40,7 @@ $(ETCDIR)/chap-secrets:
+ 
+ $(BINDIR):
+ 	$(INSTALL) -d -m 755 $@
+-$(MANDIR)/man8:
++$(MANDIR):
+ 	$(INSTALL) -d -m 755 $@
+ $(ETCDIR):
+ 	$(INSTALL) -d -m 755 $@
diff --git a/package/pppd/pppd-2.4.5-pppol2tp.patch b/package/pppd/pppd-2.4.5-pppol2tp.patch
new file mode 100644
index 0000000..249789a
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-pppol2tp.patch
@@ -0,0 +1,34 @@
+Per Paul Howarth
+
+"...due to ppp bundling a copy of linux/if_pppol2tp.h and this being used in
+preference to the system one. A recent change in kernel-headers has added a
+definition of struct pppol2tpv3_addr to this header file, and that definition
+is needed by linux/if_pppox.h but isn't found when compiling ppp due to the
+presence of the bundled copy of linux/if_pppol2tp.h. Simplest fix is to add
+the definition of struct pppol2tpv3_addr to the bundled copy..."
+
+See https://bugzilla.redhat.com/show_bug.cgi?id=617625
+
+--- ppp-2.4.5/include/linux/if_pppol2tp.h	2009-11-16 22:26:07.000000000 +0000
++++ ppp-2.4.5/include/linux/if_pppol2tp.h	2010-07-16 22:35:22.000000000 +0100
+@@ -32,6 +32,20 @@
+ 	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
+ };
+ 
++/* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
++ * bits. So we need a different sockaddr structure.
++ */
++struct pppol2tpv3_addr {
++	pid_t	pid;			/* pid that owns the fd.
++					 * 0 => current */
++	int	fd;			/* FD of UDP or IP socket to use */
++
++	struct sockaddr_in addr;	/* IP address and port to send to */
++
++	__u32 s_tunnel, s_session;	/* For matching incoming packets */
++	__u32 d_tunnel, d_session;	/* For sending outgoing packets */
++};
++
+ /* Socket options:
+  * DEBUG	- bitmask of debug message categories
+  * SENDSEQ	- 0 => don't send packets with sequence numbers
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 35fd451..f1249ef 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -3,72 +3,83 @@
 # pppd
 #
 #############################################################
-
 PPPD_VERSION = 2.4.5
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = ftp://ftp.samba.org/pub/ppp
+PPPD_INSTALL_STAGING = YES
+
+PPPD_MANPAGES = chat pppd pppdump pppstats
 PPPD_TARGET_BINS = chat pppd pppdump pppstats
-PPPD_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),chat pppd pppdump pppstats)
-PPPD_MAKE = $(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_MAKE_OPT)
+
+PPPD_STAGING_INSTALL_OPTS = BINDIR=$(STAGING_DIR)/usr/sbin \
+		ETCDIR=$(STAGING_DIR)/etc/ppp \
+		INCDIR=$(STAGING_DIR)/usr/include \
+		LIBDIR=$(STAGING_DIR)/usr/lib/pppd/$(PPPD_VERSION) \
+		MANDIR=$(STAGING_DIR)/usr/share/man/man8
+
+PPPD_TARGET_INSTALL_OPTS = BINDIR=$(TARGET_DIR)/usr/sbin \
+		ETCDIR=$(TARGET_DIR)/etc/ppp \
+		INCDIR=$(TARGET_DIR)/usr/include \
+		LIBDIR=$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION) \
+		MANDIR=$(TARGET_DIR)/usr/share/man/man8
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
-	PPPD_DEPENDENCIES += libpcap
-	PPPD_MAKE_OPT += FILTER=y
+PPPD_DEPENDENCIES += libpcap
+else
+define PPPD_NO_FILTER
+	$(SED) 's/FILTER=y/#FILTER=y/' $(@D)/pppd/Makefile.linux
+endef
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-	PPPD_MAKE_OPT += HAVE_INET6=y
+PPPD_MAKE_OPTS += HAVE_INET6=y
 endif
 
-$(eval $(call AUTOTARGETS,package,pppd))
+define PPPD_CONFIGURE_CMDS
+	$(PPPD_NO_FILTER)
+	(cd $(@D); \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+	)
+endef
 
-$(PPPD_HOOK_POST_EXTRACT):
-	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
-	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
-	touch $@
+define PPPD_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" $(PPPD_MAKE_OPTS) -C $(@D)
+endef
 
-$(PPPD_TARGET_INSTALL_TARGET):
-	$(call MESSAGE,"Installing to target")
-	for sbin in $(PPPD_TARGET_BINS); do \
-		$(INSTALL) -D $(PPPD_DIR)/$$sbin/$$sbin \
-			$(TARGET_DIR)/usr/sbin/$$sbin; \
-	done
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/minconn.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/minconn.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/passprompt.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/passprompt.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/passwordfd.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/passwordfd.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppoatm/pppoatm.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppoatm.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/rp-pppoe/rp-pppoe.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/rp-pppoe.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/rp-pppoe/pppoe-discovery \
-		$(TARGET_DIR)/usr/sbin/pppoe-discovery
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/winbind.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/winbind.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/openl2tp.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/openl2tp.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/pppol2tp.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppol2tp.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radius.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radius.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radrealms.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radrealms.so
+define PPPD_INSTALL_STAGING_CMDS
+	$(MAKE) $(PPPD_STAGING_INSTALL_OPTS) -C $(@D) install
+	$(MAKE) $(PPPD_STAGING_INSTALL_OPTS) -C $(@D) install-etcppp
+endef
+
+define PPPD_INSTALL_TARGET_CMDS
+	$(MAKE) $(PPPD_TARGET_INSTALL_OPTS) -C $(@D) install
+	$(MAKE) $(PPPD_TARGET_INSTALL_OPTS) -C $(@D) install-etcppp
+endef
+
+define PPPD_UNINSTALL_STAGING_CMDS
+	rm -f $(addprefix $(STAGING_DIR)/usr/sbin/, $(PPPD_TARGET_BINS))
 	for m in $(PPPD_MANPAGES); do \
-		$(INSTALL) -m 644 -D $(PPPD_DIR)/$$m/$$m.8 \
-			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \
+		rm -f $(STAGING_DIR)/usr/share/man/man8/$$m.8; \
 	done
-	touch $@
+	rm -rf $(STAGING_DIR)/etc/ppp
+	rm -rf $(STAGING_DIR)/usr/include/pppd
+	rm -rf $(STAGING_DIR)/usr/lib/pppd
+endef
 
-$(PPPD_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define PPPD_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(PPPD_TARGET_BINS))
-	rm -f $(TARGET_DIR)/usr/sbin/pppoe-discovery
 	for m in $(PPPD_MANPAGES); do \
 		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
 	done
+	rm -rf $(TARGET_DIR)/etc/ppp
+	rm -rf $(TARGET_DIR)/usr/include/pppd
 	rm -rf $(TARGET_DIR)/usr/lib/pppd
-	rm -f $(PPPD_TARGET_INSTALL_TARGET) $(PPPD_HOOK_POST_INSTALL)
+endef
+
+define PPPD_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,pppd))
-- 
1.7.3
