From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Apr 2013 22:54:51 +0200
Subject: [Buildroot] ccache problem when compiling with different
 toolchains in different projects
In-Reply-To: <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
References: <CANxTyt7OWfG1U7yoTtRomKm2ECpC_cnxrGFbD8KVXFty==j7ig@mail.gmail.com>
 <CADzL+YjA_Zx0BCmWESKYnna=dGyf=3BY9pd00m-BhAbw-HG9TQ@mail.gmail.com>
Message-ID: <5171AF1B.4010806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/13 13:41, Mathias De Mar? wrote:
>
> wouldn't an alternative possibility be to change the CCACHE_COMPILERCHECK to:
> export CCACHE_COMPILERCHECK=%compiler% -v
>
> You don't rely on the timestamp that way, but you still have a check. I
> believe this resolves the clearing of ccache also (see also
> http://lists.busybox.net/pipermail/buildroot/2012-March/051187.html ).

  That sounds like a very good idea!

  It still has a few shortcomings, but it's definitely better than the 
current situation. At least the following are not solved yet.

- Options included in the external toolchain wrapper are not included. 
For instance, if you switch to Thumb on the Sourcery ARM toolchain, that 
will be recorded in the additional cflags in the wrapper and won't be 
visible to ccache.

- The output of gcc -v contains the absolute path, so if you change the 
output directory (or share the ccache between several developers) it 
won't work. But it would be feasible to strip off the $(O) part.

- For internal/crosstool-NG toolchains, when toolchain parameters are 
changed this is still not detected. For instance, some configure script 
checks for wchar, it fails, you change your configuration to include 
WCHAR and rebuild, and it still fails because the cached test is used...


  The ideal is still what I mentioned a year ago [1]: make a hash of the 
toolchain configuration part of the buildroot config. Too complex, unless 
we do a big rename of the relevant options into BR2_TOOLCHAIN_...
and grep them out of the config.


  Regards,
  Arnout


[1]
    http://lists.busybox.net/pipermail/buildroot/2012-February/049998.html

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
