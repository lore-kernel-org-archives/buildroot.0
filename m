From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 4 May 2016 22:53:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
In-Reply-To: <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
References: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
 <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
 <CALupW3BnsWbBFZhd+GQe26rtXsg-KZUsxkxupZ_5J88Yb14PeA@mail.gmail.com>
Message-ID: <CAHXCMMLQeK=Wka332sFg-h4_g_14-FhXFH0NcTjFkbsJ2aCPjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On May 2, 2016 11:35 PM, "Steve deRosier" <derosier@gmail.com> wrote:
>
> Hi Samuel,
>
> Thanks for taking a detailed look at this. Hopefully my answers below
> will address your concerns.
>
>
> On Mon, May 2, 2016 at 12:44 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> >> +
> >> ++# Options to control if we build static or shared libraries. Needed because
> >> ++# cmake has us explicitly do both versions if we want both versions.
> >> ++option(FLATCC_WITH_STATIC "Build the static version of the library" ON)
> >> ++option(FLATCC_WITH_SHARED "Build the shared version of the library" ON)
> > I'm not a big fan of this because:
> > - it kinda adds some feature to flatcc;
> > - it completely by-passes the standard CMake way of driving
> > shared/static libs build (using BUILD_SHARED_LIBS) that the Buildroot
> > infrastructure automaticllay set [1].
> >
>
> I wish you spoke up two weeks ago when Arnout explicitly asked me to
> add the shared+static to the build. You could've saved me a good week
> of work and two weeks delay in getting support for this upstreamed.
Indeed. I missed that one... Sorry about that :-s


>
> As you note, CMake can only do static OR shared libraries without
> specific supporting code in the project's CMakeLists file. The change
> I made is a common idiom to support both at the same time. As I was
> asked to add support for buildroot's static + shared if I could, I
> chose to do so.
>
> As for adding a feature to flatcc, that's intended. This will be
> upstreamed to flatcc, however I don't want to wait for the maintainer
> to do a v0.3.4 or greater release with my patch in it.
Fair enough.

>
>
>
> > On this latter point, this is a true limitation of CMake compared to autotools:
> > CMake only provide one boolean flag to control the shared libs. build,
> > instead of a tristate option allowing building: shared libs only, or
> > static libs only, or shared and static libs.
> >
>
> I can't change CMake, but I could easily adjust flatcc to do this.
> Hence I chose to do it this way.
>
>
> > I tend to give priority to the shared libs build (and this is what the
> > infra does [1]).
> >
> > IMO (that does not include other developers), I tend to understand the
> > "shared and static lib" option like this:
> > "do your best, build some libs, shared or static or both, I don't
> > really, but give me something I can use."
>
> Sure. If I left it the way it was, the shared+static was totally
> broken. The interpretation I have of the rules and what was suggested
> to me was it isn't a "do your best", it's a "do as I tell you", which
> is build _both_.
Sorry if we were not clear enough :-s

At least, this discussion will clarify this point, and maybe align BR
developers on the same line.

>
>
> >
> >> ++
> >> + # Disable if cross compiling or if experiencing build issues with certain
> >> + # custom CMake configurations - suspect dependency issue on flatcc tool
> >> + # in custom build steps used by tests and samples.
> >> +@@ -66,6 +71,10 @@ option (FLATCC_ALLOW_WERROR "allow -Werror to be configured" ON)
> >> + # try using this option.
> >> + option (FLATCC_IGNORE_CONST_COND "silence const condition warnings" OFF)
> >> +
> >> ++if (NOT (FLATCC_WITH_STATIC OR FLATCC_WITH_SHARED))
> >> ++      message(FATAL_ERROR "Makes no sense to compile with neither static nor shared libraries.")
> >> ++endif()
> > In such a case, you could check for BUILD_SHARED_LIBS flags...
> >
> > Or the other way around, check first for BUILD_SHARED_LIB, then set
> > FLATCC_WITH_STATIC and/or FLATCC_WITH_SHARED from it.
> >
>
> Setting BUILD_SHARED_LIBS only causes cmake to build shared libs.
> BUILD_STATIC_LIBS causes cmake to build static.
Hmm, I doubt the BUILD_STATIC_LIBS has any effect;.
There is no occurrence of the symbol in the cmake source code.

> Setting both only
> resulted in one working (sorry, can't recall which one off the top of
> my head). No matter how you cut it, I had to modify flatcc to get both
> built. Trust me, I tried everything I could think of to get this to
> work without modifying flatcc. I couldn't trust cmake, and I had to
> make changes, and this is a pattern that other BR projects happen to
> use. So I chose to use it.
>
> As for your second item, it was harmless to flatcc to build both by
> default. If someone explicitly turns both off, then we should tell
> them so, not ignore what they've asked and silently choose something
> other than they explicitly asked.
>
>
> >> +
> >> +# flatcc's cmake build doesn't include install targets, so we need to manually
> >> +# install the various components to their respective destinations. There's
> >> +# several cases that need to be taken care of, so we do a little dance to do so.
> > Sad, no install rules at all in this package. :-(
> >
>
> Mikkel has already corrected this upstream with our input but it is
> not available up through the current release (v0.3.3). For now, this
> is easy enough to do manually, and I'll remove it when we upgrade to a
> release that includes the feature. After I verify it does what I want
> for both the host and target cases.
Then, just backport the patch.

This way, it is less pain when bumping the package to check or detect
that some patches are no longer needed, and does not require heavy
patches on the *.mk file.

>
> > Below, I don't see any install rules for the executables. Are they
> > useless? or for test purpose?
> > Or maybe they are correctly handle by the build system; in such a
> > case, a comment would be welcome ;-)
>
> Well, flatcc contains two things:
> * A library
> * A flatbuffer schema compiler
>
> There is no executable created/needed for the target build.
> The host build only needs the compiler.
Well, in this case, I would have installed everything in the host and
target trees using as much as possible what the package's the
build-system offers (usually 'make install ...'), and add the hooks
removing the compiler in the target tree, and the libs. in the host
tree.

