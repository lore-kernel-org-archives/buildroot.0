From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Jun 2017 07:30:26 +0200
Subject: [Buildroot] [for-next 3/3] package/gcc: remove gcc 4.9
In-Reply-To: <874lvjbl2z.fsf@dell.be.48ers.dk>
References: <20170525183457.12169-1-romain.naour@gmail.com>
 <20170525183457.12169-3-romain.naour@gmail.com>
 <20170526151414.11f2d47a@free-electrons.com>
 <6c88ceb4-94f7-6018-6d3a-ae3e99c8d44e@mind.be>
 <874lvjbl2z.fsf@dell.be.48ers.dk>
Message-ID: <65c27ecf-621e-d145-59cd-eef840c20c46@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-06-17 00:04, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >> I'll wait a little bit for additional feedback on this one. If nobody
>  >> complains in the next few days, I'm going to apply it.
> 
>  >  GCC 4.9 (or rather, GCC 5) is a bit a special case: libstdc++ had heavy
>  > ABI-incompatible changes. E.g. at the time Debian switched to it, it was the
>  > only time I had major breakage in sid. So, the switch from gcc 4.9 to gcc 5
>  > means that any binary-only C++ program will no longer be usable.
> 
>  That probably is a bigger issue for a binary distribution like Debian
>  than for Buildroot though.

 That's where real life comes into play... I've had quite a few customers
(admittedly most using something else than Buildroot) that needed to incorporate
some binary that comes from a supplier. Things like the calibration tool for a
touch screen, or a proprietary video codec. This stuff is universally crap, but
still less effort to use than to redevelop from scratch.

 TBH I've never had toolchain issues with these binaries, but I don't think any
of them were written in C++. So maybe this is not a real issue.


>  >  On top of that, gcc 5 introduces many errors (for non-standard-compliant code)
>  > that were accepted before in gcc 4.9, which makes existing codebases sometimes
>  > difficult to get built. This, however, happens with each version bump so less of
>  > an argument against removal.
> 
> True. It also breaks older u-boot and Linux kernel versions that didn't
> handle > gcc4.x.

 Fortunately you need to pull just one or two patches for these.


>  >  You could say that users with such requirements should keep using their own
>  > toolchain, but there are useful (security) fixes in libc as well. They could use
>  > an external toolchain, but then how to build it? Crosstool-NG is a *lot* more
>  > complicated to use than Buildroot.
> 
> But we also don't keep old libc versions around. Would they be Ok with
> moving to a new libc version but not to newer gcc version?

 Because libc is generally ABI-compatible with earlier versions. There used to
be issues with glibc (and I have no idea about uClibc), but I think it's been at
least 10 years since glibc had ABI breakage. So the only thing to be afraid of
is regressions. But if you're afraid of that, then you shouldn't update anything
at all...


>  >  Bottom line: I'd tend to keep gcc 4.9 around for a while. If
>  > breakage occurs we can disallow it for some architectures. There
>  > shouldn't be much more maintenance effort than that, I think.
> 
> I can follow you, and it is OK for me to keep 4.9 around for a little
> while longer. We always have this tradeoff between stability and adding
> new features / cleanups, and I do think people should be moving to the
> LTS version (and plan in time for a yearly migration to the new LTS) if
> they want stability and fixes for a longer period, just like they
> (hopefully) do for their Linux kernel.
> 
> We should imho drop 4.9 before the next LTS though.

 Yeah, that's another reason: if we remove 4.9 from master, than we will not get
any fixes for it that could be applied to the LTS branch. But, well, I don't
think we're testing with 4.9 at all in the autobuilders so the point is kind of
moot.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
