From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 20 Dec 2013 15:36:56 +0100
Subject: [Buildroot] [PATCH v10 0/8] Add support for top-level parallel
	make
In-Reply-To: <52B32DF1.2010702@mind.be>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <52B32DF1.2010702@mind.be>
Message-ID: <CAHkwnC9J_4GOPSLtP2KWLD9YipFV+hVadXc_RrkjvNoYQ2oJew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 19, 2013 at 6:33 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 18/12/13 11:36, Fabio Porcedda wrote:
>>
>> this is a patch set for adding support for top-level parallel make in
>> buildroot, the common problem scattered in buildroot's top-level
>> makefiles is that in the rules it relies on the order of evaluation of
>> the prerequisites, to be able to use top-level parallel make instead
>> of reling on the left to right ordering of evaluation of the
>> prerequisites we must add an explicit rule to describe the
>> dependencies.
>>
>> With this patch set the top-level parallel make seems to works fine,
>> example:
>>         make clean
>>         make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN` + 1))
>
>
>  Would it be possible to disable BR2_JLEVEL automatically when -j appears on
> the command line?

It would be great but i don't know i way to check if the -j options is
being used.

>
>>
>> Before to try it remeber to remove the ".NOTPARALLEL" line.
>>
>> On my quad core system the building time for qemu_x86_defconfig
>> is 14m versus 11m and with ccache enabled 7m vs 5m.
>
>
>  These are not very relevant benchmarks because there's not a lot that can
> be done in parallel there. It would be much more interesting with an
> allpackageyesconfig (which you'll have to modify by hand BTW to exclude some
> packages that don't build...).

You are right, i've already tried to do that but disabling all the
falling packages takes time,
i will try do that again.

It would be best if at least in the default configuration all the
packages build fine.
The autobuild does not try to test allpackageyesconfig, does it?

Best regards
-- 
Fabio Porcedda
