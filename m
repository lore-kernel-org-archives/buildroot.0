From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Nov 2013 23:27:20 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: generate complete,
 partition-based device images
In-Reply-To: <20131125190551.GA3435@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <ddf2a31498f7f8e1ec0d40d73849bc254ec00b6d.1385157864.git.yann.morin.1998@free.fr>
 <52931907.2040207@mind.be> <20131125190551.GA3435@free.fr>
Message-ID: <5293CEC8.9010601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/13 20:05, Yann E. MORIN wrote:
> Arnout,
>
> On 2013-11-25 10:31 +0100, Arnout Vandecappelle spake thusly:
>>   This patch is obviously too large to be reviewed in a single shot, so here
>> are some detailed comments on certain parts of it.
>
> Yes, I did expect it to be not trivial. Thank you for trying! :-)
>
>>   I don't think there's a way to split the patch up to make review easier,
>> unfortunately. But anyway, the functionality is completely isolated from the
>> rest so it doesn't hurt to commit it as is and fix up later if necessary.
>
> Maybe I could have separated the doc changes from the actual
> implementation, to make it easier to review, and eventuall squash
> both in a single cset for the final suvmission.

  I don't think separating the documentation would make review any easier.

  Something that _would_ make the review easier is to start with a 
simpler, less-featured version. But splitting it now is pretty much 
impossible.


>
>> On 22/11/13 23:50, Yann E. MORIN wrote:
>>> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Contrary to the existing fs/ schemes, which each generate only a single
>>> filesystem image for the root filesystem, this new scheme allows the
>>> user to generate more complex images.
>>> diff --git a/fs/Config.in b/fs/Config.in
>>> index da4c5ff..8721220 100644
>>> --- a/fs/Config.in
>>> +++ b/fs/Config.in
>>> @@ -11,5 +11,6 @@ source "fs/romfs/Config.in"
>>>   source "fs/squashfs/Config.in"
>>>   source "fs/tar/Config.in"
>>>   source "fs/ubifs/Config.in"
>>> +source "fs/custom/Config.in"
>>
>>   Shouldn't this be kept alphabetical?
>
> I also wondered about it, but my reasoning was to leave all single-fs
> options grouped by themselves, and add this new one as the last (or
> first) in the menu, to explicitly differentiate it.
>
> But I have no stronger opinion than "I find it nicer".

  I agree with your reasoning, but it's a change from our normal coding 
style so should be discussed I guess.

  Peter?

>
>>>
>>>   endmenu
>>> diff --git a/fs/custom/Config.in b/fs/custom/Config.in
>>> new file mode 100644
>>> index 0000000..fabb878
>>> --- /dev/null
>>> +++ b/fs/custom/Config.in
>>> @@ -0,0 +1,18 @@
>>> +config BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE
>>> +	string "partition table"
>>
>>   In most cases, we don't rely on the non-emptiness of a string to determine
>> if some option is enabled or not, but rather there's an explicit config
>> option to enable it. I'm not convinced that that is a good principle, but
>> it's how things are done now.
>
> OK, I see.
>
> My reasoning is that passing the path to the "partition table" is enough
> to state that the user does want to use a partition table, hence I did
> not hide it behind a bool.
>
> That's what we do for (eg.) BR2_ROOTFS_DEVICE_TABLE: if it is empty, we
> treat it as to not add any device. The fact that the option is set/unset
> is in itself enough to act or not.
>
> The boolean below is indeed needed since we do need a boolean for our
> internal use, but I see no reason to hide the string option behind the
> boolean. Hence the boolean is a blind option.

  Again, I agree with your reasoning but it doesn't comply with current 
policy (BR2_ROOTFS_DEVICE_TABLE is not such a great example BTW, because 
it defaults to non-empty and it is not used in Kconfig conditions).

  So again: Peter?

[snip]
>>> diff --git a/fs/custom/custom.mk b/fs/custom/custom.mk
>>> new file mode 100644
>>> index 0000000..940a32a
>>> --- /dev/null
>>> +++ b/fs/custom/custom.mk
>>> @@ -0,0 +1,14 @@
>>> +################################################################################
>>> +#
>>> +# custom partitioning
>>> +#
>>> +################################################################################
>>> +
>>> +define ROOTFS_CUSTOM_CMD
>>> + BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \"$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE)\"
>>
>>   Should be indented with a tab.
>
> No, because it is used as:
>
>      echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)

  Err... Most of the other ROOTFS_FOO_CMD definitions use tab 
indentation, which is the standard for Buildroot. Only tar and squashfs 
which are really really old use spaces.

