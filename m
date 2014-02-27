From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Feb 2014 07:39:46 +0100
Subject: [Buildroot] [PATCH 04/24] luajit: refactor without
	dont-strip.patch
In-Reply-To: <1393227301-14874-5-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-5-git-send-email-francois.perrad@gadz.org>
Message-ID: <530EDDB2.1080104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/24/14 08:34, Francois Perrad wrote:
> the variable TARGET_STRIP does the job
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luajit/luajit-03-dont-strip.patch |   23 -----------------------
>  package/luajit/luajit.mk                  |    2 +-
>  2 files changed, 1 insertion(+), 24 deletions(-)
>  delete mode 100644 package/luajit/luajit-03-dont-strip.patch
> 
> diff --git a/package/luajit/luajit-03-dont-strip.patch b/package/luajit/luajit-03-dont-strip.patch
> deleted file mode 100644
> index 66bdadf..0000000
> --- a/package/luajit/luajit-03-dont-strip.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Don't strip the library and binary
> -
> -This allows Buildroot to do it if needed, but only if needed.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: b/src/Makefile
> -===================================================================
> ---- a/src/Makefile
> -+++ b/src/Makefile
> -@@ -665,12 +665,10 @@
> - $(LUAJIT_SO): $(LJVMCORE_O)
> - 	$(E) "DYNLINK   $@"
> - 	$(Q)$(TARGET_LD) $(TARGET_ASHLDFLAGS) -o $@ $(LJVMCORE_DYNO) $(TARGET_ALIBS)
> --	$(Q)$(TARGET_STRIP) $@
> - 
> - $(LUAJIT_T): $(TARGET_O) $(LUAJIT_O) $(TARGET_DEP)
> - 	$(E) "LINK      $@"
> - 	$(Q)$(TARGET_LD) $(TARGET_ALDFLAGS) -o $@ $(LUAJIT_O) -lluajit -L. $(TARGET_ALIBS)
> --	$(Q)$(TARGET_STRIP) $@
> - 	$(E) "OK        Successfully built LuaJIT"
> - 
> - ##############################################################################
> diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
> index 529d3c2..186b3fd 100644
> --- a/package/luajit/luajit.mk
> +++ b/package/luajit/luajit.mk
> @@ -37,7 +37,7 @@ define LUAJIT_BUILD_CMDS
>  		DYNAMIC_CC="$(TARGET_CC) -fPIC" \
>  		TARGET_LD="$(TARGET_CC)" \
>  		TARGET_AR="$(TARGET_AR) rcus" \
> -		TARGET_STRIP="$(TARGET_STRIP)" \
> +		TARGET_STRIP=@: \

 Hm, why is this needed to begin with? package/Makefile.in sets
TARGET_STRIP to strip, sstrip or none according to the config option. So
that should work correctly, right?

 Of course, that does mean that we don't have unstripped binaries in
staging, but it's the same for all other packages that do stripping.

 Regards,
 Arnout
>  		TARGET_CFLAGS="$(TARGET_CFLAGS)" \
>  		TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
>  		HOST_CC="$(LUAJIT_HOST_CC)" \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
