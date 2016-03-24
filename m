From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 24 Mar 2016 18:57:00 +0300
Subject: [Buildroot] Fail to build host-gcc-final-4.9.3 with GLIBC / CPP
	support
In-Reply-To: <9cb4c66e-af90-4f58-a832-7a43c7a50248@MAIL-SINTERS-01.sinters-int.fr>
References: <9cb4c66e-af90-4f58-a832-7a43c7a50248@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <CAMo8BfLn=AOQSbBnGXDgW341ZHdxexwoWoSWM_tN8YO7_Ygtpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Thu, Mar 24, 2016 at 4:13 PM, Julien CORJON <corjon.j@ecagroup.com> wrote:
> ../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:837:1:
> note: in expansion of macro ?CHECK_SIZE_AND_OFFSET?
>   CHECK_SIZE_AND_OFFSET(dirent, d_ino);
>   ^

looks like it's the libsanitizer issue, fixed in gcc 5.x, see the
comment at the top of
libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:

// Tests in this file assume that off_t-dependent data structures match the
// libc ABI. For example, struct dirent here is what readdir() function (as
// exported from libc) returns, and not the user-facing "dirent", which
// depends on _FILE_OFFSET_BITS setting.
// To get this "true" dirent definition, we undefine _FILE_OFFSET_BITS below.
#ifdef _FILE_OFFSET_BITS
#undef _FILE_OFFSET_BITS
#endif

I'll backport the fix.

-- 
Thanks.
-- Max
