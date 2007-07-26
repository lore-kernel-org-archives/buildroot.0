From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 26 Jul 2007 17:21:25 +0200
Subject: [Buildroot] [buildroot 0001445]: openssh-3.9p1 fails to compile
In-Reply-To: <9df96b4614dcef09d1314e3f7ae09f5a@busybox.net>
References: <9df96b4614dcef09d1314e3f7ae09f5a@busybox.net>
Message-ID: <1185463285.5580.31.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-07-26 klockan 05:50 -0700 skrev bugs at busybox.net:
> The following issue has been SUBMITTED. 
> ====================================================================== 
> http://busybox.net/bugs/view.php?id=1445 
> ====================================================================== 
> Reported By:                alanszlosek
> Assigned To:                buildroot
> ====================================================================== 
> Project:                    buildroot
> Issue ID:                   1445
> Category:                   Architecture Specific
> Reproducibility:            always
> Severity:                   block
> Priority:                   normal
> Status:                     assigned
> ====================================================================== 
> Date Submitted:             07-26-2007 05:50 PDT
> Last Modified:              07-26-2007 05:50 PDT
> ====================================================================== 
> Summary:                    openssh-3.9p1 fails to compile
> Description: 
> When buildroot tries to compile openssh it fails. I'm using buildroot
> revision 19264, uclibc-0.9.29, busybox-1.6.1, gcc-4.2.0.
> 
> What follows is the output of the compilation:
> 
> /home/alan/downloads/buildroot/pentium/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
> -g -O2 -Wall -Wpointer-arith -Wno-uninitialized -I. -I.  -DSSHDIR=\"/etc\"
> -D_PATH_SSH_PROGRAM=\"/usr/bin/ssh\"
> -D_PATH_SSH_ASKPASS_DEFAULT=\"/usr/sbin/ssh-askpass\"
> -D_PATH_SFTP_SERVER=\"/usr/sbin/sftp-server\"
> -D_PATH_SSH_KEY_SIGN=\"/usr/sbin/ssh-keysign\"
> -D_PATH_SSH_PIDDIR=\"/var/run\" -D_PATH_PRIVSEP_CHROOT_DIR=\"/var/empty\"
> -DSSH_RAND_HELPER=\"/usr/sbin/ssh-rand-helper\" -DHAVE_CONFIG_H -c scp.c
> /home/alan/downloads/buildroot/pentium/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
> -L/home/alan/downloads/buildroot/pentium/build_i586/staging_dir/lib
> -L/home/alan/downloads/buildroot/pentium/build_i586/staging_dir/usr/lib -o
> scp scp.o progressmeter.o -L. -Lopenbsd-compat/  -lssh -lopenbsd-compat
> -lcrypto -lutil -lz  -lcrypt -lresolv -lresolv
> /home/alan/downloads/buildroot/pentium/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld:
> warning: cannot find entry symbol _start; defaulting to 08049170
> scp.o: In function `bwlimit':
> /home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1/scp.c:680:
> undefined reference to `__fixunsdfdi'
> /home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1/scp.c:682:
> undefined reference to `__udivdi3'
> /home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1/scp.c:683:
> undefined reference to `__umoddi3'
> make[1]: *** [scp] Error 1

This is the problem:
After decoding the types in use: I reduced the code to:

	struct timeval
	  {
	    long int tv_sec;		/* Seconds.  */
	    long int tv_usec;	/* Microseconds.  */
	  };
	long int limit_rate = 0;
	static struct timeval bwstart, bwend;
	static int lamt, thresh = 16384;
	unsigned long long int waitlen;


680:	waitlen = (double)1000000L * lamt / limit_rate;
681:
682:	bwstart.tv_sec = waitlen / 1000000L;
683:	bwstart.tv_usec = waitlen % 1000000L;

No routines to handle 64/64 division/remainder.
------------------------------------------------------------------------
One possible solution would be to change all computations to double.
Another would be to generate a routine which did the computation
of "/" & "%" in the same step.

Here is an unsigned divide routine which I adopted from Linux.
------------------------------------------------------------------------

