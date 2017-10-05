From: Ismael Luceno <ismael@iodev.co.uk>
Date: Thu, 5 Oct 2017 07:13:16 -0300
Subject: [Buildroot] [PATCH] pkg-download: make package name optional in
 github helper
In-Reply-To: <26d3dc60-5a3a-0fce-f3cf-b75ee2670644@mind.be>
References: <20171004085745.15457-1-ismael@iodev.co.uk>
 <26d3dc60-5a3a-0fce-f3cf-b75ee2670644@mind.be>
Message-ID: <20171005101312.GA9688@pirotess.bf.iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/Oct/2017 18:35, Arnout Vandecappelle wrote:
<...>
>  The solution (probably) is to use $(PKG) instead of $(pkgname).

I see.

> > +# github(user[,package[,version]]): returns site of GitHub repository
> > +github = https://github.com/$(1)/$(or $(2),$(pkgname))/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION))
> 
>  Could you estimate how many packages could be simplified with this?

A great deal, including axel, in 219 out of 380 the repo matches the
package name, with 30 also matching the username.

> I'm not actually sure this is a good idea anyway. The _VERSION is OK
> because it works for *all* packages, the third argument is only needed
> when you use the github helper outside a package (e.g. for a custom
> kernel URL). But this change will apply only to a limited number of
> packages on the one hand, and on the other hand it makes it even more
> difficult for people to understand what is meant with this $(call
> github,foo) construct.

It's "magic" anyway. It would perhaps make sense to implement this kind
of rules via rewriting AXEL_SITE, it could be something descriptive like:

	AXEL_SITE = @ github user:axel-download-accelerator repo:libtls

Here's a mockup: http://tmp.iodev.co.uk/rtest.mk
