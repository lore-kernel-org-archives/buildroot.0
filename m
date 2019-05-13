From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 May 2019 13:55:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-12
In-Reply-To: <20190513060042.2B05F852CF@fraxinus.osuosl.org>
References: <20190513060042.2B05F852CF@fraxinus.osuosl.org>
Message-ID: <20190513135520.6ced2ff2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Giulio, Matt, Vadym, Gilles, Peter, Adrian, there are some
questions/topics/issues for you below!

On Mon, 13 May 2019 06:00:37 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  30 |   1 |   0 |  31 |
>       master | 177 |  11 |   5 | 193 |

Results are not too bad, but we have a fairly high number of timeouts,
which is not nice. Let's have a look at the details.

> microblazeel |                           atop | TIM | http://autobuild.buildroot.net/results/94aa00f776b8a3491ac0b3212c95f5e666c5a29a |     

This seems weird. Happened when linking a fairly simple application,
never had another timeout on that package.

Giulio, could you try to re-run the exact same defconfig (using
br-reproduce-build) and see if it's reproducible ?

>          arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/a81eb395bd95306fcbb07c1443c9134fd63fa379 | ORPH

This would be fixed by http://patchwork.ozlabs.org/patch/1098520/.

> microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/e196d77626b877dc3454d21febe20a04877c02a9 |     

Another weird timeout, this time on Matt's autobuilder. Matt, could you
have a look ?

But this seems to happen quite regularly, even on other autobuilder
machines:

  http://autobuild.buildroot.net/?reason=glibmm

Always on microblazeel, like the timeout on "atop" discussed above. I
guess that probably points at a compiler issue, which means it should
be reproducible.

>  powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/30bcf2ab8f95574b20ac2833ce237b3a885c01b8 |     

The usual host-libsodium timeout on Julien's machine, there is a
separate thread of discussion about it.

>       mipsel |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/176a40dd27ad92e5ad07eabbacdddf4e95edcba7 |     

/data/buildroot/buildroot-test/instance-1/output/host/bin/autoconf: line 442: /usr/bin/sed: No such file or directory
/data/buildroot/buildroot-test/instance-1/output/host/bin/autoconf: line 405: /usr/bin/expr: No such file or directory
/data/buildroot/buildroot-test/instance-1/output/host/bin/autoconf: line 407: /usr/bin/expr: No such file or directory
/data/buildroot/buildroot-test/instance-1/output/host/bin/autoconf: line 442: /usr/bin/sed: No such file or directory
/data/buildroot/buildroot-test/instance-1/output/host/bin/autoconf: line 442: printf: write error: Broken pipe
[...]
expr: error while loading shared libraries: libc.so.6: cannot open shared object file: No such file or directory
sed: error while loading shared libraries: libc.so.6: cannot open shared object file: No such file or directory
/data/buildroot/buildroot-test/instance-1/output/host/bin/autoconf: line 442: printf: write error: Broken pipe
expr: error while loading shared libraries: libc.so.6: cannot open shared object file: No such file or directory

Wow, this looks like a system/distro issue.

Xogium, did you do any system update around the time of this build
failure ? Could you have a look ?

>      aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3896b76ea6494222e062369e537a76da577f502e |   

Would be fixed by http://patchwork.ozlabs.org/patch/1047538/.
  
>          arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/ee6d037154127cc6572f06e9a78bae383ea381bc |     
>          arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/e505ec5aed040b34754d75e91f9de7ca334f2da9 |     

Would be fixed by http://patchwork.ozlabs.org/patch/1098523/.

>       mipsel |                        netsurf | TIM | http://autobuild.buildroot.net/results/b454b00198ddd6601b2238f9c1d0bb2154c1901e |     
>      riscv64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/fc1ffc5c3a006f66b11de0e0127e4224aec1aa2d |     

Would be fixed by my netsurf patch series.

>      powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/04ac3da1d9584095f57f3ea07de73e06449618d8 |     

Ditto.

>      powerpc |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/a1446b419f5f59f65fe80849182e38457de203b5 |     

Some libintl dance missing. Vadim ?

>         i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/674ef1b8791c7f9dbdf4e7a0f84192abb59c21ae |     

gsm0610_rpe.c:132:5: error: invalid 'asm': invalid constraints for operand

Bernd ?

>       mipsel |            tesseract-ocr-4.0.0 | NOK | http://autobuild.buildroot.net/results/dba4cf210815c66aac5474fbc05f418a2cc98bf6 |     

ERROR: fra.traineddata has wrong sha256 hash:
ERROR: expected: eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913
ERROR: got     : 86afb23ad146467f263e8ade56fd3951b1cc28f8c4eebc34f993d3c02d88a7ab
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Ah ah. Seems like sources.buildroot.net does not have the latest
version of the files. But in fact the issue is that the file names do
not contain the version... so obviously this is not going to work well.

I think our approach of downloading the tessdata files from the
tesseract-ocr package is not good. We probably need to have a separate
tessdata package, that downloads the entire dataset, so that we can
rely on proper version numbers.

Gilles: could you cook a patch to implement this ?

>      aarch64 |                    whois-5.4.0 | NOK | http://autobuild.buildroot.net/results/d272b906cc0a1dcced2b8d48aad77b272300005a |     

2019-05-12 13:20:06 ERROR 500: Internal Server Error.

on the Debian server + our mirror didn't had the tarball.

Peter, any idea why our mirror doesn't have the tarball ? The bump
dates back from January 2019, we should have mirrored the tarball since
then.

>          arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/07dded285364ca342c3270ba71bdc8ef72e1db26 |     

Should be fixed by http://patchwork.ozlabs.org/patch/1085508/, but we
still haven't received feedback from Adrian on this one.

> Results for branch '2019.02.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                    netsurf-3.8 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>         m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a2097f0bf03d8409164cc8ad6dba6775c49d3f91 |     

Same static linking issue, would be fixed by my patch series on netsurf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
