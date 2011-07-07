From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 23:50:06 +0200
Subject: [Buildroot] [PATCH 06/28] package: fix patching procedure for
	host packages
In-Reply-To: <04a4534f698a676c73be6f4ca82235cb1cce69c8.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:53:57 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <04a4534f698a676c73be6f4ca82235cb1cce69c8.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ei21pxpt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The patching procedure was using $($(NOHOSTPKG)_NAME) to find the name
 Thomas> of the package without the host- prefix for host packages, which is
 Thomas> needed to find the package directory and the prefix of the patches.

 Thomas> However, this $($(NOHOSTPKG)_NAME) variable is empty when there is
 Thomas> only an host variant for the package and no target variant for it.

 Thomas> Therefore, instead of using this $($(NOHOSTPKG)_NAME) variable, we now
 Thomas> use a new $(RAWNAME) variable, which is always the name of the package
 Thomas> without the host- prefix, even for host packages.

 Thomas> Thanks to Yann E. Morin for providing the tip on using patsubst
 Thomas> instead of subst.

RAWNAME does fall a bit outside the "namespace" used by the other
variables here, but ok - Committed, thanks.


 Thomas> -$$($(2)_TARGET_PATCH):			NOHOSTPKG=$(3)
 Thomas> +$$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))

Here's to hoping we'll never have a package called 'host' ;)

-- 
Bye, Peter Korsgaard
