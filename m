From: Daniel Mack <daniel@zonque.org>
Date: Sat, 14 Jan 2017 20:13:43 +0100
Subject: [Buildroot] host-nodejs build error
In-Reply-To: <4af28c7c-8c20-f3f6-adb0-c9520f249af2@gmail.com>
References: <d3aef230-deff-d2e5-ac94-4d09e2d1f7d5@gmail.com>
 <94b39784-d710-99ac-f65c-41e4d26ed4fc@zonque.org>
 <4af28c7c-8c20-f3f6-adb0-c9520f249af2@gmail.com>
Message-ID: <c9c921dd-10be-6116-eabc-0c5aecb27ded@zonque.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 01/14/2017 07:47 PM, Zoltan Gyarmati wrote:
> On 01/14/2017 05:42 PM, Daniel Mack wrote:
>> On 01/14/2017 05:15 PM, Zoltan Gyarmati wrote:
>>> i'm trying to build nodejs (with the current Buildroot master), and when
>>> icu is enabled, the build of host-nodejs fails with:
>>>
>>> Did anybody see this issue before? My guess now is that adding
>>> '--with-intl=none' to the host-node config flags would solve this (as
>>> according to my current understanding, the i18n support not actually
>>> used in the host nodejs), but i still have run a test build...
>> I have the same issue, and fixed it in my local tree by dropping
>> --shared-zlib from package/nodejs/nodejs.mk. I didn't post a patch yet
>> because I don't really understand the root cause and I had no time yet
>> to investigate.
>>
>> [My rough guess was that this has to do with cyclic dependencies and the
>> linker picking up the objects in the wrong order. After all, the object
>> it complains about is present in the archive, and the removal of
>> --shared-zlib fixes the issue by accident. But I might be wrong.]
>>
>> Could you try if that helps your build as well?
> 
> indeed, removing  --shared-zlib fixes (or at least works around) the
> issue, but on the other hand with '--with-intl=none' the host-nodejs
> also builds properly.
> 
> Actually I think adding the '--with-intl=none' is a better solution (as
> it's explicitly targeting the issue and also saves some build time)
> unless we find a proof that the host-nodejs needs the i18n support.
> Could you please also test this on your build config?

Yes, confirmed. This is another way of making the build succeed.

Do you want to provide a patch for that?



Thanks,
Daniel
