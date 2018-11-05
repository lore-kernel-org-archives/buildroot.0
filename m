From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Nov 2018 00:40:38 +0100
Subject: [Buildroot] [PATCH] traceroute: fix 'no rule to make target
 -lm' error
In-Reply-To: <19d8f97c-f90d-9a44-6b2b-ad2132aa69af@mind.be>
References: <1539902241-10211-1-git-send-email-sergio.prado@e-labworks.com>
 <20181104114514.523365ee@windsurf> <20181104122638.7103719d@windsurf>
 <19d8f97c-f90d-9a44-6b2b-ad2132aa69af@mind.be>
Message-ID: <51e4e1aa-c4c8-0353-dbfa-722756a49f71@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Oh boy...

On 05/11/18 16:25, Arnout Vandecappelle wrote:
> 
> 
> On 04/11/18 12:26, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sun, 4 Nov 2018 11:45:14 +0100, Thomas Petazzoni wrote:
>>
>>> We briefly discussed this patch during the Buildroot Developers
>>> meeting, and setting VPATH clearly cannot be the right solution, it's a
>>> big hack. A better solution needs to be found :)
>>
>> Looking at http://autobuild.buildroot.net/?reason=traceroute% gives
>> some interesting details:
>>
>>  - Until May 2018, the problem was happening with external toolchains.
>>
>>  - Then, there's a big gap, with no traceroute failures at all
>>
>>  - Since September 11, 2018, the problem started happening again, but
>>    this time around, only with internal toolchains
> 
>  It's due to host-make, which was merged on September 8. You can trivially
> reproduce by doing "make host-make traceroute" with any toolchain. The
> traceroute build system overrides MAKE with make from path:
> 
> Make.rules:20:MAKE = make --no-print-directory -r

 So, why does it work with native make but not with host-make? Running it with
-d tells us the following:

    Considering target file '-lm'.
     Looking for an implicit rule for '-lm'.
     No implicit rule found for '-lm'.
     Finished prerequisites of target file '-lm'.
    No need to remake target '-lm'; using VPATH name '/usr/lib64/libm.so'.

 So, while building *target* traceroute, native make finds /usr/lib64/libm.so...
That is *so* wrong. And the funny thing is, if I query the VPATH variable with
-p or with an explicit $(warning), it actually is empty...

 So for some reason, the system make has the appropriate lib directory in its
VPATH, but our host-make doesn't. In fact, the info page says:

   When a prerequisite's name has the form '-lNAME', 'make' handles it
specially by searching for the file 'libNAME.so', and, if it is not
found, for the file 'libNAME.a' in the current directory, in directories
specified by matching 'vpath' search paths and the 'VPATH' search path,
and then in the directories '/lib', '/usr/lib', and 'PREFIX/lib'
(normally '/usr/local/lib', but MS-DOS/MS-Windows versions of 'make'
behave as if PREFIX is defined to be the root of the DJGPP installation
tree).


 Muhaha. In other words, -lNAME dependencies are broken for cross-compilation!
Indeed, this is coded like this in make (remake.c):

library_search (const char *lib, FILE_TIMESTAMP *mtime_ptr)
{
  static const char *dirs[] =
    {
#ifndef _AMIGA
      "/lib",
      "/usr/lib",
#endif
#if defined(WINDOWS32) && !defined(LIBDIR)
/*
 * This is completely up to the user at product install time. Just define
 * a placeholder.
 */
#define LIBDIR "."
#endif
      LIBDIR,                   /* Defined by configuration.  */
      0
    };

... with no way to override it. So, without patching make, we're always going to
have these incorrect dependencies... The only thing we can do is to set a VPATH
so that the libraries in STAGING_DIR will be found *before* the ones in the host.

 Now, the incorrect dependencies will only affect us in case a Makefile contains
a rule like this:

foo: -lbar
	$(CC) -o $@ $^

because make will expand $^ into the vpath-expanded /usr/lib/libbar.so (assuming
we set VPATH to STAGING_DIR, but libbar.so doesn't exist in STAGING_DIR). But in
that case, we'll get a link error so that situation will be detected and the
Makefile can be patched.

 For traceroute, this isn't the case; it has something like:

LIBS := -lbar
foo: $(LIBS)
	$(CC) -o $@ $(LIBS)

so the VPATH override should work.


 Bottom line: it looks like Sergio's patch is indeed correct, and moreover, it
looks like it might be better to add it to TARGET_MAKE_ENV. Note sure if we want
to take the risk at this point to make such a landslide change?


>  Funnily enough, on my laptop (which has make 4.2.1 so it normally doesn't
> encounter the issue), if I do "make host-make traceroute" I end up with a
> different error:
> 
> make[2]: *** [Makefile:80: libsupp] Segmentation fault (core dumped)
> make[1]: *** [package/pkg-generic.mk:232:
> /home/arnout/src/buildroot/output/build/traceroute-2.1.0/.stamp_built] Error 2
> make: *** [Makefile:84: _all] Error 2
> 
>  I guess that that is completely unrelated though.

 So this is completely unrelated: it is because the way glob is used in make is
incompatible with glibc-2.28. But since any distro which has glibc-2.28 also has
make >= 4.0, it's not so important to fix I guess. OTOH it's just a simple
upstream patch.


 Regards,
 Arnout
