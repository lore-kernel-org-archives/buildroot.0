From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Apr 2016 22:46:56 +0200
Subject: [Buildroot] bsdiff with buildroot
In-Reply-To: <CADKZYY+U0DdQn061_F+s7An1fubGbpDijxMGHgunWvNoEROx4w@mail.gmail.com>
References: <CADKZYY+U0DdQn061_F+s7An1fubGbpDijxMGHgunWvNoEROx4w@mail.gmail.com>
Message-ID: <571001C0.2030305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Santhosh,

On 04/14/16 07:30, Santhosh Ramani wrote:
> Hello,
>
> I'm trying to install bsdiff package and using buildroot to create my rootfs for
> AM335x device. I've selected the option of custom toolchain and using the
> toolchain provided by TI as part of their SDK 7.0.
>
> I'm having some trouble with bzip2, it's a pre-requisite for bsdiff. When
> installing bzip2, cp seemed to fail. I had to replace the cp statement.

  Since the problem is with bzip2, it would have been more appropriate to put 
that in the subject.

>
>
> Original statement
> =================
> *cp -f bzip2
> /home/sramani/buildroot/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/bunzip2
> *
>
>
> Updated statement
> =================
> *cp --remove-destination -f ~/buildroot/buildroot/output/build/bzip2-1.0.6/bzip2
> /home/sramani/buildroot/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/bunzip2*
>
> I had to do the same thing for *bunzip2*, and *bzcat*.

  I guess this was during the install-staging step? Because in install-target, 
we already explicitly rm all binaries in bzip2.mk.


  This is really a problem in the bzip2 upstream package itself. It's actually 
weird that it installs the executable three times, instead of symlinking or 
hardlinking...

  The underlying issue, I guess, is that you are using a pre-installed custom 
external toolchain, which has bzip2 installed in its sysroot as absolute 
symlinks. When buildroot copies this to the staging directory, the symlink is 
kept, but it points to a file which is not writable by you. So when bzip2 tries 
to overwrite it, it goes through the symlink, and fails to overwrite the file in 
your pre-installed toolchain directory.


  There are a couple of solutions possible:

1. In bzip2.mk, remove any existing bzip2 etc. like we do for target install.

2. In bzip2.mk, use custom staging install commands like we do for host-bzip2 - 
we anyway only need the libraries.

3. Add a patch to the package that fixes the Makefile to use 
--remove-destination, or to use install. This could be combined with using a 
hardlink instead. Probably the 20-legacy patch from debian already solves it, 
because I expect that you only have a problem with bunzip2 and bzcat, not with 
bzip2.



  Regards,
  Arnout



>
> Can someone please help me out? Thank you for your help.
> Regards
>
> Santhosh
>
> -- 
> Greater the Difficulty....Sweeter is the Victory
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
