From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Jul 2010 13:10:39 +0200
Subject: [Buildroot] [git commit master 1/1] sstrip: fix section length
	corruption bug
Message-ID: <20100713111206.BEFEF82793@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c0e307b848d8de23e6f10a179c4f240c023c8b82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on openwrt #6847:

https://dev.openwrt.org/ticket/6847

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/sstrip/sstrip.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/toolchain/sstrip/sstrip.c b/toolchain/sstrip/sstrip.c
index 1842f05..03adc0e 100644
--- a/toolchain/sstrip/sstrip.c
+++ b/toolchain/sstrip/sstrip.c
@@ -253,8 +253,7 @@ static int modifyheaders ## CLASS (Elf ## CLASS ## _Ehdr *ehdr, \
 			ESET(phdr->p_offset,newsize); \
 			ESET(phdr->p_filesz,0); \
 		} else if (EGET(phdr->p_offset) + EGET(phdr->p_filesz) > newsize) { \
-			newsize -= EGET(phdr->p_offset); \
-			ESET(phdr->p_filesz, newsize); \
+			ESET(phdr->p_filesz, newsize - EGET(phdr->p_offset)); \
 		} \
 	} \
  \
-- 
1.7.1
