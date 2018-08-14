From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Aug 2018 00:37:35 +0200
Subject: [Buildroot] pkg-golang: host package not supported
In-Reply-To: <CADHdJwA2GpxG9mCJ9xV0_VxS9bPUax3Uvq-bJ07TTXy5XikuxQ@mail.gmail.com>
References: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
 <20180810140056.5cf7d9ed@windsurf>
 <CABa6e=q8EfZv0C+E6B_AxwNDw65+u6-VfWDh0ck6eBHv+_nTug@mail.gmail.com>
 <CADHdJwA2GpxG9mCJ9xV0_VxS9bPUax3Uvq-bJ07TTXy5XikuxQ@mail.gmail.com>
Message-ID: <24764a81-1a68-9432-fbdc-d43aa26ed218@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-18 00:05, Mirza Krak wrote:
> I did have one problem with $(2)_SRC_SUBDIR, it turns out to be empty
> when building host target. Workaround was to explicitly set this in
> the .mk file with the HOST_ prefix. Any hints on why? Need some ifeq
> ($(4),target) ... else ... endif  magic? :)

 I guess you expect _SRC_SUBDIR to be inherited from the target package, so you
need something like this in the golang infra:

ifndef $(2)_SRC_SUBDIR
 ifdef $(3)_SRC_SUBDIR
  $(2)_SRC_SUBDIR = $$($(3)_SRC_SUBDIR)
 else
  $(2)_SRC_SUBDIR ?=
$$($(2)_SRC_DOMAIN)/$$($(2)_SRC_VENDOR)/$$($(2)_SRC_SOFTWARE) endif
endif

 And similar for SRC_DOMAIN, SRC_VENDOR, SRC_SOFTWARE...

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
