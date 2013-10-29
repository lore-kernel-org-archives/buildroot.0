From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Oct 2013 19:41:14 +0100
Subject: [Buildroot] [PATCH 1/4] post-{build,
 images} hooks: export BUILD_DIR too
In-Reply-To: <20131028061708.5e69ab8e@skate>
References: <cover.1382894622.git.yann.morin.1998@free.fr>
 <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr>
 <a4300dc9-2aa9-4d40-9b79-26ec5b317c52@email.android.com>
 <20131028061708.5e69ab8e@skate>
Message-ID: <20131029184114.GF3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P, All,

On 2013-10-28 06:17 +0100, Thomas Petazzoni spake thusly:
> Dear Thomas De Schampheleire,
> 
> On Sun, 27 Oct 2013 22:12:34 +0100, Thomas De Schampheleire wrote:
> 
> > >+# This extra environment we can not export ourselves, so we have
> > >+# to expicitly pass it to user-supplied external hooks (eg.
> > >+# post-build, post-images)
> > >+USER_HOOKS_EXTRA_ENV=\
> > >+	BUILD_DIR=$(BUILD_DIR)
[--SNIP--]
> Regarding BUILD_DIR and other variables being exported, is it really
> safe to export other variables with a relatively generic name such as
> TARGET_DIR, BASE_DIR, HOST_DIR, BINARIES_DIR, etc. ? Should we instead
> expose them to post-build/post-image scripts as BR2_<something> ? But
> well, of course, it means breaking the existing API, which isn't nice.

If we export all of those variables with this mechanism rathe than with
the make's 'export', then we again dwell on the sagfe side, and we need
not rename them.

We should have named them BR2_something from the beginning, even for our
internal use, to avoid any name-clashing with the calling environment.
For example:

    $ export BUILD_DIR=/path/to/my/project/build.dir
    $ mkdir -p "${BUILD_DIR}/buildroot.output"
    $ make -C "${BUILD_DIR}//buildroot.output"

Suppose the user has post-{build,image} or other rsource files (eg.
kernel .config) in its ${BUILD_DIR}, then his/her configuration is
broken.

But that's the way story goes, we fscked up at the beginning, we have to
live with them, now... :-(

Anyway, I'll keep this change as-is, and make a new cset that export all
these variables to using this new mechanism, so they only get exported
for post-{build,image} scripts (and the new steps-user-hook).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
