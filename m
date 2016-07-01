From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 1 Jul 2016 09:59:10 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <1466753076.30418.15.camel@synopsys.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <4209f432-0fbd-8d44-7194-c99829f66e2e@smile.fr>
 <1466574249.3622.15.camel@synopsys.com>
 <1466753076.30418.15.camel@synopsys.com>
Message-ID: <367dc31d-7d4c-cdf7-221a-158a6c2c4cfb@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vlad,

Le 24/06/2016 ? 09:24, Vlad Zakharov a ?crit :
> Hello, 
> 
> On Wed, 2016-06-22 at 05:45 +0000, Alexey Brodkin wrote:
>> Hi Romain,
>>
>> On Sat, 2016-06-18 at 16:07 +0200, Romain Naour wrote:
>>>
>>> Hi Thomas, Alexey, Vlad, All,
>>>
>>> Le 15/06/2016 ? 22:06, Thomas Petazzoni a ?crit :
>>>>
>>>>
>>>> Hello,
>>>>
>>>> The previous patchwork cleanup period being over, it's time to start
>>>> the second period, with 10 other patches. We're on June 15th, so I'll
>>>> give people until June 30th to react on the following patches. If
>>>> there's no reaction, like no interest from either the original
>>>> submitter nor any other Buildroot developer, the patch will be marked
>>>> Rejected on June 30th.
>>>>
>>>> If you are in To: of this e-mail, then one or several of the patches
>>>> below have been authored by you, so you should be interested :-)
>>>>
>>>> Thanks,
>>>>
>>>> Thomas
>>>>
>>>>  5. Fix for the makeinfo / missing issue, proposal from Romain
>>>>     http://patchwork.ozlabs.org/patch/595041/
>>>>     http://patchwork.ozlabs.org/patch/595042/
>>>>     http://patchwork.ozlabs.org/patch/595043/
>>>>
>>>>     We need to take a decision on this one. The problem also occurs for
>>>>     gdb and binutils on ARC, for which we've added a custom hack
>>>>     recently.
>>>>
>>>>     I tried to play with timestamps by touch'ing the .info files before
>>>>     the build, it worked with one of gdb or binutils, but failed for
>>>>     the other.
>>>>
>>>>     So either we take Romain's approach, or we bite the bullet and add
>>>>     a host-makeinfo package on which we depend when gdb/binutils are
>>>>     fetched from Git.
>>>>
>>> IHMO the real problem is that binutils/gdb doesn't support --disable-docs
>>> option. When present on the command line, this option must completely disable
>>> the documentation (man, info, pdf etc) and let the build continue.
>>>
>>> It seems that this issue was already discussed back in 2007 [1].
>>> Last year I submitted a patch upstream to do that but it was not complete and
>>> not tested due to autoconf version mismatch [2].
>>>
>>> If we want to autoreconf binutils/gdb in Buildroot we must downgrade autoconf to
>>> 2.64 and automake to 1.12.6.
>>>
>>> Alexey, Vlad, I would suggest to rework your patch [3] and add --disable-docs
>>> option instead of testing missing 127 return value.
>>> If you succeed, we can reject my proposal from patchwork :)
>> Right, that's what we're looking at now.
>> Stay tuned and patch(es) will follow :)
>>
>> -Alexey
> 
> I looked around adding --disable-docs option and faced some difficulties.
> Configuration process is rather difficult in binutils.
>  * "configure" scripts are generated for each package from corresponding template file.
>  * "configure" script is generated from "configure.ac", 
>  * "configure" script generates Makefiles from "Makefile.in" files, also it runs "configure" scripts in sub-directories, etc.
>  * Build is recursive. 
>  * Doc targets for some packages are added to separate directory, for other the are not.
> 
> Also I don't have required versions of autoconf (v. 2.64) and automake (v.1.11.6).
> It is required to use particular versions to avoid introducing subtle bugs in configure and/or Makefile.in.
> For example:
> https://sourceware.org/ml/binutils/2013-04/msg00210.html

You can build the required versions of autoconf and automake using Buildroot, if
you want to try with [1]...

> 
> So implementing this option doesn't seem to be a low-hanging fruit after all.
> 
> Returning to the problem. Real issue is that build fails when "makeinfo" is missing on build host.
> So a nice and much easier idea is to add "makeinfo" package and make binutils and gdb dependent on the "host-makeinfo" package.

Well, ok lets re-introduce "host-texinfo" package when binutils/gdb are build
from a git repository. Then you can revert some patches for binutils [2] and gdb
[3] [4].

Thanks,

Best regards,
Romain

[1] https://github.com/RomainNaour/buildroot/tree/autoconf-2.64
[2]
https://git.busybox.net/buildroot/commit/?id=f3e99991591c6356df8d55a794ed64fd20154654
[3]
https://git.busybox.net/buildroot/commit/?id=1180bafd8e1de2b12db3c7c235b128c9e48d4abb
[4]
https://git.busybox.net/buildroot/commit/?id=3aecfbd03dd2a8d49c97f1e68df42b077dbbd396
> 
> -- 
> Best regards,
> Vlad Zakharov <vzakhar@synopsys.com>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
