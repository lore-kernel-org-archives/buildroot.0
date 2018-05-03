From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 3 May 2018 11:07:30 -0500
Subject: [Buildroot] [PATCH 3/4] package/Makefile.in: Remove RELRO
 linker flags from CFLAGS
In-Reply-To: <4fcd5eb1-7cd2-319a-a23f-4cbb3ab06c21@mind.be>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <20180425064518.31797-3-stefan.sorensen@spectralink.com>
 <CANQCQpbyDWsyEQ4ERFfpQ=h_5fU_QnXNcKN-ULOKhMf1e7FLDg@mail.gmail.com>
 <4fcd5eb1-7cd2-319a-a23f-4cbb3ab06c21@mind.be>
Message-ID: <CANQCQpYJ=_po8oNGX5KnY9KtPCZ=AwMY_uXkhCn7_EzPhVpO4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, May 2, 2018 at 4:54 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 30-04-18 19:57, Matthew Weber wrote:
> > Stefan,
> >
> > On Wed, Apr 25, 2018 at 1:45 AM, Stefan S?rensen
> > <stefan.sorensen@spectralink.com> wrote:
> >> The RELRO related flags are for the linker, not the compiler, so they belong
> >> in LDFLAGS.
> >>
> >> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> >> ---
> >>  package/Makefile.in | 10 +++-------
> >>  1 file changed, 3 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/package/Makefile.in b/package/Makefile.in
> >> index 1cbf34e0df..4525b8e79f 100644
> >> --- a/package/Makefile.in
> >> +++ b/package/Makefile.in
> >> @@ -141,9 +141,6 @@ ifeq ($(BR2_DEBUG_3),y)
> >>  TARGET_DEBUGGING = -g3
> >>  endif
> >>
> >> -TARGET_CFLAGS_RELRO = -Wl,-z,relro
> >> -TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
> >> -
> >
> > If you remove these flags from CFLAGS then packages that link with gcc
> > vs explicitly ld won't get the flag.
>
>  The intention is that LDFLAGS is used when linking with $CC/$CXX. Linking with
> ld should ideally never be done, except for some special snowflakes like the kernel.
>
>  The intention is that TARGET_LDFLAGS is used in all linking invocation.
> However, we're pretty sure that for a large number of packages, this isn't
> really the case. That's why we want to move more things into the wrapper.
>

Arnout, in the near term, do you agree we could merge this
patchset(minus patch 3) to fix existing bugs?
