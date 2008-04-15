From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Tue, 15 Apr 2008 21:21:08 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <007c01c89f2c$3e015030$070514ac@atmel.com>
References: <20080415171026.A45293C435@busybox.net> <4804E950.4080108@eclis.ch>
	<007c01c89f2c$3e015030$070514ac@atmel.com>
Message-ID: <48050024.2040102@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson a ?crit :
> ----- Original Message ----- 
> From: "Jean-Christian de Rivaz" <jc@eclis.ch>
> To: <buildroot@uclibc.org>
> Cc: <ulf@uclibc.org>
> Sent: Tuesday, April 15, 2008 7:43 PM
> Subject: Re: [Buildroot] svn commit: trunk/buildroot/target/linux
> 
> 
>> ulf at uclibc.org a ?crit :
>>> Author: ulf
>>> Date: 2008-04-15 10:10:24 -0700 (Tue, 15 Apr 2008)
>>> New Revision: 21739
>>>
>>> Log:
>>> Reversing bad tftpboot patch resulting in two identical targets
>>>
>>> Modified:
>>>    trunk/buildroot/target/linux/Makefile.in.advanced
>> Ouch! Can you please explain why did you re-introduce this bug ?
>> The BR2_LINUX_COPYTO variable have absolutely no way to work with a hard 
>> coded "/tftpboot/". Just try to copy to /var/lib/tftpboot for example.
> 
> Because it is not a bug.
> 
> The Configuration now allows you to
> 
> 1) Copy to /tftpboot                                (if BR2_LINUX_COPYTO_TFTPBOOT is set)
> 2) Copy to $(BR2_LINUX_COPYTO)    (if BR2_LINUX_COPYTO is non-empty)
> 
> Before the patch you would have (a little simplified)
> 
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> LINUX_COPYTO:=BR2_LINUX_COPYTO
> 
> $(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
>         mkdir -p $(BR2_LINUX_COPYTO)
>         cp -dpf $(LINUX26_KERNEL) $(BR2_LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
> 
> $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
>         mkdir -p $(LINUX_COPYTO)
>         cp -dpf $(LINUX26_KERNEL) $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME)
> --------------------------------------------------------------------------------------------------
> 
> Since LINUX_COPYTO is identical to BR2_LINUX_COPYTO you 
> have two IDENTICAL rules, which makes no sense.
> 
> If you want to copy to "/var/lib/tftpboot" your .config should contain:
> 
> BR2_LINUX_COPYTO_TFTPBOOT=n
> BR2_LINUX_COPYTO="/var/lib/tftpboot"

Ok, I understand your point now, but I still maintain that hardcoded 
"/tftpboot" is not a solution for this problem, because on many systems 
there is no "/tftpboot" in the root filesystem, because the users don't
have the right to create it, and because new distributions use 
/var/lib/tftpboot instead of /tftpboot.

The main problem is that there is two rules that make exactly the same 
things, so one of them must be simply removed. Either remove the 
BR2_LINUX_COPYTO or the LINUX_COPYTO, but nerver use hardcoded "/tftpboot".

-- 
Jean-Christian de Rivaz
