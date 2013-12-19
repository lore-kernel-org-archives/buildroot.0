From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Dec 2013 18:33:37 +0100
Subject: [Buildroot] [PATCH v10 0/8] Add support for top-level parallel
	make
In-Reply-To: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52B32DF1.2010702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/12/13 11:36, Fabio Porcedda wrote:
> this is a patch set for adding support for top-level parallel make in
> buildroot, the common problem scattered in buildroot's top-level
> makefiles is that in the rules it relies on the order of evaluation of
> the prerequisites, to be able to use top-level parallel make instead
> of reling on the left to right ordering of evaluation of the
> prerequisites we must add an explicit rule to describe the
> dependencies.
>
> With this patch set the top-level parallel make seems to works fine,
> example:
> 	make clean
> 	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN` + 1))

  Would it be possible to disable BR2_JLEVEL automatically when -j 
appears on the command line?

>
> Before to try it remeber to remove the ".NOTPARALLEL" line.
>
> On my quad core system the building time for qemu_x86_defconfig
> is 14m versus 11m and with ccache enabled 7m vs 5m.

  These are not very relevant benchmarks because there's not a lot that 
can be done in parallel there. It would be much more interesting with an 
allpackageyesconfig (which you'll have to modify by hand BTW to exclude 
some packages that don't build...).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
