From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 14:13:18 +0100
Subject: [Buildroot] [PATCH] rpcbind: fix attempt to free non-dynamic
 memory
In-Reply-To: <20180117100858.30401-1-ed.blake@sondrel.com>
References: <20180117100858.30401-1-ed.blake@sondrel.com>
Message-ID: <20180117141318.7d337f52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 10:08:58 +0000, Ed Blake wrote:
> Commit 954509f added a security fix for CVE-2017-8779, involving
> pairing all svc_getargs() calls with svc_freeargs() to avoid a memory
> leak.  This included adding a call to svc_freeargs() to
> rpcbproc_callit_com().
> 
> However, rpcbproc_callit_com() allocates memory for args.rmt_args.args
> itself, either dynamically (sendsz > RPC_BUF_MAX) or else on the stack,
> rather than having the memory allocated in svc_getargs().
> 
> The call to svc_freeargs() results in an attempt to free the memory
> allocated by rpcbproc_callit_com(), which if on the stack results in
> undefined behaviour.
> 
> Fix this by removing the svc_freeargs() call, which is not required as
> rpcbproc_callit_com() allocates (and correctly frees) memory itself.
> 
> Change-Id: I7fc34efd58408ec5e626da8edd08aa697ed8b936
> Signed-off-by: Ed Blake <ed.blake@sondrel.com>

Thanks. Is this fix-for-the-fix in the upstream rpcbind project ? If
not, did you submit it ?

I think we'd prefer to keep the existing
0004-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
unchanged, so that it matches the upstream commit, and add an
additional patch that fixes the commit. Just to be inline with what
upstream has.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
