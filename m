From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 May 2014 21:53:45 +0200
Subject: [Buildroot] [PATCH] perf: Fix compilation without libelf for
	post-3.10 kernels
In-Reply-To: <CAAXf6LUGQ-LSXoPtaiLx53vahgQfpNAx+raKFOd25NbxE3Y=HA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 5 May 2014 14:52:52
 +0200")
References: <1396702262-26514-1-git-send-email-pmeerw@pmeerw.net>
 <CAAXf6LUGQ-LSXoPtaiLx53vahgQfpNAx+raKFOd25NbxE3Y=HA@mail.gmail.com>
Message-ID: <87oazcgfxy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > On Sat, Apr 5, 2014 at 2:51 PM, Peter Meerwald <pmeerw@pmeerw.net> wrote:
 >> kernel commit cf4cca10 (perf tools: Move libelf check config into config/Makefile)
 >> removes the NO_LIBELF check from the top-level Makefile
 >> 
 >> for newer kernels, if config/Makefile exists, we can assume that NO_LIBELF is
 >> also there
 >> 
 >> Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
 >> ---
 >> package/perf/perf.mk | 8 +++++---
 >> 1 file changed, 5 insertions(+), 3 deletions(-)
 >> 
 >> diff --git a/package/perf/perf.mk b/package/perf/perf.mk
 >> index d7898d0..7610f3d 100644
 >> --- a/package/perf/perf.mk
 >> +++ b/package/perf/perf.mk
 >> @@ -36,9 +36,11 @@ define PERF_BUILD_CMDS
 >> fi
 >> $(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
 >> if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile ; then \
 >> -                       echo "The perf tool in your kernel cannot be built without libelf." ; \
 >> -                       echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
 >> -                       exit 1 ; \
 >> +                       if ! test -r $(LINUX_DIR)/tools/perf/config/Makefile ; then \
 >> +                               echo "The perf tool in your kernel cannot be built without libelf." ; \
 >> +                               echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
 >> +                               exit 1 ; \
 >> +                       fi \
 >> fi \
 >> fi
 >> $(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \

 > Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
