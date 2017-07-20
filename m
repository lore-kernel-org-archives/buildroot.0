From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 10:15:19 +0200
Subject: [Buildroot] [PATCH v7 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <16f616fc-173d-a201-8342-cda48dc102fe@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-3-git-send-email-wg@grandegger.com>
 <b381421f-9595-ad2d-defb-f94b7d325c09@mind.be>
 <16f616fc-173d-a201-8342-cda48dc102fe@grandegger.com>
Message-ID: <a8c548d5-d6d0-53bf-2c6b-17e5a5f3101b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 09:31, Wolfgang Grandegger wrote:
> Am 20.07.2017 um 01:02 schrieb Arnout Vandecappelle:
>>
>>
>> On 05-07-17 18:53, Wolfgang Grandegger wrote:
[snip]
>>> +Environment:
>>> +
>>> +    PATCHELF    patchelf program to use
>>> +        (default: HOST_DIR/bin/patchelf)
>>
>>   And also HOST_DIR, TARGET_DIR, STAGING_DIR, and
>> TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.
> 
> PATCHELF points to the patchelf utility! Or what do you mean here?

 I mean, also these environment variables are used by the script. Moreover, the
_DIR variables are not optional.

[snip]
>>> +    target)
>>> +        rootdir="${TARGET_DIR}"
>>> +        sanitize_extra_args+=( "--no-standard-lib-dirs" "--relative-to-file" )
>>
>>   I thought we decided that target and staging should NOT be relative-to-file,
>> but should be absolute paths without rootdir? Or was this a problem for staging,
>> because the linker would add the RUNPATH to the library search path and this
>> would point to the system libs instead of target libs? According to the man page
>> this should only be the case for a native linker, so not for a cross linker.
> 
> Grrr, that's wrong, cut an paste error :(. Fixed!

 But staging stays the same as target, right?

 And did you add comments everywhere to explain why these options are chosen?

> 
>>   I don't really like having $ORIGIN-based rpaths in target, but it's no big
>> deal.
>>
>>   Regardless, the reasoning behind the choice we make should be documented here
>> in comments. So for host, add something to the effect that we always want
>> $ORIGIN-based rpaths to make it relocatable. For staging, say that we want it to
>> be the same as target. And for target, explain the choice you made.
>>
>>
>>> +    while read file ; do
>>> +    # check if it's an ELF file
>>
>>   Indentation is inconsistent: sometimes 4 spaces, sometimes 2 spaces (inside the
> 
> That's due to 8 spaces replaced by one tab.

 Fix your editor not to do that.

> 
>> case, and in the condition below). And here, you're switching from spaces to
>> tabs!
> 
> I use the default indention from emacs "Shell-script[bash]" which is usually not
> a bad choice. I'm going to replace all tabs with spaces.

 Since emacs, vim and kate all have compatible mode-settings lines, feel free to
add a mode-setting line below the shebang of the script. Do test it with vim please.

> 
>>> +    if ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1; then
>>
>>   It might be good to check if the file actually has a non-empty rpath. When
>> processing a second time, most rpaths are empty so they can be skipped.
> 
> I already tried that. It will make the check slower, meaning it costs more that
> calling patchelf a second time.
> 
>>   Maybe even add another patch to patchelf to exit early and quietly with just 0
>> or 1 depending on rpath presence.
> 
> Optimization of the execution time needs more careful analysis. I have a
> patchelf patch which just open and reads the patchelf header to check quickly if
> it's an ELF file. But that does not help a lot. readelf is still faster and I
> guess that's because it's written in C (and not C++).

 I have a few speedup suggestions for patchelf (but all should be in follow-up
patches, not as part of patch 1/9).

- Add a --has-rpath option that is quiet and just exits 0 or 1.
- Instead of reading into a string, mmap the file. Since in most cases the file
size isn't changed, that works *very* efficiently. Note that this needs a
configure.ac check (mmap is not always available, e.g. not on nommu). With mmap,
it's not needed to first read the header only, since it will just pull in a page
when needed. It will be slower on NFS and some FUSE filesystems though.
- Remove empty RUNPATH entries, so a second run doesn't even start.
- Link patchelf statically, preferably with -flto as well. This will probably
just speed things up with a few %, but it's also on the "empty" calls so could
be significant.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
