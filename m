From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Mar 2012 22:06:34 +0100
Subject: [Buildroot] Remove clean and uninstall targets [was: Re: [PATCH
	1/2] Add (Freescale) elftosb host package]
In-Reply-To: <4F607CD9.2080300@lucaceresoli.net>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <20120314104146.0e75b488@skate> <4F607CD9.2080300@lucaceresoli.net>
Message-ID: <201203152206.35139.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 March 2012 12:11:21 Luca Ceresoli wrote:
> Moreover, many packages do not implement the CLEAN and UNINSTALL targets:
> 
> $ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'|wc -l
> 111
> $ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'| \
>      xargs grep -l '_CLEAN_CMDS'|wc -l
> 51
> $ git grep -l GENTARGETS package/|grep -E '^package/[a-z]'| \
>      xargs grep -l '_UNINSTALL_.*_CMDS'|wc -l
> 73
> 
> meaning that probably they are not so interesting to everybody out there.

 Uninstall doesn't really work, as Thomas pointed out, so I'm all for 
removing it.

 For the clean target I can imagine a use case, but it's not very
convincing.  Say you're preparing a package patch the painful way 
(i.e. save a copy the source tree, modify the files of the source tree, 
and if all is well run a diff).  Then you may have some modifications 
which are not detected by make (e.g. when you're actually editing the 
Makefile).  So you want to run a make clean.  make foo-dirclean is not
possible because then you loose your changes.  This is where a clean
target could be useful.

 However, it's such a corner case that I don't think it's important.
And if you're hacking away at a package, you can afford to run
'make -C output/build/foo-0.1 clean' manually.


 Removing the clean and uninstall targets will make tab completion
slightly faster as well :-)


 So let's get rid of them!


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
