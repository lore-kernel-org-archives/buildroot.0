From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Nov 2015 09:13:44 +0100
Subject: [Buildroot] [PATCH] openntpd: fix linking problem when building
	statically
In-Reply-To: <1441614903-38623-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 7 Sep 2015 09:35:03 +0100")
References: <1441614903-38623-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <874mgb3jd3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > The problem looks like this:
 >   CCLD     ntpd
 > ../compat/.libs/libcompat.a(libcompat_la-arc4random.o): In function
 > `arc4random':
 > /br/output/build/openntpd-5.7p4/compat/arc4random.c:183: undefined
 > reference to `pthread_mutex_lock'
 > /br/output/build/openntpd-5.7p4/compat/arc4random.c:185: undefined
 > reference to `pthread_mutex_unlock'
 > ../compat/.libs/libcompat.a(libcompat_la-arc4random.o): In function
 > `arc4random_buf':
 > /br/output/build/openntpd-5.7p4/compat/arc4random.c:192: undefined
 > reference to `pthread_mutex_lock'
 > /br/output/build/openntpd-5.7p4/compat/arc4random.c:194: undefined
 > reference to `pthread_mutex_unlock'
 > /br/output/build/openntpd-5.7p4/compat/arc4random.c:194: undefined
 > reference to `pthread_mutex_unlock'
 > collect2: error: ld returned 1 exit status

 > Adding -pthread to LDFLAGS fixes the problem.

 > Fixes:

 >   http://autobuild.buildroot.net/results/b12/b120b6da87ae4eb355d06f2fd8f4fc8050410897/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/openntpd/openntpd.mk |    5 +++++
 >  1 files changed, 5 insertions(+), 0 deletions(-)

 > diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
 > index d51f902..816001a 100644
 > --- a/package/openntpd/openntpd.mk
 > +++ b/package/openntpd/openntpd.mk
 > @@ -9,6 +9,11 @@ OPENNTPD_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 >  OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 >  OPENNTPD_LICENSE_FILES = COPYING
 
 > +# openntpd needs -pthread if linking statically
 > +ifeq ($(BR2_STATIC_LIBS),y)
 > +OPENNTPD_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
 > +endif
 > +

-pthread both affects compilation (it normally adds -D_REENTRANT) and
linking, so we should afaik pass it in CFLAGS instead. It isn't really a
problem with static linking (but something else probably pulls in
libpthread when linking dynamically) so I've changed it to pass -pthread
unconditionally and added a note about why.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
