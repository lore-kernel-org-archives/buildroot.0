From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 29 Jan 2020 16:57:39 +0100
Subject: [Buildroot] [valgrind] problem with glibc 2.23 and valgrind
 3.12.0
In-Reply-To: <141898239.12156194.1580312130858.JavaMail.zimbra@sepro-group.com>
References: <141898239.12156194.1580312130858.JavaMail.zimbra@sepro-group.com>
Message-ID: <5bb0309e-10a9-7614-8f46-ef9063a91d5d@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 29/01/2020 ? 16:35, Yann Cardaillac a ?crit?:
> Hi all, 
> 
> I mentioned on IRC a problem with valgrind and glibc. 
> The issue is 100% repeatable. 

Thanks for the report.

> 
> Valgrind is in version 3.12.0 
> Toolchain external, Linaro ARM 2017.02 
> Glibc 2.23 
> Buildroot 2017.08.2 
> Target is Arm Cortex a9 
> 
> I'm working with [ https://valgrind.org/docs/manual/quick-start.html | https://valgrind.org/docs/manual/quick-start.html ] as a reference program. 
> When executing the program "a.c" on my target I won't get the same error, instead I'm seeing: 
> 
> [ https://pastebin.com/QJ2j89Y8 | https://pastebin.com/QJ2j89Y8 ] 
> 
> As you can see I have the proper error that I'm expected but also some error refering to ld-2.23.so lib. Which I did not altered by any way. 
> 
> ==31275== Conditional jump or move depends on uninitialised value(s) 
> ==31275== at 0x4011E14: index (in /usr/lib/ld-2.23.so) 
> ==31275== 
> ==31275== Conditional jump or move depends on uninitialised value(s) 
> ==31275== at 0x4011E18: index (in /usr/lib/ld-2.23.so) 
> ==31275== 
> ==31275== Conditional jump or move depends on uninitialised value(s) 
> ==31275== at 0x4005A5A: expand_dynamic_string_token (in /usr/lib/ld-2.23.so) 
> 
> To fix that issue, I've had to add a few new rules to a supp files: 
> 
> { 
> Sepro-fix-glibc-ld-bug 
> Memcheck:Cond 
> fun:index 
> } 
> 
> { 
> Sepro-fix-glibc-ld-bug 
> Memcheck:Cond 
> fun:expand_dynamic_string_token 
> } 
> 
> I took those rule from : 
> valgrind ./a.out --gen-suppressions=yes 
> 
> Then using the supp file as such : 
> valgrind --leak-check=yes --suppressions=/lib/valgrind/sepro.supp ./a.out 
> 
> My question is mostly why do I have to do that by myself is it safe? 
> 
> I've find this kind of files while being looking for solution to my errors : 
> 
> [ https://github.com/mozilla-b2g/valgrind/blob/master/glibc-2.3.supp | https://github.com/mozilla-b2g/valgrind/blob/master/glibc-2.3.supp ] 
> 
> Shouldn't we have one equivalent directly coming with valgrind? 

I haven't looked in details but can you test with several toolchains ?
There are several Linaro toolchains version that are similar to 2017.02:
2017.08 and 2017.11.

I mean, same gcc stable version (6.2.1 -> 6.4.1), same Glibc stable version
(based on 2.23), same kernel headers (based on 4.6) and same binutils (based on
2.27).

Can you test them ?

Best regards,
Romain

> 
> Best regards, 
> 
> 	
> 
> 	
> 
> Yann CARDAILLAC 
> Ing?nieur d?veloppement logiciel 
> SEPRO Robotique - 88 Rue Henry Bessemer - Zone Ajoncs Ouest - CS 10084 - 85003 La Roche sur Yon Cedex (France) 
> 
> [ http://www.sepro-group.com/fr | www.sepro-group.com ] | [ https://twitter.com/seprogroup | 
> 
>                 @SeproGroup
>              ] 
> 
> 
