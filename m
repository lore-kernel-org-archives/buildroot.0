From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 7 Mar 2017 10:13:47 +0100
Subject: [Buildroot] [RFC PATCH 2/9] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <30db8390-0a94-5449-0c5e-90263576be98@mind.be>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
 <1488550733-3956-3-git-send-email-wg@grandegger.com>
 <20170303154853.4eb15819@free-electrons.com>
 <c8a4d85e-ff1a-44ab-832b-bd4eff235a00@grandegger.com>
 <8122b244-b97f-e0fd-6d15-a33b8f44af25@grandegger.com>
 <30db8390-0a94-5449-0c5e-90263576be98@mind.be>
Message-ID: <817f4be5-9f4c-927d-f611-8b112dfd0097@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 07.03.2017 um 00:49 schrieb Arnout Vandecappelle:
> 
> 
> On 06-03-17 10:07, Wolfgang Grandegger wrote:
>> Hello,
>>
>> Am 03.03.2017 um 17:39 schrieb Wolfgang Grandegger:
>>> Hello,
>>>
>>> Am 03.03.2017 um 15:48 schrieb Thomas Petazzoni:
>>>> Hello,
>>>>
>>>> On Fri,  3 Mar 2017 15:18:46 +0100, Wolfgang Grandegger wrote:
>>>>> From: Samuel Martin <s.martin49@gmail.com>
>>>>>
>>>>> This commit introduces a fix-rpath script able to scan a tree,
>>>>> detect ELF files, check their RPATH and fix it in a proper way.
>>>>> The RPATH fixup is done by the patchelf utility using the option
>>>>> "--make-rpath-relative".
>>>>>
>>>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>>>> ---
>>>>>  support/scripts/fix-rpath | 106
>>>>> ++++++++++++++++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 106 insertions(+)
>>>>>  create mode 100755 support/scripts/fix-rpath
>>>>
>>>> Now that patchelf is much smarter, I am wondering if we still really
>>>> need a utility script just to call patchelf. Have you tried bringing
>>>> this logic into the make logic?
>>>
>>> Well, I think three magic "find" oneliners could do the job. I will try
>>> and see.
>>
>> Here are my current oneliners in the Makefile. It mainly shows what needs
>> to be done. 
> 
>  I think they're sufficiently complicated to warrant offloading to a script
> after all. Especially since you need the same structure three times, so it would
> have to be factored into a macro, which makes the makefile more complicated.
> Alternatively, you could keep the find command in make, and use -exec
> support/scripts/fix-rpath '{}' ';'  - this avoids all the tricky xargs stuff.

+1

>> Unfortunately, the scanning for ELF files may take rather
>> long:
>>
>>  >>>   Sanitizing RPATH in target and staging directory
>>  time find /opt/bdo/x86_host/target -type f -print0 | xargs -0 -I {} sh -c \
>> 	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
> 
>  You can actually include this in the find command itself, it's almost twice as
> fast:
> 
> find /opt/bdo/x86_host/target -type f \
> 	-exec patchelf --print-rpath '{}' ';' \
> 	-exec  support/scripts/fix-rpath '{}' ';'

OK, it' two times faster, indeed

>> 	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/target \
>> 	--no-standard-lib-dirs {}; fi"
>>
>>   real	0m9.644s
> 
>  Can you quantify which bit is taking the time here? Is it the find itself, or
> the patchelf --print-rpath, or the final patchelf?

The initial ELF file testing takes most of the time. The processing of the ELF
file itself doesn't matter much:

  $ find target -type f | wc -l
  3902
  $ find host/usr/x86_64-buildroot-linux-gnu/sysroot -type f | wc -l
  21413
  $ find host -path host/usr/x86_64-buildroot-linux-gnu/sysroot -prune -o -type f | wc -l
  10861
 
>  Also, how does the time compare to the rest of the finalize step and creating a
> tarball?

The rest of "target-finalize" takes half a second and the tar:

$ time tar cjf /tmp/target.tar.bz2 target
real	0m21.742s

But it depends on the compression, of course.

