From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Aug 2019 00:36:36 +0200
Subject: [Buildroot] [git commit branch/next] package/util-linux: build
 programs and libraries in separate packages
In-Reply-To: <CAJ4jsadkR7N7cV5LY8UoqcaDKxcMNFXPdD_ry18KmBy5vD9NhA@mail.gmail.com>
References: <20190821213725.87BE28428E@busybox.osuosl.org>
 <CAJ4jsaf1JwSsi_frDxm_sJt28tP1UJ7xJ-s0CKWRFS3J9w+DNg@mail.gmail.com>
 <6d2913d1-485e-8d6c-6d74-ee8af038871b@mind.be>
 <CAJ4jsadkR7N7cV5LY8UoqcaDKxcMNFXPdD_ry18KmBy5vD9NhA@mail.gmail.com>
Message-ID: <d21d9128-8fa5-88da-9b95-b87f770aa18b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/08/2019 00:25, Carlos Santos wrote:
> On Thu, Aug 22, 2019 at 8:47 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>>
>> On 22/08/2019 12:57, Carlos Santos wrote:
>>> Arnout,
>>>
>>> On Wed, Aug 21, 2019 at 6:41 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>
>>>> commit: https://git.buildroot.net/buildroot/commit/?id=335c77b667c68975b65edd0ac0d6ec214a9cb1c6
>>>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>>>>
>>>> The findmount and lsblk utilities need udev to work correctly but cannot
>>>> be built with udev support because the packages providing libudev (eudev
>>>> and systemd) depend on util-linux, creating a chicken-egg problem. Solve
>>>> it by means of the following changes:
>>>
>>> Thank you for taking care of this. I have been very busy these days
>>> and was unable to pay attention to Buildroot.
>>
>>  Argh, no, I *didn't* take care of it! This was pushed accidentally...
>>
>>  Apparently my script that should warn me about such a situation doesn't work
>> that well :-(.
>>
>>
>>  Peter, Thomas, how should we handle this? The patch is OK as is (though TBH I
>> didn't test it that carefully), however I think there is a better way that needs
>> only a single additional package instead of two.
>>
>>  So we can either revert and re-apply later, or we can keep it as is and fix it
>> up. In the latter case, we have to do the fix relatively quickly, because the
>> util-linux-programs package would be removed again...
>>
>>  Maybe I should by the bullet and do some actual Buildroot development this
>> evening :-)
>>
>>  Regards,
>>  Arnout
> 
> It's on the next branch only. Can't you simpli skip the commit when
> you rebase on master after releasing Buildroot 2019.08?

 It's not rebased on master, it's merged. So no.

 I've reverted now, because it still introduces a circular dependency:

systemd -> polkit -> libglib2 -> util-linux -> systemd

(if SYSEMD_POLKIT is enabled, obviously)

 libglib2 requires libmount only, so it can probably be avoided by having
libglib2 depend on util-linux-minimal instead.

 I'm to tired to continue working on this now, therefore I reverted.

 Let me know if you're going to pick it up again, since I have something
half-finished that I could send to you.

 Regards,
 Arnout
