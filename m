From: Guy Benyei <guybe@mellanox.com>
Date: Tue, 13 Jun 2017 07:40:58 +0000
Subject: [Buildroot] [PATCH] gcc: add option to build and install gcc's
	libssp
In-Reply-To: <20170613090842.6b0b724e@windsurf.lan>
References: <AM3PR05MB433082E20B48215DFA88130C9CD0@AM3PR05MB433.eurprd05.prod.outlook.com>
 <5c2a90b2-8989-fb5d-aed4-f06d3fd3ef43@mind.be>
 <20170613090842.6b0b724e@windsurf.lan>
Message-ID: <AM3PR05MB433EDE15B086B8F000FF64AC9C20@AM3PR05MB433.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tuesday, June 13, 2017 10:09 AM, Thomas Petazzoni wrote:


> >  The new symbol will only appear in two cases:
> >
> > - with uClibc, if BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not selected;
> > - with musl, for i386 and powerpc (because it is broken on musl).
> >
> >  In the uClibc case, I really see no reason to prefer the gcc version
> > instead of the uClibc version. So that basically leaves just the musl
> > case. Is that the situation you are trying to fix? If that is it, I
> > think it's better not to have a config options at all, but just enable the gcc thing
> if musl && (i386 || powerpc).
> >
> >  Or is there another reason why you need this?
> 
> Yes, I'm also wondering about the use case here. Is there any benefit in using the
> compiler-provided libssp, instead of the libc provided implementation? Or,
> opposite question: is there any benefit in using the libc provided implementation
> (as we do today) instead of the compiler-provided one?
> 
> Should we provide a choice for the user to select between the two? I must say
> I'm not really thrilled by this idea because it's a very arcane/specific configuration
> item, which may be difficult for regular users to understand.

I'm actually using uClibc on ARC big-endian architecture, so my target is not musl. We also don't want to enable SSP all the time, only as a tool when memory issues are being debugged. My goal was to provide SSP without any change to uClibc or GCC itself. LibSSP could be copied to the target only when SSP is actually needed.

When double checking the result of compiling uClibc with BR2_TOOLCHAIN_BUILDROOT_USE_SSP, I've seen, that uClibc is actually binary-identical to the version built without BR2_TOOLCHAIN_BUILDROOT_USE_SSP. I find it strange, as actually there should be some additional functions and variables enabled in this case. Anyhow,  might be able to work with the uClibc support enabled by default.

Thanks
      Guy
