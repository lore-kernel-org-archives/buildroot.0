From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 9 Nov 2011 00:38:06 +0100
Subject: [Buildroot] Future...TOOLCHAIN builds..
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6702C39314@WETMEX10.loepfe.com>
References: <1531E53627F1F749B4FE809BF2A4EB6702C39314@WETMEX10.loepfe.com>
Message-ID: <201111090038.06943.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noel, All,

On Monday 07 November 2011 16:07:35 Vellemans, Noel wrote:
> While following the discussions on the buildroot mailing list, I saw
> that for the next releases the CROSSTOOL-NG toolchain will be used as

crosstool-NG, not all caps. ;-)

> default, so a started to experiment with the CROSSTOOL-NG buildroot
> toolchain (this morning).
> 
> Until now.. U used the buildroot to generate a 'cross-toolchain', even
> 'worse'; I used buildroot to generate 2 toolchains. 
> 	A) One running on LINUX 
> 	B) One running on top of CYGWIN (for the less Linux-minded
> colleagues)

I am not quite sure I understand correctly... I'll try to state what I
understood:
  A) you use buildroot on Linux, to build a Linux-hosted cross-toolchain
  B) you use buildroot on Cygwin, to build a Cygwin-hosted cross-toolchain

Right? AFAIK, Cygwin support was never official for buildroot. It working
would have been mere chance! ;-)

> Which was quite easy to do... until now. 
> 
> 1) Will this also be possible for the CROSSTOOL-NG toolchain that is
> build with buildroot?

There have been many reports of successfully building toolchains on Cygwin,
both natively under Cygwin, and as a canadian-built from Linux, with
crosstool-NG. I did it myself a few times, and it worked.

> 2) Another question that pops-up when building a CROSSTOOL-NG toolchain,
> is that I'm not able to select a toolchain with ARM-VECTOR-floating
> point support is this correct? 

When using the crosstool-NG backend, the toolchain options (most of them)
in buildroot are hidden. If you want to tweak the toolchain settings, you
can run:
    make ctng-menuconfig

which will prompt you the crosstool-NG configuration (like linux-menuconfig
or busybox-menuconfig would for the Linux kernel, or busybox).

Then, you can tweak the options at will (notice however that some options
will be forcibly set/reset by the backend mechanism, there is no easy way
for the crosstool-NG menuconfig if it makes sense to show/hide and/or set/
reset these options).

> NOTE: Of the record, the buildroot-CYGWIN-toolchain build was working
> until some weeks ago (for me), in the current git-tree this is not
> working anymore ( build troubles into mpc/mpfr and gmp),

Ah, yes, MPFR has issues building in Cygwin by default. Here's what is
done in crosstool-NG to fix this:
  http://crosstool-ng.org/hg/crosstool-ng/file/tip/scripts/build/companion_libs/mpfr.sh#l66

> without looking
> to much in detail (I think) it has to do with  'another' way of naming
> libs 'libxxxxx' on Linux vs 'cygxxxxxxx' on cygwin!

I've never experienced such weirdness... Surely, shared libraries in
Cygwin are named libxxx, from what I could see. It's the first time I
read about a 'cyg' prefix...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
