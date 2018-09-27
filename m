From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 27 Sep 2018 10:18:01 -0700
Subject: [Buildroot] Autobnuilders timeouts [was: Re: autobuilder flock
 hangs]
In-Reply-To: <20180825130512.GB2419@scaer>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
 <20180816111059.3a7f1b59@windsurf> <20180824070203.GK9365@scaer>
 <821f032d-836a-41c2-d50c-eaa4687c5b22@mentor.com>
 <20180825130512.GB2419@scaer>
Message-ID: <61c38cb3-134e-388a-8c31-1c0b664d16cd@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/25/2018 06:05 AM, Yann E. MORIN wrote:
> On 2018-08-24 16:45 -0700, Hollis Blanchard spake thusly:
>> I suspect a) something goes wrong with the buildroot job, b) it's killed in
>> a way that leaves a dangling flock, c) future buildroot jobs run headlong
>> into the lingering flock and triggers a timeout.
> So I had a look at the autobuilder code, and we kill the build process
> with SIGKILL (-9)., so it has no chance of propagating it down to its
> children.
>
> I wonder if, should we were to use SIGTERM instead, there would be an
> improvement. Could you try to leave your autobuilder running with this
> patch, please?
>
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 3d2e99a..ba86d3d 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -390,7 +390,7 @@ def stop_on_build_hang(monitor_thread_hung_build_flag,
>                   if sub_proc.poll() is None:
>                       monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
>                       log_write(log, "INFO: build hung")
> -                    sub_proc.kill()
> +                    sub_proc.terminate()
>                   break
>           monitor_thread_stop_flag.wait(30)
By the way, I tried this, came back weeks later, and found my 
autobuilder hung like so:

    [Fri, 07 Sep 2018 18:40:22] INFO: generate the configuration
    KCONFIG_SEED=0xEB4D3CE
    [Fri, 07 Sep 2018 18:40:40] INFO: build started
    [Fri, 07 Sep 2018 22:39:10] INFO: build hung

output/logfile says:

     >>> solarus v1.5.3 Building

    <snip>

    [ 88%] Building CXX object
    CMakeFiles/solarus.dir/src/third_party/snes_spc/SNES_SPC_state.cpp.o
    [ 88%] Building CXX object
    CMakeFiles/solarus.dir/src/third_party/snes_spc/spc.cpp.o
    [ 89%] Building CXX object
    CMakeFiles/solarus.dir/src/third_party/snes_spc/SPC_DSP.cpp.o
    [ 89%] Building CXX object
    CMakeFiles/solarus.dir/src/third_party/snes_spc/SPC_Filter.cpp.o
    [ 90%] Linking CXX shared library libsolarus.so


So it seems like solarus exceeded the build timeout (simple host 
performance issue?), and .terminate() was not enough. However, I bet 
.kill() would have left those subprocesses we saw earlier. (Also, in 
hindsight, I suspect they were all flocks for the same directory or two, 
so they all disappeared when the lock owner died.)

I have not tried your other patch series that changes download timeouts, 
but I don't think it would have affected the particular case above, 
since it's not stuck downloading.

Hollis Blanchard
Mentor Graphics Emulation Division

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180927/444ee999/attachment.html>
