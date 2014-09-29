From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Sep 2014 08:40:32 +0200
Subject: [Buildroot] [git commit] pkg-utils: qstrip MESSAGE
Message-ID: <20140929064500.84DAF9D7CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57ae95be21f8e550bc387a54e8086b8abc48c612
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the MESSAGE macro double-quotes the message. But a few call
sites also double-quote the message, resulting in a borked call to echo,
like:
    $(call MESSAGE,"user text")
would expand to:
    echo "Leading text "user message" trailign text"

Just use qstrip on the user message, so we get protected from either a
comma in the user text (so make does not interpret it), or a semi-colon
(so the shell does not interpret it.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 89ad9e9..44766a0 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -67,7 +67,7 @@ INFLATE.tar  = cat
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
+MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
 TERM_BOLD  := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
