From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Feb 2010 10:17:22 +0100
Subject: [Buildroot] Add verbose of compilling
In-Reply-To: <4B86362F.7020009@18r.ru> (=?utf-8?B?ItCU0LzQuNGC0YDQuNC5Iidz?=
	message of "Thu, 25 Feb 2010 12:34:55 +0400")
References: <4B862786.5090309@18r.ru> <87iq9l7msn.fsf@macbook.be.48ers.dk>
	<4B86362F.7020009@18r.ru>
Message-ID: <87aaux7jz1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "???????" == ???????  <dima@18r.ru> writes:

Hi,

 ???????> Sorry for my English, if i have wrong commented my wish.
 ???????> export PS1="Now compilling: xorg-server, packets 10 of 100"
 ???????> it's an example. i want to see what packet is compilling now.
 ???????> want to information about building in terminal header.
 ???????> Thanks.

Ahh, that should be relatively easy to do - The "package X out of Y" is
hard as we use make and the individual targets don't know what else
needs to be be built, but the current step (package + part) could be
done using a slight tweak of the MESSAGE macro in
package/Makefile.package.in:

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index fbd7f69..c40f83f 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -34,7 +34,7 @@ INFLATE.tgz = $(ZCAT)
 INFLATE.tar = cat
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RES
+MESSAGE = echo -e "\033]0;$($(PKG)_NAME) $($(PKG)_VERSION) $(1)\007"
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 

This only works for new-style packages (and not the toolchain build) though.

-- 
Bye, Peter Korsgaard
