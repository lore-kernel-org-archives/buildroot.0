From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 17 Mar 2020 17:27:41 -0700
Subject: [Buildroot] [PATCH 1/2] package/llvm: specify
 LLVM_ENABLE_BINDINGS=OFF
In-Reply-To: <bde10ce7-2da8-eb1f-c6d3-f48489eb196f@gmail.com>
References: <20200316200106.3709163-1-joseph.kogut@gmail.com>
 <bde10ce7-2da8-eb1f-c6d3-f48489eb196f@gmail.com>
Message-ID: <CAMWSM7iP75XtBBWoeDtXxJ=cjF=-g4+5kbzjD8pR0cTjsXp8tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, Mar 16, 2020 at 3:09 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi Joseph,
>
> Le 16/03/2020 ? 21:01, Joseph Kogut a ?crit :
> > LLVM builds bindings for other languages such as Go and OCaml when the
> > appropriate dependencies can be found. We currently don't support
> > building these bindings in Buildroot, as they're currently unused by any
> > package.
> >
> > Building these bindings was originally disabled by overriding the
> > dependencies with values indicating that they were not found.
> >
> > Newer versions of LLVM no longer disable the OCaml bindings when overriding
> > OCAMLFIND. Consequently, the build process attempts to install the bindings
> > to the default location on the host of /usr/lib/ocaml/llvm, causing a
> > permissions error and build failure.
> >
> > Additionally, LLVM has since added the variable LLVM_ENABLE_BINDINGS to
> > control whether bindings are enabled, so we override that to disable the
> > bindings.
>
> My autobuilder doesn't have ocaml libraries installed, maybe I can install them
> to trigger the issue.
>

That would be great. I did check the autobuilders to see if this was a
known issue, and didn't find any build problems but timeouts for LLVM.




> Reviewed-by: Romain Naour <romain.naour@gmail.com>
>
> Best regards,
> Romain
>
>
> >
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >  package/llvm/llvm.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> > index 28ad6a5704..f1034f0365 100644
> > --- a/package/llvm/llvm.mk
> > +++ b/package/llvm/llvm.mk
> > @@ -193,7 +193,8 @@ LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
> >  # check preventively. Building the Go and OCaml bindings is yet unsupported.
> >  HOST_LLVM_CONF_OPTS += \
> >       -DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
> > -     -DOCAMLFIND=OCAMLFIND-NOTFOUND
> > +     -DOCAMLFIND=OCAMLFIND-NOTFOUND \
> > +     -DLLVM_ENABLE_BINDINGS=OFF
> >
> >  # Builds a release host tablegen that gets used during the LLVM build.
> >  HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
> >
>
