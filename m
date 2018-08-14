From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 01:22:49 +0200
Subject: [Buildroot] pkg-golang: host package not supported
In-Reply-To: <214a9eac-afe5-2b4f-72a2-b212968f5992@mind.be>
References: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
 <20180810140056.5cf7d9ed@windsurf>
 <CABa6e=q8EfZv0C+E6B_AxwNDw65+u6-VfWDh0ck6eBHv+_nTug@mail.gmail.com>
 <CADHdJwA2GpxG9mCJ9xV0_VxS9bPUax3Uvq-bJ07TTXy5XikuxQ@mail.gmail.com>
 <24764a81-1a68-9432-fbdc-d43aa26ed218@mind.be>
 <CADHdJwB+9juxwRXttOfeizfrFyvvF_gQYuWjpyM3EqN8SsK4wg@mail.gmail.com>
 <214a9eac-afe5-2b4f-72a2-b212968f5992@mind.be>
Message-ID: <CADHdJwB8QhetJLhJBFh7B=wYgPyrEhJmY6uWci15kMdCdXvicw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Aug 2018, 01:13 Arnout Vandecappelle, <arnout@mind.be> wrote:

>
>
> On 15-08-18 00:43, Mirza Krak wrote:
> > On Wed, Aug 15, 2018 at 12:37 AM, Arnout Vandecappelle <arnout@mind.be>
> wrote:
> >>
> >>
> >> On 15-08-18 00:05, Mirza Krak wrote:
> >>> I did have one problem with $(2)_SRC_SUBDIR, it turns out to be empty
> >>> when building host target. Workaround was to explicitly set this in
> >>> the .mk file with the HOST_ prefix. Any hints on why? Need some ifeq
> >>> ($(4),target) ... else ... endif  magic? :)
> >>
> >>  I guess you expect _SRC_SUBDIR to be inherited from the target
> package, so you
> >> need something like this in the golang infra:
> >
> > For this specific package I am not defining a "target" package, host
> > only. Do not know if that affects the outcome.
>
>  As I said, I'm guessing since you didn't provide details...
>
>  You're defining a host-only package, but you still set FOO_SITE instead of
> HOST_FOO_SITE, I guess. HOST_FOO_SITE is set automatically by the generic
> infra,
> but only *after* the empty definition has already been used to define
> HOST_FOO_SRC_SUBDIR:
>
> $(2)_SRC_DOMAIN = $$(call domain,$($(2)_SITE))
> $(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
> $(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call
> notdomain,$($(2)_SITE))))
>
> $(2)_SRC_SUBDIR ?=
> $$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE)
>
> expands to
>
> HOST_FOO_SRC_DOMAIN = $(call domain,)
> HOST_FOO_SRC_VENDOR = $(word 1,$(subst /, ,$(call notdomain,)
> HOST_FOO_SRC_SOFTWARE = $(word 2,$(subst /, ,$(call notdomain,)
>
> HOST_FOO_SRC_SUBDIR ?=
> $(HOST_FOO_SRC_DOMAIN)/$(HOST_FOO_SRC_VENDOR)/$(HOST_FOO_SRC_SOFTWARE)
>
> and later on you get
>
> $(call inner-generic-package,$(1),$(2),$(3),$(4))
>
> which contains
>
> ifndef $(2)_SITE
>  ifdef $(3)_SITE
>   $(2)_SITE = $$($(3)_SITE)
>  endif
> endif
>
> which expands to
>
> HOST_FOO_SITE = $(FOO_SITE)
>
>
>  Actually, looking at it now, the real problem is that _SRC_DOMAIN
> definitions
> have a single dollar only. Try this:
>
> -$(2)_SRC_DOMAIN = $$(call domain,$($(2)_SITE))
> -$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
> -$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call
> notdomain,$($(2)_SITE))))
> +$(2)_SRC_DOMAIN = $$(call domain,$$($(2)_SITE))
> +$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call
> notdomain,$$($(2)_SITE))))
> +$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call
> notdomain,$$($(2)_SITE))))
>

Yeah, Thomas suggested this as well and that got rid of the problems I was
having. Is this the correct fix?

/ Mirza
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180815/fd9006e9/attachment.html>
