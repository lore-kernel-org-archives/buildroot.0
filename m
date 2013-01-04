From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Fri, 04 Jan 2013 17:28:47 +0200
Subject: [Buildroot] [PATCH v2 2/2] rxvt-unicode: new package
In-Reply-To: <20130104160340.73e41cd2@skate>
References: <1356633918-16114-1-git-send-email-stefan.froberg@petroprogram.com>
 <1356633918-16114-2-git-send-email-stefan.froberg@petroprogram.com>
 <20130104002721.0a0e5e30@skate> <50E6EA65.6090001@petroprogram.com>
 <20130104160340.73e41cd2@skate>
Message-ID: <50E6F52F.5040204@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

4.1.2013 17:03, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Fri, 04 Jan 2013 16:42:45 +0200, Stefan Fr?berg wrote:
>
>> Yeah, Im still confused when to break it to pieces.
>>
>> But Isn't it much more easier to drop some patches if I wrap them to
>> individual,
>> isolated patches ??
>>
>> I mean, for example that elfutils patch set that I posted, it has 12
>> files and if
>> one of those files (except #1 and #2 ofcourse) seems to not work out
>> then isn't it
>> much more easier to just drop that one problematic patch than to
>> remodify one huge patch again and again? Right?
>>
>> And I would never have submitted that firefox patch in one huge chunk
>> because
>> it would have been too much work for poor reviewer(s)
>> (thanks a million about reviewing it Arnout! i haven't forgotted about
>> those fixes you mentioned
>> and will kick new patch series out soon)
>>
>> So for small packages single patch is kosher but for large (where does
>> the line go?) it is acceptable
>> to break it (like what Yan and others do) ???
> What you have to realize is that a patch applied to Buildroot must not
> break the build. So it must be fully self-contained.
>
> This is not the case with your elfutils patch set: the first patch adds
> the package, and later patches add patches to make the package build
> properly under certain conditions. This is not correct, as if we apply
> only the first patch, then the build is broken.
>
> So of course, for large packages, you can split things in several
> pieces, but each piece should work on its own. So for example, you can
> submit a first patch adding the package in a minimal way (supporting
> only few features and options), and then gradually add more things.
>
> See Yann's patches with Qemu: he adds a minimal support for Qemu (but
> something that *builds*), and then in followup patches add more
> features.
>
> Splitting patches is *NOT* about the size of the patches. It is about
> each patch carrying a logical change, that has a meaning on its own,
> and that preserves the "buildability" of Buildroot.
>
> For example, in your elfutils case, what I may end up doing is
> splitting things like this:
>
>  * One patch adds the elfutils package, with a dependency on glibc, so
>    that I don't need all the uClibc specific fixes.
>
>  * A second patch adds the uClibc specific fixes, and removes the
>    dependency on glibc.
>
> The first patch on its own works and builds. It doesn't need anything
> from the second patch. The second patch simply improves things.
>
> None of this discussion is specific to Buildroot. Is it exactly the
> same story if you do Linux kernel development, U-Boot development or
> anything else.
>
> Best regards,
>
> Thomas

Ah, I see.

So for example in this elfutils case it should have been one big patch
(because all those individual
*.patch files are really needed to make it build).
 
And any extra patches in that series would just add features
(like BR2_PACKAGE_ELFUTILS_ZLiB_SUPPORT) or fix something ?

In other words, first patch is the buildable core and everything else
optional ?

Stefan