So, if flatcc correctly implements the install target, you won't have
to override the install commands, just implement the hooks.

>
> I thought both the commit message and what flatcc.mk installs makes it
> pretty clear. Perhaps I was wrong about that?
Well... mea culpa. I overlooked the commit log, and I resumed the
review several times before sending it... so forgot the commit log
details.
Regarding this point, the commit log is ok.

>
>
> >> +define FLATCC_INSTALL_STAGING_SHARED
> >> +       $(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.so $(STAGING_DIR)/usr/lib/libflatcc.so
> >> +       $(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.so $(STAGING_DIR)/usr/lib/libflatccrt.so
> >> +endef
> >> +endif
> > You add a patch to the cmake code to build static/shared libs, why not
> > doing the same for the install rules?
> >
>
> Sure, I suppose I could have. However:
> * There is already a patch upstream for this (though I've yet to check
> it's suitability for a xcompile env where we need both host and target
> builds).
Just backport the patch.

> * The install is easy to do from the flatcc.mk without changing flatcc
But it is fragile to package update...

> * I want to be sure to install flatcc for the host, but not for the
> target (because such thing is useless)
Hooks are here for this purpose;-)

> * I want to be sure to install the libraries in the right places for the target
IMO, it is part of the job of the project itself, not really the
package integrators one.

>
> Also - while you're right, I could've added a patch to flatcc, I
> didn't want to unnecessary add stuff to flatcc itself. The difference
> between the install vs the shared/static is it's impossible to do the
> shared/static with only changes to flatcc.mk.

Well, few rules we try to follow in Buildroot:
- submit upstream patches fixing packages (missing/broken install
rules, cross-compilation failure, arch. support, etc), so this can
lower our job on the next package bump;
- limit the "hack" we do in the package's *.mk or via patches to stuff
we know upstream don't want or cannot be upstreamed.

So, if something can be done upstream and in Buildroot, it is better
to do it upstream (as patches, preferrably the backported/submitted
ones) ;-)

>
>
> >> +
> >> +# If we don't have the shared libs to install, don't run target install
> >> +ifeq ($(FLATCC_INSTALL_STAGING_SHARED),)
> > How about using a more straight forward logic?
> > ifeq ($(BR2_STATIC_LIBS),y)
> >
>
> Because doing otherwise was more complex for the shared+static case.
> This seemed more straight-forward to me: "if we don't build the shared
> libs, then don't try to install them". I suppose it's a matter of
> preference.
>
>
> >> +FLATCC_INSTALL_TARGET = NO
> >> +endif
> >> +
> >> +define FLATCC_INSTALL_TARGET_CMDS
> >> +       $(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.so $(TARGET_DIR)/usr/lib/libflatcc.so
> >> +       $(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.so $(TARGET_DIR)/usr/lib/libflatccrt.so
> >> +endef
> >> +
> >> +$(eval $(cmake-package))
> >> +$(eval $(host-cmake-package))
> > What is the purpose of the host package?
> > As-is, I doubt the host package installs anything in the HOST_DIR.
> >
>
> The flatcc executable is a schema compiler. This is a tool that needs
> to be built for the host to run on the host in order to build packages
> that use this tool. It very much installs flatcc in HOST_DIR,
> specifically: '$(HOST_DIR)/usr/bin/flatcc'.
>
> In short, both target and host package are mandatory for flatcc to be
> a functional BR package.
>
> If you'd like to learn more about this package, I refer you to the
> project's github readme:
> https://github.com/dvidelabs/flatcc
>
>
>
> Anyway - I was asked to address the lack of the shared + static case.
> Thus I did. Different opinions exist between the various users and
> maintainers of BR. That's fine and healthy. However, I don't want the
> addition of this package to be caught between a damned if you
> do/damned if you don't disagreement on this subject. The package now
> supports static, shared and shared+static. It builds in all three. It
> builds even if the configuration doesn't select a C++ compiler (which
> I only caught when trying to test this). All in all, I think it's an
> improvement.

Generally speaking, we prefer dealing with patches already merged
upstream (or at least submitted upstream), than recode the same things
in the *.mk files.

About the shared+static librairy build support, IMHO, it's better to
stick to what the upstream does, i.e.:
- if upstream already offers a support for building static and shared
libraries at the same time, then use what the upstream offers; fix it
if needed;
- otherwise, do not try to do add complex stuff in buildroot (either
patching the sources, or implementing some package's build-system
lacks in the Buildroot's *.mk files). We don't usually like carrying
feature patches (unless they are already merged upstream or about to
be), and we try hard to keep things as simple as possible in Buildroot
;-). So, just build shared libraries in that cases. It won't be the
first package doing that, nor the last one ;-)

This could certainly be mention somewhere in the doc as "What to do
with package not supporting building shared and static libraries in
the same build".

Regards,

Samuel
