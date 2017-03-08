From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 8 Mar 2017 10:25:15 +0100
Subject: [Buildroot] [RFC PATCH 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <7524a67f-d19d-1023-262c-c0b7793e6066@mind.be>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-3-git-send-email-wg@grandegger.com>
 <20170303154853.4eb15819@free-electrons.com>
 <c8a4d85e-ff1a-44ab-832b-bd4eff235a00@grandegger.com>
 <8122b244-b97f-e0fd-6d15-a33b8f44af25@grandegger.com>
 <30db8390-0a94-5449-0c5e-90263576be98@mind.be>
 <817f4be5-9f4c-927d-f611-8b112dfd0097@grandegger.com>
 <7524a67f-d19d-1023-262c-c0b7793e6066@mind.be>
Message-ID: <0825a8e8-94d9-c6dd-3b22-555c02280f35@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.03.2017 um 18:40 schrieb Arnout Vandecappelle:
>
>
> On 07-03-17 10:13, Wolfgang Grandegger wrote:
>> Am 07.03.2017 um 00:49 schrieb Arnout Vandecappelle:
>>>
>>>
>>> On 06-03-17 10:07, Wolfgang Grandegger wrote:
>>>> Hello,
>>>>
> [snip]
>>>>  >>>   Sanitizing RPATH in target and staging directory
>>>>  time find /opt/bdo/x86_host/target -type f -print0 | xargs -0 -I {} sh -c \
>>>> 	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
>>>
>>>  You can actually include this in the find command itself, it's almost twice as
>>> fast:
>>>
>>> find /opt/bdo/x86_host/target -type f \
>>> 	-exec patchelf --print-rpath '{}' ';' \
>>> 	-exec  support/scripts/fix-rpath '{}' ';'
>>
>> OK, it' two times faster, indeed
>
>  Actually with such a construct, and assuming we don't bother with restoring the
> permissions, a helper shell script isn't needed because we can just chain the
> chmod and patchelf calls with further -exec calls. Of course with -exec, xargs
> -P is not possible so you have to evaluate a little what is the best approach.

"-P" is very effective... but that's fine tuning.

>>>> 	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/target \
>>>> 	--no-standard-lib-dirs {}; fi"
>>>>
>>>>   real	0m9.644s
>>>
>>>  Can you quantify which bit is taking the time here? Is it the find itself, or
>>> the patchelf --print-rpath, or the final patchelf?
>>
>> The initial ELF file testing takes most of the time. The processing of the ELF
>> file itself doesn't matter much:
>>
>>   $ find target -type f | wc -l
>>   3902
>>   $ find host/usr/x86_64-buildroot-linux-gnu/sysroot -type f | wc -l
>>   21413
>>   $ find host -path host/usr/x86_64-buildroot-linux-gnu/sysroot -prune -o -type f | wc -l
>>   10861
>
>  What kind of config is this? Many packages? Or just an internal toolchain?

It's a config including QT5... also doubling the build time .

$ find sysroot/usr/lib/qt/ -type f| wc -l
3355
$ find sysroot/usr/include/qt5/ -type f| wc -l
4168

>>>  Also, how does the time compare to the rest of the finalize step and creating a
>>> tarball?
>>
>> The rest of "target-finalize" takes half a second and the tar:
>>
>> $ time tar cjf /tmp/target.tar.bz2 target
>> real	0m21.742s
>>
>> But it depends on the compression, of course.
>>
>>>>   user	0m0.032s
>>>>   sys	0m0.360s
>>>>
>>>>   time find /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot -type f -print0 | xargs -0 -I {} sh -c \
>>>
>>>  We could optimise this a little by eliminating directories that certainly don't
>>> contain interesting files, like /usr/include. Or alternatively, explicitly
>>> select only "\( -path lib -o -path bin -o -path sbin \)".
>>
>>
>>   $ find host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/ -type f | wc -l
>>   6946
>>   $ find host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/share/ -type f | wc -l
>>   9273
>>
>> But there is one ELF file in ".../usr/share".
>
>  Ah yes, I also found one:
> /usr/share/bash-completion/helpers/gst-completion-helper-1.0
>
>  So in that case we can't skip share. We certainly can skip include, I think,
> though the benefit is perhaps limited.
>
>  Of course, if the entire staging can be skipped it's even easier :-)

Yep.

>>>  However, now I think of it: why do we do this for staging? Binaries in staging
>>> are never executed... Is it just to eliminate all references to HOST_DIR from
>>> the binaries?
>>
>> Good question! So far I followed Samuels proposal (now on CC).
>>
>>>> 	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
>>>> 	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot \
>>>> 	--no-standard-lib-dirs {}; fi"
>>>>
>>>>   real	0m46.433s
>>>>   user	0m0.240s
>>>>   sys	0m1.980s
>>>>
>>>>   >>>   Rendering the SDK relocatable
>>>>   cp /opt/bdo/x86_host/host/usr/bin/patchelf /opt/bdo/x86_host/host/usr/bin/patchelf.__copy__
>>>
>>>  Why do you need this? To make sure patchelf itself is processed as well? Does
>>> it contain an invalid rpath? If yes, isn't it easier to patch the patchelf build
>>> system so it uses $ORIGIN already?
>>
>> We cannot update the "patchelf" binary while it's in use.
>
>  Yes, but that's avoided with the -name patchelf -prune bit.

Yep.

>> There no
>> need to touch it if it already uses a proper rpath, of course.
>> Currently it uses:
>>
>>   $ readelf -d host/usr/bin/patchelf
>>   ...
>>   0x0000000000000001 (NEEDED)             Gemeinsame Bibliothek [libstdc++.so.6]
>>   0x0000000000000001 (NEEDED)             Gemeinsame Bibliothek [libgcc_s.so.1]
>>   0x0000000000000001 (NEEDED)             Gemeinsame Bibliothek [libc.so.6]
>>   0x000000000000000f (RPATH)              Bibliothek rpath: [/opt/bdo/dcu_host/host/usr/lib]
>>
>> "patchelf --make-relative" will drop the rpath above, because the first
>> two needed libs are not in the listed rpath but in "host/usr/x86_64-buildroot-linux-gnu/lib64".
>
>  That's the staging dir - it should certainly NOT use anything from there.

No, the staging dir is "host/usr/x86_64-buildroot-linux-gnu/sysroot/".

>> Running patchelf with "LD_DEBUG" tells me that it will take the libraries
>> from the host (/usr/lib). Just wondering if that's correct!?
>
>  Yes it's correct, those 3 libraries are standard host libraries that can be
> found in the standard paths.

Hm, what are the libraries in 
"host/usr/x86_64-buildroot-linux-gnu/lib64" then good for? They work if 
I use "LD_LIBRARY_PATH" to run the executable.

>  So I've checked where this rpath comes from. Turns out it is added by
> Buildroot, through HOST_LDFLAGS. This is in fact needed to make sure that an
> executable that uses libraries from HOST_DIR works - see commit
> 4fdecac9d692b8d6f071ba6ad938b6ad68b675fd. So we can either:

Shouldn't "host/usr/x86_64-buildroot-linux-gnu/lib64" not treated in a 
similar way? Just wondering! I have attached the debug output of 
patchelf for the host tree.

> - keep this __copy__ manipulation in the patchelf step; or
> - override HOST_LDFLAGS in patchelf.mk.
>
>  I'm cool either way, so since you already have this workaround, just keep it.
> Perhaps a comment above it explaining why would be useful though.

OK.

>>>>   time find /opt/bdo/x86_host/host -path /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot -prune -o \
>>>> 	-path /opt/bdo/x86_host/host/usr/bin/patchelf -prune -o -type f -print0 | xargs -0 -I {} sh -c \
>>>> 	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
>>>> 	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/host {}; \
>>>> 	fi"
>>>>   mv /opt/bdo/dcu_host/host/usr/bin/patchelf.__copy__ /opt/bdo/dcu_host/host/usr/bin/patchelf
>>>>
>>>>   real	0m23.154s
>>>>   user	0m0.144s
>>>>   sys	0m1.124s
>>>>
>>>>
>>>> Using "file" to test if it's an ELF files is much slower. Using
>>>> "patchelf --print-rpath {} >/dev/null 2>&1" is much smarter and allows
>>>> to run the path sanitation without ignoring errors.
>>>
>>>  readelf -h is still a little faster, but it also matches files without rpath.
>>
>> Yes, 38 vs. 44 seconds.
>>
>>> To just check if it's an ELF file, it's actually enough to do "cmp -n 4" with
>>> another ELF file (e.g. patchelf itself). That gives even more false positives
>>> (e.g. object files). So if one of those is chosen, a further check with patchelf
>>> --print-rpath is still needed, or errors have to be ignored.
>>
>> Yep.
>
>  To be evaluated if the speedup from using cmp is worth the false positives.

I wrote a little C program just checking the first 4 bytes of the file. 
The saving is 19 vs. 22 seconds. With "readelf" I have similar results. 
patchelf is written in C++... maybe that's the reason why it's slower.

>>>> Because some ELF files are not writeable, we need a chmod first.
>>>
>>>  Shouldn't we restore the original permissions?
>>
>> Maybe! There are actually two libraries not being writeable. Can't tell if
>> that's by purpose.
>
>  Perhaps as an easier way to restore permissions, we could do it in patchelf
> itself: add something like --force that does a chmod if needed, similar to how
> some editors do it.

Good idea!

>  There are actually quite a few packages that install library read-only, e.g.
> Python and openssl. I guess it is on purpose, but I'm not sure if it is important.

I think restoring the permission is the correct solution.

Wolfgang.
