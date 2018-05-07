From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 21:59:05 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: check if -latomic is needed.
In-Reply-To: <20180507195114.16417-1-asafka7@gmail.com>
References: <20180507195114.16417-1-asafka7@gmail.com>
Message-ID: <20180507215905.227b5cfa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 22:51:14 +0300, Asaf Kahlon wrote:

> diff --git a/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
> new file mode 100644
> index 0000000000..3fe290474c
> --- /dev/null
> +++ b/package/zeromq/0002-acinclude.m4-check-if-latomic-is-needed.patch
> @@ -0,0 +1,61 @@
> +From 2ec5a33f6e986661dc92f3585ea400f919a39cae Mon Sep 17 00:00:00 2001
> +From: Asaf Kahlon <asafka7@gmail.com>
> +Date: Mon, 7 May 2018 22:02:25 +0300
> +Subject: [PATCH 1/1] acinclude.m4: check if -latomic is needed.
> +
> +On some cases, -latomic is needed for likning, and since the current

Typo: linking.

> +acinclude.m4 checks only compilation we can sometimes miss the need for -latomic
> +and the linking process will fail.
> +Therefore, the AC_CHECK_IFELSE was replaced with AC_LINK_IFELSE. If the first
> +try fails, we try to link again with -latomic and add LIBS="-latmoic" in case we

Typo: atomic.

> +     ])],
> +-    [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" ; $1],
> +-    [AC_MSG_RESULT(no)  ; libzmq_cv_has_atomic_instrisics="no"  ; $2]
> +-    )
> ++    [AC_MSG_RESULT(yes) ; GCC_ATOMIC_BUILTINS_SUPPORTED=1 libzmq_cv_has_atomic_instrisics="yes" ; $1])

I don't understand why you need a new GCC_ATOMIC_BUILTINS_SUPPORTED
variable, and why you remove the AC_MSG_RESULT(no) case.

> ++    if test "x$GCC_ATOMIC_BUILTINS_SUPPORTED" != x1; then
> ++        save_LDFLAGS=$LDFLAGS
> ++        LDFLAGS="$LDFLAGS -latomic"
> ++        AC_LINK_IFELSE([AC_LANG_SOURCE([
> ++        /* atomic intrinsics test */
> ++        int v = 0;
> ++        int main (int, char **)
> ++        {
> ++            int t = __atomic_add_fetch (&v, 1, __ATOMIC_ACQ_REL);
> ++            return t;
> ++        }
> ++        ])],
> ++        [AC_MSG_RESULT(yes) ; libzmq_cv_has_atomic_instrisics="yes" LIBS="-latomic" ; $1],
> ++        [AC_MSG_RESULT(no) ; libzmq_cv_has_atomic_instrisics="no"; $2])
> ++        LDFLAGS=$save_LDFLAGS
> ++    fi
> + }])

Here is what I would do instead:

AC_DEFUN([LIBZMQ_CHECK_ATOMIC_INTRINSICS], [{
    AC_MSG_CHECKING(whether compiler supports __atomic_Xxx intrinsics)
    AC_LINK_IFELSE([AC_LANG_SOURCE([
/* atomic intrinsics test */
int v = 0;
int main (int, char **)
{
    int t = __atomic_add_fetch (&v, 1, __ATOMIC_ACQ_REL);
    return t;
}
    ])],
    [libzmq_cv_has_atomic_instrisics="yes"],
    [libzmq_cv_has_atomic_instrisics="no"]
    )

    if test "${libzmq_cv_has_atomic_instrisics}" = "no"; then
	save_LDFLAGS=$LDFLAGS
	LDFLAGS="$LDFLAGS -latomic"
	AC_LINK_IFELSE([AC_LANG_SOURCE([
/* atomic intrinsics test */
int v = 0;
int main (int, char **)
{
    int t = __atomic_add_fetch (&v, 1, __ATOMIC_ACQ_REL);
    return t;
}
    	])],
    	[libzmq_cv_has_atomic_instrisics="yes" LIBS="-latomic"],
    	[libzmq_cv_has_atomic_instrisics="no"]
    )

   if test "${libzmq_cv_has_atomic_intrisics}" = "yes"; then
	AC_MSG_RESULT(yes)
	$1
   else
	AC_MSG_RESULT(no)
	$2
   fi	
}])

Or something along those lines. Note: this has been written directly in
my e-mail client, so I'm not sure about all the parenthesis and curly
braces, the indentation is crappy, and it has not been tested in any
way.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