>>   user	0m0.032s
>>   sys	0m0.360s
>>
>>   time find /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot -type f -print0 | xargs -0 -I {} sh -c \
> 
>  We could optimise this a little by eliminating directories that certainly don't
> contain interesting files, like /usr/include. Or alternatively, explicitly
> select only "\( -path lib -o -path bin -o -path sbin \)".


  $ find host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/include/ -type f | wc -l
  6946
  $ find host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/share/ -type f | wc -l
  9273

But there is one ELF file in ".../usr/share".

>  However, now I think of it: why do we do this for staging? Binaries in staging
> are never executed... Is it just to eliminate all references to HOST_DIR from
> the binaries?

Good question! So far I followed Samuels proposal (now on CC).

>> 	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
>> 	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot \
>> 	--no-standard-lib-dirs {}; fi"
>>
>>   real	0m46.433s
>>   user	0m0.240s
>>   sys	0m1.980s
>>
>>   >>>   Rendering the SDK relocatable
>>   cp /opt/bdo/x86_host/host/usr/bin/patchelf /opt/bdo/x86_host/host/usr/bin/patchelf.__copy__
> 
>  Why do you need this? To make sure patchelf itself is processed as well? Does
> it contain an invalid rpath? If yes, isn't it easier to patch the patchelf build
> system so it uses $ORIGIN already?

We cannot update the "patchelf" binary while it's in use. There no
need to touch it if it already uses a proper rpath, of course.
Currently it uses:

  $ readelf -d host/usr/bin/patchelf
  ...
  0x0000000000000001 (NEEDED)             Gemeinsame Bibliothek [libstdc++.so.6]
  0x0000000000000001 (NEEDED)             Gemeinsame Bibliothek [libgcc_s.so.1]
  0x0000000000000001 (NEEDED)             Gemeinsame Bibliothek [libc.so.6]
  0x000000000000000f (RPATH)              Bibliothek rpath: [/opt/bdo/dcu_host/host/usr/lib]

"patchelf --make-relative" will drop the rpath above, because the first
two needed libs are not in the listed rpath but in "host/usr/x86_64-buildroot-linux-gnu/lib64".
Running patchelf with "LD_DEBUG" tells me that it will take the libraries
from the host (/usr/lib). Just wondering if that's correct!?

> 
>>   time find /opt/bdo/x86_host/host -path /opt/bdo/x86_host/host/usr/x86_64-buildroot-linux-gnu/sysroot -prune -o \
>> 	-path /opt/bdo/x86_host/host/usr/bin/patchelf -prune -o -type f -print0 | xargs -0 -I {} sh -c \
>> 	"if patchelf --print-rpath {} >/dev/null 2>&1; then chmod +w {}; \
>> 	/opt/bdo/x86_host/host/usr/bin/patchelf --make-rpath-relative /opt/bdo/x86_host/host {}; \
>> 	fi"
>>   mv /opt/bdo/dcu_host/host/usr/bin/patchelf.__copy__ /opt/bdo/dcu_host/host/usr/bin/patchelf
>>
>>   real	0m23.154s
>>   user	0m0.144s
>>   sys	0m1.124s
>>
>>
>> Using "file" to test if it's an ELF files is much slower. Using
>> "patchelf --print-rpath {} >/dev/null 2>&1" is much smarter and allows
>> to run the path sanitation without ignoring errors.
> 
>  readelf -h is still a little faster, but it also matches files without rpath.

Yes, 38 vs. 44 seconds.

> To just check if it's an ELF file, it's actually enough to do "cmp -n 4" with
> another ELF file (e.g. patchelf itself). That gives even more false positives
> (e.g. object files). So if one of those is chosen, a further check with patchelf
> --print-rpath is still needed, or errors have to be ignored.

Yep.

>>
>> Because some ELF files are not writeable, we need a chmod first. 
> 
>  Shouldn't we restore the original permissions?

Maybe! There are actually two libraries not being writeable. Can't tell if
that's by purpose.

>> For the
>> host tree, we also need special handling for patchelf to work around the
>> "file in use" issue.
>>
>> "xargs" could be speedup using "-P NUM". Would that be an option?
> 
>  Yes, we could use PARALLEL_JOBS.

Using -P8 on my i7 quad-core laptop is almost 8 times faster.

Wolfgang.
