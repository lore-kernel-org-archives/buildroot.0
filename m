From: Thomas Davis <sunsetbrew@sunsetbrew.com>
Date: Tue, 27 Aug 2013 14:54:28 -0400
Subject: [Buildroot] [1/1] civetweb: new package
In-Reply-To: <20130827203958.2de34c38@skate>
References: <CAG3-AMrakjHihP-_Zr7E4zX=BSs7Ym+Fc8HSVDbQbt11t4K0sQ@mail.gmail.com>
 <20130827203958.2de34c38@skate>
Message-ID: <CAG3-AMpi1X5xKO08bE+pfp5Or5qeYWbLiKt33aWBTpqVC4ToTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I will make the suggested changes and retest and re-submit.  To answer
outstanding questions.

1. BR2_LARGEFILE is required by SQLITE3 which is a dependency in the
LUA support.

2. DOCUMENT_ROOT is the path from with-in the chroot to the documents
folder.  This is a value written into a configuration file, not an
actual directory something gets placed in.  Normally it would have
been automatically determined by PREFIX, but in the fake root
situation it has to overridden so it works correctly inside the
chroot.  It is not an install path itself.

Thank you very much for the help!

Thomas


On Tue, Aug 27, 2013 at 2:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas Davis,
>
> Thanks, this patch looks much better. Some comments below.
>
> On Tue, 27 Aug 2013 13:57:01 -0400, Thomas Davis wrote:
>> Submission attempt #2 with recommended changes.
>>
>> 1. Change make file ifdef's to ifeq.
>> 2. Copyright lines removed to prevent confusion.
>> 3. Put end of line in make file.
>> 4. Submitted with git mail if it works, otherwise in plain text
>> 5. Rebased, rebuilt and retested with buildroot.
>>
>> The explaination of BR2_TOOLCHAIN_BUILDROOT_UCLIBC check in
>> Config.in was answered in a previous post.  If that will
>> always be included, I can remove the check.
>>
>> BTW:  git --send-mail is not working for me.  But I made sure this
>> mail is in plain-text mode.
>
> See
> http://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog
> for details on how the commit log should be formatted. Essentially,
> what you're missing is that the details of what changed between the
> previous version should go below the "---" sign (or be part of a
> separate cover letter). Everything that is before the "---" will be
> part of the commit log for the eternity, and we don't want that. See
> the documentation for details.
>
> Also, you should use --subject-prefix="PATCHv2" when generating your
> patches, so that the title of your patch makes it clear which version
> we're looking at.
>
>> diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
>> new file mode 100644
>> index 0000000..5285b09
>> --- /dev/null
>> +++ b/package/civetweb/Config.in
>> @@ -0,0 +1,34 @@
>> +config BR2_PACKAGE_CIVETWEB
>> +       bool "civetweb"
>> +       depends on BR2_TOOLCHAIN_BUILDROOT_UCLIBC && !BR2_PTHREADS_NONE
>
> As Thomas said, this is not correct, as we don't want to prevent this
> package from being built with an external toolchain, or a glibc
> toolchain.
>
> If what you want to express is that your package needs thread support,
> then you should add a:
>
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>
> and that's it.
>
>> +       help
>> +         Full featured embedded web server with LUA support.
>> +
>> +         https://sourceforge.net/projects/civetweb
>> +
>> +if BR2_PACKAGE_CIVETWEB
>> +
>> +       config BR2_CIVETWEB_WITH_IPV6
>> +               bool "enable IPV6 support"
>> +               depends on BR2_INET_IPV6
>
> We generally do not indent sub-configuration options.
>
> I think this IPv6 option is not needed, the package should
> automatically enable IPv6 support when BR2_INET_IPV6 is y.
>
>> +       config BR2_CIVETWEB_WITH_LUA
>> +               bool "enable LUA support"
>> +               depends on BR2_LARGEFILE # util-linux
>
> Why are you adding this largefile dependency here? From where does the
> reference to util-linux comes?
>
> If this option needs the "lua" package to be built, then you need to
> "select BR2_PACKAGE_LUA" in the Config.in file, and add "lua" to
> CIVETWEB_DEPENDENCIES in your .mk file.
>
>> +       config BR2_CIVETWEB_WITH_SSL
>> +               bool "enable SSL support"
>> +               depends on BR2_PACKAGE_OPENSSL
>
> We generally enable SSL support automatically when BR2_PACKAGE_OPENSSL
> is enabled, so this option would not be necessary.
>
>> +
>> +       comment "civetweb IPV6 support requires IPV6"
>> +               depends on !BR2_INET_IPV6
>
> Not needed, as per the above.
>
>> +       comment "civetweb LUA support requires large file support"
>> +               depends on !BR2_LARGEFILE
>
> Please answer the question above to decide what to do about this.
>
>> +       comment "civetweb SSL support requires OpenSSL"
>> +               depends on !BR2_PACKAGE_OPENSSL
>
> Not needed, as per the above.
>
>> +comment "civetweb requires a toolchain with PTHREAD support"
>> +       depends on !BR2_TOOLCHAIN_BUILDROOT_UCLIBC || BR2_PTHREADS_NONE
>
> This should be:
>
> comment "civetweb requires a toolchain with threads support"
>         depends on !BR2_TOOLCHAIN_HAS_THREADS
>
>> diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
>> new file mode 100644
>> index 0000000..db14b2b
>> --- /dev/null
>> +++ b/package/civetweb/civetweb.mk
>> @@ -0,0 +1,45 @@
>> +################################################################################
>> +#
>> +# civetweb
>> +#
>> +################################################################################
>> +
>> +CIVETWEB_VERSION = 1.2
>> +CIVETWEB_SOURCE = civetweb-$(CIVETWEB_VERSION).tar.gz
>
> This line is not needed since this is the default.
>
>> +CIVETWEB_SITE =
>> http://github.com/sunsetbrew/civetweb/tarball/v$(CIVETWEB_VERSION)
>
> You're not using git send-email: your patch has been line-wrapped by
> your e-mail client, so it still cannot be applied as is.
>
>> +CIVETWEB_LICENSE = MIT
>> +CIVETWEB_LICENSE_FILES = LICENSE.md
>> +
>> +CIVETWEB_COPT = $(TARGET_CFLAGS)
>> +CIVETWEB_MOPT = TARGET_OS=LINUX
>
> We generally use something like CIVETWEB_CONF_OPT for the configuration
> options.
>
>> +CIVETWEB_LDFLAGS = $(TARGET_LDFLAGS)
>> +
>> +ifeq (BR2_PACKAGE_UTIL_LINUX_FALLOCATE,y)
>
> Did you really test your package? This test is testing if the string
> "BR2_PACKAGE_UTIL_LINUX_FALLOCATE" is equal to the string "y", so it
> will always be false. Your tests should look like:
>
> ifeq ($(BR2_....),y)
>
> endif
>
> see the thousands of examples available throughout the Buildroot source
> code.
>
>> +       CIVETWEB_COPT += -DHAVE_POSIX_FALLOCATE=0
>> +endif
>
> However, this test is generally wrong. You're confusing the
> availability of the 'fallocate' command line tool from the util-linux
> package with the availability of the fallocate() system call.
>
> I think you can pass -DHAVE_POSIX_FALLOCATE=1 in all cases: it's always
> available in glibc/eglibc toolchain, and our default configuration for
> uClibc enables fallocate() as well.
>
>> +
>> +ifeq (BR2_CIVETWEB_WITH_IPV6,y)
>> +       CIVETWEB_MOPT += WITH_IPV6=1
>> +endif
>
> This should be:
>
> ifeq ($(BR2_INET_IPV6),y)
> CIVETWEB_CONF_OPT += WITH_IPV6=1
> endif
>
>> +
>> +ifeq (BR2_CIVETWEB_WITH_LUA,y)
>> +       CIVETWEB_MOPT += WITH_LUA=1
>> +endif
>
> Ditto. And it doesn't need the 'lua' package as a dependency?
>
>> +ifeq (BR2_CIVETWEB_WITH_SSL,y)
>> +       CIVETWEB_COPT += -DNO_SSL_DL -lcrypt -lssl
>> +       CIVETWEB_DEPENDENCIES += openssl
>> +else
>> +       CIVETWEB_COPT += -DNO_SSL
>> +endif
>
> Make this use BR2_PACKAGE_OPENSSL instead, as explained above.
>
>> +
>> +define CIVETWEB_BUILD_CMDS
>> +       $(MAKE) CC="$(TARGET_CC)" -C $(@D) all $(CIVETWEB_MOPT)
>> COPT="$(CIVETWEB_COPT)"
>> +endef
>
> This is badly line-wrapped.
>
>> +
>> +define CIVETWEB_INSTALL_TARGET_CMDS
>> +       $(MAKE) CC="$(TARGET_CC)" -C $(@D) install
>> DOCUMENT_ROOT=/usr/local/share/doc/civetweb
>> PREFIX="$(TARGET_DIR)/usr/local" $(CIVETWEB_MOPT)
>> COPT='$(CIVETWEB_COPT)'
>> +endef
>
> This is also badly line-wrapped. You should use $(TARGET_DIR)/usr as
> the prefix, ditto for the documentation (and shouldn't DOCUMENT_ROOT
> refer to $(TARGET_DIR) as well ?). Also, this line should be split:
>
> define CIVETWEB_INSTALL_TARGET_CMDS
>         $(MAKE) CC="$(TARGET_CC)" -C $(@D) install \
>                 DOCUMENT_ROOT=$(TARGET_DIR)/usr/share/doc/civetweb \
>                 PREFIX=$(TARGET_DIR)/usr \
>                 $(CIVETWEB_CONF_OPT) \
>                 COPT="$(CIVETWEB_COPT)"
> endef
>
>> +
>> +$(eval $(generic-package))
>> +
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
