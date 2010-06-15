From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jun 2010 12:20:23 +0200
Subject: [Buildroot] [PATCH] Display current action in title bar
In-Reply-To: <20100615115613.29b5b01a@surf> (Thomas Petazzoni's message of
	"Tue, 15 Jun 2010 11:56:13 +0200")
References: <1276523235-26299-1-git-send-email-paul@pauljones.id.au>
	<20100615115613.29b5b01a@surf>
Message-ID: <878w6gegwo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Mon, 14 Jun 2010 23:47:15 +1000
 Thomas> Paul Jones <paul@pauljones.id.au> wrote:

 >> -# MESSAGE Macro -- display a message in bold type
 >> -MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
 >> +# MESSAGE Macro -- display a message in bold type and in the title bar
 >> +MESSAGE  = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)" \
 >> +		&& echo -en "\033]2; $($(PKG)_NAME) $($(PKG)_VERSION) $(1) \007"

 Thomas> I've tried this here in my xfterm (XFCE terminal) and it doesn't do
 Thomas> anything. Is my terminal emulator too crappy ?

 Thomas> Anyway, I'm not sure I'd like to see Buildroot hijack the title bar of
 Thomas> my terminal emulator. Or maybe I'm missing the point of your patch ?

I made a similar patch back in February:

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index fbd7f69..c40f83f 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -34,7 +34,7 @@ INFLATE.tgz = $(ZCAT)
 INFLATE.tar = cat
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
+MESSAGE = echo -e "\033]0;$($(PKG)_NAME) $($(PKG)_VERSION) $(1)\007"
 TERM_BOLD := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)

It's sometimes handy to get an idea of what BR is doing while tons of
text scrolls over the screen, but I'm also not convinced we should do it
by default.

-- 
Bye, Peter Korsgaard
