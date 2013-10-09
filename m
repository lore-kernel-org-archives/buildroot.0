From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 9 Oct 2013 14:59:07 +0200
Subject: [Buildroot] [PATCHv3 04/20] toolchain: introduce a virtual
	package
In-Reply-To: <20131009110251.64401cb3@skate>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHkwnC_wbNa4Mg24WTPGjmmMSk2tYcNfmSzV66CVkzfmZ-2T2A@mail.gmail.com>
 <20131009110251.64401cb3@skate>
Message-ID: <CAHkwnC_CoxOe4HH9fUHWY1XynLAfhDoB1x7JCxZ8iHsjgWij-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 9, 2013 at 11:02 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed, 9 Oct 2013 10:26:56 +0200, Fabio Porcedda wrote:
>> Hi Thomas,
>>
>> On Tue, Oct 8, 2013 at 8:17 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > [...]
>> >  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>> >
>> > -toolchain: prepare dirs dependencies $(BASE_TARGETS)
>> > -
>> > -world: toolchain $(TARGETS_ALL)
>> > +world: $(BASE_TARGETS) $(TARGETS_ALL)
>>
>> Why do you change that? It seems to me better to use the "toolchain"
>> target as dependency instead of $(BASE_TARGETS)
>> IMHO  $(BASE_TARGETS) is an implementation detail of the new toolchain
>> virtual package so it's better to use inside the new toolchain virtual
>> package.
>
> BASE_TARGETS = toolchain, so there are exactly equivalent. I'm not sure
> why you say BASE_TARGETS is an implementation detail of the new
> toolchain virtual package. BASE_TARGETS now never has any other value
> than just "toolchain".

Sorry, I've missed that part, now I understand better.

> Of course, we might want to get rid of BASE_TARGETS later on, but for
> the moment, BASE_TARGETS is still used in other places, like when
> building the list of packages for which make source or make
> external-deps should be executed:
>
> PACKAGES_SOURCE:=$(patsubst %,%-all-source,$(PACKAGES) $(BASE_TARGETS))
> PACKAGES_EXTERNAL_DEPS:=$(patsubst %,%-all-external-deps,$(PACKAGES) $(BASE_TARGETS))

Ok I understand.

> Ultimately, toolchain will no longer need to be part of BASE_TARGETS as
> it will be handled just as a normal package dependency (done by your
> patches). But I'm trying to do things step by step, progressively.
> Therefore, in the end, I believe the world rule will no even contain
> "toolchain" and $(TARGETS_ALL) but just $(PACKAGES),

Well about the world rule in my patches in the end it contain only the
"target-post-image" because it's the last step, but that's another
story.

> but we can't
> change the world in one day :-)

That's for sure :)

Thanks for these toolchains improvements
-- 
Fabio Porcedda
