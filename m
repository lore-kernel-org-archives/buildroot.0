From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 07 Jul 2010 22:21:59 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.package.in: allow
 packages to override download step
In-Reply-To: <20100701180447.3477a6fa@surf>
References: <20100701153712.9DCD6821E8@busybox.osuosl.org>
	<20100701180447.3477a6fa@surf>
Message-ID: <4C34E1E7.6040605@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni ha scritto:
> Hello,
>
> On Thu, 1 Jul 2010 17:33:29 +0200
> Peter Korsgaard <jacmet@sunsite.dk> wrote:
>
>   
>> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
>> index 16ce16a..c476de9 100644
>> --- a/package/Makefile.package.in
>> +++ b/package/Makefile.package.in
>> @@ -292,7 +292,7 @@ $(2)_TARGET_BUILD =
>> $$($(2)_DIR)/.stamp_built $(2)_TARGET_CONFIGURE =
>> $$($(2)_DIR)/.stamp_configured $(2)_TARGET_PATCH =
>> $$($(2)_DIR)/.stamp_patched $(2)_TARGET_EXTRACT =
>> $$($(2)_DIR)/.stamp_extracted -$(2)_TARGET_SOURCE =
>> $$($(2)_DIR)/.stamp_downloaded +$(2)_TARGET_SOURCE ?=
>> $$($(2)_DIR)/.stamp_downloaded $(2)_TARGET_UNINSTALL =
>> $$($(2)_DIR)/.stamp_uninstalled $(2)_TARGET_CLEAN =
>> $$($(2)_DIR)/.stamp_cleaned $(2)_TARGET_DIRCLEAN =
>> $$($(2)_DIR)/.stamp_dircleaned
>>     
>
> As said on IRC, I'm sorry but I don't think I really like this.
>
> We already have a mechanism to override steps in Makefile.autotools.in.
> I'd prefer to see if we can rely on a similar mechanism rather than
> doing this.
>   
It's a good feature to have, but I agree with Thomas about the way to 
implement it. As I proposed in the discussion about "Getting package 
sources from git/svn/bzr", I'd rather make the DOWNLOAD command 
overridable in package/Makefile.package.in, like this:

@@ -118,19 +118,19 @@
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
 ifeq ($(SPIDER),)
 # Only show the download message if it isn't already downloaded
 	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
 endif
-	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
+	$($(PKG)_DOWNLOAD_CMDS)
 	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))


where of course $(PKG)_DOWNLOAD_CMDS would default to $(call DOWNLOAD,...).

Would such a patch be applied, if I wrote one?


Luca
