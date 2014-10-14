From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 Oct 2014 14:18:40 +0200
Subject: [Buildroot] using BR2 variables to find a specific header file
In-Reply-To: <543D01E8.80401@green-communications.fr>
References: <543C0775.3090701@green-communications.fr>
 <CAHXCMMJ-Ke78qFEHjddfUtbinML-pwHWX58DfPU7+L3VZdF=1Q@mail.gmail.com>
 <543D01E8.80401@green-communications.fr>
Message-ID: <CAHXCMMJmEDLLzL6t8gqzvMBhtXu7WiD-eW-XJqMgP31SRT4EUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 14, 2014 at 12:58 PM, Sylvain Raybaud
<sylvain.raybaud@green-communications.fr> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Mike, Samuel, all,
>
> On 13/10/2014 21:42, Samuel Martin wrote:
>> Hi Sylvain,
>>
>> On Mon, Oct 13, 2014 at 7:10 PM, Sylvain Raybaud
>> <sylvain.raybaud@green-communications.fr> wrote:
> [...]
>>> During cross-compile these tests cannot be run therefore the
>>> package expects -DSTACK_DIRECTION=+/-1 to be passed to cmake. Of
>>> course you cannot do it in buildroot.
>>
>> Why do you say that? Of course, Buildroot does support adding cmake
>> configure options [1]. You can also check some cmake-based packages
>> already integrated (e.g.: [2]).
>
> I mean I can pass arguments to cmake but if I hardcode a value I break
> compatibility with any platform that would require the other value.
> However...

What I mean is something like this:
in the *.mk:
---
ifeq ($(BR2_arm)$(BR2_some_arch_with_stack_growing_downward),y)
FOO_CONF_OPTS += -DSTACK_DIRECTION=-1
endif
ifeq ($(BR2_some_other_arch_with_stack_growing_upward),y)
FOO_CONF_OPTS += -DSTACK_DIRECTION=+1
endif
---

This way you'll support all architectures (at least the one you know
how the stack grows).

>
>>
>> If you know beforehand how grow the stack, I would suggest to set
>> it in the *_CONF_OPTS variables. This may depends on the target
>> architecture.
>>
>>> It seems to be possible to access this information in another
>>> way since STACK_GROWS_DOWNWARD is defined in some headers.
> [...]
>>
>> This does not look right :-/ because: - it search in something not
>> in the sysroot; - it is only valid when using the
>> buildroot-toolchain backend.
>>
>> Indeed, it seems the STACK_GROWS_DOWNWARD definition is only
>> available in the compiler sources, not in the preprocessor output
>> for the target :-/
>>
>>> [...]
>>
>> Instead of checking the compiler sources, I prefer you set the
>> stack growing direction through the CMake args.
>>
>> Regards,
>
> Mark's reply and yours strongly suggest that it's a better idea to
> hardcode the correct value. I shall do so!
>
> Thanks a lot!
>
> Cheers,
>
> - --
> Sylvain Raybaud
> www.green-communications.fr
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1
>
> iQIcBAEBAgAGBQJUPQHnAAoJEEkkwl4JtJ9y8SEQAKFGepXykyQ/IdW5Y4oyOC1P
> C1Qxjkve4/JlGQlhn14zeUFSbBoNGoZrpEwaER/ygfiTUZtITdRwvW6SyZhdXGPs
> m4DkznR1+/ZCOCQdEglyON54VHGQU4l5caC0vbXENhjcMyLivCv1Ue8tGNO0yP4y
> HfxXqPBQHe79cHeIJwpiYn6wFlDxLTZmhOs9BxfxTCVCQr1nWPW7SqOKnHfaj5Us
> SdHZ2OPVI9M7IuNWDHdHayQoXcbiOHveb7Bh1FJY8GpK8F3CbVXZ/E/l+yxWU8mc
> CoZhQy3sJG0IAUZ+JerkTN1h15RsSyHJb6lKhE7zQ+LIhiuhj2dJNntwQ0eJCRRV
> G3h2NQti0T6ez8IuNmNJ58UEUQ72y26Ys1oU8LQfX2ZkJNmMeQlzlFGcESWkvW5B
> 4E059eSSHIhBH5j2slpYDe/622dIy8s/Wd5E6ww55lCwxFJJ4RmHKwC3u1YcXZO+
> z/nB4I9Qmukfq1IXrUxCPgM4v95Z6eCjROFIb/n7/OSCJ5J2f0vi6WBczfonzoyK
> tG0sOsub9ZQjUzAI1C8iqUn+W8eEeed7V1jVuLswP3Zvx2yByaNidcjHB2CM6UUk
> j6GcXOTqMAS5L7Bv/95akn8EJ1w0nyZnmuy1gBU0sGekNWE/uooTHPfoFAgivKnE
> CetDbXUvZLStUnYcL3yw
> =dO+1
> -----END PGP SIGNATURE-----
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
