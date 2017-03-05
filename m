From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 00:13:57 +0100
Subject: [Buildroot] [RFC PATCH 1/9] package/patchelf: use a recent
 version and add "--make-rpath-relative" patch
In-Reply-To: <edacb9c4-60c3-5dad-c4a3-863af839f66b@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-2-git-send-email-wg@grandegger.com>
 <6f9b5eb0-34dc-498c-b23e-cb6449071210@mind.be>
 <edacb9c4-60c3-5dad-c4a3-863af839f66b@grandegger.com>
Message-ID: <ac285508-f2d1-d98a-4a78-af72b693bb51@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-03-17 16:16, Wolfgang Grandegger wrote:
> Hello Arnout,
> 
> Am 04.03.2017 um 12:26 schrieb Arnout Vandecappelle:
[snip]
>>> +RPATHDIR points somewhere else:
>>> +    (can be anywhere: build trees, staging tree, host location,
>>> +    non-existing location, etc.). Just discard such a path.
>>
>>  I think a warning should be printed in this case, certainly if
>> --no-standard-libs is specified.
> 
> This is very often the case. Here is the host rpath from pulseaudio:
> 
> /opt/bdo/alqt5/build/pulseaudio-9.0/src/.libs:/opt/bdo/alqt5/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib:/usr/lib/pulseaudio
> 
> Especially references to .libs and sysroot do show up often.

 Ah, yes of course, I didn't think of that. Indeed, pointing to the build
directory or to staging is kind of expected.


>>> +In addition, the option "--no-standard-libs" will discard RPATHDIRs
>>> +ROOTDIR/lib and ROOTDIR/usr/lib. Like "--shrink-rpath", RPATHDIRs
>>> +are discarded if the directories do not contain a library
>>> +referenced by DT_NEEDED fields.
>>
>>  Again, since you're doing two separate things here, I would think that it makes
>> sense to split this patch in two for upstream. You can still include both
>> upstream patches in a single Buildroot commit, but I think for upstream it is
>> easier to accept the changes if they're separated.
> 
> If you look to the patch, it uses a separate "if" block to implement
> "--make-rpath-relative". It does not interfere with the
> "--shrink-rpath" block. Actually, I didn't find an elegant way to
> extend the "--shrink-rpath" logic. It's to much different.

 Even if both option are part of the --make-rpath-relative bit, it makes sense
to treat them in two separate commits.

[snip]
>>> ++    void modifyRPath(RPathOp op,
>>> ++                     const std::vector<std::string> & allowedRpathPrefixes,
>>> ++                     std::string rootDir, int flags, std::string newRPath);
>>
>>  So here I think it should be 'bool noStdLibDirs' rather than flags.
>>
>>  However, wouldn't it be better to instead add forbiddenRpathPrefixes? That
>> makes it symmetrical with allowedRpathPrefixes and easier to understand IMHO.
> 
> I implemented "forbiddenRpathPrefixes" but I did not find it useful for
> our purpose. What do you have in mind?

 For us, the forbiddenRpathPrefixes will always be /lib:/usr/lib. But for
upstream, it is more useful to have a general solution that can also be applied
in other situations. Concretely, I'm thinkinf of /lib64 and
/lib/x86_64-linux-gnu - in Buildroot they are symlinks to /lib so will already
be caught by the path canonification, but in other distros they may be distinct
directories that are still in the default search path.

 Note that forbiddenRpathPrefixes is actually wrong, since it shouldn't be
prefixes, it should be full paths. So forbiddenRpaths.

