From: Stephen Rodgers <hwstar@rodgers.sdcoxmail.com>
Date: Fri, 11 Sep 2009 02:11:10 -0700
Subject: [Buildroot] coreutils build failing
In-Reply-To: <87ocpjw95j.fsf@macbook.be.48ers.dk>
References: <4AA3EBC6.3080306@rodgers.sdcoxmail.com>	<877hwbmi5k.fsf@macbook.be.48ers.dk>	<4AA5300B.3060804@rodgers.sdcoxmail.com>	<87r5ui63d1.fsf@macbook.be.48ers.dk>	<4AA5529F.7050906@rodgers.sdcoxmail.com>	<8763bu5twt.fsf@macbook.be.48ers.dk>	<4AA58BB1.50906@rodgers.sdcoxmail.com>	<87r5ugyywf.fsf@macbook.be.48ers.dk>	<4AA87826.5020506@rodgers.sdcoxmail.com>
	<87ocpjw95j.fsf@macbook.be.48ers.dk>
Message-ID: <4AAA142E.2060107@rodgers.sdcoxmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Stephen" == Stephen Rodgers <hwstar@rodgers.sdcoxmail.com> writes:
> 
> Hi,
> 
>  Stephen> As you requested, I tarred up the config.log from the failed
>  Stephen> coreutils-7.4 build. You should be able to wget
>  Stephen> config.log.tar.gz using the following url:
> 
>  Stephen> http://test.qrvc.com/config.log.tar.gz
> 
> Thanks. The bug is in the coreutils configure script:
> 
> grep -i -A1 -B1 '^[^|].*dest.*exists' config.log
> 
> configure:28670: result: yes
> configure:28672: checking whether rename is broken when the destination exists
> configure:28684: result: no
> --
> gl_cv_func_re_compile_pattern_working=no
> gl_cv_func_rename_dest_exists_bug=no
> gl_cv_func_rename_trailing_dest_slash_bug=yes
> --
> #define RENAME_TRAILING_SLASH_BUG 1
> #define RENAME_DEST_EXISTS_BUG 1
> #define rename rpl_rename_dest_slash
> 
> It correctly detects that you don't need the windows-only rename
> workaround, but still it ends up defining RENAME_DEST_EXISTS_BUG.
> 
> The logic (m4/rename.m4) goes:
> 
>   if test $gl_cv_func_rename_trailing_slash_bug = yes ||
>      test $gl_cv_func_rename_dest_exists_bug = yes; then
>     AC_LIBOBJ([rename])
>     AC_DEFINE([rename], [rpl_rename],
>       [Define to rpl_rename if the replacement function should be used.])
>     if test $gl_cv_func_rename_trailing_slash_bug; then
>       AC_DEFINE([RENAME_TRAILING_SLASH_BUG], [1],
>         [Define if rename does not work for source file names with a trailing
>          slash, like the one from SunOS 4.1.1_U1.])
>     fi
>     if test $gl_cv_func_rename_dest_exists_bug; then
>       AC_DEFINE([RENAME_DEST_EXISTS_BUG], [1],
>         [Define if rename does not work when the destination file exists,
>          as on Windows.])
>     fi
>     gl_PREREQ_RENAME
>   fi
> 
> Notice that the 2nd test doesn't do 'test $var = yes', so if any of the
> 2 variables are true both defines will get set. Just above we see:
> 
>  dnl When crosscompiling, assume rename is broken.
>  gl_cv_func_rename_trailing_slash_bug=yes)
> 
> So the quick fix is to tell configure that we don't need the trailing
> slash bugfix (which also just adds to the size and isn't needed on
> uclibc).
> 
> I've done that in git (dfca1b2e0e) - Please give it a try.
> 
> I've just checked, and all of this is removed in the recently released
> coreutils 7.5, so we might consider upgrading to that.
> 

With the fix to coreutils.mk, the build is still failing in exactly the
same way. Here's coreutils.mk showing the change:


#############################################################
#
# coreutils
#
#############################################################
COREUTILS_VERSION:=7.4
COREUTILS_SOURCE:=coreutils-$(COREUTILS_VERSION).tar.gz
#COREUTILS_SITE:=ftp://alpha.gnu.org/gnu/coreutils/
COREUTILS_SITE:=$(BR2_GNU_MIRROR)/coreutils
COREUTILS_CAT:=$(ZCAT)
COREUTILS_DIR:=$(BUILD_DIR)/coreutils-$(COREUTILS_VERSION)
COREUTILS_BINARY:=src/vdir
COREUTILS_TARGET_BINARY:=bin/vdir
BIN_PROGS:=cat chgrp chmod chown cp date dd df dir echo false hostname \
	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true uname

$(DL_DIR)/$(COREUTILS_SOURCE):
	 $(call DOWNLOAD,$(COREUTILS_SITE),$(COREUTILS_SOURCE))

coreutils-source: $(DL_DIR)/$(COREUTILS_SOURCE)

