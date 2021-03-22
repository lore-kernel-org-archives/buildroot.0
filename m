From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Mar 2021 16:57:23 +0100
Subject: [Buildroot] [PATCH] package/zeromq: fix build failure due to
 binutils bug 21464
In-Reply-To: <20210322144220.5f9158c4@windsurf.home>
References: <20210314223616.5bfcc62f@windsurf.home>
 <20210317154520.1613272-1-giulio.benetti@benettiengineering.com>
 <519abe18-e47a-38f9-e659-1a6dde6cd41d@benettiengineering.com>
 <3a252a05-54ac-24a7-a9d6-1c5a21679aee@benettiengineering.com>
 <20210322144220.5f9158c4@windsurf.home>
Message-ID: <712d75cc-4d52-1a2c-e89e-74d71c1f0a35@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/22/21 2:42 PM, Thomas Petazzoni wrote:
> On Mon, 22 Mar 2021 14:15:08 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> OpenRisc binutils 21464 bug has a fix:
>> https://sourceware.org/bugzilla/show_bug.cgi?id=21464
>>
>> I've tested it with binutils:
>> - 2.32
>> - 2.34
>> - 2.35.2
>> - 2.36.1
>>
>> and works good while building:
>> - protobuf
>> - libtheora
>> - zeromq
> Excellent! Thanks for all this work!
> 
> Has this fix been suggested by upstream? How do you know it's the
> "right" fix ?

Yes it's been suggested by Stafford here:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

>> zeromq is the only package that could be worked around with -O0.
>>
>> I would add patches that add patches to all binutils versions, so this
>> way buildroot toolchain built by buildroot are safe, but I should tag
>> as buggy all the external openrisc toolchains, basically the one
>> provided by Bootlin. This implies adding patches to disable building
>> libtheora with all its dependencies and I can do it, or otherwise we can
>> wait for Bootlin to release a new fixed openrisc toolchain, what about that?
> 
> Don't bother with the external Bootlin toolchains, I was working on a
> new release of the toolchains based on 2021.02, so I'll include the
> binutils fix.

Ok, so it fixes this bug for Buildroot toolchain and you'll provide 
Bootlin toolchain and we can consider this bug as not affecting
Buildroot anymore. The chance one would use an external OpenRisc 
toolchain would be very rare. Right?

Then we could revert commit:
"package/protobuf: disable package if binutils is affected from bug 21464"
https://git.buildroot.net/buildroot/commit/?id=9e71b6e2cb

While doing all these tests I've gound that libgeos still has this bug 
and most of all, the diff proposed doesn't fix bug 21464, they are 2 
different bugs, so I've updated that here:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

And submitted the other bug:
https://sourceware.org/bugzilla/show_bug.cgi?id=27624

So bug 21464 is still there and my binutils patches need do be re-worded.

And please drop my pending patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20210322131437.392225-1-giulio.benetti at benettiengineering.com/

I've submitted a reworded one:
https://patchwork.ozlabs.org/project/buildroot/patch/20210322155655.547476-1-giulio.benetti at benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
