From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 29 Dec 2017 15:25:21 +0200
Subject: [Buildroot] [PATCH 1/1 v2] gcc: Add support for
 --enable-default-pie configure option.
In-Reply-To: <20171228230743.1e6c59ab@windsurf>
References: <20171228214333.8340-1-stefan.froberg@petroprogram.com>
 <20171228230743.1e6c59ab@windsurf>
Message-ID: <5a5a8ab0-25f3-a3a2-bf5a-b9c7fe851c66@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Yes, of course PIE (and other hardening flags) could be passed with
CFLAGS/CXXFLAGS/LDFLAGS.

But what if some package does not care about CFLAGS/CXXFLAGS/LDFLAGS?
(Like for example, zlib by default does not do, but I see that buildroot
maually passes them
to configure script)

Then you would need to patch all those packages while with default PIE
there would
be no need to patch. Compiler would automatically do the right thing

And in the case of PIE, there seems to be tricky rules what to put and
where:
https://fedoraproject.org/wiki/Changes/Harden_All_Packages

From the above link:

"The key change is that for PIE builds, compilation for static linking
(such as object files which go into the main program, not a library)
needs the flag -fPIE.

But this flag /must not be included when compiling for dynamic linking/
because the
resulting object code is not compatible with that.

To repeat, /*you should not specify both -fpic and -fpie on the same
command line/*
because this rarely has the intended effect. "

So with default pie built into compiler, the compiler would
automatically do the right thing.

Other than letting compiler to handle the PIE and changing
"fstack-protector-all" to
"fstack-protector-strong"? (introduced in GCC 4.9, pretty much the same
result that "all" but with less performance penalty)
that generic hardening patch looks okay to me.

So I suggest that let the compiler handle PIE.

Either builtin (need GCC 6.x + ), with specs file (very ugly and messy
but also very effective) or maybe
compiler wrapper (call it "hardened-gcc/g++" or whatever) that I
remember Arnout Vandecappelle suggesting.

Best Regards
-S-



Thomas Petazzoni kirjoitti 29.12.2017 klo 00:07:
> Hello,
>
> On Thu, 28 Dec 2017 23:43:33 +0200, Stefan Fr?berg wrote:
>> By default, buildroot produces insecure binaries.
>>
>> GCC 6.x added build time configuration option "--enable-default-pie".
>> With that enabled, GCC will produce PIE 
>> (Position-independent executables) binaries.
>>
>> PIE is a requirement for ASLR (Address space layout randomization)
>> that will make exploits like return-to-libc attack impossible. 
>>
>> If you want to have a modern, secure system then enable this option.
>>
>> To override this default behaviour, you can use -no-pie
>> with your CFLAGS/CXXFLAGS.
>>
>> https://gcc.gnu.org/onlinedocs/gcc-6.2.0/gcc/Link-Options.html
> As I said in my previous review, I think we want a solution that also
> applies to external toolchains, by passing -pie in the compiler wrapper.
>
> Please see "[PATCH 2/2] security hardening: add RELFO,  FORTIFY
> options" in the mailing list archives,
> https://patchwork.ozlabs.org/patch/830085/, it was also adding -pie
> support, but in a more generic way. Could you use this instead ?
>
> Thanks!
>
> Thomas

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171229/b8c720cf/attachment.html>
