From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Oct 2017 19:52:30 -0500
Subject: [Buildroot] [PATCH v2 3/5] libsepol: bump to 2.7
In-Reply-To: <20171010195209.24074-3-aduskett@gmail.com>
References: <20171010195209.24074-1-aduskett@gmail.com>
 <20171010195209.24074-3-aduskett@gmail.com>
Message-ID: <CANQCQpYy1PLbCDGP1g93dy38YtCtub7Dak_N_RDUGFWDCWNY9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam,

On Tue, Oct 10, 2017 at 2:52 PM, Adam Duskett <aduskett@gmail.com> wrote:
> Also refresh patches to work with new version.
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - None
>

Similar test-pkg run as policycoreutils and found this one.

/usr/bin/gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I../..
-I/usr/lfs/v0/rc-buildroot/selinux_2_7/armv7-ctng-linux-gnueabihf/host/include
-fno-strict-aliasing -I./../include
-I/usr/lfs/v0/rc-buildroot/selinux_2_7/armv7-ctng-linux-gnueabihf/host/lib64/../include
-I/usr/lfs/v0/rc-buildroot/selinux_2_7/armv7-ctng-linux-gnueabihf/host/include
-I/usr/lfs/v0/rc-buildroot/selinux_2_7/armv7-ctng-linux-gnueabihf/host/include
-fpic -O2 -I/usr/lfs/v0/rc-buildroot/selinux_2_7/armv7-ctng-linux-gnueabihf/host/include
-c -o mlsrule_query.o mlsrule_query.c
mlsrule_query.c: In function ?range_trans_state_next?:
mlsrule_query.c:81:19: error: ?range_trans_t? has no member named ?next?
  rs->cur = rs->cur->next;
                   ^
mlsrule_query.c: In function ?range_trans_state_size?:
mlsrule_query.c:97:37: error: ?range_trans_t? has no member named ?next?
  for (tmp = rs->head; tmp; tmp = tmp->next)
                                     ^
mlsrule_query.c: In function ?qpol_policy_get_range_trans_iter?:
mlsrule_query.c:136:21: warning: assignment from incompatible pointer
type [enabled by default]
  rs->head = rs->cur = db->range_tr;
                     ^
mlsrule_query.c: In function ?qpol_range_trans_get_range?:
mlsrule_query.c:227:36: error: ?range_trans_t? has no member named
?target_range?
  *range = (qpol_mls_range_t *) & rt->target_range;
                                    ^
make[6]: *** [mlsrule_query.o] Error 1
make[6]: *** Waiting for unfinished jobs....
iterator.c: In function ?ebitmap_state_get_cur_polcap?:
iterator.c:653:2: warning: return discards ?const? qualifier from
pointer target type [enabled by default]
  return sepol_polcap_getname(es->cur);
  ^
make[5]: *** [all] Error 2
make[4]: *** [all-recursive] Error 1
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: *** [/usr/lfs/v0/rc-buildroot/selinux_2_7/armv7-ctng-linux-gnueabihf/build/host-setools-3.3.8/.stamp_built]
Error 2
make: *** [_all] Error 2