[snip]
>>> ++    /* Make the the RPATH relative to the specified path */
>>> ++    if (op == rpMakeRelative) {
>>> ++        std::string fileDir = fileName.substr(0, fileName.find_last_of("/"));
>>> ++        newRPath = "";
>>> ++
>>> ++        for (auto & dirName : splitColonDelimitedString(rpath)) {
>>> ++            std::string canonicalPath;
>>
>>  Call it absolutePath, since it is the return value of absolutePathExists().
> 
> The path returned is the canonical one. The absolutePath is an input parameter of that function.

 Ah, I interpreted "absolute" to mean "with all symlinks expanded", but of
course it just means "starts with /".

> 
>>
>>> ++            std::string path;
>>
>>  This doesn't say much. How about resolvedPath? Because basically you're
>> resolving the path relative to $ORIGIN and rootDir.
> 
> It's just a helper variable used for different things.
> 
>>
>>> ++
>>> ++            /* Figure out if we should keep or discard the path; there are several
>>> ++               cases to handled:
>>> ++               "dirName" starts with "$ORIGIN":
>>> ++                   The original build-system already took care of setting a relative
>>> ++                   RPATH, resolve it and test if it is worthwhile to keep it.
>>> ++               "dirName" start with "rootDir":
>>> ++                   The original build-system added some absolute RPATH (absolute on
>>> ++                   the build machine). While this is wrong, it can still be fixed; so
>>> ++                   test if it is worthwhile to keep it.
>>> ++               "rootDir"/"dirName" exists:
>>> ++                    The original build-system already took care of setting an absolute
>>> ++                    RPATH (absolute in the final rootfs), resolve it and test if it is
>>> ++                    worthwhile to keep it;
>>> ++                "dirName" points somewhere else:
>>> ++                    (can be anywhere: build trees, staging tree, host location,
>>> ++                    non-existing location, etc.). Just discard such a path. */
>>> ++            if (!dirName.compare(0, 7, "$ORIGIN")) {
>>> ++                path = fileDir + dirName.substr(7);
>>> ++                if (!absolutePathExists(path, canonicalPath)) {
>>> ++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
>>> ++                    continue;
>>> ++                }
>>> ++            } else if (!dirName.compare(0, rootDir.length(), rootDir)) {
>>> ++                if (!absolutePathExists(dirName, canonicalPath)) {
>>> ++                    debug("removing directory '%s' from RPATH because it doesn't exist\n", dirName.c_str());
>>> ++                    continue;
>>> ++                }
>>> ++            } else {
>>> ++                path = rootDir + dirName;
>>> ++                if (!absolutePathExists(path, canonicalPath)) {
>>> ++                    debug("removing directory '%s' from RPATH because it's not under the root directory\n",
>>> ++                          dirName.c_str());
>>> ++                    continue;
>>> ++                }
>>> ++            }
>>
>>  This bit could be refactored a little, where you assign path = ... in each
>> branch of the condition, and check absolutePathExists afterwards.
> 
> It makes the code more complex and the reason for the reject needs then
> to be handled by a separate variable.

 Fair enough. But then make the path variable local to the contexts that need it
(which solves my undescriptive name comment as well).

[snip]
>>  Looking at the whole of this functionality, it seems to me that it makes more
>> sense to completely separate the rpMakeRelative functionality from the rpShrink
>> functionality. You would be allowed to combine the --make-rpath-relative option
>> with the --shrink-rpath option.
> 
> rpMakeRelative *is* separated from the rShrinkRpath case here:
> 
>     if (shrinkRPath)
>         elfFile.modifyRPath(elfFile.rpShrink, allowedRpathPrefixes, "", modifyFlags, "");
>     else if (removeRPath)
>         elfFile.modifyRPath(elfFile.rpRemove, {}, "", modifyFlags, "");
>     else if (setRPath)
>         elfFile.modifyRPath(elfFile.rpSet, {}, "", modifyFlags, newRPath);
>     else if (makeRPathRelative)
>         elfFile.modifyRPath(elfFile.rpMakeRelative, {}, rootDir, modifyFlags, "");
> 
> But maybe I have missed something.

 With "separated", I meant a "separate pass", like rpPrint, that can be combined
with one of the other passes. So first do rpPrint, then do rpMakeRelative, then
do one of rpShrink, rpRemove or rpSet.


>>  So something like the following sequence of changes (each a separate patch of
>> course):
>>
>> 1. Extend the rpShrink functionality to also remove paths that don't exist
>> (including relative paths). This is something that could be considered a fix of
>> the current shrink functionality.
> 
> You mean pathes not within within a specified rootfs tree?

 In this stage there is no specified rootfs tree yet. So for our use case this
would indeed be wrong, because (without roots tree specification) the correct
absolute rpaths will not exist on the host. But this will be fixed in step 4.

 However, looking a second time, this is in fact already done in the rpShrink
step, because any directory which doesn't contain a NEEDED library is removed. A
non-existent directory *certainly* doesn't contain a NEEDED library.


>> 2. Extend the rpShrink functionality with removal of standard search paths. This
>> would probably be an extra flag similar to --allowed-rpath-prefixes. Actually,
>> I'd not even speak of "standard search paths", instead require the user to pass
>> a list of paths to remove, with an argument e.g. --remove-rpaths.

 For clarity: this is the forbiddenRpaths that I talked about before.

>>
>> 3. Add an option which *only* does conversion to relative paths, prior to the
>> shrink step.
>>
>>  For the conversion to relative paths, you pass the rootDir. Strictly speaking,
>> this is not needed for conversion to relative paths; you could have a separate
>> step that verifies that the relative path doesn't go out of the rootDir. Still,
>> we also have to deal with the case where the cross-compilation correctly used an
>> absolute path relative to rootDir rather than a full absolute path including the
>> build directory. So this is probably more elegant.
> 
> Yes, "rootDir"/"dirName" exists. But to check if the path is OK we need to extend
> it to an absolute path first.
> 
> The question is if the single steps are useful for other purposes as well or if we
> need to apply them all together anyway... and just screw-up/misuse the
> "--shrink-rpath" case.
> 
>>  I realize that what I'm suggesting here is a big change, and I'm not even sure
>> that this approach would work. So it's completely optional.
> 
> See above. Let's wait and see what the patchelf maintainers think?

 OK.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
