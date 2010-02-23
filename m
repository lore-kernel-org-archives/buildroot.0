From: Will Wagner <will_wagner@carallon.com>
Date: Tue, 23 Feb 2010 22:47:52 +0000
Subject: [Buildroot] make -C <buildroot_directory> failed
In-Reply-To: <4f6b.4b844ff0.25c53@getafix.xdna.net>
References: <8128F0FD6C26E14C8EB4BFDB92B8D6B2134B26@2putt.int.lantronix.com>
	<4f6b.4b844ff0.25c53@getafix.xdna.net>
Message-ID: <4B845B18.9080102@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/2010 22:00, Cameron Hutchison wrote:
> "Matthew Davison"<matt.davison@lantronix.com>  writes:
>
>    
>> Attempting to invoke the top level buildroot makefile from a higher
>> level Makefile or simply with make -C<buildroot_directory>  fails during
>> the kernel build. This is even true if 'make -C .' is invoked from the
>> top level buildroot directory, as long as a kernel build is enabled. It
>> appears that the problem has something to do with make's
>> "Entering/Leaving directory" messages, as the output below suggests.
>> When I passed the --no-print-directory option to make, I was able to
>> build without problems.
>>      
> I think I see the problem. See if this patch fixes it. I haven't tested
> this, but this looks right.
>    

I agree correct fix.

That's the same as the patch I submitted here: 
http://lists.busybox.net/pipermail/buildroot/2010-January/031690.html
> > From 5dbf2e25bbd7d4f4586888384b3c207dd1a6afca Mon Sep 17 00:00:00 2001
> From: Cameron Hutchison<cam@camh.ch>
> Date: Wed, 24 Feb 2010 08:52:44 +1100
> Subject: [PATCH] Fix probing of kernel version
>
> Probing the kernel version uses command substitution to capture the
> result of a make command. If the top-level make is run with -C, the
> sub-make will print entering/leaving directory messages, mucking up the
> output we're trying to capture.
>
> Invoke the sub-make with --no-print-directory so we get clean output.
>
> Signed-off-by: Cameron Hutchison<cam@camh.ch>
> ---
>   target/linux/Makefile.in.advanced |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
> index b4774ca..7679d1e 100644
> --- a/target/linux/Makefile.in.advanced
> +++ b/target/linux/Makefile.in.advanced
> @@ -41,7 +41,7 @@ endif
>   endif
>
>   # Ask the kernel what version number it will use when installing modules
> -LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) -s kernelrelease`
> +LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease`
>
>   ifeq ($(BOARD_PATH),)
>   BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
>    