$(COREUTILS_DIR)/.unpacked: $(DL_DIR)/$(COREUTILS_SOURCE)
	$(COREUTILS_CAT) $(DL_DIR)/$(COREUTILS_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/
coreutils\*.patch
	$(CONFIG_UPDATE) $(COREUTILS_DIR)/build-aux
	touch $@

$(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
	(cd $(COREUTILS_DIR); rm -rf config.cache; \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
		ac_cv_func_strtod=yes \
		ac_fsusage_space=yes \
		fu_cv_sys_stat_statfs2_bsize=yes \
		ac_cv_func_closedir_void=no \
		ac_cv_func_getloadavg=no \
		ac_cv_lib_util_getloadavg=no \
		ac_cv_lib_getloadavg_getloadavg=no \
		ac_cv_func_getgroups=yes \
		ac_cv_func_getgroups_works=yes \
		ac_cv_func_chown_works=yes \
		ac_cv_have_decl_euidaccess=no \
		ac_cv_func_euidaccess=no \
		ac_cv_have_decl_strnlen=yes \
		ac_cv_func_strnlen_working=yes \
		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
		ac_cv_func_lstat_empty_string_bug=no \
		ac_cv_func_stat_empty_string_bug=no \
		gl_cv_func_rename_trailing_slash_bug=no \
		ac_cv_have_decl_nanosleep=yes \
		jm_cv_func_nanosleep_works=yes \
		gl_cv_func_working_utimes=yes \
		ac_cv_func_utime_null=yes \
		ac_cv_have_decl_strerror_r=yes \
		ac_cv_func_strerror_r_char_p=no \
		jm_cv_func_svid_putenv=yes \
		ac_cv_func_getcwd_null=yes \
		ac_cv_func_getdelim=yes \
		ac_cv_func_mkstemp=yes \
		utils_cv_func_mkstemp_limitations=no \
		utils_cv_func_mkdir_trailing_slash_bug=no \
		gl_cv_func_rename_dest_exists_bug=no \
		ac_cv_func_memcmp_working=yes \
		ac_cv_have_decl_malloc=yes \
		gl_cv_func_malloc_0_nonnull=yes \
		ac_cv_func_malloc_0_nonnull=yes \
		ac_cv_func_calloc_0_nonnull=yes \
		ac_cv_func_realloc_0_nonnull=yes \
		jm_cv_func_gettimeofday_clobber=no \
		am_cv_func_working_getline=yes \
		gl_cv_func_working_readdir=yes \
		jm_ac_cv_func_link_follows_symlink=no \
		utils_cv_localtime_cache=no \
		ac_cv_struct_st_mtim_nsec=no \
		gl_cv_func_tzset_clobber=no \
		gl_cv_func_getcwd_null=yes \
		gl_cv_func_getcwd_path_max=yes \
		ac_cv_func_fnmatch_gnu=yes \
		am_getline_needs_run_time_check=no \
		am_cv_func_working_getline=yes \
		gl_cv_func_mkdir_trailing_slash_bug=no \
		gl_cv_func_mkstemp_limitations=no \
		ac_cv_func_working_mktime=yes \
		jm_cv_func_working_re_compile_pattern=yes \
		ac_use_included_regex=no \
		gl_cv_c_restrict=no \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--exec-prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/sbin \
		--libdir=/lib \
		--libexecdir=/usr/lib \
		--sysconfdir=/etc \
		--datadir=/usr/share \
		--localstatedir=/var \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		$(DISABLE_NLS) \
		$(DISABLE_LARGEFILE) \
		--disable-rpath \
		--disable-dependency-tracking \
	)
	touch $@

$(COREUTILS_DIR)/$(COREUTILS_BINARY): $(COREUTILS_DIR)/.configured
	$(MAKE) -C $(COREUTILS_DIR)
	rm -f $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY)

$(TARGET_DIR)/$(COREUTILS_TARGET_BINARY):
$(COREUTILS_DIR)/$(COREUTILS_BINARY)
	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(COREUTILS_DIR) install
	# some things go in root rather than usr
	for f in $(BIN_PROGS); do \
		mv $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
	done
	# link for archaic shells
	ln -fs test $(TARGET_DIR)/usr/bin/[
	# gnu thinks chroot is in bin, debian thinks it's in sbin
	mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/chroot > /dev/null 2>&1
ifneq ($(BR2_HAVE_INFOPAGES),y)
	rm -rf $(TARGET_DIR)/usr/share/info
endif
ifneq ($(BR2_HAVE_MANPAGES),y)
	rm -rf $(TARGET_DIR)/usr/share/man
endif
	rm -rf $(TARGET_DIR)/share/locale
	rm -rf $(TARGET_DIR)/usr/share/doc

# If both coreutils and busybox are selected, make certain coreutils
# wins the fight over who gets to have their utils actually installed.
ifeq ($(BR2_PACKAGE_BUSYBOX),y)
coreutils: uclibc busybox $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY)
else
coreutils: uclibc $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY)
endif

# If both coreutils and busybox are selected, the corresponding applets
# may need to be reinstated by the clean targets.
coreutils-clean:
	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(COREUTILS_DIR) uninstall
	-$(MAKE) -C $(COREUTILS_DIR) clean

coreutils-dirclean:
	rm -rf $(COREUTILS_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(BR2_PACKAGE_COREUTILS),y)
TARGETS+=coreutils
endif


If I search config.log in build_i696/coreutils, I see
gl_cv_func_rename_trailing_slash_bug=yes on line 75574. Snippet below:

gl_cv_func_re_compile_pattern_working=no
gl_cv_func_rename_dest_exists_bug=no
gl_cv_func_rename_trailing_dest_slash_bug=yes
gl_cv_func_rename_trailing_slash_bug=yes
gl_cv_func_rmdir_errno_not_empty=ENOTEMPTY
gl_cv_func_select_supports0='guessing yes'

For some unknown reason, gl_cv_func_rename_trailing_slash_bug is getting
set to "yes" when configure is run even though it is being passed in as
"no" in an environemnt variable from coreutils.mk.


Steve
