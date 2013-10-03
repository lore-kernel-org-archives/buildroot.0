From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Oct 2013 12:12:41 +0200
Subject: [Buildroot] [PATCH] nano: needs mmu
In-Reply-To: <1380766412.29754.0.camel@phoenix> (Axel Lin's message of "Thu,
 03 Oct 2013 10:13:32 +0800")
References: <1380766412.29754.0.camel@phoenix>
Message-ID: <87hacyoe7a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Fix below build error if !BR2_USE_MMU:
 Axel> text.o: In function `execute_command':
 Axel> text.c:(.text+0x7f8): undefined reference to `fork'
 Axel> text.o: In function `do_int_speller':
 Axel> text.c:(.text+0x3480): undefined reference to `fork'
 Axel> text.c:(.text+0x34f4): undefined reference to `fork'
 Axel> text.c:(.text+0x3568): undefined reference to `fork'
 Axel> text.o: In function `do_alt_speller':
 Axel> text.c:(.text+0x3914): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[3]: *** [nano] Error 1

 Axel> Signed-off-by: Axel Lin <axel.lin@ingics.com>
 Axel> ---
 Axel>  package/nano/Config.in | 1 +
 Axel>  1 file changed, 1 insertion(+)

 Axel> diff --git a/package/nano/Config.in b/package/nano/Config.in
 Axel> index ef7f69d..036313f 100644
 Axel> --- a/package/nano/Config.in
 Axel> +++ b/package/nano/Config.in
 Axel> @@ -1,5 +1,6 @@
 Axel>  config BR2_PACKAGE_NANO
 Axel>  	bool "nano"
 Axel> +	depends on BR2_USE_MMU # fork()

The part using fork() is actually only built if the full blown nano
version is used, so I changed this to simply be:

       # full version uses fork()
       select BR2_PACKAGE_NANO_TINY if !BR2_USE_MMU

And committed, thanks.

-- 
Bye, Peter Korsgaard
