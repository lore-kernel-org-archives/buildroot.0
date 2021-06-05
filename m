From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 5 Jun 2021 19:11:17 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <l4_Jp34pzaOlU4ZSREEHzPf9FzyRhw2n04eN-1Ew-olRuMHp0bGtAM8NTbPZm98yyYuqcbmTROjzfQqHEvggWQ_1Ja8oNE-gU38NVtPBLvQ=@senzilla.io>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
 <20210601203619.GD168928@scaer>
 <l4_Jp34pzaOlU4ZSREEHzPf9FzyRhw2n04eN-1Ew-olRuMHp0bGtAM8NTbPZm98yyYuqcbmTROjzfQqHEvggWQ_1Ja8oNE-gU38NVtPBLvQ=@senzilla.io>
Message-ID: <CAAXf6LWN=ic6UDLj=tQfOiKGgvDy+htopg5scNysdPSuoSeyxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,



On Sat, Jun 5, 2021, 18:50 D. Olsson <hi@senzilla.io> wrote:

> Hi Thomas, Yann, all,
>
> > On 2021-06-01 16:34 +0200, Thomas De Schampheleire spake thusly:
> > +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
> > +TARGET_DEBUGGING += -DNDEBUG
>
> This broke bitcoin builds. I haven't looked deeply into the
> details, but it is my understanding that NDEBUG changes the
> behaviour of assert() in a way that Bitcoin explicitly does
> not support.
>
> See:
> https://github.com/bitcoin/bitcoin/blob/707ba8692b0013f4824dc3c2ea6554ccad5d20c2/src/compat/assumptions.h#L13
>
> I don't know if there is a workaround for this, but I have a
> feeling that passing NDEBUG for all packages might not be a
> good idea?
>

NDEBUG is a macro that, when set, will neutralize assert statements (see
man assert). The rationale is that assert statements can help developers
validate assumptions in a test phase, but that this code is better disabled
in release builds, for reasons of performance. At that time, the code is
expected to be correct.

It's odd but not unacceptable that bitcoin expects NDEBUG not to be set.

The workaround/solution would be to explicitly undefine NDEBUG, via
-UNDEBUG. This should become part of the flags set in bitcoin.mk on
Buildroot.

It is possible that there are other packages that need this change, but
generally one wpuld expect projects to allow both scenarios.

Best regards
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210605/07fc05c1/attachment.html>
