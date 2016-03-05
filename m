From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 16:55:53 +0100
Subject: [Buildroot] [PATCH 1/1] packages/linux-pam: bump version to
 1.1.8 -> 1.2.1
In-Reply-To: <1440356578-2205-1-git-send-email-brendanheading@gmail.com>
References: <1440356578-2205-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20160305165553.0162aa06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Aug 2015 20:02:58 +0100, Brendan Heading wrote:
> Move to the latest release of linux-pam. This allows us to remove
> a number of patches and consolidate the existing ones :
> 
> - 0001-configure.patch
> - 0007-rhosts.patch
> 
> these two patches deal with the ruserok function, which is not
> usable with uclibc. Consolidated into
> 0002-Conditionally-compile-per-ruserok-availability.patch.
> 
> - 0003-group.patch
> - 0005-succeed.patch
> - 0006-time.patch
> 
> these three patches deal with the innetgr function, which is not
> usable with uclibc. Consolidated into
> 0003-Conditionally-compile-per-innetgr-availability.patch.
> 
> - 0004-mkdir.patch
> 
> Fixed in upstream, no longer required.
> 
> - 0002-doc-makefile-am.patch
> 
> renamed to 0001-doc-makefile-am.patch.
> 
> - 0008-fix-CVE-2014-2583.patch
> - 0009-fix-CVE-2013-7041.patch
> 
> These patches are already included in the new release and so
> can be safely deleted.

Thanks for the detailed commit log explaining the status of the
different patches. Definitely very useful.

> v1 - I thought rather than patching linux-pam 1.1.8 to fix the
> musl compilation issues, we may as well bump to the newer
> version first. I have the musl patches waiting, but thought it
> better to submit this first. This patch includes only the changes
> necessary to get linux-pam 1.2.1 building under uclibc and glibc
> (ie just the version bump).

Unfortunately, building under musl still doesn't work, due to the use
of strndpua(). Alpine Linux has a quick patch for this, but
unfortunately as usual with no description, no authorship, etc. Could
you work on this ?


> --- a/package/linux-pam/0002-doc-makefile-am.patch
> +++ b/package/linux-pam/0001-doc-makefile-am.patch
> @@ -3,6 +3,9 @@ Disable generation of documentation
>  Generation of documentation is not necessary in Buildroot, disable it completely.
>  
>  Signed-off-by: Dmitry Golubovsky <golubovsky@gmail.com>
> +Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> +
> +Upstream-status: inappropriate

I think this patch should be modified to be turned into something that
is upstreamable, like a --disable-doc configure flag.

> +++ b/package/linux-pam/0002-Conditionally-compile-per-ruserok-availability.patch
> @@ -0,0 +1,49 @@
> +ruserok is not available/functional in uclibc, provide conditions
> +for compilation where needed.
> +
> +Patch originally by Dmitry Golubovsky <golubovsky@gmail.com> -
> +porting to linux-pam 1.2.1.
> +
> +Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> +
> +Upstream-status: pending

Where did you submit it? I don't see it on the mailing list, nor in the
bug tracker. Am I missing something? I also don't see it integrated in
the Git repository. Can you ping upstream about this?


> +innetgr is not available/functional in uclibc, provide conditions for
> +compilation.
> +
> +Patch originally by Dmitry Golubovsky <golubovsky@gmail.com> - porting
> +to linux-pam 1.2.1.
> +
> +Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> +
> +Upstream-status: pending

Same comment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
