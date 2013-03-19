From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 19 Mar 2013 15:20:37 +0000
Subject: [Buildroot] [git commit] libcap: Add optional support for
	libattr capabilities
In-Reply-To: <CAG2jQ8it65FVV8zQJ+mSUqMpSQ1LCQ=K8ojA71n83T=XigYnfg@mail.gmail.com>
References: <20130319121032.26CD49AE30@busybox.osuosl.org>
 <CAG2jQ8it65FVV8zQJ+mSUqMpSQ1LCQ=K8ojA71n83T=XigYnfg@mail.gmail.com>
Message-ID: <CAG2jQ8g+MQ0VStKLUgC_Zw7cNyVt14zvS45AX2crt1sEm1Jgig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 March 2013 15:01, Markos Chandras <markos.chandras@gmail.com> wrote:
> On 19 March 2013 12:10, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>> commit: http://git.buildroot.net/buildroot/commit/?id=1bf3d6f8cf3a2dca9ce1c6f3e68b077724f21db6
>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> libcap can optionally link to libattr to support extra
>> file capabilities. Link to this library and pull it as
>> dependency if BR2_PACKAGE_ATTR is selected.
>>
>> [Peter: use LIBCAP_ prefix on variable]
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
>> ---
>>  package/libcap/libcap.mk |   18 +++++++++++++-----
>>  1 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
>> index dcd3a18..6adac73 100644
>> --- a/package/libcap/libcap.mk
>> +++ b/package/libcap/libcap.mk
>> @@ -15,19 +15,27 @@ LIBCAP_LICENSE_FILES = License
>>  LIBCAP_DEPENDENCIES = host-libcap
>>  LIBCAP_INSTALL_STAGING = YES
>>
>> +ifeq ($(BR2_PACKAGE_ATTR),y)
>> +       LIBCAP_DEPENDENCIES += attr
>> +       LIBCAP_HAVE_LIBATTR = yes
>> +else
>> +       LIBCAP_HAVE_LIBATTR = no
>> +endif
>> +
>>  define LIBCAP_BUILD_CMDS
>>         $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>> -               LIBATTR=no BUILD_CC="$(HOSTCC)" BUILD_CFLAGS="$(HOST_CFLAGS)"
>> +               LIBATTR=$(LIBCAP_HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" \
>> +               BUILD_CFLAGS="$(HOST_CFLAGS)"
>>  endef
>>
>>  define LIBCAP_INSTALL_STAGING_CMDS
>> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) \
>> -               prefix=/usr lib=lib install
>> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
>> +               DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
>>  endef
>>
>>  define LIBCAP_INSTALL_TARGET_CMDS
>> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) \
>> -               prefix=/usr lib=lib install
>> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
>> +               DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
>>  endef
>>
>>  # progs use fork()
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Peter,
>
> After this commit I am seeing this problem
>
> Applying libcap-2.22-build-system.patch using patch:
> patching file libcap/Makefile
> patching file Make.Rules
> make: *** No rule to make target `host-attr', needed by `host-libcap-depends'.
>
> I am not sure what tirggers it. Any ideas? host-attr shouldn't be
> needed as I removed that from  LIBCAP_DEPENDENCIES
>
> --
> Regards,
> Markos Chandras

I suspect this is because HOST_LIBCAP_DEPENDENCIES defaults to
LIBCAP_DEPENDENCIES and it tries to match 'attr' with a host package.
Adding "HOST_LIBCAP_DEPENDENCIES = " (just to make sure not deps are
pulled for host package) seems to fixes the problem. Is this an
acceptable solution?

-- 
Regards,
Markos Chandras
