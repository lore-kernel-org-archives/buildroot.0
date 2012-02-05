From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Feb 2012 14:41:58 +0100
Subject: [Buildroot] [PATCH 7/7] lttng-babeltrace: fix build on uClibc
	due to missing posix_fallocate()
In-Reply-To: <a42ba268e6311f078f9472d80d7a40d5b576677a.1328366921.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 4 Feb 2012 15:48:48 +0100")
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
 <a42ba268e6311f078f9472d80d7a40d5b576677a.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87y5shqtw9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  ...beltrace-0.8-no-posix-fallocate-in-uclibc.patch |   25 ++++++++++++++++++++
 Thomas>  1 files changed, 25 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch

 Thomas> diff --git a/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch b/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..5ba7f1d
 Thomas> --- /dev/null
 Thomas> +++ b/package/lttng-babeltrace/lttng-babeltrace-0.8-no-posix-fallocate-in-uclibc.patch
 Thomas> @@ -0,0 +1,25 @@
 Thomas> +Do not call posix_fallocate() on uClibc
 Thomas> +
 Thomas> +uClibc does not implement posix_fallocate(), and posix_fallocate() is
 Thomas> +mostly only an hint to the kernel that we will need such or such
 Thomas> +amount of space inside a file. So we just don't call posix_fallocate()
 Thomas> +when building against uClibc.
 Thomas> +
 Thomas> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Normally you need to #include <features.h> to get the __UCLIBC__
define. I don't see any explicit includes of it anywhere in babeltrace,
but presumably some of the headers indirectly include it.

I've added the explicit include to the patch and committed, thanks.

-- 
Bye, Peter Korsgaard
