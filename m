From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu, 19 Mar 2020 14:05:13 -0700
Subject: [Buildroot] [PATCH 1/2] package/llvm: specify
 LLVM_ENABLE_BINDINGS=OFF
In-Reply-To: <a9989967-aadc-04b5-6d8a-502a09d0ef14@gmail.com>
References: <20200316200106.3709163-1-joseph.kogut@gmail.com>
 <bde10ce7-2da8-eb1f-c6d3-f48489eb196f@gmail.com>
 <CAMWSM7iP75XtBBWoeDtXxJ=cjF=-g4+5kbzjD8pR0cTjsXp8tg@mail.gmail.com>
 <a9989967-aadc-04b5-6d8a-502a09d0ef14@gmail.com>
Message-ID: <CAMWSM7iYbKuy5GRqVSDsgU7qHnAk3BQXX1aEs2auzO3KhrFRLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Thu, Mar 19, 2020 at 1:57 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi Joseph,
>
> Le 18/03/2020 ? 01:27, Joseph Kogut a ?crit :
> > Hi Romain,
> >
> > On Mon, Mar 16, 2020 at 3:09 PM Romain Naour <romain.naour@gmail.com> wrote:
> >>
> >> Hi Joseph,
> >>
> >> Le 16/03/2020 ? 21:01, Joseph Kogut a ?crit :
> >>> LLVM builds bindings for other languages such as Go and OCaml when the
> >>> appropriate dependencies can be found. We currently don't support
> >>> building these bindings in Buildroot, as they're currently unused by any
> >>> package.
> >>>
> >>> Building these bindings was originally disabled by overriding the
> >>> dependencies with values indicating that they were not found.
> >>>
> >>> Newer versions of LLVM no longer disable the OCaml bindings when overriding
> >>> OCAMLFIND. Consequently, the build process attempts to install the bindings
> >>> to the default location on the host of /usr/lib/ocaml/llvm, causing a
> >>> permissions error and build failure.
> >>>
> >>> Additionally, LLVM has since added the variable LLVM_ENABLE_BINDINGS to
> >>> control whether bindings are enabled, so we override that to disable the
> >>> bindings.
> >>
> >> My autobuilder doesn't have ocaml libraries installed, maybe I can install them
> >> to trigger the issue.
> >>
> >
> > That would be great. I did check the autobuilders to see if this was a
> > known issue, and didn't find any build problems but timeouts for LLVM.
>
> Actually, the issue can't be trigged on the Fedora distribution since there is
> no ocaml-ctype package [1]. Event with Fedora 30/31 ocaml bindings are
> automatically disabled while configuring llvm:
>
> "OCaml bindings disabled, need ctypes >=0.4."

Gotcha, I'm on Arch, for the record. I might look at spinning up a new
autobuilder to cover this.

>
> [1] https://lists.fedoraproject.org/pipermail/devel/2015-March/208677.html
>
> Best regards,
> Romain
>
> >
> >
> >
> >
> >> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> >>
> >> Best regards,
> >> Romain
> >>
> >>
> >>>
> >>> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> >>> ---
> >>>  package/llvm/llvm.mk | 3 ++-
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
> >>> index 28ad6a5704..f1034f0365 100644
> >>> --- a/package/llvm/llvm.mk
> >>> +++ b/package/llvm/llvm.mk
> >>> @@ -193,7 +193,8 @@ LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
> >>>  # check preventively. Building the Go and OCaml bindings is yet unsupported.
> >>>  HOST_LLVM_CONF_OPTS += \
> >>>       -DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
> >>> -     -DOCAMLFIND=OCAMLFIND-NOTFOUND
> >>> +     -DOCAMLFIND=OCAMLFIND-NOTFOUND \
> >>> +     -DLLVM_ENABLE_BINDINGS=OFF
> >>>
> >>>  # Builds a release host tablegen that gets used during the LLVM build.
> >>>  HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
> >>>
> >>
>