>
>>   Does that quoting work? It sill expand to
>
> Yes it does, because it is interpreted twice (not sure how, but if I
> remove the quotes and set BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE="foo bar"
> then genimages gets two args, not one. Don;t ask me, double indirection
> in the Makefile fragemnt plus shell expansion, something like it...

  That is fully explained by the expansion below:

>> genimages \""path/to/partitiontable"\"
>>   so genimages' $1 will be "path/to/partititiontable" including the quotes.
>
> No, because both quotes have already been stripped away.

  You're right about the no, but not about the reason :-)  It is used as:

echo "genimages \""path/to/partitiontable"\"" > $(FAKEROOT_SCRIPT)

  So what you actually get is an unquoted path/to/partitiontable, but 
there will be quotes inside the fakeroot script.

  Anyway, I think it should be:

BUILD_DIR=$(BUILD_DIR) fs/custom/genimages \
	'$(call qstrip,$(BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE))'


>
>>
>>   Anyway, the symbol should be qstrip'ped and any required quotes added
>> explicitly. That makes it easier to run
>>
>> make BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE=some/other/path
>
> So, qstrip the symbol and re-add the quotes? Tss... OK, I can do that if
> you want. ;-)

  Well, it's what we do all over the place.

>
>>> +endef
>>> +
>>> +# We need the tarball to be generated first
>>
>>   This comment is redundant
>
> What about:
>
>      # rootfs-custom uses rootfs.tar as the source to generate the
>      # resulting image(s), so we need to build it first.
>
> Also, I forgot to add:
>      rootfs-custom-show-depends:
>          @echo $(ROOTFS_CUSTOM_DEPENDENCIES)

  Doesn't ROOTFS_TARGET add that?

>
>>> +ROOTFS_CUSTOM_DEPENDENCIES += rootfs-tar
>>> +
>>> +$(eval $(call ROOTFS_TARGET,custom))
>>
>> [snip, unreviewed]
>>
>>> diff --git a/fs/custom/genimages b/fs/custom/genimages
>>> new file mode 100755
>>> index 0000000..aba3021
>>> --- /dev/null
>>> +++ b/fs/custom/genimages
>>> @@ -0,0 +1,214 @@
>>> +#!/bin/bash
>>
>>   I have a general question for the maintainers here:
>>
>> * Do we really want to rely on bash even more?
>
> bash is already a hard-dependency of Buildroot. anyway.

  Yes, but I think it's just because of the apply-patches script. That's 
why I ask: do we want to make this hard dependency even harder, or do we 
prefer to go for posix shell as much as possible.

  That said, now I've read the script in a bit more detail: making them 
posix-shell compliant would be pretty hard.

>
>> * Would it make sense to implement complex things like this in a proper
>> programming language (read: python), which would solidify our dependency on
>> python?
>
> I don't do Python.

  Good reason.

>
>>   With python's ConfigParser, this file would be reduced to +- 20 lines...
>
> Does ConfigParser handles lines like:
>     key=$((4*1024))

  Obviously not, it would have to be
key = 4*1024