#include	<stdlib.h>
#include	<stdio.h>

#ifdef	MACRO
#define	high_bit	0x80000000
#endif

#define	left_shift_64(hi,lo) 	hi <<= 1;\
		if(lo	& 0x80000000) hi |= 0x00000001; \
		lo <<= 1;

#ifdef	DEBUG
static unsigned int error;
#endif

div_t	udiv(unsigned int dividend, unsigned int divisor)
// udiv is performing unsigned division 
// returns dividend/divisor in a divt_t structure (quot and rem)
// It is the same as div, except div accepts signed integers
// result = numerator/denominator

/*
	Remainder is a 64 bit register:    {Rem:Quot}.
	The Lower 32 bit is reused as the Quotient

	Place Dividend in Remainder (the lower 32 bit)
	Shift Remainder left 1 bit
	loop 32 times
		signed substract the divisor from the left half of the remainder
			
		if(result < 0) {
			Shift the remainder register left
			remainder.lsb = 0
		}  else {
			Store the result in the left half of the remainder register
			Shift the remainder register left
			remainder.lsb = 1
		}
	end loop
	Shift left half of remainder right 1 bit

*/
{
	div_t	result;
	unsigned int	Quot,Rem;
	int		srem,i;
	unsigned int	positive;
#ifdef	DEBUG
	result	= div(dividend,divisor);
	if(error) {
		printf("Result = Dividend (%d) /  Divisor (%d)\n", dividend, divisor);
		printf("Expected: Quot = %08d, Rem = %08d\n",result.quot,result.rem);
	}
#endif
	Rem = (dividend & 0x80000000)?1:0;
	Quot	= dividend << 1;

	for(i = 32; i > 0; i--) {
		srem 	= (int) Rem - (int) divisor;
		positive= (srem >= 0)?1:0;
		if(positive) Rem  = (unsigned int) srem; 

		left_shift_64(Rem,Quot)
		// Set rightmost bit to "1" if positive or "0" otherwise;
		Quot	|= positive;
	}
	Rem >>= 1;
	result.rem		= Rem;
	result.quot	= Quot;
#ifdef	DEBUG
	if(error) {
		printf("Result:   Quot = %08d, Rem = %08d\n",result.quot,result.rem);
	}
	error	= 0;
#endif
	return	result;
}

#ifdef	TEST
int	main()
{
	unsigned int numerator;
	unsigned int denominator;
	unsigned int	error,i;
	div_t	valid,test,test2;
	
	
	printf("Divide Test!\n");
	for(i = 0; i < 100; i++) {
		printf("i=%d\n",i);
		numerator	= (random() % 100) +1; // (8192 * 4 * 1056)) + 1;	// Memory
Size
		denominator	= (random() % 10) + 1; //(65536)) + 1;			// Possible Page
Size
		valid = div(numerator, denominator);
		test  = udiv(numerator, denominator);
		if(valid.rem != test.rem) {
			error = 1;
		}
		if(valid.quot != test.quot) {
			error = 1;
		}
		if(error) {
/*
			printf("%4d:",i);
			printf("Numerator = %d,  Denominator = %d\n", numerator,
denominator);	
			printf("\tREM:	%8d\t%08x,\t%8x\t%8x\n",valid.rem,	valid.rem,
test.rem,	test2.rem);
			printf("\tQUOT:	%8d\t%08x,\t%8x\t%8x\n",valid.quot,	valid.quot,
test.quot,	test2.rem);
*/
			test  = udiv(numerator, denominator);
		}
	}
	return 0;
}
#endif

> make[1]: Leaving directory
> `/home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1'
> make: ***
> [/home/alan/downloads/buildroot/pentium/build_i586/openssh-3.9p1/ssh]
> Error 2
> 
> ====================================================================== 
> 
> Issue History 
> Date Modified   Username       Field                    Change               
> ====================================================================== 
> 07-26-07 05:50  alanszlosek    New Issue                                    
> 07-26-07 05:50  alanszlosek    Status                   new => assigned     
> 07-26-07 05:50  alanszlosek    Assigned To               => buildroot       
> ======================================================================
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
