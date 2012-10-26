From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Oct 2012 00:58:02 +0200
Subject: [Buildroot] [PATCH 02/47] package/libfdt: new package
In-Reply-To: <201210261936.20493.yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
 <1351113973-17237-3-git-send-email-yann.morin.1998@free.fr>
 <5089B564.4090500@mind.be> <201210261936.20493.yann.morin.1998@free.fr>
Message-ID: <508B157A.9050409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/10/12 19:36, Yann E. MORIN wrote:
> Arnout, All,
>
> On Thursday 25 October 2012 Arnout Vandecappelle wrote:
[snip]
>>    dtc generates Flattened Device Trees (i.e. it flattens the device
>> tree).
>
>  From Documentation/manual.txt:
>
> ---8<---
> The currently supported Input Formats are:
>      - "dtb": "blob" format.  A flattened device-tree block with
>          header in one binary blob.
>      - "dts": "source" format.  A text file containing a "source"
>          for a device-tree.
>      - "fs" format.  A representation equivalent to the output of
>          /proc/device-tree  where nodes are directories and
>          properties are files.
>
> The currently supported Output Formats are:
>       - "dtb": "blob" format
>       - "dts": "source" format
>       - "asm": assembly language file.  A file that can be sourced
>          by gas to generate a device-tree "blob".  That file can
>          then simply be added to your Makefile.  Additionally, the
>          assembly file exports some symbols that can be used.
> ---8<---
>
> So, dtc does not /generate/ flattened, it uses them as _input_.

  Only the dtb is flattened, the source and fs are still a tree.
But anyway, what I wrote wasn't correct either.

> What about this formulation (also from the same manual.txt) :
>
>      The Device Tree Compiler, dtc, takes as input a device-tree in
>      a given format and outputs a device-tree in another format.

  Much better :-)


>>> +	  Note that only the library is installed for now.
>>    Why?  Build failures in the binaries?
>
> Because I do not need it in my use-case, so I did not test it, so
> I did not install it.

  Well, it just seems silly to do extra effort to remove something from the
build, unless there's a good reason for it. So unless there's a build
failure, I would include the dtc as well even if you haven't tested it
on the target.


> Also, this package could probably also be a host package. This patch
> only adds dtc as a target package.

  For the host package, it's probably dtc that you need anyway...

>
> [--SNIP--]
>>> ++++ dtc-e4b497f367a3b2ae99cc52089a14a221b13a76ef/Makefile	2012-10-22 22:03:21.151047833 +0200
>>> +@@ -18,7 +18,7 @@
>>> + CPPFLAGS = -I libfdt -I .
>>> + WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
>>> + 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls
>>> +-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
>>> ++CFLAGS = -g -Os -fPIC -Werror $(WARNINGS) $(EXTRA_CFLAGS)
>>
>>    Why not CFLAGS += ...?
>>
>>    And maybe CPPFLAGS should also be fixed.
>
> I'll look again at this.
>
> [--SNIP--]
>>> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
>>> new file mode 100644
>>> index 0000000..d53e78a
>>> --- /dev/null
>>> +++ b/package/dtc/dtc.mk
>>> @@ -0,0 +1,36 @@
>>> +#############################################################
>>> +#
>>> +# libcurl
>
> dtc, not libcurl. Sigh...
>
>>> +#
>>> +#############################################################
>>> +
>>> +DTC_VERSION         = e4b497f367a3b2ae99cc52089a14a221b13a76ef
>>> +DTC_SITE            = git://git.jdl.com/software/dtc.git
>>> +DTC_LICENSE         = GPLv2+/BSD-2c
>>> +DTC_LICENSE_FILES   = README.license GPL
>>> +# Note: the dual-license only applies to the library.
>>> +#       The DT compiler (dtc) is GPLv2+, but we do not install it.
>>> +DTC_INSTALL_STAGING = YES
>>> +
>>> +# Need -fPIC for x86-64
>>    ???
>
> Probably left-over from debugging?...

  Now I see it: the -fPIC is in the upstream Makefile and is required
(unlike the -g -Os -Werror), so the CFLAGS shouldn't just be overridden.



  Regards,
  Arnout
[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
