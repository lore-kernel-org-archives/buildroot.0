From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 08:41:59 +0200
Subject: [Buildroot] [PATCH] package/faketime: fix build with gcc >= 6
In-Reply-To: <60001b91-3306-48fb-4973-bf16d3b02f01@gmail.com> (Romain Naour's
 message of "Mon, 15 May 2017 22:36:10 +0200")
References: <20170514212643.17153-1-romain.naour@gmail.com>
 <87mvae9dx7.fsf@dell.be.48ers.dk>
 <60001b91-3306-48fb-4973-bf16d3b02f01@gmail.com>
Message-ID: <87wp9h8frc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

Hi,

 >> > +[Romain: rebase on 0.9.6]
 >> > +Signed-off-by: Romain Naour <romain.naour@gmail.com>
 >> 
 >> It is nice if you use the -x option to git cherry-pick so it adds a
 >> comment about the original git commit id. I've now manually added it.

 > Well, sometime I just use git format-patch -1 HASH when the patch apply cleanly
 > without creating a new branch and cherry-picking. In that case there is no -x
 > option...

No, but in that case you are not rebasing, so the git hash listed in the
commit is the correct one. The -x option is only when you rebase /
cherry-pick for traceability.

>>> +---
 >> > + src/Makefile | 2 +-
 >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
 >> > +
 >> > +diff --git a/src/Makefile b/src/Makefile
 >> > +index 51634b0..bbbd476 100644
 >> > +--- a/src/Makefile
 >> > ++++ b/src/Makefile
 >> > +@@ -67,7 +67,7 @@ INSTALL ?= install
 >> > + PREFIX ?= /usr/local
 >> > + LIBDIRNAME ?= /lib/faketime
 >> > + 
 >> > +-CFLAGS += -std=gnu99 -Wall -Wextra -Werror -DFAKE_STAT
 >> > -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC
 >> > -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
 >> > ++CFLAGS += -std=gnu99 -Wall -Wextra -Werror -Wno-nonnull-compare
 >> > -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS
 >> > -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
 >> 
 >> The -Wall -Werror flags are not so nice, but oh well.

 > ha yes... do you want I send a new patch removing Werror instead ?

So far we don't seem to have any build failures from it (besides this
one), so it isn't strictly needed - Just a potential problem.

I would leave it as is for now, unless if we can convince upstream to
accept such a patch.

-- 
Bye, Peter Korsgaard
