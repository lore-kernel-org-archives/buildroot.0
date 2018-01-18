From: Ed Blake <ed.blake@sondrel.com>
Date: Thu, 18 Jan 2018 12:04:09 +0000
Subject: [Buildroot] [PATCH] rpcbind: fix attempt to free non-dynamic
 memory
In-Reply-To: <20180117141318.7d337f52@windsurf>
References: <20180117100858.30401-1-ed.blake@sondrel.com>
 <20180117141318.7d337f52@windsurf>
Message-ID: <bec65fd2-d926-6ebf-5ab9-5e0c93b03ae3@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/01/18 13:13, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 17 Jan 2018 10:08:58 +0000, Ed Blake wrote:
>> Commit 954509f added a security fix for CVE-2017-8779, involving
>> pairing all svc_getargs() calls with svc_freeargs() to avoid a memory
>> leak.  This included adding a call to svc_freeargs() to
>> rpcbproc_callit_com().
>>
>> However, rpcbproc_callit_com() allocates memory for args.rmt_args.args
>> itself, either dynamically (sendsz > RPC_BUF_MAX) or else on the stack,
>> rather than having the memory allocated in svc_getargs().
>>
>> The call to svc_freeargs() results in an attempt to free the memory
>> allocated by rpcbproc_callit_com(), which if on the stack results in
>> undefined behaviour.
>>
>> Fix this by removing the svc_freeargs() call, which is not required as
>> rpcbproc_callit_com() allocates (and correctly frees) memory itself.
>>
>> Change-Id: I7fc34efd58408ec5e626da8edd08aa697ed8b936
>> Signed-off-by: Ed Blake <ed.blake@sondrel.com>
> Thanks. Is this fix-for-the-fix in the upstream rpcbind project ? If
> not, did you submit it ?

So it looks like this was already fixed here:

http://git.linux-nfs.org/?p=steved/rpcbind.git;a=commit;h=7c7590ad536c0e24bef790cb1e65702fc54db566

So I should just submit that as a patch file to buildroot?

I guess we should also apply this at the same time:

http://git.linux-nfs.org/?p=steved/rpcbind.git;a=commit;h=c49a7ea639eb700823e174fd605bbbe183e229aa

> I think we'd prefer to keep the existing
> 0004-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
> unchanged, so that it matches the upstream commit, and add an
> additional patch that fixes the commit. Just to be inline with what
> upstream has.
>
> Best regards,
>
> Thomas

-- 
Ed
