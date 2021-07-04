From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Jul 2021 16:58:24 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210704111539.3ce01855@windsurf>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
 <20210704111539.3ce01855@windsurf>
Message-ID: <41d1f1e1-02b7-52e4-f1b6-ab3378af96b8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/07/2021 11:15, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue,  1 Jun 2021 16:34:07 +0200
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> 
>> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>>
>> The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
>> it is set, then the assert statement is compiled away.
>>
>> Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
>> default case).
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> So, I would like to challenge whether this change is really a good
> idea.

 I'm the one who originally proposed this (I think) so I better pipe up.


> Since this has been merged, we had to add a significant number of
> patches to undefine NDEBUG.
> 
> The manpage of assert() tells us:
> 
>        If  the  macro  NDEBUG is defined at the moment <assert.h> was last in?
>        cluded, the macro assert() generates no code, and hence does nothing at
>        all.   It  is not recommended to define NDEBUG if using assert() to de?
>        tect error conditions since the software may  behave  non-deterministi?
>        cally.

 In practice, the build failures are mostly due to variables that become unused
because the assert() is gone, and that triggers -Werror.


> So there is a clear recommandation to *not* define NDEBUG if assert is
> used to detect error conditions. And later on, it also says:
> 
> BUGS
>        assert() is implemented as a macro; if the expression tested has  side-
>        effects, program behavior will be different depending on whether NDEBUG
>        is defined.  This may create Heisenbugs which go away when debugging is
>        turned on.
> 
> We have catched a number of packages where defining NDEBUG is causing
> build issues, but I am worried about those packages where it doesn't
> cause build issues, but assert() is used to run something that has
> side-effects, and where the issue would only be visible at runtime.

 I don't think it's very likely that this happens, but indeed it's possibly. You
just have to "optimise":

    bool result = f();
    assert(result);

into

    assert(f());

and you get hit by this issue...


> Yes, ideally, assert() should only be used to verify expressions that
> have no side effects. But practically speaking, I am not sure how many
> programmers are really aware of the fact that assert() expressions
> should not have side effects, because assert() can be disabled by
> defining NDEBUG.

 Well, packages that use meson or CMake *do* get NDEBUG set (because that's done
by the release variants), so those packages at least seem to behave sanely...

 That said:

> I believe this change is too dangerous,

 This is definitely true. So I also think reverting it is the safest option.


 Regards,
 Arnout


> has caused a number of build
> breakage + can cause run-time breakage that is difficult to predict.
> 
> What do you think ?
> 
> Thomas
> 
