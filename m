From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 1 Nov 2017 10:01:14 +0000
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171101104532.43dcd164@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <CANQCQpYxR6nParzHgEswkZyh8K2-DUHnTu5VsOtyJOksd3rU5w@mail.gmail.com>
 <20171101104532.43dcd164@windsurf>
Message-ID: <1509530473.6560.11.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Matthew,

On Wed, 2017-11-01 at 10:45 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 31 Oct 2017 21:37:28 -0500, Matthew Weber wrote:
> 
> > 
> > > 
> > > This is happening only on ARC. Why? Matt Weber proposed a patch,
> > > https://urldefense.proofpoint.com/v2/url?u=https-3A__patchwork.ozlabs.org_patch_832397_&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656e
> > > ViXO7breS55ytWkhpk5R81I&m=TIK4hy7KeHKzHVuof5f5an0Z8AexpTLUombe2nPAH8Y&s=9PIyZnaKCbGWuYkmizNBoKWkNQZ90OFwPSaZUl4-FTQ&e=, but I am not terribly
> > > convinced because it doesn't explain why this problem happens only on
> > > ARC, and why it appeared suddenly.??
> > 
> > I kicked off a test build reverting the following commit.??We'll see
> > in the morning if it changed the behavior or the pass/fail.??(ie bump
> > from GCC 6.x to 7.x)
> > 5bd21f991f3 Evgeniy Didin?????2017-09-21 21:28:28
> 
> OK, we'll see the result.
> 
> > 
> > One interesting thing to notes is the test-pkg is using a external ARC
> > GCC6 uclibc toolchain??and the failing builds are all internal
> > toolchain and GCC 7.
> 
> Yes. But we have other toolchains tested by test-pkg that use gcc 7.x,
> so I'm surprised the problem doesn't pop up on other architectures.

As a matter of fact the same problem happens on ARM if GCC 7 is used.
That's my defconfig:
--------------------------->8---------------------
BR2_arm=y
BR2_GCC_VERSION_7_X=y
--------------------------->8---------------------

Now:
--------------------------->8---------------------
make argp-standalone
...
.../output/build/argp-standalone-1.3/argp-help.c:1217: undefined reference to `argp_fmtstream_set_wmargin'
.../output/build/argp-standalone-1.3/argp-help.c:1199: undefined reference to `argp_fmtstream_puts'
collect2: error: ld returned 1 exit status
--------------------------->8---------------------

Speaking about a fix for this problem I guess more elegant could be:
--------------------------->8---------------------
?argp-fmtstream.h | 2 +-
?1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/argp-fmtstream.h b/argp-fmtstream.h
index 2dd0925..cb0bead 100644
--- a/argp-fmtstream.h
+++ b/argp-fmtstream.h
@@ -215,7 +215,7 @@ extern int __argp_fmtstream_ensure (argp_fmtstream_t __fs, size_t __amount);
?#if defined(__GNUC__) && !defined(__GNUC_STDC_INLINE__)
?#define ARGP_FS_EI extern inline
?#else
-#define ARGP_FS_EI inline
+#define ARGP_FS_EI inline __attribute__((__always_inline__))
?#endif
?#endif
--------------------------->8---------------------

If that looks fine to you guys Eugeniy will send out that fix.

-Alexey
