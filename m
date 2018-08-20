From: Michal Sojka <sojkam1@fel.cvut.cz>
Date: Mon, 20 Aug 2018 15:57:11 +0200
Subject: [Buildroot] [PATCH v2] core/legal-info: Add package
 dependencies with licenses to the manifest
In-Reply-To: <20180812142202.GF2402@scaer>
References: <20180810140322.2748-1-sojkam1@fel.cvut.cz>
 <20180812142202.GF2402@scaer>
Message-ID: <87h8jpcf9k.fsf@steelpick.2x.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann and others,

On Sun, Aug 12 2018, Yann E. MORIN wrote:
> Michal, All,
>
> On 2018-08-10 16:03 +0200, sojkam1 at fel.cvut.cz spake thusly:
>> From: Michal Sojka <sojka@merica.cz>
>> 
>> This adds one column to the legal-info manifest table. It contains the
>> dependencies of the given package and their licenses. This information
>> is useful when assessing license compatibility of the packages and
>> their libraries.
>> 
>> An example of the content of the new column for the MPD package is
>> shown below:
>> 
>>     "alsa-lib [LGPL-2.1+ (library), GPL-2.0+ (aserver)], boost
>>     [BSL-1.0], libid3tag [GPL-2.0+], libmad [GPL-2.0+], libogg
>>     [BSD-3-Clause], libvorbis [BSD-3-Clause], libzlib [Zlib],
>>     skeleton-init-common [unknown], skeleton-init-sysv [unknown],
>>     sqlite [Public domain], toolchain-external-linaro-arm [unknown], "
>
> I believe this is a very good addition to the manifest. Good idea! :-)
>
> The trailing comma is ugly, though. I would just drop the coma
> altogether...
>
> And here, I have two spaces between each packages:
>

[...]

>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> index c3acc22b17..f7a3609443 100644
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -79,8 +79,8 @@ define legal-warning-nosource # pkg, {local|override}
>>         $(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
>>  endef
>> 
>> -define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}
>> -	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)"' >>$(LEGAL_MANIFEST_CSV_$(7))
>> +define legal-manifest # pkg, version, license, license-files, source, url, {HOST|TARGET}, dependencies
>> +	echo '"$(1)","$(2)","$(3)","$(4)","$(5)","$(6)","$(8)"' >>$(LEGAL_MANIFEST_CSV_$(7))
>>  endef
>
> This change would have been (slightly) easier to review if the order of
> parameters was changed.
>
> In fact, I even believe a beter order would be:
>
>     {HOST|TARGET}, pkg, version, license, license-files, source, url, dependencies
>
> (if you decide to go with this change too, then make it a separate patch
> that comes first.)

Yes, I think that this order is more natural.

>> define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-fullpath, {HOST|TARGET}
>> @@ -95,3 +95,22 @@ define legal-license-file # pkgname, pkgname-pkgver, pkgdir, filename, file-full
>>  	} && \
>>  	cp $(5) $(LICENSE_FILES_DIR_$(6))/$(2)/$(4)
>>  endef
>> +
>> +remove-virtual-pkgs = $(foreach p,$(1),$(if $($(call UPPERCASE,$(p))_IS_VIRTUAL),,$(p)))
>> +get-direct-deps = $(sort $(foreach p,$(1),$($(call UPPERCASE,$(p))_FINAL_DEPENDENCIES)))
>
> This should be using $(2)_FINAL_ALL_DEPENDENCIES and not $(2)_FINAL_DEPENDENCIES,
> because the _EXTRACT_DEPENDENCIES and _PATCH_DEPENDENCIES can also be used
> to alter the content of the package. For example, we use _PATCH_DEPENDENCIES
> for the linux extensions, and those are changing the source code of the
> linux package, so their licensing terms also apply.

OK

>> +define get-transitive-deps # packages
>> +	$(if $(filter-out $(1),$(call get-direct-deps,$(1))),\
>> +	     $(sort $(1) $(call get-transitive-deps,$(filter-out $(1),$(call get-direct-deps,$(1))))),\
>> +	     $(1))
>> +endef
>
> What about this new variable instead:
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index a539483ae4..ca55ac5e8e 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -609,6 +609,14 @@ $(2)_FINAL_ALL_DEPENDENCIES = \
>  		$$($(2)_FINAL_DEPENDENCIES) \
>  		$$($(2)_FINAL_EXTRACT_DEPENDENCIES) \
>  		$$($(2)_FINAL_PATCH_DEPENDENCIES))
> +$(2)_FINAL_RECURSIVE_DEPENDENCIES = \
> +	$$(sort \
> +		$$(foreach p,\
> +			$$($(2)_FINAL_ALL_DEPENDENCIES),\
> +			$$(p)\
> +			$$($$(call UPPERCASE,$$(p))_FINAL_RECURSIVE_DEPENDENCIES)\
> +		)\
> +	)

This looks nice. When I tried it, `make printvars` was about 4 times
slower. I don't know whether it's a problem or not, but I use printvars
quite often during debugging of various stuff. Of course, if I limit the
variables with VARS=..., it is fast again.

>  
>  $(2)_INSTALL_STAGING?= NO
>  $(2)_INSTALL_IMAGES?= NO
>
>> +non-virtual-deps = $(call remove-virtual-pkgs,$(filter-out $(1),$(call get-transitive-deps,$(1))))
>
> And this new macro:
>
> non-virtual-deps = $(foreach p,$(1),$(if $($(call UPPERCASE,$(p))_IS_VIRTUAL),,$(p)))
>
>> +host-pattern-if-target-pkg = $(if $(1:host-%=),host-%,)
>
> I am not sure I grok that one... Oh, OK I got it. I don't think we need
> an intermediate variable (partly because its name is longer than the code
> it replaces...)
>
>> +# Produce a comma-separated list of dependent packages and their
>> +# licenses. Host packages are removed from the list if the argument is
>> +# not a host package.
>> +define legal-deps # package
>> +$(foreach p,$(filter-out $(call host-pattern-if-target-pkg,$(1)),$(call non-virtual-deps,$(1))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)], )
>> +endef
>
> ... and then:
>
> # $1: package name, lowercase
> legal-deps = \
>     $(foreach p,\
>         $(filter-out $(if $(1:host-%=),host-%),\
>             $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES)),\
>         $(p) [$($(call UPPERCASE,$(p))_LICENSE)]\
>     )

> This is totally untested, but owrth investigating I think. ;-)

Yes. It also produces double spaces. I managed to fix that only by
putting the last three lines on a single line.

I'll send v3 with the current state.

-Michal
