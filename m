From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Apr 2019 23:22:08 +0200
Subject: [Buildroot] [RFC 1/1] br2-external: Alow to include toolchain
 from external tree
In-Reply-To: <20190419030101.cktcloq4rfqyw3mt@vkochan-ThinkPad-T470p>
References: <20190417204630.18746-1-vadim4j@gmail.com>
 <a37f9f50-381a-cdfb-4d78-bd78bbdd9f4c@mind.be> <20190418145344.GA21166@scaer>
 <20190419030101.cktcloq4rfqyw3mt@vkochan-ThinkPad-T470p>
Message-ID: <bc9c8aa1-9c56-7c86-9b3f-2cd66a91f796@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/04/2019 05:01, Vadim Kochan wrote:
> Hi Yann, Arnout, Thomas, All
> 
> On Thu, Apr 18, 2019 at 04:53:44PM +0200, Yann E. MORIN wrote:
>> Arnout, Vadim, All,
>>
>> On 2019-04-17 23:26 +0200, Arnout Vandecappelle spake thusly:
>>> On 17/04/2019 22:46, Vadim Kochan wrote:
[snip]
>>>> @@ -1042,6 +1042,10 @@ endif
>>>>  $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
>>>>  	$(Q)support/scripts/br2-external -k -o "$(@)" $(BR2_EXTERNAL)
>>>>  
>>>> +.PHONY: $(BUILD_DIR)/.br2-external.in.toolchain
>>>> +$(BUILD_DIR)/.br2-external.in.toolchain: $(BUILD_DIR)
>>>> +	$(Q)support/scripts/br2-external -t -o "$(@)" $(BR2_EXTERNAL)
>>>
>>>  I don't like much that it's a separate target. However, it's consistent with
>>> how .br2-external.in is called, so it's OK as it is.
>>
>> If at all, I would have tried to make it a single target as well.
>>
>> However, it would require a bit of reachitecting the file, and so maybe
>> it is not worht the effort...

 Ho ho, I just meant "a single target", not "a single invocation of the
br2-external script"... What I *actually* meant is that it would be more
appropriate to have:

prepare-kconfig: outputmakefile
 	$(Q)support/scripts/br2-external -k -o "$(BUILD_DIR)/.br2-external.in"
$(BR2_EXTERNAL)
 	$(Q)support/scripts/br2-external -t -o
"$(BUILD_DIR)/.br2-external-toolchain.in" $(BR2_EXTERNAL)

>>
>> But now, the 'kconfig' -k option is misleading, because it does no
>> longer generate the whole kconfig stuff; it only generates parts of it.
>> But I don't havea better idea either... :-(
>>
>> Oh, what about removing the '-o' opiton, and requiring each type to
>> expect the output file as arg :
>>
>>   - $(BUILD_DIR)/.br2-external.mk is generated with a call like:
>>
>>         support/scripts/br2-external -m /path/to/.br2-external.mk $(BR2_EXTERNAL)
>>
>>   - $(BUILD_DIR)/.br2-external.in and $(BUILD_DIR)/.br2-external-toolchain.in
>>     are generated with a single call like so:
>>
>>         support/scripts/br2-external -k /path/to/.br2-external.in -t /path/to/.br2-external-toolchain.in $(BR2_EXTERNAL)

 If you're generating things in a single call, you could just as well generate
all of them in the one call, i.e. including the .mk file. the br2-external
script already gets called on every invocation of `make`, so if it generates all
files in one shot, we don't need any commands anymore in prepare-kconfig.

 However, I don't mind very much how it's done now with several invocations. It
makes the script rather elegant.

>>
>>>>  # printvars prints all the variables currently defined in our
>>>>  # Makefiles. Alternatively, if a non-empty VARS variable is passed,
>>>>  # only the variables matching the make pattern passed in VARS are
>>>> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
>>>> index 00cb57d1ed..3ec332d93e 100755
>>>> --- a/support/scripts/br2-external
>>>> +++ b/support/scripts/br2-external
>>>> @@ -16,10 +16,11 @@ main() {
>>>>      local OPT OPTARG
>>>>      local br2_ext ofile ofmt
>>>>  
>>>> -    while getopts :hkmo: OPT; do
>>>> +    while getopts :htkmo: OPT; do
>>>>          case "${OPT}" in
>>>>          h)  help; exit 0;;
>>>>          o)  ofile="${OPTARG}";;
>>>> +        t)  ofmt="toolchain";;
>>
>> Keep options in alphabetical order, except help which goes first.
>>
>>>>          k)  ofmt="kconfig";;
>>
>> And thus you'd have to be smart here, like so:
>>
>>     do_kconfig=false
>>     do_mk=faile
>>     do_toolchain=false
>>     while getopts :ht:k:m: OPT; do
>>         case "${1}" in
>>         (m)     do_kconfig=true; kconfig_file="${OPTARG}";;
>>         (k)     do_mk=true; mk_file="${OPTARG}";;
>>         (t)     do_toolchain=true; toolchain_file="${OPTARG}";;
>>         esac
>>     done
> 
> What about to use '-o' (or better '-O' ?) arg for output folder and use
> default names for output files, but also add possibility to specify a
> custom file names per each output file (if it is needed actually) ? 

 Yes, if they're all done in one shot, it could be -O. No need for a -o in that
