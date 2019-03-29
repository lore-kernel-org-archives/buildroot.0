From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 29 Mar 2019 10:31:22 +0100
Subject: [Buildroot] [PATCH v4] mtree: new package
In-Reply-To: <20190328225305.174d234e@windsurf>
References: <20190326142411.6943-1-esben.haabendal@gmail.com>
 <20190327201803.6b1a832d@windsurf> <87bm1w9ck5.fsf@haabendal.dk>
 <20190328121441.02648d09@windsurf> <87tvfnav5a.fsf@gmail.com>
 <02a2e44d-45e9-f3fc-8c1f-5cf7a8b8f5d8@mind.be>
 <20190328210043.41fc2c0d@windsurf> <87ef6qlnow.fsf@dell.be.48ers.dk>
 <20190328225305.174d234e@windsurf>
Message-ID: <7f2ed921-9f36-0a2d-bf2d-53eb47841969@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/03/2019 22:53, Thomas Petazzoni wrote:
> On Thu, 28 Mar 2019 21:59:59 +0100
> Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>  > I'm fine with this as well. It means we would no longer support glibc
>>  > 2.19 anymore.  
>>
>> Didn't you just last month argue against removing support for glibc <
>> 2.19 support (the runc security fix):
> 
> In fact, my last sentence lacked an ending question mark. I wanted to
> ask if we were dropping support entirely for glibc 2.19, or just saying
> "glibc 2.19 is not long important enough to worry too much about it,
> especially when it's just for the few packages that use the <fts.h>
> interface".

 Just to be clear: we don't remove support for these old toolchains. We remove
the "guarantee" (which was anyway never much of a guarantee) that all packages
that you can select in menuconfig will build with it.


> But if your point is to have me say that I don't have a clear and
> well-defined opinion, then yes it's the case. I do see a number of
> companies/customers continue to use old toolchains and therefore
> dropping support too quickly tends to be annoying.

 But these will typically *not* be one of our external toolchains, but rather a
custom external toolchain. So the solution of a hidden option is not much of a
solution.

 Of course, it can be added to the custom external toolchain options as well.
But then, that's one more option that *everybody* has to set for their custom
external toolchains, while it only really applies to the few people that use
such an old toolchain *and* that want to select packages that were not even
available to them at the time that they started using this toolchain. In my
opinion, the "few" here is 0, maybe 1.

 A really fundamental solution could be that at build time we detect in these
packages whether the toolchain has a broken fts.h, and if yes we add
-Ulargefile. But that's also complicated.

 That is actually my main point: I don't think adding such an option is worth
the bother, because it can only really solve the issue by adding a lot of
complexity.

> On the other side,
> we clearly see the maintenance burden that keeping support for old
> toolchains creates.
> 
>> I don't have a problem dropping support for ancient toolchains when they

 The important thing to note is: we drop support for such ancient toolchains
trying to build the mtree package.

 Regards,
 Arnout

>> add too much complexity, but the lack of large file support is mtree is
>> probably not really reason enough.
> 
> So, what do you suggest ? What I proposed with the hidden option ?
> 
> Thomas
> 
