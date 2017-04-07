From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 7 Apr 2017 10:16:31 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: fix handling of
	ld.so
In-Reply-To: <CAAXf6LW2Oo8VPoiKJ5LfCRgj37_uTjqu6jbN+_c+Ts3Fp9k8cA@mail.gmail.com>
References: <20170406202505.17605-1-patrickdepinguin@gmail.com>
 <20170406223422.388475a5@free-electrons.com>
 <CAAXf6LW2Oo8VPoiKJ5LfCRgj37_uTjqu6jbN+_c+Ts3Fp9k8cA@mail.gmail.com>
Message-ID: <CAAXf6LXp_Y4A+sNygeLMwqv3CiOwbeEAFxcRa0vwY-8a=_REVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 6, 2017 10:46 PM, "Thomas De Schampheleire" <
patrickdepinguin@gmail.com> wrote:

On Thu, Apr 6, 2017 at 10:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu,  6 Apr 2017 22:25:05 +0200, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>
>> Commit ba6bac138331cea449592f877e558f84176a70bf made a change in copying
of
>> the dynamic loader, with the goal of reducing toolchain-specific fixups.
>> Any ld*.so file found in the toolchain's lib directory would be copied to
>> the staging/lib directory.
>>
>> For the toolchains that previously needed fixup, this new behavior is
fine.
>> The reason they needed fixup was that the normal copy action did not
include
>> any dynamic loader.
>>
>> However, for certain other toolchains this new behavior actually breaks
>> things: regardless of ARCH_LIB_DIR, which may be lib64 instead of lib,
the
>> dynamic loader from lib is copied _over_ any previously correct dynamic
>> loader.
>>
>> This has been witnessed with the CodeSourcery x86_64 and
>> CodeSourcery MIPS64 toolchains. In both cases, a 32-bit dynamic loader
was
>> copied to staging/lib, while a 64-bit version was expected.
>>
>> Fix the problem by only performing this explicit dynamic loader copy if
no
>> dynamic loader is found in staging/lib.
>>
>> Fixes http://autobuild.buildroot.net/results/8bf/
8bffe54032aad9cc710a22411ef3bff4a2c93e55/
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com
>
>> ---
>>  toolchain/helpers.mk | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> Applied to master, thanks. It's adding more complexity to the existing
> complexity, but oh well :/ Thanks for fixing it so quickly!

If toolchain creators could just all do it the same way, then we
wouldn't have all this complexity :-X


Btw, in the x86_64 case, the problem was detected very early by
check-bin-arch, but in the mips case apparently not. I have not been able
to look into the code and won't be able to the coming days, but am I right
that this is the type of thing that check-bin-arch should find?

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170407/204b025a/attachment.html>
