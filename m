From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Thu, 15 May 2014 16:58:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] google-breakpad: added package to
	buildroot
In-Reply-To: <20140515102400.33cd8c2a@free-electrons.com>
References: <1400086277-18900-1-git-send-email-pascal.huerst@gmail.com>
 <20140515102400.33cd8c2a@free-electrons.com>
Message-ID: <6484429E-2B3A-47D3-AAC8-536F16D1F7F2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas, all

thanks a lot for the detailed explanation, this helps me a lot. I'll take care of the issues an then come back here.

regards
Pascal


Am 15.05.2014 um 10:24 schrieb Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:

> Dear Pascal Huerst,
> 
> Thanks a lot Pascal for this patch. google-breakpad definitely looks
> like an interesting package to have. As you've noticed, it's not a
> package as simple as many other packages, as it requires integration
> with some other parts of Buildroot.
> 
> Therefore, I would suggest that you split your patch into two patches:
> 
> * One adding the google-breakpad package itself. Its title could be
>   "google-breakpad: new package", which is the standard commit title
>   we use for package additions.
> 
> * One adding the google-breakpad integration (basically in the current
>   form the main Makefile parts).
> 
> On Wed, 14 May 2014 18:51:17 +0200, Pascal Huerst wrote:
>> Changes v1 -> v2 (All suggested by maxime.hadjinlian at gmail.com)
>> 	Added dependency from BR2_ENABLE_DEBUG
>> 	Removed symbolstore.py -> Its all done in Makefile now
>> 	Removed new Target -> It in target-finalize before stripping now
>> 	Added LICENSE and LICENSE_FILE to *.mk
> 
> The changelog has to go...
> 
>> 
>> Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
>> ---
> 
> here. Otherwise, the changelog will become part of the git commit log,
> and will be preserved forever in the history of Buildroot.
> 
> Also, I would to see many more details in the commit log about the
> integration of google-breakpad: why it is necessary, what it does, etc.
> I'm also worried that there is no documentation at all for this
> feature: it should either be present in the help text of the Config.in
> option of google-breakpad, or be added in the Buildroot manual (but at
> the moment, we don't really have a good place for per-package
> documentation bits).
> 
>> Makefile                                   | 22 ++++++++++++++++++++++
>> package/Config.in                          |  1 +
>> package/google-breakpad/Config.in          | 12 ++++++++++++
>> package/google-breakpad/google-breakpad.mk | 16 ++++++++++++++++
>> 4 files changed, 51 insertions(+)
>> create mode 100644 package/google-breakpad/Config.in
>> create mode 100644 package/google-breakpad/google-breakpad.mk
>> 
>> diff --git a/Makefile b/Makefile
>> index 6d97262..114c0e7 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -530,6 +530,15 @@ define TARGET_PURGE_LOCALES
>> endef
>> endif
>> 
>> +# Dump symbols for google-breakpad of these files
>> +BREAKPAD_FIND_CMD = find $(STAGING_DIR) -type f \( -perm /111 \
>> +-a ! -name "*.py" \
>> +-a ! -name "*.sh" \
>> +-a ! -name "*~" \
>> +-a ! -name "*.la" \
>> +-a ! -type l \
>> +\) -print
> 
> This seems a bit fragile. What about Python scripts that don't end
> in .py, Perl scripts, Ruby scripts and so on?
> 
>> $(TARGETS_ROOTFS): target-finalize
>> 
>> target-finalize: $(TARGETS)
>> @@ -555,6 +564,19 @@ endif
>> ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
>> 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
>> endif
>> +ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
>> +	mkdir -p $(BINARIES_DIR)/google_breakpad_symbols/tmp
> 
> I'm wondering if this really belongs to $(BINARIES_DIR). Aren't these
> symbol files only used on the host, to get a nice backtrace from a
> "minidump" generated on the target after a crash? If so, maybe they
> belong to some other place in $(STAGING_DIR), like normal binaries.
> Like $(STAGING_DIR)/usr/share/google-breakpad-symbols/ or something
> like that.
> 
>> +	for GBP_BIN_PATH in $(shell $(BREAKPAD_FIND_CMD)); do \
>> +		GBP_BIN=$$(basename $$GBP_BIN_PATH); \
>> +		GBP_BIN+=.sym; \
> 
> What about:
> 
> 		GBP_BIN=$$(basename $$GBP_BIN_PAT).sym; \
> 
>> +		$(HOST_DIR)/usr/bin/dump_syms $$GBP_BIN_PATH > $(BINARIES_DIR)/google_breakpad_symbols/tmp/$$GBP_BIN 2>/dev/null; \
>> +		GBP_HASH=$$(head -n1 $(BINARIES_DIR)/google_breakpad_symbols/tmp/$$GBP_BIN | cut -d ' ' -f 4); \
>> +		mkdir -p $(BINARIES_DIR)/google_breakpad_symbols/$$(basename $$GBP_BIN_PATH)/$$GBP_HASH; \
>> +		mv $(BINARIES_DIR)/google_breakpad_symbols/tmp/$$GBP_BIN $(BINARIES_DIR)/google_breakpad_symbols/$$(basename $$GBP_BIN_PATH)/$$GBP_HASH; \
>> +	done
>> +	rm -Rf $(BINARIES_DIR)/google_breakpad_symbols/tmp
>> +endif
> 
> What about moving this into a helper script in
> package/google-breakpad/, like
> package/google-breakpad/google-breakpad-gen-syms.sh, and call it?
> 
> That's not something to tackle in your patch series, but I'm starting
> to wonder if we shouldn't allow packages to "register" a hook to be
> called at the target-finalize stage. We have more and more things here
> for Python stuff, Lua stuff, now google-breakpad. Maybe it would make
> sense to have in google-breakpad.mk something like:
> 
> define GOOGLE_BREAKPAD_TARGET_FINALIZE_HOOK
> 	do the syms extraction stuff
> endef
> 
> TARGET_FINALIZE_HOOKS += GOOGLE_BREAKPAD_TARGET_FINALIZE_HOOK
> 
>> +
>> 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
>> 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
>> 	if test -d $(TARGET_DIR)/lib/modules; then \
>> diff --git a/package/Config.in b/package/Config.in
>> index 3bc8d24..2e9babe 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -82,6 +82,7 @@ source "package/tinymembench/Config.in"
>> source "package/trace-cmd/Config.in"
>> source "package/valgrind/Config.in"
>> source "package/whetstone/Config.in"
>> +source "package/google-breakpad/Config.in"
> 
> Things should be sorted alphabetically.
> 
>> endmenu
>> 
>> menu "Development tools"
>> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
>> new file mode 100644
>> index 0000000..d998345
>> --- /dev/null
>> +++ b/package/google-breakpad/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_GOOGLE_BREAKPAD
>> +	bool "google-breakpad"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_TOOLCHAIN_USES_GLIBC
>> +	help
>> +	  An open-source multi-platform crash reporting system
>> +
>> +	  http://code.google.com/p/google-breakpad/
>> +
>> +comment "google-breakpad requires an (e)glibc toolchain with C++ and Debug enabled"
>> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_USES_GLIBC && BR2_ENABLE_DEBUG)
> 
> The BR2_ENABLE_DEBUG dependency is actually not used for the package
> itself. Also, the format of the comment is not exactly correct
> according to the rules described in the Buildroot manual. "with" should
> be abbreviated by "w/". However, we don't have a rule for
> BR2_ENABLE_DEBUG. Maybe Thomas DS can comment on that.
> 
> Also, a quick look at the source code shows that google-breakpad has
> some architecture specific logic:
> 
> #if defined(__i386)
>  my_memcpy(&stack_pointer, &info->regs.esp, sizeof(info->regs.esp));
> #elif defined(__x86_64)
>  my_memcpy(&stack_pointer, &info->regs.rsp, sizeof(info->regs.rsp));
> #elif defined(__ARM_EABI__)
>  my_memcpy(&stack_pointer, &info->regs.ARM_sp, sizeof(info->regs.ARM_sp));
> #elif defined(__aarch64__)
>  my_memcpy(&stack_pointer, &info->regs.sp, sizeof(info->regs.sp));
> #elif defined(__mips__)
>  stack_pointer =
>      reinterpret_cast<uint8_t*>(info->regs.regs[MD_CONTEXT_MIPS_REG_SP]);
> #else
> #error "This code hasn't been ported to your platform yet."
> #endif
> 
> So I believe the package should have:
> 
> 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> 
> Or maybe you're not building this part of the code?
> 
>> diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
>> new file mode 100644
>> index 0000000..207c81a
>> --- /dev/null
>> +++ b/package/google-breakpad/google-breakpad.mk
>> @@ -0,0 +1,16 @@
>> +#############################################################
>> +#
>> +# google-breakpad
>> +#
>> +#############################################################
> 
> There should be 80 # signs here. Yeah, I know, silly rules. But rules
> are meant to be silly. There should also be one empty new line between
> the comment header and the first variable definition.
> 
>> +GOOGLE_BREAKPAD_VERSION = head
>> +GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
>> +GOOGLE_BREAKPAD_SITE_METHOD = svn
> 
> We really don't want to use a random "head" version, because that makes
> build unreproducible. Please either pick a revision you tested, or
> better, 
> 
>> +GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
>> +GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
>> +GOOGLE_BREAKPAD_INSTALL_STAGING = YES
>> +GOOGLE_BREAKPAD_LICENSE = BSD-3c
>> +GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
>> +
>> +$(eval $(host-autotools-package))
>> +$(eval $(autotools-package))
> 
> Thanks a lot again for this work, very useful!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140515/cc38faec/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 163 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140515/cc38faec/attachment.asc>
