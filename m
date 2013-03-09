From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 21:15:33 +0100
Subject: [Buildroot] [PATCH 2/5] alsa-lib: fix noMMU build
In-Reply-To: <1362853290-15592-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 9 Mar 2013 19:21:27 +0100")
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362853290-15592-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9qc2uu2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Add a patch to use vfork() instead of fork().
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/alsa-lib/alsa-lib-no-mmu.patch |   44 ++++++++++++++++++++++++++++++++
 Thomas>  package/alsa-lib/alsa-lib.mk           |    1 +
 Thomas>  2 files changed, 45 insertions(+)
 Thomas>  create mode 100644 package/alsa-lib/alsa-lib-no-mmu.patch

 Thomas> diff --git a/package/alsa-lib/alsa-lib-no-mmu.patch b/package/alsa-lib/alsa-lib-no-mmu.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..317676a
 Thomas> --- /dev/null
 Thomas> +++ b/package/alsa-lib/alsa-lib-no-mmu.patch
 Thomas> @@ -0,0 +1,44 @@
 Thomas> +Don't use fork() on noMMU platforms
 Thomas> +
 Thomas> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> +
 Thomas> +Index: alsa-lib-1.0.26/configure.in
 Thomas> +===================================================================
 Thomas> +--- alsa-lib-1.0.26.orig/configure.in	2012-09-06 10:55:14.000000000 +0200
 Thomas> ++++ alsa-lib-1.0.26/configure.in	2013-03-09 16:22:08.000000000 +0100
 Thomas> +@@ -66,6 +66,8 @@
 Thomas> + AM_CONDITIONAL(ALSA_HSEARCH_R, [test "x$HAVE_HSEARCH_R" != xyes])
 Thomas> + AC_CHECK_FUNCS([uselocale])
 Thomas> + 
 Thomas> ++AC_CHECK_FUNC([fork])
 Thomas> ++
 Thomas> + SAVE_LIBRARY_VERSION
 Thomas> + AC_SUBST(LIBTOOL_VERSION_INFO)
 Thomas> + 
 Thomas> +Index: alsa-lib-1.0.26/src/pcm/pcm_direct.c
 Thomas> +===================================================================
 Thomas> +--- alsa-lib-1.0.26.orig/src/pcm/pcm_direct.c	2012-09-06 10:55:14.000000000 +0200
 Thomas> ++++ alsa-lib-1.0.26/src/pcm/pcm_direct.c	2013-03-09 16:22:51.000000000 +0100
 Thomas> +@@ -424,13 +424,21 @@
 Thomas> + 		close(dmix->server_fd);
 Thomas> + 		return ret;
 Thomas> + 	}
 Thomas> +-	
 Thomas> ++
 Thomas> ++#ifdef HAVE_FORK
 Thomas> + 	ret = fork();
 Thomas> ++#else
 Thomas> ++	ret = vfork();

Are you sending this upstream? What's the reason for the HAVE_FORK
check? Why not just always use vfork() instead? That should work fine on
mmu as well (and be a tiny bit faster).

-- 
Bye, Peter Korsgaard
