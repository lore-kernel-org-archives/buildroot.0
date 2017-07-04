From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 15:23:52 +0200
Subject: [Buildroot] [PATCH v4 03/11] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <cf95d170-797e-c9c9-cf68-575e7e3a19a3@grandegger.com>
References: <1498559207-8050-1-git-send-email-wg@grandegger.com>
 <1498559207-8050-4-git-send-email-wg@grandegger.com>
 <8aa491de-1a71-0a8e-3274-4512ec22f763@mind.be>
 <cf95d170-797e-c9c9-cf68-575e7e3a19a3@grandegger.com>
Message-ID: <ca4ed8a9-8ffe-5d03-718a-5661a1d8a527@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 14:36, Wolfgang Grandegger wrote:
> Hello,
> 
> Am 04.07.2017 um 14:15 schrieb Arnout Vandecappelle:
>>   Since you're going to revert to this v4, I'm going to add a few comments here.
> 
> Yes, that's what doing now...
> 
>> On 27-06-17 12:26, Wolfgang Grandegger wrote:

[snip]
>>> +    staging)
>>> +        rootdir="${STAGING_DIR}"
>>> +        # supress include files
>>> +        find_args+=( "-path" "${STAGING_DIR}/usr/include" "-prune" "-o" )
>>
>>   Perhaps it's better to define a variable with all the paths we want to exclude
>> - we may want to add more. OTOH, we can do that whenever we indeed do add more.
> 
> But it's not just a variable, I need the leading -path and the trailing -prune
> for each dir exclude.

 Yeah, but you could do
    for excludepath in $EXCLUDEPATHS; do
        find_args += ( "-path" "${STAGING_DIR}""${excludepath}" "-prune" "-o" )

> 
>>> +        sanitize_extra_args+=( "--no-standard-lib-dirs" "--relative-to-file" )
>>> +        ;;
>>> +
>>> +    target)
>>> +        rootdir="${TARGET_DIR}"
>>> +        sanitize_extra_args+=( "--no-standard-lib-dirs" )
>>> +        ;;
>>> +
>>> +    *)
>>> +        usage
>>> +        exit 1
>>> +        ;;
>>> +    esac
>>> +
>>> +    find_args+=( "-type" "f" "-print" )
>>> +
>>> +    while read file ; do
>>> +    # check if it's an ELF file
>>> +    if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
>>
>>   Wasn't "readelf -d ${file} | grep DT_RUNPATH" faster? You did some experiments
>> a while ago but I forgot what the conclusions were.
> 
> There could also be DT_RPATH? 

 Er, right, indeed.

> But a grep for RPATH should fix that. I didn't
> test that, because I thought that pining is slower anyway. Without "grep
> DT_RUNPATH" it's faster but it will succeed then on non-dynamic ELF files as
> well. We could also tune patchelf to return faster if it's not an ELF file. I
> will remeasure with the command above.

 Since this series is already in v6, I propose that you do the simple thing that
you have now first, and it can be optimised later.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
