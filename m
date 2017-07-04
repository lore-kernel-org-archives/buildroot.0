From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jul 2017 13:22:08 +0200
Subject: [Buildroot] [RFC PATCH v5 00/11] Make the SDK relocatable
In-Reply-To: <32b47557-046c-424f-9d70-6b67a741cfc7@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <d20f9390-20ae-7021-1005-4afe8daeea7f@mind.be>
 <32b47557-046c-424f-9d70-6b67a741cfc7@grandegger.com>
Message-ID: <05809006-f075-68b3-d64d-3c0dd3e5f2b7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Wolfgang,

On 04-07-17 09:17, Wolfgang Grandegger wrote:
> Hello Arnout,
> 
> Am 04.07.2017 um 00:50 schrieb Arnout Vandecappelle:
>>   Hi Wolfgang,
>>
>>   Again thank you very much for sustaining the work on this series!
>>
>> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>>> Hello,
>>>
>>> this is v5 of my patch series to make the buildroot SDK (HOST_DIR)
>>> relocatable. It sanitizes the RPATH of all ELF files in the "target",
>>> "staging" and "host" tree using "patchelf --make-rpath-relative". I
>>> have started the mainlining process to implement "--make-rpath-relative"
>>> using GitHub pull request [1]... till now, no answer!
>>>
>>> In contrast to v4, this series now does RPATH sanitation per package
>>> after package installation into the host, staging or target tree
>>> using GLOBAL_INSTRUMENTATION_HOOKS, similar to "check-bin-arch" or
>>> "check-host-rpath". This is a first hack to demonstrate feasibility.
>>> The scripts in "pkg-generic.mk" needs some more polish to be more
>>> efficient and elegant. See also "Changes since v4" below.
>>
>>   Samuel and I reviewed the entire series now. It's getting closer but I expect a
>> v7 will still be needed even after you send v6. I've marked these as Changes
>> Requested in patchwork.
> 
> Great. Just wait for my next series as it already contains a lot of changes
> (mainly to pkg-generic.mk and fix-rpath).

 I had a big discussion with the others here at the BR Summer Camp, and they
don't agree that the current approach is the best one :-(

 The argument as always is simplicity. Doing things in an instrumentation hook
is making it more complicated, and more difficult to understand what is going
on. It is cleaner and more in-line with how we currently do things to do the
sanitization at the end of the build.

 The idea is that there would be an explicit 'make sdk' target that builds and
sanitizes the host (and of course installs the relocation script). There is no
sanitization at all if you don't call this 'make sdk'. Indeed, we currently
don't have it and things work fine as long as you stay within your build tree.

 So basically it means reverting to v4 of the fix-rpath script. It would be
called three times:
- from target-finalize to sanitize the target;
- from sdk to sanitize the host;
- from sdk to sanitize the staging.

 Oh, also we decided that the sanitization for staging should be the same as for
target, i.e. make it relative to the staging root. Indeed, the
executables/libraries in there should never be executed, unless they are copied
to the target tree. When copied, their location relative to the staging root
should remain the same, so doing the same sanitization as for target should work.


 I understand that it's annoying to be sent in the wrong direction like this,
and I hope we are not discouraging you. If you already have some patches to
generate the file lists, feel free to post them anyway since they may be useful
for other purposes - but then preferably separate from this series.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
