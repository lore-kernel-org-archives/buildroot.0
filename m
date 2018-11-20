From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Nov 2018 00:32:11 +0100
Subject: [Buildroot] [PATCH next v5 7/9] core: implement per-package SDK
 and target
In-Reply-To: <20181120213612.GL2601@scaer>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-8-thomas.petazzoni@bootlin.com>
 <20181120213612.GL2601@scaer>
Message-ID: <af66d76c-06c6-3e01-257c-9e263d724639@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/11/2018 22:36, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-11-20 17:35 +0100, Thomas Petazzoni spake thusly:
>> This commit implemnts the core of the move to per-package SDK and
>> target directories. The main idea is that instead of having a global
>> output/host and output/target in which all packages install files, we
>> switch to per-package host and target folders, that only contain their
>> explicit dependencies.
> [--SNIP--]
> 
>>   output/per-package/busybox/target
>>   output/per-package/busybox/host
>>   output/per-package/host-fakeroot/target
>>   output/per-package/host-fakeroot/host
> 
> I'm not fond of the naming here...

 Yay bikeshedding!

> 
> In the end, can we expect to have a layout that would look like:
> 
>     output/build/busybox/host/
>     output/build/busybox/target/
>     output/build/busybox/busybox-1.2.3/     # Source tree, and
>                                             # currently, build dir

 If we're changing the world anyway, what about:

output/work/busybox-1.2.3/source
output/work/busybox-1.2.3/host
output/work/busybox-1.2.3/target
output/work/busybox-1.2.3/build

 Or maybe even:

output/work/busybox-1.2.3/source
output/work/busybox-1.2.3/dependencies/host
output/work/busybox-1.2.3/dependencies/staging -> host/tuple/sysroot
output/work/busybox-1.2.3/dependencies/target
output/work/busybox-1.2.3/build


 That said, I'm absolutely fine with keeping the current layout. The proposed
layout has the only advantage that you can kill the ppd together with the
source/build dir, but the big disadvantage that it breaks everybody's habits...

[snip]
>> @@ -455,7 +464,11 @@ LZCAT := $(call qstrip,$(BR2_LZCAT))
>>  TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
>>  
>>  # packages compiled for the host go here
>> +ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
>> +HOST_DIR = $(if $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/host,$(call qstrip,$(BR2_HOST_DIR)))
>> +else
>>  HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
> 
> Why do we still have HOST_DIR as immediately-defined?
> 
> Since HOST_DIR is simply defined in the per-package case, I see no
> reason to have immediately-defined in the standard case either.

 Except that this patch doesn't even touch that line...

[snip]
>> +# $1: deps
>> +ifeq ($(BR2_PER_PACKAGE_FOLDERS),y)
>> +define prepare-per-package-folder

 While we're bikeshedding: we have about 1000 occurences of "directory" and less
than 30 of "folder".

> 
> The location where you define this macro, in the instrumentation hooks,
> is not optimum I think. You even did not provide a help-comment for it.

 At some point we started collecting this kind of thing in pkg-utils.mk. But I'm
not sure if we're still doing that...

> 
>> +	mkdir -p $(HOST_DIR) $(TARGET_DIR)
>> +	$(foreach pkg,$(1),\
>> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
>> +		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
>> +		$(HOST_DIR)$(sep))
>> +	$(foreach pkg,$(1),\
>> +		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
>> +		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
>> +		$(TARGET_DIR)$(sep))
> 
> Why do you need two 'foreach' calls? Can't the following work?
> 
>     $(foreach pkg,$(1),\
>         rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
>             $(PER_PACKAGE_DIR)/$(pkg)/host/ \
>             $(HOST_DIR)$(sep) \
>         rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
>             $(PER_PACKAGE_DIR)/$(pkg)/target/ \
>             $(TARGET_DIR)$(sep))

 I kind of like how we first build up all of host, and then all of target. But
really, it doesn't make much of a difference.

 More importantly, however: should we also sync the target directory for host
packages? We *are* syncing the staging directory, of course...

[snip]
>> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
>> index 6c5767da05..787a1763b0 100755
>> --- a/support/scripts/check-host-rpath
>> +++ b/support/scripts/check-host-rpath
>> @@ -11,6 +11,7 @@ export LC_ALL=C
>>  main() {
>>      local pkg="${1}"
>>      local hostdir="${2}"
>> +    local perpackagedir="${3}"
>>      local file ret
>>  
>>      # Remove duplicate and trailing '/' for proper match
>> @@ -20,7 +21,7 @@ main() {
>>      while read file; do
>>          is_elf "${file}" || continue
>>          elf_needs_rpath "${file}" "${hostdir}" || continue
>> -        check_elf_has_rpath "${file}" "${hostdir}" && continue
>> +        check_elf_has_rpath "${file}" "${hostdir}" "${perpackagedir}" && continue
>>          if [ ${ret} -eq 0 ]; then
>>              ret=1
>>              printf "***\n"
>> @@ -57,6 +58,7 @@ elf_needs_rpath() {
>>  check_elf_has_rpath() {
>>      local file="${1}"
>>      local hostdir="${2}"
>> +    local perpackagedir="${3}"
>>      local rpath dir
>>  
>>      while read rpath; do
>> @@ -65,6 +67,7 @@ check_elf_has_rpath() {
>>              dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
>>              [ "${dir}" = "${hostdir}/lib" ] && return 0
>>              [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
>> +            [[ ${dir} =~ ${perpackagedir}/[^/]*/host/lib ]] && return
 The commit message doesn't explain why this is needed, and it took me some time
to understand...

 Regards,
 Arnout

>>          done
>>      done < <( readelf -d "${file}"                                              \
>>                |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
>> -- 
>> 2.19.1
>>
> 
