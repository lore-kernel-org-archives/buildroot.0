From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Apr 2017 15:16:30 +0200
Subject: [Buildroot] [PATCH v2] e2fsprogs: keep util-linux's fsck if
 chosen
In-Reply-To: <CAGduivzA9WoMy4xGiad0VXXQ3W0ekXF9U37wwfwXsXapt3J7LQ@mail.gmail.com>
References: <1491100601-7867-1-git-send-email-casantos@datacom.ind.br>
 <CAGduivzA9WoMy4xGiad0VXXQ3W0ekXF9U37wwfwXsXapt3J7LQ@mail.gmail.com>
Message-ID: <2897764f-2b45-f6c9-6a14-859a047049eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-04-17 12:13, Maxime Hadjinlian wrote:
> Hi all,
> 
> On Sun, Apr 2, 2017 at 4:36 AM, Carlos Santos <casantos@datacom.ind.br> wrote:
>> Since e2fsprogs depends on util-linux, it's built after it. So you can't
>> have e2fsck from e2fsprogs along with the fsck wrapper from util-linux
>> (which is better maintained and compatible with systemd) because we end
>> up deleting the fsck from util-linux.
>>
>> Fix this issue by disabling e2fsprogs' fsck if the one from util-linux
                                          ^^^^
 To be clear: we're only talking about the fsck wrapper here, not about e2fsck
itself. So I would put that explicitly in the commit message, i.e. "fsck
wrapper" instead of just "fsck".

>> is selected.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>> Changes v1->v2
>>   - Add depenndece on !BR2_PACKAGE_UTIL_LINUX_FSCK to
>>     BR2_PACKAGE_E2FSPROGS_FSCK
>>   - Add comment telling that the fsck from util-linux has preference.
>>   - Pass "--enable-fsck" conditionally to configure
>>   - Remove the guard around the removal of /usr/sbin/fsck, since the
>>     fsck from busybox and util-linux are installed at /sbin
>>   - Improve comments and commit message
>>
>> In the long run the e2fsprogs recipe deserves an extreme overhauling
>> like we did for util-linux but right now these changes are enough to
>> fix the specific problem of fsck.
>> ---
> It's almost working, but there's a trick for systemd (*tadaaa*)
> To have fsck work at boot time, you *MUST* have the fsck (the wrapper)
> from util-linux, because systemd passes arguments that do not exists
> in the e2fsprogs wrapper. But you should use the e2fsck program and
> its link.

 Which is exactly what this patch does, no? It will use the fsck wrapper from
util-linux, not the one from e2fsprogs.

 What this patch does NOT do is to make sure that BR2_PACKAGE_UTIL_LINUX_FSCK is
selected, but as Carlos wrote, that should be a separate patch.

> So for this to truly work, if systemd is selected, you should select
> util-linux's fsck, disable e2fsprogs fsck wrapper and enable e2fsck.

 So in systemd/Config.in:

	select BR2_PACKAGE_UTIL_LINUX
	select BR2_PACKAGE_UTIL_LINUX_FSCK
	select BR2_PACKAGE_E2FSPROGS_E2FSCK

although the latter is only relevant if there actually is an ext2 filesystem, I
guess.

> 
> Note that in case of failure, systemd will try to run emergency.target
> and all kinds of things may happen if you haven't created some
> post-build or other scripts.
> 
>>  package/e2fsprogs/Config.in    |  4 ++++
>>  package/e2fsprogs/e2fsprogs.mk | 12 +++++++++---
>>  2 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
>> index d1914a9..418f877 100644
>> --- a/package/e2fsprogs/Config.in
>> +++ b/package/e2fsprogs/Config.in
>> @@ -59,8 +59,12 @@ config BR2_PACKAGE_E2FSPROGS_FILEFRAG
>>
>>  config BR2_PACKAGE_E2FSPROGS_FSCK
>>         bool "fsck"
>> +       depends on !BR2_PACKAGE_UTIL_LINUX_FSCK
>>         default y
>>
>> +comment "the fsck from util-linux has preference over this one"
>> +       depends on BR2_PACKAGE_UTIL_LINUX_FSCK
>> +
>>  config BR2_PACKAGE_E2FSPROGS_FUSE2FS
>>         bool "fuse2fs"
>>         depends on !BR2_STATIC_LIBS # libfuse
>> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
>> index 3f235c5..b4b96c3 100644
>> --- a/package/e2fsprogs/e2fsprogs.mk
>> +++ b/package/e2fsprogs/e2fsprogs.mk
>> @@ -11,7 +11,7 @@ E2FSPROGS_LICENSE = GPL-2.0, BSD-3-Clause (libuuid), MIT-like with advertising c
>>  E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
>>  E2FSPROGS_INSTALL_STAGING = YES
>>  E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
>> -# we don't have a host-util-linux
>> +# We don't need host-util-linux, since we disable libblkid, libuuid.
>>  HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
>>
>>  # e4defrag doesn't build on older systems like RHEL5.x, and we don't
>> @@ -24,11 +24,11 @@ E2FSPROGS_CONF_OPTS = \
>>         $(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
>>         $(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
>>         $(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
>> +       $(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,) \

 Although the rest of the .mk file doesn't do this yet, the proper way is to
have both the --enable and --disable options, so let's do that here.

 With that fixed I think it's good to go.

>>         $(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
>>         --disable-uuidd \
>>         --disable-libblkid \
>>         --disable-libuuid \
>> -       --enable-fsck \
>>         --disable-e2initrd-helper \
>>         --disable-testio-debug \
>>         --disable-rpath
>> @@ -146,10 +146,16 @@ E2FSPROGS_DEPENDENCIES += busybox
>>  define E2FSPROGS_REMOVE_BUSYBOX_APPLETS
>>         $(RM) -f $(TARGET_DIR)/bin/chattr
>>         $(RM) -f $(TARGET_DIR)/bin/lsattr
>> -       $(RM) -f $(TARGET_DIR)/sbin/fsck
>>         $(RM) -f $(TARGET_DIR)/sbin/tune2fs
>>         $(RM) -f $(TARGET_DIR)/sbin/e2label
>>  endef
>> +
>> +ifeq ($(BR2_PACKAGE_E2FSPROGS_FSCK),y)
>> +# We only build fsck if it's not selected in util-linux, so at this
>> +# point /sbin/fsck must have come from busybox.
>> +E2FSPROGS_REMOVE_BUSYBOX_APPLETS += $(RM) -f $(TARGET_DIR)/sbin/fsck
>> +endif
> This part doesn't work with systemd as you will remove the fsck
> wrapper from util-linux 

 No, read the command and the ifeq above: this will only be done if
BR2_PACKAGE_UTIL_LINUX_FSCK is NOT selected.


 Regards,
 Arnout


> which is the only one that can be used. And
> since e2fsprogs depends on util-linux, you are screwed :/.
>> +
>>  E2FSPROGS_PRE_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
>>  endif
>>
>> --
>> 2.7.4
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
