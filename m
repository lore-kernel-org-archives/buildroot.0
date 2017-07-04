From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 4 Jul 2017 13:44:26 +0200
Subject: [Buildroot] [RFC PATCH v5 00/11] Make the SDK relocatable
In-Reply-To: <05809006-f075-68b3-d64d-3c0dd3e5f2b7@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <d20f9390-20ae-7021-1005-4afe8daeea7f@mind.be>
 <32b47557-046c-424f-9d70-6b67a741cfc7@grandegger.com>
 <05809006-f075-68b3-d64d-3c0dd3e5f2b7@mind.be>
Message-ID: <e5169231-ac6f-bd54-effc-af2087dea783@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 04.07.2017 um 13:22 schrieb Arnout Vandecappelle:
>   Hi Wolfgang,
> 
> On 04-07-17 09:17, Wolfgang Grandegger wrote:
>> Hello Arnout,
>>
>> Am 04.07.2017 um 00:50 schrieb Arnout Vandecappelle:
>>>    Hi Wolfgang,
>>>
>>>    Again thank you very much for sustaining the work on this series!
>>>
>>> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>>>> Hello,
>>>>
>>>> this is v5 of my patch series to make the buildroot SDK (HOST_DIR)
>>>> relocatable. It sanitizes the RPATH of all ELF files in the "target",
>>>> "staging" and "host" tree using "patchelf --make-rpath-relative". I
>>>> have started the mainlining process to implement "--make-rpath-relative"
>>>> using GitHub pull request [1]... till now, no answer!
>>>>
>>>> In contrast to v4, this series now does RPATH sanitation per package
>>>> after package installation into the host, staging or target tree
>>>> using GLOBAL_INSTRUMENTATION_HOOKS, similar to "check-bin-arch" or
>>>> "check-host-rpath". This is a first hack to demonstrate feasibility.
>>>> The scripts in "pkg-generic.mk" needs some more polish to be more
>>>> efficient and elegant. See also "Changes since v4" below.
>>>
>>>    Samuel and I reviewed the entire series now. It's getting closer but I expect a
>>> v7 will still be needed even after you send v6. I've marked these as Changes
>>> Requested in patchwork.
>>
>> Great. Just wait for my next series as it already contains a lot of changes
>> (mainly to pkg-generic.mk and fix-rpath).
> 
>   I had a big discussion with the others here at the BR Summer Camp, and they
> don't agree that the current approach is the best one :-(
> 
>   The argument as always is simplicity. Doing things in an instrumentation hook
> is making it more complicated, and more difficult to understand what is going
> on. It is cleaner and more in-line with how we currently do things to do the
> sanitization at the end of the build.
> 
>   The idea is that there would be an explicit 'make sdk' target that builds and
> sanitizes the host (and of course installs the relocation script). There is no
> sanitization at all if you don't call this 'make sdk'. Indeed, we currently
> don't have it and things work fine as long as you stay within your build tree.

"make sdk", sounds good.

>   So basically it means reverting to v4 of the fix-rpath script. It would be
> called three times:
> - from target-finalize to sanitize the target;
> - from sdk to sanitize the host;
> - from sdk to sanitize the staging.
> 
>   Oh, also we decided that the sanitization for staging should be the same as for
> target, i.e. make it relative to the staging root. Indeed, the
> executables/libraries in there should never be executed, unless they are copied
> to the target tree. When copied, their location relative to the staging root
> should remain the same, so doing the same sanitization as for target should work.

OK, you mean not using $ORIGIN.

>   I understand that it's annoying to be sent in the wrong direction like this,
> and I hope we are not discouraging you. If you already have some patches to
> generate the file lists, feel free to post them anyway since they may be useful
> for other purposes - but then preferably separate from this series.

Well, after trying a few more things along the per package and step 
approach, I came to the same conclusion. It got more and more complex 
and slow (see my other mail).

Wolfgang.
