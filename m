From: Joel Carlson <joelsoncarl@gmail.com>
Date: Thu, 6 Sep 2018 13:58:15 -0600
Subject: [Buildroot] [PATCH] flatcc: add dependency on C++11
In-Reply-To: <87sh2m7745.fsf@dell.be.48ers.dk>
References: <1536261611-13825-1-git-send-email-JoelsonCarl@gmail.com>
 <87sh2m7745.fsf@dell.be.48ers.dk>
Message-ID: <CAAjKBV9WAQQwxCzqTGYFaAgZ+gwRU8SDNuwWKJmp3=MpQFT+Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Sep 6, 2018 at 1:34 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Joel" == Joel Carlson <joelsoncarl@gmail.com> writes:
>
>  > Some of the components built by flatcc require C++. Also, while older
>  > toolchains may work, C11/C++11 is the reference that is expected to
>  > always work.
>
>  > Fixes
>  > http://autobuild.buildroot.net/results/8fb0447eed1d55b7687f657530e31695cf77ce5c/
>
> This is an autobuilder on the next branch. Does this mean that only
> 0.5.2 is affected and not 0.5.1 (the verison on master)?

Sorry, I failed to pay attention to the branches.  This is appropriate
for next, not master.  It looks like some CXX stuff was added into the
CMake files after 0.5.1.

>
>  > Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
>  > ---
>  >  package/flatcc/Config.in | 7 +++++++
>  >  1 file changed, 7 insertions(+)
>
>  > diff --git a/package/flatcc/Config.in b/package/flatcc/Config.in
>  > index 6273f2b..557bd9b 100644
>  > --- a/package/flatcc/Config.in
>  > +++ b/package/flatcc/Config.in
>  > @@ -1,8 +1,15 @@
>  >  config BR2_PACKAGE_FLATCC
>  >      bool "flatcc"
>  > +    # Some components require C++, and C11/C++11 is the reference
>  > +    # expected to always work
>  > +    depends on BR2_INSTALL_LIBSTDCPP
>  > +    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  >      help
>  >        flatcc is C language implementation of Google Flatbuffers. It
>  >        consists of both a library for the target as well as a
>  >        flatbuffer compiler tool for the host.
>
> It is a bit odd that a "C language implementation" really needs C++. Are
> you sure this isn't just for some kind of optional C++ binding?

I will dig into this a bit deeper.  The immediate thing I had noticed
was that CMakeLists.txt changed:
- project (FlatCC C)
+ project (FlatCC C CXX)

I only see a single .cpp file, which is in a tests folder.  I will see
if I can pass/set some options so that C++ isn't necessary, and will
send a new patch if I find that to be the case.

>
> --
> Bye, Peter Korsgaard
