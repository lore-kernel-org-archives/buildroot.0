From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 5 Dec 2015 20:24:29 +0100
Subject: [Buildroot] [PATCH] openvmtools: enable for uClibc toolchains
In-Reply-To: <56630857.9060704@mind.be>
References: <20151204165330.GA5268@waldemar-brodkorb.de>
 <56630857.9060704@mind.be>
Message-ID: <20151205192428.GQ19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

>  Waldemar, all,
> 
> On 04-12-15 17:53, Waldemar Brodkorb wrote:
> > Since uClibc-ng 1.0.9 openvmtools can be compiled as
> > the missing euidaccess function was added.
> 
>  We actually still support older uClibc-based toolchains, including an internal
> one based on 0.9.33.2, custom external ones (buildroot or crosstool-NG) that may
> also be based on that, custom external ones based on -ng pre-1.0.9, and the
> Blackfin toolchains.
> 
>  This comment is not specific for this patch but rather applies to all packages
> that will work with -ng but not with 0.9.33.2, and there are ever more of those.
> 
>  There are several things we can do here:
> 
> - Ignore it and let the user deal with the build failure.
> 
> - Ignore it and add a comment in the Config.in, so that the user at least is
> warned. See e.g. rt-tests. This is not a great solution either because the user
> will not see the comment when there is another package that selects openvmtools.

I don't think any package selects openvmtools. So this would be
okay?
 
> - Depend on an internal -ng toolchain. That sucks pretty hard because you'll
> often want to build the toolchain once and then use it as an external toolchain.
> 
> - Kill 0.9.33.2 and depend on an internal toolchain. See above.
> 
> - Give a more explicit warning in the custom external toolchain and in the
> 0.9.33.x and snapshot uClibc version choices that some packages may fail to
> build. This should be combined with an explicit exclusion of the Blackfin
> binaries (not necessary for openvmtools since it depends on MMU).

Openvm-tools is x86/x86_64 only, so other architectures are not
involved anyway.
 
> - Explicitly exclude non-ng toolchains. We can add a hidden symbol for that, and
> add -ng as a separate option for the custom external toolchain. For this
> particular patch, that doesn't solve the issue however because it will still
> fail with uclibc-ng 1.0.8.
> 
> 
>  I don't think any of these options is perfect, but the last one is the least
> bad IMO.
> 
> 
>  Note that we probably already have a bunch of packages that have this problem,
> because the only uClibc-based toolchains that we test in the autobuilders are
> Buildroot-generated, except for the Blackfin ones.
> 
>  We probably should kill the non-ng options in the uclibc package as well. We
> also should make it more explicit in the documentation of the custom external
> toolchains that you're on your own.

That would be the best, but I am a bit biased ;)
uClibc upstream master get no updates since 5 months or so.
I think even the snapshot version is getting of no use ;)
 
>  Otherwise, the patch looks good to me though :-)

Okay ;)

 best regards 
   Waldemar
