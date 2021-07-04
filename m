From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 21:52:36 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <41d1f1e1-02b7-52e4-f1b6-ab3378af96b8@mind.be>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
 <20210704111539.3ce01855@windsurf>
 <41d1f1e1-02b7-52e4-f1b6-ab3378af96b8@mind.be>
Message-ID: <20210704195236.GE2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Peter, Thomas?, All,

On 2021-07-04 16:58 +0200, Arnout Vandecappelle spake thusly:
> On 04/07/2021 11:15, Thomas Petazzoni wrote:
> > On Tue,  1 Jun 2021 16:34:07 +0200
> > Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
> >> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >> The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
> >> it is set, then the assert statement is compiled away.
> >> Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
> >> default case).
> > So, I would like to challenge whether this change is really a good
> > idea.
>  In practice, the build failures are mostly due to variables that become unused
> because the assert() is gone, and that triggers -Werror.
[--SNIP--]
>  I don't think it's very likely that this happens, but indeed it's possibly. You
> just have to "optimise":
>     bool result = f();
>     assert(result);
> into
>     assert(f());
> and you get hit by this issue...

And this is way too easy an optimisation to do. ;-)

> > Yes, ideally, assert() should only be used to verify expressions that
> > have no side effects. But practically speaking, I am not sure how many
> > programmers are really aware of the fact that assert() expressions
> > should not have side effects, because assert() can be disabled by
> > defining NDEBUG.
>  Well, packages that use meson or CMake *do* get NDEBUG set (because that's done
> by the release variants), so those packages at least seem to behave sanely...

>  That said:
> 
> > I believe this change is too dangerous,
> 
>  This is definitely true. So I also think reverting it is the safest option.

I've now done so: I reverted the change itself, and reverted the two
packages that had workarounds for this;

    fc0fb99f0307  Revert "package/weston: disable -NDEBUG"
    1aa3cb109067  Revert "package/bitcoin: unset the NDEBUG flag"
    a1c7cff1a081  Revert "core: enable 'NDEBUG' unless BR2_ENABLE_RUNTIME_DEBUG is set"

The other NDEBUG-related changes, I have left in the tree:

    b7939fe2a0b1  core: introduce BR2_ENABLE_RUNTIME_DEBUG
        => used by meson and cmake

    61c5e0319c5  package/pkg-cmake.mk: determine CMAKE_BUILD_TYPE depending on BR2_ENABLE_RUNTIME_DEBUG
        => see commit log for details

    fb12adbb761  package/sofia-sip: correct passing of '--enable-ndebug'
    0993954814e  package/sofia-sip: don't set 'NDEBUG' explicitly
        => the first was a fix; the second drops an explicit handling
           maybe we could revert 0993954814e, but I don't see the point

    ea02ac3e061  package/daemon: fix build without BR2_ENABLE_RUNTIME_DEBUG
        => very similar fix accepted upstream, so we will drop the patch
           when we bump

    bf32928bbb0  package/gnutls: disable tests
        => we still want to disable tests even without NDEBUG

    1f1d536e7e3  package/pdbg: fix build with -DNDEBUG
    932f6a0a2ad  package/pdbg: Bump version to v3.3
        => a patch we had was accepted upstream, and we updated the
           version

    cc1c8c3bb1c  package/openswan: disable -Werror
        => we still want to disable Werror even without NDEBUG

    12551386027  package/filemq: bump to af4768dcaf2fcb8083a32bad107a22ecb7a5d954
        => is a version bump anyway

I will now reply to the individual pending patches telated to NDEBUG,
and reject them.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
