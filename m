From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 00:16:48 +0200
Subject: [Buildroot] pkg-golang: host package not supported
In-Reply-To: <20180815001413.5c063d83@windsurf>
References: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
 <20180810140056.5cf7d9ed@windsurf>
 <CABa6e=q8EfZv0C+E6B_AxwNDw65+u6-VfWDh0ck6eBHv+_nTug@mail.gmail.com>
 <CADHdJwA2GpxG9mCJ9xV0_VxS9bPUax3Uvq-bJ07TTXy5XikuxQ@mail.gmail.com>
 <20180815001413.5c063d83@windsurf>
Message-ID: <CADHdJwAmOV76m9uYVXU1bw67NmYEqedCwbWii_nBp-ihZengNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 15, 2018 at 12:14 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed, 15 Aug 2018 00:05:47 +0200, Mirza Krak wrote:
>
>> I did have one problem with $(2)_SRC_SUBDIR, it turns out to be empty
>> when building host target. Workaround was to explicitly set this in
>> the .mk file with the HOST_ prefix. Any hints on why? Need some ifeq
>> ($(4),target) ... else ... endif  magic? :)
>
> Could you try this change:
>
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index bf178622b5..6eacd14180 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -77,9 +77,9 @@ $(2)_INSTALL_BINS ?= $(1)
>  # of GOPATH. It usually resolves around domain/vendor/software. By default, we
>  # derive domain/vendor/software from the upstream URL of the project, but we
>  # allow $(2)_SRC_SUBDIR to be overridden if needed.
> -$(2)_SRC_DOMAIN = $$(call domain,$($(2)_SITE))
> -$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
> -$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$($(2)_SITE))))
> +$(2)_SRC_DOMAIN = $$(call domain,$$($(2)_SITE))
> +$(2)_SRC_VENDOR = $$(word 1,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))
> +$(2)_SRC_SOFTWARE = $$(word 2,$$(subst /, ,$$(call notdomain,$$($(2)_SITE))))

Yeah, this works!

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
