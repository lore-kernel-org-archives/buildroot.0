From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jun 2019 22:40:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: Fix linking of
 shared/static libs with static libs
In-Reply-To: <CAFSsvmrURSufHb2dV+fLcLmpJXRON=yLqAg0G_FZRsnDDD=QrQ@mail.gmail.com>
References: <20190514184245.92222-1-aduskett@gmail.com>
 <20190518215637.2ea2ea51@windsurf> <20190520202615.37fbd048@gmx.net>
 <20190520204517.52564b80@windsurf.home> <20190521185447.2de12554@gmx.net>
 <CAFSsvmrURSufHb2dV+fLcLmpJXRON=yLqAg0G_FZRsnDDD=QrQ@mail.gmail.com>
Message-ID: <5872cf77-632a-9881-b53e-bffaef22d1cd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 08/06/2019 20:02, Adam Duskett wrote:
> Hello;
> 
> I asked for an update on this pull request on github here:
> https://github.com/mesonbuild/meson/pull/3939#issuecomment-492355588

 Thanks for following this up.

> 
> And it seems that the general consensus will be to fix the link_whole behavior,
> but strip out or rework a lot of this patch. Mainly because many other projects
> already have workarounds, such as gstreamer, mesa, and libglib.

 I read the following:

"I don't think this PR can go in as-is anymore because projects have added
workarounds that will cause errors now. I think the last time I checked, Mesa
was one such project."


 So maybe we should just try to combine this patch with Mesa master converted to
meson, and see if it blows up...


 Or, we could take the safer route, and just fix individual packages (AFAIU
currently just gstreamer) until upstream meson figures it out.

 I'm more inclined towards the second option. The gstreamer patch can simply be
included as part of the meson conversion.

 Regards,
 Arnout

> 
> On Tue, May 21, 2019 at 12:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
>>
>> Hello Thomas,
>>
>> On Mon, 20 May 2019 20:45:17 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>
>>> Hello Peter,
>>>
>>> Thanks for your feedback!
>>>
>>> On Mon, 20 May 2019 20:26:15 +0200
>>> Peter Seiderer <ps.report@gmx.net> wrote:
>>>
>>>> I can confirm the patch fixes the gstreamer static build/static libs
>>>> problem (see [1])....
>>>>
>>>> But as it is a (not yet) upstream committed bugfix, maybe it is better to
>>>> wait for a upstream committ and/or next meson version bump?
>>>
>>> That would of course be the best approach...
>>>
>>>> On the other side the gstreamer folks where bored with waiting for the
>>>> meson fix to be accepted and committed an workaround for the problem
>>>> already (see [2])...
>>>>
>>>> Conclusion: Take the patch in case there is already a buildroot
>>>> in-tree package which needs the fix (or commit the patch with
>>>> in series with a in-tree user), otherwise wait for meson
>>>> upstream...
>>>
>>> ... however, if it starts holding off bumping too many packages, I
>>> guess we'll have to take this patch. Having to add a !BR2_STATIC_LIBS
>>> dependency to libglib2 would be really horrible, considering the number
>>> of reverse dependencies that libglib2 has.
>>
>> As far as I know only gstreamer itself is affected (the only package
>> linking a static library using an internal static helper library)?
>> But the first other package affected by this bug justifies the
>> patch applied ;-)
>>
>>>
>>> At least, if the problem is acknowledged upstream, we know it will be
>>> fixed at some point. Perhaps not with the exact patch we will have, but
>>> at least it will be fixed, which means we won't have to carry this
>>> patch forever.
>>
>> Yes...
>>
>> Regards,
>> Peter
>>
>>>
>>> Thomas
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
