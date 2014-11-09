From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Nov 2014 21:52:48 +0100
Subject: [Buildroot] [PATCHv2 3/3] quota: fix static linking
In-Reply-To: <1415539854-25971-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Nov 2014 14:30:54 +0100")
References: <1415539854-25971-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1415539854-25971-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ioiop04f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The aim of this patch is to fix bug #7574, i.e fix the static linking
 > of the quota package. It does so by introducing a patch to the quota
 > build system that generalizes the use of $(LIBS), and then changes
 > quota.mk to use LIBS instead of LDFLAGS to link against intl and tirpc
 > when needed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/quota/02-fix-static-linking.patch | 55 +++++++++++++++++++++++++++++++
 >  package/quota/quota.mk                    |  9 +++--
 >  2 files changed, 59 insertions(+), 5 deletions(-)
 >  create mode 100644 package/quota/02-fix-static-linking.patch

 > diff --git a/package/quota/02-fix-static-linking.patch b/package/quota/02-fix-static-linking.patch
 > new file mode 100644
 > index 0000000..fd73f64
 > --- /dev/null
 > +++ b/package/quota/02-fix-static-linking.patch
 > @@ -0,0 +1,55 @@
 > +Use $(LIBS) properly
 > +
 > +This patch makes sure the quota build system uses $(LIBS) where
 > +appropriate, so that it can be used to link with additional libraries,
 > +which is needed when linking statically.

This patch could be simplified quite a bit if you just did s/LIBS/LDLIBS/
so the existing implicit rules can be used, then we only need to adjust
the explicit link rules (for quotecheck, warnquota, rpc.rquotad), but
Ok.

Committed, thanks.

-- 
Bye, Peter Korsgaard
