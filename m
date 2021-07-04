From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Jul 2021 11:15:39 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210601143422.25064-3-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
Message-ID: <20210704111539.3ce01855@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Jun 2021 16:34:07 +0200
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
> it is set, then the assert statement is compiled away.
> 
> Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
> default case).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

So, I would like to challenge whether this change is really a good
idea. Since this has been merged, we had to add a significant number of
patches to undefine NDEBUG.

The manpage of assert() tells us:

       If  the  macro  NDEBUG is defined at the moment <assert.h> was last in?
       cluded, the macro assert() generates no code, and hence does nothing at
       all.   It  is not recommended to define NDEBUG if using assert() to de?
       tect error conditions since the software may  behave  non-deterministi?
       cally.

So there is a clear recommandation to *not* define NDEBUG if assert is
used to detect error conditions. And later on, it also says:

BUGS
       assert() is implemented as a macro; if the expression tested has  side-
       effects, program behavior will be different depending on whether NDEBUG
       is defined.  This may create Heisenbugs which go away when debugging is
       turned on.

We have catched a number of packages where defining NDEBUG is causing
build issues, but I am worried about those packages where it doesn't
cause build issues, but assert() is used to run something that has
side-effects, and where the issue would only be visible at runtime.

Yes, ideally, assert() should only be used to verify expressions that
have no side effects. But practically speaking, I am not sure how many
programmers are really aware of the fact that assert() expressions
should not have side effects, because assert() can be disabled by
defining NDEBUG.

I believe this change is too dangerous, has caused a number of build
breakage + can cause run-time breakage that is difficult to predict.

What do you think ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