>
>>> +set -e
>>> +set -E
>>> +
>>> +#-----------------------------------------------------------------------------
>>> +main() {
>>> +    local part_table="${1}"
>>> +    local tmp_dir
>>> +    local rootfs_dir
>>> +    local -a devices
>>> +    local extract
>>> +    local cur_section
>>> +    local -a sections devices partitions
>>> +    local -A variables values partdevs
>>> +    local sec dev part var val
>>> +    local secs devs parts vars vals
>>> +
>>> +    if [ ! -f "${part_table}" ]; then
>>> +        error "%s: no such file\n" "${part_table}"
>>> +        exit 1
>>> +    fi
>>> +
>>> +    export PATH="${HOST_DIR}/usr/bin:${HOST_DIR}/usr/sbin:${PATH}"
>>> +
>>> +    tmp_dir="$( mktemp -d --tmpdir rpi-genimage.XXXXXX )"
>>
>>   Small nit: I think it would make more sense to create the tmp_dir relative
>> to the output directory.
>
> OK.
>
>>   Larger nit: there should be a trap to clean up tmp_dir. Or alternatively,
>> if it's relative to the output directory do the cleanup in the beginning.
>
> I initially had that. But since we may want to debug the issues in
> genimages, we need to keep the temp dir. So, moving to build-dir and
> cleaning at the beginning is OK for my use-case.
>
>>   And finally, I'd create the tmp_dir only after parsing and validating the
>> partition file.
>
> OK.
>
>>> +    rootfs_dir="${tmp_dir}/rootfs"
>>> +    mkdir -p "${rootfs_dir}"
>>> +
>>> +    # Parse all the sections in one go, we'll sort
>>> +    # all the mess afterwards...
>>> +    debug "parsing partitions descriptions file '%s'\n" \
>>> +          "${part_table}"
>>> +    while read line; do
>>> +        line="$( sed -r -e 's/[[:space:]]*#.*$//; //d;' <<<"${line}" )"
>>
>>   I would try to avoid sed -r if you don't really need it - especially if you
>> don't use extended regexp at all.
>
> I never care about regexp being extended or not, I just use -r all the
> time. It is much simpler: I never know if the regexp I'm using is
> extended or not.
>
>>   To make this incredibly complex line a little more readable, I'd split it
>> in two lines:
>>
>>      line="$( sed -e 's/[[:space:]]*#.*$//' <<<"${line}" )"
>>      line="$( sed -e '//d;' <<<"${line}" )"
>
> "Incredibly complex"? You're kidding, aren't you?

  No, I'm not kidding. I had to do sed --help to remember what -r is 
about, I had to think a little about the <<< construct, I had to read the 
sed expression two times before I noticed the ;, and only then I could 
start parsing the regex.

> Besides, yours is
> broken, since '//d;' relies on the previous expresion. ;-p

  ... and even then I failed to notice that // is not the same as /^$/ :-)

  But so the //d is actually redundant. Because it matches the part that 
was just removed, so it never matches.

>
>>> +
>>> +        # Detect start of global section, skip anything else
>>> +        case "${line}" in
>>> +        "") continue;;
>>> +        '['*']')
>>> +            cur_section="$( sed -r -e 's/[][]//g;' <<<"${line}" )"
>>> +            debug "  entering section '%s'\n" "${cur_section}"
>>> +            sections+=( "${cur_section}" )
>>> +            continue
>>> +        ;;
>>> +        ?*=*)   ;;
>>> +        *)      error "malformed entry '%s'\n" "${line}";;
>>> +        esac
>>> +
>>> +        var="${line%%=*}"
>>> +        eval val="${line#*=}"
>>> +        debug "    adding '%s'='%s'\n" "${var}" "${val}"
>>> +        variables+=( ["${cur_section}"]=",${var}" )
>>> +        values+=( ["${cur_section}:${var}"]="${val}" )
>>> +    done <"${part_table}"
>>
>>   I would add explicit checks that the global section exists and that it
>> includes the required variables.
>
> OK, makes sense. Ditto, all referenced devices/partitions should have a
> corresponding section.
>
>>> +    # Create lists of devices, partitions, and partition:device pairs.
>>> +    debug "creating intermeditate lists\n"

  intermediate

  But perhaps you need to mediate a little in the middle of this 
function? :-)

>>> +    devices=( ${values["global:devices"]//,/ } )
>>> +    for dev in "${devices[@]}"; do
>>> +        partitions=( ${values["${dev}:partitions"]//,/ } )
> Hmm. Bug here -------^ should be += I think.
>
>>   I'd include a check that partitions exsits and has the right format.
>
> See above.
>
>>> +    done
>>> +    for dev in "${devices[@]}"; do
>>> +        for part in ${values["${dev}:partitions"]//,/ }; do
>>> +            partdevs+=( ["${part}"]="${dev}" )
>>
>>   Why do you loop twice here, instead of just doing this in the previous
>> loop?
>
> Hmm, lemme check...
>
>>   I'm not very familiar with bash array syntax, but can't you use something
>> like "for part in ${partitions[@]}" ?
>
> But how do I know what device a partition is on?
> (but do I need that anyway?) I'll check.

  With the += correction you mentioned above, your code makes a lot more 
sense.

  Regards,
  Arnout

>
>>> +    trace "extracting root (if needed)\n"
>>> +    case "${values["global:extract"]}" in
>>> +        targz)  c=z ;;&
>>> +        tarbz2) c=j ;;&
>>> +        tarxz)  c=J ;;&
>>
>>   Since we use a fairly recent tar, tar will auto-detect compression based on
>> the extension.
>
> I don't like that... But OK.
>
>> By the way, since you only support tar anyway, I would remove
>> this option completely. Whenever it is actually useful, it can be added
>> again (with a default to tar for backwards compatibility).
>
> Yep, no need to over-engineer the sutff.
>
>>> +        tar)    c=  ;;&
>>> +        tar*)   tar x${c}f "${BINARIES_DIR}/rootfs.tar" -C "${rootfs_dir}";;
>>> +        "")     ;;
>>> +        *)      error "unknown extract method '%s'\n" "${extract}";;
>>> +    esac
>>
>> [Rest is unreviewed]
>
> Thank you very much for the review! :-)
>
> Regards,
> Yann E. MORIN.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
