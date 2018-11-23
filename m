From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Nov 2018 16:44:32 +0100
Subject: [Buildroot] [PATCH next v5 7/9] core: implement per-package SDK
 and target
In-Reply-To: <20181123142554.3b42fb0a@windsurf>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-8-thomas.petazzoni@bootlin.com>
 <20181120213612.GL2601@scaer> <af66d76c-06c6-3e01-257c-9e263d724639@mind.be>
 <20181123142554.3b42fb0a@windsurf>
Message-ID: <6cd54988-55ee-eeb2-8241-47095a91fc81@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/11/2018 14:25, Thomas Petazzoni wrote:
> Hello Arnout,
> 
> Thanks for the review!
> 
> On Wed, 21 Nov 2018 00:32:11 +0100, Arnout Vandecappelle wrote:
> 
>>>>   output/per-package/busybox/target
>>>>   output/per-package/busybox/host
>>>>   output/per-package/host-fakeroot/target
>>>>   output/per-package/host-fakeroot/host  
>>> I'm not fond of the naming here...  
>>  Yay bikeshedding!
>  :-)
> 
>>> In the end, can we expect to have a layout that would look like:
>>>
>>>     output/build/busybox/host/
>>>     output/build/busybox/target/
>>>     output/build/busybox/busybox-1.2.3/     # Source tree, and
>>>                                             # currently, build dir  
>>  If we're changing the world anyway, what about:
>>
>> output/work/busybox-1.2.3/source
>> output/work/busybox-1.2.3/host
>> output/work/busybox-1.2.3/target
>> output/work/busybox-1.2.3/build
>
> You need two build folders: one for the target variant and one for the
> host variant.

 Clearly not a good name then, because with "host" I meant the per-package host
directory, i.e. the target package's host directory. There would also be a

output/work/host-busybox-1.2.3/source
output/work/host-busybox-1.2.3/host
output/work/host-busybox-1.2.3/target
output/work/host-busybox-1.2.3/build

 Oh, but that would defeat the point of the source/build directory split...
Never mind then :-)


>>  Or maybe even:
>>
>> output/work/busybox-1.2.3/source
>> output/work/busybox-1.2.3/dependencies/host
>> output/work/busybox-1.2.3/dependencies/staging -> host/tuple/sysroot
>> output/work/busybox-1.2.3/dependencies/target
>> output/work/busybox-1.2.3/build
> Also, I don't really like the word "work", that's what is used in OE
> and I find it very fuzzy.

 That was the whole point, we should become OE! :-) BTW, OE also uses "tmp",
that's a lot better of course.

 But I see that in the end you kept the per-package directory. Reviewing all the
options, I agree that that is still the best one.

[snip]

>>  More importantly, however: should we also sync the target directory for host
>> packages? We *are* syncing the staging directory, of course...
> 
> Does it really matter ? A host package will only have other host
> packages as its dependencies, so its per-package target directory will
> always be empty. I did a test build, and all
> output/per-package/host-*/target/ folders were empty.
> 
> So I am not sure it is really worth adding more conditionals in the
> code just to avoid those empty target directories. But if you really
> want that, I'll do it.

 No, let's keep it as it is, it's not worth it.

 In fact, host packages may install stuff in target (e.g. host-gcc-final
installs libstdc++.so I think). So if a target package depends indirectly on
such a package through a different host package, we should still have its target
populated.


 Regards,
 Arnout

[snip]
