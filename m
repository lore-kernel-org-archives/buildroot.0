From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 15:33:09 +0100
Subject: [Buildroot] [PATCH v1] valgrind: enabls tls support
In-Reply-To: <1446420326-29281-1-git-send-email-ps.report@gmx.net>
References: <1446420326-29281-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151102153309.7c86ee73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon,  2 Nov 2015 00:25:26 +0100, Peter Seiderer wrote:
> Tested with example program from [1] with qemu_x86_64.
> 
> [1] http://valgrind.10908.n7.nabble.com/Thread-local-storage-TLS-support-td40815.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/valgrind/valgrind.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

I've applied your patch (after fixing the typo in the commit title).

However, it is not a fully correct solution: BR2_GCC_ENABLE_TLS is only
valid for internal toolchains. For external toolchains, it will always
be false, so you will never have TLS support enabled for external
toolchains. I think it would really be easier if Valgrind had a
compile-time way of determining whether TLS support is available or
not, because it is the only package for which we need to know if TLS
support is available or not.

I've nonetheless applied your patch because it doesn't make things
really worse than they are. But I would really prefer if you could do
some research at adjusting valgrind configure.ac to check TLS
availability at compile time.

Generally speaking, I think we should drop BR2_GCC_ENABLE_TLS
altogether, and simply enable TLS whenever we have NPTL threads being
used.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
