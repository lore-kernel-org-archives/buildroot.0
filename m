From: Andreas Ziegler <br015@umbiko.net>
Date: Mon, 14 Jun 2021 09:22:23 +0000
Subject: [Buildroot] NDEBUG breaks compilation of GCC 10
Message-ID: <7b2a93a6d61d07972023890ac6d90032@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I seem to attract all the corner cases :-(

After the merge with the recent 'next' branch, compilation of GCC10 
breaks in the gcc-final step.

musl/assert.h:

	#ifdef NDEBUG
	#define	assert(x) (void)0
	#else
	#define assert(x) ((void)((x) || (__assert_fail(#x, __FILE__, __LINE__, 
__func__),0)))
	#endif

gcc/libgomp/target.c:

	{
	  struct target_mem_desc *k_tgt = k->tgt;
	  bool is_tgt_unmapped = gomp_remove_var (devicep, k);
	  /* It would be bad if TGT got unmapped while we're still iterating
	     over its LIST_COUNT, and also expect to use it in the following
	     code.  */
	  assert (!is_tgt_unmapped
		  || k_tgt != tgt);
	}

Build log:
../../../libgomp/target.c: In function ?gomp_unmap_vars_internal?:
../../../libgomp/target.c:1474:9: error: unused variable 
?is_tgt_unmapped? [-Werror=unused-variable]
  1474 |    bool is_tgt_unmapped = gomp_remove_var (devicep, k);
       |         ^~~~~~~~~~~~~~~
../../../libgomp/target.c:1473:28: error: unused variable ?k_tgt? 
[-Werror=unused-variable]
  1473 |    struct target_mem_desc *k_tgt = k->tgt;
       |                            ^~~~~

Introducing -Wno-error=unused-variable seems to help, but maybe there is 
a better solution?

Kind regards,
Andreas
