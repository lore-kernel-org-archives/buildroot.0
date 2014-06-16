From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 16 Jun 2014 08:54:42 +0200
Subject: [Buildroot] [PATCH 5 of 7 v3] toolchain-external: change
 version from 'undefined' to 'virtual'
In-Reply-To: <539E7E02.307@mind.be>
References: <patchbomb.1402085576@localhost>
 <640c5d9c5ac14d442207.1402085581@localhost>
 <20140607105728.469dd87d@free-electrons.com>
 <CAAXf6LX4nfHkyBe_G3eQSBTHr67SWb37TFEOL=0q+vZ1DMmdtA@mail.gmail.com>
 <20140608181033.29a00966@free-electrons.com>
 <CAAXf6LX4zN1bYaxdskq9Evc5uT2Rw2ip-U7Dqf78bOOXiQgf4A@mail.gmail.com>
 <539E7E02.307@mind.be>
Message-ID: <CAAXf6LUfZ-9eBc+REY4jL0Yzbe=30X+uzTeM2hXv_5EBaMjdAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Jun 16, 2014 at 7:17 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/08/14 19:23, Thomas De Schampheleire wrote:
> [snip]
>> I don't think that the MESSAGE solution adds a lot of complexity: the
>> current definition is:
>> MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
>> $(1)$(TERM_RESET)"
>> and this would become something like:
>> MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME)
>> $($(PKG)_EXTRA_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
>
>  Small fix: one of the spaces around $(PKG)_EXTRA_NAME should be removed.
> Otherwise we have two spaces in the usual case. The extra name should then be
> defined with an embedded space:
>
> TOOLCHAIN_EXTERNAL_EXTRA_NAME = Sourcery$(space)

Yeah, the spacing of the MESSAGE is not very nice currently: for
non-package messages (like 'Finalizing target') there are already two
leading spaces due to PKG_NAME and PKG_VERSION being empty. Maybe we
should do something like:
MESSAGE = $(subst $(space)$(space),$(space),XXX)

or alternatively compose MESSAGE step by step and first checking each
variable for emptyness, something like:
MESSAGE = echo "$(TERM_BOLD)>>>"
ifneq (,$($(PKG)_NAME))
MESSAGE += $(space)$($(PKG)_NAME)
endif
ifneq (,$($(PKG)_VERSION))
MESSAGE += $(space)$($(PKG)_VERSION)
endif

etc.

Best regards,
Thomas
