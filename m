From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 21:57:30 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: Add an option to compile
 'nsenter' binary.
In-Reply-To: <549DC8F6.3080403@green-communications.fr>
References: <1419331450-820-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20141226210225.461140c6@free-electrons.com>
 <549DC8F6.3080403@green-communications.fr>
Message-ID: <20141226215730.57250eab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Cavallari,

On Fri, 26 Dec 2014 21:45:42 +0100, Nicolas Cavallari wrote:

> I'm not so sure now ... The fallback uses SYS_netns, instead of the
> kernel's __NR_setns, so i assume that there must be some C library
> support ... uclibc does define SYS_netns to be __NR_setns, so i think
> the problem is still valid if the toolchain does not define SYS_setns.

I was also confused by this, but it's actually util-linux itself that
defines SYS_setns from __NR_setns.

From m4/ul.m4 in util-linux sources:

AC_DEFUN([UL_CHECK_SYSCALL], [
  dnl This macro uses host_cpu.
  AC_REQUIRE([AC_CANONICAL_HOST])
  AC_CACHE_CHECK([for syscall $1],
    [ul_cv_syscall_$1],
    [_UL_SYSCALL_CHECK_DECL([SYS_$1],
      [syscall=SYS_$1],
      [dnl Our libc failed use, so see if we can get the kernel
      dnl headers to play ball ...
      _UL_SYSCALL_CHECK_DECL([_NR_$1],
        [syscall=_NR_$1],
        [
          syscall=no
          if test "x$linux_os" = xyes; then
            case $host_cpu in
              _UL_CHECK_SYSCALL_FALLBACK(m4_shift($@))
            esac
          fi
        ])
      ])
    ul_cv_syscall_$1=$syscall
    ])
  AM_CONDITIONAL([HAVE_]m4_toupper($1), [test "x$ul_cv_syscall_$1" != xno])
  case $ul_cv_syscall_$1 in #(
  no) AC_MSG_WARN([Unable to detect syscall $1.]) ;;
  SYS_*) ;;
  *) AC_DEFINE_UNQUOTED([SYS_$1], [$ul_cv_syscall_$1],
        [Fallback syscall number for $1]) ;;
  esac
])

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
