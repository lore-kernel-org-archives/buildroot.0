From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Thu, 26 Jun 2014 16:06:32 +0200
Subject: [Buildroot] Fwd: Re: [lttng-dev] "lttng enable-event" fails
In-Reply-To: <53AC1E14.4030700@wanadoo.fr>
References: <53AC1E14.4030700@wanadoo.fr>
Message-ID: <53AC28E8.7080800@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have submitted the bug to the lttng mailing list, too. The coredump is 
not usable.

Below, new information: it works with the old 2012.10 compiler from Linaro.
To do the test, I had to hack into toolchain-external to re-enable 
support of it.

regards,
Thierry


-------- Message original --------
Sujet: Re: [lttng-dev] "lttng enable-event" fails
Date : Thu, 26 Jun 2014 15:20:20 +0200
De : Thierry Bultel <thierry.bultel@wanadoo.fr>
Pour : David Goulet <dgoulet@efficios.com>
Copie ? : lttng-dev at lists.lttng.org

Some other useful information probably:
The bug does not happen with the (old) Linaro 2012.10 compiler:

# ./host/usr/bin/arm-linux-gnueabihf-gcc --version
arm-linux-gnueabihf-gcc (crosstool-NG linaro-1.13.1-4.7-2012.10-20121022
- Linaro GCC 2012.10) 4.7.3 20121001 (prerelease)
Copyright ? 2012 Free Software Foundation, Inc.

Whereas it happens with the one provided by buildroot:

../buildroot_agv_v15_amos820/host/usr/bin/arm-linux-gcc --version
arm-linux-gcc (Buildroot 2014.02-rc3-00323-g2f12017) 4.7.3
Copyright ? 2012 Free Software Foundation, Inc.

Thus I am submitting that bug report to buildroot as well.

Regards
Thierry


Le 24/06/2014 15:53, David Goulet a ?crit :
> On 24 Jun (08:47:21), Thierry Bultel wrote:
>> Hi,
>>
>> I am using lttng (2.4.1), target is ARM Cortex A9; compiler is gcc-4.7.3,
>> but I have the same issue with gcc-4.8.2
>> The kernel is Freescale's 3.0.35-4.1.0
>>
>>
>> lttng fails to start:
>>
>> [root at buildroot ~]# lttng create
>> Session auto-19700319-135920 created.
>> Traces will be written in /root/lttng-traces/auto-19700319-135920
>> [root at buildroot~]# lttng enable-event --kernel --all
>> PERROR [5831/5915]: wait: Success (in run_as_clone() at runas.c:243)
>> Error: Trace directory creation error
>> Error: Events: Kernel create session failed (channel channel0, session
>> auto-19700319-135920)
>>
>> My analysis show that lttng attempts to create the trace directory, when
>> "lttng enable-event" is called.
>> To do so, it uses a slave thread that performs a kind of "mkdir -p" ,
>> that thread is spawned via a call to "clone"
>> and the father waits for it via "waitpid".
>>
>> When the slave returns, waitpid says it is not completed. Added a little
>> code to shows that the thread
>> is killed with SIGSEGV at the time it calls "return"
>>
>> Changing it to call "exit" instead, makes it a little better, but other
>> numerous errors come when
>> calling "lttng start"
>>
>> Did anyone encounter such an issue ?
>
> Hrm, tbh I never tried lttng-tools on ARM but if a SIGSEGV is raised you
> should be able to get a core dump and with gdb we can understand which
> callsite failed badly.
>
> Thanks!
> David
>
>>
>> Best regards
>> Thierry Bultel
>>
>>
>>
>>
>> _______________________________________________
>> lttng-dev mailing list
>> lttng-dev at lists.lttng.org
>> http://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev
