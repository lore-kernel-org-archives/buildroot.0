From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Jul 2015 17:36:35 +0200
Subject: [Buildroot] [git commit] tor: fix building if GCC's C standard is
	not gnu99
Message-ID: <20150702154951.25A197F8F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cf5b390385fb6325485e37dc9d38e1e3ac1f091
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Up to date tor (at least starting from 0.2.6) requires compiler with C99
plus some extensions support.

If default GCC's C standard < c99 (that's the case@least for ARC)
you'll see this on attempt to build tor:
----------------------->8--------------------
src/common/address.c: In function ''tor_addr_parse_PTR_name':
src/common/address.c:502:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i = 0; i < 16; ++i) {
     ^
src/common/address.c:502:5: note: use option -std=c99 or -std=gnu99 to compile your code
----------------------->8--------------------

Once you follow compiler advice and enable c99 support with "-std=c99"
you'll pass that failure but will see tons of other errors, see
https://www.mail-archive.com/tor-dev at lists.torproject.org/msg06273.html

And only g99 resolves all problems at once.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 9cca011..f6d3b7f 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -32,4 +32,6 @@ else
 TOR_CONF_OPTS += --disable-seccomp
 endif
 
+TOR_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+
 $(eval $(autotools-package))
