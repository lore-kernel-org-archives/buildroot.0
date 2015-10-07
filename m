From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Wed, 7 Oct 2015 09:53:05 +0000
Subject: [Buildroot] [PATCH v5 2/2] Patch to assembler to strip LOCK
 prefix.
In-Reply-To: <56116CAE.3070100@mind.be>
References: <1443786554.3328.21.camel@intel.com> <56116CAE.3070100@mind.be>
Message-ID: <1444211584.2759.10.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, 2015-10-04 at 19:15 +0100, Arnout Vandecappelle wrote:
>  We now have a toolchain wrapper both for internal and external toolchains. This
> will allow you to reliably pass options to the compiler. So we'd preferably use
> that approach.

Ok - I will investigate - any examples I can look at?

>  Also, we think it's worthwhile to add a new subarchitecture for the Quark in
> arch/Config.in.x86. This should set the arch and tune options to i586, but the
> toolchain wrapper can then carry an option that adds -Wa,-momit-lock-prefix=yes.
> This also fixes the problem for external toolchains.

Ok - I actually proto-typed this and I couldn't get it to work reliably,
hence the nasty patch.
I should have it on a branch (I hope), I can dust it off. 

>  So the proposal is that you create a first patch that adds BR2_x86_quark and
> adds -Wa,-momit-lock-prefix=yes, and then a second patch that adds the Galileo2
> defconfig.

ok 

>  I have now marked both patches as Changes Requested in out patch tracking
> system, so please resubmit a new version that fixes the above comments,
> otherwise we'll forget about your contribution.

ok - will followup.
(is the patch tracking system public?)

Ray K

> 
>  Regards,
>  Arnout
> 
> 
> > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> > ---
> >  .../galileo/patches/binutils/2.25/default-lock-prefix.patch   | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
> > 
> > diff --git a/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch b/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
> > new file mode 100644
> > index 0000000..7814ae4
> > --- /dev/null
> > +++ b/board/intel/galileo/patches/binutils/2.25/default-lock-prefix.patch
> > @@ -0,0 +1,11 @@
> > +--- a/gas/config/tc-i386.orig	2015-07-24 15:54:51.359080778 +0100
> > ++++ b/gas/config/tc-i386.c	2015-07-24 15:54:59.692192247 +0100
> > +@@ -545,7 +545,7 @@ static int allow_index_reg = 0;
> > + 
> > + /* 1 if the assembler should ignore LOCK prefix, even if it was
> > +    specified explicitly.  */
> > +-static int omit_lock_prefix = 0;
> > ++static int omit_lock_prefix = 1;
> > + 
> > + static enum check_kind
> > +   {
> > 
> 
> 
