From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jan 2014 14:45:53 +0800
Subject: [Buildroot] Why is sysroot under i686-buildroot-linux-gnu?
In-Reply-To: <CAJpxd06=L5uMVHm2ZH2u5iRvB1CbRYQiJcaNfEheeNk-pqWc+w@mail.gmail.com>
References: <CAJpxd07vs10v6uhOe3=_a=Rj-40x+Q8yWh0cK+YbTnP1HdzLTw@mail.gmail.com>
 <20140104222832.7a8dab5b@skate>
 <CAJpxd06=L5uMVHm2ZH2u5iRvB1CbRYQiJcaNfEheeNk-pqWc+w@mail.gmail.com>
Message-ID: <20140107144553.15c189a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bryce Schober,

On Mon, 6 Jan 2014 10:39:34 -0800, Bryce Schober wrote:

> > > Why does buildroot end up installing the toolchain sysroot under
> > > output/host/usr/i686-buildroot-linux-gnu instead of under
> > > output/host/usr/i686-unknown-linux-gnu?
> >
> > Just because we set the vendor part of the tuple to "Buildroot" to
> > distinguish the Buildroot compiler/sysroot from the one of the original
> > toolchain. There is no strong need for this, it's just a bit nicer.
> 
> Where is this done? In some brief probing of the toolchain makefiles, I
> didn't see it. Also it would be nice if it was an optional behavior, maybe
> I'll submit a patch when I find it...

http://git.buildroot.net/buildroot/tree/package/Makefile.in#n23

> > > This is causing some problems in some of my external makefiles I have
> > > that expect the sysroot dir to match the toolchain tuple...
> >
> > They do: in host/usr/bin/, you have a compiler whose tuple matches the
> > sysroot directory name.
> >
> 
> Yeah, my complaint is that the tuple in the path for the sysroot is
> different than that of the compiler, which makes any external reference to
> the buildroot toolchain more complicated. I have external makefiles that
> use the buildroot toolchain, and now I'll have to keep a $TOOLCHAIN_NAME
> separate from a $SYSROOT_NAME.

Ok, I think I see what you mean. Can you test the following patch and
see if it fixes the problem for you?

diff --git a/package/Makefile.in b/package/Makefile.in
index f5d6289..44cf046 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -138,11 +138,7 @@ TARGET_CFLAGS += -fstack-protector-all
 TARGET_CXXFLAGS += -fstack-protector-all
 endif
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
-else
-TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
-endif
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1084ee2..cbfc15d 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -589,17 +589,18 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
+		tool=$${base##$(TOOLCHAIN_EXTERNAL_PREFIX)-}; \
 		case "$$base" in \
 		*cc|*cc-*|*++|*++-*|*cpp) \
-			ln -sf ext-toolchain-wrapper $$base; \
+			ln -sf ext-toolchain-wrapper $(TARGET_CROSS)$$tool; \
 			;; \
 		*gdb|*gdbtui) \
 			if test "$(BR2_PACKAGE_HOST_GDB)" != "y"; then \
-				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+				ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') $(TARGET_CROSS)$$tool ; \
 			fi \
 			;; \
 		*) \
-			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
+			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') $(TARGET_CROSS)$$tool; \
 			;; \
 		esac; \
 	done ;

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
