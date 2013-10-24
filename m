From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 24 Oct 2013 10:55:38 -0400
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <CAAXf6LWAmfRswP0oCj--iZ+xxrKCYvYQeODCcaJQFx_d_BraOQ@mail.gmail.com>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
 <5171AF1B.4010806@mind.be>
 <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
 <5171D63D.7050705@mind.be>
 <CANxTyt7EftWCmO25-reSsJJybTkzbB3srsrmZSwjKpadfQNt3w@mail.gmail.com>
 <5174D1DE.6000902@mind.be>
 <CANxTyt7JzGaq0pirMDDUrEn_XTUxK-4CbaPP00Rn0O709eL50w@mail.gmail.com>
 <5175AB06.8090101@mind.be>
 <CAAXf6LWAmfRswP0oCj--iZ+xxrKCYvYQeODCcaJQFx_d_BraOQ@mail.gmail.com>
Message-ID: <CANxTyt5Mrm9ZLBYhCn62pLJBL11zaXBJox6VBWsYJvshFA8i7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Oct 24, 2013 at 6:31 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Mon, Apr 22, 2013 at 11:26 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 22/04/13 14:32, Danomi Manchego wrote:
>>>
>>> On Mon, Apr 22, 2013 at 1:59 AM, Arnout Vandecappelle <arnout@mind.be
>>> <mailto:arnout@mind.be>> wrote:
>>
>> [snip]
>>
>>>       Actually, after thinking a bit harder about it: the following
>>>     should work:
>>>
>>>     sed -n '/^# Toolchain/,/^# System configuration/' $(BUILDROOT_CONFIG)
>>> \
>>>              | md5sum -
>>>
>>>       So there's no need to rename stuff or anything.
>>>
>>>
>>> That would also use the GDB and ECLIPSE lines too.  But then, if it
>>> accounts for everything outside of the "%compiler% -v" info (wrappers,
>>> C-library), then it's worth it.
>>>
>>> I suppose that we could drop the these lines with an inverse grep:
>>>
>>> sed -n '/^# Toolchain/,/^# System configuration/p' .config | \
>>>      grep -v -e '^#' -e GDG -e ECLIPSE | \
>>>      md5sum
>>>
>>> Too much?
>>
>>
>>  Too much, yes :-) But perhaps we could change the order of the toolchain
>> options.
>>
>
> Reviving this thread...
> http://lists.busybox.net/pipermail/buildroot/2013-April/070819.html
>
> Is there any specific reason why there was no further evolution on this?

The conversation was dropped on my end because I actually came up with
a mod to ccache.mk as described above (GDB and ECPLIPSE filter
included), and have been using it ever since.  (Initially "testing",
of course, then just forgotten.)

I didn't submit a patch because the "%compiler% -v" portion of the
additional hash content could have the effect of introducing a path to
the individual's build directory (for built toolchains, I think - I
only use external or downloaded toolchains, so not sure) - which would
be bad for groups that use a shared cache directory.

But if you like, I can separate my ccache.mk changes into two or three
patches (since I did a couple other things too), and send as RFC.  But
I don't have too much time to do rework for the built toolchains.

Danomi -
