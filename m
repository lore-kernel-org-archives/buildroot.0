From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 14:42:04 +0100
Subject: [Buildroot] [PATCH 1/1 v2] gcc: Add support for
 --enable-default-pie configure option.
In-Reply-To: <5a5a8ab0-25f3-a3a2-bf5a-b9c7fe851c66@petroprogram.com>
References: <20171228214333.8340-1-stefan.froberg@petroprogram.com>
 <20171228230743.1e6c59ab@windsurf>
 <5a5a8ab0-25f3-a3a2-bf5a-b9c7fe851c66@petroprogram.com>
Message-ID: <20171229144204.00605c4e@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 15:25:21 +0200, Stefan Fr?berg wrote:

> Yes, of course PIE (and other hardening flags) could be passed with
> CFLAGS/CXXFLAGS/LDFLAGS.
> 
> But what if some package does not care about CFLAGS/CXXFLAGS/LDFLAGS?
> (Like for example, zlib by default does not do, but I see that buildroot
> maually passes them
> to configure script)
> 
> Then you would need to patch all those packages while with default PIE
> there would
> be no need to patch. Compiler would automatically do the right thing
> 
> And in the case of PIE, there seems to be tricky rules what to put and
> where:
> https://fedoraproject.org/wiki/Changes/Harden_All_Packages
> 
> From the above link:
> 
> "The key change is that for PIE builds, compilation for static linking
> (such as object files which go into the main program, not a library)
> needs the flag -fPIE.
> 
> But this flag /must not be included when compiling for dynamic linking/
> because the
> resulting object code is not compatible with that.
> 
> To repeat, /*you should not specify both -fpic and -fpie on the same
> command line/*
> because this rarely has the intended effect. "
> 
> So with default pie built into compiler, the compiler would
> automatically do the right thing.
> 
> Other than letting compiler to handle the PIE and changing
> "fstack-protector-all" to
> "fstack-protector-strong"? (introduced in GCC 4.9, pretty much the same
> result that "all" but with less performance penalty)
> that generic hardening patch looks okay to me.
> 
> So I suggest that let the compiler handle PIE.

And what do you propose for external toolchains ?

That's the big limitation in your proposal: it works fine for the
internal toolchain, but doesn't work at all for the external toolchain.
Hence the discussion on using CFLAGS, or the compiler wrapper.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
