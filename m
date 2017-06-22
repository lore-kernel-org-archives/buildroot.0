From: Mason <slash.tmp@free.fr>
Date: Thu, 22 Jun 2017 23:57:03 +0200
Subject: [Buildroot] Policy for upgrading toolchains in LTS version
In-Reply-To: <20170622192701.GC3054@scaer>
References: <232c0fde-c837-ccfd-949c-eeec82a24fdb@free.fr>
 <20170622192701.GC3054@scaer>
Message-ID: <443c0c3b-683b-935d-1b4e-c020a406bcc3@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/06/2017 21:27, Yann E. MORIN wrote:

> Mason, All,
> 
> On 2017-06-22 11:23 +0200, Mason spake thusly:
>
>> Providing an LTS version is an interesting idea.
>>
>> I was wondering about the policy for upgrading toolchains
>> in LTS versions (I use Linaro).
>>
>> Case in point: 2017.02.x branch is set up to use gcc-linaro-6.2.1-2016.11
>>
>> Since then, Linaro has released two bug-fix versions:
>>
>> https://releases.linaro.org/components/toolchain/binaries/6.1-2016.08/
>> https://releases.linaro.org/components/toolchain/binaries/6.2-2016.11/
>> https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/
>> https://releases.linaro.org/components/toolchain/binaries/6.3-2017.05/
>>
>> AFAIU, these releases are all on the same branch, i.e. they
>> keep the packages (mostly) stable:
>> gcc 6, glibc 2.23, newlib 2.4, binutils 2.27, gdb 7.12
>> NB: Apparently gdb got bumped from 7.11 to 7.12 in 2016.11
>> (IIUC, this is a cross-debugger, when using remote gdb.)
>>
>> For example, this bug seems likely to affect current BR LTS:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78253
>> (It was fixed in Linaro 2017.02)
>>
>> I think there is a case for upgrading the toolchain in the LTS
>> branch (while staying on the same Linaro branch of course.)
>>
>> What do you think?
> 
> I think that it all depends. ;-)
> 
> First, Peter is in charge of the LTS branch, so it's all about what he
> believes it is too intrusive or not...
> 
> Then, I have basically no knowledge of the Linaro toochains and their
> release criterions.

On freenode #linaro-tcwg, Ryan explained the Linaro toolchain
release process to me, which appears to be BR-LTS-compatible.

Toolchain releases are supported for 2 years.

First year in "stable" mode:
Bug fixes, and backports of non-invasive performance fixes for gcc.
One update per quarter.

Second year in "maintenance" mode:
Only bug fixes.
Updates when required (e.g. getaddrinfo vuln, or stack clash)

Individual components (gcc, glibc, newlib, binutils, gdb)
are updated within their respective stable branches, i.e.
kept at the same release (gdb is an exception).

So, for example, the 6.x release is in stable mode until
2017.08, and in maintenance mode until 2018.08
(Ryan pointed out that an OOB release would be done to
address stack clash.)

See also
https://wiki.linaro.org/WorkingGroups/ToolChain/FAQ#What_were.2Fare_the_versions_of_toolchain_released.3F

> If as you state they are only bug-fix releases, then we could indeed
> bump those toolchains, yes. It imho complies with the goal of an LTS.

I believe it does. I don't know exactly how gcc/glibc
plan to address "stack clash" but I think it's important
for BR-LTS to include these fixes.

> Note however that we so far never bumped the gcc version in the LTS
> branch, but we already had 6.3 at the time we cut the LTS. So it's
> difficult to say if we would bump it. Probably, I'd say...

Isn't this the first time BR did an LTS release?

Regards.