>  package/libsepol/0001-support-static-only.patch | 32 +++++++++++++++----------
>  package/libsepol/0003-revert-ln-relative.patch  | 18 ++++++++++----
>  package/libsepol/libsepol.hash                  |  4 ++--
>  package/libsepol/libsepol.mk                    |  4 ++--
>  4 files changed, 37 insertions(+), 21 deletions(-)
>
> diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
> index 3e6d555e96..185a5641de 100644
> --- a/package/libsepol/0001-support-static-only.patch
> +++ b/package/libsepol/0001-support-static-only.patch
> @@ -1,4 +1,7 @@
> -Add support for static-only build
> +From 2140db697c7f1da2a0a3f7bbcb14c1a0dade84e5 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Adamduskett@outlook.com>
> +Date: Mon, 9 Oct 2017 16:28:12 -0400
> +Subject: [PATCH] Add support for static-only build
>
>  Instead of unconditionally building shared libraries, this patch
>  improves the libsepol build system with a "STATIC" variable, which
> @@ -7,30 +10,30 @@ libraries. It allows to support cases where the target architecture
>  does not have support for shared libraries.
>
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> -
> -Index: b/src/Makefile
> -===================================================================
> +Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> +---
> + src/Makefile | 13 ++++++++++---
> + 1 file changed, 10 insertions(+), 3 deletions(-)
>
>  diff --git a/src/Makefile b/src/Makefile
> -index db6c2ba..0006285 100644
> +index 819d261..040921d 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
> -@@ -30,8 +30,12 @@ LOBJS += $(sort $(patsubst %.c,%.lo,$(wildcard $(CILDIR)/src/*.c) $(CIL_GENERATE
> - override CFLAGS += -I$(CILDIR)/include
> +@@ -40,7 +40,12 @@ LDFLAGS += -undefined dynamic_lookup
> + LN=gln
>   endif
>
> +-all: $(LIBA) $(LIBSO) $(LIBPC)
>  +ALL_TARGETS = $(LIBA) $(LIBPC)
>  +ifeq ($(STATIC),)
>  +ALL_TARGETS += $(LIBSO)
>  +endif
> -
> --all: $(LIBA) $(LIBSO) $(LIBPC)
> ++
>  +all: $(ALL_TARGETS)
>
> -
> +
>   $(LIBA):  $(OBJS)
> -@@ -66,11 +70,13 @@
> +@@ -82,11 +87,13 @@ endif
>   install: all
>         test -d $(LIBDIR) || install -m 755 -d $(LIBDIR)
>         install -m 644 $(LIBA) $(LIBDIR)
> @@ -41,8 +44,11 @@ index db6c2ba..0006285 100644
>  +ifeq ($(STATIC),)
>  +      test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
>  +      install -m 755 $(LIBSO) $(SHLIBDIR)
> -       ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
> +       $(LN) -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
>  +endif
>
>   relabel:
>         /sbin/restorecon $(SHLIBDIR)/$(LIBSO)
> +--
> +2.13.6
> +
> diff --git a/package/libsepol/0003-revert-ln-relative.patch b/package/libsepol/0003-revert-ln-relative.patch
> index 0902d8d40e..488a9abea0 100644
> --- a/package/libsepol/0003-revert-ln-relative.patch
> +++ b/package/libsepol/0003-revert-ln-relative.patch
> @@ -1,4 +1,7 @@
> -Makefile: revert libsepol: use ln --relative to create .so symlinks
> +From 16b2b0e21e10727065042a1baabd1a887757c65c Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Adamduskett@outlook.com>
> +Date: Mon, 9 Oct 2017 16:29:36 -0400
> +Subject: [PATCH] Makefile: revert libsepol: use ln --relative to create .so symlinks
>
>  This reverts 71393a181d63c9baae5fe8dcaeb9411d1f253998
>
> @@ -9,16 +12,23 @@ they are maintained (up to 10 years in some cases?).
>  For the sake of Buildroot, revert the upstream patch.
>
>  Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> + src/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff -durN a/src/Makefile b/src/Makefile
> +diff --git a/src/Makefile b/src/Makefile
> +index 040921d..e811c9e 100644
>  --- a/src/Makefile
>  +++ b/src/Makefile
> -@@ -77,7 +77,7 @@
> +@@ -92,7 +92,7 @@ install: all
>   ifeq ($(STATIC),)
>         test -d $(SHLIBDIR) || install -m 755 -d $(SHLIBDIR)
>         install -m 755 $(LIBSO) $(SHLIBDIR)
> --      ln -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
> +-      $(LN) -sf --relative $(SHLIBDIR)/$(LIBSO) $(LIBDIR)/$(TARGET)
>  +      cd $(LIBDIR) && ln -sf ../../`basename $(SHLIBDIR)`/$(LIBSO) $(TARGET)
>   endif
>
>   relabel:
> +--
> +2.13.6
> +
> diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
> index 6c705067a2..08e2bf97a4 100644
> --- a/package/libsepol/libsepol.hash
> +++ b/package/libsepol/libsepol.hash
> @@ -1,2 +1,2 @@
> -# From https://github.com/SELinuxProject/selinux/wiki/Releases
> -sha256 d856d6506054f52abeaa3543ea2f2344595a3dc05d0d873ed7f724f7a16b1874  libsepol-2.6.tar.gz
> +# From: https://github.com/SELinuxProject/selinux/wiki/Releases
> +sha256 d69d3bd8ec901a3bd5adf2be2fb47fb1a685ed73066ab482e7e505371a48f9e7  libsepol-2.7.tar.gz
> diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
> index 21ca419c74..c54c3bfc42 100644
> --- a/package/libsepol/libsepol.mk
> +++ b/package/libsepol/libsepol.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -LIBSEPOL_VERSION = 2.6
> -LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
> +LIBSEPOL_VERSION = 2.7
> +LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
>  LIBSEPOL_LICENSE = LGPL-2.1+
>  LIBSEPOL_LICENSE_FILES = COPYING
>
> --
> 2.13.6
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
