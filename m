From: James Hogan <james.hogan@imgtec.com>
Date: Thu, 28 Feb 2013 08:39:18 +0000
Subject: [Buildroot] [PATCH] gdb: convert to the package infrastructure
In-Reply-To: <512F0EAD.4080406@mind.be>
References: <1361916812-29395-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <512F0EAD.4080406@mind.be>
Message-ID: <512F17B6.70501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/13 08:00, Arnout Vandecappelle wrote:
> On 26/02/13 23:13, Thomas Petazzoni wrote:
>> This commit converts gdb to the package infrastructure, and therefore
>> moves it from toolchain/gdb to package/gdb.
>>
>> The target package is now visible in "Package selection for the
>> target" => "Debugging, profiling and benchmark". The main option,
>> "gdb", forcefully selects the "gdbserver" sub-option by
>> default. Another sub-option, "full debugger" allows to install the
>> complete gdb on the target. When this option is enabled, then
>> "gdbserver" is no longer forcefully selected. This ensures that at
>> least gdbserver or the full debugger gets built/installed, so that the
>> package is not a no-op.
>>
>> The host debugger is still enabled through a configuration option in
>> "Toolchain". It is now visible regardless of the toolchain type (it
>> used to be hidden for External Toolchains). The configuration options
>> relative to the host debugger are now in package/gdb/Config.in.host,
>> similar to how we have package/binutils/Config.in.host.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>  This looks like a great idea!
> 
>  Just a couple of generic remarks, and then a few specific ones below.
> The generic remarks are probably for follow-up patches.
> 
> * It really doesn't make sense to build host-gdb without a gdbserver for
> the target. So I would auto-select gdbserver from host-gdb.

Kgdb (kernel debugging) is one use case where you'd want host-gdb
without necessarily gdbserver.

> 
> * Does it really make sense to keep options for four different gdb
> versions? Can't we just remove the user-selectable version completely?

The option is useful for arches which don't have their gdb port upstream
yet, giving them a chance to update their patches.

Cheers
James
