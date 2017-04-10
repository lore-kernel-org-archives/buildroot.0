From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 16:49:30 +0200
Subject: [Buildroot] [PATCH 3/3 v2] core/pkg-generic: store
 file->package list for staging and host too
In-Reply-To: <44910f2975b83c91148d08f3df11ea048eea0609.1491427248.git.yann.morin.1998@free.fr>
References: <cover.1491427248.git.yann.morin.1998@free.fr>
 <44910f2975b83c91148d08f3df11ea048eea0609.1491427248.git.yann.morin.1998@free.fr>
Message-ID: <a2da821a-6dce-bcad-130b-43c8ac6ff5d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 +1 to this feature.

On 05-04-17 23:20, Yann E. MORIN wrote:
> Currently, we store the list of files installed in target/ and associate
> each of them to the package that installed it.
> 
> However, we sometime may need to know what package installed which file
                      ^s

> in staging/, for example to debug header collision, or in host/, to
> debug what package installed what host tool.
> 
> Enhance the step instrumentation to also generate the list for staging/
> and host/.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 166efd6..725a543 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -62,7 +62,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # files currently installed in the target. Note that the MD5 is also
>  # stored, in order to identify if the files are overwritten.
>  define step_pkg_size_start
> -	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
> +	(cd $(2) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
>  		$($(PKG)_DIR)/.br_filelist_before
>  endef
>  
> @@ -72,19 +72,25 @@ endef
>  # a diff with the .br_filelist_before to compute the list of files
>  # installed by this package.
>  define step_pkg_size_end
> -	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
> +	(cd $(2); find . -type f -print0 | xargs -0 md5sum) | sort > \
>  		$($(PKG)_DIR)/.br_filelist_after
>  	comm -13 $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after | \
>  		while read hash file ; do \
>  			echo "$(1),$${file}" ; \
> -		done >> $(BUILD_DIR)/packages-file-list.txt
> +		done >> $(BUILD_DIR)/packages-file-list$(3).txt
>  	rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
>  endef
>  
>  define step_pkg_size
>  	$(if $(filter install-target,$(2)),\
> -		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
> -		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(TARGET_DIR))) \
> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(TARGET_DIR))))
> +	$(if $(filter install-staging,$(2)),\
> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(STAGING_DIR),-staging)) \
> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(STAGING_DIR),-staging)))
> +	$(if $(filter install-host,$(2)),\
> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3),$(HOST_DIR),-host)) \
> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3),$(HOST_DIR),-host)))


 How about the following alternative:

---
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 166efd630f..c27a76194c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -62,8 +62,9 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # files currently installed in the target. Note that the MD5 is also
 # stored, in order to identify if the files are overwritten.
 define step_pkg_size_start
-       (cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
-               $($(PKG)_DIR)/.br_filelist_before
+       (cd $($(call UPPERCASE,$(2))_DIR); \
+               find . -type f -print0 | xargs -0 md5sum) | sort > \
+                       $($(PKG)_DIR)/.br_filelist_before
 endef

 # This hook will be called after the target installation of a
@@ -72,19 +73,19 @@ endef
 # a diff with the .br_filelist_before to compute the list of files
 # installed by this package.
 define step_pkg_size_end
-       (cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
-               $($(PKG)_DIR)/.br_filelist_after
+       (cd $($(call UPPERCASE,$(2))_DIR); \
+               find . -type f -print0 | xargs -0 md5sum) | sort > \
+                       $($(PKG)_DIR)/.br_filelist_after
        comm -13 $($(PKG)_DIR)/.br_filelist_before
$($(PKG)_DIR)/.br_filelist_after | \
                while read hash file ; do \
                        echo "$(1),$${file}" ; \
-               done >> $(BUILD_DIR)/packages-file-list.txt
+               done >> $(BUILD_DIR)/packages-file-list-$(2).txt
        rm -f $($(PKG)_DIR)/.br_filelist_before $($(PKG)_DIR)/.br_filelist_after
 endef

 define step_pkg_size
-       $(if $(filter install-target,$(2)),\
-               $(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
-               $(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
+       $(if $(filter install-%,$(2)),\
+               $(call step_pkg_size_$(1),$(3),$(subst install-,,$(2))))
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
---

 Combine that with the refactoring by ThomasDS and you get something nice and
compact that is still very readable IMO. Oh, and if before/after is renamed to
start/end it becomes even better.

 Perhaps the refactoring of passing target as an argument should be a separate
patch, but I don't think so (it's kind of useless on its own and hard to
understand without the host and staging options).


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
