From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Apr 2013 01:41:49 +0200
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
 <5171AF1B.4010806@mind.be>
 <CANxTyt7N+cKyvksZLSgUADMmgmhdfLBqYd=oRSxCVpKaWYEH1w@mail.gmail.com>
Message-ID: <5171D63D.7050705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/13 01:00, Danomi Manchego wrote:
[snip]
> Regarding the settings hidden by the ext-toolchan wrapper and the built
> toolchain configuration options - what if we took a hash of the
> ext-toolchain wrapper or built compiler itself, and the -v info, and used
> that directly in the ccache check.  We could do a one-time hash when the
> toolchain is set up:
>
>      $(TARGET_CC_NOCCACHE) -v > $(STAMP_DIR)/toolchain-config-info
>      md5sum -b $(TARGET_CC_NOCCACHE) >> $(STAMP_DIR)/toolchain-config-info
>      md5sum $(STAMP_DIR)/toolchain-config-info >
> $(STAMP_DIR)/toolchain-config-info.md5sum

  Not bad! I'd still sed the absolute path out of the 'gcc -v' output, 
though. Then at least with external toolchains you can share the ccache 
between different developers (and an external toolchain is anyway the way 
to go if you want to speed up build time).

> and then set the CCACHE_COMPILERCHECK to "echo
> $(STAMP_DIR)/toolchain-config-info.md5sum".

  The name of the compiler should also be included. gcc compiles 'void 
main () {}' differently than g++.

  BTW it could be optimized a little more by putting the hash in a make 
variable and echo'ing that directly.


> Then, the effects of all the
> hidden variables are in some way accounted for without grepping for them
> in the .config.

  Not entirely. Many toolchain options affect the C library, not the 
compiler. A change in these options may not affect the gcc binary itself. 
Even a gcc configuration option may not change the gcc binary, because 
most of gcc is in cc1 and libgcc.a. But it's still an improvement over 
previous proposals.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
