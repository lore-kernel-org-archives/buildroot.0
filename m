From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 1 Nov 2017 10:31:19 +0000
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171101112428.710e7181@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <CANQCQpYxR6nParzHgEswkZyh8K2-DUHnTu5VsOtyJOksd3rU5w@mail.gmail.com>
 <20171101104532.43dcd164@windsurf> <1509530473.6560.11.camel@synopsys.com>
 <20171101112428.710e7181@windsurf>
Message-ID: <1509532278.6560.14.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2017-11-01 at 11:24 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 1 Nov 2017 10:01:14 +0000, Alexey Brodkin wrote:
> 
> > 
> > As a matter of fact the same problem happens on ARM if GCC 7 is used.
> > That's my defconfig:
> > --------------------------->8---------------------??
> > BR2_arm=y
> > BR2_GCC_VERSION_7_X=y
> > --------------------------->8---------------------??
> 
> I was surprised because our configuration
> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.buildroot.org_buildroot_tree_support_config-2Dfragments_autobuild_br-2Darm-2Dcortex-2Da9-2D
> glibc.config&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=D6TKGDpqB5e36c8k5ttLo5TXKPAy6Rr2V__fIe0SZqQ&s=sg5deMW
> ka2kFKeMD8y3oFAtgzJyDn_y_x65wnnLaKII&e=
> is using gcc 7.x. But what I missed is that it's a glibc configuration,
> and argp-standalone is only available for !glibc configurations.
> 
> So that explains it all.
> 
> > 
> > --------------------------->8---------------------??
> > make argp-standalone
> > ...
> > .../output/build/argp-standalone-1.3/argp-help.c:1217: undefined reference to `argp_fmtstream_set_wmargin'
> > .../output/build/argp-standalone-1.3/argp-help.c:1199: undefined reference to `argp_fmtstream_puts'
> > collect2: error: ld returned 1 exit status
> > --------------------------->8---------------------??
> > 
> > Speaking about a fix for this problem I guess more elegant could be:
> > --------------------------->8---------------------??
> > ?argp-fmtstream.h | 2 +-
> > ?1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/argp-fmtstream.h b/argp-fmtstream.h
> > index 2dd0925..cb0bead 100644
> > --- a/argp-fmtstream.h
> > +++ b/argp-fmtstream.h
> > @@ -215,7 +215,7 @@ extern int __argp_fmtstream_ensure (argp_fmtstream_t __fs, size_t __amount);
> > ?#if defined(__GNUC__) && !defined(__GNUC_STDC_INLINE__)
> > ?#define ARGP_FS_EI extern inline
> > ?#else
> > -#define ARGP_FS_EI inline
> > +#define ARGP_FS_EI inline __attribute__((__always_inline__))
> > ?#endif
> > ?#endif
> > --------------------------->8---------------------??
> > 
> > If that looks fine to you guys Eugeniy will send out that fix.
> 
> The gnu89-inline solution is the one also used by Alpine Linux,
> https://urldefense.proofpoint.com/v2/url?u=https-3A__git.alpinelinux.org_cgit_aports_tree_main_argp-2Dstandalone_gnu89-2Dinline.patch&d=DwIFaQ&c=DPL
> 6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=D6TKGDpqB5e36c8k5ttLo5TXKPAy6Rr2V__fIe0SZqQ&s=-1-
> MxhKi0bKT4Dj7I80GTQU7mRcVDN2pI3ofvT8IrAM&e=,
> so I believe it's good enough.
> 
> I'll apply Matt's patch after changing the commit log.

Cool, that's fine by me.

Thanks for doing that anyways!

-Alexey