case, obviously.

 Note that this is a purely internal script (otherwise it would reside in
utils/), so we can arbitrarily change the interface.

> then
> the invocation might look like:
> 
> for kconfig:
> 
>     $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
>     $(Q)support/scripts/br2-external -k -o "$(BUILD_DIR)" $(BR2_EXTERNAL)
> 
> 
> for mk:
> 
>     $(shell support/scripts/br2-external \
> 	-m -o '$(BASE_DIR)' $(BR2_EXTERNAL))
> 
> in this case '-k' still makes sense and it will generate both toolchain
> and external kconfig files.
> 
> The following options might be used for specifying output file names:
> 
>     -M - *.mk file
> 
>     -E - main external kconfig
> 
>     -T - toolchain file name
> 
>     -C - common kconfig file name
> 
> (I really think this is not needed)
> 
> I think that it is ok that script aware about default output file names.

 +1 to that.


>> This is missing the error case and help, but you get the idea. You could
>> also check that do_toolchain and do_kconfig must be identical (both
>> false or both true) and that it do_mk is incompatible with do_kconfig.
>>
>> It would then be used as:
>>
>>     if ${do_kconfig}; then gen_kconfig >"${kconfig_file}"; fi
>>     if ${do_mk}; then gen_mk >"${mk_file}"; fi
>>     if ${do_toolchain}; then gen_toolchain >"${toolchain_file}"; fi
>>
>>>>          m)  ofmt="mk";;
>>>>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>>>> @@ -30,7 +31,7 @@ main() {
>>>>      shift $((OPTIND-1))
>>>>  
>>>>      case "${ofmt}" in
>>>> -    mk|kconfig)
>>>> +    mk|kconfig|toolchain)
>>>>          ;;
>>>>      *)  error "no output format specified (-m/-k)\n";;
>>>>      esac
>>>> @@ -188,6 +189,37 @@ do_kconfig() {
>>>>      printf "endmenu # User-provided options\n"
>>>>  }
>>>>  
>>>> +# Generate the toolchain kconfig snippet for the br2-external tree.
>>>> +do_toolchain() {
>>>> +    local br2_name br2_ext
>>>> +
>>>> +    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
>>>> +    printf '\n'
>>>> +
>>>> +    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
>>>> +        printf '# No br2-external tree defined.\n'
>>>> +        return
>>>> +    fi
>>>> +
>>>> +    for br2_name in "${BR2_EXT_NAMES[@]}"; do
>>>> +        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
>>>> +        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
>>>> +
>>>> +        if [ ! -f "${br2_ext}/toolchain-external/Config.in" ]; then
>>>> +            continue
>>>> +	fi
>>>
>>>  There's some whitespace confusion here; this file uses spaces only.
>>>
>>>> +
>>>> +        # we have to duplicate it here too because otherwise BR2_EXTERNAL_*
>>>> +	# is not evaluated in Config.in
>>>
>>>  Argh, that's mightily annoying... But I don't really see a better solution. The
>>> reason is that .br2-external.in only gets included after all the other files
>>> have already been included. Normally Kconfig is indepdent of the order in which
>>> you declare things, but not when you use a variable in a source directive...
>>>
>>>  I don't see a good way around it. We could have yet another
>>> .br2-external-variables.in that gets included *before* all the rest, but that's
>>> also pretty ugly...
>>>
>>>  Yann, any ideas?
>>
>> Gaaahhh... I don't have a very impressive solution either... :-(
>>
>> Building on my proposal above, what about expanding to:
>>
>>     -m -> .mk file
>>
>>     -k -> kconfig variables _only_, included very early, probably in
>>           Config.in, before line 105 (source "arch/Config.in")>>
>>     -t -> toolchains
>>
>>     -M -> kconfig menu only  (but uppercase 'M' is not nice, since we
>>           already have lowercase 'm'... maybe switch them?)
>>
>> If you have a better idea, be my guest and shout it out loud. ;-)

 Still feels icky.

>>
>>>  Assuming there is no better solution than this one, the patch looks pretty much
>>> OK except for the whitespace. I believe it covers all cases. It would be nice if
>>> the file would also contain *something* if there are some externals but none of
>>> them have a toolchain-external/Config.in, but I don't think it's worth spending
>>> time on that.
>>>
>>>  For the final patch there should also be documentation of course.
>>
>> Documentation, what's that? ;-)
>>
>> Yes, the manual should explain that, when this file exist in a
>> br2-external tree, it will be included in the toolchain choice, so it
>> should only contain the boolean options that define the external
>> toolchains.

 Actually, you'll need both the choice part *and* the Config.in.options part.
Note that for those, there is no need to do something special to include them
"at the right time", because normally they're only blind options so their
location doesn't matter. But all this should be explained in the documentation.

 Regards,
 Arnout
