From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 3 Oct 2018 00:27:58 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] brltty: use gcc instead of ld to link shared objects
In-Reply-To: <CAPi7W83NmGRMjHPmBcayMTuGJM5c2qY_5UkPKBhybAcckfTQPQ@mail.gmail.com>
References: <20180920172809.19993-1-fontaine.fabrice@gmail.com>
 <20180920210109.179978c4@windsurf>
 <CAPi7W81sP0HvhtrJs4m+RMsJ1o_P1HMvZ8hg4hkqL94xqe5a+w@mail.gmail.com>
 <87musbqrxu.fsf@home.blind.guru>
 <CAPi7W83NmGRMjHPmBcayMTuGJM5c2qY_5UkPKBhybAcckfTQPQ@mail.gmail.com>
Message-ID: <9f49be45-44fc-3ef8-93ac-bfa161f93807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/09/2018 23:55, Fabrice Fontaine wrote:
> Dear Mario, Thomas,
> 
> Le?ven. 21 sept. 2018 ??08:34, Mario Lang <mlang@blind.guru> a ?crit?:
> 
>     Fabrice Fontaine <fontaine.fabrice@gmail.com
>     <mailto:fontaine.fabrice@gmail.com>> writes:
> 
>     > Dear Thomas,
>     >
>     > Le jeu. 20 sept. 2018 ? 21:01, Thomas Petazzoni <
>     > thomas.petazzoni at bootlin.com <mailto:thomas.petazzoni@bootlin.com>> a ?crit :
>     >
>     >> Hello,
>     >>
>     >> On Thu, 20 Sep 2018 19:28:09 +0200, Fabrice Fontaine wrote:
>     >> > Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
>     >> > version 5.5.
>     >> >
>     >> > Indeed, third patch was merged upstream but it was then reverted:
>     >> >
>     >>
>     https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416
>     >> >
>     >> > Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
>     >> > was renamed into MKREL. So, instead of patching again brltty, overwrite
>     >> > MKREL to use "gcc -shared -o" instead of "ld -r -o".
>     >>
>     >> Are you really sure gcc -shared -o does the same thing as ld -r -o ?

 I'm a bit confused... ld -r creates a relocatable object file (partial
linking), while ld -shared creates a shared library. According to the gcc man
page, gcc -shared to create a relocatable object file as well, i.e. they are
equivalent. However, in the spec file, I see that -shared is just passed to the
linker as -shared, not as -r...


>     ld fails to link on mipsel at least.? What else should we do?
>     "ABI is incompatible with that of the selected emulation"
>     "Attempt to do relocatable link with elf64-tradlittlemips input and
>     elf32-ntradlittlemips output"
> 
> After more investigations, it seems that this issue is raised only on mips64el
> (at least on autobuilders: http://autobuild.buildroot.org/?reason=brltty-5.6).
> On this target, by default, ld wants to link a 32 bits binary (I don't know why).
> This issue can be fixed by setting LD="$(TARGET_LD) -melf64ltsmip". However, I
> don't know if this a better solution, it seems like a workaround to a toolchain
> issue.

 In general, it is possible that additional options have to be passed to ld to
make sure it creates the correct type of ELF file. The toolchain-wrapper makes
sure that the correct options are passed. Calling ld directly bypasses those.


>     Hmm, maybe this is a HOST/TARGET mixup?? But how?
> 
>     > I didn't think about it, I basically backported the behavior of third patch
>     > (upstream commit 4c8aba42e246b96d10ffcbd57653682375499e46). The third patch
>     > applied to brltty 5.5 (https://patchwork.ozlabs.org/patch/854093/) was
>     > replacing MKOBJ ($(LD) -r -o) by MKMOD defined as (CC)
>     > ${brltty_mkmod_gcc_make=-shared}
>     > BRLTTY_OPTIONS_LD2CC([${brltty_mkmod_ld_options}]) -o" with
>     > brltty_mkmod_ld_make="-shared" on linux (see
>     >
>     https://github.com/brltty/brltty/blob/4c8aba42e246b96d10ffcbd57653682375499e46/configure.ac
>     > ).
>     > More information can be found here:
>     > https://github.com/brltty/brltty/pull/113
>     > However, I don't know why this commit was reverted one week later.
>     > Mario, you told us in the review of the first patch that the upstream
>     > author decided to "fix" the issue in a different way but actually the issue
>     > is not fixed. Do you know why this commit was reverted? If needed, I can
>     > create an issue to get more info.
> 
>     It was reverted because it failed to build on Mac OS X, and Mac OS X was
>     deemed more important then cross-compiling on Linux.

 What might work is to add a condition for MKREL like already exists for MKSHR:

   if test "${GCC}" = "yes"
   then
      brltty_cv_prog_make_object_relocatable="\$(CC) -shared -o"
   else
      brltty_cv_prog_make_object_relocatable="\$(LD) -r -o"
   fi


 Regards,
 Arnout

> 
>     Upstream (dave at mielke.cc) is very responsive, maybe you have more luck
>     trying to work this one out with him?
> 
>     -- 
>     CYa,
>     ? ?????
> 
> Best Regards,
> 
> Fabrice
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
