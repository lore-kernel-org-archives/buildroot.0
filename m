From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 21:13:37 +0200
Subject: [Buildroot] [PATCHv2] system: use system shell as root shell
In-Reply-To: <20190801104851.32619-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 1 Aug 2019 12:48:51 +0200")
References: <20190801104851.32619-1-yann.morin.1998@free.fr>
Message-ID: <87d0hou2am.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Philip Molloy <philip.a.molloy@gmail.com>
 > Signed-off-by: Philip Molloy <philip.a.molloy@gmail.com>
 > [yann.morin.1998 at free.fr: use the sytem shell, not a new option,
 >  as suggested by Arnout]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

 > ---
 > Changes v1 -> v2:
 >   - drop the new option, use the system shell
 > ---
 >  package/skeleton-init-common/skeleton-init-common.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
 > index e429b13d78..b4fb11b369 100644
 > --- a/package/skeleton-init-common/skeleton-init-common.mk
 > +++ b/package/skeleton-init-common/skeleton-init-common.mk
 > @@ -95,6 +95,8 @@ SKELETON_INIT_COMMON_TARGET_FINALIZE_HOOKS += SKELETON_INIT_COMMON_ADD_SH_TO_SHE
 >  ifneq ($(SKELETON_INIT_COMMON_BIN_SH),)
 >  define SKELETON_INIT_COMMON_SET_BIN_SH
 >  	ln -sf $(SKELETON_INIT_COMMON_BIN_SH) $(TARGET_DIR)/bin/sh
 > +	$(SED) '/^\root/s,:[^:]*$$,$(SKELETON_INIT_COMMON_BIN_SH),' \
 > +		$(TARGET_DIR)/etc/passwd

Hmm, wait a second - This sed invocation doesn't make any sense to me.

You search for ^\root, what is the backslash for? The search should also
include the : separator to ensure it doesn't match 'rootfoo' or similar.

You replace the last : and everything after it (E.G. /bin/sh) with
$(SKELETON_INIT_COMMON_BIN_SH), so you drop the last :.

I've fixed that up while committing, thanks.

-- 
Bye, Peter Korsgaard
