From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jul 2014 07:40:02 +0200
Subject: [Buildroot] Bug in longjmp (was: Re: bug in dash compile with
	buildroot)
In-Reply-To: <53BFA406.7080408@gmail.com>
References: <53BBFECB.6070003@gmail.com> <53BFA406.7080408@gmail.com>
Message-ID: <53C36D32.1090206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Removing dash from the list, since it's not related to dash.]

On 11/07/14 10:44, Luigi Tarenga wrote:
> Hi lists,
> for the buildroot mailing list: I tried to post this bug report but I wasn't
> subscribed.
> Below you can see my original bug report.
> 
> I did some more test and the dash source looks good, the longjmp destination is
> correct (actually it jump to main()). The problem seems the longjmp implementation.
> In the case of command like dash -c "(echo ciao; /bin/true)&" a longjmp is not
> performed and so no segfault is triggered.
> 
> as a POC I tried this little c code:
> [vortex at lizard ~]$ cat longjmptest.c
> #include <stdio.h>
> #include <setjmp.h>
> 
> static jmp_buf env1;
> 
> long int func2 () {
>    long int b;
>    b=1000;
>    longjmp(env1,1);
>    return b;
> }
> 
> long int func1 () {
>    long int a;
>    a = func2 () ;
>    return a;
> }
> 
> int main() {
>     long int num;
>     num=0;
> 
>     printf("\nstart jump test\n");
> 
>     if (setjmp(env1)) {
>        printf("jumped to env1\n");
>     } else {
>         num = func1 ();
>     }
> 
>     printf("check 1 num=%ld\n",num);
>     printf("finish\n");
>     return 0;
> }

 For the record: I could reproduce this with gcc-4.8.2 + uClibc 0.9.33.2, but
not with the gcc-4.7.3 + uClibc 0.99.33.2 downloaded from the autobuilders
br-x86-64-core2-full-2014.02-rc1.tar.bz2

 Unfortunately, my i386-fu is not good enough to determine anything more than
that _longjmp_unwind seems to get an argument that overflows the stack.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
