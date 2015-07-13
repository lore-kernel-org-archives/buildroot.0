From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 13 Jul 2015 11:42:23 +0200
Subject: [Buildroot] [RFC v4 16/16] infra: add per-package staging
	feature
In-Reply-To: <55A19F39.80802@openwide.fr>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <1435520570-20332-17-git-send-email-fabio.porcedda@gmail.com>
 <55A19F39.80802@openwide.fr>
Message-ID: <CAHkwnC-vndMZDhJMj2v=ytZZQ6NCdE1Ho0gWNg9UgAK=ZjKsUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 12, 2015 at 12:56 AM, Romain Naour <romain.naour@openwide.fr> wrote:
> Hi Fabio,
>
> Le 28/06/2015 21:42, Fabio Porcedda a ?crit :
>> To improve the build reproducibility, instead of sharing a common
>> staging are, every package has a private staging directory where only
>> the declared dependency are present.
>>
>> Having a per-package staging directory ensure that every package use
>> only the declared dependency, because even if a undeclared dependency is
>> build before, it will be not included in the private package directory.
>>
>> This feature is useful for both top-level non-parallel make and
>> top-level parallel make.
>>
>> This feature is useful for target dependencies but not for host
>> dependencies, to solve that a similar feature for host packages must be
>> developed.
>>
>> Implementation details:
>> To minimize change the STAGING_DIR variable will be redefined for each
>> package to point to the per-package staging directory.
>>
>> At the beginning of each configuration stage the per-package staging
>> directory will be created copying using hard links all the declared
>> target dependencies.
>> Also each path of every copied configuration files will be changed to
>> point to the per-package
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  Makefile               |  2 +-
>>  package/Makefile.in    |  1 +
>>  package/pkg-cmake.mk   |  2 +-
>>  package/pkg-generic.mk | 34 +++++++++++++++++++++++++++++++++-
>>  4 files changed, 36 insertions(+), 3 deletions(-)
>>
>
> [snip]
>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 376b025..edac936 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -221,7 +221,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
>>
>>  # Remove package sources
>>  $(BUILD_DIR)/%/.stamp_dircleaned:
>> -     rm -Rf $(@D)
>> +     rm -Rf $(@D) $(STAGING_DIR)
>>
>>  ################################################################################
>>  # virt-provides-single -- check that provider-pkg is the declared provider for
>> @@ -414,6 +414,33 @@ $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
>>  $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
>>  $(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
>>
>> +ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
>> +  $(2)_STAGING_DIRS = $$(wildcard $$(foreach dep,\
>> +     $$(filter-out host-% toolchain,$$($(2)_FINAL_DEPENDENCIES)),\
>> +     $$($$(call UPPERCASE,$$(dep))_STAGING_DIR)/))
>> +
>> +  $(2)_STAGING_DIR = $$(STAGINGPKG_DIR)/$(1)
>> +
>> +  define $(2)_PREPARE_STAGING_DIR
>> +     mkdir -p $$($(2)_STAGING_DIR)/usr/mkspecs/qws
>> +     cp -rl $(STAGING_DIR)/* $$($(2)_STAGING_DIR)
>
> I tried your series with codesourcery ARM 2014.05 with thumb2 "ARM instruction
> set" enabled:
>
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405
> BR2_ARM_INSTRUCTIONS_THUMB2
>
> And the build fail immediately when copying the first stagingpkg directory due
> to a symlink in staging.
>
>>>> dash 0.5.8 Updating config.sub and config.guess
> for file in config.guess config.sub; do for i in $(find /home/naourr/git/buildroot/output/build/dash-0.5.8 -name $file); do cp support/gnuconfig/$file $i; done; done
>>>> dash 0.5.8 Patching libtool
>>>> dash 0.5.8 Configuring
> mkdir -p /home/naourr/git/buildroot/output/stagingpkg/dash/usr/mkspecs/qws
> cp -rl /home/naourr/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/* /home/naourr/git/buildroot/output/stagingpkg/dash
> cp: cannot copy cyclic symbolic link ? /home/naourr/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/thumb2/thumb2 ?
> package/pkg-generic.mk:146: recipe for target '/home/naourr/git/buildroot/output/build/dash-0.5.8/.stamp_configured' failed
> make: *** [/home/naourr/git/buildroot/output/build/dash-0.5.8/.stamp_configured] Error 1
>
> Here is the content of the staging directory:
> ls -l output/staging/
> total 20
> drwxr-xr-x 2 naourr naourr 4096 12 juil. 00:35 bin
> drwxr-xr-x 2 naourr naourr 4096 30 mai    2014 etc
> drwxr-xr-x 2 naourr naourr 4096 30 mai    2014 lib
> lrwxrwxrwx 1 naourr naourr    3 12 juil. 00:35 lib32 -> lib
> drwxr-xr-x 2 naourr naourr 4096 30 mai    2014 sbin
> lrwxrwxrwx 1 naourr naourr    2 12 juil. 00:35 thumb2 -> ./
> drwxr-xr-x 8 naourr naourr 4096 30 mai    2014 usr
>
> If you use "cp -drl" or better yet "cp -al" (Thanks Yann) in order to not
> follow symbolic links and preserve the link, the issue is fixed :)
>
>
> Thoughts ?

Hi Romain,
thanks for the report and for the solution :), I will use "cp -al" in
the updated version of this patch set.

[snip]

Best regards
-- 
Fabio Porcedda
