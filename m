From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 May 2014 08:52:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-27
In-Reply-To: <20140528063007.1778D101696@stock.ovh.net> (Thomas Petazzoni's
 message of "Wed, 28 May 2014 08:30:07 +0200 (CEST)")
References: <20140528063007.1778D101696@stock.ovh.net>
Message-ID: <87k396cs3q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Build statistics for 2014-05-27
 > ===============================

 >         success : 105
 >        failures : 2  
 >        timeouts : 0  
 >           TOTAL : 107

Wee!

 > Classification of failures by reason
 > ====================================

 >                      monit-5.7 | 1 
 >                      exim-4.82 | 1 

 > Detail of failures
 > ===================

 >        arm |                      exim-4.82 | NOK | http://autobuild.buildroot.net/results/0a392087878f80a70435981856455a30152b684d/

Static linking / pthread issue. I doubt many people really care about
linking something as big as that statically, so I will just make it
depend on !BR2_PREFER_STATIC_LIB for 2014.05.

 >       bfin |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/67623f87f8bc2c73f30bdc3943c58238686c106e/

No GLOB_ONLYDIR. This flag is just an optimization, and from the looks
of the code it seems it will still work if we simply add a patch doing:

#ifndef GLOB_ONLYDIR
#define GLOB_ONLYDIR 0
#endif

But once you fix that the build fails as monit uses fork(), so I will
simply make it depend on BR2_USE_MMU for 2014.05.

-- 
Bye, Peter Korsgaard
